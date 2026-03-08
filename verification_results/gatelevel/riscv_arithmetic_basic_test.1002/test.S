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
                  la x18, kernel_stack_end

trap_vec_init:    
                  la x27, mtvec_handler
                  ori x27, x27, 1
                  csrw 0x305, x27 # MTVEC

pmp_setup:        
                  csrwi 0x747, 4
                  la x8, main
                  li x27, 0x0
                  add x8, x8, x27
                  srli x8, x8, 2
                  csrw 0x3b0, x8
                  la x8, main
                  li x27, 0x11111111
                  add x8, x8, x27
                  srli x8, x8, 2
                  csrw 0x3b1, x8
                  la x8, main
                  li x27, 0x22222222
                  add x8, x8, x27
                  srli x8, x8, 2
                  csrw 0x3b2, x8
                  la x8, main
                  li x27, 0x33333333
                  add x8, x8, x27
                  srli x8, x8, 2
                  csrw 0x3b3, x8
                  li x8, 0xf0f0f0f
                  csrw 0x3a0, x8
                  la x8, main
                  li x27, 0x44444444
                  add x8, x8, x27
                  srli x8, x8, 2
                  csrw 0x3b4, x8
                  la x8, main
                  li x27, 0x55555555
                  add x8, x8, x27
                  srli x8, x8, 2
                  csrw 0x3b5, x8
                  la x8, main
                  li x27, 0x66666666
                  add x8, x8, x27
                  srli x8, x8, 2
                  csrw 0x3b6, x8
                  la x8, main
                  li x27, 0x77777777
                  add x8, x8, x27
                  srli x8, x8, 2
                  csrw 0x3b7, x8
                  li x8, 0xf0f0f0f
                  csrw 0x3a1, x8
                  la x8, main
                  li x27, 0x88888888
                  add x8, x8, x27
                  srli x8, x8, 2
                  csrw 0x3b8, x8
                  la x8, main
                  li x27, 0x99999999
                  add x8, x8, x27
                  srli x8, x8, 2
                  csrw 0x3b9, x8
                  la x8, main
                  li x27, 0xaaaaaaaa
                  add x8, x8, x27
                  srli x8, x8, 2
                  csrw 0x3ba, x8
                  la x8, main
                  li x27, 0xbbbbbbbb
                  add x8, x8, x27
                  srli x8, x8, 2
                  csrw 0x3bb, x8
                  li x8, 0xf0f0f0f
                  csrw 0x3a2, x8
                  la x8, main
                  li x27, 0xcccccccc
                  add x8, x8, x27
                  srli x8, x8, 2
                  csrw 0x3bc, x8
                  la x8, main
                  li x27, 0xdddddddd
                  add x8, x8, x27
                  srli x8, x8, 2
                  csrw 0x3bd, x8
                  la x8, main
                  li x27, 0xeeeeeeee
                  add x8, x8, x27
                  srli x8, x8, 2
                  csrw 0x3be, x8
                  la x8, main
                  li x27, 0xffffffff
                  add x8, x8, x27
                  srli x8, x8, 2
                  csrw 0x3bf, x8
                  li x8, 0xf0f0f0f
                  csrw 0x3a3, x8

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
                  li x13, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x300
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x304
                  sw x27, 0(x13)
                  mret
init:             
                  li x0, 0xf9cc02f0
                  li x1, 0xf6705e18
                  li x2, 0x80000000
                  li x3, 0xf0da3008
                  li x4, 0x2798de5b
                  li x5, 0x6
                  li x6, 0xf67bdfac
                  li x7, 0xf6707bab
                  li x8, 0xf06233cb
                  li x9, 0x51b95f2f
                  li x10, 0x80000000
                  li x12, 0xb44e9a66
                  li x13, 0x0
                  li x14, 0x0
                  li x15, 0x0
                  li x16, 0x80000000
                  li x17, 0xfdf2c71c
                  li x19, 0x80000000
                  li x20, 0x0
                  li x21, 0x80000000
                  li x22, 0x80000000
                  li x23, 0x27cb92e6
                  li x24, 0x4dbfcd48
                  li x25, 0x80000000
                  li x26, 0xd0a3b28c
                  li x27, 0xd4a4aa47
                  li x28, 0x80000000
                  li x29, 0xa01e2124
                  li x30, 0xf89c3ba7
                  li x31, 0xff61fb33
                  la x11, user_stack_end
                  li x13, 0x8ffffffc
                  li x27, 0x0
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x13)
                  j main
test_done:        
                  li x13, 0x8ffffff8
                  li x27, 0x0
                  slli x27, x27, 8
                  addi x27, x27, 0x1
                  sw x27, 0(x13)
                  ecall

test_fail:        
                  li x13, 0x8ffffff8
                  li x27, 0x1
                  slli x27, x27, 8
                  addi x27, x27, 0x1
                  sw x27, 0(x13)
                  ecall

mmode_intr_vector_1:
                  addi x18, x18, -4
                  sw  x11, (x18)
                  add x11, x18, zero
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
                  add x18, x11, zero
                  li x13, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x13)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x13, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x300
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x342
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x304
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x344
                  sw x27, 0(x13)
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_2:
                  addi x18, x18, -4
                  sw  x11, (x18)
                  add x11, x18, zero
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
                  add x18, x11, zero
                  li x13, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x13)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x13, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x300
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x342
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x304
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x344
                  sw x27, 0(x13)
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_3:
                  addi x18, x18, -4
                  sw  x11, (x18)
                  add x11, x18, zero
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
                  add x18, x11, zero
                  li x13, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x13)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x13, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x300
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x342
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x304
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x344
                  sw x27, 0(x13)
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_4:
                  addi x18, x18, -4
                  sw  x11, (x18)
                  add x11, x18, zero
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
                  add x18, x11, zero
                  li x13, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x13)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x13, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x300
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x342
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x304
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x344
                  sw x27, 0(x13)
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_5:
                  addi x18, x18, -4
                  sw  x11, (x18)
                  add x11, x18, zero
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
                  add x18, x11, zero
                  li x13, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x13)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x13, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x300
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x342
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x304
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x344
                  sw x27, 0(x13)
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_6:
                  addi x18, x18, -4
                  sw  x11, (x18)
                  add x11, x18, zero
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
                  add x18, x11, zero
                  li x13, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x13)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x13, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x300
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x342
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x304
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x344
                  sw x27, 0(x13)
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_7:
                  addi x18, x18, -4
                  sw  x11, (x18)
                  add x11, x18, zero
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
                  add x18, x11, zero
                  li x13, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x13)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x13, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x300
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x342
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x304
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x344
                  sw x27, 0(x13)
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_8:
                  addi x18, x18, -4
                  sw  x11, (x18)
                  add x11, x18, zero
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
                  add x18, x11, zero
                  li x13, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x13)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x13, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x300
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x342
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x304
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x344
                  sw x27, 0(x13)
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_9:
                  addi x18, x18, -4
                  sw  x11, (x18)
                  add x11, x18, zero
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
                  add x18, x11, zero
                  li x13, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x13)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x13, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x300
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x342
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x304
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x344
                  sw x27, 0(x13)
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_10:
                  addi x18, x18, -4
                  sw  x11, (x18)
                  add x11, x18, zero
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
                  add x18, x11, zero
                  li x13, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x13)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x13, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x300
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x342
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x304
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x344
                  sw x27, 0(x13)
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_11:
                  addi x18, x18, -4
                  sw  x11, (x18)
                  add x11, x18, zero
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
                  add x18, x11, zero
                  li x13, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x13)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x13, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x300
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x342
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x304
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x344
                  sw x27, 0(x13)
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_12:
                  addi x18, x18, -4
                  sw  x11, (x18)
                  add x11, x18, zero
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
                  add x18, x11, zero
                  li x13, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x13)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x13, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x300
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x342
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x304
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x344
                  sw x27, 0(x13)
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_13:
                  addi x18, x18, -4
                  sw  x11, (x18)
                  add x11, x18, zero
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
                  add x18, x11, zero
                  li x13, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x13)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x13, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x300
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x342
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x304
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x344
                  sw x27, 0(x13)
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_14:
                  addi x18, x18, -4
                  sw  x11, (x18)
                  add x11, x18, zero
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
                  add x18, x11, zero
                  li x13, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x13)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x13, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x300
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x342
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x304
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x344
                  sw x27, 0(x13)
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_15:
                  addi x18, x18, -4
                  sw  x11, (x18)
                  add x11, x18, zero
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
                  add x18, x11, zero
                  li x13, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x13)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x13, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x300
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x342
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x304
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x344
                  sw x27, 0(x13)
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_16:
                  addi x18, x18, -4
                  sw  x11, (x18)
                  add x11, x18, zero
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
                  add x18, x11, zero
                  li x13, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x13)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x13, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x300
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x342
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x304
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x344
                  sw x27, 0(x13)
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_17:
                  addi x18, x18, -4
                  sw  x11, (x18)
                  add x11, x18, zero
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
                  add x18, x11, zero
                  li x13, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x13)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x13, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x300
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x342
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x304
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x344
                  sw x27, 0(x13)
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_18:
                  addi x18, x18, -4
                  sw  x11, (x18)
                  add x11, x18, zero
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
                  add x18, x11, zero
                  li x13, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x13)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x13, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x300
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x342
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x304
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x344
                  sw x27, 0(x13)
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_19:
                  addi x18, x18, -4
                  sw  x11, (x18)
                  add x11, x18, zero
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
                  add x18, x11, zero
                  li x13, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x13)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x13, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x300
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x342
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x304
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x344
                  sw x27, 0(x13)
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_20:
                  addi x18, x18, -4
                  sw  x11, (x18)
                  add x11, x18, zero
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
                  add x18, x11, zero
                  li x13, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x13)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x13, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x300
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x342
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x304
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x344
                  sw x27, 0(x13)
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_21:
                  addi x18, x18, -4
                  sw  x11, (x18)
                  add x11, x18, zero
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
                  add x18, x11, zero
                  li x13, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x13)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x13, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x300
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x342
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x304
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x344
                  sw x27, 0(x13)
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_22:
                  addi x18, x18, -4
                  sw  x11, (x18)
                  add x11, x18, zero
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
                  add x18, x11, zero
                  li x13, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x13)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x13, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x300
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x342
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x304
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x344
                  sw x27, 0(x13)
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_23:
                  addi x18, x18, -4
                  sw  x11, (x18)
                  add x11, x18, zero
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
                  add x18, x11, zero
                  li x13, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x13)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x13, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x300
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x342
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x304
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x344
                  sw x27, 0(x13)
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_24:
                  addi x18, x18, -4
                  sw  x11, (x18)
                  add x11, x18, zero
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
                  add x18, x11, zero
                  li x13, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x13)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x13, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x300
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x342
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x304
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x344
                  sw x27, 0(x13)
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_25:
                  addi x18, x18, -4
                  sw  x11, (x18)
                  add x11, x18, zero
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
                  add x18, x11, zero
                  li x13, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x13)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x13, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x300
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x342
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x304
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x344
                  sw x27, 0(x13)
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_26:
                  addi x18, x18, -4
                  sw  x11, (x18)
                  add x11, x18, zero
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
                  add x18, x11, zero
                  li x13, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x13)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x13, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x300
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x342
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x304
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x344
                  sw x27, 0(x13)
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_27:
                  addi x18, x18, -4
                  sw  x11, (x18)
                  add x11, x18, zero
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
                  add x18, x11, zero
                  li x13, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x13)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x13, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x300
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x342
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x304
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x344
                  sw x27, 0(x13)
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_28:
                  addi x18, x18, -4
                  sw  x11, (x18)
                  add x11, x18, zero
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
                  add x18, x11, zero
                  li x13, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x13)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x13, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x300
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x342
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x304
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x344
                  sw x27, 0(x13)
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_29:
                  addi x18, x18, -4
                  sw  x11, (x18)
                  add x11, x18, zero
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
                  add x18, x11, zero
                  li x13, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x13)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x13, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x300
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x342
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x304
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x344
                  sw x27, 0(x13)
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_30:
                  addi x18, x18, -4
                  sw  x11, (x18)
                  add x11, x18, zero
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
                  add x18, x11, zero
                  li x13, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x13)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x13, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x300
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x342
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x304
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x344
                  sw x27, 0(x13)
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_31:
                  addi x18, x18, -4
                  sw  x11, (x18)
                  add x11, x18, zero
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
                  add x18, x11, zero
                  li x13, 0x8ffffffc
                  li x27, 0x6
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x13)
                  csrr x27, 0x342 # MCAUSE
                  srli x27, x27, 0x1f
                  beqz x27, 1f
                  li x13, 0x8ffffffc
                  li x27, 0x300
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x300
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x342
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x304
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x304
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x344
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x344
                  sw x27, 0(x13)
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
                  addi x18, x18, -4
                  sw  x11, (x18)
                  add x11, x18, zero
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
                  add x18, x11, zero
                  li x13, 0x8ffffffc
                  li x27, 0x8
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x13)
                  csrr x27, 0x341 # MEPC
                  csrr x27, 0x342 # MCAUSE
                  li x13, 0x3 # BREAKPOINT
                  beq x27, x13, ebreak_handler
                  li x13, 0x8 # ECALL_UMODE
                  beq x27, x13, ecall_handler
                  li x13, 0x9 # ECALL_SMODE
                  beq x27, x13, ecall_handler
                  li x13, 0xb # ECALL_MMODE
                  beq x27, x13, ecall_handler
                  li x13, 0x1
                  beq x27, x13, instr_fault_handler
                  li x13, 0x5
                  beq x27, x13, load_fault_handler
                  li x13, 0x7
                  beq x27, x13, store_fault_handler
                  li x13, 0xc
                  beq x27, x13, pt_fault_handler
                  li x13, 0xd
                  beq x27, x13, pt_fault_handler
                  li x13, 0xf
                  beq x27, x13, pt_fault_handler
                  li x13, 0x2 # ILLEGAL_INSTRUCTION
                  beq x27, x13, illegal_instr_handler
                  csrr x13, 0x343 # MTVAL
                  1: la x8, test_done
                  jalr x1, x8, 0

ecall_handler:    
                  li x13, 0x8ffffffc
                  li x27, 0xb00
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0xb00
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0xb80
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0xb80
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0xb03
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0xb03
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0xb83
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0xb83
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0xb04
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0xb04
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0xb84
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0xb84
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0xb05
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0xb05
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0xb85
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0xb85
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0xb06
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0xb06
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0xb86
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0xb86
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0xb07
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0xb07
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0xb87
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0xb87
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0xb08
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0xb08
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0xb88
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0xb88
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0xb09
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0xb09
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0xb89
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0xb89
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0xb0a
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0xb0a
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0xb8a
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0xb8a
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0xb0b
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0xb0b
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0xb8b
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0xb8b
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0xb0c
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0xb0c
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0xb8c
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0xb8c
                  sw x27, 0(x13)
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
                  li x13, 0x8ffffffc
                  li x27, 0x9
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x342
                  sw x27, 0(x13)
                  li x27, 0
                  mv x6, x27
                  li x25, 0
                  0: mv x27, x6
                  mv x8, x27
                  li x8, 0
                  beq x27, x8, 1f
                  li x8, 1
                  beq x27, x8, 2f
                  li x8, 2
                  beq x27, x8, 3f
                  li x8, 3
                  beq x27, x8, 4f
                  li x8, 4
                  beq x27, x8, 5f
                  li x8, 5
                  beq x27, x8, 6f
                  li x8, 6
                  beq x27, x8, 7f
                  li x8, 7
                  beq x27, x8, 8f
                  li x8, 8
                  beq x27, x8, 9f
                  li x8, 9
                  beq x27, x8, 10f
                  li x8, 10
                  beq x27, x8, 11f
                  li x8, 11
                  beq x27, x8, 12f
                  li x8, 12
                  beq x27, x8, 13f
                  li x8, 13
                  beq x27, x8, 14f
                  li x8, 14
                  beq x27, x8, 15f
                  li x8, 15
                  beq x27, x8, 16f
                  1: csrr x13, 0x3b0
                  csrr x5, 0x3a0
                  j 17f
                  2: csrr x13, 0x3b1
                  csrr x5, 0x3a0
                  j 17f
                  3: csrr x13, 0x3b2
                  csrr x5, 0x3a0
                  j 17f
                  4: csrr x13, 0x3b3
                  csrr x5, 0x3a0
                  j 17f
                  5: csrr x13, 0x3b4
                  csrr x5, 0x3a1
                  j 17f
                  6: csrr x13, 0x3b5
                  csrr x5, 0x3a1
                  j 17f
                  7: csrr x13, 0x3b6
                  csrr x5, 0x3a1
                  j 17f
                  8: csrr x13, 0x3b7
                  csrr x5, 0x3a1
                  j 17f
                  9: csrr x13, 0x3b8
                  csrr x5, 0x3a2
                  j 17f
                  10: csrr x13, 0x3b9
                  csrr x5, 0x3a2
                  j 17f
                  11: csrr x13, 0x3ba
                  csrr x5, 0x3a2
                  j 17f
                  12: csrr x13, 0x3bb
                  csrr x5, 0x3a2
                  j 17f
                  13: csrr x13, 0x3bc
                  csrr x5, 0x3a3
                  j 17f
                  14: csrr x13, 0x3bd
                  csrr x5, 0x3a3
                  j 17f
                  15: csrr x13, 0x3be
                  csrr x5, 0x3a3
                  j 17f
                  16: csrr x13, 0x3bf
                  csrr x5, 0x3a3
                  j 17f
                  17: li x4, 4
                  slli x27, x6, 30
                  srli x27, x27, 30
                  sub x8, x4, x27
                  addi x8, x8, -1
                  slli x8, x8, 3
                  sll x4, x5, x8
                  slli x27, x27, 3
                  add x8, x8, x27
                  srl x4, x4, x8
                  slli x8, x4, 27
                  srli x8, x8, 30
                  beqz x8, 20f
                  li x27, 1
                  beq x8, x27, 21f
                  li x27, 2
                  beq x8, x27, 24f
                  li x27, 3
                  beq x8, x27, 25f
                  la x27, test_done
                  jalr x0, x27, 0
                  18: mv x27, x6
                  mv x25, x13
                  addi x27, x27, 1
                  mv x6, x27
                  li x13, 16
                  ble x13, x27, 19f
                  j 0b
                  19: csrr x27, 0x747
                  andi x27, x27, 2
                  bnez x27, 27f
                  la x27, test_done
                  jalr x0, x27, 0
                  20: j 18b
                  21: mv x27, x6
                  csrr x8, 0x343
                  srli x8, x8, 2
                  bnez x27, 22f
                  bltz x8, 18b
                  j 23f
                  22: bgtu x25, x8, 18b
                  23: bleu x13, x8, 18b
                  j 26f
                  24: csrr x27, 0x343
                  srli x27, x27, 2
                  slli x8, x13, 2
                  srli x8, x8, 2
                  bne x27, x8, 18b
                  j 26f
                  25: csrr x27, 0x343
                  srli x27, x27, 2
                  srli x27, x27, 0
                  slli x27, x27, 0
                  slli x8, x13, 2
                  srli x8, x8, 2
                  srli x8, x8, 0
                  slli x8, x8, 0
                  bne x27, x8, 18b
                  j 26f
                  26: csrr x8, 0x747
                  andi x8, x8, 1
                  bnez x8, 27f
                  andi x8, x4, 128
                  bnez x8, 27f
                  j 29f
                  27: la x27, test_done
                  jalr x0, x27, 0
                  29: ori x4, x4, 4
                  li x8, 30
                  sll x27, x6, x8
                  srl x27, x27, x8
                  slli x8, x27, 3
                  sll x4, x4, x8
                  or x5, x5, x4
                  mv x27, x6
                  srli x27, x27, 2
                  beqz x27, 30f
                  li x8, 1
                  beq x27, x8, 31f
                  li x8, 2
                  beq x27, x8, 32f
                  li x8, 3
                  beq x27, x8, 33f
                  30: csrw 0x3a0, x5
                  j 34f
                  31: csrw 0x3a1, x5
                  j 34f
                  32: csrw 0x3a2, x5
                  j 34f
                  33: csrw 0x3a3, x5
                  34: nop
                  add x11, x18, zero
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
                  add x18, x11, zero
                  lw  x11, (x18)
                  addi x18, x18, 4
                  mret

load_fault_handler:
                  li x13, 0x8ffffffc
                  li x27, 0xb
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x342
                  sw x27, 0(x13)
                  li x27, 0
                  mv x6, x27
                  li x25, 0
                  0: mv x27, x6
                  mv x8, x27
                  li x8, 0
                  beq x27, x8, 1f
                  li x8, 1
                  beq x27, x8, 2f
                  li x8, 2
                  beq x27, x8, 3f
                  li x8, 3
                  beq x27, x8, 4f
                  li x8, 4
                  beq x27, x8, 5f
                  li x8, 5
                  beq x27, x8, 6f
                  li x8, 6
                  beq x27, x8, 7f
                  li x8, 7
                  beq x27, x8, 8f
                  li x8, 8
                  beq x27, x8, 9f
                  li x8, 9
                  beq x27, x8, 10f
                  li x8, 10
                  beq x27, x8, 11f
                  li x8, 11
                  beq x27, x8, 12f
                  li x8, 12
                  beq x27, x8, 13f
                  li x8, 13
                  beq x27, x8, 14f
                  li x8, 14
                  beq x27, x8, 15f
                  li x8, 15
                  beq x27, x8, 16f
                  1: csrr x13, 0x3b0
                  csrr x5, 0x3a0
                  j 17f
                  2: csrr x13, 0x3b1
                  csrr x5, 0x3a0
                  j 17f
                  3: csrr x13, 0x3b2
                  csrr x5, 0x3a0
                  j 17f
                  4: csrr x13, 0x3b3
                  csrr x5, 0x3a0
                  j 17f
                  5: csrr x13, 0x3b4
                  csrr x5, 0x3a1
                  j 17f
                  6: csrr x13, 0x3b5
                  csrr x5, 0x3a1
                  j 17f
                  7: csrr x13, 0x3b6
                  csrr x5, 0x3a1
                  j 17f
                  8: csrr x13, 0x3b7
                  csrr x5, 0x3a1
                  j 17f
                  9: csrr x13, 0x3b8
                  csrr x5, 0x3a2
                  j 17f
                  10: csrr x13, 0x3b9
                  csrr x5, 0x3a2
                  j 17f
                  11: csrr x13, 0x3ba
                  csrr x5, 0x3a2
                  j 17f
                  12: csrr x13, 0x3bb
                  csrr x5, 0x3a2
                  j 17f
                  13: csrr x13, 0x3bc
                  csrr x5, 0x3a3
                  j 17f
                  14: csrr x13, 0x3bd
                  csrr x5, 0x3a3
                  j 17f
                  15: csrr x13, 0x3be
                  csrr x5, 0x3a3
                  j 17f
                  16: csrr x13, 0x3bf
                  csrr x5, 0x3a3
                  j 17f
                  17: li x4, 4
                  slli x27, x6, 30
                  srli x27, x27, 30
                  sub x8, x4, x27
                  addi x8, x8, -1
                  slli x8, x8, 3
                  sll x4, x5, x8
                  slli x27, x27, 3
                  add x8, x8, x27
                  srl x4, x4, x8
                  slli x8, x4, 27
                  srli x8, x8, 30
                  beqz x8, 20f
                  li x27, 1
                  beq x8, x27, 21f
                  li x27, 2
                  beq x8, x27, 24f
                  li x27, 3
                  beq x8, x27, 25f
                  la x27, test_done
                  jalr x0, x27, 0
                  18: mv x27, x6
                  mv x25, x13
                  addi x27, x27, 1
                  mv x6, x27
                  li x13, 16
                  ble x13, x27, 19f
                  j 0b
                  19: csrr x27, 0x747
                  andi x27, x27, 2
                  bnez x27, 27f
                  la x27, test_done
                  jalr x0, x27, 0
                  20: j 18b
                  21: mv x27, x6
                  csrr x8, 0x343
                  srli x8, x8, 2
                  bnez x27, 22f
                  bltz x8, 18b
                  j 23f
                  22: bgtu x25, x8, 18b
                  23: bleu x13, x8, 18b
                  j 26f
                  24: csrr x27, 0x343
                  srli x27, x27, 2
                  slli x8, x13, 2
                  srli x8, x8, 2
                  bne x27, x8, 18b
                  j 26f
                  25: csrr x27, 0x343
                  srli x27, x27, 2
                  srli x27, x27, 0
                  slli x27, x27, 0
                  slli x8, x13, 2
                  srli x8, x8, 2
                  srli x8, x8, 0
                  slli x8, x8, 0
                  bne x27, x8, 18b
                  j 26f
                  26: csrr x8, 0x747
                  andi x8, x8, 1
                  bnez x8, 27f
                  andi x8, x4, 128
                  bnez x8, 27f
                  j 29f
                  27: csrr x27, 0x341
                  la x8, main
                  bge x27, x8, 40f
                  la x27, test_done
                  jalr x0, x27, 0
                  40: lw x27, 0(x27)
                  li x8, 3
                  and x27, x27, x8
                  beq x27, x8, 28f
                  csrr x27, 0x341
                  addi x27, x27, 2
                  csrw 0x341, x27
                  j 34f
                  28: csrr x27, 0x341
                  addi x27, x27, 4
                  csrw 0x341, x27
                  j 34f
                  29: ori x4, x4, 1
                  li x8, 30
                  sll x27, x6, x8
                  srl x27, x27, x8
                  slli x8, x27, 3
                  sll x4, x4, x8
                  or x5, x5, x4
                  mv x27, x6
                  srli x27, x27, 2
                  beqz x27, 30f
                  li x8, 1
                  beq x27, x8, 31f
                  li x8, 2
                  beq x27, x8, 32f
                  li x8, 3
                  beq x27, x8, 33f
                  30: csrw 0x3a0, x5
                  j 34f
                  31: csrw 0x3a1, x5
                  j 34f
                  32: csrw 0x3a2, x5
                  j 34f
                  33: csrw 0x3a3, x5
                  34: nop
                  add x11, x18, zero
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
                  add x18, x11, zero
                  lw  x11, (x18)
                  addi x18, x18, 4
                  mret

store_fault_handler:
                  li x13, 0x8ffffffc
                  li x27, 0xc
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x342
                  sw x27, 0(x13)
                  li x27, 0
                  mv x6, x27
                  li x25, 0
                  0: mv x27, x6
                  mv x8, x27
                  li x8, 0
                  beq x27, x8, 1f
                  li x8, 1
                  beq x27, x8, 2f
                  li x8, 2
                  beq x27, x8, 3f
                  li x8, 3
                  beq x27, x8, 4f
                  li x8, 4
                  beq x27, x8, 5f
                  li x8, 5
                  beq x27, x8, 6f
                  li x8, 6
                  beq x27, x8, 7f
                  li x8, 7
                  beq x27, x8, 8f
                  li x8, 8
                  beq x27, x8, 9f
                  li x8, 9
                  beq x27, x8, 10f
                  li x8, 10
                  beq x27, x8, 11f
                  li x8, 11
                  beq x27, x8, 12f
                  li x8, 12
                  beq x27, x8, 13f
                  li x8, 13
                  beq x27, x8, 14f
                  li x8, 14
                  beq x27, x8, 15f
                  li x8, 15
                  beq x27, x8, 16f
                  1: csrr x13, 0x3b0
                  csrr x5, 0x3a0
                  j 17f
                  2: csrr x13, 0x3b1
                  csrr x5, 0x3a0
                  j 17f
                  3: csrr x13, 0x3b2
                  csrr x5, 0x3a0
                  j 17f
                  4: csrr x13, 0x3b3
                  csrr x5, 0x3a0
                  j 17f
                  5: csrr x13, 0x3b4
                  csrr x5, 0x3a1
                  j 17f
                  6: csrr x13, 0x3b5
                  csrr x5, 0x3a1
                  j 17f
                  7: csrr x13, 0x3b6
                  csrr x5, 0x3a1
                  j 17f
                  8: csrr x13, 0x3b7
                  csrr x5, 0x3a1
                  j 17f
                  9: csrr x13, 0x3b8
                  csrr x5, 0x3a2
                  j 17f
                  10: csrr x13, 0x3b9
                  csrr x5, 0x3a2
                  j 17f
                  11: csrr x13, 0x3ba
                  csrr x5, 0x3a2
                  j 17f
                  12: csrr x13, 0x3bb
                  csrr x5, 0x3a2
                  j 17f
                  13: csrr x13, 0x3bc
                  csrr x5, 0x3a3
                  j 17f
                  14: csrr x13, 0x3bd
                  csrr x5, 0x3a3
                  j 17f
                  15: csrr x13, 0x3be
                  csrr x5, 0x3a3
                  j 17f
                  16: csrr x13, 0x3bf
                  csrr x5, 0x3a3
                  j 17f
                  17: li x4, 4
                  slli x27, x6, 30
                  srli x27, x27, 30
                  sub x8, x4, x27
                  addi x8, x8, -1
                  slli x8, x8, 3
                  sll x4, x5, x8
                  slli x27, x27, 3
                  add x8, x8, x27
                  srl x4, x4, x8
                  slli x8, x4, 27
                  srli x8, x8, 30
                  beqz x8, 20f
                  li x27, 1
                  beq x8, x27, 21f
                  li x27, 2
                  beq x8, x27, 24f
                  li x27, 3
                  beq x8, x27, 25f
                  la x27, test_done
                  jalr x0, x27, 0
                  18: mv x27, x6
                  mv x25, x13
                  addi x27, x27, 1
                  mv x6, x27
                  li x13, 16
                  ble x13, x27, 19f
                  j 0b
                  19: csrr x27, 0x747
                  andi x27, x27, 2
                  bnez x27, 27f
                  la x27, test_done
                  jalr x0, x27, 0
                  20: j 18b
                  21: mv x27, x6
                  csrr x8, 0x343
                  srli x8, x8, 2
                  bnez x27, 22f
                  bltz x8, 18b
                  j 23f
                  22: bgtu x25, x8, 18b
                  23: bleu x13, x8, 18b
                  j 26f
                  24: csrr x27, 0x343
                  srli x27, x27, 2
                  slli x8, x13, 2
                  srli x8, x8, 2
                  bne x27, x8, 18b
                  j 26f
                  25: csrr x27, 0x343
                  srli x27, x27, 2
                  srli x27, x27, 0
                  slli x27, x27, 0
                  slli x8, x13, 2
                  srli x8, x8, 2
                  srli x8, x8, 0
                  slli x8, x8, 0
                  bne x27, x8, 18b
                  j 26f
                  26: csrr x8, 0x747
                  andi x8, x8, 1
                  bnez x8, 27f
                  andi x8, x4, 128
                  bnez x8, 27f
                  j 29f
                  27: csrr x27, 0x341
                  lw x27, 0(x27)
                  li x8, 3
                  and x27, x27, x8
                  beq x27, x8, 28f
                  csrr x27, 0x341
                  addi x27, x27, 2
                  csrw 0x341, x27
                  j 34f
                  28: csrr x27, 0x341
                  addi x27, x27, 4
                  csrw 0x341, x27
                  j 34f
                  29: ori x4, x4, 3
                  li x8, 30
                  sll x27, x6, x8
                  srl x27, x27, x8
                  slli x8, x27, 3
                  sll x4, x4, x8
                  or x5, x5, x4
                  mv x27, x6
                  srli x27, x27, 2
                  beqz x27, 30f
                  li x8, 1
                  beq x27, x8, 31f
                  li x8, 2
                  beq x27, x8, 32f
                  li x8, 3
                  beq x27, x8, 33f
                  30: csrw 0x3a0, x5
                  j 34f
                  31: csrw 0x3a1, x5
                  j 34f
                  32: csrw 0x3a2, x5
                  j 34f
                  33: csrw 0x3a3, x5
                  34: nop
                  add x11, x18, zero
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
                  add x18, x11, zero
                  lw  x11, (x18)
                  addi x18, x18, 4
                  mret

.align 2
main:             c.sub        a2, a1
                  csrrw        a6, 0x340, s7
                  c.srai       a0, 31
                  sltu         t3, zero, t2
                  c.addi4spn   a5, sp, 288
                  c.addi       t1, 3
                  xori         t3, s8, 1908
                  mulhu        a4, s1, gp
                  andi         s6, a2, 1008
                  slt          gp, a2, t4
                  xori         zero, s7, -1650
                  mulh         a7, s8, s5
                  c.nop
                  lui          tp, 482188
                  nop
                  srai         t0, a1, 28
                  slli         s6, a0, 8
                  c.slli       s6, 30
                  sltu         t0, sp, ra
                  sltiu        s4, t1, -330
                  csrrw        t3, 0x340, tp
                  c.and        a5, s0
                  lui          a3, 930763
                  c.lui        t2, 21
                  c.lui        s5, 17
                  nop
                  c.mv         sp, t2
                  c.li         s10, -1
                  mul          s8, tp, a2
                  mulhu        sp, sp, s0
                  mulhsu       s3, a2, s6
                  mul          a5, t5, a5
                  auipc        a0, 42214
                  lui          s4, 891535
                  c.li         s7, -1
                  mul          a7, sp, s4
                  slt          a4, s3, t6
                  addi         a5, t5, -662
                  srli         t2, a0, 0
                  mulhu        s6, t4, a2
                  nop
                  remu         a0, a5, s6
                  mulhu        t5, s4, a5
                  c.addi4spn   a4, sp, 336
                  sltiu        s1, a2, 2032
                  andi         tp, sp, -1033
                  c.sub        a0, a1
                  div          t2, ra, t1
                  andi         a2, gp, -33
                  ori          a7, s4, -1455
                  c.addi       t3, -1
                  slti         zero, t0, 666
                  srai         s9, a3, 5
                  slt          ra, a7, tp
                  c.and        a4, a3
                  c.addi4spn   a3, sp, 528
                  rem          t6, s9, s10
                  c.srai       a2, 21
                  c.nop
                  sll          a4, ra, tp
                  csrrwi       s8, 0x340, 17
                  c.srai       a0, 21
                  c.and        a4, s0
                  c.slli       a5, 3
                  csrrw        a7, 0x340, t4
                  nop
                  lui          a3, 935060
                  c.and        a2, s0
                  c.andi       a0, 2
                  xor          a5, t2, gp
                  sra          t4, s8, a3
                  c.addi4spn   a3, sp, 832
                  remu         s6, gp, a2
                  addi         a0, s3, 626
                  c.srai       a4, 10
                  c.addi16sp   sp, -16
                  sub          a2, s10, gp
                  slli         t3, s10, 20
                  c.li         s9, -1
                  sll          s4, tp, s4
                  c.slli       s7, 2
                  andi         a3, a1, 991
                  and          t3, t0, t2
                  csrrci       s7, 0x340, 12
                  c.srli       a5, 27
                  c.addi4spn   a0, sp, 592
                  c.and        s1, a1
                  c.addi4spn   a3, sp, 608
                  c.add        ra, s5
                  slli         a7, sp, 15
                  c.xor        a5, a5
                  c.addi4spn   a4, sp, 416
                  divu         s3, t4, a2
                  c.addi16sp   sp, 240
                  xor          t1, s6, s6
                  lui          a4, 439473
                  csrrc        s3, 0x340, s3
                  sll          t2, s8, t6
                  mulhsu       s6, t4, ra
                  c.xor        a4, a5
                  remu         a2, a7, ra
                  sll          s9, a2, s4
                  c.addi       t5, 3
                  csrrs        s8, 0x340, s3
                  csrrsi       zero, 0x340, 0
                  srai         a3, s3, 19
                  c.and        a4, s0
                  csrrci       t0, 0x340, 0
                  c.xor        a2, a4
                  add          ra, s10, t1
                  slt          t6, sp, a1
                  xori         s11, a1, -189
                  c.lui        s9, 14
                  lui          t1, 726654
                  sll          ra, s8, a5
                  c.add        t6, s6
                  lui          ra, 116585
                  c.and        a2, a2
                  srli         s4, s2, 26
                  mul          a6, s4, s2
                  csrrw        s4, 0x340, t4
                  c.addi       s5, 21
                  sltu         s11, s3, a3
                  c.or         s1, a1
                  sltiu        a6, a7, -1418
                  c.or         a0, a2
                  divu         s11, s11, s6
                  c.add        a0, a6
                  auipc        tp, 114175
                  c.srli       a4, 15
                  addi         s9, ra, 305
                  slt          zero, a7, sp
                  xor          t3, t0, tp
                  rem          a2, s8, s2
                  c.lui        a6, 18
                  csrrci       tp, 0x340, 0
                  c.mv         s6, t2
                  c.and        a2, a1
                  csrrc        a3, 0x340, zero
                  slt          s6, a1, s11
                  c.lui        t4, 1
                  csrrs        s7, 0x340, zero
                  divu         s6, t4, s0
                  mulh         s5, t0, s9
                  c.mv         s4, t1
                  c.srai       a3, 16
                  auipc        s11, 185367
                  xor          a3, sp, s6
                  csrrs        s6, 0x340, a1
                  xori         s8, t5, -1791
                  mulhu        tp, tp, sp
                  csrrsi       a6, 0x340, 0
                  slt          a6, s11, s1
                  or           t1, a3, t4
                  c.andi       a3, 12
                  mulhsu       a6, s10, a4
                  c.andi       a4, -1
                  csrrw        a4, 0x340, sp
                  csrrs        a6, 0x340, zero
                  sltiu        a2, a0, -475
                  c.nop
                  lui          s10, 51104
                  c.andi       a3, 29
                  csrrwi       sp, 0x340, 22
                  c.srli       s1, 4
                  c.addi       s4, -1
                  sll          a0, s9, t3
                  c.mv         t6, a5
                  csrrw        s1, 0x340, a7
                  csrrs        t0, 0x340, t3
                  c.or         a0, a4
                  csrrci       t2, 0x340, 1
                  add          a2, t1, sp
                  c.add        s5, t3
                  or           t3, a4, s7
                  srl          a6, s5, s4
                  sll          t6, zero, s6
                  sll          t5, a4, s8
                  c.mv         s1, s6
                  sltu         a3, s8, s11
                  ori          s8, t0, -1715
                  or           s11, ra, s1
                  rem          zero, s3, s11
                  csrrc        a6, 0x340, s10
                  rem          t0, a3, s9
                  mul          s5, a5, s10
                  xori         t1, t4, 984
                  divu         s7, t2, tp
                  c.addi4spn   s1, sp, 272
                  c.addi4spn   a5, sp, 688
                  c.srli       a4, 10
                  srai         sp, s4, 4
                  rem          s10, s7, sp
                  div          t2, a6, s10
                  c.and        s1, a2
                  remu         s4, s3, t4
                  slli         s11, a6, 21
                  and          s8, ra, s5
                  srai         a5, a4, 29
                  sra          s4, a7, t1
                  c.addi16sp   sp, 496
                  or           a2, a1, sp
                  or           gp, t2, s0
                  rem          t5, zero, s10
                  c.addi4spn   s1, sp, 688
                  mulhu        s8, s4, s6
                  sra          tp, a0, a6
                  c.or         s1, a4
                  c.xor        a5, a5
                  ori          s5, a5, -804
                  sltu         s11, s4, a1
                  xori         t0, s9, -1099
                  mulhsu       gp, t4, s6
                  lui          ra, 959900
                  c.lui        s8, 24
                  slti         s6, s9, 1719
                  slt          s6, t2, t5
                  lui          sp, 1010878
                  rem          zero, s7, a4
                  c.srai       a0, 10
                  csrrci       s3, 0x340, 0
                  rem          a3, a7, s5
                  auipc        a7, 896408
                  c.and        a4, a5
                  xori         s1, a1, -1108
                  c.and        a0, a4
                  add          t4, a4, ra
                  andi         ra, a2, 862
                  c.nop
                  mul          gp, gp, s10
                  xori         s11, s2, -1532
                  slti         ra, zero, -505
                  sll          t6, s5, sp
                  and          zero, t2, a0
                  c.srai       a3, 7
                  c.lui        tp, 23
                  c.sub        a5, a2
                  c.or         a5, a0
                  div          a0, t1, s9
                  c.mv         ra, a4
                  csrrwi       a2, 0x340, 1
                  sll          t3, a1, s7
                  slti         s4, s9, -1388
                  c.xor        a5, a5
                  add          a4, zero, s10
                  csrrsi       tp, 0x340, 11
                  slti         s6, a0, 1345
                  c.sub        a4, a3
                  sub          a0, s9, t5
                  sltiu        s4, s11, 1789
                  c.li         s11, -1
                  andi         s11, tp, -1389
                  slt          a4, s3, t2
                  or           s10, s10, s7
                  mulh         tp, gp, ra
                  c.srai       a5, 10
                  addi         s10, s0, -381
                  rem          s4, a4, s2
                  rem          s7, s6, a2
                  c.addi       t1, -1
                  slli         zero, s2, 10
                  c.sub        a5, a0
                  csrrwi       s10, 0x340, 7
                  c.srli       a2, 15
                  c.addi16sp   sp, -16
                  c.mv         a6, t6
                  ori          a5, t6, 1444
                  sltu         s1, t3, s7
                  csrrs        a5, 0x340, t0
                  slti         t2, gp, -1562
                  slti         t3, s0, 617
                  c.addi       a4, 9
                  xor          ra, a3, s0
                  c.lui        s8, 4
                  c.xor        s1, a0
                  c.slli       s9, 24
                  slti         a5, a0, 1720
                  sub          t0, s9, a3
                  csrrsi       t3, 0x340, 0
                  divu         t2, t3, s7
                  slti         gp, s6, -1908
                  auipc        a5, 922360
                  slli         s4, t3, 25
                  rem          a4, a6, t4
                  c.srli       a5, 7
                  sub          a3, a7, s6
                  srl          s7, t1, ra
                  lui          a4, 67468
                  c.mv         a2, a1
                  xori         s9, t6, -703
                  sra          ra, ra, t2
                  c.nop
                  c.addi16sp   sp, -16
                  c.srai       a3, 31
                  c.slli       t5, 8
                  c.nop
                  divu         gp, s6, tp
                  c.andi       a3, 12
                  srai         a0, s3, 29
                  c.slli       a0, 13
                  srl          a2, s4, t6
                  c.and        a5, s0
                  c.add        s8, a6
                  mul          t0, a3, s9
                  sltiu        a4, t6, 413
                  xor          a7, a7, s6
                  srai         t3, t0, 28
                  c.and        a4, a1
                  xor          s10, s5, a2
                  mulhu        s9, s5, s5
                  and          t2, s4, ra
                  slt          s10, ra, s1
                  c.srli       a4, 26
                  csrrs        a2, 0x340, zero
                  nop
                  ori          s4, s6, 1048
                  and          t2, zero, t5
                  c.addi4spn   a5, sp, 848
                  c.srli       a5, 5
                  c.xor        a4, s1
                  srai         s9, s11, 18
                  c.addi       s1, 8
                  add          s7, ra, a6
                  c.and        a2, a3
                  c.or         a3, a4
                  c.srli       a0, 6
                  lui          gp, 344626
                  c.srli       a0, 10
                  c.li         gp, -1
                  slti         t3, t6, -831
                  sltiu        t5, s5, 1478
                  sll          gp, s9, s10
                  and          t6, s9, s0
                  sll          t5, s7, a4
                  c.srai       a3, 5
                  c.mv         a7, t2
                  csrrsi       ra, 0x340, 23
                  and          gp, s9, t6
                  slti         s4, t2, -813
                  csrrsi       t6, 0x340, 20
                  csrrci       s10, 0x340, 10
                  div          a2, s0, s10
                  mul          s1, s5, s0
                  slt          s8, ra, t0
                  slt          a7, t0, sp
                  c.addi16sp   sp, 224
                  and          s11, zero, s5
                  srai         a0, t4, 4
                  csrrs        s5, 0x340, zero
                  mulhu        s1, s3, a4
                  add          a0, a0, t1
                  sltu         a3, t1, a4
                  div          a7, a0, a1
                  div          a0, t0, zero
                  c.addi4spn   a0, sp, 544
                  rem          t4, s9, tp
                  rem          a0, t1, gp
                  mulhsu       t3, zero, t4
                  c.or         a3, a4
                  c.add        ra, t0
                  csrrs        t1, 0x340, s4
                  ori          s11, gp, -910
                  slt          a2, a4, t5
                  add          a0, t3, s9
                  sra          zero, t0, s1
                  slti         a4, ra, 1797
                  c.lui        s3, 5
                  sltiu        a3, s11, 924
                  c.addi16sp   sp, 64
                  ori          a2, t0, -172
                  mulh         s5, a0, s1
                  divu         a5, t4, s0
                  srai         s4, a7, 21
                  divu         t2, s0, s9
                  mul          s5, t4, tp
                  ori          s9, s9, 504
                  remu         a0, s1, s3
                  srli         s9, s9, 19
                  csrrc        a4, 0x340, zero
                  and          gp, a7, t3
                  c.mv         t3, t6
                  slli         sp, s0, 28
                  and          s3, t0, a1
                  xori         s4, t2, 382
                  rem          a3, a5, a4
                  and          s5, zero, s10
                  xori         tp, t6, -408
                  nop
                  csrrw        t0, 0x340, a3
                  csrrci       t0, 0x340, 28
                  xor          t5, gp, a1
                  slti         s5, a0, 1230
                  xori         ra, sp, 1971
                  xor          s3, s9, a5
                  add          a5, ra, t2
                  c.li         t4, 11
                  div          tp, s9, t6
                  c.mv         a6, t5
                  sra          s8, s4, s4
                  csrrsi       ra, 0x340, 4
                  c.addi16sp   sp, -16
                  rem          sp, a7, s2
                  mulh         a4, a7, t3
                  sltiu        t6, a0, 1254
                  lui          t1, 231606
                  slti         a6, tp, -129
                  c.or         a2, a1
                  c.or         a4, a1
                  addi         s10, t4, -1429
                  c.slli       t0, 27
                  slti         sp, t5, 1445
                  c.li         t3, 3
                  slt          s10, a5, a6
                  div          a6, a0, a1
                  remu         s9, t0, t1
                  srai         a3, t6, 11
                  xori         s9, s1, -1295
                  rem          s10, a3, a7
                  c.and        a2, s0
                  addi         t2, t2, 50
                  divu         tp, s3, s8
                  csrrsi       a6, 0x340, 0
                  andi         s10, sp, -769
                  csrrc        zero, 0x340, a1
                  remu         a5, t2, t5
                  mulhsu       s10, s11, t2
                  xori         a2, a4, 356
                  div          s11, a6, t0
                  addi         a5, a1, 1643
                  sub          s7, s5, s7
                  andi         gp, s8, 1446
                  sll          a0, s0, t3
                  mulhsu       gp, s10, a4
                  csrrw        t0, 0x340, s2
                  c.xor        a5, a1
                  slti         a5, s7, -1755
                  c.add        s1, s10
                  c.mv         a6, a5
                  slli         a6, t0, 27
                  add          a5, s3, s1
                  xor          t1, t6, s2
                  div          s8, s3, a5
                  c.addi4spn   a4, sp, 528
                  srai         s5, a3, 31
                  c.addi16sp   sp, 160
                  c.srai       a2, 13
                  sll          a6, s3, s11
                  c.addi4spn   a3, sp, 752
                  c.addi       s3, 28
                  c.addi4spn   s1, sp, 912
                  c.lui        t3, 24
                  c.addi       a5, 10
                  csrrwi       s10, 0x340, 22
                  srli         a0, a1, 26
                  sll          t5, t2, a4
                  csrrsi       s11, 0x340, 0
                  auipc        t5, 439975
                  csrrwi       s5, 0x340, 26
                  div          s7, t3, s8
                  rem          t1, t3, a1
                  srli         a6, s5, 25
                  rem          s7, s2, s9
                  add          t5, sp, t5
                  slt          s5, a1, a0
                  srli         tp, s4, 28
                  c.xor        a0, s0
                  mulhu        t2, s4, t1
                  or           s6, s1, s4
                  c.nop
                  or           gp, s7, t0
                  c.li         s6, -1
                  mulhu        s4, s5, s6
                  slt          s11, a2, s3
                  or           zero, zero, s4
                  sltiu        a7, s4, -956
                  sra          s7, a4, t2
                  slti         s10, gp, -1024
                  c.slli       tp, 2
                  c.addi       sp, -1
                  csrrc        s3, 0x340, t0
                  addi         s9, gp, 602
                  lui          a4, 870049
                  ori          t2, s7, -953
                  c.and        a5, a1
                  c.andi       a5, -1
                  sra          a3, a0, zero
                  sra          s8, s1, s1
                  c.or         s1, s1
                  xori         t5, a1, 1780
                  sltiu        ra, s3, -373
                  c.mv         t5, a4
                  c.lui        a4, 21
                  sra          a2, s2, t5
                  csrrwi       t5, 0x340, 13
                  c.and        a4, a5
                  csrrs        s1, 0x340, t3
                  sra          sp, s11, s3
                  srli         t3, t3, 25
                  c.xor        a3, a3
                  remu         s1, s9, s9
                  c.mv         t1, t4
                  remu         a4, zero, s9
                  srai         t2, s5, 18
                  add          a6, s7, t4
                  c.srli       a0, 17
                  andi         s8, s4, -180
                  csrrw        sp, 0x340, t2
                  slli         sp, s6, 4
                  c.addi       a2, -1
                  c.nop
                  c.slli       ra, 2
                  sltiu        a0, t4, -76
                  c.slli       a4, 14
                  mul          t4, t2, s9
                  mulhu        s11, a2, a3
                  and          t2, gp, t5
                  csrrsi       s3, 0x340, 16
                  c.andi       a5, -1
                  c.mv         t2, t6
                  csrrwi       s9, 0x340, 4
                  mulh         s4, ra, s4
                  c.sub        a5, a0
                  csrrs        a5, 0x340, zero
                  rem          t3, a0, a1
                  andi         a3, s8, 1176
                  c.xor        a4, s0
                  c.addi4spn   a3, sp, 928
                  xori         s9, s4, -1284
                  slli         tp, s11, 4
                  mulhsu       s5, ra, t3
                  slt          t5, a0, ra
                  auipc        a7, 1030550
                  csrrsi       s1, 0x340, 0
                  sub          a6, s5, t5
                  c.add        t5, s11
                  addi         t0, a7, -848
                  c.and        a3, a1
                  remu         a3, t4, s6
                  mulh         a4, t1, t3
                  sra          s6, a1, ra
                  c.andi       a2, -1
                  c.add        ra, t2
                  c.nop
                  c.mv         t1, t3
                  c.nop
                  csrrsi       a5, 0x340, 29
                  or           a7, t4, t1
                  remu         s5, s8, gp
                  addi         a7, s9, -1596
                  sltiu        s10, s5, -207
                  addi         t6, a3, -632
                  c.addi       a6, -1
                  sltiu        s8, a1, -224
                  slli         t5, ra, 12
                  c.slli       s1, 5
                  csrrsi       a2, 0x340, 17
                  sub          s4, a7, s5
                  c.xor        a3, s1
                  c.xor        s1, s1
                  ori          t5, a6, 1730
                  srli         t4, s0, 19
                  mulh         t0, s4, s2
                  sll          t5, t5, t0
                  mul          s10, t4, s8
                  csrrwi       s5, 0x340, 8
                  sltiu        s3, s3, 1705
                  sltu         s5, a3, a1
                  c.andi       a5, 1
                  add          t5, s8, t0
                  slli         t5, t3, 25
                  c.xor        a0, s1
                  auipc        t2, 904046
                  add          s11, s0, a5
                  ori          t6, s5, -1387
                  lui          s1, 488740
                  div          a7, s8, a3
                  csrrsi       s3, 0x340, 29
                  slli         gp, a2, 6
                  mulh         a2, tp, a5
                  slli         tp, s1, 5
                  mulhsu       s11, s11, t3
                  andi         a3, s6, -1579
                  c.add        s8, t3
                  c.srli       a0, 13
                  sltu         s9, s10, a7
                  andi         s8, a5, 784
                  slli         a6, s0, 26
                  slt          a7, a2, a6
                  c.lui        s7, 8
                  csrrc        a3, 0x340, a0
                  srli         a5, s2, 19
                  srl          t2, a3, a7
                  c.nop
                  csrrsi       t4, 0x340, 0
                  srli         s1, s1, 21
                  c.slli       t5, 17
                  c.srli       a0, 16
                  c.nop
                  add          s7, s8, s5
                  lui          sp, 547001
                  mul          s3, a2, sp
                  slt          s10, zero, a1
                  c.li         s10, 29
                  c.add        s11, a5
                  remu         t2, zero, sp
                  xor          s5, s5, tp
                  lui          a2, 817468
                  mulhsu       a3, s1, a4
                  c.addi       t6, -1
                  srai         t4, t4, 8
                  addi         tp, a2, 1922
                  nop
                  or           s7, s2, a7
                  sltu         t6, t2, sp
                  slli         tp, s0, 4
                  srli         a2, sp, 14
                  c.li         t2, -1
                  mulhsu       a5, tp, s9
                  mulhu        zero, s7, a5
                  c.sub        a4, a0
                  c.slli       s7, 24
                  slti         a7, t2, 585
                  xori         s11, a4, 1545
                  andi         s5, a0, -1759
                  csrrwi       s9, 0x340, 15
                  andi         zero, s8, 564
                  c.srai       a5, 25
                  c.slli       t4, 15
                  c.li         tp, -1
                  rem          ra, s8, s6
                  c.or         a0, a3
                  c.and        a2, a4
                  c.xor        a2, a4
                  mulh         s3, s9, a5
                  mulhu        s11, zero, t3
                  sll          a4, a2, gp
                  csrrci       tp, 0x340, 0
                  mulhu        t5, sp, t4
                  c.or         a5, a2
                  or           a6, s11, t0
                  sub          sp, s7, a6
                  c.mv         a0, s6
                  c.mv         s10, a1
                  c.or         a2, s1
                  srli         zero, a2, 19
                  div          a7, s8, s11
                  or           s5, a6, t6
                  csrrwi       a5, 0x340, 3
                  c.and        a3, s1
                  srai         s3, a6, 16
                  c.srli       a4, 19
                  c.nop
                  csrrci       t3, 0x340, 0
                  slti         zero, a0, -990
                  csrrc        t6, 0x340, s1
                  c.srai       a2, 20
                  c.addi       a0, 16
                  c.nop
                  c.slli       s1, 7
                  c.addi       a6, 30
                  c.mv         t3, a3
                  srai         a5, s10, 12
                  sltiu        t2, t6, 943
                  sub          gp, s0, a2
                  divu         gp, s11, a2
                  srl          s11, t5, t3
                  remu         s8, t0, s1
                  ori          gp, s0, 1755
                  c.xor        a3, s1
                  mul          t3, sp, a4
                  c.xor        a4, s1
                  and          t3, sp, a0
                  auipc        a6, 506823
                  csrrc        s5, 0x340, zero
                  c.addi       s9, -1
                  csrrc        a5, 0x340, zero
                  c.mv         sp, a5
                  c.xor        s1, a3
                  c.sub        a0, a4
                  mul          t4, s9, a0
                  sltiu        a3, s5, -943
                  addi         sp, s9, 1590
                  c.nop
                  c.sub        a0, a2
                  c.srli       a2, 11
                  or           t5, tp, zero
                  auipc        t5, 256653
                  or           t3, a3, s2
                  mulh         s6, s6, s4
                  c.addi16sp   sp, -16
                  c.addi16sp   sp, -16
                  srli         t1, s5, 31
                  add          a6, t2, a2
                  sltu         t5, a7, t2
                  csrrc        ra, 0x340, a4
                  add          s8, s7, s0
                  c.nop
                  xor          a7, a1, t6
                  sll          ra, s8, s2
                  c.lui        a4, 5
                  slt          s8, s9, s11
                  srli         s5, zero, 8
                  csrrwi       t0, 0x340, 13
                  c.add        s9, t3
                  c.sub        a3, a1
                  xor          s7, s11, s9
                  c.addi       t0, -1
                  c.addi       s4, 23
                  mulhu        tp, s2, a7
                  csrrs        t4, 0x340, zero
                  xori         t1, s3, -1891
                  srai         s3, ra, 23
                  sra          t5, a0, s9
                  mulhu        a6, a0, a3
                  csrrs        ra, 0x340, gp
                  c.lui        s10, 29
                  c.or         a5, a4
                  andi         a3, s7, -1519
                  div          s7, t0, s8
                  c.lui        t2, 30
                  sll          s3, a6, a1
                  sltiu        s5, t4, -396
                  mulhu        a4, s6, s6
                  c.addi16sp   sp, -16
                  c.lui        a2, 6
                  c.addi4spn   a3, sp, 64
                  mul          a0, gp, s1
                  sll          t6, s4, sp
                  div          s3, s1, s10
                  sltiu        t3, a4, 1160
                  c.srai       a4, 14
                  csrrs        ra, 0x340, s6
                  c.andi       a4, -1
                  slli         t2, s8, 7
                  c.srli       a5, 20
                  mul          a0, t5, t5
                  nop
                  lui          s7, 402857
                  csrrw        zero, 0x340, a6
                  andi         s3, tp, 733
                  c.srai       a5, 6
                  xori         a3, s1, -1069
                  csrrw        a5, 0x340, s1
                  xor          s1, s10, gp
                  add          sp, t6, s5
                  c.lui        a5, 5
                  c.addi16sp   sp, 352
                  srli         sp, a0, 18
                  div          s10, sp, ra
                  csrrc        a3, 0x340, a2
                  c.andi       s1, 18
                  sll          a7, t3, zero
                  nop
                  srl          t5, s3, t0
                  c.srli       s1, 20
                  csrrs        t1, 0x340, zero
                  csrrc        s3, 0x340, t5
                  c.srai       a3, 27
                  andi         tp, s0, -1017
                  remu         a3, s8, a1
                  add          s10, s2, t2
                  srl          zero, t6, tp
                  auipc        s11, 669236
                  sll          ra, s9, a4
                  csrrc        tp, 0x340, s11
                  c.mv         t2, s10
                  c.xor        a4, a3
                  xori         t3, s4, -741
                  sra          sp, sp, a2
                  c.slli       ra, 4
                  ori          a0, s2, -1836
                  and          ra, s6, zero
                  c.addi       a2, -1
                  c.addi       t4, -1
                  c.mv         t2, s4
                  csrrwi       gp, 0x340, 17
                  divu         s5, s8, t4
                  c.slli       s5, 20
                  or           s9, t3, a1
                  srai         t5, a0, 10
                  sltiu        a7, gp, 43
                  sltu         s10, ra, a0
                  sltu         t5, s6, s9
                  csrrc        s9, 0x340, zero
                  or           s3, a4, s3
                  auipc        a3, 332237
                  c.andi       s1, -1
                  lui          s10, 608028
                  slli         s5, s8, 20
                  mulh         t1, a1, s7
                  c.addi16sp   sp, -16
                  or           gp, a4, s7
                  div          gp, tp, t4
                  div          a7, ra, tp
                  mulh         s7, t1, a1
                  or           t2, t6, a6
                  lui          a0, 538956
                  div          a7, a3, a5
                  slli         s4, s0, 28
                  c.li         t1, -1
                  srai         sp, a6, 5
                  c.or         a3, a3
                  c.srli       a5, 25
                  c.addi       a5, 7
                  div          s1, s1, s3
                  csrrci       t1, 0x340, 0
                  addi         s5, s10, -1722
                  sltiu        a7, a5, -1813
                  addi         s11, a7, -1430
                  c.addi4spn   a4, sp, 48
                  c.or         a4, a0
                  sltiu        a7, s3, -1778
                  slti         ra, a4, -884
                  slt          t1, t5, a3
                  csrrwi       s9, 0x340, 9
                  nop
                  addi         t2, s1, -1834
                  addi         s8, gp, 360
                  c.mv         a4, s3
                  sra          a0, t2, s11
                  c.xor        a4, a4
                  xor          s7, a3, a2
                  c.addi4spn   a2, sp, 368
                  csrrs        t3, 0x340, zero
                  c.addi       a6, -1
                  csrrc        s4, 0x340, a2
                  ori          t2, s7, 272
                  srl          zero, s9, gp
                  srl          t4, s2, s4
                  c.addi       s11, 13
                  c.li         t2, -1
                  or           a7, s4, s7
                  lui          a6, 637253
                  srl          s1, s3, s6
                  csrrwi       a5, 0x340, 30
                  ori          s6, zero, -437
                  c.addi       a6, -1
                  sra          t1, a5, s9
                  c.slli       a6, 11
                  c.add        sp, gp
                  mulh         t1, s3, t3
                  nop
                  slt          s4, s0, zero
                  csrrc        s8, 0x340, a4
                  and          s6, s3, t4
                  c.sub        a3, a2
                  slti         s10, s1, 1205
                  c.or         s1, s1
                  c.addi16sp   sp, 16
                  c.or         a2, a2
                  srl          sp, s2, a6
                  add          tp, s11, a6
                  srai         a2, a5, 18
                  lui          a2, 764057
                  csrrci       s1, 0x340, 2
                  sra          t0, a6, a2
                  lui          s8, 97096
                  or           t3, a3, s8
                  c.add        s4, a4
                  rem          s10, t1, a0
                  csrrc        s1, 0x340, zero
                  slti         a7, a7, 1231
                  c.nop
                  and          tp, t5, zero
                  slti         t0, t6, -137
                  c.xor        s1, a3
                  sub          s1, t6, s5
                  add          a4, sp, t2
                  lui          t4, 278788
                  mulhsu       t2, s9, t6
                  or           t1, t1, s5
                  c.li         s1, -1
                  c.srai       a3, 14
                  c.add        t2, s11
                  rem          t2, s7, s0
                  xori         a5, a3, 1297
                  remu         zero, a7, a7
                  c.sub        s1, a2
                  sltiu        s7, gp, 407
                  c.sub        a3, a3
                  sltiu        gp, s0, -1416
                  and          s9, t2, s6
                  c.xor        a3, a1
                  auipc        ra, 801254
                  csrrsi       t4, 0x340, 10
                  c.li         s6, -1
                  c.nop
                  rem          gp, a4, tp
                  c.addi4spn   a4, sp, 304
                  slli         zero, s6, 16
                  add          t2, s3, a4
                  addi         t3, t2, 235
                  and          sp, a4, t6
                  srai         a0, s4, 23
                  xor          a6, a4, tp
                  c.addi4spn   a5, sp, 112
                  c.and        s1, a1
                  sub          s9, s3, zero
                  csrrs        t0, 0x340, s10
                  and          s5, a5, a0
                  c.add        ra, a2
                  slti         s6, t2, 879
                  c.slli       gp, 28
                  slt          tp, sp, s11
                  divu         a6, a2, a0
                  addi         gp, a7, -552
                  srl          a2, a4, s2
                  c.or         a4, a0
                  c.andi       a4, -1
                  c.mv         a7, t2
                  sra          s5, a1, s9
                  srli         a4, s4, 12
                  c.li         t1, -1
                  srli         s8, a4, 3
                  nop
                  nop
                  c.srai       a2, 21
                  c.andi       a5, -1
                  divu         t6, t5, a2
                  c.addi4spn   a5, sp, 208
                  c.addi16sp   sp, 96
                  rem          sp, a4, s11
                  c.mv         a2, s5
                  slli         a2, t5, 23
                  auipc        t1, 621886
                  sra          a6, t6, s11
                  csrrsi       s8, 0x340, 0
                  and          t5, a0, t6
                  sra          t5, s7, gp
                  mulhu        t4, t0, a0
                  c.li         a2, -1
                  c.addi       s6, -1
                  c.addi16sp   sp, 224
                  c.xor        a3, s1
                  sltu         ra, a6, s5
                  srli         t4, s6, 0
                  ori          t2, a3, -1287
                  c.nop
                  c.nop
                  mulhsu       s7, s9, s1
                  c.addi       t1, -1
                  c.slli       s9, 22
                  or           sp, s11, sp
                  div          t3, s1, a7
                  nop
                  c.srai       a5, 3
                  c.xor        s1, a1
                  ori          s3, a7, -1198
                  c.or         a4, a5
                  andi         sp, a3, -993
                  lui          gp, 972057
                  nop
                  c.add        ra, s1
                  slt          t6, ra, sp
                  rem          t3, a4, gp
                  sra          zero, a1, s11
                  mulhu        a6, s9, t2
                  c.or         s1, a2
                  rem          a4, s10, ra
                  c.li         sp, 22
                  mulh         a6, s9, t2
                  c.srli       a2, 11
                  remu         a4, gp, t5
                  xori         s4, s6, 1651
                  ori          a2, s6, 2015
                  nop
                  sll          gp, a1, a1
                  auipc        a0, 780173
                  csrrs        a7, 0x340, s7
                  c.srai       s1, 29
                  slli         s11, s7, 22
                  srli         s1, t6, 1
                  c.andi       s1, 21
                  c.addi4spn   a3, sp, 192
                  nop
                  csrrci       s11, 0x340, 0
                  csrrc        gp, 0x340, zero
                  div          s6, t3, t5
                  xor          s7, a1, s0
                  mul          a3, a4, s1
                  c.or         s1, a5
                  csrrsi       a5, 0x340, 29
                  c.add        s8, a2
                  xori         a7, a1, 1206
                  slli         t4, s3, 4
                  c.and        a2, a2
                  divu         s7, s9, s10
                  csrrwi       t2, 0x340, 31
                  sub          gp, zero, a7
                  rem          s5, a1, s9
                  xor          s4, zero, t2
                  c.add        s8, s3
                  div          s7, zero, t5
                  csrrw        ra, 0x340, tp
                  slt          t4, s8, a2
                  c.lui        t3, 15
                  slt          a3, s4, a1
                  c.srli       a4, 13
                  mul          tp, a6, sp
                  mulhu        a7, t5, a1
                  add          s8, t5, s0
                  addi         s10, a1, -50
                  add          s10, t0, zero
                  rem          ra, s9, s1
                  mulhsu       t2, a0, t1
                  sub          s9, a1, s6
                  divu         t5, gp, t0
                  srl          s4, ra, s5
                  divu         s1, s3, ra
                  c.or         s1, s0
                  csrrs        a5, 0x340, zero
                  and          s11, s4, a2
                  csrrc        a2, 0x340, gp
                  auipc        t6, 561974
                  or           s7, t4, t2
                  c.sub        a4, s0
                  c.li         a5, -1
                  srai         s6, zero, 29
                  c.xor        a2, a4
                  sll          s11, s11, t4
                  c.srli       a4, 23
                  c.li         t3, -1
                  xor          s4, sp, sp
                  c.srli       a2, 24
                  sll          tp, a7, a1
                  sltiu        s11, s2, 1816
                  slti         t3, t6, 1136
                  remu         a4, s1, a2
                  xor          s3, a7, sp
                  div          sp, s7, t2
                  auipc        s11, 679715
                  slli         t1, t1, 2
                  xor          s6, s8, tp
                  c.srai       a2, 3
                  and          t5, a6, a0
                  divu         zero, zero, s5
                  c.srli       a5, 1
                  csrrs        sp, 0x340, zero
                  c.mv         t0, t5
                  c.li         a5, -1
                  divu         t1, t3, zero
                  slti         gp, a0, -1401
                  div          s10, s10, s1
                  c.slli       t5, 9
                  c.xor        a0, s1
                  csrrwi       a3, 0x340, 30
                  c.li         sp, -1
                  sub          a0, s6, s7
                  c.lui        a4, 7
                  csrrwi       s8, 0x340, 29
                  c.and        a0, a2
                  csrrsi       t4, 0x340, 0
                  add          s9, a4, s7
                  ori          a0, sp, 757
                  sll          tp, t0, s2
                  c.li         a7, 31
                  mulh         sp, ra, a6
                  and          t3, s2, tp
                  srli         a3, a2, 9
                  slli         t6, t1, 17
                  c.and        a3, a4
                  mul          a7, s5, s4
                  c.addi4spn   s1, sp, 624
                  sltiu        s11, a4, -171
                  xor          a7, a0, t6
                  mulhsu       t1, t1, tp
                  div          a2, s3, s4
                  divu         t6, a7, s2
                  csrrw        s6, 0x340, zero
                  srl          s7, a4, a7
                  c.mv         tp, a2
                  c.li         a5, 18
                  auipc        t3, 109268
                  and          s6, s10, s8
                  csrrci       zero, 0x340, 9
                  c.srli       a4, 30
                  c.addi4spn   a0, sp, 272
                  sub          a2, t0, t6
                  remu         a3, sp, t3
                  andi         t5, t5, 433
                  c.srli       a4, 29
                  mulhu        a3, s7, s4
                  c.srai       a3, 21
                  c.xor        a0, s1
                  div          a4, a5, a2
                  andi         t2, a0, 1830
                  sll          s9, sp, s8
                  c.addi4spn   s1, sp, 304
                  slti         s7, s5, 1467
                  xori         zero, t0, 1791
                  csrrci       s11, 0x340, 0
                  auipc        s8, 216488
                  c.andi       s1, 12
                  or           t6, a0, s8
                  c.sub        a3, a3
                  csrrwi       a5, 0x340, 1
                  andi         tp, tp, 1536
                  c.srli       a3, 4
                  add          a3, a6, t4
                  slt          t3, sp, sp
                  mulhsu       tp, t1, gp
                  c.add        t2, t1
                  c.nop
                  csrrs        a2, 0x340, gp
                  c.nop
                  c.sub        a2, a3
                  srli         t5, a5, 28
                  c.nop
                  srai         a0, a0, 3
                  c.srli       a4, 29
                  csrrwi       a0, 0x340, 0
                  sll          zero, a3, t1
                  c.or         a5, a5
                  mulh         a5, a2, sp
                  c.xor        a0, a3
                  mul          a6, s8, a1
                  addi         s3, s8, 819
                  c.slli       t5, 9
                  c.addi4spn   a2, sp, 816
                  c.andi       a2, 9
                  andi         zero, a1, -689
                  sltiu        gp, a6, 697
                  c.li         t1, 21
                  sltu         a6, s6, a6
                  andi         t6, a5, -1049
                  csrrs        gp, 0x340, s5
                  and          a6, s9, s11
                  remu         s8, a4, s4
                  c.slli       t0, 9
                  csrrs        s4, 0x340, a2
                  sltiu        s9, a2, 837
                  csrrwi       s1, 0x340, 1
                  or           a2, t5, t5
                  sub          sp, s8, t2
                  c.li         gp, -1
                  c.srai       a2, 28
                  c.sub        s1, a1
                  auipc        s4, 756453
                  c.lui        t0, 5
                  c.andi       a4, 22
                  andi         t4, zero, 916
                  mulhu        a5, a1, t6
                  srli         a3, t6, 27
                  sub          a6, t3, a3
                  c.slli       s1, 23
                  srl          t1, t3, a4
                  mulh         a4, t0, s10
                  c.mv         s10, a0
                  slti         tp, s6, -1489
                  sra          t4, s2, a7
                  sltu         s3, a7, a2
                  rem          s9, gp, a4
                  c.add        t3, s8
                  c.li         s11, -1
                  mulhu        s7, s8, gp
                  slli         a2, s9, 24
                  addi         s5, a1, 1588
                  andi         s4, a3, 375
                  c.li         t6, -1
                  sub          t3, t5, ra
                  c.mv         a7, a0
                  andi         t1, tp, -57
                  sub          s11, s7, s11
                  sltiu        s9, tp, -942
                  div          ra, s7, t0
                  auipc        a2, 918010
                  c.slli       t3, 26
                  c.li         s9, -1
                  csrrw        zero, 0x340, s5
                  ori          a7, s0, 1657
                  slti         zero, s10, -1853
                  csrrs        t0, 0x340, zero
                  ori          gp, s3, 1463
                  or           s8, gp, a5
                  c.slli       t3, 5
                  c.xor        a4, a5
                  auipc        s11, 747066
                  auipc        a4, 577997
                  c.or         a5, a4
                  c.and        a5, s0
                  add          t6, a5, s9
                  csrrsi       t3, 0x340, 0
                  and          a6, a4, tp
                  csrrc        t4, 0x340, zero
                  csrrw        s5, 0x340, s0
                  nop
                  csrrc        s11, 0x340, zero
                  slli         tp, s10, 27
                  slti         zero, s11, -644
                  c.srli       a2, 21
                  csrrsi       a4, 0x340, 12
                  rem          a5, s0, s11
                  xori         s9, t0, 1151
                  srai         a0, a7, 4
                  andi         s9, t5, -1481
                  remu         a3, a4, s6
                  addi         sp, a0, -1901
                  add          gp, s4, s2
                  xor          s9, a5, a0
                  mulhsu       t3, gp, t0
                  xor          s1, a7, t1
                  c.li         s4, -1
                  csrrwi       sp, 0x340, 27
                  c.sub        a5, a5
                  c.add        a5, s11
                  c.slli       t5, 6
                  c.add        s3, a6
                  auipc        t6, 426824
                  c.or         a5, a5
                  c.addi16sp   sp, 224
                  csrrs        s9, 0x340, zero
                  sltiu        t5, s0, -1
                  csrrc        s1, 0x340, zero
                  srl          a4, s8, t0
                  div          s8, a4, s11
                  add          tp, s2, ra
                  andi         tp, s11, 415
                  mulhsu       t1, a3, s4
                  nop
                  sltu         gp, t2, t5
                  c.slli       s11, 13
                  c.slli       t0, 22
                  c.nop
                  c.andi       a4, 25
                  c.andi       a2, 23
                  c.sub        a5, a3
                  c.srai       a0, 22
                  or           s8, a3, s6
                  sll          tp, s1, s4
                  div          a7, t5, s4
                  csrrci       a2, 0x340, 5
                  sltiu        s3, a5, -1249
                  lui          s8, 123798
                  slti         s3, s9, -1352
                  srai         s7, s8, 30
                  c.lui        gp, 7
                  csrrc        t4, 0x340, zero
                  mul          s6, a7, t1
                  c.and        a5, a1
                  slli         a6, t0, 5
                  csrrs        s6, 0x340, zero
                  c.lui        t1, 8
                  csrrs        t1, 0x340, zero
                  sub          sp, t6, t0
                  div          t6, tp, t5
                  csrrc        a7, 0x340, zero
                  c.addi16sp   sp, 272
                  srl          t2, ra, s8
                  c.and        a5, a5
                  sub          s8, a1, s3
                  sll          ra, t4, gp
                  c.sub        a0, a3
                  c.srli       s1, 5
                  remu         t0, s4, ra
                  c.add        a3, s1
                  or           a7, s4, gp
                  csrrc        s8, 0x340, sp
                  ori          ra, a2, -892
                  rem          a5, a3, gp
                  mulhu        a6, a5, s7
                  andi         t5, s5, -1953
                  xor          s7, s9, a0
                  srli         a3, t6, 24
                  and          s10, s5, a2
                  sub          tp, s7, gp
                  c.srai       a2, 16
                  mul          t0, t0, s3
                  sll          zero, a7, t1
                  mulh         a3, tp, sp
                  c.xor        a3, a4
                  c.or         a5, a1
                  srai         a5, gp, 24
                  mulhu        s7, a7, t2
                  slt          s7, s0, a5
                  c.sub        a3, a4
                  csrrwi       a4, 0x340, 1
                  sra          s3, a1, t6
                  andi         s8, a7, 1295
                  xori         t2, s6, 1824
                  c.addi4spn   s1, sp, 144
                  c.slli       a6, 11
                  c.li         a5, 2
                  slt          t0, t5, s2
                  c.srai       a2, 30
                  and          a6, s1, s4
                  mulhsu       s3, s2, a0
                  mul          a0, a2, s11
                  xori         s1, t1, 460
                  c.slli       ra, 3
                  c.addi4spn   a2, sp, 832
                  c.srai       a4, 20
                  sltiu        s6, zero, 1664
                  c.srli       a3, 29
                  mulhsu       s9, s10, s4
                  c.li         s6, 4
                  srli         s3, s9, 15
                  divu         s9, t5, tp
                  c.addi16sp   sp, -16
                  xori         s1, a0, -110
                  add          t0, s3, s10
                  div          s6, s9, s1
                  c.and        a4, s0
                  slt          zero, t2, a2
                  srli         a2, s0, 17
                  csrrwi       s6, 0x340, 15
                  mulh         a0, t0, s11
                  div          t0, t0, s7
                  andi         t3, s1, 272
                  c.srli       a3, 25
                  andi         s3, sp, -26
                  slli         t0, s7, 13
                  slli         t1, t6, 0
                  c.sub        s1, s0
                  srai         s8, a6, 5
                  c.nop
                  c.or         a2, a4
                  c.srli       a3, 4
                  csrrsi       t1, 0x340, 17
                  xori         zero, s0, 866
                  slti         ra, a6, 275
                  addi         tp, s1, -1502
                  srl          a4, s2, a6
                  c.sub        a2, s1
                  c.sub        a4, a1
                  srai         t1, a3, 31
                  c.andi       a4, -1
                  c.lui        s5, 5
                  c.srai       a0, 28
                  sll          s9, s11, a3
                  c.addi4spn   a0, sp, 432
                  c.srai       a0, 15
                  slti         s5, s5, -1730
                  nop
                  ori          t1, t5, -612
                  slti         s5, a1, 1819
                  csrrs        zero, 0x340, zero
                  srli         a3, tp, 29
                  csrrwi       a4, 0x340, 27
                  sltu         a6, sp, a1
                  csrrsi       sp, 0x340, 0
                  csrrc        t3, 0x340, s9
                  c.andi       a4, -1
                  c.andi       s1, -1
                  c.li         s9, 25
                  and          t5, s11, s4
                  addi         zero, tp, -1334
                  c.xor        a5, a2
                  sll          s8, a6, tp
                  remu         t3, t5, s3
                  c.slli       a2, 7
                  csrrwi       a7, 0x340, 9
                  c.lui        a0, 23
                  csrrc        a6, 0x340, s1
                  mulhu        s7, a7, s7
                  c.slli       a5, 5
                  sltiu        s4, t5, -1564
                  c.srai       a4, 4
                  divu         sp, a3, t6
                  c.xor        a2, s1
                  remu         a4, sp, s9
                  mul          s10, s2, a4
                  csrrs        a7, 0x340, t2
                  sub          s10, s8, s6
                  c.or         a0, a1
                  ori          s3, s2, 1782
                  c.addi4spn   a0, sp, 720
                  c.and        a0, s1
                  mul          s10, a2, s0
                  c.srli       a2, 28
                  c.lui        s5, 25
                  slti         a4, t3, 1910
                  mul          a5, s5, t3
                  rem          a0, s6, zero
                  c.slli       t4, 2
                  c.addi       t0, -1
                  c.srai       s1, 26
                  c.sub        a4, a1
                  and          t4, t1, s11
                  add          s10, zero, t1
                  nop
                  csrrwi       s1, 0x340, 20
                  c.sub        s1, a0
                  c.addi       t1, -1
                  xori         t2, s7, -1172
                  lui          s7, 993543
                  csrrsi       s1, 0x340, 11
                  sub          s1, t1, a7
                  c.addi       ra, -1
                  xor          t4, s6, a7
                  add          ra, t6, a2
                  sra          s1, a3, s9
                  csrrci       ra, 0x340, 0
                  srl          s5, s9, t6
                  nop
                  csrrwi       zero, 0x340, 11
                  remu         s9, s6, a7
                  mulhu        s10, t0, gp
                  div          t0, a5, t6
                  slt          s10, gp, s5
                  xor          s10, sp, t3
                  c.srai       a4, 25
                  mulhsu       a4, s0, s5
                  c.mv         s9, a2
                  remu         sp, t4, t2
                  sll          t2, a6, zero
                  divu         s10, s0, t0
                  slt          zero, a3, s7
                  mul          s5, a0, s5
                  andi         s4, sp, 1775
                  sltiu        t4, sp, -1001
                  c.sub        a0, a4
                  csrrw        tp, 0x340, s9
                  nop
                  c.addi16sp   sp, 448
                  c.or         a3, s1
                  slli         gp, a4, 23
                  csrrsi       a4, 0x340, 0
                  c.add        s3, a6
                  mul          s6, s0, a0
                  c.addi       s4, 4
                  and          a0, s9, sp
                  c.andi       s1, -1
                  csrrw        a5, 0x340, a2
                  c.andi       a5, 23
                  sub          zero, s2, s7
                  srl          s6, ra, t5
                  auipc        t2, 436428
                  c.or         s1, a5
                  slti         s11, t5, 760
                  mul          t4, zero, s8
                  csrrci       a0, 0x340, 0
                  remu         t6, a5, a5
                  sltu         t3, s4, s11
                  ori          a2, s10, 1876
                  c.slli       s4, 24
                  slti         t4, s1, -240
                  xor          t6, t0, t3
                  c.or         a3, a5
                  auipc        a3, 922133
                  slti         a7, s4, 1531
                  c.sub        s1, a0
                  ori          a2, s6, -1020
                  c.addi4spn   a3, sp, 336
                  rem          s6, a1, zero
                  c.addi4spn   s1, sp, 800
                  csrrsi       a7, 0x340, 0
                  sub          a7, zero, s6
                  csrrsi       zero, 0x340, 25
                  c.lui        a0, 6
                  mulhsu       s1, s1, gp
                  slli         a7, s0, 10
                  mul          s6, s11, zero
                  rem          s10, a4, a7
                  c.nop
                  nop
                  c.and        a5, a1
                  c.li         a6, 12
                  mul          a3, gp, a3
                  c.addi16sp   sp, 112
                  auipc        s10, 929894
                  mul          s1, a6, a5
                  c.lui        s10, 21
                  div          tp, ra, ra
                  c.slli       gp, 8
                  ori          s7, s5, -1641
                  lui          a4, 222119
                  c.srai       a0, 4
                  or           s1, s7, tp
                  c.srli       a5, 9
                  add          s7, s5, a5
                  xor          a6, s10, s0
                  rem          s8, ra, a2
                  c.nop
                  csrrsi       t6, 0x340, 0
                  and          t5, t1, t6
                  auipc        a5, 887750
                  c.srli       a0, 22
                  c.nop
                  csrrw        zero, 0x340, s4
                  sra          t5, t3, a7
                  nop
                  sll          t5, t6, s2
                  rem          zero, t2, s5
                  remu         gp, a4, s2
                  srl          s11, t2, s9
                  c.addi16sp   sp, -16
                  c.addi4spn   s1, sp, 496
                  div          s11, tp, tp
                  mulhsu       t4, t5, s10
                  xor          t4, s8, a5
                  div          s5, a5, s5
                  addi         a3, t4, -179
                  or           ra, a2, a1
                  c.xor        a0, a5
                  c.addi       s5, 27
                  c.or         a2, a5
                  slti         s7, s0, -1365
                  csrrc        s7, 0x340, s11
                  csrrci       a6, 0x340, 13
                  csrrsi       a4, 0x340, 21
                  c.addi4spn   a0, sp, 416
                  sltiu        s3, a1, 683
                  rem          t5, t0, a7
                  srai         t4, t3, 9
                  mulh         s1, s3, t2
                  c.mv         t5, a0
                  c.or         a4, a4
                  c.li         s1, 27
                  mulhu        t5, s6, a3
                  andi         a4, t5, -765
                  mulhsu       s4, a7, a5
                  sub          t5, s9, a3
                  add          a2, s5, s6
                  div          a2, s4, s5
                  c.addi       t0, 5
                  xor          s5, s0, s8
                  c.add        a6, s4
                  divu         s6, a5, a4
                  nop
                  slli         s4, s3, 13
                  srai         s11, sp, 4
                  csrrw        a6, 0x340, s1
                  lui          s11, 212595
                  c.addi16sp   sp, -16
                  sub          t2, a4, a6
                  csrrsi       a6, 0x340, 0
                  mulhsu       a6, t4, a3
                  c.srai       a2, 10
                  c.srli       s1, 26
                  c.addi16sp   sp, -16
                  c.li         t5, 28
                  csrrw        tp, 0x340, t2
                  srai         t0, a2, 17
                  ori          s10, t5, -561
                  remu         t3, t3, ra
                  mulh         gp, s6, s4
                  srl          s9, t1, t1
                  srai         a7, ra, 15
                  c.andi       a0, 5
                  c.addi4spn   a0, sp, 240
                  c.srli       a2, 28
                  c.addi16sp   sp, -16
                  c.or         a0, a3
                  c.and        a3, a3
                  div          s8, gp, a7
                  srl          t3, s8, t3
                  andi         t0, s8, 104
                  csrrs        sp, 0x340, zero
                  xor          a5, t3, t3
                  nop
                  c.addi4spn   a0, sp, 400
                  nop
                  slt          t6, s6, s3
                  slti         t1, t5, 733
                  remu         zero, s10, a5
                  slt          gp, a7, zero
                  c.mv         a5, s11
                  c.addi16sp   sp, -16
                  lui          gp, 683108
                  nop
                  mulhu        s7, t3, a5
                  csrrs        t2, 0x340, s3
                  srli         s9, t6, 5
                  addi         a5, a7, -1422
                  sra          t2, a4, t6
                  mulhu        s5, t0, tp
                  c.andi       a2, -1
                  csrrs        tp, 0x340, zero
                  mulhsu       ra, t1, a0
                  andi         sp, a4, -76
                  csrrsi       s11, 0x340, 17
                  csrrsi       t5, 0x340, 0
                  c.mv         a2, s6
                  csrrc        t5, 0x340, zero
                  rem          s1, s8, s0
                  sra          a3, s1, tp
                  remu         t6, sp, t2
                  slti         a0, a0, 1591
                  slti         s11, s6, -60
                  slti         s4, s9, -1955
                  c.srli       a5, 31
                  c.mv         s7, a6
                  c.srai       a2, 10
                  slti         s5, s6, -1850
                  c.srli       s1, 7
                  add          s3, tp, s2
                  c.or         a2, a3
                  slt          s4, t2, tp
                  c.addi16sp   sp, 192
                  sltiu        s8, s2, 1840
                  c.lui        a7, 23
                  slti         s7, a2, -837
                  slti         a0, t4, -395
                  divu         a2, t5, a5
                  andi         t0, t0, 341
                  srai         a0, t0, 24
                  csrrsi       tp, 0x340, 28
                  c.nop
                  mul          a3, s9, a1
                  srai         s7, t5, 15
                  rem          s7, s1, t0
                  csrrc        a5, 0x340, s1
                  c.slli       tp, 2
                  xori         a7, a1, -397
                  or           sp, a4, s8
                  slli         ra, t4, 9
                  c.sub        a3, a0
                  csrrci       s6, 0x340, 0
                  or           t1, t6, a0
                  c.srli       a3, 16
                  csrrci       a2, 0x340, 16
                  c.mv         s1, gp
                  divu         a2, a4, s8
                  sra          tp, s4, a2
                  c.addi4spn   a4, sp, 128
                  csrrwi       s11, 0x340, 30
                  mulhsu       a0, s7, t4
                  rem          a7, a1, t2
                  srli         s8, s9, 2
                  c.sub        a4, a3
                  remu         tp, s9, t4
                  add          s7, s1, s2
                  or           s6, sp, s0
                  csrrwi       t1, 0x340, 27
                  c.srai       a4, 5
                  csrrs        tp, 0x340, zero
                  csrrc        a3, 0x340, zero
                  c.srai       a0, 21
                  mulh         t6, a5, t6
                  rem          t1, a7, s4
                  csrrs        tp, 0x340, s3
                  remu         s7, tp, a5
                  srli         s8, s11, 13
                  c.andi       a2, 8
                  c.nop
                  c.slli       t0, 11
                  nop
                  c.addi       t6, -1
                  c.nop
                  sll          t0, a6, s9
                  c.addi4spn   s1, sp, 720
                  sltiu        tp, a1, -2000
                  c.addi4spn   a0, sp, 224
                  c.li         s6, -1
                  ori          s7, s0, -1927
                  csrrw        s5, 0x340, t3
                  c.mv         s9, a4
                  sra          s5, s6, zero
                  c.srli       a3, 11
                  csrrc        ra, 0x340, zero
                  auipc        ra, 380314
                  mulh         a0, s4, s1
                  csrrci       a0, 0x340, 27
                  sltu         s9, s10, t4
                  slti         t0, a6, -149
                  ori          a7, a7, 1855
                  lui          t3, 1024178
                  c.xor        s1, a5
                  auipc        s1, 555089
                  c.nop
                  srli         tp, a4, 12
                  mulhu        a4, a0, s4
                  andi         s5, ra, -345
                  c.andi       a5, 16
                  and          t6, gp, s6
                  srl          s4, s1, a7
                  c.addi4spn   a4, sp, 976
                  csrrs        s7, 0x340, t5
                  c.and        a4, a2
                  c.nop
                  c.mv         t1, tp
                  c.li         a6, -1
                  mul          s1, a1, zero
                  c.sub        a0, a2
                  sra          s8, a4, tp
                  mulhsu       a6, zero, zero
                  sub          a6, s1, s10
                  c.srli       a0, 14
                  add          s8, s7, t6
                  and          a0, s0, s10
                  rem          s11, s0, gp
                  srai         t4, ra, 12
                  csrrc        s11, 0x340, zero
                  div          s11, t0, s0
                  c.li         gp, 10
                  andi         s4, a4, 294
                  c.xor        a0, a0
                  c.sub        a3, a5
                  c.nop
                  c.add        a4, t0
                  csrrsi       ra, 0x340, 7
                  c.addi4spn   a5, sp, 96
                  add          s7, s3, a7
                  sll          t6, t1, s3
                  remu         ra, gp, ra
                  srl          t3, a4, t6
                  sub          s4, t4, a3
                  srl          s9, s5, t6
                  srl          s7, s3, ra
                  auipc        s4, 87467
                  rem          s3, t0, s4
                  sltu         t3, ra, a7
                  c.addi16sp   sp, 368
                  c.srli       a3, 13
                  csrrci       zero, 0x340, 30
                  csrrci       tp, 0x340, 8
                  c.or         a4, a0
                  c.nop
                  slli         zero, a1, 4
                  c.lui        s8, 10
                  sra          s5, t3, sp
                  c.slli       ra, 9
                  sltiu        s1, a7, 1160
                  sub          t3, t6, gp
                  c.srai       a2, 30
                  csrrwi       a2, 0x340, 0
                  csrrci       a7, 0x340, 0
                  lui          s10, 281132
                  auipc        a6, 913780
                  csrrw        a0, 0x340, s2
                  sub          s11, t3, s4
                  mulhu        t3, gp, zero
                  c.addi       s1, -1
                  nop
                  div          zero, s11, a2
                  csrrci       a4, 0x340, 0
                  srl          gp, a7, s2
                  xor          a4, t1, a2
                  xor          a2, a1, t1
                  and          sp, sp, zero
                  ori          ra, a0, 446
                  c.nop
                  div          ra, s7, t3
                  c.slli       a6, 11
                  nop
                  csrrsi       t0, 0x340, 19
                  sra          s1, s2, s2
                  add          s4, t4, s6
                  slt          s8, s10, t3
                  c.xor        a3, a5
                  c.andi       a5, -1
                  slti         t4, t0, 1337
                  mulh         s1, zero, s1
                  xor          s4, s1, s8
                  c.and        a0, a3
                  srli         s10, s8, 23
                  slti         a2, t4, -1988
                  c.xor        s1, a0
                  c.addi16sp   sp, 368
                  c.andi       a4, -1
                  c.addi16sp   sp, 32
                  add          s3, sp, a4
                  csrrs        t2, 0x340, t5
                  sub          s11, t5, s4
                  c.srli       a5, 29
                  c.slli       sp, 23
                  mulh         a0, s11, a7
                  mul          t5, tp, s1
                  csrrs        s6, 0x340, a1
                  mulhsu       s9, zero, gp
                  c.and        a3, a1
                  srai         a7, s3, 22
                  div          t6, a7, t4
                  c.li         ra, 22
                  c.andi       a4, 0
                  csrrw        s3, 0x340, a3
                  c.srli       a2, 4
                  c.slli       gp, 16
                  c.xor        a3, s0
                  and          t3, t0, a4
                  c.andi       a4, 5
                  add          a4, a0, a4
                  mulhsu       a3, s4, s5
                  nop
                  c.nop
                  sltiu        s6, t3, 484
                  mulhu        t0, tp, t3
                  mulhu        t6, s2, t6
                  c.li         s3, -1
                  srl          a3, a1, s8
                  c.and        a2, a3
                  slli         s11, t6, 26
                  ori          t2, t2, 144
                  divu         a4, s7, s7
                  slti         s10, s7, 1694
                  auipc        s6, 386041
                  nop
                  c.xor        a2, a4
                  c.addi       t2, -1
                  andi         a5, t1, 740
                  mulhsu       s1, a6, t6
                  sll          s9, t6, a4
                  srai         s8, s3, 30
                  mul          s9, t0, t5
                  csrrc        s9, 0x340, gp
                  add          s1, a5, s2
                  add          s9, s2, ra
                  c.li         t0, -1
                  srl          a2, s0, s3
                  lui          s3, 457657
                  csrrc        zero, 0x340, zero
                  c.slli       t2, 2
                  nop
                  andi         s7, s7, -445
                  remu         a7, t0, s0
                  sra          s6, a2, s8
                  divu         a7, s10, a3
                  csrrw        a0, 0x340, a6
                  slti         t0, t3, 576
                  slt          t4, sp, t1
                  sra          s9, t4, ra
                  c.andi       s1, 5
                  auipc        t3, 384765
                  c.sub        a0, a5
                  c.slli       t4, 11
                  csrrwi       gp, 0x340, 29
                  c.srai       a3, 24
                  c.lui        gp, 1
                  srai         s1, s6, 8
                  srli         a5, a5, 28
                  csrrci       a2, 0x340, 4
                  c.xor        a0, s1
                  c.addi16sp   sp, -16
                  c.nop
                  csrrc        t1, 0x340, s7
                  div          t6, a4, sp
                  div          a2, s2, t0
                  sra          s4, s5, a1
                  divu         t3, a6, a7
                  remu         a7, a1, s1
                  c.lui        t4, 22
                  c.xor        a4, a1
                  sra          t1, t5, s2
                  c.li         t4, -1
                  mul          s1, a5, s6
                  c.sub        a3, a1
                  c.addi4spn   a3, sp, 656
                  sub          s11, a4, a0
                  xori         tp, s6, -1566
                  csrrwi       t4, 0x340, 16
                  mul          s8, zero, a7
                  add          a0, t0, a5
                  and          a6, a2, a4
                  rem          s7, a5, s11
                  andi         t4, a3, 1096
                  c.and        a2, s1
                  mulhu        a4, gp, s6
                  c.xor        a0, a2
                  mulhsu       t0, s11, a4
                  csrrc        a2, 0x340, zero
                  ori          s1, a2, 262
                  mul          ra, gp, ra
                  csrrsi       s3, 0x340, 21
                  csrrci       a5, 0x340, 0
                  c.slli       s5, 28
                  c.and        a0, a5
                  xori         s6, s6, 489
                  srl          a5, a7, a5
                  nop
                  c.mv         t5, s8
                  mulhu        a6, t0, s4
                  divu         s6, gp, t2
                  and          a3, sp, gp
                  sll          tp, s1, tp
                  slti         s4, s6, 1139
                  lui          a5, 731352
                  c.slli       s3, 13
                  c.addi       gp, 9
                  sltiu        ra, t4, -1200
                  csrrwi       t4, 0x340, 2
                  and          s1, s11, gp
                  remu         t3, t3, s1
                  andi         s9, s4, 450
                  nop
                  addi         a3, s3, 1494
                  c.add        sp, a2
                  mulh         s10, t0, t4
                  c.and        a0, s1
                  srli         t0, a0, 25
                  andi         ra, s11, -1034
                  c.mv         a0, t4
                  csrrc        gp, 0x340, zero
                  c.or         a2, a3
                  or           s10, a6, s4
                  c.xor        a3, a3
                  c.slli       ra, 15
                  c.add        t4, s4
                  lui          a3, 327557
                  csrrwi       s1, 0x340, 21
                  or           t0, s5, s5
                  c.andi       a4, 20
                  nop
                  ori          t6, t3, 955
                  csrrsi       s4, 0x340, 18
                  c.addi16sp   sp, -16
                  c.slli       t3, 2
                  c.slli       gp, 29
                  xor          a5, a3, gp
                  remu         t3, t2, t6
                  c.addi16sp   sp, 432
                  c.addi16sp   sp, -16
                  lui          sp, 894092
                  c.addi16sp   sp, 224
                  c.xor        a5, a4
                  c.xor        s1, s0
                  remu         s11, t4, s4
                  c.sub        a4, a3
                  c.xor        a3, a1
                  c.sub        a0, a3
                  c.srli       a2, 18
                  sll          s8, a5, s6
                  c.srli       a5, 27
                  csrrs        s10, 0x340, zero
                  c.nop
                  srl          a4, t0, gp
                  sub          s5, ra, gp
                  csrrwi       gp, 0x340, 1
                  srl          a5, ra, a0
                  mulhu        zero, a0, s1
                  addi         gp, a7, -350
                  c.add        gp, s3
                  c.andi       a3, 1
                  csrrw        t0, 0x340, t4
                  c.addi       tp, 25
                  add          s10, t5, t2
                  slti         tp, s8, 1675
                  c.addi16sp   sp, -16
                  sltu         a2, s11, a2
                  c.li         s6, 18
                  c.add        t2, gp
                  csrrs        tp, 0x340, zero
                  c.addi       a6, -1
                  andi         s10, a4, 427
                  sra          a5, s6, a3
                  sltiu        s10, a7, -1429
                  srli         s4, s7, 20
                  c.addi4spn   a3, sp, 112
                  c.sub        a0, a3
                  sub          t1, a4, a6
                  csrrci       a7, 0x340, 23
                  c.andi       a2, 19
                  mulhu        s10, s1, zero
                  mulh         a4, a2, tp
                  c.addi16sp   sp, 176
                  csrrw        s7, 0x340, s7
                  ori          t6, a1, 880
                  ori          a7, s11, -1010
                  mul          t6, s3, a4
                  srl          t1, a7, a1
                  slt          t5, t1, s1
                  sub          s9, s5, a3
                  sra          gp, t5, t6
                  c.and        a3, a2
                  c.xor        a4, a2
                  csrrwi       a2, 0x340, 5
                  add          a5, a6, s7
                  c.add        s4, t6
                  xori         s10, a5, -1824
                  srai         s9, a7, 7
                  c.addi4spn   a4, sp, 960
                  sub          s8, sp, ra
                  mulhu        zero, a7, t3
                  c.nop
                  c.sub        a0, a4
                  srai         s3, s5, 16
                  addi         a4, t6, -1841
                  lui          sp, 143298
                  c.srai       a4, 5
                  slt          ra, a3, s5
                  sra          t2, t4, s6
                  c.lui        s3, 26
                  c.or         a5, a0
                  c.lui        gp, 18
                  or           t6, s0, t2
                  and          t4, t3, a7
                  c.srli       a2, 1
                  srl          a3, a6, s7
                  c.andi       a5, 1
                  sltu         t5, s3, a2
                  c.slli       t6, 19
                  csrrwi       s3, 0x340, 3
                  srl          a4, a4, s7
                  slti         zero, a5, 687
                  srli         t6, s2, 5
                  slt          a0, ra, s10
                  add          a3, zero, s2
                  mulhu        zero, t3, s6
                  c.srai       a5, 13
                  c.mv         s7, s10
                  c.srli       a0, 21
                  slli         gp, t5, 23
                  c.addi       s3, 27
                  divu         s3, s10, a2
                  c.nop
                  csrrs        t0, 0x340, zero
                  mulhsu       s1, a3, s4
                  sub          s5, a6, sp
                  c.lui        s3, 3
                  divu         s7, a2, t2
                  andi         gp, t3, -414
                  ori          tp, tp, -477
                  or           a3, s11, a6
                  divu         s9, a0, s6
                  mulhsu       s11, tp, t4
                  xor          a6, s7, s9
                  sra          s1, s0, s7
                  c.srai       a5, 6
                  mulhsu       s1, s0, a0
                  divu         a4, s7, a5
                  c.xor        a3, s1
                  c.or         a5, a4
                  xor          a5, s8, tp
                  nop
                  and          a3, s3, s5
                  rem          t0, a7, t5
                  slti         t4, a7, -19
                  csrrc        t2, 0x340, zero
                  c.li         t4, 20
                  c.srli       a3, 2
                  slti         s7, t3, -838
                  c.or         a3, a1
                  nop
                  c.addi       a4, 12
                  div          ra, s10, sp
                  mulhu        t1, a4, s10
                  csrrsi       t2, 0x340, 12
                  srli         s11, s3, 6
                  lui          s8, 849992
                  addi         t3, a6, -56
                  sra          s5, s1, s9
                  remu         s10, s6, s3
                  sltu         s6, s5, a7
                  mulhsu       t3, a6, tp
                  sra          s10, t2, s3
                  c.and        a2, s0
                  slti         s8, s4, -633
                  c.add        t2, s9
                  mul          sp, sp, a7
                  xor          t1, s1, s8
                  sra          t0, zero, a6
                  c.addi4spn   s1, sp, 272
                  slt          s8, s3, gp
                  c.add        tp, s8
                  c.nop
                  c.xor        a3, a5
                  sub          t0, s11, s3
                  c.srli       a4, 25
                  srai         a4, s2, 13
                  ori          s9, s11, -70
                  or           s8, a3, t2
                  nop
                  csrrci       t2, 0x340, 25
                  slli         ra, a2, 10
                  divu         a2, a6, t4
                  c.andi       a0, -1
                  slti         a5, s9, -365
                  c.add        a5, gp
                  nop
                  csrrs        s4, 0x340, t3
                  mulh         s9, s6, tp
                  c.addi       sp, 19
                  slt          t6, s2, tp
                  nop
                  srai         t2, s3, 5
                  csrrc        t2, 0x340, a5
                  addi         gp, s3, 290
                  slli         s7, s2, 5
                  c.addi4spn   a0, sp, 544
                  csrrwi       t6, 0x340, 19
                  c.srli       a5, 29
                  c.addi4spn   a2, sp, 432
                  lui          t3, 920678
                  divu         t5, a1, tp
                  xori         t6, t0, -857
                  srai         a7, s10, 16
                  csrrw        a3, 0x340, t4
                  mulhsu       a2, a2, t1
                  csrrs        t6, 0x340, t1
                  csrrci       s9, 0x340, 24
                  c.nop
                  ori          s4, s3, 1970
                  csrrs        t3, 0x340, zero
                  c.and        a0, a5
                  nop
                  ori          t3, a1, -65
                  c.li         s5, -1
                  or           t0, ra, s0
                  and          t2, tp, a2
                  andi         s10, s0, 311
                  srl          s1, s11, a3
                  sltiu        a3, a6, -1518
                  mul          s11, a1, gp
                  csrrci       a2, 0x340, 0
                  mulh         t5, t5, s2
                  csrrwi       a0, 0x340, 23
                  c.sub        a4, a2
                  lui          t6, 96993
                  mul          s3, s0, a6
                  div          sp, s7, t4
                  remu         zero, a6, tp
                  c.srli       a2, 19
                  sltiu        t0, s10, -1221
                  c.mv         ra, s2
                  addi         s1, s2, 1227
                  c.and        a5, s0
                  c.xor        a0, a3
                  c.mv         t4, t1
                  and          a4, t1, s8
                  sra          s4, a0, s8
                  or           s9, s6, s7
                  c.slli       t5, 13
                  c.xor        a0, a3
                  sltu         a3, t3, s0
                  xori         s9, s6, 71
                  c.xor        a0, a5
                  srl          t3, t2, a3
                  and          a2, s2, t4
                  c.sub        a3, a2
                  csrrsi       s4, 0x340, 0
                  csrrw        s11, 0x340, s0
                  c.addi       a0, -1
                  srai         sp, s10, 24
                  c.nop
                  addi         s4, t4, 50
                  rem          t3, a3, zero
                  csrrw        s10, 0x340, s6
                  c.andi       a3, 7
                  ori          t3, ra, 225
                  or           a7, s4, a0
                  lui          a4, 970149
                  srai         a2, s0, 1
                  andi         t4, s1, 1779
                  addi         s6, s10, -773
                  divu         t1, tp, ra
                  xori         s4, t3, 778
                  csrrwi       t2, 0x340, 29
                  c.andi       a4, 21
                  c.addi4spn   a5, sp, 176
                  div          s5, s3, gp
                  csrrc        t2, 0x340, zero
                  c.mv         a3, a4
                  nop
                  divu         t3, t4, t6
                  remu         a3, s3, tp
                  xor          s8, a0, sp
                  sltiu        t2, s2, -1813
                  andi         s10, s1, 301
                  and          s7, s9, a1
                  c.mv         t6, a3
                  nop
                  c.slli       tp, 6
                  sll          zero, s1, t4
                  c.addi       t6, 14
                  sltiu        t5, zero, -729
                  rem          gp, s5, s7
                  divu         s7, zero, zero
                  rem          s7, s10, s4
                  c.slli       gp, 8
                  lui          a2, 827958
                  auipc        zero, 830977
                  c.xor        a0, a3
                  csrrw        a7, 0x340, t0
                  divu         a0, t3, s1
                  c.addi       gp, 10
                  c.srli       a3, 9
                  csrrw        t2, 0x340, s4
                  sra          s6, t2, a7
                  nop
                  c.mv         s10, s8
                  csrrci       a2, 0x340, 0
                  csrrw        sp, 0x340, t3
                  andi         s3, t3, -2001
                  sub          gp, s5, t2
                  sra          t5, a3, a0
                  c.xor        a4, s1
                  slti         t5, a0, 927
                  remu         a0, t5, zero
                  mulhu        s5, s3, s11
                  sll          gp, s10, sp
                  c.add        gp, t0
                  sra          zero, s11, t4
                  c.nop
                  c.nop
                  c.and        a4, a4
                  csrrci       s9, 0x340, 26
                  rem          s4, s5, t5
                  c.sub        a3, a3
                  remu         s3, t3, s11
                  addi         gp, s4, 2009
                  c.xor        a4, a5
                  add          s10, a5, s1
                  xor          a6, gp, s3
                  mulh         t6, a6, a4
                  remu         gp, t3, sp
                  c.srai       a3, 23
                  xori         s1, t2, 1706
                  rem          a2, sp, s2
                  lui          t3, 450911
                  c.addi4spn   a5, sp, 688
                  sra          s1, a6, s9
                  add          a2, tp, a5
                  auipc        t0, 739395
                  mulhsu       s3, zero, sp
                  mulhsu       tp, t5, gp
                  csrrc        s4, 0x340, a0
                  andi         s6, t3, 1662
                  c.addi       t6, 31
                  srai         t1, a4, 29
                  sltiu        s1, a6, -1013
                  div          s11, t5, zero
                  mulhu        a3, a2, a4
                  rem          s7, s7, t6
                  c.andi       a3, -1
                  slti         a0, t6, -618
                  add          s8, zero, sp
                  c.andi       a0, -1
                  c.mv         a2, t0
                  mulh         t5, gp, s8
                  csrrw        s8, 0x340, zero
                  remu         s10, t5, s6
                  c.nop
                  c.and        a3, a5
                  csrrsi       a6, 0x340, 0
                  slli         t2, s4, 30
                  slti         t0, tp, 925
                  slt          a6, s3, s8
                  csrrsi       ra, 0x340, 9
                  mul          a0, ra, zero
                  c.or         a3, a5
                  mul          a5, a0, s0
                  xor          sp, gp, tp
                  rem          s9, s2, t4
                  srai         s9, t2, 12
                  sra          s10, tp, s2
                  csrrwi       t2, 0x340, 7
                  srl          s9, a5, s0
                  c.nop
                  c.andi       s1, 14
                  srai         s1, a4, 23
                  mulh         a5, s6, t4
                  c.lui        s5, 30
                  sltiu        t3, s5, 1737
                  or           t3, zero, a0
                  mulhu        a7, gp, t2
                  c.addi       a6, 12
                  nop
                  rem          s10, a7, a5
                  c.or         a5, a5
                  slti         a2, a5, -561
                  c.lui        t3, 10
                  addi         tp, s4, 988
                  c.srai       a3, 15
                  csrrwi       ra, 0x340, 21
                  andi         ra, sp, -81
                  c.lui        ra, 30
                  srli         s6, s0, 23
                  csrrci       a6, 0x340, 0
                  c.lui        t6, 26
                  c.lui        t5, 30
                  c.andi       s1, 27
                  c.nop
                  c.addi       s4, 27
                  div          s9, t3, ra
                  csrrsi       gp, 0x340, 26
                  c.srai       s1, 31
                  sra          gp, t2, a5
                  c.addi4spn   a0, sp, 208
                  c.sub        a0, a2
                  sra          t0, gp, s0
                  c.add        s8, s10
                  sltu         zero, a5, t5
                  csrrwi       t5, 0x340, 21
                  csrrci       zero, 0x340, 0
                  c.addi       t6, -1
                  and          s6, s6, a2
                  srai         s4, s2, 27
                  csrrci       s9, 0x340, 12
                  c.add        s3, a4
                  srl          t5, t1, a4
                  c.addi16sp   sp, -16
                  sll          a4, s1, s6
                  divu         a0, s2, s7
                  csrrci       ra, 0x340, 0
                  c.sub        a0, s0
                  srai         t0, s8, 27
                  c.li         s11, 8
                  c.addi4spn   a0, sp, 944
                  xor          a4, a5, sp
                  xori         s8, a6, -1108
                  div          t6, t3, a3
                  c.addi4spn   a4, sp, 528
                  sra          t0, sp, s2
                  remu         s5, t3, tp
                  auipc        s7, 269974
                  remu         a4, t2, gp
                  sltu         s10, a4, s5
                  c.add        a4, t6
                  mul          s4, t5, t5
                  csrrs        s9, 0x340, zero
                  c.addi16sp   sp, -16
                  c.slli       a3, 19
                  remu         a0, t0, t3
                  c.srai       a4, 29
                  c.addi       s10, -1
                  csrrs        tp, 0x340, a7
                  srl          a4, s7, t1
                  sltiu        s3, a7, 2013
                  c.add        s6, s11
                  c.add        t5, a7
                  andi         a6, zero, 12
                  nop
                  c.xor        a0, a1
                  csrrsi       s6, 0x340, 25
                  csrrsi       a0, 0x340, 0
                  sltu         s1, a4, a3
                  c.srli       a0, 9
                  slt          t2, a7, sp
                  xor          a4, a1, s0
                  c.or         a5, a5
                  c.or         a0, s0
                  or           s5, zero, a2
                  add          s8, t4, sp
                  c.lui        ra, 21
                  mulhsu       a6, t2, t1
                  c.add        a4, t1
                  c.srli       s1, 12
                  auipc        s5, 1048515
                  xori         t0, s3, 307
                  c.and        a3, a2
                  srl          tp, t6, a7
                  addi         gp, a5, -1969
                  c.slli       t0, 13
                  rem          gp, s1, a3
                  srli         s10, a5, 30
                  srai         s10, t6, 6
                  c.add        t2, t5
                  c.addi4spn   s1, sp, 176
                  slt          t2, a2, a2
                  c.nop
                  c.nop
                  c.or         s1, a4
                  c.slli       s9, 17
                  c.srli       s1, 22
                  csrrwi       a2, 0x340, 7
                  auipc        a4, 875739
                  c.slli       s9, 9
                  c.and        s1, a2
                  c.srli       a4, 5
                  addi         a4, s1, 542
                  remu         a0, s7, s9
                  c.nop
                  csrrwi       a4, 0x340, 0
                  mul          a7, t3, s9
                  c.srli       a3, 22
                  sra          zero, s5, s10
                  srl          s8, s6, s9
                  srli         s3, a0, 30
                  nop
                  addi         a0, t3, 1032
                  slli         s6, zero, 13
                  slli         t1, s4, 27
                  addi         a2, t4, -1510
                  slt          gp, a7, a7
                  srai         a2, s5, 16
                  xori         t4, t0, -59
                  csrrs        ra, 0x340, sp
                  csrrs        t0, 0x340, t0
                  mulhu        a3, s3, s11
                  c.slli       tp, 13
                  lui          tp, 178592
                  sltu         t5, sp, s2
                  lui          s8, 423963
                  c.li         s11, 26
                  sra          a2, s8, s2
                  csrrsi       a4, 0x340, 0
                  c.and        a5, a5
                  c.add        s5, s1
                  c.andi       a0, -1
                  mulhu        s5, a2, a5
                  c.addi4spn   a2, sp, 496
                  csrrsi       s4, 0x340, 0
                  c.sub        a5, a1
                  addi         t0, s3, -853
                  slt          a4, a4, s5
                  c.lui        a7, 9
                  slli         a3, zero, 9
                  ori          a7, s11, -1339
                  c.sub        a5, a0
                  c.add        a4, gp
                  mulhu        a0, gp, s5
                  divu         a3, a6, s9
                  srai         a5, tp, 26
                  slli         s9, sp, 0
                  sub          s1, zero, s4
                  rem          s1, s9, a0
                  c.addi16sp   sp, -16
                  divu         t2, sp, a3
                  c.andi       a2, -1
                  csrrci       gp, 0x340, 3
                  sub          gp, a6, s9
                  mul          t5, gp, a2
                  c.nop
                  ori          a6, a6, 297
                  c.srli       a0, 12
                  c.add        ra, s1
                  mulh         s5, zero, s8
                  mul          s1, sp, zero
                  slli         a3, s5, 15
                  andi         a4, zero, -1484
                  c.addi16sp   sp, 416
                  c.addi4spn   a0, sp, 48
                  csrrsi       s4, 0x340, 0
                  csrrwi       a4, 0x340, 21
                  and          s1, t3, a2
                  c.or         a0, a5
                  addi         zero, t6, 1499
                  c.srai       a0, 16
                  xori         ra, s1, -1118
                  addi         a3, t2, 961
                  c.andi       a5, -1
                  c.li         a6, -1
                  csrrci       s4, 0x340, 0
                  xor          t1, t2, s0
                  slli         t5, a3, 29
                  slli         s5, t3, 19
                  c.sub        a0, a1
                  mulhsu       gp, s11, s2
                  c.lui        a6, 7
                  mulhsu       ra, t4, sp
                  mul          t6, sp, a0
                  div          a6, t4, s5
                  csrrc        s4, 0x340, zero
                  and          zero, s5, t5
                  srl          t1, t3, zero
                  csrrci       t1, 0x340, 0
                  c.addi       t0, 9
                  andi         s11, s1, -140
                  c.sub        s1, a5
                  andi         t1, a7, 1185
                  add          a3, s4, s8
                  csrrwi       t3, 0x340, 19
                  c.and        a0, a5
                  sub          sp, s2, tp
                  slt          s10, t1, s7
                  csrrsi       ra, 0x340, 0
                  c.srli       a4, 11
                  or           t1, t3, ra
                  or           s7, a6, s8
                  sltiu        a4, s0, 1901
                  c.or         a2, a3
                  divu         s3, t6, s0
                  csrrs        s10, 0x340, zero
                  sltiu        t6, a3, 472
                  c.and        a0, a3
                  sra          t2, s7, s0
                  or           s4, a2, s0
                  c.nop
                  srai         a4, s8, 8
                  srl          s11, t6, gp
                  c.andi       a3, -1
                  addi         t4, s2, -600
                  sltu         t4, a7, t2
                  c.add        a2, s8
                  slt          gp, t3, s8
                  nop
                  addi         a5, t0, 1686
                  div          zero, zero, s3
                  sll          a3, a5, s0
                  mulhu        a2, t4, t3
                  c.and        s1, a1
                  c.and        a2, a4
                  c.sub        a0, a4
                  c.srai       a3, 12
                  csrrc        a0, 0x340, t2
                  slti         zero, s10, -795
                  sra          sp, sp, a6
                  sra          zero, ra, s7
                  mul          a2, t3, a3
                  srli         s6, t3, 10
                  rem          a5, s7, s8
                  csrrc        s6, 0x340, zero
                  andi         s4, s0, 1622
                  mulh         t3, sp, t6
                  xor          s3, a1, t6
                  srai         t1, a6, 28
                  mulhsu       t4, ra, a4
                  mulhu        t6, a5, a0
                  mul          gp, t1, t5
                  csrrw        zero, 0x340, s6
                  csrrci       t4, 0x340, 28
                  csrrw        a3, 0x340, a6
                  csrrwi       s9, 0x340, 11
                  c.xor        a3, a1
                  sub          s10, s2, t5
                  slt          s6, s10, sp
                  c.li         a4, -1
                  slti         a5, t5, 1556
                  c.addi4spn   a5, sp, 32
                  csrrw        t3, 0x340, t4
                  sub          s5, a0, s9
                  xor          t3, t4, s1
                  srai         s8, t6, 9
                  csrrc        s6, 0x340, zero
                  srli         a6, a6, 5
                  add          a6, a5, gp
                  c.xor        a5, a0
                  sll          a4, zero, a3
                  mulhsu       ra, t4, t0
                  slti         s4, s4, 1667
                  add          a7, s9, s11
                  addi         t0, s4, -1546
                  sltiu        s9, s0, 840
                  sra          t6, tp, zero
                  and          a5, s5, tp
                  c.xor        s1, a0
                  add          a0, a3, s6
                  slti         sp, s9, 1597
                  xor          s10, s7, t5
                  add          s11, s8, t3
                  srli         t6, t3, 5
                  sra          s9, a3, t5
                  c.mv         a2, t0
                  sltiu        tp, zero, 1037
                  add          s4, s9, t3
                  slt          s4, t6, s8
                  csrrsi       t2, 0x340, 0
                  c.li         s4, 30
                  add          s4, t2, gp
                  srl          a7, s0, tp
                  csrrwi       s7, 0x340, 20
                  c.li         s11, -1
                  sltiu        a2, ra, -1760
                  c.nop
                  sub          s1, s4, s10
                  c.slli       a4, 18
                  add          s4, a2, s7
                  mulhsu       s1, s11, s4
                  csrrci       sp, 0x340, 0
                  c.addi16sp   sp, -16
                  lui          t2, 54984
                  c.nop
                  c.and        s1, a4
                  rem          s4, a1, a6
                  srai         a3, a3, 30
                  sll          t0, s3, a0
                  sra          t0, a7, a6
                  srli         t0, s2, 17
                  sltu         tp, a6, s4
                  sll          s11, t2, a0
                  mulh         a2, tp, tp
                  srai         a0, s5, 17
                  c.addi16sp   sp, -16
                  c.sub        a5, a2
                  lui          tp, 1010630
                  c.or         a0, s1
                  mulh         gp, s1, s2
                  andi         s9, s7, -833
                  srli         s9, a5, 13
                  c.addi       t2, -1
                  mulh         sp, gp, t6
                  rem          sp, s8, a7
                  c.slli       a0, 18
                  mulhsu       a0, s3, s9
                  c.addi       gp, -1
                  sltu         s1, s2, s11
                  sltu         t4, s6, s8
                  c.andi       a0, -1
                  ori          t6, a4, -432
                  addi         a5, s10, -693
                  mulh         s7, s0, t2
                  andi         t3, sp, 284
                  csrrsi       a3, 0x340, 3
                  sub          a6, t6, zero
                  slti         t1, s7, -623
                  c.srai       a5, 4
                  sll          s8, s7, s1
                  nop
                  c.mv         a2, s6
                  auipc        s10, 153083
                  csrrc        a5, 0x340, zero
                  or           a0, s10, t5
                  lui          a3, 716605
                  ori          a4, t0, 1106
                  mulhsu       a6, a7, a2
                  mulhsu       a2, s8, a3
                  xor          s3, t2, s7
                  and          sp, t2, a5
                  nop
                  csrrs        t6, 0x340, s3
                  auipc        tp, 697548
                  c.srai       a5, 5
                  mulhsu       s10, zero, t4
                  c.addi       tp, -1
                  c.addi16sp   sp, -16
                  c.srai       s1, 22
                  c.add        s4, s8
                  c.nop
                  c.srli       a4, 21
                  csrrc        a7, 0x340, zero
                  c.addi4spn   a5, sp, 800
                  srl          gp, a5, s4
                  csrrc        s6, 0x340, zero
                  c.xor        a2, a3
                  add          a5, ra, s10
                  srl          s7, s9, a5
                  csrrci       a5, 0x340, 18
                  auipc        s9, 225323
                  csrrs        gp, 0x340, zero
                  c.mv         t4, tp
                  sltu         a4, s9, t1
                  lui          s7, 842209
                  srl          ra, a1, t5
                  slt          s8, s7, t1
                  slli         s5, a3, 7
                  div          zero, a5, zero
                  c.and        s1, a0
                  and          s3, s7, a4
                  c.andi       a5, -1
                  c.slli       a7, 20
                  csrrci       s6, 0x340, 0
                  ori          a3, t3, -1160
                  srli         s6, s9, 28
                  nop
                  c.mv         t3, t1
                  csrrc        t3, 0x340, a0
                  srl          sp, s7, t5
                  mulhsu       t5, tp, a4
                  c.or         a3, a4
                  slti         s10, s7, -1801
                  c.xor        a0, a3
                  csrrc        s8, 0x340, a4
                  xori         a2, a6, 1427
                  andi         s6, s9, -1591
                  c.addi4spn   a5, sp, 320
                  mul          t3, t0, tp
                  or           s6, s9, s8
                  csrrc        s6, 0x340, zero
                  c.and        a2, s0
                  c.andi       a2, 26
                  sub          a3, t5, s3
                  slti         s4, s4, -304
                  rem          a5, a2, s8
                  sltiu        a3, s6, -1604
                  csrrw        s10, 0x340, t2
                  auipc        a3, 375948
                  addi         a3, s1, 469
                  c.addi       s1, 20
                  mul          gp, t1, s4
                  slti         s3, gp, -404
                  srai         s4, s11, 21
                  or           tp, s0, s4
                  c.lui        a6, 19
                  csrrc        s9, 0x340, s6
                  sltu         s3, a2, sp
                  add          t5, a3, t4
                  andi         t5, a7, -246
                  slt          t6, a4, s6
                  c.and        s1, a0
                  c.addi4spn   a2, sp, 400
                  and          gp, t1, s3
                  or           a4, tp, zero
                  rem          s10, s6, s3
                  div          a7, s2, s10
                  csrrs        s8, 0x340, a2
                  c.mv         s11, t5
                  c.addi16sp   sp, -16
                  sltiu        s9, gp, -1043
                  sra          ra, gp, s0
                  lui          gp, 577449
                  ori          s11, a1, 991
                  c.and        a3, a1
                  ori          s8, t4, 108
                  c.addi       a4, 4
                  c.andi       a2, 30
                  lui          t6, 972179
                  c.addi4spn   s1, sp, 432
                  c.andi       a4, 19
                  csrrc        t6, 0x340, a6
                  csrrc        a7, 0x340, s1
                  mulhu        s1, t1, s11
                  remu         s5, s0, t0
                  or           tp, t5, a0
                  csrrsi       t6, 0x340, 17
                  mulhsu       a2, s10, s4
                  addi         s6, a0, 964
                  rem          s8, tp, a2
                  c.slli       ra, 21
                  slt          s11, zero, s9
                  csrrwi       s11, 0x340, 26
                  ori          s1, s9, -1015
                  slti         a7, zero, 1303
                  csrrwi       t3, 0x340, 0
                  nop
                  slli         tp, t6, 13
                  divu         ra, t3, a7
                  c.sub        a2, s1
                  or           a0, a4, t3
                  c.srli       a3, 18
                  div          a4, s8, s2
                  c.addi16sp   sp, 240
                  c.nop
                  xori         ra, s9, -1497
                  divu         tp, ra, s9
                  c.lui        a4, 14
                  xor          t3, tp, tp
                  remu         s3, s8, s9
                  xor          a4, tp, a0
                  rem          a7, s4, s4
                  slli         zero, gp, 31
                  c.and        a0, s1
                  c.srli       s1, 12
                  ori          s6, sp, 1460
                  csrrc        t3, 0x340, zero
                  c.addi16sp   sp, 112
                  nop
                  srl          a5, s7, s11
                  add          ra, s10, a5
                  c.addi4spn   a4, sp, 48
                  csrrsi       s4, 0x340, 0
                  csrrw        a5, 0x340, s2
                  sub          sp, s8, tp
                  mulhsu       s8, s2, zero
                  slt          s1, ra, s9
                  csrrwi       zero, 0x340, 3
                  c.srli       a3, 27
                  or           s7, ra, a5
                  c.xor        s1, s1
                  csrrwi       s8, 0x340, 27
                  slti         s9, t0, -1630
                  c.xor        a5, a0
                  nop
                  c.li         t4, -1
                  mulhu        gp, a0, t3
                  c.addi4spn   a3, sp, 384
                  csrrsi       a3, 0x340, 0
                  andi         s8, sp, 177
                  mulhu        s4, a6, a1
                  csrrsi       sp, 0x340, 0
                  c.slli       t4, 14
                  auipc        s9, 751266
                  srai         a3, a2, 17
                  auipc        s9, 970028
                  srli         t5, a4, 26
                  ori          ra, t0, -1218
                  ori          t4, ra, 779
                  ori          s11, a2, -1799
                  c.mv         s10, a2
                  slti         s7, t2, 438
                  rem          t5, s5, t4
                  c.srai       a5, 14
                  xor          s1, t1, a6
                  andi         t5, s0, 1361
                  c.lui        s7, 20
                  sra          a2, a0, s3
                  c.or         a5, a1
                  c.srai       a3, 7
                  c.mv         a2, s10
                  auipc        s4, 407723
                  slti         s5, s4, -1417
                  addi         t1, s1, -1833
                  sub          t3, gp, s6
                  srl          s7, gp, a1
                  remu         ra, a0, t2
                  c.or         a4, a2
                  c.srai       a2, 27
                  mul          sp, t4, a1
                  c.andi       a3, -1
                  sra          sp, a4, a6
                  c.nop
                  c.lui        t4, 13
                  mulh         t1, t4, zero
                  c.andi       a4, -1
                  c.or         a5, a0
                  remu         s8, t2, tp
                  c.andi       a2, -1
                  divu         gp, s9, s6
                  rem          s8, t0, t3
                  andi         a4, ra, 1786
                  slli         a4, a3, 27
                  c.and        a3, a1
                  sub          tp, s0, t6
                  sll          sp, s3, s1
                  rem          a4, t6, s0
                  c.and        a5, a3
                  c.nop
                  mulhu        a4, s11, s9
                  c.addi16sp   sp, -16
                  c.add        s8, t4
                  or           t0, s5, a5
                  c.li         ra, -1
                  sra          s1, s7, s1
                  srli         gp, t1, 0
                  srli         s3, a1, 15
                  andi         t1, a2, -1910
                  c.and        a3, a2
                  csrrwi       s5, 0x340, 16
                  c.lui        s10, 31
                  remu         a2, t0, s9
                  c.lui        a0, 31
                  sub          a0, s9, t5
                  sltu         tp, s7, s7
                  sra          s4, a1, t1
                  slli         tp, s6, 3
                  sll          s6, t2, zero
                  lui          ra, 327528
                  csrrc        s9, 0x340, s11
                  c.or         a3, a5
                  andi         s8, t0, -937
                  srl          gp, t6, t5
                  c.sub        a0, a4
                  c.li         a4, -1
                  csrrci       a3, 0x340, 13
                  srl          a3, t4, s6
                  c.sub        a0, a5
                  c.addi16sp   sp, 400
                  slti         s7, s11, 79
                  divu         s5, s9, s0
                  xor          s5, s6, t3
                  xor          s9, a2, s9
                  ori          s6, a2, 1345
                  csrrwi       s5, 0x340, 12
                  c.slli       sp, 18
                  csrrs        s9, 0x340, zero
                  sltiu        t2, t4, -737
                  c.nop
                  csrrw        s1, 0x340, t0
                  csrrwi       a2, 0x340, 26
                  c.nop
                  sra          t0, tp, s10
                  c.lui        s1, 23
                  and          t4, s9, t4
                  c.srli       a5, 29
                  c.lui        gp, 31
                  divu         tp, s6, s11
                  c.lui        t4, 30
                  c.xor        a4, a5
                  mulh         a2, ra, ra
                  add          t3, s11, a2
                  c.and        a4, a1
                  c.li         t4, 25
                  add          t6, a7, a6
                  auipc        gp, 10305
                  c.addi16sp   sp, -16
                  div          s7, a6, s3
                  sltu         t1, t4, s8
                  or           t2, s6, t5
                  or           gp, t0, s1
                  or           s3, s7, a6
                  mul          s6, t0, s6
                  srli         s9, s5, 3
                  sltu         s4, gp, s4
                  nop
                  c.addi4spn   a3, sp, 144
                  c.or         a5, a3
                  sra          s11, t6, a1
                  srl          s10, sp, gp
                  c.lui        gp, 3
                  xori         s7, t6, 1703
                  c.nop
                  addi         t6, s3, 1059
                  srl          s1, a0, a3
                  c.lui        s1, 1
                  c.addi       t4, 18
                  sltu         s7, sp, zero
                  rem          a3, s3, s11
                  div          a7, s9, t4
                  mulhu        s11, s5, s4
                  or           a4, s6, a3
                  divu         t4, t0, t1
                  c.li         a6, -1
                  c.srli       a5, 1
                  lui          t0, 810877
                  divu         a0, s7, zero
                  c.or         s1, a1
                  srli         zero, s2, 17
                  c.addi4spn   a0, sp, 384
                  c.add        s10, s8
                  andi         s1, tp, -1515
                  ori          s5, zero, 2003
                  c.addi       a0, 22
                  divu         a4, s5, zero
                  c.mv         tp, sp
                  slt          s3, ra, s1
                  divu         s5, s9, t2
                  csrrs        a3, 0x340, zero
                  c.nop
                  and          t5, a0, t1
                  c.li         t5, -1
                  mulhsu       tp, s10, a0
                  slli         tp, a2, 5
                  sra          zero, s4, s9
                  c.sub        a2, a3
                  c.nop
                  c.lui        tp, 22
                  c.slli       s1, 9
                  sub          s3, a6, s4
                  c.and        a5, a3
                  slt          s5, t0, a4
                  c.lui        s11, 4
                  c.and        a0, s1
                  auipc        t1, 466021
                  csrrci       a7, 0x340, 0
                  slt          s6, zero, ra
                  andi         a5, a5, -792
                  or           s3, s6, t0
                  xor          t5, s2, s6
                  slt          sp, ra, s2
                  csrrci       zero, 0x340, 0
                  div          gp, t3, a4
                  xor          a5, t1, t0
                  nop
                  slli         t5, tp, 10
                  csrrci       a4, 0x340, 0
                  addi         s6, s4, -1899
                  c.nop
                  c.xor        a3, a2
                  srai         a3, s9, 2
                  or           t1, t6, a6
                  sltiu        a2, s1, 907
                  slt          a7, t5, t6
                  c.addi4spn   s1, sp, 704
                  c.lui        a5, 31
                  csrrw        tp, 0x340, a4
                  c.and        a5, a0
                  sub          t5, a5, s8
                  c.nop
                  auipc        tp, 23096
                  slt          t0, s8, t3
                  xor          a6, a5, a4
                  c.add        s4, s0
                  sltiu        t6, t3, 41
                  ori          sp, t2, -1153
                  mulh         a0, s3, t4
                  srli         s8, a5, 15
                  c.li         s4, 11
                  csrrc        s9, 0x340, s3
                  xori         s3, s6, 978
                  lui          gp, 803501
                  rem          a2, s2, s6
                  c.andi       a5, -1
                  c.sub        a3, a2
                  c.mv         gp, s7
                  xori         t0, a7, -1462
                  rem          t3, t3, s1
                  c.slli       a6, 12
                  csrrsi       t2, 0x340, 17
                  sra          tp, t3, s11
                  c.addi16sp   sp, -16
                  csrrc        a0, 0x340, zero
                  addi         a4, t0, -297
                  divu         s3, s0, t5
                  srli         a2, s10, 8
                  c.mv         s7, a1
                  remu         t1, a2, s0
                  divu         s4, s7, s5
                  add          s9, s9, s0
                  csrrw        a2, 0x340, a6
                  auipc        s3, 681438
                  and          t3, a4, a7
                  or           t3, s1, s10
                  c.and        a4, a3
                  srai         a0, a7, 26
                  rem          s9, tp, t3
                  csrrs        a6, 0x340, zero
                  mulh         a2, s2, a6
                  or           s7, a3, ra
                  csrrs        zero, 0x340, zero
                  sub          a4, sp, a7
                  div          s6, s6, t5
                  c.sub        a5, a0
                  srai         a6, a1, 13
                  c.xor        a3, a5
                  c.addi16sp   sp, 416
                  c.xor        a3, a4
                  c.lui        s3, 15
                  srli         t4, s9, 3
                  slt          t4, t4, s3
                  lui          t5, 571624
                  c.xor        s1, a4
                  c.and        a0, a0
                  c.addi16sp   sp, 256
                  mul          s3, s0, a6
                  c.sub        a4, a3
                  mul          t2, a1, t4
                  csrrwi       s7, 0x340, 4
                  mulhu        s8, a2, gp
                  or           s11, zero, tp
                  sra          a7, t4, t4
                  c.li         a4, -1
                  c.nop
                  c.mv         t5, s3
                  sll          t2, s9, a5
                  c.and        s1, s1
                  c.addi16sp   sp, 320
                  mulhu        t4, tp, s3
                  remu         sp, t5, tp
                  rem          t2, s6, t1
                  c.add        t2, a3
                  c.srli       a4, 6
                  sll          t2, s7, s1
                  csrrci       s7, 0x340, 0
                  c.sub        s1, s1
                  c.lui        s1, 7
                  sll          s6, t0, s7
                  csrrc        a3, 0x340, t1
                  csrrw        a4, 0x340, a4
                  sub          a4, a5, s3
                  remu         tp, a4, s3
                  c.or         a0, a0
                  csrrw        sp, 0x340, ra
                  c.li         t6, -1
                  c.andi       a5, 16
                  slti         s4, t3, -1162
                  andi         t0, sp, -1977
                  c.sub        s1, s0
                  srl          s5, s10, zero
                  sra          s6, a6, a3
                  c.addi4spn   s1, sp, 160
                  srai         t0, t1, 28
                  c.and        a0, a5
                  c.or         a5, a3
                  c.lui        a4, 5
                  c.xor        a4, a1
                  sra          a7, s8, a1
                  sra          t6, a4, t3
                  csrrc        s9, 0x340, zero
                  c.li         s5, 13
                  csrrs        a5, 0x340, zero
                  c.xor        s1, a5
                  csrrci       s1, 0x340, 0
                  csrrwi       t2, 0x340, 9
                  addi         a2, s3, -488
                  c.lui        t5, 22
                  c.sub        s1, s0
                  divu         s5, a2, t6
                  addi         s6, t3, 1431
                  c.mv         ra, a5
                  csrrw        s10, 0x340, zero
                  or           ra, a5, gp
                  sltiu        t1, s1, 1164
                  csrrc        s3, 0x340, t6
                  add          s1, s2, ra
                  lui          a4, 549848
                  c.addi16sp   sp, 64
                  sub          s5, zero, a5
                  c.lui        tp, 30
                  c.addi16sp   sp, -16
                  sra          a4, t3, a0
                  xori         a0, a2, -1980
                  c.addi       s7, -1
                  csrrs        a7, 0x340, zero
                  lui          tp, 61171
                  srli         s10, t4, 12
                  nop
                  csrrsi       a6, 0x340, 20
                  slti         gp, zero, 1290
                  mulhsu       s10, s6, tp
                  c.lui        t5, 18
                  c.lui        a3, 4
                  xori         s5, s9, -579
                  addi         s1, s9, 1123
                  slti         t6, s9, -87
                  xor          s1, t3, a7
                  sll          t2, gp, t4
                  csrrsi       s1, 0x340, 0
                  c.andi       a3, -1
                  remu         s7, t3, zero
                  sltiu        a6, s7, -1503
                  sub          a3, s3, a6
                  mulh         s1, s5, sp
                  c.li         t6, -1
                  c.srai       a5, 12
                  c.andi       a0, -1
                  srai         s10, gp, 27
                  csrrc        a6, 0x340, zero
                  nop
                  div          a5, s11, t4
                  c.or         a3, a4
                  sub          a4, t6, tp
                  srl          t1, s2, a7
                  slt          t6, ra, s0
                  addi         gp, t2, -67
                  c.xor        a2, a2
                  c.addi4spn   s1, sp, 160
                  and          s9, s6, s3
                  srl          t6, t5, t5
                  c.xor        s1, a2
                  slt          t1, a4, a1
                  sll          t4, s1, t2
                  c.addi4spn   a4, sp, 496
                  c.xor        s1, a1
                  c.andi       a0, -1
                  sltu         a2, s4, sp
                  mulh         a6, a5, t4
                  lui          zero, 171938
                  div          s4, t5, s6
                  divu         t2, a4, zero
                  c.xor        a5, a1
                  auipc        sp, 100634
                  c.li         s11, -1
                  mulhu        t6, t6, a5
                  auipc        a3, 196496
                  ori          s4, s2, -1135
                  c.add        a5, t6
                  csrrc        s3, 0x340, t6
                  srli         s1, a2, 4
                  c.li         s3, -1
                  sub          a4, s11, zero
                  c.nop
                  and          t5, t3, a6
                  c.andi       a5, -1
                  nop
                  c.addi4spn   a4, sp, 80
                  csrrc        a0, 0x340, zero
                  slli         a2, s11, 25
                  csrrw        a2, 0x340, s2
                  c.andi       a3, -1
                  xori         s8, s8, 1297
                  c.li         a7, -1
                  xor          s9, s1, a4
                  c.nop
                  div          gp, t6, t0
                  divu         a6, a7, a7
                  csrrs        t3, 0x340, zero
                  c.or         s1, a4
                  sub          sp, tp, ra
                  csrrci       a4, 0x340, 0
                  mul          a4, sp, t5
                  auipc        a6, 783044
                  c.addi16sp   sp, 64
                  mul          t6, s0, a3
                  srl          s8, a6, a1
                  c.sub        a2, s0
                  mulhu        s6, s1, a3
                  csrrwi       s11, 0x340, 24
                  mulh         t4, s2, t3
                  csrrci       a4, 0x340, 0
                  c.sub        a5, a4
                  or           a7, s8, t0
                  sltiu        s9, a5, -1605
                  c.srli       s1, 5
                  srli         s5, a0, 16
                  sra          sp, s6, a5
                  c.addi       a7, -1
                  slti         t5, s5, 507
                  srl          s4, zero, a3
                  c.lui        ra, 10
                  xori         t5, s11, 774
                  sltiu        gp, s11, 285
                  sra          t0, t6, s6
                  ori          t4, zero, -1880
                  c.or         s1, a2
                  add          t5, a5, a4
                  c.mv         a0, a2
                  sll          s11, a3, s1
                  addi         t4, a7, 1024
                  andi         t5, t6, 787
                  nop
                  c.andi       a0, -1
                  xori         t1, t0, 81
                  mul          s1, a4, a0
                  c.mv         a3, a1
                  c.lui        s3, 12
                  slli         a6, t4, 3
                  c.sub        a3, a0
                  c.addi4spn   a4, sp, 832
                  csrrw        tp, 0x340, a7
                  c.lui        a6, 12
                  addi         a4, ra, -1947
                  auipc        a7, 128114
                  c.slli       s8, 28
                  slti         ra, a0, -590
                  c.xor        s1, a4
                  c.nop
                  sll          t1, a7, s4
                  auipc        s5, 100243
                  c.addi16sp   sp, 336
                  xori         s4, t1, 576
                  c.andi       a2, 2
                  lui          a2, 848452
                  ori          a2, t0, -1530
                  csrrs        t1, 0x340, zero
                  nop
                  ori          t0, s7, 565
                  c.addi16sp   sp, -16
                  sra          t1, s7, zero
                  sll          t1, t2, s11
                  csrrwi       t5, 0x340, 16
                  c.and        a2, a2
                  xor          zero, zero, a6
                  csrrci       s11, 0x340, 30
                  csrrci       t2, 0x340, 28
                  mul          t4, a7, s10
                  rem          s4, s3, a5
                  c.addi16sp   sp, 80
                  c.andi       s1, 29
                  and          s3, t4, s8
                  c.xor        a0, s0
                  add          s4, s1, a3
                  add          s6, s6, zero
                  csrrc        s5, 0x340, zero
                  c.addi       s6, -1
                  srl          a3, gp, t2
                  slt          t5, t1, a1
                  xor          s11, s6, tp
                  mulh         s8, t1, t5
                  c.srli       a2, 10
                  ori          t1, t0, 5
                  c.slli       a3, 2
                  srai         t4, tp, 11
                  c.addi       t6, 23
                  sra          a5, ra, zero
                  andi         t0, t0, 1093
                  mulhu        t5, a1, s7
                  csrrwi       ra, 0x340, 31
                  auipc        ra, 705775
                  addi         t3, a1, 1886
                  c.slli       a2, 22
                  add          t2, t2, a3
                  c.addi       a2, 24
                  sub          a2, s10, sp
                  csrrci       a4, 0x340, 0
                  slli         a2, t1, 12
                  lui          s1, 171994
                  or           a5, s5, s11
                  srli         tp, a3, 5
                  slli         zero, s1, 24
                  srli         t4, sp, 22
                  c.li         t3, 19
                  sra          t3, s9, t6
                  slti         gp, s5, -930
                  c.andi       a4, -1
                  c.add        t2, s10
                  mulhsu       s11, a5, s2
                  slti         t6, s8, 1150
                  c.srli       a3, 4
                  rem          a3, a0, t4
                  divu         s4, s8, sp
                  mulhsu       t6, t4, s2
                  c.lui        a0, 22
                  slt          ra, s2, zero
                  slt          t6, t6, tp
                  srli         t2, a6, 24
                  mulhu        a2, t5, s11
                  and          a7, a0, s4
                  slti         t3, s1, 454
                  slti         a4, s9, 1030
                  auipc        t1, 74490
                  c.andi       s1, -1
                  div          s1, a2, s6
                  sll          a0, sp, sp
                  c.srai       s1, 4
                  remu         s7, t5, gp
                  csrrs        a3, 0x340, zero
                  c.slli       t2, 24
                  csrrc        a6, 0x340, s4
                  or           zero, s3, a0
                  addi         s11, t5, -1634
                  and          s4, t5, t6
                  csrrs        a5, 0x340, zero
                  srl          a5, s7, s7
                  srli         s9, s9, 12
                  csrrci       a6, 0x340, 27
                  csrrci       a0, 0x340, 31
                  or           a0, s1, t3
                  csrrs        t5, 0x340, zero
                  sltiu        gp, a0, -817
                  nop
                  rem          a6, t0, sp
                  sltu         t1, ra, s2
                  srl          a4, t4, s11
                  slt          s1, a2, s1
                  mulhu        t1, t3, s7
                  csrrwi       s3, 0x340, 29
                  sub          a0, a2, s1
                  rem          s9, t1, t0
                  c.addi4spn   a0, sp, 880
                  csrrc        t4, 0x340, zero
                  c.andi       a3, 9
                  slt          a7, s9, s1
                  c.lui        a7, 19
                  c.add        a2, s2
                  c.addi       gp, -1
                  c.and        a5, a0
                  c.nop
                  slt          s8, s4, s0
                  srli         s9, t0, 10
                  nop
                  mul          t1, a1, t5
                  c.li         t5, 5
                  c.or         a5, a3
                  csrrs        s6, 0x340, zero
                  c.andi       a2, -1
                  slt          s3, gp, t0
                  remu         sp, a2, a6
                  divu         tp, s8, s7
                  c.srli       a5, 11
                  c.nop
                  div          s7, a1, s0
                  c.srai       a4, 11
                  mul          gp, a7, s2
                  c.andi       a2, 10
                  csrrw        tp, 0x340, a6
                  sra          t2, a4, s11
                  c.mv         a2, t5
                  c.slli       tp, 6
                  mulh         s10, gp, sp
                  mulhsu       t0, s2, s5
                  srli         gp, a6, 10
                  slti         s9, a5, -1407
                  ori          a7, a2, 1717
                  c.addi16sp   sp, -16
                  sub          s4, a3, a6
                  andi         s3, a7, -860
                  xori         a6, s5, -1374
                  xor          a4, t3, s10
                  or           s1, a6, zero
                  nop
                  sub          s5, s11, ra
                  lui          ra, 930329
                  csrrs        a2, 0x340, s4
                  srli         a7, t4, 18
                  c.sub        a5, a5
                  slli         s7, a3, 21
                  slli         s9, s8, 11
                  c.srai       s1, 15
                  divu         t2, a5, t1
                  c.xor        a5, a0
                  csrrs        s7, 0x340, t2
                  c.andi       s1, -1
                  c.li         tp, 17
                  srli         s8, s4, 22
                  c.andi       a0, -1
                  csrrc        zero, 0x340, zero
                  sra          s10, s3, s8
                  csrrwi       s11, 0x340, 0
                  xori         t6, s6, 1582
                  c.sub        s1, a5
                  c.or         a3, a2
                  c.slli       a6, 14
                  addi         zero, a6, -723
                  slt          tp, a6, s9
                  rem          t4, s4, t4
                  c.addi16sp   sp, 128
                  csrrs        a6, 0x340, ra
                  c.nop
                  csrrs        a0, 0x340, s5
                  slt          t4, s5, s1
                  srai         t4, s9, 10
                  csrrc        t1, 0x340, zero
                  csrrsi       a2, 0x340, 1
                  c.or         a4, a4
                  addi         s10, a2, 1435
                  csrrw        s3, 0x340, s2
                  slti         tp, s2, -132
                  slli         a4, ra, 1
                  csrrw        a5, 0x340, s9
                  c.srli       a0, 3
                  rem          t1, s7, a7
                  csrrc        sp, 0x340, zero
                  c.or         a2, s1
                  sltu         a4, s4, s5
                  sll          t6, a5, s1
                  c.or         a2, s0
                  ori          gp, s3, -1189
                  c.or         a3, s0
                  slti         tp, tp, 177
                  c.andi       a5, -1
                  c.lui        gp, 15
                  lui          t3, 354478
                  div          s10, a2, sp
                  nop
                  c.addi4spn   a0, sp, 368
                  c.slli       s8, 17
                  c.add        a2, gp
                  srai         ra, a4, 2
                  c.addi16sp   sp, -16
                  mulhu        t6, ra, zero
                  csrrw        s10, 0x340, a6
                  sll          s7, t3, a4
                  or           s10, s11, s6
                  rem          t4, t4, a0
                  sltu         s8, t2, s6
                  c.xor        s1, a1
                  csrrsi       a4, 0x340, 13
                  c.add        t5, a1
                  c.sub        a3, a3
                  srai         s8, t6, 9
                  csrrc        t6, 0x340, a3
                  xori         s11, t0, 1099
                  remu         a5, s3, t1
                  c.andi       a5, -1
                  c.li         t3, -1
                  slli         a0, s7, 28
                  c.and        a3, a0
                  mulhsu       a5, s0, a6
                  c.mv         s5, sp
                  addi         s4, tp, -1597
                  c.li         a7, 2
                  lui          a7, 960154
                  andi         t1, a3, -808
                  andi         a0, s10, 189
                  mulh         s8, t4, s0
                  xor          s10, s1, s3
                  c.nop
                  csrrwi       s7, 0x340, 2
                  xori         s7, t0, -257
                  xori         a4, t2, -97
                  sra          t0, a0, t1
                  c.li         ra, -1
                  srl          t6, a6, a5
                  srl          a5, zero, t0
                  mulhu        s6, a5, t5
                  c.add        a0, sp
                  slt          t1, s9, a5
                  c.mv         a0, a2
                  auipc        s7, 79105
                  ori          a0, t0, 1127
                  c.xor        a3, a2
                  c.or         a2, a2
                  c.addi16sp   sp, 464
                  c.and        a2, a3
                  xori         a5, ra, 843
                  sra          a0, t5, s9
                  c.or         a2, a2
                  c.xor        a2, a2
                  or           t0, s5, s11
                  nop
                  c.slli       s7, 26
                  xor          ra, s8, t5
                  c.li         a3, -1
                  rem          gp, t2, s6
                  sll          a5, s10, s3
                  c.slli       a2, 15
                  c.sub        a4, a5
                  csrrs        a6, 0x340, s5
                  c.slli       t3, 28
                  csrrw        s5, 0x340, s6
                  c.add        t0, ra
                  mulhsu       a0, s9, a3
                  c.li         t6, 26
                  c.sub        a5, a4
                  c.andi       a2, 28
                  slti         a4, s7, -228
                  csrrw        s3, 0x340, s7
                  c.mv         s3, t3
                  xor          t0, s6, gp
                  c.addi4spn   a2, sp, 688
                  divu         s9, t2, s11
                  c.slli       t6, 5
                  sra          sp, a4, s9
                  c.andi       a5, 3
                  csrrs        s7, 0x340, s3
                  c.or         s1, a4
                  addi         s7, s9, 750
                  sltu         a3, a2, tp
                  sltu         a2, s5, a0
                  ori          s1, s9, 1859
                  csrrsi       s8, 0x340, 6
                  or           t5, s7, a0
                  sltiu        s1, t3, 1420
                  c.lui        s11, 30
                  c.addi       a4, -1
                  mul          a6, a6, gp
                  divu         t6, t5, s0
                  csrrc        a7, 0x340, s4
                  csrrc        s8, 0x340, zero
                  sll          s10, t2, s10
                  c.nop
                  csrrci       s8, 0x340, 0
                  c.add        s3, t4
                  c.and        a3, s0
                  c.add        a6, s9
                  mul          a5, a4, s4
                  mulhsu       t6, t1, t4
                  sra          s4, ra, zero
                  andi         s7, a0, -1316
                  c.sub        a2, a4
                  c.srli       s1, 19
                  slti         a3, s11, 646
                  c.or         a4, a4
                  c.slli       a6, 17
                  c.srli       a5, 11
                  c.xor        a4, a5
                  mul          s3, zero, t1
                  c.sub        a3, s0
                  c.sub        a5, s1
                  srli         tp, a6, 17
                  csrrci       zero, 0x340, 11
                  c.mv         t1, s4
                  and          a7, a6, s5
                  c.srli       a5, 3
                  sltu         s3, ra, a0
                  sltiu        s9, a6, 1172
                  slli         a0, t4, 7
                  csrrs        t5, 0x340, s3
                  c.mv         t4, s6
                  srl          s4, a3, s9
                  andi         t4, a4, -1215
                  auipc        a6, 232441
                  sra          a6, s9, a1
                  mulhsu       t0, s11, gp
                  slti         s8, a4, 487
                  andi         s8, s10, -1529
                  c.slli       tp, 15
                  rem          s3, a3, s6
                  mulhsu       a7, s8, s1
                  ori          a5, s2, -51
                  c.xor        a5, s1
                  c.nop
                  add          a3, s2, a5
                  c.sub        a4, a3
                  mulhsu       a3, t3, a7
                  c.add        s7, ra
                  csrrsi       t6, 0x340, 0
                  divu         t3, t1, s3
                  srli         zero, s7, 30
                  ori          s4, s5, 1081
                  sltiu        a3, sp, 1562
                  c.mv         s9, ra
                  c.nop
                  c.addi       a6, 14
                  remu         s9, t4, t6
                  divu         t2, ra, a3
                  sll          a3, s11, s9
                  c.srai       s1, 16
                  rem          t0, t1, a1
                  slli         sp, s8, 18
                  slti         a0, s5, -984
                  and          sp, a4, s8
                  c.andi       a5, -1
                  c.addi4spn   s1, sp, 800
                  c.srai       a4, 6
                  c.or         a0, a5
                  slti         s5, s10, 376
                  mulhsu       t1, t5, ra
                  mulh         t2, s1, s2
                  c.andi       a5, -1
                  csrrw        a2, 0x340, s6
                  sra          t0, tp, s8
                  andi         t5, a5, -1700
                  rem          s11, a4, s4
                  div          tp, s6, ra
                  xor          s1, a1, t1
                  sub          zero, t1, a2
                  sltiu        s3, t6, 1173
                  c.slli       t6, 12
                  slt          s7, a2, sp
                  xor          ra, tp, a3
                  slti         a3, gp, 859
                  c.add        a6, s9
                  csrrc        a6, 0x340, s11
                  csrrsi       s11, 0x340, 0
                  csrrc        s7, 0x340, t3
                  nop
                  xori         a5, s11, 252
                  c.lui        t3, 21
                  xor          s9, s4, a2
                  c.li         t4, 4
                  xor          a2, a0, tp
                  srai         a5, ra, 21
                  srl          tp, a3, t0
                  c.addi       t3, -1
                  c.xor        a2, a5
                  sll          tp, s9, t0
                  slti         t2, t1, -761
                  auipc        ra, 737575
                  slti         s8, t4, -58
                  xor          a2, tp, s4
                  xori         s1, a3, 1452
                  mul          a0, s9, s9
                  csrrsi       t5, 0x340, 0
                  sll          s9, s7, a0
                  c.mv         t4, a2
                  div          t2, s0, s1
                  sra          s11, a5, s11
                  and          t4, ra, a4
                  c.or         s1, a1
                  c.addi       t4, 28
                  sll          s11, t3, s10
                  or           a3, s7, sp
                  c.and        a4, a2
                  slti         a3, t1, -326
                  and          s4, t3, t5
                  csrrsi       s5, 0x340, 0
                  sub          a3, sp, s4
                  csrrc        t2, 0x340, s4
                  xori         s11, t0, -1313
                  slli         a2, a7, 19
                  slti         s11, a5, 935
                  srl          t4, a6, s0
                  csrrci       s7, 0x340, 0
                  c.slli       gp, 11
                  auipc        s5, 725278
                  c.andi       a2, -1
                  c.and        a2, a2
                  c.srai       a5, 8
                  mulhu        ra, s3, t5
                  mulhu        s11, s7, sp
                  c.addi16sp   sp, 144
                  mulhsu       t4, ra, a7
                  csrrwi       t2, 0x340, 20
                  c.xor        a2, a0
                  c.andi       a4, -1
                  csrrw        s8, 0x340, tp
                  c.li         gp, 27
                  addi         a3, a7, 1505
                  srli         a5, t3, 28
                  nop
                  sll          s11, a6, a5
                  c.addi16sp   sp, 208
                  c.addi16sp   sp, -16
                  slt          s1, s5, t2
                  xori         a6, s11, -2033
                  c.sub        a0, s1
                  mul          s11, tp, s5
                  ori          zero, s5, -1256
                  remu         a7, a0, s0
                  csrrc        ra, 0x340, a0
                  or           a3, t5, t1
                  csrrw        a0, 0x340, t4
                  c.andi       a5, -1
                  slt          ra, s4, s7
                  div          zero, t0, t3
                  andi         gp, s3, -135
                  add          t6, tp, s0
                  auipc        zero, 819230
                  c.srai       s1, 16
                  and          a2, a4, zero
                  mul          t3, s0, s9
                  or           t5, s6, s7
                  c.lui        s5, 21
                  csrrc        t4, 0x340, zero
                  slti         s8, a4, -998
                  mul          s6, t0, t6
                  sll          s8, s0, sp
                  sra          sp, a2, s10
                  div          sp, s8, t2
                  ori          sp, s3, 1859
                  srl          a7, t3, t0
                  and          s8, a5, a1
                  or           s4, a4, sp
                  c.lui        s1, 15
                  sltu         a0, s3, a3
                  rem          t5, t4, s6
                  mulh         a7, s11, t1
                  csrrwi       ra, 0x340, 22
                  srli         s3, a0, 25
                  c.mv         a3, a7
                  slt          a5, t5, a6
                  c.addi4spn   a4, sp, 320
                  rem          ra, zero, s4
                  c.srli       a2, 26
                  c.lui        t2, 22
                  c.mv         a5, s8
                  csrrci       t4, 0x340, 21
                  c.sub        a3, a5
                  andi         s5, a2, 1743
                  c.addi       s3, 14
                  srl          s1, zero, s2
                  sltu         t5, s11, s8
                  c.xor        a2, s1
                  mulhu        s11, s10, s0
                  csrrc        s5, 0x340, zero
                  c.li         s4, 5
                  c.nop
                  mul          a6, a5, zero
                  c.nop
                  c.slli       s4, 15
                  c.mv         a2, a1
                  sltiu        a6, s10, -495
                  c.or         a3, a3
                  c.add        a7, sp
                  c.and        a3, a4
                  srl          t2, a0, zero
                  and          s5, t5, zero
                  mulhu        a7, t1, s5
                  csrrs        t1, 0x340, sp
                  c.nop
                  sll          s4, sp, gp
                  c.addi16sp   sp, 144
                  c.lui        a6, 30
                  addi         zero, s5, 1505
                  c.addi       a3, -1
                  addi         a0, gp, 1690
                  xor          s6, a5, sp
                  c.addi16sp   sp, -16
                  c.or         a4, a2
                  sltu         t6, s6, s3
                  c.srli       a0, 15
                  slli         sp, s8, 28
                  add          t2, t2, s11
                  csrrc        t2, 0x340, t6
                  slt          t2, s10, s10
                  lui          a2, 1036218
                  slti         s7, gp, 988
                  c.addi4spn   a3, sp, 1008
                  csrrs        t2, 0x340, a4
                  auipc        a4, 372653
                  c.andi       s1, -1
                  c.xor        a0, a1
                  csrrc        s7, 0x340, a6
                  c.and        a2, a1
                  lui          t4, 896705
                  sra          s10, a1, t5
                  div          a0, t2, a3
                  remu         s7, a5, a1
                  c.addi16sp   sp, 464
                  mul          a0, s2, s10
                  c.addi       t2, 19
                  c.srai       a5, 22
                  lui          s6, 670770
                  csrrs        s4, 0x340, zero
                  add          s11, s8, a2
                  srl          a6, s7, a3
                  add          s4, sp, t5
                  mulhu        a6, ra, gp
                  andi         s11, t1, 1867
                  and          s6, s11, tp
                  c.li         gp, 15
                  c.mv         ra, s6
                  sub          s8, s6, tp
                  c.slli       s4, 6
                  mulh         t6, s10, s3
                  nop
                  sltiu        t0, sp, -1703
                  c.xor        a5, s0
                  csrrci       s3, 0x340, 0
                  srl          t2, s11, t1
                  c.slli       s4, 5
                  c.mv         s10, s4
                  add          s1, s0, s9
                  and          a0, a0, ra
                  c.li         a7, -1
                  mulhsu       s10, ra, t0
                  mulhsu       t6, t5, t0
                  sra          s1, tp, t2
                  nop
                  c.lui        t5, 9
                  c.srli       a2, 26
                  c.sub        a2, a5
                  slli         a4, s4, 5
                  srai         s5, a2, 7
                  mulhsu       s4, s9, s5
                  xor          sp, a0, s6
                  mulhu        zero, a7, s2
                  auipc        s6, 362277
                  c.or         a0, a5
                  divu         t4, a7, s3
                  or           t0, a0, s1
                  c.and        a4, a3
                  remu         t3, s3, s9
                  c.mv         t4, ra
                  addi         zero, s2, -1324
                  ori          t2, tp, -1188
                  andi         s5, t1, 308
                  and          tp, s3, t0
                  nop
                  auipc        t0, 660249
                  mul          zero, t2, t0
                  csrrw        s10, 0x340, s8
                  srli         a7, a2, 22
                  c.add        a3, t6
                  srl          a7, a0, s4
                  mulh         sp, a7, s4
                  sub          a3, s3, s5
                  sub          a3, t6, t6
                  c.addi4spn   a0, sp, 48
                  xor          s6, a0, tp
                  srl          s8, s9, ra
                  sra          a7, s4, s3
                  add          a2, s7, s0
                  srl          s1, a1, t0
                  nop
                  mulh         t2, s4, s5
                  c.or         a4, s1
                  csrrci       ra, 0x340, 3
                  sll          s5, s4, a2
                  nop
                  c.slli       t3, 27
                  c.or         a5, a2
                  c.addi16sp   sp, 144
                  c.srli       a0, 30
                  remu         s3, t6, t3
                  sltu         a6, t5, s2
                  andi         s6, s3, 189
                  csrrw        a5, 0x340, s10
                  csrrw        s11, 0x340, tp
                  c.srai       s1, 16
                  c.lui        a7, 5
                  xor          s10, s10, a2
                  c.addi4spn   a5, sp, 608
                  c.mv         t6, a0
                  c.li         t5, 7
                  ori          a3, t4, 1606
                  csrrwi       a0, 0x340, 1
                  sltiu        s1, a5, -1117
                  c.slli       a7, 22
                  csrrci       s3, 0x340, 30
                  c.addi4spn   s1, sp, 224
                  slti         s3, s5, -1748
                  c.addi       s9, 5
                  sltu         t5, t2, a4
                  rem          s3, a1, s8
                  or           s6, s6, a7
                  csrrw        t1, 0x340, a7
                  csrrwi       s3, 0x340, 18
                  and          a0, t5, t3
                  add          t6, s6, t2
                  c.mv         gp, s11
                  remu         a4, t1, s2
                  auipc        t1, 555614
                  c.and        a3, a3
                  c.nop
                  c.slli       s10, 19
                  c.and        a2, a2
                  and          zero, tp, s3
                  csrrw        s5, 0x340, s7
                  mul          s7, s7, s0
                  remu         t2, s11, t0
                  mulhu        tp, a3, t1
                  c.srli       a3, 15
                  mulh         s6, tp, sp
                  ori          sp, sp, -46
                  mulhu        s6, sp, a0
                  srl          t0, a5, ra
                  sra          s6, t0, a2
                  slli         s4, zero, 31
                  csrrw        s7, 0x340, a4
                  sub          ra, gp, a5
                  slt          a7, a7, a0
                  c.and        a2, a5
                  sll          s8, zero, a3
                  c.slli       a5, 4
                  mulh         s9, a4, s2
                  srai         s3, s0, 21
                  add          sp, t3, s3
                  srli         tp, a0, 30
                  c.and        a0, a3
                  csrrwi       a2, 0x340, 19
                  xori         a6, s1, -109
                  sra          s4, s6, ra
                  addi         t2, t1, 102
                  c.mv         a7, a3
                  slti         sp, s10, -136
                  csrrsi       s6, 0x340, 20
                  slli         s9, s3, 15
                  xori         s10, t2, -508
                  mulhu        s8, t6, t2
                  c.add        s1, sp
                  addi         s8, a1, 1751
                  sltiu        s8, t2, -162
                  c.addi16sp   sp, 224
                  divu         t5, s1, gp
                  c.andi       a0, -1
                  srli         ra, s4, 7
                  auipc        a5, 702810
                  c.srli       s1, 4
                  rem          t0, s1, a2
                  auipc        gp, 452050
                  c.nop
                  sub          t0, a7, s7
                  and          t6, s10, s0
                  remu         t6, t4, a2
                  xor          t3, t4, s1
                  slt          s5, a5, sp
                  div          s7, s9, s7
                  c.andi       s1, -1
                  c.slli       tp, 15
                  csrrwi       t6, 0x340, 5
                  c.srli       a5, 24
                  c.addi       s4, -1
                  mulhu        zero, s10, s5
                  srli         s8, gp, 0
                  or           sp, t3, a3
                  slti         s1, s10, 886
                  mulhu        s3, t2, sp
                  c.xor        a5, a3
                  slti         s3, t1, -1510
                  slli         ra, s8, 22
                  c.srli       a0, 25
                  and          t5, s4, t5
                  sub          a7, ra, t5
                  c.andi       a0, 7
                  xori         zero, gp, 1362
                  c.xor        a2, a1
                  srai         s11, a1, 7
                  sltiu        t1, a2, 363
                  xori         t0, ra, -1944
                  addi         a5, s3, 496
                  sub          a5, a1, s5
                  c.addi4spn   a4, sp, 608
                  c.xor        a5, s1
                  sltu         a4, gp, s7
                  xor          sp, a6, s8
                  c.sub        s1, s0
                  c.mv         s8, s11
                  srli         t0, a4, 0
                  c.add        t2, a2
                  addi         ra, s10, 281
                  c.mv         t6, t5
                  srli         s5, s9, 30
                  sltiu        t0, s6, 644
                  c.lui        ra, 30
                  c.addi4spn   a0, sp, 240
                  c.or         a0, a1
                  c.slli       t0, 9
                  srli         zero, zero, 30
                  c.addi4spn   a0, sp, 528
                  and          s5, s2, t2
                  sltiu        a3, s0, -900
                  addi         t4, t3, -1838
                  c.li         s8, 1
                  nop
                  div          s5, t6, s5
                  andi         s1, a1, -7
                  divu         a2, zero, ra
                  slli         tp, s9, 4
                  c.add        t4, a5
                  c.add        tp, t2
                  csrrc        sp, 0x340, zero
                  ori          sp, s4, -1001
                  c.srli       a2, 23
                  div          t1, s7, sp
                  sltu         t5, sp, zero
                  div          zero, s11, s4
                  slt          a2, t2, gp
                  c.lui        s9, 3
                  c.li         s5, 9
                  c.andi       s1, -1
                  csrrc        t0, 0x340, t3
                  sll          sp, s4, s11
                  nop
                  srli         gp, a7, 6
                  c.and        a5, s0
                  srl          a2, s7, a7
                  sub          t6, a2, s4
                  divu         s1, s7, t2
                  lui          tp, 303974
                  xori         a0, s3, -2017
                  mulhsu       a3, tp, s5
                  slti         a5, a3, -1940
                  c.slli       s7, 31
                  div          t4, s0, s5
                  csrrwi       t0, 0x340, 15
                  c.sub        a2, a5
                  div          s3, t1, t0
                  c.srai       a2, 10
                  sll          t1, s1, s1
                  mulh         s10, s10, a3
                  c.or         a0, s1
                  sra          ra, sp, a2
                  mulh         t6, s11, s3
                  and          gp, a6, s6
                  c.nop
                  nop
                  c.li         t6, -1
                  csrrwi       zero, 0x340, 12
                  c.add        a4, s9
                  mulhsu       t0, t6, t0
                  sll          s1, a3, t1
                  divu         a6, s1, s6
                  mul          t3, s7, s10
                  mulh         t3, s5, s2
                  slti         s7, t4, -1407
                  csrrw        t2, 0x340, s3
                  c.srai       a5, 13
                  srli         s11, s10, 9
                  csrrsi       s1, 0x340, 0
                  c.and        s1, a3
                  auipc        t6, 730750
                  srl          tp, tp, s6
                  c.addi       t0, 11
                  srli         s4, s8, 24
                  c.or         a3, s1
                  csrrci       t2, 0x340, 15
                  rem          s6, s1, s9
                  csrrci       s11, 0x340, 0
                  c.addi       t2, 21
                  c.addi       a0, -1
                  remu         t5, t3, zero
                  mulhu        t4, t5, s2
                  c.nop
                  mulh         a0, a5, s2
                  c.and        a4, a3
                  slli         sp, s0, 0
                  srl          t3, tp, t5
                  addi         s8, s6, -281
                  csrrs        t3, 0x340, s11
                  xor          t2, t2, s6
                  or           a7, s1, tp
                  sltu         zero, zero, zero
                  slli         a5, a2, 20
                  csrrw        t5, 0x340, a2
                  mulhsu       t1, s8, a0
                  lui          s5, 874187
                  srai         s7, a2, 6
                  sra          t4, s7, s0
                  srai         t0, ra, 29
                  sub          a5, t0, s0
                  c.nop
                  c.add        s1, a6
                  c.andi       a2, 27
                  c.mv         a2, t1
                  csrrs        s9, 0x340, s6
                  c.lui        s4, 25
                  auipc        a0, 154993
                  sltiu        a3, s6, -1596
                  c.lui        a7, 18
                  mulhu        s1, s10, a1
                  c.addi16sp   sp, 416
                  nop
                  c.lui        a7, 10
                  andi         s11, gp, 1110
                  c.andi       a2, 6
                  mulhu        ra, tp, s9
                  rem          t3, sp, a2
                  mul          sp, t2, s2
                  divu         s5, a6, zero
                  srai         a3, tp, 28
                  c.li         t2, -1
                  c.nop
                  mul          a3, s0, a1
                  c.srli       a5, 7
                  mulhu        s6, s9, zero
                  and          s11, s0, a1
                  sltiu        t1, s9, 966
                  srai         s1, zero, 30
                  csrrsi       s7, 0x340, 21
                  add          t6, s5, s3
                  srl          ra, gp, t4
                  rem          sp, a3, a5
                  c.or         a5, a0
                  c.and        a0, s0
                  sltiu        s11, t5, -730
                  andi         s10, ra, -1266
                  nop
                  rem          a4, s0, a1
                  c.add        s8, t5
                  auipc        s6, 814153
                  div          a4, s8, t5
                  csrrs        tp, 0x340, zero
                  sll          s6, s2, t0
                  andi         s5, s8, 126
                  addi         s6, s11, 1391
                  lui          t4, 47796
                  csrrs        s5, 0x340, s9
                  csrrci       ra, 0x340, 0
                  c.li         s6, 0
                  c.srli       a2, 31
                  slti         a5, a3, -1565
                  csrrw        a4, 0x340, tp
                  c.xor        a2, s0
                  c.srai       a5, 21
                  sltu         t6, gp, t1
                  srl          a2, a2, s4
                  sll          s11, zero, a4
                  c.xor        a2, a1
                  sll          a7, s9, t6
                  slt          s9, s0, a2
                  csrrci       a7, 0x340, 0
                  c.mv         s10, s11
                  andi         gp, t0, 1796
                  c.or         s1, a2
                  csrrci       t3, 0x340, 0
                  slli         s11, s7, 27
                  csrrwi       t1, 0x340, 20
                  csrrc        a5, 0x340, s11
                  csrrsi       s3, 0x340, 0
                  sll          a7, t2, a6
                  slti         s10, s7, 1648
                  c.xor        a0, a1
                  or           a6, a5, a4
                  c.mv         t6, a6
                  xori         a4, s2, -1207
                  or           a3, t3, s0
                  c.srai       a0, 31
                  csrrwi       s11, 0x340, 17
                  ori          s8, s2, -1500
                  csrrc        a4, 0x340, zero
                  xor          s9, t5, gp
                  c.srli       a5, 14
                  c.add        a7, s8
                  c.nop
                  c.slli       a2, 4
                  slt          t5, t3, a7
                  srl          a4, t0, s2
                  rem          s8, t6, s2
                  auipc        t3, 813276
                  c.srai       a5, 15
                  andi         t0, a5, -1180
                  ori          zero, a7, 1535
                  sra          s4, sp, s7
                  c.sub        a5, a3
                  xor          s11, a4, a6
                  c.xor        a0, s0
                  c.nop
                  mul          a4, s8, s5
                  c.add        t6, a2
                  srl          t6, s6, s1
                  rem          a7, tp, a1
                  sll          s9, s0, t1
                  csrrwi       s10, 0x340, 13
                  add          ra, t0, gp
                  remu         t3, t5, s11
                  ori          s4, ra, 829
                  slti         t0, a6, -1577
                  slli         s5, a2, 20
                  div          s8, s4, t6
                  xori         s11, sp, -1980
                  or           a5, t5, tp
                  c.srli       a3, 10
                  slti         s4, t1, -969
                  slt          s7, s7, gp
                  csrrc        s4, 0x340, t0
                  srli         t0, ra, 16
                  auipc        a0, 667577
                  mul          t6, s6, s9
                  xori         ra, s8, 194
                  c.nop
                  srli         s4, t3, 3
                  c.xor        s1, s0
                  c.srli       a0, 12
                  csrrw        s5, 0x340, t2
                  slli         a5, a6, 6
                  sub          t3, t5, s3
                  auipc        tp, 261722
                  c.xor        a0, a4
                  c.li         s1, 28
                  lui          t3, 917027
                  sll          s1, s6, t4
                  csrrw        a6, 0x340, zero
                  sltu         a2, sp, t4
                  srli         zero, s3, 24
                  sll          s7, zero, a4
                  c.xor        a2, a1
                  csrrci       s11, 0x340, 0
                  sub          s9, a3, a4
                  srai         t1, s7, 1
                  c.lui        a5, 17
                  csrrc        t6, 0x340, gp
                  srli         t1, a4, 2
                  ori          t6, t5, 684
                  sub          t3, s11, a0
                  remu         a4, s1, t5
                  nop
                  addi         s5, s5, -945
                  sltu         t2, a2, a0
                  or           tp, t2, t6
                  nop
                  sltiu        t4, t4, -220
                  c.nop
                  c.sub        a2, a4
                  xori         a2, s0, 310
                  sll          t6, s6, zero
                  c.mv         a6, tp
                  andi         s4, t4, -1475
                  csrrw        sp, 0x340, a4
                  csrrw        t0, 0x340, s3
                  csrrs        s11, 0x340, s3
                  xori         a7, t4, -2037
                  csrrci       t2, 0x340, 9
                  xori         a0, tp, 1996
                  sra          s8, gp, s8
                  c.li         a2, 3
                  sll          tp, gp, a4
                  srai         ra, s4, 13
                  and          s5, s6, s6
                  csrrs        t6, 0x340, zero
                  srai         a7, a0, 27
                  div          t1, a1, a1
                  c.or         a3, s0
                  andi         s5, s11, 967
                  c.or         s1, a1
                  sltu         a4, t5, t4
                  auipc        s9, 795556
                  csrrc        s9, 0x340, zero
                  mulhsu       s11, tp, gp
                  addi         t4, ra, -442
                  csrrsi       s3, 0x340, 0
                  csrrw        t2, 0x340, a7
                  c.sub        a2, a5
                  div          t3, a3, t2
                  c.xor        a0, a3
                  srai         t1, s6, 28
                  csrrs        a5, 0x340, s2
                  c.add        a5, s1
                  c.or         a4, a0
                  sra          a2, s7, tp
                  c.addi       ra, -1
                  or           t2, s11, zero
                  srl          s3, zero, t3
                  csrrw        a6, 0x340, tp
                  mulhu        a5, a2, t4
                  sra          a6, s3, t6
                  lui          t5, 503563
                  ori          s7, t5, -621
                  sll          t3, t6, t5
                  c.mv         s5, tp
                  ori          s6, s8, 313
                  c.addi       t2, 6
                  mulhsu       s1, s5, a7
                  c.addi4spn   a4, sp, 928
                  c.nop
                  mul          s6, tp, s10
                  c.andi       a3, -1
                  csrrwi       s3, 0x340, 26
                  slti         s5, a6, 1731
                  c.and        a0, a5
                  xor          t5, t1, s8
                  slt          s7, s10, s3
                  add          a5, a7, t5
                  c.add        a6, s9
                  c.nop
                  c.or         a2, a1
                  csrrci       t4, 0x340, 10
                  c.lui        t1, 7
                  mulh         gp, s4, ra
                  c.addi4spn   a5, sp, 368
                  sltu         s5, s2, a7
                  mulh         s1, t2, s4
                  slti         a6, s4, 834
                  csrrc        s5, 0x340, zero
                  c.addi4spn   a2, sp, 128
                  c.xor        a0, a2
                  mulhu        ra, zero, a7
                  ori          t1, zero, 1661
                  c.srai       a3, 6
                  c.and        a4, a1
                  and          a7, t3, s9
                  c.or         a2, a3
                  c.nop
                  addi         ra, s2, -1220
                  srli         zero, a7, 26
                  ori          sp, t1, -1308
                  srl          ra, s11, s4
                  mulhsu       s11, t2, s0
                  rem          a5, t6, t3
                  srai         s5, s8, 28
                  and          s10, s8, s9
                  sra          a6, s1, zero
                  csrrci       gp, 0x340, 9
                  c.xor        a4, a5
                  sub          s3, ra, zero
                  rem          ra, s0, s9
                  sll          s7, sp, a4
                  csrrsi       s9, 0x340, 28
                  xori         a7, a2, -1548
                  sra          s7, s5, t3
                  c.addi4spn   s1, sp, 576
                  xori         s9, a7, 434
                  csrrsi       zero, 0x340, 4
                  c.li         a5, 28
                  c.mv         s1, ra
                  c.li         t5, 8
                  c.andi       a3, 19
                  csrrci       sp, 0x340, 0
                  c.addi       s10, -1
                  csrrc        a0, 0x340, s3
                  c.slli       t4, 21
                  divu         a4, s1, s1
                  c.sub        s1, s1
                  slli         s11, ra, 8
                  ori          t2, s5, -909
                  c.srli       a3, 31
                  slt          t6, t1, s1
                  mulh         s6, a3, a5
                  add          s6, s10, s1
                  lui          t0, 401523
                  c.and        a2, a1
                  xor          tp, s8, s8
                  slli         a5, s6, 14
                  csrrw        t4, 0x340, sp
                  c.add        s8, t4
                  c.li         s10, 13
                  auipc        t2, 939126
                  c.li         s7, 15
                  csrrsi       s4, 0x340, 29
                  c.li         t0, 22
                  ori          s1, s5, -297
                  andi         t5, t3, 1307
                  c.mv         a4, a3
                  xor          ra, s5, s0
                  c.addi4spn   a5, sp, 688
                  remu         t0, s6, tp
                  mulh         s11, t6, s5
                  c.addi16sp   sp, 16
                  slt          t0, a5, s0
                  c.li         a0, 14
                  addi         s7, t3, 952
                  c.addi16sp   sp, -16
                  lui          a6, 367076
                  c.lui        tp, 14
                  c.or         a3, a3
                  csrrci       t0, 0x340, 0
                  c.nop
                  sll          s4, s2, s9
                  c.sub        s1, a4
                  c.andi       a2, -1
                  sub          s4, t0, a6
                  andi         s11, t1, 1613
                  sltu         s3, s8, zero
                  lui          t4, 334830
                  andi         t5, ra, -1015
                  csrrwi       s8, 0x340, 22
                  csrrwi       t6, 0x340, 18
                  add          s11, t6, s6
                  divu         sp, a0, s0
                  andi         t2, t1, -1557
                  c.srai       a2, 17
                  addi         a0, t0, -1410
                  addi         s11, s4, 1159
                  c.andi       s1, 0
                  remu         a4, t5, s7
                  c.sub        a0, a3
                  sll          a6, a5, a3
                  c.mv         s3, t1
                  xor          s7, t2, tp
                  c.srai       s1, 3
                  csrrwi       a2, 0x340, 25
                  sra          s8, s10, t3
                  auipc        t0, 295387
                  divu         s3, s5, tp
                  csrrwi       s11, 0x340, 9
                  sra          s4, t2, s9
                  sll          t0, s9, a5
                  sll          zero, s7, s7
                  csrrs        t4, 0x340, s2
                  csrrci       t4, 0x340, 21
                  srl          s8, tp, s8
                  slt          t5, s7, t5
                  c.srli       a4, 10
                  add          s9, gp, ra
                  sll          t6, t1, a2
                  c.addi       s3, 9
                  c.xor        a0, s0
                  c.srli       a3, 28
                  add          s3, t3, a4
                  srl          s7, gp, t0
                  sltu         s3, a0, t1
                  csrrsi       s4, 0x340, 12
                  rem          t2, tp, s4
                  sra          a3, a5, zero
                  sra          s7, a6, s10
                  c.xor        a4, a4
                  c.nop
                  c.addi4spn   a2, sp, 160
                  div          sp, ra, a7
                  nop
                  c.and        a4, a3
                  sub          t4, s8, a7
                  c.slli       a4, 3
                  sub          s3, a0, s1
                  c.slli       s10, 25
                  rem          s1, a3, s10
                  c.or         a2, a1
                  andi         s4, s7, 1766
                  slt          s6, s0, a7
                  csrrci       sp, 0x340, 0
                  c.xor        s1, a2
                  divu         s4, a6, t6
                  srli         s9, gp, 9
                  or           s4, a2, s8
                  xori         s7, a5, -199
                  c.and        a5, a4
                  sltu         s3, t3, s1
                  xor          ra, s8, s2
                  c.sub        a3, s1
                  xor          a6, s2, s7
                  or           a7, s2, a5
                  andi         s3, zero, 2040
                  sltiu        s4, ra, 1859
                  csrrs        t4, 0x340, a4
                  ori          s9, s2, 621
                  csrrs        a4, 0x340, t1
                  c.nop
                  c.lui        t5, 8
                  nop
                  c.sub        a0, a0
                  srai         s10, zero, 24
                  remu         s3, tp, a2
                  addi         a4, t6, -194
                  c.add        a7, s10
                  mul          s8, s7, a5
                  ori          s3, t6, -1507
                  sltiu        a6, t0, -551
                  mulh         a4, a3, a2
                  addi         tp, tp, 71
                  div          s4, t0, s7
                  csrrs        a2, 0x340, t0
                  c.addi16sp   sp, 480
                  sltiu        a3, s6, -401
                  c.srli       a0, 26
                  c.add        t2, t6
                  srl          t4, a7, gp
                  slli         a3, sp, 29
                  sltu         a5, s0, s10
                  c.addi4spn   a2, sp, 160
                  add          t0, s2, a2
                  c.lui        a5, 7
                  mulhu        s8, ra, a6
                  c.srli       s1, 11
                  srai         a0, s7, 28
                  mul          t5, s3, s4
                  srl          a6, s10, t6
                  csrrci       s6, 0x340, 0
                  xori         t0, s8, -1812
                  srli         zero, a5, 22
                  slli         zero, a2, 17
                  csrrc        a6, 0x340, a7
                  c.sub        a0, a2
                  c.or         s1, a4
                  nop
                  c.addi       a7, 6
                  c.sub        a3, a1
                  auipc        a0, 1038728
                  c.sub        a5, a1
                  c.addi       t4, 8
                  srai         s11, tp, 8
                  div          s6, t2, ra
                  ori          s7, s5, 897
                  divu         t2, ra, t5
                  ori          a3, a0, -573
                  mulhu        t3, s1, s4
                  c.nop
                  mul          t5, s1, ra
                  csrrsi       s3, 0x340, 0
                  sub          t4, s10, t6
                  ori          t4, a1, -1983
                  c.xor        a3, a1
                  c.mv         t1, a1
                  slli         a6, t0, 8
                  divu         t0, sp, s2
                  sra          ra, s1, t3
                  csrrwi       t6, 0x340, 10
                  srl          a5, t2, t2
                  c.nop
                  andi         a2, gp, -1271
                  c.xor        a2, s1
                  or           a6, s2, t0
                  csrrsi       tp, 0x340, 23
                  csrrs        t4, 0x340, s1
                  slti         tp, s0, -887
                  csrrci       s5, 0x340, 0
                  addi         t1, a6, 1074
                  add          s3, s2, s0
                  rem          t1, s2, t3
                  add          a6, t5, s2
                  c.or         a2, s0
                  c.xor        a0, s1
                  c.addi4spn   a5, sp, 240
                  ori          a6, t2, 1371
                  rem          a7, t4, s8
                  c.addi4spn   a0, sp, 816
                  srl          tp, s0, zero
                  csrrsi       a7, 0x340, 0
                  sub          sp, a0, a0
                  c.li         s5, -1
                  sll          t2, s3, s6
                  c.mv         t4, a7
                  rem          t4, s7, s8
                  sltiu        t5, a2, 975
                  andi         s3, s11, 1107
                  mul          t3, a7, t3
                  csrrsi       t0, 0x340, 0
                  xor          s10, s5, s11
                  ori          a0, gp, -15
                  c.or         a3, a3
                  mulh         tp, a0, s2
                  c.addi16sp   sp, 416
                  c.mv         ra, a1
                  csrrw        a7, 0x340, zero
                  csrrci       s6, 0x340, 6
                  div          zero, t3, t0
                  addi         a4, t1, -549
                  c.addi16sp   sp, -16
                  lui          zero, 388512
                  srai         t6, a0, 21
                  sll          zero, s6, s9
                  c.srai       a5, 21
                  rem          zero, gp, sp
                  csrrs        s11, 0x340, s10
                  c.or         a3, s0
                  lui          t0, 1045923
                  slli         s6, s3, 31
                  csrrwi       s9, 0x340, 11
                  c.and        a4, a1
                  c.addi       s10, 28
                  ori          a7, s0, 776
                  div          s8, s5, t6
                  c.addi4spn   a4, sp, 752
                  addi         a5, t0, -292
                  sltu         t2, s11, a0
                  c.nop
                  ori          s3, t6, 1495
                  c.xor        a3, a4
                  or           s11, s3, s4
                  mul          a3, t0, a1
                  xor          a5, a3, a0
                  xori         a0, t0, -722
                  addi         s10, a4, -636
                  slli         sp, s8, 22
                  slli         sp, t0, 2
                  lui          s5, 112756
                  c.addi4spn   a2, sp, 416
                  or           t2, a7, s9
                  c.mv         ra, s5
                  xori         s11, tp, -1203
                  srli         s8, s8, 25
                  c.lui        ra, 8
                  xor          t4, t3, t4
                  or           a4, t3, s2
                  sll          t5, s1, t4
                  csrrwi       t4, 0x340, 21
                  lui          s1, 274055
                  c.mv         s6, gp
                  sub          a0, t6, a4
                  remu         t6, t0, s5
                  csrrwi       s4, 0x340, 24
                  c.li         a7, -1
                  c.and        a5, a0
                  csrrs        zero, 0x340, zero
                  srai         t6, a3, 13
                  srai         t6, a6, 30
                  c.addi16sp   sp, 256
                  c.andi       a0, 23
                  xor          tp, a6, a2
                  sltu         s3, a4, a5
                  csrrs        s4, 0x340, ra
                  and          a3, t6, zero
                  mul          sp, zero, s1
                  or           a0, a5, t1
                  c.mv         s5, tp
                  and          s5, s3, a0
                  c.and        s1, a1
                  csrrsi       s10, 0x340, 0
                  c.or         a4, a2
                  csrrsi       a5, 0x340, 0
                  c.srli       s1, 19
                  c.add        t1, s0
                  or           t5, s1, s11
                  csrrci       zero, 0x340, 27
                  lui          t2, 184548
                  csrrw        s3, 0x340, s4
                  csrrc        s9, 0x340, zero
                  addi         s7, a4, -711
                  xor          ra, t6, s2
                  auipc        zero, 333283
                  c.add        s4, tp
                  c.nop
                  remu         s1, ra, s9
                  xor          gp, ra, a4
                  c.and        a0, a3
                  mulhu        s5, a3, s4
                  srli         t3, s7, 5
                  c.mv         s11, s7
                  mulh         a2, s4, a0
                  c.srai       a0, 30
                  c.nop
                  srai         s3, s5, 5
                  c.li         a7, 2
                  add          s11, a3, s0
                  mulhu        s1, s5, t4
                  div          s7, t0, s11
                  csrrw        a7, 0x340, s1
                  c.srli       s1, 3
                  srai         t4, sp, 27
                  rem          a7, s1, a2
                  mulhu        t1, ra, a3
                  c.srai       a2, 4
                  sll          sp, a3, ra
                  csrrsi       t6, 0x340, 3
                  srli         a0, s8, 0
                  xor          a3, s0, ra
                  csrrc        ra, 0x340, zero
                  xor          t0, a3, ra
                  c.slli       a6, 7
                  mulh         tp, s3, a0
                  csrrs        a5, 0x340, zero
                  and          a3, s11, s5
                  divu         t1, ra, t1
                  xor          t3, s11, a0
                  c.andi       a5, 19
                  c.srai       a4, 18
                  and          tp, t5, t3
                  csrrsi       t2, 0x340, 28
                  slt          a2, a4, a3
                  csrrs        ra, 0x340, zero
                  srl          a2, s4, sp
                  c.mv         s5, s5
                  csrrc        ra, 0x340, s3
                  sltu         s6, zero, s8
                  sub          s10, a1, t6
                  sltiu        a5, s11, -1351
                  c.srai       s1, 1
                  divu         s4, zero, a2
                  mulhsu       s8, t1, sp
                  c.sub        a0, a2
                  mulhu        s1, s7, s0
                  rem          t5, t6, s5
                  c.li         s8, 11
                  slti         s9, tp, -40
                  srl          s3, t3, s10
                  c.mv         s9, a1
                  c.or         a4, a2
                  c.or         a0, a4
                  c.xor        a3, a1
                  xori         a7, s9, -850
                  addi         a0, t6, 1898
                  addi         zero, s3, -1839
                  nop
                  rem          a6, s4, s1
                  or           s9, a7, s4
                  slt          s11, s6, a1
                  xori         s6, s0, -1607
                  c.li         s3, 18
                  c.addi16sp   sp, -16
                  or           t3, t5, a3
                  c.li         s1, -1
                  c.addi       ra, 20
                  sltiu        t1, s6, -67
                  xor          tp, s3, a3
                  rem          s11, s4, a0
                  c.nop
                  c.addi4spn   a3, sp, 896
                  csrrs        s11, 0x340, gp
                  slli         s5, ra, 10
                  c.srai       a0, 14
                  lui          t3, 458337
                  c.srai       s1, 15
                  c.or         s1, a5
                  xori         a4, a6, 1506
                  c.and        a2, a0
                  mul          t1, s5, a6
                  rem          a3, zero, s4
                  sub          t4, a2, a0
                  xori         a5, t2, 1594
                  csrrs        a2, 0x340, s8
                  sll          ra, s4, a7
                  srl          gp, a6, s8
                  auipc        s10, 455920
                  slt          s1, s2, t5
                  mulhsu       a0, a4, t5
                  csrrc        t1, 0x340, zero
                  andi         t0, a6, 6
                  c.mv         t5, s5
                  c.addi4spn   a2, sp, 896
                  mulhsu       t4, a3, a3
                  srl          t5, a3, a1
                  c.addi16sp   sp, -16
                  c.srli       s1, 24
                  lui          s3, 1042851
                  mulhsu       a4, gp, a0
                  or           ra, t4, a3
                  csrrw        t4, 0x340, a5
                  csrrci       zero, 0x340, 0
                  c.addi16sp   sp, -16
                  mulhsu       zero, a4, s0
                  sll          a0, s9, a4
                  ori          sp, sp, 908
                  c.andi       a3, -1
                  lui          a0, 1011844
                  mul          a4, s2, a2
                  csrrs        zero, 0x340, zero
                  addi         t4, t5, 605
                  xori         ra, s5, 1685
                  rem          t6, a7, a3
                  sltu         t2, a0, s4
                  mulhsu       s1, a5, s7
                  c.nop
                  c.addi16sp   sp, -16
                  c.nop
                  c.addi16sp   sp, -16
                  csrrsi       a0, 0x340, 0
                  sra          t6, t3, a2
                  csrrsi       s9, 0x340, 0
                  divu         zero, t5, t3
                  slti         a5, t6, 1117
                  srai         a5, t6, 22
                  c.nop
                  mulh         a5, t2, s0
                  nop
                  csrrci       sp, 0x340, 15
                  sll          t1, s0, t4
                  sll          s5, s2, a3
                  csrrwi       a0, 0x340, 13
                  or           t6, t5, s11
                  csrrw        s6, 0x340, t6
                  slti         s5, s4, 597
                  mul          s6, t0, s7
                  c.andi       a0, 24
                  c.sub        a2, s1
                  c.sub        a0, a0
                  slli         a3, t1, 13
                  auipc        t3, 433124
                  c.sub        a4, s1
                  nop
                  divu         a4, tp, a4
                  slt          a3, t6, s3
                  sra          s9, t3, a1
                  nop
                  mulhu        tp, s10, a0
                  csrrs        s4, 0x340, tp
                  c.srli       a0, 31
                  c.or         a4, s1
                  mulh         s8, t2, a5
                  c.srli       a0, 8
                  c.sub        a0, a0
                  srli         t4, s1, 4
                  sltu         s4, a3, s1
                  sltu         s6, t2, t1
                  or           zero, s4, s6
                  slt          t6, t0, a6
                  auipc        s11, 422929
                  ori          t1, gp, 883
                  c.srai       a2, 30
                  mulhu        gp, s11, t1
                  rem          s10, s7, s3
                  sra          t2, t6, a1
                  mulhu        gp, s0, a4
                  sll          s6, t0, t2
                  csrrwi       t3, 0x340, 18
                  c.li         t6, 27
                  csrrsi       a4, 0x340, 0
                  slti         t0, a0, 1858
                  sltiu        t1, ra, -571
                  andi         s10, a7, 350
                  c.and        s1, a4
                  mulh         t3, a4, a4
                  divu         s6, a0, t3
                  c.li         a6, 13
                  nop
                  c.addi16sp   sp, -16
                  c.xor        a4, a3
                  c.or         s1, s1
                  slli         tp, t6, 29
                  mulhu        a2, sp, a0
                  csrrs        t4, 0x340, zero
                  div          tp, a4, a2
                  div          s3, a5, s2
                  ori          s8, s3, 1594
                  sltiu        t3, a2, 1280
                  c.slli       t6, 30
                  div          gp, s4, t1
                  sltiu        s4, a5, -685
                  c.srai       a0, 26
                  csrrw        s11, 0x340, a5
                  sub          s5, t5, t5
                  rem          s9, a2, ra
                  csrrw        t4, 0x340, s9
                  c.mv         t0, s3
                  add          s7, s11, a7
                  nop
                  div          t3, s7, s3
                  c.srli       a0, 17
                  c.lui        gp, 12
                  c.sub        a4, s0
                  auipc        a7, 114983
                  div          a0, zero, t1
                  c.andi       a5, 28
                  rem          a6, s8, a1
                  c.lui        t6, 12
                  remu         a3, sp, a3
                  nop
                  nop
                  c.sub        a3, a1
                  c.mv         t6, s0
                  c.add        t1, s4
                  sltu         s4, a4, a0
                  mul          a0, t0, t0
                  addi         t3, a2, -740
                  c.li         s3, -1
                  mulh         sp, t4, a5
                  sltiu        a2, a7, 1200
                  sra          s5, ra, t4
                  andi         zero, s5, 394
                  c.srli       a3, 19
                  ori          t4, s11, 865
                  xori         s8, ra, -324
                  c.nop
                  slt          t0, t2, s3
                  c.sub        a3, a5
                  slt          t3, s7, s4
                  srli         ra, t6, 12
                  c.lui        a6, 24
                  mulhu        t4, s10, s5
                  c.addi16sp   sp, 128
                  mul          t0, sp, a4
                  divu         a3, a1, a5
                  csrrci       t0, 0x340, 30
                  sltiu        t4, s11, 1782
                  csrrc        s5, 0x340, s11
                  csrrci       t2, 0x340, 13
                  c.add        a0, a6
                  c.xor        a0, a2
                  c.addi16sp   sp, -16
                  c.add        a4, s11
                  c.addi       a6, 24
                  csrrsi       zero, 0x340, 0
                  sltu         a4, t1, a6
                  c.addi       gp, -1
                  c.li         a5, -1
                  mul          s7, s3, a3
                  sltu         s3, t5, t5
                  rem          s7, s1, gp
                  c.slli       tp, 27
                  slli         s4, s7, 15
                  c.addi16sp   sp, 208
                  mul          s5, ra, sp
                  sub          t2, t1, ra
                  mulhsu       a7, zero, a2
                  and          s3, t2, a0
                  srl          s7, s9, a1
                  or           s11, s8, sp
                  c.srai       a4, 6
                  nop
                  slt          t2, s8, s6
                  addi         s8, zero, 1853
                  c.slli       s3, 21
                  or           s8, t6, a7
                  and          zero, t3, t6
                  xori         t0, ra, -1352
                  srai         a5, a3, 24
                  csrrsi       a2, 0x340, 0
                  lui          s3, 562056
                  slli         t0, t0, 28
                  div          zero, s2, t1
                  c.li         s4, -1
                  c.addi       s5, 16
                  mulhsu       s4, t2, tp
                  slli         gp, t6, 25
                  auipc        t5, 524509
                  mulh         a7, s5, a2
                  csrrs        s5, 0x340, t5
                  csrrwi       gp, 0x340, 12
                  csrrsi       t6, 0x340, 0
                  srl          zero, t5, s5
                  or           gp, s5, t3
                  csrrsi       s5, 0x340, 23
                  c.addi4spn   a4, sp, 736
                  or           s4, gp, s5
                  csrrsi       s5, 0x340, 0
                  addi         t1, tp, -498
                  c.and        a4, a5
                  sra          t6, a4, a7
                  rem          s7, zero, s10
                  c.lui        a7, 3
                  sltu         t1, s6, zero
                  c.or         a4, a3
                  srai         s6, t0, 19
                  c.xor        a4, a5
                  c.srli       s1, 24
                  c.nop
                  c.addi4spn   s1, sp, 224
                  xor          t5, s11, s10
                  c.addi16sp   sp, -16
                  remu         t3, tp, s10
                  c.and        a5, a1
                  sltiu        s11, s2, -2011
                  csrrw        t6, 0x340, t4
                  mulhsu       a4, a7, a4
                  div          s5, s1, a6
                  c.addi       s3, -1
                  srli         t6, s8, 23
                  and          s3, a6, t3
                  c.srli       s1, 16
                  csrrc        s8, 0x340, zero
                  csrrwi       t0, 0x340, 12
                  c.slli       t1, 27
                  div          t3, s4, a1
                  c.or         a4, a5
                  sub          ra, a2, a2
                  sll          s7, sp, gp
                  c.add        a7, s5
                  c.addi16sp   sp, 448
                  ori          t6, a2, -1489
                  slli         gp, s11, 5
                  c.or         s1, a5
                  c.xor        a3, s1
                  c.nop
                  auipc        a4, 711196
                  csrrsi       s11, 0x340, 0
                  mulh         a5, s4, a7
                  remu         s9, t2, t4
                  csrrw        a2, 0x340, t2
                  xori         s8, sp, 1726
                  sltiu        t6, s9, 1611
                  c.srli       a5, 21
                  c.or         s1, a4
                  lui          a7, 919784
                  c.addi       t0, -1
                  c.slli       a7, 9
                  sra          ra, s7, t1
                  csrrci       t1, 0x340, 0
                  c.addi       s5, 4
                  lui          s5, 137007
                  sltu         s8, s6, s5
                  add          s8, t1, a4
                  sltiu        s11, s4, 982
                  ori          t0, a5, -1850
                  c.and        a4, a5
                  c.xor        a4, s1
                  slli         t3, s9, 11
                  slli         a6, s4, 1
                  c.add        t0, a4
                  c.andi       a2, 2
                  mulhsu       a0, t0, a6
                  csrrc        s8, 0x340, s2
                  csrrs        a6, 0x340, s10
                  c.sub        a4, a2
                  c.addi16sp   sp, 256
                  add          s10, t4, a6
                  csrrwi       s10, 0x340, 2
                  c.srli       a5, 7
                  addi         t4, t6, -1772
                  andi         zero, s3, -1631
                  xor          tp, s0, t5
                  div          t6, t6, t5
                  srli         t4, a2, 27
                  c.lui        t2, 14
                  c.addi4spn   a2, sp, 80
                  slti         s4, s3, -369
                  c.sub        a5, a5
                  csrrci       s7, 0x340, 0
                  c.li         ra, 26
                  c.srli       a0, 11
                  slli         s6, t4, 27
                  c.lui        tp, 20
                  c.srai       a2, 30
                  mul          sp, t6, a1
                  add          zero, a0, s11
                  xori         s8, s11, -657
                  addi         a6, tp, -1872
                  sltu         s6, t4, ra
                  c.mv         s7, s0
                  srli         ra, zero, 29
                  mul          s3, tp, s2
                  csrrci       s10, 0x340, 5
                  c.srai       a3, 22
                  srai         a5, a2, 20
                  srli         s9, a1, 0
                  c.slli       s5, 23
                  divu         ra, gp, tp
                  addi         t4, s3, 1687
                  xor          t5, a0, a5
                  c.srai       s1, 18
                  nop
                  sltiu        gp, t3, -1280
                  mul          s4, s1, s8
                  c.srli       a0, 7
                  xori         a5, gp, -1138
                  or           s6, gp, s5
                  csrrwi       a5, 0x340, 28
                  and          t3, tp, s0
                  srli         zero, t3, 20
                  remu         t5, s4, tp
                  c.sub        a3, a3
                  c.slli       t1, 30
                  addi         s9, s2, -160
                  mul          s7, s8, s6
                  andi         s6, s8, 1067
                  remu         t0, s9, s2
                  add          ra, t5, ra
                  add          s11, ra, zero
                  srai         a2, t0, 21
                  lui          zero, 896534
                  xori         s8, t4, -408
                  c.addi16sp   sp, 160
                  auipc        a4, 765327
                  sub          s6, t1, s9
                  remu         s3, tp, t2
                  lui          gp, 680157
                  addi         sp, sp, 1704
                  sub          t1, s9, t5
                  csrrsi       tp, 0x340, 27
                  xor          a6, a4, s7
                  mulhsu       t6, s2, a2
                  remu         t6, a4, sp
                  sub          t4, a2, s4
                  slli         t4, s5, 21
                  csrrci       s10, 0x340, 0
                  mulh         a2, sp, s1
                  c.or         a4, a3
                  c.and        a3, a0
                  sub          t1, s6, s3
                  c.add        ra, s11
                  csrrsi       t3, 0x340, 7
                  c.mv         sp, t0
                  c.mv         gp, t4
                  nop
                  or           sp, s1, tp
                  mulhsu       t2, a3, s8
                  nop
                  mulhu        s7, s3, a6
                  c.mv         s7, s2
                  mulhu        s5, s8, sp
                  c.srli       a5, 27
                  or           a6, s7, zero
                  ori          s10, gp, 938
                  remu         s4, a4, t6
                  c.add        a5, t0
                  or           s9, t5, s6
                  csrrc        s5, 0x340, zero
                  c.and        a4, a3
                  and          t6, t0, s5
                  slti         zero, t5, 1737
                  sll          s7, s2, ra
                  c.and        a3, a1
                  addi         s10, s10, -1384
                  mul          s9, t0, a1
                  csrrsi       t0, 0x340, 4
                  sltu         t5, t3, s10
                  csrrw        zero, 0x340, t3
                  nop
                  sltu         s10, a4, t6
                  sub          s6, zero, a4
                  add          a0, a4, s5
                  slli         t0, a6, 25
                  c.lui        s1, 14
                  ori          s1, t5, -1946
                  csrrs        s3, 0x340, a6
                  nop
                  lui          a2, 333103
                  c.li         a3, -1
                  c.addi4spn   a4, sp, 656
                  andi         s7, a6, -1264
                  c.slli       t2, 12
                  ori          s7, t2, 381
                  sub          gp, t1, t5
                  rem          s9, t6, s10
                  c.srai       a3, 2
                  c.mv         a6, t0
                  slti         a3, s7, 497
                  add          a7, t2, s11
                  sll          s9, s2, a1
                  or           t5, t1, a5
                  sltiu        t6, s7, 54
                  sub          ra, gp, s8
                  sub          a2, t1, sp
                  add          a0, t0, t1
                  c.xor        a3, a0
                  c.srai       a5, 2
                  c.addi4spn   s1, sp, 736
                  nop
                  add          a7, s5, s9
                  mul          s8, a1, a0
                  c.or         s1, s1
                  mulhsu       t6, s11, t1
                  csrrs        s1, 0x340, s11
                  c.srli       a0, 13
                  c.mv         a4, t4
                  srai         a0, a3, 9
                  c.srai       a3, 31
                  remu         s7, a6, a1
                  c.srai       a0, 27
                  sra          a6, tp, s0
                  csrrci       a2, 0x340, 15
                  and          s7, t1, s9
                  c.slli       s7, 17
                  c.srai       s1, 15
                  remu         zero, t6, zero
                  c.xor        a2, s1
                  sub          t2, zero, s1
                  c.nop
                  mulhsu       tp, s3, a4
                  c.mv         gp, s2
                  andi         t0, a1, 1880
                  addi         t4, s10, -1233
                  mul          s3, t2, t3
                  csrrsi       t1, 0x340, 0
                  c.sub        a4, a2
                  csrrsi       s8, 0x340, 0
                  andi         s1, s0, 0
                  c.or         a4, a4
                  c.andi       a3, -1
                  c.lui        t0, 19
                  c.addi       t4, 13
                  c.slli       s6, 19
                  c.and        a3, a4
                  c.and        a0, a1
                  slli         t0, gp, 7
                  divu         t3, s9, s7
                  csrrwi       a0, 0x340, 4
                  mulhsu       t5, a7, s10
                  c.and        a5, a4
                  addi         t6, a4, 601
                  c.and        a4, a5
                  c.add        a2, t1
                  rem          a0, t3, zero
                  rem          a6, s3, s1
                  sll          t1, t2, t6
                  c.and        a3, a3
                  xori         a5, s6, -404
                  c.addi16sp   sp, -16
                  mul          sp, t2, t2
                  slti         a0, s9, 1252
                  c.lui        t6, 21
                  divu         s1, s6, s1
                  divu         t1, a2, s2
                  sltu         a6, s0, s4
                  csrrc        a6, 0x340, zero
                  remu         t0, s2, t6
                  srai         t1, s6, 26
                  c.li         t3, -1
                  c.or         a4, a4
                  mulh         a0, t6, t4
                  slli         t1, zero, 18
                  c.andi       a0, 8
                  andi         a4, s3, -1722
                  sub          s6, a5, s2
                  slti         s10, a0, 604
                  or           t6, ra, s7
                  srli         s10, gp, 8
                  c.add        ra, t1
                  mulh         t1, zero, t2
                  c.sub        a0, a0
                  c.addi       s10, 28
                  slli         s5, s3, 27
                  sra          a2, s11, sp
                  sub          gp, a2, t5
                  and          t1, t5, gp
                  divu         gp, zero, ra
                  sll          t4, a6, a3
                  csrrw        s5, 0x340, a4
                  srai         ra, a6, 14
                  divu         s1, t2, t5
                  xori         t3, s11, -1784
                  c.add        sp, t6
                  c.addi4spn   a0, sp, 240
                  c.addi       t4, -1
                  c.srai       s1, 6
                  c.sub        a5, a4
                  csrrwi       a0, 0x340, 28
                  ori          s4, a0, 114
                  div          s3, t6, s11
                  c.srli       s1, 30
                  slli         s4, t3, 14
                  c.mv         s7, s8
                  slli         a2, zero, 0
                  csrrci       a5, 0x340, 15
                  c.nop
                  addi         t5, t6, -676
                  rem          s4, a6, a1
                  c.lui        s8, 10
                  ori          a6, a3, 1969
                  nop
                  xor          a7, s1, s7
                  csrrs        s10, 0x340, ra
                  c.srli       s1, 13
                  nop
                  sub          s3, s7, a5
                  slti         tp, t2, -1215
                  ori          ra, t3, 245
                  csrrc        sp, 0x340, a5
                  c.add        a5, a7
                  c.and        s1, a3
                  c.addi4spn   a5, sp, 880
                  slti         s1, s2, -1283
                  slli         t2, a7, 28
                  csrrwi       t4, 0x340, 7
                  remu         t0, zero, t6
                  mul          t2, ra, t6
                  sub          t3, a7, a2
                  c.lui        t0, 10
                  c.and        a0, a4
                  slt          s9, s4, zero
                  rem          a0, a4, tp
                  c.andi       a4, 26
                  c.add        s6, gp
                  slti         a3, t4, -307
                  or           t6, s8, zero
                  c.addi16sp   sp, -16
                  c.sub        s1, a3
                  add          t0, a5, s9
                  c.or         s1, a0
                  srai         t0, t1, 17
                  andi         a6, s9, -1429
                  sub          a4, s2, a5
                  slt          gp, s8, gp
                  c.andi       a4, 23
                  xor          zero, a0, s9
                  c.addi4spn   a2, sp, 368
                  sll          a7, s6, s2
                  mulhu        s8, t6, a1
                  c.srai       a4, 1
                  c.sub        a3, a4
                  sll          s4, a4, t1
                  xori         s1, a7, 1153
                  mulhsu       t0, tp, a2
                  or           s3, gp, s6
                  csrrwi       a3, 0x340, 17
                  sltu         tp, a1, s4
                  c.or         a4, a3
                  c.or         a3, a4
                  slli         a5, a7, 7
                  c.slli       t6, 15
                  c.srli       a0, 10
                  mulhu        s5, s7, s3
                  csrrsi       gp, 0x340, 0
                  srl          t1, s4, t1
                  c.li         tp, -1
                  c.addi16sp   sp, 480
                  c.srai       a3, 15
                  c.lui        a6, 16
                  divu         tp, s3, s6
                  csrrw        s7, 0x340, s3
                  csrrs        ra, 0x340, t2
                  c.add        a7, gp
                  sll          s7, s7, t4
                  csrrwi       t4, 0x340, 1
                  and          t6, s5, s2
                  srli         tp, s9, 12
                  xori         t5, a0, 951
                  or           a2, a7, a6
                  lui          a2, 108862
                  srai         a0, sp, 11
                  or           t0, tp, a2
                  ori          t1, t1, 703
                  add          t6, a3, s8
                  rem          a7, s5, sp
                  srl          t0, s11, sp
                  divu         tp, s4, a7
                  c.addi       s4, 7
                  c.nop
                  csrrci       a3, 0x340, 19
                  csrrsi       a4, 0x340, 1
                  c.or         a3, a2
                  xori         tp, s6, -1789
                  c.xor        a0, s1
                  xor          s8, ra, s5
                  c.xor        s1, s0
                  addi         t6, s6, -946
                  lui          a6, 443611
                  mulhu        s1, a2, ra
                  c.lui        s4, 26
                  add          t1, tp, a2
                  add          s4, t0, a3
                  mulhu        t3, a6, a2
                  ori          gp, s3, 1338
                  nop
                  remu         tp, t0, s8
                  remu         s7, ra, t1
                  c.li         t5, -1
                  c.mv         t2, t1
                  c.or         a5, a5
                  mulh         a0, s3, a4
                  rem          s4, a2, s1
                  c.addi       t6, -1
                  slli         a4, a5, 16
                  nop
                  c.or         a0, a2
                  sra          t6, t5, s8
                  csrrci       t5, 0x340, 0
                  mulhu        s8, a0, s2
                  csrrs        t0, 0x340, zero
                  xor          s1, s6, a3
                  mulhu        a0, a6, a1
                  c.sub        a3, s1
                  c.li         ra, 12
                  rem          a5, t5, a2
                  or           s5, t3, t2
                  lui          s4, 28743
                  div          a0, s4, s6
                  remu         a4, t0, s3
                  div          t1, s9, s10
                  addi         t2, tp, 117
                  csrrc        a3, 0x340, s5
                  c.lui        a3, 31
                  slt          a0, s4, s7
                  nop
                  mulhu        a5, a3, s11
                  add          ra, s2, s3
                  csrrsi       a6, 0x340, 4
                  slt          t3, t5, a2
                  auipc        a0, 32800
                  ori          t2, zero, 1480
                  c.li         s4, -1
                  addi         a2, s2, 722
                  csrrw        s7, 0x340, a1
                  lui          zero, 485022
                  c.and        a4, s1
                  sltiu        s7, ra, -662
                  slt          s3, ra, s4
                  srl          t0, s3, s3
                  xori         a3, s9, -1771
                  xor          t0, t1, t5
                  auipc        t5, 944442
                  c.add        a6, t4
                  c.srai       s1, 31
                  c.addi       s8, 12
                  slli         s7, a4, 5
                  and          a3, t6, s10
                  c.and        a3, s0
                  csrrw        a3, 0x340, t6
                  slti         t5, t6, -970
                  slti         s8, a1, 1928
                  c.addi16sp   sp, 144
                  c.addi16sp   sp, -16
                  c.lui        s7, 6
                  srai         s9, t6, 1
                  slli         t2, s7, 5
                  rem          t6, s7, sp
                  c.addi4spn   a0, sp, 80
                  sll          t4, ra, s10
                  xori         sp, gp, -670
                  c.srli       a3, 21
                  mulh         s6, a7, a6
                  c.addi4spn   a4, sp, 352
                  c.sub        a0, a1
                  ori          a7, t3, 1776
                  add          t6, zero, a0
                  csrrs        s3, 0x340, zero
                  sra          s11, s10, t6
                  c.li         s9, 19
                  c.andi       a4, -1
                  c.slli       t5, 23
                  and          s8, s11, zero
                  c.sub        a5, a3
                  c.srli       a3, 15
                  slti         s3, a2, 1248
                  addi         s10, t2, 1041
                  xor          s3, s4, s2
                  srl          t1, t0, s3
                  mulhsu       s10, t5, s11
                  sltu         s6, s4, t5
                  mul          zero, gp, ra
                  mulhu        sp, s2, t0
                  c.addi16sp   sp, 352
                  and          a4, s6, s7
                  sll          t4, s5, s3
                  auipc        s4, 786046
                  divu         zero, s6, s6
                  sub          t2, a7, a0
                  c.lui        s4, 24
                  c.srai       a0, 16
                  div          t2, s5, s5
                  sub          s4, s11, a5
                  sltiu        s11, sp, -1681
                  slt          s4, a0, t6
                  csrrs        ra, 0x340, zero
                  sltu         s1, s0, s7
                  or           s8, a0, s10
                  csrrs        t2, 0x340, zero
                  srai         a7, zero, 28
                  nop
                  csrrci       s8, 0x340, 0
                  c.li         a7, -1
                  rem          gp, a3, t0
                  csrrc        tp, 0x340, ra
                  divu         s7, sp, s2
                  slli         a5, t5, 7
                  xor          tp, t0, a7
                  c.and        a0, a1
                  mulh         a6, t4, t1
                  or           t0, a5, zero
                  sltiu        s11, s11, -3
                  c.andi       a0, 3
                  csrrwi       t0, 0x340, 24
                  mulh         s10, a6, s11
                  c.srai       a3, 12
                  nop
                  slli         a6, a7, 17
                  ori          zero, a0, 58
                  ori          a0, t2, -1099
                  srl          t3, s6, a3
                  sra          s3, t5, a2
                  ori          a5, t6, -1698
                  srai         s3, s2, 7
                  sub          s7, sp, s7
                  or           s5, a2, s11
                  mulhsu       a4, s9, s2
                  c.sub        a2, a0
                  div          s8, s7, ra
                  c.mv         s1, t0
                  and          sp, t5, tp
                  c.nop
                  xori         gp, a6, -306
                  srai         zero, t5, 22
                  slli         sp, gp, 4
                  add          t0, s11, t5
                  csrrsi       gp, 0x340, 9
                  c.add        s5, s0
                  c.slli       s4, 31
                  mulhu        a2, a5, t0
                  mul          s5, s5, s3
                  csrrsi       t1, 0x340, 0
                  c.srai       s1, 2
                  c.lui        t5, 20
                  c.addi16sp   sp, -16
                  sltiu        s5, s7, 1266
                  slt          a7, s3, a2
                  slli         s8, t4, 21
                  c.srai       a2, 12
                  ori          t6, s6, 900
                  slt          t6, t4, s0
                  andi         s7, t0, -510
                  c.sub        a4, a2
                  srli         a2, t3, 2
                  remu         tp, t5, s9
                  mul          a3, s5, a4
                  sltu         s9, s8, s2
                  nop
                  lui          a4, 558864
                  c.srai       s1, 18
                  csrrwi       s9, 0x340, 15
                  c.xor        a2, s0
                  c.lui        s10, 1
                  c.addi4spn   s1, sp, 608
                  sltu         a3, a6, s0
                  mulhu        s9, sp, t2
                  sltu         s11, s6, zero
                  c.lui        s10, 29
                  csrrwi       s1, 0x340, 4
                  c.srai       s1, 6
                  c.srai       s1, 18
                  mulh         s11, sp, a4
                  xor          t0, a5, ra
                  srl          s10, t1, s8
                  csrrw        s4, 0x340, t0
                  c.lui        t1, 13
                  c.slli       s9, 18
                  rem          a5, s0, s8
                  srli         a7, t0, 16
                  addi         zero, a6, -1448
                  div          s1, t0, s6
                  srai         t5, sp, 26
                  nop
                  c.sub        a4, s1
                  xori         s4, t6, -2016
                  nop
                  mulhu        gp, a7, s4
                  nop
                  csrrci       t1, 0x340, 0
                  remu         t1, ra, s3
                  srli         s11, a6, 19
                  div          tp, s3, s8
                  rem          gp, s8, t1
                  csrrw        ra, 0x340, s2
                  xori         t0, a0, 1156
                  sltiu        s9, s2, 1450
                  nop
                  csrrs        s1, 0x340, zero
                  c.addi4spn   a0, sp, 960
                  add          t2, a3, a6
                  lui          t3, 794933
                  c.li         t6, -1
                  sra          t5, t4, tp
                  and          s10, sp, s7
                  c.addi16sp   sp, -16
                  c.sub        s1, a1
                  remu         tp, a2, a5
                  c.slli       s4, 27
                  sub          t4, a7, a6
                  auipc        sp, 295778
                  srai         s9, a0, 1
                  xori         t5, a7, -1530
                  andi         s5, a6, -244
                  and          ra, t4, s0
                  add          s9, gp, tp
                  sra          a2, a1, t2
                  srli         s9, t0, 30
                  c.sub        a3, a0
                  addi         s6, s2, 1751
                  and          s6, t1, s0
                  sll          a6, s5, t0
                  sll          t6, a0, a6
                  csrrs        s3, 0x340, s6
                  rem          tp, sp, s6
                  addi         t2, t2, 729
                  xori         t2, t3, 873
                  rem          t3, s10, a7
                  lui          t6, 981403
                  mul          t5, s7, t6
                  auipc        s1, 529908
                  c.addi       s6, -1
                  c.addi4spn   a3, sp, 864
                  srl          s6, s0, s10
                  csrrs        ra, 0x340, zero
                  srl          s7, a1, a0
                  sltu         t4, s0, s8
                  mul          s1, s9, t2
                  srli         a7, a0, 29
                  remu         zero, s0, a2
                  slli         a5, s3, 31
                  div          t2, a0, s5
                  nop
                  and          t2, t1, t2
                  c.lui        s4, 8
                  c.addi4spn   a0, sp, 448
                  slt          s3, t4, s11
                  c.addi       t6, 28
                  xor          a3, s1, gp
                  c.andi       a4, -1
                  c.srai       a5, 23
                  and          tp, s9, tp
                  remu         gp, s10, tp
                  add          s10, s4, a5
                  c.li         s1, 9
                  csrrwi       s5, 0x340, 3
                  c.and        a5, a0
                  mulhsu       t2, a4, s1
                  sll          s6, s8, s6
                  c.slli       s3, 4
                  c.srli       a3, 6
                  lui          a6, 968543
                  c.lui        s5, 26
                  add          a6, s2, s11
                  sub          t5, a2, s7
                  c.and        a3, a2
                  srl          tp, s2, s4
                  c.li         t1, -1
                  slli         a7, a0, 7
                  c.nop
                  and          t1, s2, gp
                  and          sp, a0, s0
                  c.add        s5, s5
                  c.addi4spn   a5, sp, 1008
                  c.or         a5, a0
                  lui          s8, 684079
                  slt          t5, sp, zero
                  c.li         a7, 26
                  csrrw        t1, 0x340, a1
                  sltu         s1, t6, t5
                  c.srli       a5, 11
                  c.or         a4, a0
                  slti         a4, a2, 1396
                  div          s8, t6, t1
                  slli         s9, t0, 24
                  srl          t2, s3, t5
                  nop
                  andi         s9, s2, 1277
                  c.mv         t3, t0
                  addi         s8, s6, -703
                  csrrs        a6, 0x340, s11
                  c.xor        a2, s0
                  csrrc        s3, 0x340, s0
                  srl          s4, a1, t1
                  csrrc        a7, 0x340, zero
                  c.addi       s5, -1
                  srai         s4, t6, 14
                  csrrw        a3, 0x340, s9
                  c.slli       s9, 10
                  mulhsu       sp, t5, t6
                  sltu         t2, a5, a6
                  mul          t0, gp, s11
                  c.li         gp, 8
                  c.addi4spn   a2, sp, 64
                  srli         a3, gp, 2
                  auipc        t0, 102565
                  nop
                  div          s11, s3, t5
                  csrrs        t0, 0x340, t4
                  srai         t3, s6, 5
                  c.and        a5, s1
                  remu         a3, t4, s3
                  andi         t1, ra, -18
                  csrrw        a3, 0x340, t4
                  c.add        tp, s6
                  c.srli       a0, 11
                  and          a7, s3, a7
                  srli         t5, t1, 26
                  mulhu        a5, sp, s10
                  c.slli       tp, 25
                  and          t2, tp, a7
                  mulhsu       t1, a2, s7
                  c.or         a2, a5
                  srai         s4, a6, 8
                  or           a4, t0, t2
                  c.srai       a0, 17
                  sll          t5, a3, s0
                  csrrwi       gp, 0x340, 4
                  slli         s5, s4, 29
                  csrrs        t5, 0x340, zero
                  c.andi       a2, -1
                  xori         s4, tp, 1884
                  mulh         gp, t4, s2
                  mul          a0, s2, t6
                  srl          t2, s5, s8
                  c.li         s11, -1
                  c.lui        s1, 30
                  c.lui        t2, 24
                  sub          t6, gp, s9
                  div          a4, t3, t1
                  c.andi       a3, 27
                  c.mv         a2, a6
                  sub          tp, gp, s8
                  c.li         s5, 24
                  csrrw        s6, 0x340, s0
                  remu         s5, t1, t2
                  nop
                  srli         a5, a1, 20
                  srl          s3, s5, a0
                  csrrw        s6, 0x340, gp
                  c.addi       s3, 19
                  c.srli       a4, 19
                  slli         a6, t5, 27
                  c.mv         t2, t1
                  rem          s9, a5, s2
                  remu         t0, s0, s3
                  divu         s10, t0, t6
                  c.slli       t4, 15
                  c.or         a5, a5
                  lui          tp, 645089
                  c.mv         gp, t5
                  c.and        a4, a3
                  srl          t3, a7, s10
                  c.addi4spn   a3, sp, 224
                  csrrci       t2, 0x340, 0
                  ori          a0, s4, -1936
                  xor          s5, s6, s8
                  rem          s7, t1, s8
                  rem          s10, s8, t1
                  addi         ra, a2, 1365
                  c.addi4spn   a4, sp, 544
                  c.addi4spn   a4, sp, 192
                  c.srai       a2, 28
                  c.addi       t5, -1
                  csrrs        s1, 0x340, s3
                  remu         sp, s9, a3
                  sll          s6, s7, a6
                  c.mv         s7, a5
                  mulhsu       t1, s11, s2
                  mul          sp, s1, t1
                  mulh         zero, sp, t3
                  xori         a0, a6, -409
                  c.addi       a0, 8
                  csrrwi       s6, 0x340, 31
                  csrrw        s3, 0x340, a3
                  c.srai       a2, 20
                  div          t6, s10, ra
                  ori          ra, zero, 2024
                  andi         t0, zero, -1041
                  csrrci       s4, 0x340, 0
                  rem          s5, t6, gp
                  c.addi       a0, 31
                  c.slli       s8, 29
                  srai         s4, tp, 10
                  c.slli       t4, 29
                  srli         zero, s6, 0
                  c.mv         s5, a3
                  sltiu        s1, s4, 1272
                  divu         s4, tp, a2
                  srli         a6, s7, 10
                  andi         s8, s6, 1801
                  srl          s1, a2, s0
                  c.and        a4, a0
                  div          gp, s10, s6
                  c.srli       a3, 28
                  mul          t6, t2, s9
                  csrrs        zero, 0x340, a4
                  slli         s4, ra, 17
                  c.andi       a5, -1
                  c.andi       a3, 16
                  ori          t2, a6, -2042
                  csrrsi       t0, 0x340, 0
                  c.sub        a0, a0
                  sra          a0, a3, s7
                  lui          t5, 978183
                  mulhu        t2, s3, s9
                  xor          t2, t3, a2
                  xori         t3, a2, 1443
                  lui          s11, 426259
                  andi         s4, zero, 1008
                  c.addi16sp   sp, 224
                  slti         s10, s9, 552
                  csrrsi       s9, 0x340, 9
                  div          a4, a7, zero
                  csrrc        a7, 0x340, a0
                  rem          a2, a7, ra
                  c.li         s11, 3
                  sra          s1, a4, a6
                  csrrci       s8, 0x340, 0
                  c.li         s6, 6
                  sltu         s7, tp, s3
                  remu         t6, s11, s5
                  c.addi       ra, 8
                  c.addi4spn   s1, sp, 528
                  mulhsu       s6, t6, a1
                  c.addi16sp   sp, -16
                  c.addi       a0, 4
                  divu         t3, a4, a3
                  sltu         t0, t3, a1
                  lui          s9, 82263
                  c.srai       a4, 16
                  c.and        a2, s1
                  c.addi       a7, -1
                  c.srai       a5, 30
                  c.slli       s10, 11
                  xori         a0, t4, -321
                  sll          ra, t1, s2
                  c.slli       a2, 22
                  srli         a6, s9, 2
                  c.nop
                  c.xor        a4, a0
                  csrrwi       tp, 0x340, 11
                  c.srli       a4, 4
                  c.addi16sp   sp, 80
                  sltu         s4, s1, t2
                  c.addi16sp   sp, 32
                  sll          t2, s11, a0
                  sll          t4, s3, t1
                  srai         t6, t4, 13
                  c.srli       s1, 29
                  auipc        zero, 517405
                  srai         t4, a1, 5
                  csrrw        a2, 0x340, s4
                  csrrsi       a2, 0x340, 14
                  c.lui        s8, 25
                  andi         s4, t4, 1299
                  slt          s7, a3, t5
                  sltiu        sp, gp, 1348
                  c.addi       t0, 27
                  lui          a3, 954161
                  sltiu        a4, a6, 958
                  c.sub        s1, a1
                  ori          t2, s5, -267
                  c.lui        s10, 21
                  srl          s3, s1, s4
                  c.lui        s7, 22
                  c.addi4spn   a5, sp, 1008
                  csrrs        t6, 0x340, s5
                  andi         t0, t4, -1649
                  srl          s10, s5, t6
                  sltu         t4, a4, s11
                  slti         t6, t3, -798
                  andi         t5, a3, -1777
                  mul          t4, s2, s2
                  c.and        a5, s0
                  mul          t3, s1, s6
                  xor          tp, t2, tp
                  c.li         t3, 29
                  csrrw        t2, 0x340, a0
                  c.srai       a3, 13
                  auipc        a6, 355209
                  c.add        a2, a3
                  div          s5, s5, a4
                  c.or         a3, s1
                  xori         a5, t6, -992
                  mul          s3, t2, t4
                  sltiu        a3, s6, -1902
                  div          a5, ra, s0
                  srl          t3, t2, s4
                  div          s9, t0, s5
                  c.xor        s1, a2
                  slt          t0, gp, s1
                  c.andi       a0, 3
                  and          s6, s6, t3
                  slt          a4, s6, s11
                  sltiu        t6, s8, 1217
                  c.srli       a4, 15
                  xor          s6, a5, a5
                  csrrw        s9, 0x340, a7
                  lui          gp, 191327
                  add          tp, t4, ra
                  div          t1, s11, zero
                  ori          tp, s6, -99
                  mulhu        s4, t4, t6
                  and          s7, t4, a6
                  addi         s6, sp, -1121
                  sra          s6, gp, s1
                  csrrwi       s11, 0x340, 3
                  addi         a4, s8, 1985
                  c.xor        a0, a4
                  csrrsi       tp, 0x340, 9
                  nop
                  xori         s6, s6, -1610
                  c.srli       a2, 18
                  c.li         s4, 21
                  mulhsu       t6, t5, t4
                  mulhu        a5, s5, gp
                  srli         gp, s5, 17
                  csrrci       t2, 0x340, 0
                  csrrsi       a6, 0x340, 28
                  c.srli       a4, 18
                  c.or         a5, s1
                  rem          zero, a2, a0
                  srli         s4, a7, 26
                  c.add        a0, a3
                  sub          s9, s11, t4
                  c.andi       a0, -1
                  csrrsi       sp, 0x340, 0
                  c.xor        s1, s0
                  c.xor        a3, a2
                  c.mv         a5, s10
                  c.add        a0, s8
                  c.srli       a4, 30
                  c.mv         tp, s4
                  sub          t6, a3, t2
                  sll          s5, s8, a5
                  lui          t6, 492264
                  mulh         a6, a2, sp
                  sltiu        a2, a7, -266
                  nop
                  csrrsi       s4, 0x340, 0
                  addi         s3, s11, -1400
                  srl          a6, s11, sp
                  c.srai       a2, 12
                  ori          s5, s0, -1343
                  addi         a2, t3, -1733
                  add          s4, sp, t3
                  c.slli       s1, 3
                  mulhu        gp, a5, t4
                  andi         s11, a3, 1381
                  sll          sp, a3, t0
                  addi         t3, ra, 1290
                  csrrw        a6, 0x340, a2
                  slli         a7, s9, 8
                  c.andi       a5, -1
                  mulh         s10, s1, t4
                  and          sp, a5, s2
                  mulhu        a0, zero, sp
                  nop
                  c.sub        s1, s0
                  c.mv         s8, s0
                  srl          a7, s4, s1
                  auipc        t3, 952373
                  mulhsu       t4, tp, a5
                  slt          a0, a6, a7
                  c.or         a0, a2
                  mulhu        t3, s10, gp
                  andi         s11, s4, -2036
                  sll          t6, s11, t6
                  c.mv         a7, s10
                  sra          t2, t3, s5
                  mulhu        a4, s5, s11
                  csrrwi       s3, 0x340, 16
                  addi         a5, t1, -1664
                  c.srai       a2, 11
                  csrrsi       s4, 0x340, 1
                  mul          s7, s1, s11
                  sltu         a3, a1, a1
                  slt          tp, t2, s3
                  divu         t3, tp, t2
                  c.addi4spn   a0, sp, 480
                  srli         s11, a7, 3
                  c.add        s4, s9
                  ori          s5, s1, 1689
                  c.srli       a3, 13
                  mulhu        s6, s3, a7
                  slt          a5, t0, s7
                  sltiu        s3, sp, -1903
                  c.nop
                  c.add        sp, s1
                  csrrs        sp, 0x340, t0
                  c.srai       a3, 4
                  or           s11, gp, s3
                  lui          t6, 402046
                  sra          a0, zero, gp
                  addi         s5, s6, -1546
                  xor          s9, ra, a7
                  srl          t2, sp, a7
                  rem          a4, s9, sp
                  xori         s5, t6, -1653
                  sltu         t1, t5, t6
                  addi         s6, s11, 1497
                  and          a5, t6, s11
                  c.srli       a2, 22
                  mul          tp, t1, t2
                  sltiu        s6, zero, -1949
                  c.lui        a5, 3
                  ori          a7, s5, -372
                  sltu         t6, ra, a3
                  sll          t2, sp, s11
                  c.slli       s8, 20
                  csrrwi       t0, 0x340, 23
                  rem          s6, a0, s6
                  or           s6, t6, s11
                  or           s4, a1, s1
                  c.mv         s6, s9
                  sll          t0, a6, s11
                  andi         gp, s10, -363
                  div          s1, s0, s1
                  c.xor        s1, a5
                  sltiu        t2, s1, 432
                  c.addi4spn   a3, sp, 784
                  ori          s7, s4, 1020
                  c.andi       a4, 22
                  c.add        t0, tp
                  csrrs        t2, 0x340, zero
                  c.mv         t5, t0
                  csrrsi       sp, 0x340, 0
                  ori          s11, t0, -1191
                  c.addi4spn   a3, sp, 704
                  csrrc        s10, 0x340, zero
                  sll          a7, t0, t0
                  c.mv         s1, a0
                  lui          s4, 759273
                  remu         t5, zero, zero
                  sll          t3, gp, t5
                  c.addi16sp   sp, -16
                  csrrci       s4, 0x340, 0
                  add          t0, t0, s2
                  c.and        a2, a2
                  slt          s7, s1, gp
                  ori          t4, s9, 488
                  xor          t3, a2, a0
                  c.li         gp, 19
                  c.xor        a4, a1
                  and          zero, a5, s7
                  or           a3, ra, t3
                  xor          s5, t1, sp
                  xori         a6, s5, -1383
                  lui          a6, 959988
                  c.add        gp, tp
                  csrrc        s11, 0x340, a6
                  c.and        a2, s1
                  c.li         t6, 20
                  c.mv         s4, s8
                  srai         a3, zero, 0
                  div          a4, zero, s1
                  csrrsi       zero, 0x340, 0
                  or           s10, s5, a1
                  c.addi       gp, -1
                  rem          t5, gp, tp
                  or           s3, t3, s5
                  c.slli       s9, 30
                  srl          s10, zero, s10
                  auipc        t1, 65878
                  slt          s8, s6, s1
                  c.sub        a5, a1
                  xori         t6, a4, 1463
                  addi         t0, a5, -793
                  csrrsi       t2, 0x340, 0
                  c.slli       a7, 17
                  mul          s7, a6, s11
                  nop
                  mul          t1, t2, t6
                  c.nop
                  c.lui        t2, 30
                  c.srai       a5, 2
                  c.srai       a2, 27
                  c.or         a4, a2
                  sra          s6, a0, t3
                  c.add        ra, s11
                  addi         tp, s2, 869
                  mul          gp, t5, a7
                  sltiu        gp, gp, -1417
                  slti         t0, a5, 1837
                  mulhu        gp, s0, s9
                  c.srai       a0, 24
                  mulh         a2, s2, tp
                  csrrsi       s3, 0x340, 0
                  slli         s6, s8, 5
                  sltu         s8, a1, s2
                  c.sub        a5, a1
                  c.or         s1, s1
                  c.add        s3, t5
                  mulh         s6, ra, sp
                  c.srli       a0, 20
                  c.or         s1, a2
                  remu         s9, s7, s4
                  sll          s1, t0, a6
                  div          t3, a4, t3
                  slti         ra, sp, -413
                  c.xor        a4, a5
                  c.and        a2, s0
                  and          a2, s11, a1
                  xori         s9, a2, -752
                  c.add        a7, a6
                  nop
                  c.mv         t5, a6
                  or           a2, tp, a6
                  ori          s8, s5, -1421
                  mulhu        gp, gp, a7
                  csrrs        s7, 0x340, zero
                  c.addi4spn   a2, sp, 176
                  and          a5, t3, a1
                  sra          tp, s4, t5
                  c.lui        s11, 3
                  slti         t2, tp, 1534
                  div          t5, s10, a2
                  sltiu        s11, s5, 1403
                  mul          s6, a7, a2
                  divu         a5, s10, t4
                  sltiu        a7, s7, 1759
                  srai         s8, t0, 9
                  mulhsu       a5, a5, zero
                  c.slli       s3, 5
                  c.srai       a4, 17
                  srai         s7, s4, 21
                  div          t4, t3, t5
                  sub          s10, zero, s6
                  csrrci       s8, 0x340, 0
                  remu         t1, s2, s3
                  csrrw        gp, 0x340, a4
                  sll          s3, s6, a7
                  c.xor        s1, a0
                  auipc        a4, 843418
                  mulhsu       a0, t0, s0
                  rem          s11, s9, ra
                  c.or         a4, s1
                  addi         tp, sp, 716
                  auipc        t5, 828110
                  mulhu        t6, a5, s4
                  addi         a5, s10, -214
                  sltiu        sp, s5, -1642
                  mulhsu       t3, s8, s2
                  div          gp, s0, s2
                  xor          a2, s6, s3
                  mulh         t6, ra, tp
                  c.xor        a2, s0
                  csrrsi       s1, 0x340, 0
                  c.li         s9, -1
                  c.srai       a3, 2
                  sra          s5, gp, t4
                  mulh         s10, sp, a2
                  mulhsu       ra, zero, t3
                  remu         s7, s8, tp
                  csrrs        s8, 0x340, s7
                  div          a5, s1, s10
                  c.nop
                  and          s6, s7, sp
                  srli         t2, s6, 8
                  c.slli       tp, 21
                  sra          s6, a1, s7
                  auipc        a5, 2590
                  c.sub        a4, s1
                  slli         a7, ra, 25
                  nop
                  c.add        s1, tp
                  slti         s4, s2, 1592
                  sltu         zero, s4, s3
                  slti         s9, s4, -1107
                  rem          t2, a5, a5
                  c.addi16sp   sp, 208
                  remu         a2, t5, t3
                  lui          a7, 847123
                  srli         a2, sp, 3
                  nop
                  c.xor        a4, a0
                  addi         t6, gp, -1614
                  srai         a2, s1, 3
                  c.add        t5, t2
                  srl          s5, s11, s0
                  auipc        t0, 507006
                  csrrci       t0, 0x340, 3
                  mulhu        s4, sp, a4
                  c.sub        s1, a3
                  slt          s7, s7, tp
                  auipc        a5, 734631
                  divu         a6, a5, s7
                  srli         s9, gp, 10
                  c.sub        a4, s1
                  sub          s1, s7, s8
                  addi         a7, s10, -1212
                  addi         s4, a7, 925
                  csrrw        gp, 0x340, a0
                  sltiu        zero, a0, -1765
                  c.addi4spn   a5, sp, 224
                  ori          sp, s4, 4
                  csrrw        a2, 0x340, t1
                  remu         s4, t4, s6
                  c.or         s1, s0
                  mulhsu       a5, s2, s8
                  slti         a6, s1, -1030
                  div          s9, a1, tp
                  c.addi4spn   s1, sp, 304
                  c.xor        a0, a5
                  rem          s9, t2, a4
                  csrrsi       a0, 0x340, 0
                  c.srli       a5, 23
                  lui          ra, 782466
                  slt          s7, zero, t5
                  sltu         sp, s7, a7
                  c.andi       a5, 15
                  csrrsi       s5, 0x340, 18
                  lui          t2, 762557
                  c.addi       a3, -1
                  slli         zero, s11, 14
                  csrrc        a7, 0x340, zero
                  add          sp, s9, ra
                  srli         s1, t6, 23
                  srli         s4, t4, 9
                  rem          a5, s7, gp
                  auipc        a4, 507385
                  auipc        a6, 958250
                  c.mv         s5, a4
                  mulhu        t4, t3, a4
                  sra          sp, s1, t4
                  c.mv         t2, t2
                  c.lui        a5, 8
                  rem          s11, s11, a7
                  srl          s6, a0, sp
                  remu         s8, a7, s4
                  sub          ra, a7, s8
                  c.li         s3, -1
                  c.srai       a0, 1
                  remu         a6, s11, t0
                  andi         s1, t1, 452
                  slli         a7, tp, 0
                  c.andi       a3, -1
                  rem          a6, s5, zero
                  csrrsi       t1, 0x340, 0
                  sltiu        t5, s5, -1724
                  div          a3, a3, gp
                  sll          s3, s11, tp
                  srli         s5, a4, 29
                  or           t2, s8, a1
                  csrrc        a2, 0x340, s1
                  c.lui        s4, 27
                  c.nop
                  c.andi       a0, 8
                  c.addi       sp, -1
                  c.addi4spn   a4, sp, 32
                  c.nop
                  sub          t4, s1, a4
                  sltu         s9, s1, t4
                  c.or         a2, s1
                  c.addi       s4, -1
                  srai         ra, s1, 7
                  xor          a4, t0, a1
                  c.srai       a0, 4
                  csrrc        zero, 0x340, zero
                  c.srai       a2, 26
                  sltiu        t4, s6, 14
                  mulhsu       t5, t1, s11
                  sltiu        s7, a3, 1164
                  srl          t5, s9, a5
                  c.add        a5, s4
                  slli         s5, t0, 10
                  slti         gp, a4, -1029
                  slli         t2, t1, 31
                  c.slli       s11, 19
                  div          a3, a7, t4
                  c.srli       a2, 17
                  csrrw        ra, 0x340, t2
                  sub          t3, s11, zero
                  sub          a2, gp, t6
                  c.andi       s1, -1
                  srl          t6, s10, s2
                  c.andi       a0, 0
                  c.mv         s4, s4
                  nop
                  nop
                  slti         a7, t6, -152
                  xor          s9, t3, s10
                  c.xor        a3, a5
                  sra          t4, t4, s0
                  divu         tp, t6, a4
                  sll          s4, s4, s7
                  c.or         a3, s0
                  div          a6, tp, s8
                  remu         s7, t6, a3
                  csrrc        ra, 0x340, zero
                  c.add        s11, t2
                  nop
                  slli         t5, gp, 23
                  ori          s9, s9, -2017
                  c.slli       t5, 1
                  and          s7, a7, t6
                  c.sub        a4, s0
                  add          s8, a3, zero
                  remu         s3, t4, a7
                  remu         gp, a3, s9
                  mulhsu       s8, t5, a6
                  c.slli       s7, 20
                  csrrc        t6, 0x340, zero
                  slti         t0, s5, 1752
                  c.add        s10, sp
                  mulh         a5, tp, s10
                  mulh         s6, a2, s3
                  slti         a4, a0, 509
                  slli         s4, tp, 2
                  sra          t4, a4, t0
                  xor          t6, a5, t2
                  div          s10, s7, t6
                  addi         a2, t4, -1368
                  c.and        a3, a3
                  c.andi       a4, -1
                  nop
                  lui          s1, 1015204
                  c.nop
                  c.or         a0, a2
                  sltiu        t1, s11, -926
                  sub          s5, t5, a1
                  auipc        s7, 666964
                  c.srli       a3, 3
                  srl          zero, s8, s9
                  mulhsu       t3, t1, a1
                  c.add        s5, t6
                  div          s10, s9, s4
                  slt          s1, t0, s1
                  slli         tp, s4, 18
                  slt          s11, s6, s3
                  c.nop
                  csrrsi       a2, 0x340, 17
                  srai         s4, s5, 9
                  divu         s4, sp, s8
                  c.srai       a5, 27
                  csrrs        s11, 0x340, zero
                  slt          t2, s0, t0
                  mulhu        t0, t2, s0
                  andi         s10, t2, 901
                  rem          s10, a7, ra
                  c.mv         s11, s4
                  c.addi16sp   sp, -16
                  divu         t4, t5, ra
                  remu         a7, a6, t0
                  srli         a7, ra, 5
                  slt          a5, t1, s3
                  c.andi       a3, 27
                  csrrc        t2, 0x340, a0
                  add          s5, s0, s6
                  srli         t1, s6, 12
                  c.sub        a5, a3
                  c.or         a0, a4
                  or           zero, s3, ra
                  mulhsu       gp, a0, s9
                  sltiu        a3, a6, -272
                  ori          a5, a1, -749
                  srai         gp, s8, 4
                  sltiu        a7, s3, -620
                  csrrci       a6, 0x340, 0
                  c.mv         s7, a7
                  c.and        a0, a4
                  sra          t3, a6, sp
                  xor          a3, t2, a4
                  c.xor        a0, s0
                  c.andi       a0, 16
                  c.mv         s1, t3
                  csrrwi       s7, 0x340, 13
                  csrrw        a7, 0x340, tp
                  sltu         t3, s1, tp
                  c.xor        a0, s1
                  xori         t6, t4, -548
                  sll          a0, t3, a4
                  slli         s3, ra, 29
                  c.or         a5, a3
                  mulh         s10, s7, t2
                  csrrw        tp, 0x340, s4
                  c.xor        a4, a5
                  c.addi4spn   a5, sp, 352
                  mulhsu       s5, s10, a5
                  c.addi16sp   sp, -16
                  slti         s1, sp, 1298
                  srai         s4, a3, 30
                  nop
                  sub          s9, s8, s4
                  remu         s9, s2, sp
                  and          s5, ra, t1
                  xor          gp, a7, a3
                  c.sub        a4, a4
                  csrrwi       a6, 0x340, 12
                  c.srli       s1, 13
                  c.and        a3, a3
                  slti         s3, s10, 1654
                  c.li         sp, -1
                  sltiu        s11, s9, -385
                  srli         gp, tp, 15
                  sltiu        zero, t5, -548
                  xori         gp, a0, 1197
                  sra          a2, a1, a1
                  c.and        a0, a5
                  nop
                  div          s10, a0, s2
                  mul          a2, a6, s11
                  csrrc        a3, 0x340, a4
                  divu         a3, s1, t5
                  c.addi       a3, -1
                  lui          t5, 602567
                  slti         t6, t1, -508
                  c.addi       a7, 25
                  xor          s9, s0, t4
                  c.add        s8, a5
                  xor          tp, t3, t5
                  slt          s3, tp, t5
                  sub          tp, s5, gp
                  c.addi4spn   a4, sp, 960
                  csrrc        sp, 0x340, zero
                  sltu         s1, s0, a1
                  mulhsu       t1, t1, s4
                  sub          s6, s0, a4
                  srai         s10, s9, 11
                  c.or         s1, a4
                  c.and        a5, a0
                  sra          a7, s4, s5
                  c.addi       a0, -1
                  or           s5, gp, a2
                  addi         t3, s10, 72
                  csrrci       t3, 0x340, 0
                  mulhsu       s10, t1, s1
                  sra          s1, s11, gp
                  mulhsu       sp, a0, ra
                  mulhu        s11, gp, s7
                  mulhsu       t4, gp, a7
                  csrrwi       a0, 0x340, 24
                  srai         s4, a5, 19
                  divu         zero, t2, tp
                  c.andi       s1, 14
                  and          t0, s8, a5
                  csrrs        a5, 0x340, zero
                  xori         s9, a0, 1005
                  or           a6, tp, s4
                  sll          a5, t1, t5
                  slli         a7, gp, 24
                  sltiu        s7, a2, 691
                  c.andi       a3, 0
                  c.sub        a3, a3
                  csrrci       zero, 0x340, 2
                  mul          s9, a6, s9
                  sltu         t2, a2, s5
                  csrrci       s7, 0x340, 0
                  slt          a2, t2, a2
                  srai         tp, gp, 15
                  c.srai       a3, 16
                  div          t4, tp, a2
                  c.sub        a4, s1
                  sll          t2, s9, a1
                  c.nop
                  and          t4, s4, s1
                  c.andi       s1, -1
                  lui          s9, 165106
                  or           a6, s10, a1
                  c.addi4spn   a0, sp, 16
                  addi         a0, s6, 1781
                  mul          s8, s8, s11
                  addi         a6, a4, -1170
                  c.addi16sp   sp, -16
                  c.addi4spn   a2, sp, 48
                  xor          s7, zero, a3
                  or           a4, a5, s0
                  mul          t3, t4, sp
                  c.sub        a3, a0
                  div          s11, a7, a4
                  mulhu        s8, a3, zero
                  srl          t6, s6, ra
                  sll          a0, sp, s3
                  csrrs        sp, 0x340, zero
                  div          a7, s9, s1
                  mul          t0, s9, s4
                  csrrs        a5, 0x340, a6
                  csrrci       a5, 0x340, 0
                  csrrc        t3, 0x340, zero
                  srai         s10, s9, 20
                  slti         a4, s2, 1724
                  c.addi       s8, -1
                  sltu         a7, t2, s7
                  xor          a5, s9, a0
                  slti         s7, s10, 659
                  lui          a4, 331153
                  c.and        a5, a3
                  sra          a4, a6, s5
                  csrrwi       t6, 0x340, 24
                  srl          s11, t4, zero
                  sra          s5, a3, s1
                  c.li         s7, 27
                  andi         zero, a5, 1988
                  add          a7, s5, s5
                  csrrc        a7, 0x340, t5
                  srli         a6, a3, 27
                  c.add        gp, s6
                  csrrs        a7, 0x340, t2
                  sub          tp, t5, gp
                  c.and        a2, s0
                  mulh         t2, sp, s10
                  ori          a3, t4, -1513
                  xor          s5, t3, zero
                  mulh         a0, s6, s5
                  xor          a4, a6, s8
                  c.nop
                  and          sp, a7, a6
                  xori         a6, sp, 58
                  csrrwi       t2, 0x340, 8
                  sltiu        t3, t3, 1973
                  mul          zero, a0, zero
                  mulhu        a3, s8, s1
                  sll          t2, s9, t4
                  c.lui        s9, 18
                  c.srai       s1, 3
                  auipc        t1, 21234
                  c.srli       a2, 29
                  slti         t3, a5, 1230
                  add          s6, s11, a7
                  mulhu        s5, s5, s8
                  slti         gp, t0, 1191
                  slti         s7, t5, -83
                  remu         a4, s11, t6
                  c.addi4spn   a0, sp, 304
                  srli         a7, t4, 9
                  csrrwi       s6, 0x340, 2
                  c.nop
                  slt          zero, a6, s2
                  c.mv         a2, t5
                  sltu         a7, s11, t6
                  srl          s3, a1, tp
                  sltiu        tp, tp, -871
                  sub          a2, s0, gp
                  mul          a5, t0, tp
                  srli         a7, t6, 14
                  c.or         a5, s1
                  nop
                  auipc        a0, 704399
                  sra          zero, s7, ra
                  c.addi4spn   a0, sp, 288
                  andi         s1, s8, 704
                  csrrci       s7, 0x340, 13
                  srai         t1, a1, 1
                  remu         tp, t4, t3
                  srai         a5, t0, 7
                  c.addi4spn   a5, sp, 784
                  sltu         tp, t6, s8
                  rem          s5, t3, t2
                  xori         s10, t2, 714
                  csrrw        t1, 0x340, a4
                  auipc        tp, 197760
                  csrrw        a5, 0x340, sp
                  csrrc        gp, 0x340, t5
                  c.lui        a6, 22
                  mul          t4, s2, a0
                  sll          s10, a2, t6
                  auipc        a7, 715933
                  c.nop
                  c.lui        ra, 19
                  divu         s4, s1, s10
                  c.slli       gp, 7
                  c.lui        t0, 4
                  slt          t3, tp, sp
                  csrrwi       s11, 0x340, 17
                  remu         sp, s7, s5
                  csrrw        s11, 0x340, s10
                  lui          ra, 289387
                  mulhsu       t3, s10, s8
                  c.add        s3, t6
                  srli         t6, t2, 20
                  c.mv         t6, ra
                  mulh         t0, s10, zero
                  c.and        a5, a2
                  srl          t5, s11, a6
                  c.lui        t0, 21
                  c.xor        s1, s0
                  xori         s11, a1, 758
                  csrrs        s5, 0x340, zero
                  rem          s8, a5, ra
                  ori          s1, s5, -369
                  xor          s7, s10, s1
                  rem          t2, t5, a6
                  sltiu        t3, s11, -1762
                  nop
                  c.addi16sp   sp, -16
                  nop
                  c.xor        s1, a2
                  srai         t1, t3, 12
                  csrrsi       t3, 0x340, 12
                  srli         s11, a2, 22
                  sra          sp, zero, s6
                  c.sub        a4, a5
                  c.add        s6, a1
                  c.addi       s7, 16
                  csrrsi       t3, 0x340, 0
                  c.srli       a3, 10
                  csrrw        tp, 0x340, s2
                  c.addi16sp   sp, -16
                  slli         t4, a1, 0
                  or           s6, zero, t2
                  csrrc        zero, 0x340, zero
                  xori         s7, a5, 791
                  c.addi       s6, -1
                  csrrsi       s8, 0x340, 0
                  divu         a0, a7, a3
                  add          t3, s11, sp
                  srli         s7, a2, 26
                  mul          a6, s9, sp
                  sra          s8, s6, s9
                  and          a6, a4, zero
                  c.addi4spn   a3, sp, 496
                  srli         t4, zero, 15
                  c.or         s1, a1
                  csrrs        a6, 0x340, s7
                  c.addi16sp   sp, -16
                  mulhsu       gp, s1, s7
                  c.nop
                  srai         t5, a0, 20
                  c.nop
                  c.lui        t2, 25
                  c.nop
                  c.or         a3, a0
                  andi         gp, a4, 1276
                  div          t5, tp, zero
                  add          t0, gp, s7
                  c.srai       a3, 7
                  add          s3, s4, t1
                  c.add        a7, s10
                  or           a5, t5, s7
                  c.xor        a2, a0
                  sll          t3, t0, s9
                  slt          t4, s2, s8
                  c.lui        s7, 21
                  xori         a0, tp, -1910
                  c.addi4spn   a0, sp, 16
                  xori         t3, tp, -320
                  c.lui        a6, 25
                  auipc        t2, 437230
                  mul          zero, a4, t6
                  c.mv         t2, t6
                  slti         a2, zero, 594
                  slti         s3, s0, -374
                  c.and        a2, a0
                  csrrs        a5, 0x340, zero
                  slt          t5, tp, a0
                  c.li         t5, -1
                  srl          ra, s11, ra
                  mulhu        a5, s8, t4
                  csrrsi       s1, 0x340, 0
                  addi         a4, s3, -253
                  c.slli       t0, 30
                  sltu         a5, s9, tp
                  c.slli       t5, 7
                  slli         s11, a0, 28
                  c.addi       s6, -1
                  addi         tp, s6, -2002
                  c.nop
                  and          s10, t4, ra
                  and          s6, s11, a3
                  mulhu        s11, a3, s0
                  c.srli       a5, 14
                  sra          a2, a6, a1
                  c.add        t2, s1
                  divu         s4, a7, a3
                  xor          s6, a5, a6
                  sub          s11, s0, s4
                  csrrwi       a4, 0x340, 13
                  add          a6, ra, s3
                  c.sub        a3, a5
                  csrrsi       ra, 0x340, 0
                  ori          s1, zero, 816
                  sltiu        s4, t2, 2046
                  mulh         t1, s3, s9
                  mul          s5, gp, s9
                  csrrwi       t1, 0x340, 22
                  remu         gp, s6, s5
                  sub          t1, s4, a1
                  xori         zero, t6, 1260
                  srl          a4, a4, a3
                  srl          s3, t6, a5
                  c.nop
                  csrrsi       s3, 0x340, 26
                  c.slli       s5, 23
                  sltiu        a2, a4, -1830
                  mulh         s7, gp, s0
                  srl          a0, a6, t6
                  c.li         s3, -1
                  c.andi       s1, 19
                  csrrs        a2, 0x340, s11
                  sub          sp, s8, t4
                  xor          s3, s8, s4
                  csrrs        a7, 0x340, t3
                  or           s4, a6, a0
                  andi         zero, zero, 833
                  c.or         s1, a2
                  c.srai       a0, 20
                  sltu         t3, s3, sp
                  csrrci       a5, 0x340, 11
                  lui          t3, 501832
                  csrrc        gp, 0x340, zero
                  lui          t2, 155972
                  xor          s1, a6, t6
                  lui          s10, 868748
                  c.li         s11, 28
                  ori          t0, s4, -1261
                  rem          s5, tp, s0
                  or           a2, s8, s0
                  c.mv         t1, tp
                  csrrci       t0, 0x340, 13
                  csrrc        a3, 0x340, zero
                  c.slli       t1, 27
                  c.nop
                  sltiu        s9, t3, 194
                  csrrsi       s1, 0x340, 22
                  c.lui        t1, 21
                  c.and        a5, s1
                  c.li         a6, 27
                  c.andi       a3, -1
                  slli         s6, s10, 4
                  nop
                  c.addi       t3, 28
                  xor          s4, t6, s7
                  c.sub        a2, a5
                  c.addi       a6, 2
                  divu         zero, zero, t5
                  c.li         t1, -1
                  addi         s1, a3, 1521
                  sra          s5, t4, s0
                  c.srli       a0, 16
                  sltu         t0, t4, ra
                  c.addi4spn   a0, sp, 336
                  c.or         a0, a2
                  c.lui        s1, 30
                  c.andi       a4, -1
                  c.mv         ra, t1
                  c.xor        a5, a0
                  xori         gp, s5, -1455
                  c.sub        a4, a1
                  xor          s1, a3, a2
                  srli         a2, t6, 14
                  mul          tp, ra, s6
                  csrrs        a2, 0x340, s3
                  c.add        t5, s4
                  csrrsi       gp, 0x340, 10
                  auipc        t6, 313002
                  srai         t2, s1, 23
                  c.srli       a5, 15
                  csrrs        s9, 0x340, s11
                  c.nop
                  c.nop
                  sltiu        s3, gp, 558
                  srai         gp, s1, 30
                  c.srai       a4, 4
                  rem          zero, s11, zero
                  and          zero, s10, s10
                  c.li         sp, -1
                  srli         t1, s10, 11
                  c.andi       s1, 3
                  divu         s4, sp, s11
                  c.mv         s7, a0
                  c.addi16sp   sp, -16
                  c.slli       s10, 26
                  c.addi       a7, 8
                  sub          sp, s1, t4
                  remu         s8, s9, a6
                  c.addi16sp   sp, 400
                  srai         t6, a4, 8
                  xori         ra, a3, -1977
                  lui          s7, 482586
                  xori         a4, t5, -1063
                  ori          t2, s7, 1012
                  divu         s3, a0, a7
                  c.srai       a4, 31
                  sll          gp, s1, t6
                  sll          sp, s5, s7
                  c.addi16sp   sp, 80
                  mulhu        s9, ra, a5
                  mulhu        gp, s8, a5
                  slti         s10, t5, 798
                  c.addi16sp   sp, -16
                  xor          a7, s11, s9
                  srl          t6, tp, s0
                  or           a3, a3, s8
                  c.srli       a4, 25
                  divu         s6, t1, zero
                  slli         a3, t1, 12
                  csrrsi       t3, 0x340, 17
                  remu         t2, a6, t1
                  sub          a5, a4, s10
                  c.addi16sp   sp, -16
                  c.sub        a4, a2
                  c.andi       a3, -1
                  slt          a7, a7, t5
                  c.and        a3, a3
                  c.mv         a7, s0
                  auipc        t4, 593402
                  mulhsu       t2, a5, a7
                  slti         a7, a5, 2001
                  nop
                  div          a2, s6, s0
                  csrrw        s10, 0x340, t2
                  c.addi16sp   sp, -16
                  c.addi16sp   sp, -16
                  sll          s8, s11, s7
                  addi         ra, t6, -303
                  add          a7, a6, sp
                  csrrci       a5, 0x340, 0
                  addi         zero, s10, 31
                  mulhsu       a5, a3, s3
                  xor          ra, s5, t0
                  divu         a2, a7, s8
                  c.andi       a3, -1
                  c.srli       a5, 12
                  slti         sp, s3, -1875
                  div          s3, t3, a0
                  c.li         ra, -1
                  sll          s1, s5, s4
                  xori         s5, s1, -178
                  auipc        a3, 855998
                  sra          s7, a0, t2
                  remu         a6, sp, a2
                  sra          zero, a3, s0
                  nop
                  div          gp, zero, s9
                  c.add        t3, t5
                  c.lui        s5, 18
                  c.add        a6, a7
                  c.lui        s9, 7
                  and          a3, a6, a6
                  csrrw        a3, 0x340, s0
                  srai         a2, tp, 17
                  slt          a7, a5, gp
                  c.sub        a3, a5
                  c.andi       a2, 24
                  c.addi4spn   a2, sp, 352
                  csrrci       t2, 0x340, 16
                  sll          t4, s7, s0
                  sub          tp, s11, t3
                  addi         s6, t2, -383
                  csrrs        t1, 0x340, zero
                  slli         a5, a3, 9
                  c.and        a2, s1
                  csrrs        a4, 0x340, zero
                  auipc        s6, 107670
                  mulhu        t1, s4, s2
                  csrrci       t6, 0x340, 18
                  csrrwi       a4, 0x340, 14
                  xori         t1, s8, -1953
                  slt          s4, t5, t6
                  c.and        a4, s1
                  nop
                  csrrwi       a0, 0x340, 12
                  slt          t1, t4, a7
                  c.and        a0, s1
                  auipc        gp, 703127
                  csrrw        t6, 0x340, s6
                  div          t1, s7, s9
                  mulhsu       s6, t4, t0
                  sra          t2, s11, t0
                  c.addi4spn   a3, sp, 688
                  slli         a5, t4, 15
                  xori         t2, s9, 1100
                  csrrwi       s7, 0x340, 26
                  c.addi4spn   a2, sp, 672
                  sll          a4, t3, s4
                  csrrwi       s7, 0x340, 19
                  csrrci       s8, 0x340, 13
                  c.addi4spn   a4, sp, 432
                  csrrs        s10, 0x340, zero
                  c.lui        t0, 30
                  c.addi4spn   a4, sp, 672
                  csrrci       t3, 0x340, 0
                  mulhu        a6, a6, t4
                  csrrc        s3, 0x340, t6
                  csrrw        tp, 0x340, t2
                  sra          t3, ra, t0
                  c.add        t6, t3
                  csrrc        a0, 0x340, zero
                  slti         t5, s5, 966
                  c.slli       t0, 15
                  rem          t2, a7, gp
                  c.xor        a5, s1
                  csrrc        a3, 0x340, zero
                  c.addi       a7, -1
                  ori          s5, t5, -299
                  csrrwi       s7, 0x340, 13
                  and          ra, s10, s2
                  nop
                  rem          s10, s7, s5
                  slti         s9, s0, -1530
                  c.srai       a3, 21
                  addi         a0, zero, 268
                  divu         a4, s9, t1
                  csrrwi       s10, 0x340, 12
                  mulh         a6, s10, s10
                  c.lui        t2, 8
                  srli         s7, a3, 6
                  c.nop
                  sll          tp, ra, a4
                  divu         s8, t3, s8
                  c.sub        a2, a3
                  c.andi       s1, -1
                  c.or         s1, a2
                  c.and        a4, a3
                  andi         t1, a0, -1234
                  csrrsi       sp, 0x340, 0
                  c.addi16sp   sp, 80
                  srai         t5, s2, 10
                  add          s10, s4, t5
                  c.li         t3, -1
                  mulh         s11, t4, a7
                  c.li         a0, 10
                  csrrc        s4, 0x340, zero
                  csrrs        s6, 0x340, zero
                  sra          a6, t4, t2
                  remu         tp, gp, s5
                  csrrw        s6, 0x340, a2
                  c.srli       a4, 10
                  and          s9, t5, zero
                  sll          sp, a3, s8
                  slti         ra, a5, 1823
                  csrrc        t6, 0x340, s9
                  andi         s10, s10, -1999
                  c.lui        s11, 30
                  mul          t6, a7, t4
                  andi         t3, zero, 1499
                  csrrci       a4, 0x340, 15
                  add          s4, s8, s10
                  sltiu        t6, s2, -1410
                  mulhu        s5, gp, ra
                  c.li         s5, 20
                  sltiu        s9, a1, -702
                  c.add        t3, t6
                  c.andi       s1, 14
                  srai         s4, t0, 24
                  srai         gp, s1, 15
                  srli         s7, s6, 18
                  ori          t6, a3, -391
                  slti         tp, a2, 1901
                  sub          s8, s0, ra
                  slt          sp, gp, tp
                  mulhu        a6, s1, sp
                  srli         a5, a2, 9
                  c.addi16sp   sp, 320
                  c.and        a3, a0
                  mulhu        sp, t6, s11
                  sll          s1, t0, a4
                  remu         a3, sp, s11
                  csrrwi       s1, 0x340, 12
                  c.srai       a3, 29
                  csrrwi       gp, 0x340, 4
                  lui          t0, 376875
                  add          t2, tp, t1
                  csrrwi       s6, 0x340, 26
                  c.add        s4, s11
                  mul          t0, a6, t0
                  lui          s8, 682729
                  add          t6, s10, s10
                  c.or         a5, a2
                  c.srli       a2, 26
                  c.sub        a3, a0
                  c.or         a0, s0
                  csrrw        s8, 0x340, a5
                  c.addi4spn   a3, sp, 240
                  c.add        t4, t0
                  csrrsi       t2, 0x340, 21
                  nop
                  csrrsi       t1, 0x340, 0
                  xori         t0, s1, -107
                  c.srai       s1, 27
                  c.addi16sp   sp, -16
                  lui          a7, 213725
                  mulhu        s11, zero, a7
                  mulh         zero, s7, a2
                  sra          s8, s3, t1
                  addi         s1, a7, 1681
                  mul          t3, t3, s2
                  c.li         t0, 12
                  auipc        t0, 821266
                  c.srai       a4, 21
                  mul          s4, t3, s8
                  c.lui        s7, 2
                  c.sub        a4, s1
                  rem          tp, s1, a1
                  c.or         a2, a3
                  auipc        a5, 464086
                  c.addi4spn   a5, sp, 96
                  auipc        a6, 332848
                  csrrw        t0, 0x340, s3
                  xori         tp, s4, -609
                  or           s8, s3, a1
                  nop
                  sltiu        s4, t0, -1192
                  c.add        t5, s3
                  c.add        t3, t1
                  xor          t6, s5, s4
                  nop
                  csrrci       s7, 0x340, 27
                  c.add        a5, s6
                  c.addi4spn   a4, sp, 576
                  csrrc        t0, 0x340, zero
                  ori          s6, t6, 1853
                  div          a5, s3, s9
                  csrrci       t6, 0x340, 0
                  slti         t0, s1, -1749
                  c.srli       a5, 3
                  and          a6, gp, gp
                  c.andi       a2, 14
                  c.xor        a5, a5
                  sra          s3, s8, sp
                  c.mv         s1, t6
                  add          s4, a0, gp
                  ori          s6, gp, -1372
                  or           a6, t4, t4
                  c.add        t4, s5
                  divu         zero, s5, t0
                  srai         s10, s0, 11
                  andi         t6, ra, -1160
                  srl          s3, t6, tp
                  c.and        s1, a5
                  c.srai       a3, 21
                  mulh         a0, a4, s6
                  andi         t3, a1, 409
                  rem          a0, zero, tp
                  xor          gp, s8, zero
                  c.add        ra, t4
                  mul          t3, s11, t5
                  c.andi       a2, -1
                  sltiu        a4, t6, 1455
                  c.or         a5, s1
                  sltiu        a2, s7, -1221
                  c.add        s1, s1
                  slti         s11, a0, -1366
                  c.mv         a7, a5
                  auipc        t6, 128775
                  slt          t5, a6, a7
                  or           a5, a4, s1
                  ori          tp, a3, -115
                  slti         s4, s9, 1994
                  slli         s5, s3, 11
                  c.addi       sp, 11
                  mulhu        s5, a6, a4
                  c.and        a2, a4
                  ori          a3, s10, -1771
                  csrrwi       s9, 0x340, 5
                  c.srli       s1, 1
                  c.add        a4, s1
                  csrrw        t4, 0x340, s11
                  srli         s3, t4, 19
                  c.mv         gp, a2
                  srl          s11, s2, s9
                  sll          t1, t6, s8
                  c.sub        s1, a1
                  srli         t3, t5, 7
                  add          s11, a7, s6
                  ori          ra, ra, 2002
                  c.add        s4, sp
                  c.and        a5, a1
                  c.lui        t3, 23
                  c.addi4spn   a2, sp, 784
                  nop
                  sra          a4, tp, s6
                  c.addi4spn   a0, sp, 928
                  c.lui        s7, 1
                  c.andi       a3, -1
                  sra          a3, a3, s5
                  nop
                  c.or         a3, a4
                  csrrc        a2, 0x340, s6
                  mul          ra, s4, a4
                  divu         s8, t0, s7
                  c.add        sp, s0
                  c.mv         t2, a6
                  csrrwi       s8, 0x340, 1
                  mul          t5, s2, gp
                  csrrsi       t3, 0x340, 10
                  c.mv         s8, s11
                  slli         t3, zero, 7
                  c.sub        s1, a1
                  auipc        a3, 386876
                  sra          a2, a0, ra
                  csrrci       ra, 0x340, 23
                  sltiu        a0, a1, -1922
                  xor          sp, s2, a6
                  mul          t2, s3, s8
                  csrrci       s9, 0x340, 7
                  c.slli       ra, 20
                  andi         a5, a0, 988
                  c.addi4spn   s1, sp, 432
                  sub          s3, s0, gp
                  mulh         t6, a0, t6
                  sltiu        s3, s7, -515
                  csrrc        a6, 0x340, zero
                  xor          a7, tp, s8
                  c.and        a0, a3
                  c.slli       s5, 20
                  remu         zero, t5, a7
                  c.srli       a3, 27
                  c.mv         tp, a3
                  slli         ra, a6, 16
                  c.andi       a5, 22
                  srl          a2, s5, s4
                  rem          t1, s6, sp
                  mulh         t5, s0, t4
                  mul          a6, t0, a1
                  and          t4, t3, a1
                  slt          s3, a5, sp
                  srai         t3, a4, 13
                  add          sp, s0, s0
                  slt          sp, s7, a4
                  csrrwi       t4, 0x340, 22
                  c.andi       s1, 21
                  c.addi       s5, 5
                  auipc        s1, 347454
                  andi         zero, s9, 112
                  mulh         t0, t3, t0
                  divu         s10, s8, s1
                  nop
                  slli         t3, a5, 17
                  c.srai       a5, 22
                  c.slli       t3, 29
                  c.li         s4, -1
                  sll          t0, t2, t0
                  c.srli       a0, 2
                  ori          s6, s8, 669
                  slli         a7, t0, 9
                  srli         t2, gp, 0
                  and          a2, s8, t2
                  c.andi       a3, -1
                  c.and        a4, s1
                  remu         a5, a4, zero
                  c.nop
                  sll          s6, s4, t0
                  rem          s5, a6, s3
                  c.addi4spn   a4, sp, 608
                  xori         a4, t6, -822
                  sltu         t4, t4, s4
                  srl          s10, s0, a3
                  auipc        a4, 237176
                  c.lui        a4, 6
                  c.xor        s1, a0
                  csrrsi       sp, 0x340, 0
                  slti         a3, t0, -1391
                  sub          s4, s4, sp
                  c.nop
                  csrrs        t5, 0x340, s4
                  xor          s3, s6, zero
                  csrrs        s6, 0x340, zero
                  c.srli       a3, 26
                  remu         a4, a3, s0
                  csrrsi       s3, 0x340, 26
                  nop
                  lui          t6, 284863
                  divu         t4, a0, zero
                  csrrs        s4, 0x340, zero
                  xor          t6, a1, t1
                  c.nop
                  c.slli       t2, 7
                  c.xor        a0, a3
                  c.add        s5, t6
                  slli         s4, s11, 19
                  slli         a6, t6, 15
                  srl          t2, tp, zero
                  auipc        s4, 714520
                  mulhu        t0, s11, s0
                  mulhu        zero, gp, s2
                  srli         t1, s1, 4
                  auipc        s7, 386862
                  c.or         a3, a0
                  c.mv         s6, a0
                  mulhu        sp, a6, s7
                  auipc        a7, 476575
                  c.srai       a0, 30
                  sll          s4, a6, a0
                  c.srli       a0, 23
                  c.xor        a5, a2
                  mulhu        a3, t0, a2
                  c.slli       ra, 25
                  c.and        a3, s0
                  add          t1, t0, t3
                  c.xor        a2, a2
                  mul          a2, a2, a4
                  c.andi       a5, 27
                  c.li         tp, -1
                  lui          s1, 723906
                  srai         a2, s0, 3
                  or           t4, t5, a6
                  csrrci       s10, 0x340, 16
                  auipc        s9, 67619
                  ori          a2, t5, 595
                  divu         t2, t3, s5
                  xori         s1, a2, -388
                  sltu         a3, s10, s10
                  c.addi4spn   a0, sp, 112
                  slti         zero, s3, -520
                  csrrsi       s5, 0x340, 0
                  csrrw        t4, 0x340, t1
                  c.nop
                  divu         ra, a4, s1
                  csrrs        s8, 0x340, zero
                  mulh         t1, t4, tp
                  mulhsu       s9, s5, t4
                  or           a5, s3, tp
                  c.srli       a0, 26
                  csrrwi       s4, 0x340, 21
                  remu         a5, s1, t4
                  mulh         s1, s5, gp
                  srl          a5, t4, t6
                  mulh         s11, t1, s10
                  add          zero, t3, s9
                  c.andi       a2, -1
                  nop
                  nop
                  slt          a6, sp, s0
                  srl          a4, ra, s4
                  srl          t0, t4, a3
                  addi         t4, a1, 93
                  mul          t0, t5, a2
                  c.li         t1, 1
                  c.andi       a5, -1
                  sra          ra, s10, t1
                  srai         tp, s7, 30
                  slt          a5, s0, a7
                  srai         s7, t3, 15
                  c.lui        s9, 23
                  c.addi4spn   s1, sp, 144
                  c.li         s4, 21
                  sra          t2, a0, a3
                  sll          a7, s0, s1
                  divu         tp, a1, tp
                  ori          sp, t0, -410
                  srl          t4, t0, s7
                  auipc        a7, 499655
                  mulh         t3, gp, t5
                  c.sub        a4, a0
                  sltu         s7, a3, s1
                  andi         a3, zero, 1344
                  mulhu        s7, a4, s1
                  c.li         sp, 22
                  divu         t4, s3, gp
                  remu         a7, tp, s3
                  csrrc        a3, 0x340, zero
                  c.addi       tp, 25
                  and          gp, a0, a6
                  csrrw        s11, 0x340, s8
                  addi         a5, s8, 1238
                  csrrwi       a4, 0x340, 24
                  c.sub        s1, a1
                  c.and        a2, a1
                  c.li         s5, 31
                  mul          a5, s6, t0
                  or           s11, t1, s3
                  c.xor        a3, a3
                  srl          t5, t4, a5
                  sll          a4, gp, tp
                  mulhsu       s9, a6, s3
                  c.srai       a3, 13
                  sltu         a5, a3, t2
                  ori          t3, s1, -16
                  mulhsu       s11, s7, s2
                  addi         s10, s5, -189
                  slli         a7, ra, 0
                  slt          s4, a5, s11
                  mul          t2, s5, s6
                  c.andi       s1, 8
                  csrrc        a2, 0x340, zero
                  slli         s7, t2, 17
                  c.andi       a0, -1
                  c.and        a2, a1
                  c.nop
                  xori         t3, s8, 1773
                  sltiu        a3, s5, 1068
                  addi         t4, a3, -1685
                  lui          t4, 347359
                  xori         t4, a1, -67
                  mulhsu       ra, s6, s1
                  srl          s3, a2, a2
                  rem          a2, s7, t0
                  csrrwi       s3, 0x340, 24
                  auipc        sp, 581578
                  c.addi       gp, -1
                  mulh         t6, gp, s5
                  mulhsu       t0, gp, a2
                  addi         s9, s3, 298
                  div          a3, s4, a1
                  c.li         t6, -1
                  mul          s10, t2, a7
                  c.srai       s1, 7
                  c.srai       a4, 12
                  c.srli       a4, 15
                  mul          t2, s3, a2
                  slli         zero, s10, 22
                  c.nop
                  c.mv         t2, t2
                  c.add        s7, s10
                  c.li         t4, -1
                  divu         a2, a1, t2
                  add          tp, t1, t0
                  c.lui        s1, 16
                  mulh         zero, tp, sp
                  sub          a4, a3, a3
                  xor          sp, s11, a4
                  csrrsi       s10, 0x340, 14
                  srai         s10, ra, 28
                  csrrci       s11, 0x340, 0
                  addi         s4, a1, 746
                  sltiu        t5, a4, 1260
                  lui          s1, 112526
                  div          s4, tp, zero
                  xori         s4, a5, 1774
                  mulhu        t4, ra, ra
                  xori         s10, s8, -109
                  sltu         s7, s1, s3
                  xor          gp, a3, a3
                  csrrw        s6, 0x340, t2
                  c.add        ra, t0
                  c.li         a4, -1
                  and          t1, a4, t2
                  ori          a0, s1, -1943
                  mulhsu       a7, t3, s9
                  divu         tp, s6, ra
                  and          t0, a5, s3
                  c.xor        a3, a5
                  remu         t4, t1, a3
                  remu         s1, a2, a5
                  xori         s11, a1, 890
                  csrrc        a2, 0x340, a3
                  c.addi16sp   sp, 16
                  csrrs        a2, 0x340, s0
                  mulh         gp, a0, t0
                  remu         s3, s11, a4
                  srai         a3, s1, 18
                  xori         a6, a6, 1406
                  srl          s10, a5, s6
                  c.li         s1, -1
                  csrrwi       a6, 0x340, 12
                  slli         a4, a1, 19
                  c.lui        a7, 26
                  div          s6, ra, a1
                  srl          s8, t4, t0
                  mulhu        t6, a4, t2
                  slli         zero, t6, 11
                  c.or         s1, a3
                  div          gp, zero, t6
                  c.or         a4, a3
                  ori          zero, gp, -653
                  c.nop
                  xor          s10, s9, s4
                  c.srai       a3, 19
                  remu         s6, t3, s6
                  and          s11, zero, a5
                  c.add        a4, a2
                  mulhu        s5, s0, t1
                  nop
                  sll          t2, a4, a3
                  c.lui        gp, 24
                  c.addi       t3, 27
                  c.or         a5, s1
                  csrrs        a5, 0x340, s8
                  c.mv         s7, s9
                  c.srai       a4, 12
                  sub          a0, a0, t6
                  rem          a4, t5, s2
                  mul          t6, sp, a3
                  slt          sp, s4, t0
                  div          s3, s0, s10
                  slt          t0, t1, gp
                  rem          tp, t2, ra
                  sra          a4, t1, gp
                  sltiu        ra, a6, -220
                  sltu         t3, s1, s11
                  csrrw        sp, 0x340, s1
                  csrrc        a7, 0x340, zero
                  ori          s11, tp, -1479
                  c.addi4spn   a2, sp, 448
                  auipc        s9, 277360
                  csrrsi       a6, 0x340, 0
                  or           a5, a1, a4
                  sltu         s6, a3, a7
                  sltiu        s11, t4, 465
                  srai         s7, a5, 21
                  csrrci       s8, 0x340, 6
                  c.xor        a0, a3
                  mul          gp, t0, s4
                  sltu         tp, t1, a7
                  mulhsu       t2, ra, zero
                  slli         s8, t0, 14
                  sra          s4, s0, s10
                  slt          s4, t6, gp
                  divu         a0, sp, s2
                  sll          s3, ra, t0
                  srli         s3, t1, 10
                  c.add        t3, a4
                  div          s3, a6, s8
                  c.and        a0, a3
                  sra          s9, s6, t0
                  c.addi4spn   s1, sp, 1008
                  csrrc        sp, 0x340, a2
                  mulhu        s4, a4, t1
                  sll          t1, a7, t5
                  mul          a5, tp, t1
                  sub          ra, a7, a7
                  csrrs        t3, 0x340, a4
                  rem          a3, t4, t6
                  div          a3, s11, t0
                  nop
                  div          t6, gp, a0
                  c.srai       s1, 24
                  csrrs        s5, 0x340, s2
                  xor          s10, s3, s5
                  csrrwi       s11, 0x340, 12
                  csrrwi       gp, 0x340, 26
                  c.addi       s1, -1
                  csrrc        s4, 0x340, a4
                  add          t1, s4, ra
                  mulhu        tp, t2, s8
                  div          a4, s11, gp
                  sltiu        t3, t6, 1344
                  xori         t3, s8, -1803
                  c.addi16sp   sp, 80
                  csrrw        t5, 0x340, s0
                  c.srai       a5, 29
                  div          tp, t4, a7
                  mulhu        s7, s0, s9
                  sll          s4, a4, s2
                  c.sub        a3, a1
                  c.addi       t1, 22
                  mul          s8, a7, s0
                  sltiu        t1, t0, -1116
                  auipc        a6, 351239
                  csrrci       t6, 0x340, 5
                  remu         s1, t3, a4
                  c.addi16sp   sp, -16
                  c.andi       a0, 4
                  remu         sp, a2, t2
                  divu         t5, ra, s5
                  auipc        a5, 696874
                  csrrwi       t0, 0x340, 15
                  c.xor        a0, a1
                  mulhu        t2, a7, zero
                  xori         s8, s10, 255
                  slti         ra, a7, -1552
                  c.lui        s6, 8
                  c.andi       a0, 17
                  csrrci       a5, 0x340, 3
                  srl          s3, s7, t0
                  c.addi       gp, -1
                  c.addi4spn   s1, sp, 80
                  c.srli       a4, 15
                  csrrci       a2, 0x340, 0
                  mulhsu       s9, s9, a3
                  mulh         s8, s3, s4
                  ori          a3, s2, 1499
                  c.lui        s10, 30
                  add          t3, tp, t0
                  xor          t3, s7, ra
                  mulhsu       t6, s6, a3
                  sub          a4, s10, s11
                  c.xor        a0, a4
                  c.slli       t3, 1
                  nop
                  ori          t5, a2, 819
                  c.add        s4, sp
                  mul          s11, s7, tp
                  mulh         s7, s3, a4
                  csrrs        s10, 0x340, t6
                  remu         ra, a6, s5
                  csrrsi       a7, 0x340, 29
                  c.addi       tp, 5
                  csrrs        s11, 0x340, a4
                  c.add        ra, s1
                  add          tp, t0, a3
                  csrrc        s6, 0x340, zero
                  divu         s4, s5, s4
                  nop
                  csrrs        s5, 0x340, zero
                  sub          a3, s7, gp
                  add          s8, zero, t2
                  and          s9, t0, a0
                  c.addi16sp   sp, 320
                  divu         a7, s6, sp
                  sltiu        s10, s8, 544
                  xori         t4, s5, -227
                  c.and        a0, a5
                  mulhsu       t5, t6, s2
                  c.li         s3, -1
                  csrrc        s10, 0x340, t4
                  c.mv         t4, a2
                  csrrc        a6, 0x340, zero
                  sub          s9, t0, t0
                  nop
                  andi         a2, s2, -51
                  ori          s3, t4, 96
                  nop
                  c.addi       a7, 25
                  slt          s11, ra, s6
                  c.add        t2, s2
                  sltu         a5, tp, t2
                  csrrc        t3, 0x340, t3
                  sltu         gp, s3, a5
                  ori          gp, tp, -1888
                  andi         a4, tp, 1701
                  remu         s3, s4, t4
                  c.sub        a0, a1
                  c.li         a7, -1
                  c.addi       s7, -1
                  divu         s8, s7, s5
                  mul          gp, s1, a7
                  c.xor        a5, a5
                  c.addi       a7, -1
                  mulhsu       a4, s9, s11
                  mulh         t3, s10, s7
                  c.addi       t6, 4
                  mulhsu       ra, a5, tp
                  c.li         a3, 9
                  remu         a0, t0, a7
                  sll          s5, t4, s11
                  sra          a6, s6, s2
                  divu         a4, sp, t3
                  c.sub        a2, a0
                  c.srli       a3, 3
                  sll          a4, tp, a1
                  c.nop
                  slli         t4, t4, 15
                  xor          t0, a4, tp
                  divu         a0, s2, a2
                  c.sub        a3, a0
                  c.li         tp, -1
                  or           s1, a7, s7
                  and          a3, s7, ra
                  div          s11, s1, a0
                  slli         a6, s4, 11
                  srai         a5, t0, 22
                  mul          t3, gp, t2
                  div          a2, a4, t0
                  c.andi       a4, 28
                  divu         a4, s10, t2
                  c.srai       a2, 29
                  slti         gp, a4, 1635
                  c.lui        tp, 26
                  remu         s11, t3, tp
                  c.sub        a5, a5
                  sub          t3, s2, ra
                  remu         a2, s5, s8
                  c.srli       a0, 29
                  c.li         s7, -1
                  sll          a3, s2, a0
                  div          a7, t1, a7
                  add          t6, s2, s6
                  c.lui        a6, 16
                  c.nop
                  csrrc        t0, 0x340, zero
                  or           a5, t5, sp
                  or           tp, a5, s4
                  divu         s3, t2, s3
                  ori          tp, s7, -1412
                  xor          zero, t0, a4
                  c.li         a3, 8
                  remu         zero, s1, a6
                  c.add        sp, a5
                  c.lui        a7, 10
                  mulh         s7, t6, s11
                  andi         ra, t1, -1777
                  sll          t2, t3, s9
                  nop
                  c.addi16sp   sp, -16
                  add          a0, a7, a5
                  c.slli       tp, 30
                  c.andi       a3, 28
                  csrrw        s9, 0x340, a0
                  c.sub        a3, a2
                  c.mv         t5, s4
                  sltu         ra, s2, s10
                  mulhu        zero, a4, a4
                  c.addi16sp   sp, -16
                  xor          s7, a1, zero
                  sra          a3, t6, ra
                  divu         s9, ra, s1
                  csrrsi       s10, 0x340, 0
                  and          t2, s4, s5
                  c.addi       a3, 18
                  c.addi       sp, -1
                  div          s8, gp, s10
                  slti         s6, t2, -222
                  c.nop
                  remu         t3, t6, s0
                  mul          ra, gp, s5
                  slt          a5, a2, zero
                  srl          a0, s0, s8
                  c.sub        a0, a0
                  c.andi       a0, -1
                  nop
                  csrrsi       tp, 0x340, 26
                  c.and        a5, s0
                  c.or         a4, a4
                  c.and        a4, a2
                  ori          s9, a1, -1365
                  divu         a5, s1, s2
                  auipc        t0, 503429
                  xori         gp, s8, 1540
                  srl          a4, s8, gp
                  slli         t5, s0, 3
                  addi         s3, s6, 1520
                  or           s11, t5, t1
                  csrrw        a3, 0x340, gp
                  sll          gp, s4, s7
                  lui          a0, 903518
                  c.nop
                  c.mv         s8, t3
                  mulhsu       s5, a2, s8
                  addi         a3, s5, -1251
                  andi         s3, a2, -928
                  csrrc        s8, 0x340, s2
                  csrrsi       gp, 0x340, 9
                  srai         t2, a5, 24
                  add          t1, a0, s6
                  csrrw        a6, 0x340, t0
                  c.addi       s3, 2
                  mulhu        s1, s5, s0
                  xor          s7, s6, s4
                  csrrs        t0, 0x340, zero
                  c.addi16sp   sp, 352
                  remu         gp, tp, sp
                  andi         t3, s7, 459
                  xor          t6, s11, gp
                  rem          ra, t2, s4
                  lui          s8, 729879
                  c.slli       a2, 12
                  c.srli       a0, 16
                  csrrwi       t0, 0x340, 14
                  xori         s11, s5, 317
                  mulh         s7, s4, s9
                  c.lui        t2, 31
                  slti         s1, s10, 590
                  c.mv         t5, a4
                  csrrwi       a6, 0x340, 16
                  mul          a7, a4, a5
                  srli         s5, t2, 22
                  mulhu        sp, s11, zero
                  c.xor        s1, a3
                  srli         s5, a4, 20
                  nop
                  remu         t5, s5, s5
                  c.andi       a3, -1
                  c.srai       a3, 11
                  lui          a2, 217730
                  sub          a5, s2, t1
                  mulhsu       s1, gp, a0
                  addi         a6, a3, -889
                  or           s8, a2, t1
                  srli         t4, tp, 29
                  c.sub        a4, a5
                  nop
                  slt          s3, gp, a3
                  csrrw        t6, 0x340, a1
                  c.addi       sp, -1
                  csrrwi       a5, 0x340, 7
                  c.add        s1, s7
                  c.xor        a3, a1
                  c.and        a5, a3
                  or           a4, s8, s2
                  c.lui        a2, 15
                  mul          a6, a7, s8
                  mul          a2, s5, s9
                  mulhu        s8, a4, a1
                  mulh         a3, s3, t5
                  c.or         s1, a3
                  ori          t3, a5, 596
                  sub          gp, ra, a1
                  c.andi       a0, -1
                  c.li         s1, 14
                  mulhsu       a7, a5, a2
                  sll          t0, a5, t3
                  c.andi       s1, -1
                  nop
                  c.nop
                  c.addi16sp   sp, 496
                  c.or         a5, a0
                  add          tp, s3, s5
                  slti         t2, s6, -1801
                  csrrs        t5, 0x340, t1
                  c.li         a2, 12
                  sra          t4, gp, t4
                  c.addi       t5, 12
                  c.and        a2, s1
                  mulhu        tp, s4, ra
                  c.sub        a0, s1
                  addi         t1, a2, 562
                  or           sp, s4, sp
                  and          a6, s5, a5
                  c.lui        t3, 4
                  sub          s9, t4, s9
                  or           zero, s5, a7
                  srai         s11, sp, 29
                  csrrw        s8, 0x340, s3
                  c.addi4spn   a3, sp, 992
                  addi         t1, s1, 1559
                  slli         sp, ra, 30
                  csrrci       t6, 0x340, 0
                  slt          s10, a5, s2
                  sub          s9, t3, s0
                  c.nop
                  slt          a2, a2, s11
                  xori         a0, s6, 795
                  mulhsu       s4, t6, t2
                  auipc        a4, 80150
                  csrrci       t0, 0x340, 0
                  remu         a0, tp, a3
                  c.addi16sp   sp, 496
                  srli         s5, s1, 25
                  c.sub        a5, a0
                  divu         a6, s4, s6
                  c.or         a0, a2
                  mulh         zero, zero, s0
                  csrrs        a2, 0x340, zero
                  srl          t2, s0, a7
                  divu         ra, a6, t4
                  auipc        sp, 444
                  c.or         a4, a2
                  rem          s10, t6, ra
                  srl          a5, a1, a0
                  remu         s3, t2, s7
                  csrrci       t6, 0x340, 12
                  mul          zero, a0, a1
                  sub          t4, a0, s10
                  remu         s5, tp, a2
                  srai         s1, gp, 10
                  andi         s6, a6, 1527
                  sll          sp, s2, a7
                  slt          a2, s1, s1
                  divu         s7, t1, s8
                  addi         s3, a4, 1998
                  c.nop
                  div          s9, a7, s2
                  or           s6, t2, ra
                  andi         sp, s8, -1995
                  c.or         a5, a4
                  csrrwi       a6, 0x340, 16
                  c.srai       a2, 28
                  srl          s6, a5, a3
                  c.lui        s9, 12
                  csrrs        t0, 0x340, tp
                  c.lui        s8, 25
                  addi         a4, s0, 405
                  xori         s11, t1, 646
                  addi         t6, s3, 1068
                  c.sub        a4, a5
                  csrrwi       tp, 0x340, 10
                  c.addi       a2, 8
                  c.nop
                  srl          s11, gp, s1
                  lui          a2, 599525
                  c.and        a0, a4
                  sltiu        s3, a0, 1774
                  add          zero, t0, t3
                  sltiu        tp, a4, -616
                  c.addi       s5, -1
                  slli         s6, zero, 16
                  c.srli       a4, 24
                  c.xor        a3, s1
                  mulh         t2, tp, s3
                  csrrs        t0, 0x340, zero
                  mulhu        t6, t1, ra
                  srai         s7, s11, 27
                  c.srli       a4, 12
                  c.mv         t6, t3
                  mulhsu       t0, t1, s6
                  c.addi4spn   a5, sp, 784
                  div          s10, ra, a2
                  sltiu        t5, tp, -1607
                  slli         a5, ra, 25
                  rem          a5, a2, ra
                  xori         a6, s4, -1333
                  rem          ra, s7, s0
                  rem          a5, s9, s3
                  xori         gp, zero, -1533
                  mulh         a0, a3, s1
                  sll          t2, gp, s5
                  or           a4, t5, s11
                  csrrc        s5, 0x340, zero
                  mulh         t4, s5, t6
                  lui          s9, 170143
                  c.slli       s8, 27
                  xori         t0, a0, -1653
                  csrrsi       sp, 0x340, 0
                  c.nop
                  sltu         s5, tp, s4
                  andi         s1, t0, -1290
                  c.and        a0, a2
                  c.srai       a4, 8
                  c.and        a2, a4
                  mulhsu       gp, a2, a5
                  c.addi16sp   sp, 400
                  sub          a7, zero, s3
                  csrrc        s9, 0x340, zero
                  slti         t0, s3, -965
                  slti         t5, t3, -780
                  c.xor        s1, a3
                  or           t1, t2, a6
                  sltiu        a2, s1, -651
                  c.lui        s9, 10
                  c.addi4spn   a2, sp, 800
                  c.srai       a3, 16
                  c.and        a5, s1
                  lui          s8, 963836
                  nop
                  addi         gp, gp, -1319
                  c.lui        s3, 2
                  add          tp, a0, s11
                  mul          a5, t6, a4
                  c.sub        a2, s1
                  c.addi4spn   s1, sp, 560
                  mulhu        s9, s6, s10
                  c.andi       s1, -1
                  srl          a5, a4, a5
                  remu         a4, t2, a0
                  c.add        t2, s11
                  divu         s7, t6, s0
                  xor          s8, a5, t2
                  srl          t3, t3, gp
                  xori         a2, a6, -271
                  c.xor        a5, s1
                  remu         t1, a7, a3
                  sltu         a3, s11, sp
                  nop
                  csrrci       a5, 0x340, 0
                  c.lui        s9, 2
                  or           sp, t1, a3
                  lui          s5, 279987
                  srli         t4, s9, 27
                  nop
                  sltiu        t0, s9, 1714
                  and          s4, s9, s11
                  csrrsi       a7, 0x340, 30
                  c.addi16sp   sp, 416
                  c.srai       a0, 6
                  slti         a4, zero, -797
                  divu         s9, t0, s8
                  csrrci       t0, 0x340, 9
                  c.andi       s1, 20
                  srl          a3, s5, a4
                  addi         t5, s2, 1647
                  c.addi4spn   a0, sp, 240
                  div          zero, s9, a1
                  csrrwi       t3, 0x340, 10
                  c.addi4spn   a3, sp, 640
                  slt          t1, s4, a6
                  or           ra, t1, a3
                  slli         s4, ra, 28
                  auipc        s10, 842103
                  c.or         a5, a2
                  c.and        a5, a2
                  c.li         ra, 13
                  andi         t2, s9, 235
                  c.li         t5, -1
                  srl          a0, zero, t3
                  sra          t2, s8, s9
                  rem          a4, s7, a2
                  c.add        s1, t3
                  addi         a4, a1, -193
                  c.srli       s1, 28
                  csrrc        gp, 0x340, s10
                  sub          t2, a6, s5
                  rem          t4, s2, a0
                  slt          t3, a6, a6
                  c.addi4spn   s1, sp, 576
                  c.and        a2, a2
                  c.addi16sp   sp, -16
                  nop
                  c.slli       t5, 20
                  mul          t2, t2, t3
                  auipc        a5, 1042069
                  c.slli       s5, 21
                  csrrci       gp, 0x340, 25
                  c.srli       a2, 31
                  c.add        a5, s9
                  csrrwi       s9, 0x340, 1
                  xor          a5, s8, s11
                  csrrsi       ra, 0x340, 0
                  mul          s11, a3, t0
                  sltu         s3, t4, s4
                  c.srai       a4, 5
                  csrrwi       a7, 0x340, 26
                  ori          s11, s10, 1808
                  c.addi       ra, -1
                  sltiu        a3, s3, -230
                  c.and        a5, a2
                  csrrwi       t0, 0x340, 17
                  divu         a4, t1, s9
                  divu         a0, a0, s4
                  csrrc        s9, 0x340, zero
                  slli         t3, a5, 31
                  sltiu        a2, s10, 918
                  rem          t0, t6, t3
                  c.and        a0, a4
                  mulhu        a4, a1, s2
                  c.srai       a0, 25
                  c.lui        s1, 17
                  c.or         a3, s1
                  div          s4, t1, t3
                  c.or         a4, a1
                  srli         s4, a6, 8
                  xor          s8, a5, t4
                  add          s10, a6, a5
                  c.nop
                  sra          tp, t5, t1
                  add          s10, s10, t2
                  srli         t3, s5, 13
                  c.lui        a3, 22
                  xor          s7, zero, t3
                  c.sub        a4, s0
                  slti         a7, a6, 1011
                  c.andi       a2, 30
                  srli         s11, t2, 27
                  remu         a7, s6, s1
                  sll          a5, s2, tp
                  c.andi       a3, -1
                  c.addi16sp   sp, 96
                  c.nop
                  c.sub        a2, s0
                  auipc        a2, 474455
                  c.addi4spn   a0, sp, 976
                  c.or         a4, s1
                  srli         s7, s8, 7
                  c.xor        a2, a1
                  ori          t5, t3, 1047
                  add          gp, t2, s3
                  c.nop
                  mul          a0, s2, a5
                  c.mv         t0, s3
                  csrrc        s11, 0x340, zero
                  and          a4, t4, gp
                  sll          s9, t1, t0
                  c.srai       s1, 25
                  csrrwi       s5, 0x340, 4
                  xori         a4, a0, -444
                  slti         s6, s4, -62
                  mulhu        a0, ra, s7
                  c.srai       a5, 22
                  auipc        s5, 124177
                  mulhsu       t6, a3, s8
                  srli         gp, t5, 24
                  div          s9, a5, s7
                  csrrsi       t5, 0x340, 5
                  auipc        tp, 511677
                  sltu         s5, s6, s4
                  rem          zero, t4, s5
                  remu         a7, s3, zero
                  andi         t6, s7, -1321
                  sub          tp, t3, t1
                  sltiu        tp, s2, 291
                  c.or         s1, s1
                  andi         t0, a2, -1067
                  sll          s1, a2, s11
                  srli         a7, a4, 21
                  ori          tp, a6, 1343
                  c.nop
                  divu         a2, a7, t3
                  c.slli       ra, 23
                  c.add        s6, t1
                  divu         a7, ra, t3
                  c.srli       a2, 12
                  c.or         s1, a3
                  sra          sp, t0, sp
                  mulh         a7, t5, ra
                  srai         s3, s11, 30
                  c.srai       a3, 9
                  sltiu        a7, s0, -534
                  c.or         a2, s1
                  add          t2, tp, a2
                  xor          s3, s10, s4
                  sltiu        t4, a2, 2012
                  div          t0, t0, s6
                  c.add        sp, t3
                  sub          s4, s3, sp
                  addi         a6, t2, -706
                  c.addi16sp   sp, 192
                  c.or         a0, a2
                  c.addi16sp   sp, -16
                  xor          t2, t4, s6
                  mul          zero, a5, a3
                  c.nop
                  lui          t3, 730272
                  c.andi       s1, 18
                  csrrc        a7, 0x340, s6
                  xori         s3, t6, 1864
                  c.addi       a4, -1
                  divu         a2, sp, a2
                  and          a5, s7, a2
                  addi         a7, zero, 849
                  c.addi16sp   sp, 80
                  auipc        s3, 120067
                  c.mv         a6, t2
                  c.addi4spn   a2, sp, 752
                  csrrs        a3, 0x340, zero
                  c.li         s9, -1
                  rem          s6, a5, tp
                  csrrc        s9, 0x340, zero
                  c.andi       a4, -1
                  or           s3, zero, a3
                  srl          a0, a4, s3
                  mulhu        s6, s11, sp
                  rem          s6, a4, tp
                  c.lui        a7, 29
                  slti         s3, s3, -1182
                  csrrc        gp, 0x340, zero
                  rem          t5, t0, s3
                  mulhu        s3, a4, ra
                  c.addi16sp   sp, -16
                  c.sub        a4, a1
                  rem          t5, s7, a6
                  c.sub        a0, s0
                  c.addi16sp   sp, 240
                  c.mv         a6, s8
                  csrrsi       a4, 0x340, 0
                  csrrwi       s5, 0x340, 8
                  sra          s4, a0, s8
                  srai         s7, t4, 15
                  remu         s9, s5, t6
                  c.addi16sp   sp, 112
                  slli         s3, t6, 15
                  sub          s11, ra, a7
                  mulhsu       a7, t4, s11
                  c.andi       s1, 27
                  slli         s7, a6, 5
                  c.andi       s1, 17
                  remu         a6, t6, s7
                  sltiu        s11, t3, 139
                  slti         s5, a2, 1827
                  sltiu        t4, s0, 538
                  mul          t0, s8, t6
                  c.addi       s6, -1
                  c.nop
                  c.srai       a3, 1
                  slti         s10, a1, 857
                  sltu         sp, t5, s7
                  csrrc        s5, 0x340, zero
                  c.nop
                  and          s3, t0, s2
                  c.andi       a3, 9
                  sra          s4, t5, a2
                  c.and        a3, s0
                  csrrc        t2, 0x340, a4
                  rem          ra, a6, t0
                  srai         s10, a1, 15
                  rem          s4, s4, s0
                  c.slli       s4, 18
                  c.li         a3, 15
                  remu         a6, gp, s8
                  c.addi       a0, 24
                  mul          a4, s8, ra
                  add          s7, s3, a7
                  c.srai       a3, 13
                  div          t3, a2, a1
                  nop
                  c.addi16sp   sp, -16
                  c.slli       a3, 25
                  c.slli       s4, 5
                  c.slli       s9, 11
                  srai         s5, a0, 18
                  rem          a7, s6, s3
                  c.srai       a0, 14
                  sltu         s8, a0, sp
                  xori         t6, t6, 309
                  add          sp, s3, t0
                  mulhsu       s6, s10, a3
                  mulh         a3, s2, s10
                  and          a4, s9, s6
                  lui          s1, 720503
                  c.addi       t1, 14
                  c.sub        a0, a0
                  c.or         a4, a5
                  csrrw        a3, 0x340, s9
                  csrrs        s11, 0x340, s2
                  sltu         a3, a3, a3
                  slli         s4, a1, 21
                  c.mv         t3, t6
                  c.slli       a3, 10
                  csrrsi       a6, 0x340, 0
                  c.andi       a5, 29
                  c.srli       a3, 11
                  xori         a6, ra, -564
                  c.or         s1, s0
                  remu         s9, a2, s0
                  remu         t6, s7, a1
                  slt          a0, ra, t4
                  c.nop
                  slt          zero, t4, a0
                  sltu         t6, t0, a3
                  c.nop
                  csrrs        t4, 0x340, zero
                  csrrs        a7, 0x340, s5
                  addi         t4, s9, 118
                  nop
                  c.nop
                  c.xor        s1, a5
                  c.addi4spn   a3, sp, 304
                  auipc        t2, 449299
                  xor          t3, s4, gp
                  nop
                  slt          s5, a7, t4
                  rem          zero, a5, tp
                  c.addi4spn   a3, sp, 416
                  sub          t5, s4, t1
                  mul          a3, a3, a3
                  auipc        s4, 649148
                  rem          a7, t4, a4
                  divu         s6, a4, gp
                  and          a3, s9, s1
                  mulhsu       a3, a6, a7
                  c.sub        a3, a1
                  remu         t6, s9, t2
                  or           s8, t4, a2
                  sra          t4, s4, s8
                  slti         a5, sp, 1287
                  c.andi       a2, 2
                  csrrci       a5, 0x340, 31
                  slt          a2, a4, s0
                  c.and        a3, a1
                  csrrw        a2, 0x340, zero
                  lui          t6, 149648
                  ori          a4, s8, 54
                  mul          a3, t6, s10
                  xori         t5, a4, 1540
                  c.li         s1, -1
                  slt          s8, t5, a3
                  csrrwi       t1, 0x340, 27
                  c.and        a5, s0
                  divu         ra, a3, zero
                  csrrwi       zero, 0x340, 1
                  andi         zero, t3, -1540
                  mulhsu       s5, t5, zero
                  andi         s3, sp, 1367
                  or           a2, t1, a5
                  c.mv         a4, s6
                  csrrc        tp, 0x340, t2
                  slt          s9, tp, t3
                  c.add        t0, gp
                  c.mv         a3, a4
                  sub          t2, ra, a6
                  sub          s1, t1, s9
                  csrrc        s10, 0x340, zero
                  c.and        s1, a3
                  ori          t6, t0, 1839
                  slt          s9, t3, a6
                  srli         a3, ra, 8
                  c.xor        s1, a0
                  or           s9, a2, t4
                  sll          sp, s3, a1
                  c.nop
                  mul          s6, sp, a2
                  srl          a2, a7, s3
                  xor          t6, ra, a2
                  lui          t2, 492619
                  c.mv         s10, a7
                  auipc        s11, 512094
                  c.addi16sp   sp, -16
                  andi         s1, s4, -14
                  rem          s1, t2, a3
                  srl          t1, t0, tp
                  c.or         a4, s1
                  slti         a0, a3, -1366
                  csrrwi       s9, 0x340, 12
                  and          a7, t5, ra
                  sll          a7, t2, zero
                  c.li         t1, 29
                  c.xor        a3, a1
                  c.addi4spn   a3, sp, 672
                  c.nop
                  divu         gp, t0, a7
                  srli         t3, a7, 6
                  c.li         a2, -1
                  c.srli       a4, 3
                  c.srli       a5, 10
                  c.and        a0, s1
                  sltu         s7, ra, t3
                  c.add        t1, t5
                  and          a2, s7, a2
                  xori         s11, t4, -221
                  remu         t4, s2, s0
                  c.and        a3, a1
                  c.lui        t4, 30
                  div          a7, t6, s6
                  ori          a3, s4, -235
                  xori         s5, a3, 792
                  slt          s1, tp, a2
                  c.srli       s1, 24
                  addi         a2, t1, 1751
                  srli         s10, s8, 5
                  rem          s7, s1, ra
                  mul          t2, tp, gp
                  c.addi       a7, 20
                  sltiu        a6, a6, -423
                  mulhu        t2, a3, tp
                  sll          t2, s6, s8
                  sll          zero, t5, s2
                  mulh         a2, a4, t3
                  csrrsi       s11, 0x340, 0
                  or           s1, a5, a0
                  c.srli       a5, 10
                  csrrci       a4, 0x340, 13
                  xor          s10, a5, s3
                  divu         a3, t2, s7
                  c.andi       a4, -1
                  c.nop
                  slt          t5, s2, zero
                  nop
                  auipc        s5, 97360
                  rem          s4, s6, a3
                  mul          t3, t6, t3
                  xori         t6, s6, 367
                  mul          t0, ra, s11
                  mul          sp, t1, s8
                  div          sp, s2, s7
                  mul          a0, s11, t5
                  csrrsi       t6, 0x340, 9
                  csrrc        a5, 0x340, zero
                  xori         tp, a3, -1696
                  c.addi16sp   sp, -16
                  slti         t5, s10, 905
                  csrrsi       zero, 0x340, 0
                  c.nop
                  slli         s6, a3, 13
                  c.srai       a2, 31
                  mulhsu       s5, a6, a2
                  sra          t2, ra, a2
                  div          s9, s7, tp
                  c.xor        a5, a0
                  c.lui        tp, 14
                  c.andi       a5, -1
                  nop
                  csrrw        s1, 0x340, t5
                  slti         t3, a6, -854
                  sltiu        t1, s0, -1839
                  srai         s10, a0, 25
                  slti         s4, s6, -965
                  csrrsi       s6, 0x340, 0
                  remu         a2, s10, t1
                  slti         t2, s10, -1302
                  ori          tp, a5, -1782
                  sll          s6, s5, s10
                  lui          s7, 487791
                  ori          a6, s5, 415
                  c.addi       gp, 9
                  andi         zero, t3, 1622
                  rem          zero, s8, s2
                  srl          ra, t5, zero
                  srl          s5, s4, t4
                  c.addi4spn   a3, sp, 656
                  c.add        s10, gp
                  c.li         tp, -1
                  divu         a4, gp, s2
                  auipc        a7, 919877
                  xori         t3, s1, -134
                  c.addi       s3, -1
                  ori          a0, t2, 1488
                  c.addi16sp   sp, -16
                  c.addi16sp   sp, -16
                  auipc        s3, 898502
                  csrrc        s3, 0x340, s8
                  c.xor        a4, s1
                  slli         a6, a4, 11
                  auipc        t0, 30329
                  mulh         s5, t1, a7
                  slt          s5, t3, a0
                  c.nop
                  mulhsu       t5, t3, a6
                  c.mv         t0, t4
                  c.slli       s8, 21
                  slti         a4, s0, 1641
                  c.addi       s7, -1
                  c.add        s5, s10
                  srl          sp, a5, a5
                  mulhsu       a6, s4, a3
                  slti         s10, s2, 212
                  c.addi4spn   a0, sp, 1008
                  rem          a7, s4, s3
                  lui          t5, 114360
                  mulh         a3, t5, s9
                  add          a7, s4, s4
                  sltu         gp, s11, t4
                  sub          a0, ra, t6
                  c.sub        a0, s1
                  srai         s1, gp, 23
                  csrrsi       s10, 0x340, 9
                  slli         t0, s2, 0
                  xor          a6, a0, s9
                  sra          t5, s10, t4
                  c.addi16sp   sp, -16
                  nop
                  slli         t0, t3, 6
                  and          s1, a0, a6
                  c.add        a3, s5
                  or           a5, t6, s11
                  or           s5, s1, s10
                  auipc        s9, 608130
                  srl          a5, zero, t2
                  c.addi4spn   a4, sp, 1008
                  slti         s6, tp, -1948
                  addi         a2, a5, -1310
                  slli         t6, s4, 8
                  c.sub        a0, a2
                  csrrc        gp, 0x340, s5
                  sltiu        s5, s9, -123
                  addi         s8, a1, 1618
                  c.lui        a4, 13
                  c.slli       s9, 14
                  andi         tp, s8, 1402
                  sltu         s8, zero, s8
                  c.andi       s1, 7
                  andi         s10, tp, -1166
                  c.and        a3, a2
                  div          t2, zero, s9
                  rem          tp, s1, t1
                  mulhsu       s3, a0, s7
                  c.srai       a5, 18
                  c.mv         t4, t4
                  and          a3, a0, s0
                  c.srli       a4, 25
                  sub          s9, t0, s0
                  c.slli       a0, 15
                  c.or         a0, a4
                  slti         t6, gp, -647
                  csrrc        zero, 0x340, zero
                  addi         t1, a2, -574
                  sra          t1, a0, gp
                  rem          s8, t6, tp
                  remu         a6, t0, s0
                  and          sp, t1, s8
                  sub          a4, a4, s7
                  lui          tp, 1036005
                  c.sub        s1, s1
                  sub          s11, a6, t6
                  c.slli       sp, 19
                  c.andi       a2, -1
                  c.li         s9, 1
                  remu         a4, a0, t0
                  mulhu        t5, ra, zero
                  c.srli       s1, 14
                  csrrs        a6, 0x340, s9
                  add          t5, t4, s0
                  add          t1, a5, a0
                  or           s3, s8, s0
                  xor          s7, a5, tp
                  slt          t6, a3, t1
                  div          s5, s4, s9
                  c.add        s6, a1
                  slti         s7, t3, -1514
                  and          tp, a3, s9
                  c.sub        a3, a0
                  div          a7, a0, a1
                  csrrs        s6, 0x340, zero
                  srai         t6, a1, 17
                  slti         s10, s4, 2036
                  c.mv         s6, a4
                  mulh         s9, t6, t0
                  rem          a5, t5, a2
                  andi         a7, t0, -1087
                  sra          t2, a2, s3
                  or           t1, s11, a1
                  c.addi       a0, -1
                  slti         t5, t6, -637
                  c.srli       a3, 31
                  c.xor        a4, a5
                  csrrs        s6, 0x340, zero
                  div          a4, a3, t4
                  mulhsu       t1, a6, s6
                  sll          tp, t3, t6
                  c.addi       a7, -1
                  mul          t4, a6, a6
                  xori         ra, a4, 1517
                  sub          t5, a5, a7
                  c.nop
                  lui          s5, 657716
                  sra          sp, a3, s7
                  xor          s1, gp, zero
                  srl          s3, sp, t3
                  slti         t3, t6, -136
                  mulhu        t1, t4, s1
                  slt          gp, a1, s0
                  sltiu        s5, t4, -1177
                  c.addi16sp   sp, -16
                  c.and        s1, s1
                  ori          t6, zero, -373
                  c.or         a3, a1
                  mulhu        a6, t5, s11
                  add          t1, t5, a1
                  csrrsi       a6, 0x340, 27
                  sll          tp, s10, a6
                  slli         s5, t4, 28
                  auipc        s4, 264503
                  c.andi       s1, 30
                  c.mv         s11, s9
                  srl          sp, a7, s4
                  csrrw        zero, 0x340, s1
                  c.slli       a6, 14
                  c.nop
                  c.addi       t1, 22
                  or           s10, t4, a2
                  c.add        a3, s10
                  c.xor        a4, a2
                  c.addi16sp   sp, 208
                  mulh         s11, tp, s5
                  srl          t0, a3, s0
                  slti         a2, a6, -1283
                  slti         t0, a7, 500
                  add          s3, s8, s0
                  c.addi4spn   a4, sp, 928
                  csrrci       a2, 0x340, 19
                  divu         s3, t3, s4
                  addi         tp, t0, -679
                  c.srli       a3, 9
                  csrrw        a0, 0x340, a5
                  mulh         a4, a5, s2
                  remu         a4, t4, t0
                  sll          tp, s2, s2
                  c.addi       t3, -1
                  and          s8, sp, t6
                  c.or         a5, a0
                  c.andi       s1, -1
                  c.or         a2, a3
                  csrrci       t6, 0x340, 0
                  c.sub        s1, a5
                  c.addi4spn   a5, sp, 720
                  c.xor        a5, a5
                  csrrs        a4, 0x340, s11
                  srl          a0, t2, s3
                  c.and        a4, s0
                  or           a7, s4, a6
                  c.xor        a5, a0
                  lui          s10, 226836
                  csrrwi       t4, 0x340, 13
                  add          s10, a1, t6
                  or           s9, tp, sp
                  andi         a3, t6, 1958
                  auipc        a0, 656730
                  mul          a6, t6, s0
                  csrrs        t4, 0x340, zero
                  addi         a2, s7, 618
                  c.srli       a5, 26
                  sltu         sp, gp, s0
                  auipc        s6, 512719
                  csrrs        t0, 0x340, t6
                  mulh         t2, ra, gp
                  c.srai       a0, 20
                  and          s11, a1, s5
                  srli         tp, gp, 4
                  mul          s7, t3, gp
                  xor          a0, s1, tp
                  sub          s11, a7, a6
                  sltu         t0, sp, a5
                  c.srai       a3, 16
                  c.slli       a3, 21
                  csrrc        t3, 0x340, t3
                  srl          s10, s3, t2
                  add          s1, s5, t0
                  c.or         a0, a1
                  add          a3, s5, gp
                  c.li         tp, -1
                  c.lui        a0, 31
                  mul          s6, t5, t4
                  srl          a7, s0, a4
                  c.mv         s8, ra
                  c.li         t5, -1
                  slli         s5, s7, 3
                  addi         ra, gp, 1701
                  add          t1, a5, a0
                  divu         a2, s6, sp
                  slti         t0, s9, 244
                  c.nop
                  c.nop
                  c.sub        a5, s0
                  xor          s11, s10, s10
                  srai         tp, s9, 29
                  csrrs        a7, 0x340, s11
                  nop
                  or           t2, a6, s5
                  c.mv         s9, s1
                  divu         ra, s7, a4
                  lui          a3, 901227
                  c.andi       a0, -1
                  c.or         a0, s1
                  div          t0, s1, t6
                  c.lui        s8, 3
                  c.xor        a5, a1
                  mul          t3, a5, a3
                  c.srai       s1, 17
                  csrrc        s5, 0x340, zero
                  sltu         s8, a5, a0
                  c.li         a0, 31
                  slt          a7, a6, s7
                  divu         s4, t4, a3
                  srai         a2, s4, 4
                  c.sub        a4, s0
                  c.addi4spn   a5, sp, 832
                  c.li         a0, -1
                  ori          s9, t6, -72
                  csrrci       s11, 0x340, 19
                  and          tp, t0, zero
                  andi         t4, t5, -359
                  c.addi16sp   sp, 144
                  csrrsi       s6, 0x340, 0
                  c.addi16sp   sp, -16
                  c.xor        a3, a5
                  c.li         t6, -1
                  c.sub        s1, s0
                  xor          s9, t4, a7
                  mulhsu       t4, s1, t1
                  addi         a3, s6, 616
                  srai         zero, s10, 27
                  slti         a7, a4, 1009
                  c.mv         s5, s10
                  csrrsi       t3, 0x340, 13
                  srli         a4, a6, 30
                  ori          s4, s0, 575
                  add          t6, t1, s11
                  csrrci       a0, 0x340, 21
                  sra          a3, a2, sp
                  add          zero, s10, s10
                  rem          zero, a3, s10
                  sub          a3, a7, t0
                  remu         a0, s3, a2
                  sltu         s5, a2, t6
                  sltiu        t4, s3, -1712
                  divu         ra, a6, t2
                  srli         a7, s10, 22
                  c.sub        s1, a4
                  c.addi4spn   a4, sp, 336
                  auipc        t4, 579111
                  c.xor        a4, s1
                  slti         s9, s3, -1963
                  c.andi       a4, 18
                  c.or         a4, a5
                  srli         t4, s10, 29
                  c.mv         t4, a4
                  c.and        a0, a5
                  slt          s11, s7, t0
                  sltiu        t1, a5, 1300
                  add          t4, sp, t4
                  nop
                  c.or         a0, a3
                  c.srli       a2, 13
                  sll          a4, t2, a0
                  sub          s11, s10, t3
                  c.srli       a3, 4
                  mul          t0, t4, t5
                  csrrc        tp, 0x340, a2
                  sltu         zero, s3, t2
                  and          t3, sp, a7
                  sub          s7, tp, s7
                  c.or         s1, s0
                  c.addi16sp   sp, -16
                  ori          s6, t4, 1428
                  slti         s5, t0, -515
                  c.addi       s4, -1
                  srli         s10, tp, 26
                  csrrs        s10, 0x340, s11
                  auipc        s10, 367852
                  c.addi16sp   sp, -16
                  mulhsu       a7, s10, t0
                  csrrc        zero, 0x340, a5
                  divu         a3, a3, a4
                  sra          t0, zero, t2
                  csrrc        sp, 0x340, s0
                  and          s4, s8, s11
                  c.add        t5, a3
                  slt          a0, s4, zero
                  csrrc        t1, 0x340, a3
                  sra          s5, a6, t2
                  mulhsu       s6, s9, t4
                  c.srai       a3, 22
                  c.srli       a2, 10
                  csrrci       t1, 0x340, 23
                  rem          t6, s8, s11
                  c.slli       s11, 8
                  mulhu        a3, s6, t6
                  c.add        t2, s8
                  c.andi       s1, 24
                  sltiu        t2, s7, 879
                  xori         gp, a5, -1752
                  csrrwi       t3, 0x340, 5
                  sra          a6, t4, a1
                  c.xor        a4, a5
                  sltiu        t0, a3, 536
                  nop
                  srai         t5, a6, 18
                  c.and        a5, a5
                  slt          a2, t2, a5
                  ori          a4, t3, 435
                  sub          tp, gp, t1
                  sll          tp, t5, tp
                  c.li         t3, 24
                  ori          s10, s7, 1886
                  slli         s9, a3, 12
                  c.and        a0, a2
                  csrrwi       a4, 0x340, 29
                  lui          s4, 12447
                  sll          t1, s2, a1
                  mulhsu       tp, s3, sp
                  auipc        s4, 284119
                  lui          gp, 21415
                  xori         sp, a4, 228
                  mul          s7, t6, s11
                  xor          sp, s6, t0
                  c.addi4spn   a0, sp, 688
                  sra          gp, a7, t6
                  sub          s8, a3, a0
                  c.addi16sp   sp, -16
                  c.or         a5, a0
                  c.mv         s8, tp
                  add          s11, ra, s11
                  c.addi4spn   a4, sp, 336
                  c.addi       s4, 2
                  mulhu        s6, a0, a0
                  mul          a4, a4, a5
                  slti         t3, s1, 29
                  c.addi4spn   a0, sp, 304
                  csrrci       s7, 0x340, 29
                  div          t6, s7, a2
                  ori          t5, a1, 481
                  mulhsu       s10, tp, a0
                  c.slli       a5, 23
                  srl          s5, a3, t2
                  mulhu        t2, s7, a5
                  xori         ra, s11, -265
                  nop
                  csrrs        s4, 0x340, zero
                  c.nop
                  mulh         t0, sp, t5
                  addi         t1, t0, 1056
                  sub          s5, s3, a6
                  rem          a5, s6, s11
                  div          t2, t0, t0
                  c.or         a0, s0
                  c.srli       a3, 22
                  slt          s11, t5, a1
                  csrrs        tp, 0x340, s7
                  xori         sp, gp, -1210
                  remu         s3, sp, s0
                  sra          s11, a7, t2
                  mulh         s3, s3, s8
                  c.addi       s4, -1
                  mulh         s7, a1, a5
                  div          s9, ra, a6
                  c.li         t6, -1
                  add          a7, a6, s4
                  c.srai       a0, 4
                  c.addi       s6, 1
                  or           t4, tp, t6
                  sll          s7, a4, a5
                  xori         s6, s4, 499
                  c.nop
                  csrrwi       s7, 0x340, 26
                  c.andi       a2, 29
                  addi         s5, s7, -1851
                  rem          a7, s7, t0
                  csrrsi       s4, 0x340, 0
                  mul          s3, t5, tp
                  xori         a6, a5, -1977
                  c.add        t4, s1
                  auipc        s9, 547134
                  mul          s3, s1, a3
                  xor          a7, t4, zero
                  c.addi16sp   sp, -16
                  csrrc        a3, 0x340, zero
                  c.slli       s6, 7
                  nop
                  sub          s5, s11, t1
                  sll          t3, s10, t5
                  c.srai       a0, 2
                  csrrc        t2, 0x340, zero
                  xor          a2, s9, zero
                  andi         s3, a6, 1817
                  csrrwi       s11, 0x340, 22
                  slti         s6, gp, 1579
                  sub          s7, t1, a2
                  add          s3, s5, t2
                  xori         s9, t5, 848
                  csrrw        s11, 0x340, zero
                  c.or         a5, a0
                  add          zero, t5, a3
                  sltiu        s9, a1, 675
                  sltu         zero, ra, t6
                  div          t6, s1, t4
                  csrrsi       tp, 0x340, 0
                  remu         t6, sp, s5
                  sll          s5, s3, t3
                  csrrc        s1, 0x340, zero
                  c.li         a5, 2
                  xori         s11, a7, 1580
                  c.li         a6, -1
                  divu         t4, s11, zero
                  c.addi4spn   a4, sp, 752
                  sra          a3, s0, a2
                  c.addi       a7, -1
                  mulh         t2, t0, tp
                  add          ra, a2, s2
                  sltu         t0, s11, s7
                  div          a0, ra, t0
                  sll          s1, t1, t5
                  csrrs        s11, 0x340, gp
                  c.add        s9, gp
                  c.addi       t5, -1
                  or           a6, a7, sp
                  srai         a2, s4, 12
                  srli         a3, a4, 8
                  c.addi16sp   sp, 256
                  c.or         a4, a3
                  csrrs        a5, 0x340, a2
                  c.addi16sp   sp, 448
                  and          a5, a3, a2
                  c.srai       a5, 16
                  slli         s1, s1, 19
                  csrrw        s4, 0x340, t5
                  csrrci       zero, 0x340, 0
                  and          ra, t2, t5
                  c.addi4spn   a3, sp, 288
                  mul          s5, s5, t2
                  srl          s11, a2, s11
                  mulhsu       a4, a7, s11
                  sra          a5, t2, s11
                  c.mv         tp, s11
                  or           s4, sp, t2
                  c.srai       a2, 28
                  c.li         a7, 16
                  sll          t3, a1, a6
                  csrrsi       t3, 0x340, 30
                  sltiu        ra, s11, 1796
                  xor          t1, gp, s9
                  c.sub        a2, a4
                  sltiu        zero, a1, 1513
                  c.addi4spn   s1, sp, 624
                  c.addi       a3, 4
                  sltiu        a4, t3, -971
                  csrrwi       s4, 0x340, 3
                  and          a3, s11, s8
                  div          a2, s1, s11
                  mulhu        s5, a4, s5
                  csrrci       s8, 0x340, 0
                  c.slli       s8, 25
                  c.sub        s1, a0
                  csrrw        s3, 0x340, a6
                  slti         s11, tp, -1364
                  sltu         t4, s0, s11
                  mulh         t3, tp, t5
                  c.nop
                  c.addi4spn   s1, sp, 416
                  sltiu        t4, a2, 1327
                  csrrci       s4, 0x340, 24
                  or           s4, zero, a3
                  c.and        s1, a1
                  c.xor        a4, a5
                  sll          s1, s7, a0
                  slli         zero, t5, 10
                  csrrsi       zero, 0x340, 19
                  divu         t1, a0, s11
                  c.sub        a0, a3
                  sltu         a0, zero, s8
                  slti         sp, s4, 2031
                  sra          a7, s10, s0
                  csrrs        tp, 0x340, tp
                  c.add        s1, s2
                  or           t3, a7, t5
                  nop
                  c.sub        s1, a1
                  c.addi16sp   sp, -16
                  add          s11, s0, a7
                  xor          ra, a0, s9
                  csrrci       t3, 0x340, 23
                  addi         ra, t2, -743
                  csrrc        gp, 0x340, zero
                  csrrc        s5, 0x340, zero
                  lui          s7, 1015774
                  csrrsi       s11, 0x340, 3
                  sra          t3, s3, t2
                  srl          ra, a4, s1
                  sltu         s3, s2, s9
                  c.or         a4, s0
                  mulhu        a6, s3, t5
                  c.addi16sp   sp, -16
                  addi         t3, s5, -1326
                  ori          t1, a1, 1525
                  c.or         a4, a2
                  sra          a2, s3, t0
                  c.mv         s7, s8
                  auipc        a2, 943094
                  addi         s3, t2, -356
                  mulhu        a7, s3, a5
                  sra          s1, s2, sp
                  c.addi4spn   a0, sp, 208
                  and          s1, s5, ra
                  sra          t4, t1, t2
                  c.or         a4, a2
                  sll          a0, s9, t2
                  csrrw        s9, 0x340, a4
                  c.add        s10, s4
                  csrrc        a2, 0x340, zero
                  c.sub        a5, a1
                  divu         s9, s4, s8
                  csrrw        s11, 0x340, s0
                  divu         t5, a5, s1
                  csrrw        s4, 0x340, t3
                  csrrwi       t4, 0x340, 24
                  andi         zero, a2, -506
                  andi         a7, t0, -1142
                  div          s9, a7, t6
                  c.srli       s1, 27
                  srai         s5, s5, 28
                  and          sp, t2, t1
                  mulhu        s6, zero, t1
                  and          a2, t1, a0
                  c.addi16sp   sp, -16
                  xori         s5, a4, 1723
                  c.andi       s1, 3
                  slt          s5, s4, s4
                  csrrsi       t4, 0x340, 1
                  c.addi16sp   sp, 496
                  sra          a5, s3, tp
                  andi         t0, s1, -326
                  srli         sp, a0, 9
                  c.and        a5, a0
                  mulhsu       s10, s1, s11
                  sll          sp, s5, a1
                  c.and        a0, a1
                  mulh         t0, s5, a2
                  slli         t4, s7, 6
                  sltiu        s3, a3, 1527
                  ori          s3, t1, -1477
                  c.sub        a2, a4
                  c.addi4spn   a5, sp, 688
                  c.andi       a5, -1
                  c.srli       a5, 6
                  c.xor        s1, a2
                  mulhsu       a0, zero, s6
                  divu         sp, a7, a4
                  sra          s3, a5, s0
                  srl          s9, a1, t3
                  sub          zero, a3, ra
                  mulhu        t3, s7, t5
                  div          t5, a4, s11
                  c.and        a0, s0
                  andi         s8, s4, -291
                  addi         t4, s8, 145
                  xori         tp, t6, -706
                  c.srai       s1, 10
                  mul          gp, t4, a7
                  xor          gp, s0, a7
                  c.sub        a4, a0
                  mulh         a6, t4, s10
                  c.srli       a2, 16
                  addi         s11, ra, -164
                  andi         a5, s10, -1837
                  add          a4, s4, s6
                  mulhu        sp, a5, ra
                  csrrc        a7, 0x340, gp
                  or           zero, t2, s8
                  ori          t1, a3, 1155
                  slli         s1, a0, 31
                  sub          t2, a3, a6
                  c.lui        t3, 3
                  sra          a4, a6, tp
                  csrrs        t6, 0x340, t4
                  csrrs        t2, 0x340, zero
                  c.or         a0, a2
                  and          a4, t1, s7
                  add          a0, s3, t5
                  slli         t3, s1, 9
                  addi         t3, s3, -1405
                  c.srli       a5, 24
                  srai         gp, s8, 19
                  slti         t3, a7, -331
                  sll          s10, s5, a5
                  lui          a4, 506296
                  nop
                  c.xor        a4, a3
                  sltiu        a7, s1, 1956
                  remu         sp, s4, a4
                  c.srai       a3, 21
                  c.xor        a2, s1
                  c.addi16sp   sp, 480
                  addi         s1, s6, -1439
                  slt          t5, tp, t4
                  add          a7, a1, t5
                  csrrwi       s4, 0x340, 12
                  c.li         t5, 28
                  csrrwi       s7, 0x340, 11
                  c.addi4spn   s1, sp, 640
                  xori         t4, s8, 2039
                  lui          s9, 211210
                  c.addi16sp   sp, -16
                  xor          t1, s11, s4
                  sub          a7, tp, s3
                  c.addi16sp   sp, 304
                  or           t0, t2, sp
                  slt          s1, s3, s1
                  add          a4, s6, t4
                  rem          t4, a1, s6
                  c.addi4spn   a2, sp, 624
                  mulhsu       s8, ra, s0
                  sub          s10, s11, s11
                  c.srli       a4, 25
                  sub          a2, s0, a2
                  csrrwi       a5, 0x340, 28
                  c.sub        a5, a2
                  mulhu        a2, a7, s3
                  mul          t2, a7, ra
                  c.addi       s10, 11
                  and          a7, a4, a4
                  csrrsi       s4, 0x340, 30
                  divu         a7, s9, s10
                  slti         t6, t1, 32
                  sltiu        gp, tp, 589
                  mul          a6, a5, s2
                  c.srli       a4, 21
                  addi         s9, s3, -1481
                  mul          t3, s11, a5
                  or           t2, s4, s6
                  mulhu        sp, tp, a5
                  c.addi       gp, 15
                  sub          s7, sp, s3
                  sra          t4, t2, s3
                  csrrsi       gp, 0x340, 21
                  mulhu        zero, s1, s8
                  csrrwi       ra, 0x340, 23
                  csrrw        s3, 0x340, t1
                  mulh         t5, tp, a3
                  or           ra, a1, tp
                  xori         zero, a4, -922
                  csrrsi       s3, 0x340, 0
                  mulhsu       a7, a5, a2
                  mulhu        a5, ra, sp
                  add          t6, s3, s8
                  c.lui        a3, 26
                  c.xor        a2, a5
                  mulh         t3, s2, t3
                  c.addi       a7, -1
                  slli         s8, t6, 5
                  div          sp, a5, t2
                  remu         a4, t0, a1
                  srli         t5, s4, 8
                  c.and        a4, s1
                  c.li         t4, -1
                  mul          a2, s9, t0
                  slti         t5, ra, -1993
                  sltiu        a6, a4, 707
                  c.and        a2, a3
                  sll          s8, s11, s9
                  slt          s5, sp, a4
                  csrrwi       s11, 0x340, 4
                  csrrci       a0, 0x340, 4
                  c.nop
                  sra          zero, s5, s7
                  csrrci       s8, 0x340, 0
                  c.add        s11, s7
                  c.srli       a2, 9
                  c.slli       t3, 1
                  mulhu        ra, sp, t0
                  sltiu        gp, t6, 309
                  slti         t2, s7, 1664
                  mul          sp, a5, s8
                  ori          t6, t4, 1534
                  csrrs        s6, 0x340, s10
                  c.mv         a3, t3
                  c.li         s9, 18
                  slti         gp, s2, -830
                  c.mv         t1, s4
                  rem          a3, a1, a4
                  lui          s4, 682589
                  sltu         ra, t4, sp
                  c.addi16sp   sp, 80
                  c.andi       a3, 12
                  c.lui        s4, 15
                  slli         t0, a0, 26
                  csrrwi       s9, 0x340, 5
                  csrrwi       t4, 0x340, 18
                  c.li         s1, 26
                  srai         s5, a7, 7
                  csrrc        s8, 0x340, sp
                  mulhsu       a2, s10, ra
                  sll          a0, t3, t5
                  mulh         s3, s10, a4
                  csrrs        s7, 0x340, zero
                  csrrs        a5, 0x340, zero
                  rem          t4, s5, t2
                  divu         t2, a1, t2
                  c.srai       s1, 19
                  mul          s6, s9, zero
                  xori         s10, a2, 1938
                  csrrsi       a7, 0x340, 29
                  or           a5, a5, a7
                  c.addi16sp   sp, -16
                  c.and        a5, a5
                  slti         zero, s3, 1549
                  c.nop
                  rem          gp, a4, s8
                  csrrci       s8, 0x340, 0
                  c.sub        a2, s1
                  slti         t6, a2, 317
                  or           s3, s0, s4
                  lui          t6, 1037525
                  csrrci       a2, 0x340, 26
                  sltu         a0, ra, s1
                  and          s7, a0, s2
                  c.slli       t4, 1
                  mulh         a2, ra, t4
                  addi         gp, a2, 376
                  lui          a0, 130971
                  divu         a5, a5, a5
                  sltu         sp, s3, t3
                  sltu         s7, s3, a4
                  mulhu        t5, t0, s10
                  c.li         s8, -1
                  csrrw        s7, 0x340, s5
                  srl          t5, s6, s0
                  c.and        a4, a1
                  c.addi       t5, -1
                  divu         a3, sp, t1
                  c.and        s1, s0
                  c.xor        a0, a5
                  srli         sp, s0, 1
                  nop
                  xori         a3, a7, 1066
                  divu         t0, tp, s4
                  csrrwi       s8, 0x340, 19
                  mul          gp, a6, s8
                  c.slli       a4, 12
                  c.xor        a3, a5
                  c.addi4spn   a5, sp, 240
                  nop
                  c.srai       s1, 3
                  c.addi       gp, -1
                  or           sp, s0, t0
                  ori          a7, gp, -240
                  csrrw        s6, 0x340, s5
                  slt          a3, t6, a6
                  slti         s10, tp, 315
                  remu         sp, s7, s11
                  c.andi       a3, -1
                  c.add        a7, a6
                  mul          s6, ra, s3
                  addi         sp, a7, -1436
                  c.srai       a3, 18
                  srai         ra, zero, 8
                  c.lui        t3, 17
                  sll          t6, s3, s11
                  addi         a6, a1, -1757
                  rem          zero, t1, s7
                  or           t6, a7, s0
                  c.slli       tp, 21
                  csrrsi       s6, 0x340, 15
                  auipc        s10, 720644
                  c.li         s8, -1
                  ori          zero, t6, 1282
                  addi         s9, s10, 22
                  c.xor        a3, a5
                  c.lui        s9, 6
                  lui          a5, 348544
                  csrrw        a3, 0x340, gp
                  slt          a7, s9, a3
                  sra          a6, s0, t2
                  sll          s8, s11, s1
                  c.addi       a5, 14
                  c.slli       s4, 17
                  slt          tp, a3, s6
                  c.srli       a5, 17
                  c.add        a3, t3
                  add          t1, s5, ra
                  slti         a5, s0, -1007
                  c.add        s8, a6
                  c.sub        a2, a5
                  or           s11, s9, a1
                  xori         a7, a6, -1605
                  c.xor        a3, a3
                  c.xor        a4, s1
                  mulhu        tp, gp, s4
                  div          s3, a6, s9
                  c.addi       gp, -1
                  divu         s10, t6, a0
                  xori         s4, s2, -1675
                  lui          sp, 890034
                  mulhsu       s1, a3, t5
                  addi         t6, a0, -314
                  or           s9, s8, ra
                  sltiu        tp, t4, 1584
                  divu         sp, t0, s7
                  xor          gp, a3, s10
                  srl          a0, s2, t3
                  c.slli       t1, 9
                  rem          s11, t0, a4
                  c.addi4spn   a2, sp, 96
                  auipc        a6, 870459
                  c.nop
                  c.slli       s6, 9
                  csrrsi       t4, 0x340, 0
                  mul          t1, a4, s2
                  srli         ra, ra, 19
                  xori         t2, t4, -68
                  c.lui        ra, 17
                  c.xor        a3, a1
                  rem          t2, a4, a6
                  c.slli       t5, 10
                  sltiu        s8, a1, -1657
                  slli         a0, t0, 15
                  srli         s10, t6, 0
                  sltu         s4, a5, a5
                  c.nop
                  csrrsi       a5, 0x340, 5
                  sra          s7, s0, ra
                  c.add        t4, t3
                  sltu         t0, a6, s6
                  c.add        t6, s3
                  mulhu        s3, s7, s1
                  mul          s4, t3, ra
                  srli         a4, s4, 27
                  rem          s1, s2, gp
                  c.mv         gp, t1
                  srl          tp, a2, s8
                  c.add        s6, s9
                  slti         s11, a1, 1528
                  c.slli       s11, 12
                  mulhu        tp, s4, s0
                  csrrw        a4, 0x340, s2
                  srai         t4, ra, 27
                  c.srai       a2, 31
                  addi         t0, s2, -2036
                  remu         t4, zero, s4
                  c.srli       a0, 4
                  csrrc        t6, 0x340, t4
                  c.nop
                  andi         zero, s5, 1339
                  mul          sp, tp, a3
                  remu         ra, sp, s6
                  c.lui        s11, 15
                  sltu         sp, tp, t6
                  rem          zero, t3, s6
                  and          zero, a1, ra
                  lui          a4, 876208
                  nop
                  c.srli       a4, 2
                  c.add        ra, s7
                  c.slli       s11, 11
                  c.lui        s6, 4
                  sll          s6, s2, s9
                  mulhsu       t3, a6, s8
                  div          t6, a5, a4
                  slt          t4, a2, s4
                  srli         t0, a7, 9
                  sll          s10, s7, s9
                  sra          a3, s6, s0
                  c.slli       s10, 11
                  slti         s9, t3, -1472
                  c.addi       s7, -1
                  c.srli       a3, 12
                  srl          s10, s7, tp
                  csrrw        t1, 0x340, s1
                  or           zero, s2, t4
                  c.li         s7, 4
                  srli         s4, t4, 3
                  srai         s9, gp, 0
                  ori          s3, a6, -287
                  xor          t2, t3, s2
                  csrrwi       s4, 0x340, 27
                  or           s9, a1, s1
                  c.addi       ra, 29
                  c.srli       a4, 5
                  mulhu        s6, a6, s4
                  c.srli       a4, 7
                  or           s1, a7, ra
                  slli         a6, a6, 16
                  divu         s7, a4, s6
                  lui          sp, 1020951
                  or           a2, t0, sp
                  xori         tp, s10, 667
                  lui          s6, 972352
                  slli         sp, s9, 9
                  c.nop
                  add          s11, t6, a6
                  c.slli       a2, 24
                  srli         a2, s4, 22
                  c.addi       t1, -1
                  mulhu        tp, a0, a2
                  divu         s4, a1, t2
                  srl          s4, a7, ra
                  mulhu        s10, gp, s3
                  c.addi16sp   sp, 160
                  csrrw        t4, 0x340, s10
                  nop
                  auipc        a6, 80184
                  sub          t4, a6, a4
                  sra          t2, a7, t2
                  csrrci       ra, 0x340, 4
                  mul          s8, s0, s11
                  addi         gp, a3, 239
                  c.li         s6, -1
                  c.lui        t1, 19
                  mulhsu       s7, a4, s3
                  csrrwi       s11, 0x340, 0
                  slti         t1, t1, -907
                  c.addi4spn   a5, sp, 704
                  c.andi       a4, -1
                  mul          a3, s8, a3
                  c.srli       a2, 23
                  c.or         s1, a2
                  srl          t1, s4, s5
                  csrrwi       a7, 0x340, 28
                  sll          t1, s3, s1
                  mul          gp, t6, a0
                  c.andi       s1, 19
                  slti         a0, sp, -1655
                  nop
                  sra          s9, t1, s5
                  c.addi       s9, 14
                  csrrci       t1, 0x340, 15
                  c.xor        a2, a3
                  rem          a6, s3, s1
                  nop
                  c.sub        a5, s1
                  mulh         t2, s3, a0
                  c.sub        a2, a2
                  c.lui        s5, 11
                  csrrs        a3, 0x340, ra
                  ori          s10, tp, 201
                  xor          s9, s2, sp
                  sub          s10, s4, a1
                  c.li         s1, -1
                  c.slli       s3, 25
                  c.mv         a6, a6
                  mulhu        s11, s11, t6
                  c.nop
                  c.sub        s1, a2
                  sltiu        s11, s11, -621
                  sll          t3, a2, t1
                  c.srai       a0, 23
                  addi         s9, t1, -1976
                  csrrc        a2, 0x340, t1
                  csrrc        a2, 0x340, sp
                  c.xor        a3, a1
                  csrrsi       sp, 0x340, 12
                  lui          t6, 907024
                  c.mv         a6, a2
                  mulhsu       s11, a0, t1
                  csrrs        s7, 0x340, zero
                  c.srli       a3, 18
                  sll          s9, s1, zero
                  c.srai       a3, 13
                  slli         a2, s1, 18
                  sub          t3, t3, a2
                  c.or         a4, s1
                  c.li         sp, 1
                  andi         s11, a1, -289
                  add          a6, ra, gp
                  srli         a2, s1, 7
                  c.mv         a0, s1
                  div          s7, t0, a2
                  nop
                  remu         s11, t2, s0
                  srl          s5, t3, t1
                  rem          s4, s8, s11
                  rem          t5, s8, s5
                  c.sub        s1, a2
                  csrrw        t0, 0x340, a4
                  sra          a4, t6, a7
                  xori         t1, s4, -727
                  srli         t2, t3, 14
                  lui          t2, 225654
                  sra          tp, t1, s3
                  c.or         a2, a0
                  ori          a3, sp, 900
                  slt          a3, t5, a1
                  csrrsi       s1, 0x340, 0
                  c.addi16sp   sp, -16
                  auipc        a2, 399011
                  mul          s8, a3, t6
                  csrrwi       a5, 0x340, 31
                  c.addi16sp   sp, 304
                  c.slli       a4, 12
                  c.li         a6, -1
                  csrrw        ra, 0x340, tp
                  nop
                  add          a6, t4, a4
                  lui          s5, 207685
                  sltiu        t6, s10, 476
                  mulh         t3, t1, s2
                  c.srli       a3, 15
                  div          a7, t6, a5
                  auipc        a3, 296888
                  csrrs        s10, 0x340, zero
                  div          s4, s2, s10
                  and          t4, s3, tp
                  lui          a5, 655253
                  sra          a3, s8, a6
                  xori         s9, t2, -593
                  remu         t4, ra, s5
                  mul          a3, s11, s0
                  mul          s10, zero, a7
                  c.li         t5, 17
                  mulhsu       a2, t1, a1
                  c.add        s5, sp
                  slt          s9, s11, t6
                  sltu         a5, sp, s3
                  csrrwi       zero, 0x340, 7
                  c.andi       a5, -1
                  sub          s11, sp, t6
                  c.addi4spn   a3, sp, 896
                  c.srai       a4, 7
                  sltiu        a0, t6, 810
                  c.and        a3, a2
                  c.sub        s1, a5
                  csrrs        t6, 0x340, t0
                  c.slli       s5, 20
                  auipc        t6, 1044483
                  c.or         s1, s0
                  addi         gp, s5, -1517
                  c.slli       a4, 5
                  mulhsu       a7, s5, a3
                  c.and        s1, s0
                  c.xor        a2, a0
                  andi         t6, s5, -783
                  sltu         gp, s10, tp
                  sltu         s6, s4, s2
                  c.li         t1, 31
                  c.srli       a2, 14
                  c.addi16sp   sp, 176
                  divu         a4, a0, tp
                  c.srli       a2, 27
                  mulhsu       s6, t6, t0
                  c.add        t3, ra
                  sltiu        s7, a5, -1264
                  div          a6, sp, a0
                  ori          gp, s8, -1018
                  c.mv         s10, t1
                  srai         s5, t1, 17
                  csrrc        a2, 0x340, a0
                  mulhsu       a3, s2, a2
                  slli         t4, t5, 4
                  auipc        s7, 1026510
                  mulhsu       a2, s9, a3
                  slt          a5, s7, s8
                  c.slli       s10, 2
                  mulhsu       s6, gp, s11
                  xori         s10, s10, -164
                  xori         gp, s3, 1087
                  c.addi4spn   a0, sp, 944
                  slt          t3, s5, ra
                  sra          s7, t5, s10
                  c.addi4spn   a4, sp, 608
                  sll          t3, a1, s11
                  slti         s3, s7, 540
                  c.srai       s1, 14
                  or           a6, tp, s11
                  csrrsi       t0, 0x340, 23
                  addi         s10, a0, 6
                  or           gp, s7, s3
                  c.addi4spn   a0, sp, 96
                  mul          a2, t6, gp
                  srai         t2, s9, 21
                  nop
                  c.xor        a0, a0
                  xori         a0, t5, 1340
                  csrrwi       s9, 0x340, 20
                  divu         t4, zero, s0
                  c.li         t6, 24
                  c.addi       tp, -1
                  c.srli       a0, 6
                  xor          tp, a7, t4
                  mulhsu       tp, s8, t2
                  ori          s4, s3, -1483
                  ori          a0, a7, 622
                  div          s8, s1, sp
                  csrrw        a6, 0x340, a7
                  c.xor        s1, a4
                  srai         t4, t5, 26
                  c.mv         t2, a5
                  add          a0, s6, a7
                  and          ra, s11, a7
                  xori         a6, t6, 300
                  sll          a6, t6, sp
                  mul          a2, a6, a3
                  nop
                  srai         s9, s11, 12
                  c.addi16sp   sp, 368
                  auipc        ra, 352743
                  or           a4, s1, a0
                  auipc        zero, 791165
                  mulhsu       s1, sp, t6
                  c.and        s1, a4
                  add          ra, tp, s3
                  slti         s5, s9, 676
                  mulhu        a4, gp, a6
                  mulh         t6, a1, t1
                  srai         a6, t5, 6
                  c.andi       a5, 22
                  mulhsu       a0, t3, zero
                  csrrs        s8, 0x340, zero
                  c.li         s4, 30
                  lui          s8, 191891
                  c.addi4spn   a2, sp, 592
                  add          s1, s5, a5
                  auipc        a3, 990825
                  c.or         a3, a5
                  slt          t0, zero, t4
                  c.li         s4, 21
                  slt          s5, sp, s0
                  add          a2, a3, s6
                  c.addi4spn   a5, sp, 880
                  ori          s3, gp, -850
                  c.slli       a7, 27
                  slli         s3, gp, 11
                  lui          s4, 1015832
                  and          t1, t2, a6
                  csrrci       t0, 0x340, 1
                  and          gp, s8, a3
                  xori         s10, zero, -1265
                  csrrci       gp, 0x340, 14
                  mulh         zero, zero, s9
                  andi         t1, s2, 1558
                  c.andi       a2, -1
                  sra          a0, ra, s7
                  rem          s11, t3, s9
                  add          sp, s10, s9
                  sltu         t4, s11, a2
                  nop
                  xor          t4, a1, sp
                  c.and        a5, a4
                  c.addi       a3, -1
                  add          t5, t3, tp
                  c.li         s10, 12
                  srai         a3, gp, 14
                  nop
                  c.add        a2, s2
                  sub          s9, t1, t5
                  add          t5, a1, tp
                  csrrsi       s9, 0x340, 0
                  c.li         a0, -1
                  mulh         s8, t2, zero
                  c.addi16sp   sp, 400
                  remu         s11, a4, a3
                  c.mv         s10, sp
                  c.addi       a5, 3
                  sll          ra, t6, a4
                  c.and        a3, a5
                  slli         s4, a5, 31
                  sub          a5, s10, t5
                  auipc        s11, 172792
                  srl          sp, s11, s3
                  sub          s4, gp, t6
                  lui          s9, 23735
                  c.addi4spn   a4, sp, 240
                  mulhsu       s3, s8, t4
                  and          s8, t2, s6
                  sll          tp, t6, sp
                  add          t0, t3, a6
                  srl          t3, s2, gp
                  sra          s7, gp, a4
                  c.mv         a0, s1
                  sra          t0, a4, a2
                  c.addi4spn   a2, sp, 176
                  addi         a6, a3, -509
                  sra          t1, s5, sp
                  mulh         t3, gp, s6
                  divu         t2, t4, s11
                  auipc        s4, 537137
                  addi         a5, s11, 1588
                  c.addi       t5, 26
                  c.mv         a3, s7
                  c.srai       a5, 9
                  auipc        ra, 197004
                  xori         a5, a1, -362
                  sra          zero, a5, a7
                  sub          t2, sp, a2
                  csrrc        a6, 0x340, a2
                  sltiu        s10, sp, -1056
                  nop
                  slli         t1, a0, 2
                  c.slli       tp, 29
                  auipc        s3, 682536
                  csrrwi       s7, 0x340, 0
                  c.mv         a7, s0
                  add          t3, a5, s7
                  c.add        t2, s1
                  remu         t4, a2, s9
                  lui          a2, 267482
                  and          s1, a0, s9
                  csrrci       a2, 0x340, 0
                  and          s4, s11, t4
                  c.addi       t6, 31
                  or           t5, s8, a7
                  c.nop
                  srli         s10, s6, 31
                  add          t5, a7, s10
                  divu         s11, sp, a6
                  c.sub        a5, a2
                  srl          s9, s9, s2
                  ori          t4, a2, -594
                  c.addi16sp   sp, -16
                  remu         t3, a7, a0
                  csrrsi       t1, 0x340, 18
                  srl          a7, s9, s6
                  c.xor        a0, a2
                  c.srai       a4, 26
                  remu         s10, s8, a3
                  c.addi4spn   a5, sp, 320
                  c.add        s1, s4
                  divu         tp, s3, s5
                  c.addi       gp, -1
                  srli         s11, t0, 16
                  auipc        zero, 345388
                  c.addi16sp   sp, 224
                  mulhu        s5, a1, a0
                  xor          a2, t4, s10
                  csrrc        s8, 0x340, zero
                  andi         a6, a6, -734
                  c.mv         t3, a0
                  sub          a5, t1, t1
                  c.or         a4, a3
                  c.addi4spn   a5, sp, 336
                  xori         t1, s3, 1654
                  srl          t4, s7, s7
                  nop
                  csrrc        s3, 0x340, s7
                  srai         s1, a3, 22
                  sub          s10, a3, s4
                  sll          s1, a0, s4
                  c.and        a0, a4
                  remu         zero, s7, s8
                  andi         s8, s4, 1513
                  mulhsu       sp, s6, s3
                  c.add        t5, s11
                  nop
                  lui          t0, 702504
                  c.addi       s3, 15
                  sltu         gp, t4, s4
                  xori         s10, a2, -324
                  auipc        s5, 493057
                  csrrs        s6, 0x340, a5
                  slti         s1, s11, 1437
                  lui          t2, 764044
                  c.mv         gp, s11
                  addi         t4, a0, -1750
                  csrrwi       tp, 0x340, 11
                  c.srli       a4, 31
                  addi         s4, s0, 751
                  slti         a6, s9, -728
                  srai         t1, t2, 1
                  slli         s5, s3, 2
                  mulhsu       s8, s8, s7
                  lui          t0, 342154
                  c.li         a3, -1
                  srl          s5, a3, s1
                  srl          a6, s6, a7
                  divu         t1, s0, t6
                  c.lui        a4, 20
                  csrrci       gp, 0x340, 0
                  add          s4, s4, s8
                  mul          s9, t4, sp
                  auipc        s8, 143677
                  sra          t0, s7, s7
                  divu         sp, s11, a2
                  rem          t2, a4, s6
                  c.addi       a2, -1
                  andi         tp, s0, 1517
                  c.andi       a5, -1
                  c.srli       a5, 31
                  c.addi4spn   s1, sp, 528
                  mulhu        a3, sp, a6
                  c.srli       a2, 13
                  c.or         a2, a4
                  c.lui        s8, 1
                  c.addi       a7, 2
                  nop
                  andi         s9, s11, -1223
                  addi         s3, sp, 469
                  mulhsu       t6, zero, t1
                  c.srai       a5, 8
                  remu         s6, s7, s0
                  c.addi4spn   a5, sp, 64
                  xori         gp, t5, 812
                  c.slli       s8, 7
                  c.addi       a6, 27
                  c.slli       s10, 8
                  ori          a5, ra, -541
                  c.addi       s10, 17
                  c.andi       a4, -1
                  remu         s9, t1, s11
                  and          gp, s3, t2
                  mulh         a7, s7, t2
                  sll          sp, t4, t0
                  sub          s7, t4, s9
                  c.srai       a4, 14
                  sll          s9, a3, a5
                  auipc        s7, 398359
                  add          s6, zero, zero
                  srl          s3, s10, s9
                  rem          s10, t2, s3
                  xori         a5, s7, -1220
                  ori          a2, a1, 1842
                  csrrc        a2, 0x340, zero
                  c.andi       a5, 24
                  sltu         a0, s7, a0
                  auipc        ra, 931225
                  c.and        a3, a2
                  xori         s3, gp, 1934
                  csrrsi       t4, 0x340, 0
                  csrrci       s8, 0x340, 4
                  csrrsi       s1, 0x340, 0
                  c.xor        a4, a5
                  nop
                  c.srai       a3, 20
                  c.nop
                  add          a0, t2, a7
                  csrrci       sp, 0x340, 0
                  c.mv         s8, t3
                  auipc        s1, 132109
                  slti         s1, t6, -897
                  sltiu        s5, s7, 1456
                  c.or         a3, a1
                  c.li         a5, 11
                  c.srai       s1, 3
                  c.andi       a5, 14
                  c.li         s3, -1
                  c.mv         s10, ra
                  mulhsu       s5, tp, sp
                  add          a7, tp, s3
                  sll          sp, t0, zero
                  c.li         s8, -1
                  srai         t6, t1, 22
                  c.xor        a3, a2
                  slt          t0, tp, s7
                  c.and        s1, s1
                  andi         t4, zero, 294
                  nop
                  sub          a4, ra, ra
                  csrrs        a7, 0x340, zero
                  xori         s1, s10, -1751
                  divu         t2, t0, s2
                  mulhsu       s3, s1, s5
                  c.andi       a0, -1
                  c.mv         a7, s7
                  divu         s8, t1, t2
                  and          s5, s2, a5
                  xori         a5, s6, -565
                  sltu         a6, sp, a4
                  xor          a7, t5, a4
                  mul          s7, t4, a5
                  slt          sp, s0, gp
                  sltu         t4, a4, a6
                  c.sub        a0, a0
                  c.or         a3, a5
                  or           tp, a6, t5
                  div          tp, zero, t1
                  c.andi       a3, -1
                  c.lui        t2, 26
                  mulhsu       s11, ra, t4
                  c.addi       t1, -1
                  csrrsi       t5, 0x340, 0
                  csrrsi       a4, 0x340, 28
                  c.mv         s10, tp
                  slli         t5, a6, 29
                  divu         gp, a6, s5
                  slt          a4, s1, a5
                  ori          t5, tp, 1616
                  andi         t5, s4, 1695
                  c.sub        s1, a5
                  addi         s11, a0, -682
                  csrrw        a6, 0x340, s1
                  slli         a7, t0, 11
                  c.mv         s6, s5
                  csrrci       a0, 0x340, 21
                  mul          zero, a1, a4
                  div          t3, s1, t0
                  auipc        s1, 38916
                  lui          s5, 836101
                  c.nop
                  csrrc        s4, 0x340, zero
                  c.add        t1, s10
                  auipc        s1, 592185
                  csrrwi       t6, 0x340, 6
                  sll          a0, t3, s6
                  c.mv         s8, s4
                  mulhsu       s10, tp, s6
                  c.srai       a0, 10
                  mul          t6, s1, a3
                  xori         a4, t1, -1856
                  c.slli       t3, 8
                  and          t1, t4, s3
                  srai         s4, s5, 1
                  addi         t5, s8, -749
                  c.li         s6, -1
                  srai         s10, t4, 18
                  c.nop
                  c.slli       ra, 29
                  lui          a4, 365729
                  sub          a5, t5, sp
                  c.and        s1, a5
                  c.srli       a2, 3
                  c.addi       a6, -1
                  c.sub        a2, a5
                  sltiu        sp, s10, 1126
                  c.lui        t6, 5
                  c.or         a4, a5
                  div          t4, sp, a1
                  c.andi       s1, 6
                  c.srai       s1, 15
                  or           a2, s4, gp
                  csrrwi       t1, 0x340, 4
                  remu         t6, s10, t3
                  c.addi4spn   a3, sp, 656
                  divu         a2, t4, s5
                  c.mv         t6, s6
                  remu         a5, s10, a4
                  sll          s9, tp, s10
                  c.andi       a0, -1
                  c.xor        s1, s1
                  mulh         a6, s6, a5
                  mulh         a0, s10, a3
                  csrrci       s9, 0x340, 0
                  c.addi4spn   a0, sp, 736
                  mulhu        t4, zero, a1
                  c.li         t6, -1
                  c.add        tp, t3
                  srli         zero, t6, 1
                  sra          t6, t1, s7
                  remu         s4, t5, t3
                  rem          a3, s0, s0
                  c.andi       a0, 25
                  csrrc        t5, 0x340, zero
                  c.addi16sp   sp, -16
                  srli         a2, s6, 7
                  sll          a4, a4, s3
                  c.xor        a2, s0
                  xori         s3, tp, 592
                  c.slli       t0, 30
                  csrrwi       t1, 0x340, 22
                  csrrwi       s4, 0x340, 14
                  and          s1, s7, s6
                  mulhu        t1, zero, ra
                  csrrc        zero, 0x340, zero
                  or           a7, t2, a0
                  csrrwi       zero, 0x340, 6
                  c.addi4spn   s1, sp, 160
                  c.xor        a2, a2
                  c.srai       a5, 7
                  xor          s6, s7, t2
                  sltiu        s9, a3, -118
                  c.and        a2, a3
                  c.li         gp, 19
                  mul          s11, tp, a6
                  xor          s7, a7, t0
                  c.li         s1, 28
                  addi         sp, gp, 115
                  sltiu        t2, s3, 1718
                  srai         t2, s8, 30
                  c.addi16sp   sp, 432
                  c.or         a4, a2
                  slli         ra, a6, 31
                  c.addi       t5, -1
                  c.slli       ra, 26
                  csrrwi       s6, 0x340, 16
                  c.andi       a4, 19
                  c.addi       t5, -1
                  c.li         t2, -1
                  c.sub        s1, a3
                  csrrw        a2, 0x340, s11
                  xori         t2, tp, 1209
                  csrrw        t1, 0x340, sp
                  sll          tp, a1, a2
                  or           t6, a1, a1
                  remu         ra, a6, s6
                  csrrw        s10, 0x340, s6
                  c.li         t6, -1
                  csrrci       sp, 0x340, 0
                  auipc        s8, 361176
                  c.andi       s1, 29
                  div          t5, a5, s4
                  c.addi4spn   s1, sp, 320
                  sll          t0, ra, s2
                  c.lui        s4, 7
                  and          a2, s0, t5
                  mul          t1, t4, s2
                  sltiu        t5, t3, -271
                  c.srli       a3, 2
                  sub          gp, t5, s6
                  c.sub        a5, a2
                  lui          s9, 433517
                  c.lui        s5, 1
                  c.or         a4, a5
                  srai         s6, a0, 27
                  srli         s11, t4, 19
                  mulhsu       a0, s4, sp
                  auipc        t0, 49429
                  sll          tp, a0, s9
                  c.or         a0, a5
                  c.lui        s10, 26
                  addi         t4, s8, 949
                  xori         a0, s2, -1937
                  sltu         s4, t2, gp
                  c.and        a5, a1
                  c.sub        a0, a2
                  csrrc        t1, 0x340, zero
                  c.add        tp, s7
                  c.add        a4, s7
                  c.xor        s1, a4
                  c.mv         s8, a4
                  addi         s8, a2, -457
                  sra          s4, a2, t4
                  or           sp, tp, s4
                  divu         s6, t4, tp
                  slti         t0, ra, -111
                  srai         t4, a6, 13
                  csrrsi       t3, 0x340, 24
                  lui          s3, 730694
                  srli         a4, s6, 16
                  c.add        t5, tp
                  c.or         a4, a5
                  mulhu        s4, s0, s7
                  sltiu        s5, t6, -1329
                  c.slli       sp, 4
                  sltu         a6, s8, a4
                  c.srai       a0, 22
                  csrrwi       gp, 0x340, 30
                  c.xor        a2, a0
                  csrrs        t5, 0x340, s9
                  sra          a3, gp, s9
                  c.or         a5, a5
                  csrrw        t0, 0x340, t5
                  and          t0, a3, s3
                  csrrw        t5, 0x340, s0
                  c.mv         t5, a3
                  c.srai       a4, 21
                  auipc        t4, 530454
                  sltu         a4, a4, s6
                  srl          a7, s8, ra
                  lui          s9, 1028980
                  mul          sp, t6, s8
                  mul          s4, s11, a5
                  csrrw        s11, 0x340, t3
                  c.nop
                  c.srai       s1, 5
                  mulhu        t1, sp, a5
                  and          t5, a0, t5
                  c.slli       s10, 23
                  c.add        s6, a1
                  or           s5, a7, tp
                  slli         s11, tp, 3
                  slt          s1, s0, t2
                  mul          ra, t2, t0
                  c.nop
                  nop
                  c.nop
                  c.xor        a3, s1
                  slti         t4, t2, 400
                  mulh         t0, a3, t6
                  rem          s4, s1, t2
                  c.lui        t6, 16
                  c.addi4spn   s1, sp, 112
                  andi         t3, s2, 656
                  c.slli       a4, 25
                  csrrc        s9, 0x340, zero
                  sltu         a0, a4, s8
                  ori          s5, t4, 1816
                  addi         t6, s1, 1803
                  srl          t5, t0, a3
                  mulhsu       s1, t5, sp
                  div          s4, a5, tp
                  c.and        a3, a1
                  auipc        zero, 983241
                  sra          s8, s10, gp
                  andi         t2, a3, 150
                  c.li         a4, -1
                  sll          a4, a7, a7
                  div          s10, gp, s2
                  c.mv         tp, a4
                  c.and        a3, a0
                  c.li         a7, 4
                  nop
                  c.srai       a4, 16
                  c.add        s5, t3
                  slti         a4, a3, -706
                  c.xor        a4, s0
                  csrrc        t2, 0x340, zero
                  rem          tp, t1, s9
                  addi         a2, a7, 95
                  c.lui        a2, 10
                  csrrs        a3, 0x340, s4
                  slli         s11, s1, 25
                  c.and        s1, a5
                  sub          t1, tp, s4
                  add          a4, s11, s1
                  c.mv         s3, t0
                  c.or         a4, s0
                  c.or         a2, a2
                  c.addi4spn   a2, sp, 336
                  c.slli       t3, 26
                  srai         t0, a0, 0
                  remu         tp, t1, ra
                  slti         t6, t4, 1449
                  c.srli       a3, 20
                  c.add        a4, t6
                  c.sub        a0, a4
                  xor          a4, s1, t2
                  slti         s10, a6, 108
                  csrrci       s3, 0x340, 0
                  xori         s11, a1, -1798
                  rem          a5, s2, a4
                  c.addi4spn   a2, sp, 432
                  csrrci       s7, 0x340, 0
                  divu         a4, s4, ra
                  xori         s8, s6, -1568
                  c.xor        a0, a0
                  sll          s6, sp, a5
                  or           s6, s10, t5
                  c.addi       t1, 27
                  mulh         gp, s7, s11
                  divu         a3, t2, t6
                  andi         s3, s3, 1991
                  slt          t4, gp, gp
                  csrrw        t4, 0x340, a6
                  c.add        gp, a3
                  c.srai       a5, 23
                  c.srai       a3, 6
                  mul          tp, t5, a0
                  mul          s8, s2, s3
                  rem          s5, t4, a3
                  sltiu        zero, t6, 419
                  div          a7, t6, s8
                  lui          s3, 364154
                  srli         s9, t3, 24
                  or           tp, gp, t0
                  divu         s8, s9, t0
                  sra          s3, s3, a6
                  c.addi4spn   a2, sp, 480
                  sltu         t2, t6, t1
                  csrrsi       zero, 0x340, 14
                  sra          s4, s6, a6
                  c.and        a5, a0
                  csrrw        a6, 0x340, sp
                  xori         s6, s5, 385
                  div          t6, a6, t6
                  andi         a4, t6, -1053
                  c.addi       t6, 30
                  c.srai       a0, 4
                  rem          s10, t4, t6
                  lui          s6, 494076
                  div          a4, s5, a1
                  srli         s11, s5, 23
                  rem          t6, s7, s8
                  c.li         t4, 1
                  slti         s5, a5, 1721
                  sltiu        tp, t0, -1625
                  srli         a4, s7, 18
                  divu         s5, s0, s4
                  c.slli       a6, 18
                  xor          t0, s5, t2
                  c.srli       a0, 19
                  mulh         t0, tp, s10
                  c.andi       a2, 25
                  c.add        s10, sp
                  c.addi4spn   a4, sp, 192
                  c.li         tp, 11
                  andi         a0, ra, -820
                  c.and        a3, s0
                  mulh         ra, s5, t5
                  rem          t2, s2, s4
                  slli         s10, s10, 1
                  c.srli       a0, 29
                  c.nop
                  c.addi       s5, 25
                  c.nop
                  c.li         sp, -1
                  c.nop
                  sra          a0, t3, s2
                  mulhsu       a4, t6, a7
                  remu         t3, s4, t0
                  srai         a4, t6, 25
                  andi         s1, gp, -1298
                  divu         zero, a7, a1
                  xor          t5, sp, s2
                  sra          s9, t4, a5
                  c.srli       a3, 18
                  c.lui        a5, 31
                  csrrwi       a3, 0x340, 7
                  c.li         s5, 24
                  ori          a2, s7, 1999
                  c.addi       s4, 27
                  csrrs        a6, 0x340, zero
                  xor          t4, a5, gp
                  c.lui        gp, 24
                  c.slli       a7, 27
                  csrrc        tp, 0x340, zero
                  c.addi       t3, 18
                  c.addi       s10, -1
                  lui          t3, 939156
                  c.slli       ra, 11
                  csrrs        s1, 0x340, zero
                  srl          gp, s6, s2
                  c.nop
                  csrrw        s7, 0x340, s4
                  slli         t3, a2, 13
                  sll          a0, t1, s11
                  xor          a4, s6, s4
                  c.add        t2, s3
                  ori          gp, s6, 1669
                  c.sub        a5, s1
                  sra          sp, s7, t5
                  c.mv         s11, tp
                  add          gp, a1, t4
                  mulhsu       s7, gp, a7
                  mulhu        t4, t5, s8
                  c.and        s1, a2
                  sll          sp, s8, s1
                  slli         t0, sp, 0
                  srl          sp, t4, sp
                  csrrwi       t5, 0x340, 5
                  c.and        a5, a1
                  c.addi       t6, 25
                  sra          t5, t1, s6
                  c.andi       a0, -1
                  mulhsu       a3, tp, a5
                  csrrw        t6, 0x340, s2
                  csrrci       s9, 0x340, 0
                  c.xor        a2, a5
                  c.srai       a0, 28
                  slti         a4, a4, -1790
                  slli         t0, s5, 6
                  c.or         a5, a1
                  slt          a6, a3, sp
                  srli         t0, s0, 9
                  nop
                  csrrci       a4, 0x340, 0
                  csrrsi       s4, 0x340, 4
                  sll          s3, t4, s7
                  c.add        a4, a7
                  c.xor        a3, a2
                  c.addi4spn   a5, sp, 160
                  sltu         t5, s3, gp
                  srl          a3, a0, s10
                  lui          t4, 360969
                  c.xor        a2, s0
                  divu         s8, gp, a5
                  csrrs        s4, 0x340, t6
                  c.addi16sp   sp, -16
                  slli         s9, s11, 17
                  sltiu        a7, s0, -2014
                  sltu         t3, a2, t2
                  ori          t0, t4, -134
                  ori          a7, a3, -495
                  c.addi16sp   sp, 496
                  mul          a4, t0, s0
                  and          t1, s5, t3
                  c.addi4spn   a3, sp, 112
                  srai         t5, gp, 9
                  c.xor        s1, s0
                  lui          s7, 413544
                  c.li         s4, -1
                  divu         s5, s7, t4
                  sll          s9, a2, t3
                  nop
                  slli         t0, a1, 24
                  c.addi16sp   sp, 208
                  or           sp, a4, t2
                  srli         a3, a6, 19
                  andi         a7, t3, 175
                  c.mv         t6, t5
                  mulhsu       zero, s4, sp
                  c.and        a2, a5
                  c.srai       a4, 24
                  csrrc        t4, 0x340, zero
                  c.mv         s11, s9
                  c.addi       t4, 8
                  slt          tp, s1, s5
                  c.and        a5, a3
                  c.addi16sp   sp, -16
                  sra          s7, t2, s0
                  nop
                  remu         sp, s6, s0
                  c.and        a4, s1
                  c.srai       a5, 12
                  or           ra, a2, s6
                  slli         t0, t4, 23
                  c.mv         a4, tp
                  c.addi16sp   sp, 96
                  slli         t0, s6, 19
                  xor          s1, t3, a3
                  sltu         sp, t0, s3
                  c.andi       s1, 29
                  srl          s11, a0, s9
                  and          s5, gp, zero
                  csrrw        tp, 0x340, s7
                  c.addi16sp   sp, 176
                  add          t3, s10, t3
                  slti         s7, a5, -436
                  c.addi       s1, -1
                  srl          s7, s10, tp
                  srai         a7, t5, 15
                  srai         s10, sp, 22
                  rem          sp, s0, t3
                  mulhu        ra, sp, s9
                  srli         s4, s8, 4
                  c.addi4spn   a5, sp, 144
                  csrrwi       s7, 0x340, 9
                  sub          t3, t4, s2
                  auipc        s7, 291692
                  c.li         tp, 5
                  csrrc        t0, 0x340, a2
                  c.mv         gp, t1
                  c.addi4spn   a4, sp, 496
                  csrrw        s9, 0x340, t4
                  sll          tp, t6, a7
                  srl          t3, a3, sp
                  csrrwi       t6, 0x340, 25
                  c.slli       a3, 10
                  c.slli       t4, 27
                  c.srli       a3, 14
                  addi         s5, s8, -1986
                  sll          zero, a6, s1
                  andi         zero, a7, -676
                  andi         s10, a7, 979
                  srl          sp, a4, s9
                  mulhsu       a2, gp, s4
                  or           s1, t0, s5
                  addi         t6, a0, -1578
                  c.addi16sp   sp, -16
                  mulhu        t4, gp, s1
                  srl          t6, s8, t6
                  remu         t1, s9, tp
                  c.add        s1, t3
                  sub          s8, a7, a4
                  rem          s4, a7, s5
                  remu         zero, t3, a3
                  c.slli       t1, 10
                  csrrwi       s9, 0x340, 21
                  c.addi4spn   a2, sp, 800
                  nop
                  c.addi4spn   a0, sp, 976
                  add          s3, ra, t3
                  srl          gp, s1, t5
                  sll          a4, zero, t5
                  c.slli       t4, 18
                  sltu         a5, a1, a2
                  mul          a5, t4, s8
                  auipc        a6, 255297
                  srli         s8, ra, 21
                  c.addi16sp   sp, -16
                  divu         a4, s6, s4
                  mulh         s7, t0, s5
                  div          s8, t6, a3
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
                  li x13, 0x8ffffffc
                  li x27, 0xd
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x342
                  sw x27, 0(x13)
                  csrr  x27, 0x341
                  addi  x27, x27, 4
                  csrw  0x341, x27
                  add x11, x18, zero
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
                  add x18, x11, zero
                  lw  x11, (x18)
                  addi x18, x18, 4
                  mret

illegal_instr_handler:
                  li x13, 0x8ffffffc
                  li x27, 0xa
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x13)
                  li x13, 0x8ffffffc
                  li x27, 0x342
                  slli x27, x27, 8
                  addi x27, x27, 0x3
                  sw x27, 0(x13)
                  csrr x27, 0x342
                  sw x27, 0(x13)
                  csrr  x27, 0x341
                  addi  x27, x27, 4
                  csrw  0x341, x27
                  add x11, x18, zero
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
                  add x18, x11, zero
                  lw  x11, (x18)
                  addi x18, x18, 4
                  mret

pt_fault_handler: 
                  li x13, 0x8ffffffc
                  li x27, 0x8
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x13)
                  nop

.align 2
mmode_intr_handler:
                  csrr  x27, 0x300 # MSTATUS;
                  csrr  x27, 0x304 # MIE;
                  csrr  x27, 0x344 # MIP;
                  csrrc x27, 0x344, x27 # MIP;
                  li x13, 0x8ffffffc
                  li x27, 0x7
                  slli x27, x27, 8
                  addi x27, x27, 0x0
                  sw x27, 0(x13)
                  add x11, x18, zero
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
                  add x18, x11, zero
                  lw  x11, (x18)
                  addi x18, x18, 4
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
