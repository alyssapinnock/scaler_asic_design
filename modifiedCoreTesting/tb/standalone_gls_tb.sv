// standalone_gls_tb.sv — Standalone Gate-Level Simulation Testbench
//
// Directly instantiates the netlist ibex_core with XOR share splitting,
// a simple memory model (loaded from VMEM), a register file, and
// bus transaction logging.
//
// This bypasses ibex_top / ibex_simple_system entirely, avoiding the
// complex RTL integration issues that caused x-propagation.
//
// Memory map (same as simple_system):
//   0x00100000 - 0x0012FFFF : RAM (192 KB, initialized from VMEM)
//   0x00130000 - 0x00137FFF : Stack (32 KB, in same RAM)
//   0x00020000 - 0x000203FF : Sim control (writes to 0x20000 = putchar,
//                              write 1 to 0x20008 = halt simulation)
//
// Boot address: 0x00100080

`timescale 1ns/1ps

module standalone_gls_tb;

  // =================================================================
  // Parameters
  // =================================================================
  parameter int    TimeoutCycles = 10_000_000;
  string SRAMInitFile;

  localparam int MEM_SIZE_WORDS = 49152;  // 192KB = 49152 words (matches simple_system RAM)
  localparam int MEM_ADDR_WIDTH = 16;     // log2(49152) ~ 16 bits of word address

  // =================================================================
  // Clock and Reset
  // =================================================================
  logic clk;
  logic rst_n;

  initial clk = 1'b0;
  always #1 clk = ~clk;  // 2ns period = 500 MHz (matches simple_system)

  initial begin
    rst_n = 1'b0;
    #8;
    rst_n = 1'b1;
    $display("[TB] Reset released at %0t", $time);
  end

  // =================================================================
  // Random bits (for share splitting)
  // =================================================================
  // Use constant 0 for simplicity — makes shares = (value, 0)
  // This means s0 = value ^ 0 = value, s1 = 0
  logic [15:0] randbits;
  assign randbits = 16'h0;

  // =================================================================
  // Netlist ibex_core ports
  // =================================================================

  // Instruction interface
  logic        instr_req;
  logic        instr_gnt;
  logic        instr_rvalid;
  logic [31:0] instr_addr;
  logic [31:0] instr_rdata;
  logic        instr_err;

  // Data interface
  logic        data_req;
  logic        data_gnt;
  logic        data_rvalid;
  logic        data_we;
  logic [3:0]  data_be;
  logic [31:0] data_addr;
  logic [31:0] data_wdata;
  logic [31:0] data_rdata;
  logic        data_err;

  // Register file interface (external in ibex_top)
  logic        dummy_instr_id;
  logic        dummy_instr_wb;
  logic [4:0]  rf_raddr_a;
  logic [4:0]  rf_raddr_b;
  logic [4:0]  rf_waddr_wb;
  logic        rf_we_wb;
  logic [31:0] rf_wdata_wb_ecc;
  logic [31:0] rf_rdata_a_ecc;
  logic [31:0] rf_rdata_b_ecc;

  // ICache RAM interface (tie off — ICache=0)
  logic [1:0]  ic_tag_req;
  logic        ic_tag_write;
  logic [7:0]  ic_tag_addr;
  logic [21:0] ic_tag_wdata;
  logic [21:0] ic_tag_rdata_0, ic_tag_rdata_1;
  logic [1:0]  ic_data_req;
  logic        ic_data_write;
  logic [7:0]  ic_data_addr;
  logic [63:0] ic_data_wdata;
  logic [63:0] ic_data_rdata_0, ic_data_rdata_1;
  logic        ic_scr_key_valid;
  logic        ic_scr_key_req;

  // Interrupt/debug inputs (active-low or tied off)
  logic        irq_software;
  logic        irq_timer;
  logic        irq_external;
  logic [14:0] irq_fast;
  logic        irq_nm;
  logic        irq_pending;
  logic        debug_req;

  // Misc outputs
  logic [31:0] crash_dump_current_pc, crash_dump_next_pc;
  logic [31:0] crash_dump_last_data_addr, crash_dump_exception_pc;
  logic [31:0] crash_dump_exception_addr;
  logic        double_fault_seen;
  logic [3:0]  fetch_enable;
  logic        alert_minor, alert_major_internal, alert_major_bus;
  logic [3:0]  core_busy;

  // Share-1 outputs (we'll ignore these since randbits=0 → s1 outputs = s0 outputs ^ 0)
  logic        instr_req_s1;
  logic [31:0] instr_addr_s1;
  logic        data_req_s1, data_we_s1;
  logic [3:0]  data_be_s1;
  logic [31:0] data_addr_s1, data_wdata_s1;
  logic        dummy_instr_id_s1, dummy_instr_wb_s1;
  logic [4:0]  rf_raddr_a_s1, rf_raddr_b_s1, rf_waddr_wb_s1;
  logic        rf_we_wb_s1;
  logic [31:0] rf_wdata_wb_ecc_s1;
  logic [1:0]  ic_tag_req_s1, ic_data_req_s1;
  logic        ic_tag_write_s1, ic_data_write_s1;
  logic [7:0]  ic_tag_addr_s1, ic_data_addr_s1;
  logic [21:0] ic_tag_wdata_s1;
  logic [63:0] ic_data_wdata_s1;
  logic        ic_scr_key_req_s1;
  logic        irq_pending_s1;
  logic [31:0] crash_dump_current_pc_s1, crash_dump_next_pc_s1;
  logic [31:0] crash_dump_last_data_addr_s1, crash_dump_exception_pc_s1;
  logic [31:0] crash_dump_exception_addr_s1;
  logic        double_fault_seen_s1;
  logic        alert_minor_s1, alert_major_internal_s1, alert_major_bus_s1;
  logic [3:0]  core_busy_s1;

  // =================================================================
  // Tie-offs for unused inputs
  // =================================================================
  assign irq_software   = 1'b0;
  assign irq_timer      = 1'b0;
  assign irq_external   = 1'b0;
  assign irq_fast        = 15'h0;
  assign irq_nm          = 1'b0;
  assign debug_req       = 1'b0;
  assign ic_scr_key_valid = 1'b0;
  assign instr_err       = 1'b0;
  assign data_err        = 1'b0;

  // ICache RAM tieoffs (ICache is disabled)
  assign ic_tag_rdata_0  = 22'h0;
  assign ic_tag_rdata_1  = 22'h0;
  assign ic_data_rdata_0 = 64'h0;
  assign ic_data_rdata_1 = 64'h0;

  // =================================================================
  // Fetch enable sequencing
  // =================================================================
  // IbexMuBiOn = 4'b0101, IbexMuBiOff = 4'b1010
  // Enable fetch immediately — matching the minimal test that works
  assign fetch_enable = 4'b0101;  // IbexMuBiOn — always on

  // =================================================================
  // Netlist ibex_core instantiation (with share splitting)
  // =================================================================
  // Since randbits=0: s0 = value ^ 0 = value, s1 = 0
  // So all _s1 inputs are just 0.

  ibex_core u_core (
    .clk_i          (clk),
    .rst_ni         (rst_n),

    // Primary inputs (share 0 = actual value when randbits=0)
    .hart_id_i      (32'h0),
    .boot_addr_i    (32'h00100000),     // boot_addr (PC starts at boot_addr + 0x80)
    .instr_req_o    (instr_req),
    .instr_gnt_i    (instr_gnt),
    .instr_rvalid_i (instr_rvalid),
    .instr_addr_o   (instr_addr),
    .instr_rdata_i  (instr_rdata),
    .instr_err_i    (instr_err),
    .data_req_o     (data_req),
    .data_gnt_i     (data_gnt),
    .data_rvalid_i  (data_rvalid),
    .data_we_o      (data_we),
    .data_be_o      (data_be),
    .data_addr_o    (data_addr),
    .data_wdata_o   (data_wdata),
    .data_rdata_i   (data_rdata),
    .data_err_i     (data_err),
    .dummy_instr_id_o(dummy_instr_id),
    .dummy_instr_wb_o(dummy_instr_wb),
    .rf_raddr_a_o   (rf_raddr_a),
    .rf_raddr_b_o   (rf_raddr_b),
    .rf_waddr_wb_o  (rf_waddr_wb),
    .rf_we_wb_o     (rf_we_wb),
    .rf_wdata_wb_ecc_o(rf_wdata_wb_ecc),
    .rf_rdata_a_ecc_i(rf_rdata_a_ecc),
    .rf_rdata_b_ecc_i(rf_rdata_b_ecc),
    .\ic_tag_rdata_i[1]  (ic_tag_rdata_1),
    .\ic_tag_rdata_i[0]  (ic_tag_rdata_0),
    .\ic_data_rdata_i[1] (ic_data_rdata_1),
    .\ic_data_rdata_i[0] (ic_data_rdata_0),
    .ic_tag_req_o   (ic_tag_req),
    .ic_tag_write_o (ic_tag_write),
    .ic_tag_addr_o  (ic_tag_addr),
    .ic_tag_wdata_o (ic_tag_wdata),
    .ic_data_req_o  (ic_data_req),
    .ic_data_write_o(ic_data_write),
    .ic_data_addr_o (ic_data_addr),
    .ic_data_wdata_o(ic_data_wdata),
    .ic_scr_key_valid_i(ic_scr_key_valid),
    .ic_scr_key_req_o(ic_scr_key_req),
    .irq_software_i (irq_software),
    .irq_timer_i    (irq_timer),
    .irq_external_i (irq_external),
    .irq_fast_i     (irq_fast),
    .irq_nm_i       (irq_nm),
    .irq_pending_o  (irq_pending),
    .debug_req_i    (debug_req),
    .\crash_dump_o[current_pc]     (crash_dump_current_pc),
    .\crash_dump_o[next_pc]        (crash_dump_next_pc),
    .\crash_dump_o[last_data_addr] (crash_dump_last_data_addr),
    .\crash_dump_o[exception_pc]   (crash_dump_exception_pc),
    .\crash_dump_o[exception_addr] (crash_dump_exception_addr),
    .double_fault_seen_o(double_fault_seen),
    .fetch_enable_i (fetch_enable),
    .alert_minor_o  (alert_minor),
    .alert_major_internal_o(alert_major_internal),
    .alert_major_bus_o(alert_major_bus),
    .core_busy_o    (core_busy),

    // Share-1 inputs: all zeros (randbits=0 → identity masking)
    .hart_id_i_s1       (32'h0),
    .boot_addr_i_s1     (32'h0),
    .instr_gnt_i_s1     (1'b0),
    .instr_rvalid_i_s1  (1'b0),
    .instr_rdata_i_s1   (32'h0),
    .instr_err_i_s1     (1'b0),
    .data_gnt_i_s1      (1'b0),
    .data_rvalid_i_s1   (1'b0),
    .data_rdata_i_s1    (32'h0),
    .data_err_i_s1      (1'b0),
    .rf_rdata_a_ecc_i_s1(32'h0),
    .rf_rdata_b_ecc_i_s1(32'h0),
    .\ic_tag_rdata_i_s1[1]  (22'h0),
    .\ic_tag_rdata_i_s1[0]  (22'h0),
    .\ic_data_rdata_i_s1[1] (64'h0),
    .\ic_data_rdata_i_s1[0] (64'h0),
    .ic_scr_key_valid_i_s1(1'b0),
    .irq_software_i_s1  (1'b0),
    .irq_timer_i_s1     (1'b0),
    .irq_external_i_s1  (1'b0),
    .irq_fast_i_s1      (15'h0),
    .irq_nm_i_s1        (1'b0),
    .debug_req_i_s1     (1'b0),
    .fetch_enable_i_s1  (4'b0000),

    // Share-1 outputs
    .instr_req_o_s1     (instr_req_s1),
    .instr_addr_o_s1    (instr_addr_s1),
    .data_req_o_s1      (data_req_s1),
    .data_we_o_s1       (data_we_s1),
    .data_be_o_s1       (data_be_s1),
    .data_addr_o_s1     (data_addr_s1),
    .data_wdata_o_s1    (data_wdata_s1),
    .dummy_instr_id_o_s1(dummy_instr_id_s1),
    .dummy_instr_wb_o_s1(dummy_instr_wb_s1),
    .rf_raddr_a_o_s1    (rf_raddr_a_s1),
    .rf_raddr_b_o_s1    (rf_raddr_b_s1),
    .rf_waddr_wb_o_s1   (rf_waddr_wb_s1),
    .rf_we_wb_o_s1      (rf_we_wb_s1),
    .rf_wdata_wb_ecc_o_s1(rf_wdata_wb_ecc_s1),
    .ic_tag_req_o_s1    (ic_tag_req_s1),
    .ic_tag_write_o_s1  (ic_tag_write_s1),
    .ic_tag_addr_o_s1   (ic_tag_addr_s1),
    .ic_tag_wdata_o_s1  (ic_tag_wdata_s1),
    .ic_data_req_o_s1   (ic_data_req_s1),
    .ic_data_write_o_s1 (ic_data_write_s1),
    .ic_data_addr_o_s1  (ic_data_addr_s1),
    .ic_data_wdata_o_s1 (ic_data_wdata_s1),
    .ic_scr_key_req_o_s1(ic_scr_key_req_s1),
    .irq_pending_o_s1   (irq_pending_s1),
    .\crash_dump_o_s1[current_pc]     (crash_dump_current_pc_s1),
    .\crash_dump_o_s1[next_pc]        (crash_dump_next_pc_s1),
    .\crash_dump_o_s1[last_data_addr] (crash_dump_last_data_addr_s1),
    .\crash_dump_o_s1[exception_pc]   (crash_dump_exception_pc_s1),
    .\crash_dump_o_s1[exception_addr] (crash_dump_exception_addr_s1),
    .double_fault_seen_o_s1(double_fault_seen_s1),
    .alert_minor_o_s1   (alert_minor_s1),
    .alert_major_internal_o_s1(alert_major_internal_s1),
    .alert_major_bus_o_s1(alert_major_bus_s1),
    .core_busy_o_s1     (core_busy_s1),

    .randbits           (randbits)
  );

  // =================================================================
  // Recombined outputs (s0 ^ s1 — with randbits=0, this is just s0)
  // =================================================================
  wire        instr_req_out   = instr_req ^ instr_req_s1;
  wire [31:0] instr_addr_out  = instr_addr ^ instr_addr_s1;
  wire        data_req_out    = data_req ^ data_req_s1;
  wire        data_we_out     = data_we ^ data_we_s1;
  wire [3:0]  data_be_out     = data_be ^ data_be_s1;
  wire [31:0] data_addr_out   = data_addr ^ data_addr_s1;
  wire [31:0] data_wdata_out  = data_wdata ^ data_wdata_s1;
  wire [4:0]  rf_raddr_a_out  = rf_raddr_a ^ rf_raddr_a_s1;
  wire [4:0]  rf_raddr_b_out  = rf_raddr_b ^ rf_raddr_b_s1;
  wire [4:0]  rf_waddr_wb_out = rf_waddr_wb ^ rf_waddr_wb_s1;
  wire        rf_we_wb_out    = rf_we_wb ^ rf_we_wb_s1;
  wire [31:0] rf_wdata_wb_ecc_out = rf_wdata_wb_ecc ^ rf_wdata_wb_ecc_s1;
  wire [3:0]  core_busy_out   = core_busy ^ core_busy_s1;

  // =================================================================
  // Register File (32 registers, 32-bit, x0 hardwired to 0)
  // =================================================================
  logic [31:0] regfile [32];

  initial begin
    for (int i = 0; i < 32; i++)
      regfile[i] = 32'h0;
  end

  // Read ports (combinational)
  assign rf_rdata_a_ecc = regfile[rf_raddr_a_out];
  assign rf_rdata_b_ecc = regfile[rf_raddr_b_out];

  // Write port (synchronous)
  always_ff @(posedge clk) begin
    if (rf_we_wb_out && rf_waddr_wb_out != 5'd0) begin
      regfile[rf_waddr_wb_out] <= rf_wdata_wb_ecc_out;
    end
  end

  // =================================================================
  // Memory Model (simple, single-cycle response)
  // =================================================================
  logic [31:0] mem [0:MEM_SIZE_WORDS-1];

  // Initialize memory from VMEM file
  initial begin
    // Initialize to 0 first
    for (int i = 0; i < MEM_SIZE_WORDS; i++)
      mem[i] = 32'h0;

    if ($value$plusargs("SRAMInitFile=%s", SRAMInitFile)) begin
      $readmemh(SRAMInitFile, mem);
      $display("[TB] Loaded memory from: %s", SRAMInitFile);
      $display("[TB] mem[0x00] = %08h (expect vector table entry)", mem[0]);
      $display("[TB] mem[0x20] = %08h (entry point area)", mem[32]);
    end else begin
      $display("[TB] WARNING: No SRAMInitFile specified!");
    end
  end

  // Helper: convert byte address to RAM word index
  // RAM starts at 0x100000, so word index = (byte_addr - 0x100000) >> 2
  function automatic logic [31:0] addr_to_word_idx(input logic [31:0] byte_addr);
    return (byte_addr - 32'h00100000) >> 2;
  endfunction

  function automatic logic is_ram_addr(input logic [31:0] addr);
    return (addr >= 32'h00100000) && (addr < 32'h00140000);
  endfunction

  function automatic logic is_sim_ctrl_addr(input logic [31:0] addr);
    return (addr >= 32'h00020000) && (addr < 32'h00020400);
  endfunction

  // =================================================================
  // Instruction fetch response
  // =================================================================
  // CRITICAL: Use raw s0 signals (instr_req, instr_addr) for rvalid/gnt
  // to avoid x-feedback. With randbits=0, s0 IS the actual value since
  // the internal mask starts at 0 (all FFs init to 0 via +xminitReg+0).
  // The recombined values (instr_req_out, instr_addr_out) may have
  // transient x if the XOR s1 output hasn't settled yet.

  // Always grant immediately (constant — avoids x feedback loop)
  assign instr_gnt = 1'b1;

  always @(posedge clk) begin
    if (!rst_n) begin
      instr_rvalid <= 1'b0;
      instr_rdata  <= 32'h0;
    end else begin
      // Use raw s0 req signal (not recombined) for rvalid
      instr_rvalid <= instr_req & instr_gnt;
      // Use recombined address for actual memory lookup
      if (instr_req_out && is_ram_addr(instr_addr_out))
        instr_rdata <= mem[addr_to_word_idx(instr_addr_out)];
      else
        instr_rdata <= 32'h00000013;  // NOP for unmapped or idle
    end
  end

  // =================================================================
  // Data access response
  // =================================================================
  // Same approach: use raw s0 signals for rvalid, recombined for data

  // Always grant immediately (constant — avoids x feedback loop)
  assign data_gnt = 1'b1;

  always @(posedge clk) begin
    if (!rst_n) begin
      data_rvalid <= 1'b0;
      data_rdata  <= 32'h0;
    end else begin
      // Use raw s0 req signal (not recombined) for rvalid
      data_rvalid <= data_req & data_gnt;

      if (data_req_out) begin
        if (data_we_out) begin
          // ---- WRITE ----
          if (is_ram_addr(data_addr_out)) begin
            // Byte-enable write to RAM
            automatic logic [31:0] idx = addr_to_word_idx(data_addr_out);
            automatic logic [31:0] old_val = mem[idx];
            automatic logic [31:0] new_val = old_val;
            if (data_be_out[0]) new_val[7:0]   = data_wdata_out[7:0];
            if (data_be_out[1]) new_val[15:8]  = data_wdata_out[15:8];
            if (data_be_out[2]) new_val[23:16] = data_wdata_out[23:16];
            if (data_be_out[3]) new_val[31:24] = data_wdata_out[31:24];
            mem[idx] = new_val;
          end
          data_rdata <= 32'h0;
        end else begin
          // ---- READ ----
          if (is_ram_addr(data_addr_out))
            data_rdata <= mem[addr_to_word_idx(data_addr_out)];
          else
            data_rdata <= 32'h0;
        end
      end else begin
        data_rdata <= 32'h0;
      end
    end
  end

  // =================================================================
  // Sim Control: character output + halt detection
  // =================================================================
  logic sim_finished;

  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n)
      sim_finished <= 1'b0;
    else if (data_rvalid && data_we_out && is_sim_ctrl_addr(data_addr_out)) begin
      case (data_addr_out[7:0])
        8'h00: begin  // SIM_CTRL_OUT — character output
          $write("%c", data_wdata_out[7:0]);
        end
        8'h08: begin  // SIM_CTRL_CTRL — halt
          if (data_wdata_out[0]) begin
            $display("\n[TB] *** Simulation halt requested at %0t ***", $time);
            sim_finished <= 1'b1;
          end
        end
      endcase
    end
  end

  // Finish 2 cycles after halt request (let pipeline drain)
  logic [1:0] finish_cnt;
  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n)
      finish_cnt <= 2'd0;
    else if (sim_finished) begin
      if (finish_cnt < 2'd2)
        finish_cnt <= finish_cnt + 1;
      else
        $finish;
    end
  end

  // =================================================================
  // Bus Transaction Logger
  // =================================================================
  integer bus_log_fd;
  string  bus_log_file;

  initial begin
    if (!$value$plusargs("bus_trace_file=%s", bus_log_file))
      bus_log_file = "gls_bus_trace.log";
    bus_log_fd = $fopen(bus_log_file, "w");
    if (!bus_log_fd)
      $fatal(1, "[TB] Cannot open bus trace file: %s", bus_log_file);
    $fwrite(bus_log_fd, "# GLS Bus Transaction Trace\n");
    $fwrite(bus_log_fd, "# Format: TIME TYPE ADDRESS DATA [BE]\n");
  end

  final begin
    if (bus_log_fd) $fclose(bus_log_fd);
  end

  always_ff @(posedge clk) begin
    if (rst_n) begin
      // Log instruction fetches
      if (instr_rvalid) begin
        $fwrite(bus_log_fd, "%0t IF 0x%08h 0x%08h\n",
                $time, instr_addr_out, instr_rdata);
      end
      // Log data writes
      if (data_rvalid && data_we_out) begin
        $fwrite(bus_log_fd, "%0t DW 0x%08h 0x%08h 0x%01h\n",
                $time, data_addr_out, data_wdata_out, data_be_out);
      end
      // Log data reads
      if (data_rvalid && !data_we_out) begin
        $fwrite(bus_log_fd, "%0t DR 0x%08h 0x%08h\n",
                $time, data_addr_out, data_rdata);
      end
    end
  end

  // =================================================================
  // Timeout Watchdog
  // =================================================================
  int timeout;
  initial begin
    if (!$value$plusargs("timeout_cycles=%d", timeout))
      timeout = TimeoutCycles;

    repeat (timeout) @(posedge clk);
    $display("[TB] *** TIMEOUT after %0d cycles at %0t ***", timeout, $time);
    $finish;
  end

  // =================================================================
  // Progress monitor
  // =================================================================
  longint unsigned cycle_count;
  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n)
      cycle_count <= 0;
    else begin
      cycle_count <= cycle_count + 1;
      if (cycle_count > 0 && (cycle_count % 100_000 == 0))
        $display("[TB] %0t: %0d cycles elapsed", $time, cycle_count);
    end
  end

  // =================================================================
  // Start-of-test banner + initial debug
  // =================================================================
  initial begin
    $display("[TB] ================================================");
    $display("[TB]  Standalone GLS Testbench");
    $display("[TB]  Netlist: ibex_core (gate-level)");
    $display("[TB]  Boot addr: 0x00100080");
    $display("[TB] ================================================");

    @(posedge rst_n);
    $display("[TB] Reset released at %0t", $time);

    // Quick debug: check first few cycles
    repeat (5) @(posedge clk);
    #0.1;
    $display("[TB] t=%0t: core_busy=%04b/%04b instr_req=%b/%b fetch_en=%04b",
      $time, core_busy, core_busy_s1, instr_req, instr_req_s1, fetch_enable);

    repeat (10) @(posedge clk);
    #0.1;
    $display("[TB] t=%0t: core_busy=%04b/%04b instr_req=%b/%b instr_addr=%08h fetch_en=%04b",
      $time, core_busy, core_busy_s1, instr_req, instr_req_s1, instr_addr, fetch_enable);
    $display("[TB] t=%0t: recombined: instr_req=%b instr_addr=%08h core_busy=%04b",
      $time, instr_req_out, instr_addr_out, core_busy_out);
  end

endmodule
