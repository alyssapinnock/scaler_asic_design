// minimal_netlist_tb.sv — Bare-bones testbench directly driving the netlist ibex_core
// Purpose: Isolate whether x-propagation is a netlist issue or system integration issue.
`timescale 1ns/1ps

module minimal_netlist_tb;

  // Clock and reset
  reg clk_i;
  reg rst_ni;

  initial clk_i = 0;
  always #1 clk_i = ~clk_i;

  // All inputs to ibex_core (netlist)
  reg  [31:0] hart_id_i       = 32'h0;
  reg  [31:0] boot_addr_i     = 32'h00100080;
  reg         instr_gnt_i     = 1'b1;     // always grant
  reg         instr_rvalid_i  = 1'b0;
  reg  [31:0] instr_rdata_i   = 32'h00000013; // NOP
  reg         instr_err_i     = 1'b0;
  reg         data_gnt_i      = 1'b1;
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
  reg   [3:0] fetch_enable_i  = 4'b0101;  // IbexMuBiOn

  // Share-1 inputs: all zeros (XOR with 0 = identity)
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

  // Outputs
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

  // DUT instantiation — directly the netlist ibex_core
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

  // Simple instruction response: after instr_req, return NOP on next cycle
  always @(posedge clk_i) begin
    if (!rst_ni) begin
      instr_rvalid_i <= 1'b0;
    end else begin
      instr_rvalid_i <= instr_req_o & instr_gnt_i;
    end
  end

  // Data response: return 0 on next cycle
  always @(posedge clk_i) begin
    if (!rst_ni) begin
      data_rvalid_i <= 1'b0;
    end else begin
      data_rvalid_i <= data_req_o & data_gnt_i;
    end
  end

  // Reset sequence
  initial begin
    rst_ni = 1'b0;
    #10;
    rst_ni = 1'b1;
    $display("[MIN-TB] Reset released at %0t", $time);
  end

  // Monitor and terminate
  integer i;
  initial begin
    @(posedge rst_ni);
    #1;
    $display("[MIN-TB] Post-reset: core_busy_o=%04b core_busy_o_s1=%04b", core_busy_o, core_busy_o_s1);
    $display("[MIN-TB] Post-reset: instr_req_o=%b instr_req_o_s1=%b", instr_req_o, instr_req_o_s1);
    $display("[MIN-TB] Post-reset: irq_pending_o=%b irq_pending_o_s1=%b", irq_pending_o, irq_pending_o_s1);

    for (i = 0; i < 30; i++) begin
      @(posedge clk_i);
      #0.1;
      $display("[MIN-TB %0d] t=%0t instr_req=%b/%b addr=%08h/%08h core_busy=%04b/%04b data_req=%b/%b",
        i, $time,
        instr_req_o, instr_req_o_s1,
        instr_addr_o, instr_addr_o_s1,
        core_busy_o, core_busy_o_s1,
        data_req_o, data_req_o_s1);
    end

    $display("[MIN-TB] --- Checking specific internal signals ---");
    // Probe some internal wires in the netlist
    $display("[MIN-TB] u_dut.ctrl_busy=%b", u_dut.ctrl_busy);
    $display("[MIN-TB] u_dut.if_busy=%b", u_dut.if_busy);
    $display("[MIN-TB] u_dut.lsu_busy=%b", u_dut.lsu_busy);
    $display("[MIN-TB] u_dut.instr_req_int=%b", u_dut.instr_req_int);
    $display("[MIN-TB] u_dut.instr_valid_id=%b", u_dut.instr_valid_id);
    $display("[MIN-TB] u_dut.fetch_enable_i=%04b", u_dut.fetch_enable_i);
    $display("[MIN-TB] u_dut.fetch_enable_i_s1=%04b", u_dut.fetch_enable_i_s1);
    
    // Check if clk actually reaches inside
    $display("[MIN-TB] u_dut.clk_i=%b", u_dut.clk_i);
    $display("[MIN-TB] u_dut.rst_ni=%b", u_dut.rst_ni);

    $display("[MIN-TB] Done. Finishing.");
    $finish;
  end

endmodule
