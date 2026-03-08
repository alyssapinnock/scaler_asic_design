// Gate-level netlist wrapper for ibex_core
// This wrapper adapts the dual-rail masked gate-level netlist to the standard Ibex interface
// for use with the Ibex DV/Co-sim environment

`timescale 1ns/1ps

module ibex_core_gatelevel_wrapper
import ibex_pkg::*;
#(
  parameter bit          PMPEnable        = 1'b0,
  parameter int unsigned PMPGranularity   = 0,
  parameter int unsigned PMPNumRegions    = 4,
  parameter int unsigned MHPMCounterNum   = 0,
  parameter int unsigned MHPMCounterWidth = 40,
  parameter bit          RV32E            = 1'b0,
  parameter int          RV32M            = ibex_pkg::RV32MFast,
  parameter int          RV32B            = ibex_pkg::RV32BNone,
  parameter int          RegFile          = ibex_pkg::RegFileFF,
  parameter bit          BranchTargetALU  = 1'b0,
  parameter bit          WritebackStage   = 1'b0,
  parameter bit          ICache           = 1'b0,
  parameter bit          ICacheECC        = 1'b0,
  parameter bit          BranchPredictor  = 1'b0,
  parameter bit          DbgTriggerEn     = 1'b0,
  parameter int unsigned DbgHwBreakNum    = 1,
  parameter bit          SecureIbex       = 1'b0,
  parameter int unsigned DmHaltAddr       = 32'h1A110800,
  parameter int unsigned DmExceptionAddr  = 32'h1A110808
) (
  // Clock and Reset
  input  logic                         clk_i,
  input  logic                         rst_ni,

  input  logic [31:0]                  hart_id_i,
  input  logic [31:0]                  boot_addr_i,

  // Instruction memory interface
  output logic                         instr_req_o,
  input  logic                         instr_gnt_i,
  input  logic                         instr_rvalid_i,
  output logic [31:0]                  instr_addr_o,
  input  logic [31:0]                  instr_rdata_i,
  input  logic                         instr_err_i,

  // Data memory interface
  output logic                         data_req_o,
  input  logic                         data_gnt_i,
  input  logic                         data_rvalid_i,
  output logic                         data_we_o,
  output logic [3:0]                   data_be_o,
  output logic [31:0]                  data_addr_o,
  output logic [31:0]                  data_wdata_o,
  input  logic [31:0]                  data_rdata_i,
  input  logic                         data_err_i,

  // Register file interface (ECC signals - not used in gate-level)
  output logic                         dummy_instr_id_o,
  output logic                         dummy_instr_wb_o,
  output logic [4:0]                   rf_raddr_a_o,
  output logic [4:0]                   rf_raddr_b_o,
  output logic [4:0]                   rf_waddr_wb_o,
  output logic                         rf_we_wb_o,
  output logic [31:0]                  rf_wdata_wb_ecc_o,
  input  logic [31:0]                  rf_rdata_a_ecc_i,
  input  logic [31:0]                  rf_rdata_b_ecc_i,

  // ICache interface (not used)
  output logic                         ic_tag_req_o,
  output logic                         ic_tag_write_o,
  output logic [8:0]                   ic_tag_addr_o,
  output logic [21:0]                  ic_tag_wdata_o,
  input  logic [21:0]                  ic_tag_rdata_i [2],
  output logic                         ic_data_req_o,
  output logic                         ic_data_write_o,
  output logic [8:0]                   ic_data_addr_o,
  output logic [63:0]                  ic_data_wdata_o,
  input  logic [63:0]                  ic_data_rdata_i [2],
  input  logic                         ic_scr_key_valid_i,
  output logic                         ic_scr_key_req_o,

  // Interrupt inputs
  input  logic                         irq_software_i,
  input  logic                         irq_timer_i,
  input  logic                         irq_external_i,
  input  logic [14:0]                  irq_fast_i,
  input  logic                         irq_nm_i,
  output logic                         irq_pending_o,

  // Debug Interface
  input  logic                         debug_req_i,
  output logic [31:0]                  crash_dump_o_current_pc,
  output logic [31:0]                  crash_dump_o_next_pc,
  output logic [31:0]                  crash_dump_o_last_data_addr,
  output logic [31:0]                  crash_dump_o_exception_pc,
  output logic [31:0]                  crash_dump_o_exception_addr,

  // CPU Control Signals
  input  logic                         fetch_enable_i,
  output logic                         alert_minor_o,
  output logic                         alert_major_internal_o,
  output logic                         alert_major_bus_o,
  output logic                         core_busy_o,

  // Scan signals (not used)
  input  logic                         scan_rst_ni,
  output logic                         double_fault_seen_o
);

  // Random number generator for masking
  logic [15:0] randbits;
  logic        rng_valid;
  
  gng u_gng (
    .clk       (clk_i),
    .rstn      (rst_ni),
    .ce        (1'b1),
    .valid_out (rng_valid),
    .data_out  (randbits)
  );

  // Dual-rail signals for masked gate-level netlist
  // For inputs, we convert single-rail to dual-rail (s0=signal, s1=0)
  // For outputs, we convert dual-rail to single-rail (signal = s0 XOR s1)
  
  // Input dual-rail signals (s0 = actual signal, s1 = 0 for unmasked inputs)
  logic [31:0] hart_id_i_s0, hart_id_i_s1;
  logic [31:0] boot_addr_i_s0, boot_addr_i_s1;
  logic instr_gnt_i_s0, instr_gnt_i_s1;
  logic instr_rvalid_i_s0, instr_rvalid_i_s1;
  logic [31:0] instr_rdata_i_s0, instr_rdata_i_s1;
  logic instr_err_i_s0, instr_err_i_s1;
  logic data_gnt_i_s0, data_gnt_i_s1;
  logic data_rvalid_i_s0, data_rvalid_i_s1;
  logic [31:0] data_rdata_i_s0, data_rdata_i_s1;
  logic data_err_i_s0, data_err_i_s1;
  logic [31:0] rf_rdata_a_ecc_i_s0, rf_rdata_a_ecc_i_s1;
  logic [31:0] rf_rdata_b_ecc_i_s0, rf_rdata_b_ecc_i_s1;
  logic [21:0] ic_tag_rdata_i_s0[2], ic_tag_rdata_i_s1[2];
  logic [63:0] ic_data_rdata_i_s0[2], ic_data_rdata_i_s1[2];
  logic ic_scr_key_valid_i_s0, ic_scr_key_valid_i_s1;
  logic irq_software_i_s0, irq_software_i_s1;
  logic irq_timer_i_s0, irq_timer_i_s1;
  logic irq_external_i_s0, irq_external_i_s1;
  logic [14:0] irq_fast_i_s0, irq_fast_i_s1;
  logic irq_nm_i_s0, irq_nm_i_s1;
  logic debug_req_i_s0, debug_req_i_s1;
  logic [3:0] fetch_enable_i_s0, fetch_enable_i_s1;

  // Output dual-rail signals
  logic instr_req_o_s0, instr_req_o_s1;
  logic [31:0] instr_addr_o_s0, instr_addr_o_s1;
  logic data_req_o_s0, data_req_o_s1;
  logic data_we_o_s0, data_we_o_s1;
  logic [3:0] data_be_o_s0, data_be_o_s1;
  logic [31:0] data_addr_o_s0, data_addr_o_s1;
  logic [31:0] data_wdata_o_s0, data_wdata_o_s1;
  logic dummy_instr_id_o_s0, dummy_instr_id_o_s1;
  logic dummy_instr_wb_o_s0, dummy_instr_wb_o_s1;
  logic [4:0] rf_raddr_a_o_s0, rf_raddr_a_o_s1;
  logic [4:0] rf_raddr_b_o_s0, rf_raddr_b_o_s1;
  logic [4:0] rf_waddr_wb_o_s0, rf_waddr_wb_o_s1;
  logic rf_we_wb_o_s0, rf_we_wb_o_s1;
  logic [31:0] rf_wdata_wb_ecc_o_s0, rf_wdata_wb_ecc_o_s1;
  logic ic_tag_req_o_s0, ic_tag_req_o_s1;
  logic ic_tag_write_o_s0, ic_tag_write_o_s1;
  logic [8:0] ic_tag_addr_o_s0, ic_tag_addr_o_s1;
  logic [21:0] ic_tag_wdata_o_s0, ic_tag_wdata_o_s1;
  logic ic_data_req_o_s0, ic_data_req_o_s1;
  logic ic_data_write_o_s0, ic_data_write_o_s1;
  logic [8:0] ic_data_addr_o_s0, ic_data_addr_o_s1;
  logic [63:0] ic_data_wdata_o_s0, ic_data_wdata_o_s1;
  logic ic_scr_key_req_o_s0, ic_scr_key_req_o_s1;
  logic irq_pending_o_s0, irq_pending_o_s1;
  logic [31:0] crash_dump_o_s0[5], crash_dump_o_s1[5];
  logic double_fault_seen_o_s0, double_fault_seen_o_s1;
  logic alert_minor_o_s0, alert_minor_o_s1;
  logic alert_major_internal_o_s0, alert_major_internal_o_s1;
  logic alert_major_bus_o_s0, alert_major_bus_o_s1;
  logic core_busy_o_s0, core_busy_o_s1;

  // Convert single-rail inputs to dual-rail (unmasked)
  assign hart_id_i_s0 = hart_id_i;
  assign hart_id_i_s1 = 32'h0;
  assign boot_addr_i_s0 = boot_addr_i;
  assign boot_addr_i_s1 = 32'h0;
  assign instr_gnt_i_s0 = instr_gnt_i;
  assign instr_gnt_i_s1 = 1'b0;
  assign instr_rvalid_i_s0 = instr_rvalid_i;
  assign instr_rvalid_i_s1 = 1'b0;
  assign instr_rdata_i_s0 = instr_rdata_i;
  assign instr_rdata_i_s1 = 32'h0;
  assign instr_err_i_s0 = instr_err_i;
  assign instr_err_i_s1 = 1'b0;
  assign data_gnt_i_s0 = data_gnt_i;
  assign data_gnt_i_s1 = 1'b0;
  assign data_rvalid_i_s0 = data_rvalid_i;
  assign data_rvalid_i_s1 = 1'b0;
  assign data_rdata_i_s0 = data_rdata_i;
  assign data_rdata_i_s1 = 32'h0;
  assign data_err_i_s0 = data_err_i;
  assign data_err_i_s1 = 1'b0;
  assign rf_rdata_a_ecc_i_s0 = rf_rdata_a_ecc_i;
  assign rf_rdata_a_ecc_i_s1 = 32'h0;
  assign rf_rdata_b_ecc_i_s0 = rf_rdata_b_ecc_i;
  assign rf_rdata_b_ecc_i_s1 = 32'h0;
  assign ic_tag_rdata_i_s0[0] = ic_tag_rdata_i[0];
  assign ic_tag_rdata_i_s0[1] = ic_tag_rdata_i[1];
  assign ic_tag_rdata_i_s1[0] = 22'h0;
  assign ic_tag_rdata_i_s1[1] = 22'h0;
  assign ic_data_rdata_i_s0[0] = ic_data_rdata_i[0];
  assign ic_data_rdata_i_s0[1] = ic_data_rdata_i[1];
  assign ic_data_rdata_i_s1[0] = 64'h0;
  assign ic_data_rdata_i_s1[1] = 64'h0;
  assign ic_scr_key_valid_i_s0 = ic_scr_key_valid_i;
  assign ic_scr_key_valid_i_s1 = 1'b0;
  assign irq_software_i_s0 = irq_software_i;
  assign irq_software_i_s1 = 1'b0;
  assign irq_timer_i_s0 = irq_timer_i;
  assign irq_timer_i_s1 = 1'b0;
  assign irq_external_i_s0 = irq_external_i;
  assign irq_external_i_s1 = 1'b0;
  assign irq_fast_i_s0 = irq_fast_i;
  assign irq_fast_i_s1 = 15'h0;
  assign irq_nm_i_s0 = irq_nm_i;
  assign irq_nm_i_s1 = 1'b0;
  assign debug_req_i_s0 = debug_req_i;
  assign debug_req_i_s1 = 1'b0;
  assign fetch_enable_i_s0 = {4{fetch_enable_i}};
  assign fetch_enable_i_s1 = 4'h0;

  // Convert dual-rail outputs to single-rail (XOR to unmask)
  assign instr_req_o = instr_req_o_s0 ^ instr_req_o_s1;
  assign instr_addr_o = instr_addr_o_s0 ^ instr_addr_o_s1;
  assign data_req_o = data_req_o_s0 ^ data_req_o_s1;
  assign data_we_o = data_we_o_s0 ^ data_we_o_s1;
  assign data_be_o = data_be_o_s0 ^ data_be_o_s1;
  assign data_addr_o = data_addr_o_s0 ^ data_addr_o_s1;
  assign data_wdata_o = data_wdata_o_s0 ^ data_wdata_o_s1;
  assign dummy_instr_id_o = dummy_instr_id_o_s0 ^ dummy_instr_id_o_s1;
  assign dummy_instr_wb_o = dummy_instr_wb_o_s0 ^ dummy_instr_wb_o_s1;
  assign rf_raddr_a_o = rf_raddr_a_o_s0 ^ rf_raddr_a_o_s1;
  assign rf_raddr_b_o = rf_raddr_b_o_s0 ^ rf_raddr_b_o_s1;
  assign rf_waddr_wb_o = rf_waddr_wb_o_s0 ^ rf_waddr_wb_o_s1;
  assign rf_we_wb_o = rf_we_wb_o_s0 ^ rf_we_wb_o_s1;
  assign rf_wdata_wb_ecc_o = rf_wdata_wb_ecc_o_s0 ^ rf_wdata_wb_ecc_o_s1;
  assign ic_tag_req_o = ic_tag_req_o_s0 ^ ic_tag_req_o_s1;
  assign ic_tag_write_o = ic_tag_write_o_s0 ^ ic_tag_write_o_s1;
  assign ic_tag_addr_o = ic_tag_addr_o_s0 ^ ic_tag_addr_o_s1;
  assign ic_tag_wdata_o = ic_tag_wdata_o_s0 ^ ic_tag_wdata_o_s1;
  assign ic_data_req_o = ic_data_req_o_s0 ^ ic_data_req_o_s1;
  assign ic_data_write_o = ic_data_write_o_s0 ^ ic_data_write_o_s1;
  assign ic_data_addr_o = ic_data_addr_o_s0 ^ ic_data_addr_o_s1;
  assign ic_data_wdata_o = ic_data_wdata_o_s0 ^ ic_data_wdata_o_s1;
  assign ic_scr_key_req_o = ic_scr_key_req_o_s0 ^ ic_scr_key_req_o_s1;
  assign irq_pending_o = irq_pending_o_s0 ^ irq_pending_o_s1;
  assign double_fault_seen_o = double_fault_seen_o_s0 ^ double_fault_seen_o_s1;
  assign alert_minor_o = alert_minor_o_s0 ^ alert_minor_o_s1;
  assign alert_major_internal_o = alert_major_internal_o_s0 ^ alert_major_internal_o_s1;
  assign alert_major_bus_o = alert_major_bus_o_s0 ^ alert_major_bus_o_s1;
  assign core_busy_o = core_busy_o_s0 ^ core_busy_o_s1;

  // Crash dump structure conversion
  assign crash_dump_o.current_pc = crash_dump_o_s0[0] ^ crash_dump_o_s1[0];
  assign crash_dump_o.next_pc = crash_dump_o_s0[1] ^ crash_dump_o_s1[1];
  assign crash_dump_o.last_data_addr = crash_dump_o_s0[2] ^ crash_dump_o_s1[2];
  assign crash_dump_o.exception_pc = crash_dump_o_s0[3] ^ crash_dump_o_s1[3];
  assign crash_dump_o.exception_addr = crash_dump_o_s0[4] ^ crash_dump_o_s1[4];

  // Instantiate the gate-level netlist
  ibex_core u_ibex_core_gatelevel (
    .clk_i(clk_i),
    .rst_ni(rst_ni),
    
    // Dual-rail inputs
    .hart_id_i(hart_id_i_s0),
    .hart_id_i_s1(hart_id_i_s1),
    .boot_addr_i(boot_addr_i_s0),
    .boot_addr_i_s1(boot_addr_i_s1),
    
    // Instruction interface
    .instr_gnt_i(instr_gnt_i_s0),
    .instr_gnt_i_s1(instr_gnt_i_s1),
    .instr_rvalid_i(instr_rvalid_i_s0),
    .instr_rvalid_i_s1(instr_rvalid_i_s1),
    .instr_rdata_i(instr_rdata_i_s0),
    .instr_rdata_i_s1(instr_rdata_i_s1),
    .instr_err_i(instr_err_i_s0),
    .instr_err_i_s1(instr_err_i_s1),
    .instr_req_o(instr_req_o_s0),
    .instr_req_o_s1(instr_req_o_s1),
    .instr_addr_o(instr_addr_o_s0),
    .instr_addr_o_s1(instr_addr_o_s1),
    
    // Data interface
    .data_gnt_i(data_gnt_i_s0),
    .data_gnt_i_s1(data_gnt_i_s1),
    .data_rvalid_i(data_rvalid_i_s0),
    .data_rvalid_i_s1(data_rvalid_i_s1),
    .data_rdata_i(data_rdata_i_s0),
    .data_rdata_i_s1(data_rdata_i_s1),
    .data_err_i(data_err_i_s0),
    .data_err_i_s1(data_err_i_s1),
    .data_req_o(data_req_o_s0),
    .data_req_o_s1(data_req_o_s1),
    .data_we_o(data_we_o_s0),
    .data_we_o_s1(data_we_o_s1),
    .data_be_o(data_be_o_s0),
    .data_be_o_s1(data_be_o_s1),
    .data_addr_o(data_addr_o_s0),
    .data_addr_o_s1(data_addr_o_s1),
    .data_wdata_o(data_wdata_o_s0),
    .data_wdata_o_s1(data_wdata_o_s1),
    
    // Register file interface
    .dummy_instr_id_o(dummy_instr_id_o_s0),
    .dummy_instr_id_o_s1(dummy_instr_id_o_s1),
    .dummy_instr_wb_o(dummy_instr_wb_o_s0),
    .dummy_instr_wb_o_s1(dummy_instr_wb_o_s1),
    .rf_raddr_a_o(rf_raddr_a_o_s0),
    .rf_raddr_a_o_s1(rf_raddr_a_o_s1),
    .rf_raddr_b_o(rf_raddr_b_o_s0),
    .rf_raddr_b_o_s1(rf_raddr_b_o_s1),
    .rf_waddr_wb_o(rf_waddr_wb_o_s0),
    .rf_waddr_wb_o_s1(rf_waddr_wb_o_s1),
    .rf_we_wb_o(rf_we_wb_o_s0),
    .rf_we_wb_o_s1(rf_we_wb_o_s1),
    .rf_wdata_wb_ecc_o(rf_wdata_wb_ecc_o_s0),
    .rf_wdata_wb_ecc_o_s1(rf_wdata_wb_ecc_o_s1),
    .rf_rdata_a_ecc_i(rf_rdata_a_ecc_i_s0),
    .rf_rdata_a_ecc_i_s1(rf_rdata_a_ecc_i_s1),
    .rf_rdata_b_ecc_i(rf_rdata_b_ecc_i_s0),
    .rf_rdata_b_ecc_i_s1(rf_rdata_b_ecc_i_s1),
    
    // ICache interface
    .ic_tag_req_o(ic_tag_req_o_s0),
    .ic_tag_req_o_s1(ic_tag_req_o_s1),
    .ic_tag_write_o(ic_tag_write_o_s0),
    .ic_tag_write_o_s1(ic_tag_write_o_s1),
    .ic_tag_addr_o(ic_tag_addr_o_s0),
    .ic_tag_addr_o_s1(ic_tag_addr_o_s1),
    .ic_tag_wdata_o(ic_tag_wdata_o_s0),
    .ic_tag_wdata_o_s1(ic_tag_wdata_o_s1),
    .\ic_tag_rdata_i[0] (ic_tag_rdata_i_s0[0]),
    .\ic_tag_rdata_i[1] (ic_tag_rdata_i_s0[1]),
    .\ic_tag_rdata_i_s1[0] (ic_tag_rdata_i_s1[0]),
    .\ic_tag_rdata_i_s1[1] (ic_tag_rdata_i_s1[1]),
    .ic_data_req_o(ic_data_req_o_s0),
    .ic_data_req_o_s1(ic_data_req_o_s1),
    .ic_data_write_o(ic_data_write_o_s0),
    .ic_data_write_o_s1(ic_data_write_o_s1),
    .ic_data_addr_o(ic_data_addr_o_s0),
    .ic_data_addr_o_s1(ic_data_addr_o_s1),
    .ic_data_wdata_o(ic_data_wdata_o_s0),
    .ic_data_wdata_o_s1(ic_data_wdata_o_s1),
    .\ic_data_rdata_i[0] (ic_data_rdata_i_s0[0]),
    .\ic_data_rdata_i[1] (ic_data_rdata_i_s0[1]),
    .\ic_data_rdata_i_s1[0] (ic_data_rdata_i_s1[0]),
    .\ic_data_rdata_i_s1[1] (ic_data_rdata_i_s1[1]),
    .ic_scr_key_valid_i(ic_scr_key_valid_i_s0),
    .ic_scr_key_valid_i_s1(ic_scr_key_valid_i_s1),
    .ic_scr_key_req_o(ic_scr_key_req_o_s0),
    .ic_scr_key_req_o_s1(ic_scr_key_req_o_s1),
    
    // Interrupts
    .irq_software_i(irq_software_i_s0),
    .irq_software_i_s1(irq_software_i_s1),
    .irq_timer_i(irq_timer_i_s0),
    .irq_timer_i_s1(irq_timer_i_s1),
    .irq_external_i(irq_external_i_s0),
    .irq_external_i_s1(irq_external_i_s1),
    .irq_fast_i(irq_fast_i_s0),
    .irq_fast_i_s1(irq_fast_i_s1),
    .irq_nm_i(irq_nm_i_s0),
    .irq_nm_i_s1(irq_nm_i_s1),
    .irq_pending_o(irq_pending_o_s0),
    .irq_pending_o_s1(irq_pending_o_s1),
    
    // Debug
    .debug_req_i(debug_req_i_s0),
    .debug_req_i_s1(debug_req_i_s1),
    
    // Crash dump
    .\crash_dump_o[current_pc] (crash_dump_o_s0[0]),
    .\crash_dump_o[next_pc] (crash_dump_o_s0[1]),
    .\crash_dump_o[last_data_addr] (crash_dump_o_s0[2]),
    .\crash_dump_o[exception_pc] (crash_dump_o_s0[3]),
    .\crash_dump_o[exception_addr] (crash_dump_o_s0[4]),
    .\crash_dump_o_s1[current_pc] (crash_dump_o_s1[0]),
    .\crash_dump_o_s1[next_pc] (crash_dump_o_s1[1]),
    .\crash_dump_o_s1[last_data_addr] (crash_dump_o_s1[2]),
    .\crash_dump_o_s1[exception_pc] (crash_dump_o_s1[3]),
    .\crash_dump_o_s1[exception_addr] (crash_dump_o_s1[4]),
    
    .double_fault_seen_o(double_fault_seen_o_s0),
    .double_fault_seen_o_s1(double_fault_seen_o_s1),
    
    // CPU control
    .fetch_enable_i(fetch_enable_i_s0),
    .fetch_enable_i_s1(fetch_enable_i_s1),
    .alert_minor_o(alert_minor_o_s0),
    .alert_minor_o_s1(alert_minor_o_s1),
    .alert_major_internal_o(alert_major_internal_o_s0),
    .alert_major_internal_o_s1(alert_major_internal_o_s1),
    .alert_major_bus_o(alert_major_bus_o_s0),
    .alert_major_bus_o_s1(alert_major_bus_o_s1),
    .core_busy_o(core_busy_o_s0),
    .core_busy_o_s1(core_busy_o_s1),
    
    // Random bits for masking
    .randbits(randbits)
  );

endmodule
