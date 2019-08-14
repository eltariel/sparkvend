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

#include <Arduino.h>
#include <HardwareSerial.h>

#include <mdb_defs.h>
#include <mdb_parse.h>
#include <mdb_cashless.h>

const int led_pin = 13;

HardwareSerial *peripheral = &Serial2;
HardwareSerial *sniff = &Serial3;
usb_serial_class *host = &Serial;

size_t tx(uint16_t data)
{
    return peripheral->write9bit(data);
}

void log(const char* msg)
{
    host->print(msg);
}

void setup()
{
    pinMode(led_pin, OUTPUT);

    host->begin(9600);
    sniff->begin(9600, SERIAL_9N1_TXINV);
    peripheral->begin(9600, SERIAL_9N1_TXINV);

    mdb_parser_init(&tx, host);
    mdb_cashless_init(host);
}

uint8_t current_addr = 0;
void dump_incoming(uint16_t incoming)
{
    host->print(">>> ");

    if (incoming & MDB_MODE_BIT)
    {
        current_addr = MDB_ADDRESS_MASK & incoming;
        
        switch (current_addr)
        {
        case MDB_ADDR_CHANGER:
            host->print("COINMECH       ");
            break;
        case MDB_ADDR_CASHLESS1:
            host->print("CASHLESS       ");
            break;
        case MDB_ADDR_BILLVALIDATOR:
            host->print("BILL VALIDATOR ");
            break;
        default:
            host->print("UNKNOWN        ");
            break;
        }
    }
    else
    {
        host->print("               ");
    }
    
    host->print(" 0x");
    host->print(incoming, HEX);
    host->print(" 0b");
    host->println(incoming, BIN);
}

void loop()
{
    int pin_state = HIGH;
    int incoming;

    if (peripheral->available() > 0)
    {
        incoming = peripheral->read();
        digitalWrite(led_pin, pin_state);
        pin_state = (pin_state == HIGH) ? LOW : HIGH;
        // dump_incoming(incoming);

        mdb_parse(incoming);
    }

    if (sniff->available() > 0)
    {
        incoming = sniff->read();
        host->print("TO VMC:   ");
        host->println(incoming, HEX);
    }
}
