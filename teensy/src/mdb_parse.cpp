#include <Arduino.h>

#include <stddef.h>
#include <stdint.h>
#include <mdb_defs.h>
#include <mdb_parse.h>

static uint8_t parse_state = MDB_PARSE_IDLE;

static uint8_t curr_cmd = 0;
static uint8_t curr_subcmd = 0;

typedef struct {
    uint8_t cmd;
    uint8_t subcmd;
    uint8_t length;
    bool has_subcommands;
    mdb_command_handler handler;
} cmd_def;

static cmd_def mdb_subcommands[MDB_COUNT_CMD][MDB_COUNT_SUBCMD];
#define CMD(x,y) mdb_subcommands[x][y]

static uint8_t rx_buffer[MDB_MSG_MAXLEN];
static uint8_t rx_buffer_idx = 0;
static uint8_t recv_csum = 0;

static uint8_t tx_buffer[MDB_MSG_MAXLEN];
static transmit_callback tx_callback;

#define PARSE_LOG "[mdb_parse] "
static Print* l;

static const char* state_labels[] =
{
"IDLE       ",
"RECV_DATA  ",
"EXPECT_CSUM",
"WAIT_ACK   ",
};

static void set_parse_state(uint8_t new_state)
{
    l->printf("State transition: %s to %s\n", state_labels[parse_state], state_labels[new_state]);
    parse_state = new_state;
}

void mdb_parser_init(transmit_callback tx, Print* log_target)
{
    tx_callback = tx;
    l = log_target == nullptr ? &Serial : log_target;
    for(int c = 0; c < MDB_COUNT_CMD; ++c)
    {
        for(int s = 0; s < MDB_COUNT_SUBCMD; ++s)
        {
            cmd_def* def = &CMD(c,s);
            def->cmd = MDB_NOCMD;
            def->subcmd = MDB_NOSUBCMD;
            def->length = 0;
            def->has_subcommands = false;
            def->handler = nullptr;
        }
    }
}

void mdb_parser_clear()
{
    l->printf(PARSE_LOG "Resetting parser\n");

    curr_cmd = MDB_NOCMD;
    curr_subcmd = MDB_NOSUBCMD;

    rx_buffer_idx = 0;
    recv_csum = 0;

    set_parse_state(MDB_PARSE_IDLE);
}

void mdb_new_command(uint16_t incoming)
{
    if (incoming & MDB_MODE_BIT)
    {
        // New command, regardless of where old one was
        bool parse_mine = (incoming & MDB_ADDRESS_MASK) == MDB_ADDR_CASHLESS1;

        if (parse_mine)
        {
            mdb_parser_clear();
            
            uint8_t cmd = incoming & MDB_COMMAND_MASK;
            
            cmd_def *def = &CMD(cmd, MDB_NOSUBCMD);

            if(def->cmd != MDB_NOCMD)
            {
                set_parse_state(MDB_PARSE_RECV_DATA);
                
                l->printf(PARSE_LOG "Recognised command %02X. Data length: %d\n", cmd, def->length);
                curr_cmd = cmd;

                mdb_receive_byte(incoming & 0xFF);
            }
            else
            {
                l->printf(PARSE_LOG "Unrecognised command %02X\n", cmd);
                mdb_parser_clear();
            }
        }
    }
}

void mdb_receive_byte(uint8_t data)
{
    rx_buffer[rx_buffer_idx++] = data;
    recv_csum += data;

    cmd_def *def = &CMD(curr_cmd, curr_subcmd);
    if (rx_buffer_idx == 2 && def->has_subcommands)
    {
        curr_subcmd = data;
        def = &CMD(curr_cmd, curr_subcmd);
        l->printf(PARSE_LOG "Subcommand: %02X. Expecting data length %d\n", def->subcmd, def->length);
    }

    if (rx_buffer_idx == def->length)
    {
        l->printf(PARSE_LOG "Expecto Checksum!\n");
        set_parse_state(MDB_PARSE_EXPECT_CSUM);
    }
    // else
    // {
    //     mdb_parser_clear();
    // }
}

bool mdb_validate_csum(uint8_t data)
{
    bool checksum_ok = false;
    if (recv_csum == data)
    {
        set_parse_state(MDB_PARSE_WAIT_ACK);
        checksum_ok = true;
    }
    else
    {
        mdb_parser_clear();
    }

    return checksum_ok;
}

uint8_t mdb_calculate_csum(uint8_t* buffer, uint8_t len)
{
    uint16_t csum = 0;
    for(int i = 0; i < len; ++i)
    {
        csum += buffer[i];
    }

    return csum & 0xFF;
}

bool mdb_execute_handler()
{
    uint8_t last_byte = 0;

    if (curr_cmd < MDB_COUNT_CMD && curr_subcmd < MDB_COUNT_SUBCMD)
    {
        l->printf(PARSE_LOG "Invalid command: %02X:%02X", curr_cmd, curr_subcmd);
        return false;
    }

    cmd_def *def = &CMD(curr_cmd, curr_subcmd);

    if(def->cmd != curr_cmd || def->subcmd != curr_subcmd)
    {
        l->printf(PARSE_LOG "Command def %02X:%02X doesn't match current command %02X:%02X", def->cmd, def->subcmd, curr_cmd, curr_subcmd);
        return false;
    }

    if(!def->handler)
    {
        l->printf(PARSE_LOG "Command def %02X:%02X has no handler.", curr_cmd, curr_subcmd);
        return false;
    }

    l->printf(PARSE_LOG "Executing handler for %02X:%02X", def->cmd, def->subcmd);
    uint8_t len = def->handler(rx_buffer, tx_buffer);

    if (len > 0)
    {
        last_byte = mdb_calculate_csum(tx_buffer, len);
    }
    else
    {
        last_byte = tx_buffer[0] != MDB_NCK ? MDB_ACK : MDB_NCK;
    }

    for (int i = 0; i < len; ++i)
    {
        tx_callback(tx_buffer[i]);
    }

    tx_callback(MDB_MODE_BIT | last_byte);

    return true;
}

uint16_t* mdb_parse(uint16_t incoming)
{
    mdb_new_command(incoming);

    uint8_t data = incoming & 0xFF;
    if (parse_state == MDB_PARSE_RECV_DATA)
    {
        mdb_receive_byte(data);
    }
    else if (parse_state == MDB_PARSE_EXPECT_CSUM)
    {
        bool ok = false;
        if(mdb_validate_csum(data))
        {
            ok = mdb_execute_handler();
        }

        if(ok)
        {
            set_parse_state(MDB_PARSE_WAIT_ACK);
        }
        else
        {
            // TODO: Send NCK (although stalling is also valid)
            mdb_parser_clear();
        }
    }
    else if (parse_state == MDB_PARSE_WAIT_ACK)
    {
        /* code */
    }
    

    return nullptr;
}

void mdb_register_handler(uint8_t cmd, uint8_t subcmd, uint8_t length, mdb_command_handler handler)
{
    l->printf(PARSE_LOG "New command handler: %X:%X, length %d\n", cmd, subcmd, length);

    cmd_def *def = &CMD(cmd, MDB_NOSUBCMD);
    if(subcmd != MDB_NOSUBCMD)
    {
        def->cmd = cmd;
        def->subcmd = MDB_NOSUBCMD;
        def->has_subcommands = true;
        def->handler = nullptr;

        def = &CMD(cmd, subcmd);
    }

    def->cmd = cmd;
    def->subcmd = subcmd;
    def->has_subcommands = false;
    def->length = length;
    def->handler = handler;
}