#!/bin/bash
# Setup script for Ibex gate-level and modified RTL verification
# Usage: ./setup_verification.sh

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCALER_DIR="/home/net/al663069/ws/scaler_asic_design"
IBEX_DIR="/home/net/al663069/ws/ibex"
NEW_FILES_DIR="/home/net/al663069/ws/new_ibex_files"

echo "============================================="
echo "Ibex Verification Setup Script"
echo "============================================="
echo ""

# Check if directories exist
echo "[1/6] Checking directories..."
for dir in "$SCALER_DIR" "$IBEX_DIR" "$NEW_FILES_DIR"; do
    if [ ! -d "$dir" ]; then
        echo "ERROR: Directory not found: $dir"
        exit 1
    fi
    echo "  ✓ $dir"
done

# Check for required files
echo ""
echo "[2/6] Checking required files..."
FILES_TO_CHECK=(
    "$SCALER_DIR/Synthesis/outputs/Core_netlist.v"
    "$SCALER_DIR/gate_level_wrapper.sv"
    "$NEW_FILES_DIR/gng.v"
    "$IBEX_DIR/dv/uvm/core_ibex/tb/core_ibex_tb_top.sv"
)

for file in "${FILES_TO_CHECK[@]}"; do
    if [ ! -f "$file" ]; then
        echo "ERROR: File not found: $file"
        exit 1
    fi
    echo "  ✓ $(basename $file)"
done

# Search for standard cell library
echo ""
echo "[3/6] Searching for standard cell library..."
echo "Looking for standard cell models..."

# Common locations to search
SEARCH_DIRS=(
    "/cad"
    "/tools"
    "/usr/local/synopsys"
    "/usr/local/cadence"
    "$HOME/pdk"
    "/home/net/al663069/pdk"
)

STD_CELL_LIB=""
for search_dir in "${SEARCH_DIRS[@]}"; do
    if [ -d "$search_dir" ]; then
        echo "  Searching in $search_dir..."
        # Look for Verilog files with common standard cell names
        result=$(find "$search_dir" -name "*.v" 2>/dev/null | \
                 xargs grep -l "module.*XOR2X1\|module.*AND2X1\|module.*DFFR" 2>/dev/null | head -1 || true)
        if [ -n "$result" ]; then
            STD_CELL_LIB="$result"
            echo "  ✓ Found potential library: $STD_CELL_LIB"
            break
        fi
    fi
done

if [ -z "$STD_CELL_LIB" ]; then
    echo "  ⚠ WARNING: Standard cell library not found automatically."
    echo "  You will need to manually add the library path to the file list."
    echo "  Common cell names to search for: XOR2X1, AND2X1, DFFRHQX1"
else
    STD_CELL_DIR=$(dirname "$STD_CELL_LIB")
    echo "  Standard cell directory: $STD_CELL_DIR"
fi

# Create modified RTL file list
echo ""
echo "[4/6] Creating file list for modified RTL..."
MODIFIED_RTL_FLIST="$SCALER_DIR/ibex_dv_modified_rtl.f"

cat > "$MODIFIED_RTL_FLIST" << 'EOF'
// File list for running modified pre-synthesis RTL through Ibex DV/Co-sim
// Based on ibex_dv.f from Ibex repository

// GNG (Random Number Generator) for masking
$/home/net/al663069/ws/new_ibex_files/gng.v

// Include directories
+incdir+${LOWRISC_IP_DIR}/ip/prim/rtl
+incdir+${PRJ_DIR}/rtl
+incdir+/home/net/al663069/ws/scaler_asic_design/modifiedCoreRTL

// Prim package and basic modules
${PRJ_DIR}/dv/uvm/core_ibex/common/prim/prim_pkg.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_assert.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_util_pkg.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_count_pkg.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_count.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_secded_pkg.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_secded_22_16_dec.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_secded_22_16_enc.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_secded_64_57_dec.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_secded_64_57_enc.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_secded_hamming_22_16_dec.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_secded_hamming_22_16_enc.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_secded_hamming_39_32_dec.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_secded_hamming_39_32_enc.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_secded_hamming_72_64_dec.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_secded_hamming_72_64_enc.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_mubi_pkg.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_ram_1p_pkg.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_ram_1p_adv.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_ram_1p_scr.sv
${LOWRISC_IP_DIR}/ip/prim_generic/rtl/prim_generic_ram_1p.sv
${PRJ_DIR}/dv/uvm/core_ibex/common/prim/prim_ram_1p.sv
${LOWRISC_IP_DIR}/ip/prim_generic/rtl/prim_generic_clock_gating.sv
${PRJ_DIR}/dv/uvm/core_ibex/common/prim/prim_clock_gating.sv
${LOWRISC_IP_DIR}/ip/prim_generic/rtl/prim_generic_buf.sv
${PRJ_DIR}/dv/uvm/core_ibex/common/prim/prim_buf.sv
${LOWRISC_IP_DIR}/ip/prim_generic/rtl/prim_generic_clock_mux2.sv
${PRJ_DIR}/dv/uvm/core_ibex/common/prim/prim_clock_mux2.sv
${LOWRISC_IP_DIR}/ip/prim_generic/rtl/prim_generic_flop.sv
${PRJ_DIR}/dv/uvm/core_ibex/common/prim/prim_flop.sv
${LOWRISC_IP_DIR}/ip/prim_generic/rtl/prim_generic_and2.sv
${PRJ_DIR}/dv/uvm/core_ibex/common/prim/prim_and2.sv

