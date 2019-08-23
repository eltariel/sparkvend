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

#include <Wire.h>
#include <stdint.h>

#include <i2c_interface.h>
#include <mdb_cashless.h>

uint8_t cmd = 0;
uint16_t funds = 0;
sparkvend_status status;

void i2c_receive(int count)
{
    if(count)
    {
        cmd = Wire.read();

        switch (cmd)
        {
        case SV_CMD_ADD_FUNDS:
            if(count >= 3)
            {
                Wire.readBytes((uint8_t*)&funds, 2);
            }
            else
            {
                funds = 0;
            }

            mdb_cashless_funds_available(funds);
            cmd = SV_CMD_POLL;
            
            break;
        
        default:
            cmd = SV_CMD_NOCMD;
            break;
        }
    }
}

void i2c_request()
{
    switch (cmd)
    {
    case SV_CMD_POLL:
        status.cashless_state = mdb_cashless_get_current_state();
        status.vend_count = mdb_cashless_get_vend_count();
        status.available_funds = mdb_cashless_get_current_funds();
        status.last_vend_item = mdb_cashless_get_last_item();
        status.last_vend_cost = mdb_cashless_get_last_price();
        
        Wire.write((uint8_t*)(&status), sizeof(status));
        break;
    
    default:
        break;
    }
}

void i2c_setup()
{
    Wire.begin(SV_I2C_ADDR);
    Wire.onReceive(&i2c_receive);
    Wire.onRequest(&i2c_request);
}