#pragma once

#define MDB_MODE_BIT            0x0100
#define MDB_ADDRESS_MASK        0x00F8
#define MDB_COMMAND_MASK        0x0003

#define MDB_ACK                 0x00
#define MDB_RETRANSMIT          0xAA
#define MDB_NCK                 0xFF

#define MDB_MSG_MAXLEN  40

/**
 * Standard MDB Addresses
 */
#define MDB_ADDR_VMC            0x00
#define MDB_ADDR_CHANGER        0x08
#define MDB_ADDR_CASHLESS1      0x10
#define MDB_ADDR_COMMSGW        0x18
#define MDB_ADDR_DISPLAY        0x20
#define MDB_ADDR_ENERGYMGMT     0x28
#define MDB_ADDR_BILLVALIDATOR  0x30
#define MDB_ADDR_USD1           0x40
#define MDB_ADDR_USD2           0x48
#define MDB_ADDR_USD3           0x50
#define MDB_ADDR_COINDISPENSER1 0x58
#define MDB_ADDR_CASHLESS2      0x60
#define MDB_ADDR_AGEVERIFY      0x68
#define MDB_ADDR_COINDISPENSER2 0x70

#define MDB_NOCMD                       0x06
#define MDB_COUNT_CMD                   (MDB_NOCMD+1)

#define MDB_NOSUBCMD                    0x07
#define MDB_COUNT_SUBCMD                (MDB_NOSUBCMD+1)
