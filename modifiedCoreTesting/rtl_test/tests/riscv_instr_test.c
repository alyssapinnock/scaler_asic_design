// Instruction test - exercises ALU, memory, branches, MUL/DIV
#include "simple_system_common.h"

// Prevent compiler from optimizing away
volatile int sink;

int main(void) {
    puts("=== RISC-V Instruction Test ===\n");
    int pass = 1;
    int a, b, r;

    // --- ALU ops ---
    a = 100; b = 42;
    r = a + b;
    if (r != 142) { puts("FAIL: ADD\n"); pass = 0; } 

    r = a - b;
    if (r != 58) { puts("FAIL: SUB\n"); pass = 0; }

    r = a & b;
    if (r != (100 & 42)) { puts("FAIL: AND\n"); pass = 0; }

    r = a | b;
    if (r != (100 | 42)) { puts("FAIL: OR\n"); pass = 0; }

    r = a ^ b;
    if (r != (100 ^ 42)) { puts("FAIL: XOR\n"); pass = 0; }

    r = a << 3;
    if (r != 800) { puts("FAIL: SLL\n"); pass = 0; }

    r = a >> 2;
    if (r != 25) { puts("FAIL: SRL\n"); pass = 0; }

    // Signed right shift
    a = -100;
    r = a >> 2;
    if (r != -25) { puts("FAIL: SRA\n"); pass = 0; }

    // SLT
    a = -5; b = 5;
    r = (a < b) ? 1 : 0;
    if (r != 1) { puts("FAIL: SLT\n"); pass = 0; }

    // SLTU
    r = ((unsigned int)a < (unsigned int)b) ? 1 : 0;
    if (r != 0) { puts("FAIL: SLTU\n"); pass = 0; } // -5 as unsigned is huge

    if (pass) puts("ALU: PASS\n"); else puts("ALU: FAIL\n");

    // --- Memory ops ---
    pass = 1;
    volatile int mem_word = 0xDEADBEEF;
    if (mem_word != (int)0xDEADBEEF) { puts("FAIL: SW/LW\n"); pass = 0; }

    volatile short mem_half = (short)0x1234;
    if (mem_half != 0x1234) { puts("FAIL: SH/LH\n"); pass = 0; }

    volatile char mem_byte = (char)0x42;
    if (mem_byte != 0x42) { puts("FAIL: SB/LB\n"); pass = 0; }

    // Unsigned load half
    volatile unsigned short mem_uhal = 0xF234;
    if (mem_uhal != 0xF234) { puts("FAIL: LHU\n"); pass = 0; }

    // Unsigned load byte
    volatile unsigned char mem_ubyt = 0xF2;
    if (mem_ubyt != 0xF2) { puts("FAIL: LBU\n"); pass = 0; }

    if (pass) puts("Memory: PASS\n"); else puts("Memory: FAIL\n");

    // --- Branches ---
    pass = 1;
    a = 10; b = 20;
    if (!(a == 10)) { puts("FAIL: BEQ\n"); pass = 0; }
    if (!(a != b))  { puts("FAIL: BNE\n"); pass = 0; }
    if (!(a < b))   { puts("FAIL: BLT\n"); pass = 0; }
    if (!(b >= a))  { puts("FAIL: BGE\n"); pass = 0; }

    if (pass) puts("Branch: PASS\n"); else puts("Branch: FAIL\n");

    // --- MUL/DIV (M extension) ---
    pass = 1;
    a = 123; b = 456;
    r = a * b;
    if (r != 56088) { puts("FAIL: MUL\n"); pass = 0; }

    // Signed multiply negative
    a = -7; b = 13;
    r = a * b;
    if (r != -91) { puts("FAIL: MUL neg\n"); pass = 0; }

    a = 1000; b = 7;
    r = a / b;
    if (r != 142) { puts("FAIL: DIV\n"); pass = 0; }

    r = a % b;
    if (r != 6) { puts("FAIL: REM\n"); pass = 0; }

    // Signed division
    a = -100; b = 7;
    r = a / b;
    if (r != -14) { puts("FAIL: DIV neg\n"); pass = 0; }

    r = a % b;
    if (r != -2) { puts("FAIL: REM neg\n"); pass = 0; }

    // Division by zero (RISC-V: returns -1 for div, dividend for rem)
    a = 42; b = 0;
    // Use asm to prevent compiler from optimizing
    asm volatile("div %0, %1, %2" : "=r"(r) : "r"(a), "r"(b));
    if (r != -1) { puts("FAIL: DIV by zero\n"); pass = 0; }
    asm volatile("rem %0, %1, %2" : "=r"(r) : "r"(a), "r"(b));
    if (r != 42) { puts("FAIL: REM by zero\n"); pass = 0; }

    if (pass) puts("MUL/DIV: PASS\n"); else puts("MUL/DIV: FAIL\n");

    // --- AUIPC/LUI ---
    pass = 1;
    unsigned int pc_val;
    asm volatile("auipc %0, 0" : "=r"(pc_val));
    // PC should be in the range 0x00100000+ (RAM region)
    if (pc_val < 0x00100000 || pc_val > 0x00200000) {
        puts("FAIL: AUIPC out of range\n"); pass = 0;
    }

    unsigned int lui_val;
    asm volatile("lui %0, 0xDEADB" : "=r"(lui_val));
    if (lui_val != 0xDEADB000) { puts("FAIL: LUI\n"); pass = 0; }

    if (pass) puts("AUIPC/LUI: PASS\n"); else puts("AUIPC/LUI: FAIL\n");

    puts("\n=== All instruction tests complete ===\n");
    sim_halt();
    return 0;
}
