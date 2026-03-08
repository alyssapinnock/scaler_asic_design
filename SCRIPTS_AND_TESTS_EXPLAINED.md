# Detailed Explanation of Scripts and Tests

## Table of Contents
1. [Scripts Overview](#scripts-overview)
2. [What Each Script Does](#what-each-script-does)
3. [Tests That Run Through Your Design](#tests-that-run-through-your-design)
4. [Test Flow and Execution](#test-flow-and-execution)
5. [Understanding the Test Infrastructure](#understanding-the-test-infrastructure)

---

## Scripts Overview

I created 4 main executable scripts, each serving a specific purpose:

```
setup_verification.sh    → One-time setup and configuration
test_setup.sh           → Verify setup is correct
run_modified_rtl_sim.sh → Run pre-synthesis RTL simulation
run_gatelevel_sim.sh    → Run gate-level netlist simulation
```

---

## What Each Script Does

### 1. setup_verification.sh (12KB)

**Purpose:** One-time setup script that configures your environment for verification.

**What it does step-by-step:**

```bash
[Step 1] Check Directories
  ✓ Verifies scaler_asic_design/ exists
  ✓ Verifies ibex/ (DV environment) exists
  ✓ Verifies new_ibex_files/ (GNG module) exists
  → If any missing, exits with error

[Step 2] Check Required Files
  ✓ Core_netlist.v (your gate-level netlist)
  ✓ gate_level_wrapper.sv (wrapper I created)
  ✓ gng.v (random number generator)
  ✓ core_ibex_tb_top.sv (Ibex testbench)
  → If any missing, exits with error

[Step 3] Search for Standard Cell Library
  → Searches common locations: /cad, /tools, etc.
  → Looks for files containing XOR2X1, DFFRHQX1, etc.
  → If found: remembers location for later
  → If not found: warns you to add manually

[Step 4] Create ibex_dv_modified_rtl.f
  → Generates complete file list for RTL simulation
  → Includes all prim (primitive) modules
  → Points to modifiedCoreRTL/ instead of baseline rtl/
  → Includes GNG module
  → Includes all testbench infrastructure
  
  File structure:
    - Prim packages (counters, ECC, RAM, etc.)
    - Modified Ibex RTL files (ibex_alu.sv, ibex_core.sv, etc.)
    - ICache (uses baseline since not modified)
    - Top-level files (ibex_top.sv, ibex_top_tracing.sv)
    - DV infrastructure (memory interfaces, agents, tests, testbench)

[Step 5] Update ibex_dv_gatelevel.f
  → If standard cell library was found, adds it to file list
  → Otherwise skips this step

[Step 6] Create Run Scripts
  → Creates run_modified_rtl_sim.sh
  → Creates run_gatelevel_sim.sh
  → Makes them executable
  → Both scripts set environment variables and call xrun

[Final] Print Summary
  → Shows what was created
  → Gives next steps
  → Warns if manual steps needed (e.g., std cell library)
```

**When to run:** Once, after cloning/checking out the repository. Can be re-run if files get corrupted.

---

### 2. test_setup.sh (3.7KB)

**Purpose:** Quick verification that setup is correct before running simulations.

**What it does step-by-step:**

```bash
[Test 1] Check Required Files
  → Verifies all 7 key files exist:
    - gate_level_wrapper.sv
    - stdcell_models.v
    - ibex_dv_gatelevel.f
    - ibex_dv_modified_rtl.f
    - run_modified_rtl_sim.sh
    - run_gatelevel_sim.sh
    - Core_netlist.v

[Test 2] Check External Dependencies
  → Verifies /home/net/al663069/ws/ibex exists
  → Verifies GNG module exists

[Test 3] Check Simulator
  → Checks if xrun is in PATH
  → Shows xrun version if found
  → Warns if not found (need to source CAD tools)

[Test 4] Check File List Syntax
  → Verifies file lists use environment variables correctly
  → Ensures ${LOWRISC_IP_DIR} and ${PRJ_DIR} are present

[Test 5] Analyze Gate-Level Netlist
  → Counts total modules in netlist (should be ~16,000)
  → Verifies ibex_core module exists (should be 1)
  → Reports statistics

[Test 6] Check Standard Cell Coverage
  → Counts unique cell types in netlist
  → Counts cell models provided
  → Verifies sufficient coverage (need at least 10)

[Final] Print Summary
  → Shows pass/fail status
  → Provides quick start commands
  → Points to documentation
```

**When to run:** 
- Before first simulation
- After making changes to file lists
- When troubleshooting issues
- After system updates/reboots

**Output interpretation:**
```
✓ = Pass (green checkmark in terminal)
✗ = Fail (red X)
⚠ = Warning (yellow warning)
```

---

### 3. run_modified_rtl_sim.sh (668 bytes)

**Purpose:** Run pre-synthesis RTL simulation (Goal 2).

**What it does:**

```bash
Step 1: Set Environment Variables
  export PRJ_DIR=/home/net/al663069/ws/ibex
  export LOWRISC_IP_DIR=/home/net/al663069/ws/ibex/vendor/lowrisc_ip
  → These tell the file list where to find Ibex source files

Step 2: Change to Testbench Directory
  cd /home/net/al663069/ws/ibex/dv/uvm/core_ibex
  → xrun needs to run from here for relative paths

Step 3: Launch xrun with Configuration
  xrun \
    -f /path/to/ibex_dv_modified_rtl.f     # File list
    +UVM_TESTNAME=core_ibex_base_test      # Which test to run
    +UVM_VERBOSITY=UVM_LOW                 # Logging level
    -timescale 1ns/1ps                     # Time units
    -access +rw                             # Enable read/write access
    -define BOOT_ADDR=32'h80000000         # Boot address
    -define DM_ADDR=...                    # Debug module address
    -uvmhome CDNS-1.2                      # UVM library version
    "$@"                                    # Pass through extra args

Step 4: Simulation Runs
  → Compiles all RTL and testbench files
  → Elaborates design
  → Runs test
  → Generates traces and logs
  → Reports pass/fail
```

**Key xrun options explained:**

- `-f <file>`: Read file list (contains all source files)
- `+UVM_TESTNAME=<test>`: Specifies which UVM test to run
- `+UVM_VERBOSITY=<level>`: Controls log verbosity (UVM_LOW, UVM_MEDIUM, UVM_HIGH)
- `-timescale 1ns/1ps`: Time unit is 1ns, resolution is 1ps
- `-access +rw`: Allows waveform dumping and signal probing
- `-define <macro>=<value>`: Sets Verilog `define macros
- `-uvmhome CDNS-1.2`: Uses Cadence UVM 1.2 library
- `-gui`: (if added) Opens GUI for interactive debugging
- `-input "<tcl_cmd>"`: (if added) Executes TCL commands

**Extra arguments you can pass:**

```bash
# Run with GUI
./run_modified_rtl_sim.sh -gui

# Run specific test
./run_modified_rtl_sim.sh +UVM_TESTNAME=core_ibex_irq_wfi_test

# Enable waveforms
./run_modified_rtl_sim.sh -gui -input "@database -open waves -default"

# Increase verbosity
./run_modified_rtl_sim.sh +UVM_VERBOSITY=UVM_HIGH

# Combine options
./run_modified_rtl_sim.sh -gui +UVM_TESTNAME=core_ibex_nested_irq_test +UVM_VERBOSITY=UVM_MEDIUM
```

---

### 4. run_gatelevel_sim.sh (783 bytes)

**Purpose:** Run gate-level netlist simulation (Goal 1 - Priority).

**What it does:**

```bash
Step 1: Set Environment Variables
  (Same as run_modified_rtl_sim.sh)

Step 2: Change to Testbench Directory
  (Same as run_modified_rtl_sim.sh)

Step 3: Launch xrun with Gate-Level Configuration
  xrun \
    -f /path/to/ibex_dv_gatelevel.f        # Gate-level file list
    +UVM_TESTNAME=core_ibex_base_test      # Which test to run
    +UVM_VERBOSITY=UVM_LOW                 # Logging level
    -timescale 1ns/1ps                     # Time units
    -access +rw                             # Enable read/write access
    -define FUNCTIONAL                     # Functional sim (no timing)
    -define BOOT_ADDR=32'h80000000         # Boot address
    +delay_mode_zero                       # Zero delay mode
    +no_notifier                           # Disable timing notifiers
    +notimingcheck                         # Skip timing checks
    -uvmhome CDNS-1.2                      # UVM library version
    "$@"                                    # Pass through extra args

Step 4: Simulation Runs
  (Same as run_modified_rtl_sim.sh)
```

**Differences from RTL simulation:**

1. **Uses different file list:** `ibex_dv_gatelevel.f` instead of `ibex_dv_modified_rtl.f`
   - Includes standard cell models
   - Includes gate-level netlist
   - Includes wrapper

2. **Additional timing control flags:**
   - `-define FUNCTIONAL`: Tells cells to use functional models, not timing
   - `+delay_mode_zero`: All delays are zero (no propagation delay)
   - `+no_notifier`: Disables timing violation notifiers
   - `+notimingcheck`: Skips all timing checks

3. **Why these flags matter:**
   - Gate-level netlists have timing annotations
   - Without these flags, you'd see many timing violations
   - For functional verification, we don't care about timing
   - These flags make it behave like RTL simulation

**Same extra arguments work:**

```bash
# Run with GUI
./run_gatelevel_sim.sh -gui

# Run specific test
./run_gatelevel_sim.sh +UVM_TESTNAME=core_ibex_irq_wfi_test

# Enable waveforms
./run_gatelevel_sim.sh -gui -input "@database -open waves -default"
```

---

## Tests That Run Through Your Design

The Ibex DV environment uses UVM (Universal Verification Methodology) with multiple test classes. When you run a simulation, ONE test runs.

### Test Hierarchy

```
uvm_test (base UVM class)
  └── core_ibex_base_test (Ibex base test)
      ├── core_ibex_csr_test (CSR access test)
      ├── core_ibex_pc_intg_test (PC integrity test)
      ├── core_ibex_rf_intg_test (Register file integrity test)
      ├── core_ibex_rf_ctrl_intg_test (RF control integrity test)
      ├── core_ibex_ram_intg_test (RAM integrity test)
      ├── core_ibex_icache_intg_test (ICache integrity test)
      ├── core_ibex_reset_test (Reset test)
      ├── core_ibex_perf_test (Performance test)
      └── core_ibex_debug_intr_basic_test (Debug/interrupt basic test)
          └── core_ibex_directed_test (Base for directed tests)
              ├── core_ibex_interrupt_instr_test (Interrupt during instruction)
              ├── core_ibex_irq_wfi_test (IRQ with WFI instruction)
              ├── core_ibex_irq_csr_test (IRQ with CSR access)
              ├── core_ibex_irq_in_debug_test (IRQ during debug mode)
              ├── core_ibex_debug_in_irq_test (Debug during IRQ)
              ├── core_ibex_nested_irq_test (Nested interrupts)
              ├── core_ibex_debug_instr_test (Debug during instruction)
              ├── core_ibex_debug_wfi_test (Debug with WFI)
              └── core_ibex_debug_csr_test (Debug with CSR access)
```

### Test Details

#### 1. **core_ibex_base_test** (Default)
**What it tests:**
- Basic processor functionality
- Random instruction generation using RISCV-DV generator
- Random interrupts and debug requests
- Memory accesses (load/store)
- Exception handling
- CSR (Control/Status Register) access

**How it works:**
1. Generates random RISC-V assembly program
2. Compiles to binary
3. Loads into memory
4. Runs on Ibex core
5. Co-simulates with Spike ISS (Instruction Set Simulator)
6. Compares Ibex behavior with golden reference (Spike)
7. Checks for mismatches

**Duration:** ~100,000 - 500,000 instructions

**Good for:** 
- Initial smoke test
- Verifying basic functionality
- Finding functional bugs

---

#### 2. **core_ibex_irq_wfi_test** (Interrupt Latency)
**What it tests:**
- Interrupt behavior with WFI (Wait For Interrupt) instruction
- Interrupt latency from assertion to handler entry
- Wake-up behavior
- Interrupt priority

**How it works:**
1. Runs program with WFI instructions
2. Asserts interrupts at specific times
3. Measures time from IRQ assertion to handler entry
4. Verifies correct interrupt vector
5. Checks CSR updates (mstatus, mepc, mcause)

**Duration:** ~10,000 - 50,000 instructions

**Good for:**
- **YOUR GOAL 2**: Measuring interrupt latency
- Testing power management (WFI)
- Verifying interrupt timing

---

#### 3. **core_ibex_nested_irq_test** (Nested Interrupts)
**What it tests:**
- Interrupt occurring during interrupt handler
- Nested interrupt handling
- Stack management
- Context save/restore

**How it works:**
1. Runs program that enables nested interrupts
2. Asserts first interrupt
3. While in handler, asserts second interrupt
4. Verifies proper nesting behavior
5. Checks return to correct context

**Duration:** ~10,000 - 50,000 instructions

**Good for:**
- **YOUR GOAL 2**: Complex interrupt scenarios
- Testing interrupt priority
- Stress testing interrupt logic

---

#### 4. **core_ibex_irq_csr_test** (IRQ with CSR)
**What it tests:**
- Interrupt during CSR instruction execution
- CSR atomicity
- Interrupt masking via CSR

**How it works:**
1. Executes CSR read/write instructions
2. Asserts interrupt during CSR operations
3. Verifies CSR consistency
4. Checks interrupt masking

**Duration:** ~10,000 - 50,000 instructions

**Good for:**
- **YOUR GOAL 2**: Interrupt latency with CSR operations
- Testing CSR correctness

---

#### 5. **core_ibex_interrupt_instr_test** (Interrupt During Instruction)
**What it tests:**
- Interrupt during various instruction types
- Instruction atomicity
- Pipeline behavior

**How it works:**
1. Executes different instruction types
2. Asserts interrupt at various pipeline stages
3. Verifies instruction completion or restart
4. Checks PC correctness

**Duration:** ~10,000 - 50,000 instructions

**Good for:**
- **YOUR GOAL 2**: Worst-case interrupt latency
- Testing pipeline behavior

---

#### 6. **core_ibex_debug_intr_basic_test** (Debug and Interrupts)
**What it tests:**
- Debug request handling
- Debug mode entry/exit
- Interaction between debug and interrupts

**How it works:**
1. Runs normal program
2. Asserts debug request
3. Enters debug mode
4. Executes debug program
5. Returns to normal mode

**Duration:** ~50,000 - 100,000 instructions

**Good for:**
- Testing debug infrastructure
- Verifying debug/interrupt interaction

---

#### 7. **core_ibex_pc_intg_test** (PC Integrity)
**What it tests:**
- Program Counter (PC) glitch detection
- Security features
- Alert generation

**How it works:**
1. Runs normal program
2. Intentionally glitches PC value
3. Verifies alert is generated
4. Checks error handling

**Duration:** ~5,000 - 10,000 instructions

**Good for:**
- Testing security features
- **May not work with gate-level** (glitch injection is RTL-specific)

---

#### 8. **core_ibex_rf_intg_test** (Register File Integrity)
**What it tests:**
- Register file ECC (Error Correcting Code)
- Error detection/correction
- Alert generation on errors

**How it works:**
1. Runs normal program
2. Injects errors into register file
3. Verifies ECC detects errors
4. Checks alerts are generated

**Duration:** ~5,000 - 10,000 instructions

**Good for:**
- Testing ECC/parity
- **May not work with gate-level** (error injection is RTL-specific)

---

### Which Tests Are Relevant for Your Goals?

#### Goal 1: Gate-Level Netlist Functional Verification

**Recommended tests:**
1. ✅ **core_ibex_base_test** - Must pass, verifies basic functionality
2. ✅ **core_ibex_irq_wfi_test** - Tests interrupts (important)
3. ✅ **core_ibex_nested_irq_test** - Tests complex interrupt scenarios
4. ✅ **core_ibex_irq_csr_test** - Tests interrupt with CSR
5. ✅ **core_ibex_interrupt_instr_test** - Tests interrupt timing
6. ❌ **core_ibex_pc_intg_test** - Skip (glitch injection won't work)
7. ❌ **core_ibex_rf_intg_test** - Skip (error injection won't work)
8. ❌ **core_ibex_debug_intr_basic_test** - Skip if debug not used

**Why skip some tests:**
- Integrity tests (pc_intg, rf_intg) inject faults at RTL level
- Gate-level netlist doesn't have the same signal hierarchy
- These tests will fail or hang on gate-level

---

#### Goal 2: Pre-Synthesis RTL Interrupt Latency

**Recommended tests for latency measurement:**
1. ✅ **core_ibex_irq_wfi_test** - Best for measuring latency (simple scenario)
2. ✅ **core_ibex_interrupt_instr_test** - Measures latency during instructions
3. ✅ **core_ibex_nested_irq_test** - Measures nested interrupt latency
4. ✅ **core_ibex_irq_csr_test** - Measures latency during CSR operations

**How to measure latency:**
These tests don't automatically report latency. You need to:

**Method 1: Parse Trace Logs**
```bash
# Run test
./run_modified_rtl_sim.sh +UVM_TESTNAME=core_ibex_irq_wfi_test

# Find interrupt events in trace
grep "irq" trace_core_*.log
grep "interrupt" trace_core_*.log
grep "mtvec" trace_core_*.log  # Interrupt vector

# Look for patterns like:
# Time: 123456 - IRQ asserted
# Time: 123460 - Jump to mtvec (interrupt handler)
# Latency = 123460 - 123456 = 4 cycles
```

**Method 2: Add Custom Monitor (More Work)**
You would need to create a SystemVerilog monitor that:
1. Watches `irq_timer_i`, `irq_external_i`, etc.
2. Records assertion time
3. Watches PC to detect jump to interrupt vector
4. Records handler entry time
5. Calculates and reports latency

---

## Test Flow and Execution

### What Happens When You Run a Test

```
Step 1: Compilation Phase
  ├─ xrun reads file list (ibex_dv_*.f)
  ├─ Compiles all SystemVerilog/Verilog files
  ├─ Checks syntax
  ├─ Builds dependency tree
  └─ Creates compiled snapshot

Step 2: Elaboration Phase
  ├─ Instantiates modules
  ├─ Connects signals
  ├─ Resolves parameters
  ├─ Creates simulation model
  └─ Initializes UVM

Step 3: UVM Initialization
  ├─ Creates test object (specified by +UVM_TESTNAME)
  ├─ Creates environment (env)
  ├─ Creates agents (memory, interrupt, etc.)
  ├─ Connects interfaces
  └─ Runs build_phase(), connect_phase(), etc.

Step 4: Test Execution (run_phase)
  ├─ Reset DUT
  ├─ Generate random program (using RISCV-DV)
  ├─ Compile program to binary
  ├─ Load binary into memory
  ├─ Start Spike ISS (if co-simulation enabled)
  ├─ Release reset
  ├─ DUT starts executing
  ├─ Agents monitor bus activity
  ├─ Interrupt/debug stimuli injected randomly
  ├─ Compare DUT behavior with Spike
  └─ Test runs until program completes or timeout

Step 5: Checking Phase
  ├─ Compare instruction traces (DUT vs Spike)
  ├─ Check for mismatches
  ├─ Verify no errors occurred
  └─ Check assertions didn't fire

Step 6: Reporting Phase
  ├─ Print test summary
  ├─ Report pass/fail
  ├─ Generate coverage reports (if enabled)
  ├─ Save traces and logs
  └─ Exit simulation

Duration: 30 seconds to 10 minutes depending on test
```

---

## Understanding the Test Infrastructure

### Memory Model
The testbench includes memory models that respond to:
- Instruction fetches (instr_req_o, instr_addr_o, instr_rdata_i)
- Data accesses (data_req_o, data_addr_o, data_wdata_o, data_rdata_i)

The memory is pre-loaded with:
- Test program (random or directed assembly)
- Interrupt handlers
- Exception handlers
- Stack space

### Interrupt Agent
Randomly asserts interrupts:
- `irq_software_i` - Software interrupt
- `irq_timer_i` - Timer interrupt
- `irq_external_i` - External interrupt
- `irq_fast_i[14:0]` - Fast interrupts
- `irq_nm_i` - Non-maskable interrupt

Timing is randomized but controllable via test parameters.

### Spike Co-Simulation
Spike is a RISC-V ISS (Instruction Set Simulator) that acts as golden reference:
1. Every instruction executed by Ibex is also executed by Spike
2. Results are compared (PC, register values, memory writes)
3. Any mismatch triggers test failure
4. Provides high confidence in functional correctness

**Note:** Co-simulation adds overhead but provides strong verification.

---

## Quick Reference: Running Specific Tests

### For Goal 1 (Gate-Level):

```bash
# Basic functionality test (START HERE)
./run_gatelevel_sim.sh +UVM_TESTNAME=core_ibex_base_test

# Interrupt tests
./run_gatelevel_sim.sh +UVM_TESTNAME=core_ibex_irq_wfi_test
./run_gatelevel_sim.sh +UVM_TESTNAME=core_ibex_nested_irq_test
./run_gatelevel_sim.sh +UVM_TESTNAME=core_ibex_irq_csr_test
```

### For Goal 2 (Modified RTL + Interrupt Latency):

```bash
# Basic test first
./run_modified_rtl_sim.sh +UVM_TESTNAME=core_ibex_base_test

# Interrupt latency tests
./run_modified_rtl_sim.sh +UVM_TESTNAME=core_ibex_irq_wfi_test
./run_modified_rtl_sim.sh +UVM_TESTNAME=core_ibex_interrupt_instr_test
./run_modified_rtl_sim.sh +UVM_TESTNAME=core_ibex_nested_irq_test

# Then parse trace_core_*.log for latency data
```

### With GUI for Debugging:

```bash
# Add -gui flag
./run_modified_rtl_sim.sh -gui +UVM_TESTNAME=core_ibex_irq_wfi_test

# With waveforms
./run_modified_rtl_sim.sh -gui -input "@database -open waves -default" +UVM_TESTNAME=core_ibex_irq_wfi_test
```

---

## Summary

**Scripts:**
1. **setup_verification.sh** - Run once to configure environment
2. **test_setup.sh** - Run before simulations to verify setup
3. **run_modified_rtl_sim.sh** - Run pre-synthesis RTL (Goal 2)
4. **run_gatelevel_sim.sh** - Run gate-level netlist (Goal 1)

**Tests:**
- Each simulation runs ONE UVM test
- Default is `core_ibex_base_test` (random instruction test)
- For interrupt latency, use interrupt-specific tests
- Some tests won't work on gate-level (integrity tests)

**Test Execution:**
- Compile → Elaborate → Initialize → Run → Check → Report
- Tests generate random programs and compare against Spike ISS
- Duration: 30 seconds to 10 minutes per test
- Output: trace logs, xrun.log, pass/fail status

**For Your Goals:**
- **Goal 1:** Use base_test, irq tests on gate-level
- **Goal 2:** Use irq tests on RTL, parse traces for latency
