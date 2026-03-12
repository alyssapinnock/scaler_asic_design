// Bypass wrapper: same interface as ibex_core_wrapper but instantiates the
// UNMASKED ibex_core directly, ignoring randbits.
// This lets us test the modified ibex_simple_system / ibex_top infrastructure
// with the standard (unmasked) RTL to verify functional correctness.
//
// RVFI ports are passed through since ibex_top.sv defines RVFI.

module ibex_core_wrapper import ibex_pkg::*; (
    input  logic        clk_i,
    input  logic        rst_ni,

    input  logic [31:0] hart_id_i,
    input  logic [31:0] boot_addr_i,

    // Instruction memory interface
    output logic        instr_req_o,
    input  logic        instr_gnt_i,
    input  logic        instr_rvalid_i,
    output logic [31:0] instr_addr_o,
    input  logic [31:0] instr_rdata_i,
    input  logic        instr_err_i,

    // Data memory interface
    output logic        data_req_o,
    input  logic        data_gnt_i,
    input  logic        data_rvalid_i,
    output logic        data_we_o,
    output logic [3:0]  data_be_o,
    output logic [31:0] data_addr_o,
    output logic [31:0] data_wdata_o,
    input  logic [31:0] data_rdata_i,
    input  logic        data_err_i,

    // Register file interface
    output logic        dummy_instr_id_o,
    output logic        dummy_instr_wb_o,
    output logic [4:0]  rf_raddr_a_o,
    output logic [4:0]  rf_raddr_b_o,
    output logic [4:0]  rf_waddr_wb_o,
    output logic        rf_we_wb_o,
    output logic [31:0] rf_wdata_wb_ecc_o,
    input  logic [31:0] rf_rdata_a_ecc_i,
    input  logic [31:0] rf_rdata_b_ecc_i,

    // RAMs interface
    output logic [1:0]  ic_tag_req_o,
    output logic        ic_tag_write_o,
    output logic [7:0]  ic_tag_addr_o,
    output logic [21:0] ic_tag_wdata_o,
    input  logic [21:0] ic_tag_rdata_i [2],
    output logic [1:0]  ic_data_req_o,
    output logic        ic_data_write_o,
    output logic [7:0]  ic_data_addr_o,
    output logic [63:0] ic_data_wdata_o,
    input  logic [63:0] ic_data_rdata_i [2],
    input  logic        ic_scr_key_valid_i,
    output logic        ic_scr_key_req_o,

    // Interrupt inputs
    input  logic        irq_software_i,
    input  logic        irq_timer_i,
    input  logic        irq_external_i,
    input  logic [14:0] irq_fast_i,
    input  logic        irq_nm_i,
    output logic        irq_pending_o,

    // Debug Interface
    input  logic        debug_req_i,
    output crash_dump_t crash_dump_o,
    output logic        double_fault_seen_o,

    // RVFI - pass through from ibex_core
`ifdef RVFI
    output logic        rvfi_valid,
    output logic [63:0] rvfi_order,
    output logic [31:0] rvfi_insn,
    output logic        rvfi_trap,
    output logic        rvfi_halt,
    output logic        rvfi_intr,
    output logic [ 1:0] rvfi_mode,
    output logic [ 1:0] rvfi_ixl,
    output logic [ 4:0] rvfi_rs1_addr,
    output logic [ 4:0] rvfi_rs2_addr,
    output logic [ 4:0] rvfi_rs3_addr,
    output logic [31:0] rvfi_rs1_rdata,
    output logic [31:0] rvfi_rs2_rdata,
    output logic [31:0] rvfi_rs3_rdata,
    output logic [ 4:0] rvfi_rd_addr,
    output logic [31:0] rvfi_rd_wdata,
    output logic [31:0] rvfi_pc_rdata,
    output logic [31:0] rvfi_pc_wdata,
    output logic [31:0] rvfi_mem_addr,
    output logic [ 3:0] rvfi_mem_rmask,
    output logic [ 3:0] rvfi_mem_wmask,
    output logic [31:0] rvfi_mem_rdata,
    output logic [31:0] rvfi_mem_wdata,
    output logic [31:0] rvfi_ext_pre_mip,
    output logic [31:0] rvfi_ext_post_mip,
    output logic        rvfi_ext_nmi,
    output logic        rvfi_ext_nmi_int,
    output logic        rvfi_ext_debug_req,
    output logic        rvfi_ext_debug_mode,
    output logic        rvfi_ext_rf_wr_suppress,
    output logic [63:0] rvfi_ext_mcycle,
    output logic [31:0] rvfi_ext_mhpmcounters [10],
    output logic [31:0] rvfi_ext_mhpmcountersh [10],
    output logic        rvfi_ext_ic_scr_key_valid,
    output logic        rvfi_ext_irq_valid,
`endif

    // CPU Control Signals
    input  logic [3:0]  fetch_enable_i,
    output logic        alert_minor_o,
    output logic        alert_major_internal_o,
    output logic        alert_major_bus_o,
    output logic [3:0]  core_busy_o,

    // Masking random bits (IGNORED in this bypass wrapper)
    input  logic [15:0] randbits
);

    // randbits is unused in bypass mode
    logic unused_randbits;
    assign unused_randbits = ^randbits;

    // Instantiate the standard (unmasked) ibex_core directly
    ibex_core #(
        .PMPEnable        (1'b0),
        .PMPGranularity   (0),
        .PMPNumRegions    (4),
        .MHPMCounterNum   (0),
        .MHPMCounterWidth (40),
        .RV32E            (1'b0),
        .RV32M            (RV32MFast),
        .RV32B            (RV32BNone),
        .BranchTargetALU  (1'b0),
        .WritebackStage   (1'b0),
        .ICache           (1'b0),
        .ICacheECC        (1'b0),
        .BranchPredictor  (1'b0),
        .DbgTriggerEn     (1'b0),
        .DbgHwBreakNum    (1),
        .ResetAll         (1'b0),
        .SecureIbex       (1'b0),
        .DummyInstructions(1'b0),
        .RegFileECC       (1'b0),
        .RegFileDataWidth (32),
        .MemECC           (1'b0),
        .MemDataWidth     (32),
        .DmHaltAddr       (32'h00100000),
        .DmExceptionAddr  (32'h00100000)
    ) u_ibex_core (
        .clk_i,
        .rst_ni,
        .hart_id_i,
        .boot_addr_i,

        .instr_req_o,
        .instr_gnt_i,
        .instr_rvalid_i,
        .instr_addr_o,
        .instr_rdata_i,
        .instr_err_i,

        .data_req_o,
        .data_gnt_i,
        .data_rvalid_i,
        .data_we_o,
        .data_be_o,
        .data_addr_o,
        .data_wdata_o,
        .data_rdata_i,
        .data_err_i,

        .dummy_instr_id_o,
        .dummy_instr_wb_o,
        .rf_raddr_a_o,
        .rf_raddr_b_o,
        .rf_waddr_wb_o,
        .rf_we_wb_o,
        .rf_wdata_wb_ecc_o,
        .rf_rdata_a_ecc_i,
        .rf_rdata_b_ecc_i,

        .ic_tag_req_o,
        .ic_tag_write_o,
        .ic_tag_addr_o,
        .ic_tag_wdata_o,
        .ic_tag_rdata_i,
        .ic_data_req_o,
        .ic_data_write_o,
        .ic_data_addr_o,
        .ic_data_wdata_o,
        .ic_data_rdata_i,
        .ic_scr_key_valid_i,
        .ic_scr_key_req_o,

        .irq_software_i,
        .irq_timer_i,
        .irq_external_i,
        .irq_fast_i,
        .irq_nm_i,
        .irq_pending_o,

        .debug_req_i,
        .crash_dump_o,
        .double_fault_seen_o,

`ifdef RVFI
        .rvfi_valid,
        .rvfi_order,
        .rvfi_insn,
        .rvfi_trap,
        .rvfi_halt,
        .rvfi_intr,
        .rvfi_mode,
        .rvfi_ixl,
        .rvfi_rs1_addr,
        .rvfi_rs2_addr,
        .rvfi_rs3_addr,
        .rvfi_rs1_rdata,
        .rvfi_rs2_rdata,
        .rvfi_rs3_rdata,
        .rvfi_rd_addr,
        .rvfi_rd_wdata,
        .rvfi_pc_rdata,
        .rvfi_pc_wdata,
        .rvfi_mem_addr,
        .rvfi_mem_rmask,
        .rvfi_mem_wmask,
        .rvfi_mem_rdata,
        .rvfi_mem_wdata,
        .rvfi_ext_pre_mip,
        .rvfi_ext_post_mip,
        .rvfi_ext_nmi,
        .rvfi_ext_nmi_int,
        .rvfi_ext_debug_req,
        .rvfi_ext_debug_mode,
        .rvfi_ext_rf_wr_suppress,
        .rvfi_ext_mcycle,
        .rvfi_ext_mhpmcounters,
        .rvfi_ext_mhpmcountersh,
        .rvfi_ext_ic_scr_key_valid,
        .rvfi_ext_irq_valid,
`endif

        .fetch_enable_i,
        .alert_minor_o,
        .alert_major_internal_o,
        .alert_major_bus_o,
        .core_busy_o
    );

endmodule
