#ifndef __MDB_CASHLESS_H
#define __MDB_CASHLESS_H

#include <stdint.h>
#include <Print.h>

#include <mdb_defs.h>

/**
 * Cashless device commands
 */
#define MDB_CMD_RESET                   0x00
#define MDB_CMD_SETUP                   0x01
#define MDB_CMD_POLL                    0x02
#define MDB_CMD_VEND                    0x03
#define MDB_CMD_READER                  0x04
#define MDB_CMD_REVALUE                 0x05

#define MDB_CMD_SETUP_CONFIG            0x00
#define MDB_CMD_SETUP_PRICES            0x01

#define MDB_CMD_VEND_REQUEST            0x00
#define MDB_CMD_VEND_CANCEL             0x01
#define MDB_CMD_VEND_SUCCESS            0x02
#define MDB_CMD_VEND_FAILURE            0x03
#define MDB_CMD_VEND_SESSION_COMPLETE   0x04
#define MDB_CMD_VEND_CASH_SALE          0x05
#define MDB_CMD_VEND_NEGATIVE_REQUEST   0x06

#define MDB_CMD_READER_DISABLE          0x00
#define MDB_CMD_READER_ENABLE           0x01
#define MDB_CMD_READER_CANCEL           0x02
#define MDB_CMD_READER_DATA_ENTRY_RESP  0x03

/**
 * Cashless device responses
 */
#define MDB_RESPONSE_JUSTRESET      0x00
#define MDB_RESPONSE_READERCFG      0x01
#define MDB_RESPONSE_DISPLAY        0x02
#define MDB_RESPONSE_NEWSESSION     0x03
#define MDB_RESPONSE_CANCELSESSION  0x04
#define MDB_RESPONSE_VENDOK         0x05
#define MDB_RESPONSE_VENDDENIED     0x06
#define MDB_RESPONSE_ENDSESSION     0x07
#define MDB_RESPONSE_CANCELLED      0x08
#define MDB_RESPONSE_PERIPHERALID   0x09
#define MDB_RESPONSE_ERROR          0x0A
#define MDB_RESPONSE_OUTOFSEQ       0x0B

/**
 * Cashless State Machine
 */
#define MDB_CASHLESS_STATE_INACTIVE    0x00
#define MDB_CASHLESS_STATE_DISABLED    0x01
#define MDB_CASHLESS_STATE_ENABLED     0x02
#define MDB_CASHLESS_STATE_IDLE        0x03
#define MDB_CASHLESS_STATE_VEND        0x04
#define MDB_CASHLESS_STATE_REVALUE     0x05
#define MDB_CASHLESS_STATE_NEGVEND     0x06

void mdb_cashless_init(Print* log_target);

struct mdb_cashless_config_cmd
{
    uint8_t feature_level;
    uint8_t columns;
    uint8_t rows;
    uint8_t display_info;
};

struct mdb_cashless_config_response
{
    uint8_t feature_level;
    uint16_t country_code;
    uint8_t scale_factor;
    uint8_t decimal_places;
    uint8_t max_response_time;
    uint8_t options;
};

#endif
