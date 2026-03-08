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
                  li x25, 0x40001106
                  csrw 0x301, x25
kernel_sp:        
                  la x15, kernel_stack_end

trap_vec_init:    
                  la x25, mtvec_handler
                  ori x25, x25, 1
                  csrw 0x305, x25 # MTVEC

pmp_setup:        
                  csrwi 0x747, 4
                  la x21, main
                  li x25, 0x0
                  add x21, x21, x25
                  srli x21, x21, 2
                  csrw 0x3b0, x21
                  la x21, main
                  li x25, 0x11111111
                  add x21, x21, x25
                  srli x21, x21, 2
                  csrw 0x3b1, x21
                  la x21, main
                  li x25, 0x22222222
                  add x21, x21, x25
                  srli x21, x21, 2
                  csrw 0x3b2, x21
                  la x21, main
                  li x25, 0x33333333
                  add x21, x21, x25
                  srli x21, x21, 2
                  csrw 0x3b3, x21
                  li x21, 0xf0f0f0f
                  csrw 0x3a0, x21
                  la x21, main
                  li x25, 0x44444444
                  add x21, x21, x25
                  srli x21, x21, 2
                  csrw 0x3b4, x21
                  la x21, main
                  li x25, 0x55555555
                  add x21, x21, x25
                  srli x21, x21, 2
                  csrw 0x3b5, x21
                  la x21, main
                  li x25, 0x66666666
                  add x21, x21, x25
                  srli x21, x21, 2
                  csrw 0x3b6, x21
                  la x21, main
                  li x25, 0x77777777
                  add x21, x21, x25
                  srli x21, x21, 2
                  csrw 0x3b7, x21
                  li x21, 0xf0f0f0f
                  csrw 0x3a1, x21
                  la x21, main
                  li x25, 0x88888888
                  add x21, x21, x25
                  srli x21, x21, 2
                  csrw 0x3b8, x21
                  la x21, main
                  li x25, 0x99999999
                  add x21, x21, x25
                  srli x21, x21, 2
                  csrw 0x3b9, x21
                  la x21, main
                  li x25, 0xaaaaaaaa
                  add x21, x21, x25
                  srli x21, x21, 2
                  csrw 0x3ba, x21
                  la x21, main
                  li x25, 0xbbbbbbbb
                  add x21, x21, x25
                  srli x21, x21, 2
                  csrw 0x3bb, x21
                  li x21, 0xf0f0f0f
                  csrw 0x3a2, x21
                  la x21, main
                  li x25, 0xcccccccc
                  add x21, x21, x25
                  srli x21, x21, 2
                  csrw 0x3bc, x21
                  la x21, main
                  li x25, 0xdddddddd
                  add x21, x21, x25
                  srli x21, x21, 2
                  csrw 0x3bd, x21
                  la x21, main
                  li x25, 0xeeeeeeee
                  add x21, x21, x25
                  srli x21, x21, 2
                  csrw 0x3be, x21
                  la x21, main
                  li x25, 0xffffffff
                  add x21, x21, x25
                  srli x21, x21, 2
                  csrw 0x3bf, x21
                  li x21, 0xf0f0f0f
                  csrw 0x3a3, x21

mepc_setup:       
                  la x25, init
                  csrw 0x341, x25

custom_csr_setup: 
                  csrwi 0x7c0, 1

init_machine_mode:
                  li x25, 0x1800
                  csrw 0x300, x25 # MSTATUS
                  li x25, 0x0
                  csrw 0x304, x25 # MIE
                  li x10, 0x8ffffffc
                  li x25, 0x300
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x300
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x304
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x304
                  sw x25, 0(x10)
                  mret
init:             
                  li x0, 0x0
                  li x1, 0x92ef9ac4
                  li x3, 0x80000000
                  li x4, 0x80000000
                  li x5, 0xe
                  li x6, 0xf1b29f3f
                  li x7, 0x0
                  li x8, 0x4a55aa22
                  li x9, 0x80000000
                  li x10, 0xd
                  li x11, 0xf1f2f2c9
                  li x12, 0xf455ffdc
                  li x13, 0xf8225264
                  li x14, 0xfe5f0953
                  li x16, 0x66a5daa7
                  li x17, 0xf9d1c758
                  li x18, 0x0
                  li x19, 0x91004efb
                  li x20, 0x0
                  li x21, 0x9
                  li x22, 0x91794fea
                  li x23, 0x80000000
                  li x24, 0xdb26e39f
                  li x25, 0xc
                  li x26, 0xbde66303
                  li x27, 0xf6358b8b
                  li x28, 0x0
                  li x29, 0x47c424ca
                  li x30, 0xc20d373d
                  li x31, 0x0
                  la x2, user_stack_end
                  li x10, 0x8ffffffc
                  li x25, 0x0
                  slli x25, x25, 8
                  addi x25, x25, 0x0
                  sw x25, 0(x10)
                  j main
test_done:        
                  li x10, 0x8ffffff8
                  li x25, 0x0
                  slli x25, x25, 8
                  addi x25, x25, 0x1
                  sw x25, 0(x10)
                  ecall

test_fail:        
                  li x10, 0x8ffffff8
                  li x25, 0x1
                  slli x25, x25, 8
                  addi x25, x25, 0x1
                  sw x25, 0(x10)
                  ecall

mmode_intr_vector_1:
                  addi x15, x15, -4
                  sw  x2, (x15)
                  add x2, x15, zero
                  addi x2, x2, -128
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  add x15, x2, zero
                  li x10, 0x8ffffffc
                  li x25, 0x6
                  slli x25, x25, 8
                  addi x25, x25, 0x0
                  sw x25, 0(x10)
                  csrr x25, 0x342 # MCAUSE
                  srli x25, x25, 0x1f
                  beqz x25, 1f
                  li x10, 0x8ffffffc
                  li x25, 0x300
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x300
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x342
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x342
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x304
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x304
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x344
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x344
                  sw x25, 0(x10)
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_2:
                  addi x15, x15, -4
                  sw  x2, (x15)
                  add x2, x15, zero
                  addi x2, x2, -128
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  add x15, x2, zero
                  li x10, 0x8ffffffc
                  li x25, 0x6
                  slli x25, x25, 8
                  addi x25, x25, 0x0
                  sw x25, 0(x10)
                  csrr x25, 0x342 # MCAUSE
                  srli x25, x25, 0x1f
                  beqz x25, 1f
                  li x10, 0x8ffffffc
                  li x25, 0x300
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x300
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x342
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x342
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x304
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x304
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x344
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x344
                  sw x25, 0(x10)
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_3:
                  addi x15, x15, -4
                  sw  x2, (x15)
                  add x2, x15, zero
                  addi x2, x2, -128
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  add x15, x2, zero
                  li x10, 0x8ffffffc
                  li x25, 0x6
                  slli x25, x25, 8
                  addi x25, x25, 0x0
                  sw x25, 0(x10)
                  csrr x25, 0x342 # MCAUSE
                  srli x25, x25, 0x1f
                  beqz x25, 1f
                  li x10, 0x8ffffffc
                  li x25, 0x300
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x300
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x342
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x342
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x304
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x304
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x344
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x344
                  sw x25, 0(x10)
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_4:
                  addi x15, x15, -4
                  sw  x2, (x15)
                  add x2, x15, zero
                  addi x2, x2, -128
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  add x15, x2, zero
                  li x10, 0x8ffffffc
                  li x25, 0x6
                  slli x25, x25, 8
                  addi x25, x25, 0x0
                  sw x25, 0(x10)
                  csrr x25, 0x342 # MCAUSE
                  srli x25, x25, 0x1f
                  beqz x25, 1f
                  li x10, 0x8ffffffc
                  li x25, 0x300
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x300
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x342
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x342
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x304
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x304
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x344
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x344
                  sw x25, 0(x10)
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_5:
                  addi x15, x15, -4
                  sw  x2, (x15)
                  add x2, x15, zero
                  addi x2, x2, -128
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  add x15, x2, zero
                  li x10, 0x8ffffffc
                  li x25, 0x6
                  slli x25, x25, 8
                  addi x25, x25, 0x0
                  sw x25, 0(x10)
                  csrr x25, 0x342 # MCAUSE
                  srli x25, x25, 0x1f
                  beqz x25, 1f
                  li x10, 0x8ffffffc
                  li x25, 0x300
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x300
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x342
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x342
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x304
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x304
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x344
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x344
                  sw x25, 0(x10)
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_6:
                  addi x15, x15, -4
                  sw  x2, (x15)
                  add x2, x15, zero
                  addi x2, x2, -128
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  add x15, x2, zero
                  li x10, 0x8ffffffc
                  li x25, 0x6
                  slli x25, x25, 8
                  addi x25, x25, 0x0
                  sw x25, 0(x10)
                  csrr x25, 0x342 # MCAUSE
                  srli x25, x25, 0x1f
                  beqz x25, 1f
                  li x10, 0x8ffffffc
                  li x25, 0x300
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x300
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x342
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x342
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x304
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x304
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x344
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x344
                  sw x25, 0(x10)
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_7:
                  addi x15, x15, -4
                  sw  x2, (x15)
                  add x2, x15, zero
                  addi x2, x2, -128
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  add x15, x2, zero
                  li x10, 0x8ffffffc
                  li x25, 0x6
                  slli x25, x25, 8
                  addi x25, x25, 0x0
                  sw x25, 0(x10)
                  csrr x25, 0x342 # MCAUSE
                  srli x25, x25, 0x1f
                  beqz x25, 1f
                  li x10, 0x8ffffffc
                  li x25, 0x300
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x300
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x342
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x342
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x304
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x304
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x344
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x344
                  sw x25, 0(x10)
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_8:
                  addi x15, x15, -4
                  sw  x2, (x15)
                  add x2, x15, zero
                  addi x2, x2, -128
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  add x15, x2, zero
                  li x10, 0x8ffffffc
                  li x25, 0x6
                  slli x25, x25, 8
                  addi x25, x25, 0x0
                  sw x25, 0(x10)
                  csrr x25, 0x342 # MCAUSE
                  srli x25, x25, 0x1f
                  beqz x25, 1f
                  li x10, 0x8ffffffc
                  li x25, 0x300
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x300
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x342
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x342
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x304
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x304
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x344
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x344
                  sw x25, 0(x10)
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_9:
                  addi x15, x15, -4
                  sw  x2, (x15)
                  add x2, x15, zero
                  addi x2, x2, -128
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  add x15, x2, zero
                  li x10, 0x8ffffffc
                  li x25, 0x6
                  slli x25, x25, 8
                  addi x25, x25, 0x0
                  sw x25, 0(x10)
                  csrr x25, 0x342 # MCAUSE
                  srli x25, x25, 0x1f
                  beqz x25, 1f
                  li x10, 0x8ffffffc
                  li x25, 0x300
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x300
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x342
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x342
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x304
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x304
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x344
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x344
                  sw x25, 0(x10)
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_10:
                  addi x15, x15, -4
                  sw  x2, (x15)
                  add x2, x15, zero
                  addi x2, x2, -128
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  add x15, x2, zero
                  li x10, 0x8ffffffc
                  li x25, 0x6
                  slli x25, x25, 8
                  addi x25, x25, 0x0
                  sw x25, 0(x10)
                  csrr x25, 0x342 # MCAUSE
                  srli x25, x25, 0x1f
                  beqz x25, 1f
                  li x10, 0x8ffffffc
                  li x25, 0x300
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x300
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x342
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x342
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x304
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x304
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x344
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x344
                  sw x25, 0(x10)
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_11:
                  addi x15, x15, -4
                  sw  x2, (x15)
                  add x2, x15, zero
                  addi x2, x2, -128
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  add x15, x2, zero
                  li x10, 0x8ffffffc
                  li x25, 0x6
                  slli x25, x25, 8
                  addi x25, x25, 0x0
                  sw x25, 0(x10)
                  csrr x25, 0x342 # MCAUSE
                  srli x25, x25, 0x1f
                  beqz x25, 1f
                  li x10, 0x8ffffffc
                  li x25, 0x300
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x300
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x342
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x342
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x304
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x304
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x344
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x344
                  sw x25, 0(x10)
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_12:
                  addi x15, x15, -4
                  sw  x2, (x15)
                  add x2, x15, zero
                  addi x2, x2, -128
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  add x15, x2, zero
                  li x10, 0x8ffffffc
                  li x25, 0x6
                  slli x25, x25, 8
                  addi x25, x25, 0x0
                  sw x25, 0(x10)
                  csrr x25, 0x342 # MCAUSE
                  srli x25, x25, 0x1f
                  beqz x25, 1f
                  li x10, 0x8ffffffc
                  li x25, 0x300
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x300
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x342
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x342
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x304
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x304
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x344
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x344
                  sw x25, 0(x10)
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_13:
                  addi x15, x15, -4
                  sw  x2, (x15)
                  add x2, x15, zero
                  addi x2, x2, -128
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  add x15, x2, zero
                  li x10, 0x8ffffffc
                  li x25, 0x6
                  slli x25, x25, 8
                  addi x25, x25, 0x0
                  sw x25, 0(x10)
                  csrr x25, 0x342 # MCAUSE
                  srli x25, x25, 0x1f
                  beqz x25, 1f
                  li x10, 0x8ffffffc
                  li x25, 0x300
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x300
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x342
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x342
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x304
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x304
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x344
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x344
                  sw x25, 0(x10)
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_14:
                  addi x15, x15, -4
                  sw  x2, (x15)
                  add x2, x15, zero
                  addi x2, x2, -128
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  add x15, x2, zero
                  li x10, 0x8ffffffc
                  li x25, 0x6
                  slli x25, x25, 8
                  addi x25, x25, 0x0
                  sw x25, 0(x10)
                  csrr x25, 0x342 # MCAUSE
                  srli x25, x25, 0x1f
                  beqz x25, 1f
                  li x10, 0x8ffffffc
                  li x25, 0x300
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x300
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x342
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x342
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x304
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x304
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x344
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x344
                  sw x25, 0(x10)
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_15:
                  addi x15, x15, -4
                  sw  x2, (x15)
                  add x2, x15, zero
                  addi x2, x2, -128
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  add x15, x2, zero
                  li x10, 0x8ffffffc
                  li x25, 0x6
                  slli x25, x25, 8
                  addi x25, x25, 0x0
                  sw x25, 0(x10)
                  csrr x25, 0x342 # MCAUSE
                  srli x25, x25, 0x1f
                  beqz x25, 1f
                  li x10, 0x8ffffffc
                  li x25, 0x300
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x300
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x342
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x342
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x304
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x304
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x344
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x344
                  sw x25, 0(x10)
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_16:
                  addi x15, x15, -4
                  sw  x2, (x15)
                  add x2, x15, zero
                  addi x2, x2, -128
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  add x15, x2, zero
                  li x10, 0x8ffffffc
                  li x25, 0x6
                  slli x25, x25, 8
                  addi x25, x25, 0x0
                  sw x25, 0(x10)
                  csrr x25, 0x342 # MCAUSE
                  srli x25, x25, 0x1f
                  beqz x25, 1f
                  li x10, 0x8ffffffc
                  li x25, 0x300
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x300
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x342
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x342
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x304
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x304
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x344
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x344
                  sw x25, 0(x10)
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_17:
                  addi x15, x15, -4
                  sw  x2, (x15)
                  add x2, x15, zero
                  addi x2, x2, -128
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  add x15, x2, zero
                  li x10, 0x8ffffffc
                  li x25, 0x6
                  slli x25, x25, 8
                  addi x25, x25, 0x0
                  sw x25, 0(x10)
                  csrr x25, 0x342 # MCAUSE
                  srli x25, x25, 0x1f
                  beqz x25, 1f
                  li x10, 0x8ffffffc
                  li x25, 0x300
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x300
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x342
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x342
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x304
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x304
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x344
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x344
                  sw x25, 0(x10)
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_18:
                  addi x15, x15, -4
                  sw  x2, (x15)
                  add x2, x15, zero
                  addi x2, x2, -128
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  add x15, x2, zero
                  li x10, 0x8ffffffc
                  li x25, 0x6
                  slli x25, x25, 8
                  addi x25, x25, 0x0
                  sw x25, 0(x10)
                  csrr x25, 0x342 # MCAUSE
                  srli x25, x25, 0x1f
                  beqz x25, 1f
                  li x10, 0x8ffffffc
                  li x25, 0x300
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x300
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x342
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x342
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x304
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x304
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x344
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x344
                  sw x25, 0(x10)
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_19:
                  addi x15, x15, -4
                  sw  x2, (x15)
                  add x2, x15, zero
                  addi x2, x2, -128
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  add x15, x2, zero
                  li x10, 0x8ffffffc
                  li x25, 0x6
                  slli x25, x25, 8
                  addi x25, x25, 0x0
                  sw x25, 0(x10)
                  csrr x25, 0x342 # MCAUSE
                  srli x25, x25, 0x1f
                  beqz x25, 1f
                  li x10, 0x8ffffffc
                  li x25, 0x300
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x300
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x342
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x342
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x304
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x304
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x344
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x344
                  sw x25, 0(x10)
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_20:
                  addi x15, x15, -4
                  sw  x2, (x15)
                  add x2, x15, zero
                  addi x2, x2, -128
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  add x15, x2, zero
                  li x10, 0x8ffffffc
                  li x25, 0x6
                  slli x25, x25, 8
                  addi x25, x25, 0x0
                  sw x25, 0(x10)
                  csrr x25, 0x342 # MCAUSE
                  srli x25, x25, 0x1f
                  beqz x25, 1f
                  li x10, 0x8ffffffc
                  li x25, 0x300
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x300
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x342
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x342
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x304
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x304
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x344
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x344
                  sw x25, 0(x10)
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_21:
                  addi x15, x15, -4
                  sw  x2, (x15)
                  add x2, x15, zero
                  addi x2, x2, -128
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  add x15, x2, zero
                  li x10, 0x8ffffffc
                  li x25, 0x6
                  slli x25, x25, 8
                  addi x25, x25, 0x0
                  sw x25, 0(x10)
                  csrr x25, 0x342 # MCAUSE
                  srli x25, x25, 0x1f
                  beqz x25, 1f
                  li x10, 0x8ffffffc
                  li x25, 0x300
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x300
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x342
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x342
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x304
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x304
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x344
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x344
                  sw x25, 0(x10)
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_22:
                  addi x15, x15, -4
                  sw  x2, (x15)
                  add x2, x15, zero
                  addi x2, x2, -128
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  add x15, x2, zero
                  li x10, 0x8ffffffc
                  li x25, 0x6
                  slli x25, x25, 8
                  addi x25, x25, 0x0
                  sw x25, 0(x10)
                  csrr x25, 0x342 # MCAUSE
                  srli x25, x25, 0x1f
                  beqz x25, 1f
                  li x10, 0x8ffffffc
                  li x25, 0x300
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x300
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x342
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x342
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x304
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x304
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x344
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x344
                  sw x25, 0(x10)
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_23:
                  addi x15, x15, -4
                  sw  x2, (x15)
                  add x2, x15, zero
                  addi x2, x2, -128
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  add x15, x2, zero
                  li x10, 0x8ffffffc
                  li x25, 0x6
                  slli x25, x25, 8
                  addi x25, x25, 0x0
                  sw x25, 0(x10)
                  csrr x25, 0x342 # MCAUSE
                  srli x25, x25, 0x1f
                  beqz x25, 1f
                  li x10, 0x8ffffffc
                  li x25, 0x300
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x300
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x342
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x342
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x304
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x304
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x344
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x344
                  sw x25, 0(x10)
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_24:
                  addi x15, x15, -4
                  sw  x2, (x15)
                  add x2, x15, zero
                  addi x2, x2, -128
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  add x15, x2, zero
                  li x10, 0x8ffffffc
                  li x25, 0x6
                  slli x25, x25, 8
                  addi x25, x25, 0x0
                  sw x25, 0(x10)
                  csrr x25, 0x342 # MCAUSE
                  srli x25, x25, 0x1f
                  beqz x25, 1f
                  li x10, 0x8ffffffc
                  li x25, 0x300
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x300
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x342
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x342
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x304
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x304
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x344
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x344
                  sw x25, 0(x10)
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_25:
                  addi x15, x15, -4
                  sw  x2, (x15)
                  add x2, x15, zero
                  addi x2, x2, -128
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  add x15, x2, zero
                  li x10, 0x8ffffffc
                  li x25, 0x6
                  slli x25, x25, 8
                  addi x25, x25, 0x0
                  sw x25, 0(x10)
                  csrr x25, 0x342 # MCAUSE
                  srli x25, x25, 0x1f
                  beqz x25, 1f
                  li x10, 0x8ffffffc
                  li x25, 0x300
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x300
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x342
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x342
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x304
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x304
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x344
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x344
                  sw x25, 0(x10)
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_26:
                  addi x15, x15, -4
                  sw  x2, (x15)
                  add x2, x15, zero
                  addi x2, x2, -128
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  add x15, x2, zero
                  li x10, 0x8ffffffc
                  li x25, 0x6
                  slli x25, x25, 8
                  addi x25, x25, 0x0
                  sw x25, 0(x10)
                  csrr x25, 0x342 # MCAUSE
                  srli x25, x25, 0x1f
                  beqz x25, 1f
                  li x10, 0x8ffffffc
                  li x25, 0x300
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x300
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x342
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x342
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x304
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x304
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x344
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x344
                  sw x25, 0(x10)
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_27:
                  addi x15, x15, -4
                  sw  x2, (x15)
                  add x2, x15, zero
                  addi x2, x2, -128
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  add x15, x2, zero
                  li x10, 0x8ffffffc
                  li x25, 0x6
                  slli x25, x25, 8
                  addi x25, x25, 0x0
                  sw x25, 0(x10)
                  csrr x25, 0x342 # MCAUSE
                  srli x25, x25, 0x1f
                  beqz x25, 1f
                  li x10, 0x8ffffffc
                  li x25, 0x300
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x300
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x342
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x342
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x304
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x304
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x344
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x344
                  sw x25, 0(x10)
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_28:
                  addi x15, x15, -4
                  sw  x2, (x15)
                  add x2, x15, zero
                  addi x2, x2, -128
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  add x15, x2, zero
                  li x10, 0x8ffffffc
                  li x25, 0x6
                  slli x25, x25, 8
                  addi x25, x25, 0x0
                  sw x25, 0(x10)
                  csrr x25, 0x342 # MCAUSE
                  srli x25, x25, 0x1f
                  beqz x25, 1f
                  li x10, 0x8ffffffc
                  li x25, 0x300
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x300
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x342
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x342
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x304
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x304
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x344
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x344
                  sw x25, 0(x10)
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_29:
                  addi x15, x15, -4
                  sw  x2, (x15)
                  add x2, x15, zero
                  addi x2, x2, -128
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  add x15, x2, zero
                  li x10, 0x8ffffffc
                  li x25, 0x6
                  slli x25, x25, 8
                  addi x25, x25, 0x0
                  sw x25, 0(x10)
                  csrr x25, 0x342 # MCAUSE
                  srli x25, x25, 0x1f
                  beqz x25, 1f
                  li x10, 0x8ffffffc
                  li x25, 0x300
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x300
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x342
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x342
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x304
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x304
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x344
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x344
                  sw x25, 0(x10)
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_30:
                  addi x15, x15, -4
                  sw  x2, (x15)
                  add x2, x15, zero
                  addi x2, x2, -128
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  add x15, x2, zero
                  li x10, 0x8ffffffc
                  li x25, 0x6
                  slli x25, x25, 8
                  addi x25, x25, 0x0
                  sw x25, 0(x10)
                  csrr x25, 0x342 # MCAUSE
                  srli x25, x25, 0x1f
                  beqz x25, 1f
                  li x10, 0x8ffffffc
                  li x25, 0x300
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x300
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x342
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x342
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x304
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x304
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x344
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x344
                  sw x25, 0(x10)
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

mmode_intr_vector_31:
                  addi x15, x15, -4
                  sw  x2, (x15)
                  add x2, x15, zero
                  addi x2, x2, -128
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  add x15, x2, zero
                  li x10, 0x8ffffffc
                  li x25, 0x6
                  slli x25, x25, 8
                  addi x25, x25, 0x0
                  sw x25, 0(x10)
                  csrr x25, 0x342 # MCAUSE
                  srli x25, x25, 0x1f
                  beqz x25, 1f
                  li x10, 0x8ffffffc
                  li x25, 0x300
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x300
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x342
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x342
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x304
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x304
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x344
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x344
                  sw x25, 0(x10)
                  j mmode_intr_handler
                  1: la x21, test_done
                  jalr x0, x21, 0

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
                  addi x15, x15, -4
                  sw  x2, (x15)
                  add x2, x15, zero
                  addi x2, x2, -128
                  sw  x1, 4(x2)
                  sw  x2, 8(x2)
                  sw  x3, 12(x2)
                  sw  x4, 16(x2)
                  sw  x5, 20(x2)
                  sw  x6, 24(x2)
                  sw  x7, 28(x2)
                  sw  x8, 32(x2)
                  sw  x9, 36(x2)
                  sw  x10, 40(x2)
                  sw  x11, 44(x2)
                  sw  x12, 48(x2)
                  sw  x13, 52(x2)
                  sw  x14, 56(x2)
                  sw  x15, 60(x2)
                  sw  x16, 64(x2)
                  sw  x17, 68(x2)
                  sw  x18, 72(x2)
                  sw  x19, 76(x2)
                  sw  x20, 80(x2)
                  sw  x21, 84(x2)
                  sw  x22, 88(x2)
                  sw  x23, 92(x2)
                  sw  x24, 96(x2)
                  sw  x25, 100(x2)
                  sw  x26, 104(x2)
                  sw  x27, 108(x2)
                  sw  x28, 112(x2)
                  sw  x29, 116(x2)
                  sw  x30, 120(x2)
                  sw  x31, 124(x2)
                  add x15, x2, zero
                  li x10, 0x8ffffffc
                  li x25, 0x8
                  slli x25, x25, 8
                  addi x25, x25, 0x0
                  sw x25, 0(x10)
                  csrr x25, 0x341 # MEPC
                  csrr x25, 0x342 # MCAUSE
                  li x10, 0x3 # BREAKPOINT
                  beq x25, x10, ebreak_handler
                  li x10, 0x8 # ECALL_UMODE
                  beq x25, x10, ecall_handler
                  li x10, 0x9 # ECALL_SMODE
                  beq x25, x10, ecall_handler
                  li x10, 0xb # ECALL_MMODE
                  beq x25, x10, ecall_handler
                  li x10, 0x1
                  beq x25, x10, instr_fault_handler
                  li x10, 0x5
                  beq x25, x10, load_fault_handler
                  li x10, 0x7
                  beq x25, x10, store_fault_handler
                  li x10, 0xc
                  beq x25, x10, pt_fault_handler
                  li x10, 0xd
                  beq x25, x10, pt_fault_handler
                  li x10, 0xf
                  beq x25, x10, pt_fault_handler
                  li x10, 0x2 # ILLEGAL_INSTRUCTION
                  beq x25, x10, illegal_instr_handler
                  csrr x10, 0x343 # MTVAL
                  1: la x21, test_done
                  jalr x1, x21, 0

ecall_handler:    
                  li x10, 0x8ffffffc
                  li x25, 0xb00
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0xb00
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0xb80
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0xb80
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0xb03
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0xb03
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0xb83
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0xb83
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0xb04
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0xb04
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0xb84
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0xb84
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0xb05
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0xb05
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0xb85
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0xb85
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0xb06
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0xb06
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0xb86
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0xb86
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0xb07
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0xb07
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0xb87
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0xb87
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0xb08
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0xb08
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0xb88
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0xb88
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0xb09
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0xb09
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0xb89
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0xb89
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0xb0a
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0xb0a
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0xb8a
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0xb8a
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0xb0b
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0xb0b
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0xb8b
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0xb8b
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0xb0c
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0xb0c
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0xb8c
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0xb8c
                  sw x25, 0(x10)
                  la x25, _start
                  sw x0, 0(x25)
                  sw x1, 4(x25)
                  sw x2, 8(x25)
                  sw x3, 12(x25)
                  sw x4, 16(x25)
                  sw x5, 20(x25)
                  sw x6, 24(x25)
                  sw x7, 28(x25)
                  sw x8, 32(x25)
                  sw x9, 36(x25)
                  sw x10, 40(x25)
                  sw x11, 44(x25)
                  sw x12, 48(x25)
                  sw x13, 52(x25)
                  sw x14, 56(x25)
                  sw x15, 60(x25)
                  sw x16, 64(x25)
                  sw x17, 68(x25)
                  sw x18, 72(x25)
                  sw x19, 76(x25)
                  sw x20, 80(x25)
                  sw x21, 84(x25)
                  sw x22, 88(x25)
                  sw x23, 92(x25)
                  sw x24, 96(x25)
                  sw x25, 100(x25)
                  sw x26, 104(x25)
                  sw x27, 108(x25)
                  sw x28, 112(x25)
                  sw x29, 116(x25)
                  sw x30, 120(x25)
                  sw x31, 124(x25)
                  csrr  x25, 0x341
                  addi  x25, x25, 4
                  csrw  0x341, x25
                  mret

instr_fault_handler:
                  li x10, 0x8ffffffc
                  li x25, 0x9
                  slli x25, x25, 8
                  addi x25, x25, 0x0
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x342
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x342
                  sw x25, 0(x10)
                  li x25, 0
                  mv x22, x25
                  li x9, 0
                  0: mv x25, x22
                  mv x21, x25
                  li x21, 0
                  beq x25, x21, 1f
                  li x21, 1
                  beq x25, x21, 2f
                  li x21, 2
                  beq x25, x21, 3f
                  li x21, 3
                  beq x25, x21, 4f
                  li x21, 4
                  beq x25, x21, 5f
                  li x21, 5
                  beq x25, x21, 6f
                  li x21, 6
                  beq x25, x21, 7f
                  li x21, 7
                  beq x25, x21, 8f
                  li x21, 8
                  beq x25, x21, 9f
                  li x21, 9
                  beq x25, x21, 10f
                  li x21, 10
                  beq x25, x21, 11f
                  li x21, 11
                  beq x25, x21, 12f
                  li x21, 12
                  beq x25, x21, 13f
                  li x21, 13
                  beq x25, x21, 14f
                  li x21, 14
                  beq x25, x21, 15f
                  li x21, 15
                  beq x25, x21, 16f
                  1: csrr x10, 0x3b0
                  csrr x20, 0x3a0
                  j 17f
                  2: csrr x10, 0x3b1
                  csrr x20, 0x3a0
                  j 17f
                  3: csrr x10, 0x3b2
                  csrr x20, 0x3a0
                  j 17f
                  4: csrr x10, 0x3b3
                  csrr x20, 0x3a0
                  j 17f
                  5: csrr x10, 0x3b4
                  csrr x20, 0x3a1
                  j 17f
                  6: csrr x10, 0x3b5
                  csrr x20, 0x3a1
                  j 17f
                  7: csrr x10, 0x3b6
                  csrr x20, 0x3a1
                  j 17f
                  8: csrr x10, 0x3b7
                  csrr x20, 0x3a1
                  j 17f
                  9: csrr x10, 0x3b8
                  csrr x20, 0x3a2
                  j 17f
                  10: csrr x10, 0x3b9
                  csrr x20, 0x3a2
                  j 17f
                  11: csrr x10, 0x3ba
                  csrr x20, 0x3a2
                  j 17f
                  12: csrr x10, 0x3bb
                  csrr x20, 0x3a2
                  j 17f
                  13: csrr x10, 0x3bc
                  csrr x20, 0x3a3
                  j 17f
                  14: csrr x10, 0x3bd
                  csrr x20, 0x3a3
                  j 17f
                  15: csrr x10, 0x3be
                  csrr x20, 0x3a3
                  j 17f
                  16: csrr x10, 0x3bf
                  csrr x20, 0x3a3
                  j 17f
                  17: li x28, 4
                  slli x25, x22, 30
                  srli x25, x25, 30
                  sub x21, x28, x25
                  addi x21, x21, -1
                  slli x21, x21, 3
                  sll x28, x20, x21
                  slli x25, x25, 3
                  add x21, x21, x25
                  srl x28, x28, x21
                  slli x21, x28, 27
                  srli x21, x21, 30
                  beqz x21, 20f
                  li x25, 1
                  beq x21, x25, 21f
                  li x25, 2
                  beq x21, x25, 24f
                  li x25, 3
                  beq x21, x25, 25f
                  la x25, test_done
                  jalr x0, x25, 0
                  18: mv x25, x22
                  mv x9, x10
                  addi x25, x25, 1
                  mv x22, x25
                  li x10, 16
                  ble x10, x25, 19f
                  j 0b
                  19: csrr x25, 0x747
                  andi x25, x25, 2
                  bnez x25, 27f
                  la x25, test_done
                  jalr x0, x25, 0
                  20: j 18b
                  21: mv x25, x22
                  csrr x21, 0x343
                  srli x21, x21, 2
                  bnez x25, 22f
                  bltz x21, 18b
                  j 23f
                  22: bgtu x9, x21, 18b
                  23: bleu x10, x21, 18b
                  j 26f
                  24: csrr x25, 0x343
                  srli x25, x25, 2
                  slli x21, x10, 2
                  srli x21, x21, 2
                  bne x25, x21, 18b
                  j 26f
                  25: csrr x25, 0x343
                  srli x25, x25, 2
                  srli x25, x25, 0
                  slli x25, x25, 0
                  slli x21, x10, 2
                  srli x21, x21, 2
                  srli x21, x21, 0
                  slli x21, x21, 0
                  bne x25, x21, 18b
                  j 26f
                  26: csrr x21, 0x747
                  andi x21, x21, 1
                  bnez x21, 27f
                  andi x21, x28, 128
                  bnez x21, 27f
                  j 29f
                  27: la x25, test_done
                  jalr x0, x25, 0
                  29: ori x28, x28, 4
                  li x21, 30
                  sll x25, x22, x21
                  srl x25, x25, x21
                  slli x21, x25, 3
                  sll x28, x28, x21
                  or x20, x20, x28
                  mv x25, x22
                  srli x25, x25, 2
                  beqz x25, 30f
                  li x21, 1
                  beq x25, x21, 31f
                  li x21, 2
                  beq x25, x21, 32f
                  li x21, 3
                  beq x25, x21, 33f
                  30: csrw 0x3a0, x20
                  j 34f
                  31: csrw 0x3a1, x20
                  j 34f
                  32: csrw 0x3a2, x20
                  j 34f
                  33: csrw 0x3a3, x20
                  34: nop
                  add x2, x15, zero
                  lw  x1, 4(x2)
                  lw  x2, 8(x2)
                  lw  x3, 12(x2)
                  lw  x4, 16(x2)
                  lw  x5, 20(x2)
                  lw  x6, 24(x2)
                  lw  x7, 28(x2)
                  lw  x8, 32(x2)
                  lw  x9, 36(x2)
                  lw  x10, 40(x2)
                  lw  x11, 44(x2)
                  lw  x12, 48(x2)
                  lw  x13, 52(x2)
                  lw  x14, 56(x2)
                  lw  x15, 60(x2)
                  lw  x16, 64(x2)
                  lw  x17, 68(x2)
                  lw  x18, 72(x2)
                  lw  x19, 76(x2)
                  lw  x20, 80(x2)
                  lw  x21, 84(x2)
                  lw  x22, 88(x2)
                  lw  x23, 92(x2)
                  lw  x24, 96(x2)
                  lw  x25, 100(x2)
                  lw  x26, 104(x2)
                  lw  x27, 108(x2)
                  lw  x28, 112(x2)
                  lw  x29, 116(x2)
                  lw  x30, 120(x2)
                  lw  x31, 124(x2)
                  addi x2, x2, 128
                  add x15, x2, zero
                  lw  x2, (x15)
                  addi x15, x15, 4
                  mret

load_fault_handler:
                  li x10, 0x8ffffffc
                  li x25, 0xb
                  slli x25, x25, 8
                  addi x25, x25, 0x0
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x342
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x342
                  sw x25, 0(x10)
                  li x25, 0
                  mv x22, x25
                  li x9, 0
                  0: mv x25, x22
                  mv x21, x25
                  li x21, 0
                  beq x25, x21, 1f
                  li x21, 1
                  beq x25, x21, 2f
                  li x21, 2
                  beq x25, x21, 3f
                  li x21, 3
                  beq x25, x21, 4f
                  li x21, 4
                  beq x25, x21, 5f
                  li x21, 5
                  beq x25, x21, 6f
                  li x21, 6
                  beq x25, x21, 7f
                  li x21, 7
                  beq x25, x21, 8f
                  li x21, 8
                  beq x25, x21, 9f
                  li x21, 9
                  beq x25, x21, 10f
                  li x21, 10
                  beq x25, x21, 11f
                  li x21, 11
                  beq x25, x21, 12f
                  li x21, 12
                  beq x25, x21, 13f
                  li x21, 13
                  beq x25, x21, 14f
                  li x21, 14
                  beq x25, x21, 15f
                  li x21, 15
                  beq x25, x21, 16f
                  1: csrr x10, 0x3b0
                  csrr x20, 0x3a0
                  j 17f
                  2: csrr x10, 0x3b1
                  csrr x20, 0x3a0
                  j 17f
                  3: csrr x10, 0x3b2
                  csrr x20, 0x3a0
                  j 17f
                  4: csrr x10, 0x3b3
                  csrr x20, 0x3a0
                  j 17f
                  5: csrr x10, 0x3b4
                  csrr x20, 0x3a1
                  j 17f
                  6: csrr x10, 0x3b5
                  csrr x20, 0x3a1
                  j 17f
                  7: csrr x10, 0x3b6
                  csrr x20, 0x3a1
                  j 17f
                  8: csrr x10, 0x3b7
                  csrr x20, 0x3a1
                  j 17f
                  9: csrr x10, 0x3b8
                  csrr x20, 0x3a2
                  j 17f
                  10: csrr x10, 0x3b9
                  csrr x20, 0x3a2
                  j 17f
                  11: csrr x10, 0x3ba
                  csrr x20, 0x3a2
                  j 17f
                  12: csrr x10, 0x3bb
                  csrr x20, 0x3a2
                  j 17f
                  13: csrr x10, 0x3bc
                  csrr x20, 0x3a3
                  j 17f
                  14: csrr x10, 0x3bd
                  csrr x20, 0x3a3
                  j 17f
                  15: csrr x10, 0x3be
                  csrr x20, 0x3a3
                  j 17f
                  16: csrr x10, 0x3bf
                  csrr x20, 0x3a3
                  j 17f
                  17: li x28, 4
                  slli x25, x22, 30
                  srli x25, x25, 30
                  sub x21, x28, x25
                  addi x21, x21, -1
                  slli x21, x21, 3
                  sll x28, x20, x21
                  slli x25, x25, 3
                  add x21, x21, x25
                  srl x28, x28, x21
                  slli x21, x28, 27
                  srli x21, x21, 30
                  beqz x21, 20f
                  li x25, 1
                  beq x21, x25, 21f
                  li x25, 2
                  beq x21, x25, 24f
                  li x25, 3
                  beq x21, x25, 25f
                  la x25, test_done
                  jalr x0, x25, 0
                  18: mv x25, x22
                  mv x9, x10
                  addi x25, x25, 1
                  mv x22, x25
                  li x10, 16
                  ble x10, x25, 19f
                  j 0b
                  19: csrr x25, 0x747
                  andi x25, x25, 2
                  bnez x25, 27f
                  la x25, test_done
                  jalr x0, x25, 0
                  20: j 18b
                  21: mv x25, x22
                  csrr x21, 0x343
                  srli x21, x21, 2
                  bnez x25, 22f
                  bltz x21, 18b
                  j 23f
                  22: bgtu x9, x21, 18b
                  23: bleu x10, x21, 18b
                  j 26f
                  24: csrr x25, 0x343
                  srli x25, x25, 2
                  slli x21, x10, 2
                  srli x21, x21, 2
                  bne x25, x21, 18b
                  j 26f
                  25: csrr x25, 0x343
                  srli x25, x25, 2
                  srli x25, x25, 0
                  slli x25, x25, 0
                  slli x21, x10, 2
                  srli x21, x21, 2
                  srli x21, x21, 0
                  slli x21, x21, 0
                  bne x25, x21, 18b
                  j 26f
                  26: csrr x21, 0x747
                  andi x21, x21, 1
                  bnez x21, 27f
                  andi x21, x28, 128
                  bnez x21, 27f
                  j 29f
                  27: csrr x25, 0x341
                  la x21, main
                  bge x25, x21, 40f
                  la x25, test_done
                  jalr x0, x25, 0
                  40: lw x25, 0(x25)
                  li x21, 3
                  and x25, x25, x21
                  beq x25, x21, 28f
                  csrr x25, 0x341
                  addi x25, x25, 2
                  csrw 0x341, x25
                  j 34f
                  28: csrr x25, 0x341
                  addi x25, x25, 4
                  csrw 0x341, x25
                  j 34f
                  29: ori x28, x28, 1
                  li x21, 30
                  sll x25, x22, x21
                  srl x25, x25, x21
                  slli x21, x25, 3
                  sll x28, x28, x21
                  or x20, x20, x28
                  mv x25, x22
                  srli x25, x25, 2
                  beqz x25, 30f
                  li x21, 1
                  beq x25, x21, 31f
                  li x21, 2
                  beq x25, x21, 32f
                  li x21, 3
                  beq x25, x21, 33f
                  30: csrw 0x3a0, x20
                  j 34f
                  31: csrw 0x3a1, x20
                  j 34f
                  32: csrw 0x3a2, x20
                  j 34f
                  33: csrw 0x3a3, x20
                  34: nop
                  add x2, x15, zero
                  lw  x1, 4(x2)
                  lw  x2, 8(x2)
                  lw  x3, 12(x2)
                  lw  x4, 16(x2)
                  lw  x5, 20(x2)
                  lw  x6, 24(x2)
                  lw  x7, 28(x2)
                  lw  x8, 32(x2)
                  lw  x9, 36(x2)
                  lw  x10, 40(x2)
                  lw  x11, 44(x2)
                  lw  x12, 48(x2)
                  lw  x13, 52(x2)
                  lw  x14, 56(x2)
                  lw  x15, 60(x2)
                  lw  x16, 64(x2)
                  lw  x17, 68(x2)
                  lw  x18, 72(x2)
                  lw  x19, 76(x2)
                  lw  x20, 80(x2)
                  lw  x21, 84(x2)
                  lw  x22, 88(x2)
                  lw  x23, 92(x2)
                  lw  x24, 96(x2)
                  lw  x25, 100(x2)
                  lw  x26, 104(x2)
                  lw  x27, 108(x2)
                  lw  x28, 112(x2)
                  lw  x29, 116(x2)
                  lw  x30, 120(x2)
                  lw  x31, 124(x2)
                  addi x2, x2, 128
                  add x15, x2, zero
                  lw  x2, (x15)
                  addi x15, x15, 4
                  mret

store_fault_handler:
                  li x10, 0x8ffffffc
                  li x25, 0xc
                  slli x25, x25, 8
                  addi x25, x25, 0x0
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x342
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x342
                  sw x25, 0(x10)
                  li x25, 0
                  mv x22, x25
                  li x9, 0
                  0: mv x25, x22
                  mv x21, x25
                  li x21, 0
                  beq x25, x21, 1f
                  li x21, 1
                  beq x25, x21, 2f
                  li x21, 2
                  beq x25, x21, 3f
                  li x21, 3
                  beq x25, x21, 4f
                  li x21, 4
                  beq x25, x21, 5f
                  li x21, 5
                  beq x25, x21, 6f
                  li x21, 6
                  beq x25, x21, 7f
                  li x21, 7
                  beq x25, x21, 8f
                  li x21, 8
                  beq x25, x21, 9f
                  li x21, 9
                  beq x25, x21, 10f
                  li x21, 10
                  beq x25, x21, 11f
                  li x21, 11
                  beq x25, x21, 12f
                  li x21, 12
                  beq x25, x21, 13f
                  li x21, 13
                  beq x25, x21, 14f
                  li x21, 14
                  beq x25, x21, 15f
                  li x21, 15
                  beq x25, x21, 16f
                  1: csrr x10, 0x3b0
                  csrr x20, 0x3a0
                  j 17f
                  2: csrr x10, 0x3b1
                  csrr x20, 0x3a0
                  j 17f
                  3: csrr x10, 0x3b2
                  csrr x20, 0x3a0
                  j 17f
                  4: csrr x10, 0x3b3
                  csrr x20, 0x3a0
                  j 17f
                  5: csrr x10, 0x3b4
                  csrr x20, 0x3a1
                  j 17f
                  6: csrr x10, 0x3b5
                  csrr x20, 0x3a1
                  j 17f
                  7: csrr x10, 0x3b6
                  csrr x20, 0x3a1
                  j 17f
                  8: csrr x10, 0x3b7
                  csrr x20, 0x3a1
                  j 17f
                  9: csrr x10, 0x3b8
                  csrr x20, 0x3a2
                  j 17f
                  10: csrr x10, 0x3b9
                  csrr x20, 0x3a2
                  j 17f
                  11: csrr x10, 0x3ba
                  csrr x20, 0x3a2
                  j 17f
                  12: csrr x10, 0x3bb
                  csrr x20, 0x3a2
                  j 17f
                  13: csrr x10, 0x3bc
                  csrr x20, 0x3a3
                  j 17f
                  14: csrr x10, 0x3bd
                  csrr x20, 0x3a3
                  j 17f
                  15: csrr x10, 0x3be
                  csrr x20, 0x3a3
                  j 17f
                  16: csrr x10, 0x3bf
                  csrr x20, 0x3a3
                  j 17f
                  17: li x28, 4
                  slli x25, x22, 30
                  srli x25, x25, 30
                  sub x21, x28, x25
                  addi x21, x21, -1
                  slli x21, x21, 3
                  sll x28, x20, x21
                  slli x25, x25, 3
                  add x21, x21, x25
                  srl x28, x28, x21
                  slli x21, x28, 27
                  srli x21, x21, 30
                  beqz x21, 20f
                  li x25, 1
                  beq x21, x25, 21f
                  li x25, 2
                  beq x21, x25, 24f
                  li x25, 3
                  beq x21, x25, 25f
                  la x25, test_done
                  jalr x0, x25, 0
                  18: mv x25, x22
                  mv x9, x10
                  addi x25, x25, 1
                  mv x22, x25
                  li x10, 16
                  ble x10, x25, 19f
                  j 0b
                  19: csrr x25, 0x747
                  andi x25, x25, 2
                  bnez x25, 27f
                  la x25, test_done
                  jalr x0, x25, 0
                  20: j 18b
                  21: mv x25, x22
                  csrr x21, 0x343
                  srli x21, x21, 2
                  bnez x25, 22f
                  bltz x21, 18b
                  j 23f
                  22: bgtu x9, x21, 18b
                  23: bleu x10, x21, 18b
                  j 26f
                  24: csrr x25, 0x343
                  srli x25, x25, 2
                  slli x21, x10, 2
                  srli x21, x21, 2
                  bne x25, x21, 18b
                  j 26f
                  25: csrr x25, 0x343
                  srli x25, x25, 2
                  srli x25, x25, 0
                  slli x25, x25, 0
                  slli x21, x10, 2
                  srli x21, x21, 2
                  srli x21, x21, 0
                  slli x21, x21, 0
                  bne x25, x21, 18b
                  j 26f
                  26: csrr x21, 0x747
                  andi x21, x21, 1
                  bnez x21, 27f
                  andi x21, x28, 128
                  bnez x21, 27f
                  j 29f
                  27: csrr x25, 0x341
                  lw x25, 0(x25)
                  li x21, 3
                  and x25, x25, x21
                  beq x25, x21, 28f
                  csrr x25, 0x341
                  addi x25, x25, 2
                  csrw 0x341, x25
                  j 34f
                  28: csrr x25, 0x341
                  addi x25, x25, 4
                  csrw 0x341, x25
                  j 34f
                  29: ori x28, x28, 3
                  li x21, 30
                  sll x25, x22, x21
                  srl x25, x25, x21
                  slli x21, x25, 3
                  sll x28, x28, x21
                  or x20, x20, x28
                  mv x25, x22
                  srli x25, x25, 2
                  beqz x25, 30f
                  li x21, 1
                  beq x25, x21, 31f
                  li x21, 2
                  beq x25, x21, 32f
                  li x21, 3
                  beq x25, x21, 33f
                  30: csrw 0x3a0, x20
                  j 34f
                  31: csrw 0x3a1, x20
                  j 34f
                  32: csrw 0x3a2, x20
                  j 34f
                  33: csrw 0x3a3, x20
                  34: nop
                  add x2, x15, zero
                  lw  x1, 4(x2)
                  lw  x2, 8(x2)
                  lw  x3, 12(x2)
                  lw  x4, 16(x2)
                  lw  x5, 20(x2)
                  lw  x6, 24(x2)
                  lw  x7, 28(x2)
                  lw  x8, 32(x2)
                  lw  x9, 36(x2)
                  lw  x10, 40(x2)
                  lw  x11, 44(x2)
                  lw  x12, 48(x2)
                  lw  x13, 52(x2)
                  lw  x14, 56(x2)
                  lw  x15, 60(x2)
                  lw  x16, 64(x2)
                  lw  x17, 68(x2)
                  lw  x18, 72(x2)
                  lw  x19, 76(x2)
                  lw  x20, 80(x2)
                  lw  x21, 84(x2)
                  lw  x22, 88(x2)
                  lw  x23, 92(x2)
                  lw  x24, 96(x2)
                  lw  x25, 100(x2)
                  lw  x26, 104(x2)
                  lw  x27, 108(x2)
                  lw  x28, 112(x2)
                  lw  x29, 116(x2)
                  lw  x30, 120(x2)
                  lw  x31, 124(x2)
                  addi x2, x2, 128
                  add x15, x2, zero
                  lw  x2, (x15)
                  addi x15, x15, 4
                  mret

.align 2
main:             sub          s1, s3, s11
                  srai         zero, s9, 30
                  c.and        s0, s0
                  c.xor        a1, s0
                  srl          zero, s10, s6
                  ori          t0, a6, -1852
                  c.srli       a3, 24
                  c.andi       a0, 31
                  c.and        a3, s0
                  divu         s7, s7, s0
                  mul          a1, s3, ra
                  c.andi       a3, 24
                  c.sub        a0, a3
                  c.or         a3, a5
                  srli         t0, a4, 10
                  addi         t3, a6, -1834
                  c.srli       s1, 6
                  sll          s1, s1, s7
                  c.slli       ra, 1
                  and          s9, s8, a1
                  sltiu        a1, s6, 433
                  add          a6, a3, s7
                  add          s7, sp, a6
                  sra          gp, a7, s6
                  div          a7, s4, s9
                  xor          zero, s1, t6
                  mulh         s1, a4, t6
                  slti         s1, s0, -1417
                  csrrwi       a6, 0x340, 30
                  csrrci       s7, 0x340, 30
                  c.addi       t3, -1
                  srl          s9, t0, s9
                  slt          t4, t0, a4
                  c.lui        t6, 7
                  div          s6, s2, a4
                  csrrc        ra, 0x340, a7
                  mulhu        s3, s7, s4
                  and          s6, a4, s2
                  slt          a4, a5, a0
                  csrrs        t4, 0x340, zero
                  c.sub        a1, a0
                  sll          s10, s5, a1
                  c.slli       s0, 16
                  mulhsu       ra, t6, sp
                  sltu         a4, s7, s7
                  c.slli       a7, 31
                  srl          s7, gp, a4
                  srai         s4, s0, 23
                  c.or         s1, a5
                  xori         a0, a4, -1636
                  auipc        a6, 61691
                  lui          t2, 756838
                  divu         s8, t2, s9
                  divu         a4, t6, s8
                  c.nop
                  csrrc        s4, 0x340, zero
                  sll          a2, a2, t2
                  srl          s10, t5, t4
                  sltu         a2, sp, t6
                  addi         t1, a1, 346
                  sll          a2, a0, a0
                  c.li         a4, -1
                  csrrsi       t6, 0x340, 3
                  slti         t6, t0, -24
                  slti         gp, s11, 191
                  c.sub        a3, a5
                  srl          a0, s1, sp
                  remu         t5, t6, t6
                  add          t1, ra, t0
                  c.nop
                  slli         a0, s7, 15
                  c.sub        a2, a5
                  andi         t5, a4, 1813
                  slli         t0, gp, 19
                  xor          zero, s2, t1
                  csrrwi       s2, 0x340, 26
                  or           gp, a5, s7
                  c.addi       a3, 15
                  c.lui        t0, 19
                  c.li         s6, 29
                  srl          t6, zero, s0
                  c.addi       s11, -1
                  sra          s10, a5, t1
                  andi         a6, a6, 89
                  mulh         a0, s3, t0
                  ori          a1, t3, -777
                  csrrw        s9, 0x340, a3
                  sll          t2, a4, t6
                  csrrwi       a1, 0x340, 12
                  slt          t5, s10, a4
                  lui          a2, 1025424
                  remu         t0, s5, s3
                  divu         t3, a0, a0
                  mul          gp, a7, t1
                  sltu         a0, a5, t0
                  remu         a3, t4, s7
                  csrrw        s6, 0x340, a5
                  c.nop
                  addi         s10, sp, 269
                  c.and        a4, s0
                  csrrs        t5, 0x340, s0
                  mulhsu       t5, t6, t6
                  csrrc        ra, 0x340, s4
                  divu         s6, gp, s4
                  addi         s10, s8, 756
                  or           a2, a6, s1
                  xor          t2, a0, a7
                  csrrw        s1, 0x340, a3
                  c.and        s0, a2
                  mulhu        t6, s3, t3
                  c.andi       s1, 28
                  c.srli       a0, 6
                  and          gp, s5, t3
                  sra          s1, tp, t3
                  rem          a3, a0, s8
                  and          s9, t3, t3
                  slti         s2, s2, -191
                  ori          t5, a6, 2030
                  sltiu        s8, t6, 1344
                  c.add        a4, a5
                  sltiu        ra, t6, 2010
                  c.li         tp, -1
                  c.add        t3, s10
                  lui          s7, 455790
                  and          t3, s8, a2
                  c.li         ra, 16
                  slti         s10, a4, -268
                  nop
                  srli         a0, t3, 8
                  ori          s3, s10, -1822
                  add          t1, s10, s8
                  sll          s2, a6, a4
                  addi         s4, s7, -1823
                  csrrwi       t2, 0x340, 17
                  sll          t6, t1, s2
                  nop
                  mulh         s0, a6, t6
                  c.or         s1, s1
                  mulhu        t3, a5, s3
                  c.nop
                  csrrw        tp, 0x340, t5
                  slt          a4, s5, t5
                  mul          a7, s2, a5
                  sltiu        gp, s5, 1772
                  csrrs        a7, 0x340, t4
                  sltu         s10, s11, s1
                  c.nop
                  c.li         s1, -1
                  c.xor        a1, a3
                  sll          s3, a7, t0
                  mulh         t4, s9, s0
                  slti         t4, t6, 1502
                  slt          s11, t0, t3
                  c.lui        s10, 2
                  mulhu        zero, s9, sp
                  sll          tp, a7, tp
                  c.lui        tp, 11
                  csrrci       s3, 0x340, 0
                  csrrc        ra, 0x340, s10
                  c.nop
                  csrrci       s4, 0x340, 0
                  c.xor        a2, a4
                  div          a4, s10, gp
                  mulhu        s8, s2, s0
                  add          s4, s3, s1
                  remu         t0, s8, t5
                  mulhsu       t6, t5, a7
                  ori          s7, s2, 275
                  csrrw        a6, 0x340, a4
                  and          a2, tp, a1
                  c.slli       s7, 13
                  nop
                  csrrci       s3, 0x340, 0
                  sub          t3, zero, s4
                  sltu         t6, a7, s8
                  c.srai       a0, 3
                  divu         s0, a0, t1
                  csrrci       s7, 0x340, 8
                  srai         s2, t6, 19
                  c.li         s2, -1
                  sub          gp, s9, s1
                  slt          s7, s8, s0
                  csrrw        s10, 0x340, s3
                  xori         t1, gp, -888
                  csrrsi       a2, 0x340, 0
                  slli         a3, s3, 4
                  sll          gp, a5, sp
                  srli         s10, s10, 6
                  csrrs        a0, 0x340, t5
                  divu         s8, s5, s1
                  c.srli       a4, 4
                  mulhu        t2, s4, t2
                  sub          gp, s6, s11
                  mulhsu       t6, t0, tp
                  slt          s7, a5, s4
                  sub          s11, a3, t6
                  csrrs        t5, 0x340, zero
                  auipc        t5, 932839
                  lui          s8, 19496
                  lui          gp, 344540
                  c.mv         t3, t5
                  add          s1, a4, s7
                  or           s4, s0, t3
                  c.srai       a4, 24
                  csrrci       s2, 0x340, 0
                  csrrwi       s8, 0x340, 3
                  lui          a7, 345672
                  mulhu        a7, zero, a3
                  csrrc        a6, 0x340, gp
                  sltiu        a7, a6, 1032
                  sub          s1, t3, a4
                  and          t4, s8, a3
                  sltiu        s3, s10, -331
                  c.mv         s9, s4
                  div          s10, t3, t4
                  c.lui        s8, 6
                  csrrs        zero, 0x340, a6
                  nop
                  nop
                  csrrci       a3, 0x340, 29
                  c.srli       a0, 5
                  c.add        s3, gp
                  csrrc        s7, 0x340, zero
                  slt          t0, t5, a0
                  csrrci       s4, 0x340, 0
                  divu         s6, t0, a3
                  c.lui        t5, 27
                  sub          s2, a3, t1
                  csrrwi       t0, 0x340, 23
                  c.li         s1, 26
                  div          t3, a3, s7
                  c.srai       a1, 4
                  c.lui        a6, 16
                  sra          a6, a0, s2
                  slli         s8, a0, 4
                  c.sub        s1, a1
                  add          s3, s3, s5
                  csrrci       s2, 0x340, 0
                  c.add        s6, s5
                  or           t1, s7, s6
                  csrrs        a1, 0x340, s11
                  mulhu        t0, s3, s0
                  csrrwi       a1, 0x340, 16
                  divu         s11, a6, s8
                  csrrci       s1, 0x340, 26
                  mulhu        s3, a7, a0
                  lui          s3, 700357
                  csrrw        s10, 0x340, t1
                  c.lui        t5, 14
                  addi         t1, a0, -1315
                  c.lui        a3, 1
                  sll          s10, s2, s2
                  csrrw        a1, 0x340, t5
                  csrrwi       s0, 0x340, 5
                  slli         s4, t1, 19
                  andi         s6, gp, -2038
                  srai         s8, t6, 25
                  addi         ra, s0, 636
                  c.lui        s11, 5
                  c.slli       a6, 5
                  rem          a6, s4, t5
                  mul          s0, t1, tp
                  lui          t2, 908320
                  c.lui        t6, 13
                  addi         s6, a7, 1881
                  c.srli       s1, 3
                  or           t1, sp, a7
                  csrrci       s8, 0x340, 0
                  csrrci       t3, 0x340, 0
                  divu         a4, tp, gp
                  mulhu        s7, gp, a6
                  c.mv         s7, s6
                  c.or         a1, a4
                  csrrc        zero, 0x340, a1
                  c.addi       s2, -1
                  c.xor        s0, a5
                  srl          s8, a4, tp
                  mulhsu       s6, tp, zero
                  mulhu        a1, a4, s10
                  c.addi       ra, -1
                  c.or         a0, a3
                  c.li         s3, 4
                  xor          t0, s2, s10
                  csrrw        a1, 0x340, s1
                  c.addi       ra, 6
                  sub          s10, t4, a2
                  slli         s7, t5, 22
                  auipc        s3, 432041
                  csrrc        s11, 0x340, a6
                  or           s6, a4, a0
                  srl          tp, a3, t1
                  csrrs        gp, 0x340, a6
                  c.srai       a0, 26
                  remu         a6, sp, ra
                  mulhsu       s2, a7, tp
                  xori         t6, a0, 1543
                  mulh         a2, s10, s7
                  add          a6, t2, zero
                  mulhsu       s0, ra, zero
                  xor          s0, s4, s6
                  csrrw        t6, 0x340, a6
                  csrrci       ra, 0x340, 0
                  slt          s6, s4, s9
                  c.srai       s0, 20
                  c.sub        a2, a3
                  div          a3, s3, s2
                  c.slli       s10, 27
                  srli         s4, s10, 21
                  c.lui        tp, 27
                  c.xor        a4, a4
                  c.nop
                  rem          a4, a3, a1
                  srl          a4, a5, t0
                  add          s7, t3, sp
                  c.addi       a2, -1
                  sll          s0, a2, t2
                  xor          t4, s10, s3
                  sll          a7, a1, s9
                  c.li         t5, 24
                  c.xor        a0, s1
                  xori         s0, a3, 517
                  addi         a4, a1, -884
                  c.mv         t6, gp
                  c.sub        s1, a2
                  sub          a1, t2, s10
                  c.li         t6, -1
                  mulhu        gp, s7, a2
                  sltu         tp, t2, t2
                  andi         a0, t0, 993
                  mul          a1, sp, a7
                  c.srli       a3, 24
                  add          a4, t5, a6
                  sra          s6, s6, a0
                  c.addi       t4, 30
                  or           a1, s6, s10
                  srli         zero, s2, 30
                  sltu         s0, s2, s6
                  c.and        a1, a2
                  csrrsi       s0, 0x340, 7
                  c.lui        t2, 17
                  csrrsi       t5, 0x340, 18
                  slli         t4, a5, 4
                  csrrsi       zero, 0x340, 9
                  sltu         t0, zero, zero
                  nop
                  c.li         a6, -1
                  remu         t1, ra, s3
                  srl          t6, a5, t3
                  mul          s1, s0, t0
                  mulhsu       a4, t1, s9
                  srl          s9, s5, zero
                  slti         s4, a6, 865
                  xor          t0, t2, a3
                  lui          zero, 210662
                  remu         s0, t0, s6
                  c.and        a0, a3
                  xor          s10, tp, s10
                  mul          s10, s5, s2
                  csrrc        t4, 0x340, zero
                  mulhu        s6, s9, s1
                  c.li         s3, -1
                  lui          s8, 468523
                  c.mv         a7, a4
                  srli         s3, s7, 15
                  c.slli       a0, 21
                  nop
                  c.srli       a4, 27
                  csrrwi       s7, 0x340, 3
                  srai         gp, s0, 22
                  mulh         gp, t5, s7
                  csrrwi       s7, 0x340, 12
                  lui          tp, 384422
                  c.slli       a6, 17
                  mulh         s4, a5, s0
                  sub          s11, sp, t5
                  c.xor        s0, a3
                  csrrwi       t0, 0x340, 27
                  sltu         a6, t1, s1
                  add          gp, a3, a1
                  srli         s2, s11, 23
                  andi         s3, s4, -1701
                  c.lui        s8, 26
                  xor          s0, zero, a6
                  add          a2, t3, t2
                  xor          s0, s1, tp
                  slt          a1, a0, a2
                  add          s10, a0, s11
                  mulhsu       s4, a1, a7
                  and          s2, gp, a6
                  xor          a0, s6, t0
                  sltiu        gp, a3, -636
                  ori          t1, s3, -1927
                  sll          gp, s6, t6
                  sra          s1, t5, t4
                  c.nop
                  c.li         t3, 13
                  c.srai       a2, 8
                  remu         a4, gp, tp
                  or           tp, s4, s5
                  csrrc        s6, 0x340, ra
                  c.addi       s11, -1
                  sra          zero, s6, s4
                  andi         t3, s0, 1129
                  srli         s1, t6, 24
                  div          s1, a4, a7
                  c.mv         s2, s4
                  srl          s2, t1, a6
                  srli         a6, t6, 10
                  srl          t5, s5, a3
                  slli         t3, s6, 5
                  c.addi       a4, -1
                  slt          s10, a7, t2
                  srl          t4, t4, a4
                  c.or         s0, a4
                  c.srai       a1, 12
                  addi         a6, s8, 1292
                  xori         t3, sp, 1094
                  c.sub        s1, a2
                  c.sub        a4, a5
                  mulhsu       t4, a5, t3
                  div          t2, s1, a3
                  sra          a6, a6, a4
                  sltu         t1, a2, t6
                  ori          s7, ra, -482
                  auipc        s11, 798489
                  sltiu        s6, a7, -223
                  sll          a3, gp, a6
                  sra          s0, t6, s1
                  addi         s4, s9, -1070
                  csrrwi       t1, 0x340, 23
                  c.lui        s4, 24
                  ori          s10, t4, -1383
                  mulh         t2, a0, t6
                  csrrw        s9, 0x340, s9
                  sll          s8, s1, t2
                  lui          ra, 684368
                  c.nop
                  c.lui        s10, 16
                  c.xor        a1, s1
                  c.mv         s1, a3
                  csrrci       s9, 0x340, 0
                  xor          t2, a7, s4
                  csrrc        s8, 0x340, zero
                  addi         t3, gp, 2027
                  csrrci       t4, 0x340, 0
                  c.sub        a0, a0
                  sra          zero, t3, t2
                  c.srli       a0, 8
                  c.slli       s11, 25
                  csrrw        t3, 0x340, a3
                  csrrs        a7, 0x340, zero
                  slt          t4, s3, gp
                  nop
                  remu         a0, sp, t0
                  c.srai       a2, 1
                  c.lui        s11, 28
                  sltu         s9, a0, s9
                  divu         t3, gp, t3
                  slti         zero, s11, -754
                  mulh         s4, t0, s4
                  ori          s4, t2, 1339
                  mulhsu       s9, t3, sp
                  c.lui        s4, 27
                  remu         a2, sp, s10
                  sll          s9, a0, gp
                  c.andi       a2, 30
                  sra          t0, t4, s9
                  c.srli       s1, 2
                  divu         s6, t3, s2
                  sra          s2, s3, s10
                  xori         t1, t2, -1063
                  csrrc        s10, 0x340, s8
                  csrrci       gp, 0x340, 0
                  c.lui        a1, 1
                  csrrwi       s4, 0x340, 8
                  c.addi       a7, -1
                  addi         a3, s10, -1608
                  nop
                  csrrs        t5, 0x340, zero
                  c.srai       a2, 19
                  c.mv         t2, t1
                  xor          a7, ra, t3
                  sub          a7, s8, zero
                  sub          a7, a7, a7
                  nop
                  sltiu        s8, a7, 1246
                  auipc        tp, 870433
                  ori          s0, t6, -1504
                  c.srli       a1, 7
                  mulhu        ra, s6, ra
                  andi         s9, s0, -1029
                  csrrs        s6, 0x340, zero
                  srl          s10, a2, s0
                  xor          a1, t2, a0
                  sltu         s7, s8, tp
                  c.mv         s9, t0
                  c.and        a0, a1
                  add          t0, a5, t2
                  csrrw        s1, 0x340, gp
                  csrrw        s10, 0x340, s0
                  c.add        a3, s6
                  ori          s3, t4, 189
                  mulh         a6, s9, t5
                  c.add        a3, a6
                  c.andi       a3, -1
                  sub          s4, zero, s11
                  divu         a0, t4, a3
                  slli         tp, s8, 4
                  c.andi       a4, 10
                  sra          s7, gp, a4
                  rem          s6, ra, a5
                  ori          t0, a1, 525
                  mul          gp, s1, s2
                  csrrsi       s9, 0x340, 0
                  div          s8, a2, t5
                  csrrwi       tp, 0x340, 15
                  or           s6, a6, a1
                  mulhu        ra, ra, s1
                  csrrc        a1, 0x340, zero
                  nop
                  sll          a2, s5, s6
                  c.and        s0, s1
                  add          t4, s6, zero
                  auipc        s0, 623446
                  slli         s2, zero, 0
                  nop
                  srl          s2, t6, a1
                  c.sub        s0, s1
                  slti         a6, a4, 1890
                  slt          s1, sp, a1
                  csrrwi       t3, 0x340, 3
                  addi         s8, s8, 347
                  mulhsu       s1, a3, s1
                  c.add        s3, s7
                  c.lui        a1, 29
                  c.and        s0, a5
                  or           s4, a3, tp
                  auipc        s4, 114770
                  sltiu        s9, t0, 1835
                  c.sub        a4, a3
                  c.mv         s10, s10
                  nop
                  srli         s0, tp, 10
                  andi         t0, s1, -237
                  rem          s11, a7, gp
                  sltu         s7, a6, s8
                  slti         s1, a3, -147
                  csrrw        a4, 0x340, a6
                  c.nop
                  c.nop
                  c.mv         s10, a5
                  and          s2, t3, tp
                  or           a0, s1, tp
                  srli         tp, t4, 22
                  sll          a6, a7, s0
                  csrrwi       a4, 0x340, 31
                  mulh         s3, t0, s4
                  andi         s2, a0, -22
                  mul          s11, a1, ra
                  nop
                  c.and        s1, s1
                  add          tp, s5, s10
                  csrrci       a0, 0x340, 0
                  auipc        t3, 351148
                  c.xor        a0, a0
                  remu         tp, t1, a7
                  srai         t0, zero, 20
                  c.or         a2, a1
                  nop
                  sltiu        t3, a6, -391
                  c.lui        t0, 11
                  c.lui        t0, 29
                  or           s9, t3, s4
                  c.addi       a6, -1
                  c.mv         a3, a0
                  or           s6, t5, gp
                  andi         a7, s2, 1536
                  csrrsi       ra, 0x340, 26
                  c.addi       s7, -1
                  rem          a7, a1, a3
                  sll          t6, s6, s11
                  mulhsu       s3, a4, a7
                  sltiu        s2, t4, -105
                  auipc        tp, 942477
                  andi         s4, t4, 491
                  and          s8, t3, a5
                  slt          a7, s6, t0
                  div          s3, s11, a5
                  srl          s0, tp, zero
                  slli         a3, s9, 8
                  addi         a6, ra, 899
                  c.slli       a0, 28
                  sll          s6, t4, s1
                  add          t4, t4, a3
                  mulh         a7, s9, s1
                  csrrwi       s11, 0x340, 20
                  csrrs        ra, 0x340, s7
                  add          s2, s3, a6
                  mulhu        t0, t4, s5
                  srl          a7, t4, s5
                  srl          a1, s9, s9
                  csrrs        s2, 0x340, zero
                  andi         t4, s10, 1
                  xori         s3, a5, 1981
                  csrrs        t4, 0x340, t6
                  csrrci       a4, 0x340, 0
                  and          s8, a7, gp
                  c.addi       s7, -1
                  srai         a2, t5, 23
                  xor          a6, t2, s0
                  xori         t1, sp, 1590
                  mul          t3, t4, s8
                  srli         a4, t6, 28
                  csrrci       t2, 0x340, 1
                  csrrwi       t1, 0x340, 11
                  mulh         a6, tp, a1
                  c.sub        s1, a1
                  c.slli       s9, 31
                  sltu         a3, t1, s4
                  csrrw        a0, 0x340, a5
                  c.li         a6, -1
                  csrrwi       s8, 0x340, 8
                  c.lui        a2, 29
                  srli         zero, t5, 25
                  lui          zero, 243574
                  c.andi       a0, -1
                  mulh         tp, s9, s8
                  c.xor        s1, a2
                  remu         s2, t6, s6
                  c.mv         t2, s7
                  slt          gp, s8, a4
                  c.li         s3, 4
                  c.or         a3, a1
                  mulhu        s2, a2, s2
                  c.srli       a1, 6
                  or           s7, s10, gp
                  c.add        s10, s4
                  csrrw        t5, 0x340, a3
                  slt          a2, s10, a6
                  remu         a0, t3, t4
                  c.and        s0, s0
                  csrrw        a0, 0x340, s0
                  c.li         t6, -1
                  xori         t0, s10, -876
                  c.addi       s2, -1
                  ori          a4, a0, -636
                  c.or         s0, a1
                  c.srai       s1, 2
                  xor          t3, ra, s0
                  div          t4, ra, zero
                  slt          ra, a7, zero
                  c.lui        ra, 9
                  csrrs        s2, 0x340, t4
                  slt          s6, a0, s1
                  srli         s3, a4, 26
                  c.and        a2, a3
                  sra          s1, a4, zero
                  csrrw        s8, 0x340, t1
                  mul          a0, s7, a2
                  c.or         a0, s0
                  sll          s4, s9, t1
                  rem          t0, s7, zero
                  ori          a7, t1, 925
                  c.srai       a0, 14
                  c.lui        tp, 18
                  c.sub        a2, a0
                  ori          ra, sp, -1616
                  sltu         s6, s1, s11
                  c.add        s1, a1
                  xor          t0, a2, a3
                  csrrsi       t5, 0x340, 0
                  sra          s4, a0, a5
                  c.mv         s8, s5
                  c.sub        s0, s1
                  slti         a4, s8, 1943
                  mulhsu       zero, zero, t5
                  mulh         t3, a5, t5
                  auipc        s1, 882408
                  sll          s8, t1, s5
                  remu         gp, s5, a5
                  c.lui        a4, 23
                  xor          a3, a6, t0
                  sll          s10, a4, a5
                  sltu         t4, s2, t4
                  c.andi       a0, 18
                  c.lui        s1, 21
                  c.or         s1, a3
                  or           s7, s7, s4
                  slti         s7, t1, 237
                  sra          a4, s7, s7
                  csrrsi       t5, 0x340, 0
                  mul          t5, a6, t0
                  csrrw        a6, 0x340, s8
                  c.addi       a7, -1
                  csrrc        s9, 0x340, zero
                  csrrwi       s7, 0x340, 24
                  mulhu        s0, s6, zero
                  c.andi       a2, 17
                  c.addi       tp, -1
                  div          zero, s10, t2
                  mulh         a3, s10, gp
                  c.addi       a6, -1
                  auipc        s0, 838364
                  c.mv         gp, tp
                  xor          t2, s1, a6
                  slt          s0, t1, a5
                  divu         ra, t1, gp
                  c.li         t5, -1
                  c.li         s9, -1
                  srai         zero, s6, 20
                  srl          t3, s6, s3
                  sub          s8, s11, a6
                  c.mv         t6, s4
                  c.slli       t0, 28
                  srai         ra, s2, 15
                  sra          s1, a0, t6
                  csrrwi       a4, 0x340, 11
                  remu         s4, s1, t1
                  sll          a7, t2, s9
                  c.srai       a2, 18
                  and          t4, s5, s10
                  mulh         a0, s7, a2
                  csrrs        s3, 0x340, zero
                  srai         s6, s2, 23
                  c.addi       gp, -1
                  mulh         s2, t1, ra
                  c.andi       s1, 10
                  csrrc        a4, 0x340, zero
                  csrrwi       s4, 0x340, 20
                  c.add        a0, t1
                  auipc        s6, 935781
                  csrrw        s7, 0x340, sp
                  mulh         t4, s7, a6
                  c.or         a0, a4
                  mulh         t6, a7, s8
                  slt          t0, tp, a4
                  sltu         a7, gp, t0
                  lui          t5, 776769
                  sll          a2, a1, a0
                  mul          a1, a0, a5
                  c.slli       a2, 17
                  rem          s1, t4, t1
                  divu         s2, ra, t4
                  c.addi       s0, 11
                  csrrw        gp, 0x340, a5
                  c.and        a3, a4
                  andi         s7, s2, 165
                  xori         t2, tp, 1663
                  c.srai       s1, 3
                  c.mv         a4, s11
                  c.and        a2, a4
                  c.or         a0, s0
                  slti         t6, s1, -210
                  srli         s10, s9, 24
                  and          a2, s8, t4
                  srli         s11, a2, 18
                  xori         s0, s3, -1009
                  and          s11, s0, s7
                  c.mv         ra, s5
                  srai         s8, a2, 8
                  slt          t5, t2, t1
                  csrrw        s3, 0x340, t1
                  mul          s10, s10, t3
                  mulhu        s6, s2, t2
                  xori         ra, t1, 1927
                  add          a2, zero, a4
                  c.xor        a3, a5
                  div          a6, ra, t2
                  c.slli       ra, 27
                  addi         s2, s11, -891
                  csrrwi       a1, 0x340, 21
                  auipc        s11, 708476
                  sltiu        t6, t1, 944
                  srai         s9, a4, 12
                  c.nop
                  c.or         s0, a4
                  mulh         a0, s0, gp
                  rem          t4, s8, t2
                  addi         t6, a1, -2001
                  c.lui        s0, 1
                  csrrs        s7, 0x340, zero
                  srai         a4, tp, 30
                  sub          t1, t4, a6
                  mulhu        s7, a6, a7
                  srl          a6, s0, s10
                  div          a3, a2, s6
                  sltu         a7, t5, s8
                  xori         s0, zero, -880
                  c.xor        a2, s1
                  slti         ra, a3, -548
                  slli         tp, t1, 2
                  srli         t6, s8, 4
                  sltiu        zero, s1, -508
                  addi         t6, s11, -1179
                  csrrwi       a4, 0x340, 22
                  csrrc        a0, 0x340, zero
                  c.mv         s7, t6
                  c.and        s0, a2
                  mul          ra, s9, a2
                  rem          a6, zero, a2
                  c.or         a2, a2
                  sra          a3, s0, ra
                  sra          t6, s1, s10
                  nop
                  c.slli       a4, 22
                  lui          s2, 919062
                  c.nop
                  rem          t5, a5, s11
                  addi         a4, t1, -638
                  ori          s1, s1, -439
                  srli         s9, t4, 18
                  c.or         s0, a2
                  c.addi       s0, -1
                  slt          a4, a7, s1
                  c.xor        a2, a5
                  auipc        a3, 442364
                  c.srli       a4, 14
                  csrrc        ra, 0x340, ra
                  srli         s7, ra, 14
                  c.nop
                  c.add        t4, t5
                  auipc        s7, 695450
                  csrrw        t1, 0x340, t2
                  csrrw        s4, 0x340, a4
                  csrrwi       t4, 0x340, 26
                  sra          ra, s6, s8
                  srl          t0, a4, t1
                  lui          gp, 794822
                  csrrw        a7, 0x340, s5
                  mulhu        s0, a3, s1
                  auipc        t2, 357927
                  c.nop
                  srli         a0, t3, 5
                  c.nop
                  slt          zero, tp, gp
                  csrrwi       a0, 0x340, 3
                  slt          s0, a7, a3
                  xori         t0, t1, 364
                  sll          s10, a1, ra
                  andi         s3, s8, -1818
                  andi         t5, s2, -1504
                  c.sub        s1, a3
                  c.xor        a1, a3
                  remu         t6, t0, tp
                  xor          ra, tp, a3
                  c.and        a0, a1
                  slli         t6, gp, 4
                  sra          a7, t0, a7
                  add          s7, s4, s6
                  mulhu        s6, a0, t5
                  addi         t4, a2, -2038
                  sub          s4, s11, s6
                  and          s3, t2, tp
                  slt          s3, gp, a6
                  remu         s3, a3, s9
                  or           s9, gp, gp
                  sll          t3, zero, t1
                  srli         s4, t6, 26
                  c.sub        a2, a4
                  csrrw        s8, 0x340, a5
                  sra          s8, s5, t3
                  mulhu        t3, ra, ra
                  csrrw        s4, 0x340, t0
                  sltiu        s0, s3, 634
                  sltiu        s4, t4, 113
                  div          a0, a7, sp
                  c.lui        a2, 10
                  add          s0, gp, a6
                  addi         ra, t0, -388
                  csrrsi       t1, 0x340, 0
                  csrrwi       tp, 0x340, 25
                  csrrci       t3, 0x340, 29
                  c.sub        a3, a5
                  mul          t1, zero, t0
                  c.slli       a6, 19
                  remu         s9, a5, ra
                  mul          s10, s3, a1
                  c.lui        t3, 29
                  c.addi       s3, 9
                  sra          s8, a6, t2
                  slli         s1, a1, 6
                  c.xor        s1, a2
                  srai         s7, s6, 9
                  csrrw        s10, 0x340, s7
                  csrrc        t3, 0x340, tp
                  c.sub        s1, a2
                  c.mv         a2, a1
                  mulhu        tp, s2, s5
                  div          a3, t2, t0
                  remu         a1, a4, s10
                  addi         t6, s0, -1515
                  mul          zero, t2, s4
                  c.and        s0, a1
                  c.mv         a4, a4
                  csrrci       a3, 0x340, 0
                  srai         a4, a5, 13
                  mulhu        a6, s5, s1
                  mulh         a7, t5, s11
                  c.srli       a4, 16
                  c.and        a2, a0
                  nop
                  c.or         a2, a5
                  c.li         t2, -1
                  mulhu        s9, t6, a0
                  c.and        s0, a2
                  mulh         t3, t2, a5
                  c.lui        gp, 15
                  lui          zero, 211792
                  ori          t4, s8, -1704
                  sub          a0, s8, s10
                  lui          t6, 215122
                  auipc        ra, 731925
                  lui          gp, 362189
                  csrrsi       zero, 0x340, 23
                  c.addi       a1, -1
                  sltu         s0, t1, sp
                  add          s10, tp, a4
                  and          tp, a4, t3
                  srl          a0, s8, a2
                  csrrsi       s10, 0x340, 0
                  sra          a3, t1, s9
                  add          t5, s7, t5
                  csrrwi       s6, 0x340, 13
                  srl          s9, a4, s11
                  c.srli       s1, 7
                  slt          a4, t5, a6
                  sll          t1, a5, s5
                  rem          a6, gp, s11
                  csrrwi       s8, 0x340, 13
                  c.sub        a1, a3
                  nop
                  sll          gp, t3, sp
                  ori          s7, s1, -336
                  c.mv         a1, t2
                  c.add        a4, s3
                  srl          t6, a3, t2
                  slt          s6, s11, t4
                  c.and        a3, a5
                  mul          t3, s1, a7
                  sll          a3, s7, tp
                  xor          t3, s0, a5
                  mulhsu       s8, ra, s3
                  csrrsi       a6, 0x340, 0
                  mulhu        a0, zero, a5
                  c.andi       a3, -1
                  slt          a3, s11, a4
                  c.srai       s1, 5
                  add          ra, t5, s8
                  xor          a0, a2, t6
                  slt          a1, a2, a3
                  sltiu        s0, a4, 205
                  sltiu        zero, a1, -1762
                  remu         s2, ra, sp
                  slti         s4, s11, 686
                  c.mv         t2, a2
                  c.srli       s1, 27
                  lui          t4, 750058
                  c.andi       s0, 1
                  c.srli       a4, 20
                  c.sub        a4, a4
                  sltu         t0, s4, t6
                  xori         s10, s6, 632
                  c.sub        s0, s0
                  divu         s10, t6, s0
                  csrrs        t2, 0x340, zero
                  c.nop
                  and          s10, t6, s5
                  c.or         a0, s0
                  sltu         s1, a4, s6
                  sll          s6, s5, s7
                  sra          t5, a0, s8
                  slli         s10, s4, 24
                  xori         s7, a4, 328
                  c.srai       s1, 30
                  csrrsi       s8, 0x340, 6
                  c.or         a4, s0
                  xor          t4, s8, a6
                  srl          a4, s10, s10
                  mulh         t5, s11, a5
                  slt          s0, zero, s0
                  csrrci       t4, 0x340, 0
                  csrrs        t2, 0x340, zero
                  sll          s6, t5, zero
                  mulh         t4, gp, zero
                  or           tp, a1, t4
                  srai         a3, a5, 18
                  sltiu        t1, a2, 1611
                  andi         s7, s2, -1470
                  slt          t3, s6, s6
                  sltu         s4, s8, s0
                  lui          t6, 267908
                  c.mv         t3, t6
                  c.andi       a4, -1
                  c.add        s9, sp
                  mulhu        s7, t0, s10
                  c.xor        a4, a1
                  andi         a4, a5, 134
                  auipc        s10, 204419
                  addi         a1, t2, 1832
                  slti         t6, s6, 902
                  c.slli       a3, 26
                  auipc        a0, 749434
                  ori          t0, a1, 1276
                  slti         t2, t5, 1309
                  sltiu        a0, a0, -313
                  c.or         a0, a2
                  sub          s7, s2, s4
                  c.srai       a0, 27
                  csrrwi       s0, 0x340, 24
                  remu         s11, t3, s9
                  srl          ra, t3, ra
                  and          s9, s0, s7
                  csrrsi       s6, 0x340, 25
                  c.mv         t6, s1
                  csrrw        t5, 0x340, t3
                  c.addi       tp, 13
                  rem          t4, t2, ra
                  div          s3, a0, a3
                  csrrc        t0, 0x340, zero
                  srli         s7, a1, 25
                  sltu         ra, s2, sp
                  slti         zero, s9, 1116
                  csrrs        s4, 0x340, zero
                  c.add        a0, s10
                  lui          s1, 179861
                  c.andi       a2, 26
                  or           t2, a7, s4
                  slli         a2, t6, 1
                  nop
                  divu         s6, s8, s3
                  srli         s8, a7, 22
                  addi         s4, a6, 865
                  c.and        a4, a4
                  sltu         s3, sp, s10
                  slti         ra, s8, -1729
                  add          s10, s11, a4
                  c.lui        s1, 7
                  c.mv         s0, s0
                  remu         s10, s6, s6
                  or           s7, t4, s1
                  mulhu        t3, sp, s6
                  sltiu        a4, s0, 136
                  sltiu        s6, s10, -264
                  srli         s10, a1, 11
                  mulhu        s11, a2, t6
                  csrrw        t1, 0x340, s2
                  mulh         t6, s1, s8
                  csrrci       ra, 0x340, 3
                  xor          a0, t4, tp
                  sltiu        s7, t5, -1033
                  c.xor        a1, a5
                  csrrc        s9, 0x340, zero
                  sltiu        ra, s1, -1753
                  mulhsu       s11, t0, s7
                  c.slli       t5, 26
                  sra          a7, a3, s8
                  srai         t6, sp, 13
                  xori         a3, s3, 1986
                  c.li         a4, 25
                  nop
                  slti         s8, gp, -276
                  sltu         t6, tp, t6
                  xor          s9, a2, s8
                  c.add        t3, a7
                  srai         s10, a7, 9
                  sltiu        s0, t3, -509
                  c.or         a2, a1
                  or           t4, s8, a5
                  c.xor        a1, a3
                  divu         s2, s2, a7
                  add          a4, a2, s9
                  c.and        a0, s0
                  sltiu        s4, a4, 527
                  csrrs        s11, 0x340, a4
                  mulhu        a2, a0, s2
                  c.and        a1, a4
                  srli         s10, t4, 24
                  sub          a3, s3, t4
                  remu         ra, s3, s2
                  auipc        a1, 690670
                  mulh         t3, tp, a3
                  auipc        a2, 286750
                  c.srli       a0, 21
                  csrrwi       s4, 0x340, 30
                  csrrwi       t4, 0x340, 3
                  andi         zero, s9, -278
                  sltiu        s7, t6, 368
                  c.addi       t0, 24
                  add          s2, ra, a2
                  srli         s2, gp, 23
                  sub          ra, a2, gp
                  xor          s2, ra, s1
                  sltu         tp, s11, t0
                  sub          ra, s5, s10
                  nop
                  sll          s0, a6, a1
                  andi         t2, s6, -576
                  mulhu        s9, s2, t6
                  mulh         tp, a6, s0
                  srai         a7, t0, 21
                  sltu         t5, t2, s2
                  sra          s10, a0, a2
                  sltu         a2, t6, s6
                  and          t6, sp, gp
                  srli         s7, s7, 3
                  auipc        t0, 35370
                  c.srai       a1, 3
                  csrrs        s0, 0x340, s5
                  srl          s2, a3, tp
                  srl          t3, ra, a2
                  c.srai       a0, 18
                  csrrw        s1, 0x340, a1
                  srli         a1, s7, 14
                  c.sub        s0, a5
                  slt          s7, s9, sp
                  c.srai       a1, 18
                  sll          t4, a5, t6
                  lui          s11, 389144
                  csrrwi       a0, 0x340, 6
                  c.addi       gp, -1
                  c.and        a0, a0
                  c.add        s4, s6
                  slli         s2, a7, 28
                  c.sub        a4, a1
                  remu         gp, s5, a5
                  csrrwi       a3, 0x340, 16
                  csrrsi       a2, 0x340, 15
                  csrrsi       s1, 0x340, 8
                  rem          s11, t6, tp
                  srai         s2, s7, 17
                  slt          s0, s1, tp
                  c.add        a7, s8
                  or           t4, a3, s0
                  sra          s0, a0, a2
                  remu         t0, s7, a5
                  c.slli       t6, 3
                  c.or         a0, s0
                  auipc        a2, 507914
                  csrrc        s11, 0x340, zero
                  auipc        a0, 1046975
                  sub          a6, a6, t1
                  c.addi       a7, 6
                  c.or         a3, s0
                  csrrwi       s9, 0x340, 27
                  and          a6, s5, a4
                  sub          a1, t5, tp
                  mulhsu       s1, tp, s3
                  c.li         t6, 8
                  div          s7, gp, ra
                  slli         ra, t1, 26
                  c.and        a2, s0
                  and          t1, ra, s0
                  srl          a7, s8, s7
                  c.li         a6, -1
                  csrrc        s0, 0x340, zero
                  and          a4, s8, t3
                  ori          s1, zero, 845
                  c.mv         s3, a5
                  mulh         s6, s9, s7
                  nop
                  mulh         s0, t2, s6
                  slti         s7, a5, -1589
                  remu         s9, s8, ra
                  ori          ra, tp, 1533
                  c.li         s9, -1
                  divu         s10, sp, s9
                  c.lui        gp, 17
                  nop
                  c.slli       s11, 24
                  mulhsu       s7, t3, a2
                  andi         s10, t4, 1554
                  sll          s3, t1, s3
                  c.srli       a4, 14
                  andi         t4, s3, -1481
                  c.mv         s8, t0
                  sub          gp, s0, s7
                  csrrci       a1, 0x340, 0
                  c.and        a1, a0
                  c.and        a4, a2
                  sra          s3, s4, t4
                  sra          a4, t0, t2
                  mulhsu       s3, ra, a1
                  c.or         a0, a2
                  sltiu        a6, t1, -472
                  slti         a7, tp, -961
                  c.sub        a3, a3
                  c.lui        a4, 14
                  mul          s10, s9, gp
                  c.mv         gp, ra
                  mulhsu       s6, ra, tp
                  div          t4, a5, a7
                  mulh         s10, ra, a7
                  csrrs        tp, 0x340, zero
                  add          s10, tp, s4
                  c.or         a0, s1
                  srai         s3, t3, 23
                  csrrc        s1, 0x340, s0
                  sll          t0, sp, gp
                  slli         gp, s6, 23
                  c.xor        a4, a3
                  sltu         a7, s5, s1
                  srli         s1, zero, 9
                  xori         s6, t6, -907
                  sra          t1, sp, t1
                  div          gp, a6, a4
                  mulhsu       s8, gp, sp
                  c.nop
                  c.slli       s10, 21
                  andi         s4, ra, -463
                  mulh         a7, s3, s1
                  c.srai       a4, 8
                  c.and        s1, a4
                  remu         a7, t2, zero
                  sltiu        a7, sp, -1433
                  srl          t5, sp, s4
                  lui          a7, 957027
                  and          t2, gp, s4
                  csrrsi       s11, 0x340, 12
                  divu         s8, a4, ra
                  and          s3, s9, gp
                  mul          t1, s0, a6
                  csrrc        t0, 0x340, zero
                  rem          s6, t3, t4
                  csrrc        s7, 0x340, zero
                  c.mv         a2, s6
                  rem          a3, s6, t5
                  csrrwi       a6, 0x340, 22
                  srli         zero, s7, 5
                  csrrs        s1, 0x340, zero
                  c.or         a0, s1
                  csrrsi       t6, 0x340, 0
                  c.add        t5, a7
                  xor          gp, a1, t4
                  sltiu        s6, a6, -701
                  rem          ra, a2, s0
                  divu         a1, zero, t2
                  add          a4, s4, ra
                  remu         s9, sp, t6
                  csrrw        t3, 0x340, a5
                  c.andi       a4, -1
                  c.mv         t3, s5
                  mul          t4, s0, t2
                  slli         zero, ra, 0
                  mulhsu       t0, ra, a2
                  or           a0, t5, a7
                  c.srai       a3, 1
                  rem          a6, s4, s9
                  slli         s2, s1, 29
                  slti         t3, s7, 73
                  div          t6, s1, s7
                  auipc        a0, 87563
                  sltiu        s11, s8, 1479
                  div          a1, ra, tp
                  div          s4, s10, a5
                  rem          s10, zero, a0
                  divu         a0, s10, s4
                  ori          s8, t0, -1195
                  srli         s4, s4, 15
                  ori          s2, sp, 1022
                  mulhu        s10, t2, a5
                  csrrw        t6, 0x340, s0
                  c.srai       a3, 6
                  c.sub        s0, a0
                  c.addi       a1, -1
                  c.mv         s4, t3
                  slt          s11, t3, a2
                  sltu         s10, t2, t3
                  mulhu        s10, s8, s8
                  c.mv         t6, s2
                  srai         t1, s6, 31
                  csrrwi       a4, 0x340, 30
                  mulhsu       a0, a0, s9
                  c.li         a1, 3
                  c.andi       a1, -1
                  or           a1, s8, t5
                  c.or         s1, s1
                  rem          a7, t4, a5
                  xor          a6, a2, a7
                  sra          t0, a6, s5
                  c.srai       s0, 21
                  sra          t5, t0, s10
                  srl          a1, s1, a1
                  sub          t6, s8, a4
                  xor          s7, t0, gp
                  c.lui        a4, 10
                  div          s9, a2, sp
                  rem          t6, t2, sp
                  csrrc        a2, 0x340, s0
                  slt          tp, a7, s3
                  c.lui        s2, 14
                  c.nop
                  c.add        t0, s10
                  add          t6, s2, s2
                  c.mv         gp, a1
                  c.and        s0, a0
                  andi         tp, a7, 1798
                  c.and        s1, s0
                  c.srli       a1, 27
                  c.addi       a2, 22
                  sub          s9, s11, s8
                  xori         s11, s7, 1490
                  c.andi       a2, -1
                  c.nop
                  c.and        s1, s1
                  mul          s10, s10, s9
                  ori          s2, t2, 1594
                  mulhsu       s9, t5, s6
                  csrrsi       t2, 0x340, 29
                  sltu         s1, t4, a2
                  sltu         a6, t2, s2
                  auipc        s2, 305688
                  addi         ra, s3, -1272
                  lui          zero, 337735
                  srl          zero, a6, s0
                  csrrs        a0, 0x340, gp
                  and          t5, ra, s7
                  sub          s0, s9, zero
                  mulhsu       t1, t0, s8
                  div          s2, s6, s4
                  xor          s6, a7, tp
                  sra          a4, a4, s6
                  addi         s7, a4, 67
                  csrrci       s3, 0x340, 31
                  c.add        s6, s8
                  auipc        s7, 426819
                  slt          a2, a5, t5
                  slli         ra, zero, 20
                  csrrwi       a2, 0x340, 0
                  srai         a7, zero, 19
                  sltu         a4, s6, a5
                  c.addi       a7, -1
                  c.srai       a2, 14
                  c.mv         a7, a3
                  csrrw        s1, 0x340, s1
                  c.mv         s4, a5
                  add          s11, tp, s7
                  divu         a2, t3, a6
                  slli         ra, a3, 8
                  c.srai       a4, 31
                  c.andi       a0, 27
                  mul          t0, s4, a6
                  c.add        s11, sp
                  sltu         t3, a0, s9
                  sub          s4, s6, a0
                  sll          t3, t1, s6
                  divu         s4, tp, t2
                  divu         s6, t6, t3
                  andi         a4, a2, -275
                  xor          a7, s3, s11
                  or           t5, s5, s0
                  mulhsu       t2, s6, a7
                  and          tp, a5, gp
                  andi         t6, t3, -464
                  nop
                  xori         s1, gp, -1665
                  div          a3, zero, s0
                  slt          t2, tp, s4
                  c.slli       gp, 6
                  nop
                  csrrsi       t5, 0x340, 19
                  andi         t6, s6, 1890
                  ori          a4, s2, -128
                  sll          ra, s5, gp
                  csrrs        s9, 0x340, a7
                  slt          s2, sp, s11
                  or           s3, s11, s9
                  c.or         a3, a3
                  csrrc        zero, 0x340, zero
                  xori         a6, t0, 1679
                  c.or         a1, a0
                  c.nop
                  c.srai       a2, 18
                  slli         t1, a7, 26
                  divu         a1, a4, a2
                  csrrci       t1, 0x340, 0
                  sltiu        s1, a0, -170
                  c.nop
                  csrrwi       a4, 0x340, 0
                  c.andi       a4, -1
                  c.sub        a2, a1
                  nop
                  csrrs        t2, 0x340, a0
                  csrrsi       s0, 0x340, 30
                  csrrc        gp, 0x340, zero
                  csrrsi       a7, 0x340, 2
                  csrrw        a2, 0x340, s2
                  c.and        a1, a1
                  c.li         t1, 15
                  srai         s8, t6, 29
                  c.mv         t1, s9
                  divu         s2, t4, a0
                  srai         tp, t2, 22
                  rem          s1, s7, t2
                  sub          s1, gp, s2
                  nop
                  c.and        a1, s0
                  auipc        gp, 871505
                  mulhu        a0, s7, s2
                  c.srai       a2, 2
                  and          t3, tp, s2
                  slli         a3, t2, 31
                  mulh         t2, gp, t6
                  nop
                  c.slli       s4, 23
                  or           tp, a0, s7
                  div          t3, zero, gp
                  c.srli       a4, 22
                  c.or         a2, a2
                  slti         zero, s0, -1530
                  c.and        a4, a3
                  c.nop
                  ori          t6, a4, -143
                  c.li         t1, 2
                  c.xor        a2, a1
                  csrrw        t4, 0x340, t3
                  add          s3, s6, t2
                  sll          a2, ra, a1
                  c.andi       a1, -1
                  nop
                  add          ra, a1, a4
                  c.addi       gp, 9
                  xor          s11, s2, t4
                  c.and        a0, a2
                  c.andi       a3, 17
                  mul          s8, t2, t2
                  divu         a0, s11, s8
                  mul          s10, s4, tp
                  nop
                  and          s11, t4, a4
                  divu         t0, a2, t4
                  remu         ra, s9, a4
                  c.sub        s1, a0
                  c.sub        a0, a1
                  sltu         s10, a1, s7
                  lui          a4, 895675
                  or           t0, a4, tp
                  remu         tp, s8, a4
                  c.mv         a7, t2
                  and          s0, zero, gp
                  addi         zero, gp, 1134
                  c.and        a3, a5
                  c.andi       s1, -1
                  c.slli       s3, 10
                  sltiu        zero, t5, -1388
                  csrrc        a1, 0x340, zero
                  sll          a2, a5, a5
                  xor          t0, a5, a5
                  c.and        a4, s1
                  mulhsu       s10, a6, s1
                  c.andi       a4, -1
                  c.and        a3, a2
                  andi         s7, s2, 799
                  mulhsu       s9, sp, sp
                  sub          a6, a0, s10
                  andi         tp, t0, -1668
                  c.li         t0, -1
                  c.srli       a3, 13
                  xori         a3, t6, -581
                  slti         gp, s8, -21
                  c.and        s0, a1
                  xori         zero, tp, 1133
                  c.addi       t5, 29
                  mulh         gp, a7, t5
                  csrrc        a0, 0x340, t6
                  c.xor        a0, a3
                  c.srai       s1, 20
                  ori          s8, zero, -354
                  c.srli       a1, 5
                  ori          t1, s7, -1346
                  sll          a2, s5, t4
                  sltu         a4, s5, sp
                  slli         zero, a7, 29
                  add          s9, t3, a5
                  nop
                  slt          s3, t5, s6
                  c.xor        a1, a2
                  csrrwi       s0, 0x340, 0
                  or           s4, s8, s10
                  srai         tp, s1, 5
                  c.xor        a4, a2
                  sltu         a3, s4, a1
                  sltu         s6, a0, s10
                  divu         s11, a7, a3
                  csrrwi       tp, 0x340, 5
                  slli         ra, t0, 21
                  c.nop
                  lui          a2, 926651
                  sll          t5, s9, a5
                  c.slli       s8, 19
                  c.add        t2, s6
                  c.srai       a2, 14
                  xor          a7, a6, a4
                  nop
                  mulh         s9, a2, t6
                  csrrw        s3, 0x340, a2
                  divu         gp, a3, s7
                  add          s2, s3, t1
                  c.and        s1, a2
                  add          s8, s2, t6
                  c.andi       a0, 14
                  c.slli       a3, 18
                  c.sub        a3, a1
                  xori         s4, s5, -553
                  xor          t1, a0, s4
                  mulh         t4, a4, a6
                  sltu         t4, ra, t0
                  addi         t6, s1, 1448
                  srli         s7, s10, 11
                  add          tp, s3, sp
                  srai         ra, s2, 0
                  slti         ra, s7, -1437
                  c.lui        t2, 19
                  mulhsu       s4, s2, a6
                  csrrw        s9, 0x340, t0
                  xori         s9, s10, 2036
                  sub          s0, s4, s10
                  c.and        a4, a0
                  c.li         s9, -1
                  srli         t6, a0, 8
                  div          t3, s6, s3
                  xori         ra, t6, -644
                  sub          a1, zero, t1
                  sub          t0, s1, t2
                  c.sub        s0, a0
                  sltiu        t1, t5, -102
                  c.addi       t5, 4
                  sltu         t3, t6, gp
                  csrrwi       zero, 0x340, 12
                  srai         a3, ra, 24
                  sra          a1, s0, a1
                  sltu         s3, a2, a1
                  csrrci       a3, 0x340, 14
                  c.sub        a3, a0
                  xor          s8, a7, a1
                  sub          s7, gp, tp
                  div          ra, t0, s2
                  c.addi       a4, 26
                  xor          a7, zero, a0
                  ori          a0, s7, 1720
                  csrrs        t3, 0x340, s2
                  c.li         s9, -1
                  slt          s10, t2, a7
                  sltu         t3, s8, ra
                  c.slli       s11, 24
                  sll          t3, sp, t0
                  slti         t6, s10, -367
                  c.andi       a2, 8
                  nop
                  sltiu        s0, gp, 604
                  c.srai       s1, 26
                  xor          t1, a2, gp
                  c.srli       s1, 6
                  c.nop
                  add          t4, a1, s6
                  c.mv         s3, s9
                  sltu         s0, t5, a2
                  sra          s10, s11, s9
                  sub          a3, s0, s11
                  ori          s7, s11, -641
                  lui          t4, 318921
                  c.srai       s1, 5
                  slli         a4, t4, 14
                  sra          tp, s2, t1
                  sub          s4, s1, s5
                  csrrsi       s3, 0x340, 19
                  and          zero, a7, s4
                  or           t6, a6, s8
                  lui          s9, 851695
                  srai         s11, tp, 11
                  c.nop
                  slli         s0, a0, 12
                  or           s3, tp, ra
                  nop
                  c.or         s1, s1
                  c.nop
                  sll          s4, zero, a2
                  csrrsi       t6, 0x340, 0
                  lui          s7, 911657
                  add          s8, a0, s11
                  slt          t5, s5, a3
                  srai         t6, a7, 12
                  srli         s3, s2, 5
                  csrrw        t1, 0x340, ra
                  xori         t1, s8, -463
                  xor          zero, s10, a6
                  c.xor        a3, a5
                  srl          s11, s9, sp
                  remu         s3, t5, s11
                  addi         a2, a5, -1529
                  divu         a2, a6, s11
                  sub          zero, tp, tp
                  nop
                  c.li         a1, 18
                  c.xor        a3, a5
                  and          ra, t3, s10
                  add          a4, zero, a7
                  mulhu        t0, sp, gp
                  csrrwi       s9, 0x340, 8
                  csrrwi       s8, 0x340, 17
                  c.or         a4, a1
                  sltu         s6, a1, a4
                  csrrs        s2, 0x340, zero
                  srai         s10, s7, 16
                  c.lui        s8, 10
                  srl          t5, t2, s11
                  csrrsi       a4, 0x340, 31
                  c.lui        a3, 21
                  csrrsi       s1, 0x340, 11
                  andi         zero, tp, -1930
                  add          s1, a3, s2
                  c.or         a3, s0
                  sll          t2, zero, s11
                  sll          t0, a4, t4
                  csrrci       a6, 0x340, 0
                  mul          s8, a7, zero
                  srai         tp, sp, 14
                  xori         t4, t1, 1257
                  csrrsi       s7, 0x340, 24
                  lui          t6, 783781
                  c.lui        s7, 1
                  add          a2, sp, s5
                  csrrw        a6, 0x340, s3
                  c.nop
                  csrrsi       zero, 0x340, 0
                  auipc        s3, 943527
                  mulhsu       a4, t0, a6
                  nop
                  srai         t1, s11, 10
                  slti         ra, a0, -1175
                  addi         t2, t5, -792
                  mulhsu       s7, s4, s2
                  c.li         s2, 1
                  ori          t5, ra, 76
                  sltu         a7, a0, tp
                  add          s8, a1, s0
                  csrrwi       s10, 0x340, 12
                  c.and        a2, a0
                  csrrw        a0, 0x340, a7
                  csrrci       s9, 0x340, 0
                  csrrw        t1, 0x340, ra
                  sra          t1, t5, s10
                  c.li         s8, -1
                  sll          t3, s0, t6
                  add          s2, s1, s10
                  auipc        t4, 808058
                  add          s1, tp, t1
                  div          s1, a3, sp
                  c.srli       a0, 24
                  csrrc        s7, 0x340, zero
                  csrrc        s6, 0x340, zero
                  or           a6, s10, t3
                  csrrc        s0, 0x340, a5
                  c.mv         s10, s11
                  csrrsi       t2, 0x340, 0
                  c.li         s3, -1
                  slt          a6, a0, s5
                  divu         a0, a3, a5
                  div          a1, t1, s6
                  nop
                  csrrs        t3, 0x340, zero
                  ori          t3, s6, 1683
                  divu         t6, a1, t3
                  rem          s4, s0, s4
                  sltiu        a7, t4, -256
                  slti         a7, t6, -1491
                  or           s0, zero, s5
                  add          a3, a1, t0
                  rem          a3, t6, t5
                  c.srai       a1, 4
                  divu         s1, a6, t3
                  slt          a4, s11, s11
                  auipc        a4, 255310
                  c.or         a3, a2
                  slt          a7, s8, s2
                  c.or         a4, a0
                  xor          t5, a2, s10
                  or           s7, s4, ra
                  add          s11, zero, s0
                  remu         a3, s11, s8
                  c.nop
                  srai         s2, t4, 11
                  c.li         a3, 7
                  c.lui        s0, 26
                  c.srli       s0, 25
                  auipc        t6, 141289
                  c.and        a0, a4
                  csrrc        a1, 0x340, zero
                  c.nop
                  csrrw        a2, 0x340, s2
                  c.nop
                  and          gp, s1, ra
                  and          ra, s9, s0
                  c.srai       a4, 9
                  lui          t1, 770459
                  c.addi       s9, 8
                  or           a7, s5, s9
                  csrrs        a3, 0x340, zero
                  c.andi       a0, -1
                  srli         s1, a5, 14
                  csrrci       t2, 0x340, 9
                  auipc        gp, 553834
                  or           t6, a0, t2
                  auipc        zero, 347875
                  mul          s11, s3, gp
                  ori          a6, t3, 870
                  andi         a3, s7, -1439
                  add          t6, a0, t4
                  sltiu        s10, ra, 662
                  xori         t3, s7, 918
                  csrrwi       s2, 0x340, 31
                  c.li         s9, -1
                  sltiu        a3, a6, -1608
                  csrrci       a7, 0x340, 16
                  auipc        s4, 339314
                  xor          a7, s0, zero
                  srli         a0, zero, 30
                  c.sub        a4, s0
                  slt          tp, s8, sp
                  srai         t1, a4, 10
                  addi         a2, a7, -847
                  sltu         a3, s6, a7
                  xor          s8, s9, t5
                  sra          s10, s9, t3
                  div          t3, s5, s7
                  c.andi       a3, 21
                  nop
                  c.lui        s9, 13
                  xor          s11, s2, gp
                  csrrc        t5, 0x340, s5
                  c.and        s1, a4
                  andi         t2, a4, -1348
                  addi         a4, t3, -120
                  div          zero, a1, s4
                  c.li         a3, -1
                  c.slli       t1, 18
                  c.li         s0, -1
                  c.mv         s9, a2
                  slt          a0, s10, s7
                  c.srai       s1, 27
                  c.srli       a0, 12
                  nop
                  andi         s1, a5, -1813
                  c.srli       a0, 9
                  rem          t2, t3, t6
                  sub          a3, s3, s9
                  c.or         a4, a1
                  c.and        a2, a1
                  slli         s10, a6, 3
                  c.or         a1, a1
                  c.add        s11, s2
                  srai         s4, s10, 14
                  slti         tp, t0, -1303
                  c.srli       a4, 25
                  c.lui        t5, 6
                  slt          s6, t5, t1
                  csrrci       s0, 0x340, 0
                  srli         ra, s2, 23
                  c.srai       s0, 19
                  c.srli       a4, 2
                  nop
                  c.sub        a4, a1
                  sub          s7, s5, t6
                  sltiu        s9, a0, -433
                  csrrwi       a3, 0x340, 9
                  sra          s4, a7, s11
                  mulh         s0, zero, s2
                  remu         s7, gp, s11
                  mulh         t0, a6, t6
                  remu         s1, a2, s1
                  c.addi       t6, -1
                  xori         tp, t6, -1551
                  c.xor        a1, a2
                  sltiu        a4, t2, -696
                  rem          a1, t6, sp
                  c.srli       a3, 7
                  mulh         gp, sp, s9
                  csrrci       s10, 0x340, 0
                  c.lui        gp, 24
                  srai         s1, zero, 16
                  c.xor        a4, a5
                  csrrwi       s3, 0x340, 27
                  sll          t0, a6, s11
                  c.xor        a1, a2
                  mulhsu       s0, a1, t2
                  mulhsu       ra, a4, s3
                  c.nop
                  srai         t3, a3, 9
                  sltiu        t0, s1, 402
                  slli         ra, t6, 2
                  c.and        a2, a3
                  c.srli       s1, 21
                  csrrc        tp, 0x340, t6
                  remu         a7, gp, a3
                  div          t2, sp, t4
                  c.lui        t6, 21
                  mulhsu       s0, s7, a1
                  slli         s2, t2, 3
                  c.li         s4, 3
                  or           ra, s4, a1
                  sltiu        t0, s6, 899
                  mulh         ra, a2, a6
                  srli         t6, t5, 28
                  div          t1, a7, t0
                  slli         s1, gp, 3
                  or           a3, t5, sp
                  mulh         s6, s7, a4
                  c.lui        tp, 25
                  c.add        s6, s6
                  srli         ra, s6, 14
                  c.mv         s11, sp
                  c.li         s1, -1
                  sra          s3, a0, s11
                  mulhu        a1, a6, a2
                  slt          s8, t6, a2
                  csrrsi       a6, 0x340, 0
                  sra          a3, s1, t6
                  c.sub        s0, s1
                  srli         t2, s11, 21
                  xori         t4, gp, -1825
                  mulh         t6, s1, t0
                  c.li         s1, 7
                  c.add        ra, ra
                  c.lui        s0, 24
                  remu         t1, a7, a5
                  and          s0, zero, tp
                  srl          t5, s4, s7
                  c.slli       s7, 3
                  sra          s11, a4, t2
                  mulhsu       t4, a2, t5
                  sltiu        a4, s0, 1523
                  auipc        s4, 21790
                  csrrci       s0, 0x340, 0
                  rem          a1, s0, tp
                  srai         s0, t6, 31
                  mul          s7, s8, a0
                  c.xor        a2, s1
                  lui          s10, 748428
                  c.srli       s1, 28
                  c.li         s3, -1
                  slli         t6, s0, 20
                  csrrw        a3, 0x340, a3
                  andi         t5, a5, 2014
                  div          t5, t2, s10
                  mulhsu       tp, t0, a7
                  sltiu        s3, t0, -1148
                  c.or         s0, s0
                  slli         t4, a3, 25
                  div          t4, gp, s8
                  c.andi       s0, 4
                  c.li         a3, -1
                  srai         s1, s10, 4
                  c.li         s3, -1
                  rem          s8, a1, t2
                  addi         s6, t1, 1854
                  remu         s8, s9, gp
                  mul          a2, t1, s9
                  srl          t0, t3, t0
                  xor          gp, a7, s1
                  c.sub        s0, a2
                  srli         t2, a3, 2
                  sra          ra, s2, s7
                  div          a3, s9, t1
                  c.mv         s11, s11
                  div          s9, a5, t0
                  andi         a4, t0, -213
                  auipc        a2, 880871
                  and          a6, s2, t6
                  srai         zero, s0, 25
                  sub          s2, a0, s7
                  lui          s1, 545109
                  rem          s10, s2, a4
                  remu         a2, t5, s2
                  slti         s7, sp, 156
                  c.slli       s11, 30
                  csrrc        t6, 0x340, zero
                  csrrwi       s4, 0x340, 27
                  slli         a6, t1, 5
                  csrrwi       s7, 0x340, 5
                  c.xor        a1, s1
                  mul          s8, t6, a1
                  mulhsu       s11, s11, s3
                  xor          t6, zero, t2
                  rem          s10, t4, t2
                  csrrci       s1, 0x340, 0
                  remu         a4, t0, s7
                  rem          s7, a2, t2
                  div          t1, s4, s7
                  xori         t1, gp, 901
                  c.or         s0, a3
                  mulhu        zero, t0, a4
                  c.or         s1, a5
                  slli         zero, a4, 18
                  c.lui        a2, 22
                  nop
                  csrrci       s3, 0x340, 18
                  and          s1, s0, a3
                  srai         s1, t2, 8
                  or           a6, s5, a5
                  c.or         a2, a1
                  csrrc        s4, 0x340, sp
                  c.sub        s0, a1
                  c.srai       a4, 27
                  mulhsu       s10, s10, a3
                  slti         t3, sp, -564
                  slt          s10, ra, t3
                  c.addi       s9, 15
                  c.add        s0, a1
                  slti         t4, s5, -1133
                  c.xor        a3, a2
                  nop
                  divu         t1, s0, a3
                  slli         t2, s8, 0
                  c.add        s10, a6
                  srai         s7, a1, 8
                  c.add        t1, t5
                  auipc        a7, 405810
                  rem          s0, s6, s9
                  sra          s8, t3, s0
                  mul          a2, t4, s2
                  mul          a2, s4, tp
                  c.srli       s0, 22
                  csrrw        a6, 0x340, t4
                  c.addi       t0, 13
                  srai         a0, s4, 21
                  csrrwi       s6, 0x340, 21
                  csrrc        zero, 0x340, zero
                  andi         s2, a6, -1
                  addi         a7, gp, -1075
                  c.and        a1, a1
                  csrrsi       s1, 0x340, 0
                  sltiu        a0, s7, -1797
                  nop
                  addi         s3, t0, 1627
                  mulhu        a4, s8, t2
                  csrrsi       s8, 0x340, 17
                  sra          s1, s3, sp
                  slti         a3, a1, 1030
                  c.andi       a3, 0
                  andi         t2, sp, -897
                  mul          tp, s1, t5
                  c.slli       s8, 14
                  mulhu        s8, a5, s8
                  sub          t1, a2, a1
                  remu         a1, a5, t6
                  addi         a3, a2, -1938
                  sra          s3, a0, t1
                  c.srli       a0, 20
                  csrrw        s9, 0x340, a6
                  or           a7, ra, ra
                  xor          s4, t4, t3
                  csrrs        a2, 0x340, a6
                  remu         a0, s0, s7
                  auipc        a6, 287530
                  c.andi       s0, -1
                  csrrci       a6, 0x340, 0
                  csrrw        ra, 0x340, s9
                  c.sub        a2, a1
                  c.sub        a4, s1
                  c.nop
                  srai         a6, t4, 12
                  c.slli       t6, 3
                  c.addi       t2, -1
                  csrrsi       a7, 0x340, 31
                  auipc        s4, 958566
                  c.or         a2, a4
                  c.li         t6, -1
                  and          t1, s10, s3
                  xor          ra, s8, s5
                  auipc        s8, 255236
                  xor          s0, s1, s2
                  mulhsu       ra, s11, s8
                  c.addi       s7, 18
                  sltu         a2, sp, t5
                  and          t0, zero, s10
                  ori          s11, a4, -1781
                  c.and        s1, s0
                  sltiu        s1, s7, 1726
                  c.sub        a4, s0
                  mulh         s2, s2, s6
                  csrrwi       s10, 0x340, 16
                  sub          t6, a0, t5
                  mulhsu       a0, t0, s6
                  srl          s3, s2, s9
                  csrrc        a1, 0x340, s9
                  srai         tp, a5, 9
                  c.addi       s9, 20
                  xor          a2, a3, s8
                  csrrwi       t3, 0x340, 8
                  csrrci       a6, 0x340, 0
                  sub          s2, zero, s9
                  csrrci       s9, 0x340, 0
                  add          a1, ra, t1
                  sltu         t3, t2, a4
                  c.addi       a0, -1
                  c.add        t2, s9
                  mulh         s6, s6, a1
                  srl          a7, t3, s10
                  c.sub        s0, a4
                  sll          t1, tp, sp
                  mulhsu       t1, s5, tp
                  c.sub        s1, a2
                  div          s8, s10, s2
                  divu         s6, a2, zero
                  csrrci       a6, 0x340, 0
                  sltu         zero, ra, sp
                  rem          t6, t5, s6
                  mulhu        s0, s10, s11
                  c.li         s6, 20
                  slti         s4, t6, 291
                  srl          tp, a5, ra
                  sra          s4, ra, s5
                  sub          gp, t2, gp
                  c.addi       s7, 5
                  srl          a4, a4, a3
                  srai         t6, sp, 3
                  xori         t2, s0, 181
                  srl          s0, t3, s5
                  c.mv         s11, t3
                  xori         s4, s10, 1393
                  c.srai       a4, 24
                  c.xor        s1, a4
                  c.add        a2, sp
                  sltiu        s2, t6, -1993
                  c.srai       a2, 9
                  slt          zero, s6, t6
                  sltiu        s2, s9, 441
                  sltiu        s10, t4, -1823
                  c.srli       a4, 9
                  csrrci       s1, 0x340, 21
                  mulhu        t5, t2, sp
                  ori          s10, gp, -1747
                  csrrwi       t2, 0x340, 4
                  c.nop
                  sra          t3, tp, a6
                  andi         s4, s11, 1752
                  auipc        t2, 423081
                  c.slli       a7, 3
                  csrrsi       a7, 0x340, 20
                  andi         s11, a1, -336
                  sll          s4, sp, t3
                  ori          t5, a0, -1729
                  ori          s9, t5, -659
                  ori          t0, s4, -402
                  c.and        s0, a1
                  csrrci       tp, 0x340, 24
                  c.lui        t1, 4
                  auipc        a1, 31145
                  srl          s7, s7, t5
                  slli         a2, gp, 7
                  slli         t5, s7, 11
                  c.srai       a1, 10
                  c.li         s8, 6
                  csrrwi       a7, 0x340, 4
                  div          t4, a1, t3
                  c.xor        a3, a2
                  csrrci       t0, 0x340, 30
                  c.and        a4, s0
                  sltu         s7, s6, zero
                  csrrc        s9, 0x340, zero
                  div          a0, a0, a1
                  rem          a3, a6, s10
                  sra          s2, t2, s1
                  mulhu        t3, a7, s8
                  c.addi       gp, -1
                  csrrs        t3, 0x340, zero
                  or           s0, s7, t3
                  csrrsi       a1, 0x340, 0
                  csrrw        tp, 0x340, a1
                  c.or         s1, a5
                  divu         a1, s7, s9
                  c.mv         t5, t6
                  c.addi       a2, 12
                  lui          a4, 877370
                  add          s2, t1, s11
                  mulhsu       s8, s4, a1
                  csrrci       t2, 0x340, 31
                  c.add        a7, s5
                  divu         a0, s1, s2
                  c.mv         s3, s1
                  or           s6, t5, t4
                  mulhsu       a7, t0, t0
                  c.nop
                  c.xor        a4, a0
                  sra          t2, a1, s6
                  c.srli       a3, 22
                  srai         s1, a7, 4
                  sra          a2, s3, a4
                  c.andi       a1, 24
                  c.sub        s1, a3
                  c.sub        a3, s1
                  c.sub        a1, a0
                  slli         s10, t6, 15
                  andi         a0, t0, 570
                  and          zero, zero, s0
                  srl          a3, t4, gp
                  mulhsu       a2, a5, a2
                  mul          s10, a6, a0
                  remu         a4, s1, s0
                  c.or         a3, a5
                  csrrwi       s8, 0x340, 14
                  srli         s7, s6, 28
                  c.srli       a2, 9
                  nop
                  c.sub        a1, s1
                  c.and        s1, a4
                  mulhu        s0, s4, a6
                  c.xor        a3, s0
                  csrrw        s11, 0x340, s9
                  c.li         s7, 22
                  c.sub        a4, a2
                  c.slli       s1, 18
                  xori         t2, s5, 1474
                  or           a3, s2, a3
                  c.srai       s1, 7
                  mulh         s3, a2, a6
                  c.and        a0, a0
                  or           a6, gp, s11
                  c.srli       a4, 15
                  rem          s10, t0, s6
                  c.lui        a2, 11
                  andi         s1, s1, 228
                  ori          s1, a0, -1591
                  lui          t2, 549231
                  mulhu        t2, a0, s2
                  add          a3, t0, s8
                  c.li         s1, 11
                  c.srai       a2, 13
                  andi         t0, t5, 1935
                  auipc        s6, 261117
                  addi         s10, s2, 1762
                  sra          s11, a3, s10
                  sub          s3, s8, t0
                  xori         s2, ra, 951
                  csrrci       s9, 0x340, 0
                  c.mv         a4, s3
                  mulhu        a3, s2, a3
                  csrrci       s6, 0x340, 1
                  addi         a1, s4, -1688
                  mul          s6, s10, sp
                  c.or         a4, a2
                  nop
                  slti         s4, s0, 1850
                  remu         a6, a2, s1
                  c.li         t1, -1
                  c.lui        a6, 1
                  c.mv         s3, s6
                  slt          a6, s5, tp
                  srli         t6, t2, 14
                  mulhu        gp, a4, s8
                  or           s11, s1, t2
                  mul          s2, sp, a3
                  or           s11, a3, s2
                  addi         a6, s0, -356
                  auipc        t6, 85684
                  sub          s1, s1, sp
                  c.li         a6, 30
                  c.mv         s9, s1
                  xori         s11, a4, -192
                  mulh         s9, a3, a6
                  mulhu        a2, s9, ra
                  sltiu        t5, s4, 802
                  c.mv         s11, s7
                  slt          s8, a2, s2
                  c.slli       ra, 7
                  div          t4, a4, s0
                  sltu         t6, a0, t3
                  mulhsu       t1, t4, s2
                  addi         s1, ra, -1912
                  remu         s7, s4, t5
                  lui          s1, 886508
                  sub          s2, t2, s9
                  srai         a4, a5, 15
                  c.or         s1, a0
                  c.xor        a2, a5
                  csrrs        t3, 0x340, s11
                  or           s8, gp, t1
                  csrrwi       t6, 0x340, 22
                  sltiu        t6, s0, -2044
                  remu         a1, a1, s11
                  c.nop
                  srai         s1, ra, 15
                  sltu         t4, t6, t2
                  c.add        s9, s10
                  c.slli       s10, 13
                  mulh         s0, a3, a3
                  csrrsi       a2, 0x340, 0
                  csrrci       s9, 0x340, 0
                  csrrci       s0, 0x340, 0
                  c.nop
                  c.srai       a3, 3
                  xor          a7, a7, t0
                  c.lui        a2, 28
                  c.lui        s2, 12
                  c.or         a0, a2
                  mulh         s8, a7, a2
                  or           t0, t0, a6
                  csrrci       tp, 0x340, 27
                  sra          a3, t4, a0
                  auipc        t6, 264924
                  nop
                  c.and        s1, s1
                  c.li         s11, 17
                  sll          gp, tp, sp
                  csrrs        s1, 0x340, zero
                  add          t6, a7, s7
                  divu         t2, tp, s5
                  srli         a2, s9, 5
                  sra          a7, t5, t2
                  c.xor        a0, a5
                  c.andi       s0, -1
                  c.or         s0, a2
                  csrrwi       s4, 0x340, 18
                  or           ra, a5, t0
                  csrrwi       a3, 0x340, 13
                  rem          a7, s2, t5
                  sra          t6, s4, s11
                  csrrw        t5, 0x340, a2
                  addi         a3, t1, -121
                  c.sub        a1, a3
                  srai         t3, ra, 24
                  sra          s11, s5, t3
                  mulh         tp, t1, a0
                  addi         a4, s2, 1077
                  mul          s7, t2, a5
                  c.srli       a0, 2
                  csrrci       ra, 0x340, 0
                  c.xor        a3, s0
                  addi         ra, s4, -619
                  c.mv         tp, a1
                  c.addi       a1, -1
                  remu         t5, s3, s2
                  csrrs        gp, 0x340, a1
                  csrrw        t2, 0x340, a1
                  sltiu        t3, sp, -260
                  c.andi       a3, 30
                  sra          a3, s2, t5
                  c.mv         s6, s4
                  c.srli       a1, 25
                  c.nop
                  divu         s1, t5, a1
                  mul          a1, s9, a5
                  mul          a3, t0, s7
                  csrrsi       a1, 0x340, 17
                  c.nop
                  divu         a7, ra, t0
                  xori         s2, t1, 1389
                  slti         a0, zero, -1448
                  c.nop
                  c.mv         s9, s10
                  nop
                  c.srai       a1, 20
                  sra          zero, a4, t0
                  or           a1, a0, a2
                  srli         a7, t5, 27
                  c.addi       s11, 17
                  auipc        ra, 834733
                  slli         s7, s2, 20
                  or           gp, s11, a7
                  sltiu        s1, a4, 996
                  c.slli       a4, 5
                  c.or         a0, a5
                  xori         a4, t0, 1053
                  sltiu        s10, a7, 1070
                  slli         s7, s11, 21
                  mulhsu       tp, a1, t1
                  rem          a2, s7, t4
                  nop
                  c.and        a4, s0
                  csrrs        t0, 0x340, gp
                  c.mv         s8, gp
                  c.or         a1, a5
                  ori          zero, s5, -106
                  c.xor        s1, a5
                  mulhsu       s10, a4, zero
                  andi         s7, t2, 44
                  c.andi       a0, 7
                  slti         zero, zero, 419
                  csrrci       a6, 0x340, 0
                  c.addi       t0, -1
                  csrrsi       t1, 0x340, 0
                  c.lui        t5, 10
                  or           s9, t4, s3
                  sltiu        t4, a5, 1924
                  and          t1, tp, a0
                  ori          a1, s3, -1310
                  csrrci       s8, 0x340, 14
                  c.addi       gp, -1
                  nop
                  andi         t0, s11, 910
                  mulhsu       a6, s0, s3
                  xori         tp, t1, 1176
                  sub          a0, s4, a3
                  slti         s9, t1, -1210
                  c.addi       s10, -1
                  c.addi       t6, -1
                  c.srli       a0, 11
                  xori         ra, s0, -651
                  xor          a6, s9, a3
                  auipc        s4, 620353
                  csrrs        ra, 0x340, t6
                  c.slli       gp, 24
                  mulhu        s2, s6, t3
                  mul          s7, t2, gp
                  srli         tp, s1, 23
                  csrrsi       s1, 0x340, 27
                  c.add        t1, ra
                  c.slli       t6, 26
                  c.or         s1, s0
                  c.sub        s1, s0
                  sra          s1, a5, a2
                  sltiu        s0, s6, 791
                  c.nop
                  csrrw        t1, 0x340, a7
                  nop
                  sltu         t0, tp, s3
                  xori         s0, s8, 1151
                  c.nop
                  ori          a4, s9, 714
                  or           a4, s11, tp
                  csrrc        s0, 0x340, t4
                  c.li         a4, -1
                  csrrsi       s3, 0x340, 0
                  xor          a0, t1, s11
                  csrrwi       a3, 0x340, 26
                  mulhu        a7, a0, t0
                  c.xor        a1, a5
                  slti         a6, sp, 1724
                  add          s1, s6, t4
                  add          t0, a3, zero
                  sll          t1, t5, zero
                  c.or         a0, s1
                  mulhu        s2, a5, a7
                  mulhu        s8, a5, s5
                  sra          tp, s4, s11
                  add          s10, s8, t3
                  slti         s9, a3, 42
                  c.srai       s1, 18
                  xor          s7, a1, a6
                  mulh         t6, a4, a3
                  srl          t3, t3, ra
                  c.add        a6, t4
                  csrrwi       s1, 0x340, 6
                  rem          a6, s0, sp
                  srl          t6, a5, gp
                  csrrci       tp, 0x340, 0
                  mulh         s9, zero, s7
                  csrrwi       s4, 0x340, 8
                  c.li         a4, 14
                  slt          s8, tp, sp
                  lui          ra, 721471
                  addi         s1, a5, -2006
                  srai         zero, gp, 31
                  rem          t2, s6, a0
                  div          t3, a5, t5
                  csrrsi       t6, 0x340, 0
                  nop
                  slt          t3, t4, t6
                  auipc        ra, 841172
                  divu         ra, t6, s4
                  andi         t6, t4, -912
                  c.add        t1, s3
                  csrrwi       s11, 0x340, 28
                  csrrw        zero, 0x340, t1
                  csrrs        a2, 0x340, tp
                  c.srai       s0, 6
                  or           s4, s9, sp
                  srai         s8, s1, 27
                  c.and        a1, a2
                  nop
                  lui          t1, 981415
                  andi         gp, zero, 877
                  c.addi       s3, 21
                  and          t0, s0, zero
                  c.slli       t2, 4
                  lui          a2, 696243
                  c.and        s0, s1
                  andi         s2, t0, -939
                  c.or         a1, s0
                  remu         s1, a7, s5
                  slt          t6, s9, s3
                  srai         a1, gp, 23
                  srai         a7, s5, 16
                  c.mv         s8, a6
                  c.xor        s1, a2
                  c.srai       s1, 14
                  nop
                  remu         t5, t2, s3
                  lui          s4, 616389
                  addi         a3, s6, -1986
                  mulhsu       a0, s2, a3
                  sll          t4, a6, t3
                  divu         ra, s3, t0
                  mulhsu       s9, a0, s4
                  sll          s11, a1, t2
                  c.mv         t3, s0
                  slt          s0, tp, a2
                  srli         s0, a4, 19
                  c.addi       ra, -1
                  c.li         tp, 8
                  xori         a1, a5, -1743
                  div          t3, a6, s9
                  slt          t5, s0, t3
                  c.mv         s3, s1
                  c.srli       a2, 29
                  csrrc        t4, 0x340, a2
                  sra          t1, a2, t2
                  mul          s4, s7, s2
                  srl          t2, t0, t5
                  mulh         s8, a7, s5
                  c.slli       s1, 11
                  c.xor        a4, s1
                  c.srli       s0, 21
                  c.lui        s8, 4
                  rem          s8, t2, s2
                  csrrci       s0, 0x340, 5
                  or           t6, s8, s7
                  csrrw        s11, 0x340, a0
                  c.sub        s0, a5
                  c.xor        s1, a5
                  csrrsi       gp, 0x340, 9
                  nop
                  srai         s9, s1, 27
                  csrrsi       a7, 0x340, 5
                  xor          t5, zero, t3
                  csrrs        s10, 0x340, zero
                  mulh         t1, s3, a7
                  c.srli       a0, 21
                  or           s2, zero, a4
                  mulhu        t6, a3, gp
                  slti         a0, t5, -1097
                  srl          t2, a3, a1
                  sll          s1, s7, a6
                  add          s3, s5, tp
                  sub          s0, t0, a1
                  csrrs        tp, 0x340, zero
                  csrrc        t3, 0x340, a5
                  csrrw        t5, 0x340, t5
                  ori          s6, a7, 969
                  and          ra, t2, s6
                  c.addi       ra, -1
                  sll          a6, a1, s2
                  lui          s3, 391275
                  c.xor        s1, a2
                  div          t3, a1, t4
                  div          ra, a0, s0
                  srli         a0, s0, 0
                  andi         a6, a5, -107
                  csrrci       s0, 0x340, 9
                  and          s7, ra, s2
                  c.add        t2, t2
                  c.srai       a0, 12
                  rem          gp, s11, s9
                  slli         a0, t1, 1
                  xori         a6, t5, 938
                  nop
                  andi         s4, a2, 1908
                  csrrwi       a4, 0x340, 3
                  csrrw        s3, 0x340, s6
                  slt          a6, s4, t3
                  csrrc        a1, 0x340, a5
                  c.andi       a1, -1
                  c.xor        a0, s1
                  nop
                  slti         gp, s7, 541
                  nop
                  c.srai       a1, 1
                  remu         s9, s9, tp
                  c.or         a3, s1
                  csrrsi       t3, 0x340, 0
                  slli         s11, t3, 0
                  sra          a3, t1, t1
                  c.lui        a2, 23
                  sll          s7, a1, tp
                  div          s0, a7, s4
                  slti         s11, t1, -337
                  or           s8, t5, ra
                  and          t2, s7, a5
                  remu         t5, ra, zero
                  c.nop
                  c.srai       a2, 7
                  sll          t5, a2, s1
                  c.or         s1, a5
                  rem          a1, a3, t5
                  csrrsi       t1, 0x340, 12
                  csrrwi       s3, 0x340, 17
                  sltu         a6, t0, a5
                  sltu         t6, a3, s9
                  auipc        gp, 283990
                  srai         s3, a1, 11
                  mulh         t4, s1, s6
                  c.xor        a4, a3
                  sub          a3, a3, s3
                  sra          zero, t0, s0
                  c.add        s2, t4
                  c.lui        s10, 22
                  c.andi       a3, 22
                  xori         t2, s3, -1610
                  and          s10, s10, s11
                  remu         t4, s5, s0
                  slli         a2, s3, 21
                  mulh         t2, a0, t6
                  csrrwi       t1, 0x340, 28
                  c.or         s1, s1
                  csrrc        t0, 0x340, zero
                  sltu         ra, s0, t6
                  sltu         s6, s10, s8
                  srli         ra, a4, 24
                  andi         s8, s7, -1869
                  slli         s0, zero, 3
                  sltiu        s9, a7, 958
                  csrrsi       t4, 0x340, 10
                  xori         ra, a3, -1572
                  c.lui        a0, 1
                  andi         a0, t2, -1466
                  c.andi       a0, -1
                  auipc        s10, 553724
                  srli         t2, sp, 0
                  c.srai       s0, 6
                  c.srai       s1, 15
                  c.sub        a1, a0
                  lui          s6, 760346
                  c.xor        s1, a0
                  csrrwi       s3, 0x340, 19
                  c.slli       tp, 28
                  csrrsi       ra, 0x340, 0
                  rem          s4, t4, t5
                  slt          s9, s3, s8
                  nop
                  xori         t2, a3, -626
                  slt          t6, s1, zero
                  slli         s8, s1, 6
                  ori          a0, zero, -1824
                  mul          s11, t4, s11
                  c.and        a3, a5
                  xori         ra, s10, 1851
                  sltu         s11, t1, a1
                  rem          s4, zero, t0
                  sll          t5, s8, s4
                  slti         s6, t3, -624
                  auipc        s7, 684763
                  srli         ra, tp, 8
                  csrrc        a1, 0x340, zero
                  slti         a3, s3, 2012
                  srl          s1, s5, ra
                  mulh         a7, sp, s11
                  c.andi       a1, -1
                  addi         t5, zero, -99
                  csrrs        t4, 0x340, s8
                  csrrc        s8, 0x340, s6
                  sltu         ra, a7, sp
                  lui          t4, 475444
                  addi         t0, s1, 1285
                  csrrwi       s10, 0x340, 31
                  csrrsi       s3, 0x340, 14
                  csrrc        t5, 0x340, t1
                  lui          a2, 149749
                  auipc        s0, 748928
                  csrrc        a0, 0x340, t5
                  remu         a1, a7, s7
                  auipc        s9, 917446
                  c.or         s0, a4
                  csrrc        ra, 0x340, zero
                  c.or         a1, s0
                  c.srli       a0, 26
                  xori         t5, gp, -1421
                  c.andi       a4, -1
                  mul          s8, t6, t5
                  andi         a2, t0, -544
                  sll          s3, a3, t4
                  csrrsi       a1, 0x340, 2
                  ori          t4, zero, 1149
                  c.sub        a3, a4
                  lui          a7, 925399
                  c.or         a1, s0
                  c.sub        a1, a3
                  sub          s0, gp, zero
                  slti         s8, s1, 1172
                  csrrsi       tp, 0x340, 0
                  xori         t1, t2, 1976
                  mul          s2, t4, a6
                  ori          ra, a0, 932
                  ori          tp, a0, -1139
                  csrrc        gp, 0x340, zero
                  slli         t3, s9, 5
                  csrrs        s0, 0x340, gp
                  sltu         a1, gp, s11
                  div          a7, t6, s7
                  auipc        s11, 679949
                  ori          s11, tp, 1329
                  addi         s0, a2, -158
                  mulh         t6, t0, t0
                  sub          t5, s8, t0
                  c.lui        tp, 30
                  c.add        tp, s2
                  slt          a3, s10, s2
                  xor          s2, t1, a5
                  c.andi       s0, -1
                  c.srli       a2, 21
                  mulhu        t1, a5, a4
                  xori         a0, tp, 809
                  csrrwi       s0, 0x340, 13
                  sltu         a4, s4, a3
                  srli         s1, s8, 2
                  slti         s0, t2, 786
                  nop
                  c.and        a0, a0
                  xor          t6, a2, gp
                  sll          t1, sp, a2
                  c.srai       s1, 5
                  csrrsi       s7, 0x340, 3
                  andi         s2, a4, -1423
                  xor          s4, s0, a7
                  or           s0, tp, s3
                  sub          t0, s6, a1
                  c.slli       tp, 29
                  xor          s11, s4, a1
                  csrrci       s10, 0x340, 0
                  sra          s10, s2, a5
                  addi         s10, s5, -832
                  c.add        s11, a3
                  c.xor        a3, a4
                  rem          a3, s11, s6
                  slti         zero, a5, -89
                  nop
                  csrrs        t2, 0x340, zero
                  csrrc        gp, 0x340, a2
                  c.add        s3, s4
                  mul          s0, zero, s2
                  nop
                  auipc        t5, 90210
                  slli         s3, t1, 3
                  srai         t2, t1, 11
                  andi         s7, sp, -1056
                  rem          t6, s2, ra
                  srai         t4, s2, 26
                  srai         s4, a2, 28
                  srli         s0, s1, 17
                  c.slli       a6, 15
                  c.srai       s1, 28
                  sltu         t2, t2, t2
                  srli         t3, a7, 26
                  c.andi       s0, -1
                  srli         a0, s9, 14
                  c.lui        a7, 25
                  and          s11, s8, s11
                  divu         a1, s3, a6
                  slti         a3, a2, 1120
                  remu         ra, zero, t6
                  c.add        a6, s6
                  c.li         a7, 6
                  remu         s4, t6, t4
                  sltu         s8, s5, s4
                  c.mv         a3, s6
                  sltiu        a1, zero, -1781
                  c.srai       a1, 1
                  c.lui        t4, 15
                  csrrsi       a3, 0x340, 0
                  slt          s4, zero, t4
                  srl          t1, a6, s9
                  csrrw        s1, 0x340, t3
                  srl          ra, t3, t6
                  srl          gp, s11, gp
                  mulh         s2, s10, t4
                  sltu         s8, a3, zero
                  c.srli       a1, 28
                  mul          t6, t2, s7
                  add          a0, a1, s11
                  lui          s0, 644150
                  mulh         t3, a1, a3
                  rem          s1, s4, a5
                  csrrsi       s4, 0x340, 0
                  csrrs        ra, 0x340, zero
                  c.add        s4, s9
                  andi         a3, zero, -2045
                  srli         a4, t3, 24
                  xori         s1, sp, -277
                  srai         t1, s5, 0
                  xori         a7, s5, -1223
                  csrrs        t4, 0x340, a0
                  xor          t3, s7, a3
                  add          s2, a2, s5
                  andi         s4, a0, 1353
                  slti         ra, s9, 580
                  mulh         s10, s7, a6
                  sra          s10, s10, t4
                  mul          s3, a4, a3
                  sub          s2, a0, t1
                  c.li         a3, 20
                  sll          t4, t2, s3
                  and          tp, gp, t5
                  c.add        s8, a6
                  c.sub        a2, s1
                  c.or         s0, a0
                  lui          s11, 999712
                  c.add        t0, t5
                  csrrsi       s2, 0x340, 0
                  sltiu        s7, a5, 1165
                  c.li         a6, 5
                  srai         a6, a1, 19
                  c.li         a4, 29
                  sltu         t3, a0, s7
                  mulh         t6, ra, ra
                  sll          s7, t0, s9
                  slt          s6, tp, zero
                  addi         a6, s5, -1376
                  c.or         a0, a4
                  slli         s7, s11, 11
                  ori          ra, s4, 1779
                  sltiu        s10, t0, -2042
                  srl          s8, ra, a3
                  c.sub        a0, a3
                  csrrw        zero, 0x340, gp
                  xori         t1, s11, 1254
                  csrrc        s8, 0x340, s8
                  rem          tp, s7, t3
                  csrrwi       a4, 0x340, 18
                  and          s2, a1, s8
                  slti         a6, a6, -2002
                  c.slli       s4, 2
                  and          ra, s2, t6
                  and          s3, a0, a5
                  c.srai       s0, 1
                  sltu         t3, a1, s3
                  csrrc        s2, 0x340, zero
                  c.li         t0, 22
                  sltu         s0, gp, t6
                  slti         a3, a2, -588
                  nop
                  c.lui        a6, 7
                  c.nop
                  srli         zero, a0, 5
                  csrrc        s2, 0x340, zero
                  div          s0, a6, s2
                  sub          t3, t6, s8
                  mulhu        s11, a5, s0
                  or           t4, t6, s2
                  mulhu        zero, s4, a2
                  c.add        gp, t0
                  ori          t1, t1, -452
                  ori          a3, t1, -1262
                  srli         zero, s3, 9
                  ori          s8, s3, 1721
                  csrrwi       a7, 0x340, 1
                  c.xor        s0, a1
                  mulhsu       zero, t4, ra
                  mul          a1, t6, a0
                  csrrs        t0, 0x340, t5
                  xori         s3, a5, 453
                  sltiu        t4, a5, -1040
                  csrrsi       a2, 0x340, 0
                  xor          a2, s0, s3
                  c.nop
                  div          a7, sp, a0
                  add          s1, zero, t0
                  c.and        a0, s0
                  mulhu        s11, a5, t2
                  c.nop
                  lui          s0, 784881
                  and          s11, s10, t0
                  c.nop
                  c.mv         s1, a4
                  c.li         a1, -1
                  ori          tp, gp, 371
                  c.li         t6, -1
                  srl          ra, t4, s1
                  srli         t5, a1, 26
                  auipc        a6, 274206
                  srai         s2, a4, 1
                  sltiu        tp, gp, -2028
                  c.nop
                  slti         zero, a7, 1130
                  and          t5, s5, s10
                  c.lui        t0, 14
                  srai         s11, a4, 10
                  sll          a1, ra, s2
                  sub          t4, s8, a7
                  csrrw        t4, 0x340, s7
                  ori          t0, a1, -1311
                  mul          ra, a6, a5
                  div          s0, t5, s6
                  auipc        zero, 338807
                  lui          s2, 807792
                  c.nop
                  srli         s11, t5, 6
                  mulhu        gp, gp, zero
                  div          s4, a4, a0
                  srai         t6, s2, 4
                  csrrw        s7, 0x340, s4
                  mulhsu       s11, s11, gp
                  csrrc        zero, 0x340, zero
                  c.li         s6, 23
                  csrrw        s2, 0x340, s9
                  csrrw        s4, 0x340, sp
                  csrrci       a7, 0x340, 20
                  slti         a4, s3, 162
                  c.slli       s0, 14
                  div          tp, t4, a5
                  nop
                  divu         s11, zero, s10
                  slt          t2, s1, s11
                  csrrs        a4, 0x340, zero
                  nop
                  div          a1, s9, s10
                  rem          s6, a4, a6
                  c.and        a4, s0
                  c.sub        s1, a5
                  mulh         s11, s10, s5
                  mul          s4, ra, a4
                  c.and        a1, a0
                  c.addi       s10, 24
                  csrrw        a0, 0x340, s11
                  c.andi       a1, 16
                  and          s3, a3, a6
                  xor          tp, s9, sp
                  srl          s7, a4, s0
                  xor          s8, s9, gp
                  csrrsi       s8, 0x340, 0
                  sltiu        t2, t3, -1109
                  c.li         a2, -1
                  sra          s11, a7, a7
                  sub          a2, a2, a4
                  lui          a7, 286656
                  c.and        s1, a5
                  mulh         a2, s8, a2
                  mulh         s6, a6, s1
                  div          s6, a7, sp
                  csrrc        s11, 0x340, zero
                  xor          t1, a3, s6
                  sltu         gp, t5, a4
                  c.add        s8, tp
                  lui          s8, 897403
                  auipc        a6, 384910
                  auipc        s6, 1007213
                  srai         tp, a7, 1
                  csrrs        gp, 0x340, s5
                  mulhu        s9, t4, a2
                  or           a0, s1, s9
                  csrrwi       s7, 0x340, 22
                  c.or         s0, a3
                  csrrci       a1, 0x340, 21
                  remu         s2, t2, a0
                  xor          s11, t6, s4
                  or           t5, t1, s10
                  rem          t1, ra, t5
                  srl          a7, s0, t3
                  or           t0, gp, a3
                  c.add        a0, s9
                  c.addi       a6, -1
                  csrrsi       a3, 0x340, 0
                  xor          a3, s2, s3
                  lui          a3, 947640
                  sltu         a0, t0, s10
                  addi         t2, s5, 728
                  div          ra, t2, ra
                  slti         s6, ra, -535
                  and          s11, s0, sp
                  addi         s1, zero, 619
                  auipc        ra, 110133
                  mulh         s3, t3, t3
                  div          s11, a0, s8
                  mul          gp, s0, t5
                  csrrsi       t1, 0x340, 28
                  mulhu        t0, t5, s10
                  remu         s3, s3, s8
                  c.slli       t4, 20
                  xori         a2, t4, 1222
                  sltu         t6, sp, a3
                  add          s0, a7, s10
                  csrrc        t6, 0x340, zero
                  csrrs        a1, 0x340, t3
                  slt          s4, t2, s5
                  slli         t2, s3, 1
                  c.xor        a0, s1
                  sub          tp, s10, t6
                  c.and        a2, a4
                  srai         gp, zero, 23
                  c.slli       a7, 18
                  c.li         s6, 22
                  sll          s6, t1, s5
                  c.sub        s0, a2
                  csrrwi       gp, 0x340, 0
                  c.mv         a7, t3
                  csrrsi       s1, 0x340, 4
                  or           ra, a5, s9
                  csrrw        s11, 0x340, sp
                  srli         s11, s2, 7
                  srl          s6, a1, t5
                  srli         a0, zero, 20
                  andi         s4, s11, 1690
                  csrrc        s8, 0x340, s4
                  mulh         a6, t5, a5
                  mulhu        s0, a3, tp
                  slli         s11, t1, 26
                  or           s3, a6, t2
                  c.srli       a3, 7
                  slli         a7, t6, 14
                  csrrs        tp, 0x340, tp
                  mul          t1, s1, gp
                  c.slli       a0, 16
                  c.lui        a4, 4
                  csrrs        a6, 0x340, s3
                  c.addi       s1, 3
                  andi         a7, zero, -788
                  c.li         a6, 13
                  c.or         a0, s0
                  csrrs        t6, 0x340, zero
                  ori          t0, a1, -773
                  div          t5, a1, tp
                  c.sub        s1, a1
                  c.li         a1, -1
                  c.sub        a4, s1
                  ori          a1, t6, 588
                  and          a7, t2, s10
                  mulhsu       s1, s2, a6
                  c.xor        s1, a4
                  xori         a0, s1, 1271
                  srai         t4, a3, 31
                  xor          t1, s6, t3
                  mulh         s4, s11, gp
                  sll          t1, t0, t0
                  c.sub        a3, a1
                  srai         s8, t1, 25
                  c.sub        a0, a2
                  sll          a2, s10, a6
                  and          t6, a1, gp
                  csrrci       t0, 0x340, 12
                  csrrc        tp, 0x340, zero
                  srai         a7, a5, 28
                  c.lui        s9, 3
                  or           a0, t4, s2
                  c.lui        s4, 1
                  c.add        t3, a0
                  rem          s0, t3, s10
                  c.lui        ra, 12
                  or           s1, s9, s4
                  c.nop
                  mulhsu       t1, s10, s10
                  c.nop
                  mulhsu       a2, s0, t0
                  c.lui        a4, 17
                  xori         a2, a4, 629
                  c.add        a0, s1
                  ori          a0, a4, -996
                  div          a3, a3, t2
                  c.mv         t2, a7
                  csrrci       ra, 0x340, 29
                  srai         t6, t3, 21
                  c.srli       a1, 27
                  mulh         s8, t2, a4
                  sltu         t2, a0, s6
                  c.andi       a2, 3
                  srl          s1, t6, a4
                  c.and        a2, a0
                  add          s7, s8, s6
                  rem          s6, s2, a0
                  c.sub        a4, s0
                  xori         a3, s9, -1115
                  and          a1, a3, s9
                  xor          zero, s6, a2
                  remu         a2, a6, t4
                  c.add        a1, s5
                  mulhsu       a7, t1, t4
                  mulh         a4, tp, ra
                  c.andi       a0, 6
                  rem          s11, a7, s3
                  c.sub        a1, a4
                  mulhsu       a6, a6, t2
                  c.or         a0, s1
                  c.nop
                  csrrwi       ra, 0x340, 2
                  mulh         a4, a0, s0
                  csrrsi       s4, 0x340, 23
                  c.lui        s10, 29
                  or           t0, t4, s0
                  divu         s1, s7, s6
                  c.addi       gp, -1
                  c.andi       a4, -1
                  c.srai       a3, 8
                  divu         a6, s0, s9
                  sub          t3, s10, s1
                  slt          zero, zero, t5
                  c.li         s1, -1
                  sltu         gp, t4, s5
                  slti         t1, t6, 998
                  slt          s0, s5, t3
                  csrrci       s1, 0x340, 12
                  csrrc        s6, 0x340, zero
                  csrrc        s10, 0x340, a4
                  andi         a2, a4, -16
                  csrrc        t0, 0x340, zero
                  slt          s8, tp, a4
                  auipc        a3, 964558
                  csrrwi       t1, 0x340, 24
                  c.or         a2, a1
                  and          t5, a0, gp
                  srl          a4, s6, t4
                  remu         zero, tp, t1
                  c.addi       a6, -1
                  c.srai       a2, 16
                  csrrw        tp, 0x340, t4
                  addi         s10, t2, 1049
                  srl          a7, t4, s7
                  add          a0, a4, zero
                  csrrs        ra, 0x340, s7
                  csrrc        s1, 0x340, zero
                  auipc        t6, 703731
                  c.slli       s8, 16
                  c.mv         t5, a7
                  addi         t0, a7, 2024
                  slti         tp, s5, -780
                  sltiu        t6, t1, -1097
                  mulhsu       ra, s8, s5
                  mulhu        s3, ra, s3
                  c.srli       a3, 25
                  c.li         t0, -1
                  c.addi       t1, 9
                  sltu         s8, s11, t4
                  csrrwi       t0, 0x340, 17
                  slt          a1, ra, t2
                  sltiu        t4, t1, -1877
                  c.add        gp, s8
                  sll          gp, a4, s10
                  c.srli       a1, 1
                  slt          ra, a7, s9
                  rem          a6, a7, t0
                  c.mv         s8, a6
                  srli         a3, tp, 10
                  c.srai       a2, 10
                  slti         a3, tp, 362
                  c.and        a3, a0
                  c.nop
                  c.slli       a6, 23
                  c.srai       a1, 16
                  csrrc        a7, 0x340, a4
                  div          ra, gp, ra
                  srl          s10, zero, t0
                  xor          t2, s6, s9
                  csrrwi       a3, 0x340, 2
                  or           t3, s9, a5
                  rem          s1, s10, t5
                  csrrwi       s1, 0x340, 29
                  c.slli       t3, 8
                  add          s2, s1, zero
                  c.li         t6, -1
                  slt          s4, s6, a1
                  xor          t5, s10, s2
                  ori          t0, s11, 644
                  c.lui        s4, 23
                  c.slli       a4, 8
                  c.andi       a1, -1
                  addi         t2, s11, 515
                  mul          a4, t0, t4
                  mul          t0, a7, s9
                  srl          s2, tp, t0
                  c.nop
                  srai         t6, t0, 21
                  srli         s4, a4, 31
                  auipc        t0, 809296
                  sll          t6, t6, t3
                  c.slli       a4, 15
                  addi         s11, t3, 393
                  xori         t1, t2, -1969
                  c.li         s9, 15
                  mulhu        t4, a0, s11
                  auipc        t0, 544826
                  c.and        a4, a1
                  mul          a7, t3, t1
                  sra          t4, s5, t4
                  c.lui        t0, 27
                  srli         s8, sp, 21
                  c.xor        a1, a3
                  c.nop
                  xor          t2, s8, gp
                  c.srli       a0, 2
                  mulhu        t2, s3, ra
                  addi         s10, s11, -1622
                  mulh         t4, a2, tp
                  csrrw        s11, 0x340, s5
                  sll          t0, sp, t2
                  auipc        a6, 400291
                  c.and        a2, a2
                  c.lui        a0, 5
                  c.or         a4, a1
                  xor          tp, s5, s8
                  mulhsu       a7, a5, t0
                  c.li         t6, -1
                  csrrs        s6, 0x340, t4
                  sltiu        tp, ra, -1678
                  sltu         t4, s2, s1
                  rem          s9, sp, s5
                  c.add        a0, s1
                  remu         s4, t5, s10
                  div          s1, tp, sp
                  c.or         a4, s1
                  lui          s8, 318625
                  c.and        a1, a4
                  c.mv         t4, a6
                  sra          t6, sp, s0
                  andi         s11, t1, -1636
                  slti         t2, t6, -605
                  mul          t2, sp, t2
                  c.addi       s7, -1
                  addi         t5, t1, 1484
                  and          a1, a2, s2
                  ori          a7, s11, 606
                  c.add        s7, a5
                  c.nop
                  sltu         tp, t5, s9
                  add          s3, a1, s5
                  xori         gp, sp, 1573
                  and          s6, a7, t5
                  rem          s7, zero, s7
                  srai         zero, t5, 5
                  c.slli       a4, 21
                  c.srai       s1, 2
                  c.xor        a4, a4
                  remu         a0, tp, s10
                  andi         a2, a5, -1356
                  c.and        s0, s1
                  sltu         s0, s11, s1
                  c.li         s3, 0
                  srl          s4, s9, s0
                  rem          t6, a5, a2
                  ori          a1, a2, -1136
                  mulh         t0, s7, gp
                  rem          s0, a7, s9
                  andi         s1, a0, 1548
                  or           a6, a4, s11
                  mulhu        zero, t1, t5
                  ori          t3, s1, -1805
                  csrrwi       s4, 0x340, 9
                  remu         t6, s11, s4
                  c.nop
                  sll          a7, a2, a5
                  csrrc        t2, 0x340, zero
                  c.lui        t3, 31
                  csrrci       a1, 0x340, 12
                  andi         s9, s2, 1401
                  slti         a4, a2, 1756
                  srai         ra, s5, 16
                  csrrs        t3, 0x340, a0
                  addi         s6, t3, 532
                  csrrwi       s11, 0x340, 10
                  xor          t3, zero, s11
                  andi         s8, s11, 1270
                  sll          t3, s2, s2
                  csrrwi       s3, 0x340, 9
                  sltiu        s10, t2, 1534
                  andi         s2, s4, 1833
                  srl          tp, s6, s4
                  addi         tp, s11, -1194
                  csrrc        t3, 0x340, zero
                  div          a7, a6, t2
                  xor          t4, s2, t4
                  and          t5, s10, a6
                  csrrwi       a2, 0x340, 25
                  csrrwi       s0, 0x340, 25
                  c.lui        s11, 11
                  sub          ra, t6, t5
                  c.srli       a0, 24
                  c.srai       a1, 6
                  srli         s1, s4, 13
                  c.sub        a3, a5
                  c.nop
                  c.li         a6, 23
                  ori          t2, s1, -1642
                  c.and        s0, a1
                  c.lui        s7, 1
                  slt          t2, s2, t2
                  c.slli       a6, 17
                  and          s2, s9, a4
                  csrrw        ra, 0x340, a0
                  slti         a1, s7, 1575
                  slt          t2, t5, s1
                  mulhsu       t6, s6, a7
                  sub          t3, a4, s3
                  rem          gp, s11, s11
                  div          t0, t3, s8
                  srai         a2, a5, 25
                  csrrsi       a2, 0x340, 0
                  add          t2, s4, a6
                  sltu         s8, s3, a2
                  csrrs        t3, 0x340, zero
                  xor          t2, a3, t4
                  mul          t5, s11, a5
                  mulhsu       t5, t6, a6
                  sltiu        gp, a6, -486
                  csrrci       s11, 0x340, 31
                  csrrs        ra, 0x340, zero
                  srl          s9, t1, s1
                  xor          s6, ra, s4
                  c.xor        a4, a4
                  ori          a7, zero, -315
                  csrrsi       s4, 0x340, 0
                  c.andi       a3, -1
                  c.mv         s4, t4
                  or           s7, t2, gp
                  slt          a3, t0, s7
                  auipc        zero, 150254
                  csrrw        t2, 0x340, a0
                  divu         t5, s9, sp
                  remu         t0, gp, s3
                  remu         a1, a7, s3
                  slt          s0, s4, t5
                  slt          s6, zero, t0
                  c.sub        a2, a3
                  divu         s9, gp, s6
                  andi         s11, s5, 500
                  mulh         s2, s1, t1
                  c.nop
                  csrrc        s1, 0x340, s3
                  c.add        s6, s1
                  c.and        a0, a3
                  andi         s2, a3, -587
                  c.sub        a0, a5
                  c.sub        a3, s0
                  mulhsu       a4, t2, s10
                  sll          s6, t5, s2
                  csrrwi       ra, 0x340, 4
                  sub          a7, a1, t2
                  slt          t3, s2, a3
                  mulh         a2, s10, t4
                  or           s1, t2, t4
                  mulhsu       s10, a2, s9
                  mulh         s0, t2, a5
                  c.xor        a1, a2
                  srli         ra, t3, 2
                  mul          a3, t2, a4
                  c.sub        s1, a0
                  c.addi       s9, 27
                  or           s3, s8, s4
                  xor          a7, t4, gp
                  or           t0, a3, s6
                  c.srli       a4, 4
                  csrrw        a1, 0x340, t1
                  csrrw        a2, 0x340, a7
                  c.add        s0, tp
                  and          t0, s5, sp
                  c.addi       t6, -1
                  c.nop
                  srl          s9, s2, t6
                  c.andi       a0, 26
                  c.srai       a4, 31
                  lui          tp, 339986
                  c.slli       s4, 1
                  c.li         a4, 6
                  c.sub        a0, a3
                  sll          s0, gp, s8
                  c.li         s6, -1
                  c.srli       s0, 6
                  divu         s7, t5, a0
                  c.or         a3, a0
                  slli         t3, a6, 29
                  sltu         t2, a5, ra
                  nop
                  lui          s9, 956621
                  c.lui        tp, 18
                  c.xor        a2, s1
                  csrrw        s8, 0x340, s9
                  lui          s11, 306728
                  c.srli       a3, 6
                  srai         s6, s6, 16
                  c.li         a4, -1
                  addi         a7, s10, -1867
                  c.addi       a1, 8
                  c.or         s0, a1
                  lui          ra, 525684
                  slt          t5, t4, a1
                  lui          s2, 464613
                  sll          t6, t0, t3
                  c.li         t6, -1
                  srai         t3, a4, 3
                  c.mv         s0, s9
                  xor          gp, a3, s7
                  nop
                  c.srli       a3, 3
                  sltu         s2, gp, a6
                  sra          s7, zero, s6
                  slt          s11, zero, a7
                  sra          a6, a4, s2
                  lui          s0, 1036785
                  rem          s4, s7, t1
                  slt          zero, s6, a2
                  mulhsu       a3, t2, t3
                  div          ra, s4, s10
                  xor          s8, s2, t2
                  csrrw        s0, 0x340, a6
                  srl          s1, zero, s7
                  slt          t1, s7, a4
                  c.andi       a3, -1
                  remu         a4, a0, t4
                  addi         s8, sp, -706
                  c.xor        a1, a2
                  csrrs        s8, 0x340, s8
                  csrrc        s11, 0x340, a4
                  slli         s0, a7, 27
                  or           a3, s0, s11
                  mulh         t6, s6, a5
                  sub          t0, s10, ra
                  andi         s1, sp, 1698
                  c.srli       s1, 15
                  csrrw        t6, 0x340, s7
                  c.lui        s11, 11
                  or           s8, s9, a4
                  ori          t1, s2, 1557
                  mul          gp, s8, s10
                  auipc        s6, 396991
                  srli         a1, a1, 16
                  slt          a4, s4, sp
                  slt          s9, s7, s6
                  mulhsu       s8, t1, sp
                  ori          a4, t0, -492
                  mulhu        t6, a7, t5
                  c.or         a1, a1
                  c.or         a4, a0
                  mulhu        t0, s2, a7
                  csrrs        tp, 0x340, zero
                  div          s3, a7, s11
                  csrrw        s9, 0x340, a7
                  xor          t1, s3, s8
                  nop
                  mulh         t4, s8, s7
                  c.mv         a6, tp
                  srai         t2, tp, 31
                  sub          s9, zero, a7
                  addi         a1, a5, -1312
                  ori          a4, tp, -826
                  c.sub        a1, a5
                  rem          a1, s1, a5
                  sltu         s2, s2, zero
                  csrrc        s2, 0x340, zero
                  srli         s0, tp, 13
                  c.slli       gp, 6
                  c.and        a1, a4
                  c.lui        s6, 7
                  srai         s2, t5, 7
                  mulhsu       a6, t0, a6
                  c.or         a2, s0
                  c.and        a0, s1
                  csrrsi       tp, 0x340, 26
                  c.and        a0, a1
                  csrrwi       t6, 0x340, 18
                  c.and        a3, a5
                  c.andi       s1, 16
                  mulh         gp, s8, t6
                  xori         s0, ra, -1487
                  c.lui        t1, 26
                  c.lui        a2, 4
                  c.and        a0, a2
                  sltu         a4, sp, a7
                  nop
                  and          t0, t1, a6
                  xori         t2, s2, 282
                  and          ra, t0, a1
                  srli         s9, gp, 15
                  c.addi       a4, 22
                  c.srli       a0, 8
                  and          t5, t0, t4
                  nop
                  sltiu        s0, t4, 761
                  xor          a0, a2, t2
                  sltu         zero, s0, s5
                  remu         t0, s6, t3
                  slt          a3, t2, a7
                  and          t6, s9, s2
                  or           a6, s3, ra
                  c.addi       t3, 14
                  c.add        a2, sp
                  sra          a7, a0, a6
                  c.add        s10, s10
                  csrrs        s10, 0x340, zero
                  csrrsi       ra, 0x340, 0
                  c.sub        s1, a0
                  c.li         a4, -1
                  c.addi       s3, -1
                  sltiu        tp, s9, -202
                  xori         s11, zero, 321
                  c.and        a1, a5
                  xor          t2, t5, gp
                  addi         t3, a0, 1189
                  rem          s6, t2, t4
                  c.or         a1, a3
                  or           a0, s11, a5
                  mulh         s4, s4, s8
                  lui          s9, 752261
                  lui          a4, 412835
                  sltiu        a4, s6, -943
                  xor          s8, a0, t0
                  slti         t3, t4, -99
                  or           s6, s2, a3
                  rem          t6, t5, t1
                  slt          zero, a7, s6
                  mulh         ra, s11, s7
                  mulhu        s2, s0, s0
                  c.and        a4, a1
                  auipc        t4, 37438
                  csrrc        a2, 0x340, s4
                  srli         tp, a6, 18
                  rem          t6, s0, a0
                  xori         s3, s1, -610
                  andi         t5, t4, 569
                  slti         a6, tp, 75
                  auipc        t1, 500040
                  srli         a2, a6, 3
                  ori          s9, s6, -2040
                  mul          s1, s10, s0
                  srli         s8, ra, 19
                  sub          ra, t0, a5
                  addi         s3, a0, -1535
                  c.addi       s1, -1
                  mulhsu       zero, a6, t5
                  sll          s7, a3, t2
                  srai         a0, s8, 26
                  c.andi       a2, 31
                  xor          s2, t4, s8
                  c.sub        a2, a5
                  c.addi       t5, 17
                  nop
                  sll          s9, a7, s8
                  slti         zero, t3, 1251
                  div          s10, t1, sp
                  c.srli       s1, 20
                  c.mv         a4, a5
                  ori          s4, t0, -550
                  slli         s7, s4, 21
                  c.andi       a3, 16
                  srai         s6, a7, 25
                  c.addi       s4, -1
                  c.lui        a6, 29
                  sll          s10, s10, t4
                  mulhsu       t5, s6, a5
                  srai         a3, t4, 26
                  csrrsi       tp, 0x340, 31
                  c.li         s11, 27
                  c.andi       a4, 29
                  c.srai       s1, 8
                  addi         ra, t6, 1767
                  nop
                  nop
                  c.or         a4, s1
                  sra          t3, ra, gp
                  c.sub        a4, a2
                  divu         ra, s11, a3
                  ori          s10, zero, 1609
                  c.andi       a3, 25
                  srl          s8, zero, s9
                  sub          a2, s1, t1
                  c.lui        tp, 30
                  c.srli       a3, 29
                  sltiu        s1, s3, 545
                  nop
                  rem          s7, ra, a4
                  c.xor        a3, a4
                  c.lui        s2, 4
                  mulhsu       s7, s6, s2
                  c.slli       ra, 21
                  or           a0, a7, zero
                  c.xor        a4, s0
                  c.nop
                  remu         zero, a3, a0
                  mulhu        s2, s6, s10
                  divu         ra, s8, s5
                  csrrsi       s9, 0x340, 0
                  c.add        s9, sp
                  sll          s10, s6, t2
                  csrrw        a0, 0x340, s1
                  srl          t3, t3, s5
                  csrrsi       zero, 0x340, 0
                  mul          s8, t3, t3
                  mul          s9, t6, s7
                  divu         ra, a7, t0
                  add          s0, t5, s3
                  sub          t0, a4, s0
                  add          s2, ra, a3
                  slli         a4, t2, 14
                  c.mv         a4, s9
                  csrrs        s6, 0x340, zero
                  xor          a6, t2, t3
                  andi         a1, a7, 415
                  xor          t1, s1, t2
                  srli         ra, sp, 25
                  mulh         s9, s4, zero
                  mul          s7, t3, s1
                  mulh         s4, a1, t2
                  nop
                  and          a3, ra, s1
                  ori          zero, a6, -961
                  sltiu        s4, a7, 749
                  remu         t5, t4, t2
                  c.srli       s1, 27
                  sltiu        s10, s6, 1094
                  addi         s9, a3, 1172
                  div          s0, s0, t6
                  slti         a0, sp, 1730
                  and          s0, t6, a5
                  mulhu        tp, t4, s3
                  mulhsu       t6, a3, a0
                  csrrs        s4, 0x340, zero
                  srai         s1, s2, 5
                  c.nop
                  nop
                  c.xor        a1, a2
                  c.xor        a2, a2
                  csrrwi       t5, 0x340, 25
                  c.li         t0, -1
                  remu         t4, t2, s1
                  c.mv         a3, s1
                  andi         s7, t2, -258
                  c.and        a0, s1
                  mulhsu       s3, t6, s10
                  auipc        s7, 786086
                  c.sub        a4, a4
                  srai         t3, t1, 9
                  sltiu        s8, t4, 651
                  rem          a0, s11, a6
                  c.nop
                  mulhsu       a4, a0, t0
                  sra          s3, s1, s1
                  xor          s8, a7, a2
                  srai         t4, a7, 16
                  ori          a7, zero, 288
                  sltiu        s11, s10, 943
                  srli         s4, t4, 15
                  c.li         s7, 24
                  divu         a3, sp, s8
                  csrrci       a0, 0x340, 20
                  slt          gp, t1, s5
                  c.nop
                  sltu         s9, zero, s11
                  c.lui        a2, 18
                  mulh         t0, s2, s1
                  mul          s8, s10, s6
                  c.slli       t4, 1
                  csrrs        t1, 0x340, s7
                  ori          s3, ra, -1002
                  csrrw        s3, 0x340, t0
                  mulhsu       t4, t1, t6
                  csrrw        a4, 0x340, t0
                  and          t3, s1, t5
                  slt          t1, s10, s0
                  c.andi       a0, 5
                  csrrsi       ra, 0x340, 16
                  sltiu        s6, a6, -614
                  csrrs        t5, 0x340, s1
                  c.sub        a0, a0
                  sltu         s3, sp, s5
                  c.srli       s1, 20
                  c.nop
                  ori          s1, a2, 146
                  c.sub        a1, a0
                  csrrc        t2, 0x340, zero
                  or           s1, zero, s11
                  c.and        s0, a5
                  sll          ra, sp, t6
                  slt          s6, s0, a1
                  slti         s1, t6, 945
                  lui          s6, 831588
                  srli         s9, a5, 13
                  ori          t3, s7, 1323
                  c.nop
                  mulhsu       s4, s2, s2
                  sltiu        t4, s8, 310
                  auipc        a7, 461931
                  c.slli       a3, 16
                  c.li         s7, -1
                  add          zero, a3, a6
                  sltiu        a2, s10, 341
                  addi         s0, t0, -926
                  sub          t0, s9, t5
                  csrrc        t0, 0x340, s10
                  nop
                  sltiu        s6, sp, 440
                  c.or         a2, a3
                  mul          t2, a2, a4
                  xori         s4, a2, -1937
                  c.xor        a4, s0
                  c.andi       a3, 20
                  auipc        s8, 521631
                  c.xor        a4, s0
                  c.li         tp, 3
                  sub          tp, tp, s8
                  mul          a1, ra, a5
                  div          s1, a1, t4
                  rem          t1, s2, s11
                  csrrci       s2, 0x340, 0
                  srli         t2, s0, 4
                  sra          s6, a1, ra
                  srl          a1, s9, sp
                  rem          a7, a5, t2
                  sltiu        t0, tp, 727
                  mulhu        t3, a7, s5
                  div          s3, s2, gp
                  sll          t3, t2, t2
                  c.nop
                  c.addi       s7, -1
                  mulhu        a3, s9, a7
                  csrrwi       a4, 0x340, 26
                  slt          a6, a6, a7
                  sltiu        a2, a1, 982
                  mulh         s8, a5, s8
                  c.xor        s0, a3
                  c.andi       a4, 14
                  csrrci       t3, 0x340, 0
                  c.andi       s1, -1
                  sub          s0, a1, a2
                  srl          s4, t4, t0
                  c.andi       a0, 23
                  srl          s0, t5, s6
                  andi         s7, t2, 157
                  csrrw        a6, 0x340, t1
                  c.slli       t4, 28
                  ori          a7, gp, 787
                  sra          a7, a2, s9
                  xori         t2, s5, -1044
                  c.srli       a1, 30
                  remu         s3, t0, s10
                  csrrsi       t5, 0x340, 0
                  c.mv         t5, t5
                  and          ra, s9, t1
                  sll          t6, s0, s5
                  mulh         t5, s10, s0
                  rem          a6, s11, gp
                  andi         s4, s8, -855
                  mulhsu       s8, s9, s2
                  csrrsi       s11, 0x340, 26
                  c.slli       t5, 21
                  andi         t6, t4, 29
                  csrrwi       a0, 0x340, 6
                  c.nop
                  div          s10, s1, s11
                  srai         s6, a7, 29
                  c.srli       a1, 26
                  lui          s10, 224764
                  srli         t3, s3, 19
                  div          s4, s6, a7
                  div          s8, s7, t3
                  c.srli       a4, 26
                  csrrc        s9, 0x340, zero
                  div          s8, s5, a7
                  c.srli       a0, 14
                  sltiu        s10, t1, 1706
                  mul          s8, s11, a1
                  c.add        a4, s1
                  nop
                  slli         s11, s10, 23
                  mulhu        gp, s7, a7
                  c.and        a1, a3
                  add          t2, ra, t4
                  mulhu        a7, a1, sp
                  srli         t1, gp, 5
                  csrrw        t4, 0x340, s2
                  mulhu        s0, a5, t0
                  csrrwi       t2, 0x340, 24
                  xor          t1, s6, s4
                  c.sub        a4, s0
                  sub          s0, t1, s8
                  andi         s8, sp, -1779
                  slti         s3, a6, -1262
                  c.srai       a3, 2
                  mulhu        s6, sp, s6
                  xori         t3, s7, 110
                  auipc        a7, 680894
                  sltu         a1, t4, s2
                  div          a3, a5, t2
                  slt          t2, a5, t2
                  c.addi       a3, -1
                  mulhsu       s3, s2, a1
                  lui          t5, 749016
                  sltu         t3, s6, s9
                  c.or         s0, a3
                  nop
                  c.or         s1, a2
                  div          t3, tp, s11
                  c.or         a1, s1
                  c.nop
                  and          s0, s10, t0
                  csrrci       a6, 0x340, 25
                  andi         s1, s7, 319
                  csrrs        a6, 0x340, t1
                  c.lui        a3, 14
                  addi         a0, s3, -2026
                  sll          gp, ra, t5
                  csrrs        a6, 0x340, zero
                  or           a6, t1, s2
                  addi         t1, a4, -242
                  sub          zero, a7, s3
                  mulhu        a0, tp, a3
                  slli         s6, s6, 4
                  sra          a6, tp, s3
                  or           t4, s3, t3
                  srli         tp, t5, 0
                  remu         tp, s11, s11
                  srl          a1, tp, s4
                  c.nop
                  and          s7, a5, t0
                  slli         s10, zero, 24
                  slli         s7, ra, 20
                  xor          a4, s6, s1
                  c.srli       a1, 20
                  or           t4, s8, a4
                  mulhsu       s1, ra, a6
                  c.add        t4, a6
                  srli         t4, a0, 2
                  div          s2, a6, a2
                  csrrci       s4, 0x340, 0
                  c.slli       a3, 15
                  c.nop
                  addi         s8, ra, 735
                  mulhsu       a4, t1, s2
                  remu         a4, s7, a4
                  sltiu        s3, s10, -175
                  ori          tp, a0, -1187
                  xori         s6, a2, 1453
                  csrrsi       s2, 0x340, 0
                  csrrw        s11, 0x340, sp
                  mul          a3, a7, a4
                  c.add        a6, s10
                  csrrs        a4, 0x340, t5
                  sra          gp, s2, t2
                  lui          tp, 562140
                  sll          s11, t1, s4
                  mulh         a7, sp, s7
                  c.srai       a4, 23
                  c.addi       a4, 3
                  add          t0, sp, gp
                  c.add        s11, s7
                  csrrs        s10, 0x340, a1
                  mulhu        a4, s0, s2
                  csrrsi       t1, 0x340, 6
                  slti         t1, a2, 1508
                  mulhsu       gp, t5, s4
                  or           s6, sp, s1
                  c.srai       s0, 15
                  slti         a3, t1, 1003
                  srl          t3, t0, s2
                  slti         a3, sp, 1226
                  xor          t2, s1, a1
                  c.li         s10, -1
                  c.mv         s2, a7
                  mulhsu       s10, s7, s8
                  lui          a4, 915141
                  ori          s9, s8, 1846
                  c.srai       a4, 7
                  nop
                  c.srli       s0, 30
                  c.srli       s0, 7
                  nop
                  nop
                  srli         a0, s11, 13
                  sltiu        s1, zero, 181
                  xori         s6, s10, 653
                  slt          s4, s11, a5
                  ori          a2, a6, 1716
                  remu         s0, t6, ra
                  andi         t2, a1, 1406
                  c.slli       a7, 30
                  mulhsu       tp, t1, t6
                  or           a1, a0, sp
                  csrrwi       t4, 0x340, 28
                  c.li         a3, 26
                  add          tp, zero, s2
                  mulhu        a6, s0, t0
                  c.or         a4, s0
                  remu         t4, a5, s5
                  sra          a3, a6, s10
                  c.addi       s10, 8
                  c.slli       s10, 16
                  and          t3, a6, zero
                  c.slli       t6, 31
                  mulhsu       s7, s4, a4
                  c.and        a2, a1
                  c.sub        a3, s0
                  auipc        t5, 237806
                  csrrci       s11, 0x340, 0
                  nop
                  sra          t0, s7, s3
                  c.srli       a1, 12
                  c.sub        a0, a0
                  or           s2, t6, s3
                  sll          s4, a0, a1
                  addi         t1, s9, -5
                  csrrci       t1, 0x340, 8
                  srai         a4, t6, 8
                  csrrs        ra, 0x340, t2
                  c.mv         s8, t2
                  c.slli       a3, 7
                  c.addi       s10, -1
                  srl          s10, s8, a4
                  sll          s11, a3, t6
                  mul          s2, s4, s8
                  csrrci       a4, 0x340, 0
                  csrrsi       a4, 0x340, 2
                  remu         a6, t6, s4
                  srai         s1, a3, 9
                  csrrwi       s7, 0x340, 8
                  divu         a0, a5, a4
                  csrrsi       s7, 0x340, 0
                  nop
                  mulhu        s10, s10, tp
                  nop
                  ori          a0, ra, -1560
                  sll          a6, gp, s6
                  c.sub        a3, s1
                  c.addi       t5, -1
                  divu         s1, t1, t4
                  lui          a6, 150549
                  slli         a6, s4, 10
                  csrrc        a0, 0x340, zero
                  andi         a1, s0, -412
                  c.srai       a0, 23
                  sltu         s3, t3, s4
                  sra          s7, a0, t5
                  csrrwi       zero, 0x340, 12
                  or           t3, t1, t3
                  c.srli       a4, 18
                  sltu         s2, ra, t2
                  add          t0, s6, zero
                  sra          a2, t0, a3
                  lui          s2, 750968
                  remu         s11, s8, t0
                  mulhu        a0, s2, s7
                  slli         t2, tp, 10
                  csrrci       t5, 0x340, 8
                  div          t0, s2, s2
                  add          a2, t3, zero
                  sltiu        s1, a1, -1384
                  sll          a4, a7, s6
                  sltu         gp, s10, s1
                  auipc        t2, 286808
                  nop
                  sltu         tp, s10, tp
                  xori         s0, t0, -924
                  remu         a1, t6, a2
                  add          a3, s8, sp
                  c.lui        s10, 25
                  slt          t5, sp, t1
                  mulhu        a2, t3, s9
                  mulhsu       s11, t6, s11
                  c.and        a0, a0
                  csrrsi       zero, 0x340, 31
                  ori          s7, t3, 1655
                  mulhsu       a2, zero, s4
                  add          s2, a6, t0
                  csrrc        s9, 0x340, zero
                  xor          s9, s5, a7
                  csrrci       t5, 0x340, 0
                  csrrs        a0, 0x340, zero
                  srli         zero, a5, 28
                  mulh         s7, ra, t6
                  slt          s7, gp, s0
                  mul          t4, t0, a2
                  c.li         s1, -1
                  add          zero, s7, s1
                  slti         t6, a1, -1588
                  csrrsi       s7, 0x340, 0
                  sra          ra, a1, s11
                  c.nop
                  sll          s1, a2, s10
                  srl          t4, s2, zero
                  c.or         a2, a1
                  andi         s2, zero, -1949
                  c.addi       t4, -1
                  ori          a0, a6, 1868
                  c.addi       a7, -1
                  or           s3, s7, s0
                  csrrs        gp, 0x340, zero
                  divu         s7, a2, s5
                  c.srli       a3, 14
                  remu         a1, a3, a4
                  auipc        a1, 534285
                  csrrc        t3, 0x340, s7
                  c.li         t2, 29
                  c.addi       gp, 9
                  sltu         a6, tp, t6
                  ori          s11, s8, 1403
                  sub          t4, s3, t4
                  c.lui        a1, 30
                  c.nop
                  xori         t6, t2, -1053
                  sll          s8, a3, s8
                  rem          s4, t6, t1
                  c.xor        a2, a0
                  add          s2, tp, s11
                  nop
                  c.srai       a1, 16
                  sll          s11, s0, a3
                  csrrwi       s10, 0x340, 11
                  and          s8, t3, t5
                  ori          a0, s0, 1206
                  c.li         s2, 28
                  c.xor        a2, a0
                  and          t3, a0, a3
                  c.or         a2, a1
                  addi         s11, s9, 1918
                  c.or         a4, a3
                  c.nop
                  slli         t6, tp, 30
                  c.srli       s0, 24
                  csrrci       s9, 0x340, 0
                  c.slli       s11, 10
                  add          ra, sp, t5
                  slli         t1, s0, 8
                  c.mv         s7, a3
                  mulhsu       a0, zero, t3
                  div          a6, t3, s4
                  slt          s4, s11, s5
                  lui          t1, 1001970
                  c.add        a6, s11
                  csrrsi       t3, 0x340, 19
                  csrrw        s0, 0x340, s0
                  mulhu        t5, s11, s9
                  sra          s2, sp, ra
                  andi         tp, s7, -59
                  c.mv         s10, s2
                  xor          s11, gp, t4
                  addi         t4, t4, -1448
                  sltiu        t4, sp, -1763
                  c.lui        a7, 18
                  csrrw        t6, 0x340, a7
                  xori         tp, s5, 294
                  addi         a2, a6, 807
                  sub          a3, s7, a6
                  sltiu        s6, s3, -422
                  mulhsu       t5, t2, zero
                  c.add        s7, a3
                  c.mv         s11, t3
                  csrrwi       s9, 0x340, 13
                  c.slli       s4, 10
                  mul          s0, s10, gp
                  mulhsu       ra, t5, t2
                  and          a1, t1, a0
                  c.li         a4, -1
                  csrrw        s2, 0x340, ra
                  c.srai       a3, 9
                  sub          t2, ra, sp
                  andi         s0, t0, 980
                  c.mv         s7, s2
                  mulh         t4, s4, a0
                  srl          t5, a4, s1
                  addi         t4, t3, -1493
                  c.slli       t5, 8
                  add          a4, t3, a4
                  mulhu        tp, s9, t3
                  ori          t0, t5, 1646
                  srai         t2, a0, 21
                  auipc        s2, 274341
                  c.srai       s0, 26
                  addi         t0, t4, 166
                  c.add        t5, a1
                  slt          t3, tp, a3
                  sra          a2, sp, s4
                  c.li         s8, 7
                  div          t1, a4, s1
                  addi         zero, t3, -1437
                  mul          s2, s0, a6
                  mulh         t1, s6, gp
                  or           t4, s11, s4
                  c.sub        s0, s0
                  xori         t4, s7, -472
                  csrrsi       t2, 0x340, 3
                  sltu         s0, a2, a3
                  csrrs        t3, 0x340, zero
                  sub          s4, gp, s1
                  add          t5, a4, t2
                  srl          gp, s7, s5
                  csrrc        tp, 0x340, zero
                  c.add        a2, gp
                  mulhsu       a6, s5, zero
                  add          a4, t6, s10
                  csrrwi       t2, 0x340, 23
                  c.add        s2, a3
                  sltiu        t3, s8, 689
                  divu         s0, s7, s5
                  slt          a7, a1, s8
                  add          t6, s3, t2
                  c.andi       a2, 2
                  c.and        a1, a4
                  rem          zero, t2, s3
                  lui          ra, 361728
                  c.srli       a1, 27
                  slt          a1, t0, s0
                  xori         t4, a1, -1435
                  sll          t0, zero, a3
                  csrrwi       s3, 0x340, 21
                  c.srai       a3, 11
                  andi         s0, a6, -2004
                  slli         tp, sp, 24
                  c.lui        a4, 31
                  nop
                  c.addi       gp, -1
                  c.add        t2, t3
                  c.sub        a0, s0
                  divu         s7, a6, a2
                  div          s8, a3, s9
                  slti         s7, s6, 165
                  mulhu        a0, a4, a6
                  c.xor        a1, s1
                  csrrw        s9, 0x340, t5
                  c.xor        a4, a5
                  c.li         gp, -1
                  srl          t4, s4, s3
                  c.srli       s0, 30
                  c.srli       s1, 18
                  c.mv         a3, t1
                  sub          a6, tp, sp
                  div          s11, s10, a0
                  c.andi       a1, -1
                  c.slli       a1, 25
                  c.slli       t2, 9
                  sra          s0, a6, sp
                  csrrw        t5, 0x340, s0
                  c.xor        a0, a0
                  remu         s3, s11, s1
                  add          a1, ra, s10
                  slli         a1, a3, 30
                  xori         s7, t6, 1257
                  c.nop
                  csrrci       t5, 0x340, 27
                  srai         s8, t4, 4
                  c.slli       s6, 25
                  mulh         t2, a2, s9
                  sltu         s0, a4, a7
                  csrrsi       t4, 0x340, 18
                  c.srai       a3, 17
                  sra          tp, t3, s5
                  c.andi       s0, -1
                  sltu         a3, a0, s5
                  remu         s10, a1, s3
                  c.addi       s6, -1
                  c.addi       a3, 18
                  c.li         s10, -1
                  csrrsi       t6, 0x340, 4
                  srli         a3, a7, 28
                  rem          a2, a2, s5
                  mul          t1, a6, gp
                  or           s6, t6, s6
                  remu         a0, a2, t3
                  addi         tp, s5, -1383
                  mulhu        ra, t1, t2
                  csrrc        gp, 0x340, zero
                  sltu         s11, zero, t1
                  srl          t2, s10, t3
                  c.or         a3, a5
                  andi         t6, s9, 1363
                  c.or         a2, a1
                  div          t1, tp, t2
                  auipc        a4, 964721
                  mulhu        a7, a3, tp
                  csrrwi       t5, 0x340, 13
                  c.and        a3, a0
                  mulhu        tp, a6, s7
                  csrrw        a1, 0x340, s0
                  csrrc        s9, 0x340, zero
                  c.and        a2, a0
                  slti         t2, t6, -1112
                  csrrsi       ra, 0x340, 0
                  rem          s6, s1, t5
                  mulhu        s11, t3, a4
                  c.slli       s9, 31
                  csrrw        t3, 0x340, s9
                  sltu         t6, s0, a7
                  auipc        s3, 220566
                  mulh         s11, s8, a0
                  c.xor        s1, s1
                  divu         s0, t1, a5
                  c.and        s1, s0
                  srl          t4, t4, s9
                  rem          s3, s1, tp
                  mul          s9, s9, t6
                  or           t6, s0, a4
                  andi         a4, t1, 1914
                  c.and        a2, a1
                  slt          s11, a4, s2
                  div          s10, t3, s3
                  lui          t6, 166236
                  srl          gp, sp, s4
                  or           s7, s4, s3
                  sltiu        a3, a0, -1553
                  slt          t5, s2, t6
                  c.or         a1, a4
                  divu         s1, s1, t6
                  c.mv         s4, a3
                  c.lui        s10, 13
                  csrrci       a3, 0x340, 16
                  csrrw        t1, 0x340, t6
                  c.add        a3, t3
                  c.xor        a1, a5
                  mulhu        s6, ra, s10
                  srl          a1, s5, t1
                  and          a0, a5, s10
                  rem          a4, s6, a2
                  c.srli       a2, 13
                  nop
                  c.or         a3, a3
                  nop
                  sra          s1, t2, a5
                  csrrc        a1, 0x340, zero
                  ori          a2, zero, -476
                  xori         t4, a0, -1765
                  mulhu        t5, t0, t5
                  divu         a1, tp, s0
                  c.nop
                  c.mv         s8, a2
                  sll          s8, ra, t6
                  c.and        a1, a2
                  mulhsu       a0, sp, a7
                  or           a7, gp, s10
                  srai         s2, gp, 22
                  csrrwi       t6, 0x340, 26
                  xori         s6, s11, 1831
                  c.nop
                  ori          t6, a6, -690
                  andi         t0, t2, 490
                  c.add        a7, s0
                  ori          a6, s2, -818
                  c.mv         a6, s7
                  and          a4, a3, a1
                  mul          t6, a0, t4
                  sra          a7, s10, s7
                  and          t1, tp, a1
                  mulhu        t6, s9, t3
                  csrrwi       s4, 0x340, 15
                  nop
                  slli         t1, s0, 1
                  slli         s10, tp, 1
                  c.srli       a4, 24
                  sub          a3, s9, s8
                  nop
                  c.slli       s8, 20
                  c.mv         a2, a3
                  andi         t2, zero, 1495
                  sub          tp, ra, ra
                  c.mv         s8, s1
                  lui          s0, 173414
                  csrrw        s8, 0x340, s5
                  csrrci       a3, 0x340, 19
                  c.sub        a1, a4
                  c.andi       s0, 7
                  c.lui        s6, 30
                  slti         s10, a3, -292
                  xori         t3, t1, 385
                  c.li         gp, -1
                  c.srli       a0, 11
                  lui          a2, 647731
                  sub          s2, ra, t2
                  lui          t3, 429695
                  csrrc        s7, 0x340, zero
                  srai         a1, a7, 2
                  c.nop
                  sub          s10, zero, s9
                  slti         s9, t6, -1219
                  c.andi       a2, 12
                  sub          s0, t6, a3
                  c.and        s0, s1
                  andi         s10, s10, -349
                  slli         s4, s11, 0
                  c.or         a0, a1
                  c.add        t3, a0
                  addi         s4, s5, -586
                  ori          gp, a5, -1538
                  rem          s0, a2, s10
                  c.lui        t2, 2
                  c.andi       a1, -1
                  c.srli       a4, 9
                  csrrci       zero, 0x340, 4
                  mulh         ra, t2, a3
                  mulhsu       t4, a6, t1
                  csrrc        s10, 0x340, zero
                  andi         s1, t5, 2022
                  c.addi       tp, 7
                  srl          s3, zero, a7
                  srli         gp, a1, 9
                  slti         s0, zero, 212
                  add          s0, t5, t1
                  mul          a4, a7, s11
                  c.andi       s1, 7
                  c.add        a2, a5
                  mulhu        gp, s1, t0
                  c.andi       s0, 15
                  c.lui        a4, 27
                  c.and        s1, s0
                  c.nop
                  mulhsu       a0, s2, a5
                  c.add        s9, t4
                  csrrc        t4, 0x340, zero
                  sltu         t1, a3, a3
                  rem          s4, ra, tp
                  c.sub        s1, a0
                  srl          a7, t1, a4
                  srli         t3, a1, 31
                  divu         s3, zero, t3
                  c.srli       a2, 8
                  rem          a1, s7, s10
                  c.or         a0, a5
                  csrrsi       s11, 0x340, 0
                  c.nop
                  c.srli       s1, 22
                  srli         tp, t6, 15
                  div          tp, s11, a2
                  sltiu        a2, s10, -1151
                  addi         tp, s1, -890
                  c.slli       a3, 5
                  slli         s1, t5, 31
                  sltu         a7, s4, t2
                  c.srli       s1, 5
                  c.xor        a1, a1
                  srl          a0, s4, s9
                  auipc        a7, 821741
                  c.and        s0, s1
                  sll          a1, s10, sp
                  c.li         t5, 27
                  slli         s7, a4, 16
                  slli         s6, a0, 24
                  c.li         t3, -1
                  addi         a1, zero, 935
                  and          a3, a5, a5
                  slti         s4, s2, 1913
                  auipc        a1, 828284
                  c.srai       a2, 18
                  and          a4, t0, t2
                  sltiu        t5, s8, -413
                  c.add        t3, t2
                  c.sub        a4, a4
                  sltu         gp, s11, s11
                  c.andi       a3, 16
                  addi         s11, a0, -821
                  srli         a1, t6, 9
                  c.xor        a1, a2
                  srl          a1, s3, zero
                  xori         s10, t5, 1187
                  slti         s7, s10, -1457
                  div          a3, s4, s6
                  mul          tp, s4, s6
                  slli         zero, sp, 26
                  csrrs        a4, 0x340, zero
                  sltiu        s9, t5, -748
                  c.andi       a4, -1
                  csrrsi       t2, 0x340, 0
                  sltiu        gp, t6, 1253
                  slli         t0, s4, 9
                  csrrw        s9, 0x340, a7
                  srai         s8, t5, 6
                  srli         a6, a0, 10
                  csrrwi       t5, 0x340, 15
                  addi         s10, s1, 2018
                  c.srai       a0, 2
                  c.li         a1, -1
                  c.srli       a1, 12
                  sll          t5, a3, a1
                  addi         s7, a2, 397
                  csrrw        a2, 0x340, s1
                  divu         s11, a5, a1
                  csrrw        s1, 0x340, s10
                  c.srli       s1, 29
                  mulh         a7, sp, t5
                  c.lui        t3, 17
                  lui          a3, 932948
                  c.lui        a1, 15
                  c.srli       a2, 30
                  or           a7, s2, a2
                  csrrci       a7, 0x340, 1
                  sltu         s3, tp, a0
                  c.lui        a6, 1
                  c.sub        s1, s0
                  csrrw        a3, 0x340, gp
                  c.add        a2, a2
                  c.lui        t5, 5
                  c.andi       s1, -1
                  srai         s6, s4, 1
                  csrrc        a6, 0x340, s1
                  xor          ra, a4, s7
                  c.slli       s6, 30
                  csrrs        t0, 0x340, zero
                  csrrw        a7, 0x340, s7
                  csrrs        t6, 0x340, zero
                  csrrwi       t6, 0x340, 19
                  mul          a0, t3, s5
                  mul          s2, s4, t4
                  andi         tp, s4, -1427
                  c.andi       a2, 23
                  auipc        t1, 266417
                  sra          zero, gp, s11
                  sltiu        s2, a1, 1228
                  mul          s9, s1, s5
                  andi         t1, s10, 869
                  c.and        a1, s0
                  sltu         s7, a4, t1
                  remu         t2, s5, s7
                  c.xor        a3, s1
                  csrrsi       t4, 0x340, 0
                  c.lui        t6, 11
                  c.xor        a1, a4
                  sltiu        zero, s7, 351
                  c.srai       s0, 13
                  andi         s2, gp, -1431
                  remu         s6, zero, s4
                  c.slli       a7, 23
                  c.srli       s0, 21
                  c.add        a4, a4
                  rem          a2, t0, a7
                  add          tp, s3, s6
                  c.li         s4, 29
                  c.srai       a2, 18
                  remu         t0, zero, a6
                  slt          t1, a3, t4
                  c.nop
                  c.addi       s11, -1
                  slli         t3, s3, 17
                  and          gp, t5, s3
                  csrrci       t3, 0x340, 16
                  c.srai       a4, 31
                  csrrsi       s8, 0x340, 0
                  c.sub        s1, a5
                  c.add        a6, tp
                  c.nop
                  andi         t4, s10, 1928
                  csrrs        t0, 0x340, zero
                  auipc        gp, 690103
                  lui          ra, 1046854
                  sll          a0, a2, s2
                  csrrw        a7, 0x340, t6
                  mul          t5, s2, a4
                  sra          a0, a0, s4
                  c.nop
                  add          a6, s4, t5
                  srl          s7, s1, a6
                  c.srai       a2, 12
                  sub          s9, t6, a6
                  c.lui        t5, 22
                  c.and        s1, s1
                  csrrs        s9, 0x340, zero
                  andi         s8, s4, -1880
                  c.sub        s0, a0
                  auipc        t3, 273803
                  csrrc        a7, 0x340, zero
                  nop
                  nop
                  csrrci       ra, 0x340, 0
                  c.add        a1, s1
                  c.lui        t6, 22
                  c.xor        a2, a2
                  add          s6, sp, s10
                  slli         a2, a4, 3
                  csrrc        t5, 0x340, s3
                  c.li         s2, 28
                  mulhsu       t1, s5, a0
                  mulh         t4, a1, t2
                  divu         s6, t2, a5
                  xori         t3, a7, 1492
                  c.li         t0, -1
                  c.add        t6, tp
                  add          t5, tp, a7
                  c.sub        a3, a1
                  c.slli       a7, 12
                  add          ra, t1, s1
                  c.lui        t2, 11
                  c.srai       a0, 13
                  slli         s8, s0, 21
                  andi         gp, a6, 935
                  remu         s11, s4, a6
                  c.andi       a3, 1
                  slti         s10, a6, -1276
                  add          t5, a3, s7
                  c.mv         a7, a2
                  c.srai       s1, 7
                  c.or         s1, a4
                  andi         t6, a0, -656
                  add          s10, s6, s10
                  nop
                  and          t5, tp, a2
                  or           s3, a5, zero
                  c.sub        a3, a1
                  divu         zero, a1, a6
                  srli         a2, a0, 31
                  c.srli       a3, 6
                  slli         a7, s4, 9
                  c.xor        a4, a2
                  csrrci       tp, 0x340, 7
                  slli         a3, gp, 7
                  c.andi       s1, -1
                  or           gp, a1, t4
                  csrrs        ra, 0x340, t5
                  mulhu        s6, a3, s6
                  xori         t2, t4, -1173
                  slli         s2, a5, 13
                  slt          t0, ra, sp
                  c.andi       a4, 3
                  add          s9, a4, a6
                  srl          t4, s2, a5
                  slt          s7, sp, a0
                  c.lui        a3, 23
                  c.andi       a4, 17
                  c.srai       s1, 25
                  c.srli       a4, 23
                  nop
                  sltu         a2, tp, a5
                  ori          gp, s10, 1346
                  c.lui        a2, 9
                  c.add        a4, s11
                  c.or         a1, a5
                  sra          a6, s4, sp
                  mul          a2, t3, a1
                  ori          s6, ra, 496
                  c.mv         s1, t6
                  addi         t5, tp, 225
                  csrrs        s7, 0x340, s8
                  xori         t3, a5, -670
                  ori          t5, a0, -189
                  xor          t1, s6, a0
                  c.lui        s0, 29
                  csrrs        s1, 0x340, zero
                  divu         s9, t2, s3
                  lui          t5, 1024149
                  csrrwi       a6, 0x340, 11
                  sub          a6, s2, a5
                  c.mv         s0, t5
                  c.addi       gp, -1
                  slli         s9, tp, 22
                  sra          a7, s10, s1
                  mulhsu       a6, a1, a4
                  mul          s9, ra, t2
                  c.addi       a4, -1
                  sltiu        t2, s5, 1858
                  mulhsu       ra, s6, a7
                  ori          t5, s8, -1747
                  csrrsi       ra, 0x340, 26
                  mulhu        gp, s7, a4
                  mulhsu       t3, gp, s4
                  addi         t6, a3, -1824
                  c.mv         t3, s2
                  remu         s2, s7, t2
                  sll          zero, a5, a3
                  c.slli       t6, 19
                  add          s1, s3, s1
                  sltu         a4, gp, a6
                  csrrwi       t5, 0x340, 10
                  c.sub        s0, a3
                  auipc        a4, 411337
                  rem          t6, s4, s11
                  slti         zero, tp, -1169
                  and          a6, a2, a5
                  auipc        a6, 768035
                  csrrci       a7, 0x340, 0
                  slli         a2, s1, 1
                  sub          a6, zero, s2
                  c.sub        a3, a4
                  slti         s8, s3, -513
                  andi         t6, t6, 322
                  c.add        t4, a0
                  xor          t4, t0, a0
                  c.add        a2, a3
                  divu         zero, s0, a7
                  div          s3, t5, s10
                  slli         a4, t1, 6
                  div          t4, s4, a7
                  slti         s11, a3, 1403
                  c.li         t4, 13
                  mul          t3, a1, sp
                  c.srli       s0, 10
                  mulh         a4, t0, s11
                  mulhsu       s0, a0, t1
                  slli         s2, a2, 29
                  sltu         t4, a4, tp
                  mulh         s0, t3, a7
                  c.sub        s1, a2
                  csrrwi       a6, 0x340, 4
                  csrrs        a0, 0x340, zero
                  or           a4, s11, s4
                  sra          a6, t3, t2
                  div          zero, a6, t5
                  csrrw        s4, 0x340, s11
                  slt          t5, a1, s8
                  mulhu        ra, s9, s5
                  c.xor        a4, a2
                  slti         t2, t0, 560
                  mulh         s2, a4, a1
                  csrrc        a4, 0x340, zero
                  srli         t1, s7, 20
                  c.li         s9, 6
                  sltu         s9, s10, a2
                  csrrci       t2, 0x340, 10
                  srai         t4, s6, 19
                  remu         a2, s7, s0
                  sra          a2, t2, s10
                  addi         s11, gp, -1141
                  ori          a1, a5, 1902
                  mulhu        zero, s4, zero
                  csrrw        a2, 0x340, t1
                  sub          s9, s5, s0
                  c.and        a2, a1
                  c.mv         a3, a1
                  srai         t6, sp, 14
                  csrrc        a7, 0x340, a2
                  c.mv         gp, s8
                  sra          t5, a7, a0
                  mul          t4, a7, s9
                  sltiu        t6, t1, 227
                  slt          a6, s2, s2
                  mulhsu       s8, a6, t0
                  c.xor        a1, a0
                  c.mv         s6, a6
                  csrrci       t3, 0x340, 13
                  csrrwi       s4, 0x340, 0
                  csrrwi       s3, 0x340, 23
                  c.add        a3, t4
                  c.addi       a6, 26
                  c.sub        a1, a0
                  rem          s0, gp, s0
                  auipc        zero, 737347
                  sltiu        t2, t6, -1987
                  xor          ra, s7, s5
                  xori         a3, s0, 313
                  c.li         s8, 30
                  c.lui        s7, 10
                  srai         s0, a1, 6
                  slli         s11, a0, 14
                  sltiu        t6, a0, 1646
                  mulhu        a3, s0, s5
                  csrrw        a7, 0x340, s8
                  csrrc        t1, 0x340, zero
                  mulh         s1, s2, a4
                  slt          s10, t1, s2
                  c.nop
                  c.lui        t5, 15
                  c.nop
                  c.li         s8, 1
                  c.li         t5, 11
                  srai         s9, gp, 26
                  sltu         a4, s3, t3
                  sra          tp, s5, s6
                  c.addi       ra, -1
                  sltu         a3, s7, a3
                  auipc        s2, 598109
                  c.li         s9, 2
                  mulh         a7, a3, t3
                  or           a1, sp, gp
                  csrrsi       a1, 0x340, 28
                  c.xor        a0, a4
                  xor          a1, s6, t5
                  csrrw        t4, 0x340, ra
                  c.sub        a3, a5
                  c.sub        a1, s1
                  csrrw        t3, 0x340, t5
                  c.xor        a3, a3
                  sll          gp, s4, a4
                  sra          s10, s8, a0
                  c.mv         a7, s1
                  addi         t0, s4, -138
                  c.li         a3, -1
                  sltu         s10, a3, a0
                  c.add        s10, a7
                  srai         s7, t3, 24
                  slt          t6, t5, t1
                  c.srai       a1, 18
                  sltu         s9, t4, sp
                  c.nop
                  c.sub        a0, a1
                  c.sub        a3, a1
                  slt          a0, s0, zero
                  c.srli       a2, 1
                  nop
                  c.li         t3, -1
                  c.sub        a2, a0
                  csrrci       s11, 0x340, 10
                  c.nop
                  srai         s9, s9, 20
                  sub          s4, s9, s8
                  mulhsu       zero, s2, s9
                  csrrsi       s8, 0x340, 1
                  addi         s6, t4, -945
                  slli         t4, a6, 16
                  c.or         s1, a5
                  sltiu        s11, t2, -306
                  addi         a0, t0, 479
                  rem          s6, a5, t4
                  and          s2, s4, a7
                  nop
                  sub          a7, s4, t2
                  and          a6, s11, s5
                  lui          tp, 152690
                  c.addi       a0, -1
                  c.mv         t2, s4
                  slli         t4, a7, 27
                  c.sub        a0, a2
                  c.addi       s2, -1
                  div          a3, s0, s8
                  mul          a3, s2, s1
                  c.xor        a3, a4
                  auipc        s1, 702005
                  csrrc        t4, 0x340, s1
                  sltu         s2, t2, a2
                  sltu         s6, a6, s1
                  sll          t3, s9, gp
                  andi         a2, s10, 1109
                  c.slli       s2, 28
                  c.nop
                  lui          t1, 137182
                  c.li         s2, -1
                  c.addi       t0, -1
                  and          ra, tp, gp
                  slti         s0, s5, -1259
                  c.srai       a2, 12
                  csrrwi       a6, 0x340, 18
                  srai         t4, a0, 25
                  csrrc        s3, 0x340, zero
                  mulhsu       s8, t5, t1
                  srai         t6, s7, 17
                  slti         t3, s7, 1611
                  c.or         a2, s1
                  csrrw        tp, 0x340, a2
                  mulh         a4, tp, a1
                  c.slli       a6, 20
                  slti         s6, a4, 1043
                  mulhu        s11, s4, s0
                  div          t1, s3, a7
                  csrrci       tp, 0x340, 16
                  sub          a4, t3, a7
                  slli         a6, t6, 12
                  addi         s3, a6, -65
                  and          t1, s7, a4
                  srl          a1, t1, t3
                  divu         s6, s11, a2
                  mulhsu       a7, t5, sp
                  c.slli       s11, 29
                  remu         t0, t1, a3
                  c.add        s0, sp
                  c.nop
                  slt          s2, a6, s11
                  c.slli       a1, 1
                  mul          a3, s8, s10
                  c.srli       s1, 21
                  csrrsi       a0, 0x340, 6
                  ori          t1, zero, -955
                  mulh         s1, t4, t4
                  mulhsu       tp, s3, s4
                  srai         s6, t5, 0
                  mulhsu       a6, s1, a3
                  slli         a2, s11, 14
                  c.nop
                  c.mv         s8, t3
                  addi         a2, a3, 1497
                  c.slli       s6, 28
                  csrrsi       a2, 0x340, 0
                  srai         t5, s1, 24
                  auipc        s3, 54156
                  mulh         s2, t3, a6
                  c.lui        a7, 17
                  sub          s7, s0, t4
                  csrrci       t2, 0x340, 0
                  c.addi       s0, 6
                  xori         s10, a2, 985
                  c.or         a0, a1
                  sll          s1, a3, t0
                  or           zero, t2, a7
                  sltiu        s2, t3, -207
                  csrrc        a0, 0x340, a0
                  csrrc        a1, 0x340, a2
                  srl          s3, s1, s7
                  c.nop
                  c.sub        a0, s0
                  addi         s7, s10, -1649
                  rem          s6, s8, s7
                  srl          s9, ra, s1
                  xor          s6, t2, zero
                  and          ra, ra, a1
                  div          a1, s4, t2
                  mulhsu       a2, s6, a3
                  c.slli       s8, 7
                  slti         s0, s9, 1563
                  addi         s1, t5, -271
                  csrrs        a1, 0x340, zero
                  csrrs        s4, 0x340, zero
                  c.lui        a2, 26
                  csrrw        a4, 0x340, a6
                  sltu         ra, s9, s10
                  nop
                  mulh         zero, t3, s2
                  c.sub        s0, a2
                  sub          s3, s8, gp
                  c.li         a0, 25
                  ori          s11, a7, 544
                  xor          t2, tp, s3
                  ori          tp, a1, 1304
                  slti         a4, s3, -1607
                  auipc        s6, 73051
                  and          s7, a4, s8
                  c.andi       a2, -1
                  c.nop
                  c.or         a3, a2
                  andi         ra, s4, -592
                  slli         t1, a1, 27
                  sll          zero, t1, a3
                  c.srli       a0, 16
                  mulh         t5, a2, t4
                  c.lui        t1, 18
                  c.sub        a1, a0
                  xor          s1, s10, zero
                  sltiu        a1, s2, 203
                  lui          s10, 230717
                  csrrwi       s7, 0x340, 19
                  andi         t1, s1, -671
                  srai         s9, a4, 22
                  csrrs        a3, 0x340, zero
                  c.srli       a2, 20
                  c.sub        s1, a5
                  sub          s10, gp, a2
                  mulh         s7, s4, t0
                  xor          t5, a7, a2
                  csrrwi       tp, 0x340, 30
                  andi         t0, s0, 1442
                  divu         s4, t1, s8
                  auipc        a7, 982742
                  c.lui        a6, 30
                  srai         s6, a7, 16
                  andi         t3, s4, -1951
                  c.sub        s0, a1
                  nop
                  c.addi       t6, 7
                  slt          a0, zero, a1
                  csrrc        s8, 0x340, a2
                  div          s7, zero, s10
                  c.li         a4, -1
                  mul          s10, s7, s4
                  mulhu        t2, t0, sp
                  srli         tp, a5, 19
                  csrrci       s11, 0x340, 0
                  srli         s10, a7, 22
                  srli         s6, s9, 27
                  c.xor        a1, s0
                  nop
                  mulhsu       a1, s3, s2
                  c.lui        gp, 6
                  c.sub        a0, a5
                  rem          t6, s8, t0
                  mulhu        a7, t4, a2
                  c.srli       a4, 3
                  sll          s10, a1, s10
                  srl          s6, zero, a7
                  c.slli       t5, 11
                  srl          s6, a2, gp
                  csrrc        t4, 0x340, a3
                  sll          t4, ra, a4
                  divu         zero, s3, s11
                  sub          zero, sp, t0
                  c.mv         a1, sp
                  or           a0, t4, sp
                  ori          s11, s1, 138
                  sltu         a7, s9, s6
                  andi         s8, sp, -1590
                  slti         s4, t0, 1331
                  c.nop
                  c.add        a7, ra
                  or           s7, s8, s10
                  sra          s8, t1, a5
                  csrrc        zero, 0x340, zero
                  div          s2, s6, t0
                  mul          s2, ra, t5
                  sll          s3, a0, s8
                  slt          s8, s0, s0
                  add          a1, a1, t3
                  c.li         s9, 19
                  xori         a3, s4, -617
                  xori         t5, s4, 1432
                  remu         t1, t0, gp
                  c.or         a2, s0
                  srli         zero, a2, 7
                  addi         t2, ra, 720
                  nop
                  sltu         s6, t2, tp
                  c.lui        a3, 15
                  csrrci       t6, 0x340, 27
                  sra          t4, gp, s3
                  c.and        a1, a1
                  c.and        a1, a0
                  andi         s10, s9, -304
                  ori          t3, t6, 1231
                  c.lui        t2, 11
                  c.xor        s1, a4
                  xori         s2, s9, -1691
                  remu         zero, s9, a7
                  csrrc        t5, 0x340, a6
                  c.nop
                  or           zero, a5, s8
                  csrrw        t2, 0x340, t4
                  remu         a2, ra, gp
                  slt          s6, a2, t3
                  mulhsu       s4, ra, tp
                  sltu         a7, s8, a7
                  c.lui        s9, 26
                  sltu         s7, t3, s11
                  div          a2, t6, zero
                  sra          zero, s7, s0
                  srai         s1, tp, 11
                  xori         a1, t6, -995
                  csrrci       s4, 0x340, 26
                  sltu         a3, a1, s5
                  sll          gp, s10, t6
                  c.add        s8, s10
                  c.addi       ra, 25
                  and          s7, t1, s1
                  c.mv         t3, gp
                  srli         a7, a3, 22
                  c.or         a2, a2
                  csrrwi       s0, 0x340, 30
                  ori          a6, a4, -1050
                  slt          s0, a1, a2
                  csrrc        zero, 0x340, zero
                  c.add        a1, s11
                  c.slli       t0, 7
                  or           s4, t2, s10
                  addi         t5, s6, -232
                  c.lui        s7, 18
                  srli         s1, a2, 21
                  c.mv         s9, s3
                  c.mv         a3, s7
                  c.xor        a0, a0
                  xor          a0, a3, a6
                  csrrwi       a1, 0x340, 31
                  c.mv         s10, s11
                  c.slli       s3, 26
                  slt          s1, a7, t1
                  div          t3, a0, s11
                  c.nop
                  mulhsu       s3, s6, t2
                  auipc        t0, 143736
                  and          a4, sp, s11
                  addi         s4, zero, 1193
                  c.andi       s1, -1
                  sll          t3, tp, t1
                  slti         t0, s7, 1693
                  xori         s2, t0, -1365
                  lui          t6, 920776
                  c.mv         s2, t2
                  csrrw        t0, 0x340, a7
                  nop
                  sltu         s9, a0, s10
                  csrrsi       t2, 0x340, 4
                  slt          tp, t0, gp
                  c.andi       a0, -1
                  slli         s3, s1, 6
                  csrrw        s3, 0x340, t2
                  srli         a7, s10, 30
                  srl          a6, s0, a3
                  csrrc        gp, 0x340, t3
                  csrrc        a2, 0x340, zero
                  c.andi       a4, 23
                  nop
                  c.mv         s0, s0
                  remu         s11, a7, zero
                  rem          zero, t5, s7
                  c.xor        a1, a4
                  xor          a0, t0, t5
                  nop
                  lui          t4, 16512
                  auipc        s10, 666597
                  c.slli       a3, 13
                  sll          s1, s9, a5
                  srl          s1, a3, a4
                  and          a1, s3, a5
                  c.xor        a1, a4
                  c.xor        s1, a1
                  csrrw        a3, 0x340, gp
                  c.li         s6, -1
                  c.li         s8, -1
                  slt          s6, t1, t1
                  csrrs        a1, 0x340, a6
                  c.nop
                  andi         s7, t0, -327
                  and          tp, a7, s2
                  nop
                  c.add        s6, t6
                  sltu         s11, ra, a1
                  mul          s6, s10, s9
                  slt          s7, t2, s2
                  sltiu        gp, s3, -1365
                  addi         a0, a6, 1411
                  ori          s7, s9, -94
                  csrrw        ra, 0x340, a0
                  and          s3, t2, s3
                  rem          zero, s11, t4
                  c.nop
                  mul          gp, s5, a5
                  c.srli       a4, 3
                  nop
                  xor          s11, s3, a4
                  c.mv         s0, a2
                  xor          zero, tp, s9
                  c.and        s0, a5
                  slti         a6, t5, 293
                  mulhsu       s10, s0, t5
                  c.mv         gp, t1
                  c.or         a2, a1
                  c.andi       a2, 11
                  c.or         a0, a4
                  slti         s1, a4, 301
                  c.lui        t5, 4
                  sub          s10, s1, s4
                  slt          s3, s4, zero
                  sub          t5, t5, s2
                  srli         a6, t2, 1
                  srai         s8, s1, 1
                  c.or         a0, a3
                  andi         t3, s6, -1131
                  ori          t3, s4, 1637
                  addi         tp, s11, 741
                  rem          t3, a0, t1
                  c.mv         t1, s6
                  srai         s0, a5, 17
                  and          t5, s8, a5
                  lui          s11, 926124
                  or           s8, sp, t2
                  xori         a1, t4, 105
                  mulhsu       a6, a2, s5
                  and          a6, a5, t4
                  divu         t5, t3, tp
                  c.li         t3, -1
                  lui          a1, 778638
                  c.and        a4, a5
                  mulhsu       s4, t3, t1
                  csrrsi       s4, 0x340, 8
                  csrrc        s1, 0x340, s2
                  csrrsi       s9, 0x340, 22
                  srli         gp, a5, 20
                  or           s6, sp, t2
                  ori          a7, s0, 1660
                  c.sub        s1, a2
                  divu         a6, sp, s8
                  andi         a6, a2, 147
                  c.srai       a2, 29
                  c.and        a1, a1
                  c.li         t4, -1
                  sll          s7, gp, s10
                  mulhsu       zero, s6, s11
                  c.nop
                  nop
                  c.xor        a1, a2
                  ori          zero, t3, -1117
                  xori         ra, s1, 1133
                  c.slli       a4, 11
                  srli         gp, a5, 29
                  lui          s1, 400883
                  c.slli       s8, 16
                  c.add        tp, gp
                  csrrw        a6, 0x340, a7
                  c.sub        a1, s1
                  csrrci       tp, 0x340, 0
                  csrrsi       ra, 0x340, 0
                  lui          s3, 290505
                  c.addi       s8, 9
                  csrrwi       t5, 0x340, 24
                  c.xor        s1, a0
                  csrrci       t6, 0x340, 11
                  sub          t2, t3, s1
                  c.li         s0, -1
                  rem          t3, t3, s7
                  c.sub        a3, s1
                  addi         t0, a5, 202
                  c.xor        a4, a1
                  or           t2, a2, s2
                  slli         s10, t1, 26
                  c.addi       s3, -1
                  mul          t3, ra, a7
                  c.xor        s0, a3
                  c.lui        t2, 28
                  sra          t2, s8, s7
                  ori          s2, t1, 746
                  divu         s10, a1, s9
                  csrrci       s9, 0x340, 25
                  c.sub        a3, a2
                  c.srli       a3, 13
                  c.lui        s4, 12
                  sll          a0, s1, zero
                  sub          gp, a3, a2
                  auipc        a0, 424506
                  sub          gp, s8, zero
                  csrrw        s9, 0x340, t3
                  csrrw        s10, 0x340, a5
                  c.nop
                  sra          a3, s10, zero
                  srai         t2, tp, 13
                  c.srli       a3, 10
                  nop
                  c.nop
                  slti         s4, a0, 426
                  mulhu        t4, t0, a1
                  xor          s6, s2, s8
                  csrrwi       a2, 0x340, 4
                  c.add        s7, s1
                  mulh         zero, t1, sp
                  div          s7, s6, t0
                  csrrsi       zero, 0x340, 11
                  c.nop
                  csrrci       t6, 0x340, 0
                  csrrwi       t1, 0x340, 16
                  csrrw        a1, 0x340, t0
                  div          t6, s11, tp
                  c.addi       t4, -1
                  c.andi       a4, -1
                  c.and        a3, a1
                  addi         s9, s10, -807
                  c.or         a4, a2
                  or           t2, s2, a7
                  mulhsu       s8, s0, s7
                  and          s6, ra, s11
                  c.or         a4, a1
                  csrrc        s2, 0x340, zero
                  c.srli       a3, 21
                  xori         a2, a0, -1070
                  div          t2, s1, s0
                  csrrw        t3, 0x340, s0
                  srli         a4, a0, 17
                  slti         a1, s6, -1046
                  srli         s8, t0, 26
                  lui          t6, 145909
                  addi         t6, s9, -1794
                  xor          ra, ra, s11
                  srl          a3, s9, s10
                  c.srli       s1, 24
                  srl          t3, s1, a4
                  c.addi       gp, 31
                  csrrs        s3, 0x340, zero
                  csrrwi       s2, 0x340, 11
                  sra          t5, s9, s1
                  c.lui        t4, 20
                  slt          gp, a2, a5
                  c.lui        tp, 15
                  c.or         a1, a0
                  c.nop
                  csrrw        s2, 0x340, s6
                  csrrci       s7, 0x340, 1
                  sltu         s4, a6, t3
                  c.andi       s1, -1
                  slt          a4, s5, t5
                  srli         s8, t5, 21
                  and          ra, s4, a6
                  div          a0, s8, s6
                  lui          t4, 227392
                  c.or         s0, a2
                  addi         a6, ra, -389
                  remu         t3, s7, t3
                  srli         s0, gp, 17
                  srli         t5, tp, 3
                  sltu         a3, t2, a7
                  c.xor        a1, a1
                  add          a7, gp, gp
                  csrrwi       t4, 0x340, 24
                  sub          t5, s0, t0
                  c.srli       a4, 18
                  rem          a2, s6, t1
                  mulhu        s9, t4, a4
                  c.srli       a0, 1
                  slli         a2, s9, 25
                  c.add        s11, s11
                  andi         s9, t6, 1368
                  sltu         t6, s11, tp
                  csrrw        a6, 0x340, t5
                  srl          t0, s11, t3
                  auipc        ra, 607628
                  addi         s9, gp, 1475
                  c.add        s6, t6
                  c.srli       a4, 11
                  mulh         s3, t5, s8
                  auipc        a7, 779762
                  csrrw        ra, 0x340, s3
                  slt          a4, sp, t5
                  c.srai       s0, 16
                  srli         gp, s6, 15
                  csrrci       s3, 0x340, 0
                  c.srai       a1, 7
                  xori         s3, s6, -326
                  csrrci       t6, 0x340, 9
                  c.add        gp, s0
                  srl          s10, s2, t1
                  sub          s0, t1, t3
                  addi         a6, s5, 1861
                  addi         s4, ra, -1017
                  c.xor        s1, a5
                  slti         t3, s8, 831
                  nop
                  lui          a6, 464958
                  sra          a7, a1, s2
                  c.lui        s2, 13
                  c.add        s7, s2
                  csrrci       a7, 0x340, 7
                  c.srai       a0, 7
                  slti         a1, s0, 301
                  c.srli       s0, 30
                  lui          s9, 455711
                  srli         s8, t6, 9
                  c.or         s1, a5
                  csrrs        s4, 0x340, zero
                  mulhu        a3, s10, s2
                  csrrw        a4, 0x340, s10
                  c.and        s0, s0
                  srli         s11, s10, 30
                  c.lui        s2, 26
                  c.slli       a0, 29
                  csrrs        s6, 0x340, zero
                  nop
                  ori          s4, s9, -806
                  c.mv         s7, t3
                  sltiu        s10, s2, 392
                  c.or         a3, s1
                  c.or         a2, a3
                  mulhsu       s11, s7, t6
                  mulhsu       a7, a0, a7
                  c.andi       s1, 10
                  andi         a7, zero, 497
                  c.sub        a3, a4
                  csrrci       s3, 0x340, 0
                  mulh         a7, s7, t1
                  slli         s0, t6, 7
                  divu         a6, t4, a7
                  csrrc        tp, 0x340, t3
                  xor          s3, s10, t2
                  mul          s4, t3, tp
                  csrrwi       s8, 0x340, 20
                  sltu         a0, gp, t1
                  and          t0, s4, s10
                  slti         t3, a7, 890
                  div          s6, s10, a7
                  c.li         t3, 21
                  c.xor        a3, a5
                  xori         t6, a0, -135
                  c.li         s8, 19
                  sub          s0, a4, s0
                  srl          s3, s7, s1
                  c.lui        a1, 24
                  c.or         a0, a5
                  and          t6, s11, zero
                  c.nop
                  mulhu        s2, t1, t0
                  nop
                  srai         t3, a2, 20
                  add          ra, t2, t3
                  csrrs        gp, 0x340, tp
                  srli         a2, t0, 7
                  rem          a2, a0, a2
                  mul          a6, a0, t2
                  csrrs        s11, 0x340, tp
                  slli         s3, t1, 10
                  addi         s6, s9, 784
                  c.addi       a0, 23
                  csrrs        t2, 0x340, s7
                  sltu         ra, s4, s7
                  div          a2, a6, s5
                  remu         t0, t4, zero
                  sll          a7, t3, s7
                  auipc        t3, 1017751
                  c.sub        a1, s0
                  csrrw        s8, 0x340, t5
                  csrrw        s10, 0x340, s11
                  csrrw        a2, 0x340, zero
                  c.slli       a6, 24
                  c.nop
                  slli         t0, s1, 5
                  or           s4, s10, ra
                  csrrsi       t2, 0x340, 21
                  csrrc        t2, 0x340, zero
                  and          s11, a2, a7
                  srai         s7, gp, 9
                  div          t3, sp, s11
                  c.addi       gp, -1
                  c.srli       a3, 16
                  csrrci       s1, 0x340, 0
                  c.and        s1, s0
                  divu         a0, s5, t2
                  c.nop
                  c.addi       a7, 25
                  c.mv         s4, sp
                  slt          t6, s4, a7
                  div          s0, a4, a6
                  xori         t5, tp, -1777
                  c.lui        a0, 2
                  c.sub        a1, a2
                  c.li         t5, 19
                  mul          a7, a2, a1
                  and          t6, a7, a2
                  srl          s0, t0, t0
                  c.and        a1, s0
                  srli         a2, t5, 13
                  or           a3, t0, s2
                  c.or         a4, a5
                  c.srli       s0, 31
                  c.sub        a1, a2
                  xori         gp, s5, 23
                  sltu         s11, s10, a5
                  sltiu        s11, s3, -1663
                  mulhu        tp, a7, a3
                  srl          s4, t2, s1
                  mulh         s0, a7, tp
                  c.nop
                  ori          s11, s3, -1
                  sra          t3, s0, ra
                  nop
                  mulhsu       t6, s9, s6
                  mulhsu       a3, s9, a6
                  mulhsu       s0, tp, ra
                  c.add        s4, t3
                  sltu         s1, s4, s10
                  c.srai       s1, 30
                  c.slli       t2, 11
                  xori         t1, a2, -1938
                  xori         a2, s4, 286
                  divu         t1, a3, zero
                  csrrci       s3, 0x340, 0
                  c.mv         s2, t0
                  c.li         t1, -1
                  slli         t0, a0, 21
                  csrrw        s0, 0x340, sp
                  ori          gp, sp, -1474
                  csrrc        a4, 0x340, s4
                  csrrw        t5, 0x340, gp
                  sub          a7, s0, sp
                  auipc        t5, 450082
                  c.srai       a2, 28
                  mulhsu       s0, s7, s11
                  c.xor        s1, a5
                  div          s8, a1, t1
                  c.slli       t2, 26
                  add          zero, s7, a0
                  sltiu        a6, s2, 1327
                  rem          a1, t3, s9
                  add          a0, a1, ra
                  rem          a0, t1, a5
                  c.li         a3, -1
                  ori          s3, a2, -1989
                  sltiu        s10, t5, 1289
                  slti         zero, sp, -1405
                  mulhsu       t5, s10, zero
                  add          s7, sp, a0
                  or           a2, t6, t1
                  sub          s8, s3, s11
                  div          tp, a3, a0
                  c.add        s11, t0
                  sll          s10, t0, tp
                  mul          t3, s11, s9
                  xor          s9, s5, t0
                  xor          t2, t2, s10
                  c.add        s0, a1
                  or           s6, s1, a2
                  c.srai       a3, 25
                  nop
                  c.nop
                  xor          s0, s8, t1
                  or           t6, a2, s0
                  and          s11, ra, t4
                  csrrs        t1, 0x340, zero
                  c.nop
                  divu         ra, a6, s10
                  c.mv         t4, s4
                  slli         s3, a1, 11
                  nop
                  div          s9, s5, s7
                  c.li         s10, -1
                  c.add        s6, a2
                  mul          a0, a3, ra
                  mulhu        s2, t0, t0
                  c.mv         gp, s4
                  csrrwi       zero, 0x340, 22
                  c.li         t0, -1
                  c.and        s0, a1
                  mulhsu       t4, s7, s9
                  csrrwi       tp, 0x340, 14
                  slt          s9, s1, sp
                  csrrwi       t3, 0x340, 31
                  mulhu        s8, s5, s8
                  c.lui        s8, 19
                  sll          t0, s3, t6
                  mulhu        s7, s6, s3
                  sltiu        a2, zero, 1316
                  c.add        t1, t0
                  c.and        a0, a0
                  srli         zero, a1, 29
                  c.addi       a0, -1
                  c.lui        tp, 21
                  addi         s4, t1, 602
                  c.sub        s0, a4
                  c.srli       s1, 29
                  c.or         s1, a1
                  remu         ra, gp, s11
                  c.li         t5, 22
                  and          a0, a2, s7
                  xor          s0, s0, tp
                  addi         s0, a3, 907
                  srai         zero, s11, 23
                  c.srai       a3, 16
                  remu         s7, a2, t1
                  sltiu        s9, t0, 379
                  c.srli       a2, 14
                  remu         s9, a0, s7
                  mulhsu       t5, a7, s3
                  c.lui        t3, 7
                  add          t5, a6, s3
                  c.add        s0, a6
                  c.mv         t3, s8
                  c.mv         s10, t1
                  xori         s7, s10, -785
                  sll          t2, sp, s6
                  ori          s8, zero, -1401
                  c.mv         s3, a4
                  c.li         tp, -1
                  remu         a3, a5, t4
                  sra          s0, a6, tp
                  ori          a6, a4, -235
                  c.and        a0, s1
                  c.addi       a7, -1
                  auipc        t0, 883244
                  or           s2, s5, t1
                  xor          s3, t2, ra
                  c.or         a1, s0
                  slti         s8, t4, -378
                  c.nop
                  sll          t1, tp, s6
                  sub          s2, a2, a1
                  andi         s1, t0, 666
                  slli         s6, s8, 15
                  slti         gp, s3, 1977
                  c.andi       s1, 14
                  csrrw        t2, 0x340, a7
                  c.slli       a3, 20
                  csrrc        s4, 0x340, zero
                  srl          s8, t1, s7
                  srl          a0, s9, t4
                  andi         t1, tp, 503
                  csrrc        tp, 0x340, tp
                  addi         a1, t1, 1960
                  c.xor        a4, a0
                  c.mv         s2, a1
                  lui          t5, 466860
                  c.andi       s1, 9
                  nop
                  slli         s4, s6, 18
                  c.lui        a2, 2
                  mul          a2, s2, a0
                  rem          s0, s10, sp
                  c.slli       tp, 21
                  sra          a4, s5, s1
                  csrrs        a6, 0x340, zero
                  sub          s8, t6, a6
                  addi         a1, a5, 528
                  sltiu        s6, sp, 1042
                  srai         tp, a4, 20
                  lui          s3, 301925
                  remu         s10, s5, a0
                  csrrci       s11, 0x340, 0
                  csrrc        s4, 0x340, zero
                  c.slli       a6, 2
                  c.mv         s4, t5
                  sub          s2, s4, a7
                  c.sub        a0, a2
                  sltiu        ra, a0, 325
                  ori          a4, s4, 106
                  c.addi       t3, 7
                  c.andi       s0, 11
                  mul          t5, a1, ra
                  ori          a7, t0, -444
                  xori         s1, s8, -642
                  sra          t3, s11, gp
                  c.srai       s1, 24
                  sltu         s7, a5, a1
                  srai         s3, t1, 6
                  c.lui        a0, 11
                  or           t2, s5, s6
                  sltu         zero, s2, gp
                  c.lui        s4, 7
                  c.or         a3, a0
                  rem          s11, s11, sp
                  c.and        a0, a1
                  xori         s3, s10, -293
                  add          a6, s4, t3
                  ori          s8, s5, -644
                  srl          s4, t3, t0
                  slli         t1, zero, 28
                  csrrsi       a6, 0x340, 21
                  c.or         s1, a0
                  divu         tp, s0, a6
                  sll          t4, t3, s8
                  c.addi       t2, -1
                  slti         s11, s6, -868
                  c.nop
                  remu         ra, zero, a7
                  c.andi       s0, -1
                  csrrc        t3, 0x340, zero
                  c.srli       s0, 9
                  csrrwi       s11, 0x340, 20
                  c.andi       a1, -1
                  sltiu        a0, s6, 773
                  c.addi       s11, 17
                  csrrci       a3, 0x340, 0
                  divu         a6, t6, s7
                  add          t5, a6, gp
                  sll          ra, s8, a6
                  remu         s2, a7, s10
                  sra          a4, s1, s5
                  lui          a2, 414523
                  nop
                  and          s1, sp, s0
                  srl          s8, s11, s8
                  srl          t5, zero, a3
                  csrrci       s7, 0x340, 13
                  rem          t1, s0, s8
                  csrrw        s1, 0x340, s2
                  c.slli       s4, 22
                  ori          s6, s9, 1106
                  csrrsi       zero, 0x340, 14
                  c.srai       s0, 20
                  ori          s9, s9, 1485
                  div          a6, gp, a4
                  sll          s11, s0, t3
                  c.mv         s0, t0
                  slli         s9, t3, 7
                  mul          s3, t4, a2
                  srli         gp, s4, 22
                  c.srai       a3, 24
                  rem          s10, s5, ra
                  sra          s3, s9, tp
                  mulhsu       a1, t0, zero
                  or           a3, s0, zero
                  sltiu        t3, s3, -1488
                  rem          a1, a1, t6
                  csrrwi       t2, 0x340, 15
                  c.mv         a3, a3
                  mulh         ra, t5, a2
                  c.sub        a2, a2
                  add          t5, t5, s1
                  slti         s2, t2, -1357
                  mul          t5, s1, s2
                  srai         t0, t5, 0
                  addi         a6, a5, 228
                  srai         s7, t3, 14
                  c.mv         s2, gp
                  div          s11, a5, s1
                  sll          tp, t3, s9
                  div          s11, s8, a6
                  ori          s8, s11, -1014
                  sub          s9, t6, t1
                  c.or         a4, a0
                  lui          t1, 314042
                  xor          a7, gp, t4
                  c.or         a2, a4
                  mulh         gp, s0, tp
                  sltiu        t0, t5, -881
                  and          gp, s0, s3
                  div          s6, sp, a3
                  xori         t6, s2, -399
                  c.lui        s9, 23
                  andi         t2, s10, -1142
                  ori          s4, s9, -58
                  c.nop
                  div          a2, a3, t2
                  sra          s3, t3, s9
                  c.mv         t1, s4
                  addi         t4, s1, -1536
                  mulhsu       a7, a6, a2
                  mulhsu       t5, s11, a5
                  c.lui        tp, 25
                  addi         s1, s1, -129
                  c.li         tp, 31
                  c.lui        s1, 14
                  mulhsu       s7, s8, a6
                  csrrw        t3, 0x340, t1
                  csrrs        s11, 0x340, s3
                  c.addi       t0, -1
                  sltiu        tp, ra, 547
                  slli         ra, s2, 23
                  c.andi       s1, -1
                  sll          s9, a2, s6
                  and          s1, a0, a5
                  c.and        a2, s1
                  slti         a4, s7, 1382
                  slli         t5, s8, 15
                  csrrc        s9, 0x340, zero
                  slli         s3, ra, 28
                  auipc        a3, 233915
                  mulhsu       t3, a3, t4
                  sltiu        s1, ra, 1881
                  slti         t3, a7, 1500
                  rem          s1, a6, a7
                  c.mv         t4, s10
                  csrrsi       a7, 0x340, 7
                  or           s4, t5, t2
                  c.li         s9, 2
                  srl          a1, s1, a7
                  mulhsu       s4, s1, ra
                  div          s4, t3, s7
                  srli         s10, ra, 0
                  slt          t5, tp, s4
                  addi         t6, s2, 331
                  slli         s6, t5, 17
                  sll          s4, tp, s1
                  div          a7, a0, a1
                  srl          s6, a0, s0
                  add          gp, t2, s3
                  c.add        s4, s0
                  rem          s8, a4, t3
                  andi         a7, a3, 1233
                  sra          s7, s8, sp
                  c.nop
                  addi         tp, ra, 867
                  slti         a6, s6, -369
                  c.or         a0, a4
                  sltu         a7, s4, s8
                  c.add        t5, s11
                  remu         s4, s6, sp
                  c.andi       a1, -1
                  srli         s9, sp, 13
                  c.mv         a6, a2
                  ori          s4, a0, 1061
                  csrrw        a6, 0x340, t4
                  mulhsu       t6, s7, s10
                  c.mv         t4, t6
                  sub          a2, a4, t1
                  sltiu        t3, t0, 1440
                  sll          t6, s7, a2
                  mulhu        s6, s8, s0
                  and          t6, t6, a6
                  addi         s1, a1, 152
                  and          s3, t6, s1
                  c.and        s1, a5
                  slti         s3, sp, 1135
                  mulh         zero, tp, t2
                  slti         t6, s1, -1015
                  srli         t5, s10, 1
                  remu         zero, s8, a6
                  c.lui        s1, 4
                  c.xor        a1, s1
                  rem          s8, s4, s11
                  c.andi       a2, 21
                  c.xor        a0, a3
                  csrrsi       s8, 0x340, 0
                  c.srli       a4, 2
                  c.and        a1, a1
                  lui          t1, 466288
                  csrrsi       s2, 0x340, 0
                  ori          s0, zero, 521
                  sll          t4, s9, s2
                  c.li         gp, -1
                  sltu         s11, a2, a4
                  c.mv         a2, t1
                  c.srai       a0, 18
                  mulhsu       s6, t4, a7
                  csrrc        t4, 0x340, zero
                  srl          ra, s10, tp
                  mulhsu       tp, s9, s11
                  xori         t2, a6, -1323
                  rem          a3, s8, a2
                  csrrci       s3, 0x340, 10
                  sll          a0, tp, s5
                  csrrc        s11, 0x340, zero
                  mulhu        s8, gp, a1
                  remu         ra, s11, s6
                  nop
                  auipc        tp, 278168
                  csrrsi       gp, 0x340, 0
                  divu         s0, s3, tp
                  and          s1, tp, gp
                  xor          a3, a2, s0
                  c.li         s0, 0
                  srl          s3, a2, sp
                  c.sub        a3, s1
                  sra          t1, t5, s6
                  c.slli       a7, 26
                  mul          t4, a2, a5
                  csrrwi       a7, 0x340, 7
                  csrrc        s10, 0x340, t6
                  remu         zero, t5, s0
                  sub          ra, t3, s11
                  nop
                  c.nop
                  nop
                  mulhu        a2, t2, s6
                  c.andi       a4, -1
                  c.sub        a3, a5
                  sra          s10, sp, s10
                  rem          s2, ra, s1
                  slt          s9, s10, s5
                  and          s2, s0, a4
                  csrrc        a0, 0x340, zero
                  ori          t4, a0, -667
                  c.lui        s3, 1
                  csrrsi       a0, 0x340, 17
                  c.srai       s0, 29
                  csrrc        s2, 0x340, t4
                  sll          t5, s4, s8
                  xor          a3, s8, t6
                  lui          s11, 629485
                  c.srai       a3, 28
                  c.li         a1, -1
                  slli         tp, s11, 0
                  mulhsu       s7, s5, s9
                  xori         t4, tp, 483
                  srai         t0, t5, 9
                  srli         a0, s7, 1
                  slti         s6, t0, -54
                  xori         s10, a5, 1256
                  mulh         zero, a2, s9
                  xori         s6, s10, -527
                  c.or         a3, a5
                  lui          tp, 190983
                  c.srli       a1, 24
                  add          s9, t5, a1
                  csrrsi       t6, 0x340, 2
                  c.mv         a6, s1
                  slli         gp, s6, 31
                  c.sub        a4, s0
                  srai         t4, gp, 11
                  remu         t5, s0, s11
                  mulhsu       s0, s10, t2
                  and          s9, a3, ra
                  c.slli       t3, 2
                  div          ra, a4, s2
                  mulh         t3, tp, s8
                  c.nop
                  c.add        a4, s4
                  c.addi       s10, 1
                  c.li         s0, 18
                  csrrc        gp, 0x340, zero
                  c.addi       s8, 16
                  mulhsu       s11, s5, a1
                  and          t6, a5, a0
                  xor          s4, s1, gp
                  csrrw        t1, 0x340, a7
                  sub          t1, s2, s8
                  srli         t1, a2, 5
                  sltu         a7, a3, zero
                  andi         zero, t5, 894
                  c.mv         t0, t0
                  c.addi       t0, 19
                  auipc        s11, 130859
                  mulhu        s2, s1, s8
                  c.addi       a6, 11
                  sltiu        t1, a4, -915
                  xori         s4, s0, -152
                  mulhsu       a6, s7, t1
                  add          gp, s0, s7
                  andi         a2, a1, -733
                  mulh         s1, ra, a1
                  addi         tp, sp, -292
                  sra          zero, a3, t4
                  sub          s10, s7, t4
                  mulhu        a4, a2, tp
                  div          s3, a1, s10
                  c.andi       a3, 22
                  srli         s3, s10, 13
                  c.add        s8, a3
                  mul          ra, a2, tp
                  sltiu        t5, a5, 1054
                  csrrci       a7, 0x340, 0
                  andi         a7, s0, 788
                  andi         a1, t5, -1492
                  slti         t3, s1, 379
                  rem          s2, gp, a7
                  c.srli       s1, 7
                  sll          t6, t2, t1
                  remu         t4, a5, s10
                  c.srli       a0, 19
                  remu         zero, a0, s9
                  srai         ra, tp, 19
                  sltu         s4, a4, s11
                  srai         a3, a0, 15
                  add          s6, t3, a0
                  c.srai       a2, 4
                  lui          a3, 51366
                  c.sub        a3, s0
                  c.and        a3, a0
                  div          s8, s5, a5
                  andi         t5, s5, 1469
                  c.li         a4, 12
                  csrrc        a3, 0x340, zero
                  xor          t4, s6, s5
                  c.add        a6, s3
                  csrrsi       s11, 0x340, 0
                  csrrci       s11, 0x340, 25
                  slti         zero, a7, -372
                  divu         s1, sp, t2
                  c.andi       s1, -1
                  ori          zero, sp, -1808
                  slti         s2, a5, -352
                  srli         s8, a7, 13
                  c.add        a2, a0
                  c.srli       a1, 10
                  c.andi       s1, -1
                  csrrs        t3, 0x340, zero
                  sltu         a4, t2, a4
                  sll          s7, s9, t3
                  slti         zero, t5, -1360
                  csrrc        t0, 0x340, s6
                  c.addi       a3, -1
                  andi         t3, s1, 289
                  sub          t0, a6, s0
                  mulhu        ra, a7, a6
                  sltu         gp, s8, gp
                  c.li         t5, -1
                  auipc        s11, 1030439
                  sll          a2, a3, a1
                  c.slli       s6, 17
                  slli         t5, s8, 9
                  rem          t0, zero, tp
                  or           a3, s7, s10
                  divu         s7, a6, a0
                  xori         s4, s2, 626
                  c.slli       a7, 5
                  c.slli       a7, 12
                  ori          ra, a0, -834
                  c.srli       s1, 3
                  c.addi       s11, 26
                  srli         t0, s2, 22
                  c.and        a3, a1
                  c.srli       s0, 30
                  slti         s1, t4, -461
                  addi         t3, a5, 1008
                  c.addi       t0, 14
                  csrrw        t6, 0x340, t6
                  srai         s9, t6, 22
                  csrrsi       a2, 0x340, 8
                  csrrci       t2, 0x340, 29
                  addi         s0, a3, -372
                  remu         s9, s8, t1
                  sll          t0, t6, t6
                  lui          ra, 329054
                  rem          s7, s1, s7
                  sub          t6, s7, t2
                  mulhsu       s11, t3, s10
                  csrrs        s9, 0x340, s2
                  sll          a6, s0, a0
                  ori          a4, t5, -298
                  c.srai       s0, 31
                  sra          a2, s2, a6
                  add          zero, t5, gp
                  remu         t0, s0, s6
                  sll          s6, ra, zero
                  csrrs        s6, 0x340, t1
                  addi         a1, t4, 741
                  remu         t5, s10, s11
                  slt          a2, a2, sp
                  sra          a4, a6, t2
                  auipc        a2, 768587
                  xori         s11, t5, 927
                  mulhu        t6, tp, t1
                  c.nop
                  csrrs        s1, 0x340, zero
                  slli         t0, t3, 11
                  c.sub        a2, a5
                  slli         s6, t1, 2
                  and          s11, s5, s5
                  c.xor        s1, a0
                  sub          tp, s3, a2
                  ori          a0, t4, -298
                  ori          a4, t6, 139
                  c.or         a1, a1
                  c.slli       s1, 7
                  srli         t1, t1, 3
                  nop
                  sub          a2, s8, tp
                  add          t1, a7, t2
                  csrrci       t1, 0x340, 1
                  xori         a6, s4, 1691
                  srli         a0, s3, 20
                  slli         s7, a1, 16
                  nop
                  c.add        a3, s11
                  rem          t2, t2, s10
                  csrrw        a4, 0x340, s3
                  c.slli       t0, 30
                  sll          a0, a3, s11
                  csrrw        s3, 0x340, t3
                  c.li         s11, 13
                  c.and        a0, s1
                  c.sub        a1, a5
                  c.addi       s6, 17
                  c.addi       t3, 17
                  slti         s7, s8, 2024
                  csrrw        t6, 0x340, a3
                  add          s4, s10, gp
                  auipc        a7, 979729
                  c.sub        a2, a2
                  divu         s11, a3, s5
                  srai         s9, zero, 31
                  c.or         a1, s1
                  xor          a0, a0, s2
                  csrrc        t5, 0x340, s4
                  div          s7, sp, a1
                  and          s0, s7, s6
                  nop
                  sub          a2, s6, t4
                  add          s6, a6, zero
                  c.srai       a1, 21
                  csrrc        s11, 0x340, zero
                  add          s0, tp, gp
                  sub          t6, s3, zero
                  csrrw        s10, 0x340, tp
                  or           a2, t0, a4
                  c.li         ra, 11
                  divu         a6, t0, tp
                  sltu         ra, a5, gp
                  srl          s7, s8, s4
                  c.srli       a2, 9
                  srli         gp, a5, 17
                  c.srli       s0, 2
                  ori          s10, t6, -1983
                  rem          s10, t6, t4
                  addi         a6, sp, 1392
                  csrrc        a1, 0x340, zero
                  div          s11, s7, t2
                  c.addi       tp, -1
                  sll          s3, ra, s4
                  andi         a7, s0, 466
                  csrrwi       s9, 0x340, 11
                  c.sub        a4, a3
                  c.srai       a1, 23
                  add          a0, s9, s5
                  csrrci       s1, 0x340, 0
                  c.li         t2, 29
                  sra          s9, s5, sp
                  c.lui        s11, 22
                  slt          a0, s11, s7
                  c.or         a3, a4
                  srli         a6, s0, 3
                  mulh         a6, s8, sp
                  csrrwi       a2, 0x340, 3
                  divu         s7, t0, sp
                  slt          a3, s5, a7
                  and          gp, s8, s4
                  srl          t4, a5, s11
                  c.srai       a0, 21
                  mulhu        t0, s7, s11
                  sub          a3, s8, t1
                  srai         gp, a4, 12
                  srl          s0, s8, t1
                  divu         a4, a7, s7
                  srli         s6, a2, 25
                  c.slli       t4, 30
                  c.sub        s1, s1
                  div          s0, a1, t4
                  c.and        a0, a1
                  xori         t6, tp, -967
                  auipc        a4, 350716
                  sltu         s2, t0, s3
                  c.add        s8, gp
                  c.xor        s1, a3
                  c.srai       s0, 7
                  xori         s11, t6, -1409
                  c.or         a0, s1
                  addi         t5, s7, 260
                  c.xor        s0, a5
                  slti         s2, ra, -1128
                  c.srli       s1, 25
                  c.lui        t4, 24
                  csrrci       s4, 0x340, 11
                  ori          zero, a6, 1444
                  c.slli       t2, 9
                  sub          a4, s3, s1
                  ori          t1, sp, 1037
                  sltu         t0, s7, a3
                  lui          a6, 590486
                  csrrs        t1, 0x340, zero
                  or           s1, t3, zero
                  csrrci       a3, 0x340, 3
                  sub          tp, a4, sp
                  divu         gp, a5, a5
                  srli         s8, s1, 31
                  c.xor        a1, a1
                  auipc        s8, 249813
                  csrrw        a3, 0x340, s6
                  lui          t6, 912660
                  c.andi       a2, -1
                  sll          a0, sp, s3
                  divu         ra, t4, s10
                  c.slli       gp, 21
                  sltu         s2, s3, sp
                  div          s3, s9, t4
                  c.mv         s9, s7
                  rem          gp, t6, t5
                  divu         t6, ra, t2
                  c.andi       a2, 14
                  c.andi       a2, 7
                  c.xor        a4, a3
                  csrrw        s0, 0x340, t5
                  csrrs        t1, 0x340, zero
                  mulh         t4, gp, s5
                  csrrc        s3, 0x340, s3
                  addi         s11, t4, 1730
                  csrrc        t0, 0x340, a0
                  xor          t1, sp, t0
                  c.and        a2, s0
                  sltu         t0, s4, s11
                  mul          t5, a0, t6
                  csrrw        a1, 0x340, zero
                  mul          t6, s1, t1
                  csrrs        a2, 0x340, zero
                  sra          ra, ra, s10
                  csrrc        t6, 0x340, t1
                  xor          ra, t2, t1
                  csrrsi       a4, 0x340, 20
                  c.srai       a1, 25
                  mul          s9, s4, ra
                  c.li         s2, 12
                  csrrc        s0, 0x340, zero
                  slt          a0, s9, t1
                  addi         a6, s7, 948
                  c.andi       a2, 24
                  slt          s9, sp, a1
                  csrrwi       s1, 0x340, 9
                  c.andi       s1, -1
                  c.xor        s0, s1
                  andi         ra, a0, -1688
                  ori          s8, t2, -390
                  c.mv         t0, a5
                  c.srai       a4, 23
                  rem          a2, s2, s0
                  slti         t1, s9, 39
                  remu         t2, a0, s3
                  c.li         t2, 9
                  csrrw        a0, 0x340, s5
                  c.nop
                  nop
                  csrrci       s11, 0x340, 13
                  sll          t2, tp, s3
                  c.srli       s0, 16
                  c.sub        a3, a3
                  sll          a0, s2, ra
                  sra          a2, a1, a5
                  ori          s2, t1, -1656
                  c.slli       a3, 17
                  c.srli       s1, 16
                  srli         s2, t0, 24
                  c.xor        a0, a5
                  rem          s0, s6, s9
                  csrrwi       s11, 0x340, 29
                  c.mv         a2, t2
                  srli         a4, a4, 21
                  c.add        s2, s7
                  c.or         s0, a0
                  sub          gp, t0, t1
                  csrrs        t0, 0x340, s8
                  lui          gp, 438716
                  slti         t4, s7, 1534
                  csrrs        s4, 0x340, zero
                  sra          a2, s11, gp
                  and          s9, a2, a3
                  csrrc        s2, 0x340, zero
                  xor          t4, t5, gp
                  slti         a6, s5, 171
                  c.srai       s0, 25
                  auipc        a6, 179744
                  sll          t4, a1, s5
                  remu         t1, t1, a6
                  sra          t4, s2, a5
                  sll          a7, tp, s10
                  add          s3, a4, s7
                  div          t4, tp, a7
                  c.add        gp, a4
                  sub          tp, t1, a1
                  add          s10, s4, tp
                  c.sub        a4, a4
                  rem          t1, ra, s2
                  sub          a3, t5, t3
                  slt          s6, ra, s9
                  sltiu        s8, ra, -1335
                  ori          a6, a1, 715
                  mul          t3, s7, s2
                  sub          s0, ra, s10
                  mulhsu       s2, a6, s5
                  divu         t3, t6, s7
                  sub          s1, s11, gp
                  srai         s10, t6, 22
                  c.lui        t3, 12
                  rem          s11, s6, t2
                  c.sub        s0, a2
                  c.add        a4, t1
                  sll          a4, a1, t5
                  csrrc        t3, 0x340, gp
                  sltiu        a2, gp, -1644
                  srai         zero, a5, 21
                  lui          tp, 68213
                  lui          s6, 300546
                  c.or         s0, a4
                  c.add        a2, s9
                  c.mv         t5, s8
                  c.slli       t5, 29
                  c.slli       a4, 30
                  slli         s11, a5, 19
                  srli         t2, s8, 5
                  sub          t4, a2, s10
                  csrrci       a7, 0x340, 0
                  sltiu        a2, s9, 1701
                  c.srai       a2, 2
                  c.add        s4, t4
                  auipc        a3, 261051
                  remu         s6, a3, a2
                  c.xor        s1, s0
                  srai         s6, a0, 7
                  c.mv         s6, s4
                  c.addi       a7, -1
                  c.or         a1, a3
                  c.srai       a3, 4
                  and          a1, zero, s8
                  ori          s4, s6, 635
                  ori          a1, a3, 969
                  c.slli       s1, 4
                  mulhu        tp, zero, a0
                  slli         t5, s8, 14
                  c.lui        s7, 4
                  nop
                  lui          ra, 3571
                  c.andi       a3, -1
                  c.or         a4, a0
                  c.mv         a7, a6
                  c.li         gp, 30
                  c.srai       s0, 28
                  nop
                  c.andi       a0, 23
                  mulhsu       a1, t6, s2
                  sltiu        t0, a3, -818
                  div          s11, t6, a4
                  andi         t4, t1, -1689
                  xor          t3, s1, t3
                  add          t5, a4, gp
                  c.or         a4, s1
                  c.srai       a4, 28
                  sltiu        a6, s6, 813
                  sltu         s2, a3, s8
                  csrrci       tp, 0x340, 7
                  c.or         s1, a5
                  xor          s11, s10, tp
                  c.li         s8, 3
                  c.andi       a2, 12
                  sub          tp, s7, t3
                  c.xor        a0, a3
                  auipc        gp, 642268
                  csrrw        a3, 0x340, a3
                  csrrc        s11, 0x340, a7
                  c.addi       a4, -1
                  mulhu        s9, t4, s2
                  xor          t1, a0, t4
                  c.and        s0, s0
                  add          s9, s0, s8
                  and          s6, t2, t1
                  andi         gp, s10, -721
                  auipc        zero, 224373
                  c.slli       s0, 10
                  mulhu        t3, a4, s5
                  c.andi       a4, -1
                  slti         t5, t6, 856
                  mul          t2, t3, a6
                  div          tp, s9, a2
                  c.srli       s0, 26
                  divu         zero, t0, a1
                  c.li         t3, 11
                  c.andi       a1, -1
                  c.slli       s2, 15
                  xor          s7, s1, a1
                  csrrw        a1, 0x340, sp
                  sltu         a7, s10, t3
                  c.slli       t2, 8
                  c.slli       s6, 25
                  lui          zero, 616739
                  sra          a1, s2, tp
                  nop
                  csrrci       a1, 0x340, 6
                  c.nop
                  c.lui        s4, 1
                  and          a1, s9, t4
                  divu         t3, zero, t3
                  csrrci       gp, 0x340, 17
                  c.nop
                  csrrc        gp, 0x340, zero
                  mulhsu       a4, a6, a5
                  c.li         s9, 2
                  slli         s2, a6, 6
                  xor          s3, s0, t4
                  c.add        s8, s6
                  ori          t1, tp, 599
                  nop
                  c.and        a2, s1
                  c.xor        a4, s0
                  c.sub        a2, s1
                  mul          ra, t2, a0
                  mul          s1, t1, t4
                  csrrwi       a4, 0x340, 28
                  div          a3, s2, t0
                  c.srai       s1, 22
                  sll          t2, gp, s11
                  c.xor        a0, a2
                  c.nop
                  remu         a0, s7, s1
                  c.mv         a3, a1
                  slt          tp, t0, a7
                  c.and        a0, a3
                  c.srli       a1, 9
                  c.add        gp, a1
                  c.addi       ra, -1
                  ori          s3, t6, 890
                  mulhsu       zero, a0, s5
                  auipc        tp, 746639
                  srli         t0, a2, 8
                  csrrci       a3, 0x340, 28
                  add          s8, gp, t5
                  sltu         s11, s1, t5
                  mulhu        t4, t3, zero
                  slt          a2, t2, s7
                  c.srli       a3, 20
                  srli         a7, a6, 10
                  addi         s6, s9, 903
                  c.or         s1, s1
                  srai         a1, s2, 2
                  div          s3, ra, s6
                  or           s6, a0, t2
                  ori          s2, a0, -1138
                  c.nop
                  auipc        t3, 1040217
                  c.nop
                  c.xor        s1, s1
                  mulh         gp, sp, s2
                  mul          t4, s6, a7
                  slli         zero, t3, 12
                  c.srai       s0, 14
                  add          s11, s8, t4
                  mulhu        t6, a6, s7
                  slt          s4, ra, a6
                  sll          tp, s7, t0
                  c.srai       a0, 18
                  mulhu        ra, t4, t3
                  add          s11, s7, a2
                  c.sub        s0, a1
                  c.and        a1, s1
                  mulh         t4, a1, a0
                  srl          s7, a7, s1
                  sll          a7, s8, s8
                  mulhu        t4, s3, s7
                  srli         t4, s2, 8
                  sll          zero, s3, t1
                  ori          s8, a6, 576
                  sltu         s7, a1, t1
                  c.nop
                  c.nop
                  rem          t0, a7, a5
                  c.li         a7, -1
                  auipc        t1, 396833
                  srai         s2, s11, 4
                  auipc        s2, 5646
                  c.andi       a2, 9
                  and          a3, s1, s1
                  c.srai       a1, 14
                  sltiu        gp, s10, 807
                  xor          s0, a4, a1
                  csrrwi       a2, 0x340, 20
                  c.andi       a3, 31
                  c.srli       s0, 1
                  c.and        a0, s1
                  auipc        gp, 505557
                  c.or         a3, s1
                  c.xor        a3, s1
                  sltu         a7, s1, s3
                  auipc        t6, 88521
                  srl          t5, t3, s10
                  mulh         s11, s1, a7
                  c.li         gp, -1
                  c.srai       s0, 17
                  auipc        tp, 270265
                  slt          a0, t6, s4
                  sltu         s0, gp, a1
                  srli         s3, s5, 10
                  nop
                  sll          t3, t4, a3
                  c.lui        a2, 4
                  slli         s10, t4, 26
                  c.and        a0, a0
                  c.srli       a0, 3
                  c.nop
                  sra          a4, a5, s7
                  div          t6, s0, t4
                  c.and        a0, a3
                  div          a7, sp, s8
                  csrrs        a6, 0x340, s0
                  sub          a3, s3, s11
                  c.or         a0, s0
                  slti         t3, s5, -312
                  xori         s1, a4, 1561
                  srl          a0, a5, a3
                  c.srai       a1, 31
                  csrrwi       s0, 0x340, 11
                  sll          t6, a4, s10
                  c.sub        s0, a3
                  csrrs        s11, 0x340, zero
                  rem          s10, s0, a1
                  mul          a7, ra, s3
                  c.xor        a4, a4
                  mulhu        s0, s5, zero
                  csrrci       s10, 0x340, 26
                  rem          s6, t6, a1
                  slti         a1, t2, -1012
                  mulhsu       a1, a0, s10
                  sltiu        s7, s10, 1246
                  sll          s6, tp, a1
                  csrrwi       s9, 0x340, 30
                  rem          s8, ra, a0
                  mul          t4, a7, a0
                  slt          s9, a0, a1
                  c.or         a4, a1
                  mulh         a2, a1, s7
                  remu         a0, a4, s5
                  sra          ra, s10, a1
                  nop
                  nop
                  csrrw        s7, 0x340, ra
                  slli         a4, s4, 7
                  mulhsu       tp, a5, s8
                  c.addi       a4, 13
                  mulhsu       a7, a7, s7
                  divu         s7, s5, ra
                  remu         zero, t1, a5
                  or           s7, a2, a5
                  c.srli       s1, 11
                  srai         t4, tp, 19
                  ori          s11, s6, -121
                  sra          a0, s3, t2
                  slli         a3, t2, 15
                  sra          t5, a4, a5
                  c.mv         a3, t1
                  c.nop
                  xor          a1, s10, tp
                  add          tp, s2, t2
                  div          s11, s8, s2
                  or           t0, t2, s0
                  nop
                  lui          a1, 748466
                  nop
                  andi         zero, a1, -174
                  auipc        a1, 647714
                  addi         t2, a5, -686
                  slti         a7, t2, -1461
                  mulh         s1, t4, s8
                  or           s10, s1, a6
                  lui          s1, 134897
                  c.andi       a1, -1
                  sltu         ra, t3, a0
                  add          a4, sp, a2
                  c.andi       s0, 7
                  ori          t1, t0, 220
                  c.sub        s1, a5
                  c.lui        t1, 27
                  c.xor        a4, a1
                  c.mv         a3, t0
                  sub          a0, s1, tp
                  c.addi       t3, -1
                  sub          a1, s1, tp
                  addi         s11, t1, -874
                  mul          gp, s8, tp
                  sltiu        s10, s5, -900
                  rem          a6, s2, a7
                  mulhsu       zero, s10, a3
                  srl          a6, s1, t3
                  xori         t2, s6, 280
                  remu         a6, zero, a3
                  c.addi       ra, 16
                  c.xor        a0, a3
                  c.lui        s3, 30
                  rem          s0, s5, s11
                  c.add        a6, s7
                  slli         t0, s10, 15
                  c.li         s1, 0
                  c.lui        s11, 12
                  remu         a0, t2, s0
                  sltu         a4, t0, t4
                  slti         gp, gp, 1768
                  mulhsu       t2, t1, a2
                  mul          t5, s9, t5
                  csrrc        a3, 0x340, zero
                  slti         a0, a5, -907
                  mul          t3, s10, s9
                  csrrsi       zero, 0x340, 0
                  lui          a2, 502382
                  nop
                  c.li         s2, 1
                  csrrwi       s1, 0x340, 1
                  c.slli       t1, 22
                  andi         a3, tp, 1759
                  sra          a4, sp, t5
                  mul          s1, a0, a0
                  srli         s2, t3, 11
                  or           gp, s10, t4
                  c.slli       tp, 23
                  divu         a7, a5, a1
                  lui          a1, 701408
                  c.mv         s8, s11
                  c.sub        s1, s1
                  ori          tp, t6, 99
                  c.srai       a1, 31
                  c.addi       gp, -1
                  auipc        t5, 560909
                  c.sub        a4, a2
                  sltu         s9, a7, a1
                  srli         s3, t1, 3
                  xori         gp, t4, -186
                  c.and        a1, a5
                  xor          a0, t2, s3
                  mulhu        gp, a6, gp
                  c.xor        a4, a0
                  c.slli       t2, 3
                  c.and        a0, a1
                  c.nop
                  div          a2, a6, t2
                  add          t3, s4, tp
                  c.addi       t5, -1
                  sltiu        a7, t5, -1545
                  sll          t1, s9, s0
                  remu         s0, t6, t6
                  xori         a6, s6, -775
                  c.sub        s0, s1
                  mul          s2, t2, t5
                  csrrw        a1, 0x340, s0
                  mulhsu       s0, t4, s2
                  divu         s0, zero, a7
                  sra          s1, s4, a1
                  addi         a6, t2, 1779
                  c.mv         t2, s8
                  c.sub        a3, a0
                  div          t1, sp, s5
                  andi         tp, s11, 813
                  c.xor        a0, a3
                  slti         s10, zero, -1250
                  slli         s2, zero, 25
                  slti         t3, tp, 1959
                  xor          a6, zero, a2
                  c.xor        s1, a4
                  csrrc        s1, 0x340, a7
                  csrrw        s8, 0x340, t6
                  div          s0, gp, zero
                  div          t2, a4, gp
                  c.lui        s9, 4
                  mulhu        a7, s7, sp
                  c.slli       t1, 17
                  remu         a7, s10, sp
                  c.addi       a7, -1
                  mulhsu       s4, s11, a4
                  csrrc        t3, 0x340, s3
                  csrrci       t4, 0x340, 0
                  c.addi       s3, -1
                  sub          t3, t4, t1
                  mulhsu       s0, s5, a0
                  add          ra, zero, s5
                  nop
                  c.slli       a3, 22
                  nop
                  c.mv         s7, a5
                  c.lui        s8, 4
                  slti         s8, a2, -1460
                  add          a6, s3, s0
                  csrrci       t3, 0x340, 6
                  xori         s2, s9, -1533
                  c.srli       a0, 20
                  sltu         s3, t5, a7
                  xor          a0, s2, s11
                  rem          a0, a0, s10
                  c.lui        s2, 16
                  c.nop
                  sub          tp, t0, ra
                  c.xor        a1, a1
                  mulhsu       t1, a1, a4
                  mulhsu       t1, a6, gp
                  sll          s0, s2, zero
                  srl          a7, s3, zero
                  c.slli       s6, 16
                  andi         s4, s1, -927
                  and          s1, s1, t1
                  auipc        a0, 450488
                  add          s1, t0, t0
                  csrrsi       ra, 0x340, 0
                  mulhsu       s2, t6, a1
                  c.xor        a2, a2
                  or           t4, a0, t1
                  andi         ra, t4, -1908
                  c.or         a1, a0
                  srl          t2, s6, a0
                  c.lui        s7, 8
                  csrrci       s7, 0x340, 17
                  csrrsi       s2, 0x340, 24
                  c.srai       a3, 19
                  rem          s6, tp, s8
                  c.srli       s0, 16
                  sub          a2, s7, a7
                  csrrwi       t3, 0x340, 7
                  c.srli       a3, 6
                  and          zero, a1, ra
                  mul          ra, t1, t0
                  lui          t6, 441753
                  or           t1, t0, s3
                  div          s2, t0, t6
                  c.or         a4, s0
                  add          a2, t2, a5
                  xori         t2, t5, -489
                  c.or         s1, a3
                  slt          a2, t5, s1
                  c.sub        s0, a0
                  mulh         ra, s6, s7
                  c.xor        s1, a2
                  sltiu        t4, t0, -1417
                  sub          t2, ra, a0
                  and          t6, s11, t1
                  c.or         a0, s1
                  srai         a7, s2, 5
                  div          s11, ra, t3
                  slt          a1, s8, a1
                  slli         t1, s4, 2
                  add          a1, s1, gp
                  nop
                  nop
                  c.add        gp, t0
                  andi         zero, t3, 418
                  csrrwi       s3, 0x340, 8
                  div          t6, t4, a4
                  sra          ra, s1, gp
                  nop
                  mul          s3, a5, s9
                  xori         s6, s1, -90
                  auipc        s4, 179521
                  c.srli       a3, 28
                  sll          t2, a5, t0
                  srli         s1, t2, 28
                  mulhu        s10, s7, t2
                  add          ra, ra, s11
                  csrrsi       s10, 0x340, 0
                  add          s10, a2, s0
                  c.andi       a0, 3
                  c.addi       s4, 28
                  c.mv         t1, sp
                  c.xor        a4, s0
                  mulh         ra, s3, zero
                  c.andi       a0, 28
                  andi         a4, t3, -28
                  slli         ra, s5, 15
                  sub          s6, s10, t6
                  c.andi       s1, 10
                  xori         a7, ra, 754
                  c.add        a3, s6
                  sltiu        s0, ra, -488
                  c.sub        s1, a1
                  csrrci       s3, 0x340, 26
                  divu         a0, s9, t5
                  nop
                  srl          gp, a4, s5
                  csrrwi       s6, 0x340, 20
                  srli         a1, s4, 20
                  sub          a2, a7, s3
                  c.andi       a1, 5
                  slt          a1, s7, a5
                  addi         zero, s4, 828
                  add          zero, s5, s11
                  c.mv         s0, s7
                  slli         s11, sp, 26
                  mulhsu       t4, s9, s7
                  c.and        a2, a0
                  c.andi       a3, 8
                  csrrc        a3, 0x340, t5
                  c.add        a6, t2
                  c.li         s10, 8
                  slt          t6, a0, a1
                  c.xor        a4, s0
                  csrrc        t2, 0x340, t1
                  mulhu        t3, t3, s3
                  div          s8, t4, zero
                  c.nop
                  c.lui        s8, 25
                  mulhsu       a2, s2, a2
                  mulhsu       a1, zero, t4
                  csrrc        t3, 0x340, t6
                  c.addi       s10, 26
                  csrrsi       a4, 0x340, 0
                  andi         a3, s11, -1199
                  xor          a0, sp, s7
                  ori          s4, t3, 34
                  slli         s0, s6, 3
                  csrrci       a2, 0x340, 15
                  slli         s2, gp, 19
                  nop
                  nop
                  csrrs        a1, 0x340, zero
                  c.mv         s7, s3
                  mulhsu       a2, a4, t5
                  srl          zero, s7, t6
                  mulh         t2, t6, t5
                  c.andi       a0, 18
                  sra          a1, s6, s11
                  srai         t0, s7, 7
                  ori          zero, a2, -699
                  xori         t0, t0, -780
                  c.andi       a1, 3
                  sltu         a7, s9, t4
                  srl          a0, a4, a7
                  srl          t0, s9, a7
                  c.addi       s6, -1
                  c.mv         tp, s5
                  sll          s1, t6, t5
                  srli         s8, s10, 31
                  lui          a1, 402361
                  sra          s8, s8, s1
                  andi         s1, s4, 418
                  csrrsi       s8, 0x340, 0
                  c.srai       a4, 9
                  sltu         gp, a1, t5
                  c.addi       a3, -1
                  xori         zero, t2, -1957
                  c.addi       t4, -1
                  srai         s7, t3, 11
                  remu         t0, s6, s5
                  ori          a7, s0, 1198
                  nop
                  c.and        s1, a4
                  slti         t6, gp, -1175
                  csrrwi       zero, 0x340, 9
                  csrrsi       t5, 0x340, 0
                  c.srli       s0, 23
                  slti         t0, s4, -2030
                  sll          s1, s4, tp
                  c.li         t1, 19
                  c.sub        a4, a1
                  rem          t0, s8, a4
                  div          s3, a5, s6
                  csrrs        a1, 0x340, zero
                  auipc        s2, 338290
                  mulhu        t1, a3, ra
                  c.srli       a1, 13
                  sltu         t1, tp, tp
                  sltu         t0, a0, gp
                  csrrs        zero, 0x340, s5
                  srl          s9, s0, ra
                  c.xor        a4, a4
                  slli         t1, a2, 19
                  c.mv         a3, s8
                  sub          zero, s10, zero
                  srai         t6, t0, 20
                  c.nop
                  lui          a4, 694180
                  slli         t2, ra, 16
                  sub          s10, sp, s6
                  csrrci       a3, 0x340, 0
                  c.sub        a2, a1
                  csrrwi       zero, 0x340, 5
                  xor          s11, a7, a5
                  and          s10, sp, zero
                  c.slli       t0, 8
                  c.sub        s0, a1
                  sltu         s8, t6, a0
                  c.or         a0, a4
                  srai         ra, a2, 17
                  csrrw        s9, 0x340, a3
                  csrrs        s6, 0x340, s8
                  c.nop
                  c.nop
                  c.xor        a4, a3
                  csrrwi       s10, 0x340, 30
                  csrrs        a4, 0x340, zero
                  ori          s3, t2, 1281
                  c.or         s0, a1
                  csrrwi       ra, 0x340, 9
                  lui          s2, 863483
                  c.addi       t1, 6
                  andi         tp, t3, 408
                  addi         s9, s10, 686
                  c.addi       a2, 13
                  nop
                  c.or         a2, a4
                  sub          s6, a0, a2
                  sltu         t3, a2, s7
                  csrrsi       a0, 0x340, 0
                  srai         a4, a1, 8
                  lui          s9, 946145
                  csrrci       s3, 0x340, 0
                  c.nop
                  xor          a2, zero, a7
                  c.andi       a2, -1
                  add          s6, a1, s0
                  csrrwi       tp, 0x340, 26
                  c.or         a0, s0
                  c.and        s0, a3
                  c.add        s3, s6
                  xor          a7, t1, s10
                  slt          t5, a7, a6
                  c.srai       a3, 13
                  lui          s2, 20511
                  csrrs        a6, 0x340, sp
                  c.li         s1, -1
                  c.addi       a3, 2
                  csrrci       a0, 0x340, 10
                  c.or         s1, a1
                  mulhu        t6, s10, ra
                  addi         a3, sp, -1504
                  c.andi       a0, -1
                  sll          s4, s7, a7
                  c.and        s0, a4
                  mulh         a0, t4, gp
                  xor          t5, t6, a1
                  c.add        s3, s2
                  and          a6, zero, a4
                  c.and        a0, a2
                  xori         t3, gp, 1142
                  c.nop
                  xori         s2, gp, 1942
                  slt          s7, zero, ra
                  c.xor        a2, a3
                  c.lui        tp, 18
                  csrrci       t1, 0x340, 0
                  rem          s7, ra, s1
                  xor          a3, s6, s0
                  addi         s7, s9, 1120
                  srli         a7, gp, 10
                  xori         s7, a6, 183
                  slti         s0, a0, -67
                  csrrw        a2, 0x340, s1
                  remu         tp, a4, t4
                  csrrwi       a3, 0x340, 27
                  or           s11, t2, t1
                  c.add        a6, sp
                  slt          s10, s7, s3
                  div          s10, s3, s0
                  xor          s4, a5, s6
                  srl          s0, gp, t0
                  addi         t6, s6, -449
                  srli         s11, t0, 21
                  slli         t1, zero, 16
                  or           t2, t4, a3
                  auipc        t0, 485940
                  c.li         a7, -1
                  srai         a2, a7, 9
                  div          t3, s0, gp
                  csrrc        a4, 0x340, t4
                  c.or         a0, a4
                  c.li         s8, -1
                  sub          t4, s5, a5
                  mul          s3, s1, a0
                  c.and        a3, a5
                  c.andi       a0, -1
                  csrrsi       s6, 0x340, 0
                  nop
                  nop
                  c.addi       t6, -1
                  c.sub        s0, a5
                  nop
                  csrrc        a7, 0x340, a2
                  c.li         tp, -1
                  csrrsi       s6, 0x340, 26
                  add          t3, t3, zero
                  c.srai       a1, 24
                  srli         s9, s2, 2
                  slli         s1, a7, 15
                  c.li         a1, 13
                  csrrwi       t2, 0x340, 8
                  addi         t4, t0, -936
                  c.srai       a1, 12
                  and          s8, sp, s4
                  c.add        t2, sp
                  remu         s8, t1, s8
                  mulhsu       t5, t5, s4
                  xori         a4, a4, 2016
                  sub          gp, a7, a2
                  or           s6, a3, t1
                  slti         a2, s8, 1193
                  c.srli       a3, 13
                  add          a4, zero, gp
                  nop
                  c.addi       s0, 6
                  c.xor        a0, s1
                  sub          t3, s9, a6
                  c.mv         a2, s0
                  srai         s9, t1, 25
                  lui          s8, 333124
                  c.mv         s1, s8
                  andi         t6, s4, 1247
                  sra          t5, t0, a3
                  xor          tp, a0, s10
                  or           t4, gp, t4
                  csrrw        a7, 0x340, t6
                  mulh         t1, s10, a3
                  xor          a4, a1, t1
                  csrrw        s3, 0x340, s11
                  sltiu        s3, a1, -949
                  mulhu        s3, s1, a5
                  c.or         a3, a4
                  csrrs        s7, 0x340, zero
                  c.sub        s1, a4
                  csrrc        s2, 0x340, zero
                  and          zero, s9, a2
                  xori         s1, t2, -1842
                  slt          a3, s1, tp
                  xori         s1, s6, -1007
                  c.and        s1, a1
                  sra          s8, t6, s11
                  c.or         s0, a4
                  c.lui        a0, 23
                  sltiu        t4, t4, 378
                  slli         s3, t2, 21
                  or           a1, gp, t0
                  add          t4, gp, s5
                  c.andi       a1, 28
                  add          t1, gp, sp
                  sra          t2, s11, s3
                  auipc        t6, 261538
                  csrrw        s11, 0x340, a7
                  xori         s2, s0, -221
                  csrrwi       t5, 0x340, 6
                  c.li         tp, -1
                  c.or         a4, a5
                  slli         s9, a4, 18
                  csrrw        s4, 0x340, a0
                  mulhu        a1, zero, s10
                  sltiu        a4, t6, -1883
                  remu         a7, s4, t3
                  slti         s4, s6, -654
                  andi         ra, s1, 869
                  rem          a1, s4, a4
                  rem          s8, a0, t5
                  c.slli       s8, 31
                  c.sub        a3, s0
                  sltiu        a2, t2, 1467
                  csrrci       t1, 0x340, 0
                  slli         t5, ra, 10
                  c.xor        a1, a1
                  csrrwi       t1, 0x340, 22
                  mul          t1, t5, s0
                  or           a0, s11, s2
                  slli         a2, s11, 22
                  sltu         a2, a3, a1
                  c.li         a4, -1
                  div          t5, s8, t6
                  xor          s10, s2, tp
                  csrrs        s11, 0x340, gp
                  ori          s10, s3, 1837
                  mulh         a0, ra, a7
                  addi         gp, t0, 670
                  mulh         tp, t2, s5
                  c.sub        a2, a3
                  sll          tp, s5, a1
                  mulh         s4, s9, s2
                  or           s0, ra, gp
                  mul          s1, s1, t2
                  c.li         a4, -1
                  div          gp, s11, s8
                  c.srli       a2, 11
                  sltu         t3, s9, a0
                  sll          s7, s7, a2
                  srai         s2, s0, 6
                  andi         s0, t4, 1256
                  c.add        a3, s10
                  auipc        tp, 754633
                  csrrsi       a0, 0x340, 11
                  remu         ra, ra, zero
                  mulhu        t1, t1, s8
                  xor          t4, s10, t5
                  sltu         s0, s3, sp
                  c.andi       a2, 15
                  mulhu        a2, s7, t1
                  srai         a1, s7, 8
                  c.andi       s1, 5
                  srai         a0, zero, 17
                  divu         a6, s0, gp
                  c.xor        s0, s0
                  c.li         a6, 9
                  c.li         s6, 18
                  mulhu        t2, gp, ra
                  csrrs        s1, 0x340, zero
                  slti         a6, s7, 1035
                  and          a1, s8, t4
                  sub          a2, t0, s8
                  srai         t0, ra, 31
                  addi         ra, s5, -419
                  csrrci       t6, 0x340, 0
                  xor          gp, t1, a5
                  slti         s3, a5, -404
                  div          zero, s0, t2
                  xor          a2, a7, t1
                  csrrsi       ra, 0x340, 2
                  c.nop
                  mulhsu       a6, t0, s6
                  csrrci       a4, 0x340, 0
                  add          t1, s4, t0
                  remu         a0, a7, sp
                  c.srli       a3, 3
                  c.add        s8, t5
                  addi         t0, s7, -1558
                  c.srai       a3, 19
                  remu         s9, a0, t0
                  c.andi       a1, 10
                  mulh         t2, t5, s11
                  sltu         zero, s0, s8
                  slli         zero, s6, 17
                  mulhsu       t3, s11, a3
                  csrrc        t1, 0x340, zero
                  c.srai       a2, 7
                  c.and        a2, a1
                  nop
                  auipc        a1, 990906
                  auipc        ra, 662333
                  addi         t0, s9, 34
                  csrrwi       s9, 0x340, 25
                  remu         t2, a0, s0
                  c.andi       a2, -1
                  c.li         t2, -1
                  sra          t2, s11, a7
                  rem          t5, t0, s4
                  c.add        t5, t1
                  div          a4, a7, a0
                  c.li         ra, 26
                  sltiu        t0, a7, 1565
                  remu         s6, s3, s4
                  c.nop
                  mulh         t6, a4, t3
                  xori         s7, a6, -599
                  or           s11, gp, t1
                  csrrwi       s7, 0x340, 31
                  c.and        a1, a4
                  sltiu        s11, s8, 1258
                  slt          a0, s9, t5
                  csrrw        a3, 0x340, s5
                  csrrs        t6, 0x340, s0
                  mulhu        t5, t2, s1
                  c.addi       s3, 14
                  c.srli       s1, 23
                  add          ra, t3, a1
                  srli         t5, tp, 10
                  rem          a7, t4, a3
                  add          t0, tp, zero
                  auipc        t0, 1015862
                  c.lui        a2, 19
                  csrrwi       t4, 0x340, 21
                  lui          s3, 849458
                  sll          a0, s5, gp
                  xor          s11, s5, a5
                  csrrs        s10, 0x340, zero
                  andi         gp, gp, 1217
                  c.lui        t6, 12
                  or           s11, gp, a2
                  c.or         s1, s1
                  mulhsu       s7, s8, a4
                  c.andi       s0, -1
                  sll          s8, s4, t4
                  c.li         a7, 31
                  sltiu        tp, s1, -1686
                  sltu         t2, s10, t2
                  mulhsu       s1, gp, a7
                  or           gp, t5, a5
                  div          s6, gp, s2
                  csrrwi       a6, 0x340, 6
                  c.li         s10, -1
                  sltiu        s6, a0, 1167
                  sltu         t4, s4, s9
                  c.mv         s6, a7
                  csrrc        t0, 0x340, zero
                  andi         s0, zero, 1902
                  xori         a2, a2, 1031
                  or           gp, sp, a1
                  slt          a3, a2, t1
                  c.or         a1, a2
                  mul          ra, s4, a3
                  rem          s8, a0, a4
                  c.slli       a6, 6
                  lui          t0, 700855
                  c.nop
                  xor          t0, ra, s9
                  auipc        s1, 268484
                  and          zero, a7, a2
                  c.srai       s1, 18
                  sll          t0, s1, t4
                  remu         ra, s4, t1
                  lui          t3, 138126
                  csrrci       ra, 0x340, 0
                  slli         gp, a1, 13
                  slt          a1, a5, s3
                  mulhsu       gp, a3, t5
                  nop
                  c.add        a3, s1
                  csrrw        t3, 0x340, a4
                  rem          s10, s7, t1
                  and          s1, ra, gp
                  xor          ra, s0, t4
                  c.addi       t0, 28
                  srli         t6, t5, 11
                  csrrwi       t1, 0x340, 24
                  auipc        t1, 94797
                  sll          a4, a5, s7
                  csrrci       s1, 0x340, 0
                  divu         s4, t0, t1
                  srli         tp, s3, 28
                  xori         t1, s1, 1429
                  sltiu        gp, a3, -1616
                  c.and        a2, a4
                  csrrc        a4, 0x340, zero
                  csrrw        t1, 0x340, a0
                  slli         s6, a1, 21
                  srai         s3, tp, 4
                  addi         a7, a2, 1837
                  xor          s9, a0, s5
                  divu         s4, s8, a4
                  srli         s3, t4, 28
                  srl          ra, s4, s0
                  or           a4, s2, a5
                  srl          s1, a4, s2
                  csrrs        s0, 0x340, zero
                  csrrw        t4, 0x340, s4
                  mulh         a4, t2, s6
                  csrrw        a2, 0x340, s2
                  c.li         tp, -1
                  lui          s8, 29370
                  c.and        a4, a1
                  mulhu        ra, s6, a6
                  c.add        a4, t2
                  csrrw        s6, 0x340, s6
                  slti         s7, sp, -1345
                  mul          s9, t3, t6
                  lui          t3, 329709
                  slli         tp, s2, 31
                  mulhsu       s10, s9, s1
                  csrrw        s11, 0x340, s11
                  add          gp, s5, s0
                  c.mv         a7, t0
                  mul          a7, s3, a6
                  c.xor        a0, a5
                  ori          a4, s1, -1394
                  auipc        a3, 922757
                  mul          ra, a6, s11
                  srai         zero, gp, 17
                  srl          s3, s5, a4
                  remu         a2, s6, s5
                  c.xor        a2, s0
                  csrrci       s9, 0x340, 24
                  c.srai       a4, 13
                  sltiu        s4, s9, -1732
                  divu         t2, t4, t5
                  srli         s3, t1, 20
                  sra          a2, tp, s1
                  or           a4, zero, sp
                  remu         s8, t6, t0
                  xori         gp, sp, 1410
                  slti         t3, a1, -1003
                  srai         a2, s8, 19
                  remu         gp, a6, tp
                  c.or         a1, a2
                  add          s2, t1, s2
                  csrrsi       s3, 0x340, 7
                  auipc        a0, 503091
                  mulhu        s6, s2, s7
                  csrrs        s8, 0x340, s9
                  c.srli       a3, 24
                  mul          s8, s11, s6
                  sub          zero, s2, a3
                  csrrc        zero, 0x340, ra
                  slti         s2, a5, 574
                  srl          t4, sp, s7
                  rem          s10, s3, t4
                  add          s6, t6, s6
                  srl          t6, s11, ra
                  addi         s3, ra, 916
                  xor          t1, t0, tp
                  c.add        a2, a0
                  c.sub        s1, a3
                  sub          t6, ra, tp
                  c.lui        a0, 29
                  ori          gp, s0, 1225
                  c.lui        t1, 30
                  slt          t5, s3, a7
                  andi         s1, s9, -1646
                  sll          t6, t6, s5
                  sub          t1, s11, a6
                  c.srai       a4, 10
                  slti         s7, a2, -1405
                  addi         s2, s7, -531
                  c.or         a0, a0
                  csrrc        gp, 0x340, zero
                  c.srai       a4, 1
                  c.li         s0, -1
                  mulh         ra, a5, s9
                  mulhsu       tp, s1, a6
                  c.add        a0, a2
                  csrrci       s1, 0x340, 20
                  auipc        s4, 1024792
                  csrrsi       t6, 0x340, 0
                  c.xor        a2, s0
                  c.nop
                  andi         s6, t5, 1960
                  c.lui        a7, 6
                  c.srli       a2, 22
                  csrrc        s2, 0x340, zero
                  mulh         t6, sp, s5
                  ori          ra, s2, 931
                  ori          s11, t2, 1562
                  c.sub        a4, s1
                  c.and        a2, a0
                  mulh         s2, a3, t0
                  mulhu        t1, t1, a3
                  c.addi       t3, 10
                  ori          a0, tp, -346
                  csrrsi       t0, 0x340, 0
                  ori          a7, a0, 985
                  ori          s1, t3, -904
                  csrrsi       t5, 0x340, 22
                  sub          a2, gp, ra
                  sltu         s10, sp, a2
                  sltu         a6, s8, tp
                  srli         zero, s4, 27
                  c.or         a1, s1
                  csrrci       zero, 0x340, 20
                  slt          ra, t5, t3
                  sltiu        t3, tp, 1166
                  csrrsi       gp, 0x340, 0
                  c.nop
                  sra          t3, t0, s9
                  srai         s0, zero, 26
                  auipc        t5, 336912
                  csrrsi       s3, 0x340, 0
                  srai         s2, a3, 4
                  csrrci       t6, 0x340, 0
                  csrrsi       s10, 0x340, 14
                  srli         a3, s11, 27
                  c.li         a1, -1
                  c.nop
                  c.sub        s0, a0
                  c.lui        t3, 29
                  rem          t4, tp, a3
                  divu         s7, s9, s5
                  slti         s3, zero, -582
                  c.srli       a1, 15
                  lui          s4, 462325
                  xor          s8, a1, a4
                  ori          s8, t5, 1439
                  slt          t2, a2, gp
                  csrrsi       t5, 0x340, 0
                  c.addi       s3, -1
                  sltu         s10, a2, a7
                  c.xor        a1, a5
                  csrrci       a3, 0x340, 30
                  nop
                  c.or         a3, a0
                  sub          s2, a4, s0
                  csrrw        s10, 0x340, zero
                  xor          tp, tp, t2
                  slli         a4, ra, 23
                  auipc        s11, 891536
                  c.slli       s3, 29
                  auipc        ra, 116889
                  sltu         s2, s5, t2
                  csrrs        s3, 0x340, t0
                  rem          s7, s3, s8
                  csrrsi       s3, 0x340, 0
                  c.or         a1, s1
                  mulhu        t0, t6, ra
                  c.nop
                  csrrci       s9, 0x340, 0
                  c.or         s1, a1
                  c.srli       a3, 19
                  csrrwi       s8, 0x340, 2
                  csrrw        a6, 0x340, t6
                  c.slli       s4, 7
                  sra          t1, s6, t0
                  csrrci       a7, 0x340, 0
                  c.lui        a2, 13
                  xor          t5, a6, t0
                  nop
                  csrrc        gp, 0x340, a4
                  mulh         gp, t1, a0
                  c.nop
                  csrrw        tp, 0x340, zero
                  c.lui        a4, 29
                  xor          s9, a4, sp
                  c.nop
                  c.sub        a4, a3
                  c.and        a1, s0
                  c.slli       s8, 17
                  c.mv         s10, tp
                  mulhu        s1, sp, a7
                  srli         ra, a2, 29
                  c.srai       a2, 4
                  srli         ra, s2, 9
                  c.addi       t3, 23
                  add          s8, s8, s4
                  c.xor        a4, a3
                  mulhsu       a6, s6, s9
                  srl          gp, t2, s8
                  ori          t1, t0, -1360
                  c.srli       a3, 27
                  slt          s7, t6, s2
                  c.and        a3, a4
                  xor          s11, s11, a3
                  srai         a6, a1, 30
                  c.sub        a3, a3
                  c.addi       t2, -1
                  sltu         t4, s10, t5
                  sltiu        a4, t4, -731
                  sra          t5, t2, a7
                  c.srli       s1, 16
                  c.xor        a1, a3
                  xori         s7, a1, 1306
                  csrrc        t4, 0x340, zero
                  xor          s9, a1, s11
                  c.add        a0, s10
                  c.srli       a2, 10
                  addi         a6, s5, 699
                  c.and        s0, s0
                  slti         t1, sp, -281
                  sra          t4, a6, a3
                  slli         a6, s5, 8
                  sll          s9, s0, s6
                  rem          t4, t4, s7
                  csrrsi       zero, 0x340, 12
                  divu         t1, s0, a0
                  c.and        s1, a3
                  slt          zero, tp, s10
                  c.sub        a4, a4
                  c.mv         a3, s7
                  sra          a3, s10, s4
                  xori         a4, t6, -696
                  slli         s2, gp, 11
                  slt          s8, s11, a0
                  csrrw        s6, 0x340, zero
                  xori         a0, s11, -2041
                  xori         t2, a0, -541
                  div          tp, gp, ra
                  csrrwi       a3, 0x340, 23
                  sltu         zero, zero, s3
                  sra          a4, s9, s5
                  auipc        s8, 703982
                  c.sub        a1, s1
                  divu         a6, a0, t2
                  csrrci       t3, 0x340, 0
                  or           zero, tp, s7
                  csrrwi       a4, 0x340, 22
                  sll          t1, t1, t2
                  sra          zero, a3, zero
                  sltiu        a6, t0, -1426
                  addi         a7, t3, -847
                  csrrc        a2, 0x340, zero
                  c.li         gp, -1
                  c.srai       s1, 25
                  srli         t2, s4, 2
                  mulhsu       s9, t0, tp
                  addi         s6, t5, -1668
                  csrrwi       s2, 0x340, 7
                  c.andi       a2, 22
                  remu         s6, a3, s1
                  csrrwi       s10, 0x340, 16
                  mulhsu       s1, t2, s2
                  remu         gp, t3, t1
                  sll          s10, sp, a1
                  csrrc        s9, 0x340, zero
                  c.slli       t3, 22
                  sltiu        a0, gp, 563
                  c.nop
                  c.mv         t1, t2
                  c.srli       a1, 8
                  mulh         zero, t0, s1
                  c.srli       a4, 19
                  slt          a0, tp, a1
                  c.andi       a0, -1
                  lui          s4, 983615
                  nop
                  divu         t0, gp, t4
                  sra          a3, a2, s2
                  c.nop
                  auipc        t6, 338244
                  csrrsi       t1, 0x340, 19
                  auipc        gp, 73203
                  srli         t5, t1, 11
                  c.or         a1, a1
                  c.lui        a4, 10
                  csrrw        t3, 0x340, s11
                  nop
                  or           tp, s9, s3
                  csrrc        s8, 0x340, a5
                  c.add        a2, s0
                  remu         s3, t1, a1
                  csrrsi       a3, 0x340, 17
                  mulhu        a1, t1, a2
                  c.and        s1, a2
                  addi         tp, s5, 380
                  nop
                  csrrs        a1, 0x340, ra
                  c.or         a0, s0
                  addi         a2, a0, 2034
                  c.and        a4, a0
                  srli         s8, t5, 11
                  sll          t5, tp, zero
                  c.add        a4, s5
                  mulhu        a3, s3, s11
                  sltiu        a0, ra, -170
                  c.mv         a7, t0
                  mulh         t0, s7, t6
                  slli         a7, ra, 13
                  csrrw        s4, 0x340, a7
                  c.add        a2, s7
                  csrrs        t0, 0x340, zero
                  slli         s4, a5, 17
                  srl          a7, s3, a1
                  c.mv         a1, a0
                  c.slli       s4, 24
                  rem          t6, a7, a1
                  csrrs        a7, 0x340, zero
                  sub          t2, s5, sp
                  c.add        s1, a2
                  c.sub        s1, a5
                  csrrc        ra, 0x340, t0
                  c.lui        s4, 2
                  c.xor        a0, s1
                  srli         zero, t1, 17
                  addi         a1, a0, 1200
                  csrrsi       zero, 0x340, 6
                  c.add        s4, sp
                  csrrci       s2, 0x340, 31
                  ori          a3, s4, -1900
                  srai         s1, s6, 5
                  slt          gp, a4, s11
                  div          s6, a3, s4
                  srl          a7, s10, a2
                  or           a2, t6, a4
                  sra          t3, s3, ra
                  nop
                  or           gp, a3, zero
                  and          a3, s8, a4
                  sll          a4, a7, s6
                  slli         a3, a7, 18
                  c.addi       gp, 7
                  c.and        a4, a1
                  sll          s4, s5, s10
                  slt          s2, gp, a7
                  c.addi       s7, -1
                  add          s4, a7, s10
                  rem          s2, t5, a1
                  xor          s10, s5, gp
                  nop
                  divu         t4, t2, ra
                  csrrwi       t5, 0x340, 6
                  lui          s0, 573167
                  c.andi       a1, -1
                  xori         gp, gp, 298
                  slti         t5, s9, -137
                  csrrci       zero, 0x340, 18
                  c.sub        a4, a2
                  c.srli       s1, 27
                  c.slli       s4, 12
                  divu         s4, s5, s1
                  remu         t4, s6, s9
                  ori          s10, s4, -1622
                  c.andi       a0, 24
                  srl          s1, s5, t5
                  slli         s7, s6, 8
                  c.or         a4, s1
                  sltiu        s6, a5, -1180
                  c.sub        s0, a0
                  mul          gp, ra, sp
                  csrrc        a1, 0x340, zero
                  sub          s7, s5, zero
                  c.xor        s0, s1
                  sll          s3, s4, a0
                  srli         t6, s8, 4
                  sra          t1, a7, s1
                  or           a0, t0, t5
                  add          s11, s0, s5
                  c.srai       a1, 23
                  c.addi       s4, -1
                  divu         s6, s0, zero
                  xori         a0, a6, -1801
                  nop
                  sra          a2, gp, gp
                  and          s6, t5, t3
                  c.sub        a1, a0
                  c.slli       s1, 18
                  c.andi       a3, 15
                  c.xor        s0, s0
                  c.srai       a0, 4
                  or           a2, a1, t6
                  c.slli       t0, 25
                  c.li         t0, -1
                  c.mv         s11, t6
                  rem          s9, a6, s4
                  or           t4, a0, a5
                  auipc        t6, 804323
                  c.slli       s7, 7
                  or           a2, gp, t1
                  sltiu        s7, s6, -1274
                  srl          t5, sp, a6
                  and          s6, ra, s10
                  srai         a6, s0, 30
                  csrrsi       a1, 0x340, 0
                  csrrci       tp, 0x340, 28
                  sltu         s11, s8, t1
                  sltiu        a0, a2, -32
                  c.lui        t5, 31
                  csrrs        a1, 0x340, zero
                  sltu         s9, s8, a5
                  c.lui        a2, 21
                  slti         gp, a3, -1750
                  c.nop
                  slti         t2, t0, -1995
                  c.srai       a4, 28
                  csrrwi       s1, 0x340, 31
                  c.srai       a2, 20
                  csrrwi       s8, 0x340, 31
                  auipc        a3, 182425
                  mulhu        a7, t1, s3
                  csrrc        s10, 0x340, a5
                  addi         s3, sp, 1401
                  mulh         tp, a2, a5
                  csrrw        t6, 0x340, tp
                  c.andi       a4, 25
                  c.xor        a2, a3
                  mul          t1, a6, t5
                  sub          a4, zero, s4
                  c.nop
                  slti         t3, s9, -1046
                  mulh         s8, gp, a0
                  or           s8, a4, tp
                  sra          t5, a1, t1
                  and          s8, s10, t1
                  c.lui        a4, 30
                  mulhu        s11, s5, tp
                  add          s4, t3, t2
                  lui          a6, 322470
                  mulhsu       s2, t4, sp
                  srli         t2, s0, 1
                  csrrsi       t4, 0x340, 0
                  addi         s10, s11, -117
                  mulh         a7, s10, t1
                  csrrs        t4, 0x340, s9
                  lui          s0, 902908
                  c.mv         t5, s9
                  csrrsi       s6, 0x340, 0
                  c.add        t1, a2
                  xori         s1, s1, -465
                  auipc        s4, 849319
                  add          t6, s7, s10
                  remu         t6, s6, s6
                  srai         s3, a2, 11
                  srai         s0, s5, 27
                  andi         ra, s0, -1244
                  lui          t1, 293844
                  c.or         a4, a2
                  nop
                  sll          s1, a4, s6
                  nop
                  mulhu        a7, s8, t4
                  andi         s6, sp, -1447
                  mulhsu       a1, a4, t6
                  c.nop
                  c.addi       t6, -1
                  srl          s10, zero, s0
                  mulhu        a0, t1, a5
                  remu         a1, t1, t2
                  csrrsi       a6, 0x340, 0
                  div          t3, t2, t0
                  csrrs        t5, 0x340, s8
                  ori          s8, t1, -1688
                  mulh         s10, s9, s3
                  c.addi       s2, -1
                  c.lui        t4, 19
                  ori          s3, s0, -967
                  slt          s4, s6, a0
                  add          t6, tp, t0
                  c.sub        a0, a4
                  nop
                  sll          t5, s5, gp
                  xori         t6, a1, 627
                  slti         a7, t3, -981
                  xor          a3, a4, s4
                  csrrc        s7, 0x340, zero
                  auipc        t4, 858171
                  xor          a4, s4, a6
                  addi         t6, s6, 234
                  c.and        a0, s0
                  c.slli       t3, 23
                  c.slli       s6, 5
                  c.or         a2, s0
                  sll          a1, a6, s10
                  c.add        t6, a4
                  srl          t5, s3, s10
                  mulhsu       a0, s8, a2
                  and          t0, gp, a3
                  csrrw        ra, 0x340, t5
                  mulhu        s9, a1, sp
                  mulhsu       a3, tp, a5
                  c.lui        a2, 9
                  c.mv         a2, gp
                  c.mv         t1, t4
                  srli         s0, t3, 14
                  mulhsu       t4, a2, gp
                  sra          a3, a7, sp
                  slt          a4, s1, s3
                  xori         s4, a5, -440
                  csrrci       a4, 0x340, 0
                  csrrw        s3, 0x340, a7
                  csrrsi       t6, 0x340, 11
                  srai         s3, ra, 20
                  mulhsu       s8, tp, t0
                  addi         s3, zero, 482
                  c.add        t2, s11
                  csrrwi       s8, 0x340, 1
                  c.addi       a1, -1
                  c.srai       a4, 22
                  mulhsu       a3, t5, t5
                  addi         a0, t0, 1028
                  c.slli       s10, 17
                  xor          t5, tp, s9
                  ori          t5, s7, -256
                  sra          tp, a2, t4
                  mulhsu       s11, t3, s11
                  mulh         a3, s2, a7
                  c.lui        s3, 20
                  csrrsi       s0, 0x340, 0
                  ori          a1, a2, -1951
                  srai         t3, s7, 11
                  csrrc        t5, 0x340, zero
                  c.srai       a1, 24
                  sra          s9, a6, t5
                  c.and        s0, a0
                  c.srli       a3, 24
                  add          s2, s2, a2
                  mulhsu       s0, s5, t4
                  divu         s6, s2, s8
                  nop
                  or           s10, sp, t2
                  c.srli       s0, 23
                  sltu         t5, t6, ra
                  c.andi       a2, 11
                  slt          s4, t5, tp
                  c.slli       a3, 25
                  c.and        a3, a0
                  addi         t2, t3, 1658
                  add          s1, ra, s8
                  c.add        s0, s8
                  add          t0, t1, a6
                  c.sub        a1, s0
                  csrrwi       t4, 0x340, 29
                  c.and        s1, s1
                  c.slli       s7, 5
                  slti         t2, tp, 2027
                  andi         s1, s5, 1254
                  c.li         a2, -1
                  c.slli       a1, 19
                  mul          a3, t5, t2
                  c.li         s1, 10
                  nop
                  c.and        a0, s0
                  c.andi       a3, 7
                  auipc        t1, 789518
                  c.nop
                  csrrsi       s4, 0x340, 27
                  c.nop
                  c.sub        a3, a5
                  mulh         t6, s10, t6
                  remu         t2, a4, s4
                  mulhu        a1, a6, s5
                  c.add        a7, s0
                  mulhu        s8, t5, sp
                  csrrsi       a4, 0x340, 2
                  csrrs        ra, 0x340, a4
                  div          t1, s8, t1
                  mulhsu       a7, s1, a4
                  slli         s3, a5, 5
                  c.add        a2, s1
                  add          s2, a7, t5
                  csrrw        t1, 0x340, t3
                  addi         a0, sp, 188
                  remu         s4, s11, s4
                  divu         s1, a4, s10
                  c.or         a1, a4
                  and          ra, a0, s5
                  sra          s3, t5, gp
                  sub          s3, s7, s9
                  sltu         s7, a3, a7
                  c.slli       s3, 5
                  csrrsi       a1, 0x340, 0
                  or           s3, gp, a2
                  remu         s3, s2, s1
                  auipc        tp, 557801
                  csrrsi       s8, 0x340, 0
                  c.andi       a4, 16
                  c.srai       a2, 7
                  csrrs        s3, 0x340, zero
                  csrrci       s6, 0x340, 0
                  csrrc        s1, 0x340, s7
                  csrrci       s10, 0x340, 0
                  auipc        t5, 875837
                  lui          gp, 962000
                  csrrci       a3, 0x340, 7
                  nop
                  xor          ra, t3, s4
                  c.addi       s11, -1
                  addi         t2, s0, -1143
                  srai         s0, t2, 16
                  srl          tp, a0, a4
                  csrrsi       s8, 0x340, 3
                  csrrci       a6, 0x340, 0
                  sltiu        s0, s0, 1618
                  c.and        a2, s0
                  c.srai       s1, 16
                  c.slli       s7, 17
                  c.andi       a4, -1
                  c.andi       a3, 25
                  ori          s10, zero, 577
                  mulhu        a2, t4, t1
                  slt          a0, a0, tp
                  mulh         s9, ra, t1
                  auipc        a0, 765031
                  c.srai       a3, 31
                  c.nop
                  lui          a0, 269669
                  csrrw        t4, 0x340, t0
                  div          a4, s11, t0
                  srl          s4, s3, tp
                  lui          s6, 516495
                  ori          tp, s10, 974
                  nop
                  csrrc        t4, 0x340, s7
                  sll          s9, t3, s11
                  c.addi       t5, -1
                  csrrw        t0, 0x340, a0
                  xori         ra, t3, 423
                  csrrw        t1, 0x340, gp
                  xor          a0, gp, t1
                  csrrwi       t4, 0x340, 0
                  csrrs        gp, 0x340, a1
                  srai         a0, a7, 18
                  c.srai       a0, 14
                  sll          ra, a0, a5
                  sll          t4, t5, t2
                  csrrs        s2, 0x340, s3
                  sub          a6, s7, t4
                  c.and        a3, a5
                  c.lui        a7, 8
                  c.and        a3, a5
                  csrrsi       gp, 0x340, 24
                  auipc        s9, 271586
                  divu         s10, s5, a3
                  slt          t3, a4, s4
                  c.nop
                  div          s2, s3, ra
                  srl          t4, a4, a6
                  c.add        a7, a7
                  rem          tp, a0, s11
                  c.lui        a4, 5
                  c.or         a3, s1
                  divu         a2, s9, a6
                  c.and        a0, a0
                  divu         s7, t3, t6
                  and          tp, a0, ra
                  srli         s1, s8, 11
                  c.srli       s0, 12
                  div          s0, s2, a2
                  sll          s2, s9, sp
                  sub          a7, s4, s3
                  csrrci       a3, 0x340, 0
                  xori         s1, s3, -454
                  remu         zero, s9, ra
                  mulh         ra, s2, t0
                  csrrci       gp, 0x340, 0
                  c.srli       s1, 29
                  nop
                  c.andi       a3, 13
                  slt          a6, s8, s5
                  sub          t2, a0, t1
                  rem          s8, s0, s1
                  divu         s2, s10, s5
                  sub          t4, t3, s0
                  sltiu        a6, a2, -1693
                  slli         tp, s7, 15
                  slli         s4, gp, 31
                  sub          a7, t5, a5
                  c.srli       a0, 12
                  slli         s7, s0, 3
                  sltu         t4, t1, t1
                  c.or         s0, a4
                  auipc        s2, 276144
                  div          a2, zero, s9
                  remu         ra, t6, s0
                  add          s11, a0, t3
                  mul          t6, sp, gp
                  sltu         s0, a5, t1
                  slti         a1, s1, -1133
                  srli         t0, ra, 6
                  divu         gp, zero, t4
                  and          a4, a4, ra
                  c.nop
                  xori         tp, t1, 1835
                  auipc        s8, 314858
                  c.slli       a3, 1
                  slli         t0, a0, 8
                  mulh         t1, a0, t5
                  remu         a1, a5, tp
                  csrrci       t3, 0x340, 5
                  c.andi       s1, 26
                  c.add        s8, s4
                  c.mv         a7, s2
                  mul          a2, s0, s0
                  slti         a1, t5, -1658
                  mulhsu       t4, a3, t6
                  slli         s10, t5, 16
                  c.mv         a7, s8
                  xori         s2, a2, -777
                  xori         t6, s9, 1758
                  nop
                  or           ra, a6, t0
                  mulh         t2, s4, s8
                  xori         s8, s2, -354
                  mulhu        s9, t3, s10
                  ori          a2, s7, 1769
                  slli         a1, a2, 8
                  xori         a4, s10, -1436
                  c.li         t4, 27
                  srli         t2, t1, 2
                  slt          t0, a7, a5
                  srai         t6, s7, 31
                  div          s10, t3, s3
                  csrrsi       s4, 0x340, 27
                  sltiu        s9, a0, -1775
                  sll          t4, a5, t5
                  mulhsu       s4, t4, s8
                  csrrs        tp, 0x340, t3
                  slt          s9, s3, a5
                  c.li         s11, 8
                  c.slli       s2, 9
                  divu         t4, t1, s10
                  csrrwi       s11, 0x340, 22
                  c.nop
                  div          t3, t6, s8
                  csrrw        s6, 0x340, t5
                  and          t1, s0, a0
                  slt          s2, t3, s9
                  addi         a7, t0, 226
                  and          a1, s5, t2
                  c.add        t5, a6
                  mulhsu       s11, s5, s8
                  remu         t1, s9, sp
                  mul          t4, gp, s1
                  csrrsi       s7, 0x340, 0
                  c.srai       a1, 19
                  sra          s8, s11, s3
                  c.xor        s0, a3
                  addi         s3, t4, -356
                  sub          t3, a1, s1
                  mulhsu       t5, s3, t0
                  addi         t5, s7, -187
                  csrrs        s6, 0x340, tp
                  c.sub        a3, a3
                  csrrs        a7, 0x340, zero
                  mulhu        t5, t1, a2
                  andi         s0, t0, -703
                  add          a0, s5, zero
                  add          ra, zero, s2
                  lui          s1, 305727
                  addi         s8, s0, -831
                  sll          s11, s7, ra
                  srli         s2, s9, 18
                  c.lui        a7, 20
                  ori          s7, ra, 865
                  xor          a0, t3, t2
                  div          a7, a2, s1
                  slt          t1, a7, s1
                  nop
                  mulhsu       s7, a2, s7
                  div          s10, t3, s5
                  ori          t3, s8, 1542
                  srai         t6, s5, 31
                  nop
                  csrrs        s2, 0x340, s1
                  c.addi       a6, -1
                  ori          s4, t2, 268
                  nop
                  and          a1, tp, t6
                  xor          t3, s9, tp
                  sra          a6, zero, t0
                  xori         s7, a1, 993
                  c.lui        a2, 11
                  c.srli       a0, 6
                  slt          s4, a1, tp
                  c.andi       a4, 10
                  mulh         s9, t3, s6
                  remu         s1, s8, zero
                  lui          gp, 976178
                  sra          s7, a2, t3
                  ori          t4, t2, -1245
                  slli         s3, t2, 26
                  c.lui        t5, 25
                  and          gp, a1, t1
                  mulhsu       ra, t2, a1
                  c.andi       a2, -1
                  sltiu        s6, s8, 1009
                  sltu         s9, ra, s2
                  c.add        s8, t0
                  ori          s1, s11, -119
                  sltiu        a7, tp, -356
                  sub          s9, a5, s4
                  sll          s3, zero, sp
                  mul          t0, gp, s8
                  or           s4, s10, s4
                  c.xor        a3, a4
                  csrrsi       s10, 0x340, 29
                  c.or         a4, a5
                  divu         t5, s6, a1
                  add          s9, t4, s1
                  c.li         t1, -1
                  c.li         t0, -1
                  mulh         s1, zero, t3
                  srai         t1, s11, 24
                  auipc        a1, 856911
                  c.nop
                  c.or         s1, a5
                  andi         t5, s2, 1982
                  c.nop
                  c.lui        s7, 14
                  csrrwi       s8, 0x340, 26
                  rem          t6, t1, s5
                  srl          s10, a0, s8
                  sltu         a6, s7, s0
                  c.sub        s0, a3
                  csrrc        a7, 0x340, zero
                  c.xor        a1, a4
                  c.or         s0, a3
                  auipc        s3, 52100
                  c.or         a0, a0
                  slt          zero, s8, a6
                  sltu         t6, ra, a2
                  rem          t2, a0, s4
                  csrrsi       a1, 0x340, 11
                  srli         s11, t5, 14
                  srli         s3, s1, 9
                  add          s10, a5, a3
                  divu         t1, s2, s6
                  c.or         a3, a5
                  mul          s6, s7, a4
                  c.xor        a1, a1
                  div          t1, s9, a0
                  xori         zero, s11, 1655
                  nop
                  c.nop
                  div          t1, s10, sp
                  remu         s9, t1, zero
                  c.srli       s0, 8
                  add          s1, ra, a3
                  sltiu        t2, tp, 1857
                  nop
                  c.srli       a1, 23
                  c.andi       a2, 8
                  c.srli       a2, 29
                  c.xor        s1, a0
                  nop
                  slli         zero, s4, 6
                  c.slli       a1, 27
                  c.xor        s0, a5
                  c.slli       t4, 31
                  c.or         a1, a4
                  c.andi       s1, 26
                  auipc        t0, 342479
                  xori         t5, t6, -97
                  c.mv         a2, gp
                  ori          s4, s11, 1593
                  nop
                  div          s10, s3, a6
                  slt          a7, t3, s0
                  c.add        gp, s10
                  sll          a6, a4, a6
                  c.lui        s6, 23
                  c.addi       ra, 28
                  and          s0, s5, t0
                  c.sub        s0, a2
                  c.lui        s6, 27
                  divu         a7, a2, s6
                  slti         t3, tp, 98
                  csrrc        t1, 0x340, zero
                  mul          s0, tp, s2
                  xor          s9, a7, t0
                  div          s8, s2, t3
                  slli         s9, s11, 6
                  c.srai       s1, 28
                  c.srai       a0, 3
                  add          s9, s9, t2
                  or           a3, s6, s0
                  csrrwi       s3, 0x340, 31
                  c.sub        s1, s0
                  rem          gp, t0, s8
                  srli         a4, gp, 27
                  c.slli       s1, 23
                  andi         s0, zero, 263
                  xori         a6, a5, -1204
                  mulhsu       s6, s4, s2
                  c.lui        a2, 22
                  c.or         a2, a4
                  sra          a6, s10, a3
                  c.mv         t1, gp
                  lui          s3, 12140
                  srli         a3, s4, 23
                  c.srai       a2, 15
                  c.addi       a0, -1
                  c.srli       a4, 11
                  sub          s1, s2, sp
                  c.srli       a2, 27
                  srai         s0, t0, 12
                  csrrw        a0, 0x340, a1
                  c.li         s6, -1
                  c.slli       t3, 9
                  csrrci       a3, 0x340, 31
                  xor          t6, s7, s10
                  slti         zero, s9, -824
                  csrrci       s6, 0x340, 0
                  srli         a1, tp, 3
                  c.srai       s1, 6
                  nop
                  slt          zero, a4, t4
                  add          s9, s5, a1
                  mulh         s7, ra, t5
                  srai         s7, t5, 13
                  c.li         tp, -1
                  c.slli       s7, 11
                  c.slli       s7, 30
                  xor          t4, a4, t1
                  nop
                  slti         s4, s5, 2008
                  csrrsi       s2, 0x340, 5
                  csrrs        a4, 0x340, zero
                  c.srli       a1, 5
                  csrrc        s10, 0x340, zero
                  div          t5, s11, s0
                  slt          s11, s10, gp
                  c.addi       s0, 10
                  sra          a2, a5, s4
                  slti         a4, a3, -429
                  remu         t5, s6, t6
                  csrrsi       a6, 0x340, 4
                  mulhu        t5, s11, s2
                  remu         a3, t6, t5
                  ori          s0, t2, -429
                  slli         s11, a4, 28
                  c.slli       s9, 27
                  slti         t3, a3, -1069
                  c.lui        a1, 31
                  slti         tp, s10, -1459
                  csrrsi       s8, 0x340, 0
                  c.srli       a2, 21
                  xor          a2, a7, t2
                  c.add        t0, a2
                  srl          a4, a3, ra
                  div          s3, t3, s4
                  csrrc        t2, 0x340, zero
                  ori          a7, s7, 10
                  remu         t5, s9, s4
                  c.and        a4, s1
                  slli         t3, s2, 4
                  csrrwi       t4, 0x340, 10
                  mulh         s11, a2, s1
                  sll          a6, s10, t6
                  c.nop
                  ori          s2, a6, 1703
                  xor          a7, s0, s11
                  xori         t5, s5, 965
                  addi         s6, s4, 1170
                  c.or         a1, a0
                  srai         s9, a2, 2
                  auipc        s2, 591133
                  c.andi       s0, -1
                  c.xor        s0, s1
                  csrrci       t4, 0x340, 0
                  and          a3, a1, s3
                  csrrw        t3, 0x340, s9
                  divu         a6, t2, t3
                  xor          s0, s7, s4
                  sltiu        t0, s4, 1260
                  c.or         s1, a3
                  c.slli       s0, 21
                  mulh         s4, t5, a4
                  c.li         t5, 10
                  csrrsi       ra, 0x340, 0
                  c.add        t6, ra
                  c.srli       a4, 1
                  rem          a4, s9, a1
                  csrrw        s10, 0x340, a6
                  andi         a1, t6, 669
                  c.lui        ra, 11
                  c.xor        a2, a1
                  c.add        s3, s1
                  sra          gp, a0, t4
                  andi         s10, a0, 1038
                  mulhu        zero, s5, s9
                  c.or         a1, s1
                  c.slli       t4, 14
                  csrrs        gp, 0x340, s11
                  mul          t3, s5, t4
                  c.li         t2, 21
                  ori          s6, a1, 345
                  c.srli       a2, 30
                  addi         tp, t4, 1709
                  mulhsu       t5, a6, t0
                  csrrci       t4, 0x340, 0
                  ori          t2, a3, -198
                  c.nop
                  nop
                  c.andi       a4, 9
                  auipc        s7, 413337
                  c.srli       s0, 30
                  divu         a6, s3, s4
                  ori          s8, t3, -1826
                  c.andi       a1, -1
                  rem          s1, a2, a2
                  c.and        a3, s1
                  xor          s1, s10, s8
                  sub          a7, s5, t5
                  remu         s2, a6, s5
                  addi         a7, s11, 193
                  c.srli       s0, 10
                  xor          t6, s1, s0
                  c.srli       a2, 15
                  ori          a2, zero, 707
                  c.andi       s1, -1
                  csrrs        t6, 0x340, zero
                  c.mv         t4, t0
                  and          s3, tp, t2
                  csrrw        s6, 0x340, ra
                  c.slli       t1, 27
                  c.nop
                  sltu         a0, s8, s2
                  c.or         a1, a5
                  or           s2, gp, a5
                  slti         s8, s9, -243
                  addi         t3, t3, 1235
                  c.sub        a1, s1
                  lui          a4, 623291
                  sll          a1, a3, s2
                  slti         t6, s9, -260
                  srl          s3, s10, t5
                  auipc        t5, 155513
                  csrrs        s9, 0x340, s11
                  c.andi       s0, 11
                  srl          t0, a5, a0
                  c.lui        a6, 13
                  mulhsu       t6, t5, a3
                  rem          s7, a1, a3
                  sltu         t5, t1, t4
                  c.slli       t4, 30
                  rem          a7, t2, s11
                  mulhsu       s1, s7, gp
                  c.lui        s4, 2
                  csrrsi       zero, 0x340, 0
                  remu         t2, a6, a4
                  sub          s9, a1, t5
                  div          s2, t0, tp
                  ori          a1, s3, -1997
                  mulhsu       s11, t4, s5
                  csrrsi       s8, 0x340, 15
                  mul          a1, a3, t0
                  or           s3, a5, s10
                  and          a1, t4, tp
                  csrrsi       s1, 0x340, 23
                  c.lui        s8, 27
                  sltu         s6, t1, a4
                  addi         s0, ra, 1349
                  nop
                  csrrwi       a6, 0x340, 26
                  slli         a6, gp, 17
                  c.srai       a4, 17
                  div          a4, a0, t4
                  csrrs        tp, 0x340, zero
                  xor          s11, s1, s3
                  ori          a7, s5, 270
                  andi         a4, a3, 1273
                  or           s4, a0, sp
                  c.mv         t1, a0
                  csrrwi       s11, 0x340, 7
                  mulhsu       s4, t3, s8
                  c.and        a1, a1
                  addi         t2, gp, -170
                  divu         a2, s11, t4
                  c.srai       a3, 1
                  slti         s10, t3, 1001
                  add          zero, t5, a4
                  mulhsu       s0, zero, a7
                  lui          gp, 874141
                  csrrc        s3, 0x340, a4
                  mulh         s2, a4, s10
                  sll          a1, s9, t5
                  c.add        s0, ra
                  rem          s2, a4, a7
                  andi         t6, s10, 573
                  c.slli       s8, 27
                  c.srai       a2, 5
                  c.srai       a2, 20
                  csrrwi       s3, 0x340, 18
                  lui          a6, 775270
                  csrrs        s4, 0x340, s5
                  c.lui        a1, 14
                  div          s6, a1, a5
                  slti         s11, s9, -1189
                  c.or         a4, a1
                  lui          t6, 45552
                  c.and        a4, a4
                  c.srli       a2, 27
                  nop
                  slli         s8, a2, 0
                  sltu         t6, t5, s9
                  or           ra, t4, t3
                  addi         s8, t2, -947
                  c.sub        a3, a2
                  or           a4, s3, t1
                  mulhu        tp, t6, t2
                  rem          tp, s10, a7
                  lui          a0, 238868
                  srai         s11, t3, 16
                  csrrs        gp, 0x340, zero
                  remu         t1, a5, gp
                  c.sub        a0, s0
                  addi         t5, s3, -1994
                  c.mv         s6, a4
                  sltiu        s7, a0, 1149
                  ori          t2, s11, -987
                  srai         s7, s8, 6
                  slli         ra, s4, 13
                  slli         ra, zero, 9
                  c.andi       a4, 28
                  lui          ra, 32150
                  sra          a2, a4, ra
                  slli         t6, s3, 15
                  sra          s10, s9, s9
                  andi         a2, s1, -935
                  mul          a7, t1, sp
                  c.srli       a4, 26
                  lui          a6, 141472
                  csrrsi       s10, 0x340, 25
                  divu         tp, s0, zero
                  sra          s2, t6, a7
                  mul          tp, t6, t3
                  csrrci       zero, 0x340, 14
                  sub          s0, gp, s7
                  c.and        a4, a3
                  ori          a1, s0, -101
                  auipc        s0, 45690
                  mul          s2, t6, a4
                  srai         s10, a6, 4
                  mul          a0, t2, t6
                  csrrwi       s7, 0x340, 11
                  xor          s8, t2, s5
                  xor          a7, a4, a5
                  mul          gp, ra, s3
                  and          s2, s10, a6
                  c.srli       a3, 16
                  c.sub        a1, a0
                  srai         t6, tp, 12
                  mul          s1, s9, t4
                  div          t3, a0, s3
                  csrrw        s11, 0x340, s10
                  mulhu        a6, a2, a1
                  csrrsi       s4, 0x340, 22
                  slti         s10, s3, -1978
                  c.srai       a0, 20
                  mulh         s11, sp, s4
                  csrrwi       t4, 0x340, 7
                  csrrci       a7, 0x340, 24
                  srl          a0, a7, s8
                  remu         s10, s0, t0
                  csrrw        t2, 0x340, t1
                  sll          s0, a0, a3
                  xor          t1, tp, s0
                  sltu         s10, t3, s2
                  c.nop
                  sltiu        t0, t3, 637
                  mulhu        a3, t6, a3
                  auipc        s7, 70429
                  remu         s9, t3, s0
                  csrrc        t2, 0x340, zero
                  rem          s7, s3, a7
                  csrrs        s9, 0x340, zero
                  sra          t2, s2, s1
                  slli         s4, s0, 16
                  addi         a3, a5, -1702
                  c.add        gp, s1
                  c.nop
                  or           s7, t5, s2
                  sll          t1, a0, t4
                  c.or         s1, a3
                  sltiu        s0, s7, 1392
                  c.xor        a2, s1
                  or           s10, t4, a5
                  c.sub        a0, a3
                  srl          t6, t4, tp
                  mulh         s9, gp, sp
                  divu         t5, a5, s7
                  slli         s7, a6, 4
                  addi         t0, s9, 918
                  add          a0, a1, t2
                  c.sub        s1, a5
                  c.li         t0, -1
                  divu         a1, a7, t6
                  srai         t2, sp, 21
                  csrrwi       ra, 0x340, 6
                  divu         a6, a5, s5
                  csrrs        s6, 0x340, zero
                  lui          s7, 303884
                  csrrsi       t5, 0x340, 0
                  csrrci       t6, 0x340, 0
                  rem          s4, s7, s2
                  or           s6, s9, s11
                  c.andi       s1, -1
                  c.add        t0, ra
                  rem          s8, s5, t1
                  c.lui        s0, 2
                  c.srai       s0, 2
                  addi         t0, a5, -798
                  sub          a6, a7, t5
                  csrrwi       s4, 0x340, 19
                  div          s0, a4, s8
                  c.slli       ra, 8
                  c.slli       a7, 4
                  slt          s4, a1, s5
                  add          t2, t5, a4
                  or           s11, a3, s10
                  csrrs        gp, 0x340, t2
                  c.add        a4, s2
                  lui          t4, 307513
                  srl          s4, t3, t3
                  csrrw        a2, 0x340, s2
                  divu         s6, zero, t0
                  c.nop
                  ori          zero, s6, -1594
                  mulhsu       t3, a2, a2
                  rem          a4, t1, t4
                  rem          t5, t2, s0
                  sra          t6, gp, s8
                  and          gp, tp, s2
                  c.nop
                  lui          zero, 374204
                  or           s1, tp, gp
                  c.add        tp, s3
                  sub          t1, a4, s6
                  mulhsu       s2, s1, zero
                  c.andi       a3, -1
                  mulhsu       s11, gp, s5
                  xor          a4, s10, ra
                  andi         s10, gp, 1758
                  c.srai       a2, 28
                  c.and        a4, s1
                  c.srli       a1, 6
                  divu         a4, t6, gp
                  slt          a3, s7, t3
                  c.and        s1, a3
                  remu         t0, s4, ra
                  csrrsi       t3, 0x340, 0
                  mul          s9, a4, a6
                  c.or         s0, a2
                  c.andi       a1, -1
                  rem          s0, gp, s2
                  c.lui        a6, 23
                  c.or         a1, a5
                  c.addi       s10, -1
                  c.srai       a3, 21
                  ori          a4, t6, -2045
                  c.addi       t0, -1
                  add          t1, s3, t6
                  csrrci       a3, 0x340, 0
                  rem          a7, t2, s5
                  slli         t3, t4, 4
                  c.lui        gp, 28
                  c.andi       a1, 17
                  c.xor        a0, s0
                  sub          s1, zero, s11
                  xori         t3, s0, -1334
                  slti         s10, a4, 711
                  auipc        s8, 887003
                  c.srai       s0, 5
                  c.andi       a4, -1
                  nop
                  addi         tp, t1, 1255
                  mulhsu       zero, s5, t4
                  sltu         a7, t2, t5
                  srl          s10, s10, t3
                  slt          t4, s6, s9
                  c.addi       t0, -1
                  lui          a6, 785568
                  c.addi       a6, 24
                  slti         s3, s2, 1630
                  xor          a2, t1, a5
                  divu         a1, s1, s1
                  c.or         a0, a5
                  lui          t1, 598039
                  c.xor        a2, a4
                  add          s10, s2, s7
                  slt          s10, s0, tp
                  c.lui        ra, 19
                  mul          a6, a3, a7
                  ori          s6, zero, -267
                  slti         s6, a2, -1590
                  srl          a1, s0, s8
                  c.add        s4, a7
                  csrrsi       a3, 0x340, 0
                  add          a4, a4, s4
                  rem          a2, t1, gp
                  xor          t0, t0, t2
                  lui          s8, 170884
                  csrrw        s7, 0x340, a5
                  c.addi       a2, -1
                  addi         s6, s1, 1649
                  mul          a0, s8, zero
                  or           s10, sp, s9
                  c.nop
                  mulh         a6, s11, s3
                  slt          s10, s6, a7
                  c.add        ra, s9
                  c.or         a2, s1
                  csrrwi       a2, 0x340, 24
                  add          a4, t4, t3
                  mulhsu       s2, t6, s11
                  srli         s8, ra, 3
                  slti         a7, s1, 800
                  csrrc        s4, 0x340, a3
                  srai         s10, s10, 19
                  c.srli       a2, 30
                  c.or         a2, a2
                  mulhsu       s1, t2, tp
                  remu         s8, a6, t1
                  c.addi       t3, 26
                  rem          s9, t4, a5
                  csrrsi       s9, 0x340, 29
                  csrrsi       s0, 0x340, 20
                  mulhu        s11, s5, ra
                  csrrs        ra, 0x340, zero
                  sub          gp, a1, a1
                  mul          a3, a0, s1
                  divu         a2, s10, t2
                  csrrw        a6, 0x340, s1
                  sltu         a3, a2, t4
                  csrrwi       s7, 0x340, 12
                  sll          s4, a4, sp
                  c.sub        a1, a0
                  sltu         s0, s9, t0
                  c.andi       a4, 28
                  sll          t6, a0, s11
                  c.xor        a0, a4
                  mulh         a0, t2, s7
                  div          s11, zero, gp
                  c.sub        a1, s1
                  xori         t0, s6, -85
                  mulhsu       s4, s8, t2
                  ori          t0, zero, -902
                  c.mv         s2, s0
                  xori         t6, a5, 1153
                  sltu         ra, s6, s5
                  sltiu        t3, s6, 1813
                  c.or         s1, a4
                  c.andi       a2, 8
                  c.add        gp, gp
                  c.srli       s0, 11
                  auipc        s10, 378774
                  srl          s11, t1, s1
                  lui          s1, 411126
                  mulhu        t1, t3, t2
                  sub          s10, s7, t4
                  srli         tp, s11, 19
                  c.li         t5, 28
                  csrrci       s4, 0x340, 0
                  c.and        a1, a3
                  mulh         a4, t5, tp
                  c.sub        s0, s1
                  srai         a2, s1, 24
                  addi         ra, a0, 1127
                  rem          s2, s8, s7
                  auipc        a0, 209705
                  csrrci       t3, 0x340, 0
                  c.xor        a0, a1
                  srli         t2, s3, 15
                  slti         a0, t0, 1759
                  srai         ra, t3, 9
                  ori          a3, sp, 925
                  lui          s4, 824777
                  c.mv         s0, a6
                  mulh         t5, t1, t0
                  srl          a3, a6, s5
                  csrrw        a0, 0x340, t0
                  sltiu        a2, a6, -129
                  c.and        a1, s0
                  xor          s9, s9, a7
                  csrrci       s10, 0x340, 0
                  auipc        ra, 591569
                  csrrsi       s7, 0x340, 0
                  c.or         a3, a2
                  mulh         a7, s7, sp
                  c.li         a0, 8
                  and          zero, zero, s3
                  csrrc        a3, 0x340, s3
                  c.xor        a4, s1
                  c.mv         a4, s7
                  srai         ra, t0, 5
                  auipc        a0, 931993
                  nop
                  mulhsu       s4, tp, t2
                  c.xor        a4, s0
                  csrrw        zero, 0x340, t3
                  c.srai       s1, 11
                  c.nop
                  c.li         a6, 21
                  auipc        t4, 908663
                  srai         a6, s3, 16
                  c.srli       s0, 20
                  c.srai       s1, 14
                  addi         a6, t4, -95
                  srai         s10, t6, 2
                  c.srli       s0, 16
                  remu         s2, tp, t0
                  csrrw        s7, 0x340, s7
                  c.lui        s1, 21
                  csrrc        s3, 0x340, s1
                  xori         t5, a3, -819
                  or           s6, sp, t2
                  srli         a0, tp, 16
                  srl          s0, t5, s2
                  c.sub        s1, a5
                  csrrc        zero, 0x340, t2
                  srl          s7, t2, t1
                  srli         s10, s11, 12
                  c.add        s3, s9
                  slti         a1, s6, -326
                  mulh         t2, s9, s8
                  mulhu        s1, s0, a2
                  c.srai       a1, 27
                  mulhsu       s8, zero, t5
                  csrrsi       t3, 0x340, 25
                  sra          s3, s9, s4
                  slli         a6, s3, 22
                  srli         s10, s7, 19
                  srai         t3, a0, 24
                  divu         t6, a3, gp
                  mulhsu       zero, s8, a6
                  divu         a3, s9, t3
                  c.add        a3, a6
                  add          a2, t1, sp
                  slti         a4, gp, 736
                  mul          s11, s2, s1
                  remu         s0, t1, zero
                  sltu         zero, a4, t3
                  csrrc        t1, 0x340, s2
                  csrrwi       a7, 0x340, 8
                  c.lui        t3, 24
                  c.or         a1, a5
                  sub          s4, t4, tp
                  csrrwi       a4, 0x340, 9
                  ori          t4, a0, 1951
                  divu         s2, s1, a2
                  sll          a2, a3, s1
                  sra          tp, t2, s0
                  and          s7, a3, a7
                  c.or         s0, a2
                  add          s10, s4, ra
                  sll          tp, s10, a0
                  mulhsu       s7, a5, s11
                  slt          a3, s5, s8
                  mulhsu       s3, a5, a6
                  ori          s11, t0, 1702
                  c.sub        s1, a1
                  xori         a7, a3, -1656
                  xor          s11, a4, t6
                  csrrsi       t0, 0x340, 0
                  rem          s11, t4, t3
                  xor          s10, tp, t0
                  andi         s1, t5, 1631
                  c.xor        a4, a1
                  andi         t5, s6, 1052
                  c.slli       s2, 31
                  slt          t3, t6, s7
                  csrrw        zero, 0x340, a2
                  sub          t0, s7, s3
                  mulh         s9, s2, a5
                  sltu         t0, a3, a7
                  rem          a7, s10, a3
                  c.addi       t6, 22
                  mulhsu       a7, s0, s5
                  addi         s1, t0, -1562
                  nop
                  sra          s8, a0, t0
                  c.mv         tp, s9
                  sll          t1, t6, a0
                  c.xor        a3, a2
                  c.lui        a7, 14
                  slt          t4, a2, s0
                  sll          t5, s9, t1
                  xor          s1, s11, s11
                  c.and        a3, a5
                  lui          t3, 746622
                  c.add        t5, t3
                  c.sub        a2, s1
                  and          s4, s11, a6
                  remu         s0, t0, s1
                  c.lui        t0, 10
                  add          s1, a1, a7
                  csrrw        t5, 0x340, s8
                  sub          zero, t0, t4
                  mulhsu       s0, t5, t0
                  or           t4, t4, zero
                  and          gp, gp, s2
                  sltu         s1, s6, s3
                  andi         s0, ra, 1028
                  c.slli       a6, 18
                  slti         a4, s11, 1489
                  c.xor        s0, a3
                  sltu         s10, s3, a4
                  c.sub        a3, a3
                  c.nop
                  sltu         s1, a6, s11
                  c.srli       a4, 9
                  csrrs        a6, 0x340, s9
                  c.and        a2, a3
                  csrrci       t2, 0x340, 20
                  c.nop
                  remu         t3, a1, a5
                  ori          s6, tp, -834
                  c.add        a1, t3
                  ori          t5, s1, -534
                  nop
                  sub          t5, s11, t5
                  c.andi       s1, -1
                  csrrci       s0, 0x340, 7
                  ori          s6, a0, 1478
                  sll          t3, s6, a6
                  c.srai       a4, 1
                  slti         a2, a1, -461
                  csrrci       s9, 0x340, 0
                  csrrc        t0, 0x340, zero
                  c.sub        a0, s1
                  c.li         gp, 31
                  csrrci       t4, 0x340, 0
                  c.srai       a0, 24
                  c.add        s0, a1
                  c.mv         s1, s7
                  c.lui        gp, 17
                  srli         s1, s10, 5
                  c.and        s0, a2
                  sra          a1, s10, s4
                  csrrsi       t3, 0x340, 0
                  sll          s9, a0, s9
                  lui          t0, 935435
                  c.lui        s4, 19
                  csrrw        t3, 0x340, t0
                  csrrs        s2, 0x340, zero
                  slli         s2, a3, 24
                  csrrsi       t4, 0x340, 21
                  sub          s8, gp, t4
                  and          t5, s5, gp
                  xor          t1, s10, a1
                  mulh         s11, t1, s9
                  c.li         a3, -1
                  csrrs        s1, 0x340, gp
                  nop
                  csrrs        a4, 0x340, zero
                  c.xor        a1, a5
                  c.nop
                  csrrs        s2, 0x340, s3
                  slt          tp, a2, s7
                  srai         t5, s3, 12
                  c.sub        a3, a0
                  csrrw        a3, 0x340, t2
                  csrrsi       s0, 0x340, 0
                  addi         a0, a1, 1730
                  sltiu        a0, a3, -1659
                  sltu         tp, t3, gp
                  andi         a3, t2, -743
                  c.and        a0, a1
                  mulhsu       tp, t3, t0
                  slti         s2, t0, -426
                  slti         s7, s10, 521
                  csrrc        tp, 0x340, zero
                  c.andi       s1, -1
                  c.mv         a7, t2
                  c.andi       a0, -1
                  andi         s10, t1, -1773
                  xor          gp, ra, a0
                  or           s9, s3, t5
                  c.lui        s11, 1
                  c.nop
                  divu         t1, s2, t5
                  c.mv         s4, a0
                  c.or         s1, a3
                  c.xor        a0, a4
                  slti         a6, t2, -1223
                  lui          t5, 806281
                  div          t4, zero, t2
                  slti         s7, gp, 818
                  remu         a3, t4, t4
                  ori          t6, s8, -12
                  srli         s9, s0, 22
                  csrrs        s11, 0x340, zero
                  srai         tp, t5, 3
                  auipc        t4, 303487
                  c.nop
                  andi         ra, t5, 1850
                  csrrw        s11, 0x340, t6
                  c.slli       a0, 9
                  sll          s2, a4, a3
                  slli         t4, t6, 15
                  slti         t0, a7, 849
                  sll          a4, s0, t2
                  remu         s7, s0, s2
                  c.srai       s1, 4
                  mul          a6, a2, s0
                  mulh         a6, a4, a0
                  c.add        a3, gp
                  mulhsu       s6, sp, sp
                  csrrc        t5, 0x340, s3
                  mulhsu       t3, sp, t4
                  rem          a6, s6, a0
                  ori          t4, s11, -1276
                  slti         s9, a6, 57
                  sll          t1, zero, a4
                  c.sub        a0, a3
                  xor          ra, s7, a1
                  addi         t3, s5, 644
                  c.sub        a3, a4
                  mulhsu       a4, s0, a3
                  c.add        a1, t1
                  c.li         a2, 23
                  lui          s3, 816731
                  c.slli       s7, 29
                  sltiu        zero, t3, -475
                  c.or         s1, s0
                  c.sub        a4, a3
                  sra          a3, s9, t1
                  c.or         a3, s0
                  xor          a3, s11, s11
                  add          s3, s9, t3
                  addi         zero, t6, 1455
                  ori          a4, t0, 1943
                  c.add        s6, a5
                  csrrw        a6, 0x340, a2
                  rem          t3, t0, t3
                  c.sub        s0, a3
                  csrrci       s2, 0x340, 1
                  add          a1, a2, s1
                  srl          s9, gp, s2
                  slt          a3, a1, s0
                  c.mv         t6, t2
                  c.srli       a3, 25
                  sll          s0, sp, s10
                  c.lui        s2, 31
                  div          a3, a0, s11
                  c.sub        s0, a4
                  csrrw        ra, 0x340, s2
                  and          s7, s8, ra
                  mulh         ra, t1, tp
                  or           a1, a3, t0
                  csrrci       s10, 0x340, 0
                  c.lui        s8, 28
                  csrrsi       a7, 0x340, 0
                  divu         s11, t0, s10
                  add          s10, tp, zero
                  xor          s11, a3, t6
                  c.mv         t1, a3
                  or           s4, gp, a3
                  and          s3, a7, a1
                  c.add        ra, s6
                  mulh         a6, s5, s2
                  c.srai       a2, 30
                  c.lui        s6, 11
                  c.nop
                  csrrsi       t5, 0x340, 0
                  mulhu        a7, a6, s5
                  c.add        t0, a7
                  sll          a0, t1, a6
                  or           s10, s9, a7
                  remu         zero, s3, a2
                  divu         t2, s10, ra
                  srli         a2, s6, 20
                  nop
                  c.mv         a7, tp
                  c.srli       s1, 28
                  sll          t4, a6, s8
                  sub          t5, s2, s4
                  ori          t5, gp, -108
                  c.srli       s0, 16
                  xor          s4, s1, gp
                  andi         s8, t0, 1343
                  c.mv         s7, sp
                  c.nop
                  c.srli       a3, 16
                  nop
                  sll          s9, tp, a5
                  sra          s3, s2, s7
                  c.sub        a2, a5
                  xori         t4, a0, 745
                  slt          tp, t2, s8
                  ori          a0, s7, 1620
                  sra          a1, s7, t1
                  c.srli       s0, 13
                  slti         s10, s6, -870
                  c.andi       a3, 12
                  sub          a7, a3, s8
                  srli         zero, t4, 15
                  c.lui        s11, 2
                  mulh         a0, a5, t3
                  slli         t4, s7, 18
                  sll          tp, s6, a2
                  rem          a1, t3, s8
                  div          t3, t4, s1
                  c.addi       a1, -1
                  srai         s8, s10, 13
                  csrrsi       gp, 0x340, 0
                  c.add        s1, t2
                  mulh         s8, a5, t1
                  ori          a4, t0, 380
                  divu         s8, s6, s4
                  c.add        a4, a4
                  c.addi       a4, 30
                  c.sub        s0, s0
                  rem          s4, zero, t1
                  c.andi       a1, 27
                  c.nop
                  sltiu        t2, a3, 1367
                  csrrw        a2, 0x340, a5
                  srli         s11, t3, 14
                  sltiu        s8, zero, 682
                  rem          s11, a5, s2
                  divu         s11, t2, s10
                  c.lui        t3, 16
                  and          a0, t0, s9
                  c.sub        a3, a0
                  mulhsu       s7, a1, s1
                  csrrc        ra, 0x340, zero
                  div          t4, t6, a6
                  c.andi       a4, -1
                  c.and        s0, s1
                  sub          s0, t2, s10
                  divu         t0, t6, s8
                  c.add        s8, tp
                  sll          a0, zero, s0
                  slt          a4, a1, t1
                  mulh         a0, t5, a0
                  slt          s10, s9, zero
                  lui          s8, 657064
                  c.srai       a3, 15
                  xor          a4, s5, s6
                  xor          s4, a0, s4
                  c.andi       a4, -1
                  sltiu        gp, s2, -43
                  csrrsi       t2, 0x340, 31
                  andi         t2, s7, -449
                  slli         zero, t0, 23
                  c.andi       s1, 20
                  csrrwi       t3, 0x340, 0
                  auipc        t1, 389771
                  divu         t3, s6, s3
                  c.mv         s7, a3
                  c.and        a3, a2
                  sll          a6, a3, a6
                  andi         t3, a3, 16
                  c.andi       a3, -1
                  srai         a4, a4, 2
                  csrrsi       a7, 0x340, 30
                  c.srai       s1, 29
                  c.and        s1, a2
                  slt          s4, tp, t6
                  csrrwi       a6, 0x340, 5
                  slt          s1, s4, s1
                  xori         s10, s8, 1218
                  csrrwi       t0, 0x340, 1
                  sltiu        s11, s6, -11
                  sltu         s8, a6, tp
                  c.xor        a1, a0
                  xor          s6, s9, a3
                  divu         s9, s9, t0
                  auipc        t0, 892162
                  sltu         t5, s4, sp
                  lui          zero, 1001242
                  c.andi       a3, -1
                  and          t1, s10, t2
                  div          zero, tp, t1
                  csrrsi       t4, 0x340, 0
                  mulhsu       s6, a7, a0
                  c.and        a2, a0
                  sub          t2, gp, a0
                  divu         t6, tp, s5
                  slt          s10, t1, t3
                  srai         t2, a5, 20
                  slti         gp, s9, 29
                  div          t5, a5, t6
                  slli         a1, t4, 1
                  c.or         a3, a3
                  xor          s8, zero, s1
                  ori          t5, tp, -1713
                  csrrci       a3, 0x340, 0
                  xor          a7, s1, t5
                  slt          s9, s1, s6
                  c.nop
                  csrrs        t0, 0x340, zero
                  xori         t1, a0, -1792
                  remu         s0, s1, s2
                  c.nop
                  srai         t3, a2, 15
                  mulhsu       s11, a4, t5
                  c.li         t2, -1
                  c.or         s0, a3
                  slti         a7, a5, -894
                  ori          s4, s11, 2047
                  c.li         a7, -1
                  xor          a1, t1, zero
                  srl          s0, s4, t5
                  c.or         s1, a5
                  c.and        a0, a2
                  csrrwi       zero, 0x340, 4
                  sltiu        a0, zero, 1713
                  srl          s4, a7, t5
                  mulhsu       t3, a7, a5
                  slli         zero, a6, 0
                  c.andi       a4, 14
                  auipc        s0, 1047221
                  andi         a7, gp, -1483
                  mul          s7, a1, t4
                  srl          t2, t2, zero
                  sltu         a7, s11, s1
                  divu         gp, a4, s1
                  or           tp, t3, sp
                  add          s7, s4, t5
                  c.srai       a0, 10
                  mulh         s4, a4, s10
                  sub          t0, s6, zero
                  c.addi       s1, -1
                  c.slli       s2, 23
                  c.srai       a1, 9
                  c.srli       s0, 22
                  c.and        a0, s0
                  xori         t2, s9, -1020
                  csrrsi       a6, 0x340, 0
                  slti         a6, t0, 277
                  c.andi       a0, -1
                  srli         a6, s5, 15
                  c.sub        a0, a0
                  slt          s0, a2, t1
                  slli         a3, t2, 23
                  slti         s9, s10, -688
                  divu         s1, t6, tp
                  remu         s7, s8, a1
                  csrrci       s2, 0x340, 0
                  slli         s8, t3, 31
                  mulhsu       t4, t1, s5
                  slt          s0, a6, s11
                  and          s6, s1, a6
                  csrrwi       s2, 0x340, 23
                  c.andi       a4, -1
                  divu         s0, zero, s2
                  c.sub        a2, a3
                  c.xor        a2, s0
                  c.li         t3, 16
                  xor          a6, s5, ra
                  srli         s6, t3, 17
                  divu         a0, s3, t0
                  csrrci       zero, 0x340, 31
                  mul          a2, s5, tp
                  lui          a0, 975081
                  c.srai       a0, 12
                  lui          t5, 779936
                  c.sub        a2, s0
                  mulhu        s6, tp, s3
                  c.or         a0, a1
                  mul          tp, s3, sp
                  mulh         a6, s4, s9
                  divu         a3, s6, a1
                  add          s4, ra, t6
                  mulhsu       a4, s1, s1
                  add          s10, s5, s10
                  slt          s3, t6, t6
                  csrrwi       s11, 0x340, 13
                  c.sub        s0, a5
                  and          t0, a1, s0
                  c.or         a2, a5
                  nop
                  slt          s7, a6, zero
                  c.or         a2, a4
                  sll          t2, s2, t1
                  csrrc        t4, 0x340, zero
                  csrrci       s3, 0x340, 24
                  ori          s1, a0, 1602
                  srl          t5, t0, s6
                  and          t6, sp, t6
                  srli         s11, t2, 24
                  c.and        s0, a1
                  csrrw        a7, 0x340, a3
                  and          t6, a6, t1
                  slli         s6, a4, 16
                  ori          a6, a5, 477
                  c.xor        a1, a3
                  c.srai       a0, 8
                  andi         s10, sp, -719
                  c.nop
                  div          a3, t5, s1
                  srl          s3, s9, a0
                  add          t3, ra, s10
                  sub          s9, a6, t6
                  slti         s7, t2, -1837
                  sub          t5, a0, t4
                  lui          t2, 154028
                  sltu         a6, s3, a5
                  remu         t1, a4, a5
                  c.slli       a3, 6
                  csrrwi       s4, 0x340, 27
                  xor          s1, t6, t3
                  sltu         t0, a4, t2
                  srli         s9, t4, 25
                  c.and        a1, a0
                  mul          t1, s3, ra
                  csrrw        a7, 0x340, ra
                  remu         zero, t0, s0
                  c.xor        s1, a5
                  srai         zero, t2, 22
                  slli         s7, s9, 27
                  csrrwi       a7, 0x340, 21
                  sltiu        gp, t0, 1159
                  c.andi       a0, -1
                  div          s6, sp, a5
                  c.srai       s0, 23
                  c.li         s2, -1
                  c.nop
                  c.lui        tp, 20
                  c.addi       t0, 6
                  c.and        a0, a5
                  sltiu        gp, s7, -1904
                  c.add        a7, s7
                  c.mv         a7, t2
                  c.srli       a3, 1
                  mul          zero, gp, t2
                  divu         a7, a7, a1
                  sub          ra, sp, s4
                  sra          t4, s5, tp
                  addi         t1, sp, -858
                  ori          s6, sp, 1693
                  addi         s6, s5, 1157
                  c.or         a1, a5
                  c.xor        a3, s1
                  c.add        s11, s11
                  csrrw        s7, 0x340, s2
                  add          s11, s1, s1
                  csrrsi       a6, 0x340, 0
                  c.slli       t6, 30
                  andi         a6, s2, -23
                  c.xor        s0, a2
                  c.and        s0, s1
                  sll          t4, a0, a7
                  and          s1, s11, a4
                  c.and        a1, a5
                  slti         t3, sp, -215
                  mulhsu       t3, a7, s3
                  csrrs        s3, 0x340, zero
                  c.add        ra, sp
                  c.and        a0, a1
                  c.mv         a1, t4
                  mulh         t6, t2, tp
                  remu         gp, a0, t1
                  slt          t4, s8, zero
                  sltu         s9, gp, t4
                  csrrwi       t0, 0x340, 15
                  c.srli       a4, 8
                  sra          t1, a3, zero
                  slt          s8, ra, a0
                  sub          s10, a0, a6
                  or           ra, s6, t4
                  c.or         s1, s0
                  c.add        s1, t0
                  nop
                  c.mv         s7, s0
                  c.li         s3, 15
                  divu         a6, s11, s9
                  c.and        s0, a2
                  csrrw        s3, 0x340, t3
                  mul          zero, a4, a2
                  and          t0, s6, s7
                  c.sub        a3, a4
                  csrrwi       s2, 0x340, 25
                  c.slli       t2, 25
                  rem          t4, s0, s11
                  c.srli       a4, 15
                  xori         t1, t6, 979
                  lui          s10, 846285
                  csrrc        t0, 0x340, a4
                  sltu         t0, s11, s9
                  c.sub        a3, a2
                  c.lui        t6, 4
                  andi         t0, s7, -1837
                  div          t1, s8, t3
                  mulh         t6, s11, t1
                  slli         s2, t1, 3
                  c.andi       a1, -1
                  slti         a7, ra, -1746
                  csrrsi       a1, 0x340, 0
                  slti         a6, s8, -433
                  srai         t1, a6, 10
                  srai         t4, a0, 5
                  slti         s3, s1, 877
                  div          s2, a3, t2
                  slti         t4, s8, 1875
                  c.srli       a3, 24
                  divu         s3, s5, t2
                  lui          a6, 994654
                  divu         zero, s0, s0
                  or           t5, s3, t6
                  remu         s11, t2, a5
                  sll          t1, a6, t5
                  srai         s11, t6, 29
                  sub          a3, a5, a1
                  csrrwi       s2, 0x340, 7
                  sltu         ra, s8, s8
                  xori         s0, a3, -856
                  xor          s3, a1, zero
                  sll          s4, s10, t0
                  nop
                  rem          s10, t1, s11
                  div          a2, a1, s0
                  and          gp, t1, tp
                  c.slli       t4, 19
                  c.slli       s10, 12
                  c.nop
                  csrrc        t6, 0x340, s8
                  nop
                  divu         t1, a1, s0
                  mul          s11, a5, t6
                  c.mv         s7, s8
                  or           s4, s8, a5
                  and          t1, ra, t5
                  andi         zero, s5, -490
                  rem          ra, s5, a1
                  mulh         s2, gp, s11
                  sub          a3, a5, s2
                  c.nop
                  addi         tp, s2, -1993
                  and          t4, s11, a4
                  c.add        a4, t4
                  c.add        s6, a1
                  csrrsi       t5, 0x340, 0
                  mul          s10, a2, t4
                  slt          t5, a5, zero
                  c.and        a3, a2
                  slti         s7, t5, 441
                  sltu         s10, s4, s1
                  mulhsu       a6, sp, gp
                  c.and        s1, a1
                  slti         s4, tp, -1490
                  sll          a3, a0, s2
                  sll          t5, s0, s8
                  c.nop
                  c.or         s0, s1
                  csrrw        t5, 0x340, t5
                  c.li         a4, -1
                  c.addi       a3, -1
                  c.or         a3, s1
                  slli         s10, s2, 11
                  ori          s10, s2, -488
                  c.lui        t2, 3
                  srai         s11, a2, 26
                  addi         t5, s8, -28
                  c.slli       s3, 4
                  slti         tp, t5, 297
                  c.add        t0, t3
                  c.li         a0, -1
                  c.or         a1, a0
                  srli         a1, t2, 9
                  sra          s9, a5, a6
                  sll          t3, s7, s3
                  sll          t5, sp, s5
                  sub          t0, s4, a5
                  andi         a6, s6, 1279
                  csrrci       zero, 0x340, 0
                  rem          t5, a6, gp
                  sub          t4, ra, t0
                  c.addi       t5, 10
                  c.slli       s9, 6
                  c.or         a2, a5
                  srli         s2, t5, 12
                  c.andi       a2, 13
                  c.addi       ra, 31
                  divu         a2, s9, gp
                  lui          t0, 423348
                  sltu         s10, gp, t0
                  mul          s9, a1, a5
                  c.sub        a2, s1
                  c.and        a4, a1
                  sll          a6, t6, s4
                  mulhu        t1, a5, s7
                  divu         a6, t0, s3
                  mul          a7, t0, t1
                  c.lui        t3, 13
                  srl          t1, s8, a2
                  csrrs        s2, 0x340, zero
                  div          a6, t4, t2
                  c.and        a4, a1
                  add          s9, t0, zero
                  csrrci       t0, 0x340, 29
                  csrrc        zero, 0x340, zero
                  xor          t6, s10, s3
                  slti         t2, s4, -886
                  rem          s11, t2, a1
                  c.srli       a0, 26
                  remu         ra, s1, s2
                  csrrwi       tp, 0x340, 20
                  xori         a0, ra, -166
                  c.xor        s0, s0
                  c.andi       s1, 5
                  c.xor        a1, a3
                  srai         zero, t6, 12
                  c.addi       tp, -1
                  rem          a2, a4, a7
                  csrrwi       s6, 0x340, 30
                  csrrc        a2, 0x340, zero
                  sltu         ra, a4, s0
                  c.andi       s0, 4
                  addi         a6, s2, -1744
                  c.or         a3, a2
                  c.or         a4, a5
                  mulh         s10, s2, s0
                  sltiu        t0, a1, -246
                  sub          s8, s4, s8
                  srl          a3, s0, a1
                  slli         a2, t0, 28
                  lui          a6, 8167
                  sltu         ra, a3, t1
                  c.andi       a0, 21
                  csrrwi       s11, 0x340, 8
                  xor          s10, sp, gp
                  csrrc        t0, 0x340, zero
                  c.lui        a6, 8
                  div          a3, s5, t4
                  csrrc        a7, 0x340, s0
                  srli         zero, t4, 29
                  auipc        s2, 477630
                  c.srli       a2, 19
                  csrrwi       s6, 0x340, 30
                  c.xor        a4, a0
                  srli         a3, t5, 0
                  slti         a2, s9, -1116
                  slli         s2, a5, 10
                  c.andi       a1, -1
                  sltiu        s6, t5, 1227
                  lui          t5, 919680
                  c.slli       t6, 24
                  mulh         s3, s0, zero
                  mul          a0, t5, s5
                  sltu         s7, a5, s4
                  ori          t4, s2, -1002
                  divu         s3, s9, s8
                  c.li         a0, -1
                  mulh         s1, a1, gp
                  c.add        t2, t6
                  xori         t2, ra, -880
                  csrrc        a7, 0x340, zero
                  csrrwi       a4, 0x340, 29
                  srai         s7, sp, 30
                  csrrw        t1, 0x340, sp
                  mul          gp, a5, sp
                  addi         ra, tp, -1530
                  ori          a3, s6, -1102
                  c.li         t1, 4
                  mulh         t5, s3, t4
                  csrrci       s2, 0x340, 0
                  sub          a7, zero, a4
                  lui          s0, 450189
                  csrrsi       a6, 0x340, 0
                  or           s9, t2, a3
                  rem          t2, a7, t2
                  or           s0, t1, s10
                  c.lui        a3, 1
                  add          t1, a1, t3
                  sltiu        s9, zero, -1293
                  csrrs        s7, 0x340, zero
                  csrrw        a1, 0x340, a3
                  srai         s9, s4, 0
                  rem          s11, a6, a2
                  c.nop
                  c.andi       a2, -1
                  remu         a1, s11, t2
                  c.sub        s1, a5
                  or           a2, t5, a7
                  mulhsu       a3, s1, s9
                  add          t0, t1, s11
                  addi         a7, a5, 374
                  sll          a2, t5, a2
                  c.or         a0, a4
                  csrrwi       tp, 0x340, 15
                  mulh         gp, s7, s1
                  c.or         a2, a4
                  c.sub        a2, a0
                  srai         a7, tp, 29
                  csrrs        s11, 0x340, a7
                  auipc        gp, 661377
                  mul          t4, t0, s1
                  c.srli       s0, 17
                  mulhu        zero, t6, a6
                  csrrsi       s7, 0x340, 0
                  add          a0, s2, s10
                  slti         tp, s0, 198
                  sll          a7, a2, sp
                  ori          ra, s5, 467
                  addi         t2, t3, 1612
                  slti         a0, t3, -727
                  mulhu        a6, s0, zero
                  nop
                  c.slli       s0, 28
                  and          t1, t4, s5
                  csrrs        s3, 0x340, zero
                  nop
                  sra          s2, s4, a2
                  c.lui        t6, 10
                  c.or         s0, a5
                  nop
                  nop
                  c.srai       a1, 24
                  c.lui        a3, 13
                  c.addi       a2, 23
                  sltu         tp, s4, a0
                  slli         a4, a5, 14
                  lui          t5, 845400
                  srl          t3, s7, a7
                  divu         s4, t6, a5
                  csrrc        a1, 0x340, tp
                  csrrwi       t1, 0x340, 24
                  c.or         a0, s1
                  srai         s7, s11, 30
                  divu         t6, sp, a3
                  srl          s4, s10, s11
                  slti         s10, t6, 831
                  srli         a6, s9, 25
                  c.li         a1, 9
                  andi         gp, s7, -1458
                  c.li         ra, -1
                  mul          s10, s1, t0
                  c.andi       a1, 16
                  csrrc        s7, 0x340, zero
                  divu         t3, a3, a3
                  sltiu        s11, t6, -651
                  c.li         s11, 22
                  c.lui        s1, 13
                  andi         gp, s8, 613
                  slt          s8, s6, s1
                  csrrc        a6, 0x340, s9
                  slt          a2, zero, a6
                  c.li         ra, -1
                  sub          t0, s0, t6
                  sltiu        s6, a6, -109
                  c.mv         t1, s10
                  srai         s7, a3, 18
                  c.andi       a4, -1
                  c.lui        tp, 18
                  c.andi       a0, -1
                  xori         s8, t6, -1997
                  csrrs        s3, 0x340, s2
                  mulhsu       s1, ra, a5
                  csrrsi       s6, 0x340, 0
                  c.lui        s6, 19
                  and          s4, a0, a5
                  add          a2, s9, a1
                  rem          a7, a5, s9
                  remu         gp, a2, s10
                  mulhu        a3, ra, s8
                  mul          a1, a1, sp
                  mulhu        a0, t0, a7
                  or           t0, s8, s7
                  c.slli       t1, 31
                  remu         s2, a4, t3
                  c.nop
                  c.andi       s1, -1
                  csrrsi       a3, 0x340, 2
                  c.addi       t1, -1
                  c.srli       s0, 30
                  slli         s9, s3, 16
                  srli         s11, s5, 19
                  c.andi       s1, -1
                  slt          a3, s5, zero
                  sltiu        ra, t3, -835
                  auipc        t4, 719693
                  c.mv         gp, s4
                  csrrs        a1, 0x340, gp
                  c.andi       a0, 22
                  slti         s3, a0, 1581
                  add          s6, t5, s7
                  c.nop
                  slli         t1, s2, 16
                  sub          s6, sp, s3
                  c.srai       a2, 12
                  auipc        a3, 316429
                  c.mv         a6, sp
                  mulh         s9, s9, s10
                  c.addi       s8, 10
                  sra          a4, t4, s3
                  auipc        a3, 995872
                  mulhsu       a2, sp, a6
                  c.slli       t5, 24
                  csrrs        t2, 0x340, zero
                  sltu         tp, s3, a1
                  sltu         s2, zero, a1
                  sltiu        s10, s6, -730
                  c.andi       a1, 10
                  c.srli       a1, 19
                  c.mv         t2, t2
                  sra          t3, ra, a3
                  c.lui        t2, 27
                  csrrwi       s8, 0x340, 5
                  srl          t5, s11, a6
                  srai         s10, sp, 29
                  c.slli       a0, 6
                  c.mv         t5, s1
                  xori         s11, s10, 879
                  csrrwi       tp, 0x340, 3
                  mulhu        a6, s9, s6
                  slti         gp, a6, -479
                  csrrci       tp, 0x340, 5
                  c.mv         a4, t2
                  csrrc        t1, 0x340, a4
                  csrrsi       a7, 0x340, 0
                  auipc        a1, 958300
                  and          a3, t6, s4
                  csrrw        s10, 0x340, a5
                  ori          s0, s10, 1249
                  c.li         a6, -1
                  c.or         s1, a3
                  divu         s1, a3, t4
                  csrrs        a1, 0x340, zero
                  andi         s1, s3, 1761
                  c.add        t2, a4
                  c.slli       t6, 30
                  csrrci       a6, 0x340, 0
                  c.srli       a3, 31
                  srai         a2, gp, 26
                  lui          a7, 727548
                  divu         s1, zero, s6
                  addi         s11, s7, 990
                  c.add        t6, a7
                  srai         s0, t3, 1
                  c.add        t4, t6
                  csrrwi       s6, 0x340, 6
                  srli         s7, gp, 11
                  c.or         a2, a4
                  c.mv         t4, s0
                  c.andi       s1, -1
                  and          zero, sp, s6
                  xori         s11, a7, 1550
                  csrrw        a4, 0x340, a6
                  mulh         t5, a0, t4
                  csrrsi       a4, 0x340, 23
                  mulhu        a1, a1, s0
                  sub          t4, a6, s9
                  and          tp, a0, t1
                  c.add        a4, t5
                  csrrc        s1, 0x340, zero
                  c.and        a1, a2
                  c.or         s1, a0
                  remu         s1, a7, t4
                  sltu         s9, s7, s6
                  csrrwi       a2, 0x340, 4
                  csrrsi       a7, 0x340, 0
                  divu         s3, t4, s3
                  c.addi       a6, -1
                  c.srai       s1, 15
                  lui          a3, 641301
                  csrrsi       ra, 0x340, 16
                  and          t3, a4, a0
                  c.andi       a1, 5
                  nop
                  ori          t1, t2, -80
                  rem          a1, a2, s2
                  c.lui        s6, 13
                  mulhu        t5, s7, a2
                  addi         s1, ra, -457
                  srai         s6, s4, 22
                  ori          t6, t0, -1764
                  mul          t0, a3, ra
                  mul          s0, t5, s5
                  add          a3, a5, a4
                  divu         ra, t1, t0
                  srli         a3, s0, 20
                  csrrci       a6, 0x340, 0
                  sltiu        a7, sp, 428
                  c.xor        a0, a1
                  c.lui        t4, 13
                  and          a2, t5, s1
                  nop
                  remu         s3, t4, t5
                  mulhsu       a2, s7, t1
                  slli         t0, s1, 24
                  mul          t6, s5, t4
                  c.mv         a6, a1
                  c.or         a2, a0
                  lui          a2, 309450
                  c.andi       a4, 31
                  mulhu        s10, t3, s0
                  and          s8, s11, a6
                  c.xor        a2, s0
                  srai         s9, t5, 10
                  auipc        s11, 852291
                  c.srli       a2, 25
                  sll          t4, s4, a4
                  c.mv         a6, s7
                  c.addi       t3, -1
                  c.li         ra, -1
                  nop
                  ori          s9, s1, -54
                  csrrs        t0, 0x340, zero
                  sll          a0, s9, s8
                  and          ra, t4, a7
                  c.mv         ra, s8
                  c.andi       a4, -1
                  mulhsu       zero, a0, a0
                  c.mv         t3, s8
                  slli         a0, a4, 30
                  c.sub        a3, a1
                  csrrs        zero, 0x340, s11
                  c.srli       a1, 12
                  c.nop
                  c.srai       a3, 21
                  and          s11, t5, s9
                  mulh         t6, a0, a4
                  slli         t6, t2, 23
                  c.sub        a2, a0
                  c.mv         s11, a7
                  sltu         a0, s11, tp
                  c.and        s0, a1
                  csrrc        s0, 0x340, sp
                  c.srai       a2, 22
                  c.or         s1, a4
                  xor          a3, a2, s3
                  c.srli       a2, 25
                  lui          a2, 759925
                  rem          s7, s10, tp
                  csrrci       a2, 0x340, 0
                  c.add        s1, s8
                  c.andi       s1, -1
                  divu         a0, t0, s0
                  rem          t5, s6, tp
                  auipc        a7, 294628
                  sra          a3, a1, a3
                  csrrc        s9, 0x340, zero
                  c.add        a7, a4
                  c.andi       a4, 25
                  c.srai       a4, 24
                  csrrc        t1, 0x340, s4
                  c.xor        a4, a5
                  c.mv         s11, a2
                  andi         t1, s6, -1423
                  c.andi       a1, -1
                  c.or         a2, a2
                  sltiu        s10, t4, -513
                  c.or         a1, s0
                  divu         s2, s2, s7
                  or           a3, s1, t3
                  sltiu        s8, zero, -1404
                  sll          s3, s4, s10
                  sll          s2, a1, s10
                  lui          t2, 168433
                  mulhu        s4, s0, t4
                  csrrw        t2, 0x340, t6
                  csrrci       t3, 0x340, 0
                  srl          t2, a6, a2
                  mulh         s3, ra, s6
                  andi         t5, s0, -980
                  c.sub        a3, a1
                  c.li         a0, -1
                  add          a6, s6, s3
                  c.and        a1, s1
                  mul          ra, gp, a2
                  mul          t2, t0, t3
                  csrrsi       t3, 0x340, 0
                  c.and        a1, a1
                  c.and        a4, a0
                  nop
                  c.srli       s1, 20
                  ori          a4, t5, 1611
                  mulh         t0, ra, sp
                  c.slli       s3, 2
                  nop
                  or           s0, s9, gp
                  csrrsi       t6, 0x340, 0
                  ori          t4, s8, 928
                  mulhu        a4, a3, s9
                  auipc        s6, 627046
                  and          a0, s8, a3
                  csrrsi       gp, 0x340, 0
                  c.li         tp, -1
                  mul          gp, a5, ra
                  csrrsi       s0, 0x340, 0
                  c.nop
                  mulhsu       ra, s6, s1
                  sltu         gp, a1, t3
                  sltu         t5, s6, t3
                  addi         s3, t0, 1120
                  divu         a2, s0, s10
                  csrrw        s3, 0x340, s1
                  sltiu        tp, zero, 904
                  sltu         s0, t3, a3
                  csrrci       s8, 0x340, 31
                  c.mv         s9, a7
                  andi         a0, zero, -417
                  addi         t4, ra, 1866
                  slti         s3, a5, -1607
                  csrrci       s1, 0x340, 23
                  c.nop
                  csrrw        s3, 0x340, s3
                  csrrs        t2, 0x340, a0
                  csrrc        s10, 0x340, zero
                  srli         s2, t4, 31
                  sltu         a4, zero, t0
                  auipc        s11, 307796
                  c.li         t6, -1
                  lui          s4, 26406
                  c.nop
                  srl          s4, a2, s5
                  lui          a0, 843577
                  srai         a2, s1, 2
                  ori          t5, a3, 357
                  and          t4, s6, t4
                  c.sub        a4, a0
                  nop
                  addi         t3, t5, -917
                  csrrci       t6, 0x340, 5
                  divu         tp, s8, sp
                  andi         a1, s11, 2036
                  or           s11, s3, s8
                  sltu         zero, s9, t3
                  remu         s10, a5, ra
                  nop
                  csrrs        a1, 0x340, a4
                  c.mv         s2, s11
                  c.nop
                  div          s6, t5, zero
                  c.slli       a1, 12
                  csrrsi       s4, 0x340, 22
                  srli         t6, t5, 31
                  c.addi       a1, 27
                  ori          gp, s3, 1953
                  sltiu        a3, a2, 1354
                  c.andi       a0, -1
                  addi         gp, t4, 908
                  sltu         t6, s11, s4
                  c.and        a0, a1
                  sra          s8, s3, s5
                  srli         a1, s9, 8
                  csrrs        t0, 0x340, zero
                  srl          s0, t5, s11
                  auipc        a1, 267485
                  ori          s4, s11, 516
                  c.slli       s11, 2
                  or           s2, a1, s6
                  remu         t4, ra, t4
                  div          s7, s11, s2
                  csrrci       tp, 0x340, 0
                  xor          a6, a1, t2
                  c.andi       a4, -1
                  sltiu        s4, t0, 1048
                  slti         t2, tp, 90
                  csrrs        a0, 0x340, a5
                  c.add        s3, t1
                  rem          t6, zero, zero
                  ori          a1, a0, 1377
                  slli         a6, t3, 4
                  c.or         a4, a0
                  c.srai       a0, 2
                  ori          s11, t0, 974
                  lui          s10, 431594
                  c.and        a2, a4
                  andi         a6, t4, -617
                  or           ra, t2, a6
                  lui          s3, 474039
                  csrrci       a1, 0x340, 0
                  c.or         a0, a4
                  c.slli       a6, 26
                  ori          tp, s11, -63
                  c.and        s1, s0
                  ori          s11, a5, 809
                  slt          s3, ra, a7
                  divu         s6, s11, s8
                  addi         s0, s2, -451
                  ori          t2, t2, -453
                  rem          tp, a4, s1
                  divu         a1, a7, tp
                  slti         a1, s5, 421
                  csrrwi       s11, 0x340, 12
                  auipc        gp, 947613
                  and          t5, s8, s2
                  auipc        t6, 409317
                  c.mv         t4, s8
                  sra          zero, t5, s1
                  srli         a0, a1, 1
                  csrrci       s8, 0x340, 22
                  mulhsu       s4, s10, s8
                  ori          a3, s8, 1331
                  sltu         t1, s11, sp
                  c.nop
                  div          t2, s10, s4
                  c.sub        a1, a3
                  csrrc        s3, 0x340, a3
                  divu         s6, ra, a3
                  csrrc        s7, 0x340, zero
                  and          s3, s1, a5
                  add          s6, t1, a0
                  srli         a7, t5, 20
                  sltu         a0, s3, s6
                  c.and        a3, a1
                  mulhu        s10, a6, gp
                  c.andi       a4, -1
                  csrrwi       s6, 0x340, 5
                  c.li         tp, -1
                  lui          t4, 880838
                  auipc        a1, 330782
                  sra          gp, s6, a3
                  csrrci       s0, 0x340, 31
                  xor          t5, ra, s11
                  slt          s4, ra, t6
                  addi         s0, t0, -1844
                  c.mv         s9, s3
                  c.lui        gp, 13
                  xor          a2, t1, s6
                  srai         t0, zero, 1
                  c.slli       s2, 2
                  srli         s10, a7, 20
                  ori          s8, t6, -892
                  slli         s3, s3, 24
                  c.xor        a2, s1
                  csrrc        a3, 0x340, gp
                  c.add        s10, ra
                  ori          s1, s10, -1489
                  sra          a6, ra, a3
                  csrrci       a6, 0x340, 22
                  add          t3, t0, a2
                  csrrc        s4, 0x340, zero
                  sra          a2, zero, a0
                  c.li         t2, -1
                  csrrs        zero, 0x340, s11
                  divu         a7, gp, s9
                  srai         a4, s7, 16
                  andi         t3, a4, -1932
                  or           s4, s3, s11
                  sltu         s10, t4, t2
                  csrrsi       t2, 0x340, 6
                  c.slli       t3, 17
                  csrrc        a0, 0x340, a4
                  or           t5, a2, t1
                  div          t2, a5, sp
                  c.andi       a0, 8
                  csrrc        tp, 0x340, zero
                  csrrsi       s10, 0x340, 16
                  addi         a3, t2, -1605
                  slli         t3, t1, 7
                  mulhsu       s7, t2, t3
                  or           a0, t4, a6
                  sub          t0, s7, a1
                  csrrc        s6, 0x340, tp
                  xor          s3, a6, a5
                  c.mv         a0, t3
                  c.add        tp, a6
                  c.sub        s0, a0
                  c.and        a2, s0
                  csrrci       s3, 0x340, 0
                  ori          s6, s0, -597
                  sll          s4, a4, sp
                  mulh         t1, tp, s11
                  andi         a0, s5, -847
                  c.slli       s6, 28
                  slt          a6, a2, ra
                  c.li         a6, 29
                  rem          s2, ra, s6
                  ori          gp, t6, 352
                  csrrw        a0, 0x340, ra
                  csrrwi       t5, 0x340, 26
                  csrrsi       a2, 0x340, 0
                  c.slli       a6, 25
                  c.xor        a2, a4
                  slli         s3, s3, 3
                  mulhu        t0, t5, a2
                  sltiu        t0, t3, -1670
                  c.addi       s11, -1
                  divu         s11, s10, s9
                  div          zero, a5, s8
                  c.srai       s0, 17
                  c.andi       s0, 27
                  c.xor        a0, a5
                  sub          s8, s3, s3
                  xor          a7, s10, t4
                  mulh         gp, zero, a6
                  csrrwi       s6, 0x340, 9
                  srl          zero, s1, s9
                  and          t2, t5, a2
                  c.mv         s8, a1
                  c.sub        a0, s1
                  mulhu        tp, s10, gp
                  csrrsi       t0, 0x340, 16
                  c.mv         s11, t2
                  mulh         a6, t3, s6
                  c.li         s9, 21
                  c.andi       a2, -1
                  ori          s10, s7, 341
                  c.nop
                  sra          a3, t5, s5
                  divu         t3, ra, a6
                  sltiu        s11, s10, 581
                  c.li         s0, -1
                  and          a0, a4, t0
                  divu         s6, s10, t0
                  c.nop
                  add          zero, tp, s7
                  csrrci       t2, 0x340, 0
                  andi         gp, t0, -273
                  c.slli       t5, 21
                  c.andi       a1, 7
                  csrrw        s3, 0x340, a6
                  slli         a3, a4, 16
                  c.andi       s0, 5
                  ori          zero, s5, -1005
                  or           s3, tp, a1
                  slti         s1, a7, -574
                  c.addi       t2, 24
                  divu         s2, s8, t4
                  remu         s1, t3, sp
                  csrrw        a0, 0x340, s3
                  addi         a6, a5, -981
                  c.li         t3, -1
                  or           t0, s10, tp
                  sub          tp, a2, a2
                  div          ra, s11, s7
                  sltiu        s11, t3, 1730
                  srli         s1, sp, 15
                  sltiu        s0, s1, 1499
                  sll          s10, t3, sp
                  c.addi       s3, -1
                  c.nop
                  mul          tp, zero, sp
                  csrrwi       s2, 0x340, 13
                  sub          zero, a1, sp
                  c.addi       t2, 18
                  csrrs        a6, 0x340, t6
                  srl          a7, s0, s8
                  srai         s7, zero, 15
                  ori          tp, sp, -395
                  c.andi       s0, -1
                  ori          t4, gp, -527
                  c.add        a2, a0
                  c.andi       a1, 26
                  mul          s9, t2, s3
                  ori          a2, zero, -1126
                  auipc        s7, 653983
                  srai         s7, t5, 9
                  c.or         a4, a3
                  divu         t4, s5, a0
                  c.srli       s1, 24
                  remu         s0, ra, t6
                  rem          s3, s7, t2
                  c.addi       t1, 28
                  div          s1, s11, s1
                  c.slli       gp, 18
                  mulhsu       t3, tp, t2
                  div          s7, s8, t1
                  c.xor        a3, s1
                  c.mv         s7, sp
                  srai         a3, s1, 31
                  remu         t0, a6, a3
                  ori          s7, s9, -1985
                  c.or         s0, a2
                  divu         t5, a0, s2
                  xor          t3, s4, a1
                  divu         s9, s9, t2
                  nop
                  c.addi       t0, -1
                  rem          a3, a3, t0
                  c.and        a3, a4
                  div          a7, t2, t5
                  c.sub        a3, a1
                  c.slli       t2, 8
                  sltiu        a1, s8, 2014
                  slt          a7, s3, a3
                  c.li         a3, 6
                  c.addi       t4, 9
                  add          t1, a6, s1
                  sltu         t5, t4, t5
                  and          a2, s6, s4
                  c.or         s1, a1
                  c.and        a2, a5
                  sra          s6, sp, s3
                  c.srai       a0, 6
                  csrrw        a4, 0x340, t5
                  csrrsi       s8, 0x340, 0
                  ori          a6, t2, -802
                  slt          s1, s2, a6
                  c.add        a7, t6
                  xor          t6, s9, gp
                  csrrsi       gp, 0x340, 22
                  nop
                  slli         s10, a4, 12
                  xor          s6, t5, gp
                  div          s6, s10, s10
                  c.and        a0, a4
                  c.add        s9, s1
                  csrrs        t6, 0x340, zero
                  mul          a4, a5, s7
                  csrrci       t3, 0x340, 0
                  sra          t5, t4, a6
                  c.lui        s8, 11
                  c.srai       a1, 21
                  srai         s1, s8, 0
                  c.li         s8, -1
                  sltu         s9, t2, a1
                  srl          a6, a1, t6
                  sll          t5, tp, s2
                  srl          t1, s1, a7
                  and          a2, tp, a0
                  sltiu        s3, t1, 1918
                  mulh         a4, gp, s9
                  andi         s1, a0, -1325
                  and          s2, a7, s2
                  c.nop
                  csrrc        t2, 0x340, zero
                  csrrw        s10, 0x340, a4
                  sra          a1, a0, s10
                  ori          s9, s3, 434
                  mulhsu       a6, t6, a7
                  slt          a4, s1, tp
                  remu         s4, t5, s4
                  srli         s11, s11, 1
                  sll          s7, a7, a0
                  slt          t0, a1, a3
                  csrrc        s9, 0x340, zero
                  c.srai       a0, 22
                  sltiu        t6, sp, 112
                  srli         a4, s8, 4
                  sll          s11, a7, t3
                  sra          s10, s6, s11
                  remu         a3, s2, s7
                  slti         tp, a1, -1743
                  mulhsu       s6, s7, ra
                  div          t5, a5, a1
                  srli         t2, s2, 22
                  c.sub        a4, s0
                  csrrw        a2, 0x340, t1
                  slti         s3, t0, -1138
                  and          s3, a7, t1
                  sub          t6, tp, sp
                  mul          ra, a2, t2
                  c.srai       s0, 24
                  c.addi       t5, -1
                  c.add        t4, a4
                  c.xor        s0, s0
                  slli         zero, a0, 0
                  csrrs        a0, 0x340, zero
                  c.li         t0, 4
                  srai         t4, t5, 10
                  div          s10, a0, a3
                  sub          s11, t3, s5
                  c.and        a0, a3
                  csrrc        s11, 0x340, zero
                  c.slli       gp, 21
                  remu         s9, s9, s2
                  lui          t6, 696656
                  mulhu        s0, s10, s7
                  slti         ra, a7, 910
                  c.sub        s1, a1
                  slti         a0, s3, 1662
                  mulhu        t0, gp, s5
                  c.li         s10, -1
                  c.lui        t4, 25
                  or           a6, a5, a7
                  nop
                  andi         s0, ra, 2006
                  c.srli       a4, 30
                  sltu         t5, t1, t1
                  auipc        s2, 635085
                  remu         a1, a0, a0
                  and          s3, a3, a2
                  csrrs        s11, 0x340, s4
                  remu         t2, t1, a7
                  csrrw        s2, 0x340, s10
                  srli         a4, s6, 20
                  c.andi       a4, -1
                  c.sub        a0, a5
                  ori          t6, zero, 637
                  c.addi       s8, -1
                  sltiu        t2, t0, 1348
                  lui          a6, 802174
                  and          a3, s9, s10
                  csrrsi       a6, 0x340, 0
                  andi         a0, a1, 622
                  remu         t4, t0, zero
                  slli         zero, s4, 3
                  csrrwi       s4, 0x340, 29
                  sra          s8, tp, t6
                  c.lui        s10, 25
                  sll          s8, ra, s4
                  xor          a3, ra, t5
                  remu         s1, t1, t0
                  auipc        s7, 276980
                  add          s4, s5, t4
                  mulhu        s6, a1, s0
                  mul          a1, s4, a4
                  add          s1, zero, s4
                  mulh         s9, t5, a2
                  c.addi       s8, -1
                  remu         s4, s7, s11
                  slti         ra, t6, 414
                  andi         tp, s1, -1312
                  c.srai       a0, 22
                  c.add        tp, s9
                  c.srai       a4, 21
                  or           a0, ra, s7
                  slt          s2, gp, a3
                  c.add        t0, s11
                  auipc        a7, 369320
                  c.lui        a2, 17
                  c.nop
                  c.nop
                  sra          s10, t1, s3
                  divu         t4, t2, a5
                  ori          t6, s9, -244
                  addi         zero, a1, 1192
                  mul          s7, s2, s7
                  mul          t2, s11, ra
                  c.and        s1, a2
                  c.xor        a3, a2
                  c.xor        s0, a1
                  ori          t3, s4, -546
                  sltiu        t3, t1, -1785
                  sra          t3, s2, s11
                  rem          t2, s2, a4
                  sll          t5, t0, t1
                  c.xor        a0, a4
                  c.and        a4, a5
                  lui          gp, 727796
                  rem          t2, s10, a1
                  lui          s0, 740595
                  csrrw        a4, 0x340, a6
                  sltiu        s3, a3, 1138
                  c.nop
                  remu         a3, a1, s0
                  csrrwi       t0, 0x340, 19
                  c.and        a0, a3
                  c.or         s0, a3
                  nop
                  andi         s11, t4, 1839
                  csrrci       zero, 0x340, 0
                  lui          gp, 418963
                  sll          gp, a2, t2
                  c.slli       ra, 31
                  c.sub        a4, a1
                  mulhsu       t5, tp, a0
                  sra          a3, s10, s6
                  mulh         s9, s3, t4
                  c.mv         t3, a1
                  and          t5, t2, s4
                  div          zero, zero, s4
                  remu         s3, s5, a7
                  c.mv         s10, t3
                  c.slli       t6, 4
                  csrrs        a2, 0x340, s6
                  xor          s9, t0, t2
                  addi         s8, t4, 51
                  c.or         a0, s0
                  csrrw        s1, 0x340, a5
                  c.nop
                  mulh         ra, t5, s3
                  nop
                  csrrsi       a1, 0x340, 0
                  csrrs        s3, 0x340, s9
                  sltiu        a2, s0, 1544
                  mulhu        t6, s10, sp
                  c.lui        s2, 2
                  srl          t3, t3, a3
                  c.nop
                  sub          s3, t4, s9
                  c.andi       s0, -1
                  c.or         a4, a0
                  and          a1, ra, a6
                  srai         s10, t1, 26
                  andi         s3, a6, 27
                  andi         ra, s3, 1428
                  mulhsu       t6, s2, s4
                  srli         s10, s0, 28
                  sltiu        t5, s3, -1481
                  ori          s4, gp, -221
                  mul          s4, a2, s11
                  xori         a1, t1, 1549
                  mul          s2, s4, a6
                  rem          a0, a2, gp
                  c.andi       s0, 10
                  xori         t3, s1, 1287
                  srai         t1, s11, 6
                  mul          a7, s6, sp
                  divu         a2, s1, t1
                  div          s4, s5, s1
                  div          gp, a1, t5
                  sltiu        s7, tp, -597
                  c.srli       a0, 2
                  and          t6, s7, s9
                  nop
                  c.srai       s1, 8
                  slti         s11, s1, 802
                  mulhu        t4, s4, s6
                  andi         t5, s8, -337
                  csrrs        a1, 0x340, zero
                  c.srai       a1, 22
                  csrrsi       s0, 0x340, 2
                  csrrw        a2, 0x340, ra
                  divu         s2, s2, gp
                  andi         t5, ra, 957
                  addi         t3, t0, -193
                  divu         t5, s9, t4
                  or           a1, a7, s9
                  xor          t6, s11, a5
                  remu         a6, a7, a2
                  ori          t2, s4, 1737
                  xor          s2, zero, t3
                  csrrc        s4, 0x340, zero
                  c.or         a2, a0
                  c.addi       a4, -1
                  c.add        t6, tp
                  sltu         t1, s10, s8
                  add          s9, sp, a0
                  csrrci       a4, 0x340, 3
                  c.lui        gp, 19
                  lui          a7, 489919
                  c.add        a2, a4
                  srli         ra, s0, 1
                  c.lui        t6, 6
                  csrrwi       a1, 0x340, 13
                  srai         zero, a7, 1
                  slt          a0, s7, a2
                  slli         s4, a4, 0
                  auipc        a2, 859518
                  andi         a6, s0, -660
                  slli         t5, a4, 17
                  c.and        a4, s0
                  slti         a1, a6, -549
                  csrrc        t4, 0x340, zero
                  csrrs        tp, 0x340, zero
                  c.addi       tp, -1
                  mulhu        s1, sp, s1
                  c.sub        a3, s0
                  csrrwi       t5, 0x340, 21
                  add          a3, s10, s0
                  addi         a4, tp, 1948
                  c.or         s0, a2
                  c.slli       a0, 12
                  xori         a6, s1, 758
                  csrrc        t5, 0x340, zero
                  sltu         gp, s11, s1
                  c.li         a4, -1
                  sll          a2, s9, t5
                  c.li         t3, 24
                  lui          s6, 1038148
                  add          t0, sp, s3
                  remu         t5, a2, gp
                  mulh         a6, a2, s3
                  c.mv         s11, a3
                  srl          s9, t6, s7
                  csrrs        t3, 0x340, zero
                  srai         s10, zero, 21
                  add          gp, t4, a2
                  c.lui        s9, 28
                  csrrsi       a2, 0x340, 8
                  c.nop
                  addi         t1, a6, -759
                  c.srai       s1, 4
                  srl          s11, s4, a4
                  div          a6, s9, tp
                  sltiu        s1, a7, 1781
                  csrrsi       t4, 0x340, 7
                  c.sub        a2, a5
                  sltu         s3, s8, t3
                  lui          s1, 786813
                  c.nop
                  or           t0, t0, a0
                  csrrc        a2, 0x340, zero
                  c.li         a7, 5
                  csrrci       t5, 0x340, 0
                  csrrci       s8, 0x340, 19
                  mulhu        t5, t3, ra
                  divu         s11, t5, a1
                  c.addi       s8, 17
                  srli         a1, a7, 21
                  c.li         t3, 30
                  c.addi       a3, 2
                  csrrsi       tp, 0x340, 0
                  mulh         t4, ra, s9
                  or           t2, a3, s8
                  mulh         t5, s0, ra
                  csrrsi       t6, 0x340, 0
                  csrrs        ra, 0x340, s11
                  mulh         s7, a3, s1
                  csrrsi       s8, 0x340, 14
                  mulh         s1, t1, s10
                  andi         a6, ra, -1391
                  slti         s2, t6, -776
                  c.or         a4, a2
                  c.srli       s0, 18
                  xori         a1, t5, 1783
                  sub          gp, t6, s7
                  div          s8, s11, s4
                  c.slli       s4, 30
                  csrrc        t6, 0x340, t6
                  c.mv         a1, s7
                  ori          a6, s3, -1711
                  c.srai       a2, 24
                  or           s10, s6, s3
                  rem          s7, zero, s0
                  sub          t5, zero, s1
                  mul          t6, a5, gp
                  auipc        tp, 856991
                  xor          s4, t1, a6
                  rem          s2, s8, t0
                  c.srli       a0, 18
                  c.add        s6, t3
                  xor          t0, s5, s10
                  c.add        a6, s6
                  la x21, test_done
                  jalr x0, x21, 0
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
                  li x25, 0xd
                  slli x25, x25, 8
                  addi x25, x25, 0x0
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x342
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x342
                  sw x25, 0(x10)
                  csrr  x25, 0x341
                  addi  x25, x25, 4
                  csrw  0x341, x25
                  add x2, x15, zero
                  lw  x1, 4(x2)
                  lw  x2, 8(x2)
                  lw  x3, 12(x2)
                  lw  x4, 16(x2)
                  lw  x5, 20(x2)
                  lw  x6, 24(x2)
                  lw  x7, 28(x2)
                  lw  x8, 32(x2)
                  lw  x9, 36(x2)
                  lw  x10, 40(x2)
                  lw  x11, 44(x2)
                  lw  x12, 48(x2)
                  lw  x13, 52(x2)
                  lw  x14, 56(x2)
                  lw  x15, 60(x2)
                  lw  x16, 64(x2)
                  lw  x17, 68(x2)
                  lw  x18, 72(x2)
                  lw  x19, 76(x2)
                  lw  x20, 80(x2)
                  lw  x21, 84(x2)
                  lw  x22, 88(x2)
                  lw  x23, 92(x2)
                  lw  x24, 96(x2)
                  lw  x25, 100(x2)
                  lw  x26, 104(x2)
                  lw  x27, 108(x2)
                  lw  x28, 112(x2)
                  lw  x29, 116(x2)
                  lw  x30, 120(x2)
                  lw  x31, 124(x2)
                  addi x2, x2, 128
                  add x15, x2, zero
                  lw  x2, (x15)
                  addi x15, x15, 4
                  mret

illegal_instr_handler:
                  li x10, 0x8ffffffc
                  li x25, 0xa
                  slli x25, x25, 8
                  addi x25, x25, 0x0
                  sw x25, 0(x10)
                  li x10, 0x8ffffffc
                  li x25, 0x342
                  slli x25, x25, 8
                  addi x25, x25, 0x3
                  sw x25, 0(x10)
                  csrr x25, 0x342
                  sw x25, 0(x10)
                  csrr  x25, 0x341
                  addi  x25, x25, 4
                  csrw  0x341, x25
                  add x2, x15, zero
                  lw  x1, 4(x2)
                  lw  x2, 8(x2)
                  lw  x3, 12(x2)
                  lw  x4, 16(x2)
                  lw  x5, 20(x2)
                  lw  x6, 24(x2)
                  lw  x7, 28(x2)
                  lw  x8, 32(x2)
                  lw  x9, 36(x2)
                  lw  x10, 40(x2)
                  lw  x11, 44(x2)
                  lw  x12, 48(x2)
                  lw  x13, 52(x2)
                  lw  x14, 56(x2)
                  lw  x15, 60(x2)
                  lw  x16, 64(x2)
                  lw  x17, 68(x2)
                  lw  x18, 72(x2)
                  lw  x19, 76(x2)
                  lw  x20, 80(x2)
                  lw  x21, 84(x2)
                  lw  x22, 88(x2)
                  lw  x23, 92(x2)
                  lw  x24, 96(x2)
                  lw  x25, 100(x2)
                  lw  x26, 104(x2)
                  lw  x27, 108(x2)
                  lw  x28, 112(x2)
                  lw  x29, 116(x2)
                  lw  x30, 120(x2)
                  lw  x31, 124(x2)
                  addi x2, x2, 128
                  add x15, x2, zero
                  lw  x2, (x15)
                  addi x15, x15, 4
                  mret

pt_fault_handler: 
                  li x10, 0x8ffffffc
                  li x25, 0x8
                  slli x25, x25, 8
                  addi x25, x25, 0x0
                  sw x25, 0(x10)
                  nop

.align 2
mmode_intr_handler:
                  csrr  x25, 0x300 # MSTATUS;
                  csrr  x25, 0x304 # MIE;
                  csrr  x25, 0x344 # MIP;
                  csrrc x25, 0x344, x25 # MIP;
                  li x10, 0x8ffffffc
                  li x25, 0x7
                  slli x25, x25, 8
                  addi x25, x25, 0x0
                  sw x25, 0(x10)
                  add x2, x15, zero
                  lw  x1, 4(x2)
                  lw  x2, 8(x2)
                  lw  x3, 12(x2)
                  lw  x4, 16(x2)
                  lw  x5, 20(x2)
                  lw  x6, 24(x2)
                  lw  x7, 28(x2)
                  lw  x8, 32(x2)
                  lw  x9, 36(x2)
                  lw  x10, 40(x2)
                  lw  x11, 44(x2)
                  lw  x12, 48(x2)
                  lw  x13, 52(x2)
                  lw  x14, 56(x2)
                  lw  x15, 60(x2)
                  lw  x16, 64(x2)
                  lw  x17, 68(x2)
                  lw  x18, 72(x2)
                  lw  x19, 76(x2)
                  lw  x20, 80(x2)
                  lw  x21, 84(x2)
                  lw  x22, 88(x2)
                  lw  x23, 92(x2)
                  lw  x24, 96(x2)
                  lw  x25, 100(x2)
                  lw  x26, 104(x2)
                  lw  x27, 108(x2)
                  lw  x28, 112(x2)
                  lw  x29, 116(x2)
                  lw  x30, 120(x2)
                  lw  x31, 124(x2)
                  addi x2, x2, 128
                  add x15, x2, zero
                  lw  x2, (x15)
                  addi x15, x15, 4
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
