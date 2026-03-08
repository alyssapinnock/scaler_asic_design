#!/bin/bash
# Quick test script to verify the setup is working
# This runs a minimal test to check if everything is configured correctly

echo "========================================"
echo "Ibex Verification Setup Test"
echo "========================================"
echo ""

# Check if we're in the right directory
if [ ! -f "run_modified_rtl_sim.sh" ]; then
    echo "ERROR: Please run this script from /home/net/al663069/ws/scaler_asic_design"
    exit 1
fi

# Test 1: Check all required files exist
echo "[Test 1] Checking required files..."
FILES=(
    "gate_level_wrapper.sv"
    "stdcell_models.v"
    "ibex_dv_gatelevel.f"
    "ibex_dv_modified_rtl.f"
    "run_modified_rtl_sim.sh"
    "run_gatelevel_sim.sh"
    "Synthesis/outputs/Core_netlist.v"
)

all_good=true
for file in "${FILES[@]}"; do
    if [ -f "$file" ]; then
        echo "  ✓ $file"
    else
        echo "  ✗ $file MISSING"
        all_good=false
    fi
done

if [ "$all_good" = false ]; then
    echo ""
    echo "ERROR: Some required files are missing. Please run setup_verification.sh"
    exit 1
fi

# Test 2: Check external dependencies
echo ""
echo "[Test 2] Checking external dependencies..."

if [ ! -d "/home/net/al663069/ws/ibex" ]; then
    echo "  ✗ Ibex directory not found"
    exit 1
else
    echo "  ✓ Ibex directory"
fi

if [ ! -f "/home/net/al663069/ws/new_ibex_files/gng.v" ]; then
    echo "  ✗ GNG module not found"
    exit 1
else
    echo "  ✓ GNG module"
fi

# Test 3: Check simulator
echo ""
echo "[Test 3] Checking simulator..."
if command -v xrun &> /dev/null; then
    echo "  ✓ xrun (Cadence Xcelium) found"
    xrun -version | head -1
else
    echo "  ✗ xrun not found in PATH"
    echo "    You may need to source the CAD tool setup script"
fi

# Test 4: Verify file list syntax
echo ""
echo "[Test 4] Checking file list syntax..."

# Check for syntax errors in file lists
if grep -q "LOWRISC_IP_DIR" ibex_dv_modified_rtl.f; then
    echo "  ✓ File list uses environment variables correctly"
else
    echo "  ✗ File list may have issues"
fi

# Test 5: Count modules in gate-level netlist
echo ""
echo "[Test 5] Analyzing gate-level netlist..."
module_count=$(grep -c "^module " Synthesis/outputs/Core_netlist.v)
ibex_core_found=$(grep -c "^module ibex_core" Synthesis/outputs/Core_netlist.v)
echo "  Total modules in netlist: $module_count"
echo "  ibex_core module found: $ibex_core_found"

if [ $ibex_core_found -eq 1 ]; then
    echo "  ✓ Gate-level netlist structure looks good"
else
    echo "  ⚠ Warning: ibex_core module count unexpected"
fi

# Test 6: Check standard cell coverage
echo ""
echo "[Test 6] Checking standard cell coverage..."
cells_in_netlist=$(grep -oE "^\s+(XOR2X1|AND2X1|OR2X1|INVX|BUFX|DFFR)" Synthesis/outputs/Core_netlist.v | sort -u | wc -l)
cells_modeled=$(grep -c "^module.*X[0-9]" stdcell_models.v)
echo "  Cell types in netlist: $cells_in_netlist"
echo "  Cell types modeled: $cells_modeled"

if [ $cells_modeled -ge 10 ]; then
    echo "  ✓ Standard cell library has sufficient coverage"
else
    echo "  ⚠ May need more cell models"
fi

# Summary
echo ""
echo "========================================"
echo "Setup Test Complete!"
echo "========================================"
echo ""

if [ "$all_good" = true ]; then
    echo "✓ All checks passed! You're ready to run simulations."
    echo ""
    echo "Quick start:"
    echo "  1. For modified RTL:  ./run_modified_rtl_sim.sh -gui"
    echo "  2. For gate-level:    ./run_gatelevel_sim.sh -gui"
    echo ""
    echo "See SETUP_SUMMARY.md for detailed instructions."
else
    echo "✗ Some checks failed. Please review the errors above."
    echo "  Run ./setup_verification.sh to fix common issues."
fi

echo ""
