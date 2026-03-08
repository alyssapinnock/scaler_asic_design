.section .text
.globl _start
.option norvc
j debug_rom
.align 3
j debug_exception
.align 7
.option rvc
_start:
h0_start:
                  li x27, 0x40001106
                  csrw 0x301, x27
kernel_sp:        
                  la x31, kernel_stack_end

trap_vec_init:    
                  la x27, mtvec_handler
                  ori x27, x27, 1
                  csrw 0x305, x27 # MTVEC

pmp_setup:        
                  csrwi 0x747, 4
                  la x6, main
                  li x27, 0x0
                  add x6, x6, x27
                  srli x6, x6, 2
                  csrw 0x3b0, x6
                  la x6, main
                  li x27, 0x11111111
                  add x6, x6, x27
                  srli x6, x6, 2
                  csrw 0x3b1, x6
                  la x6, main
                  li x27, 0x22222222
                  add x6, x6, x27
                  srli x6, x6, 2
                  csrw 0x3b2, x6
                  la x6, main
                  li x27, 0x33333333
                  add x6, x6, x27
                  srli x6, x6, 2
                  csrw 0x3b3, x6
                  li x6, 0xf0f0f0f
                  csrw 0x3a0, x6
                  la x6, main
                  li x27, 0x44444444
                  add x6, x6, x27
                  srli x6, x6, 2
                  csrw 0x3b4, x6
                  la x6, main
                  li x27, 0x55555555
                  add x6, x6, x27
                  srli x6, x6, 2
                  csrw 0x3b5, x6
                  la x6, main
                  li x27, 0x66666666
                  add x6, x6, x27
                  srli x6, x6, 2
                  csrw 0x3b6, x6
                  la x6, main
                  li x27, 0x77777777
                  add x6, x6, x27
                  srli x6, x6, 2
                  csrw 0x3b7, x6
                  li x6, 0xf0f0f0f
                  csrw 0x3a1, x6
                  la x6, main
                  li x27, 0x88888888
                  add x6, x6, x27
                  srli x6, x6, 2
                  csrw 0x3b8, x6
                  la x6, main
                  li x27, 0x99999999
                  add x6, x6, x27
                  srli x6, x6, 2
                  csrw 0x3b9, x6
                  la x6, main
                  li x27, 0xaaaaaaaa
                  add x6, x6, x27
                  srli x6, x6, 2
                  csrw 0x3ba, x6
                  la x6, main
                  li x27, 0xbbbbbbbb
                  add x6, x6, x27
                  srli x6, x6, 2
                  csrw 0x3bb, x6
                  li x6, 0xf0f0f0f
                  csrw 0x3a2, x6
                  la x6, main
                  li x27, 0xcccccccc
                  add x6, x6, x27
                  srli x6, x6, 2
                  csrw 0x3bc, x6
                  la x6, main
                  li x27, 0xdddddddd
                  add x6, x6, x27
                  srli x6, x6, 2
                  csrw 0x3bd, x6
                  la x6, main
                  li x27, 0xeeeeeeee
                  add x6, x6, x27
                  srli x6, x6, 2
                  csrw 0x3be, x6
                  la x6, main
                  li x27, 0xffffffff
                  add x6, x6, x27
                  srli x6, x6, 2
                  csrw 0x3bf, x6
                  li x6, 0xf0f0f0f
                  csrw 0x3a3, x6

mepc_setup:       
                  la x27, init
                  csrw 0x341, x27

custom_csr_setup: 
                  csrwi 0x7c0, 1

init_machine_mode:
                  li x27, 0x1800
                  csrw 0x300, x27 # MSTATUS
                  li x27, 0x0
                  csrw 0x304, x27 # MIE
                  li x10, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x300
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x304
                  sw x27, 0(x10)
                  mret
init:             
                  li x0, 0xff8b810e
                  li x1, 0x7327cba0
                  li x2, 0xf5e39895
                  li x3, 0x0
                  li x4, 0x6511abba
                  li x5, 0xe2e875c4
                  li x6, 0x0
                  li x7, 0x9
                  li x8, 0x80000000
                  li x9, 0xf944e20f
                  li x10, 0x0
                  li x12, 0x9
                  li x13, 0xf0c54da4
                  li x14, 0xfd8fbe7e
                  li x15, 0x0
                  li x16, 0x651935eb
                  li x17, 0x4
                  li x18, 0x80000000
                  li x19, 0xa
                  li x20, 0xff2df586
                  li x21, 0x80000000
                  li x22, 0xfa72b098
                  li x23, 0x2
                  li x24, 0xe
                  li x25, 0x0
                  li x26, 0x0
                  li x27, 0xd
                  li x28, 0x82ec0cb0
                  li x29, 0xcac089bd
                  li x30, 0x80000000
                  la x11, user_stack_end
                  li x10, 0x8ffffffc
                  li x27, 0x0
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x10)
                  j main
test_done:        
                  li x10, 0x8ffffff8
                  li x27, 0x0
                  slli x27, x27, 8
                  addi x27, x27, 0x1
                  sw x27, 0(x10)
                  ecall

test_fail:        
                  li x10, 0x8ffffff8
                  li x27, 0x1
                  slli x27, x27, 8
                  addi x27, x27, 0x1
                  sw x27, 0(x10)
                  ecall

mmode_intr_vector_1:
                  addi x31, x31, -4
                  sw  x11, (x31)
                  add x11, x31, zero
                  addi x11, x11, -128
                  sw  x1, 4(x11)
                  sw  x2, 8(x11)
                  sw  x3, 12(x11)
                  sw  x4, 16(x11)
                  sw  x5, 20(x11)
                  sw  x6, 24(x11)
                  sw  x7, 28(x11)
                  sw  x8, 32(x11)
                  sw  x9, 36(x11)
                  sw  x10, 40(x11)
                  sw  x11, 44(x11)
                  sw  x12, 48(x11)
                  sw  x13, 52(x11)
                  sw  x14, 56(x11)
                  sw  x15, 60(x11)
                  sw  x16, 64(x11)
                  sw  x17, 68(x11)
                  sw  x18, 72(x11)
                  sw  x19, 76(x11)
                  sw  x20, 80(x11)
                  sw  x21, 84(x11)
                  sw  x22, 88(x11)
                  sw  x23, 92(x11)
                  sw  x24, 96(x11)
                  sw  x25, 100(x11)
                  sw  x26, 104(x11)
                  sw  x27, 108(x11)
                  sw  x28, 112(x11)
                  sw  x29, 116(x11)
                  sw  x30, 120(x11)
                  sw  x31, 124(x11)
                  add x31, x11, zero
                  li x10, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x10)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x10, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x300
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x342
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x304
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x344
                  sw x27, 0(x10)
                  j mmode_intr_handler
                  1: la x6, test_done
                  jalr x0, x6, 0

mmode_intr_vector_2:
                  addi x31, x31, -4
                  sw  x11, (x31)
                  add x11, x31, zero
                  addi x11, x11, -128
                  sw  x1, 4(x11)
                  sw  x2, 8(x11)
                  sw  x3, 12(x11)
                  sw  x4, 16(x11)
                  sw  x5, 20(x11)
                  sw  x6, 24(x11)
                  sw  x7, 28(x11)
                  sw  x8, 32(x11)
                  sw  x9, 36(x11)
                  sw  x10, 40(x11)
                  sw  x11, 44(x11)
                  sw  x12, 48(x11)
                  sw  x13, 52(x11)
                  sw  x14, 56(x11)
                  sw  x15, 60(x11)
                  sw  x16, 64(x11)
                  sw  x17, 68(x11)
                  sw  x18, 72(x11)
                  sw  x19, 76(x11)
                  sw  x20, 80(x11)
                  sw  x21, 84(x11)
                  sw  x22, 88(x11)
                  sw  x23, 92(x11)
                  sw  x24, 96(x11)
                  sw  x25, 100(x11)
                  sw  x26, 104(x11)
                  sw  x27, 108(x11)
                  sw  x28, 112(x11)
                  sw  x29, 116(x11)
                  sw  x30, 120(x11)
                  sw  x31, 124(x11)
                  add x31, x11, zero
                  li x10, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x10)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x10, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x300
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x342
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x304
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x344
                  sw x27, 0(x10)
                  j mmode_intr_handler
                  1: la x6, test_done
                  jalr x0, x6, 0

mmode_intr_vector_3:
                  addi x31, x31, -4
                  sw  x11, (x31)
                  add x11, x31, zero
                  addi x11, x11, -128
                  sw  x1, 4(x11)
                  sw  x2, 8(x11)
                  sw  x3, 12(x11)
                  sw  x4, 16(x11)
                  sw  x5, 20(x11)
                  sw  x6, 24(x11)
                  sw  x7, 28(x11)
                  sw  x8, 32(x11)
                  sw  x9, 36(x11)
                  sw  x10, 40(x11)
                  sw  x11, 44(x11)
                  sw  x12, 48(x11)
                  sw  x13, 52(x11)
                  sw  x14, 56(x11)
                  sw  x15, 60(x11)
                  sw  x16, 64(x11)
                  sw  x17, 68(x11)
                  sw  x18, 72(x11)
                  sw  x19, 76(x11)
                  sw  x20, 80(x11)
                  sw  x21, 84(x11)
                  sw  x22, 88(x11)
                  sw  x23, 92(x11)
                  sw  x24, 96(x11)
                  sw  x25, 100(x11)
                  sw  x26, 104(x11)
                  sw  x27, 108(x11)
                  sw  x28, 112(x11)
                  sw  x29, 116(x11)
                  sw  x30, 120(x11)
                  sw  x31, 124(x11)
                  add x31, x11, zero
                  li x10, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x10)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x10, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x300
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x342
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x304
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x344
                  sw x27, 0(x10)
                  j mmode_intr_handler
                  1: la x6, test_done
                  jalr x0, x6, 0

mmode_intr_vector_4:
                  addi x31, x31, -4
                  sw  x11, (x31)
                  add x11, x31, zero
                  addi x11, x11, -128
                  sw  x1, 4(x11)
                  sw  x2, 8(x11)
                  sw  x3, 12(x11)
                  sw  x4, 16(x11)
                  sw  x5, 20(x11)
                  sw  x6, 24(x11)
                  sw  x7, 28(x11)
                  sw  x8, 32(x11)
                  sw  x9, 36(x11)
                  sw  x10, 40(x11)
                  sw  x11, 44(x11)
                  sw  x12, 48(x11)
                  sw  x13, 52(x11)
                  sw  x14, 56(x11)
                  sw  x15, 60(x11)
                  sw  x16, 64(x11)
                  sw  x17, 68(x11)
                  sw  x18, 72(x11)
                  sw  x19, 76(x11)
                  sw  x20, 80(x11)
                  sw  x21, 84(x11)
                  sw  x22, 88(x11)
                  sw  x23, 92(x11)
                  sw  x24, 96(x11)
                  sw  x25, 100(x11)
                  sw  x26, 104(x11)
                  sw  x27, 108(x11)
                  sw  x28, 112(x11)
                  sw  x29, 116(x11)
                  sw  x30, 120(x11)
                  sw  x31, 124(x11)
                  add x31, x11, zero
                  li x10, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x10)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x10, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x300
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x342
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x304
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x344
                  sw x27, 0(x10)
                  j mmode_intr_handler
                  1: la x6, test_done
                  jalr x0, x6, 0

mmode_intr_vector_5:
                  addi x31, x31, -4
                  sw  x11, (x31)
                  add x11, x31, zero
                  addi x11, x11, -128
                  sw  x1, 4(x11)
                  sw  x2, 8(x11)
                  sw  x3, 12(x11)
                  sw  x4, 16(x11)
                  sw  x5, 20(x11)
                  sw  x6, 24(x11)
                  sw  x7, 28(x11)
                  sw  x8, 32(x11)
                  sw  x9, 36(x11)
                  sw  x10, 40(x11)
                  sw  x11, 44(x11)
                  sw  x12, 48(x11)
                  sw  x13, 52(x11)
                  sw  x14, 56(x11)
                  sw  x15, 60(x11)
                  sw  x16, 64(x11)
                  sw  x17, 68(x11)
                  sw  x18, 72(x11)
                  sw  x19, 76(x11)
                  sw  x20, 80(x11)
                  sw  x21, 84(x11)
                  sw  x22, 88(x11)
                  sw  x23, 92(x11)
                  sw  x24, 96(x11)
                  sw  x25, 100(x11)
                  sw  x26, 104(x11)
                  sw  x27, 108(x11)
                  sw  x28, 112(x11)
                  sw  x29, 116(x11)
                  sw  x30, 120(x11)
                  sw  x31, 124(x11)
                  add x31, x11, zero
                  li x10, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x10)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x10, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x300
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x342
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x304
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x344
                  sw x27, 0(x10)
                  j mmode_intr_handler
                  1: la x6, test_done
                  jalr x0, x6, 0

mmode_intr_vector_6:
                  addi x31, x31, -4
                  sw  x11, (x31)
                  add x11, x31, zero
                  addi x11, x11, -128
                  sw  x1, 4(x11)
                  sw  x2, 8(x11)
                  sw  x3, 12(x11)
                  sw  x4, 16(x11)
                  sw  x5, 20(x11)
                  sw  x6, 24(x11)
                  sw  x7, 28(x11)
                  sw  x8, 32(x11)
                  sw  x9, 36(x11)
                  sw  x10, 40(x11)
                  sw  x11, 44(x11)
                  sw  x12, 48(x11)
                  sw  x13, 52(x11)
                  sw  x14, 56(x11)
                  sw  x15, 60(x11)
                  sw  x16, 64(x11)
                  sw  x17, 68(x11)
                  sw  x18, 72(x11)
                  sw  x19, 76(x11)
                  sw  x20, 80(x11)
                  sw  x21, 84(x11)
                  sw  x22, 88(x11)
                  sw  x23, 92(x11)
                  sw  x24, 96(x11)
                  sw  x25, 100(x11)
                  sw  x26, 104(x11)
                  sw  x27, 108(x11)
                  sw  x28, 112(x11)
                  sw  x29, 116(x11)
                  sw  x30, 120(x11)
                  sw  x31, 124(x11)
                  add x31, x11, zero
                  li x10, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x10)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x10, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x300
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x342
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x304
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x344
                  sw x27, 0(x10)
                  j mmode_intr_handler
                  1: la x6, test_done
                  jalr x0, x6, 0

mmode_intr_vector_7:
                  addi x31, x31, -4
                  sw  x11, (x31)
                  add x11, x31, zero
                  addi x11, x11, -128
                  sw  x1, 4(x11)
                  sw  x2, 8(x11)
                  sw  x3, 12(x11)
                  sw  x4, 16(x11)
                  sw  x5, 20(x11)
                  sw  x6, 24(x11)
                  sw  x7, 28(x11)
                  sw  x8, 32(x11)
                  sw  x9, 36(x11)
                  sw  x10, 40(x11)
                  sw  x11, 44(x11)
                  sw  x12, 48(x11)
                  sw  x13, 52(x11)
                  sw  x14, 56(x11)
                  sw  x15, 60(x11)
                  sw  x16, 64(x11)
                  sw  x17, 68(x11)
                  sw  x18, 72(x11)
                  sw  x19, 76(x11)
                  sw  x20, 80(x11)
                  sw  x21, 84(x11)
                  sw  x22, 88(x11)
                  sw  x23, 92(x11)
                  sw  x24, 96(x11)
                  sw  x25, 100(x11)
                  sw  x26, 104(x11)
                  sw  x27, 108(x11)
                  sw  x28, 112(x11)
                  sw  x29, 116(x11)
                  sw  x30, 120(x11)
                  sw  x31, 124(x11)
                  add x31, x11, zero
                  li x10, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x10)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x10, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x300
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x342
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x304
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x344
                  sw x27, 0(x10)
                  j mmode_intr_handler
                  1: la x6, test_done
                  jalr x0, x6, 0

mmode_intr_vector_8:
                  addi x31, x31, -4
                  sw  x11, (x31)
                  add x11, x31, zero
                  addi x11, x11, -128
                  sw  x1, 4(x11)
                  sw  x2, 8(x11)
                  sw  x3, 12(x11)
                  sw  x4, 16(x11)
                  sw  x5, 20(x11)
                  sw  x6, 24(x11)
                  sw  x7, 28(x11)
                  sw  x8, 32(x11)
                  sw  x9, 36(x11)
                  sw  x10, 40(x11)
                  sw  x11, 44(x11)
                  sw  x12, 48(x11)
                  sw  x13, 52(x11)
                  sw  x14, 56(x11)
                  sw  x15, 60(x11)
                  sw  x16, 64(x11)
                  sw  x17, 68(x11)
                  sw  x18, 72(x11)
                  sw  x19, 76(x11)
                  sw  x20, 80(x11)
                  sw  x21, 84(x11)
                  sw  x22, 88(x11)
                  sw  x23, 92(x11)
                  sw  x24, 96(x11)
                  sw  x25, 100(x11)
                  sw  x26, 104(x11)
                  sw  x27, 108(x11)
                  sw  x28, 112(x11)
                  sw  x29, 116(x11)
                  sw  x30, 120(x11)
                  sw  x31, 124(x11)
                  add x31, x11, zero
                  li x10, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x10)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x10, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x300
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x342
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x304
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x344
                  sw x27, 0(x10)
                  j mmode_intr_handler
                  1: la x6, test_done
                  jalr x0, x6, 0

mmode_intr_vector_9:
                  addi x31, x31, -4
                  sw  x11, (x31)
                  add x11, x31, zero
                  addi x11, x11, -128
                  sw  x1, 4(x11)
                  sw  x2, 8(x11)
                  sw  x3, 12(x11)
                  sw  x4, 16(x11)
                  sw  x5, 20(x11)
                  sw  x6, 24(x11)
                  sw  x7, 28(x11)
                  sw  x8, 32(x11)
                  sw  x9, 36(x11)
                  sw  x10, 40(x11)
                  sw  x11, 44(x11)
                  sw  x12, 48(x11)
                  sw  x13, 52(x11)
                  sw  x14, 56(x11)
                  sw  x15, 60(x11)
                  sw  x16, 64(x11)
                  sw  x17, 68(x11)
                  sw  x18, 72(x11)
                  sw  x19, 76(x11)
                  sw  x20, 80(x11)
                  sw  x21, 84(x11)
                  sw  x22, 88(x11)
                  sw  x23, 92(x11)
                  sw  x24, 96(x11)
                  sw  x25, 100(x11)
                  sw  x26, 104(x11)
                  sw  x27, 108(x11)
                  sw  x28, 112(x11)
                  sw  x29, 116(x11)
                  sw  x30, 120(x11)
                  sw  x31, 124(x11)
                  add x31, x11, zero
                  li x10, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x10)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x10, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x300
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x342
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x304
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x344
                  sw x27, 0(x10)
                  j mmode_intr_handler
                  1: la x6, test_done
                  jalr x0, x6, 0

mmode_intr_vector_10:
                  addi x31, x31, -4
                  sw  x11, (x31)
                  add x11, x31, zero
                  addi x11, x11, -128
                  sw  x1, 4(x11)
                  sw  x2, 8(x11)
                  sw  x3, 12(x11)
                  sw  x4, 16(x11)
                  sw  x5, 20(x11)
                  sw  x6, 24(x11)
                  sw  x7, 28(x11)
                  sw  x8, 32(x11)
                  sw  x9, 36(x11)
                  sw  x10, 40(x11)
                  sw  x11, 44(x11)
                  sw  x12, 48(x11)
                  sw  x13, 52(x11)
                  sw  x14, 56(x11)
                  sw  x15, 60(x11)
                  sw  x16, 64(x11)
                  sw  x17, 68(x11)
                  sw  x18, 72(x11)
                  sw  x19, 76(x11)
                  sw  x20, 80(x11)
                  sw  x21, 84(x11)
                  sw  x22, 88(x11)
                  sw  x23, 92(x11)
                  sw  x24, 96(x11)
                  sw  x25, 100(x11)
                  sw  x26, 104(x11)
                  sw  x27, 108(x11)
                  sw  x28, 112(x11)
                  sw  x29, 116(x11)
                  sw  x30, 120(x11)
                  sw  x31, 124(x11)
                  add x31, x11, zero
                  li x10, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x10)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x10, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x300
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x342
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x304
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x344
                  sw x27, 0(x10)
                  j mmode_intr_handler
                  1: la x6, test_done
                  jalr x0, x6, 0

mmode_intr_vector_11:
                  addi x31, x31, -4
                  sw  x11, (x31)
                  add x11, x31, zero
                  addi x11, x11, -128
                  sw  x1, 4(x11)
                  sw  x2, 8(x11)
                  sw  x3, 12(x11)
                  sw  x4, 16(x11)
                  sw  x5, 20(x11)
                  sw  x6, 24(x11)
                  sw  x7, 28(x11)
                  sw  x8, 32(x11)
                  sw  x9, 36(x11)
                  sw  x10, 40(x11)
                  sw  x11, 44(x11)
                  sw  x12, 48(x11)
                  sw  x13, 52(x11)
                  sw  x14, 56(x11)
                  sw  x15, 60(x11)
                  sw  x16, 64(x11)
                  sw  x17, 68(x11)
                  sw  x18, 72(x11)
                  sw  x19, 76(x11)
                  sw  x20, 80(x11)
                  sw  x21, 84(x11)
                  sw  x22, 88(x11)
                  sw  x23, 92(x11)
                  sw  x24, 96(x11)
                  sw  x25, 100(x11)
                  sw  x26, 104(x11)
                  sw  x27, 108(x11)
                  sw  x28, 112(x11)
                  sw  x29, 116(x11)
                  sw  x30, 120(x11)
                  sw  x31, 124(x11)
                  add x31, x11, zero
                  li x10, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x10)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x10, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x300
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x342
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x304
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x344
                  sw x27, 0(x10)
                  j mmode_intr_handler
                  1: la x6, test_done
                  jalr x0, x6, 0

mmode_intr_vector_12:
                  addi x31, x31, -4
                  sw  x11, (x31)
                  add x11, x31, zero
                  addi x11, x11, -128
                  sw  x1, 4(x11)
                  sw  x2, 8(x11)
                  sw  x3, 12(x11)
                  sw  x4, 16(x11)
                  sw  x5, 20(x11)
                  sw  x6, 24(x11)
                  sw  x7, 28(x11)
                  sw  x8, 32(x11)
                  sw  x9, 36(x11)
                  sw  x10, 40(x11)
                  sw  x11, 44(x11)
                  sw  x12, 48(x11)
                  sw  x13, 52(x11)
                  sw  x14, 56(x11)
                  sw  x15, 60(x11)
                  sw  x16, 64(x11)
                  sw  x17, 68(x11)
                  sw  x18, 72(x11)
                  sw  x19, 76(x11)
                  sw  x20, 80(x11)
                  sw  x21, 84(x11)
                  sw  x22, 88(x11)
                  sw  x23, 92(x11)
                  sw  x24, 96(x11)
                  sw  x25, 100(x11)
                  sw  x26, 104(x11)
                  sw  x27, 108(x11)
                  sw  x28, 112(x11)
                  sw  x29, 116(x11)
                  sw  x30, 120(x11)
                  sw  x31, 124(x11)
                  add x31, x11, zero
                  li x10, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x10)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x10, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x300
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x342
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x304
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x344
                  sw x27, 0(x10)
                  j mmode_intr_handler
                  1: la x6, test_done
                  jalr x0, x6, 0

mmode_intr_vector_13:
                  addi x31, x31, -4
                  sw  x11, (x31)
                  add x11, x31, zero
                  addi x11, x11, -128
                  sw  x1, 4(x11)
                  sw  x2, 8(x11)
                  sw  x3, 12(x11)
                  sw  x4, 16(x11)
                  sw  x5, 20(x11)
                  sw  x6, 24(x11)
                  sw  x7, 28(x11)
                  sw  x8, 32(x11)
                  sw  x9, 36(x11)
                  sw  x10, 40(x11)
                  sw  x11, 44(x11)
                  sw  x12, 48(x11)
                  sw  x13, 52(x11)
                  sw  x14, 56(x11)
                  sw  x15, 60(x11)
                  sw  x16, 64(x11)
                  sw  x17, 68(x11)
                  sw  x18, 72(x11)
                  sw  x19, 76(x11)
                  sw  x20, 80(x11)
                  sw  x21, 84(x11)
                  sw  x22, 88(x11)
                  sw  x23, 92(x11)
                  sw  x24, 96(x11)
                  sw  x25, 100(x11)
                  sw  x26, 104(x11)
                  sw  x27, 108(x11)
                  sw  x28, 112(x11)
                  sw  x29, 116(x11)
                  sw  x30, 120(x11)
                  sw  x31, 124(x11)
                  add x31, x11, zero
                  li x10, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x10)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x10, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x300
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x342
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x304
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x344
                  sw x27, 0(x10)
                  j mmode_intr_handler
                  1: la x6, test_done
                  jalr x0, x6, 0

mmode_intr_vector_14:
                  addi x31, x31, -4
                  sw  x11, (x31)
                  add x11, x31, zero
                  addi x11, x11, -128
                  sw  x1, 4(x11)
                  sw  x2, 8(x11)
                  sw  x3, 12(x11)
                  sw  x4, 16(x11)
                  sw  x5, 20(x11)
                  sw  x6, 24(x11)
                  sw  x7, 28(x11)
                  sw  x8, 32(x11)
                  sw  x9, 36(x11)
                  sw  x10, 40(x11)
                  sw  x11, 44(x11)
                  sw  x12, 48(x11)
                  sw  x13, 52(x11)
                  sw  x14, 56(x11)
                  sw  x15, 60(x11)
                  sw  x16, 64(x11)
                  sw  x17, 68(x11)
                  sw  x18, 72(x11)
                  sw  x19, 76(x11)
                  sw  x20, 80(x11)
                  sw  x21, 84(x11)
                  sw  x22, 88(x11)
                  sw  x23, 92(x11)
                  sw  x24, 96(x11)
                  sw  x25, 100(x11)
                  sw  x26, 104(x11)
                  sw  x27, 108(x11)
                  sw  x28, 112(x11)
                  sw  x29, 116(x11)
                  sw  x30, 120(x11)
                  sw  x31, 124(x11)
                  add x31, x11, zero
                  li x10, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x10)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x10, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x300
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x342
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x304
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x344
                  sw x27, 0(x10)
                  j mmode_intr_handler
                  1: la x6, test_done
                  jalr x0, x6, 0

mmode_intr_vector_15:
                  addi x31, x31, -4
                  sw  x11, (x31)
                  add x11, x31, zero
                  addi x11, x11, -128
                  sw  x1, 4(x11)
                  sw  x2, 8(x11)
                  sw  x3, 12(x11)
                  sw  x4, 16(x11)
                  sw  x5, 20(x11)
                  sw  x6, 24(x11)
                  sw  x7, 28(x11)
                  sw  x8, 32(x11)
                  sw  x9, 36(x11)
                  sw  x10, 40(x11)
                  sw  x11, 44(x11)
                  sw  x12, 48(x11)
                  sw  x13, 52(x11)
                  sw  x14, 56(x11)
                  sw  x15, 60(x11)
                  sw  x16, 64(x11)
                  sw  x17, 68(x11)
                  sw  x18, 72(x11)
                  sw  x19, 76(x11)
                  sw  x20, 80(x11)
                  sw  x21, 84(x11)
                  sw  x22, 88(x11)
                  sw  x23, 92(x11)
                  sw  x24, 96(x11)
                  sw  x25, 100(x11)
                  sw  x26, 104(x11)
                  sw  x27, 108(x11)
                  sw  x28, 112(x11)
                  sw  x29, 116(x11)
                  sw  x30, 120(x11)
                  sw  x31, 124(x11)
                  add x31, x11, zero
                  li x10, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x10)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x10, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x300
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x342
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x304
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x344
                  sw x27, 0(x10)
                  j mmode_intr_handler
                  1: la x6, test_done
                  jalr x0, x6, 0

mmode_intr_vector_16:
                  addi x31, x31, -4
                  sw  x11, (x31)
                  add x11, x31, zero
                  addi x11, x11, -128
                  sw  x1, 4(x11)
                  sw  x2, 8(x11)
                  sw  x3, 12(x11)
                  sw  x4, 16(x11)
                  sw  x5, 20(x11)
                  sw  x6, 24(x11)
                  sw  x7, 28(x11)
                  sw  x8, 32(x11)
                  sw  x9, 36(x11)
                  sw  x10, 40(x11)
                  sw  x11, 44(x11)
                  sw  x12, 48(x11)
                  sw  x13, 52(x11)
                  sw  x14, 56(x11)
                  sw  x15, 60(x11)
                  sw  x16, 64(x11)
                  sw  x17, 68(x11)
                  sw  x18, 72(x11)
                  sw  x19, 76(x11)
                  sw  x20, 80(x11)
                  sw  x21, 84(x11)
                  sw  x22, 88(x11)
                  sw  x23, 92(x11)
                  sw  x24, 96(x11)
                  sw  x25, 100(x11)
                  sw  x26, 104(x11)
                  sw  x27, 108(x11)
                  sw  x28, 112(x11)
                  sw  x29, 116(x11)
                  sw  x30, 120(x11)
                  sw  x31, 124(x11)
                  add x31, x11, zero
                  li x10, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x10)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x10, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x300
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x342
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x304
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x344
                  sw x27, 0(x10)
                  j mmode_intr_handler
                  1: la x6, test_done
                  jalr x0, x6, 0

mmode_intr_vector_17:
                  addi x31, x31, -4
                  sw  x11, (x31)
                  add x11, x31, zero
                  addi x11, x11, -128
                  sw  x1, 4(x11)
                  sw  x2, 8(x11)
                  sw  x3, 12(x11)
                  sw  x4, 16(x11)
                  sw  x5, 20(x11)
                  sw  x6, 24(x11)
                  sw  x7, 28(x11)
                  sw  x8, 32(x11)
                  sw  x9, 36(x11)
                  sw  x10, 40(x11)
                  sw  x11, 44(x11)
                  sw  x12, 48(x11)
                  sw  x13, 52(x11)
                  sw  x14, 56(x11)
                  sw  x15, 60(x11)
                  sw  x16, 64(x11)
                  sw  x17, 68(x11)
                  sw  x18, 72(x11)
                  sw  x19, 76(x11)
                  sw  x20, 80(x11)
                  sw  x21, 84(x11)
                  sw  x22, 88(x11)
                  sw  x23, 92(x11)
                  sw  x24, 96(x11)
                  sw  x25, 100(x11)
                  sw  x26, 104(x11)
                  sw  x27, 108(x11)
                  sw  x28, 112(x11)
                  sw  x29, 116(x11)
                  sw  x30, 120(x11)
                  sw  x31, 124(x11)
                  add x31, x11, zero
                  li x10, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x10)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x10, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x300
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x342
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x304
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x344
                  sw x27, 0(x10)
                  j mmode_intr_handler
                  1: la x6, test_done
                  jalr x0, x6, 0

mmode_intr_vector_18:
                  addi x31, x31, -4
                  sw  x11, (x31)
                  add x11, x31, zero
                  addi x11, x11, -128
                  sw  x1, 4(x11)
                  sw  x2, 8(x11)
                  sw  x3, 12(x11)
                  sw  x4, 16(x11)
                  sw  x5, 20(x11)
                  sw  x6, 24(x11)
                  sw  x7, 28(x11)
                  sw  x8, 32(x11)
                  sw  x9, 36(x11)
                  sw  x10, 40(x11)
                  sw  x11, 44(x11)
                  sw  x12, 48(x11)
                  sw  x13, 52(x11)
                  sw  x14, 56(x11)
                  sw  x15, 60(x11)
                  sw  x16, 64(x11)
                  sw  x17, 68(x11)
                  sw  x18, 72(x11)
                  sw  x19, 76(x11)
                  sw  x20, 80(x11)
                  sw  x21, 84(x11)
                  sw  x22, 88(x11)
                  sw  x23, 92(x11)
                  sw  x24, 96(x11)
                  sw  x25, 100(x11)
                  sw  x26, 104(x11)
                  sw  x27, 108(x11)
                  sw  x28, 112(x11)
                  sw  x29, 116(x11)
                  sw  x30, 120(x11)
                  sw  x31, 124(x11)
                  add x31, x11, zero
                  li x10, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x10)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x10, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x300
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x342
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x304
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x344
                  sw x27, 0(x10)
                  j mmode_intr_handler
                  1: la x6, test_done
                  jalr x0, x6, 0

mmode_intr_vector_19:
                  addi x31, x31, -4
                  sw  x11, (x31)
                  add x11, x31, zero
                  addi x11, x11, -128
                  sw  x1, 4(x11)
                  sw  x2, 8(x11)
                  sw  x3, 12(x11)
                  sw  x4, 16(x11)
                  sw  x5, 20(x11)
                  sw  x6, 24(x11)
                  sw  x7, 28(x11)
                  sw  x8, 32(x11)
                  sw  x9, 36(x11)
                  sw  x10, 40(x11)
                  sw  x11, 44(x11)
                  sw  x12, 48(x11)
                  sw  x13, 52(x11)
                  sw  x14, 56(x11)
                  sw  x15, 60(x11)
                  sw  x16, 64(x11)
                  sw  x17, 68(x11)
                  sw  x18, 72(x11)
                  sw  x19, 76(x11)
                  sw  x20, 80(x11)
                  sw  x21, 84(x11)
                  sw  x22, 88(x11)
                  sw  x23, 92(x11)
                  sw  x24, 96(x11)
                  sw  x25, 100(x11)
                  sw  x26, 104(x11)
                  sw  x27, 108(x11)
                  sw  x28, 112(x11)
                  sw  x29, 116(x11)
                  sw  x30, 120(x11)
                  sw  x31, 124(x11)
                  add x31, x11, zero
                  li x10, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x10)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x10, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x300
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x342
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x304
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x344
                  sw x27, 0(x10)
                  j mmode_intr_handler
                  1: la x6, test_done
                  jalr x0, x6, 0

mmode_intr_vector_20:
                  addi x31, x31, -4
                  sw  x11, (x31)
                  add x11, x31, zero
                  addi x11, x11, -128
                  sw  x1, 4(x11)
                  sw  x2, 8(x11)
                  sw  x3, 12(x11)
                  sw  x4, 16(x11)
                  sw  x5, 20(x11)
                  sw  x6, 24(x11)
                  sw  x7, 28(x11)
                  sw  x8, 32(x11)
                  sw  x9, 36(x11)
                  sw  x10, 40(x11)
                  sw  x11, 44(x11)
                  sw  x12, 48(x11)
                  sw  x13, 52(x11)
                  sw  x14, 56(x11)
                  sw  x15, 60(x11)
                  sw  x16, 64(x11)
                  sw  x17, 68(x11)
                  sw  x18, 72(x11)
                  sw  x19, 76(x11)
                  sw  x20, 80(x11)
                  sw  x21, 84(x11)
                  sw  x22, 88(x11)
                  sw  x23, 92(x11)
                  sw  x24, 96(x11)
                  sw  x25, 100(x11)
                  sw  x26, 104(x11)
                  sw  x27, 108(x11)
                  sw  x28, 112(x11)
                  sw  x29, 116(x11)
                  sw  x30, 120(x11)
                  sw  x31, 124(x11)
                  add x31, x11, zero
                  li x10, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x10)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x10, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x300
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x342
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x304
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x344
                  sw x27, 0(x10)
                  j mmode_intr_handler
                  1: la x6, test_done
                  jalr x0, x6, 0

mmode_intr_vector_21:
                  addi x31, x31, -4
                  sw  x11, (x31)
                  add x11, x31, zero
                  addi x11, x11, -128
                  sw  x1, 4(x11)
                  sw  x2, 8(x11)
                  sw  x3, 12(x11)
                  sw  x4, 16(x11)
                  sw  x5, 20(x11)
                  sw  x6, 24(x11)
                  sw  x7, 28(x11)
                  sw  x8, 32(x11)
                  sw  x9, 36(x11)
                  sw  x10, 40(x11)
                  sw  x11, 44(x11)
                  sw  x12, 48(x11)
                  sw  x13, 52(x11)
                  sw  x14, 56(x11)
                  sw  x15, 60(x11)
                  sw  x16, 64(x11)
                  sw  x17, 68(x11)
                  sw  x18, 72(x11)
                  sw  x19, 76(x11)
                  sw  x20, 80(x11)
                  sw  x21, 84(x11)
                  sw  x22, 88(x11)
                  sw  x23, 92(x11)
                  sw  x24, 96(x11)
                  sw  x25, 100(x11)
                  sw  x26, 104(x11)
                  sw  x27, 108(x11)
                  sw  x28, 112(x11)
                  sw  x29, 116(x11)
                  sw  x30, 120(x11)
                  sw  x31, 124(x11)
                  add x31, x11, zero
                  li x10, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x10)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x10, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x300
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x342
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x304
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x344
                  sw x27, 0(x10)
                  j mmode_intr_handler
                  1: la x6, test_done
                  jalr x0, x6, 0

mmode_intr_vector_22:
                  addi x31, x31, -4
                  sw  x11, (x31)
                  add x11, x31, zero
                  addi x11, x11, -128
                  sw  x1, 4(x11)
                  sw  x2, 8(x11)
                  sw  x3, 12(x11)
                  sw  x4, 16(x11)
                  sw  x5, 20(x11)
                  sw  x6, 24(x11)
                  sw  x7, 28(x11)
                  sw  x8, 32(x11)
                  sw  x9, 36(x11)
                  sw  x10, 40(x11)
                  sw  x11, 44(x11)
                  sw  x12, 48(x11)
                  sw  x13, 52(x11)
                  sw  x14, 56(x11)
                  sw  x15, 60(x11)
                  sw  x16, 64(x11)
                  sw  x17, 68(x11)
                  sw  x18, 72(x11)
                  sw  x19, 76(x11)
                  sw  x20, 80(x11)
                  sw  x21, 84(x11)
                  sw  x22, 88(x11)
                  sw  x23, 92(x11)
                  sw  x24, 96(x11)
                  sw  x25, 100(x11)
                  sw  x26, 104(x11)
                  sw  x27, 108(x11)
                  sw  x28, 112(x11)
                  sw  x29, 116(x11)
                  sw  x30, 120(x11)
                  sw  x31, 124(x11)
                  add x31, x11, zero
                  li x10, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x10)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x10, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x300
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x342
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x304
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x344
                  sw x27, 0(x10)
                  j mmode_intr_handler
                  1: la x6, test_done
                  jalr x0, x6, 0

mmode_intr_vector_23:
                  addi x31, x31, -4
                  sw  x11, (x31)
                  add x11, x31, zero
                  addi x11, x11, -128
                  sw  x1, 4(x11)
                  sw  x2, 8(x11)
                  sw  x3, 12(x11)
                  sw  x4, 16(x11)
                  sw  x5, 20(x11)
                  sw  x6, 24(x11)
                  sw  x7, 28(x11)
                  sw  x8, 32(x11)
                  sw  x9, 36(x11)
                  sw  x10, 40(x11)
                  sw  x11, 44(x11)
                  sw  x12, 48(x11)
                  sw  x13, 52(x11)
                  sw  x14, 56(x11)
                  sw  x15, 60(x11)
                  sw  x16, 64(x11)
                  sw  x17, 68(x11)
                  sw  x18, 72(x11)
                  sw  x19, 76(x11)
                  sw  x20, 80(x11)
                  sw  x21, 84(x11)
                  sw  x22, 88(x11)
                  sw  x23, 92(x11)
                  sw  x24, 96(x11)
                  sw  x25, 100(x11)
                  sw  x26, 104(x11)
                  sw  x27, 108(x11)
                  sw  x28, 112(x11)
                  sw  x29, 116(x11)
                  sw  x30, 120(x11)
                  sw  x31, 124(x11)
                  add x31, x11, zero
                  li x10, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x10)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x10, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x300
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x342
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x304
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x344
                  sw x27, 0(x10)
                  j mmode_intr_handler
                  1: la x6, test_done
                  jalr x0, x6, 0

mmode_intr_vector_24:
                  addi x31, x31, -4
                  sw  x11, (x31)
                  add x11, x31, zero
                  addi x11, x11, -128
                  sw  x1, 4(x11)
                  sw  x2, 8(x11)
                  sw  x3, 12(x11)
                  sw  x4, 16(x11)
                  sw  x5, 20(x11)
                  sw  x6, 24(x11)
                  sw  x7, 28(x11)
                  sw  x8, 32(x11)
                  sw  x9, 36(x11)
                  sw  x10, 40(x11)
                  sw  x11, 44(x11)
                  sw  x12, 48(x11)
                  sw  x13, 52(x11)
                  sw  x14, 56(x11)
                  sw  x15, 60(x11)
                  sw  x16, 64(x11)
                  sw  x17, 68(x11)
                  sw  x18, 72(x11)
                  sw  x19, 76(x11)
                  sw  x20, 80(x11)
                  sw  x21, 84(x11)
                  sw  x22, 88(x11)
                  sw  x23, 92(x11)
                  sw  x24, 96(x11)
                  sw  x25, 100(x11)
                  sw  x26, 104(x11)
                  sw  x27, 108(x11)
                  sw  x28, 112(x11)
                  sw  x29, 116(x11)
                  sw  x30, 120(x11)
                  sw  x31, 124(x11)
                  add x31, x11, zero
                  li x10, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x10)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x10, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x300
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x342
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x304
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x344
                  sw x27, 0(x10)
                  j mmode_intr_handler
                  1: la x6, test_done
                  jalr x0, x6, 0

mmode_intr_vector_25:
                  addi x31, x31, -4
                  sw  x11, (x31)
                  add x11, x31, zero
                  addi x11, x11, -128
                  sw  x1, 4(x11)
                  sw  x2, 8(x11)
                  sw  x3, 12(x11)
                  sw  x4, 16(x11)
                  sw  x5, 20(x11)
                  sw  x6, 24(x11)
                  sw  x7, 28(x11)
                  sw  x8, 32(x11)
                  sw  x9, 36(x11)
                  sw  x10, 40(x11)
                  sw  x11, 44(x11)
                  sw  x12, 48(x11)
                  sw  x13, 52(x11)
                  sw  x14, 56(x11)
                  sw  x15, 60(x11)
                  sw  x16, 64(x11)
                  sw  x17, 68(x11)
                  sw  x18, 72(x11)
                  sw  x19, 76(x11)
                  sw  x20, 80(x11)
                  sw  x21, 84(x11)
                  sw  x22, 88(x11)
                  sw  x23, 92(x11)
                  sw  x24, 96(x11)
                  sw  x25, 100(x11)
                  sw  x26, 104(x11)
                  sw  x27, 108(x11)
                  sw  x28, 112(x11)
                  sw  x29, 116(x11)
                  sw  x30, 120(x11)
                  sw  x31, 124(x11)
                  add x31, x11, zero
                  li x10, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x10)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x10, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x300
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x342
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x304
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x344
                  sw x27, 0(x10)
                  j mmode_intr_handler
                  1: la x6, test_done
                  jalr x0, x6, 0

mmode_intr_vector_26:
                  addi x31, x31, -4
                  sw  x11, (x31)
                  add x11, x31, zero
                  addi x11, x11, -128
                  sw  x1, 4(x11)
                  sw  x2, 8(x11)
                  sw  x3, 12(x11)
                  sw  x4, 16(x11)
                  sw  x5, 20(x11)
                  sw  x6, 24(x11)
                  sw  x7, 28(x11)
                  sw  x8, 32(x11)
                  sw  x9, 36(x11)
                  sw  x10, 40(x11)
                  sw  x11, 44(x11)
                  sw  x12, 48(x11)
                  sw  x13, 52(x11)
                  sw  x14, 56(x11)
                  sw  x15, 60(x11)
                  sw  x16, 64(x11)
                  sw  x17, 68(x11)
                  sw  x18, 72(x11)
                  sw  x19, 76(x11)
                  sw  x20, 80(x11)
                  sw  x21, 84(x11)
                  sw  x22, 88(x11)
                  sw  x23, 92(x11)
                  sw  x24, 96(x11)
                  sw  x25, 100(x11)
                  sw  x26, 104(x11)
                  sw  x27, 108(x11)
                  sw  x28, 112(x11)
                  sw  x29, 116(x11)
                  sw  x30, 120(x11)
                  sw  x31, 124(x11)
                  add x31, x11, zero
                  li x10, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x10)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x10, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x300
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x342
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x304
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x344
                  sw x27, 0(x10)
                  j mmode_intr_handler
                  1: la x6, test_done
                  jalr x0, x6, 0

mmode_intr_vector_27:
                  addi x31, x31, -4
                  sw  x11, (x31)
                  add x11, x31, zero
                  addi x11, x11, -128
                  sw  x1, 4(x11)
                  sw  x2, 8(x11)
                  sw  x3, 12(x11)
                  sw  x4, 16(x11)
                  sw  x5, 20(x11)
                  sw  x6, 24(x11)
                  sw  x7, 28(x11)
                  sw  x8, 32(x11)
                  sw  x9, 36(x11)
                  sw  x10, 40(x11)
                  sw  x11, 44(x11)
                  sw  x12, 48(x11)
                  sw  x13, 52(x11)
                  sw  x14, 56(x11)
                  sw  x15, 60(x11)
                  sw  x16, 64(x11)
                  sw  x17, 68(x11)
                  sw  x18, 72(x11)
                  sw  x19, 76(x11)
                  sw  x20, 80(x11)
                  sw  x21, 84(x11)
                  sw  x22, 88(x11)
                  sw  x23, 92(x11)
                  sw  x24, 96(x11)
                  sw  x25, 100(x11)
                  sw  x26, 104(x11)
                  sw  x27, 108(x11)
                  sw  x28, 112(x11)
                  sw  x29, 116(x11)
                  sw  x30, 120(x11)
                  sw  x31, 124(x11)
                  add x31, x11, zero
                  li x10, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x10)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x10, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x300
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x342
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x304
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x344
                  sw x27, 0(x10)
                  j mmode_intr_handler
                  1: la x6, test_done
                  jalr x0, x6, 0

mmode_intr_vector_28:
                  addi x31, x31, -4
                  sw  x11, (x31)
                  add x11, x31, zero
                  addi x11, x11, -128
                  sw  x1, 4(x11)
                  sw  x2, 8(x11)
                  sw  x3, 12(x11)
                  sw  x4, 16(x11)
                  sw  x5, 20(x11)
                  sw  x6, 24(x11)
                  sw  x7, 28(x11)
                  sw  x8, 32(x11)
                  sw  x9, 36(x11)
                  sw  x10, 40(x11)
                  sw  x11, 44(x11)
                  sw  x12, 48(x11)
                  sw  x13, 52(x11)
                  sw  x14, 56(x11)
                  sw  x15, 60(x11)
                  sw  x16, 64(x11)
                  sw  x17, 68(x11)
                  sw  x18, 72(x11)
                  sw  x19, 76(x11)
                  sw  x20, 80(x11)
                  sw  x21, 84(x11)
                  sw  x22, 88(x11)
                  sw  x23, 92(x11)
                  sw  x24, 96(x11)
                  sw  x25, 100(x11)
                  sw  x26, 104(x11)
                  sw  x27, 108(x11)
                  sw  x28, 112(x11)
                  sw  x29, 116(x11)
                  sw  x30, 120(x11)
                  sw  x31, 124(x11)
                  add x31, x11, zero
                  li x10, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x10)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x10, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x300
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x342
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x304
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x344
                  sw x27, 0(x10)
                  j mmode_intr_handler
                  1: la x6, test_done
                  jalr x0, x6, 0

mmode_intr_vector_29:
                  addi x31, x31, -4
                  sw  x11, (x31)
                  add x11, x31, zero
                  addi x11, x11, -128
                  sw  x1, 4(x11)
                  sw  x2, 8(x11)
                  sw  x3, 12(x11)
                  sw  x4, 16(x11)
                  sw  x5, 20(x11)
                  sw  x6, 24(x11)
                  sw  x7, 28(x11)
                  sw  x8, 32(x11)
                  sw  x9, 36(x11)
                  sw  x10, 40(x11)
                  sw  x11, 44(x11)
                  sw  x12, 48(x11)
                  sw  x13, 52(x11)
                  sw  x14, 56(x11)
                  sw  x15, 60(x11)
                  sw  x16, 64(x11)
                  sw  x17, 68(x11)
                  sw  x18, 72(x11)
                  sw  x19, 76(x11)
                  sw  x20, 80(x11)
                  sw  x21, 84(x11)
                  sw  x22, 88(x11)
                  sw  x23, 92(x11)
                  sw  x24, 96(x11)
                  sw  x25, 100(x11)
                  sw  x26, 104(x11)
                  sw  x27, 108(x11)
                  sw  x28, 112(x11)
                  sw  x29, 116(x11)
                  sw  x30, 120(x11)
                  sw  x31, 124(x11)
                  add x31, x11, zero
                  li x10, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x10)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x10, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x300
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x342
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x304
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x344
                  sw x27, 0(x10)
                  j mmode_intr_handler
                  1: la x6, test_done
                  jalr x0, x6, 0

mmode_intr_vector_30:
                  addi x31, x31, -4
                  sw  x11, (x31)
                  add x11, x31, zero
                  addi x11, x11, -128
                  sw  x1, 4(x11)
                  sw  x2, 8(x11)
                  sw  x3, 12(x11)
                  sw  x4, 16(x11)
                  sw  x5, 20(x11)
                  sw  x6, 24(x11)
                  sw  x7, 28(x11)
                  sw  x8, 32(x11)
                  sw  x9, 36(x11)
                  sw  x10, 40(x11)
                  sw  x11, 44(x11)
                  sw  x12, 48(x11)
                  sw  x13, 52(x11)
                  sw  x14, 56(x11)
                  sw  x15, 60(x11)
                  sw  x16, 64(x11)
                  sw  x17, 68(x11)
                  sw  x18, 72(x11)
                  sw  x19, 76(x11)
                  sw  x20, 80(x11)
                  sw  x21, 84(x11)
                  sw  x22, 88(x11)
                  sw  x23, 92(x11)
                  sw  x24, 96(x11)
                  sw  x25, 100(x11)
                  sw  x26, 104(x11)
                  sw  x27, 108(x11)
                  sw  x28, 112(x11)
                  sw  x29, 116(x11)
                  sw  x30, 120(x11)
                  sw  x31, 124(x11)
                  add x31, x11, zero
                  li x10, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x10)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x10, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x300
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x342
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x304
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x344
                  sw x27, 0(x10)
                  j mmode_intr_handler
                  1: la x6, test_done
                  jalr x0, x6, 0

mmode_intr_vector_31:
                  addi x31, x31, -4
                  sw  x11, (x31)
                  add x11, x31, zero
                  addi x11, x11, -128
                  sw  x1, 4(x11)
                  sw  x2, 8(x11)
                  sw  x3, 12(x11)
                  sw  x4, 16(x11)
                  sw  x5, 20(x11)
                  sw  x6, 24(x11)
                  sw  x7, 28(x11)
                  sw  x8, 32(x11)
                  sw  x9, 36(x11)
                  sw  x10, 40(x11)
                  sw  x11, 44(x11)
                  sw  x12, 48(x11)
                  sw  x13, 52(x11)
                  sw  x14, 56(x11)
                  sw  x15, 60(x11)
                  sw  x16, 64(x11)
                  sw  x17, 68(x11)
                  sw  x18, 72(x11)
                  sw  x19, 76(x11)
                  sw  x20, 80(x11)
                  sw  x21, 84(x11)
                  sw  x22, 88(x11)
                  sw  x23, 92(x11)
                  sw  x24, 96(x11)
                  sw  x25, 100(x11)
                  sw  x26, 104(x11)
                  sw  x27, 108(x11)
                  sw  x28, 112(x11)
                  sw  x29, 116(x11)
                  sw  x30, 120(x11)
                  sw  x31, 124(x11)
                  add x31, x11, zero
                  li x10, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x10)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x10, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x300
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x342
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x304
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x344
                  sw x27, 0(x10)
                  j mmode_intr_handler
                  1: la x6, test_done
                  jalr x0, x6, 0

.align           8
mtvec_handler:    
                  .option norvc;
                  j mmode_exception_handler
                  j mmode_intr_vector_1
                  j mmode_intr_vector_2
                  j mmode_intr_vector_3
                  j mmode_intr_vector_4
                  j mmode_intr_vector_5
                  j mmode_intr_vector_6
                  j mmode_intr_vector_7
                  j mmode_intr_vector_8
                  j mmode_intr_vector_9
                  j mmode_intr_vector_10
                  j mmode_intr_vector_11
                  j mmode_intr_vector_12
                  j mmode_intr_vector_13
                  j mmode_intr_vector_14
                  j mmode_intr_vector_15
                  j mmode_intr_vector_16
                  j mmode_intr_vector_17
                  j mmode_intr_vector_18
                  j mmode_intr_vector_19
                  j mmode_intr_vector_20
                  j mmode_intr_vector_21
                  j mmode_intr_vector_22
                  j mmode_intr_vector_23
                  j mmode_intr_vector_24
                  j mmode_intr_vector_25
                  j mmode_intr_vector_26
                  j mmode_intr_vector_27
                  j mmode_intr_vector_28
                  j mmode_intr_vector_29
                  j mmode_intr_vector_30
                  j mmode_intr_vector_31
                  .option rvc;

mmode_exception_handler:
                  addi x31, x31, -4
                  sw  x11, (x31)
                  add x11, x31, zero
                  addi x11, x11, -128
                  sw  x1, 4(x11)
                  sw  x2, 8(x11)
                  sw  x3, 12(x11)
                  sw  x4, 16(x11)
                  sw  x5, 20(x11)
                  sw  x6, 24(x11)
                  sw  x7, 28(x11)
                  sw  x8, 32(x11)
                  sw  x9, 36(x11)
                  sw  x10, 40(x11)
                  sw  x11, 44(x11)
                  sw  x12, 48(x11)
                  sw  x13, 52(x11)
                  sw  x14, 56(x11)
                  sw  x15, 60(x11)
                  sw  x16, 64(x11)
                  sw  x17, 68(x11)
                  sw  x18, 72(x11)
                  sw  x19, 76(x11)
                  sw  x20, 80(x11)
                  sw  x21, 84(x11)
                  sw  x22, 88(x11)
                  sw  x23, 92(x11)
                  sw  x24, 96(x11)
                  sw  x25, 100(x11)
                  sw  x26, 104(x11)
                  sw  x27, 108(x11)
                  sw  x28, 112(x11)
                  sw  x29, 116(x11)
                  sw  x30, 120(x11)
                  sw  x31, 124(x11)
                  add x31, x11, zero
                  li x10, 0x8ffffffc
                  li x27, 0x8
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x10)
                  csrr x27, 0x341 # MEPC
                  csrr x27, 0x342 # MCAUSE
                  li x10, 0x3 # BREAKPOINT
                  beq x27, x10, ebreak_handler
                  li x10, 0x8 # ECALL_UMODE
                  beq x27, x10, ecall_handler
                  li x10, 0x9 # ECALL_SMODE
                  beq x27, x10, ecall_handler
                  li x10, 0xb # ECALL_MMODE
                  beq x27, x10, ecall_handler
                  li x10, 0x1
                  beq x27, x10, instr_fault_handler
                  li x10, 0x5
                  beq x27, x10, load_fault_handler
                  li x10, 0x7
                  beq x27, x10, store_fault_handler
                  li x10, 0xc
                  beq x27, x10, pt_fault_handler
                  li x10, 0xd
                  beq x27, x10, pt_fault_handler
                  li x10, 0xf
                  beq x27, x10, pt_fault_handler
                  li x10, 0x2 # ILLEGAL_INSTRUCTION
                  beq x27, x10, illegal_instr_handler
                  csrr x10, 0x343 # MTVAL
                  1: la x6, test_done
                  jalr x1, x6, 0

ecall_handler:    
                  li x10, 0x8ffffffc
                  li x27, 0xb00
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0xb00
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0xb80
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0xb80
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0xb03
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0xb03
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0xb83
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0xb83
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0xb04
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0xb04
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0xb84
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0xb84
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0xb05
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0xb05
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0xb85
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0xb85
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0xb06
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0xb06
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0xb86
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0xb86
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0xb07
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0xb07
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0xb87
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0xb87
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0xb08
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0xb08
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0xb88
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0xb88
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0xb09
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0xb09
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0xb89
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0xb89
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0xb0a
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0xb0a
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0xb8a
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0xb8a
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0xb0b
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0xb0b
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0xb8b
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0xb8b
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0xb0c
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0xb0c
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0xb8c
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0xb8c
                  sw x27, 0(x10)
                  la x27, _start
                  sw x0, 0(x27)
                  sw x1, 4(x27)
                  sw x2, 8(x27)
                  sw x3, 12(x27)
                  sw x4, 16(x27)
                  sw x5, 20(x27)
                  sw x6, 24(x27)
                  sw x7, 28(x27)
                  sw x8, 32(x27)
                  sw x9, 36(x27)
                  sw x10, 40(x27)
                  sw x11, 44(x27)
                  sw x12, 48(x27)
                  sw x13, 52(x27)
                  sw x14, 56(x27)
                  sw x15, 60(x27)
                  sw x16, 64(x27)
                  sw x17, 68(x27)
                  sw x18, 72(x27)
                  sw x19, 76(x27)
                  sw x20, 80(x27)
                  sw x21, 84(x27)
                  sw x22, 88(x27)
                  sw x23, 92(x27)
                  sw x24, 96(x27)
                  sw x25, 100(x27)
                  sw x26, 104(x27)
                  sw x27, 108(x27)
                  sw x28, 112(x27)
                  sw x29, 116(x27)
                  sw x30, 120(x27)
                  sw x31, 124(x27)
                  csrr  x27, 0x341
                  addi  x27, x27, 4
                  csrw  0x341, x27
                  mret

instr_fault_handler:
                  li x10, 0x8ffffffc
                  li x27, 0x9
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x342
                  sw x27, 0(x10)
                  li x27, 0
                  mv x21, x27
                  li x28, 0
                  0: mv x27, x21
                  mv x6, x27
                  li x6, 0
                  beq x27, x6, 1f
                  li x6, 1
                  beq x27, x6, 2f
                  li x6, 2
                  beq x27, x6, 3f
                  li x6, 3
                  beq x27, x6, 4f
                  li x6, 4
                  beq x27, x6, 5f
                  li x6, 5
                  beq x27, x6, 6f
                  li x6, 6
                  beq x27, x6, 7f
                  li x6, 7
                  beq x27, x6, 8f
                  li x6, 8
                  beq x27, x6, 9f
                  li x6, 9
                  beq x27, x6, 10f
                  li x6, 10
                  beq x27, x6, 11f
                  li x6, 11
                  beq x27, x6, 12f
                  li x6, 12
                  beq x27, x6, 13f
                  li x6, 13
                  beq x27, x6, 14f
                  li x6, 14
                  beq x27, x6, 15f
                  li x6, 15
                  beq x27, x6, 16f
                  1: csrr x10, 0x3b0
                  csrr x23, 0x3a0
                  j 17f
                  2: csrr x10, 0x3b1
                  csrr x23, 0x3a0
                  j 17f
                  3: csrr x10, 0x3b2
                  csrr x23, 0x3a0
                  j 17f
                  4: csrr x10, 0x3b3
                  csrr x23, 0x3a0
                  j 17f
                  5: csrr x10, 0x3b4
                  csrr x23, 0x3a1
                  j 17f
                  6: csrr x10, 0x3b5
                  csrr x23, 0x3a1
                  j 17f
                  7: csrr x10, 0x3b6
                  csrr x23, 0x3a1
                  j 17f
                  8: csrr x10, 0x3b7
                  csrr x23, 0x3a1
                  j 17f
                  9: csrr x10, 0x3b8
                  csrr x23, 0x3a2
                  j 17f
                  10: csrr x10, 0x3b9
                  csrr x23, 0x3a2
                  j 17f
                  11: csrr x10, 0x3ba
                  csrr x23, 0x3a2
                  j 17f
                  12: csrr x10, 0x3bb
                  csrr x23, 0x3a2
                  j 17f
                  13: csrr x10, 0x3bc
                  csrr x23, 0x3a3
                  j 17f
                  14: csrr x10, 0x3bd
                  csrr x23, 0x3a3
                  j 17f
                  15: csrr x10, 0x3be
                  csrr x23, 0x3a3
                  j 17f
                  16: csrr x10, 0x3bf
                  csrr x23, 0x3a3
                  j 17f
                  17: li x4, 4
                  slli x27, x21, 30
                  srli x27, x27, 30
                  sub x6, x4, x27
                  addi x6, x6, -1
                  slli x6, x6, 3
                  sll x4, x23, x6
                  slli x27, x27, 3
                  add x6, x6, x27
                  srl x4, x4, x6
                  slli x6, x4, 27
                  srli x6, x6, 30
                  beqz x6, 20f
                  li x27, 1
                  beq x6, x27, 21f
                  li x27, 2
                  beq x6, x27, 24f
                  li x27, 3
                  beq x6, x27, 25f
                  la x27, test_done
                  jalr x0, x27, 0
                  18: mv x27, x21
                  mv x28, x10
                  addi x27, x27, 1
                  mv x21, x27
                  li x10, 16
                  ble x10, x27, 19f
                  j 0b
                  19: csrr x27, 0x747
                  andi x27, x27, 2
                  bnez x27, 27f
                  la x27, test_done
                  jalr x0, x27, 0
                  20: j 18b
                  21: mv x27, x21
                  csrr x6, 0x343
                  srli x6, x6, 2
                  bnez x27, 22f
                  bltz x6, 18b
                  j 23f
                  22: bgtu x28, x6, 18b
                  23: bleu x10, x6, 18b
                  j 26f
                  24: csrr x27, 0x343
                  srli x27, x27, 2
                  slli x6, x10, 2
                  srli x6, x6, 2
                  bne x27, x6, 18b
                  j 26f
                  25: csrr x27, 0x343
                  srli x27, x27, 2
                  srli x27, x27, 0
                  slli x27, x27, 0
                  slli x6, x10, 2
                  srli x6, x6, 2
                  srli x6, x6, 0
                  slli x6, x6, 0
                  bne x27, x6, 18b
                  j 26f
                  26: csrr x6, 0x747
                  andi x6, x6, 1
                  bnez x6, 27f
                  andi x6, x4, 128
                  bnez x6, 27f
                  j 29f
                  27: la x27, test_done
                  jalr x0, x27, 0
                  29: ori x4, x4, 4
                  li x6, 30
                  sll x27, x21, x6
                  srl x27, x27, x6
                  slli x6, x27, 3
                  sll x4, x4, x6
                  or x23, x23, x4
                  mv x27, x21
                  srli x27, x27, 2
                  beqz x27, 30f
                  li x6, 1
                  beq x27, x6, 31f
                  li x6, 2
                  beq x27, x6, 32f
                  li x6, 3
                  beq x27, x6, 33f
                  30: csrw 0x3a0, x23
                  j 34f
                  31: csrw 0x3a1, x23
                  j 34f
                  32: csrw 0x3a2, x23
                  j 34f
                  33: csrw 0x3a3, x23
                  34: nop
                  add x11, x31, zero
                  lw  x1, 4(x11)
                  lw  x2, 8(x11)
                  lw  x3, 12(x11)
                  lw  x4, 16(x11)
                  lw  x5, 20(x11)
                  lw  x6, 24(x11)
                  lw  x7, 28(x11)
                  lw  x8, 32(x11)
                  lw  x9, 36(x11)
                  lw  x10, 40(x11)
                  lw  x11, 44(x11)
                  lw  x12, 48(x11)
                  lw  x13, 52(x11)
                  lw  x14, 56(x11)
                  lw  x15, 60(x11)
                  lw  x16, 64(x11)
                  lw  x17, 68(x11)
                  lw  x18, 72(x11)
                  lw  x19, 76(x11)
                  lw  x20, 80(x11)
                  lw  x21, 84(x11)
                  lw  x22, 88(x11)
                  lw  x23, 92(x11)
                  lw  x24, 96(x11)
                  lw  x25, 100(x11)
                  lw  x26, 104(x11)
                  lw  x27, 108(x11)
                  lw  x28, 112(x11)
                  lw  x29, 116(x11)
                  lw  x30, 120(x11)
                  lw  x31, 124(x11)
                  addi x11, x11, 128
                  add x31, x11, zero
                  lw  x11, (x31)
                  addi x31, x31, 4
                  mret

load_fault_handler:
                  li x10, 0x8ffffffc
                  li x27, 0xb
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x342
                  sw x27, 0(x10)
                  li x27, 0
                  mv x21, x27
                  li x28, 0
                  0: mv x27, x21
                  mv x6, x27
                  li x6, 0
                  beq x27, x6, 1f
                  li x6, 1
                  beq x27, x6, 2f
                  li x6, 2
                  beq x27, x6, 3f
                  li x6, 3
                  beq x27, x6, 4f
                  li x6, 4
                  beq x27, x6, 5f
                  li x6, 5
                  beq x27, x6, 6f
                  li x6, 6
                  beq x27, x6, 7f
                  li x6, 7
                  beq x27, x6, 8f
                  li x6, 8
                  beq x27, x6, 9f
                  li x6, 9
                  beq x27, x6, 10f
                  li x6, 10
                  beq x27, x6, 11f
                  li x6, 11
                  beq x27, x6, 12f
                  li x6, 12
                  beq x27, x6, 13f
                  li x6, 13
                  beq x27, x6, 14f
                  li x6, 14
                  beq x27, x6, 15f
                  li x6, 15
                  beq x27, x6, 16f
                  1: csrr x10, 0x3b0
                  csrr x23, 0x3a0
                  j 17f
                  2: csrr x10, 0x3b1
                  csrr x23, 0x3a0
                  j 17f
                  3: csrr x10, 0x3b2
                  csrr x23, 0x3a0
                  j 17f
                  4: csrr x10, 0x3b3
                  csrr x23, 0x3a0
                  j 17f
                  5: csrr x10, 0x3b4
                  csrr x23, 0x3a1
                  j 17f
                  6: csrr x10, 0x3b5
                  csrr x23, 0x3a1
                  j 17f
                  7: csrr x10, 0x3b6
                  csrr x23, 0x3a1
                  j 17f
                  8: csrr x10, 0x3b7
                  csrr x23, 0x3a1
                  j 17f
                  9: csrr x10, 0x3b8
                  csrr x23, 0x3a2
                  j 17f
                  10: csrr x10, 0x3b9
                  csrr x23, 0x3a2
                  j 17f
                  11: csrr x10, 0x3ba
                  csrr x23, 0x3a2
                  j 17f
                  12: csrr x10, 0x3bb
                  csrr x23, 0x3a2
                  j 17f
                  13: csrr x10, 0x3bc
                  csrr x23, 0x3a3
                  j 17f
                  14: csrr x10, 0x3bd
                  csrr x23, 0x3a3
                  j 17f
                  15: csrr x10, 0x3be
                  csrr x23, 0x3a3
                  j 17f
                  16: csrr x10, 0x3bf
                  csrr x23, 0x3a3
                  j 17f
                  17: li x4, 4
                  slli x27, x21, 30
                  srli x27, x27, 30
                  sub x6, x4, x27
                  addi x6, x6, -1
                  slli x6, x6, 3
                  sll x4, x23, x6
                  slli x27, x27, 3
                  add x6, x6, x27
                  srl x4, x4, x6
                  slli x6, x4, 27
                  srli x6, x6, 30
                  beqz x6, 20f
                  li x27, 1
                  beq x6, x27, 21f
                  li x27, 2
                  beq x6, x27, 24f
                  li x27, 3
                  beq x6, x27, 25f
                  la x27, test_done
                  jalr x0, x27, 0
                  18: mv x27, x21
                  mv x28, x10
                  addi x27, x27, 1
                  mv x21, x27
                  li x10, 16
                  ble x10, x27, 19f
                  j 0b
                  19: csrr x27, 0x747
                  andi x27, x27, 2
                  bnez x27, 27f
                  la x27, test_done
                  jalr x0, x27, 0
                  20: j 18b
                  21: mv x27, x21
                  csrr x6, 0x343
                  srli x6, x6, 2
                  bnez x27, 22f
                  bltz x6, 18b
                  j 23f
                  22: bgtu x28, x6, 18b
                  23: bleu x10, x6, 18b
                  j 26f
                  24: csrr x27, 0x343
                  srli x27, x27, 2
                  slli x6, x10, 2
                  srli x6, x6, 2
                  bne x27, x6, 18b
                  j 26f
                  25: csrr x27, 0x343
                  srli x27, x27, 2
                  srli x27, x27, 0
                  slli x27, x27, 0
                  slli x6, x10, 2
                  srli x6, x6, 2
                  srli x6, x6, 0
                  slli x6, x6, 0
                  bne x27, x6, 18b
                  j 26f
                  26: csrr x6, 0x747
                  andi x6, x6, 1
                  bnez x6, 27f
                  andi x6, x4, 128
                  bnez x6, 27f
                  j 29f
                  27: csrr x27, 0x341
                  la x6, main
                  bge x27, x6, 40f
                  la x27, test_done
                  jalr x0, x27, 0
                  40: lw x27, 0(x27)
                  li x6, 3
                  and x27, x27, x6
                  beq x27, x6, 28f
                  csrr x27, 0x341
                  addi x27, x27, 2
                  csrw 0x341, x27
                  j 34f
                  28: csrr x27, 0x341
                  addi x27, x27, 4
                  csrw 0x341, x27
                  j 34f
                  29: ori x4, x4, 1
                  li x6, 30
                  sll x27, x21, x6
                  srl x27, x27, x6
                  slli x6, x27, 3
                  sll x4, x4, x6
                  or x23, x23, x4
                  mv x27, x21
                  srli x27, x27, 2
                  beqz x27, 30f
                  li x6, 1
                  beq x27, x6, 31f
                  li x6, 2
                  beq x27, x6, 32f
                  li x6, 3
                  beq x27, x6, 33f
                  30: csrw 0x3a0, x23
                  j 34f
                  31: csrw 0x3a1, x23
                  j 34f
                  32: csrw 0x3a2, x23
                  j 34f
                  33: csrw 0x3a3, x23
                  34: nop
                  add x11, x31, zero
                  lw  x1, 4(x11)
                  lw  x2, 8(x11)
                  lw  x3, 12(x11)
                  lw  x4, 16(x11)
                  lw  x5, 20(x11)
                  lw  x6, 24(x11)
                  lw  x7, 28(x11)
                  lw  x8, 32(x11)
                  lw  x9, 36(x11)
                  lw  x10, 40(x11)
                  lw  x11, 44(x11)
                  lw  x12, 48(x11)
                  lw  x13, 52(x11)
                  lw  x14, 56(x11)
                  lw  x15, 60(x11)
                  lw  x16, 64(x11)
                  lw  x17, 68(x11)
                  lw  x18, 72(x11)
                  lw  x19, 76(x11)
                  lw  x20, 80(x11)
                  lw  x21, 84(x11)
                  lw  x22, 88(x11)
                  lw  x23, 92(x11)
                  lw  x24, 96(x11)
                  lw  x25, 100(x11)
                  lw  x26, 104(x11)
                  lw  x27, 108(x11)
                  lw  x28, 112(x11)
                  lw  x29, 116(x11)
                  lw  x30, 120(x11)
                  lw  x31, 124(x11)
                  addi x11, x11, 128
                  add x31, x11, zero
                  lw  x11, (x31)
                  addi x31, x31, 4
                  mret

store_fault_handler:
                  li x10, 0x8ffffffc
                  li x27, 0xc
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x342
                  sw x27, 0(x10)
                  li x27, 0
                  mv x21, x27
                  li x28, 0
                  0: mv x27, x21
                  mv x6, x27
                  li x6, 0
                  beq x27, x6, 1f
                  li x6, 1
                  beq x27, x6, 2f
                  li x6, 2
                  beq x27, x6, 3f
                  li x6, 3
                  beq x27, x6, 4f
                  li x6, 4
                  beq x27, x6, 5f
                  li x6, 5
                  beq x27, x6, 6f
                  li x6, 6
                  beq x27, x6, 7f
                  li x6, 7
                  beq x27, x6, 8f
                  li x6, 8
                  beq x27, x6, 9f
                  li x6, 9
                  beq x27, x6, 10f
                  li x6, 10
                  beq x27, x6, 11f
                  li x6, 11
                  beq x27, x6, 12f
                  li x6, 12
                  beq x27, x6, 13f
                  li x6, 13
                  beq x27, x6, 14f
                  li x6, 14
                  beq x27, x6, 15f
                  li x6, 15
                  beq x27, x6, 16f
                  1: csrr x10, 0x3b0
                  csrr x23, 0x3a0
                  j 17f
                  2: csrr x10, 0x3b1
                  csrr x23, 0x3a0
                  j 17f
                  3: csrr x10, 0x3b2
                  csrr x23, 0x3a0
                  j 17f
                  4: csrr x10, 0x3b3
                  csrr x23, 0x3a0
                  j 17f
                  5: csrr x10, 0x3b4
                  csrr x23, 0x3a1
                  j 17f
                  6: csrr x10, 0x3b5
                  csrr x23, 0x3a1
                  j 17f
                  7: csrr x10, 0x3b6
                  csrr x23, 0x3a1
                  j 17f
                  8: csrr x10, 0x3b7
                  csrr x23, 0x3a1
                  j 17f
                  9: csrr x10, 0x3b8
                  csrr x23, 0x3a2
                  j 17f
                  10: csrr x10, 0x3b9
                  csrr x23, 0x3a2
                  j 17f
                  11: csrr x10, 0x3ba
                  csrr x23, 0x3a2
                  j 17f
                  12: csrr x10, 0x3bb
                  csrr x23, 0x3a2
                  j 17f
                  13: csrr x10, 0x3bc
                  csrr x23, 0x3a3
                  j 17f
                  14: csrr x10, 0x3bd
                  csrr x23, 0x3a3
                  j 17f
                  15: csrr x10, 0x3be
                  csrr x23, 0x3a3
                  j 17f
                  16: csrr x10, 0x3bf
                  csrr x23, 0x3a3
                  j 17f
                  17: li x4, 4
                  slli x27, x21, 30
                  srli x27, x27, 30
                  sub x6, x4, x27
                  addi x6, x6, -1
                  slli x6, x6, 3
                  sll x4, x23, x6
                  slli x27, x27, 3
                  add x6, x6, x27
                  srl x4, x4, x6
                  slli x6, x4, 27
                  srli x6, x6, 30
                  beqz x6, 20f
                  li x27, 1
                  beq x6, x27, 21f
                  li x27, 2
                  beq x6, x27, 24f
                  li x27, 3
                  beq x6, x27, 25f
                  la x27, test_done
                  jalr x0, x27, 0
                  18: mv x27, x21
                  mv x28, x10
                  addi x27, x27, 1
                  mv x21, x27
                  li x10, 16
                  ble x10, x27, 19f
                  j 0b
                  19: csrr x27, 0x747
                  andi x27, x27, 2
                  bnez x27, 27f
                  la x27, test_done
                  jalr x0, x27, 0
                  20: j 18b
                  21: mv x27, x21
                  csrr x6, 0x343
                  srli x6, x6, 2
                  bnez x27, 22f
                  bltz x6, 18b
                  j 23f
                  22: bgtu x28, x6, 18b
                  23: bleu x10, x6, 18b
                  j 26f
                  24: csrr x27, 0x343
                  srli x27, x27, 2
                  slli x6, x10, 2
                  srli x6, x6, 2
                  bne x27, x6, 18b
                  j 26f
                  25: csrr x27, 0x343
                  srli x27, x27, 2
                  srli x27, x27, 0
                  slli x27, x27, 0
                  slli x6, x10, 2
                  srli x6, x6, 2
                  srli x6, x6, 0
                  slli x6, x6, 0
                  bne x27, x6, 18b
                  j 26f
                  26: csrr x6, 0x747
                  andi x6, x6, 1
                  bnez x6, 27f
                  andi x6, x4, 128
                  bnez x6, 27f
                  j 29f
                  27: csrr x27, 0x341
                  lw x27, 0(x27)
                  li x6, 3
                  and x27, x27, x6
                  beq x27, x6, 28f
                  csrr x27, 0x341
                  addi x27, x27, 2
                  csrw 0x341, x27
                  j 34f
                  28: csrr x27, 0x341
                  addi x27, x27, 4
                  csrw 0x341, x27
                  j 34f
                  29: ori x4, x4, 3
                  li x6, 30
                  sll x27, x21, x6
                  srl x27, x27, x6
                  slli x6, x27, 3
                  sll x4, x4, x6
                  or x23, x23, x4
                  mv x27, x21
                  srli x27, x27, 2
                  beqz x27, 30f
                  li x6, 1
                  beq x27, x6, 31f
                  li x6, 2
                  beq x27, x6, 32f
                  li x6, 3
                  beq x27, x6, 33f
                  30: csrw 0x3a0, x23
                  j 34f
                  31: csrw 0x3a1, x23
                  j 34f
                  32: csrw 0x3a2, x23
                  j 34f
                  33: csrw 0x3a3, x23
                  34: nop
                  add x11, x31, zero
                  lw  x1, 4(x11)
                  lw  x2, 8(x11)
                  lw  x3, 12(x11)
                  lw  x4, 16(x11)
                  lw  x5, 20(x11)
                  lw  x6, 24(x11)
                  lw  x7, 28(x11)
                  lw  x8, 32(x11)
                  lw  x9, 36(x11)
                  lw  x10, 40(x11)
                  lw  x11, 44(x11)
                  lw  x12, 48(x11)
                  lw  x13, 52(x11)
                  lw  x14, 56(x11)
                  lw  x15, 60(x11)
                  lw  x16, 64(x11)
                  lw  x17, 68(x11)
                  lw  x18, 72(x11)
                  lw  x19, 76(x11)
                  lw  x20, 80(x11)
                  lw  x21, 84(x11)
                  lw  x22, 88(x11)
                  lw  x23, 92(x11)
                  lw  x24, 96(x11)
                  lw  x25, 100(x11)
                  lw  x26, 104(x11)
                  lw  x27, 108(x11)
                  lw  x28, 112(x11)
                  lw  x29, 116(x11)
                  lw  x30, 120(x11)
                  lw  x31, 124(x11)
                  addi x11, x11, 128
                  add x31, x11, zero
                  lw  x11, (x31)
                  addi x31, x31, 4
                  mret

.align 2
main:             lui          a2, 423528
                  lui          s5, 955885
                  c.addi16sp   sp, 384
                  sltu         a0, t4, sp
                  add          s3, a4, a0
                  remu         t2, zero, s7
                  mulh         zero, s3, t5
                  mulh         s2, s3, a0
                  remu         a3, gp, t3
                  mulhsu       t4, s0, s4
                  csrrwi       tp, 0x340, 4
                  ori          zero, a6, -1447
                  csrrwi       s11, 0x340, 13
                  sltu         a0, tp, s8
                  slt          a3, sp, s7
                  add          t3, a4, t1
                  addi         s5, t3, 1595
                  srai         a4, a0, 25
                  c.or         a0, a3
                  slti         s8, s7, 1912
                  c.mv         s5, t3
                  addi         t4, s4, -596
                  mulhu        s1, s11, a0
                  mulh         s8, a2, t1
                  or           a4, s0, s10
                  srli         gp, a1, 9
                  div          a7, a5, t5
                  div          s11, s6, a3
                  slli         s2, t0, 17
                  mulhu        s1, s9, s7
                  addi         zero, s9, -823
                  auipc        a2, 178923
                  csrrsi       s6, 0x340, 0
                  c.andi       a5, 22
                  lui          ra, 722769
                  sll          t3, s0, a0
                  srl          t3, s10, a7
                  srl          s1, a5, a5
                  csrrsi       ra, 0x340, 30
                  or           t5, a5, t5
                  slli         sp, t0, 31
                  nop
                  remu         s10, s8, s4
                  sltu         t4, s1, tp
                  c.addi4spn   s1, sp, 16
                  rem          sp, s3, s6
                  or           t5, a5, sp
                  c.sub        a0, a0
                  c.sub        a3, a2
                  c.xor        s1, a4
                  csrrci       a7, 0x340, 0
                  c.srli       a5, 1
                  c.or         s0, a2
                  c.sub        a0, a3
                  auipc        s7, 582183
                  remu         t5, a4, a5
                  c.mv         a4, s0
                  srl          ra, a5, a4
                  and          ra, s4, s0
                  mulh         s6, t2, s2
                  srai         t3, zero, 18
                  lui          a6, 7221
                  mulhsu       s7, t0, t6
                  slt          t2, t1, zero
                  sra          gp, a7, s11
                  mul          s0, s3, sp
                  c.srli       a0, 28
                  slt          s11, t4, s9
                  csrrs        s1, 0x340, zero
                  sub          t5, gp, gp
                  slli         s5, s6, 28
                  xori         t5, a4, 1545
                  csrrwi       s1, 0x340, 9
                  and          t2, a1, t0
                  c.srli       s1, 31
                  c.xor        s1, a5
                  c.addi16sp   sp, 368
                  csrrci       a0, 0x340, 0
                  sra          s4, t3, a1
                  ori          s9, t2, 1787
                  c.addi4spn   s0, sp, 272
                  csrrs        t2, 0x340, zero
                  c.andi       s1, -1
                  or           t3, t4, t6
                  c.sub        a2, a5
                  c.li         a6, -1
                  divu         s11, t3, a3
                  sll          s5, zero, sp
                  c.lui        a7, 24
                  mul          s2, a2, s11
                  ori          s8, a1, 242
                  c.sub        s0, a2
                  sra          t5, t6, t2
                  srl          a2, s2, a6
                  c.lui        s11, 28
                  sll          ra, t1, s5
                  slli         s10, s2, 16
                  sltu         s0, t1, s4
                  c.andi       a3, 2
                  c.addi16sp   sp, -16
                  auipc        a3, 62065
                  c.xor        s1, a5
                  csrrc        s1, 0x340, a7
                  sltiu        s8, s7, 551
                  remu         ra, s3, s4
                  csrrc        s0, 0x340, zero
                  slli         s7, sp, 5
                  mul          s10, zero, a6
                  mulh         s9, t3, s3
                  c.andi       s1, -1
                  c.li         s2, -1
                  csrrw        s3, 0x340, s6
                  c.lui        t3, 31
                  csrrci       s8, 0x340, 16
                  mulhsu       a5, a4, t1
                  srli         t4, s9, 8
                  sltiu        t5, a3, -1128
                  c.add        s10, a4
                  c.slli       s4, 10
                  sll          s11, a0, t6
                  c.lui        t0, 28
                  sltiu        s8, s10, -1777
                  csrrc        s9, 0x340, a2
                  c.li         ra, -1
                  csrrc        t5, 0x340, zero
                  csrrc        s5, 0x340, zero
                  csrrwi       s2, 0x340, 11
                  mul          t0, ra, a3
                  and          ra, s11, s0
                  mulh         a6, a1, s8
                  mulh         s7, s8, s10
                  csrrc        a5, 0x340, zero
                  csrrci       sp, 0x340, 0
                  csrrci       ra, 0x340, 21
                  divu         s4, a3, gp
                  addi         sp, a5, -282
                  srli         gp, a0, 2
                  csrrwi       s0, 0x340, 2
                  mul          s10, tp, s7
                  rem          s5, t5, t1
                  csrrwi       s9, 0x340, 28
                  srl          t3, a1, zero
                  csrrci       t3, 0x340, 0
                  c.addi4spn   a2, sp, 240
                  mulhu        gp, s0, a0
                  c.sub        a0, a3
                  c.andi       a0, 9
                  c.mv         a5, s6
                  csrrs        a0, 0x340, zero
                  auipc        t5, 344093
                  c.mv         s6, a5
                  c.lui        s0, 24
                  xor          t2, s1, s7
                  mulhu        a5, s2, s6
                  mulhu        a5, s3, t5
                  srli         a6, s2, 26
                  xori         a7, s5, -1254
                  divu         s3, s0, s7
                  add          t2, a6, t6
                  c.andi       s0, 20
                  lui          s6, 255301
                  c.or         a4, s0
                  mulhu        a5, ra, a5
                  mulhu        a6, a4, s7
                  mulhsu       gp, s0, s8
                  ori          a5, s11, -432
                  c.lui        s0, 14
                  c.add        s9, a5
                  nop
                  c.addi4spn   a2, sp, 352
                  csrrs        t2, 0x340, t6
                  srl          t3, s1, s8
                  mulhu        s0, t3, t5
                  csrrci       a0, 0x340, 7
                  remu         s2, t3, ra
                  sra          gp, tp, gp
                  addi         s2, a1, -1763
                  and          a4, a2, gp
                  c.srai       s0, 22
                  ori          t0, a1, 1191
                  add          a2, s3, s10
                  and          t0, s6, zero
                  mulh         t4, a5, s1
                  c.sub        a0, a0
                  sub          s9, s7, tp
                  nop
                  c.addi       s5, -1
                  or           a2, a3, zero
                  divu         a7, t0, a4
                  div          s11, s8, s6
                  csrrs        a7, 0x340, a5
                  csrrci       gp, 0x340, 0
                  nop
                  xori         s0, a0, -787
                  mulhsu       s7, a4, a2
                  lui          t5, 607491
                  csrrw        t0, 0x340, s5
                  remu         t4, t3, s7
                  mul          a0, a4, s7
                  sltu         t3, t0, a0
                  addi         t0, s4, 1548
                  sltu         a4, s1, t1
                  slti         s0, gp, 1168
                  c.mv         s6, t1
                  c.srai       s1, 27
                  c.xor        a2, s1
                  csrrwi       s7, 0x340, 1
                  csrrs        s10, 0x340, zero
                  sltiu        s1, s6, 1623
                  mulhu        sp, tp, s0
                  add          a3, s11, s11
                  c.slli       s8, 4
                  c.addi4spn   a0, sp, 16
                  c.sub        a5, s0
                  c.srai       s1, 30
                  c.srai       a5, 13
                  csrrs        gp, 0x340, s11
                  csrrs        s10, 0x340, zero
                  csrrci       s1, 0x340, 17
                  c.mv         t2, s6
                  c.or         a3, a0
                  csrrw        s11, 0x340, a7
                  srli         a2, zero, 6
                  csrrw        a2, 0x340, t5
                  mul          t5, t4, t4
                  slli         a3, a7, 5
                  and          t5, s2, t4
                  c.lui        s0, 5
                  sltu         zero, t4, t2
                  add          s8, t4, t4
                  add          zero, t0, tp
                  xor          a4, ra, ra
                  andi         s5, a7, 1569
                  slt          a4, t0, s2
                  c.nop
                  sltiu        a0, s0, 1381
                  div          s11, a1, s5
                  c.xor        a2, s0
                  slt          a7, s0, s0
                  c.add        a4, a7
                  c.srli       a3, 28
                  sra          s3, s11, a0
                  andi         t5, s9, 1347
                  ori          s4, a2, 851
                  sra          t0, ra, s0
                  mul          sp, s0, t2
                  mulhsu       gp, a2, s3
                  sltu         s0, zero, s6
                  c.lui        ra, 30
                  sll          s1, t2, s10
                  divu         s0, a0, t6
                  mulhu        s4, s11, s10
                  c.slli       s0, 8
                  mulhu        s6, zero, s11
                  and          a4, a5, t3
                  mulh         s6, sp, a0
                  lui          a5, 546339
                  c.add        s3, a6
                  c.nop
                  c.or         a2, a4
                  divu         t3, t4, t6
                  c.andi       s1, 11
                  lui          s6, 504382
                  srai         a6, a1, 10
                  c.mv         a3, a6
                  or           a7, s11, s3
                  c.or         a3, a1
                  csrrw        s7, 0x340, a4
                  and          a4, t4, a2
                  csrrsi       s0, 0x340, 0
                  c.add        a4, s10
                  c.nop
                  sltiu        s10, s6, -246
                  c.addi16sp   sp, -16
                  csrrci       a6, 0x340, 0
                  c.slli       a0, 15
                  slti         s11, s5, 1327
                  ori          sp, t3, -1370
                  csrrwi       s0, 0x340, 10
                  csrrci       s5, 0x340, 21
                  ori          a0, t6, -1888
                  csrrci       t5, 0x340, 11
                  srai         s4, t5, 22
                  c.sub        s1, a4
                  c.li         gp, -1
                  srl          tp, s3, gp
                  csrrsi       tp, 0x340, 0
                  c.srli       s0, 12
                  mul          t5, a0, t2
                  sll          t0, s5, sp
                  csrrs        a7, 0x340, zero
                  mulh         s10, s7, a7
                  c.xor        s0, a5
                  c.addi       a3, 26
                  or           s3, t3, a3
                  c.nop
                  slli         t3, t5, 12
                  sltu         s5, t6, t6
                  csrrc        s3, 0x340, zero
                  add          gp, t6, t0
                  mulh         s7, s7, s0
                  div          s0, s0, gp
                  div          t4, s4, a4
                  xor          s4, s3, a0
                  c.and        a5, a1
                  c.srai       a3, 8
                  slli         sp, t3, 28
                  c.slli       s0, 1
                  c.or         a5, a3
                  csrrs        a3, 0x340, s5
                  remu         t3, a5, t5
                  div          a6, gp, t2
                  c.xor        s0, s0
                  c.or         a0, s1
                  sll          ra, ra, t1
                  andi         t4, sp, 176
                  mul          s2, t4, s11
                  csrrwi       a6, 0x340, 4
                  div          a3, a4, s8
                  mulh         gp, a0, a3
                  rem          a2, s2, s11
                  divu         s6, s9, t1
                  auipc        a2, 414246
                  srl          zero, a7, a7
                  or           s8, t0, a6
                  c.xor        a3, a3
                  div          a0, sp, a6
                  or           tp, s4, t0
                  slli         ra, s4, 19
                  srai         s9, a3, 6
                  mul          s11, a1, a3
                  srli         a3, a5, 26
                  slt          s4, s1, t5
                  add          t4, s11, s4
                  c.or         a0, a2
                  srl          s7, t4, t3
                  srai         s1, a0, 29
                  sra          s1, a1, s11
                  lui          t4, 409256
                  c.srai       a2, 25
                  mulhu        s6, t0, ra
                  slti         gp, a6, 88
                  c.lui        t0, 17
                  mulhsu       tp, zero, a6
                  c.xor        s1, a2
                  addi         s7, s6, 794
                  andi         a3, s1, 1888
                  csrrw        a0, 0x340, t6
                  divu         a7, t3, t6
                  c.addi4spn   a3, sp, 672
                  c.or         a5, a4
                  c.slli       s0, 29
                  c.andi       a4, 13
                  srl          s6, s9, t2
                  c.addi16sp   sp, -16
                  xori         a5, s9, 733
                  srl          t0, s0, t4
                  remu         a0, a6, sp
                  c.nop
                  slt          gp, a0, zero
                  div          t5, a4, a5
                  c.xor        a4, a1
                  sub          tp, s7, s6
                  srai         s0, a0, 6
                  c.slli       s11, 19
                  sub          a0, zero, t4
                  c.addi16sp   sp, -16
                  csrrwi       t4, 0x340, 25
                  csrrc        t2, 0x340, zero
                  csrrwi       sp, 0x340, 5
                  auipc        s7, 713614
                  and          a4, s6, t4
                  mulhu        t2, a4, a5
                  sub          zero, s2, s8
                  slti         t5, a1, -1622
                  c.and        s0, a3
                  sll          t3, a5, tp
                  xori         t5, sp, -1291
                  c.lui        gp, 11
                  c.addi4spn   a0, sp, 464
                  csrrsi       a3, 0x340, 0
                  xori         s7, a1, 1563
                  slti         s9, tp, 944
                  csrrsi       s5, 0x340, 0
                  ori          tp, s10, 1016
                  c.xor        s0, s0
                  and          tp, s0, a6
                  or           t3, s7, gp
                  srli         s1, s2, 0
                  c.add        a7, t1
                  sub          t4, s0, sp
                  sra          s11, a2, a5
                  c.add        t5, tp
                  csrrc        t0, 0x340, zero
                  csrrci       a7, 0x340, 0
                  srli         s0, a6, 31
                  csrrw        s8, 0x340, ra
                  xor          s6, t4, s8
                  srai         s4, s7, 10
                  add          s0, s11, tp
                  lui          s9, 972462
                  csrrci       t4, 0x340, 0
                  xor          t5, t3, s1
                  sll          s1, t2, s9
                  c.srli       s0, 13
                  c.nop
                  srli         s3, tp, 19
                  sra          s7, a3, ra
                  remu         s2, t1, a1
                  andi         s7, s4, -1516
                  add          s2, s8, a2
                  srli         a4, a3, 20
                  or           s7, zero, a6
                  rem          a5, sp, s5
                  auipc        t2, 814294
                  c.li         a7, 4
                  mulhu        s11, s6, s2
                  slt          zero, s4, a6
                  lui          t0, 278288
                  addi         s6, sp, 527
                  csrrci       a0, 0x340, 19
                  c.srli       s0, 12
                  csrrsi       a4, 0x340, 21
                  slt          s7, t5, s0
                  mulhsu       t4, a0, t3
                  csrrs        a3, 0x340, zero
                  and          a2, s6, t3
                  c.addi       s0, -1
                  xori         s4, a6, -216
                  or           s8, t3, t0
                  srli         t5, a3, 17
                  sub          s4, s2, s0
                  srl          s7, s2, s3
                  slt          ra, a2, s2
                  mulhu        s10, s11, t1
                  sltu         s5, t3, t3
                  c.addi16sp   sp, 368
                  mulhu        a6, tp, a3
                  c.andi       s0, -1
                  div          s1, s7, a3
                  nop
                  slt          a2, s6, a3
                  csrrs        s11, 0x340, s10
                  auipc        a3, 819366
                  auipc        t5, 183914
                  c.or         a4, a1
                  c.mv         a5, t6
                  csrrsi       ra, 0x340, 30
                  slt          gp, s10, s6
                  mulhsu       a6, t0, s8
                  mulhsu       tp, t6, a5
                  c.lui        gp, 6
                  addi         t0, gp, 915
                  mulh         gp, ra, s0
                  sra          s8, tp, s4
                  and          s6, zero, t4
                  c.li         a0, 9
                  c.andi       a3, -1
                  andi         a0, s10, -1003
                  c.andi       s1, 24
                  c.or         a4, a0
                  sltu         t0, s10, t3
                  add          a7, s5, s10
                  csrrc        tp, 0x340, t2
                  slti         sp, t4, 501
                  andi         a5, t1, 764
                  slti         s7, t5, 438
                  mul          s5, s9, a5
                  mulhsu       s4, t4, t4
                  srli         s9, s2, 7
                  sltiu        s1, t2, -1763
                  sll          a7, sp, t1
                  c.mv         a5, ra
                  csrrs        t5, 0x340, s2
                  csrrc        a0, 0x340, s5
                  addi         a7, a1, -1936
                  srli         s6, tp, 20
                  srl          sp, t1, s11
                  sltu         zero, t4, a4
                  c.sub        a0, s1
                  ori          t5, sp, -714
                  slt          gp, a1, s10
                  sub          a6, s10, a6
                  slli         tp, a0, 13
                  divu         s1, s3, gp
                  lui          a0, 524465
                  divu         a0, a6, s2
                  sltu         s10, s10, zero
                  c.slli       s3, 16
                  c.xor        a0, a5
                  c.sub        a2, a4
                  srl          s6, t5, tp
                  c.addi4spn   s1, sp, 448
                  srli         s6, gp, 22
                  c.lui        s2, 2
                  c.lui        s1, 22
                  srli         zero, a7, 25
                  or           gp, gp, t5
                  divu         t3, a7, s8
                  andi         a6, s8, -1606
                  c.or         s1, a0
                  divu         s1, gp, s11
                  c.slli       t2, 3
                  slti         a4, s7, -2002
                  c.and        a3, a2
                  divu         gp, a1, t0
                  mulhu        tp, a1, s10
                  auipc        s10, 291597
                  slti         t3, sp, 327
                  mul          s11, t6, t6
                  c.srai       a5, 13
                  c.srai       a3, 31
                  and          s4, a1, zero
                  srl          tp, s2, sp
                  csrrsi       s2, 0x340, 0
                  srli         s1, t4, 1
                  mulhu        s1, t4, s5
                  sra          tp, a3, t2
                  rem          t4, s8, a7
                  c.mv         tp, t3
                  c.nop
                  csrrc        s0, 0x340, s7
                  c.srai       s0, 28
                  srl          s0, gp, s6
                  csrrci       t2, 0x340, 0
                  c.nop
                  slli         a2, s11, 16
                  c.nop
                  sub          s11, s3, s4
                  lui          s8, 50809
                  slti         s2, s8, -1074
                  c.addi       t4, -1
                  xor          s4, t4, s5
                  c.addi       a6, -1
                  csrrs        tp, 0x340, zero
                  c.sub        s1, a4
                  slti         t4, s11, -517
                  sub          zero, a5, t6
                  c.sub        a0, a5
                  csrrsi       s4, 0x340, 0
                  c.srai       a3, 25
                  csrrw        s3, 0x340, gp
                  csrrs        tp, 0x340, t5
                  addi         a4, s0, -1292
                  c.xor        a5, a3
                  mulh         s7, a3, t2
                  c.addi       s6, 20
                  add          s8, a6, s10
                  mulhsu       s6, a7, s0
                  sltu         s8, a5, s11
                  sub          s4, gp, t0
                  and          s4, s11, t4
                  sll          s9, t3, t0
                  c.xor        a2, s0
                  sll          a5, s4, a2
                  nop
                  sltiu        t5, tp, 1568
                  sll          a6, s3, s1
                  c.and        s0, a5
                  slti         s1, gp, -1863
                  c.and        a0, a4
                  sll          t2, s10, s2
                  auipc        s10, 376202
                  c.srli       a4, 20
                  sub          a4, t0, t3
                  sll          s4, a0, t4
                  slli         a4, s11, 21
                  mul          s1, t6, s11
                  c.addi16sp   sp, -16
                  c.slli       tp, 18
                  mulh         s1, t3, t6
                  mulhu        gp, zero, t4
                  slli         a3, s4, 2
                  sltiu        t2, t1, -555
                  or           s4, s7, a6
                  divu         t2, a4, a7
                  lui          s4, 767586
                  c.li         s2, -1
                  andi         s1, ra, 1214
                  add          a0, sp, a5
                  divu         s9, s4, s10
                  auipc        sp, 777805
                  c.mv         t5, s4
                  c.andi       a2, 2
                  c.or         a5, a3
                  sltu         s9, t5, t0
                  csrrci       s9, 0x340, 0
                  rem          sp, sp, s5
                  c.li         s10, 3
                  c.li         s6, -1
                  srl          s3, tp, a6
                  c.addi       tp, 3
                  andi         a0, s2, -1140
                  mulh         t4, s2, a2
                  csrrs        s9, 0x340, tp
                  and          a4, gp, s6
                  nop
                  mulhu        sp, s10, a6
                  or           s1, a0, s10
                  mulh         ra, a0, s6
                  csrrwi       a3, 0x340, 28
                  add          t3, tp, t6
                  sra          zero, s2, gp
                  slti         tp, t6, 74
                  srai         s11, s3, 6
                  xori         s7, t3, -3
                  mulhsu       tp, t5, s8
                  c.add        t2, tp
                  mul          s9, s10, s0
                  slti         t5, tp, 439
                  c.addi4spn   a2, sp, 224
                  remu         t3, a5, s1
                  mul          t2, t0, s1
                  addi         s8, zero, -969
                  c.lui        s6, 31
                  lui          t2, 91633
                  or           a4, gp, t2
                  remu         gp, gp, tp
                  or           t0, a6, t0
                  nop
                  div          ra, tp, a7
                  c.andi       a0, 12
                  mulhsu       a7, s2, a2
                  c.sub        a3, s0
                  c.or         a2, a0
                  c.lui        a6, 16
                  c.slli       a3, 14
                  addi         s9, s9, 3
                  andi         s7, s5, 249
                  c.sub        a3, a0
                  sltu         s6, s0, t3
                  sll          t3, t6, s5
                  xor          t2, t5, s5
                  slti         a6, t0, -1845
                  sltiu        a4, s0, -1764
                  c.slli       s11, 29
                  remu         t0, a4, s10
                  csrrsi       s0, 0x340, 0
                  sltiu        s4, a7, 127
                  ori          s1, s11, -2011
                  addi         a2, t0, -213
                  xori         tp, s0, 1282
                  ori          a7, s0, 122
                  rem          ra, t5, a0
                  sra          t4, a7, gp
                  mulhu        a7, t3, s4
                  srli         a2, t1, 9
                  csrrci       s11, 0x340, 22
                  sub          zero, s1, s8
                  csrrs        a6, 0x340, a0
                  nop
                  c.li         s4, -1
                  c.add        gp, s0
                  csrrci       s5, 0x340, 5
                  c.srli       s1, 3
                  ori          s6, a1, -44
                  divu         s8, a0, a3
                  csrrw        a4, 0x340, s9
                  c.srai       a2, 3
                  add          s3, s0, a3
                  c.or         a2, a2
                  xori         a3, s7, -1754
                  c.addi4spn   a5, sp, 832
                  c.mv         s5, t1
                  c.slli       tp, 8
                  csrrwi       a4, 0x340, 9
                  mul          t3, sp, zero
                  c.and        a0, s1
                  srl          a5, gp, gp
                  c.slli       ra, 28
                  c.srli       a5, 13
                  csrrw        zero, 0x340, s11
                  csrrwi       a5, 0x340, 28
                  lui          s6, 900257
                  c.lui        a6, 23
                  mulhsu       t4, a2, s7
                  remu         s2, zero, s8
                  mulhu        tp, s3, a4
                  srli         a6, t5, 19
                  csrrs        a0, 0x340, s7
                  lui          a2, 677311
                  c.add        s2, gp
                  mul          s9, a6, gp
                  c.mv         s0, s2
                  csrrsi       s0, 0x340, 0
                  sra          s0, t6, s0
                  slt          gp, t3, s9
                  auipc        t5, 220791
                  mulhu        s8, t3, a0
                  c.or         a3, a1
                  c.mv         t3, sp
                  c.sub        a4, a2
                  c.andi       s0, -1
                  slti         s11, a6, -1139
                  mulh         a6, s8, zero
                  or           s0, s4, t5
                  csrrs        ra, 0x340, a4
                  c.sub        a3, a1
                  nop
                  c.addi       ra, -1
                  sltiu        gp, tp, -857
                  andi         s3, a2, -1590
                  c.addi4spn   s0, sp, 672
                  csrrs        a3, 0x340, gp
                  sra          tp, s6, gp
                  srl          s10, a5, tp
                  andi         t4, a4, -723
                  rem          zero, a6, s10
                  c.xor        a4, a5
                  addi         a6, s10, 462
                  mul          s0, tp, s3
                  c.add        s10, s6
                  c.srai       a2, 17
                  lui          s6, 194706
                  ori          s1, a6, 229
                  xor          s1, s9, s8
                  slti         s4, a6, 1067
                  c.addi4spn   a0, sp, 64
                  and          a3, a6, s1
                  divu         t5, s5, s4
                  sub          s6, s9, a1
                  c.or         a5, s1
                  mulhu        a7, t4, zero
                  addi         a4, a5, 138
                  c.andi       a2, -1
                  auipc        zero, 848389
                  c.andi       a2, 30
                  c.andi       s0, -1
                  slti         s0, s7, -1971
                  srai         sp, s5, 19
                  c.and        a3, a4
                  or           zero, t1, ra
                  c.nop
                  addi         sp, s7, -179
                  sra          s2, ra, s4
                  srai         s3, t4, 30
                  and          a5, s6, t6
                  srli         t4, gp, 10
                  sltiu        sp, s7, 344
                  c.srai       s0, 11
                  and          t2, sp, a6
                  xori         a7, s0, -1124
                  c.srai       a2, 7
                  ori          tp, s6, -1702
                  rem          a3, s0, a4
                  csrrci       zero, 0x340, 17
                  lui          a0, 349312
                  mulhsu       tp, s4, s11
                  div          zero, t2, s4
                  div          s0, t3, t1
                  slti         zero, ra, -846
                  csrrci       t3, 0x340, 21
                  c.andi       a5, 0
                  csrrsi       a7, 0x340, 0
                  csrrci       s7, 0x340, 15
                  auipc        a6, 633173
                  c.sub        s0, s0
                  csrrw        s0, 0x340, t6
                  xori         tp, a3, 1505
                  auipc        sp, 572007
                  srl          gp, s0, ra
                  srai         s1, s8, 29
                  c.and        a0, a5
                  c.srli       a3, 8
                  c.addi       s6, -1
                  c.andi       a2, 27
                  c.addi4spn   a4, sp, 992
                  srli         a7, t6, 0
                  sub          t2, s6, zero
                  c.srai       a4, 22
                  and          t0, a4, t1
                  c.or         a3, s0
                  xori         a4, s5, -1410
                  sub          a7, a3, s5
                  slli         s4, sp, 4
                  mulhu        s4, s8, gp
                  lui          s2, 491612
                  c.li         s0, -1
                  c.addi       gp, -1
                  addi         a5, t5, -1811
                  c.add        gp, a4
                  mul          s3, a4, s7
                  sra          a7, s10, t5
                  rem          a6, s7, zero
                  c.srli       a2, 30
                  sll          s5, t5, a1
                  c.sub        s1, s1
                  c.mv         s3, gp
                  divu         s9, zero, t4
                  c.addi4spn   a4, sp, 688
                  c.addi16sp   sp, -16
                  srl          t4, s4, s3
                  ori          s3, s11, -158
                  c.or         a4, a0
                  sltiu        zero, a1, -297
                  csrrw        a3, 0x340, a4
                  csrrc        gp, 0x340, t6
                  or           ra, t1, t3
                  addi         t3, s3, 602
                  c.srli       a0, 3
                  mul          s10, a3, ra
                  csrrc        tp, 0x340, zero
                  or           s7, ra, a1
                  auipc        t2, 254251
                  c.li         a0, -1
                  andi         sp, a3, 1585
                  srai         t2, tp, 13
                  c.xor        a0, a5
                  c.srai       s1, 9
                  c.addi       a0, -1
                  csrrsi       a7, 0x340, 0
                  sll          s1, sp, t4
                  c.slli       s8, 30
                  c.xor        a3, a3
                  mulh         sp, s6, s7
                  srli         a2, a2, 6
                  nop
                  srli         t5, gp, 18
                  c.li         a4, 20
                  csrrw        s4, 0x340, tp
                  addi         a4, sp, -460
                  c.and        a4, a5
                  c.srai       s1, 3
                  c.srai       a4, 30
                  ori          s5, s9, 111
                  c.addi4spn   a0, sp, 400
                  c.lui        s0, 31
                  andi         s0, s5, 191
                  nop
                  remu         a2, t6, a0
                  csrrsi       a5, 0x340, 0
                  c.addi16sp   sp, 112
                  lui          a7, 638243
                  or           s10, a7, s9
                  add          sp, s0, a5
                  csrrwi       s11, 0x340, 1
                  c.li         sp, 30
                  xor          s9, a7, gp
                  slti         s10, s11, 1924
                  c.or         s1, a1
                  c.or         a0, s1
                  c.srli       s0, 29
                  divu         a0, a7, a0
                  div          zero, sp, t0
                  rem          t4, s8, s11
                  csrrs        s0, 0x340, zero
                  and          s4, s1, t4
                  c.xor        a3, a2
                  mul          s2, s9, sp
                  srli         s7, t5, 2
                  div          s8, a6, t4
                  srai         s6, s0, 8
                  addi         s4, t6, 769
                  and          s3, a6, t2
                  or           a0, t2, ra
                  divu         s6, a4, a2
                  or           t0, t3, s5
                  csrrci       s11, 0x340, 12
                  xor          sp, tp, s5
                  rem          a7, a4, t4
                  divu         gp, t5, t5
                  mul          a7, t6, s1
                  csrrsi       t2, 0x340, 0
                  csrrsi       s3, 0x340, 0
                  c.li         t3, 12
                  mulhsu       s6, t0, s9
                  sub          a2, a3, a1
                  mulhsu       s11, s11, s9
                  xor          zero, s9, s0
                  c.or         s0, s0
                  sltu         ra, t5, tp
                  slti         ra, tp, 1081
                  ori          a0, s1, 1557
                  csrrsi       t3, 0x340, 0
                  divu         s11, t4, s8
                  andi         a0, sp, -1524
                  mulhsu       t2, sp, t2
                  mul          s5, s4, ra
                  and          s9, t2, a0
                  c.addi16sp   sp, -16
                  auipc        zero, 693385
                  lui          a5, 487119
                  divu         s3, zero, s7
                  sra          a2, ra, s6
                  add          tp, s10, s3
                  c.or         a0, a1
                  auipc        a3, 441957
                  sltu         ra, t1, a5
                  slti         s7, t4, 776
                  c.and        s0, a4
                  xor          a3, gp, s1
                  remu         gp, s7, t5
                  sltu         a4, zero, a2
                  mul          a5, s8, s7
                  lui          s1, 869463
                  slli         a2, a5, 7
                  srl          s4, t4, a7
                  addi         gp, s3, -1016
                  c.srai       s1, 31
                  mulhsu       a6, t6, s8
                  ori          s8, a6, -1321
                  sub          a3, t3, a4
                  add          a7, t0, a7
                  c.mv         t4, s11
                  c.sub        s0, a3
                  remu         s5, t5, s11
                  c.nop
                  mulh         s11, a1, s0
                  c.slli       t3, 13
                  div          a7, s6, s5
                  divu         t5, tp, t1
                  csrrwi       s6, 0x340, 18
                  c.slli       t0, 3
                  nop
                  c.and        a3, a0
                  csrrc        s11, 0x340, zero
                  srl          t5, t6, s3
                  div          s5, s10, t2
                  slti         a2, s1, 915
                  sltiu        t0, a2, -1905
                  and          s5, s5, a5
                  c.lui        t4, 13
                  c.sub        s1, s0
                  sra          a3, s5, gp
                  c.add        a7, t1
                  sltiu        s5, a2, 1224
                  c.andi       a5, 23
                  c.xor        a2, a4
                  csrrci       s2, 0x340, 15
                  remu         s5, t5, sp
                  nop
                  c.xor        s0, a1
                  and          a0, a5, ra
                  ori          s6, zero, 1287
                  slt          s9, s10, a5
                  c.mv         t5, a6
                  c.srli       a4, 22
                  c.slli       s8, 24
                  mulhsu       t5, a0, t3
                  c.and        a4, a0
                  c.nop
                  sll          s8, s7, t2
                  c.and        a3, a2
                  slli         a2, s2, 15
                  c.srai       a3, 1
                  csrrc        tp, 0x340, zero
                  c.xor        a0, a1
                  ori          a6, a2, 688
                  csrrsi       t5, 0x340, 0
                  mul          s8, gp, gp
                  sra          a2, s6, gp
                  csrrsi       s4, 0x340, 0
                  andi         a3, s6, 8
                  div          s7, a5, ra
                  c.addi4spn   a4, sp, 96
                  addi         s7, t4, -1945
                  srai         t5, t4, 10
                  csrrci       s2, 0x340, 0
                  mul          a6, gp, s2
                  c.xor        a0, a1
                  mulh         t4, ra, t0
                  slt          tp, s7, t3
                  c.srai       s1, 22
                  c.sub        a2, a3
                  csrrwi       gp, 0x340, 17
                  c.srai       a0, 22
                  srli         zero, s0, 3
                  slt          t4, ra, tp
                  nop
                  srli         a3, gp, 15
                  c.slli       s6, 5
                  c.or         s1, a1
                  csrrci       s8, 0x340, 27
                  addi         a0, a7, -697
                  c.and        s0, s1
                  xori         a7, s8, -1158
                  c.lui        a6, 6
                  srai         gp, s6, 21
                  sub          s5, s3, t5
                  andi         s8, s4, -910
                  auipc        s10, 656467
                  slli         s6, a6, 0
                  c.srli       a0, 10
                  c.andi       a3, 27
                  xori         gp, t6, 679
                  c.add        s1, s3
                  and          gp, zero, s9
                  c.slli       t4, 29
                  and          tp, t6, zero
                  c.add        ra, t6
                  c.sub        s1, a4
                  srai         t2, s7, 17
                  c.sub        s1, a3
                  xor          a5, s0, s6
                  c.addi16sp   sp, 304
                  div          gp, s6, ra
                  csrrs        s2, 0x340, zero
                  c.add        s7, a2
                  c.slli       s10, 19
                  c.sub        a5, a3
                  div          a7, t1, a1
                  c.addi16sp   sp, 256
                  c.srli       a3, 21
                  csrrwi       t3, 0x340, 19
                  divu         s4, s1, t6
                  add          tp, a1, a4
                  or           s9, s5, zero
                  mulhu        s7, s8, t3
                  c.sub        a0, a2
                  c.sub        a3, s0
                  nop
                  sra          t4, t4, tp
                  sll          sp, a1, s2
                  c.addi       a2, 29
                  c.lui        tp, 7
                  rem          t4, s7, t2
                  csrrc        s0, 0x340, s9
                  sltu         s7, s1, a7
                  csrrci       t4, 0x340, 0
                  csrrsi       a7, 0x340, 0
                  xor          a6, s1, a6
                  rem          a5, a0, s9
                  c.addi       a6, 5
                  mulhsu       s2, a2, a4
                  xori         s3, ra, 561
                  ori          t0, t5, 1688
                  c.slli       a2, 13
                  csrrc        t5, 0x340, zero
                  c.andi       a2, -1
                  c.addi       a0, -1
                  c.addi       s5, 27
                  c.xor        a5, a5
                  sra          gp, t6, a5
                  mul          a0, s11, tp
                  csrrci       s1, 0x340, 27
                  slti         s1, t1, 1631
                  slli         s0, t0, 10
                  slti         t2, t5, -711
                  c.srai       s0, 14
                  c.addi       t2, -1
                  c.xor        a3, a2
                  sltiu        a4, sp, -326
                  c.add        t4, t3
                  remu         t5, s6, s2
                  c.lui        ra, 9
                  srai         s10, s0, 1
                  c.srli       s0, 23
                  c.addi4spn   a3, sp, 544
                  mul          s8, s4, s2
                  c.sub        a3, a1
                  lui          a0, 214792
                  csrrw        a4, 0x340, s9
                  sltu         s5, s2, tp
                  add          zero, a0, a1
                  mulhsu       a5, t6, s10
                  ori          t4, tp, 1949
                  xori         s4, s11, -11
                  mulhsu       s6, s1, a0
                  csrrsi       s7, 0x340, 0
                  remu         a6, t2, s9
                  divu         s11, a6, a3
                  c.addi16sp   sp, -16
                  auipc        t4, 278764
                  mulhsu       s4, s8, t5
                  slli         zero, a0, 17
                  nop
                  mul          a7, sp, s1
                  sltu         ra, t2, s9
                  c.lui        s1, 19
                  c.li         a7, 24
                  csrrc        a6, 0x340, zero
                  srai         t5, ra, 1
                  csrrc        t3, 0x340, s0
                  andi         s6, a2, -400
                  xor          a0, a5, t4
                  csrrwi       zero, 0x340, 19
                  c.mv         s10, s10
                  csrrs        s4, 0x340, zero
                  c.or         a2, s1
                  mul          s0, s7, tp
                  sub          gp, a3, s7
                  c.addi4spn   a0, sp, 480
                  slli         gp, s4, 14
                  mulh         s11, zero, s9
                  addi         s11, t1, 1984
                  c.addi4spn   a4, sp, 240
                  c.andi       a4, -1
                  xor          t0, a2, a0
                  slli         s6, s8, 1
                  add          t5, a5, a1
                  sltiu        sp, s1, 28
                  srli         s9, a5, 24
                  divu         s1, s9, a2
                  csrrs        ra, 0x340, zero
                  xori         tp, t6, -295
                  or           a0, ra, t3
                  sltiu        s5, a3, -599
                  c.slli       gp, 2
                  ori          s2, a7, 716
                  xor          a6, s5, t1
                  rem          a2, s6, a7
                  lui          a5, 433887
                  csrrci       t3, 0x340, 1
                  mulhsu       s8, t6, t5
                  slt          s1, s9, a3
                  c.sub        a4, a4
                  mulhu        a2, a6, a1
                  c.srai       s0, 22
                  slti         s10, s9, 468
                  csrrwi       s0, 0x340, 27
                  c.sub        a0, a5
                  c.addi16sp   sp, -16
                  csrrc        t2, 0x340, tp
                  c.addi4spn   a3, sp, 176
                  divu         gp, s3, a0
                  csrrsi       a6, 0x340, 10
                  csrrs        a4, 0x340, zero
                  csrrw        a0, 0x340, t1
                  ori          s1, a7, 901
                  c.nop
                  auipc        s4, 521453
                  xor          a3, ra, a0
                  add          s0, t5, s0
                  c.addi4spn   a0, sp, 976
                  c.or         s1, s0
                  or           t4, a7, s6
                  c.srli       a5, 20
                  andi         t0, s0, -2023
                  c.srai       s1, 13
                  srli         gp, s4, 17
                  csrrw        a6, 0x340, tp
                  sltu         gp, s10, a5
                  slt          s2, t3, s11
                  sub          s7, t6, t5
                  c.xor        a0, a5
                  csrrwi       a2, 0x340, 0
                  ori          a6, s10, 92
                  mul          tp, t3, s6
                  add          tp, s4, a2
                  auipc        s11, 192601
                  xor          a6, s1, s8
                  c.srai       a2, 23
                  ori          t5, t0, -1814
                  mulh         s8, s3, s11
                  csrrs        a5, 0x340, a4
                  andi         tp, s5, 1731
                  mulhsu       s7, t5, t5
                  sltu         s1, t1, a1
                  divu         a4, zero, zero
                  divu         a0, gp, ra
                  c.add        t5, t5
                  c.and        s1, a5
                  rem          s10, t1, t2
                  addi         a2, a6, -1559
                  csrrw        a7, 0x340, a2
                  srai         zero, s7, 1
                  div          s10, t1, tp
                  divu         a5, s4, s9
                  srli         s6, s5, 4
                  c.or         a5, a0
                  rem          a3, zero, s2
                  csrrw        s11, 0x340, s9
                  add          zero, s3, sp
                  slti         ra, s7, 410
                  addi         s5, ra, -1562
                  c.xor        s1, s0
                  csrrw        s11, 0x340, s1
                  srai         t4, t3, 6
                  c.li         s0, 28
                  csrrc        gp, 0x340, s1
                  csrrs        t3, 0x340, zero
                  srai         a2, s8, 1
                  addi         t0, a0, 1004
                  c.addi4spn   a3, sp, 1008
                  and          s7, a1, s3
                  c.lui        s8, 13
                  remu         s0, zero, a2
                  sra          s0, t3, s9
                  csrrwi       s10, 0x340, 5
                  xori         t3, s6, 75
                  c.srai       a3, 21
                  c.nop
                  c.srai       a4, 10
                  mulhu        a6, a4, s1
                  csrrc        s6, 0x340, zero
                  srai         s5, s8, 19
                  srli         sp, s8, 25
                  slti         s10, s0, 2022
                  c.sub        s1, s0
                  remu         s3, s6, s6
                  and          t2, sp, a2
                  c.lui        s1, 15
                  mulhsu       s2, s1, sp
                  sub          a2, sp, s10
                  srl          s10, s0, t4
                  slt          tp, a5, gp
                  c.nop
                  slt          tp, a0, t5
                  csrrci       t2, 0x340, 1
                  c.addi       a5, -1
                  srl          s10, a4, a6
                  slti         a7, s0, -145
                  c.addi       t2, 18
                  csrrci       s3, 0x340, 4
                  c.mv         sp, s9
                  c.sub        s0, a4
                  auipc        t3, 998731
                  slti         t5, s5, -1905
                  c.srli       a4, 18
                  or           t4, a3, a6
                  srai         a0, a3, 30
                  add          t2, a2, tp
                  mulh         t0, a4, s10
                  c.nop
                  xori         a5, a5, -186
                  c.add        sp, a1
                  remu         sp, a0, s9
                  sll          gp, s8, t4
                  c.slli       s9, 12
                  csrrw        s8, 0x340, s10
                  remu         a4, zero, sp
                  rem          s9, s11, s8
                  c.xor        a4, s1
                  mulhu        s2, t2, s5
                  mul          s7, s0, t5
                  slli         s0, s0, 8
                  c.sub        s1, s0
                  srai         ra, a1, 6
                  srli         t4, s9, 23
                  c.and        s1, a2
                  nop
                  sra          s4, s6, ra
                  c.lui        s6, 4
                  div          t5, s6, s3
                  lui          s6, 930583
                  csrrwi       a3, 0x340, 6
                  mul          s7, t2, s3
                  srli         zero, t6, 7
                  c.slli       t3, 15
                  c.srai       s1, 30
                  nop
                  c.add        t2, s1
                  c.andi       a3, 13
                  c.srai       a0, 2
                  lui          s4, 547911
                  rem          ra, s2, s2
                  mul          ra, a1, a3
                  slti         s2, tp, -1343
                  srli         t0, t3, 27
                  csrrsi       tp, 0x340, 0
                  lui          a7, 435694
                  sltu         t5, t6, a1
                  xori         s10, s5, -1115
                  nop
                  c.andi       s0, -1
                  c.addi16sp   sp, 480
                  mulhu        a3, s8, t6
                  add          sp, t5, t3
                  c.nop
                  srli         t2, s9, 8
                  or           s10, t3, s0
                  srai         ra, t6, 18
                  rem          s10, a1, a0
                  c.and        a0, s1
                  c.nop
                  sra          t4, t1, s9
                  mulhsu       tp, tp, s0
                  andi         s9, s11, 753
                  nop
                  c.addi       t3, -1
                  csrrs        s4, 0x340, zero
                  sll          a6, s3, gp
                  rem          a6, t6, s10
                  sub          a6, t0, t2
                  or           zero, a3, a6
                  remu         a4, t3, tp
                  slti         a0, a5, 1227
                  andi         a0, a3, 338
                  c.andi       a0, 7
                  sltiu        s1, t4, 783
                  nop
                  csrrc        s8, 0x340, s9
                  xor          a2, s2, s1
                  divu         t4, a4, s11
                  sra          t2, t4, t2
                  xori         s3, t4, -1620
                  c.addi       a7, -1
                  slli         t3, a3, 3
                  c.or         s0, a2
                  c.addi16sp   sp, 96
                  nop
                  c.addi       a6, -1
                  lui          a2, 440217
                  mulh         s11, gp, s9
                  xori         gp, s3, 545
                  c.lui        gp, 7
                  c.add        a3, a5
                  andi         a7, a5, 1355
                  and          a2, a1, a4
                  csrrci       t5, 0x340, 0
                  c.srli       a3, 13
                  sra          ra, s3, zero
                  srli         a6, t0, 13
                  mulhu        tp, a4, t2
                  c.addi       a3, -1
                  c.andi       a0, -1
                  ori          s0, zero, -1893
                  c.and        s1, s0
                  c.lui        s1, 13
                  c.slli       gp, 23
                  srai         s7, s3, 4
                  c.andi       s0, -1
                  srl          s7, a1, t5
                  mulhsu       s11, a2, a3
                  c.xor        a3, a3
                  mulhu        s3, a2, sp
                  csrrci       s2, 0x340, 0
                  srl          tp, s7, ra
                  c.addi       sp, 3
                  lui          t3, 507957
                  csrrs        t4, 0x340, s1
                  div          s2, s9, t1
                  slti         t3, tp, 40
                  c.xor        a3, a1
                  addi         t3, a3, 1084
                  c.addi16sp   sp, -16
                  c.srai       s0, 21
                  or           a2, t3, s3
                  addi         s7, s8, 1792
                  c.addi16sp   sp, 384
                  csrrc        s10, 0x340, zero
                  csrrwi       a3, 0x340, 15
                  mul          ra, a6, a3
                  c.srai       s0, 17
                  mulh         ra, s1, a4
                  mul          s1, s6, s7
                  sll          a3, a7, t1
                  c.add        gp, a1
                  c.addi16sp   sp, 384
                  c.mv         gp, s10
                  or           t0, a1, a7
                  add          t0, s2, a0
                  sll          t5, s0, a4
                  divu         s3, ra, a5
                  c.nop
                  c.sub        a0, a4
                  sltu         sp, s0, a2
                  c.and        a4, a3
                  xori         t4, s7, 1083
                  csrrs        s11, 0x340, s4
                  csrrsi       ra, 0x340, 0
                  xori         s4, a4, -1693
                  slli         a3, a7, 22
                  csrrw        a6, 0x340, gp
                  remu         t0, s3, s6
                  c.add        sp, t6
                  srli         sp, s6, 6
                  c.lui        a2, 24
                  sll          a3, a1, s6
                  csrrs        s4, 0x340, s5
                  c.addi4spn   a5, sp, 576
                  csrrwi       a2, 0x340, 18
                  c.addi4spn   a3, sp, 608
                  srai         s0, t2, 20
                  c.lui        a0, 16
                  lui          zero, 97493
                  c.sub        s0, a1
                  c.addi16sp   sp, 304
                  c.addi16sp   sp, -16
                  c.mv         tp, a6
                  c.addi       s0, -1
                  c.li         t5, -1
                  sltu         a2, s3, s10
                  csrrsi       s5, 0x340, 0
                  c.slli       s8, 15
                  rem          a0, ra, gp
                  xor          t5, ra, t1
                  mulhu        sp, ra, a6
                  c.slli       s11, 5
                  slti         t3, t3, 1664
                  xori         sp, t3, -1125
                  remu         s4, a2, a0
                  csrrci       s5, 0x340, 12
                  c.andi       s0, 18
                  csrrci       s0, 0x340, 0
                  c.lui        tp, 18
                  c.or         s1, a0
                  or           tp, ra, s0
                  xor          a4, a4, s5
                  csrrsi       s8, 0x340, 0
                  c.slli       t4, 20
                  c.xor        s1, s0
                  auipc        s10, 887462
                  c.slli       s0, 7
                  c.andi       s1, 6
                  divu         t4, s6, s1
                  ori          t5, s0, -1045
                  xori         s1, s11, 1054
                  csrrsi       t2, 0x340, 24
                  csrrw        a3, 0x340, s7
                  slli         a5, a1, 25
                  csrrsi       ra, 0x340, 5
                  div          a3, t2, t1
                  mul          zero, a5, zero
                  c.slli       gp, 22
                  mulhu        s10, s3, sp
                  srai         s2, a1, 22
                  c.sub        s0, a5
                  csrrwi       a4, 0x340, 6
                  addi         a3, s1, 94
                  mul          a0, a1, t6
                  c.slli       s8, 21
                  c.addi16sp   sp, 416
                  slt          t3, s0, t3
                  csrrc        s2, 0x340, zero
                  ori          t4, a4, 807
                  slli         s3, t5, 10
                  sll          a6, s7, gp
                  remu         tp, a3, a7
                  csrrc        s6, 0x340, zero
                  sltiu        a3, s5, 1080
                  xori         t3, t5, -1791
                  c.srai       a0, 21
                  csrrwi       s1, 0x340, 28
                  sltiu        a4, a6, -659
                  c.or         a2, s0
                  auipc        tp, 177009
                  mulh         t3, a7, gp
                  c.addi16sp   sp, -16
                  addi         a2, sp, -1254
                  c.srli       a0, 19
                  c.addi16sp   sp, -16
                  csrrw        a3, 0x340, t5
                  csrrs        a3, 0x340, t6
                  sll          t5, t0, s7
                  mulh         s0, t6, s4
                  csrrsi       a3, 0x340, 0
                  c.or         a4, a5
                  andi         ra, s6, -60
                  sltu         ra, s2, s9
                  remu         t3, sp, sp
                  c.xor        a0, a5
                  ori          t4, s7, -437
                  csrrci       sp, 0x340, 9
                  csrrsi       tp, 0x340, 20
                  csrrc        a5, 0x340, zero
                  c.add        a0, sp
                  c.andi       a5, 12
                  c.slli       a2, 27
                  c.addi4spn   a5, sp, 960
                  c.sub        a0, s1
                  c.andi       a0, -1
                  slti         s7, sp, -1003
                  xor          s5, s3, t3
                  c.slli       a7, 2
                  or           a2, t1, a4
                  slti         s6, t2, 1885
                  csrrci       s0, 0x340, 0
                  nop
                  sll          ra, tp, s4
                  srai         a0, a0, 4
                  srl          a7, s5, s9
                  mulh         t3, a6, a0
                  sltu         s7, s0, a5
                  rem          a3, t5, s1
                  rem          s6, a2, s4
                  c.addi4spn   a4, sp, 384
                  c.addi       ra, 24
                  srli         a7, ra, 16
                  csrrw        a7, 0x340, t2
                  xor          s5, ra, t3
                  srai         s6, a1, 22
                  auipc        s2, 615245
                  mulhu        zero, t6, s0
                  sll          s4, t4, a4
                  c.addi16sp   sp, -16
                  mulh         a7, s4, a6
                  c.xor        s1, a3
                  sub          s5, s3, t4
                  srli         t5, t4, 30
                  c.andi       s1, 17
                  div          zero, tp, s3
                  mulhu        ra, zero, a5
                  csrrsi       sp, 0x340, 31
                  sub          s7, gp, a2
                  c.addi16sp   sp, -16
                  mulhsu       s5, zero, s11
                  sll          t2, s8, a1
                  c.and        a3, a4
                  c.addi4spn   s0, sp, 816
                  remu         a4, s7, s5
                  divu         a4, s4, a6
                  slt          s3, t0, sp
                  c.andi       a2, 20
                  c.nop
                  c.addi16sp   sp, 448
                  remu         s6, t2, a6
                  c.addi4spn   a2, sp, 352
                  slli         s2, s5, 28
                  and          a0, t5, s1
                  sub          s7, gp, a3
                  mulhsu       s7, s5, tp
                  c.lui        s0, 29
                  c.nop
                  rem          t2, t2, s8
                  c.addi4spn   a3, sp, 624
                  rem          s11, s4, a5
                  mulh         s4, s9, a7
                  c.mv         s0, a0
                  mulhsu       a6, zero, gp
                  c.nop
                  c.li         s4, -1
                  srai         a6, s9, 7
                  c.nop
                  mulh         t3, t3, s10
                  c.add        sp, t6
                  c.addi       s6, -1
                  sltu         t2, s3, t2
                  c.nop
                  xori         s9, s1, 1669
                  c.andi       s0, -1
                  addi         a0, s10, -114
                  sra          a4, t6, gp
                  c.slli       t4, 16
                  rem          a4, s6, s9
                  xor          s4, s1, s2
                  c.xor        a4, a1
                  sll          s5, a3, s9
                  sltiu        t2, s10, 256
                  c.li         s8, 1
                  lui          a3, 201891
                  csrrwi       s2, 0x340, 25
                  c.sub        s0, a0
                  c.addi16sp   sp, 288
                  c.addi4spn   a3, sp, 624
                  csrrw        a3, 0x340, t3
                  lui          a6, 1030157
                  mul          a6, s6, sp
                  mul          sp, ra, a0
                  add          s8, s6, a2
                  srai         s9, gp, 18
                  sll          a6, s0, s6
                  slti         s4, t5, -122
                  rem          t5, a2, t5
                  sltu         s10, s8, t0
                  srai         ra, t3, 26
                  mulhsu       s8, s11, t4
                  slti         ra, s1, 1127
                  andi         s5, t4, 1900
                  slt          s9, s10, s0
                  xori         s6, s8, -1063
                  c.sub        a3, s1
                  sra          sp, tp, t1
                  sltiu        s5, t3, -1723
                  mulhu        gp, a6, s2
                  slli         a0, gp, 2
                  sltu         t2, t5, a2
                  slt          a2, s2, s3
                  and          s7, zero, a5
                  sra          ra, a4, s8
                  sltu         s5, a4, t1
                  auipc        t3, 176211
                  div          sp, a3, a0
                  rem          t2, ra, t0
                  mulhsu       a0, s1, t6
                  rem          ra, zero, s0
                  c.xor        a3, a2
                  c.or         a0, a3
                  c.srli       a0, 6
                  xor          gp, a7, s9
                  div          s6, a1, a7
                  auipc        s6, 142574
                  add          s11, ra, a2
                  c.xor        s1, a2
                  mulh         a7, a1, t4
                  andi         s7, a7, 1108
                  srli         zero, s3, 5
                  csrrci       s0, 0x340, 20
                  sub          s3, a0, s3
                  xori         t2, a7, -2041
                  xori         a4, a0, -1481
                  add          tp, tp, a0
                  c.addi4spn   a0, sp, 608
                  c.addi16sp   sp, -16
                  csrrc        a4, 0x340, s8
                  nop
                  or           t4, t4, s2
                  c.sub        a3, a0
                  sub          s2, t4, gp
                  lui          t2, 765513
                  c.lui        gp, 27
                  srli         s11, a4, 1
                  c.nop
                  nop
                  c.addi16sp   sp, 224
                  c.add        t0, a2
                  mulhsu       s2, zero, a2
                  mulh         a0, s0, s8
                  c.addi4spn   s0, sp, 416
                  srl          s6, a7, s0
                  c.slli       t2, 9
                  csrrsi       s8, 0x340, 0
                  lui          s1, 1047129
                  c.xor        s1, a0
                  csrrw        s9, 0x340, a0
                  c.lui        ra, 20
                  slli         s3, s11, 23
                  csrrci       gp, 0x340, 0
                  remu         zero, s7, a2
                  csrrci       ra, 0x340, 0
                  addi         t3, zero, 1664
                  auipc        zero, 248261
                  c.srli       s0, 12
                  c.addi16sp   sp, -16
                  slti         t0, a2, 1534
                  xori         a6, t5, 1844
                  div          s6, a4, s10
                  or           s2, a6, t1
                  srai         s3, gp, 20
                  slt          a3, s2, s8
                  divu         gp, a3, s1
                  sll          sp, a4, s10
                  mulh         tp, t3, s7
                  xori         s2, sp, 997
                  mulhu        a0, t1, t0
                  remu         a5, s0, ra
                  div          t5, t0, s9
                  c.sub        a3, s0
                  addi         gp, a3, -1886
                  c.slli       tp, 25
                  c.slli       t4, 10
                  andi         s6, s11, 1608
                  xori         t5, zero, 1988
                  c.andi       a5, 10
                  sltu         s10, s8, t3
                  mul          s6, s8, a2
                  sltiu        a0, a6, 274
                  c.slli       s10, 6
                  divu         s0, s9, gp
                  sltiu        s2, a7, 1121
                  c.srai       a3, 1
                  div          s2, s5, zero
                  c.lui        a6, 19
                  mul          s10, t0, sp
                  slti         a3, ra, -1895
                  c.nop
                  andi         s9, s2, -1552
                  csrrw        s0, 0x340, s7
                  add          a0, s7, t0
                  c.srli       a4, 2
                  srai         s7, s7, 24
                  c.and        a4, a5
                  sll          s0, s4, t0
                  c.li         s4, 4
                  csrrwi       s7, 0x340, 31
                  csrrsi       zero, 0x340, 0
                  c.mv         a3, a0
                  lui          t0, 604558
                  mul          tp, a4, a0
                  c.li         a2, -1
                  csrrw        a3, 0x340, a3
                  csrrs        tp, 0x340, gp
                  or           a2, a2, t0
                  srl          s5, a4, t3
                  c.addi4spn   a3, sp, 688
                  c.or         a5, a5
                  c.li         s2, 28
                  c.or         a0, a5
                  csrrc        sp, 0x340, zero
                  sltiu        t0, s10, 1367
                  mulhu        s10, a2, t6
                  slt          s10, ra, zero
                  srl          tp, a3, a3
                  mul          s5, a7, ra
                  c.addi16sp   sp, -16
                  slti         a6, a1, 1200
                  xor          s10, s2, s7
                  sll          gp, a4, t5
                  mul          s8, s7, t0
                  c.add        sp, s11
                  c.add        a5, t2
                  c.andi       a2, -1
                  c.nop
                  xori         a6, a3, -1338
                  slli         s9, s10, 31
                  c.nop
                  csrrwi       s4, 0x340, 26
                  c.slli       t3, 1
                  add          s10, s10, s9
                  rem          s2, a0, gp
                  sll          t0, sp, t6
                  sub          s0, ra, s10
                  csrrsi       s1, 0x340, 19
                  add          s3, t0, a4
                  c.xor        a4, a3
                  srl          a5, a2, t4
                  c.addi16sp   sp, 448
                  remu         tp, s5, t5
                  nop
                  c.addi16sp   sp, 208
                  c.srli       a3, 30
                  csrrc        s11, 0x340, zero
                  c.or         a2, a5
                  c.andi       a5, -1
                  xori         tp, sp, -984
                  sra          gp, a6, t6
                  and          s11, t5, s10
                  slt          a7, a0, a1
                  add          s4, s2, t3
                  c.addi       gp, -1
                  lui          zero, 885810
                  or           s11, t0, a2
                  c.srai       s0, 10
                  csrrwi       t5, 0x340, 16
                  mulhu        s8, a2, t2
                  and          s1, tp, t2
                  mulh         s7, ra, t2
                  c.addi16sp   sp, -16
                  mulhu        zero, s8, a4
                  sltu         a3, s0, s0
                  c.mv         a4, a0
                  and          ra, a7, a7
                  c.addi       t3, 29
                  csrrs        a5, 0x340, zero
                  c.and        a4, a4
                  mul          a7, a3, tp
                  slli         s11, a6, 24
                  c.and        a0, a0
                  c.andi       a2, 25
                  lui          s11, 624759
                  divu         a2, t3, a7
                  c.srli       s1, 11
                  c.slli       a3, 14
                  remu         s5, gp, s0
                  csrrwi       s4, 0x340, 12
                  sltiu        a7, gp, -557
                  sll          s6, s3, t6
                  slt          s7, s8, a5
                  slti         s1, t4, 420
                  c.mv         gp, s11
                  mul          a3, s0, a7
                  c.add        s11, s8
                  c.addi4spn   a4, sp, 64
                  divu         a3, s7, s9
                  srl          a5, s9, s4
                  sltu         s3, t2, gp
                  c.addi16sp   sp, 336
                  add          a0, sp, s11
                  sltu         s4, t3, a3
                  xor          s9, t0, t5
                  slli         ra, a3, 18
                  c.li         t3, -1
                  c.and        a4, a3
                  srl          zero, s7, s9
                  srl          a7, s1, s6
                  c.add        s8, a4
                  or           t0, s10, s10
                  mul          t5, s3, zero
                  c.slli       s1, 25
                  c.lui        a3, 6
                  c.slli       t3, 6
                  or           a2, a7, a0
                  ori          a0, s4, -286
                  csrrci       a4, 0x340, 0
                  xor          t2, t5, t6
                  remu         t2, t4, s3
                  c.sub        a2, a1
                  sll          a7, s7, s10
                  c.addi       s4, 1
                  c.sub        a5, s1
                  ori          sp, t4, 99
                  csrrwi       t3, 0x340, 27
                  xor          s0, a7, t1
                  sub          ra, a5, s5
                  c.addi4spn   a2, sp, 176
                  mul          t3, t1, a5
                  csrrci       gp, 0x340, 14
                  mul          a2, t2, s10
                  xor          ra, a3, s4
                  sltu         s0, a6, s7
                  csrrwi       sp, 0x340, 22
                  srli         s10, s0, 3
                  divu         t3, t5, s2
                  csrrs        s5, 0x340, zero
                  srai         s6, t5, 27
                  c.add        s5, ra
                  csrrs        t0, 0x340, zero
                  sra          t3, s8, tp
                  c.addi4spn   a5, sp, 32
                  csrrwi       s4, 0x340, 6
                  csrrsi       s7, 0x340, 0
                  sltu         ra, s8, sp
                  divu         s9, s8, s6
                  c.add        ra, t4
                  sra          a6, s11, a5
                  c.addi16sp   sp, -16
                  c.nop
                  sll          t3, s6, t3
                  csrrc        zero, 0x340, zero
                  c.srai       a2, 12
                  div          a2, a6, s6
                  csrrw        t5, 0x340, t0
                  mul          a0, a7, s3
                  c.sub        a3, a3
                  c.srli       s0, 31
                  addi         s7, s3, 1516
                  c.add        s9, a0
                  mulhsu       zero, t2, s0
                  csrrs        s1, 0x340, zero
                  c.addi4spn   a4, sp, 672
                  csrrsi       s5, 0x340, 0
                  remu         t5, a4, s0
                  sub          a7, t6, s3
                  srl          s7, tp, t5
                  c.sub        a3, a0
                  sll          t2, a6, a0
                  c.sub        s0, a5
                  c.srai       s0, 10
                  andi         a4, t5, -882
                  xor          s5, a5, a2
                  slti         a4, a2, -989
                  xor          ra, a2, s4
                  div          t5, s8, s0
                  c.or         s0, s1
                  c.or         a0, a2
                  c.addi16sp   sp, -16
                  c.nop
                  srai         zero, s6, 23
                  addi         t5, t3, -986
                  slli         a0, a0, 16
                  c.add        s0, t1
                  xor          s2, t0, s1
                  c.addi16sp   sp, -16
                  c.andi       s1, -1
                  csrrsi       s11, 0x340, 0
                  c.slli       t4, 27
                  remu         s5, s5, s3
                  remu         a4, s3, a7
                  srai         a0, s10, 27
                  c.slli       s7, 16
                  sltu         ra, a7, gp
                  rem          sp, a6, s3
                  c.slli       gp, 3
                  c.srai       a3, 27
                  andi         ra, ra, 456
                  srl          s3, t6, t1
                  and          s4, a7, a2
                  srai         s7, t1, 16
                  c.slli       s4, 24
                  c.addi       s5, 31
                  divu         t5, t0, t2
                  srl          zero, s3, t0
                  or           a6, tp, a7
                  div          s3, zero, ra
                  div          s10, ra, a6
                  xor          a5, s11, tp
                  sra          t4, a4, s8
                  csrrw        t5, 0x340, a2
                  c.lui        a4, 21
                  srl          s3, s6, a5
                  c.slli       a0, 6
                  mulhsu       ra, s9, t6
                  xori         s6, t3, -8
                  mul          s3, a2, s2
                  lui          s0, 942504
                  mulh         t0, s9, a6
                  xor          a7, t1, a5
                  lui          a0, 325466
                  slti         s6, a5, -1854
                  mulhsu       a3, a1, a5
                  andi         a0, a2, 418
                  c.mv         t2, s3
                  csrrwi       s4, 0x340, 14
                  xori         a0, tp, 1490
                  c.or         a0, a0
                  csrrc        gp, 0x340, t4
                  c.mv         a0, s11
                  xor          s3, t3, a3
                  c.nop
                  rem          s0, gp, zero
                  c.or         a0, a5
                  divu         s1, t6, t5
                  sltu         t3, t0, tp
                  addi         ra, ra, 1635
                  and          s0, a6, a2
                  divu         a7, a2, zero
                  c.addi4spn   a5, sp, 176
                  add          a2, ra, t5
                  c.addi       sp, 21
                  c.addi16sp   sp, 320
                  csrrw        t2, 0x340, s2
                  xori         t3, s9, -1610
                  slt          s0, a4, s2
                  ori          sp, sp, 1196
                  mulhsu       s7, t4, t5
                  ori          a4, s7, -992
                  c.and        a5, s0
                  sltu         t4, s8, a3
                  c.and        a5, a3
                  sltiu        tp, s10, -69
                  c.slli       s1, 2
                  c.or         a5, a3
                  sra          s0, s2, t5
                  c.slli       a3, 9
                  c.add        sp, a1
                  slli         s6, t6, 27
                  slti         a3, s8, -467
                  auipc        s7, 114320
                  c.sub        a4, a4
                  c.addi16sp   sp, 320
                  srl          t5, a4, t0
                  c.or         a2, a2
                  slt          t2, s1, ra
                  c.sub        a2, s0
                  or           a5, s5, s3
                  c.lui        a6, 8
                  sra          s8, tp, s8
                  slli         t0, a7, 22
                  c.srai       a2, 16
                  sub          a7, s7, s2
                  sll          zero, s11, gp
                  c.slli       t0, 17
                  remu         s9, t3, s5
                  c.or         s0, s1
                  srai         a4, a0, 19
                  c.xor        a3, s0
                  c.sub        a4, a5
                  slti         tp, t2, 777
                  srli         s9, s2, 1
                  slti         a6, s5, -878
                  c.lui        a7, 27
                  srai         s1, s5, 13
                  c.addi4spn   s1, sp, 544
                  srai         s11, a3, 3
                  mulhsu       s5, s7, a4
                  c.xor        s1, a3
                  c.and        a0, a3
                  c.and        a4, a1
                  c.add        a2, s11
                  auipc        s7, 703260
                  addi         ra, tp, -94
                  c.xor        a2, a1
                  slli         a4, s1, 19
                  csrrci       ra, 0x340, 16
                  div          t0, t2, t3
                  c.mv         s5, ra
                  and          a0, s9, t6
                  remu         a0, s3, zero
                  sll          s0, s9, t1
                  xori         s3, tp, 1371
                  sltu         t4, a2, t6
                  csrrw        t5, 0x340, zero
                  mulhsu       ra, t6, s6
                  auipc        a4, 530241
                  xori         s2, t0, 12
                  sll          s6, s2, s8
                  c.addi4spn   s1, sp, 144
                  nop
                  lui          a0, 513496
                  remu         a3, s0, t3
                  mulhu        gp, s10, t2
                  c.addi       s2, -1
                  add          t5, t0, s6
                  c.addi       s7, 27
                  or           a2, s4, s1
                  and          s5, a6, s4
                  c.srai       s0, 24
                  xori         a2, s11, 54
                  csrrc        t3, 0x340, zero
                  c.srli       a2, 22
                  andi         s10, t4, 1275
                  remu         s8, t2, sp
                  c.lui        a7, 2
                  c.addi16sp   sp, -16
                  c.li         s5, 28
                  mulhsu       a0, t2, t1
                  xori         t3, s5, -662
                  ori          a7, a4, 1443
                  xori         a4, ra, 185
                  mulhu        t2, sp, a4
                  mul          t4, a1, s1
                  sltu         s9, sp, a1
                  mulhu        tp, t1, s8
                  c.add        s8, s4
                  mulh         s10, s2, t6
                  mulh         t0, s0, a1
                  or           a7, ra, a6
                  nop
                  c.andi       s0, -1
                  or           t5, a0, s10
                  xor          t4, t6, a6
                  c.and        a2, a1
                  slti         a3, a1, -1665
                  nop
                  c.nop
                  c.addi16sp   sp, 96
                  csrrs        t3, 0x340, s6
                  or           a3, a6, t4
                  and          zero, zero, s7
                  xori         s7, s8, 1766
                  mulh         a4, s5, t3
                  nop
                  c.slli       t4, 11
                  c.andi       a0, -1
                  sra          s7, s9, s7
                  c.nop
                  slti         a0, s2, 381
                  slli         s2, s4, 17
                  srai         s5, ra, 20
                  c.srai       a4, 7
                  sltu         tp, s2, t0
                  mulh         a4, s0, s1
                  ori          s7, t3, 1516
                  and          zero, gp, t5
                  divu         t2, s8, a1
                  csrrwi       tp, 0x340, 16
                  c.or         a2, a5
                  rem          a4, a2, a1
                  c.and        a4, a4
                  lui          t5, 687759
                  slti         zero, t4, -931
                  csrrwi       zero, 0x340, 25
                  mulhu        a7, tp, s4
                  c.addi       s3, -1
                  addi         s10, a5, -269
                  slli         s6, a7, 1
                  div          s7, t5, s9
                  ori          gp, s7, -194
                  c.or         a3, a2
                  nop
                  sra          gp, t2, a7
                  mul          t3, s1, s3
                  mulhu        s8, a6, a0
                  c.sub        a2, s0
                  c.add        ra, a7
                  sra          s11, s0, s8
                  srl          s2, a0, sp
                  divu         ra, s4, ra
                  mul          gp, s3, s5
                  ori          s3, t2, 1940
                  sltiu        t3, a5, 549
                  c.addi16sp   sp, 432
                  xor          s1, a7, t0
                  nop
                  c.xor        a5, a0
                  rem          s9, s10, s1
                  ori          s6, s2, 814
                  add          gp, sp, a3
                  csrrw        s0, 0x340, s6
                  sltu         t3, t5, zero
                  and          ra, zero, t0
                  addi         s7, t5, 623
                  c.mv         a0, s11
                  csrrci       t4, 0x340, 0
                  and          a5, t6, zero
                  c.and        s1, a3
                  auipc        s3, 184718
                  c.lui        s6, 9
                  xori         a7, s1, -960
                  srai         s8, s10, 24
                  sra          s4, t4, tp
                  c.li         s2, 8
                  mulhsu       t2, t3, a1
                  csrrs        s8, 0x340, zero
                  c.add        s6, a6
                  csrrwi       t0, 0x340, 1
                  rem          t5, s2, s8
                  c.slli       ra, 14
                  auipc        gp, 360551
                  sltu         zero, t5, a3
                  divu         ra, a1, a1
                  c.slli       s7, 9
                  c.li         s8, -1
                  csrrs        a5, 0x340, zero
                  c.mv         s10, t4
                  sltu         s2, s1, t3
                  c.addi16sp   sp, -16
                  c.or         s0, a1
                  xor          t5, t2, ra
                  and          s5, s7, s8
                  sltiu        s9, a1, -1901
                  c.li         a3, -1
                  sltiu        s5, t0, -1913
                  c.addi16sp   sp, 256
                  slti         s4, a3, -1570
                  csrrw        s8, 0x340, s3
                  ori          s2, s10, 690
                  c.li         s10, 1
                  c.andi       s1, -1
                  c.xor        s1, a0
                  c.slli       s6, 8
                  sub          a5, t4, ra
                  lui          t4, 112341
                  c.addi4spn   a4, sp, 128
                  sltiu        s0, a7, 335
                  c.li         sp, -1
                  srai         zero, gp, 9
                  sltu         a2, a3, s7
                  div          ra, s2, a7
                  c.nop
                  mulhu        tp, a5, t5
                  auipc        t2, 971882
                  c.lui        a6, 4
                  andi         s3, t2, -1699
                  csrrs        t4, 0x340, zero
                  divu         ra, s4, s5
                  sltiu        s11, s9, 1877
                  remu         a3, t4, t2
                  c.mv         a0, a3
                  csrrsi       s11, 0x340, 0
                  xori         s3, gp, 1828
                  c.li         sp, 12
                  csrrwi       s5, 0x340, 26
                  auipc        t5, 811684
                  lui          ra, 639340
                  andi         s3, s10, 312
                  lui          s3, 655882
                  andi         a3, a7, 269
                  auipc        s3, 830013
                  lui          s2, 621659
                  div          a6, a6, s4
                  c.lui        s4, 5
                  and          s7, a6, a7
                  csrrs        zero, 0x340, s0
                  csrrwi       t5, 0x340, 22
                  c.addi16sp   sp, -16
                  nop
                  slli         t2, s9, 25
                  addi         t0, t6, -1624
                  csrrc        t2, 0x340, zero
                  c.andi       a0, -1
                  c.sub        a2, a2
                  slli         a2, t3, 10
                  c.add        tp, s2
                  csrrci       a7, 0x340, 0
                  c.add        s10, a5
                  mulhu        t3, ra, zero
                  xori         s3, a3, 1838
                  ori          s9, s3, -1976
                  remu         a4, s9, t5
                  mulh         s5, s8, a2
                  sub          ra, a5, s9
                  addi         t5, gp, -1049
                  c.xor        s0, a4
                  srli         a4, s3, 26
                  c.addi4spn   a5, sp, 32
                  auipc        t3, 1029064
                  sra          s8, t6, a2
                  rem          a4, zero, a1
                  or           gp, t3, t5
                  sra          tp, t6, s0
                  c.addi16sp   sp, 80
                  sltiu        t5, t1, -1453
                  mulhsu       ra, a6, t1
                  c.mv         s6, sp
                  c.andi       a4, -1
                  mulhu        sp, t4, s1
                  c.lui        s0, 25
                  add          s2, ra, t5
                  mulhu        s4, s9, t3
                  csrrs        s1, 0x340, zero
                  c.xor        s1, s0
                  c.xor        a2, a5
                  c.andi       a2, -1
                  mulhu        s2, sp, t6
                  c.mv         t2, s4
                  c.mv         t3, a1
                  sltiu        s6, t4, -1085
                  mulhu        ra, s7, s10
                  srli         s8, t6, 28
                  slli         a3, s1, 0
                  sub          s11, s11, s9
                  c.andi       s0, 10
                  nop
                  slt          ra, t6, t1
                  csrrc        s7, 0x340, zero
                  c.and        s1, a0
                  nop
                  addi         a2, gp, 1492
                  nop
                  lui          s6, 935125
                  csrrwi       tp, 0x340, 27
                  c.li         s7, 22
                  c.or         a0, a3
                  mulhsu       s0, a0, s5
                  ori          s9, s0, 298
                  csrrw        ra, 0x340, s1
                  sra          a0, a1, a0
                  slt          s2, t6, ra
                  sra          s1, a6, s2
                  c.xor        a4, s1
                  sub          sp, a4, a4
                  c.lui        s7, 1
                  xor          s4, a6, a6
                  div          s3, t0, s10
                  slt          s4, s2, tp
                  mulhu        t0, a1, zero
                  slti         s3, s4, 530
                  slt          s7, s4, t1
                  lui          a3, 1033221
                  srli         t3, sp, 8
                  sra          s6, s1, s11
                  add          s10, s2, tp
                  c.andi       a0, 6
                  mulhsu       ra, a4, tp
                  c.srai       a5, 15
                  slti         s7, s0, 519
                  sra          t2, gp, t6
                  csrrw        s9, 0x340, sp
                  c.srli       a4, 4
                  slt          a2, s4, t6
                  c.mv         s9, s8
                  c.or         s1, a2
                  c.lui        s8, 14
                  csrrwi       t5, 0x340, 29
                  c.li         s4, -1
                  auipc        s10, 345820
                  csrrsi       t5, 0x340, 0
                  c.addi       a3, -1
                  nop
                  ori          s2, s9, 1612
                  ori          s4, t3, -790
                  c.lui        s5, 8
                  c.add        a4, a6
                  nop
                  xor          tp, a1, t4
                  srli         a4, s3, 29
                  c.or         a4, a1
                  mulhsu       a7, t1, tp
                  c.xor        s1, s0
                  c.addi       s6, 5
                  slt          t3, s4, t1
                  srl          t4, tp, s10
                  sltu         s8, s11, s11
                  c.andi       a5, -1
                  csrrc        t3, 0x340, s6
                  xori         s3, s5, 1189
                  csrrc        s7, 0x340, tp
                  srl          ra, ra, s3
                  c.mv         s4, s11
                  c.addi4spn   a2, sp, 800
                  csrrs        s3, 0x340, ra
                  c.add        s4, s2
                  c.add        ra, tp
                  divu         ra, s6, ra
                  c.mv         a0, ra
                  divu         s9, s7, t6
                  slti         a3, zero, -1265
                  xor          a2, t2, t3
                  csrrc        a3, 0x340, s2
                  c.nop
                  mulh         tp, a5, gp
                  csrrci       s10, 0x340, 0
                  c.sub        s1, a4
                  c.mv         s6, tp
                  or           s5, a1, s4
                  c.mv         t4, a6
                  sub          a4, a3, a4
                  mulh         sp, a7, s8
                  remu         s6, t2, t6
                  c.addi4spn   a0, sp, 928
                  auipc        s10, 466356
                  or           tp, t0, a7
                  c.nop
                  c.andi       a2, -1
                  rem          t2, s11, s7
                  remu         s2, s3, a1
                  c.add        s9, a5
                  lui          sp, 768957
                  mulhsu       t2, ra, s4
                  c.addi16sp   sp, 128
                  sltiu        s9, a7, 1806
                  slli         a0, zero, 6
                  c.mv         gp, a2
                  mulhsu       tp, s7, s10
                  remu         zero, sp, a7
                  srl          a2, s2, s10
                  lui          ra, 316816
                  c.srli       a3, 24
                  auipc        s10, 269693
                  c.mv         a4, s9
                  lui          t0, 597020
                  csrrc        t3, 0x340, zero
                  addi         s1, a5, 260
                  c.srli       s0, 18
                  c.addi       s2, -1
                  lui          s10, 109059
                  slti         a6, s10, -405
                  sltu         s3, gp, gp
                  xor          ra, s10, s2
                  and          sp, t4, t1
                  c.li         a3, 0
                  andi         a2, ra, -1665
                  csrrsi       a6, 0x340, 3
                  c.addi16sp   sp, -16
                  c.addi16sp   sp, 208
                  c.srli       a2, 4
                  slti         a2, s5, -194
                  slti         s4, s6, -1847
                  c.addi16sp   sp, 64
                  slt          ra, t2, s3
                  c.add        tp, t1
                  slt          a6, s7, s9
                  c.xor        a0, a3
                  nop
                  csrrc        s8, 0x340, zero
                  auipc        s1, 442848
                  mulhsu       s6, a6, s0
                  c.and        a2, a5
                  add          s11, sp, t0
                  sltiu        s0, s2, 1400
                  c.sub        a3, a4
                  csrrc        s7, 0x340, t6
                  csrrsi       s1, 0x340, 0
                  add          s8, s11, s0
                  srli         s5, a2, 26
                  sra          s10, s1, s7
                  slti         s8, s0, -1860
                  c.mv         a3, ra
                  andi         s3, s11, 1167
                  csrrwi       s1, 0x340, 25
                  srli         a3, s2, 25
                  slli         sp, s8, 9
                  c.addi       s5, -1
                  rem          s2, ra, s4
                  csrrc        a0, 0x340, t1
                  c.andi       a5, 11
                  lui          t5, 179556
                  srai         a3, a0, 31
                  addi         s1, t3, -180
                  addi         a2, t2, -1157
                  csrrwi       a0, 0x340, 10
                  srl          s7, a6, zero
                  csrrsi       gp, 0x340, 18
                  c.srli       a5, 15
                  mulhsu       tp, a2, s4
                  slli         ra, s7, 14
                  c.add        s7, s8
                  csrrw        s7, 0x340, s0
                  c.addi       s1, -1
                  c.add        s7, a4
                  auipc        s10, 294126
                  c.srli       a3, 20
                  andi         ra, s9, 1036
                  c.mv         s8, a0
                  c.addi       gp, 9
                  mulhsu       s9, a3, s2
                  srl          a5, t6, s4
                  c.mv         a0, t3
                  auipc        t5, 255613
                  divu         s10, t1, a4
                  mulhu        t0, a5, t3
                  c.srli       a3, 25
                  nop
                  c.addi16sp   sp, 32
                  c.addi       s1, 13
                  slli         s11, s9, 19
                  c.lui        a3, 7
                  sub          a4, a0, s1
                  slli         s11, a3, 9
                  rem          t4, s5, t5
                  c.sub        a5, a1
                  mulhsu       s9, s9, ra
                  sltiu        t4, a3, -850
                  nop
                  c.andi       a3, -1
                  sub          t5, t4, t2
                  nop
                  c.srai       s0, 19
                  c.addi4spn   a5, sp, 896
                  xor          a2, a6, s0
                  sll          s11, t4, s8
                  add          a7, s9, t5
                  addi         a7, s3, 201
                  c.mv         tp, tp
                  csrrc        s10, 0x340, zero
                  c.and        a3, a2
                  andi         a0, t2, 1211
                  mulhsu       t0, s8, s7
                  sltu         s8, t6, t3
                  c.or         a5, s0
                  sll          a3, s0, a3
                  csrrci       t3, 0x340, 3
                  add          s8, t1, a5
                  c.addi       gp, 27
                  c.or         a3, a5
                  c.addi16sp   sp, 256
                  srli         s8, sp, 21
                  c.srli       a0, 19
                  addi         t4, t1, -1065
                  remu         s1, t0, s8
                  csrrsi       s8, 0x340, 15
                  slti         t3, sp, -2036
                  csrrc        a3, 0x340, s4
                  csrrs        s1, 0x340, a0
                  lui          tp, 716983
                  auipc        t3, 769119
                  csrrsi       ra, 0x340, 0
                  c.andi       a5, -1
                  csrrci       s8, 0x340, 13
                  c.lui        a2, 21
                  sub          s6, a6, t3
                  srl          t4, s6, a7
                  c.sub        s0, a1
                  c.and        a2, a1
                  slti         a5, s3, 624
                  csrrwi       s2, 0x340, 4
                  c.lui        s0, 15
                  srai         t2, s2, 28
                  c.srli       a5, 21
                  div          gp, s8, t3
                  mulhu        s6, t1, zero
                  sltu         t2, a1, s0
                  andi         s1, s5, -243
                  srli         t0, s9, 22
                  sltiu        sp, s6, -881
                  rem          a6, t3, a4
                  sltiu        s0, a7, -851
                  csrrsi       a7, 0x340, 0
                  and          s11, a3, t3
                  c.nop
                  c.srai       a3, 15
                  sll          a7, s8, t5
                  c.addi16sp   sp, -16
                  add          a0, t4, zero
                  rem          zero, t0, a7
                  xori         a3, s0, -678
                  c.andi       a0, -1
                  addi         t0, a7, -358
                  sltiu        tp, t3, -558
                  sltiu        ra, a4, 169
                  csrrc        s0, 0x340, zero
                  sltu         s4, t5, gp
                  sll          a2, s7, a1
                  mulh         s7, a0, s8
                  or           t2, s8, a1
                  rem          s9, a1, zero
                  ori          tp, zero, -234
                  csrrw        a3, 0x340, s5
                  c.xor        a3, a1
                  addi         sp, s1, 323
                  sltu         a7, a0, zero
                  ori          t4, s8, 1194
                  divu         gp, t4, t5
                  sltiu        a3, t0, -1506
                  c.addi       s6, -1
                  sltu         s7, t2, sp
                  srli         a3, t0, 27
                  and          s9, gp, a0
                  c.add        t0, a4
                  csrrci       s10, 0x340, 26
                  mulh         s5, s0, sp
                  c.srli       a5, 4
                  srl          a0, sp, s6
                  srl          tp, ra, t3
                  mul          t2, s7, tp
                  slti         a3, s10, -1600
                  csrrw        s10, 0x340, a6
                  mulhu        s0, s4, t4
                  srli         s8, zero, 14
                  c.nop
                  c.addi4spn   a4, sp, 816
                  mulhsu       a7, gp, s6
                  srl          s11, a1, s7
                  c.srli       a5, 12
                  sub          s4, a7, a1
                  srai         s0, s8, 16
                  sltu         sp, t0, t3
                  rem          s10, a7, t2
                  csrrc        a2, 0x340, zero
                  csrrci       gp, 0x340, 0
                  xori         gp, t0, -2022
                  c.andi       a5, 2
                  sra          a7, tp, t4
                  c.and        a5, a5
                  csrrs        s0, 0x340, s3
                  srli         a5, a2, 5
                  xor          s2, s7, s10
                  slt          a2, t4, sp
                  csrrsi       tp, 0x340, 0
                  add          s2, s7, a7
                  srli         s1, s6, 13
                  remu         ra, s10, tp
                  xori         s1, ra, -959
                  xor          t3, a5, s0
                  srai         t2, t6, 31
                  nop
                  c.or         a3, s1
                  c.addi16sp   sp, 448
                  c.li         s1, -1
                  slti         t5, t4, -980
                  mulh         s1, s9, s7
                  c.srai       a5, 8
                  csrrc        zero, 0x340, zero
                  c.slli       s9, 24
                  c.srli       a4, 17
                  rem          a3, s0, a4
                  c.nop
                  csrrwi       t3, 0x340, 0
                  divu         s6, sp, sp
                  auipc        tp, 189765
                  rem          s10, s0, s1
                  c.and        a5, a1
                  andi         s6, t2, -2022
                  and          s5, s6, s1
                  c.addi4spn   s0, sp, 912
                  csrrs        zero, 0x340, zero
                  rem          s8, s2, s7
                  slt          sp, a4, t5
                  slt          sp, s0, s7
                  c.addi16sp   sp, 208
                  c.srai       a2, 19
                  andi         a6, a4, -2025
                  mulhu        zero, a3, s9
                  ori          s3, s0, 875
                  addi         gp, a7, 542
                  slti         s8, a4, -160
                  c.sub        s0, a5
                  remu         s8, t6, a1
                  add          sp, s1, s1
                  slti         s4, t3, -622
                  sra          zero, s0, a4
                  c.li         a5, 15
                  c.srai       s1, 19
                  c.sub        s0, a2
                  add          a2, a5, a0
                  sltu         a6, a6, a4
                  sll          gp, s10, a5
                  c.slli       a0, 15
                  sra          a3, ra, s3
                  csrrc        s4, 0x340, s4
                  add          s0, a6, a6
                  c.srai       a3, 23
                  andi         t4, a3, -1510
                  c.addi16sp   sp, 464
                  c.sub        a3, a0
                  c.or         a5, a5
                  c.srai       s1, 8
                  c.slli       s11, 30
                  csrrsi       s5, 0x340, 0
                  div          t2, s2, s8
                  auipc        gp, 216760
                  c.xor        s1, a3
                  mul          s8, s6, s1
                  c.srai       s1, 16
                  srl          t2, t0, tp
                  c.add        t2, s9
                  remu         a2, sp, s10
                  sub          s7, t0, tp
                  div          s10, s1, sp
                  lui          a7, 192741
                  mulhu        t2, s3, s2
                  c.or         s1, s1
                  sltu         s3, a3, gp
                  divu         ra, zero, s2
                  sub          a0, a6, t3
                  andi         s4, s5, 773
                  c.mv         s11, s11
                  and          zero, a0, s8
                  c.mv         s6, s6
                  ori          t5, a0, -718
                  srl          s1, a7, a2
                  divu         a4, s3, a1
                  sub          t4, s4, s3
                  csrrs        gp, 0x340, zero
                  csrrwi       s4, 0x340, 27
                  c.addi       t2, 28
                  mulhsu       s7, a6, a4
                  c.li         a4, -1
                  srli         s2, a1, 5
                  c.or         a2, a4
                  addi         t3, s5, 1893
                  c.nop
                  slti         a0, sp, -2022
                  rem          s5, s5, s0
                  csrrc        a4, 0x340, zero
                  mul          s1, gp, gp
                  div          s8, sp, s9
                  add          s6, s10, t6
                  sub          s10, a0, a1
                  c.andi       a0, 21
                  c.slli       s11, 4
                  csrrw        a0, 0x340, tp
                  slli         s11, a3, 4
                  csrrs        s5, 0x340, a4
                  slt          zero, t5, s5
                  remu         a3, s4, a4
                  rem          t4, t1, t0
                  c.mv         s5, s5
                  csrrs        s5, 0x340, zero
                  rem          a4, t0, t2
                  and          t3, a1, s6
                  srli         sp, s6, 20
                  c.andi       s0, -1
                  csrrc        s5, 0x340, zero
                  sub          a2, t6, s9
                  nop
                  csrrci       a3, 0x340, 0
                  slt          a6, sp, a5
                  c.li         ra, -1
                  mulhu        s5, a7, t0
                  divu         tp, a0, sp
                  mul          a3, s10, s7
                  addi         a4, t0, 891
                  sltiu        a7, s1, 1537
                  add          zero, s1, a7
                  csrrci       s5, 0x340, 22
                  csrrsi       t0, 0x340, 19
                  xor          a0, s8, zero
                  csrrwi       s1, 0x340, 17
                  csrrc        s7, 0x340, t2
                  add          gp, a6, t1
                  sltu         s3, sp, zero
                  auipc        ra, 421396
                  andi         t2, t6, 145
                  sltiu        s7, s9, 413
                  csrrc        t5, 0x340, zero
                  c.nop
                  mul          a2, s5, ra
                  srli         s11, ra, 17
                  remu         s7, a7, gp
                  c.nop
                  sltiu        t3, t5, 1295
                  csrrsi       t0, 0x340, 3
                  rem          s6, s6, a0
                  srai         tp, s5, 2
                  c.addi4spn   a4, sp, 112
                  srai         a7, s0, 30
                  mulh         a4, s6, sp
                  mulhu        t0, t4, a7
                  srl          a6, s1, zero
                  srl          s6, s0, ra
                  c.xor        a5, a2
                  c.li         s4, -1
                  c.mv         a0, t1
                  xor          s7, t1, a0
                  c.srai       a4, 11
                  divu         s6, a3, ra
                  csrrsi       gp, 0x340, 15
                  slli         s1, s2, 27
                  csrrw        t4, 0x340, s11
                  mulhu        s6, gp, tp
                  c.addi4spn   s0, sp, 80
                  mul          a2, s5, t6
                  mulhu        t0, t4, a7
                  csrrw        s9, 0x340, a4
                  csrrw        t2, 0x340, t4
                  sltu         t3, s0, a6
                  xor          s7, gp, t5
                  or           s11, a6, a3
                  rem          s3, sp, s0
                  c.and        a0, a0
                  csrrsi       s6, 0x340, 0
                  nop
                  remu         s7, t0, a4
                  sub          t0, t1, ra
                  c.slli       s10, 2
                  sub          s7, zero, t5
                  div          t5, s9, a6
                  remu         a0, t2, t4
                  add          s0, sp, a1
                  slti         sp, a4, 53
                  csrrwi       t0, 0x340, 19
                  c.sub        a5, s1
                  csrrc        s10, 0x340, tp
                  addi         s8, s10, 1413
                  c.lui        s0, 20
                  nop
                  c.mv         s11, a1
                  addi         s4, s0, 977
                  c.add        gp, a2
                  auipc        s11, 214149
                  csrrci       a0, 0x340, 2
                  csrrw        a0, 0x340, a2
                  sltiu        t5, s1, -401
                  c.li         t0, -1
                  c.nop
                  c.addi       t3, 15
                  ori          t3, s0, 1326
                  c.mv         ra, a0
                  c.lui        t4, 29
                  divu         s8, a1, a2
                  mulh         zero, s5, a5
                  c.and        a3, a5
                  mulh         s6, a1, a7
                  c.and        s1, a3
                  divu         zero, s2, a0
                  csrrwi       s6, 0x340, 1
                  mul          t3, a3, t1
                  c.add        gp, a7
                  mulh         t5, s1, a7
                  sltiu        s10, s2, 709
                  lui          s10, 1022635
                  slli         s7, s10, 11
                  sltu         a2, a4, tp
                  c.or         s0, s0
                  c.add        s7, t3
                  andi         s5, t4, -1171
                  sra          s2, t1, s4
                  and          s8, a1, tp
                  nop
                  auipc        s5, 315437
                  csrrw        a4, 0x340, tp
                  csrrs        zero, 0x340, s3
                  slt          s5, zero, a2
                  c.srli       a0, 5
                  sltiu        s7, s7, 1650
                  c.nop
                  c.and        s0, a5
                  csrrci       s6, 0x340, 0
                  csrrsi       s1, 0x340, 0
                  xori         s4, t4, -1853
                  c.lui        s6, 19
                  auipc        s7, 401239
                  sra          s4, s2, s5
                  xori         a2, s8, -359
                  lui          sp, 190747
                  csrrs        ra, 0x340, a7
                  csrrc        t2, 0x340, s10
                  c.or         a4, a4
                  sub          a6, a7, s11
                  divu         s7, t3, tp
                  slt          a5, s8, ra
                  sltu         t5, tp, s7
                  csrrw        t3, 0x340, t3
                  mulh         tp, t2, t1
                  csrrwi       s4, 0x340, 10
                  srli         t0, s8, 11
                  csrrwi       s7, 0x340, 31
                  remu         s9, s7, s10
                  addi         t2, s1, -1676
                  sltiu        s7, sp, -711
                  c.nop
                  csrrc        s8, 0x340, zero
                  and          a6, t1, a2
                  c.xor        a4, a2
                  c.and        a0, a5
                  addi         s4, a2, 83
                  addi         a5, a1, -605
                  csrrsi       s1, 0x340, 0
                  c.srai       a4, 4
                  c.li         s3, -1
                  c.and        a0, a0
                  mul          t2, s11, t2
                  sub          a6, s8, t5
                  sub          s3, t5, t3
                  csrrc        s2, 0x340, ra
                  or           a3, s5, s11
                  or           t4, s4, s1
                  csrrwi       tp, 0x340, 26
                  slli         s4, s10, 15
                  addi         a5, s9, -361
                  auipc        a5, 877630
                  ori          gp, s5, -205
                  c.add        s5, t2
                  mul          s8, a4, s4
                  sll          sp, t1, sp
                  and          a5, a0, a7
                  c.srai       s1, 1
                  sll          zero, s4, tp
                  rem          tp, s2, t1
                  c.or         s0, a4
                  csrrci       a4, 0x340, 0
                  slt          s10, s6, t3
                  c.sub        a4, a0
                  c.andi       a3, 8
                  slli         a3, t0, 13
                  sll          tp, s11, t1
                  mulh         sp, s6, ra
                  c.and        a5, a4
                  c.addi       s10, -1
                  slli         s7, s3, 5
                  div          t2, t6, t3
                  c.addi4spn   a5, sp, 496
                  csrrw        zero, 0x340, t5
                  div          s4, s1, s2
                  remu         t3, s11, s4
                  add          sp, s0, t5
                  or           s7, s5, a7
                  sub          s1, s3, s3
                  csrrc        a0, 0x340, zero
                  srai         s3, a7, 24
                  slli         s3, a1, 25
                  sra          s3, a0, s9
                  rem          a5, s1, s3
                  c.addi4spn   a0, sp, 864
                  c.addi4spn   s1, sp, 720
                  and          a2, a2, s9
                  sub          t4, s1, ra
                  xor          t3, gp, a2
                  c.addi       a5, 28
                  csrrsi       tp, 0x340, 20
                  sub          a2, gp, gp
                  c.addi4spn   s0, sp, 272
                  c.mv         s8, s6
                  c.and        a5, a0
                  c.slli       t5, 14
                  div          s2, s10, a1
                  or           s0, tp, s1
                  sll          s1, t6, s8
                  csrrsi       a5, 0x340, 0
                  remu         tp, sp, tp
                  slti         a4, a1, 664
                  c.add        t0, a0
                  c.srli       a0, 23
                  sra          t0, t5, t4
                  slli         a7, t6, 12
                  c.mv         a6, a6
                  c.or         a2, a1
                  csrrs        s5, 0x340, zero
                  slti         s1, a6, -1833
                  xori         a5, a1, -463
                  rem          t3, s1, s1
                  csrrci       zero, 0x340, 0
                  add          s11, s8, s7
                  c.addi16sp   sp, 16
                  srli         a6, s5, 14
                  addi         zero, a0, 784
                  ori          zero, t6, 54
                  c.srli       a0, 3
                  sra          t0, t3, s2
                  srl          zero, t5, t0
                  csrrs        s8, 0x340, s10
                  c.xor        a2, a1
                  srli         a2, a3, 9
                  c.and        a0, a5
                  csrrci       s2, 0x340, 0
                  csrrs        a3, 0x340, t4
                  csrrci       s0, 0x340, 0
                  csrrw        tp, 0x340, a2
                  add          a4, s0, s2
                  csrrwi       t4, 0x340, 8
                  and          s4, t2, t5
                  c.lui        a7, 30
                  c.mv         s11, s2
                  csrrsi       a7, 0x340, 0
                  auipc        s1, 316331
                  c.addi16sp   sp, -16
                  mul          t3, a4, ra
                  c.addi4spn   a4, sp, 48
                  c.nop
                  auipc        a0, 596858
                  div          s9, a6, tp
                  csrrc        a2, 0x340, zero
                  and          s8, a7, s4
                  c.lui        s1, 26
                  sll          t5, s0, a3
                  csrrci       tp, 0x340, 0
                  rem          s11, s7, t2
                  andi         s4, a3, -20
                  rem          s7, s11, a7
                  ori          a7, tp, 1790
                  div          s6, a1, s8
                  nop
                  c.addi       t5, 14
                  addi         s3, gp, -826
                  addi         a5, zero, -1702
                  div          s6, s6, a7
                  slt          s2, ra, t5
                  xor          a4, t1, a3
                  add          s9, a4, s9
                  slt          s4, gp, s0
                  or           s0, s8, t5
                  slt          a7, t1, a2
                  xor          a7, s11, s5
                  mulhu        a5, s1, s5
                  sll          s9, a5, a5
                  slti         t4, s6, -1249
                  xori         a4, t1, 1067
                  remu         t0, s4, s6
                  sub          s2, t0, s9
                  mulhsu       t5, s10, s9
                  rem          ra, a6, s10
                  addi         s4, s3, -265
                  and          t3, tp, s0
                  div          t2, s2, t6
                  sltiu        s1, s9, -1402
                  remu         s0, s7, a1
                  srai         s3, sp, 15
                  nop
                  div          a3, t1, a3
                  xori         t5, s9, 929
                  c.lui        t5, 7
                  div          t5, zero, a0
                  c.addi       a3, 19
                  remu         ra, zero, s8
                  mulhsu       t3, s2, s2
                  slt          a0, s1, s4
                  c.addi       t4, 15
                  csrrc        a7, 0x340, zero
                  sub          s5, s0, a6
                  xori         gp, sp, -1323
                  c.sub        a4, a3
                  mulhsu       s2, zero, s0
                  slti         s0, a4, 218
                  addi         t4, a7, -25
                  sll          t4, a7, tp
                  slt          a5, s0, ra
                  mulhsu       s8, t1, t0
                  c.li         t3, 29
                  divu         s5, s3, t3
                  sub          a4, t6, gp
                  mulhsu       s5, s8, t5
                  c.addi       s7, -1
                  c.srai       a5, 12
                  mulhsu       s3, t6, s2
                  csrrs        s8, 0x340, a1
                  rem          s1, s11, s2
                  csrrwi       a6, 0x340, 8
                  mul          ra, gp, a1
                  sra          a7, t5, a2
                  andi         zero, a4, -1747
                  c.srli       s1, 10
                  sll          s6, sp, s2
                  c.li         s8, 13
                  c.addi       a4, 29
                  nop
                  csrrw        a3, 0x340, s1
                  c.srai       s0, 19
                  mulhsu       s10, t5, a5
                  csrrci       s0, 0x340, 5
                  srli         s2, a7, 13
                  srli         s11, tp, 17
                  c.add        t3, s8
                  c.mv         a5, a2
                  xori         t4, a4, -368
                  c.and        s0, a5
                  mulh         zero, a4, gp
                  sll          s0, s11, a2
                  csrrci       s2, 0x340, 0
                  slti         t0, t0, 1448
                  c.addi       s4, 24
                  ori          t5, t0, 479
                  ori          ra, t5, -1222
                  c.li         a5, 3
                  nop
                  divu         a0, t3, s10
                  div          t2, t5, a3
                  mul          t2, a4, s10
                  c.srai       s1, 15
                  csrrw        t0, 0x340, s2
                  csrrsi       s2, 0x340, 27
                  sll          s0, a5, a6
                  sub          s2, gp, tp
                  sltu         a7, t0, s10
                  c.andi       s1, 26
                  csrrs        a0, 0x340, s7
                  mul          a5, a7, ra
                  c.srli       s0, 3
                  mulh         t5, zero, s1
                  c.li         tp, -1
                  c.addi16sp   sp, 304
                  divu         s0, s9, ra
                  sltu         s6, t6, s8
                  csrrwi       a7, 0x340, 5
                  xor          s1, s3, t3
                  c.srli       a4, 18
                  srli         s3, a3, 19
                  xori         ra, gp, 464
                  c.addi4spn   a4, sp, 800
                  c.and        a5, s1
                  c.srli       a3, 30
                  xor          s9, t1, a7
                  c.srli       a4, 3
                  srl          sp, s7, t2
                  csrrs        a5, 0x340, a3
                  div          a7, a3, a2
                  c.srli       s1, 17
                  csrrsi       s3, 0x340, 3
                  sra          t3, t6, a1
                  csrrw        s8, 0x340, a2
                  divu         t2, sp, s5
                  csrrwi       s10, 0x340, 3
                  c.xor        a2, a0
                  c.lui        s8, 9
                  c.srli       a2, 16
                  rem          a2, gp, t6
                  c.addi4spn   a0, sp, 528
                  sra          a7, sp, s1
                  c.and        a2, a5
                  slt          a6, t0, s2
                  sltiu        s0, s5, -809
                  srai         t5, a3, 29
                  c.li         sp, -1
                  c.add        a6, a3
                  div          s9, a6, s0
                  sra          t0, a1, s6
                  c.sub        a4, a3
                  divu         tp, a5, gp
                  c.xor        a3, s1
                  lui          tp, 171972
                  slt          s5, s10, s2
                  c.and        s1, a3
                  srai         s1, a2, 2
                  xor          s3, ra, s8
                  xor          s6, a6, a6
                  sll          s8, t3, t4
                  mulhu        s6, s9, sp
                  c.and        s1, a1
                  c.add        s11, a7
                  and          a6, t5, s10
                  slt          s5, s5, s5
                  div          t0, s9, gp
                  c.or         a0, s0
                  csrrw        s6, 0x340, ra
                  add          gp, s2, s2
                  csrrw        t3, 0x340, t3
                  csrrwi       ra, 0x340, 23
                  c.slli       s1, 14
                  mul          s11, s9, gp
                  ori          s10, s4, -546
                  c.nop
                  mul          t4, a3, t3
                  c.xor        s0, a1
                  c.li         t3, 11
                  slti         a7, s8, 266
                  c.addi       s6, -1
                  rem          t2, t0, a2
                  lui          t3, 862584
                  csrrs        a4, 0x340, t0
                  mulhu        t0, s11, t2
                  sub          s1, a3, a4
                  c.mv         a6, s2
                  slt          s4, s4, s2
                  c.add        a7, s4
                  c.addi16sp   sp, -16
                  andi         s0, s10, -1380
                  rem          s8, s1, s1
                  c.srai       a2, 22
                  auipc        sp, 936410
                  xor          s4, ra, s7
                  c.or         s1, a2
                  srli         a3, t0, 20
                  c.andi       a0, 19
                  c.sub        a5, a5
                  mulh         tp, s9, a4
                  csrrw        a0, 0x340, zero
                  srl          s0, a0, s0
                  sra          a3, t0, s10
                  sub          zero, s8, t4
                  add          a0, s9, s10
                  lui          s5, 667416
                  sll          sp, s5, t1
                  mul          t4, s9, s1
                  csrrw        a2, 0x340, gp
                  c.srli       a0, 21
                  rem          a7, s10, tp
                  c.addi4spn   a2, sp, 208
                  sltiu        t4, a5, 77
                  nop
                  ori          a4, s11, -1800
                  c.slli       a7, 10
                  slli         s7, t1, 6
                  sltu         ra, t4, t4
                  mul          s11, s9, a2
                  ori          s5, s6, -1147
                  addi         s6, s4, 1702
                  slli         gp, s10, 4
                  addi         t2, a6, 530
                  csrrwi       ra, 0x340, 10
                  slti         sp, s11, -290
                  srl          a6, s7, s6
                  mulh         t0, ra, s6
                  xori         tp, s11, 322
                  c.andi       s1, 5
                  csrrwi       s6, 0x340, 3
                  xori         a6, s6, -1838
                  sll          s10, a0, t0
                  rem          s8, s9, a1
                  csrrw        s9, 0x340, t5
                  auipc        s7, 9612
                  slti         tp, a6, 951
                  lui          s4, 100507
                  csrrsi       s3, 0x340, 3
                  c.addi4spn   a3, sp, 912
                  csrrc        ra, 0x340, zero
                  and          a0, s0, s2
                  c.addi       s0, 5
                  ori          t2, a0, 1497
                  add          t0, t6, s5
                  add          t5, s3, t5
                  c.addi4spn   a0, sp, 80
                  rem          a6, a3, s3
                  c.andi       s1, 0
                  csrrw        s6, 0x340, s6
                  csrrsi       s0, 0x340, 13
                  csrrsi       tp, 0x340, 26
                  c.add        a3, s1
                  slt          a0, a3, s1
                  c.srai       a0, 27
                  csrrci       t2, 0x340, 28
                  and          s8, s0, s7
                  andi         gp, s1, -957
                  csrrsi       gp, 0x340, 26
                  c.srli       s0, 11
                  rem          s9, s3, s5
                  c.or         a5, a5
                  csrrc        a3, 0x340, a4
                  xori         a7, s11, 1007
                  addi         t0, s2, -2030
                  c.addi4spn   a5, sp, 64
                  sltiu        t2, tp, 796
                  c.addi4spn   a3, sp, 368
                  sub          tp, s4, t5
                  slti         s8, t2, 695
                  xori         s6, a2, 1135
                  csrrsi       a4, 0x340, 0
                  mulh         t5, t5, s10
                  xor          t3, a5, t1
                  divu         a3, s6, a3
                  auipc        a0, 569195
                  sll          gp, a2, s0
                  c.andi       a0, 20
                  c.lui        s9, 9
                  add          a0, a1, s7
                  c.nop
                  csrrwi       s11, 0x340, 10
                  or           s8, a3, a0
                  csrrsi       t5, 0x340, 0
                  c.srai       s1, 15
                  c.or         a5, a4
                  slt          s6, t1, t0
                  slt          a7, a7, t4
                  xor          s10, s11, a3
                  c.xor        s1, a2
                  ori          a6, a0, -1680
                  c.srli       s1, 26
                  lui          a6, 328391
                  auipc        s8, 165815
                  c.li         s2, -1
                  csrrc        s8, 0x340, zero
                  c.addi4spn   a2, sp, 976
                  srl          s6, zero, s2
                  and          ra, tp, a2
                  c.sub        a3, a1
                  c.srai       a4, 12
                  auipc        s11, 496898
                  andi         s1, s8, 247
                  div          t4, a0, tp
                  slli         a0, s8, 28
                  c.srli       a4, 16
                  sll          s3, s3, ra
                  c.andi       a3, 23
                  c.andi       s1, -1
                  sra          gp, s11, a0
                  sra          a6, a5, ra
                  slt          s4, s6, tp
                  mulhsu       s6, tp, t6
                  c.li         s3, -1
                  remu         t4, s9, s9
                  sra          a7, a1, a4
                  div          s2, tp, s0
                  div          t0, s6, sp
                  sll          t0, a2, s9
                  csrrs        s2, 0x340, s4
                  csrrc        tp, 0x340, t4
                  c.addi4spn   a3, sp, 960
                  rem          t2, a5, s1
                  add          gp, t0, s10
                  mul          s9, t1, a0
                  rem          a7, a5, s2
                  c.andi       a5, -1
                  remu         a6, t1, t1
                  c.li         t4, -1
                  sll          sp, a2, s3
                  remu         zero, a5, a5
                  xor          a4, s1, ra
                  mulh         s1, a5, t6
                  mulhu        s10, ra, a6
                  c.mv         s10, sp
                  mulhu        s6, s11, a1
                  sra          s5, tp, t6
                  rem          zero, a4, a3
                  c.srai       s1, 11
                  csrrwi       s6, 0x340, 21
                  srai         s4, t5, 15
                  csrrci       t5, 0x340, 0
                  sra          a2, tp, t2
                  csrrsi       s10, 0x340, 21
                  divu         s10, t2, a3
                  nop
                  csrrw        s8, 0x340, a5
                  slti         s7, t4, -1542
                  remu         gp, s0, s7
                  sll          a4, ra, a5
                  c.li         a5, -1
                  c.srli       s0, 24
                  or           ra, a3, tp
                  c.nop
                  c.lui        s7, 16
                  c.slli       s4, 10
                  srl          t3, t4, s3
                  or           s7, s3, sp
                  c.srli       a4, 9
                  ori          s8, s3, -1748
                  c.addi4spn   a5, sp, 48
                  c.addi16sp   sp, -16
                  div          t4, t0, t4
                  add          a6, a0, a0
                  c.lui        s5, 19
                  c.mv         t3, sp
                  ori          a0, s0, -604
                  c.mv         s7, s0
                  sra          tp, s5, a6
                  and          a3, t4, s3
                  sub          s1, a2, a0
                  mul          s5, s7, t3
                  c.and        a3, a1
                  csrrci       t5, 0x340, 0
                  srl          ra, ra, a2
                  c.lui        t5, 10
                  c.srli       s1, 24
                  divu         a5, s1, a4
                  or           t5, s3, t4
                  csrrci       zero, 0x340, 18
                  slti         s5, s11, -836
                  csrrci       sp, 0x340, 0
                  c.srli       a5, 14
                  c.andi       s0, 13
                  c.li         a3, 11
                  remu         s7, t5, a4
                  csrrw        s5, 0x340, s11
                  c.or         a3, a2
                  sll          t3, a6, s7
                  c.lui        t2, 19
                  srl          gp, t2, s11
                  slti         zero, t6, -1983
                  nop
                  srai         t0, a4, 9
                  c.srli       a5, 22
                  sra          zero, s3, a2
                  sll          gp, t1, s2
                  auipc        s11, 994604
                  xor          s0, a7, s8
                  c.xor        a4, s0
                  slti         s10, a1, 99
                  srai         zero, sp, 9
                  sll          t2, a5, s5
                  or           t4, ra, s11
                  c.addi16sp   sp, -16
                  c.or         a4, a2
                  csrrc        ra, 0x340, a3
                  mul          s7, a4, a4
                  remu         t2, s5, s7
                  or           sp, s1, t4
                  csrrwi       t3, 0x340, 5
                  c.srli       s1, 8
                  c.addi16sp   sp, -16
                  andi         a6, s5, 1071
                  sll          zero, s11, s3
                  c.addi16sp   sp, -16
                  xori         a0, s9, 604
                  csrrci       s8, 0x340, 3
                  c.add        s0, a1
                  csrrsi       s6, 0x340, 17
                  add          s1, t5, s6
                  mulhsu       t5, a3, gp
                  and          a6, a5, s3
                  csrrc        s3, 0x340, zero
                  c.slli       t5, 2
                  slt          s9, t4, t3
                  srai         s7, a6, 16
                  divu         s7, a2, s4
                  auipc        zero, 341359
                  sra          s1, a6, a4
                  csrrsi       s5, 0x340, 0
                  c.li         a4, -1
                  mulhsu       s8, t5, s1
                  c.or         a2, a5
                  c.srli       a3, 24
                  slt          a0, t5, s4
                  c.andi       a2, 1
                  sub          a3, t5, zero
                  srai         s0, zero, 6
                  c.mv         a6, t0
                  sub          s0, s11, t4
                  slt          s9, t6, gp
                  csrrsi       s1, 0x340, 28
                  c.andi       a5, 14
                  c.addi       s6, 27
                  c.li         s10, -1
                  csrrci       t5, 0x340, 18
                  c.nop
                  c.nop
                  sra          s2, s0, s11
                  c.addi4spn   a5, sp, 592
                  divu         s8, t6, a3
                  c.addi16sp   sp, -16
                  c.li         sp, 2
                  andi         zero, s2, -415
                  c.addi       a2, 4
                  sra          tp, a3, t0
                  slt          t3, s2, s5
                  auipc        s11, 995627
                  nop
                  mul          a0, t2, a2
                  srli         gp, t6, 30
                  xor          s4, s3, t4
                  c.add        s1, t4
                  c.srai       a4, 8
                  divu         t3, sp, a7
                  sltu         tp, s0, t2
                  ori          s8, t5, 1458
                  nop
                  c.li         a4, -1
                  srl          a3, a1, s5
                  c.xor        a4, a2
                  c.sub        a5, a4
                  csrrc        s3, 0x340, a0
                  auipc        s9, 154529
                  sra          s5, a4, s2
                  c.or         a5, s1
                  c.addi16sp   sp, 80
                  sra          sp, s10, gp
                  csrrc        a0, 0x340, s1
                  lui          t4, 347389
                  lui          s10, 1000858
                  divu         zero, s8, a6
                  c.addi       s6, -1
                  c.mv         t4, a2
                  lui          s11, 496623
                  mulhu        s7, s5, s7
                  c.srli       s0, 1
                  slli         a7, s1, 17
                  rem          ra, s10, tp
                  slli         s10, ra, 12
                  nop
                  divu         t5, a3, t2
                  c.slli       s7, 12
                  sub          t5, tp, a4
                  auipc        s2, 925637
                  csrrwi       s6, 0x340, 11
                  remu         s10, t5, a0
                  c.addi4spn   a4, sp, 880
                  remu         tp, tp, a6
                  c.li         s9, -1
                  srl          a2, t1, t4
                  mul          gp, s8, a1
                  ori          s6, ra, 267
                  addi         tp, a3, -918
                  divu         ra, s4, t1
                  c.andi       a0, 2
                  c.addi4spn   a2, sp, 656
                  and          s11, s1, tp
                  mulhsu       s2, s1, s9
                  c.sub        a4, s1
                  csrrsi       ra, 0x340, 31
                  c.andi       a4, -1
                  c.srli       s0, 18
                  c.andi       a2, -1
                  c.addi4spn   a3, sp, 848
                  andi         s5, a3, 277
                  csrrs        s1, 0x340, zero
                  c.andi       a2, -1
                  andi         a7, tp, 1359
                  xori         a7, s4, 394
                  csrrci       s6, 0x340, 26
                  remu         t3, a3, a2
                  mulhsu       a6, s2, sp
                  c.addi       a5, -1
                  rem          sp, s1, a6
                  c.and        a3, a0
                  remu         zero, s10, s11
                  lui          sp, 707555
                  csrrsi       s11, 0x340, 0
                  c.addi       t4, 12
                  c.li         s6, 1
                  c.addi16sp   sp, -16
                  csrrsi       t5, 0x340, 0
                  c.or         a2, a3
                  xor          s7, t1, zero
                  csrrwi       s1, 0x340, 14
                  c.sub        a5, a2
                  c.addi4spn   a5, sp, 896
                  c.lui        s6, 25
                  c.nop
                  srli         t3, s1, 5
                  andi         zero, s5, 1363
                  or           s0, ra, s3
                  remu         s4, a6, s7
                  mulh         a4, a0, t1
                  c.nop
                  c.nop
                  c.slli       s6, 23
                  srli         s4, a0, 3
                  sra          a3, s8, t3
                  c.mv         a6, a3
                  csrrw        zero, 0x340, s5
                  c.or         a2, a2
                  ori          s3, sp, -1589
                  mulhu        a0, s10, s5
                  c.lui        ra, 13
                  sltu         s8, s2, t4
                  c.xor        a4, a5
                  c.andi       a4, -1
                  addi         a6, t4, 1455
                  mulhu        t2, s9, a6
                  srli         a5, s0, 26
                  lui          a3, 425474
                  ori          s0, a3, -1347
                  c.li         a3, -1
                  mulhsu       s7, t0, s6
                  c.lui        s2, 21
                  c.li         a5, 31
                  remu         s8, s2, t6
                  sll          tp, a5, a3
                  sub          a0, s4, t1
                  or           s2, s6, sp
                  c.xor        a2, a5
                  mulhu        t2, a7, a3
                  xor          gp, s9, tp
                  and          s11, s3, a1
                  sra          ra, a0, a5
                  rem          sp, t6, zero
                  c.addi4spn   a5, sp, 672
                  add          a7, s7, t3
                  c.slli       tp, 6
                  c.xor        s1, a0
                  addi         a3, s10, 2031
                  sltiu        a0, s4, -337
                  remu         s0, zero, a4
                  and          a3, s0, t3
                  c.srai       a3, 2
                  c.or         a0, a1
                  xor          t2, s0, tp
                  c.or         a0, s1
                  c.addi4spn   a2, sp, 880
                  slti         t2, gp, -874
                  csrrsi       a6, 0x340, 0
                  c.srli       s1, 29
                  rem          s7, a4, a5
                  slti         a6, s7, 303
                  sltiu        sp, a6, 1569
                  xor          a4, tp, t3
                  xori         a3, tp, 1795
                  c.andi       a2, 29
                  c.mv         sp, a7
                  slti         zero, s0, -992
                  c.addi4spn   a4, sp, 656
                  c.slli       a5, 14
                  sltu         a6, a6, a4
                  c.addi4spn   a4, sp, 16
                  csrrs        s10, 0x340, zero
                  c.nop
                  mul          s9, gp, s8
                  auipc        gp, 851598
                  slli         t5, t5, 30
                  slti         a7, t1, 1470
                  csrrw        gp, 0x340, a4
                  xor          t3, t0, a5
                  xori         s0, ra, 902
                  c.addi16sp   sp, -16
                  or           s7, s11, t4
                  or           t0, s1, s9
                  andi         a6, t3, 1641
                  srai         zero, t3, 28
                  csrrsi       t2, 0x340, 0
                  c.mv         s9, t2
                  srli         a5, a4, 9
                  slli         a0, s6, 25
                  c.addi       t4, 24
                  slli         sp, tp, 13
                  sra          s3, t4, gp
                  csrrc        s8, 0x340, t4
                  auipc        a0, 253070
                  c.mv         a2, s4
                  ori          t4, t1, -689
                  slli         a2, s11, 30
                  c.li         a3, 21
                  slti         t2, s9, 1711
                  lui          zero, 51329
                  c.sub        a5, s0
                  add          s4, s8, s9
                  srl          a2, ra, s0
                  c.li         t0, -1
                  xori         s4, s7, -1095
                  rem          s1, t1, s8
                  c.li         t2, -1
                  mulhsu       a7, zero, a3
                  slt          gp, a7, s7
                  and          s7, sp, t0
                  csrrsi       s7, 0x340, 0
                  mul          a0, t2, a7
                  slli         a4, s9, 2
                  divu         t2, a3, t5
                  c.addi4spn   a4, sp, 656
                  mulh         s6, a3, sp
                  c.andi       a4, 5
                  divu         s2, tp, a0
                  mulhu        a0, a4, a6
                  c.nop
                  mul          s3, s1, a5
                  c.addi16sp   sp, -16
                  srai         a7, a0, 6
                  lui          t3, 427863
                  or           a2, s1, s5
                  div          s6, a0, s7
                  c.andi       a4, -1
                  csrrci       s10, 0x340, 0
                  and          s0, s6, t3
                  c.srai       a3, 17
                  c.and        a5, a0
                  srli         s3, s3, 23
                  c.andi       a0, -1
                  slt          a6, t5, s0
                  csrrw        t5, 0x340, sp
                  rem          s10, a0, a2
                  add          s5, s4, t4
                  and          s6, zero, s2
                  c.addi4spn   s0, sp, 272
                  slt          s1, s4, tp
                  and          a6, s5, t6
                  slli         a7, s7, 25
                  c.and        a4, a1
                  csrrs        tp, 0x340, zero
                  mulhsu       s6, a3, sp
                  c.addi4spn   s0, sp, 400
                  c.nop
                  srai         s9, a3, 11
                  add          s6, t6, ra
                  nop
                  addi         t0, s2, 1285
                  slt          t3, s3, gp
                  mulh         s3, t3, a2
                  mulhu        gp, t0, a6
                  c.addi       a7, -1
                  c.add        s10, t2
                  add          s7, sp, t3
                  c.srli       s1, 11
                  c.sub        a0, s0
                  mulhsu       sp, s5, a6
                  c.srli       a3, 10
                  rem          s2, gp, a7
                  mulh         t0, s11, s0
                  csrrci       s2, 0x340, 0
                  csrrw        a0, 0x340, t4
                  slt          s4, s4, t0
                  c.slli       s0, 14
                  ori          s2, t0, 1471
                  nop
                  remu         s11, s3, s8
                  c.sub        s1, a2
                  mulhu        ra, t4, s6
                  div          a2, sp, s9
                  c.srli       a5, 7
                  c.sub        s1, s1
                  c.addi       t5, 2
                  c.xor        a4, s0
                  srl          s8, a1, t4
                  c.slli       t2, 9
                  or           s7, s5, a7
                  c.xor        a0, a5
                  addi         ra, s8, -206
                  c.and        a0, a5
                  mul          t3, a6, s8
                  mul          s8, s11, s10
                  c.nop
                  c.sub        a5, a1
                  addi         a6, s5, -1084
                  xor          t4, a3, a7
                  c.srai       a2, 30
                  c.li         t4, -1
                  mul          a2, s1, a1
                  c.add        s3, s0
                  sltu         a6, s4, a3
                  slti         s4, s11, 1304
                  c.slli       s5, 29
                  c.mv         a5, ra
                  c.mv         t4, s1
                  csrrs        a0, 0x340, zero
                  mulhu        t4, t5, a6
                  slti         s8, a7, -326
                  c.and        a3, a2
                  nop
                  slti         a3, s5, 310
                  c.and        a4, a5
                  csrrs        s9, 0x340, zero
                  c.add        t2, s3
                  sub          ra, a5, tp
                  sltu         s2, a0, s10
                  c.sub        a0, a2
                  sra          a5, sp, s10
                  c.lui        s11, 17
                  c.andi       s0, 20
                  srli         t0, a4, 19
                  c.and        a3, a3
                  auipc        s1, 696734
                  csrrw        tp, 0x340, s4
                  c.andi       a4, 4
                  auipc        ra, 522384
                  c.mv         a2, s6
                  andi         a4, s5, 1673
                  sltiu        a6, s3, 73
                  addi         zero, s3, -1316
                  addi         ra, ra, -1843
                  csrrci       a7, 0x340, 31
                  rem          s2, t2, zero
                  sll          a5, tp, s2
                  slt          a7, s0, a6
                  c.andi       s0, -1
                  rem          s1, s11, s7
                  mulh         gp, a3, t4
                  or           s5, zero, a6
                  c.addi4spn   a5, sp, 496
                  c.lui        gp, 11
                  c.addi4spn   s0, sp, 304
                  ori          s5, a7, -2037
                  c.or         a3, a1
                  c.andi       s1, -1
                  remu         t3, a5, s2
                  c.lui        a6, 29
                  mul          s1, ra, t0
                  and          t3, t1, a3
                  c.sub        s1, a4
                  c.nop
                  c.and        s1, s1
                  srli         t2, a1, 27
                  srli         a0, ra, 7
                  remu         s2, s10, t3
                  sub          s0, s5, t2
                  nop
                  c.mv         a3, s6
                  mulhu        s2, t4, s10
                  c.srai       a0, 16
                  mulh         s5, s0, sp
                  c.andi       a2, -1
                  c.add        a6, t6
                  nop
                  sltiu        t5, s6, -1916
                  c.or         a2, a0
                  or           a2, a1, s10
                  srai         s2, ra, 9
                  csrrwi       ra, 0x340, 19
                  srai         sp, s2, 27
                  remu         s11, a0, t2
                  csrrw        a0, 0x340, t1
                  sra          a5, s1, s10
                  xor          tp, s8, a6
                  mulh         s10, s7, s5
                  c.andi       a4, -1
                  c.srai       s0, 30
                  csrrwi       s10, 0x340, 1
                  sub          a3, s3, s5
                  sub          s4, ra, a2
                  c.nop
                  c.nop
                  sra          t2, t2, s9
                  c.nop
                  lui          s5, 43304
                  and          s10, s7, s9
                  xori         a3, gp, 550
                  csrrs        s6, 0x340, zero
                  mulh         s1, s0, t2
                  sub          t2, s5, s4
                  xor          t2, t2, s8
                  c.lui        s1, 15
                  andi         s4, tp, -1504
                  add          a6, s3, t0
                  mulh         a5, a0, a5
                  csrrwi       s6, 0x340, 28
                  csrrs        zero, 0x340, zero
                  mulhsu       t2, t1, a1
                  c.slli       a7, 30
                  andi         s6, s2, 1081
                  c.andi       a5, -1
                  lui          s8, 32988
                  sub          s5, t5, gp
                  c.addi       s11, -1
                  c.and        a3, a5
                  csrrsi       s0, 0x340, 19
                  c.sub        a5, s1
                  c.andi       a4, 7
                  csrrwi       t2, 0x340, 1
                  mul          s7, t1, s4
                  sll          s7, t5, s3
                  c.xor        a2, a3
                  c.and        a3, a5
                  srl          s9, a4, s2
                  mulhu        t3, tp, a7
                  c.xor        a2, a0
                  csrrwi       a2, 0x340, 29
                  slli         t0, gp, 30
                  csrrw        a4, 0x340, a7
                  csrrwi       zero, 0x340, 12
                  c.lui        tp, 2
                  c.xor        a4, s1
                  sub          zero, t5, s3
                  c.nop
                  c.nop
                  c.addi       a7, 16
                  srl          sp, a1, s6
                  sltu         a3, a6, a1
                  slti         a4, t6, -627
                  xor          s0, t1, a3
                  c.addi       s10, -1
                  sltu         s3, a5, a2
                  lui          s5, 160940
                  srai         a7, t6, 25
                  csrrc        s9, 0x340, s10
                  or           s6, s9, t2
                  remu         s7, t4, a5
                  c.addi16sp   sp, -16
                  lui          a5, 614431
                  csrrs        tp, 0x340, t5
                  lui          a6, 464261
                  or           a0, s10, s1
                  srli         t0, s9, 29
                  srl          t3, t0, zero
                  xor          s11, sp, s11
                  addi         t5, tp, -1221
                  c.li         s3, 18
                  mulh         a6, t0, tp
                  sll          s4, a1, t6
                  c.nop
                  srai         a4, a5, 8
                  mul          zero, gp, s6
                  c.addi16sp   sp, 80
                  sra          s9, s6, s11
                  and          s1, s11, a7
                  srli         a4, a1, 6
                  and          s4, s9, s0
                  c.xor        s1, a2
                  csrrw        ra, 0x340, a5
                  lui          s3, 904666
                  remu         s8, s11, t2
                  lui          s11, 800131
                  csrrsi       s9, 0x340, 0
                  mul          a6, a5, t0
                  csrrsi       tp, 0x340, 23
                  mul          s11, a6, a5
                  rem          s3, a0, a6
                  c.or         a4, a1
                  mulhu        s2, a7, t0
                  slt          ra, a6, s4
                  slli         t0, a7, 30
                  rem          a4, a0, a3
                  c.xor        a3, a2
                  srli         s3, s0, 26
                  c.srli       a2, 9
                  c.addi4spn   a5, sp, 560
                  c.xor        a2, s0
                  divu         s11, s10, a4
                  csrrsi       ra, 0x340, 3
                  slli         a0, t2, 13
                  c.nop
                  mulhu        s11, s7, tp
                  srl          a0, a5, t3
                  c.lui        t0, 19
                  c.andi       a3, 20
                  mulhu        s3, a0, gp
                  c.nop
                  csrrc        s4, 0x340, tp
                  c.lui        a4, 5
                  slli         s10, ra, 29
                  sll          s2, a6, s0
                  c.slli       a4, 29
                  mulhsu       a6, a7, gp
                  xor          t5, s10, s0
                  csrrci       s2, 0x340, 9
                  c.addi16sp   sp, -16
                  divu         a0, s9, s10
                  slli         s0, s2, 2
                  mulh         a0, s4, s11
                  sub          a6, a7, s5
                  c.nop
                  c.addi16sp   sp, -16
                  c.or         s0, s0
                  c.mv         s5, s5
                  c.sub        a5, s1
                  c.and        a2, s1
                  rem          s5, s0, a5
                  csrrs        a4, 0x340, t3
                  c.addi16sp   sp, -16
                  addi         sp, sp, -974
                  mul          a4, s8, gp
                  andi         tp, sp, -926
                  sra          a5, t6, s7
                  divu         ra, a4, a7
                  c.mv         t4, t5
                  lui          s6, 283624
                  sub          gp, a3, a0
                  srl          a0, s8, s10
                  xori         tp, t6, 1894
                  slt          s0, t4, a0
                  andi         a6, s7, -289
                  c.addi       t3, 1
                  srai         t2, a3, 16
                  slt          a5, s4, a1
                  c.srli       a2, 20
                  csrrwi       ra, 0x340, 26
                  addi         a2, t1, 1075
                  add          s0, s9, s4
                  mul          s4, s1, t3
                  c.addi16sp   sp, 480
                  csrrs        a3, 0x340, tp
                  c.andi       a5, -1
                  xor          zero, t4, a6
                  c.addi       s7, 20
                  slli         t4, s2, 13
                  sltiu        s7, a5, -646
                  lui          s2, 29952
                  csrrc        a5, 0x340, zero
                  andi         s0, t4, -637
                  srli         t5, zero, 13
                  slt          a7, a6, s3
                  auipc        a3, 770472
                  csrrc        zero, 0x340, tp
                  c.srli       s0, 12
                  sra          s0, t6, t5
                  c.and        a3, s1
                  c.li         t0, 11
                  sub          s1, s1, zero
                  csrrci       s9, 0x340, 0
                  csrrc        s0, 0x340, zero
                  srl          s8, s1, a0
                  ori          t5, s7, 431
                  slt          a0, zero, a5
                  sltiu        a7, a6, -327
                  rem          s10, ra, s0
                  div          a3, s11, t5
                  csrrci       tp, 0x340, 0
                  sltiu        s7, a2, 1710
                  csrrsi       a6, 0x340, 3
                  rem          tp, tp, a5
                  sltu         t4, s11, s2
                  andi         tp, t2, 191
                  c.sub        a2, a1
                  c.mv         a7, a2
                  srai         t2, a6, 14
                  c.xor        a5, a3
                  srai         s2, tp, 30
                  sll          s1, a0, t4
                  srl          a2, t0, t2
                  mulhu        s9, a3, s0
                  divu         a3, s7, s8
                  c.li         gp, -1
                  c.nop
                  c.addi       t0, 22
                  addi         s6, tp, 39
                  sltu         a7, zero, a4
                  add          s6, s5, s9
                  sll          a6, s8, t0
                  rem          s6, ra, s0
                  add          tp, s0, t4
                  c.nop
                  c.lui        s7, 27
                  c.addi       s0, -1
                  csrrc        s4, 0x340, a7
                  c.xor        a2, a3
                  rem          s0, s8, s3
                  c.mv         s6, a4
                  c.nop
                  csrrci       s4, 0x340, 0
                  nop
                  and          t5, s10, a4
                  c.addi16sp   sp, -16
                  or           ra, a0, t6
                  sll          a3, a5, s7
                  mulh         t3, s6, zero
                  slti         tp, s6, 1686
                  xor          a7, tp, t2
                  c.andi       a2, 27
                  sltu         a7, a7, t6
                  csrrsi       t3, 0x340, 16
                  srai         s4, t4, 1
                  c.addi4spn   s1, sp, 608
                  c.sub        a0, a2
                  divu         a4, s6, t5
                  sltiu        a5, s1, -645
                  sra          s9, a2, s9
                  or           gp, t0, a2
                  mulh         s5, s0, s2
                  srl          t5, s9, ra
                  sub          t2, s4, s3
                  mulhu        s7, a2, a3
                  auipc        a5, 747161
                  slli         s11, tp, 0
                  c.srli       a2, 18
                  sll          s2, s2, s11
                  remu         t4, s10, s2
                  csrrci       a0, 0x340, 12
                  and          s1, a2, s7
                  or           s11, ra, a5
                  divu         a5, s7, a3
                  csrrwi       s0, 0x340, 14
                  xor          s10, s2, s4
                  mulhu        s4, t2, a1
                  c.sub        a4, s1
                  or           s9, s11, s8
                  slt          s3, t0, a2
                  csrrs        s7, 0x340, zero
                  mulhu        t5, s4, t1
                  csrrsi       s7, 0x340, 0
                  nop
                  nop
                  sra          t0, s8, a0
                  srai         tp, t5, 29
                  and          s3, t3, s3
                  csrrc        s11, 0x340, zero
                  c.srli       a5, 1
                  csrrsi       s3, 0x340, 0
                  csrrwi       a4, 0x340, 15
                  ori          gp, s3, 1667
                  divu         s9, t2, a3
                  srai         sp, s3, 4
                  ori          t0, a2, 790
                  mulhu        s9, a6, sp
                  sub          a2, a7, s8
                  div          t3, a1, t3
                  csrrwi       a2, 0x340, 31
                  csrrw        s3, 0x340, a4
                  rem          s4, s2, s5
                  c.srli       a4, 24
                  c.andi       s0, 5
                  csrrs        s4, 0x340, a0
                  c.mv         a0, gp
                  c.li         sp, -1
                  c.sub        a0, a3
                  mulh         s4, zero, s11
                  remu         s11, a5, s2
                  and          s1, a2, s0
                  c.or         a0, a5
                  c.mv         a2, tp
                  c.li         tp, -1
                  csrrsi       s11, 0x340, 0
                  sltiu        s0, sp, 1461
                  add          s3, s10, t5
                  nop
                  nop
                  c.mv         tp, a0
                  c.sub        s0, a5
                  csrrw        s2, 0x340, t3
                  srli         a4, s10, 14
                  divu         t5, ra, t0
                  and          a4, a3, s10
                  mul          s9, s7, a3
                  c.nop
                  c.and        s0, a5
                  rem          t5, ra, t5
                  c.and        a2, a5
                  add          s6, tp, a3
                  and          a5, t1, a4
                  c.add        a5, t6
                  c.add        t0, t1
                  add          sp, s3, t1
                  rem          s3, s4, t5
                  mulh         sp, a0, t4
                  c.or         a2, a0
                  c.or         a5, a2
                  divu         s1, t2, ra
                  csrrw        s5, 0x340, s0
                  add          t0, t4, zero
                  c.slli       s0, 31
                  c.slli       s7, 5
                  csrrs        s0, 0x340, s3
                  c.addi       t5, 17
                  rem          a2, s7, s0
                  c.li         a7, 19
                  c.sub        a3, s1
                  c.addi16sp   sp, 384
                  c.addi       s7, -1
                  sra          a6, zero, s8
                  lui          gp, 365964
                  c.li         s1, 23
                  c.or         s0, s1
                  auipc        s4, 355352
                  remu         sp, a2, a4
                  sub          s6, a2, s7
                  c.andi       a3, 16
                  srai         ra, t2, 8
                  xori         s8, t4, -1986
                  mul          s7, a4, tp
                  remu         a4, s8, s0
                  csrrsi       sp, 0x340, 26
                  remu         s1, s0, s1
                  c.add        t5, tp
                  c.or         s0, s1
                  c.and        s0, a4
                  c.srli       a0, 28
                  c.or         a2, a1
                  sltiu        s6, a3, 100
                  slt          gp, a3, t1
                  c.li         t0, 16
                  c.srai       a2, 8
                  sra          s1, s8, t4
                  and          zero, s3, s5
                  remu         t5, gp, t3
                  c.addi16sp   sp, -16
                  ori          a0, s5, -1152
                  div          t3, a5, t6
                  nop
                  c.lui        a3, 26
                  or           s6, a6, gp
                  ori          a3, s9, -954
                  nop
                  or           t4, t1, tp
                  c.add        a2, tp
                  add          gp, ra, t6
                  auipc        t3, 435076
                  xor          s5, s4, a2
                  c.mv         t2, s1
                  xori         a7, s6, -143
                  c.add        a4, tp
                  c.add        t4, tp
                  slt          s0, a4, a2
                  c.sub        s0, a2
                  srl          s2, t5, s6
                  mul          s11, s1, s7
                  xor          a3, s5, gp
                  c.srli       s0, 9
                  divu         s11, a0, a4
                  c.srli       a0, 19
                  sll          a2, s4, s6
                  c.li         t4, -1
                  sra          a4, a3, t6
                  addi         t3, a2, 571
                  sub          s2, s0, ra
                  sub          s9, sp, s3
                  srli         s10, t0, 30
                  sltiu        s0, a6, 794
                  div          t5, a0, a2
                  c.mv         t5, a1
                  srl          s9, s4, s3
                  c.addi16sp   sp, -16
                  nop
                  sltu         gp, t2, a5
                  srai         a0, s3, 3
                  c.mv         s7, s10
                  c.and        a0, a5
                  and          zero, a0, a0
                  c.xor        a2, s1
                  sltiu        a0, s10, -1172
                  slli         s4, a4, 15
                  and          s7, a5, a5
                  slt          t2, ra, s5
                  slli         ra, a7, 29
                  c.slli       a4, 19
                  c.srai       a0, 6
                  srl          a6, a4, s6
                  lui          s8, 216618
                  c.li         gp, -1
                  ori          s5, s10, 465
                  srai         zero, a3, 8
                  divu         a3, a2, s5
                  xori         t5, s10, 1383
                  add          a2, a5, gp
                  srai         t4, a0, 31
                  c.addi4spn   s0, sp, 672
                  mul          s0, zero, zero
                  rem          s2, sp, s2
                  c.addi16sp   sp, -16
                  csrrc        s9, 0x340, zero
                  mulhsu       a3, s11, s2
                  srai         a4, s5, 26
                  sub          s9, sp, s5
                  slli         zero, s4, 3
                  csrrw        s2, 0x340, a5
                  sltiu        s8, s10, -1841
                  c.addi       t3, -1
                  c.sub        a5, a2
                  sub          a0, ra, t2
                  c.addi16sp   sp, -16
                  c.addi4spn   a0, sp, 672
                  sltu         s1, gp, s11
                  c.lui        s3, 17
                  srai         a2, a0, 30
                  c.add        s11, a2
                  and          s0, a2, t0
                  csrrs        sp, 0x340, a7
                  ori          tp, gp, 720
                  auipc        a4, 767238
                  csrrs        a3, 0x340, zero
                  nop
                  sub          s6, s6, sp
                  c.addi16sp   sp, 336
                  csrrc        s11, 0x340, zero
                  csrrwi       a0, 0x340, 8
                  c.mv         t3, t2
                  srli         t4, s9, 28
                  c.srai       a4, 1
                  sra          t4, s7, s9
                  csrrw        s5, 0x340, sp
                  sll          t5, t2, a7
                  sltu         a6, a2, a1
                  c.slli       s11, 8
                  nop
                  divu         a2, s3, a6
                  sub          s2, gp, s10
                  srai         s11, s1, 29
                  slti         s7, tp, -1750
                  c.mv         s6, a4
                  ori          ra, t3, -1966
                  csrrw        a2, 0x340, t4
                  csrrc        t5, 0x340, s7
                  slt          s4, a5, s3
                  sltu         t5, a5, s6
                  c.andi       a0, -1
                  c.li         gp, 20
                  sll          a6, s1, t3
                  c.addi16sp   sp, -16
                  xor          s6, tp, a2
                  xori         t0, t5, -1919
                  c.srai       s0, 15
                  sub          s2, s9, s8
                  c.li         t2, 27
                  slli         a7, t1, 19
                  slli         tp, a1, 23
                  nop
                  c.or         a0, a0
                  c.xor        a5, a1
                  mulhsu       t5, a1, ra
                  sltu         a2, t6, s3
                  c.add        t4, tp
                  srai         a3, a7, 7
                  c.nop
                  add          zero, s7, gp
                  lui          s3, 283757
                  c.mv         t0, s2
                  csrrw        s4, 0x340, a1
                  csrrwi       a0, 0x340, 3
                  sltiu        s10, t0, 1062
                  srl          s4, sp, s1
                  addi         s11, t3, -1702
                  c.srai       a5, 7
                  c.sub        a3, a1
                  xor          a2, t6, s8
                  divu         s9, s9, s7
                  srai         t2, s9, 4
                  srli         s7, a3, 23
                  lui          a6, 740904
                  lui          s6, 604963
                  c.addi       a3, -1
                  c.mv         t3, s10
                  csrrc        t4, 0x340, zero
                  c.srai       s0, 1
                  c.addi16sp   sp, 480
                  c.andi       a0, 15
                  c.srai       a5, 4
                  auipc        s0, 865606
                  addi         s1, a6, 127
                  addi         s3, s8, 910
                  csrrs        s7, 0x340, zero
                  and          a5, s2, tp
                  c.li         tp, 13
                  div          a5, a4, a6
                  andi         s5, a6, -92
                  srai         s0, gp, 11
                  slti         s1, s6, -520
                  c.srli       a2, 11
                  add          ra, a7, s9
                  slli         a2, s11, 10
                  mul          a4, t6, a1
                  srai         gp, s2, 20
                  rem          ra, s8, a0
                  c.mv         s8, t2
                  sltiu        s10, s0, -1329
                  mulhsu       a3, s11, t2
                  xori         sp, a5, -758
                  auipc        s0, 509254
                  c.andi       s1, -1
                  c.xor        a4, a1
                  c.or         s0, a0
                  rem          t3, s11, a4
                  csrrsi       s6, 0x340, 0
                  nop
                  sltu         s11, ra, s11
                  mulh         s3, zero, t2
                  auipc        a7, 9492
                  sub          a4, a0, sp
                  c.sub        a0, a5
                  slli         a7, t0, 20
                  c.mv         a2, t3
                  andi         s5, t1, 1978
                  csrrci       s3, 0x340, 4
                  div          s11, a0, s4
                  slt          s5, t4, ra
                  mul          t5, s10, a4
                  csrrc        t0, 0x340, zero
                  rem          t3, a4, a7
                  slti         s6, s4, 1146
                  div          a4, t6, s3
                  remu         s3, t2, a6
                  ori          s4, a3, 634
                  divu         s0, a3, s2
                  c.lui        t2, 24
                  sub          s9, s0, t4
                  c.mv         s1, a6
                  srli         a3, s5, 16
                  csrrwi       s8, 0x340, 7
                  addi         s4, a2, -1224
                  srai         s11, a5, 27
                  xor          t0, sp, t6
                  c.mv         a6, a5
                  c.nop
                  xor          s10, s11, t1
                  nop
                  nop
                  sltu         t3, ra, a4
                  c.xor        a3, a4
                  c.srli       s1, 20
                  c.sub        a0, a0
                  andi         s7, t2, -56
                  csrrs        s9, 0x340, zero
                  csrrw        t2, 0x340, s10
                  csrrs        gp, 0x340, ra
                  c.or         a5, a1
                  c.srli       a4, 13
                  c.mv         a6, t4
                  c.and        a2, a3
                  or           s2, sp, sp
                  sll          s9, s1, t6
                  div          s0, a1, t3
                  c.mv         a4, s8
                  sll          s10, t1, s5
                  sra          t5, ra, t2
                  c.sub        a4, a3
                  c.xor        a0, a0
                  c.lui        s8, 3
                  c.and        s1, s1
                  mulhu        s6, s4, s7
                  slt          a5, a4, s0
                  div          a3, a1, a2
                  auipc        s3, 682429
                  c.nop
                  or           s5, s11, a2
                  add          t5, s10, s6
                  sub          t5, s9, s9
                  c.andi       a0, 28
                  csrrsi       tp, 0x340, 0
                  sra          a6, t6, t5
                  xori         sp, t1, -923
                  sra          a2, a6, a4
                  c.slli       a3, 24
                  mulhu        t2, ra, s3
                  sltiu        s10, zero, -474
                  mulh         a0, a4, s2
                  c.addi16sp   sp, 48
                  lui          a5, 149370
                  c.addi4spn   a2, sp, 672
                  slt          t4, s7, sp
                  srli         ra, s7, 27
                  csrrw        gp, 0x340, s1
                  sltiu        a6, t2, -46
                  c.nop
                  csrrc        t2, 0x340, zero
                  c.addi16sp   sp, -16
                  andi         t5, a2, -1014
                  c.or         a0, a1
                  nop
                  c.addi16sp   sp, -16
                  and          a5, s4, gp
                  div          s3, sp, s6
                  mulhsu       t5, zero, s2
                  remu         s8, s4, sp
                  slli         a7, s1, 29
                  srli         s6, a3, 19
                  c.add        gp, sp
                  sltiu        s6, s9, -733
                  ori          tp, t2, 176
                  c.addi16sp   sp, 480
                  c.add        s4, t0
                  nop
                  csrrs        s6, 0x340, zero
                  c.addi4spn   a4, sp, 720
                  slti         zero, t2, 1381
                  div          t4, s10, s10
                  srai         t5, t6, 14
                  c.srai       a5, 14
                  c.addi4spn   a4, sp, 608
                  slli         a3, tp, 18
                  c.li         a6, -1
                  div          t3, a7, s10
                  c.add        s2, a4
                  c.addi       t2, -1
                  auipc        t2, 481533
                  c.addi4spn   a5, sp, 432
                  c.addi16sp   sp, 432
                  mulhsu       a3, t0, a5
                  c.lui        s1, 8
                  ori          t0, a1, -248
                  srai         a0, t5, 7
                  c.xor        a4, a0
                  c.sub        a5, a2
                  slti         t3, s3, -874
                  mul          a7, zero, a5
                  slti         s9, zero, -1263
                  sub          t2, t1, s7
                  csrrsi       s2, 0x340, 23
                  srl          tp, s1, s0
                  csrrc        s2, 0x340, zero
                  c.and        a3, a2
                  c.addi4spn   s0, sp, 400
                  c.srai       s0, 5
                  srl          t2, a0, t6
                  srai         s2, s8, 26
                  c.lui        s2, 19
                  csrrwi       a2, 0x340, 26
                  andi         a3, zero, 1950
                  sra          zero, s1, s8
                  ori          s11, s1, 862
                  csrrw        s0, 0x340, t0
                  c.li         t4, 26
                  csrrc        s3, 0x340, zero
                  c.lui        s6, 24
                  c.and        s0, s1
                  rem          s0, s9, a0
                  c.mv         a4, a2
                  sra          a6, a3, s8
                  sltu         s5, s11, s11
                  xori         a7, s4, 1192
                  c.addi16sp   sp, 368
                  c.add        s8, s0
                  csrrsi       t3, 0x340, 0
                  c.li         a0, 4
                  ori          s7, s3, -1835
                  c.and        a3, a5
                  divu         s7, a7, t1
                  srl          t2, s1, tp
                  ori          a5, a0, -1828
                  slti         a3, zero, -401
                  csrrwi       a2, 0x340, 18
                  csrrw        a5, 0x340, s6
                  or           s0, t5, sp
                  csrrsi       s4, 0x340, 0
                  div          s9, t5, t0
                  c.xor        a4, s0
                  rem          s6, s3, a7
                  sra          s5, s10, s4
                  c.lui        ra, 21
                  c.sub        a2, a2
                  c.srai       s0, 21
                  remu         s3, ra, s1
                  andi         s11, t2, 433
                  slli         s10, a2, 6
                  c.srai       a0, 9
                  slli         s9, t3, 31
                  rem          a0, a6, s4
                  mul          s5, s4, a4
                  xori         t0, s11, -1669
                  c.srai       a0, 8
                  sltu         s0, s2, s9
                  c.addi4spn   a2, sp, 16
                  csrrsi       a0, 0x340, 0
                  c.addi       s11, -1
                  csrrwi       s8, 0x340, 26
                  sltu         t4, t2, s3
                  c.lui        s4, 30
                  slli         s0, a4, 31
                  c.nop
                  c.nop
                  csrrs        gp, 0x340, sp
                  srl          t3, s2, t5
                  div          gp, t6, s2
                  c.and        a5, a0
                  csrrw        sp, 0x340, s6
                  c.xor        a0, a2
                  sra          a6, t6, s3
                  c.mv         t0, s9
                  add          a6, s3, a6
                  andi         zero, s6, -1787
                  csrrs        s9, 0x340, zero
                  rem          s8, s3, s6
                  c.xor        a3, a5
                  xor          s5, s0, ra
                  sltiu        zero, a6, -478
                  add          s7, s0, a3
                  c.andi       a2, 13
                  srai         gp, a7, 30
                  csrrci       s5, 0x340, 0
                  c.srli       s1, 6
                  slli         s4, a4, 7
                  c.sub        a2, a1
                  divu         s4, s8, t4
                  srli         sp, a6, 8
                  c.add        a5, s1
                  lui          s4, 778012
                  xori         s2, gp, 1726
                  srai         tp, a6, 2
                  sra          a7, a4, t1
                  addi         s3, s9, -262
                  ori          zero, t3, 244
                  c.or         a0, a3
                  sub          s9, a4, t6
                  xori         s3, s8, 412
                  sub          s5, tp, s3
                  c.srli       s0, 29
                  c.srli       s0, 11
                  slti         t2, a0, -495
                  sll          s5, gp, gp
                  mulh         a7, tp, t4
                  csrrwi       s7, 0x340, 18
                  c.addi16sp   sp, -16
                  andi         a5, s5, 1126
                  c.nop
                  c.li         s8, -1
                  slt          s8, s0, t2
                  sll          s10, s9, a2
                  c.addi16sp   sp, -16
                  slli         s3, a7, 26
                  div          t2, a6, s10
                  srai         s10, s9, 26
                  and          s4, s1, a6
                  srli         s10, t5, 16
                  c.lui        s4, 18
                  csrrc        tp, 0x340, zero
                  andi         a3, s10, 800
                  c.srli       a2, 9
                  divu         s10, ra, a6
                  mulhu        s3, s2, ra
                  c.srli       s0, 20
                  c.sub        a2, a3
                  nop
                  rem          a6, zero, t4
                  mulh         t0, s2, tp
                  c.xor        s0, a5
                  addi         s1, s6, -1831
                  c.srai       a5, 16
                  andi         s0, a4, 41
                  csrrs        s7, 0x340, zero
                  c.nop
                  or           t3, t6, t3
                  sltu         s7, a6, a6
                  mulhu        ra, s8, s4
                  csrrwi       s10, 0x340, 14
                  mul          s2, a5, t4
                  andi         s7, s0, 1034
                  xori         tp, s8, -1845
                  srai         s11, a7, 0
                  c.mv         t4, a7
                  csrrwi       s2, 0x340, 28
                  mulhu        sp, gp, s7
                  srl          s3, s5, s9
                  div          a4, t0, s8
                  c.addi       s11, 16
                  addi         gp, t3, 1104
                  and          s7, zero, t2
                  mulh         a7, a2, s9
                  mulhsu       s6, a2, t3
                  lui          zero, 868347
                  mulh         s6, a5, t3
                  auipc        a0, 246157
                  nop
                  xori         s2, t1, 1118
                  nop
                  auipc        t4, 488752
                  slti         s7, s4, -1492
                  mulhu        s4, t0, a7
                  addi         s10, s6, 1521
                  andi         a7, tp, -792
                  addi         gp, s7, 972
                  c.srli       s0, 26
                  add          t2, a2, s6
                  c.add        s9, a6
                  csrrw        a6, 0x340, t2
                  addi         s5, ra, 570
                  csrrs        gp, 0x340, zero
                  c.or         a2, a0
                  mulh         a5, t4, a6
                  c.addi       ra, 20
                  div          ra, s3, s8
                  c.addi16sp   sp, -16
                  addi         s0, a5, -432
                  remu         s8, tp, t6
                  csrrsi       a4, 0x340, 0
                  csrrs        s2, 0x340, s7
                  add          t3, a7, t1
                  c.mv         a4, a1
                  nop
                  srai         s11, s1, 12
                  c.and        a2, a3
                  c.addi4spn   a0, sp, 576
                  srai         ra, a6, 14
                  csrrw        a4, 0x340, s1
                  xor          a5, t6, t2
                  or           a0, s9, t6
                  c.nop
                  lui          a5, 920999
                  lui          s7, 64855
                  andi         a2, a0, 552
                  mulhu        zero, t0, a3
                  srl          s7, s6, s3
                  c.slli       a4, 5
                  mul          s9, s10, s8
                  csrrs        zero, 0x340, s3
                  mulhsu       zero, a0, a1
                  c.slli       tp, 17
                  auipc        gp, 379937
                  slli         a6, a3, 28
                  c.and        s0, a3
                  slti         a6, a6, -1104
                  c.addi4spn   a4, sp, 160
                  srl          a0, s5, t1
                  slti         gp, zero, 938
                  sub          t4, s4, t3
                  sra          a0, s8, s4
                  slt          s0, a6, a2
                  auipc        gp, 107360
                  mulhu        a2, t5, t1
                  c.and        a2, a3
                  rem          zero, a2, s0
                  sltu         a6, s8, s4
                  c.lui        s9, 28
                  c.nop
                  nop
                  add          a2, s1, s5
                  c.or         s1, s0
                  c.addi16sp   sp, 144
                  c.andi       s0, -1
                  c.xor        s1, s1
                  c.srli       a0, 12
                  srli         s0, t4, 20
                  auipc        tp, 832254
                  auipc        t5, 145276
                  c.sub        a0, s0
                  csrrwi       t2, 0x340, 18
                  c.mv         a4, a0
                  c.addi       s9, -1
                  c.addi4spn   s0, sp, 224
                  c.slli       a6, 7
                  add          a5, a6, s10
                  sub          s5, a3, a1
                  c.lui        t0, 24
                  csrrc        a4, 0x340, zero
                  sltiu        t3, s9, -787
                  c.mv         s5, s3
                  nop
                  srli         s7, s4, 27
                  c.add        t3, tp
                  sra          s3, t6, a7
                  slt          gp, s6, zero
                  mulh         s0, s1, a5
                  c.addi16sp   sp, 288
                  xor          s10, a5, t5
                  ori          s7, tp, -1526
                  sub          s7, a6, t0
                  csrrci       sp, 0x340, 0
                  auipc        a0, 648722
                  xori         t3, s5, 1066
                  csrrci       s10, 0x340, 15
                  andi         s1, a2, -851
                  c.nop
                  srl          t3, s10, s4
                  xor          a3, s2, a2
                  srai         s9, zero, 5
                  csrrc        s9, 0x340, s5
                  srai         t3, a3, 6
                  slt          zero, a1, t6
                  andi         s9, a6, 842
                  csrrs        s6, 0x340, s8
                  sra          s6, a2, s9
                  mulh         s7, s10, a1
                  div          a2, a4, s2
                  mulhu        ra, a6, t4
                  c.mv         s8, tp
                  mulhu        a3, s6, a7
                  div          tp, s9, s5
                  srli         s7, s2, 29
                  lui          t4, 328190
                  sub          t0, s6, a4
                  mulhsu       s2, s3, a1
                  c.slli       s7, 4
                  c.srli       s1, 15
                  csrrw        s6, 0x340, tp
                  div          a3, a5, s2
                  rem          s3, t1, t5
                  c.mv         a4, s4
                  auipc        s1, 49988
                  csrrc        a7, 0x340, zero
                  nop
                  mulhsu       s10, t1, gp
                  c.andi       a4, -1
                  lui          s8, 16634
                  c.sub        s0, a3
                  c.sub        s1, a2
                  sub          ra, s11, s0
                  lui          a6, 828645
                  csrrw        a5, 0x340, gp
                  xori         a2, s8, 772
                  sra          s3, s8, a5
                  csrrwi       gp, 0x340, 27
                  sra          t2, s8, t6
                  c.addi       t3, -1
                  c.mv         s9, t0
                  rem          t3, t4, s10
                  divu         a5, gp, a2
                  mulh         ra, s8, s0
                  slli         t2, t1, 21
                  csrrsi       a6, 0x340, 0
                  csrrsi       a6, 0x340, 30
                  csrrsi       s5, 0x340, 0
                  ori          zero, a3, -691
                  andi         a7, t2, 769
                  csrrci       a6, 0x340, 0
                  nop
                  and          tp, s6, s5
                  c.li         s9, -1
                  srli         s11, tp, 14
                  nop
                  c.mv         t2, s11
                  mul          s10, a4, t4
                  mulh         s3, s6, s9
                  c.mv         s7, s9
                  addi         s0, t5, -1852
                  xor          a5, s7, t0
                  mul          sp, s0, tp
                  csrrw        ra, 0x340, s10
                  mulhsu       s1, t2, s6
                  c.and        s1, a5
                  c.addi4spn   a5, sp, 896
                  mulhu        a3, a4, s5
                  div          a6, s6, a0
                  csrrsi       s8, 0x340, 3
                  csrrci       s1, 0x340, 0
                  xori         s5, s10, -1258
                  c.lui        s3, 31
                  sll          ra, a6, t0
                  c.li         s11, 6
                  andi         gp, t0, 1938
                  mul          sp, s5, s3
                  mulhu        a4, s8, t5
                  mulh         zero, t2, tp
                  csrrs        t5, 0x340, zero
                  xor          a4, a2, t4
                  c.xor        a4, a3
                  ori          sp, s8, 163
                  sub          s7, a5, s11
                  srai         s5, tp, 1
                  c.nop
                  div          sp, a5, zero
                  c.slli       a5, 15
                  add          s2, t4, a5
                  auipc        s6, 90767
                  ori          ra, s0, -801
                  csrrw        a6, 0x340, s10
                  mulhu        s7, s0, a2
                  divu         zero, s5, s11
                  c.sub        a5, a0
                  c.xor        a4, a3
                  div          t3, t5, s9
                  xor          s6, a0, t4
                  c.sub        a3, a1
                  lui          s9, 80458
                  csrrwi       s6, 0x340, 22
                  c.li         gp, -1
                  mulhu        a7, s11, s9
                  c.addi4spn   s1, sp, 336
                  csrrw        t2, 0x340, s7
                  sltiu        s2, s9, 1460
                  c.addi4spn   a5, sp, 112
                  mulhsu       t5, a0, s8
                  nop
                  csrrs        s4, 0x340, zero
                  addi         t3, tp, 299
                  csrrc        t4, 0x340, t2
                  csrrci       s11, 0x340, 0
                  csrrsi       s10, 0x340, 21
                  srli         a2, tp, 5
                  sra          a5, a4, gp
                  c.mv         a2, t0
                  addi         a2, s7, -432
                  c.add        a2, t4
                  or           s2, s10, s6
                  slti         sp, a1, -1109
                  c.addi16sp   sp, 368
                  c.srai       a0, 2
                  sll          ra, s0, a7
                  andi         zero, s9, -1764
                  andi         s1, s8, 1304
                  c.addi4spn   a5, sp, 448
                  csrrc        s9, 0x340, zero
                  csrrc        a2, 0x340, zero
                  remu         s4, zero, tp
                  sll          a7, s10, s10
                  c.addi16sp   sp, 48
                  xor          t2, a4, s4
                  c.addi4spn   a2, sp, 416
                  c.sub        a2, s0
                  sll          a5, zero, a5
                  lui          s2, 807947
                  add          s4, a4, a6
                  mulhu        tp, t3, s5
                  xori         t4, t2, -299
                  c.sub        s1, a5
                  slt          t0, s6, t5
                  c.xor        a2, s1
                  c.srai       a0, 12
                  c.add        a6, tp
                  rem          t3, s4, t2
                  and          sp, t5, s8
                  slti         s2, a4, 1969
                  addi         a4, gp, -601
                  sltiu        s7, a1, -74
                  add          t4, t6, zero
                  srai         s8, a4, 19
                  add          s7, s8, a0
                  c.mv         t0, a4
                  c.or         a0, a5
                  c.nop
                  c.mv         a6, gp
                  c.mv         t2, s3
                  srl          s0, s5, s0
                  c.srai       s0, 20
                  ori          zero, t5, 991
                  mul          s5, a2, a0
                  lui          a7, 917546
                  mulhu        ra, s10, s1
                  and          s4, t6, t0
                  c.sub        a0, a2
                  mulhsu       s2, a4, sp
                  csrrw        s8, 0x340, s0
                  c.srai       s1, 1
                  c.lui        s6, 3
                  c.mv         s10, a7
                  rem          s7, s10, s5
                  csrrsi       tp, 0x340, 11
                  slli         t5, a2, 14
                  remu         s7, ra, t1
                  c.lui        s5, 21
                  sll          a2, s11, a5
                  c.lui        ra, 3
                  c.slli       a2, 22
                  srl          t0, s8, t4
                  csrrs        a2, 0x340, zero
                  mulhu        s6, s6, t4
                  csrrsi       s1, 0x340, 21
                  slli         a3, t0, 22
                  c.lui        a3, 22
                  csrrwi       s5, 0x340, 0
                  csrrci       a7, 0x340, 12
                  andi         a3, a5, 375
                  c.addi16sp   sp, 240
                  sltiu        t5, s3, -1388
                  srli         a3, s1, 11
                  nop
                  c.addi       s4, 23
                  c.li         s2, -1
                  csrrw        gp, 0x340, ra
                  c.mv         a7, t3
                  c.add        s1, s10
                  div          s7, t4, a5
                  lui          a4, 996561
                  mulhu        s6, tp, t0
                  csrrc        a5, 0x340, t4
                  auipc        a3, 866327
                  sra          a2, s10, a3
                  c.slli       s4, 14
                  mulhsu       s5, a3, s3
                  slli         a5, s5, 9
                  c.srai       s0, 1
                  mulhsu       t3, a1, s4
                  c.add        t4, a5
                  slti         sp, s7, 1160
                  lui          a7, 582222
                  csrrsi       a7, 0x340, 0
                  c.and        a4, a1
                  c.nop
                  sll          tp, sp, tp
                  csrrc        s2, 0x340, s5
                  srli         t0, t1, 28
                  csrrwi       s8, 0x340, 31
                  c.lui        s3, 12
                  csrrw        t0, 0x340, sp
                  c.slli       a4, 7
                  auipc        s7, 838773
                  slt          gp, a5, s3
                  csrrwi       s10, 0x340, 14
                  c.mv         s3, a6
                  lui          a6, 966777
                  slti         a5, s2, 1836
                  slli         t2, t5, 20
                  c.mv         t5, s4
                  c.andi       a2, 21
                  csrrw        t5, 0x340, gp
                  c.srli       s0, 19
                  mul          s4, a1, a4
                  csrrci       s9, 0x340, 0
                  c.srai       a2, 27
                  mulh         a6, zero, a4
                  nop
                  csrrw        a5, 0x340, ra
                  xori         a2, s6, -889
                  c.andi       a0, -1
                  csrrs        t3, 0x340, zero
                  c.srli       a5, 17
                  csrrs        s9, 0x340, s2
                  mulh         a6, sp, s9
                  csrrc        a0, 0x340, zero
                  c.srai       s0, 28
                  slli         s6, t1, 14
                  c.mv         s1, a1
                  csrrc        a5, 0x340, s4
                  c.andi       a4, 1
                  c.slli       tp, 23
                  sltiu        ra, gp, -2024
                  c.and        a5, a5
                  ori          s5, gp, -478
                  c.nop
                  and          gp, gp, t2
                  c.srli       s0, 29
                  nop
                  c.li         s2, 13
                  c.and        a2, a5
                  srl          tp, s0, tp
                  rem          gp, a6, t0
                  add          s1, gp, sp
                  c.slli       a0, 17
                  sub          t0, t3, sp
                  sltu         s8, s7, t4
                  auipc        t5, 887857
                  remu         a3, s7, s5
                  slli         s5, s0, 28
                  div          s7, t1, t4
                  c.li         ra, -1
                  c.nop
                  sltiu        s2, t2, -747
                  ori          t4, s2, -1769
                  c.xor        a2, a5
                  c.and        a5, a3
                  c.addi4spn   a2, sp, 880
                  srai         a6, a1, 26
                  sltu         a0, t6, s9
                  xori         tp, a2, 1541
                  srl          s3, t0, s6
                  c.mv         s11, s10
                  slti         zero, zero, -1361
                  slt          a3, ra, ra
                  c.addi16sp   sp, -16
                  auipc        s4, 618086
                  c.addi16sp   sp, -16
                  sll          ra, sp, s5
                  slti         a4, s10, -1348
                  csrrs        a4, 0x340, t1
                  ori          a5, s8, 1210
                  c.or         a2, a3
                  c.srli       a4, 12
                  c.or         a5, s1
                  divu         s10, s0, zero
                  and          s2, sp, a2
                  c.addi4spn   a3, sp, 208
                  remu         t3, a0, s7
                  srli         a3, s11, 31
                  c.addi4spn   a4, sp, 384
                  csrrwi       s2, 0x340, 1
                  csrrc        a3, 0x340, a0
                  c.nop
                  c.addi16sp   sp, -16
                  xor          s6, t0, gp
                  c.sub        s0, a1
                  addi         t2, s7, -1047
                  c.or         a3, a4
                  c.sub        s0, a0
                  divu         s10, s11, zero
                  c.li         s3, 7
                  sltu         s0, a1, s1
                  div          ra, gp, t1
                  c.addi       t3, -1
                  nop
                  addi         s0, a7, 1661
                  slli         a3, t6, 13
                  andi         s7, gp, -131
                  c.slli       s1, 20
                  c.srli       a4, 3
                  lui          a5, 713457
                  c.slli       s9, 3
                  c.andi       s0, 14
                  addi         t3, s4, -976
                  sltiu        t4, a6, 187
                  c.addi4spn   s1, sp, 864
                  auipc        a5, 1018888
                  xor          s9, s5, s8
                  c.add        t2, a0
                  csrrs        s9, 0x340, zero
                  csrrc        t5, 0x340, t2
                  mulh         a2, a3, t1
                  srai         ra, s3, 29
                  c.and        a4, a1
                  c.mv         t4, a1
                  c.li         a6, 14
                  srai         a3, t0, 3
                  c.srai       s0, 17
                  sll          s3, s0, ra
                  c.add        s8, tp
                  c.srai       s0, 12
                  c.and        a5, a1
                  csrrw        s11, 0x340, s11
                  c.addi4spn   a3, sp, 416
                  c.srli       a0, 11
                  c.li         t0, -1
                  c.mv         s7, s2
                  rem          t3, s3, s3
                  slli         a7, t2, 18
                  c.addi16sp   sp, -16
                  add          s3, zero, s11
                  xori         a4, a3, 755
                  ori          ra, s5, 670
                  slti         tp, a4, 1339
                  or           a5, t3, ra
                  c.nop
                  c.add        a2, t6
                  lui          gp, 580435
                  c.mv         s11, s3
                  c.lui        s5, 2
                  sub          a4, t4, s8
                  c.lui        a6, 24
                  mul          s11, s11, s3
                  srai         s1, zero, 2
                  csrrs        t5, 0x340, zero
                  srli         s6, a3, 28
                  slti         s10, s8, 584
                  c.li         ra, -1
                  csrrsi       sp, 0x340, 21
                  and          s2, t0, gp
                  csrrwi       sp, 0x340, 7
                  andi         s9, t3, -1464
                  csrrwi       t5, 0x340, 15
                  csrrs        t5, 0x340, zero
                  xor          a2, sp, a7
                  c.add        s11, a2
                  c.addi       a5, -1
                  add          s2, a6, s5
                  ori          s0, s0, -227
                  sltiu        s4, a7, -170
                  c.sub        a5, a1
                  csrrc        t5, 0x340, s7
                  c.and        a0, a5
                  andi         gp, a5, 1687
                  csrrs        s6, 0x340, a1
                  c.addi16sp   sp, -16
                  srli         s6, t5, 26
                  slli         a7, s6, 31
                  c.addi4spn   s0, sp, 320
                  sra          s7, a1, a5
                  c.li         s5, 3
                  divu         s10, t2, zero
                  csrrsi       sp, 0x340, 0
                  div          s5, ra, gp
                  c.and        a3, a2
                  c.srai       s1, 23
                  srl          s11, a1, a3
                  mulhu        a3, s5, s10
                  sltu         s10, t5, sp
                  rem          a3, s10, t6
                  c.addi16sp   sp, -16
                  slli         s0, a5, 30
                  or           ra, s6, t6
                  mulh         s8, a6, a7
                  or           s9, gp, a5
                  srli         s11, s7, 2
                  mul          s1, a6, s9
                  or           s8, a6, s0
                  csrrci       s3, 0x340, 14
                  mulh         s5, a4, a5
                  c.mv         s4, a5
                  xori         a7, a7, -1553
                  mulhsu       s11, ra, a6
                  c.slli       s4, 9
                  xori         s2, a0, -1127
                  xori         a0, a0, 553
                  add          tp, t5, s5
                  or           a2, t1, a3
                  divu         a5, a4, t4
                  auipc        sp, 811122
                  xor          s7, s2, a4
                  lui          s2, 566238
                  c.li         s7, 17
                  c.addi       s5, 6
                  c.srli       a0, 7
                  srli         s10, s7, 18
                  csrrwi       s11, 0x340, 14
                  c.lui        a4, 2
                  sll          t2, s6, sp
                  sra          s7, t2, a6
                  c.srai       a4, 9
                  csrrs        s3, 0x340, zero
                  c.and        s1, a0
                  mulhu        s11, t1, s6
                  c.or         a5, a1
                  mul          a0, t3, a2
                  c.andi       a4, -1
                  c.addi       tp, -1
                  c.sub        a3, s0
                  sltiu        s3, a3, -1462
                  nop
                  sub          s3, t2, ra
                  c.srli       a0, 14
                  c.and        s0, a2
                  sltu         zero, s10, sp
                  srai         zero, a0, 15
                  srli         t5, s5, 8
                  c.or         s0, a2
                  c.and        a0, s1
                  c.sub        a2, s0
                  c.slli       t2, 3
                  c.andi       s0, -1
                  sub          s10, gp, s11
                  c.and        a5, a4
                  mulhsu       a4, s6, s4
                  mulh         t4, s5, s2
                  sra          tp, gp, s2
                  c.sub        s1, a5
                  rem          t0, a5, s1
                  c.and        s1, a2
                  remu         s4, tp, s4
                  srl          ra, t5, a0
                  lui          s3, 123261
                  divu         a7, t4, t6
                  xor          a3, s6, a5
                  slli         sp, s1, 7
                  ori          s0, sp, -49
                  c.or         a4, a2
                  mulhsu       t3, t2, t5
                  sltiu        a3, a5, 1740
                  csrrwi       a5, 0x340, 27
                  c.or         a3, a5
                  mul          t0, tp, sp
                  c.lui        t0, 8
                  sll          a4, sp, t5
                  rem          s9, a5, s11
                  auipc        a0, 454277
                  c.addi4spn   a5, sp, 160
                  add          t4, s1, s1
                  c.addi4spn   s1, sp, 416
                  c.sub        a5, a5
                  sll          a3, s9, s4
                  sra          s2, a6, a5
                  c.li         ra, 17
                  addi         a0, t4, 529
                  sltiu        s2, t5, -515
                  c.slli       a6, 3
                  xori         ra, s4, -1878
                  csrrwi       s6, 0x340, 2
                  mul          a6, s11, tp
                  xor          gp, s0, s4
                  csrrci       t5, 0x340, 27
                  c.and        s0, a5
                  add          s10, t5, gp
                  csrrs        s9, 0x340, t5
                  sra          t3, s8, t1
                  srai         t3, a3, 31
                  add          s7, s6, s0
                  c.or         a3, a3
                  sub          s4, t4, t0
                  div          a4, s6, a2
                  div          t3, s7, tp
                  mulhsu       sp, a7, ra
                  nop
                  nop
                  srai         s2, a6, 15
                  c.xor        a3, a0
                  mul          s0, t4, a0
                  sltu         a5, t1, tp
                  and          gp, s9, a5
                  csrrwi       s2, 0x340, 10
                  c.srli       s1, 17
                  and          sp, a6, s9
                  c.addi4spn   s0, sp, 784
                  c.and        a5, s1
                  c.xor        a3, a5
                  c.xor        a2, a0
                  csrrs        s6, 0x340, zero
                  csrrsi       gp, 0x340, 0
                  mulh         s10, a1, a3
                  c.nop
                  mulhsu       s4, a7, zero
                  srl          gp, s10, a7
                  xori         a7, s10, 1075
                  slti         a7, a2, -1746
                  c.srai       a5, 17
                  and          a3, s4, t2
                  nop
                  c.addi       a7, 18
                  div          s11, s10, s11
                  csrrci       s5, 0x340, 3
                  div          s8, s7, a1
                  div          s8, s0, a7
                  c.andi       a5, -1
                  c.nop
                  divu         s4, gp, t3
                  slt          a0, gp, t2
                  c.li         a6, 18
                  c.andi       a2, 11
                  ori          s0, a5, -1307
                  c.srai       a5, 27
                  remu         a7, a1, s3
                  xori         s1, t5, -1039
                  c.addi       s4, 31
                  xori         s0, t2, 1658
                  c.slli       t3, 29
                  sub          t4, s10, a7
                  andi         t2, a2, 581
                  csrrwi       s1, 0x340, 4
                  c.nop
                  c.xor        s1, s1
                  add          s5, a6, s8
                  mulhsu       s9, s9, zero
                  srl          s3, t1, s8
                  auipc        t3, 1038089
                  csrrci       a4, 0x340, 20
                  divu         s0, zero, s7
                  or           a7, a2, a6
                  srl          t3, a4, s3
                  remu         a6, t3, a6
                  addi         s7, s9, -814
                  rem          gp, t3, s3
                  c.mv         a0, s3
                  srai         s10, a1, 3
                  sltiu        a7, t1, 1158
                  sub          tp, s5, s7
                  sltu         s8, a0, zero
                  mulhu        zero, s8, a5
                  sra          gp, t2, a4
                  mul          t5, a3, a3
                  c.mv         s0, tp
                  or           s6, ra, s7
                  mulhu        sp, tp, s3
                  csrrc        s8, 0x340, t0
                  sltiu        t2, t4, -559
                  ori          s2, s10, 840
                  csrrw        s6, 0x340, t6
                  c.sub        a5, a1
                  andi         s4, a5, -642
                  csrrwi       s6, 0x340, 8
                  and          t2, a0, s3
                  c.srli       a5, 29
                  csrrw        t0, 0x340, s10
                  or           s10, a5, s9
                  c.srli       a2, 10
                  slt          gp, s2, t2
                  srli         a3, s6, 18
                  mul          t0, s3, t0
                  xor          tp, a1, gp
                  sltu         s8, s7, a7
                  srli         t4, s10, 31
                  rem          t3, tp, s10
                  div          t0, zero, a2
                  c.addi16sp   sp, 112
                  c.add        s1, s0
                  mulhsu       ra, t2, t3
                  sltu         s4, s8, s7
                  c.nop
                  auipc        s6, 52477
                  mulh         s4, a7, t1
                  sltu         tp, s8, a4
                  divu         s6, zero, a3
                  c.addi16sp   sp, 16
                  c.li         s1, 29
                  lui          s2, 10024
                  c.addi       t5, -1
                  c.srai       a3, 27
                  c.mv         s9, a5
                  sub          t0, t4, s7
                  slti         a5, s1, -62
                  c.lui        a3, 20
                  andi         s6, t1, 1463
                  c.addi16sp   sp, -16
                  ori          s7, s0, 649
                  slti         a4, t4, 874
                  mulh         t3, a2, tp
                  c.nop
                  divu         s6, s8, s2
                  slti         s11, s2, 2035
                  c.and        a3, s1
                  sltiu        s10, s6, -1016
                  c.lui        s3, 20
                  slt          sp, s11, s8
                  c.li         s7, -1
                  c.addi4spn   s1, sp, 400
                  divu         s7, s8, s1
                  auipc        a4, 477609
                  srai         a5, s7, 4
                  nop
                  nop
                  c.slli       s8, 9
                  auipc        t5, 384250
                  slli         t3, t4, 28
                  csrrci       s1, 0x340, 0
                  csrrwi       s0, 0x340, 0
                  or           zero, a0, t0
                  srl          gp, s11, s9
                  nop
                  andi         s2, sp, -256
                  c.nop
                  csrrwi       sp, 0x340, 28
                  mulhu        s2, a1, sp
                  divu         s6, s8, s6
                  mulhu        tp, sp, t6
                  c.add        s5, s4
                  sra          s7, s10, a3
                  c.addi       s10, -1
                  c.srli       s0, 31
                  c.li         s4, -1
                  mul          a6, s4, s5
                  c.srai       s0, 17
                  slti         s6, t4, 1890
                  slt          s10, t5, s0
                  mul          sp, t3, s10
                  nop
                  xori         t0, zero, -538
                  div          s5, s3, t4
                  srl          s9, a7, tp
                  sltu         a7, t4, ra
                  c.or         a5, a3
                  c.lui        a7, 17
                  ori          a2, t2, -995
                  rem          a4, gp, s5
                  divu         sp, tp, ra
                  nop
                  xori         tp, a6, 1605
                  sub          s0, a0, s7
                  addi         sp, ra, 1949
                  c.nop
                  c.nop
                  lui          s3, 184006
                  xori         ra, a4, 676
                  c.li         t0, 8
                  xori         s11, zero, -113
                  slli         a4, t6, 4
                  slli         s9, t2, 1
                  srl          tp, s7, a1
                  c.mv         gp, s1
                  remu         a5, s2, ra
                  srl          s9, t3, s4
                  c.li         a2, 29
                  srli         s11, s11, 4
                  mulhu        s10, t6, s1
                  c.add        s0, a5
                  andi         a0, s0, -735
                  srli         s3, s11, 1
                  slli         tp, s1, 27
                  slt          a4, zero, tp
                  srai         s0, s0, 30
                  divu         tp, a1, a3
                  c.srai       a5, 28
                  sltu         t0, s3, s7
                  div          a4, s8, t2
                  c.slli       s5, 6
                  c.srli       s0, 2
                  c.addi16sp   sp, -16
                  c.sub        a5, s1
                  remu         s9, zero, t3
                  c.xor        s0, a1
                  divu         a5, zero, s9
                  add          t5, sp, a1
                  c.xor        a0, a4
                  c.addi       a6, 26
                  sltiu        gp, t1, -1254
                  div          t0, t5, s9
                  c.slli       a6, 1
                  sltu         t5, s3, sp
                  sltu         tp, s1, s1
                  and          s10, ra, zero
                  c.srai       a3, 16
                  c.addi16sp   sp, -16
                  addi         s7, s5, 346
                  remu         s4, s7, s1
                  srli         s7, s7, 30
                  sra          gp, s10, a3
                  lui          gp, 773634
                  c.and        s0, s0
                  xori         s10, t0, 861
                  c.addi16sp   sp, -16
                  remu         s8, sp, s4
                  csrrw        s0, 0x340, tp
                  ori          a2, s9, -66
                  nop
                  c.addi16sp   sp, -16
                  add          s9, s3, a2
                  c.mv         s4, ra
                  sub          s3, ra, zero
                  slt          t5, t2, sp
                  sltiu        t5, tp, -1258
                  srli         t3, a7, 17
                  sub          s11, t5, zero
                  c.nop
                  ori          t2, t3, 8
                  divu         zero, a2, t5
                  slti         gp, a7, -227
                  xori         a2, s8, -975
                  xor          a0, tp, t4
                  mulhu        s3, ra, a2
                  csrrs        s0, 0x340, zero
                  csrrs        t2, 0x340, a5
                  auipc        s3, 753806
                  c.mv         s9, s9
                  c.xor        s0, s0
                  mul          s10, gp, t4
                  c.li         sp, -1
                  csrrci       a3, 0x340, 0
                  csrrwi       sp, 0x340, 26
                  c.addi16sp   sp, -16
                  mulh         a4, ra, t1
                  ori          a5, a3, -1848
                  c.or         a0, a2
                  xor          s3, s2, a0
                  csrrc        s11, 0x340, zero
                  csrrw        t4, 0x340, s6
                  c.and        a5, a5
                  auipc        s2, 842704
                  auipc        t0, 95344
                  c.slli       s6, 28
                  c.and        s1, s0
                  c.sub        s0, a1
                  auipc        t3, 328934
                  mulh         t0, a7, tp
                  c.addi       s6, 3
                  slti         zero, s1, 2040
                  slti         s2, a5, 723
                  or           t0, t6, a4
                  csrrci       s9, 0x340, 22
                  remu         s9, sp, s8
                  mul          t3, s7, s7
                  c.or         a0, s1
                  srl          sp, a4, sp
                  c.addi       t3, 4
                  addi         a7, t4, 947
                  xor          t2, t5, s9
                  csrrsi       s8, 0x340, 0
                  sra          tp, a1, s2
                  add          t2, a5, a5
                  csrrw        s5, 0x340, a3
                  c.add        s6, t6
                  csrrwi       ra, 0x340, 16
                  c.or         a5, a0
                  c.sub        a0, a4
                  and          s11, a4, s11
                  csrrsi       tp, 0x340, 0
                  c.slli       t4, 11
                  csrrsi       a2, 0x340, 3
                  c.nop
                  c.xor        a0, a2
                  sltu         a6, a0, a3
                  sll          s0, s2, s9
                  csrrwi       t4, 0x340, 19
                  divu         ra, s7, a2
                  c.srli       a5, 10
                  sra          s8, s2, s1
                  c.mv         s4, s7
                  csrrci       a3, 0x340, 19
                  mul          a0, s1, t3
                  and          a0, s9, a1
                  sub          s6, s6, s1
                  mulhsu       s11, tp, t0
                  csrrci       s6, 0x340, 11
                  mulh         gp, tp, s0
                  csrrci       s5, 0x340, 0
                  c.addi4spn   a2, sp, 224
                  or           a5, s10, s3
                  xori         s7, t4, 1026
                  csrrc        t3, 0x340, s8
                  sra          ra, t0, t4
                  sltiu        ra, s3, -1996
                  mulh         ra, s11, zero
                  csrrci       a4, 0x340, 0
                  c.xor        a0, a2
                  csrrs        a5, 0x340, s5
                  c.xor        a3, a4
                  srli         t2, s3, 28
                  xor          s1, s10, t4
                  and          zero, s4, t5
                  csrrc        a2, 0x340, s2
                  mulhu        s2, zero, s5
                  mul          t3, s4, gp
                  sltu         s4, t2, a2
                  mulhsu       s1, t1, a0
                  c.nop
                  nop
                  slt          t2, a4, ra
                  srl          s5, a6, a4
                  c.slli       ra, 10
                  c.addi4spn   a2, sp, 896
                  add          a5, s4, a1
                  sltiu        s3, a3, -578
                  and          tp, tp, a0
                  c.addi4spn   a4, sp, 736
                  slt          a4, s1, a1
                  srl          t4, a6, a1
                  c.xor        s1, s0
                  c.andi       a4, -1
                  csrrc        s10, 0x340, zero
                  csrrc        s6, 0x340, t5
                  xori         a3, a5, -231
                  c.or         a3, a0
                  mulhu        s8, s0, s5
                  c.sub        a3, a0
                  addi         a2, gp, -173
                  c.lui        a0, 4
                  and          s3, s3, s8
                  sltiu        t5, a6, 361
                  c.addi4spn   a5, sp, 928
                  csrrw        t5, 0x340, t3
                  div          s2, s6, ra
                  rem          s3, gp, sp
                  c.sub        a2, s1
                  c.lui        t2, 22
                  c.nop
                  sub          s6, s1, a7
                  and          s2, t6, s5
                  c.add        s11, a6
                  lui          t2, 883180
                  srai         s6, s9, 7
                  div          zero, a0, t3
                  slt          tp, a1, tp
                  c.lui        s7, 28
                  c.andi       a2, 2
                  c.srai       a4, 5
                  nop
                  mulhu        t5, t6, t6
                  xori         s0, a5, 2022
                  mulh         s7, s8, ra
                  c.add        a7, a4
                  sltiu        sp, s7, -1954
                  c.addi4spn   a3, sp, 416
                  csrrw        a6, 0x340, s8
                  sltu         s11, t2, a3
                  divu         a3, zero, a0
                  c.and        s0, a2
                  sub          s8, s11, a0
                  xor          sp, s6, s0
                  divu         s8, s3, a2
                  or           s6, s7, s3
                  srai         a0, s8, 5
                  div          t3, s7, s10
                  srai         s5, s2, 12
                  c.slli       s10, 16
                  mulhu        a2, a4, s3
                  csrrw        t2, 0x340, t5
                  mulhsu       s7, s6, t1
                  slli         s4, s10, 24
                  c.li         a2, -1
                  csrrwi       a6, 0x340, 11
                  lui          s5, 101039
                  andi         t2, tp, -267
                  xori         t0, t5, 1853
                  c.and        a3, a1
                  csrrs        t0, 0x340, zero
                  divu         t3, a4, s7
                  c.or         a0, a0
                  c.slli       a7, 17
                  sltu         t5, s0, t6
                  c.li         s11, -1
                  c.slli       s6, 23
                  csrrc        gp, 0x340, t2
                  c.andi       s1, 19
                  c.or         s0, a1
                  div          tp, sp, s2
                  or           s7, a1, a2
                  remu         ra, t0, t6
                  slli         s6, s3, 30
                  mulhsu       t2, a1, s11
                  csrrs        gp, 0x340, zero
                  c.or         s1, a4
                  auipc        s0, 232488
                  srl          s5, tp, a3
                  c.srli       a3, 5
                  csrrs        t0, 0x340, zero
                  c.and        a2, a1
                  csrrc        a6, 0x340, s3
                  andi         t4, a4, -1489
                  sub          s2, s11, s1
                  c.slli       t5, 7
                  div          s0, t5, tp
                  c.addi4spn   s1, sp, 240
                  slli         t2, s10, 6
                  c.andi       a3, -1
                  addi         s0, t2, -1020
                  xori         a2, s6, 1102
                  srai         s6, a6, 20
                  mulhsu       a2, s1, t3
                  ori          s9, a0, 1869
                  c.srli       s1, 12
                  c.srai       s1, 4
                  mulhsu       s6, s4, t6
                  c.sub        s0, a0
                  csrrs        t3, 0x340, zero
                  mulhu        sp, a1, t3
                  c.srli       s0, 15
                  c.mv         sp, a7
                  c.or         a3, a1
                  div          s6, s1, s6
                  c.addi4spn   a5, sp, 656
                  c.addi4spn   a3, sp, 816
                  c.srli       a5, 8
                  mulhsu       t3, a1, a4
                  sltu         a5, s0, s0
                  xor          a3, s8, t4
                  c.lui        s5, 23
                  c.xor        a0, a4
                  auipc        gp, 794201
                  divu         sp, a5, t4
                  c.srai       a0, 27
                  c.addi4spn   s0, sp, 32
                  c.mv         s0, a7
                  c.slli       s4, 26
                  auipc        a4, 815271
                  csrrsi       s1, 0x340, 0
                  slti         t5, t6, 1202
                  c.srai       a0, 24
                  divu         s7, s6, s7
                  andi         zero, s11, -1089
                  slt          a0, a6, s9
                  c.nop
                  mulh         s4, t4, s4
                  ori          t0, ra, 1512
                  xori         t3, a5, -1656
                  srli         s10, s5, 25
                  sltiu        s8, t3, 1022
                  mulhu        zero, t2, t4
                  mulhu        s10, t6, a2
                  and          a7, t5, s4
                  c.srli       a0, 1
                  csrrsi       s5, 0x340, 3
                  c.xor        a0, a5
                  sra          s3, s10, sp
                  c.addi16sp   sp, -16
                  sub          t2, a4, s5
                  remu         s3, s11, a3
                  sll          t4, s8, s1
                  sll          s2, t4, s3
                  c.lui        gp, 10
                  srai         a2, s9, 15
                  xor          s9, a4, gp
                  slt          s7, s4, s9
                  csrrci       s10, 0x340, 0
                  sub          a7, t0, a6
                  c.addi16sp   sp, 128
                  c.nop
                  sltiu        a5, t6, -75
                  c.sub        s1, a3
                  c.add        tp, a7
                  c.andi       a4, 4
                  sltu         s4, s7, t1
                  c.li         s1, 1
                  c.addi       t4, -1
                  and          t5, s10, a0
                  csrrci       s3, 0x340, 8
                  add          s9, t3, gp
                  divu         s8, a5, t6
                  c.lui        a0, 24
                  csrrw        t3, 0x340, ra
                  csrrci       a4, 0x340, 23
                  c.lui        a2, 30
                  rem          gp, sp, s2
                  addi         s11, a2, -1676
                  csrrw        s4, 0x340, a7
                  c.andi       a3, 2
                  and          t3, s11, t1
                  c.addi16sp   sp, -16
                  divu         t4, ra, t6
                  csrrc        s10, 0x340, zero
                  auipc        s5, 126818
                  nop
                  or           s9, s9, t3
                  ori          t4, s2, -39
                  sltiu        s1, t4, -1146
                  c.sub        s1, a3
                  xor          s10, t3, s11
                  csrrs        s4, 0x340, s3
                  sltiu        s5, s8, -1805
                  sub          t2, s5, s0
                  mulhu        a3, t1, a6
                  c.slli       tp, 7
                  or           s9, a0, s11
                  c.lui        s7, 1
                  c.addi       s11, 24
                  c.slli       s4, 29
                  addi         a2, s2, -593
                  csrrwi       s9, 0x340, 24
                  c.and        a5, a5
                  c.lui        a5, 25
                  csrrwi       s9, 0x340, 4
                  add          s1, s4, t3
                  c.addi       s5, 29
                  srli         s10, s1, 31
                  remu         s6, a4, t1
                  mulh         a2, t1, a0
                  divu         t2, a3, a2
                  mulhsu       t4, sp, s8
                  rem          a2, zero, zero
                  mulhsu       a5, a7, t1
                  csrrs        t0, 0x340, s10
                  divu         tp, a5, s10
                  xori         t3, a7, -42
                  sub          a5, a7, t1
                  andi         zero, s0, 1083
                  add          a7, s7, t6
                  c.addi4spn   a0, sp, 192
                  add          s1, s5, a1
                  xori         a7, t0, 659
                  srli         a3, s4, 17
                  slti         s10, a3, 296
                  c.slli       tp, 25
                  sll          s3, s8, t6
                  ori          s2, t5, -1306
                  remu         t0, t1, s11
                  lui          a0, 125250
                  lui          tp, 624757
                  remu         a4, t1, t2
                  and          a5, t2, a3
                  remu         tp, gp, s0
                  mulhu        s3, a4, gp
                  remu         a5, ra, t3
                  c.li         t4, -1
                  c.srai       a0, 16
                  c.addi       s9, -1
                  and          zero, s1, s10
                  sra          s1, t2, a6
                  c.srli       a5, 20
                  sltiu        sp, s2, 547
                  c.li         s7, -1
                  andi         s10, t3, 1077
                  auipc        a3, 461086
                  sltiu        t4, s11, 648
                  mulhsu       t2, s5, t3
                  csrrci       a2, 0x340, 14
                  csrrs        s7, 0x340, zero
                  ori          t0, a4, 1292
                  csrrs        s11, 0x340, a7
                  c.li         gp, 30
                  xor          s10, s11, a4
                  c.li         s2, -1
                  c.mv         ra, s5
                  mul          a3, s8, sp
                  mulh         t3, t2, a1
                  rem          s5, ra, s10
                  c.sub        a0, s1
                  c.andi       a4, -1
                  remu         a2, s9, s11
                  srl          a0, zero, s2
                  csrrc        t5, 0x340, zero
                  c.lui        s9, 15
                  lui          a7, 81367
                  mul          s11, a6, s0
                  srli         s6, a1, 7
                  c.srli       a0, 17
                  divu         s4, a0, s9
                  xor          sp, s8, t4
                  c.andi       s1, -1
                  or           a0, t1, t1
                  andi         s11, a4, -1837
                  c.add        sp, a0
                  c.addi16sp   sp, -16
                  srl          ra, t2, s11
                  srl          t5, zero, a3
                  c.li         s3, 2
                  mul          a3, gp, s3
                  divu         s5, ra, t1
                  xor          s2, a0, t2
                  addi         sp, t5, 1144
                  rem          ra, t6, s0
                  c.slli       a4, 31
                  csrrs        a6, 0x340, zero
                  mulh         s3, ra, a7
                  auipc        s4, 628867
                  srli         tp, a6, 0
                  or           s1, s8, t4
                  csrrsi       t0, 0x340, 20
                  remu         s9, t0, tp
                  c.nop
                  mulhu        zero, s7, sp
                  sltu         t4, s8, t5
                  c.slli       ra, 27
                  nop
                  remu         a7, s4, a5
                  sra          s1, t3, t2
                  rem          t5, a2, a2
                  c.xor        a5, a2
                  andi         t2, s9, -992
                  c.addi16sp   sp, -16
                  c.mv         s1, s3
                  c.srli       s0, 9
                  c.xor        a4, a0
                  srl          t4, a1, a7
                  srai         s5, t1, 7
                  and          ra, s10, t0
                  c.srli       a4, 8
                  slti         t2, s0, -1778
                  or           s4, s6, a7
                  div          s0, s1, a7
                  slti         a0, gp, -1163
                  slti         s6, a1, 1821
                  addi         ra, t4, 1380
                  c.andi       s1, -1
                  slt          s10, t4, gp
                  div          t5, t0, a7
                  addi         s3, t3, -409
                  csrrs        t0, 0x340, zero
                  csrrc        s4, 0x340, s4
                  slti         s11, t2, 1622
                  slli         a5, a0, 4
                  slti         a6, t2, -1294
                  csrrci       s11, 0x340, 0
                  div          s3, gp, s9
                  sll          ra, a5, a3
                  or           s8, s3, a5
                  lui          a6, 82352
                  sltu         a6, s6, s1
                  remu         tp, t0, t4
                  mulhsu       t2, s4, s3
                  mulh         s4, s1, a1
                  sra          zero, s4, s2
                  srli         t5, a0, 16
                  slli         s3, t3, 28
                  srl          a6, a2, s11
                  csrrci       a7, 0x340, 13
                  div          s0, t0, a7
                  sltiu        s4, sp, 1959
                  c.addi4spn   a4, sp, 800
                  c.addi16sp   sp, 368
                  c.lui        t2, 31
                  xor          a3, gp, a2
                  slti         t4, a5, 1950
                  sltiu        a2, tp, -967
                  or           s11, t6, t1
                  mul          a3, a6, sp
                  sub          s2, s7, s8
                  remu         gp, t6, s4
                  sltu         a7, s3, s4
                  c.mv         a6, a7
                  mulh         t2, t0, t6
                  srai         s9, a7, 30
                  srl          s3, s4, sp
                  c.srai       a4, 16
                  c.nop
                  slti         a3, t4, 966
                  c.slli       a4, 14
                  addi         s5, s4, -894
                  ori          s9, a4, -168
                  slli         sp, t2, 24
                  c.nop
                  lui          ra, 923733
                  slli         sp, t0, 13
                  remu         a5, tp, a1
                  c.nop
                  mulh         a0, zero, a5
                  sltu         s9, s9, s2
                  ori          s9, s5, 1329
                  c.li         a7, -1
                  and          s9, t1, t4
                  c.and        a4, a5
                  c.sub        s1, a3
                  sll          a4, s4, s4
                  mul          ra, t6, t0
                  c.addi16sp   sp, 256
                  sub          t2, a2, tp
                  slli         s7, t6, 31
                  sub          s3, sp, a4
                  slti         a0, t0, 205
                  lui          s1, 834884
                  csrrw        a0, 0x340, sp
                  and          a6, s5, a6
                  remu         ra, s9, s8
                  addi         a3, s5, 1519
                  lui          t4, 27728
                  srai         t2, t4, 14
                  srai         a3, a7, 11
                  c.addi16sp   sp, -16
                  c.srli       a5, 22
                  c.addi       a2, -1
                  sltiu        a6, a4, -1174
                  mulhsu       t0, a1, a4
                  divu         gp, sp, s0
                  remu         a4, t4, sp
                  mul          sp, tp, ra
                  rem          s11, gp, a1
                  sub          t4, t1, ra
                  srl          zero, t0, a4
                  c.srli       a4, 11
                  csrrc        s7, 0x340, s9
                  xori         tp, t0, 1469
                  csrrwi       s11, 0x340, 11
                  sub          t2, s5, a0
                  rem          sp, s0, a2
                  mul          s3, a3, a7
                  c.slli       a6, 17
                  csrrw        t2, 0x340, a5
                  c.lui        a6, 1
                  mulhsu       a3, a4, a2
                  andi         ra, a3, 1440
                  c.addi4spn   s0, sp, 912
                  slti         a7, s11, 1276
                  csrrwi       s6, 0x340, 10
                  mul          t5, s2, a4
                  mul          s10, a1, t6
                  andi         ra, a4, 1010
                  sltiu        t2, s8, -128
                  c.addi       t3, -1
                  mulhsu       s2, t0, a4
                  div          s8, t4, s9
                  c.sub        a0, a4
                  nop
                  remu         a5, a4, s7
                  c.or         s0, a2
                  csrrci       a2, 0x340, 0
                  csrrwi       a2, 0x340, 18
                  csrrci       s1, 0x340, 0
                  c.slli       s2, 18
                  srl          a7, s1, t4
                  mulhsu       s1, sp, a0
                  csrrwi       s10, 0x340, 20
                  c.srai       a5, 3
                  srli         zero, s0, 4
                  auipc        s3, 607723
                  or           s1, a2, tp
                  c.lui        a5, 6
                  slli         zero, s3, 21
                  sra          a7, t1, s4
                  slli         a5, s0, 18
                  c.mv         s9, t1
                  c.addi4spn   s1, sp, 192
                  slli         s1, a2, 9
                  add          ra, t3, s9
                  rem          t3, a1, a7
                  addi         sp, a6, -963
                  csrrc        t4, 0x340, tp
                  andi         a6, s5, -842
                  csrrc        t2, 0x340, zero
                  csrrwi       a7, 0x340, 1
                  xori         s9, s6, -1103
                  c.addi16sp   sp, 80
                  and          a6, sp, a2
                  xor          s4, gp, t0
                  div          s1, a6, t1
                  c.add        s2, a2
                  mulhu        a3, s8, s8
                  sltu         a3, t6, s8
                  csrrw        a6, 0x340, t1
                  lui          s6, 555940
                  remu         t0, s11, zero
                  c.nop
                  sra          s1, t5, t5
                  div          s1, gp, t0
                  xor          s8, s9, a1
                  csrrwi       tp, 0x340, 3
                  csrrc        a7, 0x340, s6
                  auipc        s9, 686722
                  xori         s8, a6, -1692
                  mulh         a0, s7, t4
                  c.or         s0, a2
                  csrrs        s5, 0x340, t1
                  c.andi       a2, -1
                  c.add        s9, a3
                  c.sub        a3, a3
                  andi         a6, s10, -233
                  slli         t0, t0, 25
                  slt          a7, a3, a5
                  c.addi       s11, -1
                  or           s5, a0, s2
                  ori          a2, s1, 1142
                  c.addi4spn   s0, sp, 864
                  sltiu        s3, t3, 945
                  mulhu        a6, sp, a6
                  c.andi       s0, 1
                  lui          s5, 844954
                  csrrc        s3, 0x340, s4
                  mul          t0, t5, s10
                  auipc        s2, 533195
                  sub          s7, t6, a1
                  and          a0, t3, a2
                  sll          s8, t5, gp
                  mulh         sp, s8, s2
                  addi         t4, s1, -202
                  lui          ra, 1011601
                  csrrwi       ra, 0x340, 1
                  srai         a4, s1, 8
                  div          a3, s4, t4
                  c.nop
                  sra          s4, s5, s5
                  csrrc        s0, 0x340, zero
                  divu         t0, tp, s8
                  csrrwi       s7, 0x340, 16
                  c.srli       a4, 29
                  mulh         s8, s3, a3
                  lui          a6, 73033
                  srl          sp, s8, zero
                  xor          s9, a7, s4
                  slti         a3, a3, -1286
                  csrrci       a4, 0x340, 12
                  or           s11, tp, zero
                  csrrs        gp, 0x340, zero
                  c.andi       a0, 22
                  divu         s9, s8, s0
                  sltiu        t3, s6, -1456
                  slti         zero, a5, -1012
                  c.mv         s10, s11
                  c.addi4spn   a0, sp, 960
                  and          t4, s11, t5
                  div          s5, tp, s0
                  sltiu        gp, s10, 1693
                  c.addi16sp   sp, -16
                  sltu         s8, t6, a5
                  c.nop
                  c.addi       s0, -1
                  c.slli       s1, 13
                  sub          s9, sp, t0
                  c.addi       s5, -1
                  sltiu        a6, ra, 1613
                  csrrwi       s0, 0x340, 28
                  remu         a5, s0, s1
                  auipc        t4, 1010147
                  c.or         a3, a1
                  csrrc        a2, 0x340, zero
                  mul          t5, s8, s10
                  slti         s5, s8, -434
                  sub          s7, a0, s3
                  nop
                  nop
                  mulhsu       s3, s8, s4
                  csrrsi       gp, 0x340, 13
                  c.mv         a6, s10
                  xor          zero, t1, a3
                  mulhsu       sp, s8, t2
                  c.slli       a7, 24
                  xor          sp, s7, ra
                  mul          s5, t6, t3
                  sub          t4, t3, a3
                  c.andi       s0, 5
                  c.nop
                  c.and        s0, s1
                  rem          s8, s3, t2
                  c.or         a4, s0
                  c.srai       a2, 1
                  srli         sp, t2, 13
                  c.andi       a5, -1
                  c.srli       a0, 30
                  c.lui        a0, 28
                  lui          s4, 442106
                  or           a2, s5, tp
                  c.li         gp, -1
                  or           a3, a5, a1
                  c.xor        a0, a1
                  or           t4, s0, gp
                  c.lui        t5, 30
                  c.lui        ra, 25
                  rem          s11, s7, a7
                  c.slli       a3, 30
                  c.addi16sp   sp, 320
                  and          a3, t1, t5
                  lui          a6, 523621
                  ori          s11, gp, -858
                  sltu         s6, t5, a5
                  c.and        s1, s0
                  add          s8, s11, s1
                  csrrw        a6, 0x340, s8
                  c.andi       s0, 0
                  c.andi       a5, -1
                  csrrsi       s9, 0x340, 0
                  mul          gp, s6, s11
                  csrrsi       ra, 0x340, 28
                  andi         t4, ra, 585
                  csrrci       tp, 0x340, 19
                  sltiu        a2, s11, -829
                  xor          a5, gp, s5
                  and          a3, s9, tp
                  xori         t3, s7, -343
                  mulh         t3, sp, s0
                  mulhu        t5, t5, a2
                  c.nop
                  c.mv         s4, s3
                  csrrc        s4, 0x340, zero
                  c.slli       s5, 24
                  div          s11, t4, s3
                  c.lui        a4, 6
                  srli         s1, gp, 8
                  ori          gp, zero, 1613
                  add          s6, a7, ra
                  c.srai       a2, 9
                  sltu         t2, s2, ra
                  and          s8, s10, s0
                  andi         zero, a7, -166
                  c.srai       s1, 23
                  c.addi       s7, -1
                  csrrwi       s0, 0x340, 10
                  mulh         s5, s9, s0
                  c.or         s0, a4
                  c.srai       a5, 28
                  srl          s2, a3, tp
                  c.and        a5, s1
                  c.addi16sp   sp, -16
                  c.and        a4, a5
                  xori         a7, s4, -792
                  or           s7, a5, gp
                  c.addi4spn   a4, sp, 336
                  xori         s11, s1, 1003
                  csrrc        s2, 0x340, zero
                  c.lui        s0, 16
                  c.srli       a5, 18
                  ori          s6, t1, -1075
                  remu         s7, s8, s11
                  c.nop
                  mulhu        a2, gp, a5
                  xor          a2, gp, gp
                  divu         sp, a4, s1
                  div          a2, t3, a7
                  sra          t4, s8, s1
                  csrrci       s4, 0x340, 0
                  slt          s4, ra, s0
                  ori          a7, zero, 463
                  xor          s7, t1, s6
                  slli         a3, t3, 14
                  add          a0, s10, sp
                  c.nop
                  csrrs        s9, 0x340, zero
                  c.mv         tp, t5
                  andi         t0, t1, 1376
                  divu         s8, a1, s7
                  mulhu        t5, gp, t1
                  csrrwi       t4, 0x340, 17
                  srli         t4, a1, 19
                  divu         a0, s2, a2
                  sra          zero, t2, s11
                  andi         a2, a4, -583
                  slli         a7, s8, 15
                  csrrc        s11, 0x340, zero
                  andi         a4, s4, -66
                  c.addi       ra, -1
                  lui          s5, 821472
                  div          s8, s9, s2
                  nop
                  csrrci       ra, 0x340, 0
                  divu         s6, tp, sp
                  c.nop
                  csrrci       a2, 0x340, 8
                  sltiu        s3, a0, -625
                  c.or         s0, a5
                  c.mv         a4, t3
                  add          s1, t5, a7
                  c.or         a2, a1
                  csrrs        t4, 0x340, zero
                  c.or         s0, a2
                  csrrci       t2, 0x340, 0
                  c.addi16sp   sp, 96
                  ori          s8, s1, -459
                  c.addi16sp   sp, 96
                  or           s10, s6, s11
                  addi         tp, s11, -1019
                  c.srli       s1, 16
                  csrrwi       s0, 0x340, 27
                  mul          s0, a4, s11
                  sub          s9, a1, s9
                  srli         a4, t6, 20
                  sltu         s9, sp, t0
                  mul          s7, a6, a5
                  c.addi4spn   a3, sp, 816
                  add          s10, a1, a5
                  slt          a7, t2, a0
                  c.nop
                  divu         t3, a7, s6
                  csrrs        s8, 0x340, zero
                  mulh         s5, s6, gp
                  c.lui        a7, 11
                  csrrs        t4, 0x340, s10
                  xori         a7, ra, 1816
                  c.addi4spn   a2, sp, 576
                  c.addi4spn   a2, sp, 304
                  and          zero, t6, s4
                  lui          s1, 880982
                  divu         a3, a4, s5
                  csrrwi       s9, 0x340, 29
                  csrrw        t4, 0x340, gp
                  auipc        s4, 423270
                  srai         a7, a6, 10
                  csrrwi       a2, 0x340, 9
                  srl          s1, tp, s4
                  csrrci       a4, 0x340, 0
                  c.xor        a5, s0
                  mulhu        s6, a4, sp
                  andi         t2, a3, -1813
                  c.addi16sp   sp, -16
                  nop
                  c.nop
                  sub          gp, a4, t2
                  add          gp, s2, s4
                  slt          s5, a5, t4
                  csrrci       sp, 0x340, 3
                  csrrs        s1, 0x340, zero
                  and          a5, sp, a0
                  sltiu        gp, s1, -1313
                  srli         s0, t1, 19
                  divu         tp, s1, a7
                  csrrw        s2, 0x340, s3
                  auipc        a7, 984952
                  c.nop
                  div          a7, sp, a4
                  c.addi       a7, -1
                  xor          s9, s8, a5
                  c.nop
                  c.mv         t0, s2
                  c.and        a2, a0
                  slti         a3, t4, 1856
                  lui          a6, 763520
                  c.nop
                  sltu         s11, ra, a6
                  c.srai       a4, 3
                  c.nop
                  sra          zero, a0, t2
                  c.slli       ra, 14
                  mul          a4, a2, a0
                  c.mv         s5, s10
                  c.slli       ra, 6
                  mulhu        a5, s1, s1
                  csrrc        t4, 0x340, s2
                  sltiu        t3, a4, -738
                  sltu         a0, ra, a6
                  divu         t0, a5, a6
                  c.slli       s10, 4
                  sltiu        s4, a2, -445
                  srli         s7, s11, 7
                  c.srai       a4, 12
                  and          t0, t1, a6
                  slli         a2, a2, 0
                  xori         a7, s8, 1221
                  c.slli       t4, 12
                  c.srli       a2, 2
                  addi         t0, a4, 776
                  xori         ra, a3, -859
                  sltu         s4, s10, a6
                  mulhsu       s7, gp, s8
                  srai         t0, a6, 4
                  c.addi       s6, 4
                  c.slli       a4, 17
                  srl          s0, a2, a1
                  xor          t5, s7, a1
                  c.andi       a0, 19
                  mulhu        sp, a2, t6
                  lui          a0, 174675
                  sll          s1, s2, ra
                  auipc        s6, 376313
                  c.addi16sp   sp, -16
                  slti         t0, a0, -1577
                  c.add        a5, s5
                  slt          s0, a6, s10
                  csrrci       a3, 0x340, 0
                  c.addi       t5, -1
                  c.addi16sp   sp, -16
                  auipc        gp, 975339
                  and          s8, t1, a7
                  c.sub        a5, a0
                  slti         s10, s11, -444
                  or           a7, s4, s3
                  sltiu        s3, ra, -1031
                  c.sub        s1, a2
                  csrrc        t5, 0x340, a0
                  csrrci       a7, 0x340, 0
                  xori         s3, s2, 36
                  mulh         a4, t6, t2
                  sub          a2, a1, a2
                  c.or         a0, a5
                  csrrwi       s10, 0x340, 22
                  c.mv         gp, t3
                  c.xor        a3, s1
                  mulhsu       a5, s6, a1
                  c.and        s1, a1
                  c.xor        a2, a1
                  mul          t5, s4, t3
                  c.srai       s1, 20
                  c.or         a0, a1
                  c.xor        s1, a0
                  csrrw        a4, 0x340, s3
                  add          t0, sp, t4
                  sub          s5, sp, a0
                  c.li         s7, -1
                  srai         ra, s4, 6
                  lui          ra, 504713
                  c.andi       a0, -1
                  c.addi4spn   a5, sp, 64
                  divu         s11, s7, a7
                  divu         a3, a2, t4
                  srai         a4, a1, 22
                  c.or         s0, s1
                  srli         s11, a3, 17
                  c.addi4spn   a4, sp, 560
                  mulhsu       a2, tp, s0
                  xori         a7, s10, -127
                  c.nop
                  nop
                  lui          a2, 423727
                  divu         a6, sp, tp
                  andi         a5, s6, 679
                  csrrsi       ra, 0x340, 0
                  divu         tp, t3, t6
                  div          a7, s8, a1
                  csrrwi       a0, 0x340, 24
                  sltiu        s4, t4, -1581
                  mulh         s4, s5, t0
                  mulhsu       t3, sp, t6
                  c.lui        a5, 28
                  csrrwi       ra, 0x340, 29
                  csrrci       t2, 0x340, 0
                  c.andi       a4, 12
                  srli         sp, a6, 25
                  mulh         s11, s0, a0
                  c.sub        a3, a0
                  slti         t5, a6, 1034
                  div          t2, a6, s9
                  sra          tp, gp, a3
                  srli         s8, a5, 8
                  slt          a0, s10, sp
                  mulhsu       t5, t4, t5
                  mulhu        a0, t2, t2
                  c.mv         tp, s11
                  c.li         a5, -1
                  c.li         s0, 6
                  c.addi       a5, 20
                  csrrw        s9, 0x340, s5
                  auipc        a4, 482167
                  addi         s10, a3, -1496
                  c.addi       s1, -1
                  xor          s7, s6, a5
                  and          s11, a4, a4
                  csrrwi       gp, 0x340, 17
                  addi         sp, s8, 1390
                  c.addi       s11, -1
                  c.and        s0, a4
                  srli         tp, ra, 21
                  sll          gp, s3, s7
                  sll          s8, t1, t6
                  c.lui        s5, 30
                  csrrc        t3, 0x340, zero
                  csrrsi       a2, 0x340, 0
                  srl          sp, s10, a1
                  remu         s11, s7, sp
                  mul          zero, s0, t6
                  add          t0, gp, s6
                  mulhu        s9, a1, a4
                  c.addi       s0, -1
                  csrrsi       s9, 0x340, 0
                  csrrs        t5, 0x340, zero
                  c.or         s0, a5
                  c.andi       a0, -1
                  c.and        a5, a4
                  c.li         t2, -1
                  or           s10, gp, t3
                  c.li         s1, -1
                  slli         t0, t2, 2
                  mulhu        t0, a5, s8
                  c.slli       a0, 5
                  c.and        a0, a4
                  lui          s9, 914878
                  c.addi       a3, 12
                  mul          s1, s10, t3
                  c.li         a5, 23
                  addi         a3, s9, -698
                  c.nop
                  csrrwi       a0, 0x340, 23
                  lui          s6, 745333
                  c.add        s7, a4
                  div          s1, s7, a5
                  remu         s5, s7, t5
                  auipc        ra, 53071
                  andi         a6, sp, -926
                  c.xor        a0, s1
                  mulhu        s1, a4, ra
                  sll          s11, a7, s1
                  c.or         a0, a5
                  sra          s3, s5, s11
                  c.srli       a5, 16
                  c.li         t3, -1
                  srli         s11, s5, 22
                  csrrw        t2, 0x340, s10
                  sra          s11, s6, t0
                  and          s6, s4, a6
                  lui          s9, 470124
                  auipc        s10, 290055
                  c.xor        s1, a2
                  remu         s3, s2, a2
                  c.srai       s0, 15
                  c.sub        a2, a2
                  lui          zero, 101566
                  c.li         a3, -1
                  csrrs        t3, 0x340, s6
                  c.xor        a4, s0
                  slli         gp, t5, 29
                  sltiu        s10, gp, 1934
                  csrrci       s0, 0x340, 0
                  srl          a7, s8, a5
                  rem          ra, a6, a3
                  csrrwi       tp, 0x340, 3
                  csrrsi       s7, 0x340, 25
                  csrrwi       a3, 0x340, 28
                  c.addi4spn   a0, sp, 896
                  sll          t2, s10, s0
                  csrrw        a7, 0x340, s2
                  c.andi       a4, -1
                  csrrw        s8, 0x340, s4
                  slt          t0, ra, s3
                  c.andi       s0, 6
                  remu         s4, s3, tp
                  add          a5, t3, s8
                  c.andi       a5, -1
                  sltiu        sp, a0, 988
                  mulh         s9, zero, s8
                  andi         t0, s4, -1857
                  div          gp, t4, s1
                  srl          a7, t5, t5
                  c.srai       a3, 22
                  sub          zero, a0, s5
                  csrrwi       ra, 0x340, 25
                  c.addi16sp   sp, -16
                  mulhu        s3, s11, a1
                  rem          s1, zero, a2
                  or           s4, s0, a1
                  c.add        s2, s10
                  c.addi       s5, -1
                  csrrci       a0, 0x340, 0
                  c.sub        a2, a1
                  mulhu        zero, s3, t3
                  nop
                  slli         s8, t4, 26
                  rem          gp, t0, tp
                  c.sub        a3, a4
                  mulhsu       s4, s2, t5
                  c.nop
                  c.xor        a2, a3
                  csrrw        s8, 0x340, a5
                  c.add        s8, a7
                  c.nop
                  ori          s3, a1, 1604
                  c.andi       a2, -1
                  divu         t4, a5, s8
                  c.srli       s1, 14
                  mulhu        s5, s4, sp
                  c.xor        a4, s1
                  csrrs        a7, 0x340, zero
                  slti         s10, t6, 1804
                  divu         s7, a2, t5
                  lui          s1, 517109
                  c.addi4spn   a4, sp, 368
                  slti         s8, s2, -432
                  remu         a3, t6, s10
                  csrrsi       a6, 0x340, 0
                  c.or         a3, a5
                  slt          s9, t1, s8
                  csrrc        ra, 0x340, ra
                  mul          s0, s6, t1
                  lui          a7, 698623
                  lui          sp, 762101
                  nop
                  c.addi       ra, -1
                  c.or         s1, a5
                  and          a4, a4, t4
                  csrrsi       sp, 0x340, 0
                  sltu         tp, s2, t2
                  slti         s5, a5, -1412
                  slti         ra, t0, -1940
                  srl          t0, a1, t4
                  csrrc        gp, 0x340, t6
                  srai         gp, t1, 11
                  srli         s4, t1, 1
                  and          s9, t4, zero
                  sub          t5, s9, sp
                  sltiu        s6, s4, 1480
                  csrrwi       a4, 0x340, 2
                  mul          t4, s1, tp
                  add          a3, a4, t3
                  c.srai       a0, 16
                  lui          gp, 914844
                  sll          t5, a3, t5
                  mulh         s7, t3, s6
                  ori          gp, s11, 1288
                  csrrwi       tp, 0x340, 16
                  mulhsu       s4, s7, s3
                  c.srai       s1, 24
                  c.srli       a0, 10
                  nop
                  mulhu        s3, ra, ra
                  ori          a6, s3, -1978
                  sltu         s7, s3, zero
                  slli         s5, gp, 24
                  divu         s0, t5, t6
                  divu         gp, t3, a7
                  c.lui        s4, 19
                  csrrsi       gp, 0x340, 12
                  c.and        a0, a5
                  csrrc        t3, 0x340, a4
                  nop
                  rem          s10, s11, a3
                  addi         s5, s5, -1008
                  sub          t5, a5, s0
                  c.lui        a2, 16
                  sltu         a6, a4, sp
                  c.mv         s0, s1
                  csrrs        t4, 0x340, zero
                  div          a6, s6, s3
                  slt          gp, a7, ra
                  c.slli       s5, 26
                  c.addi       a4, -1
                  slt          s8, a4, a4
                  addi         a6, a4, -1448
                  c.nop
                  csrrci       a4, 0x340, 2
                  and          s0, t0, t4
                  xori         s7, t2, 934
                  c.slli       s7, 5
                  div          s4, s5, t3
                  slti         t5, s6, 1884
                  srai         t5, s0, 31
                  slt          a5, t3, ra
                  c.addi       ra, 22
                  csrrc        a0, 0x340, zero
                  c.and        a0, a1
                  csrrw        sp, 0x340, t6
                  srl          s5, tp, sp
                  c.mv         a5, a7
                  sra          t2, a7, t4
                  sll          a0, s4, a5
                  mulh         a6, t0, a6
                  c.srai       a3, 4
                  c.xor        a4, s1
                  c.li         gp, -1
                  div          s2, s2, a5
                  div          s2, a3, a0
                  xori         s9, s7, -138
                  mulhu        a4, t5, s0
                  c.addi16sp   sp, 160
                  c.mv         t4, s7
                  c.xor        a4, a2
                  nop
                  c.srli       a3, 18
                  c.li         s1, 23
                  sltiu        s1, s10, 1086
                  c.sub        a5, a0
                  nop
                  sltu         s3, gp, s5
                  sltu         a2, s11, s11
                  c.mv         s9, s10
                  c.lui        t4, 25
                  rem          s5, t0, a6
                  c.lui        a3, 8
                  c.or         a0, a3
                  csrrw        t3, 0x340, s9
                  addi         s6, t4, -1466
                  csrrsi       a4, 0x340, 0
                  c.and        a3, a0
                  c.or         a3, s0
                  c.sub        a5, a5
                  lui          t3, 772240
                  csrrwi       a7, 0x340, 5
                  csrrc        t0, 0x340, zero
                  sltu         s0, tp, gp
                  sltu         a0, a3, s4
                  c.add        s9, s7
                  csrrc        s3, 0x340, zero
                  lui          s4, 624952
                  slli         a7, t6, 24
                  mulh         t2, tp, zero
                  xori         sp, a2, 265
                  c.add        s7, a6
                  c.lui        s4, 4
                  mulhsu       s2, t5, a4
                  xor          s11, t0, t3
                  mulhu        a3, a0, a1
                  mulhsu       a2, t0, t6
                  c.or         s1, a2
                  srai         a3, s5, 2
                  c.srli       s0, 29
                  c.xor        a0, s1
                  slti         s6, a3, 1077
                  c.lui        s11, 21
                  c.srai       a3, 23
                  csrrwi       s8, 0x340, 31
                  csrrw        s11, 0x340, s4
                  xor          t5, s7, gp
                  div          zero, gp, t5
                  c.andi       a3, -1
                  mulh         s10, t3, t3
                  sra          s9, a1, a3
                  csrrc        s5, 0x340, a7
                  csrrsi       a2, 0x340, 18
                  c.lui        t5, 17
                  xori         a0, t2, 1940
                  nop
                  xori         t2, t1, 789
                  andi         s3, s9, 1927
                  c.mv         s8, s10
                  lui          a7, 817455
                  csrrci       sp, 0x340, 27
                  c.addi       t5, -1
                  xori         s9, s9, -1955
                  c.srli       a0, 5
                  mul          s0, a7, a3
                  addi         s6, s8, 616
                  nop
                  srai         tp, s5, 26
                  c.nop
                  addi         s0, s11, 1623
                  c.addi4spn   a0, sp, 960
                  csrrci       s6, 0x340, 17
                  mulhsu       a2, s5, t6
                  sra          s5, a1, a5
                  mulh         s5, a0, t4
                  xor          s3, s0, s2
                  c.addi16sp   sp, -16
                  csrrci       s6, 0x340, 11
                  xori         t2, sp, -751
                  slt          t0, gp, sp
                  c.or         a5, a1
                  slti         a5, s1, -1203
                  sltiu        s3, s9, 1769
                  remu         s5, sp, a2
                  or           s3, a5, a2
                  ori          s0, s5, 454
                  addi         sp, s9, -659
                  sltu         t4, s7, s9
                  slti         a4, ra, 91
                  srl          s6, a1, t4
                  c.nop
                  c.addi16sp   sp, 448
                  div          gp, t4, s1
                  xori         a4, s11, 43
                  csrrsi       s5, 0x340, 31
                  sltiu        a4, a2, 59
                  add          a0, s5, s2
                  addi         s9, t6, -108
                  add          a3, a4, a4
                  sltu         s9, s6, s9
                  slt          s5, s8, s8
                  nop
                  remu         t2, s10, t4
                  nop
                  csrrwi       s10, 0x340, 6
                  lui          zero, 802170
                  c.addi16sp   sp, -16
                  sltu         t5, zero, s8
                  c.addi       t2, 25
                  andi         s4, zero, 1418
                  c.and        a3, a3
                  csrrci       a2, 0x340, 0
                  add          s3, ra, a1
                  rem          s5, zero, a7
                  c.sub        a4, a1
                  c.addi16sp   sp, -16
                  csrrci       s0, 0x340, 4
                  c.lui        s4, 19
                  nop
                  csrrsi       zero, 0x340, 0
                  csrrc        a4, 0x340, zero
                  div          zero, t3, s8
                  csrrs        s11, 0x340, t5
                  sltu         tp, sp, a1
                  addi         s5, a2, 1536
                  c.addi4spn   a5, sp, 864
                  slti         s5, s3, -1918
                  csrrc        tp, 0x340, zero
                  csrrci       s2, 0x340, 19
                  remu         a0, a2, t3
                  and          t5, t1, s1
                  c.addi4spn   a4, sp, 384
                  mulh         t2, zero, a5
                  div          a2, t5, tp
                  c.sub        a4, s0
                  and          a0, tp, s3
                  nop
                  csrrw        a0, 0x340, a6
                  auipc        t2, 646216
                  lui          sp, 881348
                  remu         sp, t6, s11
                  slt          t2, t3, ra
                  sltiu        s10, a7, -66
                  mulhsu       zero, zero, s1
                  div          s7, zero, gp
                  mulhu        s5, a6, t0
                  c.srai       a3, 15
                  sra          a5, a0, s1
                  csrrci       a2, 0x340, 6
                  and          zero, s1, sp
                  c.sub        a5, a1
                  c.add        s0, a3
                  c.srli       a3, 24
                  csrrs        s6, 0x340, zero
                  lui          a0, 323281
                  addi         ra, a6, 1860
                  c.li         s5, 20
                  or           a4, a6, s1
                  c.or         a4, a3
                  c.nop
                  xori         a7, zero, -497
                  nop
                  xori         s11, ra, -78
                  c.add        s5, gp
                  c.sub        a2, s0
                  slt          s1, s7, s11
                  sra          zero, a1, ra
                  c.mv         s5, ra
                  c.nop
                  srai         t3, gp, 16
                  c.li         s5, 11
                  c.lui        a0, 31
                  c.sub        a4, a5
                  c.srai       s0, 18
                  mulh         s7, t6, a7
                  csrrc        tp, 0x340, s9
                  csrrc        s4, 0x340, s3
                  sub          a3, zero, a5
                  ori          a5, t0, 990
                  ori          sp, a6, -1410
                  c.sub        s1, a3
                  srai         s1, t1, 1
                  c.nop
                  rem          t0, t0, s7
                  csrrs        s5, 0x340, zero
                  or           a6, s5, s4
                  sltiu        t2, t3, -1682
                  c.addi16sp   sp, 288
                  csrrci       s7, 0x340, 0
                  sltiu        sp, a3, -422
                  or           s6, s4, s3
                  c.and        a4, a4
                  mulh         sp, s11, s6
                  lui          t2, 456752
                  sltu         s5, s9, ra
                  csrrsi       s4, 0x340, 14
                  c.or         a5, a1
                  c.addi4spn   a3, sp, 128
                  csrrwi       t3, 0x340, 7
                  sltu         t5, ra, s9
                  andi         s1, s8, 234
                  c.and        a0, a3
                  and          t0, s11, a2
                  srl          a3, s6, s3
                  csrrsi       a6, 0x340, 0
                  slti         a3, ra, 751
                  sltu         s9, t6, a3
                  sll          t4, a2, t1
                  add          t5, a6, s6
                  c.li         a2, 18
                  csrrs        ra, 0x340, zero
                  c.addi       a6, -1
                  slt          a4, gp, a5
                  sltu         a3, s4, s9
                  addi         zero, s0, 431
                  c.addi       s3, 13
                  c.srai       a2, 5
                  c.li         s5, 5
                  c.nop
                  c.xor        s0, a0
                  srai         s4, s2, 20
                  div          a0, a4, t3
                  xori         s6, s4, 419
                  csrrw        s0, 0x340, s2
                  slli         t2, t2, 1
                  remu         ra, a6, s4
                  slt          s5, t3, s10
                  c.mv         sp, gp
                  c.and        a4, a4
                  c.slli       t3, 3
                  nop
                  divu         s5, t0, s10
                  mul          tp, s6, t2
                  c.nop
                  mulhsu       s4, t5, a7
                  slti         t3, s1, -1771
                  sltiu        s11, s8, 317
                  c.lui        a6, 8
                  csrrci       s11, 0x340, 0
                  rem          a2, gp, a1
                  c.addi4spn   s0, sp, 160
                  mul          s9, s5, s7
                  c.li         s0, -1
                  rem          a2, t3, t6
                  c.srai       s0, 20
                  ori          s7, a3, 1193
                  mulhu        a4, s5, a2
                  ori          a3, s10, -1601
                  srli         gp, s10, 4
                  ori          a0, s1, 743
                  c.slli       s9, 12
                  c.mv         a4, a3
                  c.or         a0, s1
                  sltiu        a2, s7, 1701
                  c.or         a2, s0
                  c.li         a6, -1
                  c.andi       s0, -1
                  srli         a4, s9, 0
                  ori          s5, s1, 856
                  xor          s11, t0, zero
                  srai         s2, s6, 24
                  sll          ra, gp, a1
                  sub          s2, a3, zero
                  rem          gp, a1, t2
                  auipc        s4, 404021
                  addi         s11, zero, 438
                  c.andi       a5, 18
                  mulhu        t2, a5, s1
                  c.nop
                  csrrc        s0, 0x340, s5
                  csrrci       s0, 0x340, 0
                  slli         a5, t0, 9
                  or           a4, a2, a2
                  mulhu        gp, sp, s2
                  sltiu        t3, a4, -544
                  c.slli       s8, 13
                  c.sub        a5, a3
                  c.slli       s2, 8
                  rem          s7, s2, s6
                  c.srli       s0, 21
                  csrrs        zero, 0x340, zero
                  c.sub        s1, s0
                  sra          tp, t1, a1
                  csrrwi       s10, 0x340, 4
                  and          s3, t4, a7
                  and          s8, zero, ra
                  slli         s10, t0, 0
                  c.slli       s4, 28
                  c.or         a5, a2
                  xori         zero, zero, -1163
                  srai         sp, sp, 27
                  xor          a5, t4, s1
                  c.andi       a5, 3
                  xori         a6, s4, 955
                  slti         a2, t3, 1852
                  slt          s5, zero, t0
                  remu         a3, t0, a5
                  c.or         a5, a2
                  slti         gp, a3, -1591
                  c.mv         t4, a1
                  mulhsu       zero, gp, s5
                  lui          s3, 905583
                  sll          a6, s3, t3
                  c.addi       s1, -1
                  c.nop
                  sltu         t0, s11, ra
                  mulh         t5, t1, a1
                  c.andi       a5, 7
                  remu         sp, s10, s1
                  divu         s10, a0, s9
                  c.add        a2, tp
                  rem          t2, s9, t2
                  c.addi4spn   s0, sp, 368
                  srli         tp, sp, 30
                  csrrw        a0, 0x340, a6
                  c.srai       a4, 18
                  auipc        zero, 780026
                  srai         a3, s5, 5
                  c.addi16sp   sp, -16
                  mulhsu       t2, gp, a5
                  addi         a2, t5, 1974
                  c.srai       a2, 14
                  csrrsi       t3, 0x340, 0
                  mul          t3, tp, sp
                  c.nop
                  lui          sp, 1036314
                  c.and        s0, a5
                  c.addi16sp   sp, -16
                  lui          ra, 257529
                  c.lui        a6, 20
                  slli         s1, t0, 2
                  c.slli       tp, 21
                  mul          ra, sp, a7
                  mulh         s10, a0, a6
                  andi         a4, a1, -1589
                  c.addi4spn   a3, sp, 912
                  mulhu        tp, a2, s0
                  add          t4, a3, sp
                  sltiu        s4, a3, 50
                  and          s8, s6, a7
                  mulhsu       s3, a2, a1
                  c.slli       s3, 7
                  c.mv         s6, s3
                  xori         a5, ra, -864
                  slt          s1, a2, zero
                  c.sub        a0, a4
                  c.andi       s1, -1
                  c.or         s1, a2
                  csrrs        s0, 0x340, zero
                  c.or         a0, s1
                  csrrw        s4, 0x340, s10
                  csrrci       t5, 0x340, 0
                  c.srli       a2, 27
                  c.srli       a5, 4
                  mulhu        a5, a6, a4
                  mulhu        s2, s9, s6
                  csrrc        t2, 0x340, gp
                  slli         s0, s8, 9
                  csrrw        s7, 0x340, s7
                  csrrc        s11, 0x340, zero
                  csrrs        t4, 0x340, a0
                  rem          t4, s10, s3
                  slli         a5, tp, 16
                  sub          s10, a1, a7
                  sra          a0, s4, s4
                  and          s2, t2, zero
                  srai         s9, t0, 20
                  csrrci       gp, 0x340, 10
                  ori          s6, s6, 352
                  c.lui        s3, 22
                  sltu         tp, a1, s9
                  mulhsu       a0, a1, a6
                  c.or         a3, a3
                  or           a0, s6, s11
                  mulhsu       tp, s5, s8
                  mulhsu       t2, s6, t1
                  c.lui        s8, 23
                  rem          a3, t3, a6
                  c.addi16sp   sp, 176
                  csrrci       t3, 0x340, 18
                  srai         a2, s11, 17
                  lui          zero, 976732
                  mulh         sp, t0, a1
                  slti         s10, s8, -1994
                  slti         a2, s8, 476
                  slt          s4, s8, s4
                  c.and        a0, a4
                  srli         s2, a4, 22
                  div          t2, t1, s10
                  c.nop
                  c.and        a0, a0
                  c.addi16sp   sp, -16
                  c.mv         s2, s7
                  sll          ra, gp, a4
                  slli         s1, a6, 7
                  c.or         a4, a5
                  lui          sp, 901420
                  sltiu        s11, t5, 1527
                  xori         a3, s9, 624
                  csrrsi       a0, 0x340, 0
                  c.add        s4, a7
                  divu         sp, a3, gp
                  csrrci       t2, 0x340, 0
                  nop
                  c.sub        s0, s0
                  addi         t5, t6, -1804
                  lui          t0, 262749
                  csrrwi       a5, 0x340, 21
                  auipc        s11, 816633
                  c.nop
                  div          t0, a3, s0
                  xor          a7, a7, s9
                  nop
                  rem          t4, a3, t3
                  srli         s2, t5, 12
                  rem          s9, a2, t4
                  or           t2, a2, t2
                  c.addi       s11, -1
                  c.addi4spn   a4, sp, 928
                  c.li         gp, -1
                  sll          s10, a2, s0
                  c.xor        a2, a4
                  c.add        s8, a2
                  c.sub        a2, a1
                  remu         a0, sp, sp
                  csrrwi       t5, 0x340, 29
                  or           sp, t5, a0
                  c.mv         tp, tp
                  csrrwi       zero, 0x340, 9
                  andi         s8, a0, -72
                  csrrsi       s3, 0x340, 14
                  xori         a3, a3, 78
                  c.and        a5, a3
                  srli         gp, a7, 18
                  c.xor        s1, a4
                  c.or         a2, a4
                  srl          a5, t6, t4
                  c.or         s1, a1
                  xor          gp, s3, a0
                  xor          s7, s3, t1
                  sub          s3, tp, s11
                  srai         gp, ra, 28
                  lui          a3, 466427
                  srli         t5, s2, 11
                  csrrsi       a2, 0x340, 12
                  auipc        gp, 414700
                  c.and        a0, s0
                  c.xor        a5, a3
                  c.srli       a4, 23
                  sra          s0, sp, t0
                  c.li         a0, 1
                  div          a7, gp, t3
                  sra          a6, a5, a0
                  csrrc        a5, 0x340, tp
                  xor          tp, zero, a2
                  mulhu        s2, gp, s10
                  srai         s3, t2, 30
                  slti         s8, s11, -776
                  csrrwi       a7, 0x340, 27
                  csrrci       sp, 0x340, 15
                  slt          s8, a3, a4
                  sub          a2, s8, s7
                  c.srli       a4, 18
                  c.srli       a2, 8
                  srli         s11, a6, 31
                  c.lui        s9, 22
                  lui          s3, 594786
                  auipc        sp, 592199
                  csrrci       s8, 0x340, 0
                  slli         s10, zero, 24
                  c.li         s1, 5
                  mul          s1, s6, s0
                  mul          s10, s6, s10
                  csrrsi       s3, 0x340, 31
                  xor          s6, s4, s11
                  mulh         s8, a7, a1
                  c.lui        s6, 30
                  srli         s1, sp, 1
                  c.xor        a5, a2
                  c.addi       s3, -1
                  mulh         a6, s6, t4
                  c.addi       s4, -1
                  csrrw        t5, 0x340, s4
                  c.add        s5, t6
                  c.addi4spn   a3, sp, 192
                  c.li         sp, 0
                  c.mv         t2, s5
                  c.addi       s11, 22
                  mulhsu       a4, a5, a4
                  c.add        t4, a7
                  c.add        s7, a5
                  c.sub        a2, s1
                  divu         s4, s9, a4
                  mulhsu       s9, a0, s5
                  c.and        s0, a5
                  csrrw        sp, 0x340, s5
                  slt          a4, t6, s3
                  or           zero, s10, a4
                  xori         gp, s4, 978
                  csrrw        s0, 0x340, t2
                  and          s2, a3, s1
                  mul          s9, t2, a4
                  remu         a3, t1, t4
                  remu         t0, s9, tp
                  xori         s2, a3, -1466
                  c.addi16sp   sp, 160
                  c.srai       a5, 8
                  slti         a6, ra, -1756
                  c.and        a5, a4
                  mulhu        t5, t1, s1
                  c.or         a0, a2
                  sll          gp, gp, s2
                  c.lui        t2, 14
                  mulhu        t5, s10, a2
                  c.lui        t4, 9
                  csrrs        t3, 0x340, zero
                  addi         s0, s7, -1818
                  lui          gp, 189314
                  csrrw        a0, 0x340, gp
                  and          s3, t1, t1
                  sltiu        a5, t4, -1897
                  auipc        a0, 474334
                  andi         a5, t1, 391
                  c.srli       a3, 5
                  csrrwi       t0, 0x340, 10
                  sltu         s10, a4, t6
                  add          gp, zero, ra
                  c.li         s11, 12
                  c.addi       ra, 16
                  slli         zero, gp, 0
                  xor          tp, a0, a6
                  nop
                  mulh         s8, s4, a0
                  xor          s3, t5, t6
                  mulhu        ra, t1, a0
                  c.or         a5, a2
                  csrrwi       s3, 0x340, 31
                  lui          t4, 807206
                  c.sub        a3, s1
                  c.addi4spn   s0, sp, 640
                  remu         s1, t3, a2
                  csrrci       s2, 0x340, 0
                  c.addi       s5, 18
                  c.nop
                  ori          s4, sp, -1061
                  csrrsi       s8, 0x340, 28
                  c.sub        a4, a3
                  csrrc        t2, 0x340, zero
                  rem          s0, s0, a4
                  andi         t3, a0, -1798
                  csrrc        t2, 0x340, zero
                  andi         t5, t2, -1854
                  ori          ra, s1, -1374
                  slti         t0, t2, 1088
                  xori         s7, a4, 703
                  c.addi4spn   a4, sp, 720
                  sub          s0, tp, gp
                  slli         a7, t0, 25
                  divu         t3, a6, a7
                  ori          a0, t0, -658
                  csrrwi       tp, 0x340, 19
                  remu         s9, t0, s7
                  c.or         a0, a3
                  csrrsi       a5, 0x340, 5
                  mulhu        tp, a0, t0
                  lui          s3, 863901
                  c.mv         s4, t4
                  c.nop
                  c.xor        s1, a4
                  lui          t4, 829832
                  andi         tp, s4, -66
                  slti         a2, t3, -785
                  c.lui        s0, 19
                  c.addi4spn   a2, sp, 928
                  c.andi       s1, 10
                  auipc        a6, 51214
                  andi         t5, t0, 684
                  csrrw        s6, 0x340, s7
                  addi         t3, s3, -730
                  c.li         t3, 10
                  or           s3, t5, tp
                  sltiu        t4, t4, -1059
                  csrrs        ra, 0x340, zero
                  c.addi       a6, -1
                  csrrci       a7, 0x340, 6
                  mul          ra, a0, s7
                  addi         s10, a2, -1951
                  mulhu        s11, s4, t3
                  csrrc        t5, 0x340, zero
                  divu         s11, s9, t3
                  sll          a2, t1, a5
                  sltu         s1, sp, gp
                  xor          t2, a4, a4
                  c.add        s0, s0
                  auipc        s5, 229569
                  and          a5, a1, s4
                  c.srli       a4, 9
                  andi         sp, sp, 288
                  slti         a6, a3, -1591
                  sra          sp, a7, s4
                  c.or         a0, a5
                  andi         t3, a3, 1381
                  xori         tp, s11, 1980
                  mulhu        s2, tp, a1
                  csrrw        t2, 0x340, a5
                  and          a3, sp, zero
                  csrrwi       t4, 0x340, 4
                  sltu         t4, s8, a5
                  and          s5, gp, s6
                  sub          a5, a6, gp
                  mulhsu       gp, ra, t5
                  nop
                  mulh         s3, t6, s9
                  mul          s9, s6, a4
                  c.sub        a0, a3
                  add          t2, t0, a5
                  addi         s11, gp, 1289
                  csrrwi       t3, 0x340, 7
                  csrrs        t2, 0x340, s8
                  xor          s2, s3, t5
                  and          a0, s9, a3
                  c.li         tp, 10
                  sra          s5, t5, s4
                  c.lui        a6, 15
                  csrrsi       a3, 0x340, 13
                  add          s2, a6, a5
                  c.srai       a0, 28
                  sltu         zero, a0, ra
                  nop
                  andi         s11, a7, -1941
                  addi         t2, t5, -2038
                  xor          zero, t5, s0
                  c.slli       a4, 24
                  csrrsi       a2, 0x340, 0
                  ori          s10, s5, -204
                  rem          zero, t3, t0
                  lui          s9, 726405
                  and          gp, a2, s0
                  c.andi       a3, 1
                  csrrwi       s6, 0x340, 9
                  c.andi       a2, -1
                  sra          s9, a1, tp
                  xori         tp, s5, 646
                  c.add        a4, ra
                  c.or         s1, s0
                  nop
                  csrrc        s4, 0x340, zero
                  addi         a0, tp, -925
                  mulhsu       s10, s5, zero
                  div          s1, s4, t1
                  xor          s0, s1, a3
                  mulh         s3, t5, a5
                  csrrwi       gp, 0x340, 12
                  c.addi4spn   a3, sp, 48
                  sltiu        s10, t2, -1232
                  slli         s2, ra, 26
                  csrrc        tp, 0x340, zero
                  c.lui        t4, 3
                  slli         t0, a6, 14
                  csrrwi       a3, 0x340, 25
                  c.andi       a0, 19
                  xori         s1, tp, 1427
                  csrrw        sp, 0x340, sp
                  mulh         t0, t6, s9
                  mulhu        tp, s5, a4
                  sltu         s1, s11, a0
                  c.or         a4, a4
                  csrrs        s9, 0x340, zero
                  c.mv         s11, s10
                  andi         s9, s8, 1172
                  srl          t4, t0, a3
                  c.nop
                  csrrsi       tp, 0x340, 0
                  sltiu        tp, sp, -623
                  c.addi4spn   a4, sp, 704
                  auipc        a7, 663284
                  divu         s0, t1, tp
                  mulhsu       ra, s6, a4
                  sll          s6, s0, t1
                  c.addi16sp   sp, -16
                  xori         a7, a6, 1087
                  or           t3, t4, s4
                  c.or         a3, a2
                  c.nop
                  auipc        a5, 908870
                  and          a2, s7, a2
                  c.xor        a3, a3
                  c.slli       ra, 30
                  sltu         gp, sp, a4
                  mulhsu       s0, s7, t2
                  sltiu        t2, t3, -1246
                  xor          a7, s4, sp
                  div          t5, a5, t0
                  c.sub        s0, a4
                  andi         s3, s6, -1274
                  c.lui        a7, 23
                  nop
                  c.srli       a0, 16
                  ori          a6, a7, -921
                  c.addi       t5, 24
                  c.slli       t0, 16
                  srl          t3, a0, t1
                  c.and        a3, a3
                  c.addi       s3, 21
                  add          s9, s8, s9
                  div          s7, a0, t3
                  andi         s4, t3, 668
                  c.or         a0, a0
                  xor          gp, s1, s8
                  sub          zero, gp, a3
                  c.and        a5, a1
                  c.addi4spn   a2, sp, 208
                  c.lui        a3, 8
                  c.lui        a4, 23
                  c.xor        a0, s1
                  and          a0, t0, t5
                  c.addi16sp   sp, 160
                  nop
                  ori          ra, a4, 1353
                  c.lui        a5, 3
                  csrrc        t3, 0x340, zero
                  c.srli       s1, 15
                  add          s5, t2, a0
                  c.srli       a4, 29
                  c.li         s9, 23
                  slli         sp, s1, 11
                  nop
                  mulhu        s2, s1, s3
                  c.sub        a4, a3
                  c.or         a5, s0
                  sll          a3, s1, s8
                  ori          a5, s1, -281
                  and          tp, s11, s1
                  slli         tp, tp, 7
                  and          tp, a5, a4
                  andi         t5, a6, -1254
                  remu         s3, t1, s9
                  c.addi       a5, 6
                  csrrwi       s9, 0x340, 25
                  xor          sp, gp, a3
                  mulh         a5, t3, a4
                  c.xor        a2, s1
                  csrrwi       s6, 0x340, 21
                  csrrs        s9, 0x340, s5
                  c.andi       s1, -1
                  c.nop
                  srl          s3, s4, a2
                  mul          s10, s3, s3
                  c.or         a2, a0
                  mulhsu       a0, s0, s9
                  c.add        gp, a6
                  auipc        zero, 697488
                  c.nop
                  lui          a2, 596723
                  c.sub        a3, a4
                  csrrsi       s1, 0x340, 0
                  srl          a4, t2, s5
                  and          s2, a3, s10
                  c.addi16sp   sp, 384
                  ori          s3, t2, -620
                  sll          s8, tp, a2
                  nop
                  slti         s3, a7, -960
                  sll          t4, s2, a2
                  srli         a7, t1, 29
                  c.nop
                  c.li         a0, 4
                  slt          t0, s11, a3
                  slt          zero, ra, s4
                  add          tp, a4, a2
                  srli         t0, a4, 5
                  mulhsu       t0, s7, t0
                  c.andi       a4, -1
                  csrrsi       ra, 0x340, 0
                  lui          a3, 506672
                  c.nop
                  mulhsu       a0, a5, s8
                  srli         ra, tp, 19
                  csrrwi       t2, 0x340, 8
                  mulhsu       t2, s3, a5
                  xori         zero, s7, -164
                  c.or         a2, a3
                  c.addi       t0, 25
                  c.and        s0, a3
                  csrrci       s7, 0x340, 0
                  c.xor        a3, a4
                  slli         t0, s2, 30
                  and          s3, s1, a5
                  c.slli       s3, 18
                  c.mv         a4, s0
                  sll          t4, gp, zero
                  c.srai       a4, 31
                  srl          a5, a1, a0
                  andi         ra, a2, -1060
                  xori         sp, ra, 422
                  csrrsi       s7, 0x340, 0
                  c.sub        s1, a3
                  c.sub        a4, a0
                  csrrw        ra, 0x340, a3
                  mulh         ra, s8, ra
                  csrrc        s8, 0x340, t5
                  sra          a7, a7, s7
                  c.lui        s6, 24
                  sra          s10, t6, t6
                  rem          s6, s11, s0
                  sub          a7, s2, t2
                  remu         gp, s9, a3
                  sltiu        a2, s0, -471
                  c.mv         s1, s6
                  sra          s10, s1, t0
                  c.andi       a0, -1
                  remu         a6, s8, t5
                  sra          t2, a0, a6
                  mulh         a6, zero, s8
                  csrrw        gp, 0x340, s1
                  auipc        s10, 385658
                  lui          s3, 691711
                  c.or         s1, a3
                  slt          sp, s7, t3
                  sll          s4, t5, s3
                  slli         a3, s6, 3
                  xori         ra, t0, -1739
                  c.and        a4, a3
                  csrrw        a4, 0x340, t1
                  slti         s5, a2, -1570
                  c.slli       gp, 18
                  rem          s8, zero, a7
                  divu         s8, t4, t5
                  c.xor        s1, a5
                  mulhu        s5, s5, s7
                  ori          t0, s10, 657
                  lui          sp, 113134
                  add          s10, s9, t5
                  or           s9, s0, s6
                  csrrwi       a6, 0x340, 5
                  auipc        a2, 325723
                  c.mv         gp, a4
                  csrrs        s11, 0x340, zero
                  c.add        a6, s0
                  c.srli       a2, 14
                  andi         t3, a6, -1271
                  and          ra, a3, s8
                  c.srai       a3, 7
                  xori         t2, t5, 1235
                  c.addi4spn   s0, sp, 832
                  c.srli       a4, 30
                  div          s9, s0, t5
                  csrrci       a0, 0x340, 0
                  nop
                  mulh         s5, tp, s8
                  or           a0, s3, a3
                  c.addi16sp   sp, -16
                  csrrw        s4, 0x340, a1
                  srai         a2, t3, 11
                  xori         s0, s6, -651
                  nop
                  mulhsu       s5, zero, a4
                  c.mv         t2, a4
                  c.addi       ra, -1
                  c.li         sp, -1
                  sll          zero, sp, s0
                  slt          a4, a3, s8
                  c.srai       a0, 29
                  addi         a7, sp, -1217
                  and          t0, a4, s10
                  mul          a0, t6, s7
                  c.add        s6, t0
                  sra          a5, t3, t0
                  c.srai       s0, 26
                  srli         s3, s0, 15
                  c.slli       s4, 27
                  c.sub        s0, a1
                  sltiu        tp, tp, -423
                  srli         s5, a7, 4
                  csrrw        s0, 0x340, t4
                  srai         tp, s1, 27
                  mulhu        ra, t5, t3
                  c.nop
                  c.srli       a2, 13
                  auipc        t4, 753045
                  csrrci       s9, 0x340, 0
                  div          a7, t3, s6
                  csrrw        t0, 0x340, a5
                  rem          a4, a1, a3
                  sra          a4, t0, gp
                  ori          a6, ra, -113
                  lui          s6, 471248
                  csrrw        a4, 0x340, a2
                  xor          t2, s11, tp
                  c.srli       s1, 27
                  c.nop
                  c.mv         tp, gp
                  c.and        a3, s0
                  mulhu        s7, a7, t0
                  srl          zero, a0, s7
                  c.and        s1, a2
                  sltiu        a7, s3, -85
                  c.addi       gp, 1
                  sll          s7, ra, t2
                  addi         a7, a4, -979
                  sub          a7, a5, s10
                  c.slli       s1, 20
                  xori         sp, ra, 248
                  c.nop
                  slt          zero, t2, t6
                  mul          s2, tp, s1
                  srli         s7, a6, 8
                  xori         a4, a7, -1989
                  c.addi16sp   sp, 32
                  mulhsu       t3, a2, t2
                  c.xor        a4, a0
                  c.addi16sp   sp, -16
                  csrrsi       s11, 0x340, 13
                  srai         s1, s6, 11
                  xori         ra, s7, -1320
                  ori          s0, s11, -446
                  div          s5, s10, s8
                  c.andi       a4, -1
                  c.slli       a5, 7
                  rem          s8, t2, sp
                  slt          t3, a3, sp
                  nop
                  csrrci       t2, 0x340, 0
                  c.li         t2, 19
                  xori         s8, s0, 987
                  c.lui        a3, 13
                  c.mv         a5, t0
                  csrrsi       s4, 0x340, 23
                  c.addi16sp   sp, -16
                  auipc        t5, 742618
                  c.add        t0, t1
                  csrrsi       t2, 0x340, 0
                  c.addi       s2, 2
                  c.sub        a5, a1
                  nop
                  c.addi4spn   a3, sp, 688
                  slti         tp, a2, 259
                  lui          s6, 45112
                  slt          a2, s6, t4
                  mulhu        t2, sp, s9
                  ori          t4, s0, -1531
                  c.or         a2, s0
                  mulh         s9, a4, s11
                  xor          sp, s6, a5
                  sub          s2, s9, a4
                  and          s4, a0, s8
                  srai         a5, gp, 16
                  csrrsi       s3, 0x340, 15
                  sltu         s11, gp, t4
                  csrrw        s4, 0x340, sp
                  div          sp, a5, s2
                  c.addi16sp   sp, 352
                  and          a2, t5, s4
                  remu         a2, s7, t4
                  srai         t5, s6, 23
                  remu         s7, s1, tp
                  mul          s10, s9, s7
                  lui          t3, 663709
                  mul          s6, a1, s1
                  csrrsi       a5, 0x340, 25
                  csrrs        a3, 0x340, s11
                  csrrwi       gp, 0x340, 4
                  c.addi       s5, 15
                  auipc        ra, 558560
                  sll          t0, tp, a5
                  addi         s10, s8, -444
                  divu         s8, t2, s6
                  c.addi       s7, 2
                  rem          t0, s2, t3
                  c.add        s7, t2
                  addi         a4, sp, -920
                  srl          a7, t6, t6
                  c.andi       a5, 16
                  c.addi       tp, -1
                  addi         s2, a3, 1215
                  csrrc        a0, 0x340, s5
                  csrrci       gp, 0x340, 0
                  c.addi16sp   sp, -16
                  mulhsu       s6, s11, tp
                  csrrci       a7, 0x340, 24
                  slt          s1, a1, s8
                  srl          s2, a6, t4
                  or           tp, s3, t1
                  c.srai       a0, 20
                  slti         a3, gp, -1531
                  sltu         s4, ra, s2
                  mulhu        s3, s7, t6
                  csrrw        s5, 0x340, s8
                  csrrc        t5, 0x340, zero
                  slli         a4, a6, 8
                  sltiu        s7, s2, -1374
                  sub          s6, t0, sp
                  slli         a3, s1, 28
                  sub          ra, a2, a5
                  auipc        s5, 336518
                  sltiu        gp, a7, -1860
                  csrrci       s7, 0x340, 0
                  slli         s8, a5, 13
                  c.andi       a3, 2
                  div          s8, zero, a4
                  add          ra, ra, s5
                  divu         a0, s6, s9
                  c.addi4spn   a0, sp, 224
                  srl          t2, s2, a6
                  and          ra, t2, tp
                  csrrs        tp, 0x340, zero
                  sltu         sp, t6, s0
                  csrrs        a7, 0x340, zero
                  lui          t5, 780739
                  xori         a0, t0, -1255
                  andi         s8, t1, 1680
                  srai         a6, a7, 7
                  csrrwi       sp, 0x340, 24
                  nop
                  or           s10, a0, a6
                  c.li         s1, 7
                  c.addi16sp   sp, -16
                  c.or         a0, a0
                  mulh         s9, s0, t4
                  sub          ra, a6, a4
                  and          t3, s5, t1
                  c.addi16sp   sp, -16
                  divu         t4, a5, a4
                  add          s9, s1, s1
                  rem          t5, a5, a7
                  c.lui        tp, 7
                  csrrwi       s8, 0x340, 14
                  c.xor        a2, s0
                  lui          a3, 215060
                  add          t5, s9, t4
                  c.add        t4, s2
                  div          t5, t2, t4
                  xori         a3, t0, -1235
                  or           s0, sp, s11
                  mul          s6, s4, t5
                  csrrci       s4, 0x340, 23
                  c.addi16sp   sp, -16
                  c.srai       a2, 13
                  sltu         s7, s7, t2
                  rem          s10, a1, a4
                  csrrci       s4, 0x340, 8
                  sll          s0, s1, a1
                  c.addi4spn   s1, sp, 912
                  lui          s10, 1011202
                  remu         ra, t1, a1
                  andi         s3, s11, -554
                  srai         a2, sp, 23
                  c.or         a0, a0
                  mulhsu       a6, t4, t0
                  c.li         gp, -1
                  or           s11, s4, t4
                  c.xor        a3, a5
                  sll          s4, a0, t3
                  slti         s7, a1, -515
                  csrrw        s0, 0x340, t5
                  sltiu        s7, a4, -1965
                  addi         s0, s8, -834
                  mulh         s2, zero, s5
                  xor          s10, s9, a7
                  c.lui        t4, 23
                  c.srai       a4, 27
                  mulhsu       s6, t1, t0
                  sltiu        s11, t1, 408
                  csrrsi       s5, 0x340, 0
                  mulhu        t0, t2, s2
                  slti         s6, s7, 2000
                  sltu         a6, s3, t3
                  c.and        a3, a1
                  c.and        a5, a5
                  and          s3, t1, a4
                  slti         s6, s7, -487
                  srli         s7, s0, 14
                  mulhu        ra, s1, s10
                  slti         a0, a3, -477
                  sll          s8, a2, a0
                  slli         t2, s10, 30
                  c.addi4spn   s1, sp, 784
                  csrrwi       a7, 0x340, 2
                  sra          t2, s9, s8
                  srli         s0, a0, 30
                  nop
                  c.srai       a5, 5
                  slt          s4, s0, s11
                  srai         s10, a5, 6
                  mul          sp, a1, gp
                  sltiu        t5, a4, 1898
                  and          s11, s0, s10
                  slti         t0, tp, -578
                  sll          s9, a1, a2
                  csrrwi       s1, 0x340, 5
                  c.sub        a3, a1
                  c.and        a4, a4
                  mul          a6, t1, s6
                  add          s6, s1, zero
                  divu         t2, t1, a3
                  c.and        a5, a2
                  c.addi16sp   sp, -16
                  divu         s7, gp, a1
                  sub          s4, a7, s2
                  sub          t5, a2, tp
                  andi         t3, s7, 1739
                  c.nop
                  c.and        a3, a1
                  c.addi16sp   sp, 192
                  and          ra, a3, s6
                  c.mv         a4, t6
                  ori          s2, t1, -1029
                  csrrsi       s6, 0x340, 0
                  csrrs        tp, 0x340, zero
                  csrrsi       gp, 0x340, 0
                  c.slli       gp, 28
                  c.addi16sp   sp, -16
                  slli         zero, s6, 16
                  slli         ra, s3, 28
                  c.li         s1, -1
                  c.and        a0, a0
                  or           s7, a0, s0
                  c.add        gp, gp
                  c.addi       t2, -1
                  remu         s0, s2, s2
                  andi         ra, t3, 985
                  c.srli       a5, 25
                  c.sub        a5, a4
                  rem          s8, t3, t1
                  csrrw        a0, 0x340, a5
                  rem          ra, a2, ra
                  csrrw        s6, 0x340, s2
                  c.srli       a0, 28
                  csrrs        s11, 0x340, s1
                  c.li         t5, 24
                  csrrw        a2, 0x340, s5
                  ori          zero, gp, -2026
                  csrrw        s9, 0x340, s7
                  mulhu        s0, a4, s1
                  c.srli       a0, 20
                  xor          a2, s9, s5
                  srai         sp, a2, 20
                  c.nop
                  csrrw        a2, 0x340, s5
                  lui          a7, 275115
                  c.andi       a2, -1
                  xori         s4, a5, -1459
                  c.li         s10, 15
                  csrrci       a2, 0x340, 18
                  ori          s1, s8, -130
                  slt          zero, s9, zero
                  or           sp, s0, t6
                  slti         s2, a1, 1712
                  csrrsi       ra, 0x340, 0
                  andi         a6, s7, -510
                  c.lui        s8, 31
                  xori         s3, a2, -1812
                  csrrci       s5, 0x340, 0
                  c.sub        a2, a3
                  c.sub        a2, a3
                  c.xor        a4, s1
                  lui          s4, 216099
                  csrrwi       s10, 0x340, 25
                  c.addi4spn   s0, sp, 208
                  csrrci       t5, 0x340, 0
                  c.xor        a0, a2
                  remu         zero, s8, tp
                  c.li         s5, -1
                  c.addi4spn   a0, sp, 400
                  or           s7, t0, s1
                  c.mv         a6, a2
                  mul          t2, a6, gp
                  or           zero, s7, s5
                  c.and        s1, a3
                  csrrwi       gp, 0x340, 26
                  mulhsu       tp, s8, ra
                  xor          s5, s11, t4
                  xori         s6, gp, -336
                  c.nop
                  sra          s5, t0, s6
                  slti         t2, s11, -1191
                  ori          ra, t0, 470
                  lui          a7, 691496
                  remu         s1, s3, s7
                  c.and        s1, s1
                  sltiu        ra, s5, -1108
                  c.addi4spn   s0, sp, 912
                  div          s0, sp, t4
                  nop
                  slti         s10, zero, 559
                  c.addi16sp   sp, 224
                  csrrwi       a7, 0x340, 16
                  csrrsi       s4, 0x340, 13
                  mulh         s1, s3, t6
                  rem          s9, s6, a6
                  slt          s4, ra, s10
                  csrrwi       s1, 0x340, 8
                  remu         s3, sp, a7
                  sltu         s6, a3, s3
                  andi         a4, s3, 898
                  mulh         s6, a6, s5
                  sltiu        gp, t4, 653
                  sra          tp, s3, a5
                  csrrs        gp, 0x340, zero
                  addi         ra, zero, 1953
                  nop
                  and          a7, s0, t6
                  c.addi16sp   sp, 48
                  srli         s1, t6, 28
                  mulhsu       s2, t4, s6
                  srai         t3, s7, 9
                  c.li         gp, 29
                  csrrc        s3, 0x340, zero
                  c.addi4spn   a0, sp, 800
                  c.xor        a0, a4
                  sltu         sp, t2, t4
                  csrrw        s7, 0x340, a7
                  c.addi16sp   sp, 288
                  c.andi       a3, 13
                  sll          zero, s8, s9
                  nop
                  sra          a3, s5, s4
                  mulh         s11, t5, s10
                  or           a7, t4, a5
                  ori          s11, zero, -229
                  csrrci       s0, 0x340, 25
                  ori          t4, s1, -1427
                  c.andi       a5, -1
                  c.sub        a2, a3
                  c.andi       s0, -1
                  divu         s11, s7, s6
                  c.li         a7, 6
                  slt          s9, zero, t0
                  c.li         s0, -1
                  sltu         a3, sp, t3
                  sra          s9, s8, a1
                  andi         s7, a2, 1101
                  slli         tp, s2, 2
                  srai         a2, a1, 20
                  auipc        a7, 345739
                  c.addi16sp   sp, 208
                  c.addi       t5, -1
                  csrrs        t5, 0x340, zero
                  rem          s7, s0, s9
                  xori         a6, tp, -1674
                  mulhsu       sp, s10, a6
                  sltu         t2, tp, ra
                  c.add        s5, a0
                  csrrci       sp, 0x340, 23
                  auipc        s10, 655697
                  c.sub        a3, a1
                  or           zero, a6, s11
                  add          a6, t1, s5
                  c.nop
                  c.srli       a5, 1
                  c.add        s10, s8
                  c.lui        gp, 20
                  c.or         a5, a0
                  c.and        s0, s0
                  sltiu        s7, t2, 853
                  div          s2, t5, s2
                  xori         s6, t4, -782
                  rem          tp, s4, a6
                  add          a3, s7, t5
                  csrrc        tp, 0x340, zero
                  sltiu        s9, t5, 8
                  slt          s11, s1, s11
                  mulhu        t0, s0, s4
                  mulhsu       s4, t5, s7
                  sub          t2, s10, s7
                  csrrs        ra, 0x340, zero
                  csrrs        a7, 0x340, t6
                  c.xor        a0, s1
                  remu         s4, t4, s0
                  rem          s8, sp, s3
                  c.addi4spn   a2, sp, 288
                  c.lui        s3, 24
                  remu         tp, s5, gp
                  srli         a5, s2, 16
                  sltu         s8, s2, sp
                  auipc        s7, 105886
                  c.lui        t0, 12
                  div          gp, s7, s0
                  slli         a7, zero, 12
                  rem          gp, t2, s9
                  xori         s6, t6, 765
                  mulhsu       a3, t2, t4
                  c.srli       s1, 13
                  mulhsu       s6, s8, a5
                  add          zero, zero, s8
                  slli         t2, s11, 15
                  c.lui        a6, 18
                  mulhsu       s4, s9, t4
                  c.slli       tp, 7
                  csrrci       t3, 0x340, 0
                  srai         sp, a4, 22
                  nop
                  remu         a7, t2, t1
                  sll          a0, t1, a6
                  rem          s3, s6, a6
                  csrrci       s9, 0x340, 20
                  csrrs        s11, 0x340, zero
                  csrrw        s1, 0x340, a5
                  csrrs        t0, 0x340, zero
                  csrrsi       gp, 0x340, 9
                  srai         t5, s1, 23
                  sra          zero, s6, a3
                  csrrw        a4, 0x340, s2
                  ori          tp, a6, 247
                  c.srli       a2, 30
                  c.nop
                  divu         a5, a2, s3
                  srl          a2, a3, a0
                  c.and        s1, a1
                  c.srli       a4, 6
                  remu         a6, a4, sp
                  c.addi16sp   sp, -16
                  c.slli       s10, 13
                  csrrci       s7, 0x340, 17
                  c.or         a0, s1
                  xori         a5, a5, 747
                  add          gp, t0, sp
                  slti         t0, a7, 717
                  and          ra, s8, s9
                  lui          s6, 47300
                  mulhsu       gp, s0, s9
                  csrrc        a4, 0x340, zero
                  c.srli       a5, 12
                  andi         s10, a1, -621
                  sltiu        s0, a4, -1731
                  c.lui        a4, 29
                  add          s1, a7, sp
                  c.nop
                  c.slli       sp, 6
                  c.srli       a2, 1
                  sra          a0, t4, t6
                  andi         t2, gp, 934
                  andi         gp, a0, -1327
                  c.lui        ra, 13
                  c.sub        a4, a4
                  c.srli       a3, 23
                  c.slli       tp, 17
                  xori         s2, zero, 705
                  srli         s1, s5, 5
                  div          s8, s6, s1
                  slti         s5, t2, 473
                  or           a3, sp, s0
                  auipc        s4, 794135
                  sll          a5, s6, a3
                  c.mv         t4, s10
                  c.srai       s1, 3
                  rem          a3, s4, t6
                  c.and        a2, a5
                  c.addi16sp   sp, -16
                  csrrs        s7, 0x340, tp
                  div          s6, ra, t3
                  lui          s7, 192054
                  sll          s2, s11, s4
                  and          a4, s3, s9
                  c.andi       s1, 29
                  c.or         a5, a1
                  c.add        t2, s4
                  c.addi       t4, -1
                  xori         s6, s0, 543
                  slt          s10, gp, zero
                  c.nop
                  c.srli       a2, 21
                  addi         s8, s7, -200
                  rem          s3, t3, a2
                  andi         a5, s3, 944
                  sub          zero, a2, s0
                  add          t4, t3, a5
                  c.xor        s1, a1
                  mul          s4, a6, s10
                  xor          s8, s11, s7
                  slli         t5, s1, 23
                  and          s4, s0, a3
                  c.srai       a2, 5
                  mulhu        a7, s10, t0
                  andi         t4, a4, -1092
                  mul          a4, a1, a7
                  c.lui        s11, 23
                  remu         s4, s8, s3
                  c.mv         s6, tp
                  c.add        a2, s0
                  srl          t3, t3, sp
                  c.addi16sp   sp, 192
                  csrrsi       s11, 0x340, 27
                  andi         a7, s0, 1780
                  c.mv         gp, tp
                  csrrs        zero, 0x340, t2
                  remu         s0, a1, a2
                  c.sub        a5, s0
                  c.addi4spn   a3, sp, 992
                  div          a4, zero, s3
                  slt          a0, ra, s9
                  or           a6, sp, t5
                  c.xor        a0, a2
                  c.lui        tp, 30
                  csrrw        s7, 0x340, t3
                  ori          a7, t3, 1999
                  xor          ra, s1, s9
                  lui          s9, 795339
                  and          s3, tp, s3
                  sll          tp, t1, s8
                  c.srai       a4, 11
                  divu         s7, a6, t0
                  c.srai       a4, 22
                  sltiu        a3, t5, 1377
                  add          s3, t4, a3
                  c.add        a4, t6
                  csrrwi       zero, 0x340, 27
                  rem          s11, t1, s8
                  sltu         s0, t2, s11
                  csrrs        t5, 0x340, zero
                  c.andi       a4, 29
                  csrrci       a4, 0x340, 0
                  csrrwi       t3, 0x340, 30
                  auipc        t3, 99939
                  c.andi       a3, 2
                  c.addi4spn   a5, sp, 48
                  addi         zero, a2, -1448
                  mulhu        s9, a3, a6
                  divu         a5, s5, t5
                  sra          s3, t6, sp
                  csrrci       a0, 0x340, 10
                  c.li         a5, -1
                  slt          s6, t3, s10
                  slt          ra, t2, a0
                  slti         a6, ra, 442
                  addi         s6, a2, -505
                  c.andi       a4, 21
                  c.mv         t5, s11
                  divu         s0, t0, t6
                  mulh         s6, t5, zero
                  auipc        t3, 88496
                  csrrwi       t0, 0x340, 27
                  div          s6, s11, s0
                  c.addi4spn   a5, sp, 544
                  xori         s5, a1, -1866
                  mulhu        t4, zero, t5
                  csrrci       s6, 0x340, 24
                  xor          s9, s2, t4
                  or           a4, a4, s11
                  slli         s5, t2, 17
                  xori         t0, s3, 165
                  slti         s1, a3, -1078
                  c.addi       s2, -1
                  slti         t3, sp, -1419
                  c.nop
                  c.add        a0, t6
                  nop
                  csrrc        s8, 0x340, zero
                  csrrwi       a6, 0x340, 15
                  csrrwi       t4, 0x340, 3
                  remu         sp, t2, s7
                  divu         a7, t2, a1
                  csrrsi       ra, 0x340, 24
                  mulh         s9, a0, a3
                  c.addi16sp   sp, 176
                  c.add        s0, a7
                  slli         t3, s8, 28
                  c.slli       a2, 23
                  xor          s5, t3, t5
                  csrrw        s1, 0x340, a3
                  ori          s3, a4, 979
                  slt          t4, s3, s10
                  csrrwi       t3, 0x340, 7
                  srl          a2, a2, a2
                  c.addi4spn   s1, sp, 800
                  c.addi4spn   a0, sp, 880
                  sra          s11, s7, a6
                  c.nop
                  csrrs        a0, 0x340, ra
                  c.sub        a0, s1
                  ori          s5, s0, 427
                  c.li         a0, 5
                  xor          t2, a5, s0
                  srl          s10, s4, zero
                  sltu         tp, a7, a4
                  add          s5, t4, sp
                  slt          a0, s2, s2
                  c.li         a0, 8
                  or           gp, ra, a0
                  c.add        t3, t3
                  csrrc        a0, 0x340, t6
                  slti         s1, a7, -1509
                  addi         s11, zero, 1914
                  csrrs        s9, 0x340, zero
                  srai         a7, s8, 12
                  csrrw        sp, 0x340, t4
                  or           a7, s2, a0
                  xori         t3, a4, -587
                  c.addi4spn   a5, sp, 992
                  csrrci       s11, 0x340, 0
                  csrrwi       sp, 0x340, 9
                  csrrwi       ra, 0x340, 10
                  slli         s0, s2, 29
                  sra          s1, a4, s8
                  xor          t0, t1, s4
                  and          tp, t2, a1
                  c.andi       a0, 17
                  and          s5, a0, t5
                  mulh         a0, zero, a0
                  rem          s3, a4, gp
                  c.nop
                  auipc        tp, 471418
                  c.slli       ra, 11
                  div          s2, t4, a1
                  sll          tp, s9, a3
                  c.and        s1, a3
                  csrrw        gp, 0x340, t0
                  srl          s10, t3, s5
                  slt          a5, s8, s9
                  c.addi16sp   sp, 80
                  c.addi       s5, -1
                  slti         s0, tp, 1783
                  c.srli       a3, 5
                  c.addi       s5, -1
                  rem          s3, s8, a4
                  c.addi16sp   sp, -16
                  csrrsi       t0, 0x340, 25
                  remu         s11, s1, a1
                  slt          s11, t0, ra
                  divu         s10, s3, t0
                  sll          a7, a3, s10
                  c.xor        a4, a1
                  c.addi16sp   sp, -16
                  c.li         gp, 13
                  csrrw        s6, 0x340, s8
                  c.li         s1, -1
                  c.or         s0, a0
                  csrrci       a6, 0x340, 27
                  c.xor        a3, a4
                  srl          s8, a7, ra
                  c.slli       s8, 15
                  sra          s5, s11, t0
                  c.addi16sp   sp, 464
                  srl          s10, a2, a7
                  sltiu        a7, a3, -728
                  c.lui        s6, 9
                  csrrc        t2, 0x340, t1
                  andi         s3, gp, -1693
                  divu         t3, s8, s1
                  csrrci       s6, 0x340, 0
                  c.addi       a6, -1
                  andi         zero, s8, -1887
                  c.srai       s1, 8
                  c.srai       s0, 24
                  c.lui        a5, 23
                  xor          t3, s0, s10
                  srli         t3, ra, 28
                  c.or         s0, a1
                  sub          a3, s7, t2
                  slt          gp, s5, s4
                  c.and        a4, a1
                  c.sub        a4, a2
                  slti         s7, t4, -1660
                  c.sub        a4, a2
                  c.srli       a0, 22
                  auipc        a7, 67058
                  xor          a5, s9, s9
                  divu         s6, ra, s8
                  mulhsu       s5, s5, s4
                  c.nop
                  slt          a5, t2, s7
                  sltu         a6, t2, s7
                  c.addi4spn   s0, sp, 576
                  and          s0, t6, t3
                  slli         t5, t1, 23
                  slt          s6, a0, a7
                  srli         t2, a5, 10
                  auipc        s2, 266251
                  slt          s9, s3, s10
                  csrrw        tp, 0x340, t4
                  remu         t3, a2, zero
                  c.addi       t3, -1
                  c.lui        s4, 28
                  sltu         t3, s7, a0
                  mulhu        s11, a0, s2
                  mul          s7, s7, s8
                  and          s4, s3, s2
                  auipc        a0, 683985
                  csrrc        s3, 0x340, tp
                  auipc        s5, 1000238
                  andi         a6, s11, -1792
                  c.addi4spn   a4, sp, 912
                  nop
                  c.slli       t5, 7
                  slt          t3, s11, a0
                  srai         gp, t2, 22
                  or           sp, s4, t3
                  c.srai       a4, 29
                  slt          s3, t2, s10
                  div          s6, s11, t6
                  sra          a0, zero, a2
                  csrrsi       s11, 0x340, 27
                  sltiu        gp, s3, 657
                  c.and        a4, a1
                  sltiu        s9, ra, 1192
                  and          sp, t0, s8
                  c.srli       a4, 9
                  c.and        s0, a1
                  c.srli       a2, 14
                  csrrci       zero, 0x340, 0
                  nop
                  sub          a7, a2, gp
                  slli         s7, t1, 12
                  rem          a2, t2, s8
                  remu         t5, a4, a5
                  c.sub        a0, a5
                  c.or         a5, a4
                  c.li         s1, 11
                  sltu         ra, a2, s9
                  srli         s7, s9, 8
                  andi         t2, s9, 504
                  srl          zero, sp, t4
                  add          s8, a7, s3
                  csrrci       tp, 0x340, 0
                  and          zero, t1, t4
                  add          s4, s2, a7
                  c.and        a4, s1
                  srl          a2, s0, a1
                  mulhsu       a4, s4, ra
                  and          a4, s4, a5
                  c.xor        a0, a5
                  srli         t5, s4, 21
                  c.slli       t3, 7
                  div          a7, t0, a2
                  ori          s8, zero, -1957
                  c.srli       a5, 2
                  c.andi       a2, 18
                  xor          a3, t1, t3
                  csrrwi       s7, 0x340, 4
                  csrrc        s10, 0x340, zero
                  c.andi       a4, -1
                  andi         s5, gp, 1659
                  mulhsu       a3, t0, a0
                  nop
                  sra          a3, t6, a7
                  sll          s7, a3, zero
                  sltu         t3, t5, a7
                  csrrs        s5, 0x340, zero
                  lui          s2, 863258
                  ori          a0, ra, 2010
                  xori         t3, a5, -12
                  c.xor        s1, a2
                  lui          s10, 696930
                  lui          s6, 953291
                  auipc        t2, 62837
                  csrrci       s5, 0x340, 11
                  c.add        sp, s2
                  slti         zero, a6, -448
                  c.mv         s8, a1
                  ori          t0, t6, -1053
                  mulhu        s2, a7, s1
                  c.addi16sp   sp, 208
                  slt          s11, a3, s11
                  c.lui        a6, 13
                  csrrc        tp, 0x340, s10
                  csrrsi       s9, 0x340, 15
                  c.addi16sp   sp, -16
                  c.addi       a2, 21
                  csrrsi       tp, 0x340, 19
                  csrrw        t0, 0x340, s6
                  remu         a6, sp, s7
                  c.lui        t4, 30
                  sltu         a5, sp, a3
                  mulhu        s6, sp, tp
                  sltiu        t0, s0, 1418
                  c.srli       a3, 6
                  slli         sp, ra, 6
                  mulh         a5, gp, s10
                  mulhsu       s3, a2, t4
                  c.addi       a5, -1
                  mulhu        a3, s1, s10
                  csrrsi       gp, 0x340, 16
                  c.sub        a0, a5
                  c.slli       ra, 13
                  andi         s8, s9, -381
                  csrrs        s10, 0x340, a2
                  rem          s0, a7, a3
                  c.srli       a3, 4
                  rem          sp, s8, s7
                  or           t2, s10, sp
                  c.and        s1, s1
                  mulhu        s8, a1, s5
                  c.lui        a4, 7
                  c.xor        a4, a3
                  csrrs        t5, 0x340, zero
                  csrrsi       tp, 0x340, 17
                  mulhsu       t2, t4, s6
                  csrrwi       t2, 0x340, 6
                  csrrs        a5, 0x340, s0
                  sltiu        s10, a7, 1348
                  sub          s2, s4, s9
                  csrrsi       gp, 0x340, 0
                  mulh         s3, tp, a1
                  csrrci       s10, 0x340, 29
                  remu         a3, t1, a5
                  csrrc        tp, 0x340, zero
                  csrrci       s11, 0x340, 10
                  sltu         a2, t5, s1
                  c.srai       a4, 15
                  c.add        t2, s5
                  c.srli       a5, 31
                  c.and        a4, a5
                  addi         s8, a6, -1338
                  c.nop
                  rem          s11, tp, a4
                  xori         t2, s9, -1156
                  csrrwi       t4, 0x340, 6
                  c.addi4spn   s1, sp, 800
                  sltu         s2, t3, t1
                  sll          t2, s0, sp
                  c.srai       s0, 17
                  xor          a6, s3, s1
                  c.andi       a2, 2
                  sra          s0, ra, s3
                  c.addi16sp   sp, -16
                  c.addi16sp   sp, 304
                  and          gp, s7, t2
                  or           t5, sp, a7
                  c.li         a0, -1
                  csrrc        s5, 0x340, tp
                  c.slli       tp, 20
                  c.xor        a3, a5
                  mul          a2, s1, t4
                  divu         s5, a2, a0
                  andi         gp, t5, 1726
                  mulh         a7, s7, s2
                  c.and        a4, s1
                  c.xor        s1, a5
                  xori         s0, s2, -2
                  mul          s3, t0, a0
                  c.nop
                  c.mv         a7, a7
                  slli         t4, s9, 25
                  remu         s5, s10, t1
                  mulhsu       s9, s5, s1
                  mulh         a3, t6, t6
                  auipc        zero, 634418
                  mulhsu       s3, t4, a7
                  divu         s2, s5, a1
                  srl          s11, t2, a6
                  mulhsu       s7, a3, a4
                  div          a2, s8, t0
                  c.sub        a0, a3
                  sltiu        s4, s3, -617
                  c.srai       a5, 31
                  c.addi       s9, -1
                  srl          tp, gp, a4
                  c.slli       a0, 24
                  div          a7, tp, s10
                  mulhu        t0, a3, t2
                  xor          t4, s0, t6
                  rem          a7, ra, s5
                  div          a4, s0, sp
                  c.srli       a4, 1
                  csrrwi       t4, 0x340, 27
                  mulhu        t2, s11, tp
                  srli         s5, a5, 6
                  srli         s2, s0, 25
                  mulhu        s8, a5, a6
                  andi         t2, a1, -1964
                  auipc        t4, 986597
                  or           zero, a6, a1
                  c.sub        a5, a2
                  mulh         a6, s7, s6
                  c.and        a3, a5
                  c.srli       a0, 23
                  mulhu        a0, zero, s3
                  sll          t2, a6, zero
                  c.srai       s1, 3
                  or           a0, s7, t4
                  xor          a3, s11, t6
                  c.lui        s2, 29
                  c.and        s0, a3
                  slli         a0, s2, 15
                  srai         s2, a4, 24
                  divu         s7, a2, sp
                  c.mv         s11, s10
                  c.li         a3, 12
                  slli         a0, s3, 11
                  divu         ra, s2, a1
                  c.lui        t2, 28
                  and          s11, s0, s5
                  c.and        a5, a4
                  div          t3, a7, gp
                  ori          t0, s0, -771
                  lui          s9, 390198
                  sra          s11, t5, s5
                  mulh         s3, s11, a6
                  csrrw        s0, 0x340, t2
                  rem          a2, s9, a2
                  csrrsi       s6, 0x340, 14
                  sub          s2, gp, s3
                  addi         s10, s5, -88
                  csrrci       t5, 0x340, 11
                  mulhu        s2, a4, a1
                  remu         a3, t1, a3
                  mul          t2, t3, s0
                  sll          s10, t2, a6
                  c.slli       s2, 12
                  c.mv         s3, s10
                  mulhsu       a4, s9, t3
                  slti         t4, ra, -373
                  c.nop
                  csrrwi       t5, 0x340, 6
                  divu         sp, t1, t0
                  addi         s2, s1, -590
                  c.xor        s0, a0
                  rem          s11, a0, sp
                  xor          t4, s2, t5
                  rem          ra, ra, s10
                  and          a3, s6, s9
                  auipc        ra, 289712
                  csrrci       t4, 0x340, 31
                  c.sub        a3, a0
                  c.andi       a0, -1
                  mulhsu       sp, t5, gp
                  ori          sp, a6, 1917
                  c.sub        s0, a5
                  srai         a2, s3, 24
                  sll          s1, ra, a3
                  srl          t3, t6, a5
                  c.addi4spn   a2, sp, 496
                  remu         a5, t6, t3
                  ori          s2, s2, 1596
                  add          a0, s5, a5
                  add          t0, s9, s7
                  ori          a0, t6, 1114
                  mulhsu       gp, s5, t4
                  c.srai       s0, 9
                  c.andi       a4, -1
                  c.lui        a5, 31
                  c.lui        a3, 23
                  c.lui        s3, 13
                  csrrci       a5, 0x340, 0
                  c.add        s3, s4
                  c.addi4spn   s0, sp, 384
                  addi         ra, t4, 1026
                  sltu         tp, a0, a3
                  c.nop
                  csrrsi       s3, 0x340, 13
                  c.add        t3, a5
                  xori         tp, s9, -154
                  mulhu        tp, s7, a5
                  add          a3, a7, s11
                  or           t2, a0, a3
                  and          s3, s9, t5
                  slt          t3, s10, s9
                  c.andi       a4, 31
                  c.nop
                  nop
                  csrrc        t3, 0x340, zero
                  csrrwi       t4, 0x340, 15
                  c.add        s5, t6
                  mulhu        a4, s2, s7
                  c.lui        t4, 4
                  sub          t2, a4, s5
                  sra          s9, ra, s1
                  mulhsu       s2, t3, s0
                  rem          s2, a7, s1
                  c.addi       a7, -1
                  slti         s10, s1, 2025
                  c.srli       a3, 12
                  divu         ra, ra, a0
                  mulhsu       tp, zero, a3
                  add          a7, s3, s9
                  mulh         s10, a3, s6
                  slt          zero, a2, s8
                  sltiu        t3, a6, 1659
                  slti         t2, a6, 1522
                  c.li         s8, 31
                  xor          ra, a6, a3
                  csrrw        sp, 0x340, sp
                  rem          s0, s6, t0
                  c.add        s6, s4
                  c.nop
                  c.xor        a5, a2
                  c.andi       a0, -1
                  or           s10, s10, s0
                  c.lui        ra, 23
                  xor          t3, t3, t5
                  csrrwi       s6, 0x340, 9
                  remu         a6, s11, ra
                  and          a0, a6, a4
                  andi         a4, a2, -1695
                  divu         sp, s0, t2
                  c.addi       t2, -1
                  c.lui        t3, 31
                  c.addi       s4, 13
                  sltu         t2, t1, s9
                  c.addi       sp, -1
                  divu         t3, t5, a7
                  c.addi       gp, 18
                  mulhsu       s10, t5, t6
                  div          s1, a5, t5
                  csrrci       t0, 0x340, 0
                  slt          s0, a2, t0
                  andi         a7, zero, 180
                  c.sub        a5, a0
                  c.add        tp, tp
                  remu         a2, s3, s9
                  c.andi       s0, -1
                  nop
                  csrrci       s4, 0x340, 0
                  sra          s1, s1, s0
                  c.mv         a0, s11
                  slti         sp, a4, 142
                  xor          a3, a2, t1
                  srli         s9, s2, 12
                  auipc        sp, 345582
                  csrrsi       a7, 0x340, 0
                  nop
                  lui          s9, 779525
                  slli         s10, s11, 19
                  csrrw        s0, 0x340, a6
                  divu         t4, tp, s3
                  c.srai       a0, 3
                  srli         a7, sp, 21
                  csrrw        s6, 0x340, s9
                  srai         t5, a6, 9
                  remu         s6, s8, sp
                  mulh         t5, a0, s4
                  srli         s6, s7, 29
                  auipc        tp, 492831
                  c.addi       sp, -1
                  c.mv         a5, s9
                  mul          a5, a0, a6
                  c.mv         a2, s5
                  xor          a6, s0, s6
                  srli         tp, s0, 2
                  csrrw        ra, 0x340, ra
                  c.add        tp, a2
                  c.addi16sp   sp, -16
                  xori         a0, t5, -1029
                  mulhsu       sp, s2, t2
                  xori         a5, t0, -1310
                  mulh         zero, zero, t5
                  c.srli       s1, 12
                  nop
                  xori         s10, s11, 1393
                  sra          s8, s1, a5
                  srai         gp, gp, 13
                  div          t4, zero, s1
                  lui          t2, 485032
                  slt          s9, t4, s10
                  auipc        s3, 649722
                  c.and        s1, a5
                  sub          a3, t3, a4
                  c.nop
                  remu         s3, a1, zero
                  andi         t4, s4, 34
                  remu         s0, s8, s7
                  srl          t3, t5, ra
                  nop
                  c.addi16sp   sp, 240
                  c.addi4spn   a5, sp, 1008
                  c.and        a5, s0
                  remu         a7, a7, a4
                  mul          a5, a3, s2
                  and          s8, a2, a1
                  csrrsi       s7, 0x340, 0
                  c.andi       a3, -1
                  sll          s10, a0, s7
                  c.xor        a3, a3
                  xori         s2, t5, -1258
                  slti         ra, a6, -862
                  mulhu        s6, ra, s11
                  srli         s2, s6, 24
                  xor          t2, s4, a6
                  sra          ra, t0, s2
                  c.sub        s1, a5
                  xori         tp, s2, -380
                  sll          a5, s11, s5
                  csrrci       zero, 0x340, 9
                  csrrwi       a0, 0x340, 29
                  c.or         s0, a4
                  srl          t5, sp, s9
                  slti         zero, t4, -1510
                  remu         s1, a2, s3
                  c.srli       s0, 9
                  c.xor        s0, a0
                  csrrsi       s10, 0x340, 0
                  nop
                  addi         s0, a2, 1490
                  srai         s8, s10, 0
                  c.xor        a3, a3
                  nop
                  c.slli       s9, 4
                  xori         ra, s6, -1813
                  sltiu        s7, s9, -1987
                  mulh         gp, s3, gp
                  c.or         s0, a2
                  slt          s5, a6, s10
                  nop
                  xori         s7, a5, -299
                  divu         t0, zero, t2
                  c.addi       a5, -1
                  and          s1, t2, s5
                  auipc        zero, 195501
                  sra          s2, s8, gp
                  xori         s0, a2, -1313
                  c.addi4spn   a4, sp, 32
                  c.sub        s0, a1
                  srli         s6, s3, 2
                  c.add        a3, a3
                  nop
                  c.lui        gp, 30
                  lui          t0, 355390
                  c.xor        a2, a1
                  or           t0, t3, s6
                  c.addi16sp   sp, 224
                  c.srai       s0, 21
                  andi         t4, t2, 2026
                  csrrw        s9, 0x340, t2
                  srl          s11, s7, a3
                  c.mv         a2, t4
                  c.and        s1, a1
                  add          t5, s3, sp
                  or           s8, a2, t3
                  c.srli       a4, 23
                  c.li         s9, 28
                  sll          s0, ra, s7
                  csrrc        ra, 0x340, zero
                  csrrc        sp, 0x340, s1
                  c.or         a5, a5
                  mul          s10, a2, s4
                  c.add        s10, s8
                  rem          s6, t5, a7
                  c.add        a7, t3
                  remu         s11, t4, s8
                  c.addi16sp   sp, 48
                  c.lui        t0, 31
                  c.addi       t4, 4
                  mulh         a4, s8, ra
                  andi         a4, t4, 1591
                  and          s11, t0, t6
                  csrrc        zero, 0x340, s9
                  sll          ra, s2, s5
                  c.addi16sp   sp, 240
                  xori         zero, a0, -1490
                  slti         a6, t5, -2019
                  remu         t0, a4, s6
                  c.and        a5, a0
                  mul          a2, zero, zero
                  xor          s10, s5, ra
                  csrrsi       s2, 0x340, 0
                  slti         t5, s6, 637
                  mul          a5, ra, a5
                  sub          tp, a5, t4
                  sltiu        s5, s0, -321
                  c.xor        a3, s0
                  csrrwi       zero, 0x340, 3
                  div          a6, gp, ra
                  c.add        s1, a2
                  csrrwi       a6, 0x340, 0
                  c.mv         t2, s1
                  ori          ra, s5, -405
                  c.mv         s9, s2
                  srl          s10, sp, a4
                  div          t2, s1, a5
                  c.and        a0, a5
                  c.or         s1, a4
                  srai         t0, t4, 18
                  addi         t4, s9, 1440
                  srli         s5, tp, 21
                  divu         s7, t5, s1
                  divu         a5, s0, tp
                  c.and        a2, a2
                  c.nop
                  c.lui        ra, 24
                  mul          a0, s1, a7
                  csrrs        t2, 0x340, zero
                  c.srli       a5, 7
                  add          gp, t3, a3
                  c.lui        a5, 26
                  c.nop
                  auipc        s8, 229554
                  divu         t4, a2, t1
                  ori          a6, zero, -1913
                  c.addi16sp   sp, -16
                  c.slli       a6, 16
                  ori          s6, ra, 649
                  sltu         a7, s9, s7
                  csrrci       s10, 0x340, 0
                  slt          zero, s0, s5
                  slt          tp, a7, t3
                  slti         t5, t0, 1265
                  csrrc        t2, 0x340, zero
                  sltu         a0, t3, s7
                  slli         t0, s9, 7
                  xori         gp, zero, -428
                  csrrwi       s5, 0x340, 1
                  csrrwi       s7, 0x340, 10
                  c.sub        s1, s1
                  srli         s9, zero, 10
                  csrrwi       a3, 0x340, 3
                  and          s5, t5, s1
                  remu         t3, t6, tp
                  c.li         a5, -1
                  csrrw        s9, 0x340, s10
                  sll          a5, s8, s4
                  mulhsu       s0, gp, a1
                  c.addi4spn   a4, sp, 192
                  slli         s4, s2, 5
                  sltiu        s6, s11, -759
                  rem          s0, s8, s6
                  slti         tp, s0, -983
                  slli         s6, sp, 23
                  ori          t4, tp, -780
                  csrrs        a5, 0x340, zero
                  slti         s4, ra, -1405
                  divu         s11, t2, t2
                  nop
                  mulh         s5, zero, tp
                  slti         t2, gp, 7
                  c.andi       s0, 19
                  csrrc        s1, 0x340, t4
                  csrrwi       s10, 0x340, 11
                  c.nop
                  add          t3, a3, s7
                  slti         a3, s9, -591
                  xori         ra, a6, -1294
                  c.add        s9, t2
                  slli         s4, s0, 8
                  sra          sp, s6, a3
                  slt          s3, s2, a3
                  lui          s1, 140774
                  c.slli       a0, 21
                  c.nop
                  csrrw        t2, 0x340, s8
                  c.or         s0, s0
                  div          s5, a6, a4
                  and          a4, t3, s8
                  lui          a5, 603720
                  sltiu        s2, t6, 218
                  c.li         t4, -1
                  srl          t3, t0, s10
                  c.addi4spn   s0, sp, 624
                  addi         gp, gp, -781
                  csrrc        s4, 0x340, a0
                  mul          s11, a4, s4
                  rem          s3, s7, s5
                  xori         s3, tp, -1018
                  div          s6, s3, zero
                  csrrci       tp, 0x340, 29
                  auipc        s0, 837679
                  xori         a3, t6, -276
                  c.srai       s1, 31
                  c.or         a4, s0
                  xori         a5, a0, -357
                  c.nop
                  csrrsi       s3, 0x340, 25
                  slti         t2, zero, 446
                  sltu         a6, a6, t0
                  srai         t2, s9, 30
                  c.slli       ra, 7
                  csrrsi       sp, 0x340, 11
                  srai         a6, t0, 26
                  nop
                  c.addi4spn   a0, sp, 544
                  c.andi       a2, -1
                  sub          s11, t4, t6
                  or           a5, a6, t1
                  mul          a0, s0, s0
                  mulhu        s2, a1, s2
                  mulhu        s10, t4, s1
                  andi         s8, a0, -37
                  c.addi4spn   s0, sp, 448
                  or           a3, t3, sp
                  c.xor        a0, a4
                  c.andi       a4, 25
                  sltu         sp, a1, gp
                  slti         a0, gp, -1978
                  andi         s3, s7, -1507
                  sltu         s7, s3, s11
                  c.and        s1, a2
                  sltiu        a0, s8, 1273
                  csrrci       s0, 0x340, 0
                  mulhu        a2, t1, zero
                  mulhsu       zero, a4, s11
                  csrrsi       a4, 0x340, 0
                  c.sub        a2, s1
                  c.slli       gp, 2
                  and          a6, s6, s1
                  and          s4, s8, s1
                  rem          s6, s5, a7
                  slli         a2, a0, 17
                  csrrwi       s1, 0x340, 28
                  sltu         a2, a3, t4
                  c.andi       a5, 25
                  c.li         a6, 24
                  slli         s1, t0, 5
                  slli         s4, a6, 13
                  sra          s10, s2, zero
                  slt          a0, s4, t1
                  mulh         sp, t2, s5
                  xori         a7, s8, -1569
                  c.srai       s1, 18
                  c.addi16sp   sp, 480
                  remu         s4, t6, a0
                  c.xor        s1, a4
                  slti         t5, t5, 1391
                  c.addi       t0, 28
                  c.addi16sp   sp, -16
                  c.addi4spn   a2, sp, 944
                  andi         a3, t5, 1744
                  srli         s6, t6, 22
                  srli         t3, t4, 16
                  c.slli       s0, 21
                  remu         a4, s1, s2
                  and          a3, a2, s7
                  sub          t3, a6, sp
                  sll          s11, t5, zero
                  or           s8, s0, s8
                  remu         t0, a3, t1
                  slli         s9, s9, 0
                  csrrs        s10, 0x340, zero
                  csrrw        s0, 0x340, a6
                  sra          s2, t2, a4
                  divu         s4, t2, s4
                  sra          s4, t4, t5
                  slli         a3, a2, 14
                  csrrwi       ra, 0x340, 9
                  mul          a5, s6, zero
                  c.srai       a5, 10
                  c.xor        a3, a0
                  divu         t4, s5, ra
                  c.li         tp, 29
                  rem          s1, sp, s11
                  auipc        s1, 673028
                  add          s2, gp, a2
                  srai         s3, sp, 2
                  c.mv         s8, s10
                  xori         a3, ra, 1050
                  div          s6, tp, s7
                  mulh         a6, s8, a2
                  c.srli       s1, 7
                  or           tp, sp, s4
                  sltu         a0, a3, zero
                  remu         s10, s7, t2
                  csrrw        s5, 0x340, t4
                  c.lui        ra, 14
                  sltu         s0, s1, s4
                  divu         s3, s4, a6
                  srli         a0, s7, 23
                  auipc        a0, 619436
                  slt          s2, s7, s8
                  div          ra, a2, a7
                  xor          s0, t5, a7
                  or           tp, a3, s0
                  c.sub        s0, a0
                  divu         s9, s5, a1
                  addi         s6, a4, 57
                  c.or         a3, a0
                  div          a4, t1, s7
                  slti         a6, gp, 800
                  csrrwi       s5, 0x340, 18
                  nop
                  rem          t3, t6, zero
                  c.xor        a2, a1
                  div          t5, s1, s5
                  sll          zero, s6, s8
                  c.addi16sp   sp, -16
                  c.addi4spn   a3, sp, 112
                  addi         s11, gp, 926
                  sltu         t4, s11, zero
                  xor          a0, t2, a4
                  c.addi       a6, -1
                  slli         tp, t3, 21
                  lui          s0, 314082
                  addi         s2, a0, 1436
                  remu         tp, ra, a1
                  csrrci       a5, 0x340, 4
                  addi         s5, gp, -1921
                  sltiu        t3, s4, 884
                  csrrc        s7, 0x340, tp
                  xori         ra, a0, -631
                  sll          a7, t1, s1
                  c.or         a0, s0
                  srl          tp, t2, s8
                  div          a2, s7, a1
                  rem          a4, s6, s2
                  auipc        s0, 324086
                  c.addi       a7, -1
                  slli         s10, t3, 24
                  srli         s8, s1, 19
                  remu         s4, s6, a0
                  mulhu        s8, ra, zero
                  addi         s8, gp, -1739
                  add          s0, sp, ra
                  srl          t4, a0, t5
                  mulhu        s9, s7, ra
                  srl          s2, a0, a3
                  c.li         t4, 12
                  slti         s5, t0, -1053
                  mul          s5, sp, s11
                  andi         t4, s11, -975
                  srl          sp, gp, a1
                  divu         s2, t6, tp
                  nop
                  c.nop
                  div          a2, s5, s0
                  nop
                  sltu         s6, s1, s5
                  div          s10, s1, s0
                  c.addi16sp   sp, 272
                  div          sp, s10, t0
                  sub          s4, a1, a2
                  csrrs        s11, 0x340, zero
                  lui          s11, 1037800
                  slti         s10, sp, 405
                  csrrw        a6, 0x340, t4
                  slli         s10, a0, 10
                  and          sp, s5, a6
                  c.nop
                  csrrsi       s0, 0x340, 0
                  lui          a5, 50296
                  mulh         s7, s3, a7
                  mulhu        s1, s9, t2
                  csrrsi       a0, 0x340, 0
                  auipc        a0, 951640
                  srli         a6, t6, 9
                  lui          s3, 490648
                  mulh         s9, t6, s11
                  add          sp, t2, a6
                  csrrc        s4, 0x340, a3
                  c.xor        a2, s1
                  sltiu        a7, a1, 1630
                  c.lui        s2, 30
                  c.andi       a5, 21
                  csrrw        s5, 0x340, t5
                  c.li         a3, 6
                  c.addi       gp, -1
                  add          sp, ra, t5
                  c.srli       a0, 25
                  div          zero, s6, t0
                  c.srli       s0, 29
                  c.addi4spn   a4, sp, 288
                  c.mv         s8, a5
                  mul          s8, t4, gp
                  csrrc        t0, 0x340, zero
                  ori          ra, a4, 1871
                  nop
                  or           t3, a2, a2
                  mulh         s4, s1, s6
                  csrrwi       s2, 0x340, 29
                  divu         t3, a3, s6
                  slli         s10, s2, 11
                  ori          a3, a0, -1813
                  c.addi16sp   sp, 16
                  addi         tp, t6, -26
                  csrrs        a6, 0x340, s3
                  slti         t4, s1, -1513
                  c.xor        a3, s1
                  c.nop
                  c.slli       s3, 21
                  c.li         s2, -1
                  andi         s2, t0, -621
                  sltiu        s3, t4, 146
                  csrrs        t0, 0x340, s3
                  slli         a6, s4, 28
                  sra          s6, s4, t1
                  mulhu        s3, a4, s0
                  c.add        a6, s11
                  rem          a5, t1, s5
                  slt          a0, a6, s5
                  andi         zero, s5, 6
                  or           a7, t2, t3
                  c.sub        s1, a1
                  c.addi       t3, 24
                  srl          s6, a1, s10
                  c.add        s10, s6
                  csrrw        t3, 0x340, a4
                  rem          zero, s5, s9
                  slti         sp, s9, 7
                  addi         gp, t3, 1542
                  csrrs        s10, 0x340, s2
                  csrrw        s7, 0x340, s2
                  rem          a7, zero, t2
                  c.mv         s7, s1
                  remu         sp, t5, a3
                  nop
                  csrrwi       t4, 0x340, 1
                  srli         a4, a2, 9
                  c.srai       a4, 4
                  csrrc        a0, 0x340, s0
                  c.li         a4, -1
                  lui          s4, 734247
                  c.mv         t4, s11
                  sub          s3, zero, s1
                  srai         s5, s5, 8
                  slli         a4, zero, 21
                  addi         s10, sp, -723
                  sll          gp, s9, t0
                  mulh         gp, s0, t0
                  csrrc        s11, 0x340, zero
                  c.addi16sp   sp, -16
                  auipc        s9, 1025503
                  c.andi       s0, -1
                  c.addi16sp   sp, 256
                  ori          s7, ra, 162
                  ori          a0, sp, 1403
                  ori          a7, t1, 288
                  auipc        s2, 580241
                  andi         a4, a0, -323
                  xor          a7, t6, s9
                  csrrw        s9, 0x340, t5
                  csrrsi       s7, 0x340, 0
                  slli         a6, sp, 10
                  rem          s6, s7, a0
                  auipc        s9, 125928
                  csrrwi       s11, 0x340, 15
                  csrrwi       t3, 0x340, 19
                  mulhu        a5, s6, t6
                  srai         t0, sp, 0
                  c.addi       s7, 14
                  c.xor        a4, a5
                  mul          s11, tp, s7
                  remu         s5, t5, a1
                  c.or         s0, s1
                  c.srli       a0, 7
                  c.addi16sp   sp, -16
                  andi         s0, s5, 216
                  sltiu        a5, zero, -162
                  mulhsu       t4, s2, s8
                  andi         s5, s2, -1673
                  sub          s4, a0, t0
                  div          tp, s1, a7
                  mul          s6, t6, t1
                  sll          tp, s6, t3
                  slli         a5, a7, 16
                  c.srai       a4, 21
                  csrrw        sp, 0x340, s8
                  and          s4, a6, s3
                  lui          a7, 483344
                  nop
                  xor          s7, s4, t2
                  lui          a0, 662808
                  sltu         t4, t5, sp
                  c.slli       a4, 6
                  xor          t4, a3, s1
                  andi         t0, a5, 1118
                  div          s11, a3, a0
                  sltu         a5, a7, t6
                  slti         a6, gp, -859
                  c.add        sp, s1
                  c.srai       a2, 20
                  c.or         s1, a2
                  c.addi       s2, -1
                  andi         s2, t1, -475
                  c.addi16sp   sp, -16
                  slt          s0, a4, gp
                  c.mv         s5, s2
                  csrrc        a6, 0x340, zero
                  c.slli       s9, 27
                  srli         s3, a1, 17
                  c.and        s0, a4
                  csrrc        t0, 0x340, s8
                  mulh         a2, s2, s1
                  xori         ra, s2, 234
                  csrrwi       s2, 0x340, 31
                  sltiu        s8, s7, 1317
                  andi         ra, s2, -1239
                  sltu         s0, a0, a0
                  c.mv         a6, s4
                  c.nop
                  c.addi16sp   sp, -16
                  c.slli       t2, 11
                  c.nop
                  lui          s4, 585211
                  div          s8, t3, a6
                  addi         t4, s10, -1003
                  c.andi       a4, 28
                  c.slli       s7, 21
                  sra          gp, a1, s2
                  sltu         a7, s0, t0
                  and          s4, s3, a0
                  remu         a4, t4, a4
                  csrrc        t3, 0x340, zero
                  or           s3, ra, s9
                  csrrwi       ra, 0x340, 28
                  c.xor        s1, s0
                  and          t4, a1, zero
                  ori          s11, s7, -672
                  xor          t2, a6, a2
                  mulhsu       t5, ra, s4
                  divu         zero, a4, t3
                  mul          a7, t2, s3
                  slti         s6, t4, -1763
                  c.srai       a3, 21
                  c.addi4spn   a3, sp, 16
                  sltiu        t2, s8, -1584
                  slt          s2, t1, s4
                  ori          s5, a2, 1286
                  slti         s8, ra, -1473
                  mulh         s10, a6, t3
                  mulhu        a7, t3, a7
                  addi         a5, gp, -1885
                  ori          s1, gp, 398
                  c.lui        ra, 11
                  c.srli       s1, 16
                  c.nop
                  c.add        t0, t5
                  sub          s3, t5, s0
                  csrrsi       s9, 0x340, 9
                  mulhsu       s5, t1, a1
                  c.addi16sp   sp, -16
                  csrrw        s7, 0x340, ra
                  addi         s5, t0, -1511
                  csrrw        sp, 0x340, s8
                  c.li         a5, 1
                  c.add        a3, a6
                  slt          a7, s10, gp
                  andi         s1, s10, 1762
                  c.xor        a0, a0
                  sra          a4, s1, a5
                  sltu         sp, a2, s7
                  srl          a4, t1, a3
                  divu         s6, s10, s8
                  mulhsu       tp, t2, s2
                  mul          s9, a4, gp
                  xor          s11, s0, s7
                  c.add        gp, s5
                  sub          sp, a6, ra
                  sltu         a2, s6, t2
                  sub          gp, t6, t6
                  slt          t0, s9, s5
                  c.srli       a3, 31
                  addi         t5, t0, -1629
                  ori          a0, a0, -1262
                  c.addi16sp   sp, -16
                  slli         t3, s10, 4
                  c.andi       s0, 26
                  remu         s6, s10, t4
                  add          gp, s1, gp
                  srli         gp, t0, 21
                  c.addi       a6, -1
                  c.nop
                  divu         a7, s5, s7
                  nop
                  mulhu        s1, a5, ra
                  c.li         s4, 13
                  and          sp, a1, t1
                  csrrc        a4, 0x340, s10
                  c.and        s0, a3
                  c.addi4spn   a3, sp, 736
                  csrrc        zero, 0x340, zero
                  c.addi       t2, 31
                  csrrwi       s1, 0x340, 1
                  c.xor        s0, a0
                  c.add        s2, a1
                  mulh         a5, a1, a4
                  sltu         a3, s9, s3
                  lui          a6, 939648
                  slti         s1, t2, -474
                  or           s3, a1, s5
                  sra          s1, s0, a0
                  auipc        t3, 380928
                  xori         s3, t3, -1799
                  mulhsu       s4, t3, sp
                  mul          a7, a0, a3
                  slti         s5, s3, 243
                  divu         a0, s8, gp
                  csrrsi       s1, 0x340, 0
                  c.srli       a5, 15
                  andi         a2, s6, 607
                  rem          a6, s10, a6
                  xor          t3, a0, s0
                  c.slli       s6, 7
                  c.addi       a5, 14
                  csrrw        sp, 0x340, t4
                  slli         gp, tp, 16
                  sll          s9, t4, ra
                  c.srai       a4, 15
                  c.and        a3, a0
                  slt          t4, gp, a4
                  xori         s1, s5, -1925
                  div          s10, s9, a1
                  divu         s4, t5, sp
                  and          a2, a5, s2
                  c.li         t3, 31
                  c.andi       a0, -1
                  slli         zero, s7, 19
                  div          s10, s3, a7
                  and          tp, zero, s11
                  add          a3, s6, t6
                  csrrci       a7, 0x340, 30
                  csrrc        zero, 0x340, zero
                  slt          zero, gp, s3
                  c.mv         s4, t1
                  c.sub        a4, a3
                  csrrc        s10, 0x340, s9
                  c.slli       s0, 24
                  c.xor        a3, s0
                  c.nop
                  sra          a3, s11, t1
                  addi         a2, ra, 93
                  c.slli       t5, 8
                  mul          a3, a3, a6
                  sltu         t3, t4, s11
                  c.addi4spn   a0, sp, 784
                  slt          a5, s6, a6
                  mulhu        s3, s9, a7
                  mulhsu       t4, t1, gp
                  or           s10, ra, s9
                  c.or         s1, a4
                  c.srli       s0, 9
                  remu         tp, gp, sp
                  c.mv         a7, a2
                  andi         a5, t6, -1764
                  mulh         t2, gp, a0
                  mulhsu       zero, t5, t6
                  auipc        s1, 291315
                  xor          t4, s9, s5
                  or           ra, s0, gp
                  div          s10, t4, s6
                  sra          s5, t5, s8
                  sll          a2, s2, tp
                  csrrci       s8, 0x340, 8
                  c.srai       a0, 11
                  c.andi       a3, 11
                  c.andi       a0, 28
                  mulhsu       a7, t0, gp
                  auipc        t3, 732507
                  srai         s0, s9, 31
                  c.andi       s1, 9
                  c.li         ra, -1
                  srli         a0, t1, 12
                  srl          s0, s2, s1
                  xori         t5, t0, -1448
                  addi         a7, a6, -2020
                  divu         s3, a4, t0
                  sll          s4, t2, a7
                  mul          a3, t1, s2
                  srli         a3, gp, 18
                  c.and        a4, a5
                  c.and        a2, a1
                  c.addi4spn   a4, sp, 784
                  lui          a7, 72302
                  c.or         a4, a5
                  c.srai       s0, 5
                  c.lui        s6, 25
                  add          ra, a5, t4
                  and          zero, a4, t5
                  sub          s5, tp, a0
                  divu         a5, s3, tp
                  csrrc        a6, 0x340, s5
                  and          t5, s10, a3
                  c.srli       a3, 16
                  c.li         s1, 14
                  andi         zero, s5, -1861
                  mulhu        s10, t2, ra
                  c.mv         ra, s9
                  c.andi       s0, 9
                  mulh         t4, a5, s3
                  xor          a2, s4, s1
                  c.andi       a2, 7
                  c.srai       a2, 21
                  divu         s10, s8, s1
                  sltu         sp, a6, s0
                  c.slli       a0, 13
                  csrrw        a7, 0x340, s10
                  divu         t4, t2, t5
                  srli         a0, a6, 13
                  lui          t0, 673432
                  auipc        a7, 708960
                  c.or         a4, s1
                  rem          t3, s6, a7
                  or           t2, t3, a3
                  div          s6, a2, s2
                  auipc        a7, 438458
                  lui          s3, 580293
                  div          t5, tp, s7
                  srl          t5, s11, s5
                  sll          zero, s5, a5
                  c.mv         a5, gp
                  add          a2, t2, s2
                  slli         s6, a0, 7
                  slt          t2, t5, t6
                  div          tp, zero, s7
                  c.mv         a3, t3
                  or           tp, gp, s3
                  andi         a0, s6, -716
                  csrrs        s1, 0x340, zero
                  mulhu        a0, t5, zero
                  sltiu        s0, gp, 24
                  sltiu        s7, a1, -735
                  c.addi       s5, 18
                  mulhsu       a4, t6, t1
                  c.sub        a2, a3
                  srai         a4, s10, 9
                  or           s7, s8, a1
                  and          s9, a5, s9
                  sltiu        s4, s8, -1190
                  auipc        ra, 286977
                  sltiu        tp, a3, 1262
                  andi         s3, s11, -1817
                  csrrci       s10, 0x340, 0
                  c.addi16sp   sp, -16
                  sra          s11, s11, s1
                  nop
                  csrrwi       a5, 0x340, 21
                  divu         s0, tp, a0
                  remu         a2, t0, s1
                  mulhu        s10, t2, s6
                  divu         s10, s4, ra
                  c.li         s2, -1
                  c.sub        a2, a0
                  csrrs        s9, 0x340, tp
                  c.mv         s5, a4
                  xor          s8, s3, s0
                  c.nop
                  c.addi       gp, -1
                  addi         s3, sp, 283
                  mulhu        s0, gp, a5
                  add          t0, zero, sp
                  mulhsu       a2, s10, s5
                  c.sub        a0, s0
                  auipc        ra, 665363
                  c.or         a0, a3
                  c.nop
                  sll          t4, t2, a3
                  c.li         t3, -1
                  c.mv         t4, t6
                  sll          a7, a0, a3
                  csrrc        s6, 0x340, s2
                  and          zero, s11, ra
                  lui          a0, 865231
                  c.li         s6, -1
                  c.mv         s2, s10
                  c.slli       s2, 3
                  c.li         s7, -1
                  rem          s10, s8, tp
                  c.sub        a4, a3
                  lui          a5, 405221
                  c.li         s1, 20
                  c.add        s7, s3
                  c.addi16sp   sp, -16
                  c.srai       a0, 17
                  lui          a2, 400766
                  sub          a2, t3, s8
                  c.add        s9, a0
                  ori          t4, ra, 1338
                  c.nop
                  slt          s6, ra, a4
                  slt          s5, s2, t0
                  c.add        s11, s2
                  c.and        a4, a4
                  mulhu        a5, s0, a0
                  or           ra, s0, t4
                  divu         a5, a1, a4
                  xori         t2, ra, 103
                  c.addi       a0, 24
                  mulhsu       tp, s9, t2
                  csrrw        s5, 0x340, s6
                  c.xor        a0, a0
                  c.slli       gp, 24
                  c.li         tp, 23
                  csrrwi       t3, 0x340, 17
                  lui          a0, 855456
                  or           s11, a4, a1
                  csrrwi       t2, 0x340, 1
                  c.xor        a2, a5
                  c.addi16sp   sp, -16
                  sltiu        s3, a0, 644
                  c.lui        t3, 6
                  sra          a2, t0, zero
                  mulhu        a6, s6, s4
                  c.slli       t3, 10
                  c.and        a3, a2
                  andi         a5, s5, -492
                  csrrc        s4, 0x340, t5
                  c.sub        s1, a3
                  sll          ra, t3, a7
                  srai         s3, t4, 27
                  c.srai       a3, 14
                  c.add        a7, a3
                  csrrs        ra, 0x340, zero
                  c.andi       a0, -1
                  sra          t4, s3, a7
                  mulh         a5, s6, zero
                  remu         s6, s9, s2
                  srai         t0, a6, 27
                  c.add        tp, s3
                  c.add        a0, s11
                  xor          a6, s10, a6
                  c.addi       a3, -1
                  c.andi       a3, -1
                  sub          a7, gp, s7
                  c.nop
                  div          a4, a3, a6
                  srli         tp, s4, 15
                  c.addi16sp   sp, 304
                  mul          s8, a6, t2
                  c.srli       a5, 2
                  c.addi       s2, 1
                  c.nop
                  sltu         s0, s11, t0
                  csrrw        t0, 0x340, s9
                  mulh         a7, sp, a3
                  c.andi       a4, 7
                  add          t3, t1, a1
                  c.sub        a4, a4
                  c.xor        a2, a5
                  mul          tp, gp, gp
                  c.srli       s1, 5
                  c.mv         s2, s7
                  sltu         t5, a6, s8
                  mulhsu       t2, a5, s3
                  xor          zero, t1, s10
                  c.slli       a3, 19
                  c.srli       a0, 10
                  mulhu        s4, s1, s3
                  c.or         s0, a4
                  sub          t5, s4, s7
                  csrrs        tp, 0x340, s7
                  lui          ra, 263695
                  rem          t5, t4, tp
                  c.slli       a2, 29
                  sra          s6, zero, s0
                  sra          s6, s5, s6
                  sltu         t4, s10, s0
                  mul          s8, s5, a2
                  sll          tp, a4, t6
                  auipc        s10, 759888
                  addi         sp, a0, 1326
                  c.or         a2, a3
                  sll          s4, s1, a2
                  and          s8, t3, t0
                  sra          s5, s10, a1
                  rem          zero, a4, s9
                  c.li         a7, 29
                  csrrci       s9, 0x340, 3
                  csrrc        a6, 0x340, zero
                  rem          s3, t6, s8
                  csrrw        ra, 0x340, t0
                  c.andi       a5, 9
                  c.addi4spn   a0, sp, 576
                  c.and        a0, a3
                  xori         a7, s0, -1055
                  srli         a2, s0, 6
                  sra          ra, a5, t2
                  c.and        a4, a1
                  mulhu        s0, s4, a7
                  lui          s8, 817912
                  c.mv         a0, t4
                  sll          s3, s1, s7
                  mulhsu       tp, ra, sp
                  c.addi16sp   sp, -16
                  divu         a4, a2, s1
                  sub          gp, s0, t3
                  csrrsi       s4, 0x340, 27
                  srl          s9, a3, s1
                  c.and        a0, a4
                  or           s1, t6, t3
                  c.srli       a2, 31
                  xor          s3, gp, t4
                  csrrs        a4, 0x340, zero
                  srl          s7, a7, s10
                  slli         a7, s11, 17
                  csrrsi       a6, 0x340, 0
                  c.mv         t3, s5
                  sra          t3, t6, t4
                  csrrc        a7, 0x340, zero
                  csrrci       a4, 0x340, 26
                  csrrc        gp, 0x340, zero
                  csrrc        a6, 0x340, s5
                  slt          a0, s7, s6
                  ori          t5, a5, 1333
                  sub          a5, a5, a7
                  slti         t5, s0, 1585
                  csrrc        t2, 0x340, s7
                  sltu         a5, t0, a6
                  c.or         s0, a2
                  csrrc        s3, 0x340, zero
                  csrrci       s4, 0x340, 0
                  sll          a5, a7, a4
                  csrrc        a2, 0x340, zero
                  sra          ra, a4, a0
                  c.srai       a4, 2
                  andi         zero, a2, 1260
                  srl          t4, a4, a5
                  c.andi       a0, 1
                  c.add        s8, s7
                  rem          sp, a5, s10
                  mulh         a7, s1, zero
                  slti         s0, a7, -203
                  csrrsi       t5, 0x340, 0
                  sltu         t5, ra, a0
                  csrrs        s2, 0x340, a1
                  or           t0, tp, s5
                  srli         s7, s9, 5
                  slti         s8, a4, -186
                  auipc        sp, 1006476
                  c.addi4spn   a0, sp, 128
                  sltu         a7, t6, gp
                  c.andi       a0, 30
                  sll          t3, t6, s11
                  xor          s2, s6, s2
                  sll          ra, a4, sp
                  mulhsu       zero, s10, zero
                  mulhsu       ra, a4, t0
                  remu         tp, s0, tp
                  mulh         s6, a2, t6
                  addi         ra, t5, 1831
                  srl          s9, a4, ra
                  sltu         ra, a4, t3
                  c.addi16sp   sp, 288
                  c.li         a7, -1
                  c.mv         s4, a0
                  csrrs        sp, 0x340, zero
                  add          s1, s1, t2
                  csrrs        s10, 0x340, gp
                  and          a5, s6, t5
                  divu         tp, s10, s7
                  sra          a7, a1, t0
                  mulhsu       s11, gp, s5
                  csrrwi       a2, 0x340, 27
                  slt          s11, s11, t2
                  sll          s9, s1, t3
                  csrrc        s8, 0x340, zero
                  or           a4, a7, s1
                  slli         s1, a7, 22
                  mul          a2, s4, s9
                  mulhsu       s0, a2, t5
                  xori         s7, s4, 1263
                  andi         t4, sp, 312
                  addi         t3, a3, -1153
                  srli         t5, a0, 8
                  remu         t5, s5, a6
                  mulhsu       s5, t3, s7
                  c.sub        a4, a2
                  auipc        sp, 858211
                  sltu         s10, s7, a6
                  and          t4, s4, a0
                  srai         t2, sp, 8
                  sub          s8, t4, s5
                  csrrs        s4, 0x340, t3
                  lui          gp, 107201
                  c.srai       s0, 31
                  c.slli       s2, 25
                  auipc        a3, 178484
                  c.andi       a5, 22
                  c.mv         a3, a4
                  addi         s11, a3, -1623
                  sra          s3, a7, gp
                  sub          a2, t3, t5
                  c.sub        a2, s0
                  sltiu        s6, s2, 1588
                  addi         s6, t6, -1861
                  and          a7, s4, a1
                  c.and        s1, a0
                  csrrsi       s5, 0x340, 9
                  div          a2, gp, t0
                  c.andi       a3, 29
                  add          s11, gp, a3
                  add          zero, s1, a2
                  c.lui        s0, 18
                  and          s4, zero, s8
                  csrrs        gp, 0x340, s0
                  sub          s7, tp, t6
                  or           gp, a4, s10
                  divu         s5, ra, a4
                  csrrw        s7, 0x340, a2
                  srl          t0, a6, s6
                  rem          s3, s0, t5
                  c.sub        a2, a1
                  csrrw        s5, 0x340, t2
                  sub          a4, s2, s4
                  rem          s10, a5, a3
                  c.srli       a3, 17
                  c.andi       a2, -1
                  c.andi       a5, 17
                  c.mv         t2, a1
                  csrrw        t3, 0x340, s10
                  c.andi       a5, -1
                  csrrwi       s4, 0x340, 15
                  auipc        s1, 429395
                  c.add        s10, s3
                  sltu         s11, s7, a6
                  rem          ra, t1, gp
                  c.mv         gp, t6
                  csrrwi       s7, 0x340, 8
                  csrrsi       t2, 0x340, 0
                  xor          t5, s7, s8
                  csrrs        t5, 0x340, a4
                  csrrwi       s4, 0x340, 4
                  mulh         s6, t5, t2
                  c.andi       a4, -1
                  mulhsu       s8, s0, t6
                  divu         a3, tp, t4
                  csrrwi       s5, 0x340, 14
                  c.andi       a4, -1
                  c.addi       s1, 31
                  c.and        s0, s1
                  c.or         a0, a1
                  addi         t4, s11, 1502
                  or           gp, s8, a2
                  sra          a2, a5, a0
                  c.addi       s11, -1
                  c.lui        s10, 25
                  csrrsi       t0, 0x340, 22
                  c.nop
                  divu         s9, s10, s6
                  or           t3, s3, a2
                  c.andi       s0, -1
                  mul          tp, a6, s5
                  csrrc        s6, 0x340, zero
                  and          a7, zero, t2
                  csrrs        s5, 0x340, s0
                  csrrwi       gp, 0x340, 10
                  c.xor        a4, s1
                  srai         s3, s1, 23
                  divu         s0, s5, s10
                  mul          s5, a2, a1
                  mulh         a7, s0, gp
                  c.addi       t5, -1
                  c.li         s11, -1
                  mulhsu       a6, sp, s3
                  divu         s0, s8, s3
                  srli         s8, t0, 21
                  addi         t3, s11, 913
                  c.xor        a4, a3
                  xor          s6, s0, a2
                  c.addi16sp   sp, 288
                  c.addi       s3, 18
                  c.srli       a4, 22
                  divu         a4, t4, s1
                  c.addi16sp   sp, 176
                  sltu         a0, s4, gp
                  sub          a5, a3, a1
                  nop
                  c.add        s9, s7
                  srl          a0, s8, a2
                  c.sub        a4, a5
                  c.addi       t4, 22
                  slt          s11, t4, t1
                  c.srli       a3, 18
                  c.and        a5, a3
                  c.srai       a2, 29
                  csrrwi       a0, 0x340, 2
                  sltiu        a0, s10, 943
                  csrrci       s2, 0x340, 0
                  mulhu        t5, a7, s4
                  slti         s6, s1, -1422
                  c.addi16sp   sp, -16
                  csrrwi       s4, 0x340, 15
                  c.srai       a3, 23
                  c.srai       a2, 19
                  c.nop
                  c.add        s3, sp
                  c.and        a5, s1
                  csrrci       t0, 0x340, 0
                  mul          s2, t3, t2
                  c.andi       a3, 22
                  slt          s9, s6, a2
                  csrrsi       ra, 0x340, 20
                  c.li         sp, 16
                  csrrw        s10, 0x340, t1
                  srai         a5, gp, 24
                  c.slli       t3, 19
                  csrrsi       t5, 0x340, 0
                  lui          t2, 692884
                  xori         a7, s2, 405
                  csrrs        s6, 0x340, zero
                  ori          s7, a0, 805
                  c.slli       a0, 21
                  sra          t0, s10, s6
                  divu         t5, s9, a7
                  nop
                  srai         s6, a7, 26
                  c.mv         t4, t3
                  c.add        s9, tp
                  or           sp, s0, sp
                  ori          a4, s8, -1477
                  srai         s3, s3, 19
                  add          t4, s9, gp
                  c.and        a4, a5
                  sra          a4, sp, t3
                  mulh         s8, zero, t0
                  csrrsi       t0, 0x340, 12
                  c.addi4spn   a3, sp, 400
                  c.sub        s1, a1
                  slli         s2, a5, 22
                  mulhsu       s11, t6, t2
                  c.lui        tp, 7
                  c.xor        a2, a4
                  sra          s3, tp, s6
                  srl          s7, a4, s6
                  add          s9, s1, t2
                  lui          a2, 547717
                  srl          sp, t0, s7
                  c.sub        a0, s0
                  c.nop
                  c.sub        s0, s1
                  c.add        a4, a0
                  xor          s3, t1, tp
                  slti         s1, sp, -451
                  nop
                  nop
                  sltu         s7, a2, a2
                  c.nop
                  slli         s2, sp, 16
                  lui          s6, 583275
                  c.addi4spn   a0, sp, 160
                  xor          s8, s8, t0
                  xor          s0, zero, s8
                  c.andi       a5, -1
                  sll          s0, a3, s8
                  srli         sp, sp, 3
                  c.addi4spn   s1, sp, 800
                  xor          t0, s6, a3
                  csrrsi       t4, 0x340, 0
                  c.nop
                  sltiu        s8, s6, 1949
                  mul          s3, s3, t1
                  nop
                  sub          t0, sp, s6
                  mulhu        t3, sp, s9
                  sltiu        a5, t6, -318
                  divu         s3, t1, s5
                  c.li         s1, 13
                  slti         s9, a4, 864
                  csrrc        tp, 0x340, zero
                  c.addi       s7, 12
                  c.slli       ra, 30
                  csrrs        zero, 0x340, a6
                  csrrs        s5, 0x340, zero
                  sltu         s0, t0, a4
                  addi         a6, s1, -532
                  c.or         a2, a5
                  srli         a4, ra, 26
                  xori         t0, t2, 1473
                  c.addi       t2, -1
                  c.add        s0, t5
                  mulh         s0, t3, s4
                  csrrwi       t0, 0x340, 17
                  c.li         a0, 9
                  div          a3, s5, t5
                  c.and        a0, s0
                  c.srai       a0, 12
                  divu         a7, a0, t4
                  lui          t2, 145508
                  csrrwi       a5, 0x340, 12
                  c.andi       a5, 16
                  c.srli       a0, 31
                  mulhu        s8, a5, s3
                  mul          s2, t1, a4
                  csrrc        s8, 0x340, zero
                  c.add        a2, s7
                  or           zero, sp, s6
                  or           s8, s2, t4
                  mulh         s2, a5, gp
                  c.nop
                  c.slli       a3, 16
                  csrrs        a0, 0x340, zero
                  c.li         a2, 26
                  c.xor        a0, a3
                  mulhu        gp, s8, s8
                  ori          t3, t6, 262
                  xor          t0, s6, a1
                  slli         s1, s6, 12
                  srl          s5, s3, t1
                  sll          s8, s9, a0
                  sub          s9, t1, s3
                  srai         s0, a2, 1
                  c.or         a2, a5
                  slti         t2, s1, 557
                  divu         s7, t1, t4
                  addi         tp, s1, 602
                  xori         a5, s2, -1931
                  auipc        t5, 628990
                  sll          a6, ra, t0
                  and          gp, t3, zero
                  lui          s0, 63239
                  remu         s9, s10, t2
                  mulh         s1, s11, zero
                  c.addi       a0, -1
                  slli         tp, a7, 11
                  rem          s7, s10, t5
                  xori         zero, t5, 586
                  csrrw        t0, 0x340, a0
                  add          a4, a3, a6
                  c.andi       a4, -1
                  c.lui        s9, 29
                  csrrci       a2, 0x340, 10
                  ori          s1, ra, 208
                  csrrs        tp, 0x340, s3
                  or           s7, a1, s1
                  auipc        a7, 95027
                  c.mv         sp, t2
                  divu         tp, t6, s8
                  sll          t4, a3, t5
                  sub          t4, t2, a0
                  csrrci       gp, 0x340, 0
                  mulhu        t5, s7, s6
                  c.and        s1, a5
                  xori         a6, a2, -2008
                  csrrwi       zero, 0x340, 26
                  and          a0, a7, t6
                  nop
                  rem          t5, a2, t0
                  c.sub        a2, s0
                  auipc        a4, 90287
                  c.addi16sp   sp, -16
                  auipc        t4, 841813
                  c.xor        a0, a1
                  c.xor        a3, s1
                  slt          s0, t5, a0
                  slli         s1, s3, 16
                  rem          tp, t6, sp
                  srl          s7, s5, t5
                  sra          t5, tp, t2
                  c.li         s0, 20
                  slli         ra, s0, 21
                  mul          sp, s10, s9
                  csrrsi       a6, 0x340, 6
                  addi         s0, gp, 707
                  c.addi16sp   sp, 224
                  csrrw        gp, 0x340, a5
                  xor          s4, sp, t5
                  c.sub        s0, a5
                  c.srai       a5, 10
                  andi         a6, s9, 1149
                  c.srai       a5, 5
                  c.srai       a3, 5
                  c.mv         s4, s0
                  c.andi       a3, -1
                  c.addi16sp   sp, 176
                  sltiu        a6, a4, -1956
                  nop
                  c.li         t3, 29
                  ori          a3, a4, -250
                  sra          t2, s1, a0
                  auipc        t0, 1005451
                  sll          s9, s11, s10
                  csrrci       t2, 0x340, 14
                  sltu         a2, t0, ra
                  c.addi4spn   a4, sp, 160
                  c.andi       a5, 16
                  c.add        a6, tp
                  c.andi       a4, 2
                  addi         s2, s10, -1332
                  csrrs        s10, 0x340, s9
                  auipc        gp, 487724
                  remu         s9, a1, t0
                  div          t0, s11, s6
                  mulhu        t2, t3, s6
                  auipc        zero, 631556
                  c.xor        a2, a4
                  div          a7, s3, a5
                  rem          s10, s9, sp
                  andi         s0, s5, 1332
                  mulh         s7, a7, sp
                  xor          a6, t5, s3
                  and          s4, a6, s3
                  rem          a0, s4, t4
                  slli         s3, t0, 26
                  c.slli       s3, 28
                  div          sp, s8, t0
                  c.li         s10, -1
                  csrrci       s11, 0x340, 0
                  auipc        t4, 604339
                  c.nop
                  xor          s2, s9, s11
                  nop
                  ori          a0, sp, -266
                  c.and        a0, s0
                  sltu         a0, a0, s4
                  c.addi16sp   sp, -16
                  sra          t0, a7, a2
                  c.slli       s1, 21
                  nop
                  c.lui        s11, 16
                  c.addi16sp   sp, -16
                  mul          t3, a5, a3
                  csrrwi       s1, 0x340, 18
                  auipc        s6, 247247
                  srai         s0, t6, 31
                  c.and        s1, a2
                  and          s10, s11, a7
                  c.addi       s6, 2
                  xori         zero, s6, -1934
                  add          s10, a7, t1
                  c.addi       a5, 1
                  mulhsu       s2, a0, s9
                  c.or         s1, a4
                  or           a7, t6, s3
                  c.and        s1, a3
                  sub          s5, s0, t0
                  sltu         a6, a0, s7
                  addi         a7, ra, -1107
                  addi         a2, t0, -509
                  c.nop
                  lui          s5, 405982
                  srai         zero, s8, 23
                  c.addi4spn   a2, sp, 896
                  c.andi       s0, 7
                  c.addi16sp   sp, 496
                  c.and        a0, a1
                  c.lui        t3, 25
                  andi         s0, tp, 1243
                  c.srai       a3, 10
                  c.sub        s0, a5
                  c.addi16sp   sp, 336
                  slt          a3, t0, s11
                  c.srai       a2, 15
                  c.addi       tp, -1
                  and          gp, s9, t5
                  rem          sp, s6, s0
                  andi         t2, a0, 211
                  csrrwi       s7, 0x340, 23
                  sltiu        s11, s6, 626
                  andi         a6, s10, -432
                  srai         a5, a2, 14
                  c.lui        t5, 18
                  c.add        a0, a5
                  xor          ra, a0, t2
                  sll          s11, a1, a0
                  c.add        a5, ra
                  sltu         s8, s10, a2
                  nop
                  mulh         zero, zero, a3
                  c.xor        a0, a3
                  c.andi       a5, -1
                  csrrwi       gp, 0x340, 22
                  csrrc        s6, 0x340, zero
                  remu         s9, s5, a1
                  mulhsu       a0, a4, t0
                  csrrci       s6, 0x340, 15
                  div          t0, s5, a4
                  rem          s8, s8, gp
                  c.srai       s1, 22
                  nop
                  rem          tp, s2, a3
                  xor          a2, t4, a3
                  c.li         s3, 11
                  csrrsi       s11, 0x340, 0
                  xori         a3, a3, 1901
                  slli         zero, s4, 20
                  divu         s0, a1, s2
                  xori         t2, t2, -233
                  andi         t0, tp, 1947
                  slt          sp, a4, a5
                  andi         s3, s9, 283
                  slli         s8, s0, 9
                  sltu         a3, s2, a6
                  c.sub        a3, a1
                  csrrw        s5, 0x340, a4
                  remu         s3, s5, t0
                  ori          s8, s9, 249
                  xor          a0, s2, s8
                  c.li         t5, 20
                  c.mv         s5, t4
                  nop
                  c.srli       s1, 9
                  and          a0, a4, a7
                  srai         t2, s5, 11
                  c.nop
                  sub          t4, t2, tp
                  remu         tp, s1, a2
                  add          s8, s8, s1
                  c.xor        a3, a5
                  nop
                  lui          s1, 837720
                  sll          s11, t6, a7
                  divu         a6, a6, s7
                  auipc        t2, 647723
                  xori         t4, ra, 1092
                  csrrwi       t5, 0x340, 10
                  lui          s10, 558763
                  csrrs        a6, 0x340, s5
                  srai         sp, s9, 15
                  srli         t5, t3, 6
                  c.andi       s1, -1
                  c.lui        s2, 11
                  srl          s10, s9, s8
                  csrrsi       t3, 0x340, 23
                  mul          s0, t2, t2
                  srli         s2, sp, 15
                  c.sub        a4, a0
                  auipc        tp, 241058
                  c.lui        a2, 2
                  ori          a7, t3, 426
                  sltu         s11, zero, t1
                  c.xor        s1, a1
                  nop
                  srl          a2, ra, sp
                  c.nop
                  c.srli       a3, 19
                  sltiu        a5, a3, 1649
                  csrrwi       t2, 0x340, 1
                  remu         s9, s1, t5
                  mulhsu       a7, a7, t6
                  c.srai       a2, 19
                  sltiu        a3, s4, 1070
                  c.xor        s1, a3
                  sub          s1, a1, t2
                  c.and        s1, a4
                  sub          t3, s3, a4
                  remu         s10, s8, s7
                  mul          a5, s5, a5
                  csrrw        a6, 0x340, t3
                  slti         s2, a7, 1367
                  mulhsu       s7, s6, s3
                  mulhu        t0, t5, zero
                  c.andi       a2, 15
                  sub          a0, gp, s3
                  csrrs        tp, 0x340, zero
                  csrrw        s3, 0x340, a3
                  mulhsu       s8, a2, tp
                  xor          s5, t3, t3
                  c.slli       s3, 25
                  nop
                  c.nop
                  sub          a0, s1, tp
                  sltiu        s6, s8, 1886
                  xor          s2, s0, a3
                  sltu         s5, s7, a4
                  andi         t3, s2, -1588
                  mulh         s9, s3, a0
                  divu         s11, t5, gp
                  c.andi       s0, 15
                  c.add        s4, s0
                  c.addi16sp   sp, -16
                  csrrs        s11, 0x340, zero
                  c.srai       s0, 10
                  c.addi4spn   a4, sp, 736
                  csrrwi       a5, 0x340, 2
                  csrrwi       a6, 0x340, 20
                  ori          a3, s2, -1177
                  csrrwi       s6, 0x340, 4
                  c.andi       a0, -1
                  c.addi       a3, -1
                  auipc        t0, 745822
                  ori          t2, a3, -1573
                  c.andi       s0, 23
                  mulh         s9, a5, a1
                  csrrw        t3, 0x340, s11
                  lui          s4, 491408
                  addi         zero, t6, -244
                  c.andi       s0, -1
                  c.addi       ra, 4
                  andi         a2, t3, 1118
                  csrrwi       s0, 0x340, 20
                  c.xor        a2, a1
                  remu         s10, tp, gp
                  rem          gp, t1, s4
                  c.xor        a3, a1
                  c.addi4spn   a2, sp, 448
                  csrrw        s3, 0x340, zero
                  div          a0, s4, zero
                  c.nop
                  c.slli       a2, 26
                  sub          a2, s10, a2
                  ori          a2, s8, 1640
                  addi         a4, t5, -933
                  c.sub        a2, a0
                  c.addi       ra, -1
                  c.addi       ra, 11
                  auipc        a6, 765960
                  sltiu        sp, s1, 863
                  nop
                  ori          sp, s2, 236
                  mulh         a7, s6, zero
                  xori         a4, a7, 876
                  and          s5, s0, t0
                  slti         a2, s10, 104
                  c.mv         s10, s7
                  c.addi       s8, -1
                  c.andi       a4, -1
                  rem          a6, t2, ra
                  addi         s6, a2, -139
                  remu         s11, ra, s2
                  c.xor        a4, a1
                  c.nop
                  csrrci       s5, 0x340, 0
                  andi         a0, s11, -308
                  auipc        t2, 158650
                  c.lui        t0, 25
                  c.li         s8, -1
                  c.li         s5, 1
                  mulh         s6, s5, a1
                  c.lui        t4, 4
                  c.add        ra, t5
                  slti         s1, a7, -253
                  srai         a3, a7, 9
                  c.or         s1, s0
                  c.srli       a0, 3
                  addi         a7, t1, -1423
                  xor          a0, gp, a5
                  srli         a6, gp, 0
                  addi         a0, s3, 1159
                  xor          s9, a2, t4
                  mul          ra, t5, s8
                  sltu         gp, a0, s0
                  or           s5, s8, t4
                  c.add        s1, s10
                  sll          gp, t1, s8
                  c.and        a4, a3
                  andi         a3, a4, -1416
                  csrrc        gp, 0x340, zero
                  sra          s4, t1, s5
                  c.lui        t5, 30
                  csrrw        s2, 0x340, t3
                  c.addi16sp   sp, -16
                  c.addi16sp   sp, 112
                  div          t3, s9, a4
                  ori          sp, s11, -205
                  slli         s8, a1, 19
                  rem          t4, t1, s5
                  andi         s3, t6, 730
                  sra          s7, t3, t1
                  nop
                  c.andi       a5, 30
                  c.sub        a2, a5
                  mul          a7, s0, gp
                  c.addi16sp   sp, 160
                  c.mv         s6, t4
                  sub          s7, t4, s6
                  srli         t3, s9, 23
                  auipc        a3, 1006841
                  sra          s6, t3, t5
                  c.and        a2, a1
                  c.srli       s0, 3
                  add          gp, a3, s3
                  slli         gp, a6, 20
                  ori          tp, s3, -1140
                  and          a2, a6, t0
                  c.li         a7, 20
                  c.xor        a0, s1
                  csrrsi       s7, 0x340, 3
                  divu         s0, a2, s11
                  c.slli       t4, 12
                  or           s10, t2, ra
                  srl          s7, t3, a6
                  c.srli       a2, 21
                  divu         s2, s7, s10
                  ori          s7, s7, 1386
                  c.add        a7, s10
                  slti         sp, s5, 1238
                  rem          t3, a3, s2
                  nop
                  csrrs        s5, 0x340, zero
                  add          s9, a1, s11
                  auipc        s7, 124810
                  div          s6, s0, ra
                  csrrs        a5, 0x340, zero
                  rem          s8, s10, a0
                  auipc        a6, 383423
                  c.lui        s2, 18
                  div          s1, zero, s1
                  nop
                  sll          a2, s9, s3
                  c.add        a0, t6
                  mulh         a2, s9, s6
                  addi         ra, s5, -1321
                  csrrsi       t3, 0x340, 22
                  add          a0, s4, a2
                  slt          s5, s5, tp
                  c.nop
                  slt          gp, s6, a4
                  c.addi16sp   sp, -16
                  c.and        a2, a1
                  c.or         a0, s1
                  lui          s5, 811660
                  mulhu        a2, a1, a6
                  mulhu        gp, a0, gp
                  sll          s10, a2, s11
                  xori         s6, a7, 1512
                  and          s4, t3, a5
                  div          s1, ra, sp
                  csrrwi       s7, 0x340, 21
                  mulh         a6, t3, s5
                  csrrwi       a3, 0x340, 5
                  div          a4, a6, s9
                  sltiu        gp, t2, -144
                  xori         t2, gp, 1784
                  slt          zero, s9, s8
                  rem          s10, s1, a1
                  mulhsu       t2, t5, a5
                  sub          s2, s9, a7
                  c.li         a5, -1
                  c.andi       a4, 16
                  srai         s10, a7, 12
                  sltu         t4, s11, s1
                  la x6, test_done
                  jalr x0, x6, 0
write_tohost:     
                  sw gp, tohost, t5

_exit:            
                  j write_tohost

debug_rom:        
                  dret

debug_exception:  
                  dret

instr_end:        
                  nop

.section .data
.align 6; .global tohost; tohost: .dword 0;
.align 6; .global fromhost; fromhost: .dword 0;
.section .user_stack,"aw",@progbits;
.align 2
user_stack_start:
.rept 4999
.4byte 0x0
.endr
user_stack_end:
.4byte 0x0
.align 2
kernel_instr_start:
.text
ebreak_handler:   
                  li x10, 0x8ffffffc
                  li x27, 0xd
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x342
                  sw x27, 0(x10)
                  csrr  x27, 0x341
                  addi  x27, x27, 4
                  csrw  0x341, x27
                  add x11, x31, zero
                  lw  x1, 4(x11)
                  lw  x2, 8(x11)
                  lw  x3, 12(x11)
                  lw  x4, 16(x11)
                  lw  x5, 20(x11)
                  lw  x6, 24(x11)
                  lw  x7, 28(x11)
                  lw  x8, 32(x11)
                  lw  x9, 36(x11)
                  lw  x10, 40(x11)
                  lw  x11, 44(x11)
                  lw  x12, 48(x11)
                  lw  x13, 52(x11)
                  lw  x14, 56(x11)
                  lw  x15, 60(x11)
                  lw  x16, 64(x11)
                  lw  x17, 68(x11)
                  lw  x18, 72(x11)
                  lw  x19, 76(x11)
                  lw  x20, 80(x11)
                  lw  x21, 84(x11)
                  lw  x22, 88(x11)
                  lw  x23, 92(x11)
                  lw  x24, 96(x11)
                  lw  x25, 100(x11)
                  lw  x26, 104(x11)
                  lw  x27, 108(x11)
                  lw  x28, 112(x11)
                  lw  x29, 116(x11)
                  lw  x30, 120(x11)
                  lw  x31, 124(x11)
                  addi x11, x11, 128
                  add x31, x11, zero
                  lw  x11, (x31)
                  addi x31, x31, 4
                  mret

illegal_instr_handler:
                  li x10, 0x8ffffffc
                  li x27, 0xa
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x10)
                  li x10, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x10)
                  csrr x27, 0x342
                  sw x27, 0(x10)
                  csrr  x27, 0x341
                  addi  x27, x27, 4
                  csrw  0x341, x27
                  add x11, x31, zero
                  lw  x1, 4(x11)
                  lw  x2, 8(x11)
                  lw  x3, 12(x11)
                  lw  x4, 16(x11)
                  lw  x5, 20(x11)
                  lw  x6, 24(x11)
                  lw  x7, 28(x11)
                  lw  x8, 32(x11)
                  lw  x9, 36(x11)
                  lw  x10, 40(x11)
                  lw  x11, 44(x11)
                  lw  x12, 48(x11)
                  lw  x13, 52(x11)
                  lw  x14, 56(x11)
                  lw  x15, 60(x11)
                  lw  x16, 64(x11)
                  lw  x17, 68(x11)
                  lw  x18, 72(x11)
                  lw  x19, 76(x11)
                  lw  x20, 80(x11)
                  lw  x21, 84(x11)
                  lw  x22, 88(x11)
                  lw  x23, 92(x11)
                  lw  x24, 96(x11)
                  lw  x25, 100(x11)
                  lw  x26, 104(x11)
                  lw  x27, 108(x11)
                  lw  x28, 112(x11)
                  lw  x29, 116(x11)
                  lw  x30, 120(x11)
                  lw  x31, 124(x11)
                  addi x11, x11, 128
                  add x31, x11, zero
                  lw  x11, (x31)
                  addi x31, x31, 4
                  mret

pt_fault_handler: 
                  li x10, 0x8ffffffc
                  li x27, 0x8
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x10)
                  nop

.align 2
mmode_intr_handler:
                  csrr  x27, 0x300 # MSTATUS;
                  csrr  x27, 0x304 # MIE;
                  csrr  x27, 0x344 # MIP;
                  csrrc x27, 0x344, x27 # MIP;
                  li x10, 0x8ffffffc
                  li x27, 0x7
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x10)
                  add x11, x31, zero
                  lw  x1, 4(x11)
                  lw  x2, 8(x11)
                  lw  x3, 12(x11)
                  lw  x4, 16(x11)
                  lw  x5, 20(x11)
                  lw  x6, 24(x11)
                  lw  x7, 28(x11)
                  lw  x8, 32(x11)
                  lw  x9, 36(x11)
                  lw  x10, 40(x11)
                  lw  x11, 44(x11)
                  lw  x12, 48(x11)
                  lw  x13, 52(x11)
                  lw  x14, 56(x11)
                  lw  x15, 60(x11)
                  lw  x16, 64(x11)
                  lw  x17, 68(x11)
                  lw  x18, 72(x11)
                  lw  x19, 76(x11)
                  lw  x20, 80(x11)
                  lw  x21, 84(x11)
                  lw  x22, 88(x11)
                  lw  x23, 92(x11)
                  lw  x24, 96(x11)
                  lw  x25, 100(x11)
                  lw  x26, 104(x11)
                  lw  x27, 108(x11)
                  lw  x28, 112(x11)
                  lw  x29, 116(x11)
                  lw  x30, 120(x11)
                  lw  x31, 124(x11)
                  addi x11, x11, 128
                  add x31, x11, zero
                  lw  x11, (x31)
                  addi x31, x31, 4
                  mret;

kernel_instr_end: nop
.section .kernel_stack,"aw",@progbits;
.align 2
kernel_stack_start:
.rept 3999
.4byte 0x0
.endr
kernel_stack_end:
.4byte 0x0
