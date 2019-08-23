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
#define MDB_CMD_EXT                     0x07

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

#define MDB_CMD_EXT_REQUEST_ID          0x00

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

#pragma pack(1)
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
#pragma pack()

/**
 * Provide funds to the cashless device.
 * 
 * funds: 0 - 0xFFFE = amount available. 0xFFFF = unknown amount.
 */
void mdb_cashless_funds_available(uint16_t funds);

uint8_t mdb_cashless_get_current_state();
uint8_t mdb_cashless_get_vend_count();
uint16_t mdb_cashless_get_current_funds();
uint16_t mdb_cashless_get_last_item();
uint16_t mdb_cashless_get_last_price();

#endif
