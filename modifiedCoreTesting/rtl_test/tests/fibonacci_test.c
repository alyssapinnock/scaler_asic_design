// Fibonacci test - computes first 20 Fibonacci numbers
#include "simple_system_common.h"

int main(void) {
    puts("=== Fibonacci Test ===\n");
    int pass = 1;

    // Expected first 20 Fibonacci numbers (use volatile to avoid memcpy)
    volatile unsigned int expected[20];
    expected[0]=0; expected[1]=1; expected[2]=1; expected[3]=2; expected[4]=3;
    expected[5]=5; expected[6]=8; expected[7]=13; expected[8]=21; expected[9]=34;
    expected[10]=55; expected[11]=89; expected[12]=144; expected[13]=233; expected[14]=377;
    expected[15]=610; expected[16]=987; expected[17]=1597; expected[18]=2584; expected[19]=4181;

    unsigned int fib[20];
    fib[0] = 0;
    fib[1] = 1;
    for (int i = 2; i < 20; i++) {
        fib[i] = fib[i-1] + fib[i-2];
    }

    for (int i = 0; i < 20; i++) {
        if (fib[i] != expected[i]) {
            puts("FAIL at index ");
            puthex(i);
            puts(": got 0x");
            puthex(fib[i]);
            puts(" expected 0x");
            puthex(expected[i]);
            putchar('\n');
            pass = 0;
        }
    }

    puts("fib(19) = 0x");
    puthex(fib[19]);
    putchar('\n');

    if (pass) {
        puts("PASS: All Fibonacci numbers correct!\n");
    } else {
        puts("FAIL: Fibonacci sequence errors\n");
    }

    sim_halt();
    return 0;
}
