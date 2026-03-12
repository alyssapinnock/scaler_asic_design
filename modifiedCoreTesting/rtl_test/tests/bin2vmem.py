#!/usr/bin/env python3
"""Convert a binary file to VMEM format (32-bit words, byte-swapped).
Replacement for: srec_cat in.bin -binary -offset 0x100000 -byte-swap 4 -o out.vmem -vmem
Usage: bin2vmem.py input.bin output.vmem [offset_hex]
"""
import sys
import struct

def bin2vmem(infile, outfile, offset=0):
    with open(infile, 'rb') as f:
        data = f.read()
    
    # Pad to 4-byte boundary
    while len(data) % 4 != 0:
        data += b'\x00'
    
    word_offset = offset // 4  # VMEM addresses are word addresses
    
    with open(outfile, 'w') as f:
        for i in range(0, len(data), 4):
            # Read 4 bytes in little-endian, write as big-endian hex (byte-swap)
            word = struct.unpack('<I', data[i:i+4])[0]
            addr = word_offset + (i // 4)
            f.write(f"@{addr:08X} {word:08X}\n")

if __name__ == '__main__':
    if len(sys.argv) < 3:
        print(f"Usage: {sys.argv[0]} input.bin output.vmem [offset_hex]")
        sys.exit(1)
    
    offset = int(sys.argv[3], 16) if len(sys.argv) > 3 else 0
    bin2vmem(sys.argv[1], sys.argv[2], offset)
