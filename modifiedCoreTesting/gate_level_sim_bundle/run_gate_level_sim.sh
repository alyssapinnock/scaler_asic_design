#!/bin/bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
WORK_DIR="${ROOT_DIR}/work/xrun_netlist_test"
FILELIST="${ROOT_DIR}/filelist.f"
XRUN_BIN="${XRUN_BIN:-xrun}"
RUN_TIME="${RUN_TIME:-2ms}"
VMEM="${VMEM:-${ROOT_DIR}/tests/compiled/hello_test.vmem}"
GLS_DEBUG="${GLS_DEBUG:-0}"

if [[ ! -f "${FILELIST}" ]]; then
  echo "ERROR: Missing file list: ${FILELIST}" >&2
  exit 1
fi

if [[ ! -f "${VMEM}" ]]; then
  echo "ERROR: VMEM not found: ${VMEM}" >&2
  exit 1
fi

mkdir -p "${WORK_DIR}"

cat > "${WORK_DIR}/run.tcl" <<EOF
run ${RUN_TIME}
echo "=== Simulation timeout after ${RUN_TIME} ==="
exit
EOF

cd "${ROOT_DIR}"

echo "=== Gate-Level Ibex Simulation ==="
echo "Root: ${ROOT_DIR}"
echo "VMEM: ${VMEM}"
echo "GLS_DEBUG: ${GLS_DEBUG}"
echo "Netlist: ${ROOT_DIR}/sources/Synthesis/outputs/Core_netlist.v"
echo ""

"${XRUN_BIN}" \
  -64bit \
  -sv \
  -f "${FILELIST}" \
  -top ibex_simple_system \
  -timescale 1ns/1ps \
  -access rwc \
  -noassert \
  -define RVFI \
  +VMEM="${VMEM}" \
  +GLS_DEBUG="${GLS_DEBUG}" \
  -XMINITIALIZE 0 \
  -input "${WORK_DIR}/run.tcl" \
  2>&1 | tee "${WORK_DIR}/xrun.log"

echo ""
echo "=== Simulation complete ==="
echo "Log: ${WORK_DIR}/xrun.log"

if [[ -f "${ROOT_DIR}/ibex_simple_system.log" ]]; then
  echo ""
  echo "=== Software output (ibex_simple_system.log) ==="
  cat "${ROOT_DIR}/ibex_simple_system.log"
fi
