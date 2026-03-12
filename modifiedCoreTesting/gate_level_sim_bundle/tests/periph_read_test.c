// Peripheral read test - tries reading from MMIO regions
// Tests whether any non-RAM load works through the netlist
#include "simple_system_common.h"

int main(void) {
    puts("=== Periph Read Test ===\n");

    // First, read from RAM (should always work)
    volatile uint32_t *ram_ptr = (volatile uint32_t *)0x100200;
    uint32_t ram_val = *ram_ptr;
    puts("RAM read ok: 0x");
    puthex(ram_val);
    putchar('\n');

    // Now try reading from a KNOWN location in peripheral space
    // SimCtrl is at 0x20000 - it's write-only but let's try a read
    volatile uint32_t *simctrl_ptr = (volatile uint32_t *)0x20000;
    puts("Attempting SimCtrl read (0x20000)...\n");
    uint32_t sc_val = *simctrl_ptr;
    puts("SimCtrl read: 0x");
    puthex(sc_val);
    putchar('\n');

    puts("Both reads done!\n");
    sim_halt();
    return 0;
}
