// standalone_v2_tb.sv — Standalone GLS test, built from working minimal_netlist_tb
// Key approach: use exactly the same coding style as the minimal TB that works,
// then add memory and register file on top.
`timescale 1ns/1ps

module standalone_v2_tb;

  // ================================================================
  // Clock and Reset — identical to minimal_netlist_tb
  // ================================================================
  reg clk_i;
  reg rst_ni;

  initial clk_i = 0;
  always #1 clk_i = ~clk_i;

  // ================================================================
  // VMEM loading
  // ================================================================
  string SRAMInitFile;

  // ================================================================
  // All ibex_core inputs — reg types with initial values
  // ================================================================
  reg  [31:0] hart_id_i       = 32'h0;
  reg  [31:0] boot_addr_i     = 32'h00100000;   // core adds 0x80 internally
  reg         instr_gnt_i     = 1'b1;            // always grant
  reg         instr_rvalid_i  = 1'b0;
  reg  [31:0] instr_rdata_i   = 32'h00000013;   // NOP
  reg         instr_err_i     = 1'b0;
  reg         data_gnt_i      = 1'b1;            // always grant
  reg         data_rvalid_i   = 1'b0;
  reg  [31:0] data_rdata_i    = 32'h0;
  reg         data_err_i      = 1'b0;
  reg  [31:0] rf_rdata_a_ecc_i = 32'h0;
  reg  [31:0] rf_rdata_b_ecc_i = 32'h0;
  reg  [21:0] ic_tag_rdata_i_1 = 22'h0;
  reg  [21:0] ic_tag_rdata_i_0 = 22'h0;
  reg  [63:0] ic_data_rdata_i_1 = 64'h0;
  reg  [63:0] ic_data_rdata_i_0 = 64'h0;
  reg         ic_scr_key_valid_i = 1'b0;
  reg         irq_software_i  = 1'b0;
  reg         irq_timer_i     = 1'b0;
  reg         irq_external_i  = 1'b0;
  reg  [14:0] irq_fast_i      = 15'h0;
  reg         irq_nm_i        = 1'b0;
  reg         debug_req_i     = 1'b0;
  reg   [3:0] fetch_enable_i  = 4'b0101;  // IbexMuBiOn from the start

  // Share-1 inputs: all zeros
  reg  [31:0] hart_id_i_s1    = 32'h0;
  reg  [31:0] boot_addr_i_s1  = 32'h0;
  reg         instr_gnt_i_s1  = 1'b0;
  reg         instr_rvalid_i_s1 = 1'b0;
  reg  [31:0] instr_rdata_i_s1 = 32'h0;
  reg         instr_err_i_s1  = 1'b0;
  reg         data_gnt_i_s1   = 1'b0;
  reg         data_rvalid_i_s1 = 1'b0;
  reg  [31:0] data_rdata_i_s1 = 32'h0;
  reg         data_err_i_s1   = 1'b0;
  reg  [31:0] rf_rdata_a_ecc_i_s1 = 32'h0;
  reg  [31:0] rf_rdata_b_ecc_i_s1 = 32'h0;
  reg  [21:0] ic_tag_rdata_i_s1_1 = 22'h0;
  reg  [21:0] ic_tag_rdata_i_s1_0 = 22'h0;
  reg  [63:0] ic_data_rdata_i_s1_1 = 64'h0;
  reg  [63:0] ic_data_rdata_i_s1_0 = 64'h0;
  reg         ic_scr_key_valid_i_s1 = 1'b0;
  reg         irq_software_i_s1 = 1'b0;
  reg         irq_timer_i_s1  = 1'b0;
  reg         irq_external_i_s1 = 1'b0;
  reg  [14:0] irq_fast_i_s1   = 15'h0;
  reg         irq_nm_i_s1     = 1'b0;
  reg         debug_req_i_s1  = 1'b0;
  reg   [3:0] fetch_enable_i_s1 = 4'b0000;

  reg  [15:0] randbits        = 16'h0;

  // ================================================================
  // All ibex_core outputs
  // ================================================================
  wire        instr_req_o;
  wire [31:0] instr_addr_o;
  wire        data_req_o;
  wire        data_we_o;
  wire  [3:0] data_be_o;
  wire [31:0] data_addr_o;
  wire [31:0] data_wdata_o;
  wire        dummy_instr_id_o;
  wire        dummy_instr_wb_o;
  wire  [4:0] rf_raddr_a_o;
  wire  [4:0] rf_raddr_b_o;
  wire  [4:0] rf_waddr_wb_o;
  wire        rf_we_wb_o;
  wire [31:0] rf_wdata_wb_ecc_o;
  wire  [1:0] ic_tag_req_o;
  wire        ic_tag_write_o;
  wire  [7:0] ic_tag_addr_o;
  wire [21:0] ic_tag_wdata_o;
  wire  [1:0] ic_data_req_o;
  wire        ic_data_write_o;
  wire  [7:0] ic_data_addr_o;
  wire [63:0] ic_data_wdata_o;
  wire        ic_scr_key_req_o;
  wire        irq_pending_o;
  wire [31:0] crash_dump_current_pc;
  wire [31:0] crash_dump_next_pc;
  wire [31:0] crash_dump_last_data_addr;
  wire [31:0] crash_dump_exception_pc;
  wire [31:0] crash_dump_exception_addr;
  wire        double_fault_seen_o;
  wire        alert_minor_o;
  wire        alert_major_internal_o;
  wire        alert_major_bus_o;
  wire  [3:0] core_busy_o;

  // Share-1 outputs
  wire        instr_req_o_s1;
  wire [31:0] instr_addr_o_s1;
  wire        data_req_o_s1;
  wire        data_we_o_s1;
  wire  [3:0] data_be_o_s1;
  wire [31:0] data_addr_o_s1;
  wire [31:0] data_wdata_o_s1;
  wire        dummy_instr_id_o_s1;
  wire        dummy_instr_wb_o_s1;
  wire  [4:0] rf_raddr_a_o_s1;
  wire  [4:0] rf_raddr_b_o_s1;
  wire  [4:0] rf_waddr_wb_o_s1;
  wire        rf_we_wb_o_s1;
  wire [31:0] rf_wdata_wb_ecc_o_s1;
  wire  [1:0] ic_tag_req_o_s1;
  wire        ic_tag_write_o_s1;
  wire  [7:0] ic_tag_addr_o_s1;
  wire [21:0] ic_tag_wdata_o_s1;
  wire  [1:0] ic_data_req_o_s1;
  wire        ic_data_write_o_s1;
  wire  [7:0] ic_data_addr_o_s1;
  wire [63:0] ic_data_wdata_o_s1;
  wire        ic_scr_key_req_o_s1;
  wire        irq_pending_o_s1;
  wire [31:0] crash_dump_current_pc_s1;
  wire [31:0] crash_dump_next_pc_s1;
  wire [31:0] crash_dump_last_data_addr_s1;
  wire [31:0] crash_dump_exception_pc_s1;
  wire [31:0] crash_dump_exception_addr_s1;
  wire        double_fault_seen_o_s1;
  wire        alert_minor_o_s1;
  wire        alert_major_internal_o_s1;
  wire        alert_major_bus_o_s1;
  wire  [3:0] core_busy_o_s1;

  // ================================================================
  // DUT instantiation — identical to minimal_netlist_tb
  // ================================================================
  ibex_core u_dut (
    .clk_i(clk_i),
    .rst_ni(rst_ni),
    .hart_id_i(hart_id_i),
    .boot_addr_i(boot_addr_i),
    .instr_req_o(instr_req_o),
    .instr_gnt_i(instr_gnt_i),
    .instr_rvalid_i(instr_rvalid_i),
    .instr_addr_o(instr_addr_o),
    .instr_rdata_i(instr_rdata_i),
    .instr_err_i(instr_err_i),
    .data_req_o(data_req_o),
    .data_gnt_i(data_gnt_i),
    .data_rvalid_i(data_rvalid_i),
    .data_we_o(data_we_o),
    .data_be_o(data_be_o),
    .data_addr_o(data_addr_o),
    .data_wdata_o(data_wdata_o),
    .data_rdata_i(data_rdata_i),
    .data_err_i(data_err_i),
    .dummy_instr_id_o(dummy_instr_id_o),
    .dummy_instr_wb_o(dummy_instr_wb_o),
    .rf_raddr_a_o(rf_raddr_a_o),
    .rf_raddr_b_o(rf_raddr_b_o),
    .rf_waddr_wb_o(rf_waddr_wb_o),
    .rf_we_wb_o(rf_we_wb_o),
    .rf_wdata_wb_ecc_o(rf_wdata_wb_ecc_o),
    .rf_rdata_a_ecc_i(rf_rdata_a_ecc_i),
    .rf_rdata_b_ecc_i(rf_rdata_b_ecc_i),
    .\ic_tag_rdata_i[1] (ic_tag_rdata_i_1),
    .\ic_tag_rdata_i[0] (ic_tag_rdata_i_0),
    .\ic_data_rdata_i[1] (ic_data_rdata_i_1),
    .\ic_data_rdata_i[0] (ic_data_rdata_i_0),
    .ic_tag_req_o(ic_tag_req_o),
    .ic_tag_write_o(ic_tag_write_o),
    .ic_tag_addr_o(ic_tag_addr_o),
    .ic_tag_wdata_o(ic_tag_wdata_o),
    .ic_data_req_o(ic_data_req_o),
    .ic_data_write_o(ic_data_write_o),
    .ic_data_addr_o(ic_data_addr_o),
    .ic_data_wdata_o(ic_data_wdata_o),
    .ic_scr_key_valid_i(ic_scr_key_valid_i),
    .ic_scr_key_req_o(ic_scr_key_req_o),
    .irq_software_i(irq_software_i),
    .irq_timer_i(irq_timer_i),
    .irq_external_i(irq_external_i),
    .irq_fast_i(irq_fast_i),
    .irq_nm_i(irq_nm_i),
    .irq_pending_o(irq_pending_o),
    .debug_req_i(debug_req_i),
    .\crash_dump_o[current_pc] (crash_dump_current_pc),
    .\crash_dump_o[next_pc] (crash_dump_next_pc),
    .\crash_dump_o[last_data_addr] (crash_dump_last_data_addr),
    .\crash_dump_o[exception_pc] (crash_dump_exception_pc),
    .\crash_dump_o[exception_addr] (crash_dump_exception_addr),
    .double_fault_seen_o(double_fault_seen_o),
    .fetch_enable_i(fetch_enable_i),
    .alert_minor_o(alert_minor_o),
    .alert_major_internal_o(alert_major_internal_o),
    .alert_major_bus_o(alert_major_bus_o),
    .core_busy_o(core_busy_o),
    // Share-1 inputs
    .hart_id_i_s1(hart_id_i_s1),
    .boot_addr_i_s1(boot_addr_i_s1),
    .instr_gnt_i_s1(instr_gnt_i_s1),
    .instr_rvalid_i_s1(instr_rvalid_i_s1),
    .instr_rdata_i_s1(instr_rdata_i_s1),
    .instr_err_i_s1(instr_err_i_s1),
    .data_gnt_i_s1(data_gnt_i_s1),
    .data_rvalid_i_s1(data_rvalid_i_s1),
    .data_rdata_i_s1(data_rdata_i_s1),
    .data_err_i_s1(data_err_i_s1),
    .rf_rdata_a_ecc_i_s1(rf_rdata_a_ecc_i_s1),
    .rf_rdata_b_ecc_i_s1(rf_rdata_b_ecc_i_s1),
    .\ic_tag_rdata_i_s1[1] (ic_tag_rdata_i_s1_1),
    .\ic_tag_rdata_i_s1[0] (ic_tag_rdata_i_s1_0),
    .\ic_data_rdata_i_s1[1] (ic_data_rdata_i_s1_1),
    .\ic_data_rdata_i_s1[0] (ic_data_rdata_i_s1_0),
    .ic_scr_key_valid_i_s1(ic_scr_key_valid_i_s1),
    .irq_software_i_s1(irq_software_i_s1),
    .irq_timer_i_s1(irq_timer_i_s1),
    .irq_external_i_s1(irq_external_i_s1),
    .irq_fast_i_s1(irq_fast_i_s1),
    .irq_nm_i_s1(irq_nm_i_s1),
    .debug_req_i_s1(debug_req_i_s1),
    .fetch_enable_i_s1(fetch_enable_i_s1),
    // Share-1 outputs
    .instr_req_o_s1(instr_req_o_s1),
    .instr_addr_o_s1(instr_addr_o_s1),
    .data_req_o_s1(data_req_o_s1),
    .data_we_o_s1(data_we_o_s1),
    .data_be_o_s1(data_be_o_s1),
    .data_addr_o_s1(data_addr_o_s1),
    .data_wdata_o_s1(data_wdata_o_s1),
    .dummy_instr_id_o_s1(dummy_instr_id_o_s1),
    .dummy_instr_wb_o_s1(dummy_instr_wb_o_s1),
    .rf_raddr_a_o_s1(rf_raddr_a_o_s1),
    .rf_raddr_b_o_s1(rf_raddr_b_o_s1),
    .rf_waddr_wb_o_s1(rf_waddr_wb_o_s1),
    .rf_we_wb_o_s1(rf_we_wb_o_s1),
    .rf_wdata_wb_ecc_o_s1(rf_wdata_wb_ecc_o_s1),
    .ic_tag_req_o_s1(ic_tag_req_o_s1),
    .ic_tag_write_o_s1(ic_tag_write_o_s1),
    .ic_tag_addr_o_s1(ic_tag_addr_o_s1),
    .ic_tag_wdata_o_s1(ic_tag_wdata_o_s1),
    .ic_data_req_o_s1(ic_data_req_o_s1),
    .ic_data_write_o_s1(ic_data_write_o_s1),
    .ic_data_addr_o_s1(ic_data_addr_o_s1),
    .ic_data_wdata_o_s1(ic_data_wdata_o_s1),
    .ic_scr_key_req_o_s1(ic_scr_key_req_o_s1),
    .irq_pending_o_s1(irq_pending_o_s1),
    .\crash_dump_o_s1[current_pc] (crash_dump_current_pc_s1),
    .\crash_dump_o_s1[next_pc] (crash_dump_next_pc_s1),
    .\crash_dump_o_s1[last_data_addr] (crash_dump_last_data_addr_s1),
    .\crash_dump_o_s1[exception_pc] (crash_dump_exception_pc_s1),
    .\crash_dump_o_s1[exception_addr] (crash_dump_exception_addr_s1),
    .double_fault_seen_o_s1(double_fault_seen_o_s1),
    .alert_minor_o_s1(alert_minor_o_s1),
    .alert_major_internal_o_s1(alert_major_internal_o_s1),
    .alert_major_bus_o_s1(alert_major_bus_o_s1),
    .core_busy_o_s1(core_busy_o_s1),
    .randbits(randbits)
  );

  // ================================================================
  // Recombined outputs (s0 ^ s1)
  // With randbits=0 and +xminitReg+0, all internal masks start at 0,
  // so s0=actual and s1=0.  But we XOR anyway for correctness.
  // ================================================================
  wire        instr_req_r    = instr_req_o ^ instr_req_o_s1;
  wire [31:0] instr_addr_r   = instr_addr_o ^ instr_addr_o_s1;
  wire        data_req_r     = data_req_o ^ data_req_o_s1;
  wire        data_we_r      = data_we_o ^ data_we_o_s1;
  wire  [3:0] data_be_r      = data_be_o ^ data_be_o_s1;
  wire [31:0] data_addr_r    = data_addr_o ^ data_addr_o_s1;
  wire [31:0] data_wdata_r   = data_wdata_o ^ data_wdata_o_s1;
  wire  [4:0] rf_raddr_a_r   = rf_raddr_a_o ^ rf_raddr_a_o_s1;
  wire  [4:0] rf_raddr_b_r   = rf_raddr_b_o ^ rf_raddr_b_o_s1;
  wire  [4:0] rf_waddr_wb_r  = rf_waddr_wb_o ^ rf_waddr_wb_o_s1;
  wire        rf_we_wb_r     = rf_we_wb_o ^ rf_we_wb_o_s1;
  wire [31:0] rf_wdata_wb_r  = rf_wdata_wb_ecc_o ^ rf_wdata_wb_ecc_o_s1;
  wire  [3:0] core_busy_r    = core_busy_o ^ core_busy_o_s1;

  // ================================================================
  // Instruction response — IDENTICAL to minimal_netlist_tb
  // Use raw s0 signals (not recombined) for rvalid feedback
  // ================================================================
  always @(posedge clk_i) begin
    if (!rst_ni) begin
      instr_rvalid_i <= 1'b0;
    end else begin
      instr_rvalid_i <= instr_req_o & instr_gnt_i;
    end
  end

  // Data response — IDENTICAL to minimal_netlist_tb
  always @(posedge clk_i) begin
    if (!rst_ni) begin
      data_rvalid_i <= 1'b0;
    end else begin
      data_rvalid_i <= data_req_o & data_gnt_i;
    end
  end

  // ================================================================
  // Memory (loaded from VMEM)
  // ================================================================
  localparam MEM_SIZE_WORDS = 49152;  // 192KB
  reg [31:0] mem [0:MEM_SIZE_WORDS-1];

  initial begin
    integer i;
    for (i = 0; i < MEM_SIZE_WORDS; i = i + 1)
      mem[i] = 32'h0;

    if ($value$plusargs("SRAMInitFile=%s", SRAMInitFile)) begin
      $readmemh(SRAMInitFile, mem);
      $display("[TB] Loaded memory from: %s", SRAMInitFile);
      $display("[TB] mem[0x00] = %08h", mem[0]);
      $display("[TB] mem[0x20] = %08h", mem[32]);
    end else begin
      $display("[TB] WARNING: No SRAMInitFile specified!");
    end
  end

  // ================================================================
  // Register file (32 x 32-bit, x0 hardwired to 0)
  // ================================================================
  reg [31:0] regfile [0:31];

  initial begin
    integer i;
    for (i = 0; i < 32; i = i + 1)
      regfile[i] = 32'h0;
  end

  // Combinational read — use recombined address
  always @(*) begin
    rf_rdata_a_ecc_i = regfile[rf_raddr_a_r];
    rf_rdata_b_ecc_i = regfile[rf_raddr_b_r];
  end

  // Synchronous write — use recombined signals
  always @(posedge clk_i) begin
    if (rf_we_wb_r && (rf_waddr_wb_r != 5'd0)) begin
      regfile[rf_waddr_wb_r] <= rf_wdata_wb_r;
    end
  end

  // ================================================================
  // Memory lookup: serves instruction & data from RAM
  // ================================================================
  // Address conversion: RAM at 0x100000, word index = (addr-0x100000)>>2
  function automatic [31:0] word_idx;
    input [31:0] byte_addr;
    word_idx = (byte_addr - 32'h00100000) >> 2;
  endfunction

  // Instruction data: feed from memory using recombined address
  always @(posedge clk_i) begin
    if (!rst_ni) begin
      instr_rdata_i <= 32'h00000013;  // NOP
    end else begin
      if (instr_req_o & instr_gnt_i) begin
        if (instr_addr_r >= 32'h00100000 && instr_addr_r < 32'h00140000) begin
          instr_rdata_i <= mem[word_idx(instr_addr_r)];
          // Debug: print first few instruction fetches
          if ($time < 100000)
            $display("[IF] t=%0t addr_s0=%08h addr_s1=%08h addr_r=%08h idx=%0d data=%08h",
              $time, instr_addr_o, instr_addr_o_s1, instr_addr_r, word_idx(instr_addr_r), mem[word_idx(instr_addr_r)]);
        end else
          instr_rdata_i <= 32'h00000013;  // NOP for unmapped
      end
    end
  end

  // Data read/write: use recombined address and control signals
  always @(posedge clk_i) begin
    if (!rst_ni) begin
      data_rdata_i <= 32'h0;
    end else if (data_req_o & data_gnt_i) begin
      if (data_we_r) begin
        // --- WRITE ---
        if (data_addr_r >= 32'h00100000 && data_addr_r < 32'h00140000) begin
          // Byte-enable write
          if (data_be_r[0]) mem[word_idx(data_addr_r)][7:0]   = data_wdata_r[7:0];
          if (data_be_r[1]) mem[word_idx(data_addr_r)][15:8]  = data_wdata_r[15:8];
          if (data_be_r[2]) mem[word_idx(data_addr_r)][23:16] = data_wdata_r[23:16];
          if (data_be_r[3]) mem[word_idx(data_addr_r)][31:24] = data_wdata_r[31:24];
        end
        data_rdata_i <= 32'h0;
      end else begin
        // --- READ ---
        if (data_addr_r >= 32'h00100000 && data_addr_r < 32'h00140000)
          data_rdata_i <= mem[word_idx(data_addr_r)];
        else
          data_rdata_i <= 32'h0;
      end
    end
  end

  // ================================================================
  // Sim Control: character output + halt
  // ================================================================
  reg sim_finished = 1'b0;

  always @(posedge clk_i) begin
    if (data_rvalid_i && data_we_r) begin
      if (data_addr_r >= 32'h00020000 && data_addr_r < 32'h00020400) begin
        case (data_addr_r[7:0])
          8'h00: $write("%c", data_wdata_r[7:0]);  // SIM_CTRL_OUT
          8'h08: begin  // SIM_CTRL_CTRL
            if (data_wdata_r[0]) begin
              $display("\n[TB] *** Simulation halt requested at %0t ***", $time);
              sim_finished <= 1'b1;
            end
          end
        endcase
      end
    end
  end

  // Finish after halt
  reg [3:0] finish_cnt = 4'd0;
  always @(posedge clk_i) begin
    if (sim_finished) begin
      finish_cnt <= finish_cnt + 1;
      if (finish_cnt >= 4'd3)
        $finish;
    end
  end

  // ================================================================
  // Reset sequence
  // ================================================================
  initial begin
    rst_ni = 1'b0;
    #10;
    rst_ni = 1'b1;
    $display("[TB] Reset released at %0t", $time);
  end

  // ================================================================
  // Monitor + timeout
  // ================================================================
  integer timeout;
  initial begin
    if (!$value$plusargs("timeout_cycles=%d", timeout))
      timeout = 500000;

    @(posedge rst_ni);
    #0.1;
    $display("[TB] Post-reset: core_busy=%04b/%04b instr_req=%b/%b",
      core_busy_o, core_busy_o_s1, instr_req_o, instr_req_o_s1);
    $display("[TB] Post-reset recombined: core_busy=%04b instr_req=%b",
      core_busy_r, instr_req_r);
    $display("[TB] Post-reset: instr_addr=%08h/%08h recomb=%08h",
      instr_addr_o, instr_addr_o_s1, instr_addr_r);

    // Quick debug: first 30 cycles
    repeat (30) begin
      @(posedge clk_i);
      #0.1;
      $display("[TB] t=%0t instr_req=%b/%b(r=%b) addr=%08h/%08h(r=%08h) busy=%04b/%04b data_req=%b/%b(r=%b) d_addr=%08h/%08h(r=%08h) d_we=%b/%b(r=%b)",
        $time,
        instr_req_o, instr_req_o_s1, instr_req_r,
        instr_addr_o, instr_addr_o_s1, instr_addr_r,
        core_busy_o, core_busy_o_s1,
        data_req_o, data_req_o_s1, data_req_r,
        data_addr_o, data_addr_o_s1, data_addr_r,
        data_we_o, data_we_o_s1, data_we_r);
    end

    $display("[TB] Continuing... timeout in %0d cycles", timeout);

    repeat (timeout) @(posedge clk_i);
    $display("[TB] *** TIMEOUT after %0d cycles at %0t ***", timeout, $time);
    $finish;
  end

  // Progress monitor
  integer cycle_count = 0;
  always @(posedge clk_i) begin
    if (rst_ni) begin
      cycle_count <= cycle_count + 1;
      if (cycle_count > 0 && (cycle_count % 100000 == 0))
        $display("[TB] %0t: %0d cycles", $time, cycle_count);
    end
  end

endmodule
