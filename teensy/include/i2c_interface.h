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

#ifndef __I2C_INTERFACE_H
#define __I2C_INTERFACE_H

#define SV_I2C_ADDR         0x33

#define SV_CMD_NOCMD        0x00
#define SV_CMD_POLL         0x01
#define SV_CMD_ADD_FUNDS    0x02
#define SV_CMD_GET_VMC_CFG  0x03
#define SV_CMD_GET_VMC_ID   0x04

#pragma pack(1)
typedef struct sv_status {
    uint8_t cashless_state;
    uint8_t vend_count;
    uint16_t available_funds;
    uint16_t last_vend_item;
    uint16_t last_vend_cost;
} sparkvend_status;
#pragma pack()

void i2c_setup();

#endif