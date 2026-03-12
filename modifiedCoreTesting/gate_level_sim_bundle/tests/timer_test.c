// Timer read test - just reads the timer without enabling interrupts
#include "simple_system_common.h"

int main(void) {
    puts("=== Timer Read Test ===\n");

    // Try a simple read from timer MTIME (0x30000)
    puts("Reading MTIME...\n");
    volatile uint32_t *timer_lo = (volatile uint32_t *)0x30000;
    volatile uint32_t *timer_hi = (volatile uint32_t *)0x30004;

    uint32_t tlo = *timer_lo;
    puts("MTIME_LO: 0x");
    puthex(tlo);
    putchar('\n');

    uint32_t thi = *timer_hi;
    puts("MTIME_HI: 0x");
    puthex(thi);
    putchar('\n');

    // Read again to see if it's incrementing
    tlo = *timer_lo;
    puts("MTIME_LO (2nd): 0x");
    puthex(tlo);
    putchar('\n');

    // Now try a write to MTIMECMP
    puts("Writing MTIMECMP...\n");
    volatile uint32_t *cmp_lo = (volatile uint32_t *)0x30008;
    volatile uint32_t *cmp_hi = (volatile uint32_t *)0x3000C;
    *cmp_hi = 0xFFFFFFFF;
    *cmp_lo = 0xFFFFFFFF;
    puts("MTIMECMP set to max\n");

    // Read back
    uint32_t clo = *cmp_lo;
    puts("MTIMECMP_LO: 0x");
    puthex(clo);
    putchar('\n');

    puts("PASS: Timer access works!\n");
    sim_halt();
    return 0;
}
