// gls_simple_system_tb.sv — GLS Verification Testbench
//
// Wraps the existing ibex_simple_system (which uses ibex_core_wrapper + config cfg
// to bind the gate-level netlist) and adds:
//   - Bus-transaction logging (instruction fetches + data writes)
//   - Configurable timeout watchdog
//   - Pass/fail detection from simulator_ctrl ($finish)
//
// The actual DUT hierarchy is:
//   gls_simple_system_tb
//     └── ibex_simple_system  (generates its own clk_sys / rst_sys_n internally)
//           └── ibex_top_tracing
//                 └── ibex_top
//                       └── ibex_core_wrapper
//                             └── u_masked  ← config cfg binds coreLibCMO.ibex_core (netlist)
//
// ibex_simple_system's SRAMInitFile parameter is set at compile time via:
//   xrun -defparam gls_simple_system_tb.u_simple_sys.SRAMInitFile=<path.vmem>
//
// Memory loading uses $readmemh inside prim_generic_ram_2p (via prim_util_memload.svh).
// Test termination happens when software writes 1 to SIM_CTRL_CTRL (0x20008),
// which triggers $finish inside simulator_ctrl.sv.

`timescale 1ns/1ps

module gls_simple_system_tb;

  // ===========================
  // DUT: ibex_simple_system
  // ===========================
  // In the non-VERILATOR path (our case), ibex_simple_system generates its
  // own clock (clk_sys, 2ns period = 500MHz) and reset (rst_sys_n, released
  // after 8ns).  IO_CLK and IO_RST_N inputs are unused — we tie them off.

  ibex_simple_system u_simple_sys (
    .IO_CLK   (1'b0),
    .IO_RST_N (1'b0)
  );

  // Tap the DUT's internal clock and reset for our monitors.
  // These are declared inside ibex_simple_system as:
  //   logic clk_sys = 1'b0, rst_sys_n;
  wire clk_sys   = u_simple_sys.clk_sys;
  wire rst_sys_n = u_simple_sys.rst_sys_n;

  // ===========================
  // Bus Transaction Logger
  // ===========================
  // Monitor bus signals inside ibex_simple_system via hierarchical references.
  // Captures instruction fetches (PC + word) and data read/write transactions.
  // This is the primary verification artifact — compare against a golden trace
  // from the unmasked RTL or Spike to verify functional correctness.

  integer bus_log_fd;
  string  bus_log_file;

  initial begin
    if (!$value$plusargs("bus_trace_file=%s", bus_log_file))
      bus_log_file = "gls_bus_trace.log";
    bus_log_fd = $fopen(bus_log_file, "w");
    if (!bus_log_fd)
      $fatal(1, "[GLS-TB] Cannot open bus trace file: %s", bus_log_file);
    $fwrite(bus_log_fd, "# GLS Bus Transaction Trace\n");
    $fwrite(bus_log_fd, "# Format: TIME TYPE ADDRESS DATA [BE]\n");
    $fwrite(bus_log_fd, "#   IF = Instruction Fetch, DR = Data Read, DW = Data Write\n");
    $fwrite(bus_log_fd, "#-----------------------------------------------------------\n");
  end

  final begin
    if (bus_log_fd) $fclose(bus_log_fd);
  end

  // Instruction fetch logger — fires when instr_rvalid is asserted
  always_ff @(posedge clk_sys) begin
    if (rst_sys_n && u_simple_sys.instr_rvalid) begin
      $fwrite(bus_log_fd, "%0t IF 0x%08h 0x%08h\n",
              $time,
              u_simple_sys.instr_addr,
              u_simple_sys.instr_rdata);
    end
  end

  // Data write logger — fires when host makes a write request that is granted
  always_ff @(posedge clk_sys) begin
    if (rst_sys_n &&
        u_simple_sys.host_req[0] && u_simple_sys.host_gnt[0] &&
        u_simple_sys.host_we[0]) begin
      $fwrite(bus_log_fd, "%0t DW 0x%08h 0x%08h 0x%01h\n",
              $time,
              u_simple_sys.host_addr[0],
              u_simple_sys.host_wdata[0],
              u_simple_sys.host_be[0]);
    end
  end

  // Data read logger — fires when a read response comes back
  always_ff @(posedge clk_sys) begin
    if (rst_sys_n &&
        u_simple_sys.host_rvalid[0] && !u_simple_sys.host_we[0]) begin
      $fwrite(bus_log_fd, "%0t DR 0x%08h 0x%08h\n",
              $time,
              u_simple_sys.host_addr[0],
              u_simple_sys.host_rdata[0]);
    end
  end

  // ===========================
  // Timeout Watchdog
  // ===========================
  // Normal termination: software writes to 0x20008 → simulator_ctrl → $finish.
  // This is a safety net in case the test hangs.

  int timeout_cycles;

  initial begin
    if (!$value$plusargs("timeout_cycles=%d", timeout_cycles))
      timeout_cycles = 10_000_000;  // generous default for GLS (slow simulation)

    repeat (timeout_cycles) @(posedge clk_sys);
    $display("[GLS-TB] *** TIMEOUT after %0d cycles at %0t ***", timeout_cycles, $time);
    $display("[GLS-TB] Test did not terminate via simulator_ctrl — possible hang.");
    $finish;
  end

  // ===========================
  // Progress Monitor
  // ===========================
  // Print periodic status so we know the simulation is alive
  // (GLS is much slower than RTL sim)

  longint unsigned cycle_count;

  always_ff @(posedge clk_sys or negedge rst_sys_n) begin
    if (!rst_sys_n) begin
      cycle_count <= 0;
    end else begin
      cycle_count <= cycle_count + 1;
      if (cycle_count > 0 && (cycle_count % 100_000 == 0)) begin
        $display("[GLS-TB] %0t: %0d cycles elapsed", $time, cycle_count);
      end
    end
  end

  // ===========================
  // Start-of-test banner
  // ===========================
  initial begin
    $display("[GLS-TB] ================================================");
    $display("[GLS-TB]  Gate-Level Simulation Testbench");
    $display("[GLS-TB]  DUT: ibex_simple_system + config-bound netlist");
    $display("[GLS-TB] ================================================");

    // Wait for internal reset to release
    @(posedge rst_sys_n);
    $display("[GLS-TB] Reset released at %0t", $time);
  end

  // ===========================
  // Signal Debug Probe
  // ===========================
  // Dump critical signals for the first 30 clock edges after reset
  int dbg_cnt;
  initial begin
    // Probe during reset
    #1;
    $display("[DBG-RST] t=%0t rst_sys_n=%b ibex_top.rst_ni=%b test_en_i=%b",
      $time, rst_sys_n,
      u_simple_sys.u_top.u_ibex_top.rst_ni,
      u_simple_sys.u_top.u_ibex_top.test_en_i);
    $display("[DBG-RST] core_busy_q=%04b clock_en=%b gated_clk=%b",
      u_simple_sys.u_top.u_ibex_top.core_busy_q,
      u_simple_sys.u_top.u_ibex_top.clock_en,
      u_simple_sys.u_top.u_ibex_top.clk);

    // Check ibex_top's clock gate output
    $display("[DBG-RST] ibex_top.clock_gate.clk_o=%b",
      u_simple_sys.u_top.u_ibex_top.core_clock_gate_i.clk_o);

    @(posedge rst_sys_n);   // wait for reset release
    #1;
    $display("[DBG-RST] After reset release+1ps: core_busy_q=%04b clock_en=%b gated_clk=%b",
      u_simple_sys.u_top.u_ibex_top.core_busy_q,
      u_simple_sys.u_top.u_ibex_top.clock_en,
      u_simple_sys.u_top.u_ibex_top.clk);

    // Probe deeper: check a specific FF inside the netlist
    // Check ibex_top level signals
    $display("[DBG-RST] ibex_top.core_busy_d=%04b",
      u_simple_sys.u_top.u_ibex_top.core_busy_d);
    $display("[DBG-RST] ibex_top.u_ibex_core.core_busy_o=%04b",
      u_simple_sys.u_top.u_ibex_top.u_ibex_core.core_busy_o);
    $display("[DBG-RST] ibex_top.u_ibex_core.irq_pending_o=%b",
      u_simple_sys.u_top.u_ibex_top.u_ibex_core.irq_pending_o);
    // Check the wrapper's input/output
    $display("[DBG-RST] wrapper.instr_req_o=%b data_req_o=%b",
      u_simple_sys.u_top.u_ibex_top.u_ibex_core.instr_req_o,
      u_simple_sys.u_top.u_ibex_top.u_ibex_core.data_req_o);

    dbg_cnt = 0;
    repeat (20) begin
      @(negedge clk_sys);  // sample at negedge for cleaner view
      dbg_cnt++;
      $display("[DBG %0d] t=%0t | clock_en=%b gated_clk=%b core_busy_q=%04b irq_pending=%b | wrapper.clk_i=%b instr_req=%b",
        dbg_cnt, $time,
        u_simple_sys.u_top.u_ibex_top.clock_en,
        u_simple_sys.u_top.u_ibex_top.clk,
        u_simple_sys.u_top.u_ibex_top.core_busy_q,
        u_simple_sys.u_top.u_ibex_top.irq_pending,
        u_simple_sys.u_top.u_ibex_top.u_ibex_core.clk_i,
        u_simple_sys.instr_req
      );
      // Deeper probe into netlist port values
      $display("         | NET: rst_ni=%b clk_i=%b randbits=%04h fetch_en=%04b fetch_en_s1=%04b",
        u_simple_sys.u_top.u_ibex_top.u_ibex_core.u_masked.rst_ni,
        u_simple_sys.u_top.u_ibex_top.u_ibex_core.u_masked.clk_i,
        u_simple_sys.u_top.u_ibex_top.u_ibex_core.randbits,
        u_simple_sys.u_top.u_ibex_top.u_ibex_core.u_masked.fetch_enable_i,
        u_simple_sys.u_top.u_ibex_top.u_ibex_core.u_masked.fetch_enable_i_s1
      );
      $display("         | NET out: instr_req_o=%b/%b core_busy_o=%04b/%04b irq_pending=%b/%b",
        u_simple_sys.u_top.u_ibex_top.u_ibex_core.u_masked.instr_req_o,
        u_simple_sys.u_top.u_ibex_top.u_ibex_core.u_masked.instr_req_o_s1,
        u_simple_sys.u_top.u_ibex_top.u_ibex_core.u_masked.core_busy_o,
        u_simple_sys.u_top.u_ibex_top.u_ibex_core.u_masked.core_busy_o_s1,
        u_simple_sys.u_top.u_ibex_top.u_ibex_core.u_masked.irq_pending_o,
        u_simple_sys.u_top.u_ibex_top.u_ibex_core.u_masked.irq_pending_o_s1
      );
      // Check internal wires: ctrl_busy, if_busy, lsu_busy
      $display("         | NET int: ctrl_busy=%b if_busy=%b lsu_busy=%b instr_req_int=%b",
        u_simple_sys.u_top.u_ibex_top.u_ibex_core.u_masked.ctrl_busy,
        u_simple_sys.u_top.u_ibex_top.u_ibex_core.u_masked.if_busy,
        u_simple_sys.u_top.u_ibex_top.u_ibex_core.u_masked.lsu_busy,
        u_simple_sys.u_top.u_ibex_top.u_ibex_core.u_masked.instr_req_int
      );
      // Check regfile data coming into the wrapper
      $display("         | RF: rdata_a=%08h rdata_b=%08h we=%b waddr=%02h",
        u_simple_sys.u_top.u_ibex_top.u_ibex_core.rf_rdata_a_ecc_i,
        u_simple_sys.u_top.u_ibex_top.u_ibex_core.rf_rdata_b_ecc_i,
        u_simple_sys.u_top.u_ibex_top.u_ibex_core.rf_we_wb_o,
        u_simple_sys.u_top.u_ibex_top.u_ibex_core.rf_waddr_wb_o
      );
      // Check wrapper's recombined outputs
      $display("         | WRAP: instr_req=%b instr_addr=%08h data_req=%b core_busy=%04b",
        u_simple_sys.u_top.u_ibex_top.u_ibex_core.instr_req_o,
        u_simple_sys.u_top.u_ibex_top.u_ibex_core.instr_addr_o,
        u_simple_sys.u_top.u_ibex_top.u_ibex_core.data_req_o,
        u_simple_sys.u_top.u_ibex_top.u_ibex_core.core_busy_o
      );
    end
    $display("[DBG] --- End of signal dump ---");
  end

endmodule
