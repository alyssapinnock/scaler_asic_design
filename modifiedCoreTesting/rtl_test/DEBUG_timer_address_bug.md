# Timer MMIO Address Reconstruction Bug

## Summary

A masked-netlist run of `timer_test` failed with a load access fault when reading the timer at `0x30000`, even though other tests passed through the netlist path.

The root cause was a synthesis bug in the top-level masked `ibex_core` outputs:

- `data_addr_o[1:0] = 2'b00`
- `data_addr_o_s1[1:0] = 2'b11`

The wrapper reconstructs the real address as:

```systemverilog
assign data_addr_o = data_addr_o_s0 ^ data_addr_o_s1;
```

So the low two address bits became:

```text
00 ^ 11 = 11
```

This caused a word-aligned timer access to `0x30000` to appear on the bus as `0x30003`.

The timer decodes `addr[9:0]`, so offset `0x003` hit the default error case instead of the `MTIME_LO` register at offset `0x000`.

## Symptom

`timer_test` faulted on:

- `MEPC = 0x1003ea`
- `MCAUSE = 5` (load access fault)
- `MTVAL = 0x00030000`

Disassembly showed the faulting instruction was a timer load:

```assembly
lw s1, 0(s0)
```

with `s0 = 0x30000`.

## Debug Strategy

The investigation moved layer by layer from the architectural symptom to the exact reconstructed bus address.

### 1. Start from the failing software symptom

The first clue was that computation-heavy tests passed, but timer MMIO failed only through the masked netlist path.

That suggested either:

- a peripheral decode issue,
- a bus issue,
- or a masked signal reconstruction issue.

### 2. Add top-level bus logging

In `ibex_simple_system_netlist.sv`, bus-side logging was added for:

- `host_req`
- `host_rvalid`
- `device_req[Timer]`
- `device_rvalid[Timer]`
- `host_err`

This answered:

- whether the core was issuing a request,
- what address hit the system bus,
- and whether the timer was returning an error.

### 3. Check the exact faulting instruction

The failing ELF was disassembled to verify the exception source.

This confirmed the crash was not random control corruption; it was a specific load from `0x30000`.

### 4. Inspect LSU internal activity

Cross-module logging was then added for load/store-related signals inside the masked netlist path.

Important lesson: looking at only one share (`s0` or `s1`) is misleading.

The logging had to reconstruct real values as:

```text
real = s0 ^ s1
```

This helped distinguish:

- genuine LSU behavior,
- from noise caused by observing only one masked share.

### 5. Use smaller repro programs

Two small programs were added:

- `periph_read_test.c`
- `minimal_timer_test.c`

Their purpose was to compare:

- RAM read behavior,
- SimCtrl MMIO behavior,
- and timer MMIO behavior,

without unrelated software complexity.

### 6. Compare working and failing MMIO accesses

`periph_read_test.c` showed:

- RAM reads worked
- SimCtrl reads worked

So the problem was not:

- general LSU failure,
- general MMIO failure,
- or a completely broken bus interface.

`minimal_timer_test.c` isolated the issue further and exposed the key observation:

```text
host_req addr=00030003 we=0 be=1111
host_err asserted addr=00030003
```

The access intended for `0x30000` was reaching the bus as `0x30003`.

### 7. Correlate with timer decode behavior

The timer uses low address bits to select registers. Valid offsets include:

- `0x000` = `MTIME_LO`
- `0x004` = `MTIME_HI`
- `0x008` = `MTIMECMP_LO`
- `0x00C` = `MTIMECMP_HI`

Offset `0x003` is invalid, so the timer correctly raised an error.

That explained the architectural exception completely.

### 8. Inspect the netlist outputs directly

After the wrong address appeared on the bus, the next step was to inspect the synthesized `ibex_core` netlist.

Key top-level assignments found in `Core_netlist.v`:

```verilog
assign data_addr_o_s1[0] = 1'b1;
assign data_addr_o_s1[1] = 1'b1;
...
assign data_addr_o[0] = 1'b0;
assign data_addr_o[1] = 1'b0;
```

These were the reconstructed output shares seen by the wrapper.

## Why This Is a Bug

For Boolean masking, the real signal value must always satisfy:

```text
real = s0 ^ s1
```

If the intended real value is `0`, then the shares must match:

- `0 ^ 0 = 0`
- `1 ^ 1 = 0`

But the synthesized netlist used:

- `s0 = 0`
- `s1 = 1`

which reconstructs to:

```text
0 ^ 1 = 1
```

So the netlist did not preserve the original logical value at the top-level reconstructed address output.

## Why Bits `[1:0]` Matter

Ibex uses byte addresses on the data interface.

For a word-aligned load from `0x30000`, the low two bits must be:

```text
[1:0] = 00
```

Those bits are the byte offset inside the word address.

Because the synthesized shares reconstructed to `11`, the timer saw the request as offset `+3` bytes instead of offset `+0`.

So yes: this bug is directly tied to how Ibex uses `data_addr_o[1:0]` for byte addressing and alignment.

## Fix Applied

The wrapper was patched in `ibex_core_wrapper_netlist.sv` to force correct external reconstruction of the data address:

```systemverilog
assign data_addr_o = (data_addr_o_s0 ^ data_addr_o_s1) & ~32'h3;
```

This masks off the bad reconstructed low two bits.

## Why the Fix Is Safe Here

This fix is targeted to the broken top-level reconstruction of the data address.

For the tested workloads:

- it fixes timer MMIO,
- it does not break other basic C tests,
- and it matches the expected word-aligned address behavior seen in the netlist testbench.

## Regression After the Fix

The following tests were rerun through the masked netlist path:

- `bubblesort_test`
- `crc32_test`
- `fibonacci_test`
- `hello_test`
- `minimal_timer_test`
- `periph_read_test`
- `riscv_instr_test`
- `sieve_test`
- `timer_test`

All completed successfully with no new issues observed.

Regression summary output was saved under:

- `xrun_netlist_test/regression_summary.txt`

## Practical Debugging Lessons

- Start with the architectural symptom, then move outward to the bus
- Log reconstructed values, not just one masked share
- Use tiny repro programs to separate general failures from address-specific failures
- Once a wrong bus value appears, inspect the synthesized top-level outputs directly
- For masked designs, constant propagation must preserve reconstruction, not just individual shares
