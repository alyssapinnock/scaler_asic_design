#!/bin/bash
# =============================================================================
# Run Script: Modified RTL Test through ibex_simple_system
# =============================================================================
# Tests the UNMASKED ibex_core through the modified ibex_simple_system
# infrastructure (with gng RNG module, randbits plumbing, etc.)
#
# Uses a bypass wrapper (ibex_core_wrapper_bypass.sv) that ignores randbits
# and instantiates ibex_core directly.
# =============================================================================

set -e

# Paths
IBEX_BASE="/home/net/al663069/SD2_ws/ibex"
MODIFIED_RTL="/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL"
RTL_TEST="/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreTesting/rtl_test"
VMEM="${VMEM:-/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreTesting/rtl_test/tests/compiled/hello_test.vmem}"
WORKDIR="${RTL_TEST}/xrun_work"

# Create work directory
mkdir -p "${WORKDIR}"
cd "${WORKDIR}"

echo "=== Modified RTL Test ==="
echo "Using bypass wrapper (unmasked ibex_core)"
echo "VMEM: ${VMEM}"
echo ""

# =============================================================================
# Build the file list
# =============================================================================
# Strategy:
# 1. Packages first (order matters)
# 2. Primitives from working ibex (prim_generic for simulation)
# 3. Ibex core RTL from modifiedCoreRTL (NOT ibex_top, NOT ibex_core_wrapper)
# 4. Our modified ibex_top, bypass wrapper, simple_system from rtl_test/
# 5. Support modules (bus, ram, timer, simulator_ctrl)
# 6. GNG module for randbits
# 7. Ibex tracing (ibex_top_tracing, ibex_tracer)
# =============================================================================

FILELIST="${WORKDIR}/filelist.f"
cat > "${FILELIST}" << 'FEOF'
// ======== Include paths ========
-incdir /home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL
-incdir /home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim/rtl
-incdir /home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim_generic/rtl

// ======== Packages (must be first) ========
/home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_util_pkg.sv
/home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_secded_pkg.sv
/home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_cipher_pkg.sv
/home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_mubi_pkg.sv
/home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_count_pkg.sv
/home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim_generic/rtl/prim_pkg.sv
/home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim_generic/rtl/prim_ram_1p_pkg.sv
/home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim_generic/rtl/prim_ram_2p_pkg.sv
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL/ibex_pkg.sv
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL/ibex_tracer_pkg.sv

// ======== Assertion macros (compile early) ========
/home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_assert.sv

// ======== Primitives (prim_generic for simulation) ========
/home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim_generic/rtl/prim_buf.sv
/home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim_generic/rtl/prim_clock_gating.sv
/home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim_generic/rtl/prim_flop.sv
/home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim_generic/rtl/prim_flop_en.sv
/home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim_generic/rtl/prim_flop_2sync.sv
/home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim_generic/rtl/prim_ram_1p.sv
/home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim_generic/rtl/prim_ram_2p.sv
/home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_flop_macros.sv
/home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_lfsr.sv
/home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_onehot_check.sv
/home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_count.sv
/home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_sparse_fsm_flop.sv
/home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_secded_inv_39_32_enc.sv
/home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_secded_inv_39_32_dec.sv
/home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_ram_1p_adv.sv
/home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_ram_1p_scr.sv
/home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_subst_perm.sv
/home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_prince.sv
/home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_blanker.sv
/home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_sec_anchor_buf.sv
/home/net/al663069/SD2_ws/ibex/vendor/lowrisc_ip/ip/prim/rtl/prim_sec_anchor_flop.sv

// ======== Ibex core RTL (from modifiedCoreRTL) ========
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL/ibex_alu.sv
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL/ibex_branch_predict.sv
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL/ibex_compressed_decoder.sv
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL/ibex_controller.sv
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL/ibex_core.sv
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL/ibex_counter.sv
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL/ibex_cs_registers.sv
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL/ibex_csr.sv
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL/ibex_decoder.sv
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL/ibex_dummy_instr.sv
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL/ibex_ex_block.sv
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL/ibex_fetch_fifo.sv
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL/ibex_icache.sv
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL/ibex_id_stage.sv
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL/ibex_if_stage.sv
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL/ibex_load_store_unit.sv
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL/ibex_lockstep.sv
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL/ibex_multdiv_fast.sv
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL/ibex_multdiv_slow.sv
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL/ibex_pmp.sv
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL/ibex_prefetch_buffer.sv
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL/ibex_register_file_ff.sv
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL/ibex_register_file_fpga.sv
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL/ibex_register_file_latch.sv
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL/ibex_wb_stage.sv

// ======== Modified ibex_top with RVFI wrapper connections ========
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreTesting/rtl_test/ibex_core_wrapper_bypass.sv
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreTesting/rtl_test/ibex_top.sv

// ======== ibex_top_tracing and tracer (from modifiedCoreRTL) ========
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL/ibex_top_tracing.sv
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL/ibex_tracer.sv

// ======== GNG random number generator ========
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreRTL/gng.v

// ======== Support modules (from working ibex) ========
/home/net/al663069/SD2_ws/ibex/shared/rtl/bus.sv
/home/net/al663069/SD2_ws/ibex/shared/rtl/ram_1p.sv
/home/net/al663069/SD2_ws/ibex/shared/rtl/ram_2p.sv
/home/net/al663069/SD2_ws/ibex/shared/rtl/sim/simulator_ctrl.sv
/home/net/al663069/SD2_ws/ibex/shared/rtl/timer.sv

// ======== Modified ibex_simple_system (from rtl_test) ========
/home/net/al663069/SD2_ws/scaler_asic_design/modifiedCoreTesting/rtl_test/ibex_simple_system_rtl.sv
FEOF

echo "File list created: ${FILELIST}"
echo ""

# =============================================================================
# Run xrun
# =============================================================================
echo "=== Starting xrun compilation and simulation ==="

# Create TCL run script - run for 500us max then exit
cat > "${WORKDIR}/run.tcl" << 'TEOF'
run 500us
exit
TEOF

xrun \
    -64bit \
    -sv \
    -f "${FILELIST}" \
    -top ibex_simple_system \
    -timescale 1ns/1ps \
    -access rwc \
    -noassert \
    -define RVFI \
    +VMEM="${VMEM}" \
    -XMINITIALIZE 0 \
    -input "${WORKDIR}/run.tcl" \
    2>&1 | tee "${WORKDIR}/xrun.log"

echo ""
echo "=== Simulation complete ==="
echo "Log: ${WORKDIR}/xrun.log"

# Check for the simulator output log
if [ -f "ibex_simple_system.log" ]; then
    echo ""
    echo "=== Software output (ibex_simple_system.log) ==="
    cat ibex_simple_system.log
fi
