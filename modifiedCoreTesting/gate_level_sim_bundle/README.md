# Gate-Level Simulation Bundle

This folder is a portable subset of the repository containing the files needed to run the masked Ibex gate-level simulation used in `ibex_simple_system`.

## What Is Included

### Required simulation sources

- `sources/Synthesis/outputs/Core_netlist.v` — synthesized masked `ibex_core` netlist
- `sources/modifiedCoreTesting/rtl_test/ibex_core_wrapper_netlist.sv` — XOR-share wrapper used with the netlist
- `sources/modifiedCoreTesting/rtl_test/ibex_simple_system_netlist.sv` — netlist-aware simple-system testbench
- `sources/modifiedCoreTesting/tb/std_cells_functional.v` — behavioral standard-cell models
- `sources/modifiedCoreRTL/` — required Ibex RTL support files, packages, tracer, `gates_cmo.v`, and `gng.v`
- `sources/vendor/lowrisc_ip/ip/prim*/` — primitive packages and support modules
- `sources/shared/rtl/` — bus, timer, RAM, and simulator control modules

### Software build support

- `common/` — `crt0.S`, `link.ld`, `simple_system_common.c`, `simple_system_common.h`, `simple_system_regs.h`
- `tests/` — C tests, `bin2vmem.py`, and `compile_tests.sh`
- `tests/compiled/` — prebuilt `.elf`, `.bin`, and `.vmem` images for the current basic tests

### Runner

- `filelist.f` — static relative file list for simulation
- `run_gate_level_sim.sh` — portable xrun launcher

## What You Need On The Target System

- `xrun` available on `PATH`, or set `XRUN_BIN`
- `python3`
- Optional for compiling new tests:
  - `riscv32-unknown-elf-gcc`
  - `riscv32-unknown-elf-objcopy`
  - `srec_cat` (optional; `bin2vmem.py` is the fallback)

## Quick Start

Run a prebuilt test:

```bash
cd gate_level_sim_bundle
VMEM="$PWD/tests/compiled/timer_test.vmem" bash ./run_gate_level_sim.sh
```

Enable BUS/LSU debug logging:

```bash
cd gate_level_sim_bundle
GLS_DEBUG=1 VMEM="$PWD/tests/compiled/timer_test.vmem" bash ./run_gate_level_sim.sh
```

Run the default sample (`hello_test.vmem`):

```bash
cd gate_level_sim_bundle
bash ./run_gate_level_sim.sh
```

## Build A New Test

1. Add `your_test.c` under `tests/`
2. Compile it:

```bash
cd gate_level_sim_bundle/tests
RISCV_TOOLCHAIN_BIN=/path/to/toolchain/bin bash ./compile_tests.sh your_test.c
```

3. Run it:

```bash
cd gate_level_sim_bundle
VMEM="$PWD/tests/compiled/your_test.vmem" bash ./run_gate_level_sim.sh
```

## Notes

- The runner uses relative paths only, so the whole folder can be copied to another machine.
- The simulation work area is written under `work/`.
- The software UART-style output is written to `ibex_simple_system.log` in the bundle root.
- The full simulator transcript is written to `work/xrun_netlist_test/xrun.log`.
- BUS/LSU/TIMER debug prints are off by default and can be enabled with `GLS_DEBUG=1`.

## Minimal File Categories If You Rebuild This Bundle Manually

You need all of these categories for gate-level simulation:

- The synthesized netlist
- The netlist wrapper and netlist-aware testbench
- Standard-cell and CMO gate models
- All Ibex support RTL compiled alongside the netlist
- LowRISC primitive packages and primitive RTL
- Shared simple-system support RTL (`bus.sv`, `timer.sv`, `ram_*.sv`, `simulator_ctrl.sv`)
- Software support files for generating `.vmem` images if you want custom programs
