// Timer specific test - minimal, just tries 0x30000
#include "simple_system_common.h"

int main(void) {
    puts("=== Minimal Timer Test ===\n");

    // First: read from RAM to confirm baseline
    volatile uint32_t *ram_ptr = (volatile uint32_t *)0x100200;
    uint32_t rv = *ram_ptr;
    puts("RAM ok\n");

    // Second: read from SimCtrl (works)
    volatile uint32_t *sc = (volatile uint32_t *)0x20000;
    uint32_t sv = *sc;
    puts("SimCtrl ok\n");

    // Third: try 0x30000 (timer MTIME)
    puts("Trying 0x30000...\n");
    volatile uint32_t *t = (volatile uint32_t *)0x30000;
    uint32_t tv = *t;
    puthex(tv);
    putchar('\n');

    puts("PASS!\n");
    sim_halt();
    return 0;
}
