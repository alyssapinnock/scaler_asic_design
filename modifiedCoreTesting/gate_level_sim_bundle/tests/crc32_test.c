// CRC32 test - computes CRC32 of "123456789" and checks result
#include "simple_system_common.h"

static unsigned int crc32_table[256];

void crc32_init(void) {
    for (unsigned int i = 0; i < 256; i++) {
        unsigned int crc = i;
        for (int j = 0; j < 8; j++) {
            if (crc & 1)
                crc = (crc >> 1) ^ 0xEDB88320;
            else
                crc >>= 1;
        }
        crc32_table[i] = crc;
    }
}

unsigned int crc32(const char *data, int len) {
    unsigned int crc = 0xFFFFFFFF;
    for (int i = 0; i < len; i++) {
        unsigned char byte = (unsigned char)data[i];
        crc = (crc >> 8) ^ crc32_table[(crc ^ byte) & 0xFF];
    }
    return ~crc;
}

int main(void) {
    puts("CRC32 Test\n");

    crc32_init();
    unsigned int result = crc32("123456789", 9);

    puts("CRC32 of '123456789': 0x");
    puthex(result);
    putchar('\n');

    if (result == 0xCBF43926) {
        puts("PASS: CRC32 correct!\n");
    } else {
        puts("FAIL: expected 0xCBF43926\n");
    }

    sim_halt();
    return 0;
}
