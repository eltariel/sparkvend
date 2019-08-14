/**
 * Copyright 2019 Ellie Tomkins
 *
 * This file is part of SparkVend.
 *
 * SparkVend is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * SparkVend is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with SparkVend.  If not, see <https://www.gnu.org/licenses/>.
 */

#include <mdb_defs.h>
#include <mdb_parse.h>
#include <mdb_cashless.h>

#include <string.h>

static Print* l;
#define CASHLESS_LOG "[cashless]  "
#define LOG(str) (l->println(CASHLESS_LOG str))
#define LOGF(str,...) (l->printf(CASHLESS_LOG str, __VA_ARGS__))

static uint8_t cashless_state = MDB_CASHLESS_STATE_INACTIVE;
static bool has_config = false;
static bool has_prices = false;

// static uint8_t vmc_config[4];
static struct mdb_cashless_config_cmd vmc_config;
static struct mdb_cashless_config_response my_config = {
    0x01,   // Feature level 1
    0x1036, // AUD
    1,      // Scale factor
    2,      // Decimal places
    10,     // Max response time (s)
    0x0F    // L1 option bits all on
};

static const char* state_labels[] =
{
    "INACTIVE    ",
    "DISABLED    ",
    "ENABLED     ",
    "IDLE        ",
    "VEND        ",
    "REVALUE     ",
    "NEGVEND     ",
};

static uint8_t set_state(uint8_t new_state)
{
    if(new_state == cashless_state) return cashless_state;
    if((cashless_state == MDB_CASHLESS_STATE_INACTIVE && !(new_state == MDB_CASHLESS_STATE_DISABLED)) ||
       (cashless_state == MDB_CASHLESS_STATE_DISABLED && !(new_state == MDB_CASHLESS_STATE_INACTIVE ||
                                                           new_state == MDB_CASHLESS_STATE_ENABLED)) ||
       (cashless_state == MDB_CASHLESS_STATE_ENABLED  && !(new_state == MDB_CASHLESS_STATE_INACTIVE ||
                                                           new_state == MDB_CASHLESS_STATE_DISABLED ||
                                                           new_state == MDB_CASHLESS_STATE_IDLE)) ||
       (cashless_state == MDB_CASHLESS_STATE_IDLE     && !(new_state == MDB_CASHLESS_STATE_INACTIVE ||
                                                           new_state == MDB_CASHLESS_STATE_DISABLED ||
                                                           new_state == MDB_CASHLESS_STATE_ENABLED ||
                                                           new_state == MDB_CASHLESS_STATE_VEND)) ||
       (cashless_state == MDB_CASHLESS_STATE_VEND     && !(new_state == MDB_CASHLESS_STATE_INACTIVE ||
                                                           new_state == MDB_CASHLESS_STATE_IDLE)) ||
        0)
    {
        LOGF("Invalid state transition: %s to %s\n", state_labels[cashless_state], state_labels[new_state]);
    }
    else
    {
        LOGF("Changing state from %s to %s\n", state_labels[cashless_state], state_labels[new_state]);
        cashless_state = new_state;
    }

    return cashless_state;
}

uint8_t test(uint8_t* rx, uint8_t* tx)
{
    tx[0] = MDB_NCK;
    return 0;
}

uint8_t mdb_cashless_ackonly(uint8_t* tx)
{
    tx[0] = MDB_ACK;
    return 0;
}

uint8_t mdb_cashless_out_of_sequence(uint8_t* tx)
{
    tx[0] = MDB_RESPONSE_OUTOFSEQ;
    return 1;
}

uint8_t mdb_cashless_reset(uint8_t* rx, uint8_t* tx)
{
    LOG("Reset\n");
    set_state(MDB_CASHLESS_STATE_INACTIVE);
    has_config = false;
    has_prices = false;

    return mdb_cashless_ackonly(tx);
}

uint8_t mdb_cashless_setup_config(uint8_t* rx, uint8_t* tx)
{
    has_config = true;

    set_state(has_prices ? MDB_CASHLESS_STATE_DISABLED : MDB_CASHLESS_STATE_INACTIVE);
    memcpy(&vmc_config, rx + 2, 4);

    LOG("OH MY GAWD I HAVE CONFIG DATA\n");
    for(int i = 0; i < 6; ++i)
    {
        l->printf("0x%02X ", rx[i]);
    }
    l->println("");

    LOGF("\tfeature level %d, %dRx%dC, display type %d\n",
                            vmc_config.feature_level,
                            vmc_config.rows,
                            vmc_config.columns,
                            vmc_config.display_info);

    tx[0] = MDB_RESPONSE_READERCFG;
    memcpy(tx + 1, &my_config, sizeof(my_config));
    return 8;
}

uint8_t mdb_cashless_setup_prices(uint8_t* rx, uint8_t* tx)
{
    has_prices = true;

    LOG("OH MY GAWD I HAVE PRICE DATA\n");

    set_state(has_config ? MDB_CASHLESS_STATE_DISABLED : MDB_CASHLESS_STATE_INACTIVE);
    return mdb_cashless_ackonly(tx);
}

uint8_t mdb_cashless_poll_handler(uint8_t* rx, uint8_t* tx)
{
    LOG("Poll!\n");
    uint8_t len = 0;
    if(cashless_state == MDB_CASHLESS_STATE_INACTIVE)
    {
        tx[0] = MDB_RESPONSE_JUSTRESET;
        len = 1;
    }
    else
    {
        len = mdb_cashless_ackonly(tx);
    }

    return len;
}