// Shared lowRISC code
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_cipher_pkg.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_lfsr.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_secded_inv_28_22_enc.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_secded_inv_28_22_dec.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_secded_inv_39_32_enc.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_secded_inv_39_32_dec.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_secded_inv_72_64_enc.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_secded_inv_72_64_dec.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_prince.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_subst_perm.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_secded_28_22_enc.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_secded_28_22_dec.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_secded_39_32_enc.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_secded_39_32_dec.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_secded_72_64_enc.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_secded_72_64_dec.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_onehot_check.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_onehot_enc.sv
${LOWRISC_IP_DIR}/ip/prim/rtl/prim_onehot_mux.sv

// Modified Ibex CORE RTL files - using modifiedCoreRTL instead of baseline rtl
/home/net/al663069/ws/scaler_asic_design/modifiedCoreRTL/ibex_pkg.sv
/home/net/al663069/ws/scaler_asic_design/modifiedCoreRTL/ibex_tracer_pkg.sv
/home/net/al663069/ws/scaler_asic_design/modifiedCoreRTL/ibex_tracer.sv
/home/net/al663069/ws/scaler_asic_design/modifiedCoreRTL/ibex_alu.sv
/home/net/al663069/ws/scaler_asic_design/modifiedCoreRTL/ibex_branch_predict.sv
/home/net/al663069/ws/scaler_asic_design/modifiedCoreRTL/ibex_compressed_decoder.sv
/home/net/al663069/ws/scaler_asic_design/modifiedCoreRTL/ibex_controller.sv
/home/net/al663069/ws/scaler_asic_design/modifiedCoreRTL/ibex_csr.sv
/home/net/al663069/ws/scaler_asic_design/modifiedCoreRTL/ibex_cs_registers.sv
/home/net/al663069/ws/scaler_asic_design/modifiedCoreRTL/ibex_counter.sv
/home/net/al663069/ws/scaler_asic_design/modifiedCoreRTL/ibex_decoder.sv
/home/net/al663069/ws/scaler_asic_design/modifiedCoreRTL/ibex_dummy_instr.sv
/home/net/al663069/ws/scaler_asic_design/modifiedCoreRTL/ibex_ex_block.sv
/home/net/al663069/ws/scaler_asic_design/modifiedCoreRTL/ibex_fetch_fifo.sv
/home/net/al663069/ws/scaler_asic_design/modifiedCoreRTL/ibex_id_stage.sv
/home/net/al663069/ws/scaler_asic_design/modifiedCoreRTL/ibex_if_stage.sv
/home/net/al663069/ws/scaler_asic_design/modifiedCoreRTL/ibex_load_store_unit.sv
/home/net/al663069/ws/scaler_asic_design/modifiedCoreRTL/ibex_multdiv_fast.sv
/home/net/al663069/ws/scaler_asic_design/modifiedCoreRTL/ibex_multdiv_slow.sv
/home/net/al663069/ws/scaler_asic_design/modifiedCoreRTL/ibex_prefetch_buffer.sv
/home/net/al663069/ws/scaler_asic_design/modifiedCoreRTL/ibex_pmp.sv
/home/net/al663069/ws/scaler_asic_design/modifiedCoreRTL/ibex_wb_stage.sv
/home/net/al663069/ws/scaler_asic_design/modifiedCoreRTL/ibex_core.sv
/home/net/al663069/ws/scaler_asic_design/modifiedCoreRTL/ibex_register_file_ff.sv
/home/net/al663069/ws/scaler_asic_design/modifiedCoreRTL/ibex_register_file_fpga.sv
/home/net/al663069/ws/scaler_asic_design/modifiedCoreRTL/ibex_register_file_latch.sv

// ICache
${PRJ_DIR}/rtl/ibex_icache.sv

// Top-level files - using modifiedCoreRTL versions if available
/home/net/al663069/ws/scaler_asic_design/modifiedCoreRTL/ibex_top.sv
/home/net/al663069/ws/scaler_asic_design/modifiedCoreRTL/ibex_top_tracing.sv

// DV files
+incdir+${PRJ_DIR}/dv/uvm/core_ibex/common/ibex_mem_intf_agent
+incdir+${PRJ_DIR}/dv/uvm/core_ibex/common/irq_agent
+incdir+${PRJ_DIR}/vendor/google_riscv-dv/src
+incdir+${PRJ_DIR}/dv/uvm/core_ibex/env
+incdir+${PRJ_DIR}/dv/uvm/core_ibex/tests

