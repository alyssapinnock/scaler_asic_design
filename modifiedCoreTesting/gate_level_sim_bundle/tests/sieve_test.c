// Sieve of Eratosthenes test - find primes up to 200
#include "simple_system_common.h"

#define LIMIT 200

// Use volatile to prevent compiler from using memset/memcpy
volatile char is_prime[LIMIT + 1];

int main(void) {
    puts("=== Sieve of Eratosthenes Test ===\n");

    // Initialize manually (avoid memset)
    for (int i = 0; i <= LIMIT; i++) {
        is_prime[i] = 1;
    }
    is_prime[0] = 0;
    is_prime[1] = 0;

    // Sieve
    for (int i = 2; i * i <= LIMIT; i++) {
        if (is_prime[i]) {
            for (int j = i * i; j <= LIMIT; j += i) {
                is_prime[j] = 0;
            }
        }
    }

    // Count primes and verify
    int count = 0;
    for (int i = 2; i <= LIMIT; i++) {
        if (is_prime[i]) {
            count++;
        }
    }

    puts("Number of primes up to 200: ");
    puthex(count);
    putchar('\n');

    // There are exactly 46 primes up to 200
    if (count == 46) {
        puts("PASS: Correct prime count (46)!\n");
    } else {
        puts("FAIL: Expected 46 primes\n");
    }

    // Verify a few known primes manually
    int pass = 1;
    if (!is_prime[2])   { puts("FAIL: 2 should be prime\n"); pass = 0; }
    if (!is_prime[3])   { puts("FAIL: 3 should be prime\n"); pass = 0; }
    if (!is_prime[5])   { puts("FAIL: 5 should be prime\n"); pass = 0; }
    if (!is_prime[7])   { puts("FAIL: 7 should be prime\n"); pass = 0; }
    if (!is_prime[11])  { puts("FAIL: 11 should be prime\n"); pass = 0; }
    if (!is_prime[13])  { puts("FAIL: 13 should be prime\n"); pass = 0; }
    if (!is_prime[97])  { puts("FAIL: 97 should be prime\n"); pass = 0; }
    if (!is_prime[101]) { puts("FAIL: 101 should be prime\n"); pass = 0; }
    if (!is_prime[197]) { puts("FAIL: 197 should be prime\n"); pass = 0; }
    if (!is_prime[199]) { puts("FAIL: 199 should be prime\n"); pass = 0; }

    // Verify a few known non-primes
    if (is_prime[4])   { puts("FAIL: 4 should not be prime\n"); pass = 0; }
    if (is_prime[6])   { puts("FAIL: 6 should not be prime\n"); pass = 0; }
    if (is_prime[100]) { puts("FAIL: 100 should not be prime\n"); pass = 0; }
    if (is_prime[150]) { puts("FAIL: 150 should not be prime\n"); pass = 0; }
    if (is_prime[200]) { puts("FAIL: 200 should not be prime\n"); pass = 0; }

    if (pass) {
        puts("PASS: All prime checks correct!\n");
    } else {
        puts("FAIL: Prime check errors\n");
    }

    sim_halt();
    return 0;
}
