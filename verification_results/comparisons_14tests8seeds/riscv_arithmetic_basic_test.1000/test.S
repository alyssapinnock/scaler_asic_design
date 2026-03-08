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
                  li x7, 0x40001106
                  csrw 0x301, x7
kernel_sp:        
                  la x12, kernel_stack_end

trap_vec_init:    
                  la x7, mtvec_handler
                  ori x7, x7, 1
                  csrw 0x305, x7 # MTVEC

pmp_setup:        
                  csrwi 0x747, 4
                  la x8, main
                  li x7, 0x0
                  add x8, x8, x7
                  srli x8, x8, 2
                  csrw 0x3b0, x8
                  la x8, main
                  li x7, 0x11111111
                  add x8, x8, x7
                  srli x8, x8, 2
                  csrw 0x3b1, x8
                  la x8, main
                  li x7, 0x22222222
                  add x8, x8, x7
                  srli x8, x8, 2
                  csrw 0x3b2, x8
                  la x8, main
                  li x7, 0x33333333
                  add x8, x8, x7
                  srli x8, x8, 2
                  csrw 0x3b3, x8
                  li x8, 0xf0f0f0f
                  csrw 0x3a0, x8
                  la x8, main
                  li x7, 0x44444444
                  add x8, x8, x7
                  srli x8, x8, 2
                  csrw 0x3b4, x8
                  la x8, main
                  li x7, 0x55555555
                  add x8, x8, x7
                  srli x8, x8, 2
                  csrw 0x3b5, x8
                  la x8, main
                  li x7, 0x66666666
                  add x8, x8, x7
                  srli x8, x8, 2
                  csrw 0x3b6, x8
                  la x8, main
                  li x7, 0x77777777
                  add x8, x8, x7
                  srli x8, x8, 2
                  csrw 0x3b7, x8
                  li x8, 0xf0f0f0f
                  csrw 0x3a1, x8
                  la x8, main
                  li x7, 0x88888888
                  add x8, x8, x7
                  srli x8, x8, 2
                  csrw 0x3b8, x8
                  la x8, main
                  li x7, 0x99999999
                  add x8, x8, x7
                  srli x8, x8, 2
                  csrw 0x3b9, x8
                  la x8, main
                  li x7, 0xaaaaaaaa
                  add x8, x8, x7
                  srli x8, x8, 2
                  csrw 0x3ba, x8
                  la x8, main
                  li x7, 0xbbbbbbbb
                  add x8, x8, x7
                  srli x8, x8, 2
                  csrw 0x3bb, x8
                  li x8, 0xf0f0f0f
                  csrw 0x3a2, x8
                  la x8, main
                  li x7, 0xcccccccc
                  add x8, x8, x7
                  srli x8, x8, 2
                  csrw 0x3bc, x8
                  la x8, main
                  li x7, 0xdddddddd
                  add x8, x8, x7
                  srli x8, x8, 2
                  csrw 0x3bd, x8
                  la x8, main
                  li x7, 0xeeeeeeee
                  add x8, x8, x7
                  srli x8, x8, 2
                  csrw 0x3be, x8
                  la x8, main
                  li x7, 0xffffffff
                  add x8, x8, x7
                  srli x8, x8, 2
                  csrw 0x3bf, x8
                  li x8, 0xf0f0f0f
                  csrw 0x3a3, x8

mepc_setup:       
                  la x7, init
                  csrw 0x341, x7

custom_csr_setup: 
                  csrwi 0x7c0, 1

init_machine_mode:
                  li x7, 0x1800
                  csrw 0x300, x7 # MSTATUS
                  li x7, 0x0
                  csrw 0x304, x7 # MIE
                  li x25, 0x8ffffffc
                  li x7, 0x300
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x300
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x304
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x304
                  sw x7, 0(x25)
                  mret
init:             
                  li x0, 0x80000000
                  li x1, 0x80000000
                  li x2, 0xf63ce95a
                  li x3, 0xf6f6fb92
                  li x4, 0xfcbe7875
                  li x5, 0xf137f929
                  li x6, 0x4
                  li x7, 0x6
                  li x8, 0x80000000
                  li x9, 0x0
                  li x10, 0x80000000
                  li x11, 0x80000000
                  li x13, 0x0
                  li x14, 0xc5d0fb96
                  li x15, 0x8f4afea
                  li x16, 0x0
                  li x17, 0xf2d2599a
                  li x18, 0xf04f5515
                  li x19, 0x4
                  li x20, 0x80000000
                  li x21, 0x0
                  li x22, 0xf9d9f3d9
                  li x23, 0x80000000
                  li x24, 0xf0a96ddf
                  li x25, 0xf4cc2bcf
                  li x26, 0x0
                  li x27, 0xf8831ce3
                  li x29, 0x0
                  li x30, 0xfc6da9b3
                  li x31, 0x80000000
                  la x28, user_stack_end
                  li x25, 0x8ffffffc
                  li x7, 0x0
                  slli x7, x7, 8
                  addi x7, x7, 0x0
                  sw x7, 0(x25)
                  j main
test_done:        
                  li x25, 0x8ffffff8
                  li x7, 0x0
                  slli x7, x7, 8
                  addi x7, x7, 0x1
                  sw x7, 0(x25)
                  ecall

test_fail:        
                  li x25, 0x8ffffff8
                  li x7, 0x1
                  slli x7, x7, 8
                  addi x7, x7, 0x1
                  sw x7, 0(x25)
                  ecall

mmode_intr_vector_1:
                  addi x12, x12, -4
                  sw  x28, (x12)
                  add x28, x12, zero
                  addi x28, x28, -128
                  sw  x1, 4(x28)
                  sw  x2, 8(x28)
                  sw  x3, 12(x28)
                  sw  x4, 16(x28)
                  sw  x5, 20(x28)
                  sw  x6, 24(x28)
                  sw  x7, 28(x28)
                  sw  x8, 32(x28)
                  sw  x9, 36(x28)
                  sw  x10, 40(x28)
                  sw  x11, 44(x28)
                  sw  x12, 48(x28)
                  sw  x13, 52(x28)
                  sw  x14, 56(x28)
                  sw  x15, 60(x28)
                  sw  x16, 64(x28)
                  sw  x17, 68(x28)
                  sw  x18, 72(x28)
                  sw  x19, 76(x28)
                  sw  x20, 80(x28)
                  sw  x21, 84(x28)
                  sw  x22, 88(x28)
                  sw  x23, 92(x28)
                  sw  x24, 96(x28)
                  sw  x25, 100(x28)
                  sw  x26, 104(x28)
                  sw  x27, 108(x28)
                  sw  x28, 112(x28)
                  sw  x29, 116(x28)
                  sw  x30, 120(x28)
                  sw  x31, 124(x28)
                  add x12, x28, zero
                  li x25, 0x8ffffffc
                  li x7, 0x6
                  slli x7, x7, 8
                  addi x7, x7, 0x0
                  sw x7, 0(x25)
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  li x25, 0x8ffffffc
                  li x7, 0x300
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x300
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x342
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x342
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x304
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x304
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x344
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x344
                  sw x7, 0(x25)
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_2:
                  addi x12, x12, -4
                  sw  x28, (x12)
                  add x28, x12, zero
                  addi x28, x28, -128
                  sw  x1, 4(x28)
                  sw  x2, 8(x28)
                  sw  x3, 12(x28)
                  sw  x4, 16(x28)
                  sw  x5, 20(x28)
                  sw  x6, 24(x28)
                  sw  x7, 28(x28)
                  sw  x8, 32(x28)
                  sw  x9, 36(x28)
                  sw  x10, 40(x28)
                  sw  x11, 44(x28)
                  sw  x12, 48(x28)
                  sw  x13, 52(x28)
                  sw  x14, 56(x28)
                  sw  x15, 60(x28)
                  sw  x16, 64(x28)
                  sw  x17, 68(x28)
                  sw  x18, 72(x28)
                  sw  x19, 76(x28)
                  sw  x20, 80(x28)
                  sw  x21, 84(x28)
                  sw  x22, 88(x28)
                  sw  x23, 92(x28)
                  sw  x24, 96(x28)
                  sw  x25, 100(x28)
                  sw  x26, 104(x28)
                  sw  x27, 108(x28)
                  sw  x28, 112(x28)
                  sw  x29, 116(x28)
                  sw  x30, 120(x28)
                  sw  x31, 124(x28)
                  add x12, x28, zero
                  li x25, 0x8ffffffc
                  li x7, 0x6
                  slli x7, x7, 8
                  addi x7, x7, 0x0
                  sw x7, 0(x25)
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  li x25, 0x8ffffffc
                  li x7, 0x300
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x300
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x342
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x342
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x304
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x304
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x344
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x344
                  sw x7, 0(x25)
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_3:
                  addi x12, x12, -4
                  sw  x28, (x12)
                  add x28, x12, zero
                  addi x28, x28, -128
                  sw  x1, 4(x28)
                  sw  x2, 8(x28)
                  sw  x3, 12(x28)
                  sw  x4, 16(x28)
                  sw  x5, 20(x28)
                  sw  x6, 24(x28)
                  sw  x7, 28(x28)
                  sw  x8, 32(x28)
                  sw  x9, 36(x28)
                  sw  x10, 40(x28)
                  sw  x11, 44(x28)
                  sw  x12, 48(x28)
                  sw  x13, 52(x28)
                  sw  x14, 56(x28)
                  sw  x15, 60(x28)
                  sw  x16, 64(x28)
                  sw  x17, 68(x28)
                  sw  x18, 72(x28)
                  sw  x19, 76(x28)
                  sw  x20, 80(x28)
                  sw  x21, 84(x28)
                  sw  x22, 88(x28)
                  sw  x23, 92(x28)
                  sw  x24, 96(x28)
                  sw  x25, 100(x28)
                  sw  x26, 104(x28)
                  sw  x27, 108(x28)
                  sw  x28, 112(x28)
                  sw  x29, 116(x28)
                  sw  x30, 120(x28)
                  sw  x31, 124(x28)
                  add x12, x28, zero
                  li x25, 0x8ffffffc
                  li x7, 0x6
                  slli x7, x7, 8
                  addi x7, x7, 0x0
                  sw x7, 0(x25)
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  li x25, 0x8ffffffc
                  li x7, 0x300
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x300
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x342
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x342
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x304
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x304
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x344
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x344
                  sw x7, 0(x25)
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_4:
                  addi x12, x12, -4
                  sw  x28, (x12)
                  add x28, x12, zero
                  addi x28, x28, -128
                  sw  x1, 4(x28)
                  sw  x2, 8(x28)
                  sw  x3, 12(x28)
                  sw  x4, 16(x28)
                  sw  x5, 20(x28)
                  sw  x6, 24(x28)
                  sw  x7, 28(x28)
                  sw  x8, 32(x28)
                  sw  x9, 36(x28)
                  sw  x10, 40(x28)
                  sw  x11, 44(x28)
                  sw  x12, 48(x28)
                  sw  x13, 52(x28)
                  sw  x14, 56(x28)
                  sw  x15, 60(x28)
                  sw  x16, 64(x28)
                  sw  x17, 68(x28)
                  sw  x18, 72(x28)
                  sw  x19, 76(x28)
                  sw  x20, 80(x28)
                  sw  x21, 84(x28)
                  sw  x22, 88(x28)
                  sw  x23, 92(x28)
                  sw  x24, 96(x28)
                  sw  x25, 100(x28)
                  sw  x26, 104(x28)
                  sw  x27, 108(x28)
                  sw  x28, 112(x28)
                  sw  x29, 116(x28)
                  sw  x30, 120(x28)
                  sw  x31, 124(x28)
                  add x12, x28, zero
                  li x25, 0x8ffffffc
                  li x7, 0x6
                  slli x7, x7, 8
                  addi x7, x7, 0x0
                  sw x7, 0(x25)
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  li x25, 0x8ffffffc
                  li x7, 0x300
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x300
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x342
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x342
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x304
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x304
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x344
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x344
                  sw x7, 0(x25)
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_5:
                  addi x12, x12, -4
                  sw  x28, (x12)
                  add x28, x12, zero
                  addi x28, x28, -128
                  sw  x1, 4(x28)
                  sw  x2, 8(x28)
                  sw  x3, 12(x28)
                  sw  x4, 16(x28)
                  sw  x5, 20(x28)
                  sw  x6, 24(x28)
                  sw  x7, 28(x28)
                  sw  x8, 32(x28)
                  sw  x9, 36(x28)
                  sw  x10, 40(x28)
                  sw  x11, 44(x28)
                  sw  x12, 48(x28)
                  sw  x13, 52(x28)
                  sw  x14, 56(x28)
                  sw  x15, 60(x28)
                  sw  x16, 64(x28)
                  sw  x17, 68(x28)
                  sw  x18, 72(x28)
                  sw  x19, 76(x28)
                  sw  x20, 80(x28)
                  sw  x21, 84(x28)
                  sw  x22, 88(x28)
                  sw  x23, 92(x28)
                  sw  x24, 96(x28)
                  sw  x25, 100(x28)
                  sw  x26, 104(x28)
                  sw  x27, 108(x28)
                  sw  x28, 112(x28)
                  sw  x29, 116(x28)
                  sw  x30, 120(x28)
                  sw  x31, 124(x28)
                  add x12, x28, zero
                  li x25, 0x8ffffffc
                  li x7, 0x6
                  slli x7, x7, 8
                  addi x7, x7, 0x0
                  sw x7, 0(x25)
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  li x25, 0x8ffffffc
                  li x7, 0x300
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x300
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x342
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x342
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x304
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x304
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x344
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x344
                  sw x7, 0(x25)
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_6:
                  addi x12, x12, -4
                  sw  x28, (x12)
                  add x28, x12, zero
                  addi x28, x28, -128
                  sw  x1, 4(x28)
                  sw  x2, 8(x28)
                  sw  x3, 12(x28)
                  sw  x4, 16(x28)
                  sw  x5, 20(x28)
                  sw  x6, 24(x28)
                  sw  x7, 28(x28)
                  sw  x8, 32(x28)
                  sw  x9, 36(x28)
                  sw  x10, 40(x28)
                  sw  x11, 44(x28)
                  sw  x12, 48(x28)
                  sw  x13, 52(x28)
                  sw  x14, 56(x28)
                  sw  x15, 60(x28)
                  sw  x16, 64(x28)
                  sw  x17, 68(x28)
                  sw  x18, 72(x28)
                  sw  x19, 76(x28)
                  sw  x20, 80(x28)
                  sw  x21, 84(x28)
                  sw  x22, 88(x28)
                  sw  x23, 92(x28)
                  sw  x24, 96(x28)
                  sw  x25, 100(x28)
                  sw  x26, 104(x28)
                  sw  x27, 108(x28)
                  sw  x28, 112(x28)
                  sw  x29, 116(x28)
                  sw  x30, 120(x28)
                  sw  x31, 124(x28)
                  add x12, x28, zero
                  li x25, 0x8ffffffc
                  li x7, 0x6
                  slli x7, x7, 8
                  addi x7, x7, 0x0
                  sw x7, 0(x25)
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  li x25, 0x8ffffffc
                  li x7, 0x300
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x300
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x342
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x342
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x304
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x304
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x344
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x344
                  sw x7, 0(x25)
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_7:
                  addi x12, x12, -4
                  sw  x28, (x12)
                  add x28, x12, zero
                  addi x28, x28, -128
                  sw  x1, 4(x28)
                  sw  x2, 8(x28)
                  sw  x3, 12(x28)
                  sw  x4, 16(x28)
                  sw  x5, 20(x28)
                  sw  x6, 24(x28)
                  sw  x7, 28(x28)
                  sw  x8, 32(x28)
                  sw  x9, 36(x28)
                  sw  x10, 40(x28)
                  sw  x11, 44(x28)
                  sw  x12, 48(x28)
                  sw  x13, 52(x28)
                  sw  x14, 56(x28)
                  sw  x15, 60(x28)
                  sw  x16, 64(x28)
                  sw  x17, 68(x28)
                  sw  x18, 72(x28)
                  sw  x19, 76(x28)
                  sw  x20, 80(x28)
                  sw  x21, 84(x28)
                  sw  x22, 88(x28)
                  sw  x23, 92(x28)
                  sw  x24, 96(x28)
                  sw  x25, 100(x28)
                  sw  x26, 104(x28)
                  sw  x27, 108(x28)
                  sw  x28, 112(x28)
                  sw  x29, 116(x28)
                  sw  x30, 120(x28)
                  sw  x31, 124(x28)
                  add x12, x28, zero
                  li x25, 0x8ffffffc
                  li x7, 0x6
                  slli x7, x7, 8
                  addi x7, x7, 0x0
                  sw x7, 0(x25)
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  li x25, 0x8ffffffc
                  li x7, 0x300
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x300
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x342
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x342
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x304
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x304
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x344
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x344
                  sw x7, 0(x25)
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_8:
                  addi x12, x12, -4
                  sw  x28, (x12)
                  add x28, x12, zero
                  addi x28, x28, -128
                  sw  x1, 4(x28)
                  sw  x2, 8(x28)
                  sw  x3, 12(x28)
                  sw  x4, 16(x28)
                  sw  x5, 20(x28)
                  sw  x6, 24(x28)
                  sw  x7, 28(x28)
                  sw  x8, 32(x28)
                  sw  x9, 36(x28)
                  sw  x10, 40(x28)
                  sw  x11, 44(x28)
                  sw  x12, 48(x28)
                  sw  x13, 52(x28)
                  sw  x14, 56(x28)
                  sw  x15, 60(x28)
                  sw  x16, 64(x28)
                  sw  x17, 68(x28)
                  sw  x18, 72(x28)
                  sw  x19, 76(x28)
                  sw  x20, 80(x28)
                  sw  x21, 84(x28)
                  sw  x22, 88(x28)
                  sw  x23, 92(x28)
                  sw  x24, 96(x28)
                  sw  x25, 100(x28)
                  sw  x26, 104(x28)
                  sw  x27, 108(x28)
                  sw  x28, 112(x28)
                  sw  x29, 116(x28)
                  sw  x30, 120(x28)
                  sw  x31, 124(x28)
                  add x12, x28, zero
                  li x25, 0x8ffffffc
                  li x7, 0x6
                  slli x7, x7, 8
                  addi x7, x7, 0x0
                  sw x7, 0(x25)
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  li x25, 0x8ffffffc
                  li x7, 0x300
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x300
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x342
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x342
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x304
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x304
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x344
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x344
                  sw x7, 0(x25)
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_9:
                  addi x12, x12, -4
                  sw  x28, (x12)
                  add x28, x12, zero
                  addi x28, x28, -128
                  sw  x1, 4(x28)
                  sw  x2, 8(x28)
                  sw  x3, 12(x28)
                  sw  x4, 16(x28)
                  sw  x5, 20(x28)
                  sw  x6, 24(x28)
                  sw  x7, 28(x28)
                  sw  x8, 32(x28)
                  sw  x9, 36(x28)
                  sw  x10, 40(x28)
                  sw  x11, 44(x28)
                  sw  x12, 48(x28)
                  sw  x13, 52(x28)
                  sw  x14, 56(x28)
                  sw  x15, 60(x28)
                  sw  x16, 64(x28)
                  sw  x17, 68(x28)
                  sw  x18, 72(x28)
                  sw  x19, 76(x28)
                  sw  x20, 80(x28)
                  sw  x21, 84(x28)
                  sw  x22, 88(x28)
                  sw  x23, 92(x28)
                  sw  x24, 96(x28)
                  sw  x25, 100(x28)
                  sw  x26, 104(x28)
                  sw  x27, 108(x28)
                  sw  x28, 112(x28)
                  sw  x29, 116(x28)
                  sw  x30, 120(x28)
                  sw  x31, 124(x28)
                  add x12, x28, zero
                  li x25, 0x8ffffffc
                  li x7, 0x6
                  slli x7, x7, 8
                  addi x7, x7, 0x0
                  sw x7, 0(x25)
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  li x25, 0x8ffffffc
                  li x7, 0x300
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x300
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x342
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x342
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x304
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x304
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x344
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x344
                  sw x7, 0(x25)
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_10:
                  addi x12, x12, -4
                  sw  x28, (x12)
                  add x28, x12, zero
                  addi x28, x28, -128
                  sw  x1, 4(x28)
                  sw  x2, 8(x28)
                  sw  x3, 12(x28)
                  sw  x4, 16(x28)
                  sw  x5, 20(x28)
                  sw  x6, 24(x28)
                  sw  x7, 28(x28)
                  sw  x8, 32(x28)
                  sw  x9, 36(x28)
                  sw  x10, 40(x28)
                  sw  x11, 44(x28)
                  sw  x12, 48(x28)
                  sw  x13, 52(x28)
                  sw  x14, 56(x28)
                  sw  x15, 60(x28)
                  sw  x16, 64(x28)
                  sw  x17, 68(x28)
                  sw  x18, 72(x28)
                  sw  x19, 76(x28)
                  sw  x20, 80(x28)
                  sw  x21, 84(x28)
                  sw  x22, 88(x28)
                  sw  x23, 92(x28)
                  sw  x24, 96(x28)
                  sw  x25, 100(x28)
                  sw  x26, 104(x28)
                  sw  x27, 108(x28)
                  sw  x28, 112(x28)
                  sw  x29, 116(x28)
                  sw  x30, 120(x28)
                  sw  x31, 124(x28)
                  add x12, x28, zero
                  li x25, 0x8ffffffc
                  li x7, 0x6
                  slli x7, x7, 8
                  addi x7, x7, 0x0
                  sw x7, 0(x25)
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  li x25, 0x8ffffffc
                  li x7, 0x300
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x300
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x342
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x342
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x304
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x304
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x344
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x344
                  sw x7, 0(x25)
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_11:
                  addi x12, x12, -4
                  sw  x28, (x12)
                  add x28, x12, zero
                  addi x28, x28, -128
                  sw  x1, 4(x28)
                  sw  x2, 8(x28)
                  sw  x3, 12(x28)
                  sw  x4, 16(x28)
                  sw  x5, 20(x28)
                  sw  x6, 24(x28)
                  sw  x7, 28(x28)
                  sw  x8, 32(x28)
                  sw  x9, 36(x28)
                  sw  x10, 40(x28)
                  sw  x11, 44(x28)
                  sw  x12, 48(x28)
                  sw  x13, 52(x28)
                  sw  x14, 56(x28)
                  sw  x15, 60(x28)
                  sw  x16, 64(x28)
                  sw  x17, 68(x28)
                  sw  x18, 72(x28)
                  sw  x19, 76(x28)
                  sw  x20, 80(x28)
                  sw  x21, 84(x28)
                  sw  x22, 88(x28)
                  sw  x23, 92(x28)
                  sw  x24, 96(x28)
                  sw  x25, 100(x28)
                  sw  x26, 104(x28)
                  sw  x27, 108(x28)
                  sw  x28, 112(x28)
                  sw  x29, 116(x28)
                  sw  x30, 120(x28)
                  sw  x31, 124(x28)
                  add x12, x28, zero
                  li x25, 0x8ffffffc
                  li x7, 0x6
                  slli x7, x7, 8
                  addi x7, x7, 0x0
                  sw x7, 0(x25)
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  li x25, 0x8ffffffc
                  li x7, 0x300
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x300
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x342
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x342
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x304
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x304
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x344
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x344
                  sw x7, 0(x25)
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_12:
                  addi x12, x12, -4
                  sw  x28, (x12)
                  add x28, x12, zero
                  addi x28, x28, -128
                  sw  x1, 4(x28)
                  sw  x2, 8(x28)
                  sw  x3, 12(x28)
                  sw  x4, 16(x28)
                  sw  x5, 20(x28)
                  sw  x6, 24(x28)
                  sw  x7, 28(x28)
                  sw  x8, 32(x28)
                  sw  x9, 36(x28)
                  sw  x10, 40(x28)
                  sw  x11, 44(x28)
                  sw  x12, 48(x28)
                  sw  x13, 52(x28)
                  sw  x14, 56(x28)
                  sw  x15, 60(x28)
                  sw  x16, 64(x28)
                  sw  x17, 68(x28)
                  sw  x18, 72(x28)
                  sw  x19, 76(x28)
                  sw  x20, 80(x28)
                  sw  x21, 84(x28)
                  sw  x22, 88(x28)
                  sw  x23, 92(x28)
                  sw  x24, 96(x28)
                  sw  x25, 100(x28)
                  sw  x26, 104(x28)
                  sw  x27, 108(x28)
                  sw  x28, 112(x28)
                  sw  x29, 116(x28)
                  sw  x30, 120(x28)
                  sw  x31, 124(x28)
                  add x12, x28, zero
                  li x25, 0x8ffffffc
                  li x7, 0x6
                  slli x7, x7, 8
                  addi x7, x7, 0x0
                  sw x7, 0(x25)
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  li x25, 0x8ffffffc
                  li x7, 0x300
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x300
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x342
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x342
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x304
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x304
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x344
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x344
                  sw x7, 0(x25)
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_13:
                  addi x12, x12, -4
                  sw  x28, (x12)
                  add x28, x12, zero
                  addi x28, x28, -128
                  sw  x1, 4(x28)
                  sw  x2, 8(x28)
                  sw  x3, 12(x28)
                  sw  x4, 16(x28)
                  sw  x5, 20(x28)
                  sw  x6, 24(x28)
                  sw  x7, 28(x28)
                  sw  x8, 32(x28)
                  sw  x9, 36(x28)
                  sw  x10, 40(x28)
                  sw  x11, 44(x28)
                  sw  x12, 48(x28)
                  sw  x13, 52(x28)
                  sw  x14, 56(x28)
                  sw  x15, 60(x28)
                  sw  x16, 64(x28)
                  sw  x17, 68(x28)
                  sw  x18, 72(x28)
                  sw  x19, 76(x28)
                  sw  x20, 80(x28)
                  sw  x21, 84(x28)
                  sw  x22, 88(x28)
                  sw  x23, 92(x28)
                  sw  x24, 96(x28)
                  sw  x25, 100(x28)
                  sw  x26, 104(x28)
                  sw  x27, 108(x28)
                  sw  x28, 112(x28)
                  sw  x29, 116(x28)
                  sw  x30, 120(x28)
                  sw  x31, 124(x28)
                  add x12, x28, zero
                  li x25, 0x8ffffffc
                  li x7, 0x6
                  slli x7, x7, 8
                  addi x7, x7, 0x0
                  sw x7, 0(x25)
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  li x25, 0x8ffffffc
                  li x7, 0x300
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x300
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x342
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x342
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x304
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x304
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x344
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x344
                  sw x7, 0(x25)
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_14:
                  addi x12, x12, -4
                  sw  x28, (x12)
                  add x28, x12, zero
                  addi x28, x28, -128
                  sw  x1, 4(x28)
                  sw  x2, 8(x28)
                  sw  x3, 12(x28)
                  sw  x4, 16(x28)
                  sw  x5, 20(x28)
                  sw  x6, 24(x28)
                  sw  x7, 28(x28)
                  sw  x8, 32(x28)
                  sw  x9, 36(x28)
                  sw  x10, 40(x28)
                  sw  x11, 44(x28)
                  sw  x12, 48(x28)
                  sw  x13, 52(x28)
                  sw  x14, 56(x28)
                  sw  x15, 60(x28)
                  sw  x16, 64(x28)
                  sw  x17, 68(x28)
                  sw  x18, 72(x28)
                  sw  x19, 76(x28)
                  sw  x20, 80(x28)
                  sw  x21, 84(x28)
                  sw  x22, 88(x28)
                  sw  x23, 92(x28)
                  sw  x24, 96(x28)
                  sw  x25, 100(x28)
                  sw  x26, 104(x28)
                  sw  x27, 108(x28)
                  sw  x28, 112(x28)
                  sw  x29, 116(x28)
                  sw  x30, 120(x28)
                  sw  x31, 124(x28)
                  add x12, x28, zero
                  li x25, 0x8ffffffc
                  li x7, 0x6
                  slli x7, x7, 8
                  addi x7, x7, 0x0
                  sw x7, 0(x25)
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  li x25, 0x8ffffffc
                  li x7, 0x300
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x300
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x342
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x342
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x304
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x304
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x344
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x344
                  sw x7, 0(x25)
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_15:
                  addi x12, x12, -4
                  sw  x28, (x12)
                  add x28, x12, zero
                  addi x28, x28, -128
                  sw  x1, 4(x28)
                  sw  x2, 8(x28)
                  sw  x3, 12(x28)
                  sw  x4, 16(x28)
                  sw  x5, 20(x28)
                  sw  x6, 24(x28)
                  sw  x7, 28(x28)
                  sw  x8, 32(x28)
                  sw  x9, 36(x28)
                  sw  x10, 40(x28)
                  sw  x11, 44(x28)
                  sw  x12, 48(x28)
                  sw  x13, 52(x28)
                  sw  x14, 56(x28)
                  sw  x15, 60(x28)
                  sw  x16, 64(x28)
                  sw  x17, 68(x28)
                  sw  x18, 72(x28)
                  sw  x19, 76(x28)
                  sw  x20, 80(x28)
                  sw  x21, 84(x28)
                  sw  x22, 88(x28)
                  sw  x23, 92(x28)
                  sw  x24, 96(x28)
                  sw  x25, 100(x28)
                  sw  x26, 104(x28)
                  sw  x27, 108(x28)
                  sw  x28, 112(x28)
                  sw  x29, 116(x28)
                  sw  x30, 120(x28)
                  sw  x31, 124(x28)
                  add x12, x28, zero
                  li x25, 0x8ffffffc
                  li x7, 0x6
                  slli x7, x7, 8
                  addi x7, x7, 0x0
                  sw x7, 0(x25)
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  li x25, 0x8ffffffc
                  li x7, 0x300
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x300
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x342
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x342
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x304
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x304
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x344
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x344
                  sw x7, 0(x25)
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_16:
                  addi x12, x12, -4
                  sw  x28, (x12)
                  add x28, x12, zero
                  addi x28, x28, -128
                  sw  x1, 4(x28)
                  sw  x2, 8(x28)
                  sw  x3, 12(x28)
                  sw  x4, 16(x28)
                  sw  x5, 20(x28)
                  sw  x6, 24(x28)
                  sw  x7, 28(x28)
                  sw  x8, 32(x28)
                  sw  x9, 36(x28)
                  sw  x10, 40(x28)
                  sw  x11, 44(x28)
                  sw  x12, 48(x28)
                  sw  x13, 52(x28)
                  sw  x14, 56(x28)
                  sw  x15, 60(x28)
                  sw  x16, 64(x28)
                  sw  x17, 68(x28)
                  sw  x18, 72(x28)
                  sw  x19, 76(x28)
                  sw  x20, 80(x28)
                  sw  x21, 84(x28)
                  sw  x22, 88(x28)
                  sw  x23, 92(x28)
                  sw  x24, 96(x28)
                  sw  x25, 100(x28)
                  sw  x26, 104(x28)
                  sw  x27, 108(x28)
                  sw  x28, 112(x28)
                  sw  x29, 116(x28)
                  sw  x30, 120(x28)
                  sw  x31, 124(x28)
                  add x12, x28, zero
                  li x25, 0x8ffffffc
                  li x7, 0x6
                  slli x7, x7, 8
                  addi x7, x7, 0x0
                  sw x7, 0(x25)
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  li x25, 0x8ffffffc
                  li x7, 0x300
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x300
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x342
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x342
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x304
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x304
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x344
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x344
                  sw x7, 0(x25)
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_17:
                  addi x12, x12, -4
                  sw  x28, (x12)
                  add x28, x12, zero
                  addi x28, x28, -128
                  sw  x1, 4(x28)
                  sw  x2, 8(x28)
                  sw  x3, 12(x28)
                  sw  x4, 16(x28)
                  sw  x5, 20(x28)
                  sw  x6, 24(x28)
                  sw  x7, 28(x28)
                  sw  x8, 32(x28)
                  sw  x9, 36(x28)
                  sw  x10, 40(x28)
                  sw  x11, 44(x28)
                  sw  x12, 48(x28)
                  sw  x13, 52(x28)
                  sw  x14, 56(x28)
                  sw  x15, 60(x28)
                  sw  x16, 64(x28)
                  sw  x17, 68(x28)
                  sw  x18, 72(x28)
                  sw  x19, 76(x28)
                  sw  x20, 80(x28)
                  sw  x21, 84(x28)
                  sw  x22, 88(x28)
                  sw  x23, 92(x28)
                  sw  x24, 96(x28)
                  sw  x25, 100(x28)
                  sw  x26, 104(x28)
                  sw  x27, 108(x28)
                  sw  x28, 112(x28)
                  sw  x29, 116(x28)
                  sw  x30, 120(x28)
                  sw  x31, 124(x28)
                  add x12, x28, zero
                  li x25, 0x8ffffffc
                  li x7, 0x6
                  slli x7, x7, 8
                  addi x7, x7, 0x0
                  sw x7, 0(x25)
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  li x25, 0x8ffffffc
                  li x7, 0x300
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x300
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x342
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x342
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x304
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x304
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x344
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x344
                  sw x7, 0(x25)
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_18:
                  addi x12, x12, -4
                  sw  x28, (x12)
                  add x28, x12, zero
                  addi x28, x28, -128
                  sw  x1, 4(x28)
                  sw  x2, 8(x28)
                  sw  x3, 12(x28)
                  sw  x4, 16(x28)
                  sw  x5, 20(x28)
                  sw  x6, 24(x28)
                  sw  x7, 28(x28)
                  sw  x8, 32(x28)
                  sw  x9, 36(x28)
                  sw  x10, 40(x28)
                  sw  x11, 44(x28)
                  sw  x12, 48(x28)
                  sw  x13, 52(x28)
                  sw  x14, 56(x28)
                  sw  x15, 60(x28)
                  sw  x16, 64(x28)
                  sw  x17, 68(x28)
                  sw  x18, 72(x28)
                  sw  x19, 76(x28)
                  sw  x20, 80(x28)
                  sw  x21, 84(x28)
                  sw  x22, 88(x28)
                  sw  x23, 92(x28)
                  sw  x24, 96(x28)
                  sw  x25, 100(x28)
                  sw  x26, 104(x28)
                  sw  x27, 108(x28)
                  sw  x28, 112(x28)
                  sw  x29, 116(x28)
                  sw  x30, 120(x28)
                  sw  x31, 124(x28)
                  add x12, x28, zero
                  li x25, 0x8ffffffc
                  li x7, 0x6
                  slli x7, x7, 8
                  addi x7, x7, 0x0
                  sw x7, 0(x25)
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  li x25, 0x8ffffffc
                  li x7, 0x300
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x300
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x342
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x342
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x304
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x304
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x344
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x344
                  sw x7, 0(x25)
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_19:
                  addi x12, x12, -4
                  sw  x28, (x12)
                  add x28, x12, zero
                  addi x28, x28, -128
                  sw  x1, 4(x28)
                  sw  x2, 8(x28)
                  sw  x3, 12(x28)
                  sw  x4, 16(x28)
                  sw  x5, 20(x28)
                  sw  x6, 24(x28)
                  sw  x7, 28(x28)
                  sw  x8, 32(x28)
                  sw  x9, 36(x28)
                  sw  x10, 40(x28)
                  sw  x11, 44(x28)
                  sw  x12, 48(x28)
                  sw  x13, 52(x28)
                  sw  x14, 56(x28)
                  sw  x15, 60(x28)
                  sw  x16, 64(x28)
                  sw  x17, 68(x28)
                  sw  x18, 72(x28)
                  sw  x19, 76(x28)
                  sw  x20, 80(x28)
                  sw  x21, 84(x28)
                  sw  x22, 88(x28)
                  sw  x23, 92(x28)
                  sw  x24, 96(x28)
                  sw  x25, 100(x28)
                  sw  x26, 104(x28)
                  sw  x27, 108(x28)
                  sw  x28, 112(x28)
                  sw  x29, 116(x28)
                  sw  x30, 120(x28)
                  sw  x31, 124(x28)
                  add x12, x28, zero
                  li x25, 0x8ffffffc
                  li x7, 0x6
                  slli x7, x7, 8
                  addi x7, x7, 0x0
                  sw x7, 0(x25)
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  li x25, 0x8ffffffc
                  li x7, 0x300
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x300
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x342
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x342
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x304
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x304
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x344
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x344
                  sw x7, 0(x25)
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_20:
                  addi x12, x12, -4
                  sw  x28, (x12)
                  add x28, x12, zero
                  addi x28, x28, -128
                  sw  x1, 4(x28)
                  sw  x2, 8(x28)
                  sw  x3, 12(x28)
                  sw  x4, 16(x28)
                  sw  x5, 20(x28)
                  sw  x6, 24(x28)
                  sw  x7, 28(x28)
                  sw  x8, 32(x28)
                  sw  x9, 36(x28)
                  sw  x10, 40(x28)
                  sw  x11, 44(x28)
                  sw  x12, 48(x28)
                  sw  x13, 52(x28)
                  sw  x14, 56(x28)
                  sw  x15, 60(x28)
                  sw  x16, 64(x28)
                  sw  x17, 68(x28)
                  sw  x18, 72(x28)
                  sw  x19, 76(x28)
                  sw  x20, 80(x28)
                  sw  x21, 84(x28)
                  sw  x22, 88(x28)
                  sw  x23, 92(x28)
                  sw  x24, 96(x28)
                  sw  x25, 100(x28)
                  sw  x26, 104(x28)
                  sw  x27, 108(x28)
                  sw  x28, 112(x28)
                  sw  x29, 116(x28)
                  sw  x30, 120(x28)
                  sw  x31, 124(x28)
                  add x12, x28, zero
                  li x25, 0x8ffffffc
                  li x7, 0x6
                  slli x7, x7, 8
                  addi x7, x7, 0x0
                  sw x7, 0(x25)
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  li x25, 0x8ffffffc
                  li x7, 0x300
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x300
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x342
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x342
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x304
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x304
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x344
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x344
                  sw x7, 0(x25)
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_21:
                  addi x12, x12, -4
                  sw  x28, (x12)
                  add x28, x12, zero
                  addi x28, x28, -128
                  sw  x1, 4(x28)
                  sw  x2, 8(x28)
                  sw  x3, 12(x28)
                  sw  x4, 16(x28)
                  sw  x5, 20(x28)
                  sw  x6, 24(x28)
                  sw  x7, 28(x28)
                  sw  x8, 32(x28)
                  sw  x9, 36(x28)
                  sw  x10, 40(x28)
                  sw  x11, 44(x28)
                  sw  x12, 48(x28)
                  sw  x13, 52(x28)
                  sw  x14, 56(x28)
                  sw  x15, 60(x28)
                  sw  x16, 64(x28)
                  sw  x17, 68(x28)
                  sw  x18, 72(x28)
                  sw  x19, 76(x28)
                  sw  x20, 80(x28)
                  sw  x21, 84(x28)
                  sw  x22, 88(x28)
                  sw  x23, 92(x28)
                  sw  x24, 96(x28)
                  sw  x25, 100(x28)
                  sw  x26, 104(x28)
                  sw  x27, 108(x28)
                  sw  x28, 112(x28)
                  sw  x29, 116(x28)
                  sw  x30, 120(x28)
                  sw  x31, 124(x28)
                  add x12, x28, zero
                  li x25, 0x8ffffffc
                  li x7, 0x6
                  slli x7, x7, 8
                  addi x7, x7, 0x0
                  sw x7, 0(x25)
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  li x25, 0x8ffffffc
                  li x7, 0x300
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x300
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x342
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x342
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x304
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x304
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x344
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x344
                  sw x7, 0(x25)
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_22:
                  addi x12, x12, -4
                  sw  x28, (x12)
                  add x28, x12, zero
                  addi x28, x28, -128
                  sw  x1, 4(x28)
                  sw  x2, 8(x28)
                  sw  x3, 12(x28)
                  sw  x4, 16(x28)
                  sw  x5, 20(x28)
                  sw  x6, 24(x28)
                  sw  x7, 28(x28)
                  sw  x8, 32(x28)
                  sw  x9, 36(x28)
                  sw  x10, 40(x28)
                  sw  x11, 44(x28)
                  sw  x12, 48(x28)
                  sw  x13, 52(x28)
                  sw  x14, 56(x28)
                  sw  x15, 60(x28)
                  sw  x16, 64(x28)
                  sw  x17, 68(x28)
                  sw  x18, 72(x28)
                  sw  x19, 76(x28)
                  sw  x20, 80(x28)
                  sw  x21, 84(x28)
                  sw  x22, 88(x28)
                  sw  x23, 92(x28)
                  sw  x24, 96(x28)
                  sw  x25, 100(x28)
                  sw  x26, 104(x28)
                  sw  x27, 108(x28)
                  sw  x28, 112(x28)
                  sw  x29, 116(x28)
                  sw  x30, 120(x28)
                  sw  x31, 124(x28)
                  add x12, x28, zero
                  li x25, 0x8ffffffc
                  li x7, 0x6
                  slli x7, x7, 8
                  addi x7, x7, 0x0
                  sw x7, 0(x25)
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  li x25, 0x8ffffffc
                  li x7, 0x300
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x300
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x342
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x342
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x304
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x304
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x344
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x344
                  sw x7, 0(x25)
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_23:
                  addi x12, x12, -4
                  sw  x28, (x12)
                  add x28, x12, zero
                  addi x28, x28, -128
                  sw  x1, 4(x28)
                  sw  x2, 8(x28)
                  sw  x3, 12(x28)
                  sw  x4, 16(x28)
                  sw  x5, 20(x28)
                  sw  x6, 24(x28)
                  sw  x7, 28(x28)
                  sw  x8, 32(x28)
                  sw  x9, 36(x28)
                  sw  x10, 40(x28)
                  sw  x11, 44(x28)
                  sw  x12, 48(x28)
                  sw  x13, 52(x28)
                  sw  x14, 56(x28)
                  sw  x15, 60(x28)
                  sw  x16, 64(x28)
                  sw  x17, 68(x28)
                  sw  x18, 72(x28)
                  sw  x19, 76(x28)
                  sw  x20, 80(x28)
                  sw  x21, 84(x28)
                  sw  x22, 88(x28)
                  sw  x23, 92(x28)
                  sw  x24, 96(x28)
                  sw  x25, 100(x28)
                  sw  x26, 104(x28)
                  sw  x27, 108(x28)
                  sw  x28, 112(x28)
                  sw  x29, 116(x28)
                  sw  x30, 120(x28)
                  sw  x31, 124(x28)
                  add x12, x28, zero
                  li x25, 0x8ffffffc
                  li x7, 0x6
                  slli x7, x7, 8
                  addi x7, x7, 0x0
                  sw x7, 0(x25)
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  li x25, 0x8ffffffc
                  li x7, 0x300
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x300
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x342
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x342
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x304
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x304
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x344
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x344
                  sw x7, 0(x25)
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_24:
                  addi x12, x12, -4
                  sw  x28, (x12)
                  add x28, x12, zero
                  addi x28, x28, -128
                  sw  x1, 4(x28)
                  sw  x2, 8(x28)
                  sw  x3, 12(x28)
                  sw  x4, 16(x28)
                  sw  x5, 20(x28)
                  sw  x6, 24(x28)
                  sw  x7, 28(x28)
                  sw  x8, 32(x28)
                  sw  x9, 36(x28)
                  sw  x10, 40(x28)
                  sw  x11, 44(x28)
                  sw  x12, 48(x28)
                  sw  x13, 52(x28)
                  sw  x14, 56(x28)
                  sw  x15, 60(x28)
                  sw  x16, 64(x28)
                  sw  x17, 68(x28)
                  sw  x18, 72(x28)
                  sw  x19, 76(x28)
                  sw  x20, 80(x28)
                  sw  x21, 84(x28)
                  sw  x22, 88(x28)
                  sw  x23, 92(x28)
                  sw  x24, 96(x28)
                  sw  x25, 100(x28)
                  sw  x26, 104(x28)
                  sw  x27, 108(x28)
                  sw  x28, 112(x28)
                  sw  x29, 116(x28)
                  sw  x30, 120(x28)
                  sw  x31, 124(x28)
                  add x12, x28, zero
                  li x25, 0x8ffffffc
                  li x7, 0x6
                  slli x7, x7, 8
                  addi x7, x7, 0x0
                  sw x7, 0(x25)
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  li x25, 0x8ffffffc
                  li x7, 0x300
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x300
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x342
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x342
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x304
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x304
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x344
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x344
                  sw x7, 0(x25)
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_25:
                  addi x12, x12, -4
                  sw  x28, (x12)
                  add x28, x12, zero
                  addi x28, x28, -128
                  sw  x1, 4(x28)
                  sw  x2, 8(x28)
                  sw  x3, 12(x28)
                  sw  x4, 16(x28)
                  sw  x5, 20(x28)
                  sw  x6, 24(x28)
                  sw  x7, 28(x28)
                  sw  x8, 32(x28)
                  sw  x9, 36(x28)
                  sw  x10, 40(x28)
                  sw  x11, 44(x28)
                  sw  x12, 48(x28)
                  sw  x13, 52(x28)
                  sw  x14, 56(x28)
                  sw  x15, 60(x28)
                  sw  x16, 64(x28)
                  sw  x17, 68(x28)
                  sw  x18, 72(x28)
                  sw  x19, 76(x28)
                  sw  x20, 80(x28)
                  sw  x21, 84(x28)
                  sw  x22, 88(x28)
                  sw  x23, 92(x28)
                  sw  x24, 96(x28)
                  sw  x25, 100(x28)
                  sw  x26, 104(x28)
                  sw  x27, 108(x28)
                  sw  x28, 112(x28)
                  sw  x29, 116(x28)
                  sw  x30, 120(x28)
                  sw  x31, 124(x28)
                  add x12, x28, zero
                  li x25, 0x8ffffffc
                  li x7, 0x6
                  slli x7, x7, 8
                  addi x7, x7, 0x0
                  sw x7, 0(x25)
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  li x25, 0x8ffffffc
                  li x7, 0x300
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x300
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x342
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x342
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x304
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x304
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x344
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x344
                  sw x7, 0(x25)
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_26:
                  addi x12, x12, -4
                  sw  x28, (x12)
                  add x28, x12, zero
                  addi x28, x28, -128
                  sw  x1, 4(x28)
                  sw  x2, 8(x28)
                  sw  x3, 12(x28)
                  sw  x4, 16(x28)
                  sw  x5, 20(x28)
                  sw  x6, 24(x28)
                  sw  x7, 28(x28)
                  sw  x8, 32(x28)
                  sw  x9, 36(x28)
                  sw  x10, 40(x28)
                  sw  x11, 44(x28)
                  sw  x12, 48(x28)
                  sw  x13, 52(x28)
                  sw  x14, 56(x28)
                  sw  x15, 60(x28)
                  sw  x16, 64(x28)
                  sw  x17, 68(x28)
                  sw  x18, 72(x28)
                  sw  x19, 76(x28)
                  sw  x20, 80(x28)
                  sw  x21, 84(x28)
                  sw  x22, 88(x28)
                  sw  x23, 92(x28)
                  sw  x24, 96(x28)
                  sw  x25, 100(x28)
                  sw  x26, 104(x28)
                  sw  x27, 108(x28)
                  sw  x28, 112(x28)
                  sw  x29, 116(x28)
                  sw  x30, 120(x28)
                  sw  x31, 124(x28)
                  add x12, x28, zero
                  li x25, 0x8ffffffc
                  li x7, 0x6
                  slli x7, x7, 8
                  addi x7, x7, 0x0
                  sw x7, 0(x25)
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  li x25, 0x8ffffffc
                  li x7, 0x300
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x300
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x342
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x342
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x304
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x304
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x344
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x344
                  sw x7, 0(x25)
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_27:
                  addi x12, x12, -4
                  sw  x28, (x12)
                  add x28, x12, zero
                  addi x28, x28, -128
                  sw  x1, 4(x28)
                  sw  x2, 8(x28)
                  sw  x3, 12(x28)
                  sw  x4, 16(x28)
                  sw  x5, 20(x28)
                  sw  x6, 24(x28)
                  sw  x7, 28(x28)
                  sw  x8, 32(x28)
                  sw  x9, 36(x28)
                  sw  x10, 40(x28)
                  sw  x11, 44(x28)
                  sw  x12, 48(x28)
                  sw  x13, 52(x28)
                  sw  x14, 56(x28)
                  sw  x15, 60(x28)
                  sw  x16, 64(x28)
                  sw  x17, 68(x28)
                  sw  x18, 72(x28)
                  sw  x19, 76(x28)
                  sw  x20, 80(x28)
                  sw  x21, 84(x28)
                  sw  x22, 88(x28)
                  sw  x23, 92(x28)
                  sw  x24, 96(x28)
                  sw  x25, 100(x28)
                  sw  x26, 104(x28)
                  sw  x27, 108(x28)
                  sw  x28, 112(x28)
                  sw  x29, 116(x28)
                  sw  x30, 120(x28)
                  sw  x31, 124(x28)
                  add x12, x28, zero
                  li x25, 0x8ffffffc
                  li x7, 0x6
                  slli x7, x7, 8
                  addi x7, x7, 0x0
                  sw x7, 0(x25)
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  li x25, 0x8ffffffc
                  li x7, 0x300
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x300
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x342
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x342
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x304
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x304
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x344
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x344
                  sw x7, 0(x25)
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_28:
                  addi x12, x12, -4
                  sw  x28, (x12)
                  add x28, x12, zero
                  addi x28, x28, -128
                  sw  x1, 4(x28)
                  sw  x2, 8(x28)
                  sw  x3, 12(x28)
                  sw  x4, 16(x28)
                  sw  x5, 20(x28)
                  sw  x6, 24(x28)
                  sw  x7, 28(x28)
                  sw  x8, 32(x28)
                  sw  x9, 36(x28)
                  sw  x10, 40(x28)
                  sw  x11, 44(x28)
                  sw  x12, 48(x28)
                  sw  x13, 52(x28)
                  sw  x14, 56(x28)
                  sw  x15, 60(x28)
                  sw  x16, 64(x28)
                  sw  x17, 68(x28)
                  sw  x18, 72(x28)
                  sw  x19, 76(x28)
                  sw  x20, 80(x28)
                  sw  x21, 84(x28)
                  sw  x22, 88(x28)
                  sw  x23, 92(x28)
                  sw  x24, 96(x28)
                  sw  x25, 100(x28)
                  sw  x26, 104(x28)
                  sw  x27, 108(x28)
                  sw  x28, 112(x28)
                  sw  x29, 116(x28)
                  sw  x30, 120(x28)
                  sw  x31, 124(x28)
                  add x12, x28, zero
                  li x25, 0x8ffffffc
                  li x7, 0x6
                  slli x7, x7, 8
                  addi x7, x7, 0x0
                  sw x7, 0(x25)
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  li x25, 0x8ffffffc
                  li x7, 0x300
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x300
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x342
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x342
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x304
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x304
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x344
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x344
                  sw x7, 0(x25)
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_29:
                  addi x12, x12, -4
                  sw  x28, (x12)
                  add x28, x12, zero
                  addi x28, x28, -128
                  sw  x1, 4(x28)
                  sw  x2, 8(x28)
                  sw  x3, 12(x28)
                  sw  x4, 16(x28)
                  sw  x5, 20(x28)
                  sw  x6, 24(x28)
                  sw  x7, 28(x28)
                  sw  x8, 32(x28)
                  sw  x9, 36(x28)
                  sw  x10, 40(x28)
                  sw  x11, 44(x28)
                  sw  x12, 48(x28)
                  sw  x13, 52(x28)
                  sw  x14, 56(x28)
                  sw  x15, 60(x28)
                  sw  x16, 64(x28)
                  sw  x17, 68(x28)
                  sw  x18, 72(x28)
                  sw  x19, 76(x28)
                  sw  x20, 80(x28)
                  sw  x21, 84(x28)
                  sw  x22, 88(x28)
                  sw  x23, 92(x28)
                  sw  x24, 96(x28)
                  sw  x25, 100(x28)
                  sw  x26, 104(x28)
                  sw  x27, 108(x28)
                  sw  x28, 112(x28)
                  sw  x29, 116(x28)
                  sw  x30, 120(x28)
                  sw  x31, 124(x28)
                  add x12, x28, zero
                  li x25, 0x8ffffffc
                  li x7, 0x6
                  slli x7, x7, 8
                  addi x7, x7, 0x0
                  sw x7, 0(x25)
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  li x25, 0x8ffffffc
                  li x7, 0x300
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x300
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x342
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x342
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x304
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x304
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x344
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x344
                  sw x7, 0(x25)
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_30:
                  addi x12, x12, -4
                  sw  x28, (x12)
                  add x28, x12, zero
                  addi x28, x28, -128
                  sw  x1, 4(x28)
                  sw  x2, 8(x28)
                  sw  x3, 12(x28)
                  sw  x4, 16(x28)
                  sw  x5, 20(x28)
                  sw  x6, 24(x28)
                  sw  x7, 28(x28)
                  sw  x8, 32(x28)
                  sw  x9, 36(x28)
                  sw  x10, 40(x28)
                  sw  x11, 44(x28)
                  sw  x12, 48(x28)
                  sw  x13, 52(x28)
                  sw  x14, 56(x28)
                  sw  x15, 60(x28)
                  sw  x16, 64(x28)
                  sw  x17, 68(x28)
                  sw  x18, 72(x28)
                  sw  x19, 76(x28)
                  sw  x20, 80(x28)
                  sw  x21, 84(x28)
                  sw  x22, 88(x28)
                  sw  x23, 92(x28)
                  sw  x24, 96(x28)
                  sw  x25, 100(x28)
                  sw  x26, 104(x28)
                  sw  x27, 108(x28)
                  sw  x28, 112(x28)
                  sw  x29, 116(x28)
                  sw  x30, 120(x28)
                  sw  x31, 124(x28)
                  add x12, x28, zero
                  li x25, 0x8ffffffc
                  li x7, 0x6
                  slli x7, x7, 8
                  addi x7, x7, 0x0
                  sw x7, 0(x25)
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  li x25, 0x8ffffffc
                  li x7, 0x300
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x300
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x342
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x342
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x304
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x304
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x344
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x344
                  sw x7, 0(x25)
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_31:
                  addi x12, x12, -4
                  sw  x28, (x12)
                  add x28, x12, zero
                  addi x28, x28, -128
                  sw  x1, 4(x28)
                  sw  x2, 8(x28)
                  sw  x3, 12(x28)
                  sw  x4, 16(x28)
                  sw  x5, 20(x28)
                  sw  x6, 24(x28)
                  sw  x7, 28(x28)
                  sw  x8, 32(x28)
                  sw  x9, 36(x28)
                  sw  x10, 40(x28)
                  sw  x11, 44(x28)
                  sw  x12, 48(x28)
                  sw  x13, 52(x28)
                  sw  x14, 56(x28)
                  sw  x15, 60(x28)
                  sw  x16, 64(x28)
                  sw  x17, 68(x28)
                  sw  x18, 72(x28)
                  sw  x19, 76(x28)
                  sw  x20, 80(x28)
                  sw  x21, 84(x28)
                  sw  x22, 88(x28)
                  sw  x23, 92(x28)
                  sw  x24, 96(x28)
                  sw  x25, 100(x28)
                  sw  x26, 104(x28)
                  sw  x27, 108(x28)
                  sw  x28, 112(x28)
                  sw  x29, 116(x28)
                  sw  x30, 120(x28)
                  sw  x31, 124(x28)
                  add x12, x28, zero
                  li x25, 0x8ffffffc
                  li x7, 0x6
                  slli x7, x7, 8
                  addi x7, x7, 0x0
                  sw x7, 0(x25)
                  csrr x7, 0x342 # MCAUSE
                  srli x7, x7, 0x1f
                  beqz x7, 1f
                  li x25, 0x8ffffffc
                  li x7, 0x300
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x300
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x342
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x342
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x304
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x304
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x344
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x344
                  sw x7, 0(x25)
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

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
                  addi x12, x12, -4
                  sw  x28, (x12)
                  add x28, x12, zero
                  addi x28, x28, -128
                  sw  x1, 4(x28)
                  sw  x2, 8(x28)
                  sw  x3, 12(x28)
                  sw  x4, 16(x28)
                  sw  x5, 20(x28)
                  sw  x6, 24(x28)
                  sw  x7, 28(x28)
                  sw  x8, 32(x28)
                  sw  x9, 36(x28)
                  sw  x10, 40(x28)
                  sw  x11, 44(x28)
                  sw  x12, 48(x28)
                  sw  x13, 52(x28)
                  sw  x14, 56(x28)
                  sw  x15, 60(x28)
                  sw  x16, 64(x28)
                  sw  x17, 68(x28)
                  sw  x18, 72(x28)
                  sw  x19, 76(x28)
                  sw  x20, 80(x28)
                  sw  x21, 84(x28)
                  sw  x22, 88(x28)
                  sw  x23, 92(x28)
                  sw  x24, 96(x28)
                  sw  x25, 100(x28)
                  sw  x26, 104(x28)
                  sw  x27, 108(x28)
                  sw  x28, 112(x28)
                  sw  x29, 116(x28)
                  sw  x30, 120(x28)
                  sw  x31, 124(x28)
                  add x12, x28, zero
                  li x25, 0x8ffffffc
                  li x7, 0x8
                  slli x7, x7, 8
                  addi x7, x7, 0x0
                  sw x7, 0(x25)
                  csrr x7, 0x341 # MEPC
                  csrr x7, 0x342 # MCAUSE
                  li x25, 0x3 # BREAKPOINT
                  beq x7, x25, ebreak_handler
                  li x25, 0x8 # ECALL_UMODE
                  beq x7, x25, ecall_handler
                  li x25, 0x9 # ECALL_SMODE
                  beq x7, x25, ecall_handler
                  li x25, 0xb # ECALL_MMODE
                  beq x7, x25, ecall_handler
                  li x25, 0x1
                  beq x7, x25, instr_fault_handler
                  li x25, 0x5
                  beq x7, x25, load_fault_handler
                  li x25, 0x7
                  beq x7, x25, store_fault_handler
                  li x25, 0xc
                  beq x7, x25, pt_fault_handler
                  li x25, 0xd
                  beq x7, x25, pt_fault_handler
                  li x25, 0xf
                  beq x7, x25, pt_fault_handler
                  li x25, 0x2 # ILLEGAL_INSTRUCTION
                  beq x7, x25, illegal_instr_handler
                  csrr x25, 0x343 # MTVAL
                  1: la x8, test_done
                  jalr x1, x8, 0

ecall_handler:    
                  li x25, 0x8ffffffc
                  li x7, 0xb00
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0xb00
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0xb80
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0xb80
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0xb03
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0xb03
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0xb83
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0xb83
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0xb04
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0xb04
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0xb84
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0xb84
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0xb05
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0xb05
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0xb85
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0xb85
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0xb06
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0xb06
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0xb86
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0xb86
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0xb07
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0xb07
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0xb87
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0xb87
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0xb08
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0xb08
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0xb88
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0xb88
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0xb09
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0xb09
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0xb89
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0xb89
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0xb0a
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0xb0a
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0xb8a
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0xb8a
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0xb0b
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0xb0b
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0xb8b
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0xb8b
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0xb0c
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0xb0c
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0xb8c
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0xb8c
                  sw x7, 0(x25)
                  la x7, _start
                  sw x0, 0(x7)
                  sw x1, 4(x7)
                  sw x2, 8(x7)
                  sw x3, 12(x7)
                  sw x4, 16(x7)
                  sw x5, 20(x7)
                  sw x6, 24(x7)
                  sw x7, 28(x7)
                  sw x8, 32(x7)
                  sw x9, 36(x7)
                  sw x10, 40(x7)
                  sw x11, 44(x7)
                  sw x12, 48(x7)
                  sw x13, 52(x7)
                  sw x14, 56(x7)
                  sw x15, 60(x7)
                  sw x16, 64(x7)
                  sw x17, 68(x7)
                  sw x18, 72(x7)
                  sw x19, 76(x7)
                  sw x20, 80(x7)
                  sw x21, 84(x7)
                  sw x22, 88(x7)
                  sw x23, 92(x7)
                  sw x24, 96(x7)
                  sw x25, 100(x7)
                  sw x26, 104(x7)
                  sw x27, 108(x7)
                  sw x28, 112(x7)
                  sw x29, 116(x7)
                  sw x30, 120(x7)
                  sw x31, 124(x7)
                  csrr  x7, 0x341
                  addi  x7, x7, 4
                  csrw  0x341, x7
                  mret

instr_fault_handler:
                  li x25, 0x8ffffffc
                  li x7, 0x9
                  slli x7, x7, 8
                  addi x7, x7, 0x0
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x342
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x342
                  sw x7, 0(x25)
                  li x7, 0
                  mv x1, x7
                  li x14, 0
                  0: mv x7, x1
                  mv x8, x7
                  li x8, 0
                  beq x7, x8, 1f
                  li x8, 1
                  beq x7, x8, 2f
                  li x8, 2
                  beq x7, x8, 3f
                  li x8, 3
                  beq x7, x8, 4f
                  li x8, 4
                  beq x7, x8, 5f
                  li x8, 5
                  beq x7, x8, 6f
                  li x8, 6
                  beq x7, x8, 7f
                  li x8, 7
                  beq x7, x8, 8f
                  li x8, 8
                  beq x7, x8, 9f
                  li x8, 9
                  beq x7, x8, 10f
                  li x8, 10
                  beq x7, x8, 11f
                  li x8, 11
                  beq x7, x8, 12f
                  li x8, 12
                  beq x7, x8, 13f
                  li x8, 13
                  beq x7, x8, 14f
                  li x8, 14
                  beq x7, x8, 15f
                  li x8, 15
                  beq x7, x8, 16f
                  1: csrr x25, 0x3b0
                  csrr x2, 0x3a0
                  j 17f
                  2: csrr x25, 0x3b1
                  csrr x2, 0x3a0
                  j 17f
                  3: csrr x25, 0x3b2
                  csrr x2, 0x3a0
                  j 17f
                  4: csrr x25, 0x3b3
                  csrr x2, 0x3a0
                  j 17f
                  5: csrr x25, 0x3b4
                  csrr x2, 0x3a1
                  j 17f
                  6: csrr x25, 0x3b5
                  csrr x2, 0x3a1
                  j 17f
                  7: csrr x25, 0x3b6
                  csrr x2, 0x3a1
                  j 17f
                  8: csrr x25, 0x3b7
                  csrr x2, 0x3a1
                  j 17f
                  9: csrr x25, 0x3b8
                  csrr x2, 0x3a2
                  j 17f
                  10: csrr x25, 0x3b9
                  csrr x2, 0x3a2
                  j 17f
                  11: csrr x25, 0x3ba
                  csrr x2, 0x3a2
                  j 17f
                  12: csrr x25, 0x3bb
                  csrr x2, 0x3a2
                  j 17f
                  13: csrr x25, 0x3bc
                  csrr x2, 0x3a3
                  j 17f
                  14: csrr x25, 0x3bd
                  csrr x2, 0x3a3
                  j 17f
                  15: csrr x25, 0x3be
                  csrr x2, 0x3a3
                  j 17f
                  16: csrr x25, 0x3bf
                  csrr x2, 0x3a3
                  j 17f
                  17: li x17, 4
                  slli x7, x1, 30
                  srli x7, x7, 30
                  sub x8, x17, x7
                  addi x8, x8, -1
                  slli x8, x8, 3
                  sll x17, x2, x8
                  slli x7, x7, 3
                  add x8, x8, x7
                  srl x17, x17, x8
                  slli x8, x17, 27
                  srli x8, x8, 30
                  beqz x8, 20f
                  li x7, 1
                  beq x8, x7, 21f
                  li x7, 2
                  beq x8, x7, 24f
                  li x7, 3
                  beq x8, x7, 25f
                  la x7, test_done
                  jalr x0, x7, 0
                  18: mv x7, x1
                  mv x14, x25
                  addi x7, x7, 1
                  mv x1, x7
                  li x25, 16
                  ble x25, x7, 19f
                  j 0b
                  19: csrr x7, 0x747
                  andi x7, x7, 2
                  bnez x7, 27f
                  la x7, test_done
                  jalr x0, x7, 0
                  20: j 18b
                  21: mv x7, x1
                  csrr x8, 0x343
                  srli x8, x8, 2
                  bnez x7, 22f
                  bltz x8, 18b
                  j 23f
                  22: bgtu x14, x8, 18b
                  23: bleu x25, x8, 18b
                  j 26f
                  24: csrr x7, 0x343
                  srli x7, x7, 2
                  slli x8, x25, 2
                  srli x8, x8, 2
                  bne x7, x8, 18b
                  j 26f
                  25: csrr x7, 0x343
                  srli x7, x7, 2
                  srli x7, x7, 0
                  slli x7, x7, 0
                  slli x8, x25, 2
                  srli x8, x8, 2
                  srli x8, x8, 0
                  slli x8, x8, 0
                  bne x7, x8, 18b
                  j 26f
                  26: csrr x8, 0x747
                  andi x8, x8, 1
                  bnez x8, 27f
                  andi x8, x17, 128
                  bnez x8, 27f
                  j 29f
                  27: la x7, test_done
                  jalr x0, x7, 0
                  29: ori x17, x17, 4
                  li x8, 30
                  sll x7, x1, x8
                  srl x7, x7, x8
                  slli x8, x7, 3
                  sll x17, x17, x8
                  or x2, x2, x17
                  mv x7, x1
                  srli x7, x7, 2
                  beqz x7, 30f
                  li x8, 1
                  beq x7, x8, 31f
                  li x8, 2
                  beq x7, x8, 32f
                  li x8, 3
                  beq x7, x8, 33f
                  30: csrw 0x3a0, x2
                  j 34f
                  31: csrw 0x3a1, x2
                  j 34f
                  32: csrw 0x3a2, x2
                  j 34f
                  33: csrw 0x3a3, x2
                  34: nop
                  add x28, x12, zero
                  lw  x1, 4(x28)
                  lw  x2, 8(x28)
                  lw  x3, 12(x28)
                  lw  x4, 16(x28)
                  lw  x5, 20(x28)
                  lw  x6, 24(x28)
                  lw  x7, 28(x28)
                  lw  x8, 32(x28)
                  lw  x9, 36(x28)
                  lw  x10, 40(x28)
                  lw  x11, 44(x28)
                  lw  x12, 48(x28)
                  lw  x13, 52(x28)
                  lw  x14, 56(x28)
                  lw  x15, 60(x28)
                  lw  x16, 64(x28)
                  lw  x17, 68(x28)
                  lw  x18, 72(x28)
                  lw  x19, 76(x28)
                  lw  x20, 80(x28)
                  lw  x21, 84(x28)
                  lw  x22, 88(x28)
                  lw  x23, 92(x28)
                  lw  x24, 96(x28)
                  lw  x25, 100(x28)
                  lw  x26, 104(x28)
                  lw  x27, 108(x28)
                  lw  x28, 112(x28)
                  lw  x29, 116(x28)
                  lw  x30, 120(x28)
                  lw  x31, 124(x28)
                  addi x28, x28, 128
                  add x12, x28, zero
                  lw  x28, (x12)
                  addi x12, x12, 4
                  mret

load_fault_handler:
                  li x25, 0x8ffffffc
                  li x7, 0xb
                  slli x7, x7, 8
                  addi x7, x7, 0x0
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x342
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x342
                  sw x7, 0(x25)
                  li x7, 0
                  mv x1, x7
                  li x14, 0
                  0: mv x7, x1
                  mv x8, x7
                  li x8, 0
                  beq x7, x8, 1f
                  li x8, 1
                  beq x7, x8, 2f
                  li x8, 2
                  beq x7, x8, 3f
                  li x8, 3
                  beq x7, x8, 4f
                  li x8, 4
                  beq x7, x8, 5f
                  li x8, 5
                  beq x7, x8, 6f
                  li x8, 6
                  beq x7, x8, 7f
                  li x8, 7
                  beq x7, x8, 8f
                  li x8, 8
                  beq x7, x8, 9f
                  li x8, 9
                  beq x7, x8, 10f
                  li x8, 10
                  beq x7, x8, 11f
                  li x8, 11
                  beq x7, x8, 12f
                  li x8, 12
                  beq x7, x8, 13f
                  li x8, 13
                  beq x7, x8, 14f
                  li x8, 14
                  beq x7, x8, 15f
                  li x8, 15
                  beq x7, x8, 16f
                  1: csrr x25, 0x3b0
                  csrr x2, 0x3a0
                  j 17f
                  2: csrr x25, 0x3b1
                  csrr x2, 0x3a0
                  j 17f
                  3: csrr x25, 0x3b2
                  csrr x2, 0x3a0
                  j 17f
                  4: csrr x25, 0x3b3
                  csrr x2, 0x3a0
                  j 17f
                  5: csrr x25, 0x3b4
                  csrr x2, 0x3a1
                  j 17f
                  6: csrr x25, 0x3b5
                  csrr x2, 0x3a1
                  j 17f
                  7: csrr x25, 0x3b6
                  csrr x2, 0x3a1
                  j 17f
                  8: csrr x25, 0x3b7
                  csrr x2, 0x3a1
                  j 17f
                  9: csrr x25, 0x3b8
                  csrr x2, 0x3a2
                  j 17f
                  10: csrr x25, 0x3b9
                  csrr x2, 0x3a2
                  j 17f
                  11: csrr x25, 0x3ba
                  csrr x2, 0x3a2
                  j 17f
                  12: csrr x25, 0x3bb
                  csrr x2, 0x3a2
                  j 17f
                  13: csrr x25, 0x3bc
                  csrr x2, 0x3a3
                  j 17f
                  14: csrr x25, 0x3bd
                  csrr x2, 0x3a3
                  j 17f
                  15: csrr x25, 0x3be
                  csrr x2, 0x3a3
                  j 17f
                  16: csrr x25, 0x3bf
                  csrr x2, 0x3a3
                  j 17f
                  17: li x17, 4
                  slli x7, x1, 30
                  srli x7, x7, 30
                  sub x8, x17, x7
                  addi x8, x8, -1
                  slli x8, x8, 3
                  sll x17, x2, x8
                  slli x7, x7, 3
                  add x8, x8, x7
                  srl x17, x17, x8
                  slli x8, x17, 27
                  srli x8, x8, 30
                  beqz x8, 20f
                  li x7, 1
                  beq x8, x7, 21f
                  li x7, 2
                  beq x8, x7, 24f
                  li x7, 3
                  beq x8, x7, 25f
                  la x7, test_done
                  jalr x0, x7, 0
                  18: mv x7, x1
                  mv x14, x25
                  addi x7, x7, 1
                  mv x1, x7
                  li x25, 16
                  ble x25, x7, 19f
                  j 0b
                  19: csrr x7, 0x747
                  andi x7, x7, 2
                  bnez x7, 27f
                  la x7, test_done
                  jalr x0, x7, 0
                  20: j 18b
                  21: mv x7, x1
                  csrr x8, 0x343
                  srli x8, x8, 2
                  bnez x7, 22f
                  bltz x8, 18b
                  j 23f
                  22: bgtu x14, x8, 18b
                  23: bleu x25, x8, 18b
                  j 26f
                  24: csrr x7, 0x343
                  srli x7, x7, 2
                  slli x8, x25, 2
                  srli x8, x8, 2
                  bne x7, x8, 18b
                  j 26f
                  25: csrr x7, 0x343
                  srli x7, x7, 2
                  srli x7, x7, 0
                  slli x7, x7, 0
                  slli x8, x25, 2
                  srli x8, x8, 2
                  srli x8, x8, 0
                  slli x8, x8, 0
                  bne x7, x8, 18b
                  j 26f
                  26: csrr x8, 0x747
                  andi x8, x8, 1
                  bnez x8, 27f
                  andi x8, x17, 128
                  bnez x8, 27f
                  j 29f
                  27: csrr x7, 0x341
                  la x8, main
                  bge x7, x8, 40f
                  la x7, test_done
                  jalr x0, x7, 0
                  40: lw x7, 0(x7)
                  li x8, 3
                  and x7, x7, x8
                  beq x7, x8, 28f
                  csrr x7, 0x341
                  addi x7, x7, 2
                  csrw 0x341, x7
                  j 34f
                  28: csrr x7, 0x341
                  addi x7, x7, 4
                  csrw 0x341, x7
                  j 34f
                  29: ori x17, x17, 1
                  li x8, 30
                  sll x7, x1, x8
                  srl x7, x7, x8
                  slli x8, x7, 3
                  sll x17, x17, x8
                  or x2, x2, x17
                  mv x7, x1
                  srli x7, x7, 2
                  beqz x7, 30f
                  li x8, 1
                  beq x7, x8, 31f
                  li x8, 2
                  beq x7, x8, 32f
                  li x8, 3
                  beq x7, x8, 33f
                  30: csrw 0x3a0, x2
                  j 34f
                  31: csrw 0x3a1, x2
                  j 34f
                  32: csrw 0x3a2, x2
                  j 34f
                  33: csrw 0x3a3, x2
                  34: nop
                  add x28, x12, zero
                  lw  x1, 4(x28)
                  lw  x2, 8(x28)
                  lw  x3, 12(x28)
                  lw  x4, 16(x28)
                  lw  x5, 20(x28)
                  lw  x6, 24(x28)
                  lw  x7, 28(x28)
                  lw  x8, 32(x28)
                  lw  x9, 36(x28)
                  lw  x10, 40(x28)
                  lw  x11, 44(x28)
                  lw  x12, 48(x28)
                  lw  x13, 52(x28)
                  lw  x14, 56(x28)
                  lw  x15, 60(x28)
                  lw  x16, 64(x28)
                  lw  x17, 68(x28)
                  lw  x18, 72(x28)
                  lw  x19, 76(x28)
                  lw  x20, 80(x28)
                  lw  x21, 84(x28)
                  lw  x22, 88(x28)
                  lw  x23, 92(x28)
                  lw  x24, 96(x28)
                  lw  x25, 100(x28)
                  lw  x26, 104(x28)
                  lw  x27, 108(x28)
                  lw  x28, 112(x28)
                  lw  x29, 116(x28)
                  lw  x30, 120(x28)
                  lw  x31, 124(x28)
                  addi x28, x28, 128
                  add x12, x28, zero
                  lw  x28, (x12)
                  addi x12, x12, 4
                  mret

store_fault_handler:
                  li x25, 0x8ffffffc
                  li x7, 0xc
                  slli x7, x7, 8
                  addi x7, x7, 0x0
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x342
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x342
                  sw x7, 0(x25)
                  li x7, 0
                  mv x1, x7
                  li x14, 0
                  0: mv x7, x1
                  mv x8, x7
                  li x8, 0
                  beq x7, x8, 1f
                  li x8, 1
                  beq x7, x8, 2f
                  li x8, 2
                  beq x7, x8, 3f
                  li x8, 3
                  beq x7, x8, 4f
                  li x8, 4
                  beq x7, x8, 5f
                  li x8, 5
                  beq x7, x8, 6f
                  li x8, 6
                  beq x7, x8, 7f
                  li x8, 7
                  beq x7, x8, 8f
                  li x8, 8
                  beq x7, x8, 9f
                  li x8, 9
                  beq x7, x8, 10f
                  li x8, 10
                  beq x7, x8, 11f
                  li x8, 11
                  beq x7, x8, 12f
                  li x8, 12
                  beq x7, x8, 13f
                  li x8, 13
                  beq x7, x8, 14f
                  li x8, 14
                  beq x7, x8, 15f
                  li x8, 15
                  beq x7, x8, 16f
                  1: csrr x25, 0x3b0
                  csrr x2, 0x3a0
                  j 17f
                  2: csrr x25, 0x3b1
                  csrr x2, 0x3a0
                  j 17f
                  3: csrr x25, 0x3b2
                  csrr x2, 0x3a0
                  j 17f
                  4: csrr x25, 0x3b3
                  csrr x2, 0x3a0
                  j 17f
                  5: csrr x25, 0x3b4
                  csrr x2, 0x3a1
                  j 17f
                  6: csrr x25, 0x3b5
                  csrr x2, 0x3a1
                  j 17f
                  7: csrr x25, 0x3b6
                  csrr x2, 0x3a1
                  j 17f
                  8: csrr x25, 0x3b7
                  csrr x2, 0x3a1
                  j 17f
                  9: csrr x25, 0x3b8
                  csrr x2, 0x3a2
                  j 17f
                  10: csrr x25, 0x3b9
                  csrr x2, 0x3a2
                  j 17f
                  11: csrr x25, 0x3ba
                  csrr x2, 0x3a2
                  j 17f
                  12: csrr x25, 0x3bb
                  csrr x2, 0x3a2
                  j 17f
                  13: csrr x25, 0x3bc
                  csrr x2, 0x3a3
                  j 17f
                  14: csrr x25, 0x3bd
                  csrr x2, 0x3a3
                  j 17f
                  15: csrr x25, 0x3be
                  csrr x2, 0x3a3
                  j 17f
                  16: csrr x25, 0x3bf
                  csrr x2, 0x3a3
                  j 17f
                  17: li x17, 4
                  slli x7, x1, 30
                  srli x7, x7, 30
                  sub x8, x17, x7
                  addi x8, x8, -1
                  slli x8, x8, 3
                  sll x17, x2, x8
                  slli x7, x7, 3
                  add x8, x8, x7
                  srl x17, x17, x8
                  slli x8, x17, 27
                  srli x8, x8, 30
                  beqz x8, 20f
                  li x7, 1
                  beq x8, x7, 21f
                  li x7, 2
                  beq x8, x7, 24f
                  li x7, 3
                  beq x8, x7, 25f
                  la x7, test_done
                  jalr x0, x7, 0
                  18: mv x7, x1
                  mv x14, x25
                  addi x7, x7, 1
                  mv x1, x7
                  li x25, 16
                  ble x25, x7, 19f
                  j 0b
                  19: csrr x7, 0x747
                  andi x7, x7, 2
                  bnez x7, 27f
                  la x7, test_done
                  jalr x0, x7, 0
                  20: j 18b
                  21: mv x7, x1
                  csrr x8, 0x343
                  srli x8, x8, 2
                  bnez x7, 22f
                  bltz x8, 18b
                  j 23f
                  22: bgtu x14, x8, 18b
                  23: bleu x25, x8, 18b
                  j 26f
                  24: csrr x7, 0x343
                  srli x7, x7, 2
                  slli x8, x25, 2
                  srli x8, x8, 2
                  bne x7, x8, 18b
                  j 26f
                  25: csrr x7, 0x343
                  srli x7, x7, 2
                  srli x7, x7, 0
                  slli x7, x7, 0
                  slli x8, x25, 2
                  srli x8, x8, 2
                  srli x8, x8, 0
                  slli x8, x8, 0
                  bne x7, x8, 18b
                  j 26f
                  26: csrr x8, 0x747
                  andi x8, x8, 1
                  bnez x8, 27f
                  andi x8, x17, 128
                  bnez x8, 27f
                  j 29f
                  27: csrr x7, 0x341
                  lw x7, 0(x7)
                  li x8, 3
                  and x7, x7, x8
                  beq x7, x8, 28f
                  csrr x7, 0x341
                  addi x7, x7, 2
                  csrw 0x341, x7
                  j 34f
                  28: csrr x7, 0x341
                  addi x7, x7, 4
                  csrw 0x341, x7
                  j 34f
                  29: ori x17, x17, 3
                  li x8, 30
                  sll x7, x1, x8
                  srl x7, x7, x8
                  slli x8, x7, 3
                  sll x17, x17, x8
                  or x2, x2, x17
                  mv x7, x1
                  srli x7, x7, 2
                  beqz x7, 30f
                  li x8, 1
                  beq x7, x8, 31f
                  li x8, 2
                  beq x7, x8, 32f
                  li x8, 3
                  beq x7, x8, 33f
                  30: csrw 0x3a0, x2
                  j 34f
                  31: csrw 0x3a1, x2
                  j 34f
                  32: csrw 0x3a2, x2
                  j 34f
                  33: csrw 0x3a3, x2
                  34: nop
                  add x28, x12, zero
                  lw  x1, 4(x28)
                  lw  x2, 8(x28)
                  lw  x3, 12(x28)
                  lw  x4, 16(x28)
                  lw  x5, 20(x28)
                  lw  x6, 24(x28)
                  lw  x7, 28(x28)
                  lw  x8, 32(x28)
                  lw  x9, 36(x28)
                  lw  x10, 40(x28)
                  lw  x11, 44(x28)
                  lw  x12, 48(x28)
                  lw  x13, 52(x28)
                  lw  x14, 56(x28)
                  lw  x15, 60(x28)
                  lw  x16, 64(x28)
                  lw  x17, 68(x28)
                  lw  x18, 72(x28)
                  lw  x19, 76(x28)
                  lw  x20, 80(x28)
                  lw  x21, 84(x28)
                  lw  x22, 88(x28)
                  lw  x23, 92(x28)
                  lw  x24, 96(x28)
                  lw  x25, 100(x28)
                  lw  x26, 104(x28)
                  lw  x27, 108(x28)
                  lw  x28, 112(x28)
                  lw  x29, 116(x28)
                  lw  x30, 120(x28)
                  lw  x31, 124(x28)
                  addi x28, x28, 128
                  add x12, x28, zero
                  lw  x28, (x12)
                  addi x12, x12, 4
                  mret

.align 2
main:             c.addi       a1, 26
                  c.nop
                  rem          s1, t2, tp
                  sltiu        a0, ra, -1357
                  c.xor        a4, s0
                  auipc        t5, 161713
                  csrrs        gp, 0x340, a2
                  csrrci       t4, 0x340, 0
                  sra          zero, s11, t4
                  c.andi       a4, 22
                  c.srai       a3, 29
                  c.add        a4, a4
                  srl          s2, a6, s5
                  c.addi16sp   sp, 144
                  slli         s11, t5, 28
                  sra          s11, a4, t1
                  ori          t2, sp, 823
                  c.mv         s11, s1
                  csrrsi       s4, 0x340, 0
                  c.or         a5, a1
                  xori         a1, tp, 828
                  csrrc        s4, 0x340, zero
                  c.xor        a1, a4
                  c.xor        s1, a3
                  div          a0, t6, s2
                  or           a5, s11, s5
                  divu         a3, a0, a3
                  slli         t0, zero, 21
                  auipc        s4, 792284
                  div          s2, a5, a2
                  c.or         a4, s0
                  srai         a4, sp, 26
                  mul          s1, s7, tp
                  c.srai       a0, 12
                  and          ra, t0, ra
                  srli         zero, a0, 25
                  csrrc        t5, 0x340, s0
                  c.xor        a5, a3
                  remu         a3, a5, s7
                  c.srai       a4, 26
                  lui          tp, 773446
                  divu         t5, t3, t2
                  csrrw        s10, 0x340, s9
                  mulhu        gp, s7, s7
                  c.addi4spn   a0, sp, 224
                  mulhsu       a0, t4, s1
                  remu         a1, t1, t6
                  srl          a7, a7, ra
                  c.lui        s10, 13
                  divu         s9, t4, s1
                  add          t4, s3, a2
                  c.or         s1, a0
                  csrrc        t1, 0x340, zero
                  div          s2, a0, zero
                  csrrs        a7, 0x340, zero
                  csrrci       zero, 0x340, 0
                  c.slli       a0, 1
                  sltiu        ra, ra, -1648
                  sub          a6, s9, zero
                  srai         t5, tp, 14
                  c.nop
                  c.add        a7, a1
                  c.slli       gp, 8
                  c.srli       a4, 15
                  mulhsu       s11, s9, s11
                  csrrs        a1, 0x340, a5
                  sltiu        s9, t0, 768
                  div          s5, a0, a6
                  slli         a6, gp, 10
                  remu         s3, s11, t4
                  div          a7, s4, t3
                  sll          tp, s1, s6
                  csrrsi       a4, 0x340, 0
                  mulhsu       a5, s8, gp
                  csrrci       t4, 0x340, 0
                  slti         s3, s7, -298
                  remu         t6, s0, s1
                  c.srli       a0, 4
                  mulh         s6, t4, a0
                  mulhu        s10, s4, t4
                  c.srli       a3, 30
                  c.sub        a5, s1
                  slli         zero, sp, 7
                  addi         a4, t1, 1391
                  c.addi       a6, -1
                  srai         s9, a3, 1
                  add          s5, sp, t1
                  c.slli       s11, 3
                  slti         t5, ra, -1712
                  add          sp, s0, s11
                  sltu         s11, a0, s3
                  c.and        s1, s1
                  c.nop
                  csrrsi       tp, 0x340, 0
                  divu         a6, t1, sp
                  csrrs        a1, 0x340, zero
                  sra          tp, a5, s11
                  mul          s10, s5, s4
                  and          tp, s0, a1
                  csrrw        t1, 0x340, t3
                  addi         s4, t1, 1077
                  divu         s6, zero, s3
                  c.addi4spn   a3, sp, 880
                  sub          a6, t3, gp
                  slli         s10, gp, 18
                  mulhu        a6, s11, t6
                  c.and        s1, a2
                  slli         a3, t3, 0
                  and          t0, t0, s9
                  div          ra, s9, t5
                  csrrc        s11, 0x340, zero
                  remu         s5, s10, s7
                  nop
                  auipc        a1, 214819
                  slli         zero, zero, 31
                  sra          s6, s4, s2
                  rem          t2, a4, t6
                  sub          gp, t1, s2
                  csrrsi       s6, 0x340, 10
                  c.addi       s7, -1
                  c.and        a5, s1
                  c.sub        a5, a0
                  c.lui        s4, 31
                  sll          a1, s3, t4
                  remu         a1, s4, tp
                  div          gp, s3, a1
                  srai         s8, s0, 21
                  csrrw        s8, 0x340, t2
                  andi         t5, t2, -1096
                  nop
                  csrrci       a0, 0x340, 0
                  rem          t6, gp, a6
                  sll          s2, t2, s4
                  sltiu        s11, s10, -38
                  xor          s3, a6, t2
                  c.add        s4, a3
                  divu         a7, t0, s8
                  srli         t5, s7, 10
                  and          s2, a1, t4
                  mul          tp, s8, t5
                  c.addi4spn   a4, sp, 672
                  andi         tp, gp, 379
                  xori         t5, t1, -178
                  mulh         a0, s9, s5
                  or           t0, a7, s9
                  csrrc        s3, 0x340, zero
                  c.nop
                  csrrw        s4, 0x340, t6
                  slli         s6, t1, 25
                  andi         t4, t4, 1011
                  c.addi16sp   sp, 240
                  c.and        s1, a2
                  srl          a6, s10, s0
                  sra          t0, s11, t5
                  csrrw        s5, 0x340, t6
                  csrrw        s3, 0x340, t4
                  lui          s11, 316647
                  c.slli       s6, 14
                  c.or         a1, a5
                  divu         s4, a5, t2
                  sltu         s11, t6, s9
                  csrrs        a5, 0x340, a0
                  csrrci       t0, 0x340, 0
                  c.addi       t0, -1
                  nop
                  sll          s4, a2, a2
                  or           a4, t6, a0
                  div          s10, t5, a0
                  c.sub        a3, a2
                  c.addi4spn   a1, sp, 464
                  lui          s10, 546359
                  add          t0, sp, s1
                  add          a0, ra, s10
                  c.xor        a3, a3
                  c.andi       a0, 17
                  c.xor        a1, a5
                  csrrs        s6, 0x340, zero
                  addi         a3, t2, -1589
                  mulhsu       s1, a3, tp
                  c.slli       a1, 9
                  mul          zero, a7, a0
                  xori         gp, t0, 1948
                  add          s4, ra, s0
                  addi         s7, a6, -990
                  c.addi16sp   sp, -16
                  mulhsu       s7, a1, s2
                  slli         s11, t5, 2
                  c.addi16sp   sp, -16
                  sra          tp, s7, t5
                  c.lui        a6, 3
                  c.srai       a0, 8
                  c.lui        t6, 28
                  addi         zero, a1, 1174
                  c.xor        a4, a1
                  c.nop
                  or           zero, s0, t3
                  c.xor        s1, a5
                  csrrw        s4, 0x340, a7
                  srli         t4, tp, 14
                  sltiu        a5, s7, -1716
                  slt          t6, t2, t0
                  csrrwi       t6, 0x340, 2
                  c.and        s1, s1
                  nop
                  c.li         s10, -1
                  c.andi       a4, 30
                  c.and        a0, a5
                  c.add        s7, s2
                  c.addi4spn   s1, sp, 928
                  c.add        a0, s1
                  lui          s9, 2138
                  sltu         a6, a3, s8
                  srli         s10, s0, 25
                  or           a4, s3, s9
                  c.nop
                  srai         s6, t1, 3
                  csrrc        t5, 0x340, zero
                  srl          a1, s1, a0
                  c.xor        a3, a2
                  add          s4, a4, tp
                  slti         gp, a2, 592
                  ori          gp, t3, 849
                  remu         s9, a3, s6
                  mul          a7, s7, t1
                  auipc        sp, 517876
                  c.and        a3, a3
                  xori         s2, s3, -848
                  csrrci       a3, 0x340, 27
                  mul          a5, s9, a7
                  c.addi       t1, 26
                  c.srli       a3, 1
                  sltiu        t2, s3, 998
                  and          s3, a0, s9
                  andi         t0, s0, 911
                  c.slli       a1, 6
                  csrrsi       s5, 0x340, 0
                  remu         ra, s11, t5
                  srl          s1, ra, s3
                  rem          s2, s5, tp
                  c.slli       a3, 29
                  c.li         a6, 30
                  c.add        s7, sp
                  csrrc        s10, 0x340, s3
                  csrrc        t4, 0x340, s0
                  c.addi       a3, 16
                  srai         t4, ra, 17
                  sra          s7, a4, s2
                  and          s6, s5, sp
                  srli         s8, s3, 21
                  or           a0, s11, a7
                  or           s2, ra, s0
                  rem          s4, s6, t5
                  andi         a5, t2, 105
                  csrrwi       s4, 0x340, 16
                  slt          a4, t3, t3
                  csrrsi       t0, 0x340, 0
                  xor          ra, a5, s10
                  rem          s11, t2, s10
                  div          a7, sp, t1
                  slt          s7, zero, s7
                  remu         t0, s0, tp
                  slti         t6, tp, 876
                  andi         ra, t5, -1075
                  c.xor        a3, a3
                  c.addi4spn   a1, sp, 672
                  srai         a3, tp, 28
                  srli         s2, zero, 1
                  sltiu        s1, gp, -1699
                  c.slli       a0, 27
                  mul          a6, s5, s2
                  auipc        s1, 873726
                  remu         tp, t1, t2
                  c.addi       s5, 31
                  csrrw        s4, 0x340, s8
                  mulhsu       a5, a4, s8
                  addi         s3, s0, -1715
                  sub          s4, s0, s10
                  add          t5, s10, s8
                  remu         a1, s10, s10
                  auipc        s8, 470045
                  mul          s5, s5, a5
                  c.mv         s8, t4
                  c.li         t5, -1
                  srai         tp, s8, 7
                  csrrwi       a1, 0x340, 28
                  slti         t4, t1, -2001
                  slli         s5, s5, 23
                  mul          a4, zero, t1
                  c.or         a0, a4
                  sra          a4, a2, sp
                  addi         a7, gp, 1421
                  c.add        sp, ra
                  csrrw        s1, 0x340, t6
                  ori          tp, ra, 42
                  c.addi4spn   a1, sp, 560
                  c.sub        a1, a4
                  nop
                  srl          s9, gp, t6
                  csrrc        s2, 0x340, zero
                  nop
                  slti         a5, s4, -30
                  remu         ra, a5, tp
                  divu         gp, a4, a2
                  c.andi       a5, 7
                  srai         a1, sp, 1
                  csrrc        t5, 0x340, t0
                  csrrc        t2, 0x340, zero
                  slli         s4, gp, 20
                  andi         s5, t4, -1270
                  csrrw        a4, 0x340, tp
                  sll          t4, t0, t6
                  c.nop
                  mulhu        t5, gp, s11
                  csrrwi       t2, 0x340, 18
                  c.slli       a0, 19
                  srai         s1, s7, 6
                  csrrci       t4, 0x340, 18
                  sll          ra, tp, a4
                  rem          s11, a5, a7
                  c.addi16sp   sp, 48
                  div          ra, a6, a0
                  sll          s10, zero, t5
                  c.add        a1, t2
                  c.slli       t6, 15
                  mul          s9, t4, t1
                  c.andi       a0, -1
                  c.li         s11, 26
                  auipc        gp, 919101
                  c.addi4spn   a3, sp, 1008
                  srl          zero, t5, a5
                  c.or         a5, a5
                  csrrsi       s6, 0x340, 0
                  c.li         s1, 3
                  add          a0, s6, tp
                  csrrsi       t6, 0x340, 0
                  c.andi       a0, -1
                  sltu         t2, s3, a6
                  sub          t5, t1, a5
                  c.srai       a1, 9
                  ori          ra, s9, 1090
                  mul          s6, t4, s0
                  mulh         t4, s10, s2
                  add          gp, t5, s11
                  csrrsi       zero, 0x340, 0
                  c.srai       a4, 26
                  mulh         a7, s11, s10
                  auipc        t2, 504984
                  sltu         a1, t6, sp
                  remu         ra, t1, gp
                  c.srai       a1, 13
                  c.slli       tp, 6
                  c.andi       a4, -1
                  srli         a5, a1, 31
                  mulhsu       a7, s2, t4
                  c.li         s6, -1
                  c.xor        a0, a4
                  srl          s8, t6, t6
                  c.add        tp, s7
                  div          s7, s10, a4
                  csrrs        s9, 0x340, zero
                  or           t6, t4, s0
                  slt          a6, s6, s11
                  lui          s8, 202435
                  sltu         s5, tp, t5
                  csrrci       a0, 0x340, 0
                  sltiu        a3, t5, 479
                  c.and        a5, a0
                  sltu         a1, a7, zero
                  csrrs        s7, 0x340, zero
                  c.sub        a3, a0
                  lui          s11, 471503
                  auipc        s5, 936001
                  sltiu        t0, a2, 1803
                  auipc        s3, 112025
                  srl          a0, a6, t0
                  csrrsi       gp, 0x340, 0
                  andi         gp, t5, -657
                  c.sub        a1, s0
                  c.lui        t2, 1
                  mulhsu       s6, a3, sp
                  auipc        s7, 389013
                  add          a4, tp, a0
                  c.or         a3, s1
                  c.xor        s1, a3
                  slt          s5, s3, s6
                  slti         a4, a6, -1719
                  c.xor        a0, s1
                  csrrwi       a7, 0x340, 28
                  c.sub        a3, s0
                  mulhu        s9, s1, s0
                  c.and        s1, a0
                  slti         s11, s10, 984
                  c.srai       a4, 21
                  auipc        t2, 838792
                  c.srai       a5, 27
                  c.li         s4, 9
                  xori         sp, t4, -1285
                  remu         sp, t0, t1
                  c.or         a0, s1
                  sltiu        s5, a3, -1516
                  csrrc        t5, 0x340, s2
                  lui          zero, 539339
                  c.andi       a4, -1
                  sll          a5, s7, tp
                  mulhu        s2, a3, ra
                  c.mv         s6, s8
                  c.slli       s10, 9
                  csrrci       s1, 0x340, 1
                  srai         a0, a3, 19
                  csrrsi       a1, 0x340, 13
                  lui          s6, 1047945
                  addi         s6, s1, -1633
                  xori         a5, a5, 784
                  xori         t4, s6, -1295
                  c.sub        a0, a3
                  csrrsi       gp, 0x340, 31
                  slti         s11, t3, -185
                  csrrwi       t6, 0x340, 20
                  and          a3, s3, ra
                  or           a0, s9, s2
                  mulh         s10, s3, a1
                  lui          s6, 607613
                  csrrwi       ra, 0x340, 3
                  srl          s7, a5, t4
                  ori          t4, a7, 631
                  c.slli       s1, 5
                  c.and        a1, s1
                  mulh         a7, a6, a2
                  sltu         a0, s9, a3
                  sll          t2, t0, a5
                  c.li         s11, 14
                  mulh         s4, s3, s8
                  auipc        gp, 43312
                  mulhu        t2, s1, s2
                  div          s10, s4, s1
                  slti         a1, a5, -1610
                  auipc        a1, 94324
                  c.and        a3, a0
                  srli         sp, t0, 18
                  add          s7, t0, s5
                  c.li         a0, 15
                  csrrci       s3, 0x340, 18
                  mulhsu       t5, t1, a0
                  srl          s6, ra, s10
                  c.li         s9, 5
                  c.andi       a1, 21
                  srli         a1, a4, 6
                  rem          t6, ra, s8
                  sltu         gp, s6, a1
                  csrrsi       t6, 0x340, 25
                  mul          a0, a5, sp
                  div          s4, s5, t5
                  srai         s9, s4, 10
                  c.nop
                  sub          s3, t4, t1
                  c.or         a1, s1
                  rem          t6, s7, t5
                  ori          sp, gp, 1291
                  remu         s11, a0, s5
                  xor          a6, s8, a5
                  c.and        a4, a3
                  sltu         a1, a7, t1
                  andi         a3, s7, -1626
                  ori          a0, a5, -1727
                  srl          tp, a1, a3
                  addi         s10, s10, 1529
                  remu         t2, a1, s6
                  mul          t4, a5, s6
                  addi         s7, s11, 993
                  c.add        s3, gp
                  or           t4, s8, a2
                  csrrw        a0, 0x340, s7
                  or           s2, zero, gp
                  csrrs        a1, 0x340, s10
                  sltiu        a4, a3, 1532
                  slti         ra, t3, 406
                  c.sub        a1, a4
                  mul          t6, sp, s4
                  or           zero, s10, s1
                  sltiu        s5, t3, -247
                  mulhu        t1, a4, gp
                  mul          a4, s1, a6
                  and          a4, a6, t6
                  c.li         s1, 22
                  add          a6, t2, s7
                  csrrci       t2, 0x340, 0
                  csrrsi       s3, 0x340, 0
                  xor          s6, t2, s6
                  mulhsu       s1, s5, t0
                  rem          t2, s6, s9
                  c.xor        a3, a0
                  and          s11, s10, a4
                  c.addi16sp   sp, 128
                  srl          s10, t1, t1
                  sltiu        t6, a5, 1700
                  xor          a1, a4, s0
                  c.li         t6, -1
                  or           s4, s8, a1
                  or           a6, t3, s3
                  csrrwi       s1, 0x340, 3
                  mulhu        s2, s2, ra
                  divu         sp, tp, s1
                  add          a7, s1, s2
                  div          zero, zero, t6
                  srai         s1, tp, 6
                  lui          a6, 723335
                  divu         a4, s10, s9
                  c.addi16sp   sp, 256
                  csrrsi       s2, 0x340, 0
                  sub          sp, s10, t3
                  add          s7, t2, t5
                  mulhu        s9, t5, a5
                  c.and        a0, a4
                  c.addi4spn   a5, sp, 48
                  c.addi       a6, 8
                  remu         t5, a5, t1
                  addi         t1, s11, 1783
                  c.or         s1, a4
                  c.srli       a5, 2
                  sub          a0, t1, a0
                  sub          a4, a4, a6
                  csrrci       t6, 0x340, 0
                  or           ra, s6, s0
                  c.slli       a4, 30
                  and          s6, t2, s0
                  lui          s1, 941757
                  csrrc        t4, 0x340, zero
                  remu         a6, t1, zero
                  sra          s11, s3, tp
                  srl          s3, s9, zero
                  csrrsi       a5, 0x340, 0
                  sra          t2, a2, ra
                  c.andi       a5, -1
                  c.nop
                  c.srli       s1, 16
                  srai         t5, s3, 6
                  csrrci       tp, 0x340, 0
                  xor          t4, s11, t1
                  c.addi4spn   a1, sp, 528
                  sltu         ra, a0, s0
                  c.sub        a0, a1
                  add          s5, ra, zero
                  slli         s6, gp, 1
                  remu         a5, t0, s3
                  auipc        s11, 101999
                  slli         a1, a0, 3
                  remu         zero, s6, s10
                  add          t2, a6, s8
                  sltu         a0, a3, s2
                  c.srli       a0, 14
                  andi         s8, a2, -523
                  mulhsu       a4, a5, s4
                  csrrs        s4, 0x340, zero
                  csrrw        gp, 0x340, s7
                  sll          sp, a1, a2
                  div          gp, gp, t4
                  c.xor        a0, a3
                  c.srli       a4, 27
                  c.lui        s11, 8
                  csrrsi       s2, 0x340, 30
                  mulhu        s2, s5, sp
                  c.addi4spn   a4, sp, 800
                  slti         s9, s0, 99
                  mulhu        t0, gp, s9
                  c.srai       a1, 28
                  ori          tp, s2, -2034
                  srai         zero, a1, 22
                  add          t6, t5, s1
                  andi         a7, a4, -246
                  nop
                  srai         s5, a7, 15
                  sltu         s8, t1, s8
                  sub          a6, t4, ra
                  sltiu        s9, t1, 1726
                  srli         a6, a0, 31
                  div          t0, zero, s9
                  divu         t1, sp, s5
                  csrrsi       t0, 0x340, 0
                  add          s7, s1, a1
                  srli         s11, s10, 19
                  mulhsu       a7, t2, s7
                  csrrsi       s7, 0x340, 0
                  c.and        a5, s0
                  lui          s10, 588687
                  and          s8, s2, a1
                  c.andi       a1, -1
                  sltiu        a0, a3, 1150
                  mulh         gp, t2, a1
                  sll          s4, s11, tp
                  sub          gp, sp, zero
                  remu         a5, a4, s11
                  csrrci       a0, 0x340, 29
                  and          a6, s6, a6
                  srl          s6, s4, s1
                  add          s11, a6, zero
                  csrrs        a3, 0x340, zero
                  csrrwi       s5, 0x340, 3
                  slli         a4, s8, 3
                  mulhu        t0, t4, s5
                  c.addi       tp, -1
                  c.add        s5, t0
                  c.mv         t6, a3
                  sll          s1, a5, s0
                  c.addi4spn   a0, sp, 1008
                  c.srli       a1, 11
                  or           t2, t1, s7
                  c.andi       a4, -1
                  ori          s7, t6, -30
                  csrrw        t0, 0x340, t5
                  c.slli       t1, 2
                  sltu         s10, s11, a2
                  sub          a7, a3, s8
                  addi         a7, ra, 178
                  sltu         sp, s0, sp
                  auipc        s6, 384584
                  sltu         a5, t1, s10
                  c.addi4spn   a5, sp, 848
                  c.addi16sp   sp, -16
                  csrrs        s2, 0x340, zero
                  srai         ra, a0, 26
                  sub          t1, s10, a4
                  div          s6, a4, t1
                  div          a7, t1, tp
                  div          t1, s2, s5
                  c.addi       a5, -1
                  remu         a5, sp, gp
                  c.xor        s1, s1
                  srai         s7, s0, 22
                  or           ra, t6, s10
                  sltiu        t2, s6, -695
                  srl          s7, s3, s7
                  c.lui        a1, 31
                  csrrw        a5, 0x340, s8
                  mulhsu       zero, gp, t0
                  or           t2, s11, s9
                  c.lui        s8, 26
                  c.srai       a1, 13
                  div          s9, t6, a3
                  csrrc        a4, 0x340, a7
                  xori         s11, a1, 738
                  csrrw        zero, 0x340, sp
                  c.addi16sp   sp, 256
                  csrrc        s5, 0x340, a4
                  mulhsu       a4, s9, s0
                  srai         s6, gp, 21
                  c.mv         s8, s10
                  mulh         s6, t0, gp
                  mul          s10, a3, gp
                  ori          a4, t2, -1403
                  nop
                  c.slli       t1, 3
                  sltu         s8, t5, t5
                  nop
                  or           t4, t1, s8
                  ori          s8, s2, 1378
                  remu         tp, a6, s2
                  csrrci       t6, 0x340, 5
                  csrrci       s8, 0x340, 15
                  slti         s5, s2, -1090
                  csrrw        a5, 0x340, a6
                  c.addi       s5, 4
                  mulhsu       s11, s0, sp
                  add          ra, t5, s9
                  slti         t0, s4, 1521
                  div          s10, a0, s9
                  srl          tp, a2, tp
                  slti         tp, t2, 2019
                  csrrci       t0, 0x340, 0
                  c.addi4spn   s1, sp, 640
                  c.lui        s1, 21
                  c.addi16sp   sp, -16
                  c.addi16sp   sp, 128
                  c.addi16sp   sp, 208
                  c.and        a4, a5
                  mulhsu       s4, s6, s9
                  csrrci       t6, 0x340, 21
                  mulh         s7, t4, s4
                  nop
                  csrrci       gp, 0x340, 0
                  c.slli       a5, 27
                  sra          t6, s0, t1
                  sltiu        s6, t6, 444
                  divu         sp, s0, a5
                  csrrw        a7, 0x340, s4
                  csrrc        s7, 0x340, t6
                  mulh         a3, a5, s9
                  c.sub        a4, a1
                  csrrci       s7, 0x340, 0
                  divu         s4, s2, t1
                  srl          s5, a3, s0
                  mul          s5, a2, a5
                  srli         s2, s3, 7
                  c.li         s9, -1
                  c.andi       a0, 4
                  c.addi       a0, -1
                  csrrwi       gp, 0x340, 19
                  sltiu        s4, t0, -2026
                  sll          s10, s8, s8
                  xor          s5, a3, a3
                  xor          gp, s10, s4
                  srai         a1, s9, 29
                  auipc        t5, 59209
                  mulhsu       s8, t2, tp
                  div          a6, sp, s5
                  slli         zero, a7, 24
                  c.or         s1, a5
                  slti         a5, s2, 391
                  rem          s2, s11, s4
                  c.or         a1, a5
                  csrrs        t4, 0x340, zero
                  sll          gp, s0, s5
                  c.lui        s5, 29
                  lui          a4, 791966
                  addi         s8, s3, 187
                  and          a0, s8, zero
                  csrrwi       a7, 0x340, 6
                  c.nop
                  sltu         s10, s2, s0
                  c.srai       a4, 27
                  csrrsi       s9, 0x340, 11
                  sub          a1, sp, tp
                  srli         t6, t1, 9
                  ori          t5, zero, -948
                  nop
                  sltiu        s6, a2, 327
                  sll          s9, s10, zero
                  c.slli       t1, 3
                  sltu         s2, s3, s1
                  and          s5, t6, s0
                  slti         a1, s2, -1777
                  c.nop
                  c.lui        a6, 16
                  mulhsu       s1, s8, t4
                  c.nop
                  csrrs        s6, 0x340, zero
                  sra          s5, gp, s0
                  srli         s11, t5, 23
                  csrrc        sp, 0x340, t5
                  and          s7, s9, s2
                  mul          tp, s3, a5
                  srl          s8, s3, s6
                  ori          s1, s1, 443
                  addi         a0, t2, -881
                  c.addi       a5, -1
                  divu         s6, s4, s8
                  csrrci       s11, 0x340, 5
                  csrrw        a0, 0x340, t6
                  c.nop
                  and          gp, sp, a0
                  remu         s8, s7, s4
                  srli         s10, ra, 0
                  csrrci       s11, 0x340, 0
                  c.slli       s4, 10
                  slli         s3, a4, 21
                  sll          a1, s4, tp
                  srl          t2, s2, tp
                  csrrci       a1, 0x340, 0
                  c.srli       a0, 13
                  c.addi4spn   a4, sp, 656
                  c.mv         t6, gp
                  mulhu        s5, t2, s0
                  csrrs        a7, 0x340, t3
                  addi         s10, a4, 656
                  srai         t5, a0, 6
                  c.srai       s1, 1
                  csrrs        gp, 0x340, zero
                  c.xor        a1, a5
                  mulhsu       s1, a7, t4
                  sll          s11, sp, s0
                  c.addi16sp   sp, 208
                  c.and        a1, a0
                  remu         a6, t1, s3
                  c.li         s2, -1
                  remu         gp, a7, a4
                  c.srli       a0, 23
                  srl          a6, t1, s11
                  c.srai       a1, 26
                  auipc        sp, 80195
                  mul          s6, a5, t1
                  auipc        s6, 683384
                  srai         a0, s9, 5
                  slli         s7, ra, 11
                  c.li         s5, 28
                  sltu         t5, a5, gp
                  csrrs        s6, 0x340, zero
                  mul          t6, s3, s1
                  mulhu        s6, s7, s4
                  c.srai       a1, 31
                  c.and        s1, a0
                  mulh         s7, t6, a2
                  c.srai       a4, 5
                  c.sub        a0, a2
                  sltu         s11, s9, s11
                  c.slli       s6, 2
                  rem          a1, a7, t2
                  c.sub        a5, a4
                  rem          s5, s4, sp
                  csrrci       s10, 0x340, 0
                  c.lui        a6, 18
                  csrrw        a6, 0x340, s11
                  sra          s3, s3, s4
                  c.lui        a3, 20
                  srl          s5, t3, zero
                  c.add        a0, s6
                  c.and        a4, a4
                  c.lui        s4, 8
                  c.srli       a5, 16
                  or           t5, sp, s6
                  or           t2, t3, s9
                  c.addi16sp   sp, -16
                  div          gp, t4, s8
                  addi         s6, gp, -1792
                  csrrc        zero, 0x340, s11
                  sll          a5, t2, a4
                  slti         t2, a4, -112
                  csrrw        tp, 0x340, ra
                  csrrs        s10, 0x340, zero
                  mulh         a5, a6, a3
                  sra          t4, a3, s7
                  c.nop
                  srli         t6, s11, 1
                  remu         a7, s2, a2
                  c.xor        a1, a1
                  csrrc        gp, 0x340, t0
                  srl          a7, t1, ra
                  andi         s11, s9, -1079
                  sll          s11, a1, s4
                  c.srai       a4, 18
                  srli         a6, s11, 15
                  lui          a5, 491237
                  c.or         a4, a3
                  c.nop
                  xor          t6, s6, s10
                  csrrc        t5, 0x340, zero
                  slli         a4, s0, 24
                  remu         s8, t2, a6
                  c.nop
                  c.addi4spn   a3, sp, 544
                  remu         t5, t0, t3
                  remu         s10, gp, s10
                  csrrsi       a0, 0x340, 0
                  csrrw        zero, 0x340, s10
                  slt          s10, zero, zero
                  c.sub        a5, a3
                  srl          gp, t0, s0
                  c.nop
                  add          s9, s11, t2
                  csrrwi       s6, 0x340, 6
                  c.srli       a4, 11
                  sub          a3, t6, a5
                  c.andi       a1, 31
                  c.srli       a1, 23
                  csrrci       t4, 0x340, 0
                  sub          t1, t4, t0
                  slti         a3, s6, 1684
                  c.addi4spn   a5, sp, 160
                  addi         a0, s10, 1316
                  c.xor        a5, s1
                  c.addi       ra, -1
                  sub          t5, s8, s9
                  c.mv         s4, a2
                  divu         gp, a2, t4
                  mulhsu       s6, tp, s3
                  andi         a1, s9, 164
                  c.addi4spn   a0, sp, 1008
                  csrrsi       s7, 0x340, 0
                  remu         s9, s10, zero
                  lui          s9, 276481
                  nop
                  slli         s5, t4, 13
                  addi         sp, zero, -52
                  mulhsu       s8, s1, t1
                  mulhsu       t4, s3, a4
                  csrrw        s7, 0x340, zero
                  divu         s9, a0, t2
                  sltiu        sp, t4, 2033
                  csrrci       s1, 0x340, 0
                  c.srai       a5, 17
                  mul          gp, a2, t1
                  and          s2, a3, t1
                  div          t2, t2, a4
                  sll          s7, ra, a5
                  mulhsu       t5, a4, sp
                  c.and        a0, a2
                  auipc        a5, 50256
                  and          a7, t6, s6
                  xori         gp, tp, 680
                  c.and        a1, a4
                  c.srai       a0, 8
                  c.add        a5, t6
                  csrrc        s2, 0x340, zero
                  div          a4, t0, s5
                  c.andi       a3, 30
                  sra          sp, s1, a2
                  sltu         a0, s1, ra
                  sltu         ra, s0, t4
                  c.andi       a1, -1
                  c.addi       sp, -1
                  slti         s6, s5, -1970
                  srl          s6, a6, s2
                  c.addi       ra, -1
                  ori          t4, s6, -1064
                  and          s9, s4, s5
                  sra          a6, t3, tp
                  c.or         a3, a4
                  csrrci       s10, 0x340, 0
                  csrrc        s11, 0x340, zero
                  mul          s7, s5, s10
                  addi         t5, s11, 1269
                  add          s9, gp, s1
                  sra          s7, a1, t4
                  c.addi       t6, -1
                  slli         a5, tp, 29
                  csrrwi       a3, 0x340, 16
                  div          t1, a3, a0
                  c.lui        a0, 31
                  addi         s6, t2, 1270
                  remu         a3, a5, s1
                  c.mv         t6, t4
                  sll          t2, a7, t6
                  csrrwi       t0, 0x340, 9
                  xori         s5, s1, 83
                  xor          s11, s1, s5
                  slt          zero, t0, a4
                  add          s2, s6, s1
                  csrrc        s3, 0x340, zero
                  csrrsi       t4, 0x340, 22
                  srli         s4, s8, 31
                  c.mv         t2, t2
                  csrrs        sp, 0x340, zero
                  div          gp, t6, sp
                  divu         s11, t1, s1
                  mul          ra, s1, t3
                  slti         zero, s10, 73
                  mul          s11, s11, s6
                  c.andi       a0, -1
                  c.sub        a5, s1
                  c.addi4spn   a3, sp, 576
                  c.mv         s9, s4
                  remu         s9, s1, s7
                  csrrci       t2, 0x340, 0
                  slti         a0, t3, 631
                  andi         s9, a3, 784
                  csrrc        t1, 0x340, ra
                  sra          t2, a7, s3
                  c.xor        a3, s0
                  sra          t4, t6, t6
                  c.add        s7, t4
                  nop
                  c.and        a5, a1
                  auipc        s6, 472808
                  c.and        a4, a5
                  c.srai       a4, 15
                  auipc        s9, 141051
                  sub          t4, t6, s3
                  c.mv         t2, a6
                  c.sub        a0, a2
                  srai         s10, sp, 12
                  c.add        t4, s3
                  srai         s11, a6, 8
                  sub          s1, tp, t6
                  lui          a4, 742974
                  mul          t1, t4, s0
                  c.li         t5, 18
                  c.addi       a4, 30
                  divu         s9, tp, s6
                  c.mv         s9, a7
                  c.addi4spn   a1, sp, 544
                  sltiu        s1, tp, 30
                  c.nop
                  c.andi       a1, 11
                  sra          a5, a4, t4
                  c.slli       a3, 29
                  mulh         a1, t5, s4
                  slli         a3, s7, 8
                  c.li         tp, -1
                  c.srli       a3, 3
                  xori         ra, s11, 819
                  csrrwi       s11, 0x340, 3
                  c.andi       a1, -1
                  slti         s2, s5, -1426
                  c.addi       a6, -1
                  divu         t1, a3, s5
                  srl          s5, t0, a4
                  sub          s9, sp, ra
                  andi         s6, s2, -892
                  srl          a5, tp, s9
                  or           a5, s11, s5
                  add          t5, t6, gp
                  c.slli       s7, 24
                  divu         a0, gp, sp
                  nop
                  srai         t0, s1, 7
                  add          t2, a1, s8
                  c.add        t0, a1
                  nop
                  rem          gp, s8, a0
                  c.li         s2, -1
                  c.addi16sp   sp, -16
                  slt          s1, s3, a5
                  sub          tp, ra, s7
                  csrrw        gp, 0x340, s5
                  c.srli       a1, 16
                  c.addi       tp, -1
                  srli         a3, s10, 5
                  c.mv         tp, t1
                  sltiu        s5, tp, 217
                  mulhsu       s8, t6, s7
                  srl          t0, t5, ra
                  divu         a7, a3, s7
                  ori          t6, a7, 557
                  srli         zero, t0, 28
                  sltiu        a3, s9, 1774
                  c.add        s9, a7
                  c.sub        a4, a3
                  div          gp, tp, a1
                  c.li         t5, -1
                  c.lui        a5, 11
                  c.sub        a4, a5
                  csrrci       a7, 0x340, 11
                  xor          t1, t5, a3
                  nop
                  c.addi4spn   a1, sp, 304
                  csrrwi       s3, 0x340, 24
                  nop
                  auipc        t2, 43990
                  slli         sp, s2, 29
                  andi         s4, zero, 191
                  c.xor        s1, a2
                  mul          t1, s4, s6
                  c.addi       t5, 25
                  c.and        a0, s0
                  c.andi       a3, -1
                  divu         s5, t1, s1
                  auipc        s1, 139683
                  ori          t1, t3, 1000
                  csrrw        t6, 0x340, t0
                  mul          s8, zero, s2
                  c.li         t4, -1
                  auipc        s8, 426860
                  c.addi       a1, -1
                  mul          ra, a5, zero
                  addi         a3, s8, 646
                  csrrc        a3, 0x340, zero
                  rem          s11, s3, sp
                  c.add        s5, s10
                  csrrci       t5, 0x340, 0
                  divu         t0, a6, t6
                  mulhu        t1, s8, t4
                  xori         tp, s8, -497
                  c.li         s5, 29
                  c.slli       t2, 14
                  add          t6, ra, t4
                  c.addi4spn   a4, sp, 736
                  or           t6, s3, s5
                  divu         t5, s7, zero
                  c.slli       a5, 11
                  c.xor        a3, s1
                  c.andi       a4, 12
                  ori          a3, t4, 1603
                  csrrci       s6, 0x340, 0
                  slti         s3, t2, 1420
                  xor          t5, a2, s7
                  c.sub        a4, s1
                  c.xor        a1, a3
                  c.slli       a3, 25
                  c.and        a4, a5
                  csrrc        s5, 0x340, zero
                  c.li         a7, -1
                  c.mv         s9, a7
                  lui          a6, 641121
                  addi         t4, s7, 1896
                  csrrc        tp, 0x340, a0
                  remu         zero, a2, s3
                  mul          a5, s8, a7
                  c.srai       a0, 24
                  csrrw        a0, 0x340, ra
                  c.or         a0, a3
                  c.sub        a5, a1
                  c.lui        a6, 23
                  nop
                  csrrci       a7, 0x340, 0
                  rem          t1, s9, tp
                  mulhsu       a3, a0, zero
                  csrrwi       a5, 0x340, 3
                  c.addi16sp   sp, -16
                  slt          t4, a7, tp
                  csrrs        a4, 0x340, t6
                  srai         tp, a0, 10
                  or           a5, s0, t6
                  c.addi16sp   sp, -16
                  and          a4, s2, s11
                  rem          s6, s0, a3
                  csrrwi       s8, 0x340, 21
                  srli         sp, ra, 11
                  c.mv         s9, ra
                  csrrw        t0, 0x340, s11
                  remu         a7, t5, t2
                  xori         s4, t2, 1217
                  xor          tp, s2, zero
                  c.xor        s1, a0
                  c.srai       a0, 30
                  div          s9, t1, s2
                  div          zero, s4, s11
                  rem          t6, a6, a0
                  ori          a6, s1, 599
                  csrrwi       s11, 0x340, 28
                  or           a0, s1, a5
                  remu         s1, a6, t4
                  c.addi       t1, 13
                  and          t1, t5, t6
                  slti         t2, a3, -466
                  c.sub        a0, a1
                  or           sp, t6, s7
                  rem          s2, a3, s0
                  or           t2, a1, s5
                  c.srai       a0, 31
                  csrrs        zero, 0x340, s1
                  mulh         s1, s6, a6
                  sltiu        s4, t2, 432
                  c.and        s1, a0
                  xori         s9, t0, -57
                  csrrs        a0, 0x340, s7
                  csrrs        s1, 0x340, zero
                  sltiu        zero, a6, -1776
                  csrrw        a6, 0x340, t4
                  and          s5, s6, t2
                  c.sub        a4, a5
                  rem          t4, t2, s6
                  c.addi16sp   sp, -16
                  sll          s2, s5, a2
                  sll          t4, a7, s10
                  nop
                  mulhu        t6, t2, a6
                  sra          a1, s6, s7
                  mul          s5, t2, t0
                  csrrw        s7, 0x340, gp
                  c.or         a4, a4
                  sltu         a3, t0, s10
                  auipc        s9, 889669
                  slt          s2, t0, a6
                  sll          a7, t2, s7
                  srai         ra, s0, 27
                  c.or         s1, s1
                  csrrw        zero, 0x340, s7
                  c.addi16sp   sp, 320
                  sll          t4, s8, s9
                  c.sub        a5, s0
                  remu         t6, t4, s2
                  div          s7, a4, t5
                  c.add        t6, s1
                  csrrwi       t1, 0x340, 28
                  srli         t2, t0, 13
                  rem          s7, a1, t1
                  mulhsu       t0, s7, a5
                  csrrsi       a5, 0x340, 11
                  c.addi4spn   s1, sp, 496
                  xori         s8, a0, 1268
                  c.and        s1, a0
                  add          s10, s0, a1
                  andi         s8, s4, 1819
                  addi         s1, t3, -519
                  slt          a1, s2, gp
                  xor          s9, s5, t4
                  slti         a6, s3, 1851
                  csrrci       t4, 0x340, 7
                  c.mv         t1, a7
                  c.xor        a1, a3
                  c.addi       s4, 18
                  lui          s1, 554946
                  sub          a6, t0, s1
                  lui          a6, 479418
                  c.srli       a5, 5
                  srai         s10, s10, 9
                  div          a6, s6, s5
                  csrrci       a3, 0x340, 0
                  c.addi16sp   sp, -16
                  c.sub        a1, a0
                  srai         a1, s8, 13
                  c.nop
                  slli         s6, s4, 17
                  sub          a4, s1, s2
                  c.andi       a1, 18
                  slt          a6, zero, s3
                  slli         ra, s8, 17
                  c.add        a5, gp
                  andi         t0, s6, -380
                  nop
                  nop
                  or           s10, a0, a2
                  c.or         a0, a3
                  and          a0, zero, sp
                  slli         s7, a7, 23
                  c.li         s11, 19
                  csrrwi       a3, 0x340, 14
                  xor          s2, zero, t3
                  sltiu        a1, s3, -15
                  rem          t6, a7, a5
                  nop
                  csrrc        s11, 0x340, t5
                  c.add        s9, t2
                  c.xor        a0, a1
                  slli         sp, a6, 8
                  mulhu        s9, t3, t0
                  mulh         a6, zero, a3
                  csrrwi       t6, 0x340, 26
                  c.addi       s11, 6
                  sltiu        a0, a3, 1695
                  c.lui        s1, 28
                  csrrwi       s3, 0x340, 19
                  csrrci       t6, 0x340, 12
                  c.or         a0, a3
                  c.xor        a5, a4
                  c.nop
                  add          s11, t2, a0
                  csrrsi       sp, 0x340, 13
                  csrrwi       t6, 0x340, 16
                  c.mv         s1, t5
                  csrrc        s11, 0x340, zero
                  mulhsu       s5, a2, s4
                  c.slli       t6, 31
                  sub          a4, s2, s11
                  remu         a1, a5, a7
                  csrrci       a1, 0x340, 17
                  c.andi       a4, 15
                  mul          s2, zero, t3
                  c.slli       s2, 17
                  sll          a6, zero, gp
                  nop
                  sra          a6, s9, a4
                  ori          zero, s4, -5
                  andi         a7, s9, 318
                  slt          s3, s8, s11
                  xor          s2, s11, a4
                  c.lui        a0, 13
                  c.mv         s7, gp
                  c.li         s2, -1
                  sltu         s6, s8, s6
                  add          ra, s4, s0
                  andi         s3, a0, -1125
                  slt          tp, t6, t6
                  divu         s11, a2, a1
                  div          a5, a7, t4
                  or           s4, t1, ra
                  csrrw        s1, 0x340, gp
                  c.and        a1, a2
                  csrrsi       s3, 0x340, 0
                  rem          gp, s1, s0
                  xor          a5, tp, a2
                  csrrc        t5, 0x340, s8
                  xori         a3, t6, -91
                  c.slli       s3, 2
                  sltu         s11, s4, t4
                  div          s5, a3, sp
                  c.li         a6, -1
                  sub          s9, a1, s0
                  and          s8, s5, s7
                  c.nop
                  csrrw        s5, 0x340, zero
                  xori         s8, zero, 1867
                  mulhsu       tp, zero, s10
                  c.nop
                  slti         gp, t6, 190
                  c.sub        a4, a2
                  c.sub        a4, a3
                  c.andi       a4, -1
                  sub          s9, s4, t2
                  srli         a3, a0, 12
                  c.addi       s5, -1
                  sub          a5, zero, t5
                  c.and        a4, a1
                  c.and        a3, a2
                  remu         a7, t5, a4
                  auipc        s1, 466236
                  xori         s11, s9, -304
                  mulhu        s11, a6, t5
                  c.andi       a1, 29
                  nop
                  c.or         a4, a2
                  c.and        a0, a3
                  c.addi4spn   a1, sp, 944
                  c.addi16sp   sp, 400
                  srli         t4, a2, 17
                  c.srai       a5, 23
                  sra          t1, tp, t6
                  c.add        t1, sp
                  mulhsu       a6, a2, sp
                  ori          s1, t5, 1392
                  divu         s10, a7, t1
                  sltu         t6, a2, t5
                  c.srli       a0, 3
                  csrrs        s2, 0x340, sp
                  auipc        a4, 981775
                  mulh         t2, tp, t3
                  c.li         s5, -1
                  csrrwi       t2, 0x340, 19
                  c.or         a4, a2
                  divu         a0, gp, a2
                  srli         t1, s8, 26
                  sll          t4, a5, s10
                  divu         a1, s3, a0
                  lui          s5, 404815
                  mulhu        a0, t1, s11
                  c.sub        a3, a1
                  sltu         tp, s9, a7
                  c.sub        a1, a3
                  csrrs        s10, 0x340, sp
                  c.li         s9, 30
                  c.srli       a1, 17
                  c.addi       t1, 20
                  sltu         t2, zero, s3
                  mulhu        a3, s9, a1
                  c.addi4spn   a4, sp, 432
                  addi         s2, s4, 745
                  c.andi       a5, -1
                  c.or         s1, a2
                  sltiu        sp, sp, 836
                  mulhsu       s7, a4, t1
                  and          tp, t3, a5
                  c.nop
                  c.sub        a4, a5
                  c.srai       a0, 30
                  c.nop
                  c.srai       a4, 23
                  xor          s1, s0, s9
                  srl          tp, zero, s9
                  c.addi16sp   sp, 224
                  c.sub        s1, a2
                  andi         t1, t0, 510
                  slti         s10, ra, -1426
                  slti         s9, sp, -62
                  lui          t2, 627706
                  srai         a0, tp, 9
                  slli         t5, gp, 9
                  c.addi4spn   a1, sp, 400
                  auipc        s10, 936853
                  c.mv         s8, s3
                  csrrc        sp, 0x340, s10
                  c.li         s4, -1
                  nop
                  srl          ra, s6, s9
                  c.and        a1, s1
                  and          t0, a4, tp
                  srai         s6, ra, 7
                  divu         sp, s5, s3
                  csrrwi       a6, 0x340, 9
                  mulh         a7, t1, t6
                  c.add        s5, t6
                  c.or         a3, a3
                  csrrs        t2, 0x340, zero
                  c.sub        a4, s1
                  c.slli       s8, 18
                  sll          tp, s6, gp
                  csrrc        t6, 0x340, zero
                  slli         a0, t1, 22
                  or           t6, s11, tp
                  sll          a5, t6, a7
                  c.sub        a3, a1
                  c.addi       tp, 25
                  csrrw        a6, 0x340, s0
                  ori          a4, t6, -809
                  xor          a6, tp, s2
                  xori         s6, ra, 518
                  andi         t1, a5, 1081
                  srli         gp, t3, 1
                  csrrc        t2, 0x340, zero
                  sll          ra, zero, s3
                  mul          t5, a4, t2
                  c.and        a1, a2
                  csrrw        a4, 0x340, sp
                  mulhu        s9, a0, s11
                  slli         a4, sp, 20
                  slli         s11, gp, 28
                  srli         gp, tp, 12
                  addi         a4, s3, -378
                  and          t4, t6, s3
                  lui          ra, 201350
                  csrrs        a4, 0x340, a6
                  mul          a3, a6, s4
                  slt          s8, a3, a2
                  sltiu        s8, a4, 1696
                  divu         a3, tp, s5
                  ori          s10, t2, -1137
                  c.srli       a0, 3
                  c.or         s1, a2
                  mulhsu       s1, zero, s10
                  sltu         a4, a4, s6
                  xor          gp, s6, t3
                  c.andi       a0, -1
                  sra          s9, t3, a2
                  c.srai       a0, 21
                  lui          a7, 134931
                  c.addi4spn   s1, sp, 464
                  lui          s1, 591488
                  csrrwi       zero, 0x340, 12
                  c.srai       a5, 31
                  slli         a3, t3, 5
                  rem          s7, t6, tp
                  c.nop
                  c.srli       a1, 1
                  c.andi       a5, 5
                  c.addi16sp   sp, -16
                  c.nop
                  rem          tp, a7, s5
                  slt          t5, a0, gp
                  mulhu        zero, s11, t4
                  c.sub        a5, a3
                  mul          zero, s7, t2
                  add          zero, t3, a0
                  mulhu        t2, t1, s8
                  c.andi       a3, 27
                  sltu         s5, s7, s11
                  c.or         a0, s0
                  slt          s3, gp, s0
                  sub          s1, a4, s0
                  c.andi       a3, 23
                  c.xor        a1, a1
                  c.sub        a5, s0
                  c.andi       a5, -1
                  csrrw        s3, 0x340, t2
                  c.addi4spn   a4, sp, 320
                  sra          s11, a6, tp
                  c.add        a4, s10
                  and          s4, s6, s4
                  c.and        a1, s1
                  div          s7, a1, t2
                  c.nop
                  nop
                  add          t0, t2, s0
                  mulhsu       a0, s2, a6
                  srai         sp, s11, 13
                  mulhu        sp, a4, s9
                  mulh         zero, s8, s0
                  slt          ra, gp, s5
                  mul          s6, tp, t3
                  c.li         s11, 2
                  andi         s4, s2, 1233
                  slt          a5, s0, a4
                  c.srli       a5, 28
                  c.srli       a4, 20
                  xori         s3, s4, -974
                  c.sub        a1, a3
                  slli         s7, s3, 28
                  c.and        a1, a1
                  sltu         s3, s9, s6
                  c.sub        a3, a0
                  sub          ra, ra, gp
                  csrrc        s4, 0x340, a3
                  c.and        a0, a0
                  c.li         t4, 27
                  c.and        a1, a0
                  csrrc        sp, 0x340, t6
                  c.slli       t1, 27
                  mulhu        tp, t0, t5
                  c.sub        s1, a1
                  c.li         t0, 31
                  xor          s5, gp, gp
                  remu         a3, s8, t5
                  c.addi4spn   a5, sp, 288
                  c.srli       a5, 9
                  c.mv         t4, s0
                  csrrwi       s9, 0x340, 15
                  c.add        s2, s10
                  csrrci       a0, 0x340, 0
                  sltiu        t5, a3, -2037
                  c.or         a0, s1
                  c.srli       a0, 1
                  c.sub        s1, a0
                  c.addi       sp, -1
                  div          tp, s9, t3
                  srai         a6, a5, 3
                  ori          ra, gp, 1445
                  c.and        a4, a4
                  rem          t6, a4, s7
                  srl          a6, t3, s0
                  and          a3, s2, tp
                  csrrw        s1, 0x340, s9
                  c.slli       a1, 28
                  and          s7, s3, a7
                  mulhsu       ra, t3, a7
                  addi         a3, s11, 2043
                  c.nop
                  c.mv         t6, t2
                  sltiu        t6, t2, 231
                  sltiu        a5, t2, -2044
                  csrrs        t6, 0x340, a3
                  mul          s5, gp, s4
                  sltiu        t5, s10, -499
                  andi         a5, s3, -619
                  ori          a6, s1, 1346
                  auipc        a7, 57145
                  or           s10, t2, t6
                  add          t4, a5, s9
                  andi         s7, s10, -633
                  sra          ra, a7, s1
                  c.sub        a1, a3
                  sll          t6, s7, a7
                  csrrs        a1, 0x340, s11
                  mulh         t1, s8, a4
                  c.srai       a3, 24
                  c.mv         t5, s2
                  remu         ra, gp, a0
                  and          a0, t2, a2
                  csrrsi       gp, 0x340, 0
                  c.srai       a5, 16
                  xor          t1, t2, a4
                  csrrci       s3, 0x340, 5
                  csrrci       a1, 0x340, 0
                  mulhsu       s4, s11, s3
                  ori          a3, s7, 1827
                  c.andi       s1, -1
                  c.slli       a1, 26
                  c.nop
                  auipc        s2, 126362
                  ori          sp, t4, -501
                  csrrc        s3, 0x340, zero
                  mul          s5, a6, tp
                  csrrsi       s5, 0x340, 26
                  xori         a3, s3, 889
                  sra          s3, a1, a0
                  c.and        s1, a2
                  c.addi4spn   a0, sp, 96
                  remu         s6, t3, s4
                  csrrc        s4, 0x340, zero
                  c.srli       s1, 19
                  xori         a5, s5, -1599
                  csrrw        tp, 0x340, gp
                  srli         a0, s7, 0
                  csrrsi       s2, 0x340, 0
                  and          a5, s6, s6
                  add          s10, s10, a3
                  c.li         s3, 10
                  c.nop
                  c.or         a1, a3
                  c.srai       s1, 8
                  c.xor        a5, a1
                  mulhsu       s9, s3, t0
                  c.addi16sp   sp, 240
                  c.addi       tp, 10
                  c.mv         s7, a4
                  divu         a3, t6, t1
                  auipc        s6, 40933
                  c.slli       s4, 2
                  c.and        a1, a4
                  csrrsi       t6, 0x340, 16
                  remu         t5, ra, a5
                  sra          ra, t1, ra
                  c.srli       a1, 29
                  c.and        a0, a5
                  c.addi16sp   sp, 64
                  c.addi4spn   s1, sp, 288
                  c.srai       a4, 20
                  divu         s3, t6, s0
                  nop
                  c.or         a1, a5
                  lui          s7, 469331
                  c.li         s1, -1
                  c.addi4spn   s1, sp, 960
                  c.slli       gp, 20
                  sltu         gp, zero, t3
                  c.or         s1, a0
                  xori         t1, t5, 1649
                  andi         s2, s10, 1845
                  srli         s9, gp, 19
                  div          zero, a3, t0
                  slt          a4, a2, t4
                  csrrsi       a5, 0x340, 0
                  lui          sp, 230794
                  c.nop
                  rem          s11, t2, a1
                  csrrsi       t1, 0x340, 0
                  c.sub        a0, a2
                  add          t1, s9, a3
                  c.srai       s1, 22
                  csrrsi       a1, 0x340, 0
                  and          s10, ra, t5
                  c.xor        a1, a3
                  csrrs        tp, 0x340, t3
                  c.nop
                  c.srai       a3, 14
                  c.li         a4, 5
                  xor          s2, a7, a0
                  sll          s2, a2, s9
                  xor          a6, t5, s2
                  csrrc        t5, 0x340, a4
                  c.srli       a3, 30
                  c.add        tp, s8
                  andi         a7, s4, 1495
                  c.add        s9, s11
                  c.addi16sp   sp, 208
                  csrrsi       s8, 0x340, 31
                  csrrw        a0, 0x340, gp
                  c.nop
                  c.lui        a6, 23
                  c.srai       a4, 22
                  srai         a3, t2, 6
                  ori          a3, t4, 469
                  csrrci       a0, 0x340, 1
                  addi         s6, t0, -1666
                  c.addi16sp   sp, 96
                  mul          s4, s2, s9
                  c.xor        s1, s0
                  addi         a6, a7, -511
                  srli         s5, a2, 29
                  div          s9, s8, a7
                  mulh         s10, t1, s8
                  sub          s5, t2, s8
                  c.xor        a1, s1
                  c.xor        a5, a4
                  c.xor        s1, a0
                  c.xor        s1, s0
                  c.mv         t6, s8
                  csrrs        a4, 0x340, zero
                  c.andi       a1, -1
                  c.srai       a4, 22
                  csrrci       ra, 0x340, 0
                  csrrs        s11, 0x340, zero
                  csrrci       t4, 0x340, 23
                  c.or         s1, a0
                  c.srai       a0, 7
                  addi         a6, a1, -1925
                  mul          s3, s11, t1
                  c.or         a5, a3
                  c.add        s5, ra
                  xor          s6, tp, a6
                  csrrci       gp, 0x340, 0
                  c.mv         s10, t0
                  c.andi       a0, -1
                  div          s1, a1, zero
                  srl          t2, s2, a5
                  c.lui        s9, 21
                  sltu         t4, t1, a1
                  c.mv         s6, a1
                  c.add        a1, a5
                  lui          s11, 326427
                  and          a7, a6, s7
                  addi         sp, t1, -109
                  csrrwi       s9, 0x340, 31
                  c.mv         s3, s2
                  srli         s7, t6, 15
                  xor          s1, t6, t0
                  c.and        a1, a3
                  addi         s9, s6, -1060
                  srl          t1, s3, a0
                  xori         s4, a3, 1599
                  c.srli       a5, 29
                  andi         s8, t6, -1193
                  auipc        t1, 865536
                  slli         tp, s9, 14
                  sltiu        t4, s2, -1943
                  nop
                  c.sub        a5, a2
                  csrrc        t2, 0x340, a1
                  c.lui        s2, 3
                  c.addi       a1, 2
                  srl          s8, t0, s2
                  add          s8, a2, a3
                  lui          a5, 450903
                  c.add        a6, t6
                  srl          s1, s9, t1
                  xori         a1, s4, -1997
                  mulhsu       s4, a4, s3
                  c.add        s10, t4
                  c.slli       a0, 8
                  srl          ra, t4, t5
                  c.addi16sp   sp, 384
                  csrrci       a4, 0x340, 0
                  csrrsi       a4, 0x340, 0
                  c.nop
                  xori         s8, a6, 728
                  add          t0, s4, a1
                  or           s7, a7, t3
                  xori         s6, a0, 1813
                  srl          a3, t4, t4
                  c.li         a5, -1
                  div          a1, s8, zero
                  sltu         s7, t5, s1
                  add          sp, s0, sp
                  lui          tp, 886256
                  csrrci       a0, 0x340, 0
                  slli         ra, s0, 30
                  c.mv         s3, s6
                  mul          ra, s9, s3
                  csrrsi       s10, 0x340, 0
                  c.li         s3, 2
                  mulhu        s6, t4, ra
                  slti         s10, t2, 174
                  c.addi       s2, 31
                  slti         a4, a7, -1198
                  sltiu        s8, t5, -974
                  mulhsu       s3, s8, s6
                  srai         t0, a3, 0
                  csrrc        s8, 0x340, zero
                  or           s8, a7, t5
                  slt          s11, a5, t5
                  c.add        a6, t3
                  xori         a0, s6, 1473
                  rem          a0, t4, s10
                  c.slli       t2, 13
                  or           a6, t4, zero
                  slti         t5, s1, -707
                  c.addi       s8, 26
                  divu         sp, s0, sp
                  remu         t5, s1, s11
                  c.xor        a0, a4
                  csrrwi       s4, 0x340, 25
                  c.nop
                  addi         a6, s3, 1732
                  addi         zero, s3, 1759
                  csrrwi       tp, 0x340, 21
                  add          a6, t3, s3
                  srl          a7, s6, t0
                  xori         s8, ra, -386
                  sll          s9, s8, s9
                  csrrsi       s2, 0x340, 0
                  slti         t0, s4, -1585
                  c.addi4spn   a5, sp, 384
                  auipc        a6, 722868
                  csrrsi       s1, 0x340, 0
                  srli         s8, sp, 20
                  xor          a4, s7, t0
                  auipc        s4, 427238
                  rem          s5, sp, s11
                  c.add        a6, s3
                  c.lui        t6, 24
                  slli         s11, a0, 14
                  c.srli       a1, 20
                  c.lui        a4, 11
                  addi         a3, ra, -1916
                  ori          s10, t3, -1001
                  c.or         a5, a3
                  c.or         s1, s0
                  mul          s11, s10, s1
                  mulhsu       a3, t6, a3
                  csrrci       a7, 0x340, 30
                  addi         a6, s5, 237
                  csrrc        a1, 0x340, zero
                  xori         s5, zero, 935
                  mulh         s10, s5, s0
                  c.slli       s4, 22
                  c.slli       a0, 11
                  csrrsi       s8, 0x340, 0
                  lui          zero, 16204
                  sltiu        s11, t3, -1984
                  c.andi       s1, 26
                  sub          t0, s2, s2
                  remu         a5, a1, s4
                  c.srai       a4, 28
                  c.srli       a4, 27
                  csrrsi       s6, 0x340, 11
                  sra          a0, a4, t2
                  c.srai       s1, 14
                  csrrc        t0, 0x340, s2
                  csrrs        s11, 0x340, s7
                  csrrs        t2, 0x340, a3
                  nop
                  c.addi       s2, -1
                  or           a5, a2, s1
                  mulh         s3, s11, a6
                  srl          a5, s11, s9
                  c.lui        s8, 1
                  c.addi4spn   a3, sp, 288
                  ori          t6, s2, 1526
                  c.slli       s8, 2
                  addi         gp, s11, 1994
                  c.and        a1, a1
                  srai         gp, t5, 29
                  c.srli       s1, 12
                  slti         t2, t0, 100
                  andi         s11, s4, 1604
                  c.addi16sp   sp, 448
                  csrrc        s4, 0x340, zero
                  csrrs        s6, 0x340, sp
                  csrrci       s1, 0x340, 0
                  mulh         a6, sp, t2
                  add          a4, s11, s9
                  mulhsu       ra, s10, s6
                  c.and        s1, a0
                  nop
                  div          a0, zero, s5
                  mulhsu       s4, a1, t1
                  sltiu        s11, t4, -707
                  c.or         s1, a3
                  c.xor        a0, a0
                  auipc        a6, 577687
                  c.srai       a1, 29
                  c.and        a4, a3
                  slli         a5, s5, 14
                  slt          s3, a0, ra
                  c.addi4spn   a4, sp, 640
                  mulhsu       sp, t6, t1
                  c.srai       a5, 2
                  divu         t2, ra, t6
                  c.addi16sp   sp, 64
                  mul          s6, s1, s3
                  andi         t5, t3, 1667
                  srai         t2, a4, 29
                  c.li         ra, 26
                  csrrs        a3, 0x340, zero
                  csrrsi       s10, 0x340, 0
                  ori          ra, t1, 663
                  xor          s8, s5, gp
                  mulhu        sp, a5, s6
                  c.li         t4, -1
                  c.srai       a5, 20
                  c.sub        a5, s0
                  or           a6, a2, s4
                  csrrc        ra, 0x340, zero
                  c.addi16sp   sp, 16
                  srl          t1, a5, s11
                  slti         s2, s7, 1166
                  addi         zero, ra, 1179
                  csrrsi       s9, 0x340, 0
                  c.addi16sp   sp, 208
                  c.srai       a4, 4
                  divu         s3, s1, a7
                  andi         s1, t3, 1593
                  c.slli       a3, 20
                  add          gp, t0, t5
                  mul          a1, t6, s9
                  c.lui        ra, 27
                  mulhsu       s5, s2, a1
                  srl          ra, a7, a2
                  c.xor        a3, a2
                  xori         s9, t6, 1419
                  addi         ra, s11, 848
                  nop
                  mulhu        a0, a0, s0
                  c.addi4spn   s1, sp, 672
                  nop
                  sltu         t1, a4, a3
                  c.srai       a0, 30
                  c.srli       a0, 16
                  csrrs        a1, 0x340, a7
                  addi         a0, sp, -1816
                  remu         t4, s9, a4
                  add          s4, s2, s9
                  c.addi4spn   s1, sp, 176
                  divu         s11, t1, a4
                  c.addi       tp, 9
                  and          t1, t0, t6
                  andi         s5, ra, 2030
                  c.xor        a3, a2
                  div          s5, s2, s4
                  c.nop
                  remu         t5, zero, ra
                  divu         zero, a7, s4
                  sub          s4, s4, a4
                  slt          t5, ra, t6
                  c.add        ra, s5
                  c.srli       a0, 9
                  auipc        s6, 930857
                  c.or         s1, a0
                  c.srai       a5, 26
                  div          t2, sp, s3
                  csrrci       s10, 0x340, 0
                  c.addi16sp   sp, 432
                  rem          a7, a4, a0
                  csrrci       zero, 0x340, 0
                  c.addi16sp   sp, 384
                  sra          s5, s1, a2
                  c.mv         s3, ra
                  csrrs        a6, 0x340, gp
                  addi         t5, s1, -1081
                  c.or         a4, s0
                  nop
                  c.addi       s2, -1
                  nop
                  c.srli       a5, 18
                  c.or         a4, s0
                  remu         t0, t1, s2
                  srli         s4, t4, 27
                  mulhsu       s4, s9, a4
                  remu         tp, t3, s10
                  c.add        sp, a4
                  csrrc        ra, 0x340, zero
                  c.nop
                  sltiu        ra, t2, 1797
                  div          t6, t6, zero
                  c.addi       s8, -1
                  sltu         a4, s3, t6
                  csrrs        s7, 0x340, zero
                  c.andi       a5, -1
                  c.nop
                  nop
                  divu         ra, s8, t3
                  c.addi16sp   sp, -16
                  csrrwi       t0, 0x340, 17
                  c.addi4spn   a4, sp, 880
                  sra          a4, t1, s8
                  csrrwi       s1, 0x340, 10
                  mulhu        ra, t2, s5
                  sll          t1, t1, s11
                  add          s11, tp, t1
                  and          s9, t2, t3
                  rem          t1, a7, a5
                  csrrsi       sp, 0x340, 10
                  c.addi4spn   a4, sp, 432
                  sltiu        s4, a2, -249
                  mulhu        s8, a7, s3
                  csrrsi       t4, 0x340, 0
                  add          t6, a7, a6
                  div          s2, ra, a0
                  csrrsi       t2, 0x340, 6
                  sltu         s6, s2, t2
                  srai         t5, t3, 13
                  divu         t1, t6, s8
                  c.lui        s1, 11
                  sltu         s4, s11, sp
                  c.or         a4, a4
                  lui          t0, 103449
                  c.addi4spn   s1, sp, 880
                  mulhsu       s4, s9, t3
                  add          t2, a3, s2
                  srl          t4, s8, a4
                  mulh         t4, a0, t3
                  c.li         s2, -1
                  add          s7, gp, s9
                  c.addi4spn   a3, sp, 608
                  xor          s3, s10, t1
                  slt          t2, s6, ra
                  c.addi16sp   sp, -16
                  rem          a4, s9, a2
                  add          a7, t4, a6
                  or           sp, ra, a2
                  div          a0, a7, sp
                  c.addi4spn   a3, sp, 800
                  nop
                  slt          sp, s9, sp
                  sra          t4, s10, s4
                  c.xor        a0, a1
                  c.or         a1, s0
                  srl          tp, a4, s3
                  csrrsi       a0, 0x340, 0
                  csrrci       t5, 0x340, 0
                  andi         zero, ra, 311
                  c.and        a5, a5
                  c.mv         t0, s0
                  csrrs        a5, 0x340, a2
                  c.addi4spn   s1, sp, 832
                  srli         t2, s0, 0
                  mulhu        a3, t0, t1
                  csrrwi       t0, 0x340, 14
                  csrrsi       a5, 0x340, 3
                  mulh         s2, a3, s1
                  c.and        a3, a2
                  c.nop
                  csrrci       a4, 0x340, 4
                  c.nop
                  c.or         a0, s0
                  c.addi       ra, 16
                  c.and        a4, a1
                  srli         t2, t2, 30
                  c.srli       a4, 17
                  csrrc        a0, 0x340, zero
                  c.and        a5, a4
                  c.addi       s7, 15
                  sra          t6, s0, s10
                  c.srli       a4, 7
                  c.and        a3, a1
                  sltu         s1, a6, s7
                  mulhu        t5, t6, s3
                  c.or         a5, a2
                  c.nop
                  mul          t1, t6, t1
                  divu         t0, s5, ra
                  c.lui        a3, 1
                  ori          t0, sp, -302
                  srli         s6, s5, 29
                  auipc        a0, 252109
                  or           t5, t2, s11
                  c.add        a5, s6
                  and          ra, s2, t1
                  andi         s10, a7, 327
                  c.and        a0, s0
                  c.andi       a1, 1
                  mulhsu       t4, sp, t3
                  rem          a3, a7, s1
                  c.or         a0, s0
                  c.andi       a0, 27
                  csrrsi       a5, 0x340, 0
                  c.addi4spn   a3, sp, 32
                  c.andi       a4, 18
                  add          s11, a7, s8
                  div          gp, s6, a1
                  c.andi       a1, 21
                  csrrc        gp, 0x340, t3
                  c.srli       a3, 7
                  add          s8, s5, a5
                  remu         s8, s0, s9
                  sll          t2, s2, a4
                  add          a3, a5, s7
                  c.srli       a5, 9
                  c.and        a1, a2
                  xori         t6, s1, -920
                  c.lui        t5, 16
                  csrrci       tp, 0x340, 31
                  divu         a7, s7, s4
                  c.slli       a5, 4
                  addi         s3, s3, 2043
                  sltiu        gp, s0, 883
                  div          t5, s3, t0
                  slli         s10, tp, 15
                  mulhu        s4, s2, a4
                  srl          s10, t6, s1
                  mulhu        a1, tp, zero
                  slti         s4, s11, 1863
                  lui          s7, 145815
                  csrrc        a3, 0x340, sp
                  csrrci       ra, 0x340, 5
                  c.addi       a5, 23
                  andi         a0, s11, 1497
                  slt          a3, t3, t1
                  csrrs        s8, 0x340, s5
                  or           a0, a5, s2
                  sub          t1, t2, s3
                  c.lui        a1, 11
                  or           s1, a7, sp
                  andi         s7, s9, 889
                  mulh         t5, t1, ra
                  c.addi16sp   sp, 256
                  c.srli       a1, 3
                  auipc        a5, 608593
                  xor          gp, s10, zero
                  srai         s6, t0, 18
                  srli         gp, sp, 31
                  xori         t5, a4, 114
                  mulh         t5, s6, s9
                  sub          a0, t2, s0
                  c.srai       a0, 4
                  auipc        s7, 899711
                  remu         zero, t5, s5
                  srai         t5, t1, 25
                  mul          s5, gp, sp
                  and          s4, t6, a3
                  c.sub        a5, a1
                  c.addi       a6, -1
                  divu         t6, ra, s10
                  c.or         a5, a2
                  csrrsi       t0, 0x340, 2
                  csrrs        zero, 0x340, zero
                  c.addi16sp   sp, 80
                  c.nop
                  or           gp, t3, tp
                  c.addi4spn   a3, sp, 1008
                  sub          t0, t5, a0
                  nop
                  sltu         s7, s10, ra
                  c.addi4spn   a5, sp, 480
                  csrrsi       s2, 0x340, 24
                  c.xor        a5, a5
                  c.add        s1, s7
                  mul          zero, ra, a6
                  c.li         s2, 10
                  c.addi4spn   a1, sp, 960
                  c.srli       s1, 27
                  csrrs        a1, 0x340, zero
                  slli         a0, a3, 9
                  andi         t1, s3, -861
                  srai         a6, s7, 25
                  mulhsu       ra, a4, s3
                  c.li         a5, 31
                  c.nop
                  mulh         s3, a4, t1
                  c.addi       t0, 7
                  sll          s11, sp, t0
                  addi         tp, s6, -1822
                  c.slli       t2, 31
                  csrrwi       t5, 0x340, 11
                  and          t2, a4, t3
                  sltiu        s5, s2, 1299
                  rem          a4, s8, a6
                  c.and        a1, a0
                  mul          s6, a4, ra
                  c.and        a1, s1
                  xori         s9, zero, 580
                  c.srai       s1, 4
                  csrrwi       a6, 0x340, 23
                  c.addi16sp   sp, -16
                  add          a6, t2, s3
                  csrrc        t6, 0x340, s2
                  divu         gp, a1, t5
                  slt          a6, a6, s1
                  csrrc        s11, 0x340, zero
                  csrrci       s8, 0x340, 0
                  c.xor        a0, s0
                  c.xor        a5, a4
                  c.srai       s1, 20
                  srl          s11, s7, ra
                  c.xor        a5, a2
                  sra          a7, s8, a0
                  c.add        s1, a0
                  mulhsu       a0, t0, ra
                  csrrci       a1, 0x340, 0
                  divu         s3, a5, t2
                  csrrc        t5, 0x340, s0
                  csrrs        s3, 0x340, zero
                  c.li         a0, -1
                  slti         t6, s11, 1407
                  c.nop
                  ori          a7, s2, -1274
                  sll          a6, s10, s9
                  mulh         t4, s0, s1
                  slt          t0, zero, a6
                  sra          s5, t6, a0
                  sub          a7, zero, s2
                  c.mv         ra, t0
                  and          s1, a7, t2
                  c.srli       s1, 31
                  srl          s3, t5, t1
                  xor          a7, s7, a2
                  lui          ra, 783570
                  srl          s9, a6, a6
                  csrrwi       t2, 0x340, 7
                  mul          s6, a0, s9
                  c.srai       a3, 4
                  csrrwi       s6, 0x340, 29
                  xor          zero, s5, a5
                  slti         a4, s7, -267
                  auipc        tp, 332875
                  c.add        s4, a0
                  c.xor        a3, a2
                  c.and        a1, a1
                  mulhu        s5, gp, s7
                  sltiu        t0, a3, -788
                  c.add        s6, a0
                  lui          a1, 574408
                  c.srai       a1, 11
                  c.nop
                  srai         s10, t1, 24
                  divu         s10, s7, s11
                  add          a5, s10, s5
                  and          s6, s2, t2
                  sltiu        s4, t3, 969
                  lui          t4, 889321
                  rem          t6, t3, a6
                  c.slli       a1, 4
                  slli         s7, t5, 10
                  srai         s5, t1, 18
                  add          s1, a6, s2
                  c.addi16sp   sp, 448
                  c.slli       s8, 3
                  remu         a1, s2, s5
                  div          s9, s7, tp
                  c.mv         s6, a5
                  c.addi16sp   sp, -16
                  nop
                  ori          a1, a4, 4
                  c.or         a1, a3
                  mulh         t0, a5, s4
                  csrrs        t0, 0x340, a0
                  srli         tp, a0, 31
                  c.srli       s1, 29
                  mulh         s8, t3, a6
                  csrrw        a5, 0x340, t1
                  slli         a7, s8, 13
                  andi         s9, a5, -117
                  csrrc        a5, 0x340, zero
                  ori          a7, s8, -1167
                  ori          a5, a7, 1928
                  c.slli       a1, 19
                  csrrwi       t2, 0x340, 20
                  sra          s5, t1, tp
                  csrrci       a6, 0x340, 0
                  or           a0, s9, t0
                  mulhu        a6, s6, a6
                  rem          s5, a6, a2
                  c.addi       s11, 23
                  c.li         s6, -1
                  ori          t1, sp, 1987
                  add          s6, s4, s0
                  add          t2, t2, s0
                  c.mv         s8, sp
                  nop
                  sra          s7, t1, s5
                  lui          s10, 512736
                  c.srai       a3, 22
                  lui          t2, 510034
                  sll          s9, s2, s1
                  mul          ra, tp, t1
                  nop
                  andi         s7, s6, 329
                  csrrsi       t5, 0x340, 12
                  lui          s1, 548203
                  auipc        ra, 15680
                  c.mv         a3, s1
                  sltiu        zero, t4, -1131
                  c.mv         t1, ra
                  slli         s6, s1, 21
                  csrrsi       t0, 0x340, 3
                  rem          gp, gp, t0
                  c.sub        a1, s1
                  sltu         s10, a5, s1
                  divu         s1, a3, a2
                  mul          t6, a5, s8
                  mulhu        a6, s9, s8
                  mul          s11, a4, t5
                  slti         t0, t1, 1093
                  c.add        a6, s8
                  c.addi4spn   a5, sp, 624
                  mul          s4, s0, s7
                  c.addi16sp   sp, 160
                  c.addi16sp   sp, 144
                  srl          t5, t6, t0
                  sltu         s5, s0, a6
                  slti         s9, a2, 249
                  c.or         a3, a2
                  remu         s3, s5, t2
                  c.sub        a0, s1
                  xor          t5, s9, a0
                  or           a5, s6, t5
                  srli         t5, a1, 8
                  srl          s3, a0, a2
                  c.addi16sp   sp, -16
                  slt          s8, s2, t3
                  c.srli       a1, 11
                  div          a4, a0, s3
                  and          a0, a2, a7
                  csrrsi       s6, 0x340, 0
                  sub          s1, t5, t4
                  lui          t2, 360573
                  slti         t1, t2, -837
                  c.srai       a4, 6
                  c.srai       a4, 16
                  or           sp, a1, t5
                  mulh         t1, s4, a4
                  mulh         s1, gp, s8
                  lui          a7, 1001420
                  or           a1, a1, a0
                  c.addi4spn   a1, sp, 304
                  rem          a1, s7, t6
                  or           s3, a1, a2
                  sra          s2, s7, sp
                  mul          t4, a7, a3
                  c.add        a0, s7
                  remu         s4, a6, a5
                  remu         s6, a7, a0
                  slt          s5, s6, t3
                  csrrwi       t5, 0x340, 29
                  mulhu        s8, s0, gp
                  srl          sp, t2, s2
                  c.and        a5, a3
                  c.slli       t2, 13
                  srli         a6, t6, 7
                  add          sp, s5, ra
                  ori          s2, t3, 1463
                  c.srli       a5, 6
                  mulhu        a0, a1, s9
                  remu         t2, s10, a3
                  c.xor        a3, a3
                  sra          s4, a1, s9
                  lui          s1, 238058
                  or           t2, s7, s9
                  c.li         tp, 28
                  c.addi       a1, -1
                  sltiu        a7, t4, -1629
                  slti         t1, t4, 494
                  slli         t0, s10, 2
                  rem          zero, tp, t6
                  c.xor        a5, s1
                  sll          t4, s5, a1
                  c.xor        s1, a5
                  csrrc        s10, 0x340, zero
                  mul          s3, s9, t3
                  sub          zero, s7, a6
                  csrrwi       sp, 0x340, 12
                  rem          t1, s2, s0
                  c.srai       a1, 20
                  c.xor        a0, a0
                  or           t6, a0, t3
                  and          s10, s2, s5
                  remu         s4, s9, a0
                  csrrci       s8, 0x340, 30
                  csrrci       t4, 0x340, 3
                  lui          t5, 311418
                  srl          a0, a6, gp
                  c.slli       a4, 16
                  mulhsu       a5, s7, a3
                  addi         gp, s6, 181
                  c.add        s6, t3
                  mulhsu       s3, s5, s3
                  csrrwi       t4, 0x340, 19
                  csrrw        s5, 0x340, s8
                  auipc        t6, 239592
                  mul          t4, tp, a2
                  sll          t0, s3, s3
                  slt          a6, s11, sp
                  c.xor        s1, s1
                  sltu         s10, t3, t1
                  remu         s5, a6, s10
                  nop
                  rem          t2, a5, ra
                  c.addi16sp   sp, 416
                  c.addi       s5, -1
                  mulhu        s10, t3, t5
                  c.lui        t6, 19
                  slli         gp, t1, 1
                  c.slli       a3, 10
                  addi         a1, a1, 1785
                  nop
                  addi         gp, a7, -1831
                  xor          a6, s6, t5
                  sll          s5, tp, s11
                  sltiu        s5, gp, -978
                  c.li         a6, 31
                  c.xor        a4, a2
                  sll          a6, a3, s9
                  add          t2, s3, ra
                  slli         tp, a2, 4
                  c.andi       a5, -1
                  mulh         a0, t6, ra
                  sll          tp, t1, tp
                  divu         s7, s1, s1
                  srai         s3, t6, 16
                  c.addi16sp   sp, -16
                  c.slli       a5, 6
                  add          s3, t5, t4
                  csrrci       ra, 0x340, 0
                  mulhu        s3, s8, s4
                  nop
                  xor          s1, a0, a3
                  mulhsu       t0, a7, zero
                  lui          s8, 801859
                  srl          s11, a3, gp
                  xor          s2, a4, t2
                  mulh         gp, tp, t2
                  or           s3, s3, t2
                  sub          s8, a1, zero
                  andi         s3, a4, 608
                  or           t6, t5, s6
                  c.srli       a3, 24
                  xori         s9, a3, 902
                  sltiu        gp, a0, 68
                  csrrw        t5, 0x340, ra
                  mulhsu       sp, a5, t1
                  mulhu        a7, tp, s4
                  c.and        a3, s1
                  and          s4, t5, t6
                  mulhu        a6, t0, s3
                  csrrc        t0, 0x340, zero
                  c.li         a5, -1
                  slli         gp, s2, 1
                  c.addi4spn   a0, sp, 928
                  c.srli       a4, 21
                  nop
                  add          s4, t5, ra
                  mul          s4, t0, t0
                  csrrsi       s4, 0x340, 0
                  mulh         s1, zero, zero
                  c.addi4spn   a4, sp, 832
                  sltiu        s10, tp, -387
                  slti         tp, s1, -1541
                  c.addi16sp   sp, -16
                  sll          a4, t3, t0
                  csrrci       s5, 0x340, 12
                  c.li         a6, -1
                  remu         a7, s8, a1
                  csrrci       s1, 0x340, 0
                  auipc        a1, 796536
                  sltiu        s1, s7, 2016
                  c.addi4spn   a0, sp, 608
                  c.add        s4, t5
                  slti         s6, a7, 918
                  c.mv         t4, a7
                  csrrw        s3, 0x340, t6
                  remu         a7, s7, ra
                  slt          s2, sp, t4
                  sltu         a3, s3, s5
                  slti         s2, sp, 1772
                  or           s6, t4, a7
                  mul          t5, a1, tp
                  and          a6, a6, s7
                  c.addi       s7, -1
                  ori          t1, a6, 1305
                  xori         a3, t6, 1883
                  c.addi4spn   a0, sp, 976
                  csrrci       t4, 0x340, 7
                  c.xor        a1, a5
                  srli         a4, ra, 19
                  sra          a1, s11, s3
                  slt          s8, sp, s4
                  csrrwi       s8, 0x340, 9
                  mulhsu       s10, t4, t6
                  c.slli       s5, 29
                  c.sub        a0, s0
                  c.addi16sp   sp, 384
                  and          gp, s6, t2
                  c.sub        a4, a5
                  c.mv         s4, s1
                  sltu         a1, t6, s5
                  sltiu        tp, t2, 412
                  c.addi       a7, -1
                  sltiu        s2, a5, -646
                  c.srli       s1, 14
                  csrrci       ra, 0x340, 23
                  or           a1, s2, s6
                  xor          a5, s6, s11
                  srl          s11, t2, s5
                  c.addi16sp   sp, 112
                  add          a4, t0, s1
                  mulhu        s8, a2, s5
                  add          s3, s9, ra
                  div          t0, t5, zero
                  mulh         s9, a7, s2
                  sll          ra, a5, s6
                  sltu         gp, s7, t0
                  c.sub        a0, a5
                  auipc        a3, 175641
                  addi         t1, a3, 1715
                  c.addi4spn   a3, sp, 672
                  or           s2, a5, a0
                  c.addi4spn   a4, sp, 176
                  andi         s4, s2, 394
                  divu         s9, a4, s2
                  csrrc        s9, 0x340, zero
                  c.srli       a4, 24
                  sub          t6, sp, tp
                  c.sub        a5, a1
                  mulh         ra, s8, s9
                  lui          a6, 464118
                  mulhu        gp, s10, t4
                  mulhu        a5, s11, a3
                  c.addi4spn   a1, sp, 432
                  mul          a6, a3, s6
                  xor          zero, a3, gp
                  c.xor        a5, s1
                  xor          a4, a6, s8
                  auipc        zero, 146080
                  mul          a7, t2, a3
                  add          s4, ra, s1
                  c.sub        a0, a2
                  remu         s6, t4, a7
                  slti         s3, s9, -1367
                  slti         a7, s7, -592
                  srl          a7, t3, a1
                  and          zero, s11, s8
                  mul          t2, ra, s1
                  ori          t0, s1, 1770
                  c.nop
                  c.lui        a1, 6
                  c.sub        a1, a5
                  csrrc        s3, 0x340, zero
                  andi         gp, tp, -1257
                  mul          a4, t6, gp
                  nop
                  addi         a0, t1, 1321
                  c.addi16sp   sp, -16
                  mul          gp, s3, a3
                  srai         s6, t1, 3
                  c.andi       a1, 23
                  lui          gp, 377710
                  sub          gp, s0, a4
                  nop
                  c.mv         s5, s2
                  slt          t5, s0, sp
                  csrrsi       a5, 0x340, 6
                  mul          s1, t4, a1
                  add          a1, s6, a0
                  div          s11, s0, s5
                  c.addi16sp   sp, -16
                  or           gp, s0, t0
                  c.sub        a5, s1
                  and          t1, s1, tp
                  slli         a0, t4, 10
                  c.and        a4, a1
                  c.xor        a1, a1
                  c.nop
                  c.addi       a1, 15
                  lui          s10, 634926
                  c.or         s1, a2
                  srai         a3, t4, 6
                  srli         a4, tp, 11
                  sra          s9, a1, a0
                  slti         t1, gp, 837
                  slli         t2, a6, 8
                  c.sub        a5, a0
                  csrrci       s3, 0x340, 0
                  c.andi       s1, 4
                  addi         zero, s8, 508
                  csrrwi       s4, 0x340, 31
                  c.li         sp, 31
                  or           a5, a2, s2
                  xori         s1, t3, -1942
                  mul          a5, s8, a2
                  c.li         s9, -1
                  slli         ra, gp, 19
                  c.and        a0, a3
                  sra          t4, s11, a5
                  mulh         a7, s4, t2
                  sltiu        s11, s8, 848
                  divu         s1, t5, t1
                  slt          s9, zero, a2
                  addi         s1, t4, 1787
                  div          tp, s6, s10
                  and          ra, s8, s3
                  and          s4, t4, t3
                  sub          a6, ra, s2
                  sltu         a4, s6, s7
                  remu         t6, zero, s9
                  sub          s10, a4, t5
                  csrrwi       ra, 0x340, 14
                  csrrwi       tp, 0x340, 19
                  csrrw        a0, 0x340, a5
                  c.nop
                  srl          t6, s4, ra
                  divu         s5, t3, zero
                  c.nop
                  nop
                  c.li         s7, -1
                  xor          t2, s6, s11
                  c.srli       a3, 12
                  c.srai       a3, 5
                  add          s11, a5, t1
                  sra          s10, s5, sp
                  addi         ra, t2, 104
                  and          t1, s7, t0
                  mulhsu       a3, s5, sp
                  ori          gp, a0, -17
                  c.addi4spn   a1, sp, 496
                  andi         gp, a5, 788
                  slli         s4, a4, 2
                  c.addi       s7, -1
                  mulhsu       s1, s10, a3
                  c.and        a4, a3
                  c.slli       s11, 30
                  csrrs        a3, 0x340, zero
                  slt          s11, a3, sp
                  or           a7, s10, t2
                  csrrsi       a3, 0x340, 0
                  divu         zero, ra, t4
                  c.andi       a0, -1
                  c.mv         a4, a3
                  lui          s11, 221107
                  xori         t6, s1, 282
                  csrrs        sp, 0x340, zero
                  srai         t4, a0, 15
                  andi         t4, s10, 714
                  c.and        s1, a0
                  sub          t5, a1, t4
                  divu         a7, a7, s5
                  c.add        s10, t5
                  csrrc        gp, 0x340, zero
                  remu         t1, t3, a1
                  c.lui        t0, 2
                  c.nop
                  sub          s11, t4, a4
                  divu         a0, gp, a0
                  div          t6, a2, a7
                  csrrci       tp, 0x340, 0
                  xori         s3, a2, -1935
                  srai         s8, t6, 13
                  sltu         zero, a4, s10
                  csrrs        s4, 0x340, s4
                  srli         s11, s10, 18
                  c.mv         tp, t2
                  sll          zero, t5, s3
                  c.sub        a1, s1
                  c.add        t2, t4
                  c.andi       a0, 26
                  div          s9, s9, ra
                  c.nop
                  sltiu        s2, t1, -193
                  c.li         a0, 19
                  andi         s11, a7, 106
                  c.slli       gp, 18
                  lui          a7, 207797
                  c.li         s3, -1
                  slti         a6, a7, 1949
                  c.addi4spn   a5, sp, 192
                  c.srli       a4, 11
                  sra          s1, t2, ra
                  addi         s10, t3, -1758
                  c.lui        gp, 17
                  andi         sp, t5, 1196
                  c.or         s1, s0
                  c.addi       a0, -1
                  sltiu        a0, s6, -2016
                  srai         t4, t2, 13
                  slti         zero, t6, -515
                  nop
                  sub          s8, t3, a1
                  c.andi       a4, -1
                  xori         a4, s10, -335
                  nop
                  mulh         t2, s9, ra
                  c.mv         s9, s8
                  sltiu        tp, s6, -2035
                  sll          a5, t4, s9
                  lui          t1, 367993
                  c.andi       a3, -1
                  sub          sp, a1, s9
                  or           t4, s10, s3
                  and          a0, s4, zero
                  div          s7, zero, s2
                  c.srai       a0, 17
                  c.or         a1, a5
                  c.addi16sp   sp, -16
                  c.slli       t5, 29
                  sra          sp, s3, t1
                  xor          s7, s1, s7
                  c.srai       a1, 16
                  sll          s3, t4, a6
                  c.slli       s7, 13
                  c.addi4spn   a5, sp, 944
                  mul          a6, s2, s9
                  c.nop
                  mulhu        a3, s2, s5
                  and          t0, t3, t0
                  c.srli       a0, 28
                  srl          a6, a4, a5
                  c.andi       a1, -1
                  csrrci       s4, 0x340, 0
                  slt          t0, t3, s11
                  slli         gp, a4, 9
                  slli         a5, s7, 22
                  xori         t5, a7, 767
                  csrrwi       zero, 0x340, 29
                  srli         s4, zero, 8
                  rem          a3, a5, t0
                  xori         s8, a4, 479
                  c.lui        s9, 16
                  csrrsi       s3, 0x340, 7
                  and          s11, s2, s7
                  csrrwi       s4, 0x340, 14
                  c.addi16sp   sp, 416
                  remu         sp, s9, s6
                  c.nop
                  c.addi4spn   a3, sp, 800
                  ori          gp, tp, 598
                  add          s6, t6, a6
                  c.srai       s1, 24
                  mul          s3, t2, s2
                  ori          s3, s1, 6
                  mul          a1, t3, s8
                  c.and        a5, s1
                  c.add        s7, a7
                  sub          t2, s11, s3
                  c.srli       a1, 31
                  sra          a6, a3, a4
                  srl          s8, s9, s0
                  sra          a4, s5, a4
                  c.addi       t2, -1
                  c.addi16sp   sp, -16
                  c.srli       a5, 10
                  c.mv         a6, t3
                  mulh         t5, s3, t2
                  c.andi       a1, 21
                  mulhsu       a6, a5, a5
                  srli         t2, t5, 6
                  and          s9, t1, gp
                  c.nop
                  auipc        t1, 22991
                  addi         t2, t1, -1669
                  c.addi4spn   a1, sp, 176
                  nop
                  csrrsi       a5, 0x340, 0
                  c.li         s7, -1
                  mulh         s7, tp, a5
                  c.and        a5, a1
                  sra          s7, t2, a6
                  c.and        a3, a0
                  ori          s3, a0, -1173
                  add          s8, a4, s5
                  sub          gp, s10, t0
                  srli         t2, a3, 7
                  c.nop
                  csrrs        s7, 0x340, zero
                  c.srli       a3, 22
                  csrrwi       a3, 0x340, 19
                  c.addi16sp   sp, -16
                  sra          a3, s11, t0
                  or           a1, a7, s2
                  srl          ra, t4, a3
                  csrrsi       a1, 0x340, 7
                  or           a3, a4, s7
                  c.slli       s4, 10
                  c.addi       a7, -1
                  c.sub        a1, s0
                  c.mv         t6, s1
                  csrrw        a3, 0x340, t6
                  add          a7, a6, s1
                  sra          s2, sp, t1
                  sra          s1, s4, t2
                  csrrci       a7, 0x340, 0
                  div          a3, a5, t6
                  sltu         t4, gp, s3
                  c.srai       a1, 29
                  c.sub        s1, a2
                  sll          a0, s3, s10
                  c.and        s1, a1
                  sll          a6, t5, a7
                  csrrw        a3, 0x340, s1
                  c.slli       a3, 19
                  or           a4, a6, t3
                  or           a6, tp, gp
                  mulh         gp, s0, a5
                  c.addi4spn   a5, sp, 480
                  nop
                  srli         t0, ra, 9
                  csrrs        s5, 0x340, zero
                  ori          t2, a0, 666
                  sll          a6, t6, s6
                  slti         s6, a7, -999
                  srl          s1, t4, s10
                  c.lui        a6, 14
                  csrrs        t6, 0x340, sp
                  sltiu        s9, s6, 1743
                  c.slli       t0, 10
                  c.sub        a4, a0
                  srai         ra, a0, 19
                  lui          t0, 256000
                  c.or         s1, a5
                  c.sub        a1, a5
                  srl          s11, t0, t0
                  c.or         s1, s0
                  csrrwi       s3, 0x340, 17
                  srli         s10, t1, 20
                  slt          a1, s4, s4
                  c.or         a0, a5
                  and          a5, s3, s0
                  slt          s7, s7, s3
                  csrrc        tp, 0x340, zero
                  csrrw        a7, 0x340, a6
                  c.addi16sp   sp, -16
                  rem          s10, a3, s0
                  c.srai       a3, 26
                  c.addi       s1, -1
                  c.add        t6, a5
                  add          s5, a2, s10
                  nop
                  csrrw        s9, 0x340, s3
                  mulh         s2, s3, a7
                  sra          a6, a7, s4
                  ori          a3, s2, 2017
                  ori          t1, a3, -1335
                  csrrsi       t1, 0x340, 0
                  srl          t6, t6, s7
                  sltiu        tp, sp, 406
                  slti         t5, ra, -697
                  csrrs        gp, 0x340, t2
                  csrrs        s6, 0x340, zero
                  addi         s8, zero, -1897
                  csrrwi       sp, 0x340, 19
                  c.srai       a3, 31
                  xor          s7, s3, s7
                  c.li         s2, -1
                  csrrc        gp, 0x340, a0
                  csrrc        t1, 0x340, a7
                  c.sub        s1, a0
                  remu         a3, a3, ra
                  addi         t5, a0, -1209
                  c.andi       a5, 6
                  rem          s1, s1, a7
                  sub          s2, t0, s8
                  c.lui        s1, 3
                  c.addi16sp   sp, -16
                  div          s4, t0, t6
                  sll          a7, t1, s2
                  sll          s5, s10, sp
                  csrrsi       s3, 0x340, 2
                  andi         t2, sp, -1930
                  mul          s8, s9, s1
                  andi         a1, t4, -666
                  remu         a4, s7, s8
                  c.add        t5, t2
                  c.addi4spn   a4, sp, 544
                  sltiu        s11, a3, -1307
                  c.li         s6, 30
                  sra          gp, zero, zero
                  add          gp, s7, a4
                  andi         gp, s9, -429
                  mulhu        s6, s6, tp
                  c.addi       s5, -1
                  srai         t5, zero, 4
                  lui          s10, 806897
                  lui          s7, 873614
                  csrrsi       s11, 0x340, 26
                  ori          s1, t6, 1264
                  sra          s6, t0, a0
                  add          s4, a4, tp
                  andi         s7, t0, 1712
                  mul          s9, t1, gp
                  c.addi       s9, -1
                  c.addi       tp, 26
                  slti         t0, tp, -856
                  mulhu        t0, s1, t5
                  add          s11, s2, a5
                  slti         a3, zero, -930
                  c.and        a1, a1
                  c.srli       a3, 4
                  c.addi       s7, -1
                  andi         a5, t4, -1561
                  c.mv         s8, s8
                  mul          s4, t1, s10
                  c.addi4spn   a4, sp, 976
                  c.lui        s6, 1
                  remu         t4, s6, s2
                  remu         s6, a1, s4
                  c.addi       t0, 8
                  c.srli       a5, 31
                  rem          a7, s3, a2
                  slli         s6, s2, 3
                  and          s3, s6, s4
                  slli         a5, t4, 10
                  xori         gp, s5, 615
                  csrrw        tp, 0x340, s0
                  csrrc        s11, 0x340, a7
                  csrrci       t6, 0x340, 3
                  c.lui        t1, 31
                  c.addi       a0, -1
                  c.addi4spn   a5, sp, 960
                  c.add        a6, s9
                  c.nop
                  mulh         s5, a4, s1
                  csrrs        a4, 0x340, zero
                  slli         s11, s10, 31
                  slli         a7, a0, 28
                  csrrsi       t1, 0x340, 29
                  add          t4, s4, s5
                  mulhu        s2, t3, a3
                  c.lui        gp, 28
                  xori         a4, s10, -156
                  csrrw        s1, 0x340, s4
                  sltiu        a6, gp, -1179
                  c.srli       a0, 16
                  sll          s8, a1, s3
                  srai         s1, t4, 27
                  c.lui        a6, 14
                  c.lui        a6, 3
                  auipc        a1, 233110
                  csrrci       a4, 0x340, 0
                  srl          s4, s6, s0
                  sltiu        a4, a4, -761
                  csrrs        tp, 0x340, a5
                  c.xor        a5, a3
                  add          s9, a2, s4
                  srai         gp, s9, 0
                  mulhu        t1, s8, tp
                  and          t4, s8, s8
                  csrrci       t2, 0x340, 0
                  c.or         s1, a0
                  srai         t5, a6, 9
                  xori         t5, sp, 806
                  c.add        s2, a2
                  csrrwi       sp, 0x340, 12
                  c.srai       s1, 22
                  mulhu        a3, a7, gp
                  srai         a1, t2, 1
                  xor          t2, s8, a3
                  sltiu        a5, gp, 39
                  csrrci       s1, 0x340, 29
                  c.slli       a5, 14
                  sll          t1, gp, sp
                  csrrc        s7, 0x340, s3
                  xor          t0, t0, t4
                  c.srai       a5, 2
                  csrrs        s1, 0x340, s6
                  c.addi16sp   sp, -16
                  sra          s9, a3, a0
                  mul          s9, a2, zero
                  add          s1, s0, a1
                  lui          a6, 394476
                  c.li         t1, 25
                  csrrs        t1, 0x340, s3
                  auipc        s11, 35482
                  c.srli       a5, 15
                  or           a7, t3, t5
                  c.or         a4, s0
                  andi         a5, sp, -167
                  c.li         a6, -1
                  c.mv         s2, t2
                  c.or         a1, s1
                  mul          sp, a0, s4
                  c.mv         a3, s9
                  ori          s6, t5, -2021
                  csrrw        s8, 0x340, ra
                  slt          tp, a6, a6
                  slt          t5, ra, s8
                  slti         t4, s11, 208
                  add          s8, t4, t6
                  slli         t5, s8, 13
                  c.addi16sp   sp, 400
                  c.andi       a4, 13
                  c.lui        s5, 4
                  c.slli       a3, 12
                  c.add        a6, a1
                  c.xor        a5, a4
                  csrrs        t1, 0x340, t5
                  sub          t0, t6, s3
                  c.li         a1, 21
                  c.slli       a4, 31
                  mulh         a0, s9, t4
                  csrrc        s10, 0x340, t1
                  c.addi4spn   a3, sp, 368
                  sltiu        t4, s5, 429
                  mulhsu       t5, s6, t5
                  c.mv         a1, a6
                  srl          t2, t6, a6
                  srli         a3, sp, 11
                  srai         t4, tp, 25
                  nop
                  divu         t4, a4, s5
                  c.srai       a0, 7
                  xori         t0, s6, 811
                  csrrw        s1, 0x340, ra
                  csrrsi       t5, 0x340, 0
                  csrrs        ra, 0x340, t4
                  c.srai       s1, 8
                  mulhsu       s5, s3, a3
                  c.nop
                  sra          s3, t0, ra
                  rem          a0, s0, t1
                  lui          gp, 634881
                  nop
                  xor          s3, s7, t2
                  mulhsu       s8, s10, s7
                  nop
                  remu         t2, s2, t2
                  mul          s6, tp, s3
                  c.lui        tp, 2
                  sra          s2, a2, s2
                  sub          t5, s5, a3
                  xor          s7, t2, t2
                  c.xor        s1, s0
                  c.addi16sp   sp, -16
                  csrrs        s7, 0x340, a7
                  xori         a0, t5, 653
                  c.addi       s8, -1
                  divu         zero, a7, s5
                  sll          a3, sp, a3
                  c.nop
                  c.addi16sp   sp, -16
                  csrrwi       a6, 0x340, 29
                  addi         a4, sp, 2011
                  nop
                  csrrsi       s11, 0x340, 0
                  or           s3, t1, t5
                  mulh         a5, s4, ra
                  xor          a6, a5, s9
                  sll          t0, s4, a0
                  c.sub        s1, s1
                  sltiu        s6, s8, 745
                  slti         s3, s5, 1706
                  srli         t1, a1, 15
                  slt          a6, a1, t4
                  csrrw        a5, 0x340, s10
                  c.sub        a1, s0
                  mulhsu       a6, s6, a4
                  c.sub        a1, s0
                  remu         a0, a0, sp
                  csrrs        a1, 0x340, a7
                  sub          a4, s7, a4
                  remu         t1, s3, s6
                  lui          s5, 423649
                  mulhsu       a7, a2, t6
                  srai         ra, s7, 16
                  c.or         a5, a4
                  c.addi16sp   sp, 320
                  sra          sp, t1, s6
                  csrrsi       s1, 0x340, 0
                  mulhu        s11, a1, t0
                  sltu         a6, t3, s1
                  addi         a5, a4, 404
                  xori         t2, gp, 639
                  div          gp, a5, a3
                  sub          s4, gp, t3
                  c.and        a4, s0
                  csrrwi       s7, 0x340, 11
                  csrrwi       a6, 0x340, 22
                  auipc        s9, 776559
                  add          s6, a4, a6
                  sll          a3, tp, a2
                  c.addi16sp   sp, 432
                  csrrsi       t1, 0x340, 0
                  slt          s6, tp, s0
                  c.addi       gp, -1
                  sll          t4, a2, t2
                  c.andi       a4, 14
                  csrrs        a3, 0x340, zero
                  mulhsu       s6, ra, a6
                  andi         sp, s6, 195
                  mul          a3, a5, s0
                  c.or         a4, a1
                  srli         a1, sp, 27
                  c.mv         ra, sp
                  ori          s3, s0, -897
                  auipc        t6, 762577
                  c.slli       sp, 25
                  mulhu        a4, a2, s9
                  slt          s2, s3, t3
                  rem          s8, s11, t5
                  sltiu        s3, s0, 665
                  mulh         s11, t0, a5
                  sub          a5, a0, zero
                  csrrc        a0, 0x340, s10
                  remu         t2, ra, s10
                  c.addi       a3, -1
                  csrrc        t1, 0x340, s8
                  add          t6, s8, s7
                  xor          a3, gp, a0
                  c.sub        a1, a1
                  c.srai       a5, 26
                  remu         t6, s9, zero
                  c.addi16sp   sp, -16
                  and          gp, a5, s7
                  sltu         ra, a0, tp
                  c.lui        a3, 28
                  c.xor        a5, a4
                  c.srai       a4, 30
                  mulhsu       a4, ra, t3
                  c.nop
                  srl          a4, a6, t3
                  csrrs        s5, 0x340, s0
                  c.andi       s1, -1
                  c.lui        s7, 29
                  c.xor        a0, s0
                  mulhu        s5, s0, t5
                  slt          zero, a7, t1
                  csrrsi       s10, 0x340, 23
                  c.li         s10, -1
                  srl          s2, t4, s10
                  c.srai       a4, 22
                  c.li         a7, 14
                  csrrsi       t2, 0x340, 4
                  csrrwi       s1, 0x340, 14
                  remu         a1, a5, ra
                  c.or         a4, a0
                  c.slli       s8, 19
                  sltiu        s8, s1, -1841
                  addi         tp, s9, -663
                  and          a3, s9, t5
                  xori         a1, a7, 1178
                  mulhu        a1, s10, s5
                  add          s4, s4, s10
                  c.addi16sp   sp, -16
                  sltu         t6, sp, s1
                  remu         s3, ra, s1
                  ori          t6, t3, -1435
                  c.xor        a0, a0
                  lui          s4, 114901
                  c.slli       t6, 28
                  slti         s4, a2, -777
                  andi         s6, a6, 778
                  divu         a0, s8, s5
                  nop
                  c.add        s1, s2
                  srli         t1, sp, 11
                  slti         a4, a1, -1155
                  c.add        a7, sp
                  and          s5, t3, s10
                  mulh         s5, s0, sp
                  remu         t2, zero, t5
                  mulh         gp, s2, s11
                  csrrwi       gp, 0x340, 26
                  sub          a0, s1, t3
                  mulh         a5, t6, s5
                  xor          s5, s3, t3
                  addi         t6, a2, -362
                  mul          a0, s1, s1
                  sltu         t0, s10, a0
                  addi         sp, t2, 665
                  auipc        zero, 937892
                  mulhsu       a1, a6, t1
                  lui          s1, 566771
                  c.add        s2, a2
                  addi         s6, s3, 727
                  srl          s4, s2, t6
                  sltu         sp, t0, s1
                  c.addi4spn   a1, sp, 720
                  srl          zero, a7, gp
                  csrrwi       tp, 0x340, 25
                  c.sub        s1, s0
                  or           s11, s2, s6
                  srl          s9, tp, t4
                  srai         s9, a5, 8
                  auipc        s5, 907386
                  c.addi16sp   sp, 352
                  csrrs        s2, 0x340, zero
                  or           s10, zero, s9
                  remu         s4, a5, s6
                  c.addi4spn   a3, sp, 464
                  csrrsi       zero, 0x340, 2
                  c.addi       tp, 2
                  srai         ra, s8, 1
                  c.srli       a5, 21
                  c.and        a1, s0
                  sub          tp, t0, s2
                  c.addi4spn   a3, sp, 224
                  mulhu        a3, a3, a0
                  sltiu        a5, s1, 439
                  sll          s6, s1, a6
                  srli         s4, s5, 12
                  rem          s6, a2, a5
                  c.mv         ra, gp
                  csrrsi       s10, 0x340, 6
                  lui          t4, 25689
                  c.nop
                  c.lui        s5, 17
                  csrrwi       a3, 0x340, 14
                  mulh         s3, s8, s11
                  c.andi       a5, 17
                  csrrw        ra, 0x340, a2
                  srai         a0, s10, 26
                  csrrw        s3, 0x340, s7
                  addi         a1, a2, 86
                  c.and        a5, a1
                  c.or         a4, a0
                  nop
                  lui          a7, 1002388
                  c.slli       t5, 14
                  add          s9, s2, s2
                  srli         t5, t5, 8
                  c.nop
                  mul          t2, a3, s4
                  c.or         a3, s1
                  srli         s5, a3, 12
                  srli         s8, a5, 24
                  csrrwi       s7, 0x340, 28
                  slti         s3, t4, 1881
                  slt          t1, s8, s3
                  div          s2, ra, s6
                  sll          s9, t3, s10
                  srli         ra, s6, 2
                  c.srai       a3, 19
                  c.srai       a5, 14
                  add          t0, t3, s0
                  c.slli       gp, 2
                  c.xor        a1, a2
                  remu         s7, ra, ra
                  lui          gp, 904238
                  sll          s10, gp, t6
                  csrrsi       gp, 0x340, 25
                  xori         s6, a5, -144
                  c.mv         a3, gp
                  divu         a5, t2, s7
                  sra          s10, s1, s10
                  c.slli       s10, 6
                  csrrci       t6, 0x340, 10
                  mulhsu       a6, a4, s9
                  remu         a0, t2, ra
                  c.andi       a1, 8
                  c.andi       s1, 3
                  sra          t1, s1, t3
                  addi         s8, s8, 1302
                  sub          s2, a5, s10
                  auipc        sp, 338807
                  sll          sp, a5, t6
                  c.xor        a5, a4
                  sltiu        s11, a7, -457
                  c.addi16sp   sp, 80
                  c.and        s1, s0
                  andi         a5, a4, 668
                  c.or         a1, a5
                  remu         t5, tp, t4
                  rem          sp, ra, a0
                  c.slli       a4, 26
                  sub          a0, zero, zero
                  c.srai       a1, 4
                  slli         s2, a1, 17
                  mulhsu       s8, a4, a1
                  or           a5, s9, a5
                  nop
                  ori          s9, s2, 31
                  c.addi       s3, -1
                  csrrci       s3, 0x340, 0
                  c.addi16sp   sp, -16
                  remu         t1, s2, s0
                  csrrw        s3, 0x340, t6
                  slti         t0, a2, -585
                  divu         a1, t5, s9
                  mulh         a5, s0, t5
                  c.addi       a7, -1
                  sltu         a7, t4, t2
                  auipc        s2, 516052
                  mulhsu       a6, s9, ra
                  remu         s3, t0, s0
                  c.andi       s1, 23
                  sll          a7, zero, a3
                  mul          t5, t2, t6
                  lui          s7, 948948
                  sra          t0, ra, s6
                  c.srai       a4, 2
                  c.srli       a4, 18
                  ori          t1, t0, 1562
                  remu         a7, a6, s8
                  c.li         s1, 11
                  c.sub        a1, s0
                  ori          s1, t3, -1105
                  csrrs        tp, 0x340, s1
                  c.srai       a0, 10
                  add          gp, t1, t3
                  csrrw        s5, 0x340, t4
                  mulh         t0, a1, s11
                  mulh         t5, s8, s2
                  csrrc        s3, 0x340, tp
                  c.and        a3, s1
                  c.mv         s10, tp
                  ori          tp, s8, -719
                  lui          ra, 378455
                  csrrci       t4, 0x340, 0
                  c.mv         t0, t5
                  addi         sp, t2, 1635
                  sltu         s6, s0, a2
                  addi         a5, a3, -454
                  c.addi4spn   a5, sp, 736
                  csrrw        a5, 0x340, t2
                  mul          t4, tp, a6
                  auipc        s9, 172925
                  sub          a4, t1, s1
                  c.xor        a5, a0
                  csrrw        t5, 0x340, s6
                  c.or         a4, a0
                  csrrs        a0, 0x340, s0
                  srli         s2, s0, 5
                  sub          ra, a0, s10
                  slli         a4, s7, 15
                  c.li         s10, 1
                  rem          t2, s8, gp
                  csrrsi       s2, 0x340, 0
                  mulhsu       s9, ra, s5
                  c.add        a5, a1
                  andi         a0, zero, 1874
                  slli         t0, sp, 6
                  mul          a0, ra, a4
                  xor          a3, s3, s0
                  sltu         s11, s6, a6
                  add          s11, s10, t3
                  c.addi       sp, -1
                  addi         a6, a7, -1381
                  csrrsi       s3, 0x340, 3
                  c.andi       a3, -1
                  c.or         a5, a1
                  mul          s4, a4, t1
                  c.add        a4, sp
                  c.or         a0, s1
                  divu         s2, s6, a0
                  c.and        s1, a1
                  remu         s5, s4, t3
                  c.or         a1, a2
                  rem          t0, s4, a1
                  c.srai       a0, 26
                  csrrc        s11, 0x340, sp
                  mul          s9, t4, s9
                  slt          gp, t5, s1
                  c.srai       a0, 19
                  slli         s5, s7, 3
                  c.and        a1, a4
                  c.addi4spn   a3, sp, 160
                  c.mv         s6, ra
                  auipc        t1, 544467
                  c.srai       a4, 13
                  sub          s7, s2, ra
                  c.or         a5, a0
                  csrrw        s7, 0x340, s9
                  add          ra, s0, a7
                  and          s1, ra, a5
                  slt          tp, s6, t5
                  csrrw        s7, 0x340, t0
                  c.add        a5, t1
                  div          s2, t3, sp
                  c.addi4spn   a0, sp, 624
                  divu         t1, t2, tp
                  csrrw        t6, 0x340, t0
                  mulhsu       s9, s4, a4
                  slli         s5, ra, 20
                  div          s9, s5, gp
                  sra          t2, s8, s3
                  srai         s10, s4, 9
                  mulh         s11, sp, a6
                  and          s9, a2, s7
                  rem          sp, t3, gp
                  andi         s10, s4, 1116
                  c.li         a0, -1
                  c.lui        s5, 19
                  remu         a5, a4, t2
                  slt          a0, s9, t2
                  mulh         s8, a5, a0
                  c.xor        a4, s1
                  csrrwi       t6, 0x340, 20
                  addi         sp, t4, -1967
                  sltu         s8, a1, t5
                  csrrs        s3, 0x340, zero
                  sll          t4, s1, s1
                  csrrw        t1, 0x340, s9
                  c.andi       a0, -1
                  csrrci       s7, 0x340, 16
                  auipc        t6, 95418
                  or           a5, gp, t0
                  slti         s9, s4, 1230
                  c.nop
                  csrrsi       a0, 0x340, 29
                  c.lui        t5, 16
                  c.sub        a3, a3
                  c.addi       t5, -1
                  c.xor        a0, s0
                  divu         tp, t3, s9
                  srl          s6, s10, t6
                  c.mv         t0, a4
                  xori         s3, s8, -1651
                  andi         s3, t1, -27
                  slti         s6, a5, -1452
                  c.mv         tp, a4
                  c.lui        t6, 25
                  csrrci       a7, 0x340, 0
                  srl          s4, sp, t1
                  c.srai       s1, 26
                  c.xor        a3, a1
                  c.and        a1, s0
                  c.addi       t0, -1
                  addi         zero, a5, -829
                  mulh         a5, s11, s7
                  sll          t5, t3, s5
                  c.srli       a0, 8
                  csrrw        ra, 0x340, t3
                  mulhsu       s4, a1, a5
                  csrrc        tp, 0x340, zero
                  sll          t4, a5, t2
                  c.and        a5, a1
                  mulhu        s6, a7, s0
                  srl          t0, zero, a7
                  rem          a1, t5, ra
                  csrrs        t6, 0x340, zero
                  mulhsu       a4, gp, s0
                  c.lui        s10, 19
                  c.addi4spn   a1, sp, 336
                  nop
                  c.slli       gp, 31
                  csrrw        a1, 0x340, s2
                  mul          s6, t1, a0
                  auipc        tp, 736241
                  mulhsu       a4, t4, t2
                  auipc        sp, 882478
                  c.slli       s10, 6
                  divu         gp, s8, t2
                  csrrsi       t4, 0x340, 4
                  c.addi4spn   a5, sp, 704
                  csrrwi       t5, 0x340, 7
                  c.addi4spn   a0, sp, 432
                  c.lui        s3, 16
                  mulhu        tp, s11, t3
                  c.nop
                  csrrci       a1, 0x340, 0
                  c.lui        a0, 1
                  or           a7, gp, s11
                  c.nop
                  csrrci       s8, 0x340, 0
                  c.srai       s1, 28
                  mulhu        sp, s6, a3
                  c.add        a5, sp
                  slt          a5, s6, s8
                  csrrc        zero, 0x340, s2
                  c.or         a1, s0
                  c.xor        a5, a1
                  xori         t1, t3, 157
                  or           s2, ra, t6
                  c.srli       a3, 20
                  c.addi16sp   sp, -16
                  mulhsu       s4, s3, tp
                  divu         ra, a7, t0
                  c.xor        a1, a4
                  c.sub        a1, a5
                  c.sub        a4, s0
                  xor          a6, a7, a0
                  ori          a3, s11, -849
                  c.srli       a1, 3
                  divu         a1, a4, s6
                  csrrs        s7, 0x340, a2
                  c.addi       a6, -1
                  srli         s7, s10, 18
                  mulhu        s6, ra, s9
                  mulh         s3, s9, t4
                  lui          t4, 334810
                  slt          s9, t0, a4
                  csrrs        gp, 0x340, s9
                  sll          s5, s3, s9
                  srli         a5, s3, 10
                  remu         t1, s11, a6
                  addi         a4, s11, -53
                  csrrw        a1, 0x340, tp
                  mulhu        a5, a6, sp
                  divu         t4, s5, a4
                  srl          a5, t0, s10
                  xor          ra, a7, sp
                  xori         s2, s3, 1358
                  slli         s2, tp, 1
                  csrrwi       a6, 0x340, 31
                  c.or         a0, a0
                  sub          a0, t6, tp
                  c.li         t0, 25
                  c.addi       t4, 1
                  c.mv         gp, a2
                  rem          t6, s6, s11
                  mul          t1, a2, s10
                  c.sub        s1, a5
                  div          t6, a3, gp
                  srli         t6, s6, 6
                  or           zero, s9, t0
                  c.addi       s10, 22
                  mulhsu       t2, s10, s0
                  c.andi       a5, 1
                  c.mv         t5, s8
                  c.andi       a1, -1
                  c.addi4spn   a0, sp, 592
                  srl          t6, zero, s2
                  sltiu        t2, t1, -1965
                  mulhsu       s8, s5, s6
                  c.or         s1, a0
                  sltu         s4, zero, s10
                  slli         a3, t0, 3
                  xori         a7, t3, 754
                  auipc        sp, 202655
                  sra          s6, s0, a4
                  mulhu        a1, s10, s5
                  mulhu        t5, s9, t2
                  sra          s10, t5, zero
                  c.nop
                  sll          s1, s11, sp
                  csrrw        a5, 0x340, s3
                  c.li         sp, 6
                  mul          s10, zero, t1
                  c.li         gp, -1
                  mulhsu       s2, a4, s9
                  c.addi       tp, 30
                  or           s8, a7, a6
                  c.nop
                  c.and        a5, a2
                  divu         s2, t5, a4
                  divu         s7, a0, zero
                  c.li         gp, 14
                  c.mv         s9, s1
                  c.mv         s10, t6
                  mulhsu       t2, t2, t1
                  c.or         s1, a2
                  mulhsu       s4, gp, s11
                  or           s10, a4, t0
                  c.srai       a5, 16
                  and          s3, zero, s5
                  slli         s11, s2, 25
                  c.srli       a4, 14
                  nop
                  c.lui        a0, 16
                  csrrwi       a1, 0x340, 5
                  c.srai       a5, 7
                  c.and        s1, a4
                  mulh         sp, s0, s9
                  csrrci       s8, 0x340, 14
                  c.mv         t0, sp
                  srli         t4, s10, 0
                  lui          tp, 127530
                  slt          zero, a3, s11
                  c.sub        a5, a2
                  mul          s10, s8, t2
                  lui          t6, 745424
                  or           s4, t0, t0
                  mulhu        s1, t0, a2
                  c.xor        s1, a4
                  c.addi4spn   a0, sp, 80
                  lui          t4, 897761
                  mul          t1, s4, s11
                  csrrci       s8, 0x340, 0
                  slti         a4, s0, 1345
                  divu         a1, t2, tp
                  slli         t4, t4, 23
                  rem          t4, a4, s10
                  mulhsu       a0, t4, a7
                  lui          s7, 205036
                  csrrc        s5, 0x340, gp
                  sra          t5, ra, s3
                  mulhu        s2, ra, a0
                  sltu         zero, a4, a4
                  addi         a4, a2, 1021
                  or           a0, t0, s1
                  c.or         a0, a0
                  csrrwi       a3, 0x340, 23
                  csrrsi       t4, 0x340, 29
                  xori         ra, s7, -879
                  sltu         sp, sp, s1
                  sub          s9, zero, a7
                  c.li         s4, -1
                  srli         t5, s8, 12
                  sll          tp, s10, a0
                  sra          gp, s1, a2
                  c.and        a5, s0
                  mulhsu       s3, s3, s5
                  csrrsi       s2, 0x340, 29
                  xor          a4, s11, a2
                  sltiu        a7, s3, -1739
                  c.or         a5, s1
                  xor          t5, t3, s10
                  csrrwi       s1, 0x340, 7
                  slli         a5, s7, 2
                  c.or         a3, s1
                  or           zero, s9, a4
                  c.slli       s4, 29
                  c.mv         t1, s0
                  csrrci       s11, 0x340, 18
                  c.nop
                  c.lui        s8, 18
                  sltu         tp, t2, s0
                  divu         t4, a1, s6
                  csrrw        s11, 0x340, t3
                  sub          s7, s2, a1
                  c.addi4spn   a3, sp, 1008
                  csrrs        t0, 0x340, zero
                  sra          s6, s8, zero
                  srl          zero, a4, s5
                  c.addi16sp   sp, 160
                  lui          t6, 709502
                  xori         a5, a5, -620
                  addi         t2, t4, 42
                  c.mv         t5, a2
                  auipc        s4, 440434
                  sra          tp, s6, s10
                  ori          zero, t4, -1317
                  remu         s2, a7, a4
                  lui          a1, 384608
                  c.and        s1, a4
                  nop
                  c.or         a4, a1
                  sltiu        a5, s10, 1625
                  mulhsu       a1, a3, zero
                  c.srli       a4, 25
                  c.addi4spn   a5, sp, 576
                  sub          a0, gp, tp
                  auipc        t4, 165373
                  sltu         s10, a6, s2
                  divu         sp, a6, a6
                  mulhu        s3, sp, s9
                  csrrw        s4, 0x340, s3
                  c.mv         s5, gp
                  mulhu        ra, s6, s3
                  mulhsu       a5, a1, tp
                  mulhsu       t5, a1, a1
                  c.srai       a4, 15
                  remu         a1, t2, t6
                  c.addi16sp   sp, -16
                  c.addi4spn   a1, sp, 880
                  c.addi       ra, 6
                  c.li         a4, -1
                  c.li         s5, 20
                  c.or         a5, s0
                  c.mv         s8, t1
                  c.mv         a3, s6
                  nop
                  nop
                  lui          s4, 545791
                  xor          s8, a7, sp
                  c.and        a5, a5
                  csrrc        tp, 0x340, t6
                  c.addi16sp   sp, -16
                  xor          t4, a2, s2
                  csrrs        t1, 0x340, s3
                  c.mv         t4, t3
                  divu         s5, s11, t2
                  c.srli       s1, 2
                  c.add        a1, t2
                  c.srli       a1, 30
                  xor          a5, tp, a5
                  srai         a1, s0, 13
                  slt          t0, t4, s6
                  mulhu        s8, s8, a0
                  c.andi       s1, 0
                  slti         a1, ra, 1834
                  sltu         s5, a3, s1
                  srai         s5, s3, 11
                  csrrs        t4, 0x340, t3
                  c.addi4spn   a4, sp, 944
                  slt          t4, s9, a2
                  c.nop
                  add          s9, a7, s1
                  c.li         s6, -1
                  ori          s5, s1, -1203
                  add          s10, s1, gp
                  nop
                  lui          s6, 853943
                  rem          t2, s3, t6
                  c.mv         a4, a2
                  c.add        s11, t4
                  mul          s3, s10, t2
                  and          gp, t2, a6
                  c.srai       a1, 8
                  c.srli       a5, 26
                  csrrci       s3, 0x340, 0
                  sra          a7, gp, t4
                  c.srli       a4, 5
                  srai         t2, s11, 23
                  slli         s9, a5, 1
                  or           a0, a1, s7
                  c.slli       s1, 30
                  sll          s8, t5, s4
                  sra          s2, a3, gp
                  csrrw        a3, 0x340, s7
                  sltu         gp, a2, t1
                  andi         s1, s4, 1968
                  slt          a5, t5, s8
                  csrrci       sp, 0x340, 27
                  addi         s10, a1, 2017
                  sltu         s10, t0, s8
                  csrrc        ra, 0x340, a6
                  srli         t1, t5, 10
                  remu         s11, a3, a4
                  and          a1, s0, t6
                  slti         a7, s2, 1770
                  c.xor        a1, a4
                  csrrw        a4, 0x340, a7
                  srl          t2, t6, s10
                  c.xor        a5, a2
                  c.lui        s8, 24
                  c.addi       s2, 8
                  mul          t2, s5, s7
                  mul          a7, a5, s8
                  auipc        s3, 379329
                  xor          a3, s10, a7
                  or           s1, a1, zero
                  c.and        a1, s1
                  add          t1, a5, a5
                  sll          a0, t3, gp
                  c.addi       a4, 24
                  c.or         a5, a4
                  sra          s1, t5, a7
                  csrrw        a7, 0x340, t5
                  c.addi       gp, -1
                  srl          a1, s5, t1
                  c.or         a5, a0
                  and          s9, t4, tp
                  remu         t0, gp, s7
                  mulhsu       t1, tp, t0
                  c.and        a3, a4
                  csrrs        a5, 0x340, a7
                  and          ra, a7, s6
                  div          ra, s8, t0
                  c.add        tp, s3
                  divu         s1, s0, t0
                  c.and        a4, a5
                  c.addi4spn   a3, sp, 448
                  csrrw        s10, 0x340, sp
                  ori          t5, s8, 2015
                  sltu         t6, s2, s2
                  andi         s2, t6, -634
                  c.mv         a1, tp
                  c.slli       s3, 30
                  slti         sp, sp, 1775
                  auipc        s1, 753243
                  sltiu        tp, t2, 520
                  csrrw        sp, 0x340, s8
                  and          t6, s4, a2
                  and          sp, t4, s7
                  divu         s6, a6, s2
                  addi         t1, s11, 1105
                  csrrw        gp, 0x340, t0
                  c.or         a5, s1
                  c.nop
                  c.lui        t6, 14
                  slli         ra, s10, 25
                  sub          a6, s1, sp
                  mulhsu       tp, s3, s10
                  c.add        t2, t2
                  sltu         sp, sp, t4
                  csrrw        a1, 0x340, s2
                  mul          sp, a1, a5
                  csrrci       a3, 0x340, 21
                  c.lui        t0, 13
                  andi         t2, t3, -1582
                  sra          sp, t3, s5
                  nop
                  remu         s8, a3, s10
                  c.or         a3, a3
                  c.or         a5, a5
                  divu         s6, s2, zero
                  c.addi4spn   a0, sp, 560
                  csrrwi       s3, 0x340, 10
                  c.andi       a1, -1
                  csrrw        a0, 0x340, a4
                  sll          t5, tp, t6
                  slti         a3, s6, 1246
                  sub          s7, a5, s2
                  ori          s5, gp, -108
                  andi         t1, s0, 10
                  sltiu        t4, s7, -1797
                  ori          sp, a6, 543
                  c.lui        s3, 7
                  c.mv         ra, a3
                  slti         ra, t6, 1330
                  csrrw        a6, 0x340, a5
                  div          s2, s5, ra
                  slli         s3, s6, 21
                  add          a3, s5, s5
                  c.sub        s1, a3
                  srl          s2, a1, s5
                  or           s9, s10, s11
                  xor          s10, a5, s7
                  c.sub        s1, a5
                  c.andi       a4, -1
                  csrrsi       a4, 0x340, 1
                  xor          s6, s10, a1
                  c.mv         s2, gp
                  csrrci       a7, 0x340, 21
                  lui          tp, 292509
                  auipc        t4, 804774
                  csrrw        a4, 0x340, s9
                  rem          s7, a0, t5
                  nop
                  mul          a1, a5, s2
                  c.mv         s3, a5
                  addi         t0, a0, 1821
                  c.add        a7, s5
                  sltu         sp, t3, a2
                  div          a4, t6, a0
                  c.add        a7, a6
                  mul          t0, a4, t0
                  csrrw        s5, 0x340, s7
                  slti         s4, t3, -1622
                  c.addi16sp   sp, 160
                  c.li         tp, 2
                  c.srai       a4, 23
                  slti         ra, s10, -1924
                  csrrs        t2, 0x340, zero
                  sub          t5, s0, a0
                  divu         s5, s8, a1
                  addi         t6, t6, 629
                  xori         t0, s0, 1205
                  csrrwi       zero, 0x340, 9
                  c.and        a0, a1
                  c.add        t6, s6
                  auipc        s10, 28982
                  c.srli       a4, 4
                  slt          s2, sp, sp
                  mulhu        s4, t4, s5
                  srl          a0, s5, t3
                  andi         s1, ra, -414
                  and          t6, a6, s10
                  sltiu        gp, s5, -979
                  c.add        a1, s10
                  auipc        a3, 293556
                  or           s2, a5, s11
                  c.addi4spn   a4, sp, 592
                  sltu         s3, s2, a7
                  ori          s1, t2, -1224
                  rem          s8, s7, s2
                  sltu         sp, tp, a4
                  rem          tp, t1, t1
                  c.sub        s1, a1
                  csrrw        s10, 0x340, s5
                  csrrc        a7, 0x340, t3
                  c.lui        gp, 24
                  c.addi16sp   sp, 368
                  csrrwi       a7, 0x340, 10
                  rem          t0, t5, tp
                  csrrs        zero, 0x340, zero
                  nop
                  xori         t5, t0, -1668
                  divu         a4, a2, a7
                  auipc        s6, 40554
                  mulhu        s5, t4, s4
                  mulhsu       zero, s9, a4
                  mulhsu       s2, s3, s9
                  c.srli       a1, 24
                  sltiu        s1, s6, 1838
                  c.sub        a3, a5
                  csrrw        sp, 0x340, s1
                  mulhu        a0, gp, a6
                  c.nop
                  lui          t0, 808015
                  csrrc        a0, 0x340, a0
                  csrrwi       s10, 0x340, 30
                  c.nop
                  c.or         a5, a1
                  csrrwi       sp, 0x340, 3
                  csrrs        sp, 0x340, t5
                  c.slli       sp, 4
                  c.mv         s10, s9
                  c.sub        a3, s0
                  xori         s2, a4, -642
                  slli         s8, a5, 26
                  rem          a3, a1, s0
                  slt          s11, t1, s7
                  c.nop
                  c.srli       a3, 6
                  mulhu        t4, s7, s3
                  c.addi4spn   a4, sp, 16
                  sll          a4, t3, t5
                  c.or         a3, a2
                  c.addi4spn   a3, sp, 144
                  div          ra, t5, a6
                  csrrc        gp, 0x340, sp
                  csrrci       a3, 0x340, 13
                  add          t0, s2, t4
                  srai         sp, s0, 28
                  csrrci       t6, 0x340, 0
                  divu         t6, t4, s7
                  and          s1, t2, s9
                  c.mv         t6, s8
                  mulh         s11, a3, t0
                  nop
                  div          t0, s7, s0
                  srai         t0, s10, 26
                  auipc        s4, 41
                  add          sp, s5, s7
                  or           tp, s1, s1
                  slt          t5, s6, a7
                  sll          t4, t3, gp
                  sra          t2, t2, s3
                  rem          tp, s3, s5
                  srli         t4, s2, 1
                  srl          a3, s5, t2
                  csrrc        a5, 0x340, zero
                  srl          zero, a0, gp
                  srai         a3, a6, 18
                  csrrw        s3, 0x340, a3
                  c.and        a1, a5
                  sub          t4, s0, s3
                  c.lui        t0, 24
                  or           t6, a2, ra
                  nop
                  csrrsi       t4, 0x340, 0
                  c.and        a5, a5
                  csrrc        tp, 0x340, s3
                  srli         s11, s7, 18
                  add          t2, s2, s2
                  c.srli       a5, 28
                  mulhsu       a1, zero, a2
                  c.or         a0, a4
                  xor          t4, sp, t0
                  xor          a6, sp, s6
                  or           a7, a4, s7
                  and          t4, a7, s10
                  c.andi       s1, -1
                  divu         s11, a6, s11
                  c.li         s7, 30
                  csrrs        gp, 0x340, zero
                  c.and        a5, a3
                  c.srli       a0, 16
                  csrrci       s6, 0x340, 0
                  xori         s10, a3, -1589
                  srli         gp, t6, 22
                  csrrwi       a3, 0x340, 18
                  csrrs        a4, 0x340, zero
                  csrrci       s9, 0x340, 21
                  c.addi4spn   a3, sp, 848
                  auipc        a0, 91592
                  csrrc        a7, 0x340, zero
                  c.and        s1, a0
                  sra          a6, s1, sp
                  slt          a7, sp, t4
                  sltiu        t6, zero, -376
                  slti         t5, t4, 46
                  csrrsi       zero, 0x340, 8
                  xor          s9, s3, s11
                  csrrsi       a7, 0x340, 8
                  c.srai       a3, 7
                  sltiu        s1, s7, 315
                  c.li         a7, 15
                  remu         a4, s0, s11
                  slt          a1, a2, t5
                  sltu         s5, t1, t1
                  xori         s8, s0, -1828
                  c.sub        a5, a2
                  ori          a1, tp, 1866
                  c.add        a0, t3
                  srai         gp, a3, 19
                  srli         a3, a0, 6
                  sra          s1, sp, t6
                  auipc        a0, 103465
                  sltiu        sp, a5, -2010
                  div          a3, t3, a4
                  add          s7, gp, s8
                  c.add        a0, s9
                  c.addi4spn   a5, sp, 608
                  mulhsu       t6, t2, t0
                  div          s1, s8, s5
                  add          t6, t6, t2
                  c.srli       s1, 7
                  and          t0, a1, s7
                  c.or         a1, a2
                  csrrs        t5, 0x340, t1
                  ori          tp, t4, -548
                  slt          s9, a0, s2
                  div          a4, t0, gp
                  csrrw        s6, 0x340, a7
                  mulh         s1, t6, a1
                  div          s10, ra, s5
                  slli         a6, a6, 11
                  csrrs        t6, 0x340, a2
                  lui          t1, 190806
                  csrrc        s3, 0x340, s1
                  auipc        s5, 442881
                  remu         t6, s1, s1
                  srl          s2, s3, s7
                  csrrwi       tp, 0x340, 22
                  slti         sp, s9, 87
                  c.addi       s11, -1
                  ori          a4, t6, 1589
                  andi         t5, a3, -1117
                  sll          ra, gp, a0
                  sub          zero, s9, a2
                  slli         s11, s2, 6
                  c.srai       a3, 4
                  c.srli       a1, 8
                  slli         s5, t5, 7
                  sub          a4, s10, s6
                  c.or         a0, a4
                  addi         s11, t3, -1220
                  c.slli       t0, 22
                  addi         a7, t3, -583
                  mul          gp, s7, a1
                  auipc        s11, 601428
                  c.addi4spn   a5, sp, 672
                  c.andi       a4, -1
                  csrrwi       t1, 0x340, 14
                  c.li         a7, 9
                  slli         t2, a2, 12
                  c.add        t4, a0
                  mul          s8, a7, a0
                  auipc        a4, 268580
                  andi         s10, s5, 1495
                  c.slli       tp, 1
                  auipc        t1, 502189
                  c.and        a0, a0
                  nop
                  div          tp, t3, sp
                  sra          a4, t5, gp
                  rem          s6, a6, sp
                  c.srli       a4, 11
                  c.xor        a1, a1
                  andi         s8, a6, -1896
                  lui          gp, 412354
                  c.addi       s6, 6
                  sltiu        s4, a5, 2041
                  slt          s9, tp, t5
                  mul          t0, s2, s6
                  srli         s6, a3, 17
                  ori          a5, a0, -831
                  or           s9, t2, s3
                  c.mv         s7, a0
                  sltiu        t5, t3, -422
                  c.addi16sp   sp, 80
                  srli         a1, a7, 12
                  csrrw        t6, 0x340, s8
                  c.sub        a4, a3
                  sltu         s5, gp, gp
                  c.add        gp, sp
                  c.addi16sp   sp, 464
                  c.srli       s1, 18
                  sltu         s3, a0, gp
                  and          s5, a1, a1
                  c.addi4spn   a3, sp, 944
                  add          s3, sp, s3
                  c.addi       t2, 3
                  c.lui        s11, 21
                  sltiu        s2, s0, -1301
                  and          s11, zero, ra
                  c.sub        a5, a3
                  lui          ra, 838073
                  mulh         a7, tp, s2
                  csrrs        s10, 0x340, zero
                  c.add        s1, s8
                  srli         t4, tp, 13
                  c.add        ra, a5
                  slti         t5, s9, 87
                  lui          s11, 914762
                  mulhu        a6, tp, gp
                  slt          s4, s3, a3
                  c.addi4spn   a3, sp, 528
                  slt          a1, s9, s11
                  or           s6, a5, a3
                  c.addi4spn   a5, sp, 848
                  c.addi16sp   sp, 368
                  srl          s2, t3, a1
                  c.srli       a1, 4
                  srai         a6, t4, 31
                  c.and        s1, a4
                  srai         t1, s5, 27
                  csrrw        t2, 0x340, s2
                  remu         s8, s9, s8
                  c.slli       sp, 23
                  srai         zero, a6, 2
                  c.slli       s2, 13
                  c.and        a3, a2
                  slti         a0, s11, 1867
                  sub          a5, t2, t0
                  c.lui        t1, 13
                  andi         t1, a2, -1443
                  andi         t6, a5, -203
                  slt          a5, t5, t6
                  c.addi4spn   a3, sp, 128
                  mulh         a0, a2, s0
                  srl          t1, t0, zero
                  addi         s11, s10, 694
                  c.srli       a3, 30
                  mulhu        a5, t0, t6
                  csrrwi       zero, 0x340, 12
                  andi         t4, t4, -148
                  add          s4, t3, s5
                  c.mv         t4, s11
                  xor          t5, s9, a0
                  c.andi       a3, -1
                  c.lui        t4, 23
                  xor          s7, t5, tp
                  nop
                  xori         zero, t5, 849
                  csrrwi       t6, 0x340, 1
                  csrrw        t4, 0x340, gp
                  csrrs        s10, 0x340, zero
                  csrrci       a4, 0x340, 0
                  srai         s8, zero, 15
                  c.and        a5, s1
                  lui          ra, 794557
                  ori          t4, a5, -1288
                  mulh         t1, a2, s4
                  auipc        s3, 286063
                  and          s7, s6, t6
                  c.srli       a3, 24
                  mulh         a0, s9, s2
                  mul          s10, s6, s0
                  csrrsi       tp, 0x340, 4
                  c.add        a4, gp
                  andi         s10, t6, -1472
                  sll          zero, tp, a1
                  c.srai       a0, 24
                  remu         t0, a2, s6
                  c.or         a3, a1
                  c.addi4spn   s1, sp, 288
                  sll          t5, a2, s2
                  srai         t6, tp, 7
                  c.addi       s1, 14
                  c.slli       t6, 13
                  c.sub        s1, a2
                  sub          t0, a0, t3
                  rem          a1, s2, s1
                  srl          sp, s2, a7
                  sra          s2, t2, tp
                  srai         ra, s10, 11
                  c.nop
                  xori         s7, s3, 1008
                  mulh         t2, s11, zero
                  sltu         a6, tp, t2
                  csrrsi       s5, 0x340, 4
                  mulhu        a5, a4, s11
                  c.addi16sp   sp, 224
                  c.srli       a3, 13
                  remu         t5, tp, t5
                  c.srai       s1, 20
                  and          a6, ra, s5
                  slt          a5, zero, s8
                  c.addi16sp   sp, -16
                  mulhu        s8, s8, s4
                  csrrw        t0, 0x340, a5
                  remu         s7, s11, a3
                  div          s11, t2, zero
                  c.srli       a3, 23
                  c.xor        a1, a0
                  mulh         s6, a6, s3
                  srai         s7, zero, 10
                  slti         t2, a6, 1563
                  c.andi       a5, -1
                  c.nop
                  sltu         a0, s0, zero
                  rem          s10, a4, s8
                  and          s3, sp, t2
                  rem          t2, s4, zero
                  c.or         s1, a0
                  c.or         s1, a5
                  c.srli       a4, 31
                  sltu         a6, s10, t4
                  c.addi       t6, 6
                  c.lui        a7, 9
                  rem          sp, t1, t4
                  sll          a4, tp, s3
                  csrrc        a5, 0x340, zero
                  lui          a4, 627054
                  c.addi16sp   sp, -16
                  c.addi       t4, -1
                  c.sub        a1, a5
                  nop
                  c.lui        t6, 1
                  srai         a5, ra, 23
                  sll          zero, a2, s6
                  csrrc        sp, 0x340, zero
                  csrrc        sp, 0x340, zero
                  mulhu        a4, s5, a3
                  slti         s10, zero, -2043
                  sll          a1, a0, s10
                  addi         a4, a3, 357
                  c.and        s1, a2
                  rem          zero, s6, sp
                  c.mv         s2, t1
                  divu         t1, t6, t1
                  divu         s5, t0, s9
                  and          s8, t6, tp
                  csrrw        a7, 0x340, tp
                  xori         s4, t3, -1265
                  c.srli       a4, 2
                  or           s6, t1, s6
                  add          a6, s7, s7
                  or           t0, gp, t2
                  c.srai       a1, 1
                  c.srai       s1, 6
                  c.sub        s1, a0
                  sra          s7, t3, t6
                  mulhsu       s7, t0, s7
                  c.nop
                  sltiu        s3, a7, -3
                  remu         t0, ra, a3
                  c.add        s11, s7
                  csrrw        s6, 0x340, ra
                  slt          t0, a4, s3
                  c.addi       gp, 14
                  c.li         s3, 4
                  sll          a4, gp, t1
                  sub          a0, a6, s1
                  div          s3, a2, t2
                  c.nop
                  remu         a0, t1, tp
                  add          s9, s5, a6
                  sltiu        s9, s4, 922
                  csrrwi       sp, 0x340, 2
                  c.addi16sp   sp, 144
                  c.nop
                  csrrwi       s1, 0x340, 22
                  c.lui        s7, 6
                  rem          t1, t2, s9
                  c.or         a1, a5
                  ori          a1, s5, 262
                  mulh         a5, tp, s5
                  c.xor        s1, a5
                  and          t5, t1, a2
                  c.add        ra, s9
                  div          t6, s6, tp
                  addi         a0, sp, -1092
                  andi         gp, a6, -1832
                  div          a4, t5, s9
                  c.add        s8, tp
                  c.srai       a3, 22
                  andi         t5, a7, 356
                  sub          s6, s1, ra
                  c.addi       ra, -1
                  mul          s11, s5, a0
                  c.li         s4, 14
                  xor          s4, t1, s1
                  c.addi       t5, 24
                  c.li         a0, -1
                  c.addi16sp   sp, 304
                  csrrsi       a4, 0x340, 4
                  andi         a6, sp, 1659
                  csrrs        t5, 0x340, t6
                  auipc        a4, 600411
                  rem          ra, s3, a6
                  c.lui        s8, 4
                  mul          s4, tp, tp
                  csrrc        t2, 0x340, zero
                  auipc        t6, 349911
                  xor          tp, s0, a6
                  c.or         a4, s1
                  divu         s4, a3, s3
                  add          s9, ra, t3
                  sll          s10, s6, s6
                  csrrci       t1, 0x340, 0
                  csrrc        zero, 0x340, zero
                  c.or         a5, s0
                  sra          ra, s6, sp
                  slli         tp, a3, 19
                  csrrs        gp, 0x340, a6
                  mulhu        s9, a1, t4
                  c.xor        a4, a3
                  csrrc        a6, 0x340, s7
                  c.srai       a0, 26
                  csrrsi       a1, 0x340, 15
                  divu         s9, a2, t2
                  c.mv         s6, s11
                  c.sub        a3, s0
                  c.li         a0, -1
                  slti         zero, t3, -1911
                  remu         t6, ra, t5
                  sll          a6, sp, s1
                  csrrw        t6, 0x340, s0
                  c.mv         s7, s8
                  and          a3, s7, a4
                  sra          t0, a5, ra
                  csrrw        s11, 0x340, s0
                  c.add        s7, sp
                  sra          a5, s10, s7
                  c.addi16sp   sp, -16
                  csrrci       s10, 0x340, 2
                  nop
                  c.or         a3, a1
                  srl          zero, tp, zero
                  remu         sp, s7, t2
                  csrrw        sp, 0x340, s6
                  c.addi       sp, -1
                  xor          a0, a7, t5
                  c.lui        gp, 6
                  srli         s8, t0, 30
                  csrrci       s6, 0x340, 15
                  c.srli       a5, 9
                  c.mv         a5, sp
                  lui          a1, 111783
                  ori          s4, a4, -810
                  slli         s6, s11, 30
                  div          t4, a5, s5
                  c.andi       a4, -1
                  c.xor        a3, s1
                  divu         t6, s3, t2
                  c.addi16sp   sp, -16
                  mul          s1, s8, s0
                  andi         gp, t1, 632
                  c.slli       a0, 9
                  srli         t4, t5, 18
                  addi         s1, s0, 446
                  csrrs        zero, 0x340, zero
                  or           gp, s6, s6
                  rem          s3, s3, t0
                  c.or         a0, a0
                  csrrsi       s11, 0x340, 5
                  sra          a7, a1, a0
                  xor          t0, a2, t5
                  srli         s1, a7, 8
                  c.andi       a0, 23
                  c.srli       a4, 10
                  rem          t1, ra, s11
                  csrrsi       a7, 0x340, 0
                  xori         zero, t6, 1348
                  remu         s6, a7, a1
                  srli         t6, s2, 28
                  c.li         s6, 12
                  srli         t5, ra, 20
                  srli         s2, s4, 8
                  csrrc        gp, 0x340, s5
                  xor          s3, s6, sp
                  divu         a6, s4, a3
                  xori         t2, s9, 80
                  csrrw        a5, 0x340, a6
                  c.srli       a1, 11
                  addi         s11, a0, 300
                  slli         s7, a5, 22
                  auipc        s7, 811467
                  add          t2, s6, t1
                  mulhu        s9, t1, a7
                  addi         a4, t5, -1478
                  rem          a0, s2, a2
                  mulhsu       a3, a6, s0
                  srl          s10, s7, t4
                  remu         s8, s6, s0
                  csrrc        s8, 0x340, zero
                  csrrw        ra, 0x340, t4
                  sll          a6, t4, a1
                  csrrs        s7, 0x340, zero
                  c.add        s10, a1
                  c.or         a3, a4
                  c.nop
                  csrrwi       a7, 0x340, 0
                  mulh         s9, zero, s3
                  slli         s2, s5, 31
                  srl          a4, s6, t2
                  c.mv         ra, a1
                  slli         a5, s7, 17
                  sltu         t5, zero, t2
                  slt          s10, t1, a1
                  divu         s7, a7, s6
                  auipc        s1, 475431
                  sub          a6, s11, s1
                  slli         s6, ra, 26
                  c.nop
                  addi         a0, s8, -105
                  c.srli       a1, 23
                  andi         t6, s8, -750
                  mulh         a3, a3, a2
                  srai         t5, a0, 10
                  csrrc        t0, 0x340, zero
                  xori         a1, a2, -1584
                  srli         t2, s7, 27
                  xor          s8, s1, s5
                  mulhsu       t1, s0, t0
                  c.or         a4, a0
                  c.andi       s1, -1
                  mulhu        s6, t0, s2
                  remu         sp, t5, t0
                  xor          zero, s3, a7
                  slt          gp, t5, t3
                  sll          t1, s9, s10
                  divu         t2, a7, a0
                  c.add        tp, s0
                  srai         a1, t4, 4
                  mulhsu       tp, t3, a2
                  c.addi16sp   sp, -16
                  c.li         a1, 12
                  remu         s3, s5, t6
                  c.nop
                  lui          a5, 208007
                  csrrsi       a5, 0x340, 0
                  remu         t0, t6, t6
                  csrrwi       gp, 0x340, 19
                  srai         t2, s5, 6
                  div          a5, s8, s3
                  andi         t1, a2, 23
                  csrrwi       zero, 0x340, 8
                  srli         a5, a4, 24
                  rem          t1, a3, s0
                  xori         a5, s3, 756
                  c.sub        a3, s1
                  c.addi16sp   sp, 240
                  c.lui        a1, 4
                  mulhu        a3, s7, a6
                  c.sub        a3, a4
                  c.srli       a3, 17
                  andi         s3, t0, 2010
                  add          s8, t2, s0
                  andi         a3, a1, -1131
                  andi         s3, ra, -855
                  csrrs        s9, 0x340, s8
                  sra          a6, a4, s9
                  ori          a6, t1, 1041
                  slt          s6, a5, t4
                  xor          s8, t3, s2
                  srai         ra, s1, 23
                  c.slli       t0, 9
                  addi         t6, a5, 1905
                  mulhu        gp, zero, s5
                  c.lui        tp, 11
                  c.nop
                  c.srli       a5, 30
                  c.or         a0, a2
                  mulhu        tp, s4, s0
                  csrrs        t6, 0x340, zero
                  c.or         a1, a5
                  srai         s3, s1, 31
                  div          ra, sp, s10
                  c.or         a1, a4
                  c.mv         s3, t2
                  xori         t1, t4, -34
                  mulh         s5, s2, s3
                  c.lui        s5, 26
                  sll          a1, s7, t5
                  sll          ra, s11, s2
                  csrrc        s1, 0x340, zero
                  c.addi16sp   sp, 272
                  c.xor        a1, a1
                  andi         s10, t4, 1462
                  c.addi       a4, -1
                  andi         t2, t4, -1837
                  lui          t5, 380532
                  xor          t2, a4, a0
                  c.slli       ra, 17
                  srli         s6, t6, 9
                  c.or         a1, s1
                  ori          s9, a1, -1350
                  sra          s1, sp, zero
                  srai         s5, t2, 7
                  nop
                  csrrwi       t6, 0x340, 30
                  add          a7, a5, s3
                  sltu         a1, t4, s6
                  nop
                  slt          a7, sp, s3
                  xori         a1, t4, 1253
                  auipc        t4, 531645
                  mulhsu       s1, t2, s4
                  c.add        s2, s2
                  c.or         a1, s0
                  c.addi       a3, 10
                  c.or         s1, a0
                  csrrw        a1, 0x340, s7
                  c.slli       t1, 28
                  sub          a3, sp, a5
                  div          t5, a2, s8
                  slli         s10, s8, 20
                  lui          s4, 148848
                  mulh         s5, tp, a7
                  c.mv         t6, a3
                  auipc        t5, 208102
                  sltu         a5, s4, s9
                  slti         s8, a1, -1893
                  mulhu        t4, gp, t3
                  remu         s4, gp, tp
                  mulh         a6, s1, t1
                  csrrw        s5, 0x340, a2
                  csrrc        a5, 0x340, a3
                  mul          t1, s1, s7
                  c.addi       s6, -1
                  sub          s7, sp, gp
                  c.mv         t6, s5
                  sra          s10, zero, s2
                  c.xor        a1, a0
                  add          t2, t2, s9
                  c.srai       a1, 9
                  c.sub        a3, a4
                  lui          a4, 663010
                  c.sub        a0, a4
                  csrrci       a1, 0x340, 9
                  srai         t1, t4, 18
                  c.srai       s1, 6
                  and          a3, a3, a5
                  srli         a7, t4, 12
                  csrrs        s5, 0x340, zero
                  c.and        a0, a0
                  div          gp, s11, t5
                  c.add        a4, t5
                  ori          s11, t2, -414
                  c.addi       s2, 28
                  c.mv         t5, a6
                  slti         a1, s0, 1000
                  c.addi4spn   a5, sp, 272
                  c.li         s10, -1
                  c.xor        s1, a5
                  csrrci       s4, 0x340, 0
                  lui          t6, 858163
                  nop
                  sra          gp, a4, s10
                  and          a6, s8, a5
                  mul          s2, s9, s2
                  sltiu        a5, t5, -274
                  c.or         a1, s1
                  divu         t2, s3, t6
                  and          s6, zero, s11
                  mulhu        zero, a6, sp
                  xori         a1, a4, -1890
                  add          s3, tp, t5
                  div          a1, s9, t3
                  divu         s11, s0, s2
                  remu         ra, t6, a0
                  mulhsu       s4, s6, t2
                  slt          sp, a0, tp
                  csrrw        a3, 0x340, s10
                  csrrw        gp, 0x340, t2
                  c.add        s11, s8
                  c.nop
                  sltiu        t4, s2, -353
                  csrrci       a4, 0x340, 0
                  remu         a7, t5, s5
                  c.add        a3, s8
                  auipc        gp, 1021580
                  c.mv         s3, ra
                  c.add        a0, t3
                  csrrs        t6, 0x340, s7
                  sltiu        s9, gp, 107
                  remu         t4, s6, s2
                  add          t4, s0, s7
                  c.addi       a6, -1
                  csrrc        a1, 0x340, zero
                  csrrwi       s10, 0x340, 19
                  c.xor        a4, a4
                  add          s7, s5, s5
                  c.slli       ra, 8
                  and          s1, t5, a7
                  srai         a4, t4, 16
                  or           a5, t1, a0
                  c.srli       a5, 9
                  srai         a3, a3, 6
                  lui          s4, 210351
                  add          s5, a1, a6
                  mul          s8, s9, t1
                  c.add        a7, a5
                  mulhsu       s6, a1, a4
                  xori         s7, s3, -643
                  and          t4, t1, s9
                  ori          s3, t6, -1992
                  c.addi       t2, -1
                  or           t4, a0, ra
                  c.li         a1, -1
                  andi         s5, s10, -1240
                  c.li         s8, -1
                  c.mv         t0, t0
                  c.addi4spn   s1, sp, 960
                  sltu         t0, s8, a4
                  c.lui        s5, 20
                  slt          a0, s0, s8
                  csrrsi       s5, 0x340, 0
                  slli         a7, a3, 26
                  mulh         t4, s7, a0
                  c.sub        a4, s0
                  c.nop
                  csrrwi       s3, 0x340, 26
                  c.and        a1, s1
                  c.addi       s9, 17
                  c.srai       a3, 19
                  lui          t6, 310615
                  csrrwi       a6, 0x340, 18
                  slt          zero, t4, sp
                  sltiu        gp, t3, 1010
                  c.and        s1, s0
                  c.mv         s4, s5
                  sll          t2, s11, s4
                  mul          a3, sp, t6
                  csrrc        s11, 0x340, a7
                  csrrci       s5, 0x340, 1
                  andi         a1, zero, -290
                  slli         s10, gp, 25
                  xori         s11, s11, -555
                  c.li         tp, 15
                  c.srli       a5, 6
                  c.addi       a4, -1
                  or           a7, s4, s1
                  div          a4, s7, ra
                  slt          a3, a1, t2
                  c.li         a1, 14
                  or           s10, t5, a5
                  c.xor        a1, s1
                  slli         t6, gp, 9
                  c.srli       s1, 13
                  c.nop
                  c.and        a4, s1
                  sltu         gp, s0, zero
                  nop
                  addi         a4, s8, 833
                  csrrw        t2, 0x340, t6
                  xori         s9, s5, 139
                  c.and        s1, s0
                  c.addi       s1, 27
                  c.slli       s4, 14
                  remu         zero, s2, s7
                  c.addi16sp   sp, 160
                  ori          t6, t5, -1777
                  csrrsi       a5, 0x340, 11
                  c.add        s9, s6
                  sltiu        t5, a5, -2020
                  csrrsi       a6, 0x340, 0
                  c.srai       a4, 5
                  mulhsu       s8, a3, ra
                  csrrci       zero, 0x340, 0
                  sub          a3, sp, s10
                  xor          sp, s3, s6
                  or           t1, s11, a5
                  c.srai       a4, 26
                  c.lui        a3, 28
                  c.slli       a5, 2
                  c.srai       a5, 18
                  srai         t0, tp, 13
                  c.srli       a3, 2
                  csrrwi       zero, 0x340, 17
                  srl          t2, s2, a2
                  addi         s11, gp, 57
                  c.addi4spn   a1, sp, 960
                  c.and        s1, a0
                  sltu         t0, t0, ra
                  csrrwi       a4, 0x340, 1
                  and          s5, a6, a5
                  lui          a6, 1033010
                  c.addi4spn   a4, sp, 816
                  sltiu        t1, a5, 1874
                  ori          s8, ra, 2020
                  nop
                  c.lui        s9, 4
                  and          tp, t4, s6
                  ori          t1, s2, -1179
                  srli         zero, a5, 6
                  c.xor        a0, a1
                  csrrw        s6, 0x340, sp
                  xori         a7, s11, -598
                  slt          s5, t5, s1
                  c.lui        t0, 24
                  mul          a5, a3, ra
                  c.srli       a5, 14
                  slli         s5, a2, 18
                  andi         s5, a6, -421
                  remu         ra, sp, s5
                  divu         s4, t0, s2
                  csrrci       a5, 0x340, 13
                  srli         gp, a0, 24
                  c.addi       s5, 26
                  rem          t6, ra, t1
                  mul          s5, s6, t5
                  sra          t0, s6, s0
                  c.srai       a0, 6
                  c.slli       s9, 13
                  c.addi16sp   sp, 384
                  nop
                  and          s6, s6, ra
                  mulhsu       t2, s1, s9
                  slli         s6, s0, 14
                  c.and        a1, a1
                  c.li         s6, 21
                  csrrw        s1, 0x340, t3
                  c.li         a6, 16
                  divu         a1, s2, s8
                  c.srai       a3, 3
                  slli         s3, ra, 0
                  c.addi4spn   s1, sp, 192
                  lui          s11, 421846
                  c.mv         t5, t3
                  c.srai       s1, 11
                  c.li         t0, -1
                  srl          a5, tp, a6
                  xori         zero, a5, -321
                  sra          s9, a3, s0
                  auipc        s6, 809183
                  mulh         a5, s8, a4
                  xori         t0, a7, 745
                  c.srai       s1, 18
                  sra          a1, s11, a4
                  csrrsi       t0, 0x340, 0
                  xori         s3, s8, 109
                  mul          sp, t4, s5
                  rem          s9, s2, s8
                  srli         s11, tp, 15
                  csrrci       a1, 0x340, 13
                  div          s11, a1, ra
                  slti         s1, ra, 1688
                  xori         t1, a7, 1078
                  auipc        a3, 206394
                  c.srli       a3, 31
                  nop
                  sll          s4, s5, s5
                  c.srli       a4, 3
                  slti         s10, s9, 41
                  srli         s8, t6, 26
                  c.addi       a1, -1
                  slt          gp, t4, t5
                  divu         s6, t3, t5
                  sltiu        a0, tp, 1915
                  c.andi       a0, 31
                  sub          a7, gp, a2
                  slt          t6, sp, s2
                  andi         s8, zero, 300
                  c.addi       gp, -1
                  mulhsu       zero, s1, s4
                  or           gp, a4, s3
                  sub          s3, s10, a5
                  csrrwi       a1, 0x340, 31
                  nop
                  csrrs        s8, 0x340, a3
                  addi         s11, a2, 849
                  slti         t2, s8, 2002
                  c.srli       a4, 11
                  c.li         a1, 14
                  sltu         s1, a4, a2
                  sub          s8, t6, s8
                  mulhu        t0, s1, t4
                  sub          a0, ra, a0
                  slli         s2, s6, 22
                  slt          a5, a5, a6
                  slti         s1, t0, 1935
                  srl          s10, tp, a4
                  c.addi4spn   a4, sp, 1008
                  c.andi       a5, -1
                  sll          a6, a1, s3
                  sll          s5, t5, s9
                  mulh         t4, t3, t0
                  srai         a7, s10, 13
                  slt          gp, ra, a6
                  c.xor        a4, a1
                  c.sub        s1, s1
                  add          s5, ra, s1
                  sra          a1, s1, s8
                  slli         s10, s2, 25
                  and          gp, gp, a1
                  sltiu        a1, t1, -675
                  c.or         a5, a5
                  csrrci       a7, 0x340, 8
                  srl          s6, a5, a7
                  div          t1, a1, a4
                  xor          s6, s9, s0
                  csrrw        s7, 0x340, s3
                  mul          s2, ra, gp
                  remu         s7, s0, tp
                  c.li         s9, 26
                  c.srli       a3, 3
                  srai         ra, a5, 28
                  c.or         s1, a1
                  c.li         s4, -1
                  remu         a4, s10, s0
                  c.xor        a3, a3
                  csrrwi       ra, 0x340, 10
                  csrrc        t1, 0x340, s0
                  remu         sp, s4, a6
                  c.andi       s1, -1
                  mulhu        a5, s9, ra
                  csrrs        s2, 0x340, zero
                  srai         t4, a2, 8
                  nop
                  mulhsu       s6, s5, a0
                  sra          t5, s8, a1
                  csrrw        a1, 0x340, s1
                  rem          t2, s5, a4
                  csrrw        s11, 0x340, t3
                  csrrsi       s4, 0x340, 4
                  c.andi       a3, 25
                  sltu         s6, t5, t5
                  srli         t0, a7, 27
                  xor          a4, a7, ra
                  mulhu        t0, a0, t3
                  lui          a6, 76847
                  c.sub        a3, s1
                  c.mv         s2, t6
                  andi         t0, a4, -248
                  mulh         a1, s3, s3
                  csrrs        s4, 0x340, zero
                  slt          a7, a4, s6
                  c.addi16sp   sp, 144
                  csrrsi       ra, 0x340, 7
                  andi         a1, gp, 2000
                  c.srli       a1, 22
                  mulhu        a1, s3, a2
                  slt          gp, s9, t2
                  c.andi       a1, 5
                  sub          sp, a3, s6
                  addi         sp, a1, -924
                  c.or         a4, a5
                  csrrci       a6, 0x340, 0
                  and          t5, a1, s6
                  auipc        s1, 428259
                  xori         a6, s4, -1698
                  c.srai       a0, 3
                  xori         s5, t0, 1972
                  csrrwi       s3, 0x340, 3
                  xori         tp, s1, 427
                  csrrwi       a7, 0x340, 27
                  xori         a1, s8, -1723
                  csrrsi       tp, 0x340, 0
                  c.slli       s9, 6
                  rem          t1, zero, a1
                  slt          ra, t0, s0
                  andi         s4, s2, -1582
                  and          sp, gp, t3
                  c.srai       a3, 9
                  csrrci       t2, 0x340, 0
                  c.xor        a5, a2
                  slli         t0, zero, 9
                  c.sub        a4, a5
                  csrrci       gp, 0x340, 0
                  lui          s10, 398025
                  c.addi4spn   a0, sp, 592
                  ori          s5, s2, 1528
                  sltiu        a4, s7, 1467
                  c.srai       a3, 8
                  lui          t2, 984740
                  c.and        a1, a5
                  c.addi4spn   a0, sp, 752
                  csrrci       s2, 0x340, 17
                  c.addi16sp   sp, -16
                  sltu         s5, a2, s3
                  or           s9, t4, t1
                  mulhsu       zero, s5, sp
                  csrrs        s6, 0x340, s6
                  mul          a6, s2, a2
                  c.or         a3, a4
                  sltu         a1, a0, zero
                  nop
                  c.mv         s1, s4
                  csrrci       a5, 0x340, 11
                  c.nop
                  addi         a1, a7, -1167
                  auipc        s11, 908541
                  c.srli       a5, 26
                  c.xor        a0, a4
                  c.andi       a1, -1
                  addi         t4, s5, 1985
                  xori         t0, s11, 738
                  c.xor        s1, a1
                  c.sub        a3, a2
                  csrrw        t2, 0x340, sp
                  c.nop
                  csrrci       s6, 0x340, 0
                  c.andi       a3, -1
                  slti         sp, s1, 780
                  divu         s11, t4, t6
                  div          s4, a0, t3
                  sltiu        s7, s7, -873
                  mul          s6, s9, t5
                  c.sub        s1, a0
                  sltu         s1, t3, s7
                  mulhu        s9, s1, s5
                  csrrw        a0, 0x340, a5
                  and          s10, s5, s1
                  andi         s6, s9, -2030
                  xor          t4, s4, a4
                  csrrc        a0, 0x340, s1
                  mulhu        a7, s2, a3
                  c.lui        s8, 26
                  c.add        a1, t3
                  csrrc        s10, 0x340, s4
                  c.or         a1, a4
                  csrrci       s7, 0x340, 0
                  c.or         a5, a5
                  sub          t6, t3, s1
                  xor          s10, t5, s3
                  xori         a1, a7, -1839
                  ori          s8, t3, -1751
                  c.nop
                  csrrci       s11, 0x340, 0
                  sub          a6, ra, tp
                  xori         t1, s0, -316
                  c.add        s2, s8
                  c.add        t1, s1
                  xori         a3, s4, -1109
                  c.slli       a5, 11
                  c.addi16sp   sp, -16
                  remu         t6, s0, s11
                  c.sub        a1, s0
                  nop
                  xori         s11, sp, 806
                  c.add        s4, a5
                  sub          gp, tp, s3
                  lui          s1, 1038520
                  sub          t2, a4, a5
                  c.add        a6, s3
                  srli         a3, s3, 0
                  mulhsu       t0, s2, a2
                  c.li         s1, 2
                  c.addi4spn   s1, sp, 736
                  c.srai       a5, 12
                  c.srai       a1, 27
                  nop
                  sra          s4, a2, s9
                  xor          a5, gp, a7
                  c.sub        a1, a1
                  auipc        sp, 447931
                  sra          s4, s4, a7
                  c.and        a1, a3
                  sra          s9, s11, t0
                  c.slli       t4, 25
                  c.or         a5, s1
                  sltiu        t4, s0, -231
                  csrrc        ra, 0x340, zero
                  or           t6, s1, t2
                  slti         a3, s10, -750
                  div          a0, t0, s5
                  add          t1, a1, a4
                  csrrsi       a5, 0x340, 13
                  mulhu        t4, s4, s3
                  div          s8, tp, t2
                  c.andi       s1, 24
                  sra          s8, zero, t3
                  c.sub        a5, a3
                  c.slli       a6, 13
                  csrrw        s10, 0x340, s9
                  auipc        s4, 516309
                  c.slli       a1, 17
                  slti         a3, t4, 722
                  c.or         a0, a4
                  andi         t1, t4, -1190
                  srli         ra, s10, 25
                  c.nop
                  c.srai       a1, 11
                  andi         t2, a4, -1262
                  mulhsu       gp, t1, s9
                  csrrci       a6, 0x340, 5
                  mulh         s1, s7, sp
                  mulh         sp, s2, t1
                  nop
                  nop
                  c.and        a1, a4
                  or           t6, t4, gp
                  c.lui        s4, 5
                  c.sub        a0, s0
                  csrrc        t5, 0x340, zero
                  slli         gp, t0, 22
                  srai         s7, t1, 27
                  div          s9, s2, s3
                  or           s6, zero, t6
                  c.addi16sp   sp, 240
                  mulhsu       s3, ra, zero
                  mulhu        s6, a4, tp
                  c.li         t0, 15
                  csrrs        s1, 0x340, zero
                  sub          a4, a4, a0
                  c.addi16sp   sp, 80
                  slti         a4, t4, -1514
                  csrrwi       t0, 0x340, 29
                  srl          s3, tp, t2
                  slt          zero, t6, t2
                  srl          sp, sp, s6
                  and          s5, a4, sp
                  nop
                  c.srai       a4, 9
                  c.lui        s8, 14
                  c.addi       a3, 26
                  slli         gp, t1, 0
                  csrrc        s10, 0x340, a3
                  and          s5, a6, a0
                  xor          a1, ra, a4
                  csrrwi       s10, 0x340, 4
                  addi         gp, a7, -1079
                  csrrci       a4, 0x340, 0
                  sltiu        t1, s1, 1413
                  or           s5, s7, t3
                  slti         t4, sp, -312
                  c.sub        a3, a3
                  srai         a0, gp, 13
                  srl          a3, a2, ra
                  c.and        s1, a5
                  c.andi       a4, 21
                  sll          t4, a2, t5
                  c.sub        a5, s1
                  slli         s10, t0, 6
                  c.slli       a4, 21
                  c.andi       a3, -1
                  auipc        s6, 231959
                  or           s11, t5, a2
                  c.sub        a3, s0
                  lui          s10, 116876
                  nop
                  div          t5, a0, a5
                  slli         t6, t6, 17
                  c.or         a3, s1
                  c.srai       a0, 22
                  sltiu        t5, t0, -1172
                  divu         gp, s5, s10
                  csrrw        t1, 0x340, ra
                  c.lui        t4, 16
                  c.andi       a0, -1
                  c.or         s1, a0
                  c.addi       t5, -1
                  c.addi4spn   a4, sp, 240
                  sll          ra, s8, s10
                  div          s3, s8, t5
                  mul          tp, t6, tp
                  xori         s7, gp, -356
                  addi         s1, tp, -1175
                  xor          a4, a2, t1
                  c.lui        t6, 4
                  csrrw        s6, 0x340, gp
                  mulhsu       s6, t4, a7
                  auipc        ra, 605279
                  add          t1, s11, a7
                  c.and        a0, s0
                  and          a6, t2, a6
                  c.andi       a0, -1
                  srli         s10, a4, 24
                  c.li         s8, 21
                  sub          t2, t5, t0
                  slt          s10, a4, s1
                  rem          a5, s1, t0
                  sltu         a6, a0, s11
                  c.lui        s1, 21
                  sub          t2, ra, t3
                  rem          t0, s5, s5
                  or           gp, s5, s6
                  srli         t6, tp, 13
                  ori          zero, s3, 21
                  c.addi       ra, -1
                  c.lui        t2, 11
                  mul          a1, t2, a7
                  c.slli       a7, 11
                  c.and        a4, s0
                  c.slli       ra, 2
                  rem          a0, ra, gp
                  c.srai       a0, 23
                  lui          t4, 73676
                  csrrwi       zero, 0x340, 2
                  xor          s7, a6, gp
                  slli         gp, a6, 1
                  auipc        a6, 518923
                  sltiu        a3, s6, 1140
                  lui          s6, 493116
                  csrrc        s10, 0x340, sp
                  slt          a6, s7, s1
                  div          a1, s5, t5
                  add          s3, t3, s1
                  rem          s9, s3, t5
                  csrrsi       t4, 0x340, 12
                  sra          s3, a0, t2
                  slti         tp, ra, -99
                  c.addi4spn   a4, sp, 272
                  c.sub        a3, a5
                  lui          t1, 802210
                  lui          gp, 467028
                  srai         a6, a7, 10
                  or           sp, a7, a4
                  csrrwi       t5, 0x340, 21
                  and          tp, a5, t3
                  csrrci       zero, 0x340, 25
                  or           t1, tp, t5
                  divu         t1, s11, t5
                  sra          t6, gp, a1
                  csrrsi       s6, 0x340, 5
                  mulhu        a0, zero, a5
                  mul          ra, a1, t5
                  csrrwi       a5, 0x340, 12
                  csrrsi       a0, 0x340, 26
                  and          t0, s10, a3
                  rem          s2, a6, t4
                  c.li         t4, 7
                  mulhsu       t1, a2, t1
                  c.and        a3, a2
                  c.mv         a0, s7
                  sltiu        sp, sp, -568
                  c.add        s7, t1
                  c.xor        a1, a2
                  nop
                  slt          s7, t4, tp
                  mul          s4, s5, zero
                  csrrwi       a4, 0x340, 20
                  c.lui        t2, 31
                  andi         s4, a5, 1808
                  xori         s1, a2, 1428
                  and          a5, s11, a1
                  csrrsi       a7, 0x340, 24
                  addi         s10, a0, -1957
                  c.li         a1, -1
                  c.sub        a5, a0
                  and          a3, t6, t5
                  srai         sp, a2, 19
                  or           a5, s1, s11
                  sub          zero, gp, s5
                  c.addi       a1, 15
                  c.add        a6, s7
                  divu         s11, s10, a3
                  c.mv         s5, t6
                  c.addi       a7, -1
                  c.addi16sp   sp, -16
                  c.slli       t6, 7
                  add          a3, zero, s2
                  c.lui        a7, 4
                  divu         s9, t4, s5
                  ori          s8, t1, 814
                  c.add        s4, s9
                  remu         s10, ra, s2
                  sub          s7, sp, s3
                  c.addi       a4, -1
                  and          a0, t5, s1
                  ori          a0, tp, -1379
                  c.srai       s1, 10
                  xor          s5, s4, gp
                  xori         s8, a3, -164
                  or           s3, sp, s2
                  or           a7, gp, ra
                  xor          s9, a5, t2
                  or           t1, a0, s6
                  c.srli       a3, 3
                  ori          gp, s10, -555
                  xori         a7, t3, -849
                  rem          s11, s6, t6
                  srai         t1, a3, 31
                  sll          t5, s3, s6
                  nop
                  sll          t2, s7, s3
                  xori         gp, a4, -559
                  c.and        a1, a1
                  xor          t2, s0, t6
                  srli         s3, t6, 0
                  xor          s4, tp, ra
                  sltiu        t2, t6, -1550
                  xori         a0, s9, 1973
                  csrrc        s8, 0x340, zero
                  addi         s1, s1, -432
                  slti         s11, zero, 1024
                  lui          s7, 515045
                  mulhu        t6, t1, t3
                  xor          a1, s3, gp
                  c.nop
                  and          s8, a6, t2
                  c.add        t1, t4
                  div          gp, sp, s2
                  c.slli       a6, 11
                  div          ra, a5, t4
                  csrrsi       gp, 0x340, 0
                  mulhu        s4, s3, t1
                  remu         a0, tp, s4
                  c.addi16sp   sp, -16
                  csrrci       s3, 0x340, 0
                  auipc        ra, 483340
                  sra          s1, a1, t3
                  remu         s3, t1, s0
                  csrrci       s10, 0x340, 0
                  c.addi       ra, -1
                  and          a0, s6, t6
                  c.or         a3, a2
                  c.addi16sp   sp, -16
                  xori         t4, tp, 42
                  divu         t4, s3, tp
                  c.srai       a4, 16
                  sra          a7, tp, sp
                  slt          t6, t1, t1
                  ori          s8, s2, 1405
                  nop
                  lui          a5, 110179
                  add          t6, sp, a5
                  csrrwi       t4, 0x340, 7
                  nop
                  csrrs        zero, 0x340, zero
                  sltu         gp, ra, a3
                  divu         s8, a2, s7
                  add          s5, s5, s11
                  c.xor        s1, s0
                  mulhsu       t5, t1, a1
                  srai         s5, t5, 15
                  add          a6, a3, a3
                  csrrwi       sp, 0x340, 27
                  lui          a0, 908079
                  slti         a6, t0, 1763
                  csrrwi       t4, 0x340, 9
                  c.or         a5, a5
                  c.mv         s10, t6
                  c.addi       s6, 15
                  sll          s5, t4, s0
                  csrrci       t4, 0x340, 28
                  c.addi4spn   a0, sp, 1008
                  csrrc        a7, 0x340, sp
                  c.or         a5, s0
                  c.addi16sp   sp, -16
                  csrrs        t5, 0x340, zero
                  c.nop
                  and          a5, a4, s9
                  lui          s6, 861602
                  ori          ra, a4, -419
                  add          s11, s9, s11
                  srai         s2, a5, 16
                  csrrci       a3, 0x340, 0
                  mulh         sp, s10, s3
                  sll          t2, s11, t2
                  mulhsu       t1, s8, a2
                  auipc        a7, 970194
                  divu         ra, t3, s0
                  rem          t1, s4, tp
                  csrrw        tp, 0x340, ra
                  c.andi       s1, 31
                  sra          a6, t6, a0
                  c.lui        s10, 25
                  sll          s4, s9, a2
                  c.or         s1, a1
                  c.sub        a3, a1
                  c.mv         t0, sp
                  ori          s1, s7, 1464
                  sra          s1, s4, t4
                  lui          a5, 23254
                  c.andi       s1, 8
                  mulhsu       s1, t4, a5
                  nop
                  sll          sp, a0, t1
                  nop
                  csrrs        s2, 0x340, a0
                  c.srli       a3, 27
                  c.and        a1, a3
                  c.sub        a0, s0
                  auipc        a1, 1014756
                  mulh         t2, t1, t5
                  slti         ra, s0, -303
                  sra          s11, a6, t5
                  rem          s2, a3, s4
                  c.or         a1, a5
                  xori         s4, s9, -736
                  c.addi4spn   a5, sp, 16
                  srl          a4, a1, s7
                  c.and        a4, a0
                  c.li         s2, 21
                  sub          t5, s8, sp
                  andi         s3, a2, 912
                  srai         tp, sp, 29
                  c.srai       a3, 25
                  auipc        s11, 864241
                  csrrwi       t1, 0x340, 0
                  xor          sp, s6, gp
                  and          gp, t4, s1
                  c.srli       a0, 18
                  slli         t6, sp, 7
                  xori         t1, sp, -350
                  slti         s6, a4, 1569
                  csrrw        s9, 0x340, t2
                  c.addi16sp   sp, 192
                  mulhsu       a3, s9, t3
                  slli         ra, s9, 16
                  lui          sp, 39670
                  c.srai       a1, 4
                  csrrci       t6, 0x340, 0
                  or           a1, a1, t4
                  slt          t0, a3, t5
                  c.add        a1, t1
                  divu         t5, a5, sp
                  remu         s10, s0, a2
                  c.xor        a4, s0
                  csrrw        tp, 0x340, a4
                  sra          a7, a0, a5
                  srl          s6, s1, tp
                  sub          a5, s6, t1
                  auipc        s3, 19895
                  c.xor        s1, a0
                  c.sub        a1, a0
                  srli         a0, s11, 23
                  remu         s11, s6, a4
                  divu         gp, a5, s6
                  slt          tp, a0, a0
                  srl          gp, s5, a5
                  sltiu        t5, a0, 971
                  c.addi       gp, 8
                  srai         s4, s6, 12
                  sra          a7, a5, a5
                  xori         s6, t2, -961
                  sltiu        s9, a0, -1622
                  ori          t2, ra, -163
                  mul          a6, t0, a1
                  c.xor        a3, a5
                  or           s8, a0, s2
                  c.add        s9, t3
                  or           s7, t4, t1
                  xori         s8, a1, -1516
                  xor          t2, a5, t0
                  sltu         s9, a2, s2
                  sra          s4, gp, s11
                  addi         s6, a0, 603
                  c.slli       t0, 26
                  csrrs        s6, 0x340, t1
                  c.nop
                  lui          a3, 628579
                  divu         a5, s1, s6
                  slt          zero, t5, a6
                  mulh         t4, t4, s1
                  or           s11, s11, t4
                  srli         s3, s5, 4
                  andi         s3, t5, 862
                  lui          s11, 792662
                  sra          s7, a4, a0
                  srli         sp, a5, 18
                  add          zero, gp, t0
                  mul          t2, s5, s10
                  rem          ra, s4, s9
                  slti         zero, sp, -319
                  csrrwi       a0, 0x340, 12
                  srli         a6, a4, 0
                  mul          t6, tp, s7
                  csrrci       s6, 0x340, 18
                  csrrs        a5, 0x340, s3
                  c.slli       a7, 27
                  c.srli       a0, 3
                  sub          s4, s7, s10
                  mulhsu       s7, ra, a6
                  c.lui        a5, 21
                  andi         t2, s10, 1770
                  sltiu        s8, s7, 52
                  mulh         tp, t1, t0
                  c.add        tp, t5
                  or           ra, s8, zero
                  csrrc        t5, 0x340, zero
                  c.srli       s1, 25
                  mulhu        a5, s5, a1
                  csrrci       s6, 0x340, 0
                  add          s2, a6, a2
                  sub          a5, sp, a1
                  csrrw        t4, 0x340, a6
                  add          t5, s2, tp
                  div          a7, a1, t0
                  c.srli       a4, 17
                  slli         tp, s0, 21
                  c.add        t2, ra
                  c.srli       a3, 15
                  csrrsi       s9, 0x340, 1
                  c.addi4spn   a3, sp, 80
                  c.mv         s1, a2
                  nop
                  csrrsi       a3, 0x340, 27
                  c.xor        a4, a4
                  andi         s11, s1, 701
                  xor          s9, ra, s11
                  c.and        a4, a1
                  ori          a4, s9, 202
                  ori          ra, t5, -502
                  sltu         zero, ra, t1
                  c.addi4spn   a5, sp, 288
                  div          a5, s0, s6
                  sub          s3, tp, s7
                  c.addi16sp   sp, -16
                  divu         gp, gp, s10
                  c.addi       a6, 9
                  sll          gp, tp, t4
                  and          a5, s0, s4
                  c.slli       s4, 25
                  csrrsi       s6, 0x340, 18
                  slli         s11, t5, 4
                  srai         t4, s8, 3
                  sltiu        s8, a1, -456
                  sra          t4, s3, s1
                  c.slli       s5, 28
                  c.xor        a3, a4
                  csrrw        s1, 0x340, a2
                  c.sub        a5, a5
                  c.add        t0, s10
                  mulhu        s5, s1, s1
                  slli         t1, t4, 23
                  c.slli       gp, 7
                  lui          t1, 19443
                  c.addi       s2, 24
                  c.addi16sp   sp, -16
                  c.mv         s2, s7
                  csrrs        a4, 0x340, a1
                  csrrc        a7, 0x340, zero
                  nop
                  sltu         a5, s1, a3
                  sltiu        s10, sp, -1067
                  c.addi16sp   sp, -16
                  rem          t0, a3, t0
                  c.lui        t6, 15
                  ori          s10, s2, -918
                  mulh         s5, t6, s0
                  c.addi4spn   a3, sp, 944
                  c.addi       t0, -1
                  ori          ra, s3, 261
                  c.xor        a0, a5
                  c.mv         s11, s8
                  c.sub        a4, a2
                  c.addi16sp   sp, 448
                  sra          s8, s8, t2
                  rem          s3, s3, a7
                  mulh         a7, a0, t3
                  xori         a5, s7, 442
                  slt          s6, s7, s11
                  csrrwi       s9, 0x340, 19
                  csrrci       t5, 0x340, 6
                  lui          gp, 39008
                  c.mv         tp, s2
                  add          zero, s9, a2
                  auipc        s10, 512349
                  c.srli       a5, 14
                  sub          a1, t2, s2
                  nop
                  srl          t5, a4, s6
                  slt          s10, sp, t4
                  csrrci       s7, 0x340, 14
                  sll          s2, ra, a2
                  auipc        a3, 706148
                  nop
                  c.addi       gp, 16
                  rem          s6, t0, tp
                  ori          s10, s1, 181
                  xori         t6, t2, -43
                  sub          s3, t3, s9
                  c.mv         t5, s9
                  ori          a7, a0, 616
                  sra          a6, s0, s2
                  c.and        s1, a3
                  slti         t6, t6, 1702
                  or           sp, s1, t3
                  csrrwi       ra, 0x340, 25
                  ori          s10, s8, -225
                  nop
                  c.or         a0, a5
                  c.slli       s7, 19
                  xori         s4, a2, 711
                  div          s11, ra, s9
                  sra          a1, s1, s5
                  c.nop
                  c.addi16sp   sp, -16
                  csrrs        s9, 0x340, zero
                  addi         s8, t6, 1724
                  c.mv         s8, s8
                  addi         s11, zero, -1220
                  csrrwi       t6, 0x340, 20
                  sub          t6, a4, t6
                  slli         t5, t6, 19
                  nop
                  divu         t5, t2, s5
                  sltu         a5, s0, a0
                  srli         s9, s6, 27
                  sra          s3, tp, s1
                  c.slli       tp, 31
                  srl          s5, s10, s4
                  slli         a5, s5, 4
                  csrrw        a6, 0x340, s5
                  c.add        t4, s11
                  mul          a7, t1, s8
                  add          s4, s6, s1
                  div          sp, s7, a5
                  sra          a7, t6, sp
                  and          s3, s11, t5
                  divu         s3, a3, gp
                  andi         t5, s3, 136
                  mulhu        s4, sp, t6
                  xori         a3, s4, 897
                  xor          a1, t1, a6
                  auipc        a6, 562279
                  addi         s3, s11, 817
                  slti         t6, s6, 2015
                  srli         zero, s6, 27
                  auipc        s7, 344625
                  rem          a6, s4, a7
                  addi         t5, s2, 726
                  mulh         s6, a0, a2
                  remu         sp, s3, gp
                  auipc        a4, 392444
                  c.addi4spn   a4, sp, 832
                  mul          ra, t0, a2
                  csrrc        t6, 0x340, zero
                  c.and        a3, a5
                  c.addi       t2, -1
                  c.addi4spn   a4, sp, 112
                  c.lui        a5, 1
                  csrrci       s2, 0x340, 0
                  sltu         t5, t5, ra
                  or           a1, s0, a5
                  c.and        a1, a1
                  c.nop
                  csrrw        tp, 0x340, a5
                  slti         sp, s0, -1797
                  c.and        a4, a3
                  ori          s2, a3, -606
                  andi         gp, s7, 35
                  sra          tp, s11, t3
                  sltiu        s6, t1, -1469
                  slli         s3, t6, 16
                  csrrci       s5, 0x340, 18
                  c.add        s10, s0
                  c.add        a4, sp
                  sra          ra, a0, a0
                  c.add        s8, gp
                  mulhsu       t1, t5, s0
                  c.addi       t5, 21
                  andi         t4, s0, -1972
                  ori          t2, t4, 371
                  lui          s1, 987697
                  auipc        s2, 111105
                  c.addi16sp   sp, -16
                  andi         a1, s3, -1802
                  lui          s6, 761501
                  add          tp, t2, s11
                  sll          gp, a0, ra
                  slti         s11, a5, -1853
                  c.sub        s1, a5
                  andi         s10, s7, -128
                  c.slli       s3, 23
                  c.srli       a3, 24
                  mulh         gp, t1, a0
                  csrrsi       sp, 0x340, 20
                  csrrsi       a4, 0x340, 0
                  xori         a7, t6, -1966
                  or           sp, t1, s6
                  csrrsi       s1, 0x340, 13
                  srl          t4, ra, s11
                  c.addi4spn   a0, sp, 304
                  csrrsi       s10, 0x340, 24
                  srli         a0, s11, 22
                  c.sub        a4, s0
                  c.sub        s1, s1
                  c.sub        a5, a1
                  csrrwi       t4, 0x340, 2
                  mulh         s3, s3, t6
                  div          s7, t0, t6
                  c.nop
                  c.nop
                  addi         s7, s0, 1991
                  andi         s3, a3, 919
                  csrrci       s10, 0x340, 13
                  c.add        a4, t4
                  srai         tp, a1, 18
                  c.lui        t4, 9
                  mul          a5, t2, t5
                  c.add        a1, t0
                  div          s11, s1, s3
                  srl          zero, s1, zero
                  c.nop
                  c.slli       t5, 16
                  csrrsi       s2, 0x340, 24
                  c.add        s6, s8
                  addi         a4, sp, -1315
                  slli         s7, s1, 17
                  c.and        s1, a2
                  mul          a0, s2, zero
                  remu         gp, s3, s3
                  c.sub        a4, a2
                  lui          s6, 95601
                  slt          a0, sp, t0
                  c.andi       a5, -1
                  srai         s7, s5, 7
                  c.and        a3, a5
                  c.or         a3, s0
                  c.andi       a4, 6
                  srli         ra, s1, 31
                  sltiu        gp, s9, -1157
                  divu         a7, t3, a7
                  lui          a6, 292214
                  c.addi       a1, -1
                  xori         t0, s0, 262
                  srai         s9, t6, 30
                  c.addi16sp   sp, 256
                  add          a1, s11, t4
                  c.addi       a1, -1
                  c.li         t2, -1
                  csrrs        t5, 0x340, zero
                  c.sub        a3, a3
                  mulh         t6, t2, a5
                  c.nop
                  auipc        s1, 643169
                  c.srli       a5, 12
                  sltiu        a4, s1, -1808
                  c.lui        ra, 12
                  c.addi16sp   sp, 368
                  slti         a1, t3, 986
                  mulhsu       a4, gp, tp
                  ori          tp, t4, -401
                  csrrsi       t0, 0x340, 0
                  csrrw        sp, 0x340, tp
                  c.and        a1, a0
                  c.nop
                  sll          s11, a4, sp
                  sra          a5, s8, gp
                  slli         t1, a5, 14
                  xori         s7, a6, -692
                  xor          sp, a4, s0
                  addi         s3, s8, 1995
                  csrrwi       a7, 0x340, 29
                  sll          tp, t1, s11
                  and          ra, t2, a5
                  c.andi       a5, 11
                  csrrs        s10, 0x340, zero
                  xor          sp, t5, zero
                  c.li         t0, -1
                  sra          t2, a0, a4
                  xori         s1, s6, 1898
                  slt          gp, s6, gp
                  add          s5, s4, zero
                  mulhsu       s3, s10, s7
                  add          s2, s5, t3
                  mulhu        s3, s11, s6
                  c.andi       a1, -1
                  csrrsi       a4, 0x340, 0
                  c.lui        gp, 14
                  c.li         t5, -1
                  srai         t1, t0, 29
                  srl          t4, s8, s7
                  c.nop
                  c.xor        s1, a0
                  slti         ra, a7, -1422
                  mulhsu       tp, s4, t5
                  srai         s7, a6, 27
                  sub          s8, a3, gp
                  sub          a4, sp, a4
                  mulh         t2, s1, s5
                  c.srai       a0, 9
                  c.or         a0, a1
                  c.or         a3, a3
                  sll          s9, a0, s3
                  divu         zero, s7, t0
                  mul          tp, t0, s11
                  c.srai       a1, 31
                  auipc        t4, 846893
                  csrrsi       a5, 0x340, 29
                  lui          t1, 726432
                  csrrsi       s5, 0x340, 13
                  csrrwi       s3, 0x340, 14
                  sub          gp, gp, a7
                  slt          ra, s6, t4
                  srli         s7, zero, 27
                  sltiu        a5, s3, -385
                  c.nop
                  mulhu        s10, tp, t4
                  c.and        a3, s1
                  lui          t1, 932621
                  csrrwi       a5, 0x340, 5
                  and          s9, a4, t5
                  remu         t0, a4, a1
                  andi         a5, s2, 78
                  slli         a3, s10, 0
                  c.xor        a0, a1
                  mulhu        a7, t1, t3
                  slti         s11, s1, 342
                  slt          s11, t3, gp
                  slt          a7, a6, tp
                  c.and        a0, a1
                  c.li         s1, -1
                  c.slli       sp, 23
                  c.slli       t4, 2
                  slt          tp, s1, s4
                  slt          gp, t6, s5
                  divu         s8, s10, s7
                  divu         a0, s5, s6
                  csrrci       t1, 0x340, 0
                  c.or         a4, a5
                  rem          s5, a3, sp
                  csrrwi       s1, 0x340, 1
                  and          a7, t5, a2
                  xori         t6, t0, -1726
                  c.or         a0, a1
                  csrrci       s4, 0x340, 8
                  c.lui        a5, 24
                  sll          s3, a0, t4
                  addi         zero, gp, 454
                  slli         t2, s5, 13
                  add          a1, s8, s1
                  c.xor        a0, s0
                  sub          a1, s6, ra
                  srli         s9, s0, 12
                  csrrw        a1, 0x340, s1
                  c.srai       a3, 1
                  addi         t0, t3, -1991
                  add          a5, t2, s6
                  slti         a1, s10, 1221
                  andi         a1, t2, -1180
                  slt          sp, a3, s6
                  mulh         a0, s3, a5
                  sltiu        s9, s4, -187
                  slti         s10, a3, 1781
                  c.srai       a5, 30
                  sub          ra, a4, s10
                  slt          t0, a6, s10
                  csrrw        t0, 0x340, s2
                  mulhu        a6, s10, s2
                  c.xor        a3, s1
                  auipc        a7, 333905
                  c.addi4spn   s1, sp, 960
                  auipc        t6, 634935
                  c.addi16sp   sp, 208
                  div          s4, a1, zero
                  slt          t0, a2, a6
                  mul          tp, s8, t2
                  c.mv         s2, gp
                  xor          a7, s0, t5
                  c.add        a5, s11
                  auipc        s11, 611460
                  sub          t6, t4, a2
                  xori         s2, a5, -826
                  addi         ra, s7, 1404
                  sra          s2, a3, gp
                  c.xor        a5, a2
                  slti         t6, a1, 1040
                  csrrci       sp, 0x340, 9
                  csrrc        a0, 0x340, zero
                  xor          s4, a3, t6
                  xor          tp, tp, t0
                  csrrc        s6, 0x340, s6
                  xori         gp, t3, 494
                  c.nop
                  csrrci       s7, 0x340, 7
                  xori         s10, a6, 400
                  and          t1, t6, s3
                  sll          a1, sp, gp
                  csrrsi       t4, 0x340, 0
                  c.srai       s1, 14
                  csrrw        a1, 0x340, s2
                  sll          t4, a0, zero
                  c.slli       gp, 12
                  sll          t6, a1, t0
                  c.slli       s7, 10
                  csrrw        zero, 0x340, t6
                  csrrsi       s4, 0x340, 0
                  c.or         a4, s0
                  div          a3, s7, s9
                  auipc        s5, 634208
                  ori          a7, s7, 1475
                  c.xor        a5, a3
                  c.nop
                  mulhu        a1, t1, a1
                  mul          s1, a3, s11
                  csrrci       s7, 0x340, 1
                  csrrsi       t4, 0x340, 25
                  slti         sp, t3, -1916
                  csrrc        s4, 0x340, a2
                  c.sub        a1, a1
                  c.add        a7, t3
                  sra          t2, s0, t6
                  csrrw        t5, 0x340, t3
                  c.mv         s3, t2
                  c.sub        a3, a4
                  slt          s6, zero, t1
                  c.nop
                  c.slli       a6, 28
                  divu         s11, t3, t4
                  mulhu        t6, t6, t4
                  add          s5, s10, s4
                  rem          s6, t2, s9
                  remu         s2, a2, t3
                  c.lui        s6, 2
                  slti         zero, s8, -986
                  mulhsu       a0, t3, s0
                  add          a5, s4, s4
                  c.addi16sp   sp, -16
                  slli         a4, a0, 11
                  add          a6, a0, s7
                  addi         s1, s4, 1119
                  slti         ra, s7, 595
                  csrrci       s2, 0x340, 0
                  sltu         a3, s0, t4
                  c.mv         tp, s2
                  csrrw        t4, 0x340, a4
                  c.mv         s4, tp
                  div          sp, s5, t1
                  c.xor        s1, a2
                  c.andi       a5, 4
                  slt          sp, s5, s1
                  mulhu        a3, s7, s6
                  add          a3, s1, a0
                  csrrsi       s9, 0x340, 7
                  mulhu        t0, s1, a3
                  xori         s1, t3, 1360
                  csrrsi       a7, 0x340, 0
                  sltu         s5, s8, s8
                  csrrwi       s8, 0x340, 15
                  rem          s8, s3, s10
                  xor          s2, zero, s6
                  sub          a6, t2, a0
                  csrrwi       gp, 0x340, 31
                  mulh         t5, t6, s4
                  csrrci       s1, 0x340, 0
                  srli         t6, a7, 14
                  c.nop
                  c.or         a3, a5
                  c.lui        s4, 13
                  csrrc        tp, 0x340, a0
                  csrrwi       s10, 0x340, 13
                  csrrsi       t2, 0x340, 0
                  c.andi       a0, -1
                  srli         t6, s8, 1
                  csrrc        t1, 0x340, zero
                  xor          zero, zero, a4
                  auipc        s6, 665446
                  csrrci       t4, 0x340, 0
                  add          tp, s9, s11
                  csrrs        gp, 0x340, zero
                  or           a4, s8, t3
                  addi         s11, t6, -1388
                  andi         s2, s7, 359
                  csrrci       a1, 0x340, 0
                  divu         a0, s1, tp
                  slli         s6, t3, 28
                  c.sub        a0, s0
                  divu         sp, sp, a2
                  xor          gp, s9, a1
                  nop
                  srai         s7, t4, 30
                  addi         ra, tp, -441
                  add          a4, s10, t2
                  c.andi       s1, -1
                  c.srai       s1, 21
                  mul          a5, s4, t4
                  csrrc        t1, 0x340, t5
                  c.addi       s2, -1
                  divu         s11, a0, s3
                  sltiu        t0, s4, 205
                  c.addi16sp   sp, 320
                  mulhsu       zero, gp, s5
                  c.or         a5, a1
                  srl          t1, t1, tp
                  csrrwi       s4, 0x340, 13
                  lui          tp, 113261
                  sra          sp, s5, a1
                  csrrwi       t0, 0x340, 26
                  mulhsu       s2, zero, s3
                  xori         s10, zero, -1642
                  slt          s10, s7, sp
                  c.sub        a4, a3
                  csrrw        gp, 0x340, t4
                  csrrs        gp, 0x340, zero
                  and          s4, zero, t4
                  and          t4, s1, a3
                  andi         t0, a3, 927
                  sltiu        s8, s6, -1389
                  c.addi16sp   sp, 416
                  slt          t4, s11, t6
                  or           s11, zero, s8
                  csrrci       s11, 0x340, 0
                  c.lui        s3, 7
                  c.and        a0, a4
                  nop
                  c.mv         t5, a7
                  c.addi4spn   a5, sp, 896
                  csrrs        a1, 0x340, s10
                  sltiu        s8, s0, -1148
                  sltu         a7, t2, a3
                  csrrc        sp, 0x340, zero
                  srl          a0, s3, t1
                  c.or         a0, s0
                  c.slli       ra, 28
                  c.addi4spn   a3, sp, 688
                  c.nop
                  srli         s10, ra, 12
                  auipc        zero, 272401
                  add          t0, t2, s9
                  c.xor        a3, a1
                  c.lui        a1, 3
                  sra          s11, s7, a5
                  xor          s1, tp, t2
                  c.addi       a6, -1
                  csrrw        s11, 0x340, ra
                  divu         a5, s5, s10
                  remu         s2, a1, a1
                  c.andi       a5, 19
                  slt          s9, a7, s9
                  c.andi       a5, -1
                  divu         s2, a1, s1
                  c.lui        ra, 22
                  slt          t1, s3, t0
                  mulhu        zero, a0, sp
                  c.lui        t1, 21
                  rem          tp, s4, zero
                  c.addi       s9, 17
                  c.srai       a1, 22
                  remu         s7, s8, s2
                  mulh         t6, s5, tp
                  and          s3, a5, s7
                  srai         a0, t4, 22
                  c.addi16sp   sp, 496
                  c.sub        s1, a4
                  c.lui        a7, 10
                  sll          a0, zero, sp
                  csrrsi       a4, 0x340, 15
                  c.nop
                  or           a7, a5, s10
                  c.sub        a5, a0
                  sub          sp, a6, sp
                  c.xor        a1, a5
                  add          a6, s1, t5
                  mul          t4, a5, ra
                  c.xor        a4, s0
                  addi         s6, gp, 1442
                  c.andi       a3, 2
                  csrrsi       tp, 0x340, 1
                  c.addi       gp, 19
                  c.addi16sp   sp, -16
                  mul          s10, tp, gp
                  c.xor        s1, s1
                  addi         tp, s10, -1232
                  add          s11, s1, a3
                  slli         tp, a3, 25
                  add          s8, s7, zero
                  slt          t0, sp, s11
                  andi         a5, s3, -240
                  slti         a0, s1, -2008
                  sltu         a5, s5, s7
                  rem          s9, s7, a4
                  csrrs        s7, 0x340, zero
                  addi         tp, t4, -36
                  xor          a4, s5, ra
                  csrrwi       s10, 0x340, 16
                  c.srli       a3, 15
                  c.addi16sp   sp, 288
                  c.addi16sp   sp, 96
                  sub          s4, s8, s1
                  nop
                  ori          t4, s10, -1171
                  mulhsu       s2, a1, s9
                  sll          a3, s0, s11
                  lui          s2, 518404
                  mulh         s1, s1, s11
                  mulhsu       s2, s4, t0
                  nop
                  c.sub        a5, s1
                  or           a7, s5, t0
                  c.nop
                  csrrci       s7, 0x340, 3
                  slli         sp, a6, 7
                  csrrci       tp, 0x340, 29
                  slti         gp, a7, 1102
                  mulhu        t1, t1, t5
                  xori         t5, s7, 1880
                  divu         t4, a7, s2
                  c.slli       s11, 15
                  c.and        s1, a3
                  c.li         s3, 17
                  sll          a7, a6, tp
                  csrrw        sp, 0x340, t1
                  ori          t1, t3, -1130
                  csrrw        t2, 0x340, s6
                  csrrc        a0, 0x340, zero
                  and          s2, s7, a0
                  c.sub        a0, a0
                  or           a7, t5, t1
                  mulhu        s7, a2, a6
                  and          s7, gp, sp
                  xori         zero, s0, 1736
                  xori         s9, zero, -19
                  c.add        s8, s6
                  sltiu        gp, s1, 382
                  csrrs        s4, 0x340, zero
                  addi         a7, gp, 8
                  csrrwi       a3, 0x340, 19
                  rem          a0, t1, s5
                  sll          ra, t1, t3
                  mulhu        s11, a1, sp
                  csrrsi       t5, 0x340, 27
                  nop
                  slt          t0, s0, s1
                  c.srli       a0, 8
                  csrrwi       tp, 0x340, 22
                  c.sub        a0, a5
                  xori         s11, s6, 1148
                  xori         t2, sp, -1011
                  rem          a0, a2, s1
                  rem          t0, a7, s5
                  divu         s1, s9, zero
                  csrrc        s10, 0x340, tp
                  c.srai       a3, 30
                  c.sub        a4, a3
                  nop
                  c.addi16sp   sp, -16
                  div          t1, a1, a7
                  c.srai       a4, 4
                  csrrsi       s1, 0x340, 0
                  mul          t6, t3, s10
                  srli         s4, s8, 22
                  slt          t0, gp, s10
                  c.sub        a0, a4
                  auipc        t2, 300618
                  or           gp, t0, a6
                  c.lui        s8, 24
                  divu         s10, t3, s7
                  nop
                  sub          t1, tp, a0
                  auipc        s2, 715692
                  lui          sp, 182961
                  csrrsi       s1, 0x340, 7
                  mulhu        s6, t2, a0
                  csrrw        tp, 0x340, s6
                  div          s2, s9, s4
                  csrrsi       s9, 0x340, 21
                  c.sub        s1, a4
                  mul          t0, t5, t4
                  andi         s3, zero, 1612
                  sra          s7, a6, a6
                  csrrc        a7, 0x340, t0
                  c.addi       s4, -1
                  add          t4, t6, tp
                  ori          tp, t3, 837
                  srli         t1, gp, 10
                  c.xor        a0, a4
                  remu         s8, t5, s10
                  c.nop
                  c.and        a5, a3
                  divu         t0, s11, t3
                  c.lui        s11, 29
                  mulh         a3, t3, gp
                  sub          s9, t2, s11
                  addi         s11, t3, -34
                  csrrc        t0, 0x340, a3
                  lui          ra, 202305
                  c.and        a3, a3
                  csrrs        sp, 0x340, s1
                  sltiu        a7, s10, 1714
                  addi         t6, ra, 1354
                  srl          s8, t3, a2
                  slti         t5, a5, -1208
                  sub          s5, sp, s0
                  div          t2, s3, ra
                  c.nop
                  nop
                  slt          t1, s8, ra
                  c.xor        s1, a1
                  c.nop
                  remu         sp, s4, s11
                  c.srli       a3, 4
                  c.andi       a3, 1
                  c.srli       a0, 27
                  addi         s7, t4, 1525
                  c.and        a0, a1
                  sltu         s9, gp, a2
                  sub          ra, s3, t1
                  rem          s9, a3, t0
                  c.addi4spn   a1, sp, 960
                  auipc        s9, 956742
                  sltiu        s11, s5, 1418
                  c.andi       a5, -1
                  mul          t6, zero, s9
                  c.li         t5, -1
                  c.or         a1, s0
                  or           tp, a4, gp
                  mulhu        a7, s7, gp
                  sll          a6, a0, s7
                  slti         a1, sp, -926
                  slti         a7, zero, -1746
                  c.nop
                  lui          a4, 189331
                  slli         ra, s0, 21
                  c.add        t6, s11
                  sll          a4, t5, gp
                  rem          s2, s3, s10
                  c.li         s5, -1
                  sub          ra, gp, a4
                  div          t5, t2, t5
                  xor          a0, a1, s0
                  c.li         s4, -1
                  c.and        s1, a0
                  sltiu        t2, sp, 1269
                  slt          t2, sp, t6
                  csrrsi       a4, 0x340, 14
                  mul          t5, a0, a1
                  sltu         s11, s2, a0
                  csrrsi       gp, 0x340, 2
                  srli         ra, sp, 10
                  sub          ra, a4, zero
                  c.nop
                  c.and        a0, s0
                  slti         s2, t1, -1399
                  sltu         t1, ra, s7
                  csrrw        s8, 0x340, t4
                  c.srai       a3, 19
                  csrrw        a0, 0x340, a5
                  csrrc        s9, 0x340, zero
                  csrrw        s2, 0x340, s9
                  csrrwi       t0, 0x340, 10
                  c.slli       t2, 14
                  slti         a0, s0, 1086
                  c.srli       s1, 3
                  csrrw        t6, 0x340, t1
                  andi         s7, sp, -830
                  c.lui        t4, 11
                  lui          s11, 766805
                  remu         ra, t1, a3
                  c.addi4spn   a0, sp, 816
                  c.srli       a3, 20
                  add          s4, t6, s8
                  c.addi4spn   a4, sp, 400
                  sltiu        s10, s7, 1926
                  ori          s10, t4, 1895
                  sltu         s9, a0, t2
                  slt          s5, tp, a3
                  xor          s4, a7, t0
                  addi         s10, s9, -716
                  c.addi       s8, 5
                  c.addi4spn   a4, sp, 448
                  nop
                  mulhu        t1, t1, s6
                  c.li         a0, 10
                  addi         t1, t4, 1284
                  csrrsi       s1, 0x340, 0
                  mulhu        s6, s8, a2
                  mul          s4, a7, a3
                  c.addi       s8, -1
                  c.and        a4, s0
                  c.xor        a5, s0
                  xor          t6, t3, ra
                  sltiu        tp, sp, 1119
                  nop
                  andi         s6, s4, 299
                  c.sub        a5, s1
                  xor          a6, a6, t0
                  c.xor        a4, s0
                  csrrsi       t4, 0x340, 14
                  srl          t1, ra, ra
                  c.nop
                  addi         a1, s8, -1304
                  c.and        a1, a1
                  mulhu        tp, s2, a0
                  c.sub        a0, a4
                  sll          a6, s3, t5
                  xor          tp, s6, t1
                  slli         s5, s11, 30
                  sltiu        a6, a2, -827
                  c.lui        s1, 1
                  c.add        s9, a7
                  c.or         a4, a5
                  sra          t4, s8, gp
                  sll          s1, tp, s1
                  srl          s3, t2, t5
                  mulhsu       s7, t5, t0
                  mul          t0, a2, s4
                  csrrwi       a6, 0x340, 3
                  rem          t0, s1, t3
                  and          t4, s7, s0
                  c.li         s11, -1
                  mul          s2, zero, s8
                  csrrc        s1, 0x340, zero
                  auipc        t4, 1009793
                  c.xor        a1, a1
                  c.slli       s9, 29
                  csrrc        t5, 0x340, t3
                  c.xor        a1, s1
                  sltu         s8, s4, zero
                  c.srli       a0, 2
                  c.xor        a4, a2
                  c.li         s10, 10
                  c.or         a0, s1
                  c.addi16sp   sp, -16
                  c.srai       a3, 5
                  c.srli       a3, 14
                  lui          t6, 582940
                  c.li         a7, 22
                  and          a1, s7, a7
                  slti         t6, s11, -1494
                  sra          a5, tp, t1
                  srli         ra, a4, 28
                  csrrci       a6, 0x340, 6
                  mulhu        zero, s3, t1
                  csrrs        a1, 0x340, zero
                  csrrc        tp, 0x340, a6
                  slt          s7, t6, s6
                  or           s2, t1, a3
                  mulhsu       a0, a5, s1
                  or           s8, s1, s9
                  c.mv         t6, a6
                  mulhsu       s2, a1, zero
                  sub          a7, a5, zero
                  mulhu        a4, a1, a1
                  csrrw        gp, 0x340, t5
                  csrrs        a4, 0x340, s10
                  csrrwi       s7, 0x340, 15
                  slt          s3, a3, a1
                  c.lui        t5, 23
                  c.sub        a0, a5
                  csrrw        s2, 0x340, s8
                  c.sub        s1, a0
                  mulhsu       s1, a5, s1
                  divu         ra, sp, t3
                  c.addi16sp   sp, -16
                  mulh         s1, zero, tp
                  c.srli       a5, 17
                  c.xor        s1, a2
                  csrrw        zero, 0x340, t6
                  nop
                  nop
                  slt          s5, ra, s5
                  mulhsu       tp, t3, t3
                  c.mv         s11, a7
                  c.lui        t1, 29
                  srai         a3, t5, 1
                  add          s1, a2, t2
                  sub          t0, t3, t2
                  c.nop
                  c.xor        a3, a4
                  or           t6, gp, a4
                  sra          s9, s5, tp
                  csrrc        a5, 0x340, s6
                  c.addi       a7, 22
                  csrrc        t4, 0x340, sp
                  srai         t0, a5, 1
                  xori         zero, t5, -1751
                  add          s10, s8, t0
                  c.mv         s9, sp
                  add          s6, s7, t2
                  sll          sp, a1, tp
                  or           a7, t6, t2
                  and          a3, ra, a6
                  srai         a7, a3, 0
                  csrrw        s11, 0x340, zero
                  c.or         a5, s1
                  c.srai       a3, 7
                  srl          s4, ra, a0
                  c.addi16sp   sp, -16
                  csrrw        s11, 0x340, a6
                  nop
                  c.and        s1, a4
                  srai         t1, gp, 0
                  andi         a6, sp, 459
                  srl          s3, tp, s4
                  csrrsi       t4, 0x340, 0
                  csrrwi       s9, 0x340, 17
                  c.srli       a3, 23
                  csrrc        t4, 0x340, zero
                  c.li         sp, -1
                  addi         t4, a2, 836
                  xori         s9, a7, -111
                  and          s6, t0, tp
                  andi         zero, sp, -1299
                  andi         s8, s4, 389
                  csrrs        a3, 0x340, sp
                  sltiu        t6, s4, -1718
                  mulhsu       t4, t5, t6
                  csrrwi       a1, 0x340, 27
                  c.and        a4, a1
                  xori         gp, a6, -37
                  sra          tp, t6, a7
                  rem          t0, t0, t0
                  c.srli       a4, 13
                  c.sub        a5, a0
                  c.lui        a7, 12
                  c.srli       a3, 9
                  csrrw        ra, 0x340, a5
                  sra          a6, zero, a5
                  mul          ra, zero, sp
                  xor          t1, s5, s10
                  xori         gp, s0, -1282
                  csrrw        s2, 0x340, s11
                  mulh         a5, s7, t2
                  c.addi16sp   sp, 112
                  rem          a5, zero, t6
                  sltiu        s4, sp, 891
                  and          s9, tp, sp
                  xori         s2, a4, -439
                  slti         tp, sp, -1889
                  slli         t4, s2, 18
                  c.slli       s11, 26
                  xori         t2, gp, 503
                  mulhu        s3, t5, a3
                  rem          gp, t1, s7
                  csrrci       t4, 0x340, 0
                  sltu         a3, zero, a4
                  slti         t2, t2, -2015
                  c.addi16sp   sp, -16
                  rem          s6, s11, s1
                  add          a3, a6, sp
                  c.addi16sp   sp, 496
                  csrrs        a1, 0x340, a0
                  c.lui        t5, 15
                  divu         t2, sp, s10
                  c.srli       a5, 13
                  andi         t6, s5, -647
                  remu         tp, a2, s5
                  remu         t5, s1, a6
                  csrrsi       t6, 0x340, 8
                  div          s11, s2, s5
                  remu         s8, ra, t0
                  andi         gp, a1, -54
                  srai         t1, t0, 22
                  xori         tp, s9, 456
                  sra          a0, s2, s6
                  divu         t4, t0, t1
                  csrrwi       s6, 0x340, 1
                  csrrs        t2, 0x340, zero
                  remu         s1, t5, t3
                  sub          s8, t6, t3
                  sra          s7, a0, s1
                  csrrci       t4, 0x340, 11
                  ori          s11, t3, 1768
                  or           s2, s0, s6
                  addi         a6, sp, -945
                  slti         s9, sp, -89
                  addi         s4, ra, -1782
                  csrrw        a3, 0x340, a7
                  nop
                  c.li         t5, -1
                  xori         s6, t1, -1564
                  xor          t1, sp, t6
                  c.sub        a0, a1
                  slti         t1, t6, 1181
                  div          a6, s11, s7
                  mulhsu       s11, s6, s9
                  c.addi       a3, 26
                  sltiu        t1, a1, -1177
                  csrrc        t1, 0x340, zero
                  c.addi16sp   sp, -16
                  andi         a7, s3, -1534
                  mulh         zero, zero, a6
                  or           t0, a7, t3
                  mulhu        a5, s5, a0
                  c.nop
                  lui          zero, 237457
                  c.addi       s9, -1
                  mul          tp, s1, a1
                  csrrs        a0, 0x340, zero
                  c.and        a5, s1
                  slt          tp, a7, a5
                  csrrc        t4, 0x340, s10
                  c.or         s1, a0
                  and          gp, s9, s6
                  or           a3, a0, a0
                  mulh         s1, a0, s5
                  sll          tp, s10, t3
                  srli         sp, s9, 7
                  c.lui        s3, 12
                  c.mv         a0, a7
                  c.and        s1, a0
                  c.mv         ra, a6
                  srli         s9, t4, 12
                  srl          t0, s7, a4
                  c.mv         a6, s6
                  c.li         s11, -1
                  addi         t5, t1, 322
                  c.nop
                  c.or         a0, s0
                  csrrwi       t0, 0x340, 0
                  c.xor        a4, a1
                  csrrsi       a3, 0x340, 10
                  divu         s1, t2, a6
                  andi         a3, zero, 562
                  sub          zero, t5, ra
                  csrrsi       sp, 0x340, 0
                  c.srai       a0, 22
                  c.addi16sp   sp, 144
                  c.add        ra, s3
                  csrrc        gp, 0x340, t5
                  slti         t4, s11, 597
                  sll          t2, s5, t5
                  c.addi4spn   s1, sp, 912
                  csrrw        zero, 0x340, s4
                  c.nop
                  mulhu        s4, a1, s7
                  c.addi16sp   sp, -16
                  c.mv         t0, tp
                  c.slli       a5, 4
                  c.or         a3, a0
                  csrrwi       s4, 0x340, 0
                  add          s3, s8, s3
                  divu         t0, s6, s8
                  c.addi16sp   sp, -16
                  sra          t6, s3, t1
                  c.or         a4, s1
                  mulhu        s8, t4, sp
                  csrrsi       s3, 0x340, 29
                  remu         a0, s6, gp
                  c.sub        a3, a2
                  sll          s1, gp, s9
                  c.addi16sp   sp, -16
                  csrrwi       s10, 0x340, 20
                  c.srai       a1, 27
                  csrrw        s5, 0x340, s11
                  slli         a5, s2, 8
                  srli         t0, a3, 16
                  lui          s5, 398425
                  sll          tp, sp, s11
                  divu         t2, t0, t6
                  srli         a1, tp, 27
                  c.slli       s3, 15
                  csrrsi       a0, 0x340, 18
                  c.and        a0, a0
                  andi         t5, ra, 239
                  remu         a3, zero, t5
                  mulhsu       t4, s10, a4
                  div          t6, a6, s4
                  csrrci       s6, 0x340, 0
                  mulh         t2, t1, zero
                  csrrw        a3, 0x340, s9
                  c.addi4spn   a1, sp, 528
                  divu         a0, s8, t6
                  mul          a4, s6, s9
                  c.and        a4, a1
                  lui          s10, 835239
                  c.andi       a5, -1
                  c.li         s2, 10
                  c.or         s1, a1
                  csrrw        t1, 0x340, sp
                  mulhsu       sp, a6, a7
                  c.add        ra, s6
                  mulhu        s11, a7, t4
                  csrrwi       a6, 0x340, 26
                  divu         s6, s3, gp
                  c.andi       a4, 23
                  remu         a6, s0, s8
                  c.srai       a3, 5
                  sltiu        s9, s3, 1738
                  mul          s8, ra, a3
                  and          a0, a3, s1
                  slli         t5, a3, 13
                  rem          s11, s8, s0
                  srai         t4, s11, 7
                  c.srai       a0, 20
                  csrrsi       a5, 0x340, 12
                  csrrc        s7, 0x340, zero
                  c.addi4spn   a4, sp, 576
                  andi         gp, t2, 187
                  c.and        a0, a5
                  auipc        zero, 32096
                  csrrc        s10, 0x340, sp
                  mul          tp, s10, s5
                  c.xor        s1, a2
                  csrrs        t5, 0x340, zero
                  c.addi4spn   s1, sp, 640
                  c.xor        a4, a4
                  csrrsi       s10, 0x340, 0
                  mulhu        sp, s8, gp
                  remu         s5, a7, s8
                  andi         t2, s9, -713
                  srl          s2, a5, t2
                  divu         a3, s10, t0
                  ori          t2, s0, 1099
                  c.li         t2, 13
                  auipc        s7, 34786
                  slli         t1, gp, 10
                  addi         s4, a4, -283
                  remu         a0, a5, s3
                  c.srli       a5, 11
                  c.srai       s1, 6
                  csrrw        tp, 0x340, s6
                  c.nop
                  c.mv         a6, ra
                  c.add        ra, s10
                  div          s2, s4, s11
                  c.sub        a5, a1
                  addi         t5, a4, -563
                  c.srai       a0, 26
                  mulh         a7, t5, ra
                  c.add        s2, a4
                  andi         s1, a0, 346
                  c.add        t1, s11
                  mulh         s3, a2, sp
                  c.and        a4, a4
                  c.addi16sp   sp, 32
                  rem          a3, zero, t0
                  srli         t0, s10, 20
                  rem          s1, a3, s3
                  slli         s8, t6, 15
                  lui          s9, 611491
                  lui          s3, 693675
                  addi         tp, a1, -1146
                  c.lui        a4, 11
                  c.srai       a0, 5
                  c.addi       t4, -1
                  c.addi16sp   sp, -16
                  srai         ra, t2, 25
                  csrrsi       a6, 0x340, 10
                  nop
                  c.sub        s1, a2
                  srl          s3, s6, s2
                  ori          t0, t0, 1323
                  nop
                  csrrs        t4, 0x340, zero
                  csrrc        t2, 0x340, a4
                  divu         tp, a4, a4
                  c.andi       a5, 7
                  c.sub        a0, a2
                  slt          s6, s11, s7
                  nop
                  c.and        a0, a3
                  c.addi16sp   sp, 208
                  csrrc        t2, 0x340, s9
                  c.srai       a5, 23
                  mul          tp, t1, s4
                  andi         a3, a6, -1177
                  csrrsi       t6, 0x340, 7
                  c.and        a5, a5
                  sltiu        s10, t2, 1481
                  slti         t6, sp, 361
                  c.or         a3, a5
                  c.andi       a0, 25
                  addi         t0, s0, -1928
                  srli         s2, s4, 24
                  c.andi       s1, 1
                  lui          a7, 480914
                  c.sub        a5, a2
                  slti         t2, t3, -1129
                  c.or         s1, a5
                  sll          s9, t0, s4
                  mulhu        s1, t0, t2
                  remu         s1, t1, s1
                  mul          s10, s1, a2
                  csrrwi       t4, 0x340, 29
                  srl          sp, a1, t1
                  slli         a3, t4, 31
                  csrrsi       t4, 0x340, 23
                  csrrw        zero, 0x340, t2
                  c.addi16sp   sp, 416
                  sltu         s1, t1, s5
                  slti         s10, a0, 1281
                  mulhu        s3, t6, t6
                  csrrsi       a7, 0x340, 0
                  c.mv         s10, s2
                  c.or         a1, a2
                  div          t5, ra, gp
                  c.add        a0, s10
                  csrrci       t6, 0x340, 0
                  c.sub        s1, a5
                  c.nop
                  c.nop
                  sltiu        a4, a7, 597
                  srai         s4, zero, 3
                  div          s3, a2, s11
                  mulhu        a5, tp, t1
                  srl          tp, s11, s7
                  c.addi4spn   a4, sp, 416
                  addi         t2, tp, -641
                  lui          a3, 170664
                  mulhsu       s6, a0, t2
                  sll          zero, s8, t3
                  csrrwi       s1, 0x340, 24
                  c.addi16sp   sp, -16
                  mul          a4, s10, t6
                  c.slli       s3, 28
                  sub          gp, gp, sp
                  rem          a6, a6, t1
                  auipc        t2, 874126
                  c.add        a4, a5
                  csrrwi       s11, 0x340, 1
                  c.add        t0, t5
                  c.or         a1, a4
                  csrrsi       t6, 0x340, 7
                  xor          t0, t6, s9
                  remu         sp, gp, zero
                  mulhsu       sp, t0, sp
                  slli         a3, t3, 27
                  remu         t6, sp, a0
                  slti         a7, a6, 119
                  csrrw        a3, 0x340, a5
                  remu         t6, t5, zero
                  div          a3, t3, t3
                  mulh         s6, a0, a2
                  slti         zero, sp, 848
                  mulhu        a4, t6, t2
                  csrrc        a5, 0x340, zero
                  c.addi4spn   a3, sp, 432
                  c.slli       s9, 2
                  sltiu        a4, t3, 1621
                  csrrsi       a4, 0x340, 22
                  sltu         t4, s5, s2
                  c.and        a1, a0
                  divu         s3, t6, s6
                  srli         t6, s9, 8
                  srli         s8, s2, 7
                  slli         s10, s5, 29
                  c.srli       s1, 22
                  andi         tp, s7, -511
                  auipc        s5, 751718
                  nop
                  c.andi       a4, 3
                  sll          t2, s4, s0
                  add          zero, t3, zero
                  csrrsi       s10, 0x340, 0
                  sll          sp, a3, tp
                  c.or         a3, a0
                  nop
                  csrrs        s11, 0x340, zero
                  add          a0, s1, sp
                  c.mv         t4, t4
                  mulhsu       t5, s6, a5
                  srl          a3, a5, ra
                  remu         sp, t3, a2
                  c.xor        a0, s1
                  divu         s11, t3, s7
                  c.slli       s6, 25
                  mulh         s10, a3, t4
                  c.sub        a1, a4
                  c.sub        a5, s0
                  c.srai       a3, 30
                  slli         s8, gp, 18
                  sll          s11, s5, s4
                  srli         a0, s10, 29
                  c.addi16sp   sp, 80
                  srai         t5, a5, 15
                  divu         a7, t1, s3
                  csrrci       tp, 0x340, 18
                  sltu         a7, tp, s1
                  c.mv         a5, a4
                  c.or         a1, a0
                  sltiu        t5, t6, 1952
                  csrrci       s6, 0x340, 5
                  c.li         s1, -1
                  ori          s4, t1, 309
                  xor          a0, s11, t1
                  addi         ra, t6, -1015
                  c.and        s1, a2
                  c.li         a1, -1
                  nop
                  sltu         s4, t3, t2
                  or           a3, a7, s11
                  mulh         t0, a0, t2
                  slli         s5, s4, 6
                  csrrw        t5, 0x340, a5
                  rem          t0, a3, a2
                  ori          ra, a7, -771
                  mul          a3, a3, t3
                  c.li         s2, 17
                  mulh         a7, s1, a0
                  c.slli       t2, 17
                  or           t0, s7, s4
                  sll          ra, tp, a4
                  csrrsi       s9, 0x340, 0
                  srl          tp, a3, ra
                  remu         a1, a4, t5
                  c.andi       a0, 0
                  srai         sp, t0, 25
                  c.or         a5, a1
                  c.li         s10, 9
                  nop
                  c.slli       s3, 19
                  sltu         a1, s9, a2
                  csrrc        a4, 0x340, s3
                  addi         gp, s4, -745
                  csrrwi       a0, 0x340, 2
                  ori          s5, t2, -1369
                  c.addi4spn   a4, sp, 96
                  c.and        s1, a3
                  csrrci       s8, 0x340, 0
                  nop
                  nop
                  andi         s7, tp, 1713
                  c.addi4spn   a1, sp, 384
                  srl          a5, a3, a3
                  c.li         s1, 18
                  mulh         ra, s3, s5
                  csrrs        t6, 0x340, a1
                  xori         t5, gp, -1197
                  sltiu        a1, s11, 1657
                  xor          gp, a5, zero
                  slti         a4, a2, -1952
                  csrrw        t4, 0x340, zero
                  c.li         ra, -1
                  rem          zero, s8, s3
                  add          a0, gp, zero
                  ori          tp, a2, 98
                  andi         s7, gp, 1019
                  slti         s2, t5, -1637
                  c.and        a0, a2
                  sltiu        s8, s9, -329
                  sltiu        gp, s2, -1215
                  srai         a6, a4, 21
                  srli         ra, s11, 9
                  and          t6, zero, t0
                  c.li         a3, 14
                  c.slli       s10, 21
                  c.addi16sp   sp, -16
                  ori          t2, s3, -1788
                  c.li         s2, 31
                  srli         a4, s8, 8
                  csrrw        s6, 0x340, s5
                  andi         s6, gp, -1127
                  auipc        t6, 88301
                  srl          ra, a5, s6
                  c.andi       a3, 11
                  c.andi       s1, 0
                  auipc        sp, 432036
                  and          s8, s10, s11
                  sll          a6, a6, t6
                  c.slli       a4, 19
                  c.addi16sp   sp, 208
                  slt          a5, a3, s5
                  xori         a6, s1, -729
                  rem          s7, a3, zero
                  c.add        a3, a2
                  csrrw        s3, 0x340, s2
                  c.add        t2, s11
                  c.or         a4, a5
                  c.sub        a0, a4
                  c.and        a5, a1
                  c.mv         t2, ra
                  divu         t5, s3, s6
                  div          t6, t6, tp
                  srli         s1, s3, 13
                  sltu         s2, s5, a0
                  c.addi4spn   a1, sp, 320
                  sra          a1, a2, a2
                  c.or         a0, a5
                  c.sub        a0, a2
                  srai         s7, a1, 29
                  csrrwi       zero, 0x340, 7
                  sra          t6, s1, t1
                  c.srai       a5, 12
                  c.li         s10, 9
                  c.li         a4, 17
                  c.addi16sp   sp, -16
                  c.sub        a0, a0
                  c.sub        a4, s0
                  or           s3, s3, zero
                  sltiu        s9, t6, 1974
                  andi         s3, t0, -790
                  c.add        s6, t2
                  rem          t4, a3, s11
                  sra          s3, s8, t5
                  lui          s3, 786341
                  sll          sp, a1, a4
                  rem          zero, s9, a5
                  c.li         s4, -1
                  div          t5, zero, t3
                  sltu         gp, s11, a7
                  mul          s10, s4, s1
                  c.addi16sp   sp, 480
                  ori          t1, t4, -1476
                  c.addi16sp   sp, 432
                  remu         t6, a1, s1
                  c.add        tp, a1
                  nop
                  csrrw        s9, 0x340, t6
                  c.addi16sp   sp, 272
                  andi         s10, t3, -446
                  sll          t6, s3, s8
                  c.or         s1, a3
                  sra          s5, s5, s0
                  or           gp, a4, a5
                  c.slli       s5, 21
                  csrrwi       a1, 0x340, 31
                  c.mv         s3, ra
                  c.addi4spn   a4, sp, 448
                  csrrci       a5, 0x340, 0
                  c.addi       s3, -1
                  csrrci       s3, 0x340, 0
                  c.add        t6, s0
                  remu         sp, t6, sp
                  auipc        s4, 57311
                  c.addi4spn   a4, sp, 48
                  xor          a5, s4, s2
                  lui          s3, 557504
                  sra          s1, s7, s4
                  c.lui        a3, 11
                  c.addi16sp   sp, 192
                  or           s4, s3, a4
                  c.andi       a1, -1
                  ori          ra, s8, 861
                  nop
                  c.mv         s10, s6
                  mul          a4, a4, a5
                  slti         s5, s7, -420
                  srli         t2, t4, 19
                  sub          gp, s6, t2
                  c.mv         s4, gp
                  csrrc        t1, 0x340, zero
                  csrrw        s2, 0x340, sp
                  andi         ra, ra, 833
                  c.li         a5, -1
                  xor          t2, a3, s4
                  remu         a4, s11, t4
                  csrrs        t2, 0x340, t5
                  csrrsi       t6, 0x340, 0
                  divu         s3, t0, a7
                  slt          s2, s10, t5
                  c.slli       a6, 9
                  sltu         t1, t6, s0
                  csrrc        t2, 0x340, s3
                  c.srli       a1, 24
                  c.addi4spn   a4, sp, 720
                  csrrc        s1, 0x340, zero
                  addi         a6, tp, -1533
                  c.sub        s1, a4
                  mul          a0, s11, t5
                  nop
                  c.addi4spn   a4, sp, 176
                  c.srai       a3, 1
                  c.add        t1, a2
                  xor          a6, t0, t1
                  rem          zero, s7, ra
                  ori          s9, s5, -1347
                  xori         s11, a6, -917
                  addi         s1, a4, 1083
                  c.srai       a1, 6
                  slt          t4, a2, t0
                  andi         s2, s8, -1103
                  mulhu        t6, s8, a4
                  auipc        s1, 1032680
                  auipc        t5, 492909
                  slti         tp, s1, 1233
                  mul          s5, t2, tp
                  mulh         sp, t6, a6
                  csrrsi       t6, 0x340, 0
                  csrrci       a4, 0x340, 12
                  csrrsi       zero, 0x340, 0
                  sra          t5, t4, a4
                  mulhu        s9, a1, a0
                  add          a0, s11, t4
                  mulh         t4, t5, t5
                  csrrsi       s1, 0x340, 0
                  remu         t0, s6, s8
                  c.or         a1, a2
                  c.sub        a1, a2
                  c.srli       a1, 22
                  csrrci       t2, 0x340, 0
                  csrrw        gp, 0x340, ra
                  srli         s6, t1, 2
                  sltu         ra, t2, s1
                  sltiu        t5, a1, -335
                  add          a1, a4, a0
                  c.sub        a3, a4
                  slt          a3, s7, a1
                  ori          s1, t3, -1790
                  sll          t5, s9, s10
                  slli         s1, t1, 8
                  c.li         s11, -1
                  c.li         s11, 23
                  c.add        t2, a4
                  addi         s7, s1, 1791
                  c.and        a4, a4
                  add          s4, t5, s7
                  andi         s3, t3, 1917
                  slti         s5, s8, 1112
                  csrrw        s6, 0x340, s6
                  slli         t2, a5, 18
                  srli         a7, a6, 14
                  c.addi16sp   sp, 240
                  ori          t6, a1, -904
                  c.xor        s1, s0
                  mulhu        t5, s11, a0
                  c.lui        ra, 31
                  slti         s10, s2, 976
                  c.nop
                  c.andi       a5, -1
                  ori          tp, a5, 865
                  sltiu        t0, s3, -1713
                  c.sub        a4, a5
                  c.andi       a5, -1
                  ori          s4, a4, -369
                  c.srli       a3, 1
                  slti         ra, s4, -1966
                  c.or         s1, s0
                  addi         a4, t6, 750
                  divu         s5, t4, a6
                  srl          t4, a1, s10
                  sltiu        t0, s4, 130
                  xori         s9, t3, -1120
                  c.nop
                  srli         sp, s5, 30
                  c.srai       a3, 8
                  sltiu        gp, a5, 1148
                  c.srai       a5, 26
                  mul          s7, t1, t6
                  slt          a1, s0, s4
                  and          s3, sp, a5
                  remu         s8, t5, a4
                  sll          a1, s1, s7
                  sub          ra, a3, gp
                  c.sub        s1, a2
                  srl          s8, t5, s4
                  c.nop
                  c.nop
                  sll          a0, s8, a0
                  xori         a0, s4, 1770
                  c.li         ra, -1
                  srai         gp, tp, 22
                  sll          s10, t6, a7
                  c.addi16sp   sp, -16
                  divu         ra, s2, a3
                  c.add        a3, s6
                  sltu         t5, s0, s11
                  c.addi       s2, -1
                  xori         a7, s10, -1528
                  srli         t2, s3, 7
                  xor          t5, t4, s3
                  mulhsu       t1, s11, t0
                  slti         sp, a2, 74
                  and          a7, t1, a7
                  csrrw        s9, 0x340, s3
                  div          s10, s3, sp
                  c.xor        a1, a1
                  nop
                  c.slli       a0, 9
                  mul          s2, gp, s9
                  xori         s11, s10, -238
                  sltu         a0, s1, t2
                  csrrw        s9, 0x340, a6
                  sra          s3, s11, t4
                  csrrc        ra, 0x340, zero
                  slt          t2, s6, s4
                  csrrs        a5, 0x340, zero
                  remu         t5, t0, sp
                  c.and        a3, a0
                  c.addi16sp   sp, -16
                  c.sub        a5, a1
                  c.addi4spn   a4, sp, 608
                  srl          a5, s7, tp
                  add          t4, a4, s7
                  c.srli       a0, 25
                  mulhsu       a4, zero, s3
                  c.add        t2, a1
                  addi         a4, a3, -1953
                  c.andi       s1, -1
                  nop
                  auipc        s11, 733005
                  c.srli       a4, 16
                  slli         a1, t1, 30
                  srl          a4, t2, s8
                  c.andi       a3, -1
                  csrrw        a7, 0x340, s5
                  srl          a1, a6, t6
                  sltiu        s1, a1, -1296
                  c.lui        t5, 1
                  mul          zero, s9, a6
                  addi         t1, gp, 1626
                  c.addi       a0, 27
                  csrrci       s6, 0x340, 20
                  c.srai       a1, 8
                  sra          s3, t1, a5
                  xori         t5, a2, 1572
                  c.add        a1, t3
                  add          s9, t0, s11
                  c.addi4spn   a3, sp, 288
                  csrrw        zero, 0x340, s9
                  sltu         t1, a5, a5
                  c.srai       a4, 29
                  andi         s1, a4, -1101
                  srl          s7, zero, a7
                  auipc        zero, 481206
                  rem          s4, s3, a7
                  andi         s2, s8, -1694
                  or           s7, t5, s10
                  andi         t4, s7, 1085
                  remu         t6, ra, t6
                  csrrsi       t2, 0x340, 0
                  csrrci       t5, 0x340, 18
                  remu         s8, a3, t1
                  csrrci       a1, 0x340, 20
                  c.add        a7, s5
                  c.li         s9, -1
                  auipc        t1, 528583
                  c.lui        a4, 7
                  c.or         a3, a5
                  c.slli       gp, 26
                  mulh         tp, t3, t6
                  c.mv         t4, s8
                  srli         s6, t2, 9
                  auipc        s9, 187967
                  c.srli       a1, 27
                  c.or         s1, a0
                  srai         s7, s3, 6
                  lui          s1, 537784
                  nop
                  csrrsi       t4, 0x340, 26
                  c.xor        a0, a5
                  srai         s7, s0, 27
                  c.li         s6, -1
                  c.sub        a0, a5
                  and          a4, s11, t3
                  c.srli       a4, 18
                  sra          t4, ra, s8
                  sll          t0, s10, t4
                  c.andi       s1, -1
                  div          t4, t4, tp
                  div          a1, t0, t1
                  c.srai       s1, 25
                  csrrc        s10, 0x340, gp
                  c.xor        s1, a4
                  divu         a7, a6, s11
                  ori          s5, a4, 73
                  c.mv         t2, a2
                  sltu         a6, t3, a7
                  csrrw        t6, 0x340, s10
                  c.srai       a0, 18
                  sub          s10, t5, a0
                  sra          s3, tp, t2
                  csrrci       t0, 0x340, 24
                  srli         s8, a1, 11
                  add          a7, t5, tp
                  auipc        t5, 180063
                  c.sub        a1, a1
                  csrrsi       s4, 0x340, 0
                  divu         t1, sp, s6
                  csrrci       gp, 0x340, 10
                  nop
                  c.add        s4, t3
                  sub          s5, ra, gp
                  sub          sp, t5, s11
                  sra          t2, gp, s4
                  slti         a1, zero, -597
                  divu         t5, s0, sp
                  srl          s7, a7, s2
                  c.lui        s10, 10
                  csrrci       t1, 0x340, 0
                  c.addi16sp   sp, -16
                  csrrci       t2, 0x340, 2
                  c.addi4spn   a0, sp, 960
                  c.andi       a4, 16
                  slti         t5, t4, -511
                  c.srai       a5, 10
                  mulhsu       s7, s2, sp
                  c.mv         a5, ra
                  mul          a4, a1, s8
                  mulhu        t6, a3, a5
                  xori         s9, s0, -1467
                  addi         zero, s1, 890
                  c.and        a5, s1
                  c.srli       s1, 13
                  csrrc        s7, 0x340, t4
                  remu         s8, sp, zero
                  c.xor        s1, s1
                  c.nop
                  mulhsu       s8, gp, t5
                  addi         s11, t4, -229
                  csrrci       a0, 0x340, 22
                  slti         s9, s3, 1954
                  xor          zero, a6, s3
                  c.nop
                  add          tp, s4, a7
                  c.or         a3, a0
                  nop
                  srai         t2, tp, 6
                  auipc        t1, 184767
                  srli         a5, a0, 14
                  mulhsu       a3, t0, a3
                  rem          t1, s3, s5
                  srai         ra, a5, 30
                  divu         s6, s1, s2
                  slti         s7, a4, 1867
                  xor          a1, s4, a6
                  sltu         t2, s3, s7
                  or           s7, a0, s9
                  c.addi16sp   sp, -16
                  csrrs        zero, 0x340, a1
                  slli         s7, s3, 25
                  add          s11, t3, a6
                  c.and        a4, s0
                  c.and        a5, a4
                  c.andi       a3, -1
                  sltu         t5, a6, s8
                  c.xor        a4, a3
                  slli         t2, a1, 24
                  sub          s11, s3, ra
                  c.or         a5, s0
                  divu         s1, t6, t0
                  c.addi4spn   a3, sp, 944
                  csrrw        ra, 0x340, a6
                  c.add        s5, a6
                  c.lui        gp, 14
                  lui          t1, 1018182
                  mulhu        s7, s11, sp
                  slt          ra, s11, t2
                  slt          t0, s3, zero
                  c.sub        a4, a5
                  div          t4, a0, s7
                  slti         s11, t6, 1662
                  c.xor        a5, s1
                  csrrs        a1, 0x340, zero
                  auipc        ra, 456980
                  c.or         s1, a4
                  auipc        s8, 706523
                  c.li         a0, -1
                  csrrc        s5, 0x340, zero
                  xori         s11, s9, 1795
                  sltu         t1, s7, zero
                  mulhsu       sp, s4, s4
                  c.nop
                  c.add        s9, t0
                  c.addi16sp   sp, 128
                  rem          t5, a2, s1
                  sltu         s6, zero, a7
                  c.addi16sp   sp, 480
                  andi         s1, s0, -1868
                  sub          s2, a3, s6
                  c.nop
                  csrrwi       s9, 0x340, 11
                  c.mv         t0, t4
                  and          s8, t5, t0
                  c.srai       a1, 9
                  mulhu        s11, t4, s6
                  csrrc        a7, 0x340, zero
                  c.srai       s1, 1
                  divu         s8, a7, s10
                  c.lui        t4, 18
                  c.lui        a5, 24
                  xor          tp, s4, s4
                  c.addi4spn   a0, sp, 64
                  ori          a0, t0, 1216
                  remu         a1, a4, t6
                  c.xor        a4, a5
                  auipc        a4, 717773
                  mulhu        t6, t0, ra
                  c.lui        s8, 27
                  rem          t5, s10, s0
                  c.slli       ra, 9
                  c.and        a4, s1
                  andi         t5, ra, 385
                  c.add        tp, s0
                  auipc        t4, 956870
                  addi         a1, s3, -773
                  c.srai       s1, 7
                  or           t2, sp, s11
                  sub          a6, s11, a2
                  csrrw        s11, 0x340, s11
                  sltiu        a3, a1, 1050
                  srl          s5, a6, sp
                  div          s9, a3, a5
                  c.or         s1, a4
                  c.mv         sp, s1
                  slt          s8, t2, s11
                  c.nop
                  srl          a4, s7, gp
                  mulhu        t5, a5, tp
                  c.add        s5, t3
                  csrrsi       a6, 0x340, 9
                  nop
                  csrrc        t2, 0x340, zero
                  mul          a6, s2, s11
                  c.sub        s1, a3
                  srl          s2, a0, s0
                  auipc        s11, 716875
                  c.addi16sp   sp, -16
                  xor          s7, t2, gp
                  mul          a1, t6, t6
                  csrrw        s2, 0x340, sp
                  rem          t5, t2, s7
                  csrrc        a4, 0x340, zero
                  slti         s1, s11, -1645
                  c.addi       s11, 22
                  or           s8, a4, tp
                  lui          sp, 838616
                  c.nop
                  c.addi16sp   sp, -16
                  ori          a6, s1, -869
                  add          s3, a0, t2
                  csrrc        t2, 0x340, s2
                  sltiu        t4, t1, -1267
                  c.addi       s2, 26
                  srl          s4, s1, sp
                  srai         s4, s5, 8
                  mul          s1, sp, t3
                  c.xor        a4, a5
                  and          a3, a0, gp
                  divu         t2, s8, a7
                  csrrci       s4, 0x340, 0
                  c.mv         a0, a5
                  c.sub        a3, s0
                  auipc        s9, 172781
                  c.or         a5, a2
                  c.addi16sp   sp, 64
                  and          s8, s4, a4
                  addi         ra, t4, -836
                  c.andi       a1, -1
                  slti         t6, s8, -1267
                  c.lui        s10, 2
                  remu         s9, a6, a6
                  c.add        a1, s5
                  c.xor        a1, a0
                  c.srai       a1, 28
                  rem          s7, s4, s9
                  c.addi4spn   a4, sp, 640
                  andi         a3, a0, 919
                  c.srai       a3, 18
                  c.slli       ra, 6
                  lui          s5, 67493
                  sll          t1, s11, s6
                  c.or         a4, a5
                  c.addi4spn   a0, sp, 160
                  c.xor        a3, a2
                  mulh         s5, t1, gp
                  csrrw        t5, 0x340, t1
                  sra          a5, s0, s3
                  c.addi16sp   sp, -16
                  c.andi       a3, 22
                  sltiu        a4, t0, 1930
                  add          t6, a3, t6
                  xori         s6, s1, -615
                  c.add        t2, s0
                  c.addi4spn   a5, sp, 288
                  mulh         s10, t3, t3
                  nop
                  slt          s5, s4, s1
                  auipc        a3, 408928
                  nop
                  csrrw        tp, 0x340, a7
                  c.addi4spn   s1, sp, 672
                  csrrc        a7, 0x340, t1
                  mulhu        a3, s1, s8
                  c.mv         a5, t0
                  auipc        s4, 786877
                  csrrci       a0, 0x340, 0
                  sub          tp, a2, zero
                  c.addi16sp   sp, 48
                  csrrsi       s10, 0x340, 10
                  divu         s6, s7, s5
                  c.slli       s10, 17
                  remu         zero, s1, s8
                  c.li         a1, 6
                  c.and        a1, a4
                  csrrci       gp, 0x340, 11
                  c.or         a1, s1
                  csrrwi       t0, 0x340, 13
                  csrrc        s3, 0x340, t2
                  mulhsu       a6, a6, s3
                  add          sp, t1, s11
                  c.srai       a0, 24
                  c.andi       s1, -1
                  c.xor        a5, a3
                  and          a0, s1, sp
                  csrrc        s6, 0x340, s0
                  rem          s6, s2, a1
                  xor          sp, a1, s6
                  or           t4, t1, a2
                  auipc        tp, 968313
                  csrrci       s7, 0x340, 0
                  c.andi       a5, -1
                  andi         s8, t4, -57
                  csrrc        t1, 0x340, gp
                  c.addi16sp   sp, -16
                  ori          s4, gp, 677
                  or           t6, t0, tp
                  sra          s1, s9, s11
                  xori         a7, s8, 1567
                  c.addi16sp   sp, 112
                  csrrsi       t5, 0x340, 0
                  auipc        t4, 748023
                  remu         s7, t6, s4
                  c.addi16sp   sp, -16
                  mulhsu       a0, s2, gp
                  addi         s5, zero, 1577
                  c.srai       a0, 2
                  slli         s3, t4, 15
                  c.sub        a1, a5
                  nop
                  c.srli       a1, 9
                  csrrwi       s3, 0x340, 18
                  add          s6, s2, s8
                  c.xor        a0, a4
                  sll          s11, t6, a7
                  div          a5, a3, t1
                  c.sub        s1, a5
                  c.lui        tp, 6
                  srli         t2, gp, 23
                  remu         gp, s10, t5
                  xori         a3, s1, 939
                  csrrw        a4, 0x340, s6
                  srli         gp, a0, 16
                  csrrci       t5, 0x340, 10
                  sltiu        s8, ra, -1395
                  xori         t0, tp, -1411
                  div          t1, sp, a3
                  lui          s10, 763155
                  c.and        s1, s0
                  c.addi16sp   sp, -16
                  rem          s5, t6, a0
                  sll          s4, t5, a4
                  c.srli       a0, 21
                  slt          t0, a7, t1
                  c.addi       t0, -1
                  c.li         t6, 31
                  ori          zero, s3, -1723
                  c.or         a1, a2
                  srai         a4, s11, 17
                  xor          gp, a0, ra
                  srli         s2, s9, 3
                  sub          a5, a6, t6
                  c.li         s7, -1
                  mulhsu       a4, t0, t0
                  xor          a4, a5, s0
                  add          t5, tp, s11
                  c.addi4spn   a1, sp, 720
                  xori         s7, s11, -1747
                  c.and        a1, a5
                  csrrsi       t0, 0x340, 12
                  rem          s2, s11, s7
                  mulh         s11, t5, zero
                  csrrci       sp, 0x340, 0
                  c.andi       a5, 18
                  c.nop
                  slti         s6, t2, 197
                  auipc        t0, 981373
                  and          s2, s0, a6
                  slti         t4, ra, 1975
                  c.srai       s1, 31
                  div          a1, s10, s1
                  csrrsi       zero, 0x340, 0
                  andi         s6, s2, -1224
                  c.srai       a4, 12
                  sltu         a0, s5, s6
                  sltu         a7, s0, t0
                  c.srli       a4, 3
                  mulhu        ra, a1, a2
                  add          a5, s5, t2
                  c.addi       s4, 26
                  csrrw        a7, 0x340, s7
                  c.addi       s2, -1
                  csrrw        s10, 0x340, s1
                  c.mv         s5, t1
                  slti         s11, t2, -1944
                  csrrci       t4, 0x340, 0
                  or           t1, a4, t5
                  or           a0, ra, s2
                  c.mv         s1, t6
                  csrrsi       s6, 0x340, 25
                  sltiu        s5, s3, 887
                  c.sub        a4, a2
                  addi         a6, a3, 780
                  add          a4, s7, s9
                  c.addi       s3, 21
                  sub          s11, a6, a4
                  csrrci       s5, 0x340, 0
                  c.xor        a4, a0
                  c.srai       a0, 28
                  csrrsi       a5, 0x340, 0
                  div          s9, s5, a5
                  c.sub        s1, s0
                  c.xor        a3, a1
                  div          s5, s0, t0
                  csrrci       t6, 0x340, 0
                  c.addi4spn   a0, sp, 672
                  div          t5, a7, t2
                  andi         a6, t4, -1554
                  lui          a6, 464508
                  slt          sp, t0, t2
                  csrrc        a0, 0x340, s10
                  csrrci       t4, 0x340, 28
                  rem          a3, t3, s8
                  add          sp, s4, t1
                  c.srai       s1, 29
                  srai         sp, t3, 6
                  and          s9, s0, s9
                  csrrw        ra, 0x340, sp
                  mulhsu       s4, a7, s11
                  ori          gp, t5, -52
                  srl          t4, zero, s7
                  c.slli       t0, 17
                  xori         s4, t0, 533
                  srl          gp, s11, t4
                  lui          s11, 463300
                  sltiu        sp, t2, -1402
                  sltu         a0, s7, gp
                  csrrsi       t2, 0x340, 0
                  c.and        a3, a0
                  c.xor        a1, a0
                  addi         a0, s10, -2018
                  c.addi       gp, -1
                  slti         t2, s0, 147
                  and          t6, s7, t5
                  add          s8, s11, t0
                  lui          s10, 378709
                  ori          t6, sp, 896
                  div          a3, a1, s2
                  csrrci       a3, 0x340, 29
                  auipc        ra, 598379
                  csrrwi       s8, 0x340, 10
                  divu         tp, s4, s9
                  auipc        s10, 481316
                  sra          s6, a6, a4
                  slli         s3, s9, 18
                  and          t2, t1, s3
                  csrrwi       tp, 0x340, 25
                  c.srai       a4, 12
                  sra          s11, t3, s10
                  add          a5, a7, a7
                  sub          sp, s11, tp
                  c.nop
                  lui          s8, 781870
                  and          t2, a6, a5
                  xor          t1, s0, a3
                  sltu         a3, a3, s8
                  and          tp, s8, t2
                  csrrwi       t5, 0x340, 10
                  xor          a5, s9, s0
                  csrrw        t1, 0x340, t4
                  c.addi16sp   sp, -16
                  csrrc        s5, 0x340, zero
                  sub          s7, t6, s3
                  srli         t0, t2, 9
                  slti         sp, gp, 562
                  addi         s9, s4, 671
                  c.addi4spn   a0, sp, 992
                  sll          a5, s6, a7
                  mulhu        s7, tp, ra
                  ori          zero, s0, -666
                  srli         a4, a7, 7
                  c.mv         ra, t0
                  xori         a4, t4, -131
                  xori         a0, ra, 261
                  c.mv         s1, s11
                  add          s8, a6, s5
                  csrrw        zero, 0x340, s3
                  xori         s5, s10, 768
                  add          s2, t6, s6
                  csrrwi       s5, 0x340, 8
                  c.addi       s1, 14
                  mulhu        s10, s0, a1
                  srai         s4, s5, 14
                  c.srai       a5, 26
                  slti         t5, a7, 1989
                  divu         t6, t6, a0
                  sra          a7, t4, s7
                  nop
                  and          a5, t6, s7
                  c.lui        s6, 28
                  csrrwi       t0, 0x340, 15
                  slti         a0, s10, -545
                  c.addi16sp   sp, -16
                  sub          s5, t0, t3
                  srai         a3, a3, 28
                  add          ra, sp, a4
                  div          a5, sp, sp
                  csrrwi       ra, 0x340, 3
                  c.addi       tp, -1
                  lui          s9, 641716
                  srl          s5, a6, a0
                  or           a3, zero, s11
                  sra          t2, zero, gp
                  lui          t4, 502063
                  mulhsu       s9, ra, ra
                  andi         t6, sp, -1420
                  sltiu        t1, s0, 457
                  nop
                  slli         s2, t3, 30
                  srli         s4, s5, 4
                  or           t1, tp, t5
                  mulhu        t4, a5, zero
                  c.lui        a6, 16
                  andi         a3, s9, 450
                  sub          s9, a7, t3
                  c.andi       s1, 14
                  c.srli       a4, 5
                  mulhsu       tp, s6, s1
                  mulhu        s2, s10, a6
                  andi         a7, gp, -1403
                  c.li         s11, -1
                  mulh         t2, s8, s8
                  c.or         a3, s0
                  c.lui        s9, 10
                  csrrci       a3, 0x340, 0
                  mulh         s8, a0, t0
                  addi         t0, s4, -110
                  div          s6, a6, t3
                  c.xor        a1, a1
                  c.sub        a3, s0
                  csrrc        s9, 0x340, zero
                  c.and        a0, s0
                  csrrs        s3, 0x340, zero
                  addi         t1, t6, 1912
                  nop
                  sltu         s7, s4, a7
                  rem          gp, a1, s6
                  csrrwi       a6, 0x340, 24
                  xori         a0, gp, -1995
                  c.add        s7, a5
                  sltiu        s7, s9, 1704
                  c.or         a0, a2
                  slti         a7, s10, -1078
                  mulhu        t0, s2, t5
                  mulhu        s10, t4, t6
                  sub          t4, a0, gp
                  c.addi16sp   sp, 384
                  ori          a4, s4, -1512
                  c.addi       s9, 26
                  mulh         t5, t0, a5
                  srai         gp, a6, 4
                  mulhu        s5, a2, t3
                  srai         ra, t1, 28
                  ori          s5, gp, 1978
                  xor          s6, sp, zero
                  rem          s9, t5, a5
                  ori          a4, t5, 1064
                  mulhu        t6, gp, s6
                  csrrc        sp, 0x340, tp
                  csrrsi       t4, 0x340, 0
                  sll          s6, gp, a7
                  nop
                  c.addi       a1, -1
                  lui          t6, 1024207
                  c.slli       s6, 9
                  auipc        s3, 595610
                  c.srai       a0, 2
                  c.srai       a4, 11
                  sltu         s5, s7, s1
                  addi         s7, sp, -811
                  and          t6, a2, s7
                  c.or         a0, a4
                  xor          s5, a1, ra
                  c.slli       t5, 25
                  c.srai       s1, 23
                  mulhu        s2, s1, s7
                  or           ra, s4, ra
                  csrrc        gp, 0x340, zero
                  and          gp, s3, t6
                  slt          a5, t4, a4
                  c.and        a4, a2
                  sltiu        a6, a4, -1424
                  c.slli       a4, 30
                  srl          s9, t6, t3
                  and          s11, t4, s1
                  c.srli       a5, 23
                  sub          s6, s2, a2
                  mulh         a6, t4, t2
                  c.nop
                  lui          s10, 658947
                  mulhsu       zero, s1, a4
                  sltu         t0, s10, s11
                  addi         s4, s5, -868
                  slli         t2, s3, 30
                  div          zero, a5, a0
                  divu         s2, s5, s7
                  c.xor        a3, s1
                  and          t6, s4, s3
                  divu         tp, s0, tp
                  c.lui        t6, 2
                  sltu         t5, a7, a3
                  csrrci       t4, 0x340, 0
                  csrrwi       tp, 0x340, 18
                  c.addi       a4, -1
                  c.andi       a1, -1
                  c.li         a5, -1
                  c.addi4spn   a4, sp, 528
                  c.nop
                  csrrci       s6, 0x340, 22
                  c.add        gp, s2
                  sll          t4, a5, a3
                  c.add        t6, a1
                  csrrsi       s1, 0x340, 0
                  divu         t6, a4, s8
                  c.lui        a5, 3
                  remu         s4, s7, a6
                  srli         s9, a2, 30
                  slti         t1, a1, -74
                  csrrsi       gp, 0x340, 25
                  csrrs        s4, 0x340, zero
                  slt          s2, t5, s0
                  srl          s8, tp, s9
                  div          s11, s1, t4
                  c.nop
                  add          a5, a4, s1
                  srli         s10, s5, 4
                  ori          s9, a3, 1083
                  srl          t0, s10, t5
                  sub          t2, s5, s8
                  c.xor        a0, a5
                  csrrs        s8, 0x340, tp
                  slt          ra, t1, sp
                  ori          s4, a0, 1883
                  c.or         a0, s1
                  slli         a3, t3, 13
                  slli         t0, s0, 18
                  auipc        s8, 275343
                  sltiu        a6, t4, -1286
                  srai         a7, a3, 26
                  sub          a6, s2, s10
                  c.and        s1, a1
                  c.add        t4, a6
                  andi         s6, s2, 1783
                  andi         gp, gp, -2008
                  c.andi       a4, -1
                  c.addi       gp, -1
                  sll          s5, zero, a1
                  mulhu        sp, t3, s6
                  xori         s2, s0, 844
                  addi         t2, s11, -1562
                  c.srai       a3, 23
                  mulh         s2, a4, s9
                  slli         a1, s11, 0
                  slli         a1, s4, 29
                  c.andi       s1, -1
                  xor          tp, gp, s11
                  slt          sp, a4, s1
                  andi         a4, s2, -790
                  srai         a7, s11, 12
                  csrrwi       s5, 0x340, 2
                  remu         a1, a6, s6
                  add          a6, gp, t5
                  c.andi       a1, 11
                  csrrc        s5, 0x340, t5
                  sltiu        t4, ra, 201
                  nop
                  c.li         a1, -1
                  sltu         s8, a7, s0
                  sltiu        a3, t4, -1325
                  sra          s4, t1, s4
                  c.srli       a1, 16
                  and          s7, a1, s10
                  sub          a0, zero, t5
                  csrrsi       sp, 0x340, 5
                  sltiu        zero, s10, -527
                  srl          s1, tp, s8
                  mulh         a4, s1, s3
                  auipc        s3, 371784
                  c.li         tp, -1
                  c.and        a1, a4
                  remu         s1, t0, gp
                  c.add        t5, a6
                  srai         s9, a7, 27
                  add          s1, s5, s7
                  remu         s10, t4, t2
                  c.or         a1, a5
                  remu         sp, a3, s4
                  csrrw        s3, 0x340, s6
                  mulhu        a7, a1, tp
                  srai         t6, t6, 11
                  ori          s10, s6, 1976
                  sll          a5, zero, s8
                  c.addi4spn   a3, sp, 352
                  and          ra, s6, s2
                  slti         s10, a7, -1880
                  mulhsu       s8, s9, sp
                  srli         s10, s5, 31
                  c.addi16sp   sp, -16
                  slt          a7, s6, a6
                  c.srai       a5, 1
                  slt          zero, t3, s4
                  c.lui        a1, 22
                  c.or         a3, s0
                  divu         s8, a5, s6
                  or           s10, t4, s9
                  srl          a1, s2, a1
                  nop
                  slli         t4, s4, 1
                  nop
                  addi         sp, zero, -474
                  c.addi       tp, 29
                  slli         s2, s0, 27
                  c.addi4spn   a0, sp, 944
                  csrrs        s5, 0x340, ra
                  c.nop
                  c.addi       t1, 28
                  andi         t5, s8, 968
                  c.li         sp, 20
                  mulhu        s2, s5, a2
                  sub          t6, t5, tp
                  auipc        a6, 358402
                  xori         t5, s9, -1432
                  ori          s8, t6, 1825
                  csrrc        a7, 0x340, zero
                  add          s5, s8, a5
                  slli         a1, s7, 6
                  c.and        s1, a1
                  slt          s5, s10, s5
                  ori          a7, zero, 1592
                  slti         s5, t1, -1060
                  mulhsu       a7, a7, t1
                  c.srai       a4, 4
                  sra          ra, zero, zero
                  add          t2, s0, s7
                  andi         s9, t6, 353
                  c.srli       a1, 10
                  auipc        t1, 1042096
                  c.nop
                  ori          a4, a1, -206
                  auipc        s2, 560086
                  csrrc        ra, 0x340, zero
                  xori         sp, t3, -1129
                  sll          t0, s4, a6
                  sub          gp, a1, s7
                  sra          a4, tp, s2
                  c.sub        a0, s0
                  c.lui        s6, 29
                  mul          s6, a0, a7
                  c.or         a4, s0
                  slli         t6, a2, 19
                  csrrci       s2, 0x340, 0
                  csrrci       a1, 0x340, 0
                  lui          a7, 702572
                  c.nop
                  xori         a5, s5, -422
                  srai         t4, a6, 24
                  mul          zero, s5, s3
                  slti         t2, t5, -1841
                  c.addi4spn   a1, sp, 688
                  c.sub        a0, a4
                  csrrs        a0, 0x340, a2
                  csrrs        s8, 0x340, s0
                  add          t0, s1, t4
                  c.sub        a0, s0
                  mul          s4, s6, s7
                  mul          t1, t6, gp
                  slli         s8, s10, 18
                  and          tp, a2, s1
                  addi         s1, a4, -1821
                  rem          a4, tp, a6
                  andi         s9, a5, 1068
                  div          s5, s8, ra
                  and          s7, a0, s2
                  sltiu        gp, tp, -1696
                  c.nop
                  c.xor        a4, a1
                  srli         s9, s8, 2
                  csrrsi       tp, 0x340, 22
                  auipc        s1, 419377
                  div          s5, s11, t4
                  auipc        a0, 832759
                  slt          a6, a5, t2
                  csrrsi       s6, 0x340, 0
                  or           t2, s0, a4
                  slti         ra, sp, -257
                  mulhu        t1, a6, a2
                  c.addi       s3, -1
                  slli         tp, s6, 15
                  srli         a4, s7, 31
                  ori          a7, tp, 362
                  c.lui        s8, 27
                  ori          zero, s10, -1547
                  c.andi       a4, 11
                  div          t4, s7, a5
                  nop
                  slt          t2, ra, t1
                  c.lui        s3, 19
                  c.addi       s4, 23
                  rem          s9, a4, s8
                  nop
                  c.or         a1, a4
                  addi         s10, t0, -1954
                  c.srli       s1, 13
                  divu         s1, a5, zero
                  csrrw        gp, 0x340, a1
                  srai         s8, s10, 16
                  c.lui        t2, 13
                  c.lui        s11, 18
                  c.addi       t4, -1
                  mulhu        t0, sp, gp
                  mul          sp, s10, s4
                  nop
                  mulhsu       s11, s11, ra
                  sll          a3, t1, a3
                  c.add        t0, s5
                  c.addi       s6, -1
                  c.srli       a5, 6
                  csrrc        t5, 0x340, zero
                  add          gp, t5, a2
                  sll          s2, a7, a7
                  c.nop
                  remu         a5, a6, a3
                  c.and        a4, a2
                  divu         s11, s9, tp
                  xor          sp, s4, s8
                  and          s3, t5, s10
                  c.andi       a3, 23
                  xori         s5, s1, -1164
                  lui          s3, 441495
                  c.nop
                  c.andi       a1, 2
                  csrrci       s1, 0x340, 20
                  sll          t4, t2, a6
                  c.or         a5, a5
                  srai         t1, sp, 15
                  sra          a3, s5, zero
                  add          zero, s8, s2
                  c.add        t0, t4
                  c.nop
                  andi         t4, t3, -1021
                  slli         a6, s6, 21
                  or           t1, s3, t0
                  mulhsu       zero, a2, a5
                  and          s10, t4, a6
                  c.xor        s1, a2
                  c.li         a0, 19
                  sltu         zero, s2, s0
                  slt          ra, t2, zero
                  nop
                  c.add        a6, tp
                  csrrci       gp, 0x340, 15
                  c.mv         s1, t0
                  sltu         a3, s4, s8
                  sltiu        s11, s5, -1600
                  c.lui        a6, 15
                  c.lui        s11, 24
                  lui          t4, 319717
                  or           t2, t1, s4
                  csrrs        s5, 0x340, s7
                  c.xor        s1, a1
                  addi         a4, s8, -1654
                  c.srli       a3, 13
                  csrrwi       s8, 0x340, 30
                  andi         a4, t6, -522
                  c.srai       a4, 5
                  c.srli       a4, 11
                  c.lui        a6, 28
                  mulhu        s8, t6, s10
                  mulhu        a0, a6, a7
                  mulh         t5, a0, t1
                  sub          s7, t4, t0
                  mulhsu       ra, ra, s5
                  c.and        a3, a4
                  c.addi16sp   sp, -16
                  c.and        s1, a1
                  xor          a0, t0, t3
                  c.srai       a0, 20
                  csrrs        ra, 0x340, zero
                  srl          a0, a7, s9
                  srl          a5, a3, s4
                  xori         a6, s11, 47
                  c.or         s1, a2
                  csrrs        a7, 0x340, a1
                  ori          s3, s5, -1989
                  auipc        s8, 265462
                  srai         a5, a7, 26
                  csrrw        s8, 0x340, s8
                  c.sub        a1, s1
                  csrrsi       tp, 0x340, 28
                  c.andi       a1, -1
                  c.nop
                  rem          a7, s6, tp
                  addi         s4, sp, 1813
                  xori         a7, a2, 1092
                  div          s1, s2, s9
                  c.or         a1, a2
                  nop
                  c.andi       a4, 23
                  c.and        a5, s0
                  csrrci       t2, 0x340, 0
                  andi         s8, a6, 457
                  c.addi16sp   sp, 288
                  c.srli       a0, 1
                  xor          s1, s1, a3
                  mulhu        s7, a1, ra
                  c.srli       a4, 29
                  xor          a3, tp, a1
                  ori          s5, s11, -1898
                  or           s6, s0, zero
                  c.or         a4, a5
                  div          t2, a5, s3
                  csrrsi       s5, 0x340, 0
                  add          a6, t4, t0
                  c.nop
                  csrrw        a5, 0x340, sp
                  xor          s1, t1, s7
                  sltiu        a1, a7, 1365
                  sub          tp, a2, s3
                  c.li         a7, -1
                  remu         s6, s10, ra
                  div          a0, sp, s6
                  csrrsi       s5, 0x340, 0
                  ori          a5, s2, -1385
                  sltiu        a1, t4, 1550
                  sltiu        s5, s10, 534
                  c.add        t0, tp
                  sll          a4, t2, s8
                  c.addi4spn   a0, sp, 272
                  c.xor        a3, s1
                  c.andi       a3, 19
                  srai         s8, t6, 13
                  c.andi       a0, -1
                  csrrc        t0, 0x340, zero
                  ori          t0, zero, -981
                  sub          a1, s11, s8
                  c.slli       a6, 31
                  c.addi       s4, 2
                  c.li         a7, -1
                  c.and        a3, a5
                  csrrwi       s2, 0x340, 26
                  mulh         s9, t1, s2
                  csrrsi       s4, 0x340, 0
                  andi         s2, s10, -349
                  srl          a7, s1, a0
                  xori         s6, tp, 331
                  sll          s6, a5, a7
                  c.add        t4, t3
                  c.andi       a3, -1
                  mulhsu       gp, ra, s0
                  lui          gp, 360992
                  lui          t5, 273908
                  sll          s3, t5, a0
                  c.mv         t5, s6
                  srai         a5, t6, 14
                  csrrsi       tp, 0x340, 0
                  c.add        s1, a1
                  c.li         s8, -1
                  c.addi4spn   s1, sp, 208
                  mulh         s1, a2, sp
                  xor          t5, t4, a5
                  c.xor        a4, a1
                  c.sub        a4, a0
                  c.srli       a4, 13
                  c.andi       a4, -1
                  mulhu        a3, a0, s11
                  c.slli       t6, 18
                  mulhsu       s10, a1, a6
                  addi         t5, a1, 251
                  c.sub        a1, a0
                  mulh         t0, t5, s8
                  mul          a0, a1, sp
                  csrrs        a7, 0x340, a0
                  c.lui        t5, 16
                  and          tp, t0, s7
                  c.lui        t2, 16
                  srli         a7, s11, 23
                  slti         a1, a7, 1011
                  slt          tp, t4, zero
                  c.slli       s7, 24
                  csrrwi       s2, 0x340, 20
                  c.add        ra, ra
                  andi         t4, s1, 987
                  xor          t5, s11, s4
                  sltu         s8, sp, s11
                  c.srli       a3, 26
                  sltiu        t1, s2, 1798
                  xor          t5, s9, s11
                  sltu         s11, s2, t3
                  c.andi       a5, -1
                  c.srli       a0, 19
                  srl          s8, s9, a7
                  ori          t4, a5, 1248
                  c.or         a4, a2
                  slt          s6, t2, s7
                  rem          s7, t0, a7
                  srl          sp, a0, s8
                  mulh         a0, t6, s0
                  csrrc        gp, 0x340, zero
                  remu         t1, s5, s3
                  auipc        zero, 550881
                  slli         a7, s10, 24
                  addi         a7, t6, 1160
                  slli         a6, s5, 31
                  mulhsu       s6, s11, a7
                  xori         t4, s10, -2005
                  srai         tp, t4, 14
                  c.slli       s6, 21
                  divu         s11, s3, s8
                  sltu         a0, s5, a4
                  remu         t2, t2, t4
                  csrrsi       t0, 0x340, 0
                  srli         t4, t1, 8
                  csrrc        s3, 0x340, t1
                  csrrc        s2, 0x340, s11
                  xor          tp, s2, t0
                  c.nop
                  xor          a7, a1, ra
                  c.nop
                  c.slli       s11, 18
                  and          tp, s3, t4
                  c.li         sp, -1
                  c.lui        s6, 21
                  c.xor        a4, a3
                  auipc        a1, 919514
                  div          a1, a4, a3
                  mulh         s8, s10, t3
                  csrrci       s7, 0x340, 1
                  auipc        s2, 47743
                  sltu         gp, a1, t2
                  csrrsi       t0, 0x340, 0
                  c.andi       s1, -1
                  andi         a4, a7, -1229
                  or           zero, s8, gp
                  c.mv         a1, s2
                  andi         a4, a1, -1962
                  c.mv         s5, s3
                  c.add        a7, a4
                  sub          t4, t0, t6
                  mulhu        s9, s4, s9
                  csrrc        sp, 0x340, t2
                  auipc        sp, 729193
                  sltu         t0, s6, a5
                  sll          s8, t3, t1
                  mul          a5, ra, a0
                  sltiu        a4, t1, -776
                  andi         zero, a5, 1810
                  sltu         t6, s5, s7
                  c.srli       a0, 12
                  sltiu        a7, s11, 847
                  c.mv         sp, s10
                  c.andi       a0, 21
                  srai         s4, s5, 26
                  c.addi16sp   sp, 416
                  c.andi       a1, -1
                  add          a0, a2, s7
                  xori         t6, t3, -201
                  c.slli       a1, 3
                  nop
                  slt          a6, a6, a4
                  xori         a4, t5, -334
                  csrrs        gp, 0x340, zero
                  csrrci       t1, 0x340, 31
                  xori         ra, s4, -662
                  csrrw        a6, 0x340, a0
                  c.slli       t0, 29
                  c.mv         s4, t4
                  c.mv         tp, s10
                  sub          a5, s9, t4
                  and          s9, s2, s4
                  sltu         a6, t5, s10
                  ori          t2, a2, -339
                  div          ra, zero, a5
                  and          sp, t5, a7
                  sra          s11, zero, s2
                  sll          a1, s4, a0
                  csrrw        a7, 0x340, zero
                  c.lui        s6, 2
                  c.srai       a5, 5
                  xor          s2, s0, t4
                  c.mv         s10, s8
                  lui          t6, 946750
                  srli         s11, s9, 19
                  lui          a1, 934612
                  mul          s11, s7, s1
                  c.addi4spn   a1, sp, 448
                  c.and        a1, a3
                  mul          a5, s5, s6
                  addi         t4, zero, -2021
                  csrrs        t6, 0x340, zero
                  csrrci       t5, 0x340, 0
                  csrrc        t2, 0x340, zero
                  xori         t4, s1, 643
                  c.slli       t4, 7
                  sra          s4, sp, a7
                  slt          a7, s8, s5
                  c.addi4spn   a3, sp, 320
                  c.lui        a0, 23
                  srli         zero, s9, 29
                  c.srai       a5, 24
                  andi         a6, s0, 491
                  sltiu        a1, s9, 1214
                  c.and        a5, a2
                  csrrwi       s2, 0x340, 23
                  csrrsi       s3, 0x340, 0
                  c.add        a3, ra
                  c.xor        s1, s0
                  c.srai       a4, 15
                  c.addi4spn   a0, sp, 96
                  c.addi16sp   sp, 448
                  sltu         s9, gp, s3
                  c.addi16sp   sp, 400
                  xori         t5, t4, 132
                  mulhu        gp, gp, s11
                  ori          tp, t6, 1216
                  auipc        s9, 560682
                  divu         s6, sp, a2
                  csrrci       a6, 0x340, 12
                  rem          a5, a1, s7
                  lui          a5, 712148
                  c.nop
                  sltiu        s10, zero, 528
                  divu         t0, a2, s3
                  csrrw        sp, 0x340, a6
                  sub          s2, s9, a7
                  slli         s9, s2, 10
                  mulh         s2, ra, s1
                  mulhu        a7, t0, s8
                  c.addi4spn   s1, sp, 800
                  c.add        ra, t1
                  c.li         a7, 18
                  or           t2, s11, s1
                  sub          s1, t0, t0
                  c.and        s1, a5
                  and          sp, t0, a5
                  c.srai       a1, 8
                  sll          t0, s3, t1
                  csrrs        s6, 0x340, s3
                  rem          a0, s1, s2
                  c.and        a3, a5
                  slti         s5, t6, 1862
                  c.add        s1, ra
                  rem          t6, a0, a7
                  sub          s2, t0, tp
                  c.sub        s1, s1
                  and          s11, zero, gp
                  or           ra, a3, t0
                  sra          s1, t4, zero
                  c.add        a7, t4
                  c.addi       s5, -1
                  or           t4, s0, sp
                  slt          ra, a5, t5
                  csrrw        s6, 0x340, s5
                  srai         t4, s4, 7
                  c.add        s4, s8
                  slt          tp, a5, s4
                  csrrsi       t4, 0x340, 0
                  remu         t2, s8, a5
                  sub          a5, s3, s9
                  mulhu        a3, a7, s3
                  sra          s6, a0, t5
                  srli         ra, a1, 27
                  c.xor        s1, a0
                  c.srli       a5, 5
                  c.sub        a3, a0
                  sub          ra, t6, t6
                  sub          t2, tp, sp
                  slti         a6, gp, 496
                  slt          s2, a1, s10
                  addi         t5, s8, 932
                  div          a6, a1, sp
                  mulhsu       s2, t4, zero
                  sub          s1, t0, t6
                  c.and        a4, s1
                  slli         a5, a5, 14
                  and          s1, s4, s1
                  mulh         s9, s9, t6
                  sltu         gp, a1, t3
                  mul          s6, t2, t2
                  c.addi       t2, -1
                  c.add        sp, sp
                  divu         s11, s0, zero
                  c.srli       s1, 10
                  nop
                  c.or         a5, s0
                  srl          t0, a3, t0
                  auipc        ra, 12732
                  remu         s7, s2, s8
                  mulh         s6, a6, a3
                  addi         tp, a7, 1295
                  or           t4, ra, s6
                  mulhsu       a1, s0, s6
                  and          s7, zero, gp
                  srl          a5, s8, s6
                  c.srli       a0, 23
                  addi         a7, s8, -1673
                  mulh         s5, t5, s6
                  ori          t1, ra, 1961
                  c.mv         a7, a6
                  c.srli       a5, 8
                  c.mv         a0, s10
                  mulhsu       s11, s11, a4
                  xori         s11, a3, 1785
                  csrrwi       s11, 0x340, 11
                  c.addi16sp   sp, -16
                  c.nop
                  mulhu        a4, t0, s2
                  c.add        s8, t0
                  slt          a0, t0, t4
                  slt          a7, a3, t1
                  c.andi       a1, -1
                  c.mv         s1, t2
                  c.mv         a1, t3
                  csrrs        s7, 0x340, zero
                  c.sub        a0, a2
                  mulhsu       a3, s1, gp
                  slli         s2, t2, 8
                  c.lui        s1, 22
                  srl          t1, t4, zero
                  div          a1, t4, s3
                  slli         s9, a4, 30
                  slli         t2, t5, 8
                  rem          ra, a7, t3
                  add          s11, s0, a4
                  sltu         gp, s8, a7
                  mulhu        a7, s9, s2
                  srai         s7, s10, 10
                  mul          a7, s8, t4
                  lui          s8, 954214
                  sll          a6, s8, t4
                  nop
                  and          a6, s8, a1
                  and          s10, t0, t0
                  lui          a7, 904582
                  c.sub        a5, a4
                  andi         a6, zero, -172
                  divu         a6, s10, t3
                  andi         a6, s6, -1361
                  and          s11, a1, sp
                  slt          a6, gp, gp
                  sll          t0, s11, a5
                  or           s7, s7, a4
                  c.li         t2, 11
                  mulhu        s6, sp, ra
                  mulhu        t5, t3, t0
                  c.li         s5, -1
                  c.nop
                  srli         t4, s10, 20
                  c.lui        a7, 7
                  csrrsi       s4, 0x340, 22
                  srl          s7, s8, s9
                  c.mv         sp, t4
                  c.slli       a1, 22
                  c.slli       s1, 26
                  srl          s7, s3, zero
                  ori          t0, a4, -1143
                  c.srai       a1, 20
                  c.andi       a3, 28
                  c.srai       a3, 29
                  csrrw        zero, 0x340, s9
                  c.addi4spn   a0, sp, 32
                  c.srli       a4, 16
                  sll          tp, a4, s2
                  c.and        a4, a1
                  mul          s8, zero, s3
                  csrrs        s9, 0x340, s6
                  sra          a5, sp, a3
                  c.sub        a4, a4
                  csrrs        a7, 0x340, s10
                  sub          ra, t5, s8
                  srl          tp, a5, s5
                  xori         s1, s2, -883
                  ori          s8, gp, -1749
                  c.addi       t5, -1
                  or           sp, s7, s6
                  mul          s7, s7, a4
                  c.lui        s8, 16
                  div          sp, a5, s2
                  csrrci       t6, 0x340, 0
                  c.slli       t0, 20
                  slt          t0, a4, t3
                  csrrw        s3, 0x340, s2
                  lui          t2, 194335
                  c.add        s10, a5
                  srai         s1, a3, 7
                  c.andi       a3, 31
                  sltiu        s11, a3, 564
                  mul          s1, a4, gp
                  slti         s11, s7, -1330
                  csrrw        a5, 0x340, a4
                  mul          a5, zero, t5
                  and          s4, t2, a7
                  csrrs        s11, 0x340, t5
                  csrrsi       s3, 0x340, 0
                  c.addi4spn   a3, sp, 944
                  sll          t2, s9, s0
                  c.mv         a1, t0
                  mulh         t4, s11, t6
                  mulhu        a4, s2, s3
                  c.srai       a5, 30
                  andi         t1, tp, 675
                  c.andi       a0, 13
                  c.and        a0, a1
                  and          a3, s11, s3
                  mulh         s11, a5, sp
                  mulhsu       a5, t2, s11
                  c.srai       s1, 4
                  slt          s11, t2, a6
                  and          t1, a6, gp
                  csrrsi       t6, 0x340, 8
                  and          s1, s6, s7
                  c.slli       s4, 1
                  slli         a7, a5, 15
                  c.srai       s1, 21
                  csrrwi       a3, 0x340, 27
                  c.add        gp, tp
                  c.li         s5, 12
                  csrrw        gp, 0x340, t1
                  c.or         a1, a1
                  csrrs        s8, 0x340, s3
                  c.addi       s11, 1
                  c.or         a4, s0
                  addi         t5, s5, 737
                  c.or         a4, a0
                  c.addi4spn   a4, sp, 96
                  rem          a3, a6, t4
                  c.sub        a0, a5
                  c.addi4spn   a1, sp, 128
                  c.li         s5, -1
                  sll          s3, ra, s11
                  c.li         sp, -1
                  c.andi       a1, -1
                  c.andi       s1, -1
                  c.xor        a0, a3
                  addi         s6, gp, 1441
                  sra          s1, t2, a3
                  c.nop
                  xori         s4, a2, 661
                  csrrwi       a4, 0x340, 8
                  nop
                  nop
                  sub          tp, ra, t0
                  c.lui        a4, 28
                  c.add        tp, a2
                  c.lui        t6, 2
                  and          s7, gp, s8
                  c.slli       s5, 16
                  div          tp, t0, ra
                  nop
                  c.lui        s11, 26
                  sltiu        gp, sp, 958
                  sltu         a6, a1, zero
                  xor          gp, t4, a7
                  csrrci       s10, 0x340, 0
                  mulh         s4, t0, s5
                  c.srli       a1, 4
                  srl          s9, s8, s5
                  divu         t5, a4, t6
                  c.and        a0, a1
                  slli         zero, s8, 19
                  xor          s3, t6, s4
                  auipc        a6, 151534
                  c.slli       t5, 17
                  srl          s5, s11, t1
                  sltu         a0, a6, s5
                  c.xor        a5, a2
                  mulhsu       s7, s8, s9
                  csrrs        s7, 0x340, zero
                  xor          s2, t3, gp
                  rem          t1, s7, a0
                  lui          s8, 918376
                  nop
                  div          s9, s9, s11
                  slli         t0, s11, 24
                  srl          gp, t4, s6
                  slt          s4, t6, sp
                  div          a0, ra, s0
                  slti         s9, t1, 1608
                  div          s1, a1, a5
                  c.nop
                  c.lui        t6, 15
                  rem          s3, a4, a5
                  c.addi16sp   sp, -16
                  srl          s5, t0, s8
                  ori          sp, t6, 1374
                  slti         s3, a1, 668
                  xor          sp, a4, t5
                  div          ra, s9, t0
                  csrrsi       a4, 0x340, 23
                  srl          s9, a5, t6
                  c.li         gp, -1
                  divu         s3, t4, a0
                  xori         s6, a1, -274
                  xor          gp, a3, s3
                  c.nop
                  sra          ra, s0, s2
                  csrrwi       a0, 0x340, 8
                  div          s5, t2, s5
                  c.xor        a4, a4
                  csrrwi       s9, 0x340, 8
                  csrrc        t0, 0x340, zero
                  csrrci       a3, 0x340, 0
                  csrrsi       s8, 0x340, 0
                  and          t6, s1, a2
                  slti         s7, s6, -651
                  csrrs        t1, 0x340, zero
                  c.mv         a7, a1
                  ori          s3, s5, 1201
                  c.addi4spn   a3, sp, 848
                  c.srli       a4, 21
                  csrrsi       sp, 0x340, 8
                  c.xor        a3, a1
                  slti         s11, t6, 1053
                  add          s8, a0, t1
                  c.slli       tp, 8
                  c.or         a4, a4
                  c.srli       a4, 27
                  c.andi       a5, -1
                  andi         gp, s4, 1038
                  c.srli       a3, 23
                  csrrsi       s9, 0x340, 0
                  c.add        sp, a6
                  xori         a3, t1, 1911
                  slli         gp, a2, 17
                  sra          a7, a6, t0
                  csrrwi       s8, 0x340, 10
                  xori         s11, s1, 715
                  sub          a5, a4, t2
                  c.addi       sp, 30
                  srl          a6, s11, s4
                  c.srai       a0, 30
                  sra          t4, t5, s1
                  div          t4, a0, s4
                  addi         t4, s4, 1395
                  slti         a1, zero, -457
                  c.addi16sp   sp, 496
                  c.addi16sp   sp, -16
                  sll          a4, t3, a6
                  c.andi       a0, -1
                  c.li         t1, 8
                  xor          a1, s11, s5
                  c.and        s1, s1
                  sra          s11, a2, s0
                  c.addi16sp   sp, 496
                  c.xor        a0, a4
                  mulhsu       t6, s7, zero
                  mulh         a4, s0, s4
                  c.nop
                  csrrci       tp, 0x340, 0
                  and          s11, a0, s0
                  add          t4, t2, a1
                  c.sub        s1, a1
                  csrrs        t5, 0x340, t2
                  xori         t2, t3, 764
                  c.li         t4, 4
                  csrrwi       t5, 0x340, 24
                  sra          ra, t3, a7
                  c.nop
                  c.addi16sp   sp, -16
                  srl          s4, t2, a0
                  c.lui        t0, 15
                  andi         s7, s9, 837
                  csrrci       s3, 0x340, 10
                  c.slli       a6, 13
                  c.srli       a3, 11
                  ori          a7, s0, 1862
                  csrrc        t0, 0x340, t4
                  c.and        a0, a3
                  xori         tp, gp, -38
                  remu         a6, a0, t3
                  auipc        t1, 691168
                  ori          sp, s10, -1582
                  lui          a5, 395029
                  addi         s7, a0, -684
                  csrrwi       t0, 0x340, 17
                  or           a3, s8, a2
                  csrrwi       t0, 0x340, 21
                  c.or         a1, s1
                  csrrw        gp, 0x340, s7
                  c.andi       a3, 31
                  addi         a4, a5, -1707
                  csrrc        gp, 0x340, t0
                  ori          a5, t3, -1261
                  sltiu        t1, zero, -971
                  c.and        s1, a1
                  c.sub        a5, a3
                  c.and        s1, a0
                  csrrw        t6, 0x340, s7
                  csrrw        ra, 0x340, s1
                  c.mv         t5, tp
                  c.li         a6, -1
                  sltiu        s10, a5, -1815
                  c.sub        s1, a3
                  c.srli       a4, 18
                  mul          t2, t6, a5
                  sra          a4, s4, t2
                  c.or         a1, a4
                  xor          ra, s8, a3
                  sub          a7, s10, t2
                  csrrwi       sp, 0x340, 4
                  ori          gp, s5, 1266
                  c.lui        t4, 22
                  or           a7, s10, a5
                  add          a5, t4, s1
                  sltu         s8, t3, a7
                  mulhu        t2, a7, a4
                  c.lui        s7, 29
                  remu         a0, zero, zero
                  sra          s8, s3, sp
                  c.add        s9, tp
                  c.srai       a4, 3
                  slti         zero, a1, 905
                  mulhu        a1, t5, zero
                  slli         zero, s6, 17
                  csrrwi       ra, 0x340, 20
                  addi         a5, t2, -360
                  div          a1, ra, a2
                  mulh         s5, s4, t0
                  c.nop
                  addi         a7, s5, 756
                  csrrsi       s6, 0x340, 19
                  c.nop
                  div          a3, a4, t5
                  sra          s4, a7, t6
                  csrrci       a4, 0x340, 10
                  andi         a7, sp, 490
                  srl          a3, s1, s10
                  rem          a5, s9, s11
                  c.mv         t1, a3
                  c.addi4spn   a3, sp, 32
                  ori          zero, a4, -1518
                  sltu         tp, s7, t6
                  csrrc        s2, 0x340, zero
                  sra          t6, a2, t6
                  mulhsu       s11, gp, a7
                  addi         s5, s3, -176
                  nop
                  c.slli       s8, 31
                  srli         t5, s3, 21
                  and          t4, a1, s10
                  divu         t5, t3, a4
                  csrrw        a5, 0x340, a0
                  c.add        t6, a1
                  divu         t0, a3, a3
                  c.li         a0, -1
                  div          t2, s9, t1
                  rem          s11, a1, s4
                  c.slli       s4, 28
                  c.addi       a6, 16
                  srai         sp, t5, 19
                  andi         s3, t0, 1945
                  c.slli       a4, 20
                  c.addi16sp   sp, 496
                  c.nop
                  sll          s7, a6, s9
                  div          gp, s6, a5
                  andi         s4, s1, 888
                  remu         t0, s5, t3
                  csrrw        s8, 0x340, s7
                  c.srai       a0, 14
                  slli         s4, s8, 5
                  c.sub        a0, a1
                  divu         a5, a3, s8
                  c.srai       a3, 9
                  c.and        a0, a1
                  sltu         t4, tp, a2
                  csrrwi       t4, 0x340, 22
                  sltiu        a5, t4, -1317
                  csrrc        a3, 0x340, s7
                  c.addi16sp   sp, -16
                  andi         s10, s4, 1720
                  xori         t2, a1, 543
                  c.addi       t4, 16
                  andi         t6, s0, -1312
                  c.slli       a6, 4
                  c.sub        s1, a4
                  csrrs        s4, 0x340, t6
                  csrrw        s11, 0x340, s9
                  divu         sp, gp, s3
                  srl          a4, t1, t2
                  slti         s6, tp, 633
                  c.lui        a5, 27
                  remu         a1, s9, s11
                  mulhu        ra, s10, t5
                  and          t2, s2, gp
                  slti         s7, s1, -1313
                  c.andi       a4, 12
                  sltu         s3, t4, a0
                  c.addi16sp   sp, 272
                  c.li         s2, -1
                  c.addi       s11, -1
                  srli         a7, s5, 18
                  remu         a3, s9, s11
                  c.nop
                  xori         a6, a1, -1546
                  slti         s8, a0, 1242
                  mulhsu       gp, t1, a2
                  c.srli       a0, 9
                  mulhu        tp, a6, a1
                  ori          a5, s10, 630
                  ori          s7, ra, -1693
                  div          t2, zero, s7
                  and          a6, t5, a5
                  div          tp, s3, t4
                  csrrc        zero, 0x340, zero
                  sra          t6, ra, a7
                  divu         zero, s7, s6
                  sub          a7, t6, a1
                  csrrsi       a4, 0x340, 0
                  c.or         a5, a4
                  add          t4, tp, s6
                  mulhu        t6, a6, t2
                  sltu         tp, a5, t4
                  c.mv         s11, s3
                  addi         tp, a0, -1970
                  c.sub        s1, a2
                  srai         tp, s4, 16
                  csrrwi       s6, 0x340, 15
                  andi         s10, s0, 1732
                  csrrw        a4, 0x340, sp
                  c.mv         a0, tp
                  csrrc        zero, 0x340, s2
                  csrrw        s2, 0x340, s6
                  c.xor        s1, a0
                  sltu         gp, s5, a1
                  divu         a1, a5, s6
                  slti         t6, t6, 1355
                  sub          tp, s3, s7
                  c.slli       a6, 30
                  c.xor        a0, a0
                  lui          s11, 583800
                  c.or         a4, a3
                  xori         t6, s0, -1080
                  c.slli       ra, 16
                  mulhsu       gp, s0, a0
                  slt          t2, s3, t1
                  c.mv         a1, a5
                  c.xor        a0, a4
                  c.li         tp, -1
                  divu         s3, s7, a7
                  c.srli       a4, 18
                  c.and        a1, a3
                  c.and        a1, a5
                  xori         s5, a1, -1114
                  c.xor        a3, a1
                  lui          a0, 225943
                  c.li         gp, 25
                  c.xor        a0, a2
                  csrrs        tp, 0x340, s4
                  mulhu        a1, s0, t6
                  c.nop
                  auipc        s6, 656826
                  c.lui        t1, 25
                  and          a6, s5, tp
                  nop
                  and          t2, s9, s1
                  ori          t2, s11, -125
                  c.addi4spn   a0, sp, 224
                  c.nop
                  csrrc        s4, 0x340, tp
                  remu         t4, t5, a7
                  c.add        a6, s11
                  c.slli       s2, 9
                  c.or         a3, a1
                  csrrsi       t0, 0x340, 0
                  srl          s8, t0, sp
                  lui          s10, 645274
                  csrrwi       t4, 0x340, 25
                  srl          a4, t3, s5
                  c.mv         t6, a1
                  mulhu        a1, s1, t2
                  c.li         t2, -1
                  andi         t5, s0, -1138
                  c.srli       a0, 26
                  c.addi       t2, -1
                  csrrs        sp, 0x340, zero
                  sll          s3, s7, s7
                  divu         s5, s3, a4
                  c.mv         t2, s1
                  mulhu        s7, s2, a0
                  srl          a7, a2, gp
                  mulh         s1, s10, t4
                  xori         s8, a5, -550
                  remu         gp, s4, tp
                  sltiu        zero, a5, 40
                  c.li         t6, -1
                  slli         gp, a2, 26
                  c.addi       a1, 26
                  or           gp, s4, s8
                  addi         a4, a5, 1407
                  sll          s7, t0, t0
                  srai         a3, t5, 4
                  c.nop
                  xor          a4, a0, a4
                  slt          t0, tp, t4
                  srai         t4, a0, 18
                  csrrc        tp, 0x340, s5
                  add          s9, t2, s6
                  mulhsu       a7, t1, t0
                  srli         s9, gp, 4
                  andi         t5, s1, 67
                  or           a5, s7, s0
                  mulh         t0, s11, gp
                  c.nop
                  csrrw        a4, 0x340, a0
                  lui          t2, 787829
                  c.srai       a5, 26
                  c.andi       a0, -1
                  slti         a6, ra, -1063
                  csrrw        s6, 0x340, sp
                  andi         s11, t1, -497
                  c.lui        a6, 28
                  csrrwi       gp, 0x340, 4
                  csrrw        a6, 0x340, s8
                  or           t2, s4, a5
                  c.li         ra, -1
                  c.andi       a1, 17
                  slli         a3, gp, 31
                  c.nop
                  c.li         s2, -1
                  c.addi       t1, 26
                  addi         s8, s9, -230
                  c.nop
                  mulhu        s3, s6, t3
                  c.addi       s9, 27
                  srl          sp, a7, sp
                  mul          s1, a5, s8
                  or           zero, a3, ra
                  csrrw        s2, 0x340, zero
                  slli         s5, s5, 0
                  c.andi       s1, 9
                  c.addi16sp   sp, 144
                  sub          s7, sp, s5
                  c.addi4spn   s1, sp, 592
                  add          a5, zero, t0
                  add          a6, t2, s7
                  c.addi16sp   sp, 208
                  c.nop
                  slt          s6, s8, s9
                  c.srai       s1, 26
                  c.and        s1, a0
                  slli         s2, ra, 1
                  c.addi       a7, 3
                  c.addi       s10, -1
                  addi         gp, t3, 1364
                  c.lui        t2, 8
                  mulh         s4, a6, a2
                  csrrci       t5, 0x340, 15
                  lui          zero, 531362
                  csrrsi       a6, 0x340, 0
                  c.add        t4, s7
                  rem          tp, t5, a7
                  sltu         s7, t5, s4
                  auipc        a6, 120917
                  div          s7, s1, a5
                  mul          s8, a2, s5
                  c.srli       s1, 11
                  nop
                  mulh         t4, t0, t1
                  c.lui        t6, 15
                  c.nop
                  rem          a5, a3, t4
                  mulh         t0, gp, t4
                  c.mv         a7, a1
                  c.li         t1, -1
                  sra          s4, s11, s0
                  c.or         a0, a5
                  or           s5, a4, t5
                  and          s4, s5, a3
                  sltiu        s8, s9, -804
                  c.srli       s1, 25
                  auipc        t2, 755171
                  mulhu        s3, t6, sp
                  c.mv         t6, t3
                  nop
                  c.or         a1, a4
                  sra          t2, s4, s11
                  csrrsi       s1, 0x340, 0
                  csrrwi       a1, 0x340, 19
                  auipc        a3, 534948
                  sll          ra, sp, s2
                  divu         s1, t5, t1
                  auipc        t1, 858516
                  csrrs        a4, 0x340, t1
                  mulhsu       sp, s1, a4
                  slti         s2, tp, 63
                  or           s10, s10, s3
                  auipc        a7, 28918
                  c.addi4spn   a0, sp, 704
                  divu         zero, a0, tp
                  and          s5, tp, a0
                  c.srli       a0, 5
                  c.li         s6, 2
                  srl          a7, gp, s2
                  auipc        s3, 161527
                  c.addi4spn   s1, sp, 128
                  c.srli       a3, 22
                  csrrsi       s9, 0x340, 0
                  sub          a5, a2, s1
                  c.nop
                  ori          sp, t3, -635
                  c.or         a0, s1
                  csrrc        a5, 0x340, t5
                  mulhsu       t0, gp, s7
                  sub          s3, sp, a5
                  sra          ra, zero, t4
                  nop
                  slt          ra, s1, a1
                  csrrwi       s11, 0x340, 15
                  mul          tp, zero, a7
                  csrrwi       t2, 0x340, 0
                  xori         sp, a7, 1444
                  srai         s2, zero, 10
                  auipc        s6, 121459
                  add          t5, tp, s8
                  sltiu        a6, t3, -1286
                  and          t4, a0, s5
                  auipc        a5, 112130
                  c.or         a3, a1
                  c.srli       a5, 23
                  csrrsi       a5, 0x340, 0
                  c.addi16sp   sp, 80
                  c.sub        a1, a4
                  xori         s3, s4, -536
                  c.addi16sp   sp, -16
                  c.andi       a5, -1
                  sub          a6, s8, s4
                  srl          a6, s2, a0
                  srl          s6, s0, a1
                  c.add        a6, tp
                  remu         t1, s9, s11
                  div          a4, s10, t1
                  mulhsu       s2, s6, s8
                  srai         a6, s4, 3
                  mulh         a4, s8, t4
                  c.addi4spn   a4, sp, 144
                  divu         s6, t6, tp
                  c.nop
                  c.srli       a0, 13
                  c.srli       s1, 17
                  c.srli       a1, 8
                  add          t2, a2, a4
                  mulhsu       s10, t5, s11
                  nop
                  sra          zero, t6, t2
                  sra          s4, s11, s9
                  slti         s4, t5, 333
                  csrrw        zero, 0x340, t6
                  rem          s1, s5, s7
                  sub          a7, s5, a3
                  c.li         s10, 27
                  csrrwi       t4, 0x340, 6
                  srl          s5, s3, tp
                  c.slli       gp, 6
                  c.xor        a4, a3
                  sltu         a4, t4, a3
                  c.andi       a1, -1
                  srl          s1, ra, a0
                  remu         s8, zero, a4
                  srl          s10, s9, tp
                  div          a3, a4, ra
                  c.nop
                  c.xor        a5, s0
                  csrrc        s1, 0x340, a3
                  andi         a6, sp, 967
                  xor          s7, t2, s10
                  ori          gp, s6, 1066
                  andi         s2, a3, 1265
                  csrrwi       a0, 0x340, 11
                  div          s4, sp, s1
                  rem          s5, sp, s8
                  slti         tp, t6, -390
                  csrrwi       s4, 0x340, 5
                  c.srli       a1, 29
                  add          a1, s3, s11
                  slti         s10, a6, 1510
                  mulh         a5, a5, t3
                  srl          gp, s1, t6
                  c.xor        s1, s1
                  add          s3, t6, s10
                  c.and        s1, a4
                  nop
                  c.lui        s2, 10
                  csrrwi       a4, 0x340, 3
                  sub          s6, s3, s5
                  c.nop
                  nop
                  srl          t1, a5, s6
                  c.add        t0, t1
                  srli         s8, a7, 27
                  srli         a3, s7, 12
                  xor          s10, tp, a7
                  c.or         a5, a4
                  rem          s6, sp, s6
                  csrrc        a4, 0x340, zero
                  srl          s9, s2, t0
                  csrrw        t6, 0x340, a2
                  nop
                  csrrs        a5, 0x340, a6
                  mulhu        s8, s3, t3
                  c.lui        s3, 3
                  remu         s7, s2, a7
                  c.andi       a5, 26
                  andi         s8, s10, -1025
                  sub          s9, s6, a0
                  c.addi4spn   a1, sp, 496
                  mulhsu       gp, ra, s11
                  or           a4, s6, a6
                  mulhsu       s1, a0, a7
                  addi         t0, gp, 530
                  sltiu        a7, t0, -1708
                  slt          a0, s8, zero
                  c.li         s11, 23
                  lui          t1, 927152
                  c.srai       a1, 4
                  slli         sp, s8, 4
                  c.li         t2, 25
                  c.addi       t5, -1
                  c.srli       a4, 10
                  c.addi4spn   a1, sp, 80
                  lui          s4, 346459
                  c.slli       a0, 29
                  rem          sp, t0, s2
                  csrrc        s2, 0x340, zero
                  c.nop
                  srli         gp, a0, 0
                  c.addi4spn   a5, sp, 448
                  c.slli       t0, 31
                  csrrsi       s4, 0x340, 22
                  c.slli       tp, 12
                  c.andi       a3, 5
                  nop
                  mul          a3, a4, t1
                  add          ra, zero, a1
                  c.slli       gp, 13
                  divu         zero, zero, s5
                  csrrc        t0, 0x340, t2
                  sltiu        t1, a3, 1238
                  remu         tp, t1, a6
                  sub          t5, a3, s11
                  and          a5, a7, s2
                  xori         s7, sp, 1921
                  auipc        a5, 638303
                  c.lui        t1, 15
                  sub          a1, t5, gp
                  nop
                  mulhsu       a3, a1, s2
                  divu         s11, ra, s10
                  sra          sp, s7, t0
                  or           s5, sp, s8
                  sltu         a0, s9, s0
                  c.and        a0, s0
                  mul          tp, a4, t4
                  srli         s5, a4, 23
                  xor          t1, t4, t4
                  divu         zero, t1, a7
                  slli         s1, zero, 10
                  slti         a7, s0, 322
                  c.srli       a3, 18
                  csrrci       a4, 0x340, 0
                  mulhsu       s11, s10, a7
                  andi         gp, sp, -1138
                  c.and        a4, a5
                  sub          s4, s5, s2
                  add          sp, s4, s4
                  or           a0, a6, zero
                  auipc        ra, 628099
                  csrrs        tp, 0x340, zero
                  auipc        s5, 586832
                  ori          a1, s8, -1383
                  and          s10, a2, a1
                  sltiu        a4, ra, 791
                  c.srli       a5, 27
                  c.slli       s9, 30
                  ori          s8, t0, 84
                  andi         t6, s8, -1921
                  andi         a0, a6, 177
                  csrrci       t1, 0x340, 0
                  rem          a7, s10, ra
                  and          t1, a4, s11
                  xor          a5, a7, ra
                  slli         a3, s5, 22
                  addi         ra, t6, -1976
                  sll          a4, s6, s7
                  slti         gp, a1, -1059
                  mulhu        t6, a5, a6
                  c.sub        a5, a1
                  srai         s8, zero, 29
                  ori          ra, gp, -377
                  c.lui        s11, 24
                  mulhsu       s9, t1, sp
                  and          t4, s2, a7
                  sra          a7, s1, s0
                  sra          a4, t0, s2
                  xori         t4, s6, 863
                  c.lui        s1, 31
                  c.lui        s3, 4
                  c.lui        ra, 8
                  c.and        a4, a3
                  c.andi       a0, 29
                  andi         a3, s11, 1179
                  srl          ra, a6, a3
                  sra          s9, s11, t0
                  c.addi4spn   a5, sp, 128
                  add          sp, s6, ra
                  c.nop
                  sltiu        a7, s11, 1625
                  c.or         a3, a3
                  mulh         t6, a5, s6
                  div          s1, ra, t5
                  c.slli       gp, 17
                  c.sub        a0, a5
                  c.addi4spn   a4, sp, 224
                  c.andi       s1, -1
                  c.slli       a1, 9
                  slt          a7, gp, ra
                  addi         tp, s1, 1257
                  addi         s4, s6, 1849
                  mulhu        zero, a1, t0
                  mul          zero, t2, t5
                  srai         a1, a4, 29
                  xori         a5, s10, 1696
                  c.li         sp, 24
                  nop
                  slt          t2, a4, gp
                  c.sub        a5, s0
                  c.addi16sp   sp, -16
                  c.srli       a4, 3
                  mulhu        t1, a7, a6
                  c.andi       a3, -1
                  mulh         a6, a4, t0
                  mulhu        a7, a7, a5
                  c.addi16sp   sp, 144
                  mulhu        s9, t2, ra
                  c.sub        a1, a4
                  add          t6, s11, t5
                  sltiu        zero, s11, 21
                  c.sub        a5, s1
                  c.addi       a5, 22
                  rem          s3, a5, t2
                  c.mv         t4, s4
                  nop
                  and          t1, a0, ra
                  slti         s2, ra, 1737
                  c.li         s3, 7
                  c.srai       a1, 28
                  c.nop
                  and          t1, s4, t0
                  srli         s2, gp, 1
                  csrrs        s11, 0x340, s7
                  c.mv         s11, t4
                  srli         t6, tp, 22
                  div          s2, a7, a3
                  slli         s4, t5, 2
                  c.or         s1, a4
                  sll          t4, s0, a0
                  csrrsi       a4, 0x340, 23
                  srli         s3, a7, 1
                  add          s6, s5, s1
                  c.andi       s1, -1
                  rem          t4, t5, s1
                  csrrc        s6, 0x340, t1
                  sll          t6, t1, s8
                  sltiu        a0, gp, -1049
                  c.andi       s1, -1
                  slt          zero, s4, a4
                  xor          s1, t2, t1
                  addi         a5, a4, -1868
                  c.nop
                  c.nop
                  sltu         a4, sp, zero
                  c.andi       a3, -1
                  csrrw        tp, 0x340, gp
                  mulhu        s1, s8, t2
                  srl          a5, a1, t3
                  csrrs        tp, 0x340, zero
                  c.srai       a3, 12
                  remu         a1, t2, a5
                  c.mv         a0, gp
                  sltiu        t1, a3, 881
                  c.mv         a5, t1
                  rem          ra, s9, t2
                  sra          s4, s7, t4
                  remu         a7, t0, s8
                  auipc        ra, 44095
                  auipc        s8, 248890
                  andi         t2, s6, -1997
                  csrrs        tp, 0x340, zero
                  div          t6, zero, a0
                  sra          s11, tp, s10
                  c.lui        s9, 12
                  or           s6, a6, s1
                  c.addi16sp   sp, 432
                  sltu         a6, s3, a1
                  c.addi4spn   s1, sp, 48
                  slti         s2, a5, 1017
                  nop
                  c.lui        s5, 18
                  lui          s5, 529246
                  sub          a6, s9, s6
                  c.addi       s11, -1
                  sub          a6, s11, t0
                  mulhu        ra, gp, a4
                  c.addi4spn   s1, sp, 912
                  sra          s4, ra, s2
                  c.nop
                  andi         s7, t5, 1882
                  c.addi       a0, 29
                  csrrw        a1, 0x340, a2
                  nop
                  csrrsi       s5, 0x340, 0
                  sltu         s2, a6, s11
                  c.lui        s1, 22
                  div          s1, zero, s5
                  csrrc        t1, 0x340, t0
                  c.srli       s1, 4
                  srl          t6, a3, t0
                  andi         sp, s2, 770
                  slti         a0, gp, -508
                  rem          t0, t0, s6
                  c.and        a1, a5
                  mulh         t4, t4, s10
                  mulhu        t4, gp, s10
                  c.or         a0, s0
                  mul          s10, s5, t1
                  slti         s10, s1, -813
                  csrrci       s4, 0x340, 0
                  c.or         a1, s0
                  remu         s4, a5, t4
                  slli         s10, a1, 7
                  mulhsu       tp, t4, s8
                  slt          t0, a4, gp
                  remu         gp, s11, tp
                  c.andi       a5, -1
                  remu         t2, sp, a1
                  lui          s3, 668674
                  sub          s6, s11, t1
                  c.srli       a5, 25
                  and          a0, a7, t4
                  xori         a4, s8, 1411
                  csrrsi       ra, 0x340, 1
                  c.mv         t0, s9
                  addi         s3, t5, -2
                  c.nop
                  mulhu        a7, a7, a7
                  c.lui        t5, 23
                  sltiu        a4, a1, -995
                  or           a1, s5, a6
                  auipc        ra, 603693
                  add          a3, t5, a5
                  c.or         s1, a4
                  csrrc        gp, 0x340, zero
                  or           tp, zero, a3
                  sra          a6, t6, sp
                  mulhsu       t5, t1, t3
                  c.xor        a0, a0
                  ori          gp, sp, -1365
                  mulhu        t2, s5, s2
                  c.nop
                  add          s11, s9, a3
                  csrrs        s2, 0x340, a7
                  srai         s3, zero, 17
                  csrrs        s4, 0x340, zero
                  sll          s4, gp, s4
                  c.li         s6, 3
                  mul          t5, a6, a4
                  c.and        a3, a4
                  srai         s8, s1, 3
                  c.srli       a1, 10
                  c.andi       a5, -1
                  srl          s8, t0, s8
                  slli         s1, tp, 7
                  c.andi       a0, -1
                  mul          t5, s9, t6
                  sltiu        sp, s4, -1493
                  srai         t6, s7, 23
                  mulhsu       a3, a0, sp
                  auipc        a4, 703101
                  c.andi       a3, 10
                  nop
                  mulh         t6, s10, zero
                  c.srli       a4, 31
                  sltu         a6, a6, t5
                  csrrci       s9, 0x340, 0
                  c.addi16sp   sp, 176
                  c.and        a4, a5
                  c.li         gp, 6
                  lui          s2, 332095
                  c.xor        a4, a2
                  slli         a0, a5, 11
                  c.li         t4, 15
                  or           t0, ra, s1
                  and          t4, zero, s4
                  csrrw        gp, 0x340, s10
                  srli         sp, gp, 14
                  c.sub        a4, a4
                  or           zero, s6, s3
                  slli         s6, s1, 31
                  mulhu        s3, s10, sp
                  mul          s9, ra, t1
                  c.mv         a5, s9
                  sra          a6, a7, t1
                  slti         a3, s9, -1795
                  slt          a3, t4, t3
                  sll          a7, a7, ra
                  c.li         s7, 25
                  c.nop
                  sra          t1, s2, t6
                  c.and        a4, s0
                  c.lui        s8, 11
                  c.slli       s1, 15
                  auipc        s5, 387012
                  slti         sp, t2, -968
                  xor          t4, a4, t6
                  c.addi       s5, 17
                  remu         a3, s7, s9
                  c.slli       t2, 28
                  slti         s1, t6, -707
                  c.addi       a4, 13
                  c.and        a4, a1
                  div          t0, a0, t1
                  csrrc        s1, 0x340, t5
                  csrrci       s10, 0x340, 30
                  sra          s3, s2, s2
                  nop
                  mulhsu       s4, a7, s4
                  csrrci       s3, 0x340, 0
                  mulhu        t1, gp, s0
                  c.mv         a7, s4
                  auipc        ra, 359477
                  c.mv         gp, s10
                  nop
                  srli         a5, a3, 29
                  nop
                  csrrsi       s9, 0x340, 0
                  lui          s9, 947387
                  c.andi       s1, 18
                  csrrsi       s10, 0x340, 0
                  c.lui        a5, 2
                  div          a5, s10, s4
                  xori         t6, s0, -1214
                  div          s6, s2, s4
                  mulhsu       s11, a3, t5
                  slli         a4, t0, 20
                  add          s8, s6, t1
                  add          s11, s5, s10
                  c.addi4spn   a0, sp, 480
                  c.srli       a0, 22
                  remu         s2, sp, tp
                  c.or         a5, a3
                  rem          s4, a6, t5
                  sra          a5, a2, a3
                  auipc        s7, 86771
                  csrrci       s10, 0x340, 0
                  c.add        s2, a3
                  remu         a7, a0, tp
                  c.srli       a1, 24
                  c.sub        a0, a2
                  sra          s5, t6, t4
                  xor          t5, s2, tp
                  c.slli       tp, 4
                  srl          s10, a5, zero
                  c.andi       a1, 12
                  csrrs        tp, 0x340, t6
                  slti         s9, s0, 1692
                  c.nop
                  csrrc        a5, 0x340, s8
                  slti         tp, zero, 1965
                  c.slli       sp, 23
                  c.and        s1, a5
                  remu         a0, t4, sp
                  c.addi4spn   a4, sp, 128
                  c.addi       s3, 23
                  c.mv         s4, t3
                  srli         s1, ra, 12
                  sll          a5, t2, gp
                  slli         t5, a2, 27
                  csrrc        s11, 0x340, zero
                  remu         a0, a2, a2
                  srl          sp, s9, t5
                  addi         a4, s3, 1501
                  lui          sp, 976417
                  add          ra, a2, s11
                  slti         a5, t1, 1407
                  c.mv         tp, a0
                  c.sub        a0, a2
                  lui          s1, 456112
                  c.mv         a0, ra
                  csrrci       t1, 0x340, 14
                  c.nop
                  c.srai       s1, 26
                  srl          a3, s4, t3
                  c.addi16sp   sp, 336
                  c.sub        a3, a5
                  nop
                  sra          zero, zero, s9
                  or           s7, a4, a4
                  srli         s11, s11, 2
                  rem          t5, a5, s1
                  sra          sp, s8, gp
                  c.li         s5, 31
                  sltiu        a3, tp, -1606
                  c.or         a3, a5
                  div          a6, s7, s5
                  csrrsi       t0, 0x340, 3
                  c.addi16sp   sp, -16
                  c.add        t4, ra
                  andi         sp, t0, -1187
                  rem          t0, s0, s8
                  c.srli       a1, 16
                  csrrsi       a0, 0x340, 0
                  csrrc        t4, 0x340, gp
                  rem          t2, tp, tp
                  c.andi       a1, -1
                  c.add        a3, s2
                  auipc        a3, 865576
                  add          t6, s3, s1
                  rem          a1, t5, s2
                  csrrsi       a4, 0x340, 0
                  slt          s2, t3, s11
                  c.slli       ra, 5
                  xor          sp, s4, a5
                  c.addi4spn   a4, sp, 528
                  lui          a0, 438468
                  c.nop
                  slli         s10, a5, 18
                  sub          a4, s0, s8
                  c.mv         s1, a6
                  srl          s7, t4, t1
                  sltiu        a0, a5, -1007
                  c.nop
                  xor          gp, gp, t4
                  mulh         gp, s0, t0
                  and          gp, s10, s6
                  c.sub        a5, a1
                  csrrwi       a5, 0x340, 14
                  remu         a7, a4, a6
                  mulhu        s1, s0, t4
                  mulhu        t0, tp, s4
                  div          tp, a7, s1
                  remu         a7, s7, s7
                  srli         s11, a5, 23
                  srai         t4, s11, 7
                  c.addi       s5, -1
                  c.sub        a5, s1
                  nop
                  sltiu        a3, t0, 748
                  c.and        a3, s0
                  csrrs        s11, 0x340, zero
                  c.addi       s9, 10
                  sltu         s11, s11, a4
                  c.sub        a4, a4
                  xor          tp, s3, a1
                  mulh         a6, a1, t4
                  c.add        t6, s5
                  auipc        s5, 736910
                  c.or         a3, s1
                  c.mv         t6, s6
                  c.slli       s8, 22
                  c.sub        a3, a4
                  c.slli       t2, 2
                  slt          s5, t3, tp
                  srl          ra, s10, a7
                  c.add        s3, s6
                  slli         s6, a5, 2
                  div          a6, tp, ra
                  slli         s3, a0, 26
                  and          s1, s5, a3
                  mulhu        a3, sp, t4
                  csrrw        s6, 0x340, a2
                  div          s2, s10, a2
                  mulhsu       s3, zero, a7
                  xori         a3, a5, 1601
                  c.and        a1, a0
                  andi         zero, t0, 727
                  lui          t5, 415545
                  andi         ra, s7, -2030
                  auipc        t5, 729900
                  add          s1, a4, s1
                  sub          a1, sp, s10
                  c.slli       a6, 3
                  add          s3, s0, a2
                  c.addi16sp   sp, -16
                  c.li         s7, 9
                  csrrc        s7, 0x340, s5
                  slti         a1, ra, 1856
                  remu         s8, t6, s0
                  sra          t5, s10, t6
                  divu         zero, a0, s0
                  sra          s9, s10, t5
                  add          a0, s3, ra
                  sltu         s10, t2, t1
                  c.lui        t6, 29
                  csrrwi       sp, 0x340, 1
                  sub          s6, t6, s10
                  auipc        s8, 529148
                  csrrci       s5, 0x340, 25
                  sltiu        t4, tp, 1887
                  csrrwi       a7, 0x340, 21
                  csrrs        s9, 0x340, zero
                  c.nop
                  srl          s2, t3, t3
                  sll          a0, t2, s1
                  c.lui        a5, 5
                  remu         a6, a3, gp
                  and          t5, s3, sp
                  rem          s4, a5, sp
                  sltu         t2, s11, t1
                  or           s9, s11, a1
                  slti         t4, a2, -1520
                  sltiu        sp, a3, 1782
                  c.addi4spn   a5, sp, 928
                  mulhu        gp, t2, s6
                  c.sub        s1, a4
                  xori         s10, s0, -1344
                  sll          s3, a7, a2
                  c.xor        a1, s0
                  c.li         a4, -1
                  c.and        a1, a0
                  c.srli       a0, 29
                  remu         s8, tp, a3
                  auipc        a3, 319974
                  csrrw        a4, 0x340, s3
                  csrrs        a7, 0x340, t6
                  lui          tp, 660784
                  csrrc        s6, 0x340, zero
                  srli         gp, ra, 19
                  c.mv         a0, s1
                  addi         s4, t2, 1065
                  add          zero, t1, a5
                  c.slli       t6, 25
                  andi         s2, a6, -146
                  sll          a5, a5, t5
                  mulhu        tp, s10, s2
                  sub          s1, s4, s10
                  c.nop
                  divu         s6, a1, s3
                  sll          a4, s3, s10
                  sltiu        t0, t1, -1108
                  mulhu        t2, t5, a3
                  xori         a6, s11, 799
                  csrrs        t6, 0x340, zero
                  nop
                  c.addi4spn   a1, sp, 96
                  c.andi       a3, -1
                  srai         a1, t4, 16
                  nop
                  csrrwi       s6, 0x340, 16
                  ori          s7, a0, 1943
                  mulhu        a4, a6, ra
                  sll          zero, a3, a3
                  addi         a1, t0, 462
                  slti         a0, s8, -644
                  and          s6, s2, t2
                  nop
                  c.srai       a3, 12
                  xori         a6, t5, 1747
                  c.lui        s11, 17
                  c.or         a3, a3
                  xor          ra, a7, s8
                  c.srai       a0, 31
                  c.li         a1, -1
                  csrrsi       a3, 0x340, 0
                  mul          t2, s11, s8
                  csrrsi       t1, 0x340, 29
                  c.slli       s6, 4
                  lui          tp, 238408
                  lui          s5, 667783
                  c.andi       a3, 7
                  slli         t2, s11, 0
                  c.and        a5, s1
                  csrrs        t5, 0x340, s5
                  andi         a4, a7, 1753
                  csrrwi       t1, 0x340, 22
                  c.or         a3, a0
                  sll          s3, t1, zero
                  c.slli       a4, 19
                  xor          t0, s6, s7
                  sll          zero, zero, s1
                  slti         s1, a1, -484
                  c.andi       a3, 5
                  csrrs        s8, 0x340, zero
                  csrrc        s2, 0x340, zero
                  slli         a0, a7, 12
                  csrrwi       s5, 0x340, 10
                  c.srli       s1, 3
                  slti         t6, s9, -1451
                  csrrci       t0, 0x340, 24
                  andi         s4, a5, 1157
                  slti         t4, s7, 382
                  or           a1, s8, s8
                  mulh         t6, t5, gp
                  c.slli       sp, 19
                  slli         t1, s4, 29
                  csrrsi       t0, 0x340, 0
                  c.sub        a5, a4
                  div          s11, t1, ra
                  divu         s5, s8, a1
                  mul          t4, s3, t4
                  sltiu        ra, s11, 1732
                  add          t4, s0, s7
                  mulhsu       s3, tp, s4
                  c.addi16sp   sp, -16
                  c.addi       ra, 28
                  csrrs        t5, 0x340, zero
                  srli         a5, t3, 23
                  c.xor        a0, a1
                  c.and        a5, a1
                  csrrsi       s6, 0x340, 0
                  mul          s1, s1, a4
                  lui          s7, 471035
                  c.srai       a5, 25
                  sltu         t0, tp, s8
                  c.addi16sp   sp, -16
                  c.and        a1, a1
                  sub          s8, s9, s1
                  c.nop
                  div          a4, s3, s9
                  sltu         s3, s4, s1
                  mulhu        t0, t1, ra
                  add          ra, tp, t0
                  c.li         s10, 25
                  slti         s5, s2, 678
                  c.nop
                  csrrwi       zero, 0x340, 4
                  csrrsi       a7, 0x340, 0
                  sub          a6, a0, a0
                  auipc        s3, 618187
                  slli         a3, s4, 12
                  c.srli       s1, 26
                  c.addi4spn   s1, sp, 304
                  mul          s4, t6, s10
                  and          s3, t4, a2
                  c.andi       a3, 28
                  c.li         t1, -1
                  remu         s2, t4, s0
                  xori         t2, ra, -1714
                  c.srai       a4, 24
                  or           t5, s2, t2
                  xor          a3, a0, t3
                  csrrci       t5, 0x340, 0
                  sra          s6, sp, a2
                  or           zero, a4, s11
                  srl          s10, s1, s6
                  lui          gp, 823049
                  c.addi16sp   sp, -16
                  add          s6, s11, s10
                  sll          t1, a4, s5
                  sub          s1, s7, a0
                  c.nop
                  c.xor        a3, a5
                  c.mv         s9, s4
                  xor          s2, s1, s6
                  ori          a1, zero, 610
                  csrrwi       ra, 0x340, 5
                  srai         s2, s3, 24
                  add          a4, a3, s9
                  ori          a0, t1, 1802
                  mulhu        a7, zero, a6
                  csrrc        s11, 0x340, s5
                  xor          a7, s6, s1
                  mulhsu       s2, t1, a2
                  sltiu        s8, zero, -999
                  c.sub        a5, s0
                  c.srai       a0, 21
                  mulh         a4, ra, s1
                  sltu         t0, s9, a6
                  slti         tp, t3, -176
                  nop
                  c.xor        a1, a0
                  auipc        a1, 820646
                  mulh         s6, a0, t6
                  andi         s1, a2, -327
                  mulhsu       a1, s10, s11
                  c.slli       s3, 3
                  srai         a0, sp, 6
                  and          a3, s6, s8
                  andi         s9, s3, 635
                  c.li         s1, -1
                  c.xor        a1, a0
                  c.add        a0, t3
                  mul          s10, s5, gp
                  c.addi       s9, -1
                  c.srli       a3, 14
                  c.nop
                  mulhu        s7, a0, sp
                  lui          t5, 421552
                  or           a1, s6, t0
                  c.srai       a1, 12
                  csrrw        a4, 0x340, ra
                  or           t4, s7, a1
                  c.and        a1, a4
                  sub          a1, t3, ra
                  sll          a6, t5, t4
                  c.slli       s2, 5
                  csrrw        s6, 0x340, s0
                  add          t2, s6, t6
                  c.srai       a1, 9
                  c.lui        s11, 19
                  slti         s4, tp, 732
                  nop
                  andi         t5, s0, -1956
                  and          s4, a2, t0
                  c.lui        s11, 22
                  mul          zero, a0, tp
                  csrrw        s10, 0x340, s0
                  c.add        a3, t3
                  slt          gp, t0, s3
                  srl          a6, a5, t4
                  csrrsi       s10, 0x340, 0
                  rem          a0, t3, t2
                  c.and        a3, a4
                  auipc        t2, 323279
                  rem          a3, t5, t5
                  xori         t1, s11, 684
                  slti         s6, s2, -732
                  c.addi       s5, -1
                  mulhu        a0, s3, s6
                  and          a6, t0, a1
                  c.addi16sp   sp, 48
                  csrrwi       sp, 0x340, 6
                  div          s11, s0, s11
                  mulh         s3, t6, s10
                  sltiu        ra, sp, -824
                  divu         s8, t3, s3
                  c.srai       s1, 17
                  mul          s7, t1, a2
                  csrrsi       s11, 0x340, 0
                  csrrw        t1, 0x340, s10
                  remu         a0, ra, t1
                  c.add        a6, a3
                  c.and        s1, a1
                  csrrw        a4, 0x340, s3
                  sltiu        t0, s9, 174
                  mulhu        s3, t5, zero
                  c.addi       gp, -1
                  csrrs        t4, 0x340, a0
                  srai         t4, a1, 16
                  srli         s5, a1, 22
                  c.slli       t4, 20
                  c.nop
                  csrrwi       s5, 0x340, 12
                  div          s11, gp, s8
                  c.nop
                  remu         a6, s8, a6
                  c.or         s1, s0
                  and          s8, a4, s6
                  c.or         a3, a2
                  c.or         a5, a1
                  slti         a4, s8, 108
                  sltu         a3, a1, tp
                  mulhsu       s8, s9, s3
                  c.li         s3, -1
                  mulh         t6, a6, s6
                  csrrw        gp, 0x340, t2
                  sra          s11, sp, t6
                  lui          s6, 500216
                  rem          s2, tp, s5
                  mulh         a5, a4, t4
                  divu         s8, a5, s3
                  c.and        s1, a4
                  c.srli       a5, 21
                  lui          a0, 73642
                  c.addi4spn   a0, sp, 560
                  csrrs        s10, 0x340, t6
                  srli         s7, s1, 23
                  add          s10, s7, s5
                  sltu         t1, t0, a2
                  mulhsu       sp, a5, s1
                  and          t2, zero, t3
                  mulhsu       t6, a1, s8
                  c.srai       a3, 3
                  sll          gp, sp, ra
                  sll          a1, s8, a5
                  c.nop
                  c.xor        s1, s1
                  c.addi       gp, 9
                  rem          t5, a1, t2
                  slli         a7, t2, 17
                  remu         a1, a6, t4
                  and          s2, a7, a7
                  csrrc        t5, 0x340, a4
                  srli         a6, s11, 20
                  mulhu        gp, t0, s1
                  c.and        s1, s0
                  rem          a3, t1, s10
                  c.nop
                  sltu         t5, s0, s7
                  div          t5, a7, s4
                  c.mv         s10, s11
                  csrrc        t5, 0x340, zero
                  csrrsi       a4, 0x340, 15
                  slt          a4, zero, tp
                  c.srli       a5, 27
                  divu         a7, s11, s0
                  c.sub        a1, s1
                  sltiu        t6, t6, -522
                  srl          a1, a2, a5
                  remu         s8, t5, t1
                  mul          a0, a4, zero
                  divu         s5, t5, s2
                  srli         t6, s9, 9
                  csrrs        tp, 0x340, zero
                  c.xor        a3, a0
                  xori         a5, t2, 413
                  sra          a5, s8, gp
                  c.andi       a1, 24
                  sltu         t4, t4, zero
                  c.slli       s3, 20
                  and          t4, a0, s4
                  csrrs        a6, 0x340, zero
                  c.mv         s11, a6
                  mulh         s9, a2, a3
                  div          a7, a3, ra
                  c.addi4spn   a5, sp, 336
                  or           t5, s2, a1
                  ori          a0, t3, 1203
                  sra          a3, a2, a5
                  andi         zero, t1, 1085
                  c.addi16sp   sp, 416
                  csrrw        t2, 0x340, t0
                  mul          a1, a6, a0
                  or           t4, s0, a7
                  c.slli       a6, 14
                  csrrs        ra, 0x340, zero
                  csrrsi       t5, 0x340, 31
                  sll          a0, a3, t2
                  auipc        s11, 384593
                  xor          a0, t6, s7
                  divu         gp, a2, s2
                  c.srai       s1, 29
                  sra          a4, gp, t3
                  auipc        tp, 916060
                  c.sub        a0, s1
                  c.andi       a0, -1
                  mulh         s9, s3, gp
                  sll          ra, a5, gp
                  sll          s9, gp, sp
                  c.addi       s10, 6
                  sltu         s2, s10, t1
                  srl          t6, a5, s3
                  add          t2, a4, s6
                  ori          t2, s5, -623
                  c.nop
                  sub          s1, s3, a2
                  or           tp, s8, s0
                  c.slli       s8, 10
                  mulhu        s9, s5, a3
                  add          s5, s4, s1
                  divu         t2, t0, s2
                  c.mv         s4, gp
                  rem          t5, t1, a0
                  sltiu        tp, a6, -1455
                  c.sub        s1, s0
                  csrrs        s4, 0x340, t4
                  or           s1, a1, s11
                  sltiu        s5, s2, -704
                  mulhsu       tp, t1, s4
                  or           a4, t3, sp
                  c.addi       a0, -1
                  auipc        s2, 931117
                  sra          a5, a6, zero
                  sra          t2, s9, s3
                  divu         t6, t6, s7
                  csrrs        s5, 0x340, zero
                  c.andi       a3, -1
                  c.sub        a5, s1
                  mulh         s5, s4, t6
                  csrrs        a3, 0x340, s9
                  ori          a1, gp, 732
                  mulhsu       s4, t6, t3
                  c.srai       a3, 18
                  add          a0, a1, t0
                  c.or         a3, a1
                  c.lui        gp, 20
                  and          s4, s0, ra
                  c.or         a5, a0
                  nop
                  add          ra, s6, s6
                  csrrs        t2, 0x340, a2
                  srli         t0, t0, 22
                  c.add        sp, s9
                  divu         t4, s11, ra
                  lui          s1, 788644
                  slt          a5, s7, s7
                  csrrw        t6, 0x340, gp
                  auipc        t6, 241431
                  mulhsu       zero, a7, a5
                  sra          zero, a7, s10
                  auipc        t4, 670140
                  c.add        t2, s2
                  c.lui        a0, 1
                  mulhu        s10, sp, s10
                  c.srai       s1, 7
                  c.and        a0, a1
                  lui          a3, 460368
                  c.mv         t2, s2
                  sub          zero, s7, s4
                  csrrc        t6, 0x340, ra
                  c.or         a4, s0
                  c.nop
                  sub          t0, ra, a2
                  sltiu        s5, tp, -1235
                  add          s2, s2, a7
                  c.sub        a4, a3
                  c.addi4spn   a1, sp, 656
                  lui          s3, 492067
                  auipc        s1, 989361
                  auipc        s5, 130172
                  remu         ra, s0, t0
                  slti         t2, a7, 1999
                  sub          s8, sp, tp
                  csrrs        s9, 0x340, tp
                  auipc        s4, 473665
                  csrrci       t6, 0x340, 0
                  sltiu        a7, s10, 1089
                  csrrwi       s11, 0x340, 6
                  srl          ra, a4, s6
                  c.slli       t1, 19
                  c.nop
                  c.srli       a1, 17
                  csrrw        a0, 0x340, s0
                  c.addi4spn   a1, sp, 800
                  andi         a0, t1, 1585
                  sltiu        a3, a0, -904
                  srli         zero, s6, 27
                  srai         a1, t1, 3
                  mulhsu       s11, sp, t3
                  c.xor        a4, a0
                  c.lui        a5, 30
                  addi         s9, t0, -907
                  c.add        a3, ra
                  c.li         a4, -1
                  divu         a3, s5, zero
                  c.lui        s5, 17
                  sra          gp, a0, tp
                  sltiu        s6, s5, -1346
                  srai         s8, a1, 8
                  c.add        s8, t4
                  slli         a6, t1, 21
                  c.andi       a5, -1
                  sll          s8, s5, ra
                  c.add        a0, a5
                  mulh         ra, s3, zero
                  or           a1, t4, a4
                  div          s5, ra, gp
                  c.addi4spn   a0, sp, 160
                  c.and        a1, s1
                  c.lui        s1, 12
                  c.li         t4, 8
                  sra          a7, s6, a0
                  auipc        a6, 894746
                  srai         t5, a7, 2
                  c.addi       a5, 9
                  c.mv         s3, s6
                  xor          a3, t4, a6
                  mul          a5, a4, a0
                  div          t6, t4, t0
                  rem          a7, t6, t0
                  csrrwi       s6, 0x340, 13
                  slli         s8, s11, 30
                  mulhsu       s7, t1, a0
                  rem          s5, s0, t3
                  slti         tp, s3, 673
                  c.andi       a5, -1
                  c.xor        s1, s0
                  addi         s1, t1, 1186
                  c.li         sp, -1
                  sltu         s11, s6, s3
                  csrrw        s11, 0x340, s4
                  div          a5, t0, a4
                  addi         t5, t5, 840
                  mul          sp, s3, t6
                  c.slli       t1, 30
                  auipc        t1, 335834
                  sltiu        s8, a6, 388
                  c.andi       a4, -1
                  sub          zero, a0, sp
                  addi         t6, s11, -979
                  c.lui        t4, 27
                  c.or         s1, s0
                  sll          t5, a5, s4
                  mulh         s11, t3, s5
                  c.slli       s4, 26
                  or           s11, gp, s9
                  c.add        gp, t0
                  sll          t4, a2, t6
                  c.addi       s1, -1
                  c.and        a5, a2
                  c.srai       a1, 14
                  div          t4, t2, t3
                  mulhu        a0, s3, sp
                  c.xor        a0, s0
                  c.sub        a5, a0
                  c.slli       gp, 28
                  rem          a5, s11, s9
                  c.li         t0, 0
                  c.srli       s1, 26
                  and          t2, gp, a2
                  c.nop
                  div          a7, a6, s3
                  c.or         s1, a0
                  c.xor        a5, a5
                  remu         t6, t0, t3
                  c.andi       a3, 24
                  c.addi16sp   sp, 288
                  c.and        a5, a0
                  c.or         a0, a2
                  slli         a4, s9, 17
                  srai         s6, s10, 1
                  andi         s10, s4, 852
                  srli         s8, s7, 3
                  mul          s3, s6, t6
                  c.nop
                  slti         zero, a3, 1289
                  mulhsu       zero, s1, a5
                  srai         a1, t0, 17
                  sub          t4, s0, t6
                  nop
                  mulhsu       s7, s2, s7
                  csrrw        a1, 0x340, s2
                  mulh         zero, s2, s2
                  srl          s11, t6, s3
                  c.slli       a1, 23
                  mulh         tp, ra, t5
                  csrrsi       a4, 0x340, 27
                  div          s9, s2, t3
                  c.or         a5, s0
                  slli         a3, s6, 14
                  sll          gp, tp, s4
                  sra          s9, tp, t2
                  sltu         a3, s9, a0
                  ori          sp, s10, -820
                  auipc        t1, 748919
                  c.sub        a5, a1
                  or           s4, ra, a2
                  c.addi4spn   a5, sp, 128
                  ori          s4, tp, 119
                  csrrsi       s5, 0x340, 25
                  or           s5, s10, s6
                  sltu         s4, t3, zero
                  remu         t6, zero, s9
                  c.addi16sp   sp, 496
                  addi         t2, sp, 632
                  remu         t6, a4, a1
                  csrrw        t1, 0x340, sp
                  c.lui        tp, 14
                  add          a4, a3, t0
                  ori          zero, gp, 233
                  csrrci       s3, 0x340, 10
                  sltiu        t2, t0, 1943
                  rem          a5, ra, a4
                  c.addi       s11, 14
                  xori         sp, s3, 56
                  slti         s2, zero, 1504
                  or           t4, t5, s4
                  slli         s9, s2, 30
                  div          s7, a0, s4
                  c.li         s9, 6
                  csrrs        s10, 0x340, gp
                  sra          t6, a7, zero
                  divu         t4, gp, s3
                  mulhu        s4, t0, s9
                  divu         t5, t0, a0
                  slli         s1, ra, 23
                  slt          s11, s10, s8
                  c.xor        a1, a3
                  c.srai       a4, 10
                  mul          t0, a1, s8
                  sra          t6, a0, s7
                  c.lui        a1, 2
                  c.addi4spn   a3, sp, 928
                  c.mv         a1, s6
                  sll          a7, s10, t3
                  mulhsu       s11, s8, s2
                  c.nop
                  c.lui        t6, 4
                  slt          tp, sp, t0
                  slti         a4, a6, -371
                  c.nop
                  c.add        s2, s5
                  auipc        ra, 1003521
                  sub          ra, a6, a2
                  or           a5, tp, a0
                  c.lui        s6, 14
                  or           t4, a5, tp
                  csrrs        a5, 0x340, zero
                  c.addi       a7, 19
                  or           a0, a4, a5
                  c.li         s10, 25
                  xori         t4, s2, 336
                  mulh         t5, s2, gp
                  c.lui        s10, 17
                  csrrc        gp, 0x340, zero
                  c.addi       s11, -1
                  c.add        s9, s1
                  xor          a1, t6, a4
                  div          a7, s2, t3
                  c.or         a5, a1
                  srl          a7, a6, a7
                  rem          a3, s4, tp
                  c.addi4spn   a4, sp, 672
                  sub          a5, a6, a1
                  mulh         s10, t4, tp
                  c.lui        t0, 20
                  c.mv         s3, s5
                  c.and        a1, s0
                  sub          sp, s8, a4
                  c.addi4spn   s1, sp, 240
                  mulhu        t1, a0, gp
                  addi         s3, t5, -728
                  c.nop
                  remu         tp, gp, s4
                  divu         ra, a7, zero
                  c.and        a1, a3
                  c.andi       a4, -1
                  divu         s7, t1, t6
                  csrrs        s3, 0x340, zero
                  csrrwi       t0, 0x340, 31
                  ori          s2, s7, 267
                  csrrsi       a1, 0x340, 0
                  mulhu        t0, ra, zero
                  c.lui        t1, 12
                  c.mv         s6, s0
                  ori          s2, s10, -1473
                  addi         s11, s9, -1954
                  add          t6, zero, a4
                  xor          t0, s2, s10
                  sra          gp, ra, s3
                  csrrwi       a6, 0x340, 9
                  csrrwi       tp, 0x340, 15
                  sltiu        t1, tp, 82
                  slli         s10, t4, 4
                  c.slli       a4, 10
                  srli         s7, a5, 22
                  c.andi       a0, -1
                  div          a0, sp, s9
                  c.andi       s1, -1
                  c.xor        s1, a4
                  slli         s4, s3, 13
                  mul          s8, a7, s0
                  addi         t5, a1, -1750
                  csrrc        tp, 0x340, zero
                  sltu         a7, s5, a0
                  xori         s11, zero, -213
                  slli         a5, t2, 30
                  csrrw        a3, 0x340, t0
                  csrrci       ra, 0x340, 23
                  slti         s7, gp, -469
                  c.addi16sp   sp, -16
                  c.addi       t2, 17
                  mulhu        sp, tp, t5
                  csrrsi       a4, 0x340, 0
                  mulhsu       a1, a3, s11
                  c.li         ra, -1
                  auipc        a4, 1016120
                  csrrci       tp, 0x340, 4
                  c.mv         ra, a4
                  c.srli       a0, 14
                  mulhsu       a4, a7, sp
                  c.nop
                  slli         gp, t1, 15
                  mulhsu       a4, tp, a5
                  c.and        a3, a0
                  csrrw        s11, 0x340, a1
                  c.andi       a5, -1
                  c.addi4spn   a1, sp, 960
                  andi         s8, t5, 408
                  csrrw        s1, 0x340, t4
                  sub          s6, s5, a5
                  srl          t1, s11, a4
                  slli         t5, tp, 24
                  c.addi       s6, 20
                  c.slli       s1, 11
                  csrrwi       ra, 0x340, 3
                  csrrsi       a1, 0x340, 8
                  divu         a4, a6, a6
                  c.addi16sp   sp, 432
                  c.add        sp, s1
                  c.slli       a0, 25
                  slti         a5, s8, 908
                  c.li         a3, -1
                  auipc        s7, 1035933
                  c.addi4spn   a4, sp, 128
                  add          t2, s0, a6
                  and          s7, a6, t1
                  xori         t2, zero, -1619
                  remu         s8, tp, s0
                  c.mv         a1, a7
                  c.lui        ra, 26
                  sra          a1, a1, t4
                  csrrwi       a7, 0x340, 14
                  slt          t0, zero, t6
                  auipc        a4, 443132
                  c.li         tp, -1
                  addi         t0, t5, -945
                  csrrwi       s6, 0x340, 5
                  add          a4, sp, s7
                  mulhu        ra, s5, gp
                  c.addi       a7, -1
                  xor          s1, zero, a2
                  slt          s6, t3, s3
                  rem          a5, t6, a5
                  csrrci       sp, 0x340, 5
                  ori          s7, s3, -168
                  auipc        s9, 448029
                  xori         a5, s4, 823
                  mulhsu       t2, s6, gp
                  c.slli       s2, 20
                  c.addi16sp   sp, -16
                  slti         s1, a0, -116
                  rem          ra, t2, a0
                  csrrc        s2, 0x340, a2
                  c.addi16sp   sp, 480
                  sub          gp, s6, s5
                  mulh         ra, s0, t2
                  or           a0, a3, a1
                  sll          a7, tp, s3
                  c.addi16sp   sp, -16
                  slti         a1, a1, -1151
                  sltiu        a3, tp, -1184
                  slt          a3, a7, a0
                  srai         a1, s6, 3
                  c.srai       a0, 25
                  c.addi16sp   sp, -16
                  or           ra, a1, t6
                  csrrci       s11, 0x340, 0
                  div          s6, s4, tp
                  andi         a4, a3, -1805
                  div          zero, s9, s10
                  c.or         a1, a1
                  lui          s2, 466367
                  andi         t5, s6, -1882
                  div          t5, a6, s3
                  c.srli       a3, 23
                  c.nop
                  c.srai       s1, 15
                  c.sub        s1, a1
                  c.mv         s3, s11
                  sll          t0, a6, s1
                  xor          a4, t5, ra
                  ori          gp, gp, 1643
                  sltiu        t1, gp, -572
                  sltu         t1, s4, s5
                  lui          s1, 240631
                  ori          a3, t1, 67
                  andi         a3, s6, 806
                  c.mv         a0, a5
                  c.srli       s1, 15
                  c.addi16sp   sp, 32
                  ori          a0, s4, -1441
                  slli         s1, s8, 24
                  csrrci       zero, 0x340, 8
                  ori          s9, zero, -86
                  sltiu        t4, s4, 372
                  c.srai       a3, 25
                  and          s3, ra, tp
                  c.addi       gp, -1
                  and          zero, t5, t4
                  c.addi       s3, -1
                  c.li         s10, -1
                  div          a0, a4, a5
                  ori          t6, t0, 451
                  divu         ra, tp, s4
                  c.lui        s9, 30
                  csrrci       t2, 0x340, 23
                  slti         gp, s5, 1157
                  ori          a7, gp, 174
                  c.xor        a0, s0
                  c.andi       a4, 1
                  rem          s10, s2, a3
                  xori         t6, s0, -90
                  c.mv         s11, t6
                  c.andi       a4, -1
                  sll          tp, t1, a7
                  c.andi       s1, -1
                  csrrci       zero, 0x340, 0
                  csrrw        s7, 0x340, t3
                  c.xor        a4, a2
                  slli         s8, a3, 25
                  divu         s4, sp, a5
                  csrrwi       a7, 0x340, 23
                  xori         t0, sp, -1525
                  sub          a3, t2, a0
                  mulhu        a0, t0, a0
                  c.addi16sp   sp, -16
                  srli         s9, s9, 25
                  c.addi4spn   a5, sp, 960
                  la x8, test_done
                  jalr x0, x8, 0
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
                  li x25, 0x8ffffffc
                  li x7, 0xd
                  slli x7, x7, 8
                  addi x7, x7, 0x0
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x342
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x342
                  sw x7, 0(x25)
                  csrr  x7, 0x341
                  addi  x7, x7, 4
                  csrw  0x341, x7
                  add x28, x12, zero
                  lw  x1, 4(x28)
                  lw  x2, 8(x28)
                  lw  x3, 12(x28)
                  lw  x4, 16(x28)
                  lw  x5, 20(x28)
                  lw  x6, 24(x28)
                  lw  x7, 28(x28)
                  lw  x8, 32(x28)
                  lw  x9, 36(x28)
                  lw  x10, 40(x28)
                  lw  x11, 44(x28)
                  lw  x12, 48(x28)
                  lw  x13, 52(x28)
                  lw  x14, 56(x28)
                  lw  x15, 60(x28)
                  lw  x16, 64(x28)
                  lw  x17, 68(x28)
                  lw  x18, 72(x28)
                  lw  x19, 76(x28)
                  lw  x20, 80(x28)
                  lw  x21, 84(x28)
                  lw  x22, 88(x28)
                  lw  x23, 92(x28)
                  lw  x24, 96(x28)
                  lw  x25, 100(x28)
                  lw  x26, 104(x28)
                  lw  x27, 108(x28)
                  lw  x28, 112(x28)
                  lw  x29, 116(x28)
                  lw  x30, 120(x28)
                  lw  x31, 124(x28)
                  addi x28, x28, 128
                  add x12, x28, zero
                  lw  x28, (x12)
                  addi x12, x12, 4
                  mret

illegal_instr_handler:
                  li x25, 0x8ffffffc
                  li x7, 0xa
                  slli x7, x7, 8
                  addi x7, x7, 0x0
                  sw x7, 0(x25)
                  li x25, 0x8ffffffc
                  li x7, 0x342
                  slli x7, x7, 8
                  addi x7, x7, 0x3
                  sw x7, 0(x25)
                  csrr x7, 0x342
                  sw x7, 0(x25)
                  csrr  x7, 0x341
                  addi  x7, x7, 4
                  csrw  0x341, x7
                  add x28, x12, zero
                  lw  x1, 4(x28)
                  lw  x2, 8(x28)
                  lw  x3, 12(x28)
                  lw  x4, 16(x28)
                  lw  x5, 20(x28)
                  lw  x6, 24(x28)
                  lw  x7, 28(x28)
                  lw  x8, 32(x28)
                  lw  x9, 36(x28)
                  lw  x10, 40(x28)
                  lw  x11, 44(x28)
                  lw  x12, 48(x28)
                  lw  x13, 52(x28)
                  lw  x14, 56(x28)
                  lw  x15, 60(x28)
                  lw  x16, 64(x28)
                  lw  x17, 68(x28)
                  lw  x18, 72(x28)
                  lw  x19, 76(x28)
                  lw  x20, 80(x28)
                  lw  x21, 84(x28)
                  lw  x22, 88(x28)
                  lw  x23, 92(x28)
                  lw  x24, 96(x28)
                  lw  x25, 100(x28)
                  lw  x26, 104(x28)
                  lw  x27, 108(x28)
                  lw  x28, 112(x28)
                  lw  x29, 116(x28)
                  lw  x30, 120(x28)
                  lw  x31, 124(x28)
                  addi x28, x28, 128
                  add x12, x28, zero
                  lw  x28, (x12)
                  addi x12, x12, 4
                  mret

pt_fault_handler: 
                  li x25, 0x8ffffffc
                  li x7, 0x8
                  slli x7, x7, 8
                  addi x7, x7, 0x0
                  sw x7, 0(x25)
                  nop

.align 2
mmode_intr_handler:
                  csrr  x7, 0x300 # MSTATUS;
                  csrr  x7, 0x304 # MIE;
                  csrr  x7, 0x344 # MIP;
                  csrrc x7, 0x344, x7 # MIP;
                  li x25, 0x8ffffffc
                  li x7, 0x7
                  slli x7, x7, 8
                  addi x7, x7, 0x0
                  sw x7, 0(x25)
                  add x28, x12, zero
                  lw  x1, 4(x28)
                  lw  x2, 8(x28)
                  lw  x3, 12(x28)
                  lw  x4, 16(x28)
                  lw  x5, 20(x28)
                  lw  x6, 24(x28)
                  lw  x7, 28(x28)
                  lw  x8, 32(x28)
                  lw  x9, 36(x28)
                  lw  x10, 40(x28)
                  lw  x11, 44(x28)
                  lw  x12, 48(x28)
                  lw  x13, 52(x28)
                  lw  x14, 56(x28)
                  lw  x15, 60(x28)
                  lw  x16, 64(x28)
                  lw  x17, 68(x28)
                  lw  x18, 72(x28)
                  lw  x19, 76(x28)
                  lw  x20, 80(x28)
                  lw  x21, 84(x28)
                  lw  x22, 88(x28)
                  lw  x23, 92(x28)
                  lw  x24, 96(x28)
                  lw  x25, 100(x28)
                  lw  x26, 104(x28)
                  lw  x27, 108(x28)
                  lw  x28, 112(x28)
                  lw  x29, 116(x28)
                  lw  x30, 120(x28)
                  lw  x31, 124(x28)
                  addi x28, x28, 128
                  add x12, x28, zero
                  lw  x28, (x12)
                  addi x12, x12, 4
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