${PRJ_DIR}/dv/uvm/core_ibex/common/ibex_mem_intf_agent/ibex_mem_intf.sv
${PRJ_DIR}/dv/uvm/core_ibex/common/ibex_mem_intf_agent/ibex_mem_intf_agent_pkg.sv
${PRJ_DIR}/dv/uvm/core_ibex/common/irq_agent/irq_if.sv
${PRJ_DIR}/dv/uvm/core_ibex/common/irq_agent/irq_agent_pkg.sv
${PRJ_DIR}/dv/uvm/core_ibex/env/core_ibex_env_pkg.sv
${PRJ_DIR}/dv/uvm/core_ibex/tests/core_ibex_test_pkg.sv
${PRJ_DIR}/dv/uvm/core_ibex/tb/core_ibex_tb_top.sv
EOF

echo "  ✓ Created: $MODIFIED_RTL_FLIST"

# Update gate-level file list if std cell lib was found
if [ -n "$STD_CELL_LIB" ]; then
    echo ""
    echo "[5/6] Updating gate-level file list with standard cell library..."
    
    # Add std cell library to the file list
    sed -i "/^\/\/.*GNG/i // Standard Cell Library\n$STD_CELL_LIB\n" "$SCALER_DIR/ibex_dv_gatelevel.f"
    echo "  ✓ Added standard cell library to gate-level file list"
else
    echo ""
    echo "[5/6] Skipping gate-level file list update (no std cell lib found)"
fi

# Create run scripts
echo ""
echo "[6/6] Creating run scripts..."

# Script for modified RTL
cat > "$SCALER_DIR/run_modified_rtl_sim.sh" << 'EOF'
#!/bin/bash
# Run modified RTL through Ibex DV/Co-sim

export PRJ_DIR=/home/net/al663069/ws/ibex
export LOWRISC_IP_DIR=/home/net/al663069/ws/ibex/vendor/lowrisc_ip

cd /home/net/al663069/ws/ibex/dv/uvm/core_ibex

# Run simulation
xrun \
    -f /home/net/al663069/ws/scaler_asic_design/ibex_dv_modified_rtl.f \
    +UVM_TESTNAME=core_ibex_base_test \
    +UVM_VERBOSITY=UVM_LOW \
    -timescale 1ns/1ps \
    -access +rw \
    -define BOOT_ADDR=32'h80000000 \
    -define DM_ADDR=32'h1A110000 \
    -define DM_ADDR_MASK=32'h1FFF0000 \
    -define DEBUG_MODE_HALT_ADDR=32'h1A110800 \
    -define DEBUG_MODE_EXCEPTION_ADDR=32'h1A110808 \
    -uvmhome CDNS-1.2 \
    "$@"
EOF
chmod +x "$SCALER_DIR/run_modified_rtl_sim.sh"
echo "  ✓ Created: run_modified_rtl_sim.sh"

# Script for gate-level
cat > "$SCALER_DIR/run_gatelevel_sim.sh" << 'EOF'
#!/bin/bash
# Run gate-level netlist through Ibex DV/Co-sim

export PRJ_DIR=/home/net/al663069/ws/ibex
export LOWRISC_IP_DIR=/home/net/al663069/ws/ibex/vendor/lowrisc_ip

cd /home/net/al663069/ws/ibex/dv/uvm/core_ibex

# Run simulation with gate-level netlist
xrun \
    -f /home/net/al663069/ws/scaler_asic_design/ibex_dv_gatelevel.f \
    +UVM_TESTNAME=core_ibex_base_test \
    +UVM_VERBOSITY=UVM_LOW \
    -timescale 1ns/1ps \
    -access +rw \
    -define FUNCTIONAL \
    -define BOOT_ADDR=32'h80000000 \
    -define DM_ADDR=32'h1A110000 \
    -define DM_ADDR_MASK=32'h1FFF0000 \
    -define DEBUG_MODE_HALT_ADDR=32'h1A110800 \
    -define DEBUG_MODE_EXCEPTION_ADDR=32'h1A110808 \
    +delay_mode_zero \
    +no_notifier \
    +notimingcheck \
    -uvmhome CDNS-1.2 \
    "$@"
EOF
chmod +x "$SCALER_DIR/run_gatelevel_sim.sh"
echo "  ✓ Created: run_gatelevel_sim.sh"

echo ""
echo "============================================="
echo "Setup Complete!"
echo "============================================="
echo ""
echo "Next steps:"
echo ""
echo "1. For modified RTL simulation:"
echo "   cd /home/net/al663069/ws/scaler_asic_design"
echo "   ./run_modified_rtl_sim.sh"
echo ""
echo "2. For gate-level simulation:"
if [ -z "$STD_CELL_LIB" ]; then
    echo "   ⚠ FIRST: Add standard cell library path to ibex_dv_gatelevel.f"
fi
echo "   cd /home/net/al663069/ws/scaler_asic_design"
echo "   ./run_gatelevel_sim.sh"
echo ""
echo "3. For GUI mode, add: -gui"
echo "   ./run_modified_rtl_sim.sh -gui"
echo ""
echo "4. For waveform dumping, add: -input \"@database -open waves -default\""
echo ""
echo "Documentation: VERIFICATION_GUIDE.md"
echo ""