uint8_t mdb_cashless_reader_disable(uint8_t* rx, uint8_t* tx)
{
    if(cashless_state != MDB_CASHLESS_STATE_VEND)
    {
        set_state(MDB_CASHLESS_STATE_DISABLED);
    }
    else
    {
        // disable after current vend
    }
    
    return mdb_cashless_ackonly(tx);
}

uint8_t mdb_cashless_reader_enable(uint8_t* rx, uint8_t* tx)
{
    uint8_t len = 0;
    if(cashless_state == MDB_CASHLESS_STATE_DISABLED && has_config && has_prices)
    {
        set_state(MDB_CASHLESS_STATE_ENABLED);
        len = mdb_cashless_ackonly(tx);
    }
    else
    {
        len = mdb_cashless_out_of_sequence(tx);
    }
    
    return len;
}

uint8_t mdb_cashless_reader_cancel(uint8_t* rx, uint8_t* tx)
{
    uint8_t len = 0;
    if(cashless_state == MDB_CASHLESS_STATE_ENABLED)
    {
        tx[0] = MDB_RESPONSE_CANCELLED;
        len = 1;
    }

    return len;
}

uint8_t mdb_cashless_vend_request(uint8_t* rx, uint8_t* tx)
{
    uint8_t len = 0;
    if(cashless_state != MDB_CASHLESS_STATE_IDLE)
    {
        len = mdb_cashless_out_of_sequence(tx);
    }
    
    else if(1)
    {
        tx[0] = MDB_RESPONSE_VENDOK;
        tx[1] = 0xFF;
        tx[2] = 0xFF;
        len = 3;
    }
    else
    {
        tx[0] = MDB_RESPONSE_VENDDENIED;
        len = 1;
    }
    
    return len;
}

uint8_t mdb_cashless_vend_success(uint8_t* rx, uint8_t* tx)
{
    uint16_t item_number = 0;
    memcpy(&item_number, tx + 2, 2);
	LOGF("Vend success: item number %04X", item_number);
	
	set_state(MDB_CASHLESS_STATE_IDLE);
	return mdb_cashless_ackonly(tx);
}

uint8_t mdb_cashless_session_complete(uint8_t* rx, uint8_t* tx)
{
    LOG("End of vend session.");
    set_state(MDB_CASHLESS_STATE_ENABLED);

    tx[0] = MDB_RESPONSE_ENDSESSION;
    return 1;
}

uint8_t mdb_cashless_request_id(uint8_t* rx, uint8_t* tx)
{
    char manufacturer[] = "WTF";
    char serial[] = "10 digits?";
    char model[] =  "SparkVend!!1";
    uint16_t version = 0x0001;

    tx[0] = MDB_RESPONSE_PERIPHERALID;
    memcpy(tx +  1, manufacturer,  3);
    memcpy(tx +  4, serial      , 10);
    memcpy(tx + 14, model       , 12);
    memcpy(tx + 28, &version    ,  2);

    memcpy(manufacturer, rx +  2,  3);
    memcpy(serial      , rx +  5, 10);
    memcpy(model       , rx + 15, 12);
    memcpy(&version    , rx + 29,  2);

    LOGF("VMC Requesting ID: Manufacturer %s, serial %s, model %s, version %04X",
            manufacturer,
            serial,
            model,
            version);

    
    return 0;
}

void mdb_cashless_init(Print* log_target)
{
    l = log_target;

    mdb_register_handler(MDB_CMD_RESET, MDB_NOSUBCMD, 1, &mdb_cashless_reset);
    mdb_register_handler(MDB_CMD_POLL, MDB_NOSUBCMD, 1, &mdb_cashless_poll_handler);
    mdb_register_handler(MDB_CMD_SETUP, MDB_CMD_SETUP_CONFIG, 6, &mdb_cashless_setup_config);
    mdb_register_handler(MDB_CMD_SETUP, MDB_CMD_SETUP_PRICES, 6, &mdb_cashless_setup_prices);
    mdb_register_handler(MDB_CMD_VEND, MDB_CMD_VEND_REQUEST, 6, &mdb_cashless_vend_request);
    mdb_register_handler(MDB_CMD_VEND, MDB_CMD_VEND_CANCEL, 2, &test);
    mdb_register_handler(MDB_CMD_VEND, MDB_CMD_VEND_SUCCESS, 4, &mdb_cashless_vend_success);
    mdb_register_handler(MDB_CMD_VEND, MDB_CMD_VEND_FAILURE, 2, &test);
    mdb_register_handler(MDB_CMD_VEND, MDB_CMD_VEND_SESSION_COMPLETE, 2, &mdb_cashless_session_complete);
    mdb_register_handler(MDB_CMD_VEND, MDB_CMD_VEND_CASH_SALE, 6, &test);
    mdb_register_handler(MDB_CMD_READER, MDB_CMD_READER_DISABLE, 2, &mdb_cashless_reader_disable);
    mdb_register_handler(MDB_CMD_READER, MDB_CMD_READER_ENABLE, 2, &mdb_cashless_reader_enable);
    mdb_register_handler(MDB_CMD_READER, MDB_CMD_READER_CANCEL, 2, &mdb_cashless_reader_cancel);
    mdb_register_handler(MDB_CMD_EXT, MDB_CMD_EXT_REQUEST_ID, 31, &mdb_cashless_request_id);
}
