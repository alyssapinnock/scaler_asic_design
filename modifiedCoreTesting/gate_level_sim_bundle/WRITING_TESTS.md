# Writing C Programs for the Gate-Level Simulation

This guide walks you through writing a C program, compiling it to a RISC-V memory image (`.vmem`), and running it on the masked Ibex gate-level simulation.

---

## Table of Contents

1. [Prerequisites](#1-prerequisites)
2. [Understanding the Execution Environment](#2-understanding-the-execution-environment)
3. [Available API](#3-available-api)
4. [Memory Map](#4-memory-map)
5. [Writing Your Program](#5-writing-your-program)
6. [Compiling to a VMEM Image](#6-compiling-to-a-vmem-image)
7. [Running on the Gate-Level Simulation](#7-running-on-the-gate-level-simulation)
8. [Reading the Output](#8-reading-the-output)
9. [Debugging Tips](#9-debugging-tips)
10. [Complete Example: Hello World](#10-complete-example-hello-world)
11. [Complete Example: Timer Access](#11-complete-example-timer-access)

---

## 1. Prerequisites

Before you begin, make sure you have:

- The RISC-V GCC toolchain installed and accessible:
  - `riscv32-unknown-elf-gcc`
  - `riscv32-unknown-elf-objcopy`
- `python3` (used by `bin2vmem.py` if `srec_cat` is not available)
- `xrun` (Cadence Xcelium) on your `PATH` or set `XRUN_BIN`

Check the toolchain is available:

```bash
riscv32-unknown-elf-gcc --version
# or, if it's not on PATH, set RISCV_TOOLCHAIN_BIN:
export RISCV_TOOLCHAIN_BIN=/home/net/al663069/SD2_ws/riscv-toolchain/bin
${RISCV_TOOLCHAIN_BIN}/riscv32-unknown-elf-gcc --version
```

---

## 2. Understanding the Execution Environment

The simulation models a minimal RISC-V system called **ibex_simple_system**. It consists of:

| Component | Description |
|---|---|
| **Ibex core** | RV32IMC masked processor (synthesized netlist) |
| **RAM** | Instruction + data memory, loaded from your `.vmem` file |
| **Timer** | RISC-V machine-mode timer (`MTIME`, `MTIMECMP`) |
| **SimCtrl** | A special peripheral: writes to it appear as text in `ibex_simple_system.log`; a specific write halts the simulation |

There is **no OS, no libc, no heap allocator**. Your program runs in bare-metal mode. The startup code (`crt0.S`) sets up the stack pointer and jumps to `main()`. When `main()` finishes (or you call `sim_halt()`), the simulation ends.

---

## 3. Available API

Include `simple_system_common.h` to access the following functions:

```c
#include "simple_system_common.h"
```

### Output functions

| Function | Description |
|---|---|
| `int putchar(int c)` | Write a single character to the simulation log |
| `int puts(const char *str)` | Write a string to the simulation log (no automatic newline — add `\n` yourself) |
| `void puthex(uint32_t h)` | Write a 32-bit value as 8 hex digits to the simulation log |

> **Note:** `puts()` here does **not** append a newline automatically (unlike standard libc). Always add `\n` at the end of strings if you want a line break.

### Control functions

| Function | Description |
|---|---|
| `void sim_halt()` | Immediately end the simulation (required — see below) |
| `void pcount_enable(int enable)` | Enable (`1`) or disable (`0`) hardware performance counters |
| `void pcount_reset()` | Reset all performance counters to zero |

### Timer functions

| Function | Description |
|---|---|
| `void timer_enable(uint64_t time_base)` | Set `MTIMECMP = MTIME + time_base` and enable the timer interrupt |
| `uint64_t timer_read(void)` | Read the current 64-bit `MTIME` value |

### Types

`simple_system_common.h` includes `<stdint.h>`, so you can use:
- `uint32_t`, `int32_t`, `uint64_t`, `int64_t`, etc.

### Register access macros

```c
DEV_WRITE(addr, val)   // Write val to a memory-mapped address
DEV_READ(addr, val)    // Read from a memory-mapped address (val unused, returns value)
```

---

## 4. Memory Map

| Address | Size | Description |
|---|---|---|
| `0x00000000` | 1 MB | RAM (code + data, loaded from `.vmem`) |
| `0x20000` | — | SimCtrl base |
| `0x20000` | 4 B | SimCtrl OUT — write a character here to print it |
| `0x20008` | 4 B | SimCtrl CTRL — write `0x1` here to halt the simulation |
| `0x30000` | — | Timer base |
| `0x30000` | 4 B | `MTIME` low word |
| `0x30004` | 4 B | `MTIME` high word |
| `0x30008` | 4 B | `MTIMECMP` low word |
| `0x3000C` | 4 B | `MTIMECMP` high word |

> The RAM starts at address `0x0`. Your program is linked to run from `0x0`.  
> Data addresses must be **word-aligned** (4-byte aligned) when accessing memory-mapped peripherals.

---

## 5. Writing Your Program

### Minimal program structure

```c
#include "simple_system_common.h"

int main(void) {
    // --- your code here ---

    sim_halt();  // REQUIRED: ends the simulation cleanly
    return 0;
}
```

> **Always call `sim_halt()` at the end.** Without it, the simulation will time out rather than exit cleanly.

### Rules to follow

1. **No heap / no `malloc`** — there is no heap allocator. Use stack arrays or `static` variables.
2. **No standard library** — `printf`, `scanf`, `strlen` etc. are not available. Use `puts()`, `putchar()`, and `puthex()`.
3. **Avoid very large stack arrays** — the stack size is limited. Large local arrays can cause corruption.
4. **Use `volatile`** for memory-mapped registers — the compiler must not cache or reorder peripheral accesses.
5. **Keep programs short** — the simulation has a runtime limit (default 600,000 ns in `run_gate_level_sim.sh`). Long-running programs may time out.

### Printing values

```c
// Print a string
puts("Hello, world!\n");

// Print a number in hex
puthex(my_value);
putchar('\n');   // puthex does not add a newline

// Print a labelled hex value
puts("Result: 0x");
puthex(result);
putchar('\n');
```

### Reading and writing memory-mapped peripherals

```c
// Direct pointer approach (preferred for peripherals)
volatile uint32_t *timer_lo = (volatile uint32_t *)0x30000;
uint32_t t = *timer_lo;   // read
*timer_lo = 0xFFFF;       // write

// Macro approach
uint32_t val = DEV_READ(0x30000, unused);
DEV_WRITE(0x30008, 0xFFFFFFFF);
```

---

## 6. Compiling to a VMEM Image

All compilation is done with the script `tests/compile_tests.sh`.

### Step 1 — Place your C file in the `tests/` directory

```bash
cp my_test.c /path/to/gate_level_sim_bundle/tests/
```

Or write it directly there:

```bash
nano gate_level_sim_bundle/tests/my_test.c
```

### Step 2 — Run the compile script

```bash
cd gate_level_sim_bundle/tests

# If riscv32-unknown-elf-gcc is on your PATH:
bash ./compile_tests.sh my_test.c

# If it is not on PATH, point to the toolchain bin directory:
RISCV_TOOLCHAIN_BIN=/home/net/al663069/SD2_ws/riscv-toolchain/bin \
  bash ./compile_tests.sh my_test.c
```

### What the script produces

Under `tests/compiled/`:

| File | Description |
|---|---|
| `my_test.elf` | Linked ELF binary (useful for inspecting with `objdump`) |
| `my_test.bin` | Raw binary image |
| `my_test.vmem` | 32-bit word hex memory image — this is what the simulator loads |

### Compiling all tests at once

```bash
bash ./compile_tests.sh   # no arguments = compile every *.c in tests/
```

### Inspecting the compiled binary (optional)

```bash
${RISCV_TOOLCHAIN_BIN}/riscv32-unknown-elf-objdump -d tests/compiled/my_test.elf | less
```

---

## 7. Running on the Gate-Level Simulation

From the bundle root:

```bash
cd gate_level_sim_bundle

VMEM="$PWD/tests/compiled/my_test.vmem" bash ./run_gate_level_sim.sh
```

### Environment variables

| Variable | Default | Description |
|---|---|---|
| `VMEM` | `$PWD/tests/compiled/hello_test.vmem` | Path to the `.vmem` file to load |
| `GLS_DEBUG` | `0` | Set to `1` to enable verbose BUS/LSU/TIMER monitor prints |
| `RUN_TIME` | `600000ns` | Simulation wall-clock timeout |
| `XRUN_BIN` | `xrun` | Path to the `xrun` executable |

### Examples

```bash
# Run with default test
bash ./run_gate_level_sim.sh

# Run a specific test
VMEM="$PWD/tests/compiled/my_test.vmem" bash ./run_gate_level_sim.sh

# Run with debug bus/LSU logging on
GLS_DEBUG=1 VMEM="$PWD/tests/compiled/my_test.vmem" bash ./run_gate_level_sim.sh

# Extend the simulation timeout (useful for longer programs)
RUN_TIME=2000000ns VMEM="$PWD/tests/compiled/my_test.vmem" bash ./run_gate_level_sim.sh
```

---

## 8. Reading the Output

### Software output (your `puts` / `putchar` / `puthex` calls)

Written to: **`ibex_simple_system.log`** in the bundle root.

```bash
cat ibex_simple_system.log
```

This is the primary place to look for `PASS` / `FAIL` messages and any values you printed.

### Full simulator transcript

Written to: **`work/xrun_netlist_test/xrun.log`**

```bash
cat work/xrun_netlist_test/xrun.log
```

This contains the xrun compilation log, any `$display` messages from the testbench, and timing information. It is large — use `grep` to search it:

```bash
grep -i "error\|warn\|halt\|pass\|fail" work/xrun_netlist_test/xrun.log
```

### Simulation end status

The testbench prints one of:
- `Simulation PASS` — the program called `sim_halt()` cleanly
- Timeout — the program ran out of simulation time without halting

---

## 9. Debugging Tips

### My program is not printing anything

- Make sure you called `puts("something\n")` — check the spelling; it is `puts`, not `printf`.
- Check `ibex_simple_system.log` — it may exist but be empty if `sim_halt()` was never reached.
- Check `work/xrun_netlist_test/xrun.log` for access faults or traps.

### The simulation times out

- Your program has an infinite loop or is too slow. Either simplify the program or increase `RUN_TIME`:
  ```bash
  RUN_TIME=2000000ns VMEM=... bash ./run_gate_level_sim.sh
  ```

### I see unexpected values from peripheral reads

- Enable the bus debug log to watch every transaction:
  ```bash
  GLS_DEBUG=1 VMEM=... bash ./run_gate_level_sim.sh
  ```
  Then inspect `work/xrun_netlist_test/xrun.log` for `[BUS]` and `[LSU]` lines.

### Inspecting the disassembly

```bash
${RISCV_TOOLCHAIN_BIN}/riscv32-unknown-elf-objdump -d tests/compiled/my_test.elf
```

This shows which instructions are at which addresses, helpful if you see a trap at a specific PC.

### Checking the symbol table

```bash
${RISCV_TOOLCHAIN_BIN}/riscv32-unknown-elf-nm tests/compiled/my_test.elf
```

---

## 10. Complete Example: Hello World

**`tests/hello_test.c`:**

```c
#include "simple_system_common.h"

int main(void) {
    puts("Hello, world!\n");
    sim_halt();
    return 0;
}
```

**Compile:**

```bash
cd gate_level_sim_bundle/tests
bash ./compile_tests.sh hello_test.c
```

**Run:**

```bash
cd gate_level_sim_bundle
VMEM="$PWD/tests/compiled/hello_test.vmem" bash ./run_gate_level_sim.sh
```

**Expected `ibex_simple_system.log`:**

```
Hello, world!
```

---

## 11. Complete Example: Timer Access

This example reads the hardware timer twice to confirm it is incrementing.

**`tests/my_timer_test.c`:**

```c
#include "simple_system_common.h"

int main(void) {
    puts("=== My Timer Test ===\n");

    // Read MTIME low word directly via pointer
    volatile uint32_t *mtime_lo = (volatile uint32_t *)0x30000;
    volatile uint32_t *mtime_hi = (volatile uint32_t *)0x30004;

    uint32_t t0_lo = *mtime_lo;
    uint32_t t0_hi = *mtime_hi;

    puts("MTIME at start: hi=0x");
    puthex(t0_hi);
    puts(" lo=0x");
    puthex(t0_lo);
    putchar('\n');

    // Do some work so time passes
    volatile int dummy = 0;
    for (int i = 0; i < 500; i++) { dummy += i; }

    uint32_t t1_lo = *mtime_lo;
    puts("MTIME after loop: lo=0x");
    puthex(t1_lo);
    putchar('\n');

    if (t1_lo > t0_lo) {
        puts("PASS: Timer is incrementing!\n");
    } else {
        puts("FAIL: Timer did not increment.\n");
    }

    sim_halt();
    return 0;
}
```

**Compile and run:**

```bash
cd gate_level_sim_bundle/tests
bash ./compile_tests.sh my_timer_test.c

cd ..
VMEM="$PWD/tests/compiled/my_timer_test.vmem" bash ./run_gate_level_sim.sh
```
