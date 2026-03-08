`timescale 1ns/1ps
`include "prim_assert.sv"

module masked_core_tb;
  import ibex_pkg::*;

  // ===========================
  // Clock and Reset
  // ===========================
  logic clk, rst_n;
  initial begin clk = 0; forever #5 clk = ~clk; end  // 100 MHz
  initial begin
    rst_n = 0;
    repeat (100) @(posedge clk);
    rst_n = 1;
  end

  // ===========================
  // GNG for randbits
  // ===========================
  logic [15:0] randbits;
  logic        rng_valid;
  gng u_gng (
    .clk       (clk),
    .rstn      (rst_n),
    .ce        (1'b1),
    .valid_out (rng_valid),
    .data_out  (randbits)
  );

  // ===========================
  // Memory Interface Signals
  // ===========================
  logic        instr_req, instr_gnt, instr_rvalid;
  logic [31:0] instr_addr, instr_rdata;
  logic [6:0]  instr_rdata_intg;

  logic        data_req, data_gnt, data_rvalid, data_we;
  logic [3:0]  data_be;
  logic [31:0] data_addr, data_wdata, data_rdata;
  logic [6:0]  data_rdata_intg, data_wdata_intg;

  // ===========================
  // DUT: ibex_top_tracing
  // (includes ibex_tracer for automatic trace generation)
  // ===========================
  ibex_top_tracing #(
    .PMPEnable        (1'b0),
    .PMPGranularity   (0),
    .PMPNumRegions    (4),
    .MHPMCounterNum   (0),
    .MHPMCounterWidth (40),
    .RV32E            (1'b0),
    .RV32M            (ibex_pkg::RV32MFast),
    .RV32B            (ibex_pkg::RV32BNone),
    .RegFile          (ibex_pkg::RegFileFF),
    .BranchTargetALU  (1'b0),
    .WritebackStage   (1'b0),
    .ICache           (1'b0),
    .ICacheECC        (1'b0),
    .SecureIbex       (1'b0),
    .ICacheScramble   (1'b0),
    .BranchPredictor  (1'b0),
    .DbgTriggerEn     (1'b0)
  ) u_dut (
    .clk_i                  (clk),
    .rst_ni                 (rst_n),

    .test_en_i              (1'b0),
    .scan_rst_ni            (1'b1),
    .ram_cfg_i              ('0),

    .hart_id_i              (32'b0),
    .boot_addr_i            (32'h80000000),

    .instr_req_o            (instr_req),
    .instr_gnt_i            (instr_gnt),
    .instr_rvalid_i         (instr_rvalid),
    .instr_addr_o           (instr_addr),
    .instr_rdata_i          (instr_rdata),
    .instr_rdata_intg_i     (7'b0),
    .instr_err_i            (1'b0),

    .data_req_o             (data_req),
    .data_gnt_i             (data_gnt),
    .data_rvalid_i          (data_rvalid),
    .data_we_o              (data_we),
    .data_be_o              (data_be),
    .data_addr_o            (data_addr),
    .data_wdata_o           (data_wdata),
    .data_wdata_intg_o      (data_wdata_intg),
    .data_rdata_i           (data_rdata),
    .data_rdata_intg_i      (7'b0),
    .data_err_i             (1'b0),

    .irq_software_i         (1'b0),
    .irq_timer_i            (1'b0),
    .irq_external_i         (1'b0),
    .irq_fast_i             (15'b0),
    .irq_nm_i               (1'b0),

    .scramble_key_valid_i   (1'b0),
    .scramble_key_i         ('0),
    .scramble_nonce_i       ('0),
    .scramble_req_o         (),

    .debug_req_i            (1'b0),
    .crash_dump_o           (),
    .double_fault_seen_o    (),

    .fetch_enable_i         (ibex_pkg::IbexMuBiOn),
    .alert_minor_o          (),
    .alert_major_internal_o (),
    .alert_major_bus_o      (),
    .core_sleep_o           (),

    .randbits               (randbits)
  );

  // ===========================
  // Sparse Memory Model
  // ===========================
  logic [7:0] mem [logic [31:0]];  // Associative array = sparse memory

  // Load binary from plusarg or default
  initial begin
    automatic string bin_file;
    automatic int fd;
    automatic bit [7:0] r8;
    automatic bit [31:0] addr;

    if (!$value$plusargs("bin=%s", bin_file))
      bin_file = "test.bin";

    addr = 32'h80000000;
    fd = $fopen(bin_file, "rb");
    if (!fd) $fatal(1, "Cannot open binary file: %s", bin_file);

    while ($fread(r8, fd)) begin
      mem[addr] = r8;
      addr++;
    end
    $fclose(fd);
    $display("[TB] Loaded %0d bytes from %s at 0x80000000", addr - 32'h80000000, bin_file);
  end

  // Read 32-bit word from sparse memory (little-endian)
  function automatic logic [31:0] mem_rd32(input logic [31:0] a);
    logic [31:0] d;
    d[ 7: 0] = mem.exists(a)   ? mem[a]   : 8'h00;
    d[15: 8] = mem.exists(a+1) ? mem[a+1] : 8'h00;
    d[23:16] = mem.exists(a+2) ? mem[a+2] : 8'h00;
    d[31:24] = mem.exists(a+3) ? mem[a+3] : 8'h00;
    return d;
  endfunction

  // Write bytes to sparse memory with byte enables
  function automatic void mem_wr32(input logic [31:0] a, input logic [31:0] d, input logic [3:0] be);
    if (be[0]) mem[a]   = d[ 7: 0];
    if (be[1]) mem[a+1] = d[15: 8];
    if (be[2]) mem[a+2] = d[23:16];
    if (be[3]) mem[a+3] = d[31:24];
  endfunction

  // ===========================
  // Instruction Memory Responder
  // (Grant immediately, respond next cycle)
  // ===========================
  logic [31:0] instr_addr_lat;

  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      instr_gnt    <= 1'b0;
      instr_rvalid <= 1'b0;
      instr_rdata  <= '0;
      instr_addr_lat <= '0;
    end else begin
      // Grant in the same cycle as request
      instr_gnt <= instr_req;

      // Latch address on grant
      if (instr_req && instr_gnt)
        instr_addr_lat <= instr_addr;
      else if (instr_req)
        instr_addr_lat <= instr_addr;

      // Response one cycle after grant
      instr_rvalid <= instr_gnt;
      if (instr_gnt)
        instr_rdata <= mem_rd32({instr_addr[31:2], 2'b00});
    end
  end

  // ===========================
  // Data Memory Responder
  // ===========================
  logic [31:0] data_addr_lat, data_wdata_lat;
  logic [3:0]  data_be_lat;
  logic        data_we_lat;
  logic        sig_write_detected;

  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      data_gnt    <= 1'b0;
      data_rvalid <= 1'b0;
      data_rdata  <= '0;
    end else begin
      data_gnt <= data_req;

      if (data_req) begin
        data_addr_lat  <= data_addr;
        data_wdata_lat <= data_wdata;
        data_be_lat    <= data_be;
        data_we_lat    <= data_we;
      end

      data_rvalid <= data_gnt;

      if (data_gnt) begin
        if (data_we_lat) begin
          mem_wr32({data_addr_lat[31:2], 2'b00}, data_wdata_lat, data_be_lat);
        end else begin
          data_rdata <= mem_rd32({data_addr_lat[31:2], 2'b00});
        end
      end
    end
  end

  // ===========================
  // Termination Detection
  // ===========================
  logic [31:0] sig_addr;
  initial begin
    if (!$value$plusargs("signature_addr=%h", sig_addr))
      sig_addr = 32'h8ffffffc;
  end

  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      sig_write_detected <= 1'b0;
    end else if (data_gnt && data_we_lat &&
        {data_addr_lat[31:2], 2'b00} == sig_addr) begin
      sig_write_detected <= 1'b1;
    end
  end

  // Detect test completion and finish simulation
  always @(posedge clk) begin
    if (sig_write_detected) begin
      $display("[TB] *** Signature write detected at %0t — test complete ***", $time);
      repeat (10) @(posedge clk);
      $finish;
    end
  end

  // Timeout
  initial begin
    automatic int timeout_cycles;
    if (!$value$plusargs("timeout_cycles=%d", timeout_cycles))
      timeout_cycles = 5_000_000;  // ~50ms at 100MHz
    repeat (timeout_cycles) @(posedge clk);
    $display("[TB] *** TIMEOUT after %0d cycles ***", timeout_cycles);
    $finish;
  end

endmodule
