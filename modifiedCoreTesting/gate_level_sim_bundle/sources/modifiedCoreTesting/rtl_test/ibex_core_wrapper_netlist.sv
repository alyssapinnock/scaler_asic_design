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

	// CPU Control Signals
	input  logic [3:0]  fetch_enable_i,
	output logic        alert_minor_o,
	output logic        alert_major_internal_o,
	output logic        alert_major_bus_o,
	output logic [3:0]  core_busy_o,

	input  logic [15:0] randbits
);



	// =================================================================
	// Share-0 and share-1 signals for masked netlist inputs
	// =================================================================
	logic [31:0] hart_id_i_s0,           hart_id_i_s1;
	logic [31:0] boot_addr_i_s0,         boot_addr_i_s1;
	logic        instr_gnt_i_s0,         instr_gnt_i_s1;
	logic        instr_rvalid_i_s0,      instr_rvalid_i_s1;
	logic [31:0] instr_rdata_i_s0,       instr_rdata_i_s1;
	logic        instr_err_i_s0,         instr_err_i_s1;
	logic        data_gnt_i_s0,          data_gnt_i_s1;
	logic        data_rvalid_i_s0,       data_rvalid_i_s1;
	logic [31:0] data_rdata_i_s0,        data_rdata_i_s1;
	logic        data_err_i_s0,          data_err_i_s1;
	logic [31:0] rf_rdata_a_ecc_i_s0,    rf_rdata_a_ecc_i_s1;
	logic [31:0] rf_rdata_b_ecc_i_s0,    rf_rdata_b_ecc_i_s1;
	logic [21:0] ic_tag_rdata_i_s0 [2];
	logic [21:0] ic_tag_rdata_i_s1 [2];
	logic [63:0] ic_data_rdata_i_s0 [2];
	logic [63:0] ic_data_rdata_i_s1 [2];
	logic        ic_scr_key_valid_i_s0,  ic_scr_key_valid_i_s1;
	logic        irq_software_i_s0,      irq_software_i_s1;
	logic        irq_timer_i_s0,         irq_timer_i_s1;
	logic        irq_external_i_s0,      irq_external_i_s1;
	logic [14:0] irq_fast_i_s0,          irq_fast_i_s1;
	logic        irq_nm_i_s0,            irq_nm_i_s1;
	logic        debug_req_i_s0,         debug_req_i_s1;
	logic [3:0]  fetch_enable_i_s0,      fetch_enable_i_s1;

	// =================================================================
	// Masked netlist output shares (share 0 and share 1)
	// =================================================================
	logic        instr_req_o_s0,              instr_req_o_s1;
	logic [31:0] instr_addr_o_s0,             instr_addr_o_s1;
	logic        data_req_o_s0,               data_req_o_s1;
	logic        data_we_o_s0,                data_we_o_s1;
	logic [3:0]  data_be_o_s0,                data_be_o_s1;
	logic [31:0] data_addr_o_s0,              data_addr_o_s1;
	logic [31:0] data_wdata_o_s0,             data_wdata_o_s1;
	logic        dummy_instr_id_o_s0,         dummy_instr_id_o_s1;
	logic        dummy_instr_wb_o_s0,         dummy_instr_wb_o_s1;
	logic [4:0]  rf_raddr_a_o_s0,             rf_raddr_a_o_s1;
	logic [4:0]  rf_raddr_b_o_s0,             rf_raddr_b_o_s1;
	logic [4:0]  rf_waddr_wb_o_s0,            rf_waddr_wb_o_s1;
	logic        rf_we_wb_o_s0,               rf_we_wb_o_s1;
	logic [31:0] rf_wdata_wb_ecc_o_s0,        rf_wdata_wb_ecc_o_s1;
	logic [1:0]  ic_tag_req_o_s0,             ic_tag_req_o_s1;
	logic        ic_tag_write_o_s0,           ic_tag_write_o_s1;
	logic [7:0]  ic_tag_addr_o_s0,            ic_tag_addr_o_s1;
	logic [21:0] ic_tag_wdata_o_s0,           ic_tag_wdata_o_s1;
	logic [1:0]  ic_data_req_o_s0,            ic_data_req_o_s1;
	logic        ic_data_write_o_s0,          ic_data_write_o_s1;
	logic [7:0]  ic_data_addr_o_s0,           ic_data_addr_o_s1;
	logic [63:0] ic_data_wdata_o_s0,          ic_data_wdata_o_s1;
	logic        ic_scr_key_req_o_s0,         ic_scr_key_req_o_s1;
	logic        irq_pending_o_s0,            irq_pending_o_s1;
	logic [31:0] crash_dump_current_pc_s0,    crash_dump_current_pc_s1;
	logic [31:0] crash_dump_next_pc_s0,       crash_dump_next_pc_s1;
	logic [31:0] crash_dump_last_data_addr_s0, crash_dump_last_data_addr_s1;
	logic [31:0] crash_dump_exception_pc_s0,  crash_dump_exception_pc_s1;
	logic [31:0] crash_dump_exception_addr_s0, crash_dump_exception_addr_s1;
	logic        double_fault_seen_o_s0,      double_fault_seen_o_s1;
	logic        alert_minor_o_s0,            alert_minor_o_s1;
	logic        alert_major_internal_o_s0,   alert_major_internal_o_s1;
	logic        alert_major_bus_o_s0,        alert_major_bus_o_s1;
	logic [3:0]  core_busy_o_s0,              core_busy_o_s1;

	// =================================================================
	// Split inputs into XOR shares using 16-bit randbits
	// =================================================================

	// --- 1-bit signals (each gets a unique randbits bit) ---
	assign instr_gnt_i_s0         = instr_gnt_i        ^ randbits[0];
	assign instr_gnt_i_s1         =                       randbits[0];

	assign instr_rvalid_i_s0      = instr_rvalid_i     ^ randbits[1];
	assign instr_rvalid_i_s1      =                       randbits[1];

	assign instr_err_i_s0         = instr_err_i        ^ randbits[2];
	assign instr_err_i_s1         =                       randbits[2];

	assign data_gnt_i_s0          = data_gnt_i         ^ randbits[3];
	assign data_gnt_i_s1          =                       randbits[3];

	assign data_rvalid_i_s0       = data_rvalid_i      ^ randbits[4];
	assign data_rvalid_i_s1       =                       randbits[4];

	assign data_err_i_s0          = data_err_i         ^ randbits[5];
	assign data_err_i_s1          =                       randbits[5];

	assign ic_scr_key_valid_i_s0  = ic_scr_key_valid_i ^ randbits[6];
	assign ic_scr_key_valid_i_s1  =                       randbits[6];

	assign irq_software_i_s0      = irq_software_i     ^ randbits[7];
	assign irq_software_i_s1      =                       randbits[7];

	assign irq_timer_i_s0         = irq_timer_i        ^ randbits[8];
	assign irq_timer_i_s1         =                       randbits[8];

	assign irq_external_i_s0      = irq_external_i     ^ randbits[9];
	assign irq_external_i_s1      =                       randbits[9];

	assign irq_nm_i_s0            = irq_nm_i           ^ randbits[10];
	assign irq_nm_i_s1            =                       randbits[10];

	assign debug_req_i_s0         = debug_req_i        ^ randbits[11];
	assign debug_req_i_s1         =                       randbits[11];

	// --- 32-bit signals ({2{randbits}} = 32 bits) ---
	assign hart_id_i_s0           = hart_id_i          ^ {2{randbits}};
	assign hart_id_i_s1           =                       {2{randbits}};

	assign boot_addr_i_s0         = boot_addr_i        ^ {2{randbits}};
	assign boot_addr_i_s1         =                       {2{randbits}};

	assign instr_rdata_i_s0       = instr_rdata_i      ^ {2{randbits}};
	assign instr_rdata_i_s1       =                       {2{randbits}};

	assign data_rdata_i_s0        = data_rdata_i       ^ {2{randbits}};
	assign data_rdata_i_s1        =                       {2{randbits}};

	// --- RegFileDataWidth-bit signals (assumed 32: {2{randbits}}) ---
	assign rf_rdata_a_ecc_i_s0    = rf_rdata_a_ecc_i   ^ {2{randbits}};
	assign rf_rdata_a_ecc_i_s1    =                       {2{randbits}};

	assign rf_rdata_b_ecc_i_s0    = rf_rdata_b_ecc_i   ^ {2{randbits}};
	assign rf_rdata_b_ecc_i_s1    =                       {2{randbits}};

	// --- 22-bit signals ({randbits, randbits[5:0]} = 22 bits) ---
	assign ic_tag_rdata_i_s0[1]   = ic_tag_rdata_i[1]  ^ {randbits, randbits[5:0]};
	assign ic_tag_rdata_i_s1[1]   =                       {randbits, randbits[5:0]};

	assign ic_tag_rdata_i_s0[0]   = ic_tag_rdata_i[0]  ^ {randbits, randbits[5:0]};
	assign ic_tag_rdata_i_s1[0]   =                       {randbits, randbits[5:0]};

	// --- 64-bit signals ({4{randbits}} = 64 bits) ---
	assign ic_data_rdata_i_s0[1]  = ic_data_rdata_i[1] ^ {4{randbits}};
	assign ic_data_rdata_i_s1[1]  =                       {4{randbits}};

	assign ic_data_rdata_i_s0[0]  = ic_data_rdata_i[0] ^ {4{randbits}};
	assign ic_data_rdata_i_s1[0]  =                       {4{randbits}};

	// --- 15-bit signal (randbits[14:0]) ---
	assign irq_fast_i_s0          = irq_fast_i         ^ randbits[14:0];
	assign irq_fast_i_s1          =                       randbits[14:0];

	// --- 4-bit signal (randbits[3:0]) ---
	assign fetch_enable_i_s0      = fetch_enable_i     ^ randbits[3:0];
	assign fetch_enable_i_s1      =                       randbits[3:0];

	// =================================================================
	// Recombine outputs from shares (output = s0 ^ s1)
	// =================================================================
	assign instr_req_o             = instr_req_o_s0 ^ instr_req_o_s1;
	assign instr_addr_o            = instr_addr_o_s0 ^ instr_addr_o_s1;
	assign data_req_o              = data_req_o_s0 ^ data_req_o_s1;
	assign data_we_o               = data_we_o_s0 ^ data_we_o_s1;
	assign data_be_o               = data_be_o_s0 ^ data_be_o_s1;
	// NOTE: Synthesis bug — data_addr_o_s1[1:0] tiedoff to 1'b1 and
	// data_addr_o[1:0] (s0 share) tiedoff to 1'b0 in netlist, giving
	// 0^1=1 for bits[1:0]. For RISC-V word-aligned data accesses,
	// bits[1:0] must be 00. Force correct reconstruction here.
	assign data_addr_o             = (data_addr_o_s0 ^ data_addr_o_s1) & ~32'h3;
	assign data_wdata_o            = data_wdata_o_s0 ^ data_wdata_o_s1;
	assign dummy_instr_id_o        = dummy_instr_id_o_s0 ^ dummy_instr_id_o_s1;
	assign dummy_instr_wb_o        = dummy_instr_wb_o_s0 ^ dummy_instr_wb_o_s1;
	assign rf_raddr_a_o            = rf_raddr_a_o_s0 ^ rf_raddr_a_o_s1;
	assign rf_raddr_b_o            = rf_raddr_b_o_s0 ^ rf_raddr_b_o_s1;
	assign rf_waddr_wb_o           = rf_waddr_wb_o_s0 ^ rf_waddr_wb_o_s1;
	assign rf_we_wb_o              = rf_we_wb_o_s0 ^ rf_we_wb_o_s1;
	assign rf_wdata_wb_ecc_o       = rf_wdata_wb_ecc_o_s0 ^ rf_wdata_wb_ecc_o_s1;
	assign ic_tag_req_o            = ic_tag_req_o_s0 ^ ic_tag_req_o_s1;
	assign ic_tag_write_o          = ic_tag_write_o_s0 ^ ic_tag_write_o_s1;
	assign ic_tag_addr_o           = ic_tag_addr_o_s0 ^ ic_tag_addr_o_s1;
	assign ic_tag_wdata_o          = ic_tag_wdata_o_s0 ^ ic_tag_wdata_o_s1;
	assign ic_data_req_o           = ic_data_req_o_s0 ^ ic_data_req_o_s1;
	assign ic_data_write_o         = ic_data_write_o_s0 ^ ic_data_write_o_s1;
	assign ic_data_addr_o          = ic_data_addr_o_s0 ^ ic_data_addr_o_s1;
	assign ic_data_wdata_o         = ic_data_wdata_o_s0 ^ ic_data_wdata_o_s1;
	assign ic_scr_key_req_o        = ic_scr_key_req_o_s0 ^ ic_scr_key_req_o_s1;
	assign irq_pending_o           = irq_pending_o_s0 ^ irq_pending_o_s1;
	assign crash_dump_o.current_pc     = crash_dump_current_pc_s0 ^ crash_dump_current_pc_s1;
	assign crash_dump_o.next_pc        = crash_dump_next_pc_s0 ^ crash_dump_next_pc_s1;
	assign crash_dump_o.last_data_addr = crash_dump_last_data_addr_s0 ^ crash_dump_last_data_addr_s1;
	assign crash_dump_o.exception_pc   = crash_dump_exception_pc_s0 ^ crash_dump_exception_pc_s1;
	assign crash_dump_o.exception_addr = crash_dump_exception_addr_s0 ^ crash_dump_exception_addr_s1;
	assign double_fault_seen_o     = double_fault_seen_o_s0 ^ double_fault_seen_o_s1;
	assign alert_minor_o           = alert_minor_o_s0 ^ alert_minor_o_s1;
	assign alert_major_internal_o  = alert_major_internal_o_s0 ^ alert_major_internal_o_s1;
	assign alert_major_bus_o       = alert_major_bus_o_s0 ^ alert_major_bus_o_s1;
	assign core_busy_o             = core_busy_o_s0 ^ core_busy_o_s1;

	// =================================================================
	// Masked netlist instantiation
	// =================================================================
	ibex_core u_masked (
		.clk_i(clk_i),
		.rst_ni(rst_ni),

		// Primary inputs (share 0)
		.hart_id_i(hart_id_i_s0),
		.boot_addr_i(boot_addr_i_s0),
		.instr_gnt_i(instr_gnt_i_s0),
		.instr_rvalid_i(instr_rvalid_i_s0),
		.instr_rdata_i(instr_rdata_i_s0),
		.instr_err_i(instr_err_i_s0),
		.data_gnt_i(data_gnt_i_s0),
		.data_rvalid_i(data_rvalid_i_s0),
		.data_rdata_i(data_rdata_i_s0),
		.data_err_i(data_err_i_s0),
		.rf_rdata_a_ecc_i(rf_rdata_a_ecc_i_s0),
		.rf_rdata_b_ecc_i(rf_rdata_b_ecc_i_s0),
		.\ic_tag_rdata_i[1] (ic_tag_rdata_i_s0[1]),
		.\ic_tag_rdata_i[0] (ic_tag_rdata_i_s0[0]),
		.\ic_data_rdata_i[1] (ic_data_rdata_i_s0[1]),
		.\ic_data_rdata_i[0] (ic_data_rdata_i_s0[0]),
		.ic_scr_key_valid_i(ic_scr_key_valid_i_s0),
		.irq_software_i(irq_software_i_s0),
		.irq_timer_i(irq_timer_i_s0),
		.irq_external_i(irq_external_i_s0),
		.irq_fast_i(irq_fast_i_s0),
		.irq_nm_i(irq_nm_i_s0),
		.debug_req_i(debug_req_i_s0),
		.fetch_enable_i(fetch_enable_i_s0),

		// Primary outputs (share 0)
		.instr_req_o(instr_req_o_s0),
		.instr_addr_o(instr_addr_o_s0),
		.data_req_o(data_req_o_s0),
		.data_we_o(data_we_o_s0),
		.data_be_o(data_be_o_s0),
		.data_addr_o(data_addr_o_s0),
		.data_wdata_o(data_wdata_o_s0),
		.dummy_instr_id_o(dummy_instr_id_o_s0),
		.dummy_instr_wb_o(dummy_instr_wb_o_s0),
		.rf_raddr_a_o(rf_raddr_a_o_s0),
		.rf_raddr_b_o(rf_raddr_b_o_s0),
		.rf_waddr_wb_o(rf_waddr_wb_o_s0),
		.rf_we_wb_o(rf_we_wb_o_s0),
		.rf_wdata_wb_ecc_o(rf_wdata_wb_ecc_o_s0),
		.ic_tag_req_o(ic_tag_req_o_s0),
		.ic_tag_write_o(ic_tag_write_o_s0),
		.ic_tag_addr_o(ic_tag_addr_o_s0),
		.ic_tag_wdata_o(ic_tag_wdata_o_s0),
		.ic_data_req_o(ic_data_req_o_s0),
		.ic_data_write_o(ic_data_write_o_s0),
		.ic_data_addr_o(ic_data_addr_o_s0),
		.ic_data_wdata_o(ic_data_wdata_o_s0),
		.ic_scr_key_req_o(ic_scr_key_req_o_s0),
		.irq_pending_o(irq_pending_o_s0),
		.\crash_dump_o[current_pc] (crash_dump_current_pc_s0),
		.\crash_dump_o[next_pc] (crash_dump_next_pc_s0),
		.\crash_dump_o[last_data_addr] (crash_dump_last_data_addr_s0),
		.\crash_dump_o[exception_pc] (crash_dump_exception_pc_s0),
		.\crash_dump_o[exception_addr] (crash_dump_exception_addr_s0),
		.double_fault_seen_o(double_fault_seen_o_s0),
		.alert_minor_o(alert_minor_o_s0),
		.alert_major_internal_o(alert_major_internal_o_s0),
		.alert_major_bus_o(alert_major_bus_o_s0),
		.core_busy_o(core_busy_o_s0),

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
		.\ic_tag_rdata_i_s1[1] (ic_tag_rdata_i_s1[1]),
		.\ic_tag_rdata_i_s1[0] (ic_tag_rdata_i_s1[0]),
		.\ic_data_rdata_i_s1[1] (ic_data_rdata_i_s1[1]),
		.\ic_data_rdata_i_s1[0] (ic_data_rdata_i_s1[0]),
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

		// Random bits for internal masking
		.randbits(randbits)
	);
endmodule
