#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
COMMON_DIR="${ROOT_DIR}/common"
OUT_DIR="${SCRIPT_DIR}/compiled"
BIN2VMEM="${SCRIPT_DIR}/bin2vmem.py"

find_tool() {
  local tool_name="$1"
  if [[ -n "${RISCV_TOOLCHAIN_BIN:-}" ]] && [[ -x "${RISCV_TOOLCHAIN_BIN}/${tool_name}" ]]; then
    echo "${RISCV_TOOLCHAIN_BIN}/${tool_name}"
    return 0
  fi
  if command -v "${tool_name}" >/dev/null 2>&1; then
    command -v "${tool_name}"
    return 0
  fi
  return 1
}

GCC="$(find_tool riscv32-unknown-elf-gcc || true)"
OBJCOPY="$(find_tool riscv32-unknown-elf-objcopy || true)"

if [[ -z "${GCC}" || -z "${OBJCOPY}" ]]; then
  echo "ERROR: Could not find RISC-V toolchain." >&2
  echo "Set RISCV_TOOLCHAIN_BIN or add riscv32-unknown-elf-gcc to PATH." >&2
  exit 1
fi

SREC_CAT=""
if command -v srec_cat >/dev/null 2>&1; then
  SREC_CAT="$(command -v srec_cat)"
fi

mkdir -p "${OUT_DIR}"

compile_test() {
  local src="$1"
  local name
  name="$(basename "${src}" .c)"

  echo "Compiling: ${name}"
  "${GCC}" -march=rv32imc -mabi=ilp32 -Os -nostdlib \
    -T "${COMMON_DIR}/link.ld" \
    -I "${COMMON_DIR}" \
    "${COMMON_DIR}/crt0.S" \
    "${COMMON_DIR}/simple_system_common.c" \
    "${src}" \
    -o "${OUT_DIR}/${name}.elf"

  "${OBJCOPY}" -O binary "${OUT_DIR}/${name}.elf" "${OUT_DIR}/${name}.bin"

  if [[ -n "${SREC_CAT}" ]]; then
    "${SREC_CAT}" "${OUT_DIR}/${name}.bin" -binary -byte-swap 4 -o "${OUT_DIR}/${name}.vmem" -vmem
  else
    python3 "${BIN2VMEM}" "${OUT_DIR}/${name}.bin" "${OUT_DIR}/${name}.vmem"
  fi

  echo "  -> ${OUT_DIR}/${name}.vmem"
}

if [[ $# -gt 0 ]]; then
  compile_test "$1"
else
  shopt -s nullglob
  for src in "${SCRIPT_DIR}"/*.c; do
    compile_test "${src}"
  done
fi

echo ""
echo "=== Compilation complete ==="
echo "Output directory: ${OUT_DIR}"
