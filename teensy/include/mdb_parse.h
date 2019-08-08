#ifndef __MDB_PARSE_H
#define __MDB_PARSE_H

#include <stddef.h>
#include <stdint.h>

#include <Print.h>

// Fills an output buffer, returns the length of it. Checksum is added after. Only use the low 8 bits of each word in the buffer. 
typedef uint8_t (*mdb_command_handler)(uint8_t* buffer, uint8_t* out);

typedef size_t (*transmit_callback)(uint16_t data);

/**
 * Protocol parse state machine
 */
#define MDB_PARSE_IDLE          0x00
#define MDB_PARSE_RECV_DATA     0x01
#define MDB_PARSE_EXPECT_CSUM   0x02
#define MDB_PARSE_WAIT_ACK      0x03

void mdb_parser_init(transmit_callback tx_callback, Print* log_target);

void mdb_new_command(uint16_t incoming);
void mdb_receive_byte(uint8_t data);
bool mdb_validate_csum(uint8_t data);
uint16_t* mdb_parse(uint16_t incoming);

void mdb_register_handler(uint8_t cmd, uint8_t subcmd, uint8_t length, mdb_command_handler handler);

#endif