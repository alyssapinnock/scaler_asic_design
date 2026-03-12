// Bubble sort test - sorts array and verifies result
#include "simple_system_common.h"

void bubble_sort(int arr[], int n) {
    for (int i = 0; i < n - 1; i++) {
        for (int j = 0; j < n - i - 1; j++) {
            if (arr[j] > arr[j + 1]) {
                int tmp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = tmp;
            }
        }
    }
}

int main(void) {
    puts("=== Bubble Sort Test ===\n");

    // Use volatile writes to avoid memcpy optimization
    volatile int arr[20];
    arr[0]=64; arr[1]=-12; arr[2]=25; arr[3]=0; arr[4]=22;
    arr[5]=-7; arr[6]=11; arr[7]=90; arr[8]=-33; arr[9]=1;
    arr[10]=55; arr[11]=-88; arr[12]=42; arr[13]=17; arr[14]=-5;
    arr[15]=100; arr[16]=3; arr[17]=-1; arr[18]=77; arr[19]=8;

    int expected[20];
    expected[0]=-88; expected[1]=-33; expected[2]=-12; expected[3]=-7; expected[4]=-5;
    expected[5]=-1; expected[6]=0; expected[7]=1; expected[8]=3; expected[9]=8;
    expected[10]=11; expected[11]=17; expected[12]=22; expected[13]=25; expected[14]=42;
    expected[15]=55; expected[16]=64; expected[17]=77; expected[18]=90; expected[19]=100;

    // Copy to non-volatile for sorting
    int sort_arr[20];
    for (int i = 0; i < 20; i++) sort_arr[i] = arr[i];
    int n = 20;

    bubble_sort(sort_arr, n);

    int pass = 1;
    for (int i = 0; i < n; i++) {
        if (sort_arr[i] != expected[i]) {
            puts("FAIL at index ");
            puthex(i);
            puts(": got ");
            puthex(sort_arr[i]);
            puts(" expected ");
            puthex(expected[i]);
            putchar('\n');
            pass = 0;
        }
    }

    // Print sorted array
    puts("Sorted: ");
    for (int i = 0; i < n; i++) {
        puthex(sort_arr[i]);
        putchar(' ');
    }
    putchar('\n');

    if (pass) {
        puts("PASS: Array correctly sorted!\n");
    } else {
        puts("FAIL: Sort errors detected\n");
    }

    sim_halt();
    return 0;
}
