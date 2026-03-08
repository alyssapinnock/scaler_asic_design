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
                  li x18, 0x40001106
                  csrw 0x301, x18
kernel_sp:        
                  la x13, kernel_stack_end

trap_vec_init:    
                  la x18, mtvec_handler
                  ori x18, x18, 1
                  csrw 0x305, x18 # MTVEC

pmp_setup:        
                  csrwi 0x747, 4
                  la x7, main
                  li x18, 0x0
                  add x7, x7, x18
                  srli x7, x7, 2
                  csrw 0x3b0, x7
                  la x7, main
                  li x18, 0x11111111
                  add x7, x7, x18
                  srli x7, x7, 2
                  csrw 0x3b1, x7
                  la x7, main
                  li x18, 0x22222222
                  add x7, x7, x18
                  srli x7, x7, 2
                  csrw 0x3b2, x7
                  la x7, main
                  li x18, 0x33333333
                  add x7, x7, x18
                  srli x7, x7, 2
                  csrw 0x3b3, x7
                  li x7, 0xf0f0f0f
                  csrw 0x3a0, x7
                  la x7, main
                  li x18, 0x44444444
                  add x7, x7, x18
                  srli x7, x7, 2
                  csrw 0x3b4, x7
                  la x7, main
                  li x18, 0x55555555
                  add x7, x7, x18
                  srli x7, x7, 2
                  csrw 0x3b5, x7
                  la x7, main
                  li x18, 0x66666666
                  add x7, x7, x18
                  srli x7, x7, 2
                  csrw 0x3b6, x7
                  la x7, main
                  li x18, 0x77777777
                  add x7, x7, x18
                  srli x7, x7, 2
                  csrw 0x3b7, x7
                  li x7, 0xf0f0f0f
                  csrw 0x3a1, x7
                  la x7, main
                  li x18, 0x88888888
                  add x7, x7, x18
                  srli x7, x7, 2
                  csrw 0x3b8, x7
                  la x7, main
                  li x18, 0x99999999
                  add x7, x7, x18
                  srli x7, x7, 2
                  csrw 0x3b9, x7
                  la x7, main
                  li x18, 0xaaaaaaaa
                  add x7, x7, x18
                  srli x7, x7, 2
                  csrw 0x3ba, x7
                  la x7, main
                  li x18, 0xbbbbbbbb
                  add x7, x7, x18
                  srli x7, x7, 2
                  csrw 0x3bb, x7
                  li x7, 0xf0f0f0f
                  csrw 0x3a2, x7
                  la x7, main
                  li x18, 0xcccccccc
                  add x7, x7, x18
                  srli x7, x7, 2
                  csrw 0x3bc, x7
                  la x7, main
                  li x18, 0xdddddddd
                  add x7, x7, x18
                  srli x7, x7, 2
                  csrw 0x3bd, x7
                  la x7, main
                  li x18, 0xeeeeeeee
                  add x7, x7, x18
                  srli x7, x7, 2
                  csrw 0x3be, x7
                  la x7, main
                  li x18, 0xffffffff
                  add x7, x7, x18
                  srli x7, x7, 2
                  csrw 0x3bf, x7
                  li x7, 0xf0f0f0f
                  csrw 0x3a3, x7

mepc_setup:       
                  la x18, init
                  csrw 0x341, x18

custom_csr_setup: 
                  csrwi 0x7c0, 1

init_machine_mode:
                  li x18, 0x1800
                  csrw 0x300, x18 # MSTATUS
                  li x18, 0x0
                  csrw 0x304, x18 # MIE
                  li x27, 0x8ffffffc
                  li x18, 0x300
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x300
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x304
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x304
                  sw x18, 0(x27)
                  mret
init:             
                  li x0, 0xfc8dfb04
                  li x1, 0x0
                  li x2, 0x80000000
                  li x3, 0x5
                  li x4, 0x80000000
                  li x5, 0xb9cf6f4f
                  li x6, 0x8
                  li x7, 0x0
                  li x8, 0xd
                  li x9, 0x0
                  li x10, 0x80000000
                  li x12, 0xfeae4504
                  li x14, 0xf2401046
                  li x15, 0x80000000
                  li x16, 0xff2a4d8c
                  li x17, 0x0
                  li x18, 0x0
                  li x19, 0x4
                  li x20, 0x0
                  li x21, 0x80000000
                  li x22, 0xc
                  li x23, 0x0
                  li x24, 0x80000000
                  li x25, 0x9bbef230
                  li x26, 0x0
                  li x27, 0x5a70921f
                  li x28, 0x77c6e408
                  li x29, 0x0
                  li x30, 0x7be08446
                  li x31, 0xe
                  la x11, user_stack_end
                  li x27, 0x8ffffffc
                  li x18, 0x0
                  slli x18, x18, 8
                  addi x18, x18, 0x0
                  sw x18, 0(x27)
                  j main
test_done:        
                  li x27, 0x8ffffff8
                  li x18, 0x0
                  slli x18, x18, 8
                  addi x18, x18, 0x1
                  sw x18, 0(x27)
                  ecall

test_fail:        
                  li x27, 0x8ffffff8
                  li x18, 0x1
                  slli x18, x18, 8
                  addi x18, x18, 0x1
                  sw x18, 0(x27)
                  ecall

mmode_intr_vector_1:
                  addi x13, x13, -4
                  sw  x11, (x13)
                  add x11, x13, zero
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
                  add x13, x11, zero
                  li x27, 0x8ffffffc
                  li x18, 0x6
                  slli x18, x18, 8
                  addi x18, x18, 0x0
                  sw x18, 0(x27)
                  csrr x18, 0x342 # MCAUSE
                  srli x18, x18, 0x1f
                  beqz x18, 1f
                  li x27, 0x8ffffffc
                  li x18, 0x300
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x300
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x342
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x342
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x304
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x304
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x344
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x344
                  sw x18, 0(x27)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_2:
                  addi x13, x13, -4
                  sw  x11, (x13)
                  add x11, x13, zero
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
                  add x13, x11, zero
                  li x27, 0x8ffffffc
                  li x18, 0x6
                  slli x18, x18, 8
                  addi x18, x18, 0x0
                  sw x18, 0(x27)
                  csrr x18, 0x342 # MCAUSE
                  srli x18, x18, 0x1f
                  beqz x18, 1f
                  li x27, 0x8ffffffc
                  li x18, 0x300
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x300
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x342
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x342
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x304
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x304
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x344
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x344
                  sw x18, 0(x27)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_3:
                  addi x13, x13, -4
                  sw  x11, (x13)
                  add x11, x13, zero
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
                  add x13, x11, zero
                  li x27, 0x8ffffffc
                  li x18, 0x6
                  slli x18, x18, 8
                  addi x18, x18, 0x0
                  sw x18, 0(x27)
                  csrr x18, 0x342 # MCAUSE
                  srli x18, x18, 0x1f
                  beqz x18, 1f
                  li x27, 0x8ffffffc
                  li x18, 0x300
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x300
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x342
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x342
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x304
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x304
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x344
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x344
                  sw x18, 0(x27)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_4:
                  addi x13, x13, -4
                  sw  x11, (x13)
                  add x11, x13, zero
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
                  add x13, x11, zero
                  li x27, 0x8ffffffc
                  li x18, 0x6
                  slli x18, x18, 8
                  addi x18, x18, 0x0
                  sw x18, 0(x27)
                  csrr x18, 0x342 # MCAUSE
                  srli x18, x18, 0x1f
                  beqz x18, 1f
                  li x27, 0x8ffffffc
                  li x18, 0x300
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x300
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x342
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x342
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x304
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x304
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x344
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x344
                  sw x18, 0(x27)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_5:
                  addi x13, x13, -4
                  sw  x11, (x13)
                  add x11, x13, zero
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
                  add x13, x11, zero
                  li x27, 0x8ffffffc
                  li x18, 0x6
                  slli x18, x18, 8
                  addi x18, x18, 0x0
                  sw x18, 0(x27)
                  csrr x18, 0x342 # MCAUSE
                  srli x18, x18, 0x1f
                  beqz x18, 1f
                  li x27, 0x8ffffffc
                  li x18, 0x300
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x300
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x342
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x342
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x304
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x304
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x344
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x344
                  sw x18, 0(x27)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_6:
                  addi x13, x13, -4
                  sw  x11, (x13)
                  add x11, x13, zero
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
                  add x13, x11, zero
                  li x27, 0x8ffffffc
                  li x18, 0x6
                  slli x18, x18, 8
                  addi x18, x18, 0x0
                  sw x18, 0(x27)
                  csrr x18, 0x342 # MCAUSE
                  srli x18, x18, 0x1f
                  beqz x18, 1f
                  li x27, 0x8ffffffc
                  li x18, 0x300
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x300
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x342
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x342
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x304
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x304
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x344
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x344
                  sw x18, 0(x27)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_7:
                  addi x13, x13, -4
                  sw  x11, (x13)
                  add x11, x13, zero
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
                  add x13, x11, zero
                  li x27, 0x8ffffffc
                  li x18, 0x6
                  slli x18, x18, 8
                  addi x18, x18, 0x0
                  sw x18, 0(x27)
                  csrr x18, 0x342 # MCAUSE
                  srli x18, x18, 0x1f
                  beqz x18, 1f
                  li x27, 0x8ffffffc
                  li x18, 0x300
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x300
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x342
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x342
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x304
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x304
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x344
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x344
                  sw x18, 0(x27)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_8:
                  addi x13, x13, -4
                  sw  x11, (x13)
                  add x11, x13, zero
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
                  add x13, x11, zero
                  li x27, 0x8ffffffc
                  li x18, 0x6
                  slli x18, x18, 8
                  addi x18, x18, 0x0
                  sw x18, 0(x27)
                  csrr x18, 0x342 # MCAUSE
                  srli x18, x18, 0x1f
                  beqz x18, 1f
                  li x27, 0x8ffffffc
                  li x18, 0x300
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x300
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x342
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x342
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x304
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x304
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x344
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x344
                  sw x18, 0(x27)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_9:
                  addi x13, x13, -4
                  sw  x11, (x13)
                  add x11, x13, zero
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
                  add x13, x11, zero
                  li x27, 0x8ffffffc
                  li x18, 0x6
                  slli x18, x18, 8
                  addi x18, x18, 0x0
                  sw x18, 0(x27)
                  csrr x18, 0x342 # MCAUSE
                  srli x18, x18, 0x1f
                  beqz x18, 1f
                  li x27, 0x8ffffffc
                  li x18, 0x300
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x300
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x342
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x342
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x304
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x304
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x344
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x344
                  sw x18, 0(x27)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_10:
                  addi x13, x13, -4
                  sw  x11, (x13)
                  add x11, x13, zero
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
                  add x13, x11, zero
                  li x27, 0x8ffffffc
                  li x18, 0x6
                  slli x18, x18, 8
                  addi x18, x18, 0x0
                  sw x18, 0(x27)
                  csrr x18, 0x342 # MCAUSE
                  srli x18, x18, 0x1f
                  beqz x18, 1f
                  li x27, 0x8ffffffc
                  li x18, 0x300
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x300
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x342
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x342
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x304
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x304
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x344
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x344
                  sw x18, 0(x27)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_11:
                  addi x13, x13, -4
                  sw  x11, (x13)
                  add x11, x13, zero
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
                  add x13, x11, zero
                  li x27, 0x8ffffffc
                  li x18, 0x6
                  slli x18, x18, 8
                  addi x18, x18, 0x0
                  sw x18, 0(x27)
                  csrr x18, 0x342 # MCAUSE
                  srli x18, x18, 0x1f
                  beqz x18, 1f
                  li x27, 0x8ffffffc
                  li x18, 0x300
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x300
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x342
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x342
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x304
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x304
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x344
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x344
                  sw x18, 0(x27)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_12:
                  addi x13, x13, -4
                  sw  x11, (x13)
                  add x11, x13, zero
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
                  add x13, x11, zero
                  li x27, 0x8ffffffc
                  li x18, 0x6
                  slli x18, x18, 8
                  addi x18, x18, 0x0
                  sw x18, 0(x27)
                  csrr x18, 0x342 # MCAUSE
                  srli x18, x18, 0x1f
                  beqz x18, 1f
                  li x27, 0x8ffffffc
                  li x18, 0x300
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x300
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x342
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x342
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x304
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x304
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x344
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x344
                  sw x18, 0(x27)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_13:
                  addi x13, x13, -4
                  sw  x11, (x13)
                  add x11, x13, zero
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
                  add x13, x11, zero
                  li x27, 0x8ffffffc
                  li x18, 0x6
                  slli x18, x18, 8
                  addi x18, x18, 0x0
                  sw x18, 0(x27)
                  csrr x18, 0x342 # MCAUSE
                  srli x18, x18, 0x1f
                  beqz x18, 1f
                  li x27, 0x8ffffffc
                  li x18, 0x300
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x300
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x342
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x342
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x304
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x304
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x344
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x344
                  sw x18, 0(x27)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_14:
                  addi x13, x13, -4
                  sw  x11, (x13)
                  add x11, x13, zero
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
                  add x13, x11, zero
                  li x27, 0x8ffffffc
                  li x18, 0x6
                  slli x18, x18, 8
                  addi x18, x18, 0x0
                  sw x18, 0(x27)
                  csrr x18, 0x342 # MCAUSE
                  srli x18, x18, 0x1f
                  beqz x18, 1f
                  li x27, 0x8ffffffc
                  li x18, 0x300
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x300
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x342
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x342
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x304
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x304
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x344
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x344
                  sw x18, 0(x27)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_15:
                  addi x13, x13, -4
                  sw  x11, (x13)
                  add x11, x13, zero
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
                  add x13, x11, zero
                  li x27, 0x8ffffffc
                  li x18, 0x6
                  slli x18, x18, 8
                  addi x18, x18, 0x0
                  sw x18, 0(x27)
                  csrr x18, 0x342 # MCAUSE
                  srli x18, x18, 0x1f
                  beqz x18, 1f
                  li x27, 0x8ffffffc
                  li x18, 0x300
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x300
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x342
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x342
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x304
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x304
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x344
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x344
                  sw x18, 0(x27)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_16:
                  addi x13, x13, -4
                  sw  x11, (x13)
                  add x11, x13, zero
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
                  add x13, x11, zero
                  li x27, 0x8ffffffc
                  li x18, 0x6
                  slli x18, x18, 8
                  addi x18, x18, 0x0
                  sw x18, 0(x27)
                  csrr x18, 0x342 # MCAUSE
                  srli x18, x18, 0x1f
                  beqz x18, 1f
                  li x27, 0x8ffffffc
                  li x18, 0x300
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x300
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x342
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x342
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x304
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x304
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x344
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x344
                  sw x18, 0(x27)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_17:
                  addi x13, x13, -4
                  sw  x11, (x13)
                  add x11, x13, zero
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
                  add x13, x11, zero
                  li x27, 0x8ffffffc
                  li x18, 0x6
                  slli x18, x18, 8
                  addi x18, x18, 0x0
                  sw x18, 0(x27)
                  csrr x18, 0x342 # MCAUSE
                  srli x18, x18, 0x1f
                  beqz x18, 1f
                  li x27, 0x8ffffffc
                  li x18, 0x300
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x300
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x342
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x342
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x304
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x304
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x344
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x344
                  sw x18, 0(x27)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_18:
                  addi x13, x13, -4
                  sw  x11, (x13)
                  add x11, x13, zero
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
                  add x13, x11, zero
                  li x27, 0x8ffffffc
                  li x18, 0x6
                  slli x18, x18, 8
                  addi x18, x18, 0x0
                  sw x18, 0(x27)
                  csrr x18, 0x342 # MCAUSE
                  srli x18, x18, 0x1f
                  beqz x18, 1f
                  li x27, 0x8ffffffc
                  li x18, 0x300
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x300
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x342
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x342
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x304
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x304
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x344
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x344
                  sw x18, 0(x27)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_19:
                  addi x13, x13, -4
                  sw  x11, (x13)
                  add x11, x13, zero
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
                  add x13, x11, zero
                  li x27, 0x8ffffffc
                  li x18, 0x6
                  slli x18, x18, 8
                  addi x18, x18, 0x0
                  sw x18, 0(x27)
                  csrr x18, 0x342 # MCAUSE
                  srli x18, x18, 0x1f
                  beqz x18, 1f
                  li x27, 0x8ffffffc
                  li x18, 0x300
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x300
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x342
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x342
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x304
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x304
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x344
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x344
                  sw x18, 0(x27)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_20:
                  addi x13, x13, -4
                  sw  x11, (x13)
                  add x11, x13, zero
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
                  add x13, x11, zero
                  li x27, 0x8ffffffc
                  li x18, 0x6
                  slli x18, x18, 8
                  addi x18, x18, 0x0
                  sw x18, 0(x27)
                  csrr x18, 0x342 # MCAUSE
                  srli x18, x18, 0x1f
                  beqz x18, 1f
                  li x27, 0x8ffffffc
                  li x18, 0x300
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x300
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x342
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x342
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x304
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x304
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x344
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x344
                  sw x18, 0(x27)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_21:
                  addi x13, x13, -4
                  sw  x11, (x13)
                  add x11, x13, zero
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
                  add x13, x11, zero
                  li x27, 0x8ffffffc
                  li x18, 0x6
                  slli x18, x18, 8
                  addi x18, x18, 0x0
                  sw x18, 0(x27)
                  csrr x18, 0x342 # MCAUSE
                  srli x18, x18, 0x1f
                  beqz x18, 1f
                  li x27, 0x8ffffffc
                  li x18, 0x300
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x300
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x342
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x342
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x304
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x304
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x344
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x344
                  sw x18, 0(x27)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_22:
                  addi x13, x13, -4
                  sw  x11, (x13)
                  add x11, x13, zero
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
                  add x13, x11, zero
                  li x27, 0x8ffffffc
                  li x18, 0x6
                  slli x18, x18, 8
                  addi x18, x18, 0x0
                  sw x18, 0(x27)
                  csrr x18, 0x342 # MCAUSE
                  srli x18, x18, 0x1f
                  beqz x18, 1f
                  li x27, 0x8ffffffc
                  li x18, 0x300
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x300
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x342
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x342
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x304
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x304
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x344
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x344
                  sw x18, 0(x27)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_23:
                  addi x13, x13, -4
                  sw  x11, (x13)
                  add x11, x13, zero
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
                  add x13, x11, zero
                  li x27, 0x8ffffffc
                  li x18, 0x6
                  slli x18, x18, 8
                  addi x18, x18, 0x0
                  sw x18, 0(x27)
                  csrr x18, 0x342 # MCAUSE
                  srli x18, x18, 0x1f
                  beqz x18, 1f
                  li x27, 0x8ffffffc
                  li x18, 0x300
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x300
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x342
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x342
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x304
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x304
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x344
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x344
                  sw x18, 0(x27)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_24:
                  addi x13, x13, -4
                  sw  x11, (x13)
                  add x11, x13, zero
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
                  add x13, x11, zero
                  li x27, 0x8ffffffc
                  li x18, 0x6
                  slli x18, x18, 8
                  addi x18, x18, 0x0
                  sw x18, 0(x27)
                  csrr x18, 0x342 # MCAUSE
                  srli x18, x18, 0x1f
                  beqz x18, 1f
                  li x27, 0x8ffffffc
                  li x18, 0x300
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x300
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x342
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x342
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x304
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x304
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x344
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x344
                  sw x18, 0(x27)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_25:
                  addi x13, x13, -4
                  sw  x11, (x13)
                  add x11, x13, zero
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
                  add x13, x11, zero
                  li x27, 0x8ffffffc
                  li x18, 0x6
                  slli x18, x18, 8
                  addi x18, x18, 0x0
                  sw x18, 0(x27)
                  csrr x18, 0x342 # MCAUSE
                  srli x18, x18, 0x1f
                  beqz x18, 1f
                  li x27, 0x8ffffffc
                  li x18, 0x300
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x300
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x342
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x342
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x304
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x304
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x344
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x344
                  sw x18, 0(x27)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_26:
                  addi x13, x13, -4
                  sw  x11, (x13)
                  add x11, x13, zero
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
                  add x13, x11, zero
                  li x27, 0x8ffffffc
                  li x18, 0x6
                  slli x18, x18, 8
                  addi x18, x18, 0x0
                  sw x18, 0(x27)
                  csrr x18, 0x342 # MCAUSE
                  srli x18, x18, 0x1f
                  beqz x18, 1f
                  li x27, 0x8ffffffc
                  li x18, 0x300
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x300
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x342
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x342
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x304
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x304
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x344
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x344
                  sw x18, 0(x27)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_27:
                  addi x13, x13, -4
                  sw  x11, (x13)
                  add x11, x13, zero
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
                  add x13, x11, zero
                  li x27, 0x8ffffffc
                  li x18, 0x6
                  slli x18, x18, 8
                  addi x18, x18, 0x0
                  sw x18, 0(x27)
                  csrr x18, 0x342 # MCAUSE
                  srli x18, x18, 0x1f
                  beqz x18, 1f
                  li x27, 0x8ffffffc
                  li x18, 0x300
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x300
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x342
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x342
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x304
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x304
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x344
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x344
                  sw x18, 0(x27)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_28:
                  addi x13, x13, -4
                  sw  x11, (x13)
                  add x11, x13, zero
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
                  add x13, x11, zero
                  li x27, 0x8ffffffc
                  li x18, 0x6
                  slli x18, x18, 8
                  addi x18, x18, 0x0
                  sw x18, 0(x27)
                  csrr x18, 0x342 # MCAUSE
                  srli x18, x18, 0x1f
                  beqz x18, 1f
                  li x27, 0x8ffffffc
                  li x18, 0x300
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x300
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x342
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x342
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x304
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x304
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x344
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x344
                  sw x18, 0(x27)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_29:
                  addi x13, x13, -4
                  sw  x11, (x13)
                  add x11, x13, zero
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
                  add x13, x11, zero
                  li x27, 0x8ffffffc
                  li x18, 0x6
                  slli x18, x18, 8
                  addi x18, x18, 0x0
                  sw x18, 0(x27)
                  csrr x18, 0x342 # MCAUSE
                  srli x18, x18, 0x1f
                  beqz x18, 1f
                  li x27, 0x8ffffffc
                  li x18, 0x300
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x300
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x342
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x342
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x304
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x304
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x344
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x344
                  sw x18, 0(x27)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_30:
                  addi x13, x13, -4
                  sw  x11, (x13)
                  add x11, x13, zero
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
                  add x13, x11, zero
                  li x27, 0x8ffffffc
                  li x18, 0x6
                  slli x18, x18, 8
                  addi x18, x18, 0x0
                  sw x18, 0(x27)
                  csrr x18, 0x342 # MCAUSE
                  srli x18, x18, 0x1f
                  beqz x18, 1f
                  li x27, 0x8ffffffc
                  li x18, 0x300
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x300
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x342
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x342
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x304
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x304
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x344
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x344
                  sw x18, 0(x27)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_31:
                  addi x13, x13, -4
                  sw  x11, (x13)
                  add x11, x13, zero
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
                  add x13, x11, zero
                  li x27, 0x8ffffffc
                  li x18, 0x6
                  slli x18, x18, 8
                  addi x18, x18, 0x0
                  sw x18, 0(x27)
                  csrr x18, 0x342 # MCAUSE
                  srli x18, x18, 0x1f
                  beqz x18, 1f
                  li x27, 0x8ffffffc
                  li x18, 0x300
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x300
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x342
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x342
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x304
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x304
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x344
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x344
                  sw x18, 0(x27)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

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
                  addi x13, x13, -4
                  sw  x11, (x13)
                  add x11, x13, zero
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
                  add x13, x11, zero
                  li x27, 0x8ffffffc
                  li x18, 0x8
                  slli x18, x18, 8
                  addi x18, x18, 0x0
                  sw x18, 0(x27)
                  csrr x18, 0x341 # MEPC
                  csrr x18, 0x342 # MCAUSE
                  li x27, 0x3 # BREAKPOINT
                  beq x18, x27, ebreak_handler
                  li x27, 0x8 # ECALL_UMODE
                  beq x18, x27, ecall_handler
                  li x27, 0x9 # ECALL_SMODE
                  beq x18, x27, ecall_handler
                  li x27, 0xb # ECALL_MMODE
                  beq x18, x27, ecall_handler
                  li x27, 0x1
                  beq x18, x27, instr_fault_handler
                  li x27, 0x5
                  beq x18, x27, load_fault_handler
                  li x27, 0x7
                  beq x18, x27, store_fault_handler
                  li x27, 0xc
                  beq x18, x27, pt_fault_handler
                  li x27, 0xd
                  beq x18, x27, pt_fault_handler
                  li x27, 0xf
                  beq x18, x27, pt_fault_handler
                  li x27, 0x2 # ILLEGAL_INSTRUCTION
                  beq x18, x27, illegal_instr_handler
                  csrr x27, 0x343 # MTVAL
                  1: la x7, test_done
                  jalr x1, x7, 0

ecall_handler:    
                  li x27, 0x8ffffffc
                  li x18, 0xb00
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0xb00
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0xb80
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0xb80
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0xb03
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0xb03
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0xb83
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0xb83
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0xb04
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0xb04
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0xb84
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0xb84
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0xb05
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0xb05
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0xb85
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0xb85
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0xb06
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0xb06
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0xb86
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0xb86
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0xb07
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0xb07
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0xb87
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0xb87
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0xb08
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0xb08
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0xb88
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0xb88
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0xb09
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0xb09
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0xb89
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0xb89
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0xb0a
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0xb0a
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0xb8a
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0xb8a
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0xb0b
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0xb0b
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0xb8b
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0xb8b
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0xb0c
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0xb0c
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0xb8c
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0xb8c
                  sw x18, 0(x27)
                  la x18, _start
                  sw x0, 0(x18)
                  sw x1, 4(x18)
                  sw x2, 8(x18)
                  sw x3, 12(x18)
                  sw x4, 16(x18)
                  sw x5, 20(x18)
                  sw x6, 24(x18)
                  sw x7, 28(x18)
                  sw x8, 32(x18)
                  sw x9, 36(x18)
                  sw x10, 40(x18)
                  sw x11, 44(x18)
                  sw x12, 48(x18)
                  sw x13, 52(x18)
                  sw x14, 56(x18)
                  sw x15, 60(x18)
                  sw x16, 64(x18)
                  sw x17, 68(x18)
                  sw x18, 72(x18)
                  sw x19, 76(x18)
                  sw x20, 80(x18)
                  sw x21, 84(x18)
                  sw x22, 88(x18)
                  sw x23, 92(x18)
                  sw x24, 96(x18)
                  sw x25, 100(x18)
                  sw x26, 104(x18)
                  sw x27, 108(x18)
                  sw x28, 112(x18)
                  sw x29, 116(x18)
                  sw x30, 120(x18)
                  sw x31, 124(x18)
                  csrr  x18, 0x341
                  addi  x18, x18, 4
                  csrw  0x341, x18
                  mret

instr_fault_handler:
                  li x27, 0x8ffffffc
                  li x18, 0x9
                  slli x18, x18, 8
                  addi x18, x18, 0x0
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x342
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x342
                  sw x18, 0(x27)
                  li x18, 0
                  mv x23, x18
                  li x14, 0
                  0: mv x18, x23
                  mv x7, x18
                  li x7, 0
                  beq x18, x7, 1f
                  li x7, 1
                  beq x18, x7, 2f
                  li x7, 2
                  beq x18, x7, 3f
                  li x7, 3
                  beq x18, x7, 4f
                  li x7, 4
                  beq x18, x7, 5f
                  li x7, 5
                  beq x18, x7, 6f
                  li x7, 6
                  beq x18, x7, 7f
                  li x7, 7
                  beq x18, x7, 8f
                  li x7, 8
                  beq x18, x7, 9f
                  li x7, 9
                  beq x18, x7, 10f
                  li x7, 10
                  beq x18, x7, 11f
                  li x7, 11
                  beq x18, x7, 12f
                  li x7, 12
                  beq x18, x7, 13f
                  li x7, 13
                  beq x18, x7, 14f
                  li x7, 14
                  beq x18, x7, 15f
                  li x7, 15
                  beq x18, x7, 16f
                  1: csrr x27, 0x3b0
                  csrr x16, 0x3a0
                  j 17f
                  2: csrr x27, 0x3b1
                  csrr x16, 0x3a0
                  j 17f
                  3: csrr x27, 0x3b2
                  csrr x16, 0x3a0
                  j 17f
                  4: csrr x27, 0x3b3
                  csrr x16, 0x3a0
                  j 17f
                  5: csrr x27, 0x3b4
                  csrr x16, 0x3a1
                  j 17f
                  6: csrr x27, 0x3b5
                  csrr x16, 0x3a1
                  j 17f
                  7: csrr x27, 0x3b6
                  csrr x16, 0x3a1
                  j 17f
                  8: csrr x27, 0x3b7
                  csrr x16, 0x3a1
                  j 17f
                  9: csrr x27, 0x3b8
                  csrr x16, 0x3a2
                  j 17f
                  10: csrr x27, 0x3b9
                  csrr x16, 0x3a2
                  j 17f
                  11: csrr x27, 0x3ba
                  csrr x16, 0x3a2
                  j 17f
                  12: csrr x27, 0x3bb
                  csrr x16, 0x3a2
                  j 17f
                  13: csrr x27, 0x3bc
                  csrr x16, 0x3a3
                  j 17f
                  14: csrr x27, 0x3bd
                  csrr x16, 0x3a3
                  j 17f
                  15: csrr x27, 0x3be
                  csrr x16, 0x3a3
                  j 17f
                  16: csrr x27, 0x3bf
                  csrr x16, 0x3a3
                  j 17f
                  17: li x10, 4
                  slli x18, x23, 30
                  srli x18, x18, 30
                  sub x7, x10, x18
                  addi x7, x7, -1
                  slli x7, x7, 3
                  sll x10, x16, x7
                  slli x18, x18, 3
                  add x7, x7, x18
                  srl x10, x10, x7
                  slli x7, x10, 27
                  srli x7, x7, 30
                  beqz x7, 20f
                  li x18, 1
                  beq x7, x18, 21f
                  li x18, 2
                  beq x7, x18, 24f
                  li x18, 3
                  beq x7, x18, 25f
                  la x18, test_done
                  jalr x0, x18, 0
                  18: mv x18, x23
                  mv x14, x27
                  addi x18, x18, 1
                  mv x23, x18
                  li x27, 16
                  ble x27, x18, 19f
                  j 0b
                  19: csrr x18, 0x747
                  andi x18, x18, 2
                  bnez x18, 27f
                  la x18, test_done
                  jalr x0, x18, 0
                  20: j 18b
                  21: mv x18, x23
                  csrr x7, 0x343
                  srli x7, x7, 2
                  bnez x18, 22f
                  bltz x7, 18b
                  j 23f
                  22: bgtu x14, x7, 18b
                  23: bleu x27, x7, 18b
                  j 26f
                  24: csrr x18, 0x343
                  srli x18, x18, 2
                  slli x7, x27, 2
                  srli x7, x7, 2
                  bne x18, x7, 18b
                  j 26f
                  25: csrr x18, 0x343
                  srli x18, x18, 2
                  srli x18, x18, 0
                  slli x18, x18, 0
                  slli x7, x27, 2
                  srli x7, x7, 2
                  srli x7, x7, 0
                  slli x7, x7, 0
                  bne x18, x7, 18b
                  j 26f
                  26: csrr x7, 0x747
                  andi x7, x7, 1
                  bnez x7, 27f
                  andi x7, x10, 128
                  bnez x7, 27f
                  j 29f
                  27: la x18, test_done
                  jalr x0, x18, 0
                  29: ori x10, x10, 4
                  li x7, 30
                  sll x18, x23, x7
                  srl x18, x18, x7
                  slli x7, x18, 3
                  sll x10, x10, x7
                  or x16, x16, x10
                  mv x18, x23
                  srli x18, x18, 2
                  beqz x18, 30f
                  li x7, 1
                  beq x18, x7, 31f
                  li x7, 2
                  beq x18, x7, 32f
                  li x7, 3
                  beq x18, x7, 33f
                  30: csrw 0x3a0, x16
                  j 34f
                  31: csrw 0x3a1, x16
                  j 34f
                  32: csrw 0x3a2, x16
                  j 34f
                  33: csrw 0x3a3, x16
                  34: nop
                  add x11, x13, zero
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
                  add x13, x11, zero
                  lw  x11, (x13)
                  addi x13, x13, 4
                  mret

load_fault_handler:
                  li x27, 0x8ffffffc
                  li x18, 0xb
                  slli x18, x18, 8
                  addi x18, x18, 0x0
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x342
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x342
                  sw x18, 0(x27)
                  li x18, 0
                  mv x23, x18
                  li x14, 0
                  0: mv x18, x23
                  mv x7, x18
                  li x7, 0
                  beq x18, x7, 1f
                  li x7, 1
                  beq x18, x7, 2f
                  li x7, 2
                  beq x18, x7, 3f
                  li x7, 3
                  beq x18, x7, 4f
                  li x7, 4
                  beq x18, x7, 5f
                  li x7, 5
                  beq x18, x7, 6f
                  li x7, 6
                  beq x18, x7, 7f
                  li x7, 7
                  beq x18, x7, 8f
                  li x7, 8
                  beq x18, x7, 9f
                  li x7, 9
                  beq x18, x7, 10f
                  li x7, 10
                  beq x18, x7, 11f
                  li x7, 11
                  beq x18, x7, 12f
                  li x7, 12
                  beq x18, x7, 13f
                  li x7, 13
                  beq x18, x7, 14f
                  li x7, 14
                  beq x18, x7, 15f
                  li x7, 15
                  beq x18, x7, 16f
                  1: csrr x27, 0x3b0
                  csrr x16, 0x3a0
                  j 17f
                  2: csrr x27, 0x3b1
                  csrr x16, 0x3a0
                  j 17f
                  3: csrr x27, 0x3b2
                  csrr x16, 0x3a0
                  j 17f
                  4: csrr x27, 0x3b3
                  csrr x16, 0x3a0
                  j 17f
                  5: csrr x27, 0x3b4
                  csrr x16, 0x3a1
                  j 17f
                  6: csrr x27, 0x3b5
                  csrr x16, 0x3a1
                  j 17f
                  7: csrr x27, 0x3b6
                  csrr x16, 0x3a1
                  j 17f
                  8: csrr x27, 0x3b7
                  csrr x16, 0x3a1
                  j 17f
                  9: csrr x27, 0x3b8
                  csrr x16, 0x3a2
                  j 17f
                  10: csrr x27, 0x3b9
                  csrr x16, 0x3a2
                  j 17f
                  11: csrr x27, 0x3ba
                  csrr x16, 0x3a2
                  j 17f
                  12: csrr x27, 0x3bb
                  csrr x16, 0x3a2
                  j 17f
                  13: csrr x27, 0x3bc
                  csrr x16, 0x3a3
                  j 17f
                  14: csrr x27, 0x3bd
                  csrr x16, 0x3a3
                  j 17f
                  15: csrr x27, 0x3be
                  csrr x16, 0x3a3
                  j 17f
                  16: csrr x27, 0x3bf
                  csrr x16, 0x3a3
                  j 17f
                  17: li x10, 4
                  slli x18, x23, 30
                  srli x18, x18, 30
                  sub x7, x10, x18
                  addi x7, x7, -1
                  slli x7, x7, 3
                  sll x10, x16, x7
                  slli x18, x18, 3
                  add x7, x7, x18
                  srl x10, x10, x7
                  slli x7, x10, 27
                  srli x7, x7, 30
                  beqz x7, 20f
                  li x18, 1
                  beq x7, x18, 21f
                  li x18, 2
                  beq x7, x18, 24f
                  li x18, 3
                  beq x7, x18, 25f
                  la x18, test_done
                  jalr x0, x18, 0
                  18: mv x18, x23
                  mv x14, x27
                  addi x18, x18, 1
                  mv x23, x18
                  li x27, 16
                  ble x27, x18, 19f
                  j 0b
                  19: csrr x18, 0x747
                  andi x18, x18, 2
                  bnez x18, 27f
                  la x18, test_done
                  jalr x0, x18, 0
                  20: j 18b
                  21: mv x18, x23
                  csrr x7, 0x343
                  srli x7, x7, 2
                  bnez x18, 22f
                  bltz x7, 18b
                  j 23f
                  22: bgtu x14, x7, 18b
                  23: bleu x27, x7, 18b
                  j 26f
                  24: csrr x18, 0x343
                  srli x18, x18, 2
                  slli x7, x27, 2
                  srli x7, x7, 2
                  bne x18, x7, 18b
                  j 26f
                  25: csrr x18, 0x343
                  srli x18, x18, 2
                  srli x18, x18, 0
                  slli x18, x18, 0
                  slli x7, x27, 2
                  srli x7, x7, 2
                  srli x7, x7, 0
                  slli x7, x7, 0
                  bne x18, x7, 18b
                  j 26f
                  26: csrr x7, 0x747
                  andi x7, x7, 1
                  bnez x7, 27f
                  andi x7, x10, 128
                  bnez x7, 27f
                  j 29f
                  27: csrr x18, 0x341
                  la x7, main
                  bge x18, x7, 40f
                  la x18, test_done
                  jalr x0, x18, 0
                  40: lw x18, 0(x18)
                  li x7, 3
                  and x18, x18, x7
                  beq x18, x7, 28f
                  csrr x18, 0x341
                  addi x18, x18, 2
                  csrw 0x341, x18
                  j 34f
                  28: csrr x18, 0x341
                  addi x18, x18, 4
                  csrw 0x341, x18
                  j 34f
                  29: ori x10, x10, 1
                  li x7, 30
                  sll x18, x23, x7
                  srl x18, x18, x7
                  slli x7, x18, 3
                  sll x10, x10, x7
                  or x16, x16, x10
                  mv x18, x23
                  srli x18, x18, 2
                  beqz x18, 30f
                  li x7, 1
                  beq x18, x7, 31f
                  li x7, 2
                  beq x18, x7, 32f
                  li x7, 3
                  beq x18, x7, 33f
                  30: csrw 0x3a0, x16
                  j 34f
                  31: csrw 0x3a1, x16
                  j 34f
                  32: csrw 0x3a2, x16
                  j 34f
                  33: csrw 0x3a3, x16
                  34: nop
                  add x11, x13, zero
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
                  add x13, x11, zero
                  lw  x11, (x13)
                  addi x13, x13, 4
                  mret

store_fault_handler:
                  li x27, 0x8ffffffc
                  li x18, 0xc
                  slli x18, x18, 8
                  addi x18, x18, 0x0
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x342
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x342
                  sw x18, 0(x27)
                  li x18, 0
                  mv x23, x18
                  li x14, 0
                  0: mv x18, x23
                  mv x7, x18
                  li x7, 0
                  beq x18, x7, 1f
                  li x7, 1
                  beq x18, x7, 2f
                  li x7, 2
                  beq x18, x7, 3f
                  li x7, 3
                  beq x18, x7, 4f
                  li x7, 4
                  beq x18, x7, 5f
                  li x7, 5
                  beq x18, x7, 6f
                  li x7, 6
                  beq x18, x7, 7f
                  li x7, 7
                  beq x18, x7, 8f
                  li x7, 8
                  beq x18, x7, 9f
                  li x7, 9
                  beq x18, x7, 10f
                  li x7, 10
                  beq x18, x7, 11f
                  li x7, 11
                  beq x18, x7, 12f
                  li x7, 12
                  beq x18, x7, 13f
                  li x7, 13
                  beq x18, x7, 14f
                  li x7, 14
                  beq x18, x7, 15f
                  li x7, 15
                  beq x18, x7, 16f
                  1: csrr x27, 0x3b0
                  csrr x16, 0x3a0
                  j 17f
                  2: csrr x27, 0x3b1
                  csrr x16, 0x3a0
                  j 17f
                  3: csrr x27, 0x3b2
                  csrr x16, 0x3a0
                  j 17f
                  4: csrr x27, 0x3b3
                  csrr x16, 0x3a0
                  j 17f
                  5: csrr x27, 0x3b4
                  csrr x16, 0x3a1
                  j 17f
                  6: csrr x27, 0x3b5
                  csrr x16, 0x3a1
                  j 17f
                  7: csrr x27, 0x3b6
                  csrr x16, 0x3a1
                  j 17f
                  8: csrr x27, 0x3b7
                  csrr x16, 0x3a1
                  j 17f
                  9: csrr x27, 0x3b8
                  csrr x16, 0x3a2
                  j 17f
                  10: csrr x27, 0x3b9
                  csrr x16, 0x3a2
                  j 17f
                  11: csrr x27, 0x3ba
                  csrr x16, 0x3a2
                  j 17f
                  12: csrr x27, 0x3bb
                  csrr x16, 0x3a2
                  j 17f
                  13: csrr x27, 0x3bc
                  csrr x16, 0x3a3
                  j 17f
                  14: csrr x27, 0x3bd
                  csrr x16, 0x3a3
                  j 17f
                  15: csrr x27, 0x3be
                  csrr x16, 0x3a3
                  j 17f
                  16: csrr x27, 0x3bf
                  csrr x16, 0x3a3
                  j 17f
                  17: li x10, 4
                  slli x18, x23, 30
                  srli x18, x18, 30
                  sub x7, x10, x18
                  addi x7, x7, -1
                  slli x7, x7, 3
                  sll x10, x16, x7
                  slli x18, x18, 3
                  add x7, x7, x18
                  srl x10, x10, x7
                  slli x7, x10, 27
                  srli x7, x7, 30
                  beqz x7, 20f
                  li x18, 1
                  beq x7, x18, 21f
                  li x18, 2
                  beq x7, x18, 24f
                  li x18, 3
                  beq x7, x18, 25f
                  la x18, test_done
                  jalr x0, x18, 0
                  18: mv x18, x23
                  mv x14, x27
                  addi x18, x18, 1
                  mv x23, x18
                  li x27, 16
                  ble x27, x18, 19f
                  j 0b
                  19: csrr x18, 0x747
                  andi x18, x18, 2
                  bnez x18, 27f
                  la x18, test_done
                  jalr x0, x18, 0
                  20: j 18b
                  21: mv x18, x23
                  csrr x7, 0x343
                  srli x7, x7, 2
                  bnez x18, 22f
                  bltz x7, 18b
                  j 23f
                  22: bgtu x14, x7, 18b
                  23: bleu x27, x7, 18b
                  j 26f
                  24: csrr x18, 0x343
                  srli x18, x18, 2
                  slli x7, x27, 2
                  srli x7, x7, 2
                  bne x18, x7, 18b
                  j 26f
                  25: csrr x18, 0x343
                  srli x18, x18, 2
                  srli x18, x18, 0
                  slli x18, x18, 0
                  slli x7, x27, 2
                  srli x7, x7, 2
                  srli x7, x7, 0
                  slli x7, x7, 0
                  bne x18, x7, 18b
                  j 26f
                  26: csrr x7, 0x747
                  andi x7, x7, 1
                  bnez x7, 27f
                  andi x7, x10, 128
                  bnez x7, 27f
                  j 29f
                  27: csrr x18, 0x341
                  lw x18, 0(x18)
                  li x7, 3
                  and x18, x18, x7
                  beq x18, x7, 28f
                  csrr x18, 0x341
                  addi x18, x18, 2
                  csrw 0x341, x18
                  j 34f
                  28: csrr x18, 0x341
                  addi x18, x18, 4
                  csrw 0x341, x18
                  j 34f
                  29: ori x10, x10, 3
                  li x7, 30
                  sll x18, x23, x7
                  srl x18, x18, x7
                  slli x7, x18, 3
                  sll x10, x10, x7
                  or x16, x16, x10
                  mv x18, x23
                  srli x18, x18, 2
                  beqz x18, 30f
                  li x7, 1
                  beq x18, x7, 31f
                  li x7, 2
                  beq x18, x7, 32f
                  li x7, 3
                  beq x18, x7, 33f
                  30: csrw 0x3a0, x16
                  j 34f
                  31: csrw 0x3a1, x16
                  j 34f
                  32: csrw 0x3a2, x16
                  j 34f
                  33: csrw 0x3a3, x16
                  34: nop
                  add x11, x13, zero
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
                  add x13, x11, zero
                  lw  x11, (x13)
                  addi x13, x13, 4
                  mret

.align 2
main:             c.xor        s1, a1
                  csrrwi       a2, 0x340, 21
                  csrrwi       s9, 0x340, 7
                  c.andi       a4, -1
                  csrrci       gp, 0x340, 0
                  mulhu        s4, gp, a7
                  c.addi16sp   sp, -16
                  c.mv         gp, s4
                  rem          t3, a7, a2
                  c.srli       s1, 8
                  csrrc        a4, 0x340, zero
                  c.lui        a5, 30
                  lui          t0, 468215
                  nop
                  c.srai       a2, 1
                  and          t3, tp, a4
                  c.addi16sp   sp, -16
                  c.srli       s0, 17
                  c.srli       a0, 9
                  c.and        a0, s1
                  addi         t4, s0, 1269
                  slli         t6, t0, 20
                  auipc        t0, 182795
                  div          t3, t3, s11
                  slt          t4, s9, s9
                  csrrci       a6, 0x340, 2
                  srai         gp, s10, 16
                  sra          t4, t6, sp
                  sltiu        t3, t2, -1402
                  c.li         s10, 11
                  csrrc        t5, 0x340, zero
                  c.nop
                  auipc        ra, 542915
                  lui          t6, 394348
                  c.addi       t3, -1
                  div          s5, a6, zero
                  csrrwi       s2, 0x340, 25
                  csrrwi       t1, 0x340, 10
                  c.andi       a4, -1
                  c.slli       t1, 26
                  c.mv         s10, ra
                  divu         ra, t0, s2
                  sll          s4, s1, ra
                  c.li         t1, -1
                  c.and        a0, a2
                  c.andi       a5, 23
                  srl          s4, a7, s10
                  andi         a6, zero, 405
                  c.andi       a4, -1
                  rem          t0, s9, ra
                  csrrw        t3, 0x340, s1
                  srl          a0, s4, s3
                  c.srli       a2, 9
                  csrrc        s8, 0x340, zero
                  or           a2, s6, s0
                  xor          a0, tp, t4
                  c.srai       s0, 23
                  xori         a0, s2, -544
                  srl          s8, s3, t1
                  csrrc        t3, 0x340, s3
                  sll          a7, s10, s9
                  c.li         t0, -1
                  and          s11, a5, a2
                  mulhsu       sp, s6, a1
                  sltiu        s5, a4, 1313
                  c.and        a0, a3
                  csrrc        s9, 0x340, zero
                  ori          s4, s0, 1103
                  ori          s9, a0, 1886
                  c.andi       a4, 13
                  lui          t4, 679436
                  c.mv         s11, a3
                  c.li         s3, -1
                  c.or         a0, a3
                  csrrwi       s4, 0x340, 5
                  or           tp, s11, a6
                  sub          t4, a7, t0
                  ori          t4, s2, -1208
                  csrrw        s1, 0x340, t3
                  or           s1, s2, sp
                  csrrs        s6, 0x340, tp
                  slt          zero, tp, s0
                  c.or         a2, a0
                  slti         a6, zero, 1572
                  c.addi       s8, 26
                  sltu         s9, t6, s3
                  c.addi4spn   a5, sp, 656
                  or           s11, s9, gp
                  mulhsu       s3, s3, t4
                  c.srai       s0, 6
                  mulhu        tp, t3, s0
                  c.addi4spn   a2, sp, 144
                  c.mv         s5, a7
                  mulhu        a6, t0, ra
                  c.or         a5, a2
                  mulh         a6, zero, t5
                  csrrw        sp, 0x340, t3
                  c.sub        a5, a5
                  nop
                  csrrci       s1, 0x340, 0
                  and          ra, a2, a1
                  sltiu        t0, s5, -359
                  c.nop
                  xori         s11, a2, 491
                  div          gp, a0, t5
                  slt          s5, a1, t0
                  c.addi4spn   a5, sp, 960
                  auipc        t6, 371185
                  mulhsu       s4, s5, s10
                  addi         s1, a4, 285
                  slt          tp, a0, s9
                  sra          s8, t2, t2
                  c.xor        a4, s0
                  c.addi16sp   sp, -16
                  remu         s3, s3, a0
                  mulh         tp, tp, t2
                  c.xor        s0, a1
                  c.xor        s0, a0
                  addi         s11, t1, -196
                  c.xor        a4, s0
                  mulhu        s9, s2, t4
                  mulh         gp, s5, s6
                  or           s4, s11, a3
                  c.xor        a2, a3
                  c.sub        a2, s0
                  csrrc        s6, 0x340, zero
                  csrrw        sp, 0x340, a4
                  xori         t5, t5, -22
                  c.lui        a5, 31
                  c.xor        s1, a5
                  auipc        gp, 975376
                  csrrc        t3, 0x340, s1
                  srl          s1, a5, zero
                  c.slli       s11, 21
                  srli         s0, a1, 18
                  csrrc        s2, 0x340, zero
                  sltiu        a5, a1, 510
                  csrrwi       a4, 0x340, 23
                  mulhsu       tp, t4, a2
                  c.addi4spn   s0, sp, 32
                  divu         t3, a0, t0
                  csrrs        a0, 0x340, s1
                  add          t1, a4, a1
                  csrrw        sp, 0x340, tp
                  remu         a4, t6, s11
                  mulhsu       sp, s0, s0
                  slli         s1, a3, 11
                  c.and        s0, a4
                  divu         s10, a0, a1
                  c.lui        s2, 21
                  sltiu        tp, s0, -1112
                  mulh         a0, t2, s0
                  auipc        a0, 399530
                  xori         s4, t5, -1784
                  ori          a4, s1, -483
                  srai         zero, a2, 22
                  csrrc        a4, 0x340, zero
                  c.lui        s0, 2
                  rem          s0, t0, a4
                  slt          s8, s1, s3
                  sra          s5, a1, s1
                  srai         t1, a3, 13
                  nop
                  c.and        a2, a2
                  divu         a5, s6, t6
                  c.xor        a0, s1
                  mulh         s2, t0, tp
                  csrrwi       t3, 0x340, 5
                  div          a6, s11, a0
                  lui          s10, 213367
                  c.addi4spn   s1, sp, 912
                  csrrsi       s5, 0x340, 12
                  sltu         s9, a5, s0
                  c.or         a5, s1
                  c.addi       a2, 17
                  mulhsu       s1, a6, a2
                  c.slli       s0, 18
                  csrrw        zero, 0x340, t3
                  sra          s9, a4, t5
                  c.addi16sp   sp, 416
                  remu         a4, ra, t5
                  c.lui        s11, 31
                  nop
                  mulhsu       t5, s5, gp
                  nop
                  csrrs        sp, 0x340, zero
                  mulhsu       s9, t0, s8
                  mulh         s4, t2, s2
                  srli         s2, t2, 4
                  csrrsi       a0, 0x340, 9
                  csrrwi       sp, 0x340, 14
                  mulh         t3, a5, s7
                  c.and        a4, s1
                  addi         s6, ra, -526
                  xor          a5, a1, a0
                  c.addi16sp   sp, 192
                  csrrci       t5, 0x340, 11
                  rem          t6, s1, a6
                  csrrsi       t3, 0x340, 23
                  mulh         s0, s4, a3
                  auipc        tp, 681782
                  c.andi       a4, -1
                  ori          t0, s3, -509
                  slt          s0, a7, sp
                  lui          s11, 795470
                  slti         t3, a2, 891
                  c.nop
                  sra          s6, s0, s9
                  remu         sp, s9, s3
                  c.li         t1, 23
                  xor          a7, a1, t4
                  srai         s1, a7, 22
                  slti         a0, t2, 1602
                  mulhu        t4, ra, t5
                  rem          gp, ra, ra
                  c.mv         s10, t6
                  csrrw        s5, 0x340, t4
                  c.nop
                  c.add        a0, a5
                  mul          t5, a3, t3
                  c.nop
                  divu         t5, zero, s4
                  c.srai       a4, 10
                  c.addi       s6, -1
                  c.lui        t1, 1
                  c.addi16sp   sp, 336
                  c.slli       t5, 22
                  rem          t3, t6, tp
                  sltiu        sp, s7, 446
                  c.addi16sp   sp, -16
                  slli         t3, t5, 8
                  or           s0, t2, gp
                  remu         t6, a1, a4
                  mulh         a6, t0, t2
                  rem          s5, a4, s4
                  mulhu        a6, s10, a5
                  mulhsu       s2, t2, t0
                  xori         s8, s2, -1364
                  csrrwi       t5, 0x340, 3
                  mulhsu       s11, t4, s7
                  c.andi       a2, -1
                  divu         s5, t4, s3
                  c.and        s0, s0
                  mulhsu       s0, s1, gp
                  addi         tp, gp, 1553
                  c.add        s3, s0
                  mulh         t3, a2, s2
                  c.lui        s1, 30
                  slt          t5, a4, a5
                  remu         t5, s11, a6
                  sll          a4, t1, s3
                  div          tp, s0, s3
                  c.li         tp, 4
                  csrrw        tp, 0x340, a2
                  c.nop
                  c.or         a4, s1
                  csrrc        s8, 0x340, a3
                  mulh         sp, a4, sp
                  addi         s0, gp, -1842
                  sra          t1, s7, s11
                  sltiu        s11, zero, -31
                  c.lui        s5, 26
                  c.slli       t5, 4
                  lui          tp, 84148
                  c.add        s10, ra
                  c.nop
                  slti         a4, a3, 835
                  nop
                  c.addi4spn   a5, sp, 288
                  sltiu        s1, s4, 943
                  c.mv         s2, a6
                  mulhsu       t1, s3, t5
                  remu         sp, t1, tp
                  and          s0, t3, s6
                  csrrs        t0, 0x340, sp
                  srl          s7, a5, t4
                  srai         a0, s10, 31
                  sltu         a5, s3, s3
                  div          s10, a4, s0
                  add          zero, sp, t1
                  srai         t0, a0, 6
                  c.xor        a5, a3
                  srli         a4, s4, 6
                  c.addi16sp   sp, 480
                  divu         s11, t2, a2
                  div          a0, a2, a7
                  csrrci       s6, 0x340, 3
                  sub          s8, zero, s6
                  c.addi16sp   sp, -16
                  sltiu        gp, t3, 531
                  mulhu        a7, a3, s11
                  c.srli       a2, 13
                  or           s8, s10, a5
                  auipc        s9, 204168
                  nop
                  xori         tp, a4, 1195
                  remu         s6, t4, t0
                  c.lui        t0, 8
                  xori         t6, s4, 1966
                  c.lui        t5, 6
                  c.li         a2, -1
                  c.addi4spn   a0, sp, 240
                  csrrs        s8, 0x340, a3
                  lui          a0, 232203
                  c.andi       a4, -1
                  lui          t5, 86530
                  csrrc        ra, 0x340, zero
                  csrrsi       t1, 0x340, 28
                  sra          s2, a2, s5
                  c.add        a0, s7
                  sub          s2, s3, t5
                  sra          s10, t5, s8
                  csrrwi       s9, 0x340, 27
                  divu         s0, a0, s1
                  c.li         s9, -1
                  c.and        a4, a2
                  csrrsi       t3, 0x340, 0
                  mulh         s3, ra, s3
                  c.srai       s1, 13
                  c.nop
                  csrrw        t4, 0x340, s0
                  csrrs        tp, 0x340, a6
                  c.lui        s7, 29
                  c.li         s2, -1
                  slli         s4, zero, 4
                  csrrwi       a4, 0x340, 31
                  c.li         s4, 22
                  mulh         t4, a5, s5
                  mulhu        ra, a5, a2
                  xori         s9, s7, -219
                  c.or         a2, a5
                  andi         s6, a3, -1699
                  rem          s8, zero, ra
                  xori         a4, s1, 200
                  addi         t4, s0, 211
                  div          ra, s3, s6
                  c.addi       a5, -1
                  c.li         sp, -1
                  c.addi4spn   s1, sp, 976
                  auipc        sp, 793168
                  addi         a6, s11, -1542
                  auipc        s2, 407960
                  andi         s5, a2, -1402
                  slti         s7, s4, -661
                  c.li         a5, 24
                  csrrc        a7, 0x340, t5
                  or           s6, zero, a0
                  srl          s0, t5, tp
                  andi         s7, a1, -1347
                  csrrs        t6, 0x340, zero
                  srli         s11, t5, 9
                  sll          s2, t0, s7
                  c.andi       s1, -1
                  srli         a7, s3, 0
                  csrrc        t6, 0x340, s8
                  c.nop
                  xor          a0, s1, t3
                  c.lui        a0, 4
                  c.and        a4, a1
                  c.srai       a2, 28
                  srli         s11, s10, 18
                  csrrc        zero, 0x340, zero
                  slli         s6, s10, 22
                  c.addi16sp   sp, 496
                  c.addi       s2, 23
                  mulh         a0, a3, a4
                  csrrc        a5, 0x340, zero
                  sltu         s5, s11, t6
                  srai         sp, a6, 15
                  rem          s0, t4, s0
                  c.andi       a0, 15
                  ori          s1, s11, 1428
                  csrrci       t5, 0x340, 26
                  ori          s3, a1, 535
                  c.addi16sp   sp, -16
                  c.mv         sp, s2
                  andi         t5, s11, -462
                  csrrwi       s0, 0x340, 10
                  nop
                  c.addi       a7, -1
                  nop
                  sltiu        t1, t4, 1502
                  c.or         s0, a1
                  lui          s3, 986221
                  or           t6, t2, t5
                  mul          s3, a6, t1
                  rem          a4, s6, gp
                  sub          zero, s5, s8
                  auipc        a2, 718985
                  c.slli       s2, 4
                  mulhsu       s2, a2, t5
                  csrrs        t0, 0x340, ra
                  add          s0, a1, s5
                  div          a2, t5, s1
                  csrrci       gp, 0x340, 16
                  rem          s4, s9, s1
                  and          t1, a5, a7
                  sub          t0, t4, t2
                  sra          ra, zero, s0
                  nop
                  addi         a2, sp, 290
                  csrrw        a6, 0x340, t3
                  c.xor        a0, a1
                  div          gp, s4, t2
                  and          a5, s1, t2
                  mulhu        s0, s1, s6
                  c.slli       tp, 2
                  sub          a4, s10, s2
                  c.addi       sp, -1
                  c.addi       a5, -1
                  csrrs        s1, 0x340, zero
                  c.srai       a4, 3
                  c.or         a2, a4
                  csrrs        t4, 0x340, zero
                  c.and        a0, a3
                  divu         s4, t1, t5
                  div          t3, a4, s2
                  c.mv         a6, s3
                  c.slli       s4, 28
                  sub          a0, s11, s7
                  c.srli       a0, 3
                  sltu         s2, s5, s5
                  srli         gp, sp, 0
                  add          s5, s3, a3
                  csrrw        s11, 0x340, s4
                  c.addi16sp   sp, 192
                  and          t3, s7, t5
                  csrrc        t1, 0x340, zero
                  srai         sp, zero, 23
                  c.slli       tp, 18
                  sll          zero, t6, gp
                  xor          s3, tp, s3
                  mulhsu       t4, a7, t3
                  c.sub        s1, a3
                  sra          a6, s0, t3
                  csrrs        s0, 0x340, tp
                  or           a5, a0, s11
                  sll          t4, t1, ra
                  c.slli       t6, 15
                  divu         ra, t5, s4
                  csrrs        t5, 0x340, gp
                  sltiu        zero, t1, 2034
                  csrrci       s1, 0x340, 0
                  xor          a5, t1, s9
                  and          s1, a2, gp
                  nop
                  c.xor        a2, a1
                  add          s8, s10, t3
                  xori         s11, a7, -1143
                  nop
                  c.or         s1, a4
                  mulhu        s4, a0, t5
                  c.addi       a6, -1
                  xor          t3, s3, t2
                  csrrc        tp, 0x340, t5
                  remu         s4, s5, zero
                  c.nop
                  csrrs        s0, 0x340, zero
                  add          s6, a6, s2
                  csrrs        a7, 0x340, t3
                  c.addi       s1, -1
                  csrrw        t5, 0x340, t1
                  c.lui        s0, 9
                  c.li         s8, 7
                  c.srai       a5, 12
                  c.slli       a2, 16
                  mulhu        s3, a2, a4
                  and          a4, s10, gp
                  srai         zero, a5, 10
                  csrrw        a7, 0x340, tp
                  c.srai       s1, 26
                  csrrs        s10, 0x340, zero
                  xori         a0, t6, -1770
                  andi         t3, t0, -1834
                  sub          ra, t6, t3
                  nop
                  c.srli       a0, 11
                  auipc        t0, 178580
                  mulhu        s0, s5, a2
                  c.lui        s7, 7
                  lui          s9, 935805
                  csrrci       gp, 0x340, 0
                  lui          s7, 313239
                  lui          zero, 958680
                  csrrw        a0, 0x340, a0
                  slt          s0, s7, t4
                  sltiu        a0, s11, -910
                  csrrwi       s8, 0x340, 12
                  csrrw        a5, 0x340, s5
                  c.or         a5, a5
                  c.andi       a5, 18
                  c.slli       s7, 22
                  c.andi       a0, -1
                  csrrs        gp, 0x340, zero
                  srai         s2, s0, 14
                  lui          t6, 165772
                  ori          a5, t0, -1164
                  c.xor        a5, a5
                  auipc        s3, 881695
                  rem          s0, ra, s9
                  c.mv         s5, a5
                  csrrci       sp, 0x340, 0
                  csrrs        s8, 0x340, t1
                  ori          a7, s8, -1540
                  div          sp, a0, s0
                  lui          t5, 238008
                  xori         s2, s7, 864
                  c.mv         gp, s11
                  c.addi       s9, -1
                  csrrw        t6, 0x340, s10
                  addi         a5, a6, 979
                  ori          t0, tp, -1326
                  c.sub        a2, s0
                  c.slli       t4, 10
                  c.sub        s1, a3
                  andi         t1, s6, 321
                  c.addi4spn   a4, sp, 848
                  csrrci       a5, 0x340, 0
                  nop
                  sltu         gp, ra, s4
                  c.add        t5, s5
                  xor          ra, s6, a0
                  divu         s1, s4, a6
                  srai         t1, s3, 11
                  and          a2, s5, a1
                  c.li         s6, -1
                  remu         a4, gp, s6
                  c.slli       s7, 3
                  sll          a7, t3, a5
                  c.sub        a2, a2
                  csrrsi       s7, 0x340, 29
                  c.addi4spn   a4, sp, 112
                  c.sub        a2, a0
                  slti         s2, zero, -1833
                  c.srli       a2, 13
                  ori          zero, sp, -983
                  c.nop
                  c.addi       gp, -1
                  csrrsi       tp, 0x340, 1
                  c.lui        s8, 22
                  c.srai       a5, 5
                  c.slli       t5, 2
                  xori         ra, t6, -1562
                  mulh         s8, a7, s0
                  andi         s4, ra, -1296
                  xor          t3, a0, s0
                  mul          s6, s6, zero
                  c.li         t1, 4
                  csrrc        t0, 0x340, tp
                  c.li         a7, 24
                  addi         a7, a2, 723
                  srl          s0, s3, s6
                  slti         s0, a0, 248
                  slli         a6, a1, 6
                  c.xor        a4, s0
                  rem          t6, s3, gp
                  c.li         s11, -1
                  c.addi       tp, -1
                  c.or         s1, a2
                  divu         sp, a1, a7
                  c.addi       a5, -1
                  c.and        a0, s0
                  sll          s8, t2, a2
                  add          s6, a2, s6
                  sub          s8, t5, t2
                  xori         t6, a0, -134
                  c.slli       t0, 6
                  sub          s8, t2, zero
                  and          t0, t0, s5
                  addi         s8, t2, 209
                  sra          a7, t1, a6
                  sltiu        s3, s1, -1180
                  c.li         s4, -1
                  c.srai       s1, 28
                  slti         sp, a0, -536
                  sub          s9, s3, t0
                  c.or         a0, a3
                  c.sub        s1, s0
                  slti         t1, s6, -327
                  csrrwi       t3, 0x340, 30
                  c.nop
                  csrrc        a6, 0x340, zero
                  srl          a4, a4, s8
                  lui          s7, 679860
                  auipc        t3, 588664
                  sltiu        s7, a0, -506
                  csrrs        a5, 0x340, a3
                  srl          a6, s6, sp
                  c.lui        t4, 27
                  mulhu        t4, s6, t3
                  c.slli       t5, 25
                  mul          a7, t6, tp
                  c.xor        s0, a1
                  slt          s8, zero, s11
                  srli         t5, s7, 9
                  c.andi       a2, 7
                  mulhu        s8, a1, s0
                  auipc        a2, 503100
                  sra          zero, a4, s11
                  csrrsi       s10, 0x340, 0
                  csrrs        a7, 0x340, zero
                  c.lui        s10, 17
                  c.nop
                  or           gp, s10, a5
                  c.addi       t5, 30
                  c.xor        a4, s1
                  c.mv         a7, t2
                  csrrsi       a2, 0x340, 8
                  xori         s6, tp, 777
                  mulhsu       a7, t4, a7
                  c.li         a6, 27
                  slt          s3, t1, s5
                  mulh         s8, a0, a2
                  add          t0, s11, s8
                  auipc        sp, 541798
                  c.andi       a4, -1
                  c.nop
                  csrrc        sp, 0x340, t1
                  ori          t4, a6, -1821
                  or           a7, a6, s4
                  slti         sp, t3, -788
                  srai         t5, zero, 13
                  c.and        s1, a3
                  sub          s5, t3, a5
                  c.slli       t1, 10
                  add          s3, gp, t3
                  slli         s11, a5, 11
                  remu         sp, s4, s4
                  nop
                  srai         tp, a7, 26
                  c.srai       a4, 3
                  sltiu        t5, a3, 1679
                  sub          s2, t3, s4
                  c.xor        a0, a5
                  xori         ra, t3, -404
                  c.sub        a4, a5
                  c.srai       s1, 29
                  or           ra, s11, s1
                  slti         tp, a2, 1224
                  c.addi4spn   s0, sp, 832
                  slti         gp, s10, 550
                  addi         s1, t6, 472
                  csrrs        s6, 0x340, s2
                  c.or         a4, a1
                  c.sub        a0, a1
                  csrrsi       ra, 0x340, 0
                  c.addi       t3, 10
                  addi         s11, s9, -1312
                  divu         t3, a3, s2
                  c.addi16sp   sp, -16
                  srai         s9, ra, 15
                  csrrwi       s2, 0x340, 13
                  and          a6, t0, s0
                  c.lui        s11, 7
                  nop
                  slt          gp, t3, s7
                  srli         sp, s11, 2
                  or           s6, a5, s0
                  csrrwi       gp, 0x340, 17
                  nop
                  mul          t0, gp, t6
                  sra          tp, s2, a7
                  csrrci       sp, 0x340, 24
                  c.nop
                  mulhu        s5, sp, s9
                  c.addi16sp   sp, 368
                  c.sub        a0, a1
                  sltu         a2, s3, a4
                  c.and        a2, a0
                  c.addi       sp, -1
                  rem          s9, t3, a6
                  srl          s1, s1, a1
                  c.lui        s2, 30
                  csrrs        s7, 0x340, zero
                  sra          s10, s5, a6
                  srl          zero, t1, a2
                  nop
                  csrrs        s4, 0x340, zero
                  c.and        s1, a5
                  rem          s9, a1, sp
                  mulhu        t6, s6, s2
                  csrrsi       a0, 0x340, 6
                  sltu         a2, a7, ra
                  c.srai       s1, 30
                  csrrs        a4, 0x340, zero
                  mulhsu       s5, t5, s6
                  c.addi16sp   sp, 192
                  xori         a5, s2, -1219
                  or           gp, t5, zero
                  slli         s6, a4, 1
                  c.sub        s0, a3
                  c.lui        s0, 22
                  mul          a5, t4, s1
                  c.addi       t6, 12
                  or           t1, s3, a7
                  c.addi16sp   sp, 160
                  xor          a7, s6, s0
                  xori         s1, t4, -323
                  c.xor        a2, a3
                  c.andi       s1, 19
                  c.or         a2, a4
                  csrrwi       sp, 0x340, 23
                  sra          zero, gp, a5
                  sltiu        s6, ra, 1167
                  xori         a0, s2, -706
                  c.andi       s1, 21
                  srl          gp, tp, t3
                  c.sub        a4, a1
                  auipc        t4, 252050
                  srli         t5, s7, 7
                  c.li         sp, -1
                  slt          s2, s2, t4
                  c.li         a0, -1
                  andi         zero, t0, -1731
                  rem          sp, a4, t3
                  rem          s4, s3, a2
                  slli         ra, gp, 15
                  c.li         s10, 25
                  div          s5, s7, s5
                  csrrc        a2, 0x340, gp
                  lui          sp, 212889
                  c.srli       a4, 17
                  c.mv         s5, s5
                  c.addi4spn   a5, sp, 384
                  c.and        a2, a2
                  and          gp, s5, s4
                  c.addi4spn   a4, sp, 544
                  c.andi       s1, 27
                  nop
                  c.lui        a5, 22
                  remu         ra, t1, t4
                  csrrci       t3, 0x340, 0
                  c.mv         s2, s2
                  divu         a6, t6, a1
                  xori         s10, zero, -1278
                  slt          s9, gp, zero
                  c.addi16sp   sp, 112
                  sltiu        s7, a3, 152
                  csrrwi       t1, 0x340, 13
                  c.addi16sp   sp, 464
                  slt          t3, a6, a2
                  mulh         ra, a6, s5
                  mulhu        s9, s6, t2
                  mulhu        s6, ra, sp
                  csrrwi       s11, 0x340, 10
                  slt          s5, a0, s5
                  csrrc        ra, 0x340, t3
                  auipc        t6, 159826
                  mulh         a4, s6, t0
                  c.addi16sp   sp, 320
                  srl          t6, t3, gp
                  mulh         a6, t3, a5
                  c.addi       a6, -1
                  auipc        ra, 449308
                  c.mv         s1, s0
                  c.srai       a2, 7
                  divu         t1, t0, s0
                  nop
                  remu         s4, s8, zero
                  sub          gp, gp, s1
                  sra          tp, a5, s4
                  slli         s10, t0, 4
                  remu         s6, t3, s7
                  add          s7, a2, s2
                  lui          s3, 988888
                  srl          ra, t5, t4
                  sltu         a2, t6, s8
                  or           t3, s0, s3
                  ori          gp, t3, 1300
                  slti         t3, t4, 1520
                  c.and        a4, a2
                  divu         s0, t3, s5
                  csrrsi       ra, 0x340, 0
                  sltiu        s0, a3, -934
                  nop
                  c.lui        s0, 25
                  c.srli       a4, 21
                  csrrwi       a7, 0x340, 31
                  srl          s10, s10, a2
                  srli         s4, ra, 23
                  c.lui        tp, 25
                  mul          t5, t1, s10
                  addi         a7, t5, -1634
                  c.lui        ra, 27
                  c.li         s4, -1
                  c.addi       a4, -1
                  addi         s2, ra, 1799
                  xori         a4, s4, 442
                  nop
                  and          t4, s10, s1
                  ori          s1, zero, 221
                  c.addi16sp   sp, 368
                  mul          s10, a1, tp
                  divu         tp, sp, s10
                  c.srli       s0, 12
                  srai         s10, t4, 29
                  sltu         s8, s8, a3
                  mulhu        s1, zero, t2
                  divu         s10, a0, tp
                  c.add        t0, t3
                  sra          t3, s4, a2
                  lui          s2, 939412
                  nop
                  c.andi       a5, -1
                  c.add        t0, a4
                  xor          s1, a5, a3
                  c.srai       a4, 31
                  ori          zero, a7, -1633
                  slli         s8, a1, 11
                  c.xor        s0, a2
                  c.and        s0, a2
                  and          s10, t1, a5
                  c.srai       a4, 16
                  sll          s7, t5, t0
                  csrrwi       s8, 0x340, 30
                  mulh         a2, s0, t5
                  xori         t0, s3, 743
                  andi         s9, tp, -296
                  nop
                  srli         zero, a2, 17
                  c.li         ra, -1
                  slt          s5, s9, a7
                  c.nop
                  andi         a6, a3, -1592
                  slti         a7, a4, 1055
                  csrrc        t4, 0x340, zero
                  csrrwi       ra, 0x340, 11
                  slli         t1, s3, 9
                  auipc        a4, 11649
                  mulh         gp, t4, s11
                  mulh         s8, t1, t0
                  c.or         s0, s0
                  c.xor        a2, s0
                  andi         s1, s3, 886
                  c.or         s1, a0
                  csrrci       s7, 0x340, 12
                  c.srli       a4, 1
                  or           t3, t3, s0
                  c.nop
                  auipc        zero, 145566
                  csrrw        s8, 0x340, gp
                  csrrci       t1, 0x340, 0
                  andi         t0, s6, -1579
                  c.li         t3, -1
                  csrrci       sp, 0x340, 19
                  sll          a4, a4, zero
                  slli         t1, a4, 18
                  xor          s7, t0, s3
                  mulhu        sp, t6, s6
                  nop
                  srl          a4, a7, a2
                  c.sub        a5, a1
                  xor          a7, t2, tp
                  c.or         a4, a2
                  c.xor        a5, s0
                  or           a2, t0, s5
                  nop
                  divu         s4, s3, a2
                  csrrwi       t1, 0x340, 26
                  c.srai       a0, 17
                  c.andi       s0, 5
                  slt          s9, t5, a1
                  c.andi       a4, 0
                  divu         s8, s9, s5
                  c.addi       a0, 26
                  srl          a2, a4, a5
                  c.nop
                  csrrc        zero, 0x340, s10
                  lui          s2, 52828
                  c.li         t4, -1
                  csrrci       t6, 0x340, 0
                  srl          a5, s10, s0
                  c.lui        s2, 31
                  c.addi       s10, -1
                  mul          t4, t3, s3
                  c.andi       s0, 3
                  sra          s0, s0, s7
                  mulhu        a6, tp, a1
                  c.slli       t1, 3
                  c.or         s0, a2
                  sll          a0, ra, a6
                  c.add        s3, ra
                  rem          sp, t1, s6
                  c.addi4spn   a5, sp, 544
                  c.srai       a2, 1
                  andi         a2, gp, 450
                  c.li         s2, 19
                  c.andi       s0, -1
                  csrrw        sp, 0x340, tp
                  ori          t1, s1, -1336
                  c.xor        s1, a3
                  csrrc        a0, 0x340, s10
                  sll          s11, sp, s10
                  c.lui        s2, 18
                  c.slli       a7, 26
                  c.add        t3, s3
                  sub          t1, s10, s5
                  rem          s10, a3, a7
                  slli         t3, a2, 28
                  c.or         s1, s0
                  or           sp, s7, s1
                  mul          gp, zero, t1
                  csrrci       t6, 0x340, 0
                  c.sub        a5, a1
                  c.nop
                  c.addi       t0, 7
                  auipc        s5, 698083
                  c.li         t6, -1
                  div          a6, a7, zero
                  csrrs        zero, 0x340, tp
                  rem          a4, a4, s6
                  csrrsi       s8, 0x340, 0
                  slt          s6, s0, gp
                  nop
                  sll          t5, a1, a3
                  rem          s0, a5, ra
                  xor          t3, t6, s6
                  c.lui        t1, 19
                  and          a2, a4, s4
                  c.srli       s0, 14
                  c.li         s0, -1
                  remu         s5, s5, t2
                  c.addi16sp   sp, 272
                  c.addi       t5, -1
                  sub          t3, gp, a2
                  auipc        s1, 887184
                  c.mv         gp, tp
                  lui          t5, 592712
                  sra          s7, a3, a5
                  csrrc        t3, 0x340, s7
                  c.srli       s1, 13
                  c.addi16sp   sp, -16
                  c.nop
                  c.srli       s0, 30
                  and          tp, s4, a2
                  slt          a4, zero, s3
                  nop
                  nop
                  andi         ra, s9, 1296
                  sltu         s5, sp, t5
                  andi         s10, t4, -1572
                  c.andi       a4, 3
                  csrrwi       t5, 0x340, 4
                  auipc        s6, 796454
                  sub          s9, t1, t4
                  mulh         s9, a1, s0
                  sra          s6, s0, s1
                  srai         t6, t5, 24
                  c.lui        a6, 20
                  c.srai       s0, 12
                  c.nop
                  divu         t6, a5, zero
                  csrrci       s9, 0x340, 0
                  c.mv         a5, ra
                  c.mv         s3, s11
                  mulhsu       a2, a5, a6
                  csrrw        a6, 0x340, a3
                  mulhu        a6, t3, s5
                  csrrs        s1, 0x340, s10
                  andi         s10, t3, 1788
                  c.addi4spn   s1, sp, 448
                  xor          s9, tp, gp
                  addi         s3, a4, 719
                  mul          ra, t4, a3
                  ori          s2, s8, -728
                  sra          s0, t2, s7
                  add          t5, s5, a1
                  csrrw        a7, 0x340, s0
                  divu         sp, t2, a2
                  c.srli       s1, 11
                  srli         t6, t6, 20
                  c.addi       t1, -1
                  c.add        sp, gp
                  slt          a5, s4, s3
                  slt          s0, s10, t0
                  sra          s11, t0, a0
                  addi         zero, s6, -859
                  sltu         s6, s1, t0
                  csrrw        t4, 0x340, a1
                  nop
                  or           t3, s1, s5
                  divu         a2, t0, s9
                  csrrwi       t1, 0x340, 28
                  c.xor        a0, s1
                  divu         ra, a1, t4
                  lui          a0, 10470
                  div          a5, s5, s3
                  csrrw        t0, 0x340, a7
                  sll          s4, s0, s3
                  c.or         a2, a4
                  sltu         t4, s7, t4
                  lui          a0, 358853
                  c.mv         s5, s11
                  c.nop
                  c.lui        t6, 23
                  sll          s11, t3, s11
                  c.addi4spn   s0, sp, 208
                  sltu         s7, t0, t2
                  addi         ra, t4, -983
                  c.xor        s0, a3
                  srai         a6, s6, 29
                  slti         tp, tp, 200
                  nop
                  xor          s11, s2, ra
                  c.addi16sp   sp, -16
                  auipc        a5, 192903
                  c.xor        s0, a5
                  c.li         s10, -1
                  mulhsu       t5, gp, s8
                  ori          t3, s4, -1949
                  sub          s6, a1, s7
                  rem          a5, s4, a5
                  xori         t1, s8, -1854
                  csrrs        s10, 0x340, zero
                  remu         t3, s2, t0
                  c.or         s0, a2
                  c.mv         s6, a2
                  c.and        s1, a1
                  c.or         a4, a1
                  xor          t3, s3, s10
                  c.addi16sp   sp, 256
                  mul          zero, a5, t5
                  add          s5, a6, t4
                  c.xor        a2, s0
                  sub          sp, t4, s5
                  c.andi       a4, 7
                  c.xor        s0, a4
                  slli         a0, s9, 15
                  sll          s2, t0, a5
                  rem          s7, a5, a2
                  andi         t5, s1, -153
                  c.srli       a4, 18
                  csrrci       t4, 0x340, 0
                  mulhsu       s3, t5, a2
                  slt          s2, s11, sp
                  slli         s11, s4, 31
                  slt          a6, a1, s2
                  c.srli       s0, 21
                  c.sub        a0, a3
                  remu         sp, t0, a3
                  rem          s7, s7, s9
                  or           s1, t6, s11
                  div          gp, a3, t6
                  c.andi       a4, 14
                  sltiu        s3, t1, 567
                  c.slli       s11, 31
                  c.add        s0, s6
                  slti         s3, a1, -444
                  xori         t5, s9, 709
                  lui          a5, 981414
                  c.slli       s0, 31
                  c.slli       a7, 2
                  csrrw        sp, 0x340, gp
                  c.addi4spn   a2, sp, 896
                  slti         t5, s10, 55
                  srl          s0, a1, s3
                  slli         tp, t5, 4
                  c.slli       s9, 6
                  mulhu        t0, s1, s4
                  csrrci       a0, 0x340, 0
                  c.addi       s7, -1
                  c.or         a0, a3
                  csrrs        s2, 0x340, zero
                  c.or         a4, a1
                  c.li         t1, 14
                  csrrw        a0, 0x340, t2
                  c.srli       a2, 19
                  xori         t0, ra, -1138
                  c.nop
                  divu         gp, s0, s10
                  c.lui        tp, 21
                  srl          s7, a4, s9
                  sltu         a4, ra, s3
                  c.addi16sp   sp, 464
                  mulhsu       t3, s9, sp
                  c.slli       s7, 27
                  mulh         s4, s9, gp
                  mul          s10, t4, gp
                  slti         a5, t1, 120
                  c.sub        a4, a2
                  div          s3, tp, t3
                  csrrci       zero, 0x340, 17
                  csrrs        tp, 0x340, zero
                  slli         t3, s6, 23
                  sltu         zero, a6, a2
                  srli         a6, t6, 12
                  c.xor        s0, a0
                  nop
                  c.lui        t1, 16
                  xori         s0, t5, -1025
                  c.addi4spn   s0, sp, 192
                  lui          tp, 233669
                  divu         a6, a2, ra
                  csrrs        a7, 0x340, zero
                  c.lui        t0, 9
                  srli         tp, zero, 24
                  mulhsu       s0, gp, t5
                  csrrsi       s5, 0x340, 9
                  ori          t0, t3, -799
                  c.lui        a0, 15
                  c.add        s3, s7
                  and          a5, a7, s2
                  sltiu        t1, t6, 1191
                  c.and        a2, a1
                  slt          s6, t5, t2
                  slli         sp, a6, 9
                  c.nop
                  remu         t6, t1, s8
                  c.slli       sp, 3
                  c.mv         sp, s4
                  csrrsi       s3, 0x340, 0
                  c.lui        s6, 16
                  c.li         s3, 21
                  or           s11, tp, a2
                  xor          zero, a2, s2
                  csrrc        ra, 0x340, zero
                  csrrc        a4, 0x340, s8
                  c.li         s2, 16
                  slli         t6, t5, 6
                  and          ra, a6, a1
                  csrrsi       s11, 0x340, 0
                  mul          sp, a0, ra
                  xor          s1, s6, ra
                  c.sub        a4, a2
                  slli         sp, t4, 11
                  addi         t6, s4, 1817
                  csrrs        a2, 0x340, s0
                  slli         s2, t2, 15
                  c.andi       s1, 29
                  ori          a7, s10, -1185
                  auipc        s5, 943515
                  c.or         a2, a3
                  csrrs        a0, 0x340, s9
                  addi         a4, a3, -1009
                  xori         t4, t4, 1232
                  xori         t0, a5, -1076
                  remu         t4, t2, a7
                  div          t1, t1, t6
                  c.addi16sp   sp, -16
                  divu         ra, t5, s3
                  div          a0, s4, s0
                  c.addi4spn   a2, sp, 784
                  mulhsu       s3, gp, sp
                  sra          s6, ra, t5
                  sub          t0, s4, s5
                  sltiu        s9, s0, 343
                  ori          s9, s6, 1146
                  slli         zero, a6, 16
                  csrrci       a2, 0x340, 23
                  addi         s2, s3, 1287
                  c.mv         s1, t0
                  c.addi       sp, -1
                  add          tp, s11, s4
                  addi         s9, t0, -848
                  auipc        s2, 175435
                  c.add        s4, t0
                  csrrs        s1, 0x340, zero
                  c.srai       s0, 12
                  xori         s3, s8, -635
                  sra          s9, a6, t6
                  c.li         t0, 4
                  c.xor        a5, a1
                  xori         s11, s3, 1458
                  andi         a4, s10, -993
                  andi         a7, s9, 497
                  c.add        tp, s5
                  c.and        s1, a5
                  c.and        a0, a3
                  c.addi4spn   s0, sp, 528
                  or           s2, s5, t1
                  andi         s0, zero, 1913
                  andi         s9, t1, -1451
                  sub          t4, t5, zero
                  ori          gp, gp, 285
                  csrrci       s8, 0x340, 1
                  csrrwi       t5, 0x340, 18
                  srli         s10, s0, 24
                  c.li         s6, -1
                  or           t3, s4, a5
                  c.and        a5, a1
                  ori          t6, a4, 1054
                  sub          s1, gp, zero
                  csrrwi       a7, 0x340, 30
                  andi         zero, a3, 136
                  c.addi4spn   s1, sp, 880
                  c.andi       a5, -1
                  srai         s8, a4, 23
                  srl          t4, s10, a7
                  c.andi       s0, 31
                  srli         s1, s4, 9
                  c.and        a4, a5
                  mul          s4, s4, t2
                  srl          tp, a6, tp
                  c.sub        s0, a1
                  c.addi4spn   s0, sp, 688
                  c.slli       t6, 26
                  srli         s6, s7, 24
                  slt          a0, a1, s9
                  add          t6, s6, tp
                  c.addi4spn   a5, sp, 112
                  csrrsi       s8, 0x340, 0
                  c.mv         a5, s6
                  c.slli       a4, 3
                  andi         s8, t1, 1151
                  rem          s6, gp, s11
                  c.lui        s8, 19
                  remu         t1, a5, s1
                  andi         a4, s4, 1170
                  divu         s6, t6, ra
                  lui          s8, 750431
                  csrrci       s4, 0x340, 5
                  c.and        a4, a4
                  csrrs        a5, 0x340, zero
                  c.li         s9, -1
                  c.addi       s0, -1
                  addi         s10, s6, 993
                  auipc        gp, 856757
                  andi         t4, ra, 1680
                  c.li         t3, -1
                  slli         s0, a7, 7
                  c.andi       a4, 7
                  slti         tp, t4, -43
                  csrrw        t0, 0x340, zero
                  slli         s6, t5, 27
                  nop
                  sra          a4, s7, t6
                  lui          s0, 51163
                  c.srai       a5, 31
                  rem          tp, a4, a1
                  mulhu        s3, zero, a7
                  csrrc        zero, 0x340, t6
                  rem          s8, s1, gp
                  c.addi4spn   a5, sp, 400
                  slli         a2, s1, 9
                  c.li         t1, 8
                  c.sub        a2, a4
                  or           a0, s7, s8
                  sub          ra, t5, t0
                  divu         t3, s8, s7
                  c.srli       a0, 20
                  sltu         s1, ra, t4
                  remu         t1, s5, tp
                  csrrci       a4, 0x340, 0
                  and          a0, t2, s10
                  andi         t1, t6, 237
                  csrrwi       s0, 0x340, 26
                  slt          a2, gp, s2
                  c.srli       s1, 17
                  add          s4, s4, zero
                  or           a5, a7, s3
                  andi         s3, s4, -1469
                  remu         ra, t3, t2
                  c.or         a4, a2
                  sra          gp, t3, ra
                  mulhsu       s9, t3, sp
                  mulhu        s10, sp, a4
                  c.and        a2, a5
                  sub          s3, tp, s7
                  c.andi       s1, -1
                  c.srli       a0, 1
                  xor          s7, a4, s4
                  add          a7, t5, t5
                  c.li         s1, 15
                  andi         t0, a6, -998
                  c.xor        a5, a4
                  mulhu        a0, a1, s0
                  c.mv         a0, s6
                  c.addi16sp   sp, 464
                  sub          tp, tp, zero
                  c.slli       sp, 13
                  c.addi16sp   sp, 96
                  sltiu        s9, s6, -1160
                  c.lui        gp, 27
                  c.sub        s0, a5
                  sra          s3, a0, t1
                  or           a4, t1, a1
                  and          tp, s10, s4
                  c.add        a5, s4
                  xor          s6, s5, s3
                  rem          s10, ra, a6
                  xor          s10, t0, s1
                  rem          a2, a5, s9
                  sub          s6, sp, t6
                  c.or         a5, a4
                  sltiu        t0, zero, 1204
                  andi         ra, s4, 1701
                  ori          a6, s10, -1930
                  c.or         a2, a2
                  sub          tp, t1, sp
                  sll          gp, s0, t6
                  slli         a4, s2, 25
                  remu         s2, a4, s10
                  c.li         a2, -1
                  xor          s5, ra, s7
                  sra          t5, zero, t5
                  srai         t4, s1, 27
                  csrrci       t3, 0x340, 0
                  c.andi       a4, 23
                  srai         a4, s7, 13
                  divu         t0, s0, a7
                  sltu         s6, ra, t6
                  sltiu        t4, a0, 922
                  andi         s11, s7, -467
                  c.lui        ra, 14
                  sll          gp, s5, sp
                  sra          a7, s10, t5
                  c.mv         a7, s10
                  csrrw        s10, 0x340, s1
                  c.or         a5, a3
                  c.srli       a4, 25
                  divu         a0, t4, t2
                  or           ra, a0, s2
                  sltiu        a2, zero, 1583
                  c.lui        s3, 9
                  andi         s5, a5, 7
                  andi         t0, a4, -827
                  mul          a7, s10, t6
                  c.sub        s0, a1
                  mulh         a7, s6, s8
                  c.srai       a2, 8
                  c.lui        tp, 10
                  csrrsi       a4, 0x340, 14
                  c.li         ra, 11
                  csrrs        t6, 0x340, zero
                  csrrci       s9, 0x340, 0
                  slti         ra, t1, -1642
                  nop
                  csrrsi       s11, 0x340, 19
                  srli         s3, s2, 28
                  mulh         s4, t3, zero
                  ori          s3, s11, -1570
                  csrrsi       gp, 0x340, 6
                  sltu         t5, ra, s1
                  c.srli       a4, 28
                  mulh         t6, a2, s4
                  csrrw        t3, 0x340, a0
                  csrrsi       a7, 0x340, 0
                  csrrsi       a2, 0x340, 30
                  c.addi16sp   sp, 96
                  mulh         s1, t5, s2
                  slli         a4, s8, 7
                  c.addi16sp   sp, 64
                  slt          ra, s7, a4
                  add          t0, tp, s6
                  c.xor        a2, a5
                  slli         s0, t6, 10
                  sub          a4, a0, a4
                  c.addi16sp   sp, 144
                  srl          t5, s6, zero
                  c.xor        a2, s0
                  c.nop
                  c.addi4spn   s1, sp, 784
                  auipc        sp, 319192
                  sltu         s4, tp, a5
                  c.srai       a0, 22
                  srl          gp, t6, t0
                  c.addi16sp   sp, 496
                  xori         s1, a3, 533
                  c.lui        s10, 8
                  add          ra, s0, s0
                  andi         ra, a3, -707
                  sll          s1, s8, t4
                  remu         t5, sp, s4
                  nop
                  c.or         a5, s0
                  nop
                  csrrsi       s1, 0x340, 13
                  xor          s11, t0, a0
                  srl          s10, s2, s8
                  csrrwi       s3, 0x340, 24
                  csrrci       t0, 0x340, 0
                  c.and        a5, a2
                  mulhsu       s10, gp, a3
                  c.sub        a4, a4
                  c.or         s1, s0
                  remu         t0, t1, s8
                  lui          t0, 287385
                  auipc        t4, 434853
                  csrrci       t1, 0x340, 8
                  addi         s5, zero, 400
                  sltiu        ra, sp, 1732
                  lui          sp, 552567
                  andi         zero, t3, 1073
                  nop
                  mulh         a0, gp, t6
                  srli         s3, ra, 15
                  c.addi4spn   a5, sp, 832
                  srai         s8, s4, 1
                  mulhu        a2, a0, t4
                  csrrs        s4, 0x340, s4
                  srli         s0, tp, 10
                  add          t5, s6, t2
                  andi         s11, zero, 2035
                  mulh         s2, s6, a2
                  c.xor        s1, a5
                  or           s2, t4, t2
                  rem          s5, a4, a5
                  lui          s0, 121844
                  csrrci       a7, 0x340, 14
                  xor          a6, gp, s9
                  csrrwi       tp, 0x340, 17
                  c.or         a4, a5
                  c.andi       a5, -1
                  sra          t1, zero, gp
                  c.add        s9, s2
                  c.xor        a5, a4
                  c.srai       s0, 13
                  mulh         zero, zero, s1
                  csrrsi       gp, 0x340, 0
                  xor          sp, a1, s4
                  c.slli       a6, 12
                  c.add        s4, s7
                  xor          gp, s10, a7
                  c.addi       t3, -1
                  div          s10, a2, s3
                  c.add        s11, a3
                  csrrs        s11, 0x340, a1
                  mul          t0, ra, s2
                  ori          t6, t5, 58
                  mulh         s10, a6, a6
                  sub          s8, t0, s9
                  c.lui        t0, 1
                  c.or         a5, s0
                  ori          s6, gp, 1608
                  or           a0, a5, s6
                  c.addi       s6, -1
                  lui          t5, 178917
                  mulhsu       s10, a7, s11
                  c.srli       a2, 19
                  csrrwi       s1, 0x340, 7
                  csrrwi       s3, 0x340, 16
                  div          s2, s9, t4
                  c.li         a6, 11
                  add          s4, t3, t4
                  mul          ra, s5, t6
                  slli         s5, a3, 3
                  c.andi       s1, -1
                  c.srai       s1, 4
                  mulh         gp, s0, t5
                  c.or         a0, a4
                  c.addi4spn   a0, sp, 560
                  slti         s11, a3, -1517
                  slt          t6, a4, a1
                  c.addi4spn   a2, sp, 240
                  c.srli       a4, 11
                  c.slli       gp, 9
                  c.lui        s1, 24
                  sltu         a0, a4, t6
                  csrrci       a6, 0x340, 0
                  c.li         t5, 4
                  srli         a5, zero, 13
                  c.li         s6, 23
                  addi         t6, a1, 1181
                  csrrc        s9, 0x340, zero
                  csrrc        s0, 0x340, ra
                  csrrci       s6, 0x340, 0
                  mul          a7, s3, a4
                  srl          a0, s5, a5
                  c.and        s0, a0
                  rem          t4, a2, gp
                  c.addi16sp   sp, 96
                  sll          t1, t4, zero
                  sltiu        sp, s7, 1965
                  csrrs        sp, 0x340, zero
                  c.or         s0, a1
                  csrrw        s3, 0x340, t1
                  sltiu        t3, s7, 1339
                  csrrwi       s11, 0x340, 1
                  or           t3, t1, a0
                  c.addi       s4, -1
                  mulh         t3, s4, s5
                  c.xor        a0, s1
                  auipc        t6, 826908
                  slli         t0, a2, 19
                  c.srli       a4, 1
                  mulhsu       t1, t2, s5
                  srai         t4, a6, 7
                  nop
                  and          s0, ra, zero
                  csrrs        t3, 0x340, s1
                  mulhu        t5, t0, a4
                  srai         zero, s2, 28
                  sub          s3, s7, a7
                  srl          sp, s9, t3
                  srl          t4, ra, a4
                  c.and        a5, a5
                  srai         t0, gp, 17
                  c.andi       a2, 16
                  remu         s1, s6, t4
                  c.and        a5, a4
                  mul          ra, t4, t5
                  c.mv         s5, s4
                  ori          a6, s8, 1494
                  c.mv         gp, sp
                  c.and        a0, a5
                  srli         a4, t4, 0
                  divu         ra, t3, s2
                  andi         s1, t4, -941
                  mul          a0, s0, t2
                  lui          a2, 628970
                  c.andi       s1, 31
                  c.xor        s0, s0
                  auipc        a2, 988447
                  rem          s1, t3, s5
                  mulh         s7, t3, sp
                  csrrs        s4, 0x340, zero
                  slti         a0, s7, 1872
                  c.addi16sp   sp, 48
                  c.srai       a2, 11
                  csrrw        s2, 0x340, a3
                  c.xor        a4, s1
                  c.andi       a4, 17
                  csrrw        ra, 0x340, s10
                  slli         s0, a5, 27
                  c.nop
                  auipc        a2, 644237
                  mulhsu       s11, s2, t4
                  sltu         s10, s7, sp
                  and          sp, a1, a4
                  slli         zero, s6, 13
                  c.lui        t0, 16
                  slti         s6, s5, 891
                  c.addi       s7, 11
                  mul          t3, tp, t4
                  and          a4, s5, s9
                  mulhsu       a0, s0, t3
                  srai         t6, s0, 6
                  remu         s10, s11, s4
                  c.xor        a2, a2
                  c.addi4spn   s0, sp, 992
                  slli         a5, a2, 5
                  c.nop
                  c.sub        a4, a2
                  divu         t3, s11, s5
                  slt          s11, s6, s11
                  csrrci       t5, 0x340, 20
                  csrrc        a2, 0x340, s10
                  andi         t5, t1, -1398
                  c.lui        s7, 18
                  sltiu        tp, a0, -909
                  csrrc        ra, 0x340, s3
                  sub          a4, a4, t3
                  c.sub        a5, a0
                  c.xor        a5, a1
                  andi         s7, t1, 1536
                  csrrsi       s5, 0x340, 0
                  sltu         s9, a4, a0
                  xori         s5, a1, -657
                  sltu         s4, s6, a5
                  c.addi       s6, -1
                  c.or         a5, a1
                  c.mv         a0, a0
                  mulhsu       s11, a6, t4
                  csrrw        t3, 0x340, t1
                  sra          t4, t0, s11
                  mulh         s10, t3, t3
                  mul          sp, t4, ra
                  slt          s9, a7, s7
                  nop
                  remu         t5, s7, a6
                  c.li         a7, -1
                  c.srai       a0, 18
                  c.lui        t3, 6
                  c.li         t5, -1
                  csrrw        t6, 0x340, s6
                  sltiu        s1, a6, 1049
                  c.addi16sp   sp, 288
                  c.slli       s0, 3
                  c.addi       s5, 31
                  sltiu        a2, a1, -1806
                  c.addi16sp   sp, -16
                  slt          s4, t2, a3
                  c.lui        t4, 16
                  nop
                  c.or         s0, a1
                  csrrc        t0, 0x340, zero
                  addi         a4, t4, -1111
                  c.and        a0, a1
                  c.addi       a6, 8
                  srli         s1, s3, 31
                  srai         a6, s5, 1
                  divu         a6, a6, s4
                  xor          s10, s6, a3
                  ori          gp, gp, -1609
                  c.srli       a2, 25
                  mulhu        s10, s7, s2
                  rem          a4, s10, tp
                  csrrwi       s10, 0x340, 15
                  xor          gp, s11, s2
                  c.addi4spn   a0, sp, 880
                  c.xor        a0, a4
                  c.add        sp, s11
                  csrrwi       t6, 0x340, 21
                  c.addi       t6, 19
                  csrrwi       s3, 0x340, 17
                  srl          s7, s5, s11
                  c.srli       a4, 1
                  add          s11, s6, s0
                  c.add        a0, a7
                  c.and        s0, a5
                  c.srai       a4, 27
                  c.xor        a2, s1
                  csrrci       s6, 0x340, 7
                  rem          s8, t4, t4
                  c.andi       s1, 22
                  csrrc        s4, 0x340, t2
                  c.addi       a2, -1
                  auipc        gp, 497652
                  c.nop
                  srli         a7, s8, 30
                  and          a7, s1, s6
                  sltu         a0, s11, a4
                  c.add        s4, t4
                  addi         s2, t3, 1679
                  div          ra, s2, t4
                  c.li         t1, 27
                  c.add        sp, s3
                  csrrc        a0, 0x340, zero
                  div          zero, t6, t4
                  add          s0, s10, a4
                  c.addi4spn   s1, sp, 480
                  sub          a0, t2, s0
                  mulhsu       s9, s3, gp
                  slti         s8, a7, -586
                  ori          s2, t4, -1147
                  and          s8, a5, gp
                  c.or         s1, a0
                  and          s5, s6, t1
                  auipc        s10, 525574
                  sll          t6, t3, s6
                  c.mv         a4, t1
                  sub          a6, a4, a7
                  c.xor        s1, a4
                  andi         t3, s8, 217
                  slt          t3, t6, t6
                  mul          a7, s1, s4
                  c.srai       a0, 30
                  xori         a4, s0, 1606
                  lui          t0, 535271
                  andi         a0, a6, 95
                  srl          s1, s5, sp
                  add          t6, ra, tp
                  c.or         a2, s0
                  c.xor        a2, a5
                  c.nop
                  xori         s9, t1, 128
                  csrrs        ra, 0x340, zero
                  c.sub        a0, a3
                  sub          s3, t2, t3
                  sra          a2, t1, s8
                  c.addi       s7, -1
                  csrrs        s10, 0x340, zero
                  remu         s1, t3, a4
                  slli         a7, ra, 0
                  csrrs        s11, 0x340, zero
                  csrrc        a2, 0x340, zero
                  mulhu        a0, s3, tp
                  sltu         a6, a6, s5
                  add          t6, a2, ra
                  csrrs        t4, 0x340, zero
                  lui          t6, 719787
                  csrrs        zero, 0x340, zero
                  c.and        a2, a3
                  div          a5, a7, a4
                  csrrsi       s4, 0x340, 6
                  mulhsu       sp, a4, s11
                  c.lui        t0, 10
                  csrrc        gp, 0x340, s3
                  c.nop
                  csrrwi       s9, 0x340, 23
                  remu         t3, ra, a5
                  c.mv         t1, a3
                  c.addi4spn   a0, sp, 448
                  c.nop
                  div          a4, t4, s2
                  csrrci       zero, 0x340, 0
                  c.add        s3, t3
                  mulhu        s7, s9, t4
                  c.add        s0, a4
                  add          s10, s10, a2
                  xori         s0, a1, 478
                  add          a0, s9, a7
                  mulh         s7, a5, ra
                  c.nop
                  div          t0, a1, a2
                  c.addi16sp   sp, -16
                  c.addi4spn   s0, sp, 272
                  div          s9, s1, s0
                  or           a7, t6, a3
                  c.srai       a5, 1
                  csrrw        zero, 0x340, a1
                  c.addi16sp   sp, -16
                  sub          t0, t3, a4
                  c.andi       a2, -1
                  c.srli       a0, 24
                  sra          a7, sp, t6
                  sltu         s3, s0, a2
                  sltu         s11, ra, s0
                  rem          a2, s7, s8
                  ori          sp, a1, 1742
                  xor          s5, t1, s9
                  mulh         a7, a2, zero
                  csrrci       t1, 0x340, 2
                  slt          zero, t5, zero
                  slti         t0, gp, 2045
                  srli         a6, s1, 25
                  or           sp, s6, tp
                  csrrwi       s11, 0x340, 23
                  xor          a6, t0, s8
                  c.srai       a4, 2
                  mulh         zero, sp, gp
                  ori          t0, t2, -252
                  auipc        s8, 502331
                  remu         s9, a2, s10
                  csrrwi       gp, 0x340, 11
                  c.andi       s0, -1
                  c.lui        s10, 11
                  c.li         s6, -1
                  rem          s9, s10, gp
                  andi         s0, s1, -1486
                  xor          a5, s9, t1
                  xor          s2, s9, s10
                  srli         t3, s10, 29
                  c.or         s0, s1
                  slti         s11, a4, -2024
                  or           s9, sp, s6
                  mulhu        s9, s7, a7
                  andi         s3, a6, 253
                  c.srai       a2, 3
                  c.addi       s0, -1
                  andi         a2, s5, -920
                  mulhu        a6, a7, t1
                  mulhsu       tp, s8, s11
                  sltu         gp, a7, a6
                  divu         ra, a3, t4
                  sltu         a2, a3, a4
                  div          tp, s10, t5
                  c.li         t5, 26
                  mulh         sp, ra, s5
                  xori         s4, a4, 1725
                  c.addi       a6, -1
                  xori         s1, s11, 550
                  c.mv         s7, t6
                  xori         s10, s5, 250
                  addi         s1, a3, -1658
                  c.add        s4, t0
                  slt          t3, sp, s9
                  csrrw        a4, 0x340, s4
                  add          t6, s4, a7
                  srai         s9, a5, 9
                  lui          tp, 71061
                  mulh         t5, s5, s5
                  csrrci       s0, 0x340, 0
                  c.srli       a4, 11
                  divu         s0, s11, s1
                  or           t6, a7, s11
                  add          s5, s5, s5
                  c.xor        a5, a3
                  c.addi16sp   sp, 192
                  srli         s4, s11, 14
                  csrrci       a7, 0x340, 0
                  c.lui        s9, 28
                  c.srli       a2, 8
                  c.addi16sp   sp, -16
                  c.addi16sp   sp, -16
                  and          tp, t4, s10
                  c.srai       s1, 24
                  c.addi       s9, -1
                  or           zero, s8, s4
                  csrrc        s8, 0x340, t4
                  addi         a5, t5, 609
                  andi         t5, t4, 743
                  sra          s7, a1, s4
                  c.addi       s10, 5
                  sll          s6, t3, s0
                  divu         s6, a4, s2
                  ori          s7, s6, -727
                  sra          gp, s10, a3
                  ori          a2, a1, -241
                  ori          s9, a6, 924
                  csrrw        t4, 0x340, a3
                  slli         s0, a3, 4
                  rem          a7, s5, a2
                  mulhsu       a7, a5, t6
                  ori          tp, a6, 1490
                  c.lui        t0, 29
                  c.srai       a5, 23
                  c.li         t6, 13
                  c.sub        a2, a2
                  c.addi       s4, -1
                  srl          sp, sp, tp
                  nop
                  and          s1, s9, a0
                  sltiu        t0, zero, 1860
                  sltiu        s0, a7, -1440
                  c.mv         t4, t3
                  csrrs        tp, 0x340, a0
                  slli         s2, a0, 9
                  c.addi4spn   a2, sp, 384
                  c.add        gp, a7
                  c.addi4spn   a5, sp, 992
                  csrrs        a5, 0x340, a1
                  c.lui        t5, 18
                  c.addi4spn   s1, sp, 928
                  xori         s4, t2, -1131
                  csrrci       a2, 0x340, 30
                  slt          ra, t0, a1
                  mul          a0, s5, t1
                  slt          s2, ra, a0
                  nop
                  csrrw        a2, 0x340, s4
                  csrrs        s9, 0x340, a0
                  sll          s11, s11, a3
                  c.andi       a2, 7
                  c.mv         a6, gp
                  c.addi       s4, 20
                  csrrwi       s7, 0x340, 19
                  xor          s4, s10, sp
                  c.addi4spn   a5, sp, 96
                  divu         s1, s6, s8
                  srai         a6, s6, 5
                  auipc        tp, 262837
                  sll          t6, a5, a2
                  add          gp, s2, tp
                  csrrc        a0, 0x340, zero
                  srli         t1, t3, 6
                  ori          s0, a2, 1258
                  addi         zero, s9, 644
                  xori         s3, s4, 19
                  andi         t3, a1, -1680
                  csrrs        s7, 0x340, ra
                  mul          t4, s0, t6
                  c.sub        a0, s1
                  mulh         sp, a6, t3
                  csrrs        s11, 0x340, a2
                  and          s5, a1, a6
                  sra          t4, t2, t0
                  c.srli       a4, 12
                  c.mv         a6, a3
                  csrrc        t1, 0x340, a7
                  and          s1, t4, a3
                  divu         s4, s10, s2
                  c.and        a5, a1
                  c.li         s8, 22
                  c.add        a7, a0
                  xor          s1, s2, ra
                  csrrs        t5, 0x340, zero
                  srai         s5, s1, 25
                  csrrw        s10, 0x340, a5
                  c.lui        s0, 14
                  c.mv         s3, t4
                  sra          s4, t2, t4
                  c.srli       a0, 18
                  mulhu        a0, s5, a0
                  sltiu        s8, t4, 453
                  lui          t3, 313398
                  c.mv         t4, a1
                  mulhsu       s8, t1, t3
                  sltu         a5, t6, s5
                  sll          a0, a1, t4
                  c.nop
                  add          a5, ra, tp
                  mulh         s5, s1, s2
                  csrrc        s5, 0x340, zero
                  xori         s7, tp, 1332
                  xori         s11, s7, -573
                  nop
                  csrrs        a6, 0x340, s1
                  c.addi16sp   sp, -16
                  c.nop
                  andi         tp, a6, -1897
                  csrrc        s8, 0x340, zero
                  c.xor        s1, s1
                  srl          s9, s2, t1
                  c.addi4spn   a0, sp, 592
                  mulhu        s10, t1, t6
                  sra          tp, s6, s11
                  sltiu        s5, s2, -42
                  c.or         a5, a0
                  lui          sp, 447988
                  add          zero, t1, s6
                  sra          tp, t0, zero
                  mulhu        s7, s0, a7
                  sra          s11, tp, s3
                  slli         zero, t1, 8
                  or           t1, s11, s1
                  c.li         s7, -1
                  mulh         s7, tp, s11
                  csrrwi       s5, 0x340, 9
                  lui          s6, 404571
                  slti         s0, a6, 857
                  and          t6, sp, s11
                  addi         gp, s1, -917
                  mulhsu       a5, s3, zero
                  c.li         s3, -1
                  slti         a5, gp, 1200
                  or           s3, a6, a0
                  c.lui        s9, 30
                  xori         ra, ra, 1174
                  c.nop
                  slt          t0, t6, s0
                  remu         ra, s5, a1
                  div          t5, gp, s11
                  slti         s0, sp, 718
                  sltu         t5, s4, s0
                  c.xor        a4, a0
                  c.addi4spn   a2, sp, 320
                  sub          sp, s7, s10
                  c.addi       s11, -1
                  c.lui        s8, 27
                  csrrs        zero, 0x340, zero
                  and          tp, a0, s1
                  andi         a5, gp, -2039
                  csrrci       t4, 0x340, 0
                  mulhu        s11, a6, t6
                  mulh         s10, t1, a1
                  sra          s8, s0, s5
                  csrrwi       a7, 0x340, 20
                  c.nop
                  c.nop
                  xor          t5, sp, s9
                  mulhu        s6, s11, s3
                  addi         a2, s3, 284
                  csrrwi       s0, 0x340, 8
                  c.add        a7, t3
                  c.nop
                  csrrwi       s5, 0x340, 24
                  mulhsu       s2, t2, t6
                  csrrs        t0, 0x340, sp
                  c.sub        s0, a5
                  c.li         a6, -1
                  xori         t4, s8, 234
                  c.add        ra, gp
                  c.and        a2, a1
                  ori          a2, t1, 205
                  ori          s8, s11, -881
                  sltu         s2, s0, t6
                  slti         s2, a5, -368
                  srai         a2, s10, 28
                  c.sub        s1, a5
                  c.slli       gp, 25
                  c.lui        t3, 25
                  csrrwi       s9, 0x340, 27
                  c.and        a5, s0
                  and          s3, a7, sp
                  csrrsi       t6, 0x340, 0
                  c.li         t4, 2
                  lui          a6, 163270
                  sll          s9, a7, t5
                  mulhu        a2, a6, s6
                  csrrw        a0, 0x340, a6
                  xor          sp, s8, s10
                  mulhu        gp, a6, s11
                  mulhu        s0, zero, s6
                  mul          a0, a7, a1
                  lui          s11, 835316
                  csrrs        t5, 0x340, zero
                  c.srai       s0, 24
                  csrrsi       a0, 0x340, 0
                  sra          s11, s3, a6
                  add          a5, s3, gp
                  and          t6, t4, s6
                  c.andi       s0, -1
                  slti         s3, s6, -633
                  srli         a7, t3, 20
                  c.or         a2, a5
                  sll          tp, s1, s5
                  andi         s3, s4, -187
                  addi         s2, t3, -1286
                  slt          gp, s10, a1
                  c.addi4spn   s0, sp, 96
                  div          s9, s6, s3
                  c.li         s11, -1
                  csrrwi       t5, 0x340, 4
                  add          s6, s8, s6
                  c.add        t1, t1
                  addi         s8, s1, -956
                  srli         s10, s2, 15
                  c.addi       a0, 15
                  c.slli       s1, 6
                  remu         sp, t5, gp
                  andi         s5, t4, 174
                  csrrsi       t1, 0x340, 21
                  and          s7, a3, sp
                  c.and        a5, a3
                  sub          s10, t2, a7
                  c.addi4spn   a2, sp, 544
                  csrrw        t3, 0x340, s5
                  mulhu        tp, a5, s8
                  c.xor        a5, a0
                  sll          t1, a6, s9
                  c.addi       ra, -1
                  c.addi16sp   sp, -16
                  c.addi       s2, -1
                  c.nop
                  csrrsi       a4, 0x340, 16
                  ori          s10, s4, 225
                  c.li         a7, -1
                  mulh         tp, s9, sp
                  srai         t4, tp, 22
                  c.addi       s8, -1
                  xor          s6, s10, t0
                  slt          a7, sp, s4
                  sltu         s1, s4, gp
                  c.lui        s6, 29
                  and          zero, a2, t2
                  addi         s3, t3, 1114
                  c.srai       a0, 21
                  mulhsu       t6, t4, s10
                  add          s8, tp, a4
                  rem          gp, s0, t0
                  sra          gp, s5, a7
                  c.mv         a2, s10
                  srli         s6, s0, 10
                  sltiu        t5, s4, -237
                  csrrci       s10, 0x340, 19
                  sltu         s10, s0, s10
                  andi         s5, s3, -1932
                  c.andi       a0, 7
                  csrrci       a5, 0x340, 0
                  mulhsu       s2, a1, t2
                  mulh         ra, s5, a3
                  mulh         s8, a3, tp
                  and          sp, a7, t3
                  csrrw        s0, 0x340, s9
                  csrrw        s1, 0x340, zero
                  remu         s5, t4, t2
                  csrrs        t5, 0x340, zero
                  rem          a6, a7, s10
                  andi         a7, a0, -1363
                  ori          s3, sp, -1521
                  csrrs        t3, 0x340, zero
                  c.and        s0, s1
                  mulhsu       s4, s6, t4
                  divu         s11, s7, a0
                  c.addi       s5, 31
                  and          t0, s9, a3
                  srai         s5, t2, 29
                  div          a0, s2, a3
                  srl          t5, zero, s4
                  c.sub        a5, a4
                  c.or         a5, s0
                  auipc        ra, 765213
                  c.li         tp, -1
                  csrrwi       s9, 0x340, 24
                  c.addi4spn   s1, sp, 928
                  c.addi16sp   sp, 304
                  csrrsi       tp, 0x340, 31
                  c.or         a5, s1
                  c.addi16sp   sp, -16
                  c.nop
                  csrrci       a7, 0x340, 4
                  nop
                  xor          gp, s4, s10
                  csrrci       s6, 0x340, 0
                  csrrsi       a0, 0x340, 0
                  csrrc        s11, 0x340, zero
                  c.xor        s1, a3
                  sra          t1, s0, t0
                  c.nop
                  mulh         gp, s5, t0
                  xori         s6, s2, 1456
                  c.sub        a0, a0
                  c.nop
                  csrrs        t5, 0x340, zero
                  csrrs        s10, 0x340, zero
                  c.addi       s0, 8
                  csrrw        s8, 0x340, s6
                  xori         t6, a0, -1720
                  c.andi       s0, -1
                  slt          t6, a4, a2
                  c.add        t3, s8
                  srli         a0, a5, 0
                  c.and        s1, a1
                  remu         s2, sp, gp
                  sltu         s7, s5, t5
                  slti         t0, s10, 1634
                  c.mv         s10, a4
                  sll          a6, a2, s0
                  remu         s11, s6, t3
                  srli         s7, s9, 11
                  and          a7, a2, t1
                  nop
                  c.add        sp, a4
                  c.xor        a5, a5
                  csrrw        a5, 0x340, ra
                  c.and        a4, a3
                  mul          s9, t1, a1
                  slli         s5, s6, 0
                  lui          t1, 483287
                  sra          s11, s5, s4
                  c.lui        a7, 15
                  or           a0, a7, a2
                  srai         s4, a1, 2
                  mulhsu       t3, t2, s11
                  c.slli       a4, 8
                  srl          a0, t4, s0
                  auipc        a5, 59374
                  srli         ra, tp, 31
                  xori         sp, t3, -1621
                  mul          s9, tp, t2
                  c.add        s1, t3
                  mulh         t1, s11, ra
                  mulhsu       s10, a2, s7
                  csrrwi       t0, 0x340, 8
                  and          a5, ra, s2
                  and          t5, s11, s7
                  sra          s2, a2, s8
                  auipc        gp, 616051
                  csrrci       t5, 0x340, 0
                  c.and        s0, a0
                  csrrc        a0, 0x340, zero
                  slti         a2, s8, -153
                  csrrc        a4, 0x340, t6
                  slli         t6, gp, 16
                  c.srli       s1, 8
                  csrrsi       t4, 0x340, 0
                  c.addi16sp   sp, 416
                  sltiu        a7, s1, -1140
                  mul          s3, gp, gp
                  c.lui        s7, 23
                  c.srli       s1, 22
                  slt          s0, tp, s9
                  c.mv         s8, t1
                  mulh         s1, t5, s3
                  divu         s3, a1, a4
                  c.or         a2, a0
                  sra          s9, t3, s9
                  add          s7, s10, a0
                  auipc        s9, 849265
                  slti         s11, a1, 1927
                  c.addi4spn   a2, sp, 64
                  c.nop
                  mulhu        s7, s1, s7
                  srl          t1, a0, t6
                  c.slli       s7, 28
                  c.addi       t0, 7
                  c.addi4spn   s0, sp, 576
                  srai         a6, s2, 1
                  sra          t4, t4, gp
                  c.mv         a6, t1
                  lui          a2, 22084
                  or           ra, t0, s7
                  add          s2, a0, a7
                  c.addi16sp   sp, 384
                  c.add        s11, tp
                  mul          s6, s5, s4
                  c.andi       a2, 30
                  srl          a4, s10, s7
                  srai         t1, sp, 27
                  c.lui        a6, 21
                  c.srai       s0, 24
                  ori          s2, s1, 2033
                  srai         tp, t0, 3
                  c.andi       a5, 10
                  slti         t3, a6, -1640
                  addi         t6, ra, -67
                  lui          a0, 356799
                  mulhsu       s3, s5, a5
                  c.li         s11, -1
                  lui          a6, 560068
                  c.srai       s1, 30
                  csrrci       gp, 0x340, 0
                  c.srli       a4, 21
                  mul          a7, s11, s9
                  slti         t1, s1, 1562
                  xor          a0, tp, t3
                  xori         s2, s8, -1421
                  csrrsi       s4, 0x340, 0
                  csrrsi       s7, 0x340, 0
                  mulhsu       s3, s8, t6
                  remu         a7, s6, gp
                  csrrw        s1, 0x340, a1
                  divu         sp, a7, t5
                  div          s1, t1, gp
                  andi         s4, s10, -561
                  csrrsi       s1, 0x340, 0
                  csrrsi       s4, 0x340, 0
                  csrrc        zero, 0x340, sp
                  lui          s2, 502681
                  sltiu        t0, s2, -969
                  divu         a2, a7, s6
                  c.slli       s7, 16
                  csrrc        tp, 0x340, zero
                  nop
                  sll          s6, s11, s2
                  mulhsu       t1, a2, s0
                  auipc        a4, 797628
                  remu         t5, a0, a5
                  c.sub        a4, a1
                  c.xor        a4, s0
                  c.or         a2, a1
                  csrrsi       a4, 0x340, 29
                  rem          a6, s8, s8
                  c.and        a2, a5
                  addi         t0, s8, -701
                  xori         t5, s1, 1628
                  c.lui        t1, 24
                  addi         s11, a1, -1832
                  c.lui        s8, 27
                  c.addi       a2, 11
                  xor          s8, t1, a3
                  nop
                  csrrw        tp, 0x340, s5
                  slli         a2, a4, 15
                  c.andi       s0, -1
                  sltu         a0, t4, t3
                  c.srli       s0, 13
                  sub          gp, t5, s8
                  c.lui        t1, 20
                  lui          s1, 644798
                  srli         t6, gp, 8
                  sra          s2, s3, t1
                  csrrw        gp, 0x340, a5
                  or           s2, t3, ra
                  c.andi       a4, -1
                  and          a2, a2, gp
                  c.mv         s5, t4
                  c.slli       t3, 19
                  c.and        a0, a1
                  c.and        s1, a1
                  c.add        sp, s7
                  sltiu        s7, s7, -79
                  xor          tp, s9, s0
                  mulh         s2, t1, a0
                  sub          zero, a7, tp
                  c.addi       s6, -1
                  lui          s7, 727797
                  andi         a6, t0, 632
                  c.addi       a6, 16
                  rem          s0, zero, a7
                  and          s7, t6, s5
                  mulhsu       s1, a6, s4
                  c.addi4spn   s1, sp, 480
                  auipc        s0, 806788
                  div          s4, sp, a7
                  remu         t6, s11, s5
                  c.mv         s7, s9
                  c.addi       ra, -1
                  srl          ra, t0, s6
                  c.mv         s10, a0
                  ori          a4, s5, 1741
                  c.srli       a5, 7
                  c.mv         t0, s6
                  c.nop
                  mulhu        gp, s5, t1
                  nop
                  c.sub        s0, a5
                  sll          a4, ra, a4
                  mulhsu       t0, t5, t0
                  or           s8, zero, s1
                  srli         a4, t1, 28
                  c.srli       s0, 18
                  andi         s1, a0, -188
                  sltiu        s10, gp, 105
                  ori          s7, s2, 1812
                  nop
                  c.li         ra, -1
                  csrrci       t3, 0x340, 0
                  andi         sp, t4, 1434
                  slt          ra, a4, a1
                  c.nop
                  sub          t3, ra, t5
                  csrrwi       t0, 0x340, 22
                  csrrsi       s5, 0x340, 0
                  mul          s1, t4, t5
                  c.and        a4, a3
                  c.li         sp, -1
                  c.slli       a0, 14
                  auipc        tp, 655956
                  or           s2, a7, s5
                  c.and        a0, a5
                  add          ra, s5, zero
                  slti         t6, s5, 1769
                  mulhu        s10, a6, s1
                  c.sub        a5, a2
                  c.andi       s1, -1
                  div          t0, tp, gp
                  sltu         s10, s10, s4
                  c.addi4spn   a2, sp, 272
                  c.addi       a6, 1
                  csrrci       t0, 0x340, 0
                  c.srai       s1, 24
                  c.add        s8, s10
                  srai         s0, a6, 24
                  mulh         a4, gp, a6
                  mulh         s0, t1, s8
                  c.srli       a2, 14
                  c.mv         s6, s1
                  c.mv         s4, s4
                  csrrw        a2, 0x340, t5
                  c.addi16sp   sp, -16
                  andi         s5, s11, -1761
                  slt          ra, s11, t0
                  csrrwi       ra, 0x340, 4
                  c.xor        a0, a0
                  add          ra, t0, t2
                  andi         zero, t1, 1589
                  c.nop
                  sub          a4, ra, a2
                  mulh         s7, a3, s8
                  c.and        a2, s1
                  add          t6, a3, s3
                  mulh         s9, a1, zero
                  nop
                  sra          t0, s9, ra
                  lui          s10, 92820
                  c.addi16sp   sp, -16
                  xori         s7, s10, 1668
                  remu         sp, s8, s2
                  c.andi       a0, -1
                  c.nop
                  csrrw        a2, 0x340, s3
                  srai         a6, s5, 5
                  ori          t4, s6, 294
                  c.addi       a4, 12
                  c.xor        a5, a2
                  mulhsu       a0, t4, t0
                  andi         a6, gp, 354
                  c.lui        t3, 14
                  divu         s11, a2, a6
                  sra          a2, a6, a5
                  nop
                  slli         t6, a0, 8
                  mulhsu       s0, tp, s7
                  csrrs        t5, 0x340, zero
                  c.addi16sp   sp, -16
                  sra          s10, s7, a6
                  slt          a2, t2, s7
                  csrrw        s8, 0x340, s3
                  sra          t0, zero, a2
                  csrrci       t3, 0x340, 0
                  c.mv         t1, s8
                  lui          s11, 169411
                  c.slli       gp, 5
                  sltiu        a6, a0, -181
                  c.or         a0, a1
                  lui          s10, 251638
                  c.li         t6, -1
                  lui          s2, 718958
                  c.xor        s0, s0
                  c.slli       s6, 19
                  slti         s3, s7, -1367
                  xor          s6, t3, t1
                  c.xor        a2, s1
                  csrrwi       a6, 0x340, 21
                  c.srli       a4, 22
                  csrrsi       s0, 0x340, 0
                  add          s6, t4, t6
                  csrrs        a0, 0x340, zero
                  csrrs        s11, 0x340, a1
                  divu         a4, a3, s5
                  mulhsu       s9, s10, t4
                  csrrw        a2, 0x340, s1
                  divu         s11, a0, s4
                  csrrwi       s1, 0x340, 12
                  lui          t6, 753340
                  c.or         s1, a2
                  c.srai       s1, 12
                  div          s10, a7, a7
                  c.slli       s6, 20
                  csrrs        a6, 0x340, zero
                  c.slli       t3, 9
                  addi         a0, t3, 104
                  c.and        a4, s0
                  divu         s1, s1, a6
                  srai         s2, s7, 4
                  c.mv         s3, s9
                  csrrsi       s5, 0x340, 25
                  sltiu        ra, zero, 1292
                  sll          ra, a1, sp
                  c.addi       s4, -1
                  mulh         s8, s1, a5
                  nop
                  slli         gp, t0, 2
                  and          t4, sp, a7
                  slti         s10, s0, -1666
                  lui          s3, 776622
                  c.and        a0, s0
                  c.or         a2, a4
                  sub          a0, s6, ra
                  ori          t0, t1, 1165
                  c.srli       s1, 21
                  c.sub        a2, s0
                  c.addi4spn   a0, sp, 608
                  c.and        s1, a1
                  div          t1, a5, t5
                  csrrsi       t6, 0x340, 15
                  slti         zero, s6, 391
                  c.and        s0, a1
                  sra          s3, s5, a1
                  c.slli       a5, 28
                  c.andi       a2, -1
                  c.li         s10, -1
                  addi         s11, s2, 1125
                  divu         s1, t6, s0
                  mul          t4, a7, s10
                  c.or         a5, s1
                  nop
                  div          a0, s0, t4
                  csrrwi       a2, 0x340, 18
                  andi         s2, t3, 70
                  csrrci       s8, 0x340, 24
                  xor          t1, t2, t3
                  c.mv         s2, s4
                  c.and        s0, a0
                  c.nop
                  addi         a5, s1, -823
                  c.mv         s1, s3
                  c.lui        a2, 26
                  csrrsi       ra, 0x340, 0
                  c.or         s0, s0
                  c.addi16sp   sp, 256
                  and          s9, s3, a2
                  c.addi4spn   a0, sp, 96
                  csrrci       ra, 0x340, 0
                  auipc        a6, 665366
                  andi         t5, sp, 147
                  div          s5, a7, tp
                  csrrc        a4, 0x340, t2
                  c.srai       s1, 11
                  c.mv         s7, s3
                  remu         s8, t4, ra
                  c.addi16sp   sp, 336
                  auipc        s5, 271017
                  slti         s4, s9, -1985
                  c.lui        t6, 2
                  addi         s10, t4, -627
                  mulh         a7, a3, a5
                  c.xor        a4, a5
                  slt          t5, s1, t1
                  slti         gp, s9, -714
                  c.add        t3, s10
                  csrrc        t1, 0x340, t4
                  mulhsu       t4, t2, t2
                  c.lui        gp, 26
                  slti         t6, t2, 1277
                  c.andi       s0, 1
                  andi         t0, t6, -1011
                  slli         a7, t1, 1
                  c.andi       s1, -1
                  xori         ra, t0, 288
                  c.mv         a2, s7
                  c.lui        ra, 16
                  sra          t3, t4, s7
                  c.nop
                  rem          s7, t2, s4
                  c.nop
                  rem          a4, tp, a1
                  c.srai       a4, 5
                  ori          a4, s1, -1019
                  auipc        a4, 884723
                  auipc        s1, 933982
                  c.addi16sp   sp, -16
                  c.addi4spn   s1, sp, 464
                  add          s10, a3, tp
                  csrrci       s4, 0x340, 13
                  addi         tp, s6, -1660
                  c.srai       a5, 3
                  sll          s9, s10, tp
                  c.and        s1, s0
                  div          gp, a6, a7
                  c.xor        a4, s1
                  sra          t3, a0, a3
                  mulhu        s6, t4, a7
                  csrrsi       a0, 0x340, 0
                  c.srli       a5, 17
                  lui          gp, 245849
                  sra          s5, tp, s2
                  slt          s3, a6, s2
                  remu         s6, s4, t2
                  and          s4, tp, a1
                  c.mv         gp, a6
                  csrrwi       t5, 0x340, 18
                  slti         s7, s6, -1302
                  sra          s1, t0, s9
                  and          zero, s11, t6
                  c.slli       s3, 16
                  remu         s6, a1, a0
                  srl          a0, t2, sp
                  ori          s10, s1, 876
                  c.andi       a2, -1
                  auipc        t1, 848478
                  lui          t1, 742747
                  divu         tp, s11, a6
                  slt          t6, t6, a1
                  c.addi4spn   a4, sp, 240
                  srl          s6, a1, s3
                  c.nop
                  add          s1, t1, s7
                  c.add        sp, a3
                  c.slli       s0, 17
                  c.addi16sp   sp, -16
                  divu         t6, a3, s9
                  auipc        s0, 724383
                  csrrw        s11, 0x340, s7
                  slli         s6, zero, 10
                  c.nop
                  c.srli       a0, 31
                  nop
                  slt          t3, t2, a3
                  c.slli       a4, 6
                  divu         s0, sp, tp
                  auipc        zero, 317556
                  c.xor        a5, a5
                  csrrci       t6, 0x340, 0
                  c.addi16sp   sp, -16
                  rem          zero, t1, a2
                  c.addi       a6, 16
                  c.or         a2, a0
                  sltu         t6, a6, t4
                  slti         s3, a5, -973
                  divu         s10, s11, a7
                  addi         s6, t1, 1990
                  c.andi       s0, -1
                  c.addi4spn   a5, sp, 112
                  csrrc        t5, 0x340, a5
                  csrrwi       gp, 0x340, 14
                  csrrsi       t3, 0x340, 0
                  c.srai       s0, 26
                  c.and        a2, a1
                  srai         t5, a1, 21
                  slti         tp, gp, -14
                  xori         gp, s0, -73
                  mul          ra, s7, s3
                  sltiu        t1, t2, 218
                  addi         s6, a3, 782
                  c.li         a6, 10
                  csrrs        tp, 0x340, a2
                  srai         s7, a0, 25
                  csrrc        a2, 0x340, sp
                  rem          a2, ra, t6
                  csrrw        s3, 0x340, tp
                  lui          s10, 974591
                  rem          s8, s3, a2
                  rem          t0, t1, s11
                  csrrsi       s11, 0x340, 0
                  divu         a7, t5, s0
                  c.add        a4, a6
                  c.xor        a2, s1
                  csrrci       s10, 0x340, 0
                  mulhsu       s3, tp, t1
                  sltu         zero, a5, t1
                  c.srai       a4, 13
                  addi         gp, s7, -1937
                  slti         a2, s3, 930
                  c.andi       a4, -1
                  xori         t3, a7, -502
                  div          s5, s1, a3
                  csrrci       a2, 0x340, 0
                  rem          s5, t1, s4
                  divu         a6, s6, s8
                  xor          s6, t6, s4
                  c.or         s1, a5
                  c.xor        a2, a0
                  srl          t3, s7, s9
                  csrrci       t4, 0x340, 8
                  c.addi16sp   sp, 272
                  ori          a2, gp, 390
                  slti         s3, s0, 598
                  andi         a5, s7, 1558
                  c.mv         sp, a4
                  srl          gp, a7, s8
                  div          s10, s8, t4
                  c.slli       t4, 14
                  csrrsi       tp, 0x340, 6
                  sll          a2, a6, t2
                  csrrwi       s10, 0x340, 1
                  c.sub        s0, s0
                  c.srai       a5, 20
                  sra          gp, s1, s1
                  c.addi4spn   a0, sp, 352
                  c.sub        s0, a2
                  and          s6, tp, s3
                  rem          zero, s8, tp
                  csrrci       t0, 0x340, 0
                  slt          s0, s9, s1
                  addi         s0, sp, -949
                  c.lui        a4, 30
                  sub          s2, t3, a3
                  sltu         s0, t5, s10
                  csrrs        t5, 0x340, zero
                  andi         tp, t4, 37
                  c.addi16sp   sp, 256
                  csrrs        s6, 0x340, zero
                  c.addi       t5, -1
                  rem          a5, gp, a3
                  lui          s9, 777754
                  mulhsu       s0, tp, t4
                  slti         t5, sp, 1988
                  rem          a4, ra, s7
                  or           a7, sp, gp
                  xor          a7, a0, a3
                  c.addi4spn   s0, sp, 368
                  c.addi4spn   s0, sp, 848
                  sll          zero, s10, zero
                  csrrc        s5, 0x340, zero
                  c.nop
                  auipc        zero, 542963
                  div          t4, s0, t1
                  srai         s11, t3, 15
                  slli         gp, t0, 18
                  csrrci       s5, 0x340, 14
                  csrrci       ra, 0x340, 16
                  divu         t3, s2, a7
                  c.srli       a0, 22
                  c.mv         s11, t5
                  c.slli       s3, 14
                  c.li         t3, 18
                  c.xor        a5, a5
                  srai         t4, s3, 25
                  c.addi16sp   sp, -16
                  srl          a4, t2, s9
                  csrrsi       t0, 0x340, 0
                  mul          tp, t6, tp
                  c.andi       a0, -1
                  add          zero, t3, a2
                  or           s5, s3, s4
                  add          t6, s9, a4
                  c.addi4spn   a0, sp, 816
                  c.srli       s1, 29
                  remu         sp, a4, s0
                  add          a0, s1, ra
                  c.slli       s2, 12
                  srai         s8, s10, 18
                  c.slli       gp, 17
                  mul          s10, a1, a1
                  sra          t1, t2, t3
                  c.li         s5, 27
                  ori          a2, s2, 976
                  rem          a5, t0, t4
                  c.addi16sp   sp, -16
                  and          a0, a2, t3
                  csrrwi       zero, 0x340, 10
                  sll          tp, zero, a6
                  sra          s6, s4, gp
                  addi         s11, a0, -1993
                  c.slli       s8, 23
                  sub          a2, a3, s4
                  srli         s2, a1, 6
                  c.slli       t3, 16
                  slt          s10, a4, t5
                  c.or         a5, a5
                  csrrw        a4, 0x340, a0
                  c.addi       s2, -1
                  divu         t5, tp, ra
                  csrrs        s10, 0x340, t1
                  srai         s0, s6, 8
                  csrrci       a0, 0x340, 0
                  slt          ra, a1, s9
                  csrrsi       s8, 0x340, 0
                  c.andi       a4, 26
                  nop
                  sll          s8, s3, s7
                  csrrci       s10, 0x340, 0
                  slti         s3, gp, 567
                  csrrwi       a6, 0x340, 9
                  c.xor        a0, s1
                  addi         s0, a0, 1780
                  c.lui        tp, 2
                  auipc        s10, 457902
                  rem          t6, s11, t6
                  csrrci       t3, 0x340, 13
                  slt          s3, sp, t5
                  csrrci       a7, 0x340, 0
                  srli         a4, s8, 18
                  and          a6, s3, zero
                  csrrwi       a7, 0x340, 3
                  or           t6, tp, t5
                  auipc        t3, 481639
                  xor          sp, s5, s6
                  ori          s3, s1, 396
                  ori          s3, a0, -118
                  slli         a6, a3, 17
                  mulhsu       t6, s4, a4
                  mulh         s0, s3, s0
                  divu         sp, s9, s3
                  mul          t3, t4, s4
                  csrrwi       t6, 0x340, 26
                  c.addi       s4, -1
                  c.and        a4, a5
                  nop
                  c.addi       a2, -1
                  div          s10, a4, t6
                  andi         t1, t4, 1537
                  sltu         s1, tp, s7
                  slli         t4, a7, 21
                  slli         zero, a2, 21
                  c.add        s0, a2
                  mulhsu       gp, a5, zero
                  xori         s2, t5, -1953
                  srli         a4, s6, 11
                  lui          a6, 804666
                  c.nop
                  divu         t3, t0, a2
                  ori          s11, t3, -150
                  csrrc        t4, 0x340, a1
                  auipc        s10, 319813
                  c.add        a0, s3
                  c.mv         t1, a5
                  slli         s0, t6, 13
                  and          s7, sp, t4
                  csrrs        t0, 0x340, s7
                  slt          a2, s5, s3
                  sll          a4, s8, s0
                  add          s11, s4, a0
                  csrrci       gp, 0x340, 0
                  sra          tp, a5, a1
                  rem          a0, a6, a1
                  mulhu        s6, a5, t3
                  mulh         zero, gp, a5
                  slt          a7, s11, t2
                  c.sub        a2, s0
                  andi         a6, s3, -54
                  csrrci       s0, 0x340, 18
                  xori         tp, sp, 1760
                  or           s11, t1, s1
                  divu         t4, a3, s9
                  c.li         s7, 4
                  csrrs        sp, 0x340, a6
                  xor          s2, a2, s10
                  csrrsi       s10, 0x340, 14
                  c.li         a6, -1
                  srai         a4, s0, 20
                  c.xor        a5, a0
                  c.li         t0, -1
                  sltu         a4, s11, a7
                  slli         a4, zero, 11
                  slli         s4, t3, 3
                  c.addi       t6, 31
                  mulhu        s6, zero, s10
                  mul          s1, s11, a6
                  csrrw        s2, 0x340, s10
                  and          s11, tp, gp
                  xor          sp, t2, s8
                  and          tp, s8, s1
                  c.mv         t0, s11
                  slli         s1, t6, 15
                  lui          sp, 907557
                  c.add        t0, s6
                  c.andi       s0, -1
                  sra          s0, ra, s6
                  rem          t0, s10, s5
                  andi         t5, s1, 1432
                  csrrw        tp, 0x340, s7
                  sll          s10, t2, s6
                  csrrs        t0, 0x340, zero
                  addi         sp, s2, 218
                  c.xor        a5, a5
                  divu         t0, a3, t3
                  c.lui        t1, 6
                  andi         a5, t5, -1742
                  csrrs        ra, 0x340, s6
                  mulhu        a4, gp, a3
                  csrrci       ra, 0x340, 13
                  csrrwi       a6, 0x340, 18
                  auipc        a4, 986344
                  c.addi       s10, 14
                  c.and        a2, a0
                  slli         s4, t5, 28
                  c.nop
                  c.xor        s1, a0
                  mulhu        a7, s0, a1
                  sltu         s2, ra, t3
                  div          s8, s4, s8
                  csrrci       s0, 0x340, 17
                  divu         s1, s0, s0
                  csrrc        zero, 0x340, zero
                  andi         t0, s7, 713
                  sub          t0, tp, s2
                  div          s0, s4, s6
                  sltiu        s0, t2, 1113
                  srl          a4, s3, a3
                  c.add        s2, a0
                  csrrs        tp, 0x340, s8
                  c.addi       s0, 7
                  xori         ra, a6, -185
                  slli         a6, sp, 3
                  csrrc        s6, 0x340, t4
                  c.srai       s0, 12
                  c.mv         t6, a6
                  remu         t5, s2, s9
                  andi         s8, s5, 963
                  sltu         t4, sp, t2
                  divu         a7, t0, t0
                  mulhu        t6, t6, a6
                  addi         a6, s5, 1680
                  xor          zero, a6, s11
                  ori          tp, zero, 117
                  c.andi       a4, 15
                  mul          s10, s2, s2
                  srli         zero, s2, 6
                  c.and        a2, a1
                  c.xor        a5, a5
                  srl          s10, a4, s3
                  div          gp, a3, zero
                  c.srai       a4, 22
                  c.or         a2, a5
                  c.slli       a4, 12
                  nop
                  sltu         a5, tp, tp
                  mulhsu       a2, a7, s6
                  c.srai       s0, 10
                  nop
                  c.nop
                  mulhsu       s1, a1, s11
                  auipc        t4, 401233
                  csrrs        tp, 0x340, zero
                  c.srai       s0, 13
                  csrrci       t5, 0x340, 0
                  c.addi       a0, -1
                  mulh         t5, zero, zero
                  sltiu        a6, ra, 1137
                  c.xor        s0, a1
                  slti         s1, tp, -1718
                  rem          a6, t0, a2
                  divu         s3, s5, a6
                  srli         gp, s1, 30
                  mulhu        a2, s0, sp
                  mulhu        a7, s1, gp
                  div          tp, zero, s2
                  csrrsi       gp, 0x340, 28
                  xori         t1, a6, 387
                  c.xor        s1, s1
                  c.or         a2, a4
                  mul          s3, a3, s10
                  or           t4, a3, t4
                  c.addi       t0, -1
                  c.xor        s0, s0
                  nop
                  srli         gp, a2, 0
                  ori          s10, sp, 1203
                  c.add        sp, s6
                  xori         tp, a2, 1272
                  mulhsu       s7, tp, s11
                  and          s10, a0, s4
                  slli         t0, t4, 27
                  c.mv         ra, s9
                  c.mv         a5, s6
                  addi         s9, tp, 471
                  addi         t1, t3, 594
                  csrrci       gp, 0x340, 0
                  andi         a7, t2, -1913
                  and          a6, s10, s8
                  div          a7, s3, t4
                  div          sp, a7, s4
                  c.nop
                  mulh         zero, t2, t2
                  auipc        a6, 369633
                  c.srli       s0, 29
                  c.and        s1, a4
                  addi         a7, t1, -1158
                  srl          s4, t3, s4
                  add          tp, a3, s7
                  addi         s3, t6, 1424
                  c.nop
                  sub          t3, s0, a5
                  remu         s5, a3, a5
                  srai         s6, s2, 27
                  or           gp, t0, t0
                  divu         a0, s8, t6
                  mulhsu       t6, t3, a0
                  add          a5, s5, t6
                  c.srai       s0, 9
                  andi         s6, s11, 1217
                  xori         a4, gp, 705
                  csrrc        s6, 0x340, zero
                  auipc        a6, 19922
                  or           s6, t4, zero
                  c.lui        s11, 20
                  sll          s1, s8, s5
                  c.lui        t4, 22
                  andi         t3, a1, 734
                  rem          s10, s9, s3
                  and          t5, a2, t3
                  mulh         s2, s6, a4
                  csrrwi       s8, 0x340, 20
                  csrrw        a5, 0x340, s5
                  c.mv         ra, s10
                  nop
                  sub          s7, a4, s3
                  div          s6, t0, t1
                  divu         gp, a2, tp
                  andi         s7, a0, -108
                  mulhsu       s0, s3, zero
                  c.srai       a0, 14
                  mulh         s0, t6, a0
                  rem          ra, s1, s6
                  c.addi4spn   s1, sp, 288
                  c.or         a4, a3
                  csrrwi       a5, 0x340, 2
                  csrrwi       t6, 0x340, 0
                  csrrc        s1, 0x340, zero
                  ori          s4, a7, -2003
                  rem          t4, t0, t0
                  c.slli       s0, 10
                  sltiu        ra, s8, 1613
                  csrrci       zero, 0x340, 10
                  csrrc        s11, 0x340, t6
                  add          t1, ra, t2
                  ori          ra, t3, 1867
                  c.addi16sp   sp, -16
                  ori          s8, s11, -301
                  c.addi16sp   sp, 160
                  c.andi       s0, -1
                  or           t6, a5, s6
                  c.or         a4, s1
                  ori          s11, a7, 214
                  div          s5, a1, a5
                  srl          s8, t1, a6
                  rem          s5, s10, tp
                  c.srai       a2, 14
                  c.addi4spn   s1, sp, 752
                  c.srli       s1, 23
                  ori          s10, a1, -1938
                  c.mv         s0, s3
                  c.xor        a0, a5
                  sub          t5, t1, a6
                  rem          a5, s3, s1
                  sll          t5, s10, tp
                  c.xor        a2, a5
                  c.and        s1, a5
                  csrrwi       a5, 0x340, 28
                  c.andi       a0, 20
                  mulh         zero, a6, s10
                  csrrci       s8, 0x340, 0
                  srai         t3, a2, 27
                  csrrs        a7, 0x340, t6
                  srai         s7, t1, 15
                  c.nop
                  rem          a2, s1, s1
                  mul          tp, a5, sp
                  divu         t5, s5, a1
                  and          gp, t0, a0
                  lui          ra, 713204
                  mulhsu       tp, t4, a5
                  sub          s3, tp, a4
                  or           s8, a5, a0
                  csrrw        t5, 0x340, tp
                  csrrs        tp, 0x340, zero
                  sra          s8, a3, s9
                  c.or         a4, s0
                  addi         a7, tp, -1379
                  c.mv         s8, t4
                  c.mv         s4, a4
                  srl          a0, a2, tp
                  csrrwi       s11, 0x340, 20
                  lui          t5, 214339
                  sll          a6, s10, a3
                  sub          s11, t1, zero
                  slti         t6, t6, -467
                  c.addi       a0, 22
                  c.srai       a2, 22
                  srai         a0, a1, 30
                  remu         s8, a2, a7
                  slti         a6, s3, 310
                  div          gp, sp, t0
                  div          s6, a6, s1
                  slt          t5, a0, s6
                  c.srai       a5, 12
                  csrrwi       t3, 0x340, 9
                  c.li         gp, -1
                  c.nop
                  mulhu        a7, s3, s3
                  xor          t5, t3, s6
                  c.addi16sp   sp, -16
                  srl          s4, t0, zero
                  nop
                  c.lui        s9, 23
                  c.li         a7, -1
                  mulhu        t6, s7, a0
                  mul          s3, a3, s4
                  c.addi4spn   s1, sp, 464
                  div          t4, sp, zero
                  mulhsu       a4, s9, s8
                  mulhu        s9, tp, t6
                  c.li         a4, -1
                  c.or         a2, a5
                  c.or         s0, a0
                  c.add        t6, a1
                  sra          a6, t2, tp
                  lui          s7, 1043071
                  c.mv         a4, s0
                  c.addi16sp   sp, 304
                  divu         s7, a3, a0
                  mulh         a2, t6, tp
                  mulhsu       a6, a7, s2
                  c.nop
                  sltiu        a4, zero, 653
                  csrrw        s6, 0x340, t1
                  addi         s3, zero, -612
                  c.add        a5, s0
                  xori         zero, a2, 165
                  sltiu        s4, zero, 55
                  slt          t4, t4, zero
                  csrrs        a6, 0x340, s0
                  c.sub        a0, s1
                  c.andi       a5, 27
                  c.slli       s5, 4
                  srai         t5, s4, 4
                  c.slli       t0, 18
                  srli         t4, t3, 26
                  srl          s8, a1, s0
                  srai         s1, a1, 28
                  nop
                  mulh         sp, s10, s6
                  c.addi16sp   sp, 64
                  c.addi16sp   sp, 112
                  mulhu        s0, s9, s0
                  slli         s1, a5, 28
                  sub          s5, t4, a0
                  sltu         a0, t0, a4
                  sltu         tp, a2, gp
                  srl          t0, a4, sp
                  slti         s2, a3, 683
                  c.addi4spn   a4, sp, 208
                  c.or         s0, a3
                  andi         t6, s7, 1701
                  mulh         s4, s6, s0
                  add          s0, a1, s9
                  c.lui        s5, 31
                  div          s8, s6, zero
                  or           s0, tp, s8
                  c.xor        a2, a0
                  mul          gp, s8, t0
                  sltiu        a5, a4, -28
                  and          s7, s9, t6
                  add          s1, t2, ra
                  mulh         s8, s3, s0
                  or           sp, ra, zero
                  auipc        a4, 667712
                  c.and        s1, a0
                  lui          ra, 420005
                  c.nop
                  c.andi       a2, 16
                  c.lui        s8, 27
                  csrrc        sp, 0x340, a7
                  csrrw        a4, 0x340, s0
                  c.lui        s10, 5
                  remu         zero, a6, s10
                  srli         a2, s6, 31
                  c.srli       a4, 27
                  rem          s4, a7, s9
                  or           s0, t6, zero
                  csrrsi       sp, 0x340, 27
                  srl          ra, a1, s5
                  c.lui        s6, 19
                  sltu         s7, a1, s4
                  srai         ra, s10, 12
                  slt          s4, s4, a5
                  sub          s5, a0, sp
                  c.add        a7, s5
                  c.li         s5, -1
                  or           s11, s9, s0
                  c.srai       a0, 13
                  c.sub        a5, s0
                  sltu         zero, a3, t2
                  sltiu        t1, gp, -1466
                  csrrci       s3, 0x340, 26
                  c.and        a0, a3
                  c.xor        a2, a5
                  mulhu        s2, t3, zero
                  xori         s4, t3, -842
                  sub          sp, s6, a7
                  csrrc        tp, 0x340, s11
                  xori         a5, s10, 1503
                  sra          a4, a6, a3
                  c.li         t1, 29
                  c.addi16sp   sp, 272
                  slti         t0, s9, 885
                  slti         a4, s6, -1743
                  sltu         s10, t3, tp
                  c.li         s8, -1
                  auipc        s3, 543233
                  nop
                  c.slli       s6, 8
                  xori         a7, s2, -1662
                  mulhu        s7, s3, a7
                  mulhsu       t1, a0, a0
                  c.sub        a5, a4
                  c.srli       a4, 17
                  sra          s11, a4, s0
                  sltiu        t1, t3, -593
                  c.andi       a0, -1
                  c.mv         t1, ra
                  mul          t6, s4, a7
                  auipc        tp, 497442
                  c.and        s0, a1
                  c.addi       s8, 14
                  csrrci       sp, 0x340, 23
                  add          s11, ra, a0
                  xor          s8, zero, s3
                  mulh         s3, t2, s5
                  sll          t6, tp, t3
                  mul          s4, ra, s1
                  c.nop
                  c.addi       s8, -1
                  c.srli       a4, 31
                  c.addi16sp   sp, 64
                  c.mv         t3, a3
                  srl          s1, a2, s9
                  c.nop
                  add          s11, tp, s2
                  remu         s4, s10, sp
                  csrrc        zero, 0x340, zero
                  mulhu        a0, s7, a6
                  srai         gp, a6, 21
                  srli         s7, s6, 7
                  c.lui        s3, 24
                  c.and        a4, a3
                  csrrs        s0, 0x340, a1
                  srai         t4, gp, 22
                  c.nop
                  and          s11, ra, t5
                  addi         a4, t5, -1834
                  csrrc        a6, 0x340, t5
                  sltu         ra, s6, t3
                  srl          s8, a6, s3
                  andi         s0, a7, 1656
                  csrrci       t6, 0x340, 13
                  c.addi4spn   s0, sp, 224
                  remu         a4, tp, s10
                  c.or         s0, a4
                  csrrsi       zero, 0x340, 26
                  c.addi4spn   a5, sp, 656
                  c.mv         a2, a7
                  c.or         a4, s1
                  csrrsi       a7, 0x340, 0
                  c.lui        s3, 19
                  csrrc        t0, 0x340, sp
                  sll          a7, s8, a2
                  c.addi16sp   sp, 112
                  c.addi       gp, 7
                  mulhsu       s5, s0, a6
                  c.srai       a2, 28
                  srli         ra, s2, 2
                  c.slli       s10, 28
                  csrrci       tp, 0x340, 0
                  ori          a0, t1, 1292
                  and          s3, gp, tp
                  sltu         a7, tp, s9
                  csrrsi       s4, 0x340, 9
                  ori          s2, s2, 89
                  c.and        s0, a2
                  csrrw        t6, 0x340, a1
                  c.addi       s2, 6
                  add          s11, t5, t4
                  sltu         t0, a3, s7
                  c.sub        s0, s1
                  div          s4, t5, tp
                  c.lui        tp, 23
                  divu         s2, s4, s2
                  slt          s2, t5, a2
                  sub          s1, s6, s2
                  rem          s0, sp, s4
                  c.add        a2, t1
                  csrrsi       s11, 0x340, 0
                  xori         t5, s9, -973
                  srai         s10, gp, 17
                  srl          t3, a2, t5
                  c.srli       s0, 18
                  lui          a7, 527861
                  c.addi       t0, -1
                  sltu         s1, s6, a2
                  c.srli       a2, 11
                  divu         a0, a1, a5
                  csrrwi       t1, 0x340, 31
                  divu         ra, t1, s8
                  c.andi       a2, -1
                  ori          t1, t5, 1626
                  ori          s7, s6, -1230
                  c.xor        a0, a5
                  andi         s10, zero, -96
                  c.li         a6, -1
                  srl          s7, s11, a7
                  c.addi4spn   s1, sp, 672
                  c.nop
                  c.or         a2, s0
                  c.sub        s0, a3
                  c.xor        a5, a5
                  srai         s6, t6, 16
                  csrrci       s11, 0x340, 15
                  rem          a2, ra, t1
                  slt          a0, s6, tp
                  c.addi16sp   sp, 32
                  mulh         s7, t6, ra
                  c.addi       s11, -1
                  remu         s5, t6, a6
                  c.li         t5, -1
                  c.slli       s3, 25
                  c.lui        s3, 16
                  slt          s4, s2, a4
                  and          ra, gp, a0
                  sub          s5, gp, gp
                  c.nop
                  sltu         t0, gp, t4
                  nop
                  divu         a2, a4, s8
                  or           s6, s2, s1
                  slli         s5, s4, 4
                  c.and        a2, a0
                  divu         s7, t3, a3
                  c.xor        a2, s0
                  mulhsu       t1, a6, s10
                  sra          s7, a3, s0
                  and          zero, s3, s5
                  c.add        ra, s4
                  add          s3, t2, t0
                  c.or         a4, a0
                  c.srli       a4, 7
                  srli         sp, a6, 21
                  andi         s9, t6, -1724
                  mulhu        t1, zero, a7
                  xori         s6, s6, -1994
                  c.slli       s3, 23
                  srai         s1, t3, 27
                  xor          a5, t1, a1
                  and          t6, s1, t3
                  sub          s9, tp, a6
                  sltu         a5, zero, gp
                  srai         s9, t1, 21
                  xor          s6, t4, t0
                  srli         t1, a6, 14
                  c.addi       t4, 14
                  c.sub        a0, a1
                  csrrsi       gp, 0x340, 0
                  csrrs        s7, 0x340, s1
                  c.sub        s0, a3
                  c.srai       s1, 14
                  mulhsu       s2, a6, s3
                  slt          s3, t5, a5
                  lui          s7, 424093
                  sra          a7, t4, a5
                  slli         t1, s10, 4
                  c.li         s11, -1
                  sltiu        t5, gp, 1485
                  csrrw        s7, 0x340, s6
                  c.srai       a2, 1
                  csrrc        a5, 0x340, zero
                  sltiu        t6, s4, 1764
                  mulhu        tp, a2, ra
                  sltiu        s4, t0, 1925
                  nop
                  c.addi16sp   sp, 192
                  c.and        s0, a1
                  c.andi       s0, -1
                  addi         s6, a7, -1572
                  c.addi4spn   s0, sp, 352
                  div          s0, s8, a2
                  slli         s0, a4, 1
                  csrrsi       s1, 0x340, 21
                  c.srli       a2, 26
                  csrrsi       t6, 0x340, 7
                  c.nop
                  remu         a7, a6, a2
                  c.and        a4, s1
                  mulhu        a4, s7, s9
                  c.and        a2, a4
                  slt          s8, t5, t3
                  c.xor        s0, a4
                  c.slli       s11, 27
                  sltu         t3, t2, a4
                  csrrsi       s8, 0x340, 0
                  sub          tp, t5, s8
                  lui          t0, 102798
                  c.addi       s8, 12
                  mulhsu       gp, s8, s9
                  slti         s4, a3, -1067
                  srai         t4, a0, 9
                  c.srai       a4, 29
                  sltu         t1, s0, t0
                  csrrsi       gp, 0x340, 21
                  csrrsi       a0, 0x340, 22
                  remu         t1, a7, a4
                  sll          t6, a7, s9
                  srli         s6, s7, 14
                  c.mv         a0, s5
                  csrrc        s8, 0x340, zero
                  div          t0, zero, t6
                  c.srai       a0, 11
                  csrrwi       a5, 0x340, 16
                  sub          a7, s0, sp
                  c.lui        s0, 4
                  sra          a6, s4, a1
                  c.andi       s0, 27
                  c.srli       a5, 15
                  divu         t6, s6, t1
                  slti         a4, s4, -1697
                  nop
                  c.addi4spn   a5, sp, 592
                  c.xor        s1, a3
                  sub          tp, a1, t5
                  mulh         s4, sp, t4
                  c.lui        s7, 19
                  divu         a7, s6, ra
                  slt          s6, a7, s6
                  c.addi16sp   sp, -16
                  lui          s11, 209819
                  srai         a4, a6, 1
                  slli         sp, s0, 7
                  remu         s8, s6, sp
                  csrrw        zero, 0x340, s4
                  sll          a0, s4, s6
                  lui          t4, 622563
                  sll          tp, a4, a4
                  add          t3, a4, a0
                  ori          t1, t1, -1139
                  c.andi       a5, -1
                  slti         t3, sp, 1862
                  srl          t1, t1, a5
                  c.mv         t5, a4
                  mul          s8, a6, s11
                  andi         s0, a1, 2035
                  and          a4, t0, a5
                  srli         a0, s4, 23
                  c.andi       a0, -1
                  srli         t3, a4, 26
                  sub          a6, t1, a2
                  c.srli       a0, 11
                  csrrci       a0, 0x340, 28
                  srli         s1, t5, 9
                  c.nop
                  sltiu        gp, a5, -149
                  c.nop
                  srai         t5, s0, 1
                  c.mv         s11, a0
                  divu         a2, s9, t1
                  csrrwi       s1, 0x340, 3
                  xor          s4, t5, a7
                  add          s9, s2, s10
                  divu         a7, s9, a7
                  srl          s8, sp, gp
                  csrrs        s11, 0x340, ra
                  c.slli       a5, 11
                  xori         a0, a0, -1837
                  c.nop
                  csrrwi       t4, 0x340, 27
                  ori          s1, t2, 1013
                  sltu         s2, sp, tp
                  c.lui        s2, 21
                  lui          gp, 917640
                  srai         a0, a6, 24
                  nop
                  c.addi16sp   sp, -16
                  addi         s10, a3, 1089
                  addi         t0, t0, -2001
                  ori          t0, ra, 1799
                  ori          t4, t1, 1425
                  auipc        s4, 918740
                  rem          t3, gp, s2
                  add          a5, t4, a4
                  rem          a6, a0, tp
                  csrrc        s10, 0x340, t6
                  c.addi4spn   a2, sp, 448
                  mulhsu       a2, s9, s11
                  mul          ra, t3, a3
                  addi         t3, s4, 858
                  c.addi       a4, -1
                  c.add        s11, t0
                  c.nop
                  c.addi4spn   a2, sp, 240
                  slli         t5, s10, 15
                  slt          t4, a3, a4
                  c.li         s4, 19
                  sltu         s8, s1, s11
                  c.mv         t4, t5
                  andi         t0, t0, -689
                  addi         ra, a0, -1651
                  or           s4, tp, a3
                  slt          tp, t1, s11
                  sra          s1, t5, s11
                  sll          a4, sp, zero
                  and          t6, a0, s10
                  csrrs        a4, 0x340, s1
                  mulh         t0, a6, t4
                  mul          a0, a1, zero
                  c.xor        a2, a2
                  slt          t1, a7, a3
                  xori         a2, s11, -319
                  srli         s9, s0, 22
                  c.add        gp, a4
                  sll          s10, t5, s3
                  c.xor        a5, a0
                  and          zero, a1, s0
                  slt          a2, t2, gp
                  srai         t3, a6, 5
                  c.addi       s11, 16
                  c.nop
                  sll          a7, s3, a5
                  or           a7, s8, a0
                  sltiu        t6, a2, -660
                  c.srai       s0, 30
                  csrrsi       t0, 0x340, 0
                  c.addi       a2, -1
                  xori         t5, tp, -1510
                  slli         a7, tp, 16
                  srl          t6, s4, a3
                  csrrwi       t6, 0x340, 17
                  srli         s10, s6, 1
                  c.addi       t3, 1
                  and          ra, t6, gp
                  nop
                  c.add        s0, s7
                  c.slli       a5, 29
                  csrrci       a2, 0x340, 0
                  csrrwi       t5, 0x340, 29
                  xor          sp, t1, tp
                  div          a0, a0, t4
                  c.addi       a0, -1
                  c.add        t4, gp
                  mul          t4, t1, a6
                  csrrsi       a2, 0x340, 14
                  lui          s3, 70730
                  xori         t1, t3, -1791
                  andi         t5, s3, -1040
                  c.srli       s0, 15
                  mulhu        tp, s10, a6
                  lui          t1, 181029
                  auipc        tp, 920786
                  c.addi4spn   s0, sp, 784
                  sltu         a2, s2, s1
                  sll          zero, s4, a1
                  c.addi16sp   sp, 304
                  auipc        s5, 504125
                  slti         s4, ra, -612
                  c.lui        s6, 10
                  mulhu        a0, a7, s3
                  and          s11, tp, t3
                  c.lui        t4, 10
                  c.nop
                  xor          a0, t0, tp
                  csrrw        t1, 0x340, s8
                  c.add        t5, s2
                  addi         s10, a1, 991
                  add          a4, s4, a7
                  csrrwi       a2, 0x340, 24
                  c.slli       t1, 6
                  c.lui        gp, 12
                  slli         t1, s4, 5
                  c.xor        a5, a3
                  sll          s10, ra, t4
                  add          a6, s0, t2
                  c.or         s1, s0
                  srl          t1, s11, s10
                  sltiu        t4, a0, -2013
                  ori          s11, a2, -210
                  c.mv         t5, a6
                  xor          t3, a0, s8
                  c.addi4spn   a4, sp, 304
                  csrrc        t3, 0x340, s7
                  xor          a2, t6, gp
                  c.add        t1, s6
                  sub          a5, gp, a0
                  c.and        a4, a4
                  csrrsi       a0, 0x340, 0
                  div          gp, t5, s2
                  c.or         s0, a2
                  sltiu        s0, sp, -1834
                  csrrci       s3, 0x340, 7
                  c.sub        a4, s0
                  sra          t0, a0, s4
                  csrrc        zero, 0x340, s2
                  c.or         s1, a0
                  nop
                  auipc        a4, 120670
                  sll          a5, s5, zero
                  csrrci       s9, 0x340, 4
                  csrrwi       a7, 0x340, 7
                  mulhsu       a5, tp, s6
                  csrrs        t1, 0x340, s3
                  c.or         a5, a0
                  c.sub        a2, s0
                  slt          s0, s6, gp
                  csrrc        t1, 0x340, zero
                  csrrci       t0, 0x340, 31
                  slti         s5, ra, 2009
                  rem          s10, t2, t1
                  sra          s2, tp, s4
                  sra          tp, s3, s5
                  lui          gp, 562293
                  mulhsu       a5, sp, zero
                  auipc        a4, 302032
                  lui          t6, 978959
                  slt          a4, a1, a4
                  slli         a0, ra, 23
                  c.slli       t6, 15
                  mulhu        t0, s6, s8
                  csrrc        s3, 0x340, s0
                  c.andi       a2, -1
                  sll          s1, a3, t4
                  srai         zero, a4, 3
                  c.lui        s10, 5
                  c.addi       a4, 24
                  auipc        t6, 755752
                  c.addi       a2, -1
                  slti         a6, t3, -1
                  srai         s5, t6, 20
                  remu         t4, s10, s9
                  sll          sp, a4, s0
                  rem          s5, s7, ra
                  c.li         s5, -1
                  c.addi4spn   a5, sp, 96
                  c.add        a6, t0
                  csrrc        gp, 0x340, s11
                  and          s8, s2, t2
                  addi         s7, s7, 1096
                  or           s11, a0, s0
                  c.addi       t6, 20
                  mulh         a6, a2, t5
                  c.li         tp, 14
                  c.or         a5, a5
                  c.addi16sp   sp, -16
                  c.nop
                  c.srli       s0, 18
                  slti         s8, gp, -331
                  sra          a6, s1, s11
                  rem          s3, a4, s0
                  mulhu        t4, t5, a1
                  c.li         t5, -1
                  c.srai       a2, 9
                  c.sub        a2, a2
                  sub          t3, s7, a7
                  sll          s10, s3, a5
                  andi         a4, t0, 397
                  mulhu        s9, s6, s2
                  csrrci       s3, 0x340, 0
                  c.add        gp, t1
                  c.srli       s0, 9
                  sub          a6, t4, tp
                  add          zero, a3, s9
                  mulhu        s8, s8, s10
                  div          t1, s6, sp
                  xori         zero, s6, -1355
                  mul          s6, t0, s6
                  csrrwi       s0, 0x340, 3
                  srl          sp, a0, gp
                  csrrw        t5, 0x340, s10
                  andi         a5, a4, -448
                  c.addi4spn   a4, sp, 448
                  divu         t3, s4, s6
                  div          s10, a3, t5
                  c.li         s4, -1
                  xori         a2, a1, -1237
                  addi         s6, s5, -207
                  mul          s6, t2, a0
                  lui          a2, 658610
                  sltiu        s11, a5, -1143
                  c.nop
                  csrrwi       s6, 0x340, 2
                  andi         s6, s1, 169
                  div          a7, t2, a1
                  ori          s4, t1, -753
                  auipc        ra, 485761
                  lui          a5, 887652
                  slli         s10, t0, 12
                  addi         t6, s11, -2020
                  mulhu        a4, t1, a0
                  andi         a5, s7, 1096
                  sltiu        s6, a1, 145
                  c.mv         s11, s3
                  srai         t6, s8, 5
                  c.addi       tp, 25
                  div          a4, sp, a7
                  c.mv         s5, t1
                  csrrsi       s8, 0x340, 26
                  addi         a4, a5, 826
                  csrrci       s7, 0x340, 0
                  c.mv         s3, a7
                  c.xor        a5, a5
                  auipc        s10, 1042625
                  srl          s6, a5, gp
                  div          s3, a3, t0
                  c.li         s8, 29
                  sll          s3, s11, s1
                  c.or         a2, a2
                  and          t6, s9, s9
                  or           s6, a0, s3
                  c.sub        a2, s1
                  nop
                  csrrc        a4, 0x340, zero
                  c.srai       s1, 23
                  sltu         s7, tp, tp
                  div          s5, a2, s10
                  auipc        sp, 162419
                  sll          a0, a5, t2
                  or           t1, a6, s11
                  div          s5, a4, t2
                  csrrc        a5, 0x340, t1
                  c.nop
                  c.xor        s1, a5
                  sub          sp, s3, a2
                  c.andi       a2, -1
                  c.addi       a6, -1
                  c.addi       gp, -1
                  sltu         t6, s4, sp
                  and          a7, s3, t6
                  lui          t4, 990559
                  c.andi       a5, -1
                  nop
                  csrrwi       s0, 0x340, 19
                  c.mv         s9, s10
                  csrrs        ra, 0x340, zero
                  srli         a5, s2, 26
                  slti         s9, s10, -853
                  remu         s3, s11, s10
                  c.andi       a5, -1
                  xor          t6, s7, s1
                  div          s11, tp, t3
                  c.srli       a4, 11
                  c.srli       s0, 14
                  c.addi4spn   s0, sp, 816
                  c.xor        a2, a3
                  slli         s0, t1, 20
                  c.nop
                  csrrs        s6, 0x340, zero
                  remu         a5, t1, gp
                  c.li         ra, -1
                  csrrsi       tp, 0x340, 17
                  c.srli       a0, 24
                  mulhu        s10, s7, t0
                  andi         t3, t4, -58
                  srl          s4, zero, a2
                  add          tp, t4, s3
                  xor          a4, s11, zero
                  xor          s6, a5, a1
                  slti         s5, s6, -1655
                  srai         t4, s9, 2
                  sll          s11, s4, zero
                  csrrs        zero, 0x340, zero
                  slt          t6, t5, a1
                  c.addi4spn   a5, sp, 416
                  csrrc        a0, 0x340, tp
                  c.srai       s0, 18
                  mulhu        s9, t4, s5
                  c.addi4spn   a4, sp, 944
                  csrrsi       s1, 0x340, 18
                  auipc        a2, 420304
                  remu         ra, a6, t6
                  divu         a0, t6, s4
                  auipc        s1, 314441
                  mul          s7, s0, t3
                  mulh         gp, t6, s3
                  c.srli       s0, 24
                  csrrsi       t4, 0x340, 6
                  csrrs        a0, 0x340, s4
                  auipc        a0, 834511
                  sltu         sp, s1, s4
                  add          s3, t4, a2
                  mul          s6, t6, t5
                  c.xor        a5, a0
                  sub          a2, a5, a2
                  c.nop
                  and          a7, s5, a4
                  csrrsi       tp, 0x340, 27
                  c.addi       s2, 17
                  c.srli       a5, 21
                  c.xor        s1, a4
                  c.srli       a4, 31
                  srai         a2, a4, 12
                  lui          s3, 413555
                  lui          s6, 428345
                  c.srai       a2, 1
                  c.add        a7, a2
                  xori         t1, t4, -2036
                  or           t0, s5, s9
                  divu         a2, a2, a6
                  remu         s9, s1, s3
                  nop
                  andi         a0, s6, 355
                  xori         s5, t2, -1128
                  csrrci       s4, 0x340, 0
                  lui          t6, 774809
                  c.nop
                  slli         a0, t0, 19
                  srli         s11, a6, 0
                  sra          a2, a7, a0
                  c.sub        s0, a1
                  sub          t0, zero, a0
                  sll          s10, s1, s9
                  ori          s4, a4, -609
                  c.slli       a2, 1
                  sltiu        s6, s3, -487
                  ori          s0, s7, -533
                  csrrsi       s10, 0x340, 0
                  c.srai       a5, 15
                  c.add        s2, t2
                  div          s8, a6, t1
                  mulhu        t1, t1, s10
                  div          zero, s6, s11
                  andi         a4, s8, -573
                  remu         tp, gp, s11
                  c.add        s2, a6
                  mulhsu       zero, t2, t4
                  slti         a0, ra, -794
                  csrrs        t5, 0x340, zero
                  c.andi       a5, -1
                  c.sub        a5, a5
                  c.li         a6, 2
                  nop
                  lui          a5, 200818
                  sltu         s6, s6, zero
                  c.mv         t4, a5
                  c.srai       a5, 29
                  csrrci       a5, 0x340, 0
                  mulh         zero, a3, s4
                  slt          s2, sp, t0
                  srl          sp, s8, a7
                  nop
                  csrrsi       a4, 0x340, 0
                  csrrci       s1, 0x340, 0
                  nop
                  csrrsi       t5, 0x340, 20
                  or           s1, s4, t4
                  sll          ra, s11, s6
                  addi         s6, t5, -362
                  sll          s10, gp, s3
                  c.addi4spn   s0, sp, 608
                  div          t1, s9, t0
                  c.sub        s0, s1
                  c.or         a4, a2
                  add          t3, t1, a2
                  or           t5, ra, t0
                  mul          a2, t3, s1
                  and          t0, zero, a6
                  csrrc        sp, 0x340, zero
                  srai         s9, t2, 10
                  divu         a0, a5, s4
                  mulhsu       s11, s2, s0
                  c.add        s1, a6
                  c.xor        a2, a4
                  csrrw        ra, 0x340, s6
                  and          t1, s3, s11
                  andi         t4, a6, 942
                  sll          s2, t3, ra
                  c.addi       t5, -1
                  ori          s8, t2, -72
                  mulhu        s2, t5, s10
                  c.xor        a5, s1
                  andi         gp, s11, -2045
                  addi         s7, s5, 103
                  csrrw        t4, 0x340, a3
                  sll          a7, s8, a1
                  csrrci       t3, 0x340, 0
                  addi         a6, gp, 1918
                  c.sub        a5, s1
                  xor          t4, s11, a6
                  c.sub        a4, a0
                  c.addi16sp   sp, 224
                  csrrsi       a0, 0x340, 7
                  csrrsi       s0, 0x340, 0
                  divu         gp, a3, t6
                  or           t1, a1, s8
                  slt          s7, a3, s2
                  c.add        s8, s9
                  andi         s4, s7, 1812
                  c.nop
                  andi         t0, s8, -1402
                  mul          a7, a1, s7
                  mul          a7, a6, a1
                  sltu         s4, a1, a7
                  c.andi       a5, -1
                  slli         gp, t2, 27
                  remu         a0, a1, t0
                  sltu         tp, a3, s4
                  csrrw        t3, 0x340, s0
                  srli         s4, t6, 1
                  slli         a2, s1, 0
                  sra          s3, a2, t6
                  c.and        s1, a0
                  c.mv         s0, tp
                  c.sub        a2, a4
                  sltiu        s0, t4, -1092
                  c.andi       s0, 19
                  xor          a4, sp, s10
                  and          s5, s11, s11
                  add          s3, a7, ra
                  xori         s3, s11, -1385
                  slti         sp, s9, -907
                  mulhsu       a5, a5, a5
                  slt          t0, s5, s11
                  slti         s5, s0, -1288
                  auipc        s2, 897097
                  csrrc        gp, 0x340, zero
                  ori          zero, tp, -1969
                  xori         s4, a0, 1428
                  c.nop
                  c.addi       s9, -1
                  sll          t0, s7, s10
                  sltu         s10, a3, s1
                  c.addi       a0, -1
                  c.mv         sp, t3
                  sub          a2, t5, a5
                  sltu         s7, s5, s5
                  csrrw        a5, 0x340, gp
                  div          s5, s1, s2
                  c.xor        s1, s1
                  mulh         s10, a6, s9
                  c.slli       t1, 10
                  sltiu        t5, tp, -41
                  c.add        s7, a0
                  sub          t3, t1, t1
                  add          ra, tp, a3
                  divu         a2, ra, sp
                  or           t1, t2, t1
                  srai         a2, a5, 30
                  addi         a6, t0, 872
                  mulh         s1, a7, s2
                  remu         ra, s1, ra
                  rem          t3, s10, tp
                  c.addi       s1, -1
                  csrrw        t6, 0x340, s10
                  c.sub        s1, s1
                  mul          a4, a6, t5
                  c.li         a0, -1
                  and          s7, s9, s1
                  xor          sp, zero, t0
                  c.addi       t4, -1
                  srl          s8, s6, sp
                  sltiu        a5, a0, 1777
                  c.andi       a0, -1
                  mul          t5, t6, t3
                  csrrci       t6, 0x340, 0
                  mul          gp, ra, a4
                  mul          s0, s3, a1
                  slt          s1, a6, a1
                  andi         s3, a3, 69
                  c.and        s1, a3
                  c.slli       s2, 9
                  add          s4, s0, s11
                  c.sub        a0, a1
                  nop
                  auipc        t1, 97494
                  add          a4, a4, sp
                  c.addi4spn   s0, sp, 752
                  xor          sp, sp, zero
                  c.or         a5, a5
                  c.addi4spn   a4, sp, 688
                  mulhsu       tp, gp, t6
                  sra          tp, s2, t6
                  slti         gp, a1, -1408
                  rem          s9, t5, a3
                  srli         zero, t2, 3
                  c.addi4spn   a2, sp, 560
                  c.srai       a0, 11
                  divu         s9, a5, s9
                  csrrc        a4, 0x340, zero
                  csrrci       s8, 0x340, 0
                  divu         s9, t1, tp
                  sra          gp, t0, a5
                  rem          t0, s1, s3
                  c.xor        a5, a2
                  xori         gp, s9, 2027
                  sll          sp, a7, ra
                  remu         sp, s6, s5
                  c.srli       a4, 25
                  andi         s9, t2, -391
                  c.mv         a5, s6
                  c.addi       s8, 26
                  c.sub        a4, a3
                  c.addi       a7, -1
                  c.add        sp, sp
                  andi         s0, a6, 1168
                  c.srai       a4, 10
                  c.srai       a4, 17
                  csrrsi       a2, 0x340, 0
                  csrrsi       tp, 0x340, 0
                  srai         s10, t6, 17
                  srl          s2, gp, sp
                  slli         t0, s9, 24
                  div          s11, s7, sp
                  c.sub        a0, a0
                  sub          tp, s2, ra
                  mulhsu       t5, a3, s3
                  csrrw        s1, 0x340, t3
                  lui          t6, 871300
                  add          a4, s7, a7
                  c.or         a4, s1
                  slti         a6, s5, 1622
                  sub          zero, s5, sp
                  c.sub        s1, a0
                  mulhsu       s6, tp, s3
                  sra          a6, a2, s6
                  sltiu        t5, a3, 1932
                  sra          s4, s10, sp
                  srl          a2, s7, s0
                  c.and        a5, a1
                  mulhsu       s2, ra, s11
                  c.addi4spn   s1, sp, 688
                  mulhsu       s8, a6, a7
                  c.addi       gp, 6
                  c.addi16sp   sp, 272
                  mulhsu       s1, s0, s7
                  c.and        a5, s0
                  mulhsu       t4, sp, t6
                  nop
                  sra          s8, s11, s5
                  c.lui        s4, 5
                  auipc        s2, 493899
                  remu         a4, a0, tp
                  c.andi       s0, 24
                  c.lui        s8, 18
                  csrrwi       s4, 0x340, 28
                  c.srli       a0, 21
                  add          a7, t2, a3
                  csrrc        s7, 0x340, a5
                  csrrsi       zero, 0x340, 31
                  sltiu        s4, s8, -1698
                  xor          s0, sp, s6
                  xori         s3, s1, -819
                  mulh         s3, t2, a3
                  sll          t0, t4, t6
                  slti         s3, a1, 49
                  c.andi       a4, 30
                  ori          t5, s9, 472
                  slt          s6, s8, s0
                  csrrsi       s2, 0x340, 8
                  nop
                  slti         t0, s9, -1875
                  csrrw        a6, 0x340, t5
                  c.add        s5, sp
                  c.and        s0, s0
                  c.andi       s0, 21
                  c.srli       a5, 7
                  divu         s3, a6, gp
                  add          s6, s3, a1
                  auipc        s5, 776967
                  nop
                  c.li         s4, 15
                  divu         t0, s5, t4
                  srli         s9, zero, 25
                  csrrwi       t6, 0x340, 24
                  lui          a2, 1017500
                  rem          s1, a2, s1
                  nop
                  c.addi       tp, -1
                  auipc        zero, 570256
                  c.or         s0, a3
                  remu         tp, gp, t1
                  addi         s2, t0, -334
                  mulhu        s3, s2, s4
                  c.lui        s5, 31
                  sltiu        s8, s9, -1342
                  nop
                  c.or         a0, a5
                  c.addi       t4, -1
                  srai         t6, gp, 21
                  csrrci       t4, 0x340, 24
                  mul          s2, a7, ra
                  auipc        s6, 884943
                  c.srli       s0, 23
                  c.srai       a0, 9
                  c.srli       a4, 8
                  csrrci       s6, 0x340, 0
                  xori         t5, t3, 363
                  mul          s0, s4, a5
                  mul          s0, s11, tp
                  c.addi4spn   s0, sp, 864
                  lui          s7, 79936
                  c.srai       a2, 14
                  remu         t0, s6, s2
                  c.addi16sp   sp, 16
                  mulh         ra, a4, t3
                  mulhsu       s2, s9, t1
                  csrrsi       s1, 0x340, 0
                  csrrsi       a2, 0x340, 30
                  xori         s1, t1, 1577
                  mulhsu       a5, s11, s4
                  lui          ra, 165583
                  c.andi       s0, -1
                  c.and        s0, a2
                  c.addi16sp   sp, 96
                  ori          s2, a5, -1409
                  addi         s9, t4, 203
                  c.addi16sp   sp, 192
                  c.add        t4, ra
                  lui          s2, 494741
                  csrrci       s2, 0x340, 0
                  mul          a7, s0, tp
                  c.addi16sp   sp, -16
                  nop
                  auipc        t0, 632255
                  csrrs        a6, 0x340, zero
                  xor          tp, s8, a1
                  srai         a6, a1, 25
                  mulhsu       s2, t1, s11
                  c.addi4spn   a5, sp, 656
                  srai         ra, a5, 12
                  nop
                  xor          t0, t5, s4
                  srl          a4, s1, s3
                  csrrs        a0, 0x340, zero
                  c.srli       s1, 28
                  csrrwi       s9, 0x340, 13
                  sra          t6, s4, s5
                  c.addi4spn   a2, sp, 640
                  add          s3, a4, s2
                  slti         a6, t2, -64
                  c.slli       s2, 9
                  sll          zero, t2, s3
                  csrrc        s8, 0x340, a1
                  srli         sp, a3, 31
                  c.add        s11, sp
                  c.addi       t1, 19
                  slt          t0, s0, a0
                  c.li         s8, -1
                  c.addi       s9, -1
                  sub          tp, s11, s10
                  slti         s7, s10, -1880
                  c.add        a2, s5
                  nop
                  csrrc        s7, 0x340, zero
                  c.add        s0, s10
                  remu         tp, s7, s9
                  c.lui        s0, 11
                  c.sub        s0, a1
                  c.sub        a4, a5
                  c.addi       a7, -1
                  c.addi       a5, 12
                  add          s5, s1, sp
                  lui          s9, 968048
                  c.addi16sp   sp, 256
                  addi         a0, t5, -790
                  c.and        a0, s0
                  c.li         t4, -1
                  csrrci       t6, 0x340, 0
                  nop
                  and          gp, sp, s5
                  c.srai       a2, 1
                  c.xor        a4, a1
                  c.sub        a2, a1
                  csrrw        s6, 0x340, zero
                  sltu         t3, a1, a3
                  mulhsu       a0, s11, t6
                  andi         sp, a7, -280
                  c.or         a0, a0
                  slli         s10, s8, 3
                  c.mv         s9, s8
                  or           s7, s4, s10
                  srl          a2, s0, s2
                  srai         s2, tp, 23
                  lui          s2, 37499
                  c.nop
                  c.sub        s1, s0
                  sub          a5, t4, t3
                  c.add        t0, s5
                  xor          s1, a2, t3
                  c.sub        a4, a4
                  c.srai       a4, 27
                  mul          s10, s11, t4
                  and          t3, t2, s10
                  and          a0, t0, a4
                  srai         a5, t5, 27
                  divu         s6, zero, a5
                  c.addi16sp   sp, 256
                  mulhu        s10, s2, t4
                  csrrw        t5, 0x340, sp
                  srli         a5, s1, 20
                  mulhsu       t6, t0, a6
                  add          a0, tp, s6
                  div          s3, gp, s7
                  ori          s0, s5, 1832
                  mulhu        a4, s0, a4
                  mul          t4, s0, t2
                  or           s4, s1, ra
                  c.or         s1, a0
                  slt          s6, t5, t0
                  c.addi16sp   sp, -16
                  csrrsi       a5, 0x340, 22
                  c.andi       a5, -1
                  srai         a6, t3, 29
                  nop
                  c.slli       t4, 20
                  mulhsu       a7, s6, s4
                  c.li         t5, 19
                  rem          a5, a5, ra
                  csrrci       tp, 0x340, 1
                  sra          a7, gp, a1
                  srli         s7, s2, 1
                  add          t1, s3, ra
                  c.lui        s3, 21
                  xori         s7, t6, -757
                  or           s9, a0, t0
                  c.addi4spn   a0, sp, 224
                  c.nop
                  add          a0, a0, s8
                  sub          t1, a0, s7
                  sll          gp, s9, s4
                  xor          s11, s1, t6
                  csrrc        a7, 0x340, zero
                  divu         s11, tp, t0
                  div          s4, zero, a7
                  c.mv         gp, s1
                  nop
                  remu         t4, s2, s9
                  slli         s8, a5, 5
                  mulhsu       s7, a2, a2
                  addi         a7, s6, -696
                  xori         tp, t3, 1941
                  sltiu        t1, a4, -1544
                  mulh         s5, zero, s3
                  div          a6, t2, s9
                  srai         t6, t0, 22
                  c.li         a5, 31
                  c.addi4spn   a4, sp, 960
                  sra          s4, a7, s1
                  sltiu        s10, s0, 1080
                  slt          s1, s7, sp
                  and          sp, a0, s9
                  srai         tp, s4, 24
                  c.add        s10, s11
                  mulh         a2, zero, s3
                  xori         s11, s6, 913
                  nop
                  c.li         ra, 13
                  nop
                  xori         a7, s1, 559
                  csrrci       t4, 0x340, 0
                  c.srli       a4, 26
                  mul          a2, t2, a1
                  c.srli       a4, 19
                  or           s11, s1, s7
                  xor          s4, sp, s10
                  c.slli       t4, 26
                  slti         sp, a1, -821
                  c.li         a0, -1
                  div          a0, t2, s1
                  sub          s8, a7, t0
                  or           s3, a0, t6
                  csrrc        a0, 0x340, zero
                  mul          a0, s3, ra
                  andi         ra, a4, -1087
                  addi         a2, gp, 223
                  mulhu        t1, t4, a1
                  c.add        s5, sp
                  c.or         s0, a1
                  nop
                  c.srli       a0, 31
                  andi         t0, a1, 1960
                  srli         t6, t0, 31
                  ori          sp, a1, 964
                  c.addi4spn   a5, sp, 16
                  ori          s8, zero, 1224
                  c.srai       a0, 1
                  rem          sp, s10, s9
                  sub          t4, a1, t3
                  sltu         s7, s6, s7
                  srai         t5, a7, 4
                  csrrw        a4, 0x340, s1
                  mulhsu       a2, s9, a6
                  andi         s4, t2, 1359
                  c.srli       a4, 4
                  sra          a5, t5, a2
                  auipc        a4, 175340
                  c.sub        a4, a1
                  remu         a7, t3, a5
                  andi         tp, s7, -892
                  srl          s7, zero, s3
                  sltu         s3, s8, a3
                  slt          s2, s4, t5
                  c.srli       a2, 5
                  mul          a4, t4, t3
                  mulhsu       s6, a7, t1
                  c.addi       gp, -1
                  csrrci       s8, 0x340, 23
                  mulhsu       t3, t1, zero
                  and          a5, s4, zero
                  or           a6, s7, s3
                  sra          a7, a5, s9
                  c.and        a5, a2
                  mul          t4, s6, s2
                  or           a5, a7, gp
                  add          s7, t4, s1
                  div          t4, s6, s2
                  sll          ra, s10, a0
                  csrrci       t5, 0x340, 0
                  sltiu        t3, gp, -364
                  auipc        sp, 539441
                  c.slli       a4, 5
                  c.li         t3, 30
                  slti         t5, s4, -509
                  csrrw        s5, 0x340, t4
                  xor          zero, s8, a2
                  mulh         s9, gp, a2
                  c.addi       a7, 28
                  mulhsu       t1, a4, sp
                  xor          a7, a4, a0
                  c.or         a4, a4
                  auipc        s2, 865611
                  c.li         s0, -1
                  sra          t5, zero, a2
                  c.lui        a6, 6
                  csrrsi       s5, 0x340, 3
                  c.li         a4, -1
                  c.srli       a2, 6
                  ori          gp, gp, -179
                  sra          s11, t6, a2
                  c.srai       a2, 26
                  csrrwi       a2, 0x340, 25
                  c.and        a4, a3
                  c.addi16sp   sp, -16
                  csrrsi       a6, 0x340, 15
                  csrrci       t3, 0x340, 17
                  xori         s1, s5, 1738
                  csrrci       s7, 0x340, 6
                  mulh         s5, t2, t2
                  csrrci       s11, 0x340, 0
                  srli         s1, s10, 3
                  c.mv         s11, a5
                  sltiu        tp, s7, -997
                  auipc        a5, 116240
                  c.nop
                  c.addi4spn   s0, sp, 640
                  c.add        a7, a6
                  c.slli       a7, 13
                  sltiu        t3, ra, -879
                  csrrc        t0, 0x340, t5
                  mul          s5, gp, a2
                  srli         t5, t1, 16
                  or           s3, t6, s9
                  csrrsi       s7, 0x340, 4
                  c.mv         ra, s2
                  c.andi       a2, -1
                  c.add        a5, a4
                  c.xor        a4, a3
                  c.addi4spn   s1, sp, 992
                  c.addi       s4, 25
                  c.andi       a5, 0
                  srl          s8, t3, zero
                  and          s1, s7, s6
                  c.sub        s1, s0
                  c.addi16sp   sp, 160
                  c.or         s0, a0
                  sltu         t3, s7, a5
                  csrrsi       a6, 0x340, 0
                  sltiu        sp, s6, 1023
                  c.addi16sp   sp, 272
                  slli         t0, a5, 2
                  sub          s6, tp, a1
                  slti         s10, t5, -1556
                  rem          sp, a2, zero
                  sltu         a5, s4, sp
                  c.srai       s0, 23
                  addi         tp, t3, -1880
                  lui          s7, 30647
                  nop
                  csrrc        t1, 0x340, t5
                  xor          s11, t2, t6
                  c.sub        a0, a0
                  addi         s7, t4, 1127
                  mul          s3, t2, t2
                  csrrs        zero, 0x340, zero
                  rem          s10, s1, s11
                  csrrwi       s9, 0x340, 25
                  andi         a4, s0, 652
                  srl          s3, s9, a7
                  sll          t0, tp, zero
                  mulhu        ra, zero, t2
                  c.nop
                  xori         s4, a1, 1094
                  xori         t5, t2, -658
                  c.li         t0, -1
                  addi         s5, tp, 1119
                  sra          zero, zero, t6
                  or           s4, s6, t3
                  divu         t0, s0, t1
                  addi         a6, a7, 49
                  c.addi       s4, 17
                  c.addi4spn   s0, sp, 672
                  xori         a2, zero, 1544
                  and          s11, s9, a7
                  ori          a5, s10, 108
                  csrrs        s5, 0x340, zero
                  c.lui        gp, 12
                  lui          ra, 302180
                  c.srli       a4, 19
                  c.lui        s6, 27
                  auipc        s10, 573211
                  srai         t4, sp, 2
                  srai         t1, s9, 24
                  lui          sp, 326076
                  mul          a0, t4, a1
                  addi         s2, s3, 1804
                  srl          a4, s5, s11
                  xori         t5, a1, -46
                  c.li         t4, 0
                  c.addi       t5, 9
                  c.addi4spn   a0, sp, 656
                  remu         ra, a5, s8
                  csrrw        a0, 0x340, s4
                  and          a5, s3, s7
                  sra          t6, s4, gp
                  lui          a6, 888822
                  c.nop
                  c.srai       a0, 21
                  c.mv         t6, s0
                  c.nop
                  srli         zero, s6, 15
                  mulhsu       s8, a6, sp
                  csrrw        t0, 0x340, a6
                  c.add        a6, t3
                  c.lui        t1, 9
                  sub          s8, s9, a0
                  add          s3, a2, s11
                  auipc        s9, 480396
                  auipc        t3, 124423
                  c.li         s5, 1
                  c.srli       a4, 31
                  andi         t0, s0, 1493
                  addi         t6, s5, 351
                  slti         t3, s3, -165
                  csrrci       ra, 0x340, 0
                  c.li         s0, -1
                  srai         s0, s4, 0
                  c.andi       a0, -1
                  slli         s11, s10, 9
                  divu         s1, a5, s10
                  nop
                  slt          s5, a2, a7
                  sra          s3, t5, a0
                  c.xor        a2, a5
                  andi         s3, t6, 552
                  c.slli       a2, 25
                  csrrwi       s6, 0x340, 13
                  c.srli       a2, 3
                  csrrc        t5, 0x340, s1
                  sltiu        s4, s1, 984
                  sll          s11, zero, s5
                  sltu         s8, a2, t3
                  mulhsu       a2, t6, t1
                  addi         t0, t3, 988
                  c.mv         s0, s8
                  xori         gp, t6, 1414
                  slt          s5, t4, s0
                  sub          a7, s7, t4
                  addi         a4, t4, 1579
                  mul          a6, s2, t1
                  csrrw        t0, 0x340, s9
                  c.mv         s11, s1
                  c.addi4spn   a2, sp, 48
                  srli         s7, t0, 29
                  c.addi4spn   a2, sp, 304
                  c.slli       a0, 18
                  c.addi       s7, -1
                  slli         s1, a7, 20
                  c.slli       s0, 22
                  sltiu        zero, t4, 819
                  c.li         s6, -1
                  nop
                  slti         tp, a4, 511
                  or           t3, s7, s11
                  mulhu        t1, s2, a4
                  csrrsi       s10, 0x340, 0
                  rem          t1, t5, tp
                  c.addi16sp   sp, -16
                  c.lui        t3, 20
                  remu         s6, tp, a3
                  c.nop
                  csrrwi       a0, 0x340, 3
                  ori          t5, tp, 491
                  c.xor        a5, a3
                  c.mv         t4, s5
                  csrrw        a7, 0x340, t3
                  csrrci       t5, 0x340, 0
                  c.mv         a6, s0
                  nop
                  nop
                  slt          ra, zero, tp
                  sltu         tp, t2, s10
                  c.sub        a5, a0
                  c.nop
                  lui          a2, 629070
                  c.srli       s0, 11
                  csrrw        sp, 0x340, s1
                  xor          sp, t4, s10
                  and          t4, t5, a6
                  c.li         t3, 1
                  srli         s11, ra, 7
                  mulh         zero, s1, s10
                  and          a2, s0, a7
                  c.andi       a4, 28
                  c.sub        a2, a4
                  sub          t0, tp, t0
                  c.addi16sp   sp, 192
                  srli         s5, s1, 29
                  csrrwi       s0, 0x340, 25
                  ori          gp, t3, 1812
                  sra          t6, t5, t3
                  csrrs        tp, 0x340, t0
                  div          sp, s2, s3
                  mulhu        s11, t4, s6
                  srli         s8, s1, 28
                  csrrci       t6, 0x340, 0
                  mulh         s4, t6, s5
                  sll          a2, sp, ra
                  or           s6, a1, tp
                  csrrw        a7, 0x340, a3
                  div          gp, t1, a5
                  c.srli       a2, 19
                  sltu         t1, s7, s6
                  c.srai       a5, 12
                  and          t5, t4, t3
                  c.slli       t5, 26
                  c.srai       s1, 4
                  remu         sp, tp, a4
                  csrrw        a2, 0x340, s2
                  sltu         s6, a2, s3
                  or           a2, s10, s11
                  csrrci       ra, 0x340, 12
                  c.and        a2, a5
                  csrrci       s5, 0x340, 6
                  c.srai       s1, 30
                  csrrs        t1, 0x340, zero
                  c.andi       a5, 14
                  or           s8, s5, t0
                  c.slli       a0, 27
                  c.addi16sp   sp, -16
                  c.addi       a2, 14
                  addi         sp, s3, 1855
                  csrrw        s0, 0x340, sp
                  rem          t5, zero, t6
                  andi         a0, s2, -1594
                  c.srli       s1, 1
                  c.slli       a6, 27
                  ori          t1, s3, -1132
                  c.slli       gp, 11
                  rem          tp, t1, s10
                  csrrw        a2, 0x340, a5
                  c.xor        a0, a0
                  csrrs        s3, 0x340, zero
                  remu         s9, zero, t3
                  csrrc        s11, 0x340, a6
                  sltu         t3, t3, t4
                  andi         a4, t1, -63
                  div          s10, a1, t6
                  c.mv         a6, s0
                  sra          tp, s0, a7
                  c.and        a0, a1
                  add          s3, a1, s11
                  sra          s2, sp, t1
                  slti         s10, t1, -215
                  sra          s0, s10, s11
                  csrrs        s1, 0x340, s4
                  divu         t1, t4, s4
                  sub          tp, s10, t2
                  ori          t5, t3, 373
                  csrrw        t6, 0x340, gp
                  csrrw        a0, 0x340, s6
                  sltiu        s3, s3, 411
                  c.andi       a2, -1
                  mul          a2, t3, a5
                  srli         s6, gp, 30
                  xori         a6, a2, 1162
                  c.or         s1, a5
                  sltu         a2, a3, t3
                  c.addi       a2, -1
                  sra          a4, s2, s8
                  c.li         t3, -1
                  csrrsi       sp, 0x340, 4
                  sltu         s0, s11, s0
                  sll          t6, a7, s3
                  sra          s1, s3, a2
                  addi         s2, a0, 1215
                  xor          s3, a4, s1
                  xor          tp, a0, t0
                  c.mv         s7, s5
                  slti         s9, a7, 1612
                  xor          s6, s10, s8
                  csrrw        t0, 0x340, s7
                  c.xor        a5, a1
                  ori          s9, s6, 387
                  mul          a5, t0, a5
                  divu         s5, t2, a3
                  addi         a7, s5, 664
                  csrrs        t6, 0x340, a3
                  c.addi4spn   a4, sp, 16
                  rem          s9, a3, t0
                  sra          zero, t5, a0
                  remu         t3, s10, tp
                  or           t4, ra, t4
                  slt          zero, tp, t0
                  slli         t3, t0, 5
                  srai         t0, s5, 1
                  srai         s9, zero, 14
                  slli         s8, s5, 8
                  srli         t5, s10, 3
                  srl          t6, s5, ra
                  mulhsu       s8, t5, a6
                  remu         a5, t2, zero
                  c.sub        s1, a2
                  srl          t1, s11, t5
                  c.addi4spn   a5, sp, 16
                  mulh         tp, s10, s8
                  csrrsi       s11, 0x340, 0
                  csrrw        s5, 0x340, tp
                  sub          tp, s9, zero
                  lui          t6, 873314
                  xori         a4, s8, -337
                  c.srai       s1, 25
                  c.andi       a2, -1
                  csrrci       s1, 0x340, 9
                  srli         t3, s5, 15
                  or           s3, s9, t1
                  xor          a7, s1, tp
                  sll          s11, t5, s9
                  ori          sp, sp, -613
                  c.and        a2, a0
                  sltu         s10, a4, t2
                  mulhu        a2, a2, a2
                  c.nop
                  c.addi       s6, 16
                  mulh         zero, s11, a0
                  csrrc        t1, 0x340, zero
                  srli         s6, s11, 5
                  and          s10, s10, t2
                  divu         sp, s8, s1
                  sll          s2, s8, s2
                  srli         zero, s5, 22
                  srl          s1, t0, s8
                  srai         s6, s7, 18
                  c.lui        s11, 6
                  srl          gp, s4, s9
                  c.addi16sp   sp, -16
                  ori          ra, t0, 33
                  sra          s0, s6, s4
                  c.sub        a2, a2
                  mulhu        s6, zero, s2
                  div          t3, s10, t4
                  ori          s10, s8, -677
                  nop
                  slti         t0, t5, 1295
                  srli         a0, a7, 13
                  addi         a5, t5, -421
                  c.and        s0, a1
                  c.mv         t5, t6
                  sltiu        sp, t6, -1852
                  csrrw        s10, 0x340, t3
                  csrrw        t4, 0x340, a6
                  c.or         a2, a5
                  c.addi4spn   s0, sp, 384
                  sltiu        s11, a1, -57
                  c.addi16sp   sp, 496
                  mulhu        s4, s11, s9
                  sra          s5, tp, a4
                  remu         s0, s6, s3
                  and          tp, s6, tp
                  c.and        a2, a1
                  c.srli       a4, 7
                  csrrs        a2, 0x340, zero
                  and          s5, s8, t4
                  c.mv         ra, a2
                  xor          t4, a2, t0
                  andi         s8, sp, -1369
                  slli         s4, t2, 30
                  c.addi4spn   s1, sp, 224
                  rem          sp, t3, a3
                  c.and        s1, a4
                  div          s5, t6, t0
                  or           tp, a4, s6
                  sltiu        s7, ra, 1297
                  c.addi       gp, 10
                  c.srai       a0, 8
                  xor          a2, tp, a0
                  csrrs        s11, 0x340, t6
                  or           s5, s4, s7
                  slt          s8, zero, a3
                  srli         s11, s10, 5
                  rem          tp, a3, zero
                  slli         a7, a0, 13
                  c.addi4spn   s1, sp, 400
                  csrrsi       ra, 0x340, 10
                  csrrwi       t6, 0x340, 8
                  xori         a4, a0, -169
                  slt          a5, s11, s1
                  srli         s3, s0, 28
                  sll          s7, s9, t2
                  addi         s0, t4, -1874
                  mul          t6, gp, s0
                  c.nop
                  csrrc        t6, 0x340, s9
                  lui          a7, 495936
                  sll          s2, t2, a3
                  xor          s0, t3, a7
                  c.addi4spn   s1, sp, 928
                  sltiu        s11, s9, -74
                  auipc        tp, 689879
                  c.andi       a5, 20
                  nop
                  mul          tp, a2, a2
                  c.add        s3, a2
                  mulhu        s11, a4, s9
                  c.slli       t5, 6
                  sra          s11, s4, s5
                  c.or         a5, a2
                  srli         t6, t6, 0
                  srai         zero, t3, 28
                  sltiu        a4, s0, 1605
                  mul          s2, s11, t4
                  c.andi       a0, -1
                  c.or         s1, a5
                  xori         t1, t2, 1614
                  csrrc        a5, 0x340, zero
                  remu         t5, a2, s6
                  c.mv         a4, tp
                  lui          a2, 331423
                  sll          a5, gp, tp
                  c.srli       a0, 9
                  mulh         zero, s4, s8
                  slli         s6, a2, 27
                  csrrwi       t6, 0x340, 14
                  lui          a0, 575548
                  c.or         s0, a1
                  ori          t4, ra, -15
                  c.srli       s1, 30
                  mulhsu       s3, a0, t2
                  c.srli       a0, 10
                  c.andi       a5, -1
                  mulhu        a4, t1, s9
                  rem          s10, s3, a0
                  c.nop
                  mulhu        t6, t6, s4
                  c.mv         a5, t4
                  c.andi       s1, 8
                  c.sub        a4, s1
                  csrrsi       sp, 0x340, 3
                  xor          t3, s2, a7
                  srli         zero, a0, 16
                  c.srai       a4, 24
                  c.li         s4, 28
                  c.or         a4, a4
                  sltu         a0, tp, a1
                  srai         tp, tp, 29
                  sub          a4, s9, s4
                  or           s9, a3, a6
                  or           s6, s7, t0
                  sub          a2, s7, s3
                  mulh         tp, a4, sp
                  c.or         s0, a4
                  mulhu        a2, s6, a0
                  c.or         s1, a1
                  rem          t0, a1, s1
                  c.nop
                  csrrci       s7, 0x340, 13
                  c.or         a4, a2
                  c.li         s0, -1
                  c.addi4spn   a2, sp, 32
                  csrrw        tp, 0x340, a3
                  mulh         s9, a3, s8
                  csrrsi       a2, 0x340, 0
                  c.add        s1, s2
                  auipc        a0, 806708
                  c.mv         s1, sp
                  c.li         a6, -1
                  mulh         s5, t4, zero
                  nop
                  lui          s3, 819007
                  rem          s3, a7, zero
                  csrrsi       sp, 0x340, 0
                  c.and        a5, a1
                  c.addi16sp   sp, -16
                  c.srli       a5, 23
                  andi         t4, s2, -1386
                  mulh         sp, s6, s4
                  srai         tp, a6, 15
                  csrrwi       s5, 0x340, 27
                  c.and        a5, a1
                  c.li         ra, -1
                  srl          s6, t3, a4
                  div          s0, a4, t6
                  srli         s6, t1, 11
                  slti         s10, s8, 749
                  csrrw        s6, 0x340, s1
                  remu         s8, a6, s9
                  lui          t4, 662914
                  c.add        a7, s2
                  or           a4, a0, a2
                  slti         a5, ra, 727
                  srli         s1, tp, 22
                  csrrwi       gp, 0x340, 5
                  lui          tp, 77542
                  c.or         a0, s1
                  andi         t0, a7, -167
                  c.andi       s0, 27
                  c.xor        a0, a4
                  c.xor        a5, s0
                  mulhsu       s4, zero, s4
                  c.slli       s8, 28
                  addi         s6, s3, -588
                  andi         zero, a6, 1358
                  c.sub        s0, s1
                  and          s10, s11, a3
                  or           s11, s8, a6
                  c.add        s9, s0
                  slli         s7, s5, 12
                  c.or         a2, a0
                  c.addi16sp   sp, -16
                  sltu         a7, a2, a0
                  slti         s5, a7, 84
                  remu         a6, s5, s8
                  sra          a7, sp, t6
                  srli         tp, sp, 29
                  slti         s10, s7, 1263
                  c.nop
                  add          a7, s6, a3
                  c.li         sp, 1
                  slti         tp, s0, 138
                  c.srai       a2, 18
                  c.xor        s0, s1
                  sltu         a4, ra, s4
                  divu         s9, a4, t1
                  srai         a7, a5, 24
                  c.slli       tp, 19
                  or           gp, s6, s5
                  c.srli       a4, 22
                  csrrwi       t6, 0x340, 2
                  csrrw        s4, 0x340, s2
                  csrrc        sp, 0x340, zero
                  c.addi16sp   sp, -16
                  c.mv         a0, a6
                  divu         t0, s9, a5
                  mul          zero, a2, a4
                  csrrci       t3, 0x340, 1
                  c.or         a4, s1
                  c.nop
                  csrrwi       a5, 0x340, 3
                  mul          s2, s9, t1
                  csrrwi       a4, 0x340, 22
                  srai         a4, gp, 8
                  nop
                  sll          t4, t3, a4
                  mulhsu       a7, s0, zero
                  divu         t5, s2, t2
                  mulhu        s5, s9, t0
                  csrrwi       a0, 0x340, 18
                  c.addi4spn   a5, sp, 896
                  csrrc        s4, 0x340, t6
                  csrrc        a6, 0x340, zero
                  auipc        zero, 324416
                  csrrwi       zero, 0x340, 12
                  rem          s2, s0, zero
                  auipc        a7, 983299
                  slli         t3, s11, 0
                  c.li         t6, 30
                  andi         s6, tp, 1009
                  slt          t1, s0, a4
                  c.addi16sp   sp, -16
                  c.srli       a5, 24
                  c.srli       s1, 14
                  sltiu        t6, a3, -1024
                  slti         a7, a6, 60
                  csrrwi       a6, 0x340, 8
                  csrrs        s6, 0x340, zero
                  div          s7, gp, s0
                  srl          sp, s3, t3
                  lui          s6, 764885
                  c.nop
                  csrrs        a2, 0x340, zero
                  andi         s10, a1, 401
                  sltu         s9, a4, a0
                  c.srli       a2, 30
                  c.addi4spn   a4, sp, 288
                  remu         t6, s9, s6
                  c.srai       s0, 2
                  addi         a4, t3, 1811
                  c.and        a5, s0
                  srai         s2, a5, 6
                  c.and        s0, a0
                  mulhsu       s6, t5, ra
                  srai         t4, s4, 5
                  xori         ra, s8, 1082
                  mulhsu       t1, sp, s2
                  c.li         s3, 17
                  c.andi       s1, -1
                  mulh         s11, s2, s4
                  srli         a5, s4, 10
                  divu         s5, t5, s0
                  divu         tp, t4, s2
                  divu         a7, tp, a5
                  csrrw        s3, 0x340, s8
                  divu         s4, s2, t5
                  c.and        a2, a1
                  slt          sp, s0, t3
                  lui          t4, 895792
                  andi         s10, t4, 624
                  c.or         s1, a3
                  c.mv         a6, s9
                  c.srai       s1, 25
                  csrrs        zero, 0x340, zero
                  srai         t5, a7, 6
                  sll          a0, s10, s5
                  xori         a5, a1, -1937
                  sll          s9, a6, t3
                  ori          a0, sp, 1761
                  c.addi16sp   sp, -16
                  c.addi       s0, -1
                  or           s11, tp, t0
                  ori          s0, a4, 1993
                  mulhu        tp, t5, a6
                  sra          ra, s8, s8
                  csrrw        s5, 0x340, s4
                  srai         ra, gp, 16
                  c.or         a4, a0
                  sll          s10, a6, s5
                  xori         s5, sp, -83
                  and          s2, a2, s4
                  sub          s10, zero, t5
                  mulhsu       t5, t6, t3
                  xori         s5, t6, 1805
                  sltiu        tp, s11, 1775
                  sltu         zero, s3, s1
                  lui          s2, 346793
                  c.li         t1, -1
                  srl          a0, s0, a2
                  c.slli       s4, 3
                  c.add        s7, s3
                  slli         a7, s9, 4
                  mulhu        s2, a7, ra
                  rem          tp, gp, s1
                  c.sub        s1, a1
                  c.xor        a5, a0
                  and          a0, t5, sp
                  csrrc        a0, 0x340, zero
                  srl          a2, t3, s8
                  c.srli       a0, 2
                  csrrc        a7, 0x340, t2
                  csrrsi       s3, 0x340, 0
                  csrrs        s11, 0x340, a5
                  csrrw        s9, 0x340, t4
                  addi         s6, a0, -754
                  c.addi4spn   a0, sp, 832
                  srai         tp, s11, 10
                  csrrw        ra, 0x340, s4
                  mulhu        ra, s6, t0
                  divu         t5, zero, a3
                  c.addi       s7, -1
                  div          s0, sp, s8
                  c.srai       a4, 31
                  mulhsu       a7, a2, a5
                  or           s2, a2, t0
                  srli         s11, a5, 30
                  mulhu        s0, a7, a2
                  or           s9, s7, a2
                  or           tp, s3, s2
                  c.srli       a2, 25
                  and          sp, s1, gp
                  add          ra, s4, s2
                  c.srli       s1, 19
                  rem          s5, t0, s10
                  csrrs        t3, 0x340, s3
                  or           s8, s0, a0
                  auipc        s10, 212111
                  csrrwi       s2, 0x340, 30
                  c.lui        s4, 3
                  csrrci       a0, 0x340, 15
                  srl          ra, zero, sp
                  csrrci       ra, 0x340, 0
                  csrrwi       t0, 0x340, 16
                  c.srai       s1, 18
                  add          s10, s2, t1
                  nop
                  csrrwi       t5, 0x340, 29
                  slti         a7, s1, 1865
                  rem          tp, t3, gp
                  xori         s8, tp, 277
                  c.add        t6, a0
                  sra          s4, zero, sp
                  c.addi4spn   s1, sp, 800
                  c.li         s5, 5
                  lui          s1, 496236
                  mul          a5, s10, s8
                  nop
                  xori         s7, a1, 154
                  c.srli       a2, 29
                  c.add        a4, t3
                  c.mv         a2, a7
                  mul          s11, s9, s5
                  andi         zero, s4, -532
                  srl          a2, s9, ra
                  sub          a2, t1, a7
                  sll          a7, s6, s6
                  sltu         t5, t5, t5
                  ori          s0, a5, -842
                  c.addi       t1, 13
                  sub          s2, a6, s1
                  mulh         s0, s1, t3
                  div          a4, s11, t3
                  xori         s8, s9, 1748
                  add          t5, sp, gp
                  csrrsi       s8, 0x340, 0
                  rem          s5, s11, s5
                  c.addi16sp   sp, 192
                  mulhu        ra, a0, s8
                  c.and        a2, a5
                  auipc        s7, 706420
                  c.nop
                  slti         gp, tp, 1721
                  c.mv         tp, a0
                  c.nop
                  srai         s5, s1, 21
                  slti         t6, a7, 1927
                  csrrc        gp, 0x340, sp
                  c.add        t1, a1
                  mulhsu       ra, a2, t6
                  addi         a5, t0, 425
                  csrrsi       s8, 0x340, 0
                  add          a5, s5, s1
                  csrrsi       t5, 0x340, 0
                  sub          tp, t5, s2
                  mulh         ra, a6, t3
                  mulh         t4, s10, a4
                  addi         t6, tp, 1004
                  sub          s2, t5, s2
                  csrrci       t4, 0x340, 0
                  sll          s9, s9, t3
                  divu         gp, t1, s11
                  c.xor        a4, s1
                  c.li         s4, 19
                  c.addi16sp   sp, -16
                  sra          a2, t0, sp
                  c.add        a7, t0
                  add          a7, s7, a4
                  c.mv         t4, t5
                  div          s2, tp, t0
                  srai         a0, t6, 10
                  div          t5, s10, s4
                  c.addi16sp   sp, 192
                  c.srai       a4, 17
                  csrrsi       s4, 0x340, 0
                  mulhu        s0, tp, t6
                  csrrc        a7, 0x340, gp
                  sub          s1, s0, ra
                  csrrw        s0, 0x340, a5
                  mulhsu       t4, a0, a7
                  mulhsu       a7, a1, s7
                  nop
                  sub          s9, a7, ra
                  sra          s7, a7, t0
                  remu         s10, a0, t6
                  srai         s9, t4, 28
                  c.and        a5, a3
                  mulhu        gp, s2, s10
                  add          t0, tp, s10
                  andi         a2, t0, 481
                  srai         t6, t4, 16
                  andi         a7, a3, -301
                  c.add        sp, a6
                  add          a6, a5, a1
                  c.srli       a4, 3
                  lui          a7, 65985
                  andi         t5, a6, -38
                  andi         tp, a0, 537
                  slti         s7, t3, 1275
                  mulhu        zero, s3, a2
                  csrrw        a6, 0x340, s9
                  c.addi       s3, 24
                  lui          a7, 802954
                  mulhu        sp, a4, t5
                  srli         a4, a7, 1
                  c.nop
                  srli         ra, s4, 30
                  div          t4, t0, a7
                  csrrci       s11, 0x340, 0
                  sub          tp, sp, t5
                  mulhu        s2, t2, s10
                  c.mv         s7, t2
                  lui          tp, 762219
                  remu         a7, a0, a3
                  srai         s1, s5, 7
                  nop
                  csrrw        t5, 0x340, t0
                  xori         s0, s11, -1446
                  remu         a6, ra, a5
                  c.add        s11, s7
                  c.srai       a0, 8
                  divu         a6, s9, a5
                  slti         ra, t0, -1443
                  add          t1, t3, zero
                  div          a5, a7, s3
                  c.or         s1, s1
                  sltiu        a5, t4, 315
                  mulhsu       s9, s4, t6
                  c.or         a2, a3
                  sra          s3, s6, t4
                  sra          t3, s5, a7
                  c.or         a4, a4
                  c.sub        a0, a5
                  c.sub        a5, a3
                  andi         gp, a2, 1368
                  mulhsu       a0, t5, s7
                  lui          t1, 978091
                  c.nop
                  slti         a6, sp, 433
                  lui          a2, 792895
                  div          s5, a4, s9
                  c.add        s4, s2
                  c.srli       a2, 9
                  ori          s11, s2, -1861
                  slt          s10, tp, s8
                  auipc        t6, 595261
                  sra          s7, t1, s7
                  ori          zero, s2, 69
                  slli         t0, t0, 0
                  add          a6, s5, s1
                  csrrwi       s9, 0x340, 28
                  divu         a0, s11, t0
                  csrrs        s0, 0x340, t4
                  lui          s11, 644688
                  csrrc        a6, 0x340, t1
                  c.addi4spn   s0, sp, 576
                  remu         t1, a7, t4
                  addi         ra, sp, -1283
                  csrrw        a2, 0x340, s9
                  c.addi       gp, 25
                  csrrci       s10, 0x340, 10
                  csrrci       gp, 0x340, 0
                  xor          ra, s8, ra
                  slti         a4, t4, 934
                  c.mv         s10, t6
                  c.andi       a0, -1
                  sub          s7, s8, gp
                  c.addi16sp   sp, -16
                  nop
                  srli         a7, s1, 22
                  xori         s3, t3, 1452
                  sltu         s0, a2, t0
                  c.andi       a0, -1
                  and          t5, t5, a1
                  mul          a5, t2, a2
                  xor          s5, a7, a6
                  c.addi       s3, 6
                  divu         t0, s0, a0
                  c.addi16sp   sp, 416
                  nop
                  sltiu        s7, s0, 1226
                  srai         t6, s10, 25
                  xori         tp, t3, 851
                  div          a4, t2, t1
                  c.slli       s6, 15
                  xori         s4, tp, -1385
                  lui          a2, 21524
                  mulhsu       a5, a4, a6
                  rem          a0, gp, a3
                  remu         s5, a0, tp
                  sltu         s4, s5, s6
                  srli         s9, tp, 10
                  c.and        a2, a4
                  and          s0, s1, s0
                  divu         s4, s10, a1
                  add          t3, s2, zero
                  sra          sp, s10, s10
                  addi         gp, s7, -1881
                  srai         sp, a7, 19
                  srai         ra, s6, 21
                  sltu         t3, s11, s3
                  c.slli       s4, 23
                  csrrwi       t4, 0x340, 31
                  c.sub        a0, a4
                  c.nop
                  c.slli       s11, 22
                  c.addi       tp, 20
                  addi         t6, t1, -1798
                  c.sub        a0, s1
                  div          a6, s7, s8
                  c.mv         ra, t2
                  rem          gp, s9, gp
                  or           s8, t5, s6
                  slti         s9, t3, -1804
                  mulh         t4, s9, a5
                  csrrsi       t6, 0x340, 11
                  divu         s6, t4, gp
                  c.addi       a0, 24
                  c.addi16sp   sp, 368
                  c.li         a6, -1
                  mulh         t4, t0, s3
                  csrrs        s9, 0x340, zero
                  div          zero, s11, s10
                  auipc        t3, 1040129
                  c.lui        s9, 31
                  sll          s7, t4, t1
                  srli         a6, a2, 3
                  mul          s4, zero, s1
                  or           a5, sp, t6
                  and          gp, t4, t4
                  csrrci       s1, 0x340, 28
                  c.andi       s1, -1
                  c.xor        a0, a4
                  or           t4, ra, a7
                  mulh         s7, t3, t2
                  mulhu        s0, s0, a2
                  slt          a7, s7, s0
                  sll          s5, s10, t1
                  rem          a7, s9, s3
                  c.addi4spn   s0, sp, 688
                  c.add        ra, s0
                  srl          t6, s1, s0
                  ori          s4, a6, 1044
                  slti         t1, a1, 461
                  xor          a6, s11, s3
                  csrrs        a6, 0x340, s7
                  and          s5, s6, s2
                  c.andi       a0, 15
                  slt          a4, s8, s8
                  mulhu        s2, sp, tp
                  slli         s2, s2, 10
                  and          zero, a1, t1
                  div          s0, a5, a6
                  auipc        t0, 746834
                  c.andi       s0, 10
                  c.srli       a4, 12
                  c.add        s8, a5
                  andi         ra, t2, 130
                  c.addi16sp   sp, 32
                  c.li         s4, 22
                  addi         ra, a7, -1869
                  c.xor        a4, a1
                  auipc        zero, 577258
                  c.add        s0, s3
                  rem          s6, s4, t1
                  csrrc        s8, 0x340, zero
                  mulhsu       a6, s4, a4
                  andi         s2, a0, 1639
                  add          s11, t3, s4
                  c.addi       s6, -1
                  c.sub        s0, a4
                  add          a6, zero, a2
                  c.addi       a5, 30
                  xori         sp, a4, 2023
                  addi         s10, s8, 1626
                  lui          tp, 239580
                  c.andi       a0, 20
                  csrrci       s8, 0x340, 4
                  c.and        s0, a1
                  slt          t6, a0, a6
                  srai         a0, s1, 8
                  divu         s9, s6, a1
                  sltiu        t4, t5, 1324
                  c.addi4spn   a4, sp, 432
                  remu         ra, t4, s1
                  csrrwi       t5, 0x340, 26
                  ori          ra, gp, -941
                  add          a2, a7, t4
                  csrrsi       t0, 0x340, 6
                  c.srli       a0, 24
                  c.xor        a0, a2
                  auipc        s6, 648791
                  sltu         t0, a3, a1
                  c.andi       a5, 25
                  sra          sp, t4, t4
                  xor          a4, a7, a7
                  c.slli       a6, 16
                  c.nop
                  c.add        t0, sp
                  slti         s4, tp, 1393
                  ori          t0, s11, 1581
                  auipc        t6, 991791
                  lui          gp, 170194
                  c.addi       a6, -1
                  c.mv         a5, s8
                  c.xor        a4, a3
                  slti         sp, a7, -389
                  c.add        tp, s0
                  csrrs        t1, 0x340, a6
                  sra          s1, s1, s6
                  csrrsi       a4, 0x340, 0
                  ori          t0, a2, -649
                  rem          s8, t2, t4
                  c.mv         tp, s4
                  sra          s4, sp, s9
                  and          t3, t5, s4
                  sltu         t4, a1, s2
                  c.add        a5, s2
                  mulhu        a5, s6, t0
                  sub          a7, s6, t4
                  sltiu        sp, t3, 1095
                  c.or         a2, s1
                  csrrci       s9, 0x340, 6
                  c.srai       a5, 10
                  c.srai       a0, 9
                  c.lui        a2, 25
                  remu         s8, s8, s5
                  c.li         a7, 16
                  c.addi       a4, -1
                  c.or         a4, s1
                  add          a5, t4, a4
                  xor          t0, a4, a3
                  csrrw        t1, 0x340, zero
                  csrrwi       a4, 0x340, 11
                  sra          gp, s8, gp
                  c.srai       s1, 7
                  srai         ra, tp, 17
                  csrrs        s9, 0x340, s9
                  auipc        sp, 803445
                  divu         s7, a6, a4
                  csrrw        sp, 0x340, sp
                  sltu         s8, a4, tp
                  rem          t3, t2, gp
                  add          t0, gp, tp
                  xor          s6, t0, s10
                  andi         zero, s2, 522
                  c.li         s11, 31
                  c.andi       s1, -1
                  csrrwi       s10, 0x340, 31
                  lui          t3, 171063
                  remu         a5, s9, s6
                  csrrs        s4, 0x340, t4
                  xor          s7, s2, s6
                  c.sub        a2, a4
                  andi         t6, a5, -1104
                  c.addi       s1, 9
                  lui          s9, 9031
                  csrrw        s8, 0x340, s4
                  csrrci       sp, 0x340, 0
                  mul          a0, s3, s9
                  csrrw        zero, 0x340, sp
                  c.srli       s1, 26
                  c.sub        a4, a4
                  sll          t1, tp, gp
                  c.srli       s0, 21
                  ori          t6, t2, 269
                  and          zero, s6, a2
                  rem          s6, t5, t2
                  mul          s0, s10, gp
                  sll          s4, s0, s10
                  csrrci       a6, 0x340, 0
                  slt          s1, gp, s8
                  c.mv         a5, ra
                  sltu         s2, t1, s4
                  csrrwi       a7, 0x340, 2
                  c.addi       s10, 14
                  sltiu        a7, a6, 1914
                  lui          sp, 744244
                  mulhsu       t5, ra, s6
                  sub          t0, s2, sp
                  c.srli       a0, 9
                  c.addi       sp, -1
                  slti         sp, s2, -1903
                  srl          s0, s1, a5
                  c.or         a4, a4
                  c.lui        s4, 13
                  c.nop
                  c.mv         s8, s8
                  xor          t0, tp, ra
                  xori         t1, s5, -1023
                  slt          sp, t5, s2
                  addi         s9, s3, -475
                  csrrwi       s8, 0x340, 11
                  xori         s3, t1, 453
                  c.addi4spn   a5, sp, 416
                  c.add        tp, s8
                  c.addi       t1, -1
                  mulhsu       s8, a7, a0
                  c.addi       tp, 21
                  sltiu        s5, a4, -19
                  mulhsu       s3, s1, s9
                  or           t0, t4, a3
                  xori         s10, a5, 1063
                  sra          s5, t4, t5
                  csrrsi       s9, 0x340, 31
                  c.andi       a5, -1
                  c.sub        a2, a1
                  mulhu        s5, t4, a5
                  csrrci       ra, 0x340, 31
                  c.andi       a4, -1
                  rem          s5, t4, zero
                  mulhu        tp, s4, t5
                  c.add        s8, t4
                  slli         gp, a6, 8
                  sltiu        s1, a6, 1920
                  add          t0, sp, s10
                  sra          s2, gp, a4
                  srl          s9, t2, a5
                  csrrsi       s2, 0x340, 18
                  c.xor        s1, a0
                  xor          s4, s11, a5
                  csrrsi       s9, 0x340, 0
                  or           s1, s10, a0
                  and          t4, t3, a0
                  auipc        t3, 869919
                  csrrw        t5, 0x340, s11
                  srai         s10, a4, 3
                  c.andi       a5, -1
                  mulh         t1, a4, t2
                  mulhu        s11, a1, a6
                  and          s3, a5, s9
                  c.nop
                  xori         s7, sp, 1494
                  xori         s1, s8, 416
                  srli         t3, sp, 28
                  xor          t3, t6, t5
                  mulhsu       t6, a6, t0
                  rem          s5, a6, s9
                  remu         s4, t1, a1
                  csrrw        t4, 0x340, t4
                  addi         t3, s4, -333
                  divu         a5, t6, t3
                  slt          gp, t0, a2
                  addi         tp, s0, 1988
                  csrrwi       s6, 0x340, 22
                  remu         t4, a5, a2
                  c.sub        s1, a4
                  c.slli       s3, 3
                  slt          s5, s6, s10
                  csrrwi       gp, 0x340, 7
                  c.li         s7, 5
                  sltu         t3, s0, s3
                  sub          gp, s10, a2
                  auipc        a4, 869827
                  xori         ra, a5, 1984
                  c.addi       a2, -1
                  remu         s10, s3, zero
                  slti         s2, s11, -1840
                  c.add        t4, s1
                  slli         zero, gp, 26
                  c.nop
                  mulhsu       t0, a5, a5
                  xori         sp, t5, -1930
                  c.mv         t3, s5
                  addi         s5, s11, -1587
                  sltu         a0, zero, a2
                  c.lui        a5, 16
                  c.sub        a2, s0
                  and          s7, t1, s5
                  sra          a6, a6, t3
                  remu         s5, tp, s1
                  andi         zero, a6, 1559
                  c.addi4spn   a5, sp, 208
                  srl          sp, s9, a0
                  csrrci       s3, 0x340, 14
                  c.addi4spn   s1, sp, 1008
                  c.mv         t3, a1
                  c.li         s10, -1
                  divu         a2, tp, gp
                  remu         s9, gp, s4
                  remu         s3, s11, t5
                  divu         zero, a7, s8
                  srli         gp, s10, 24
                  slli         ra, t1, 15
                  slli         t6, tp, 23
                  c.sub        a5, a5
                  addi         ra, s6, -36
                  addi         s10, t0, 1029
                  andi         s9, t2, 356
                  csrrs        gp, 0x340, zero
                  xor          gp, ra, s4
                  sltu         s7, s10, t4
                  c.sub        a4, a1
                  slli         a4, t4, 20
                  nop
                  srli         s7, zero, 21
                  or           s2, t5, tp
                  rem          zero, s11, s11
                  c.lui        s6, 25
                  xor          s4, sp, s8
                  xor          s8, a1, s7
                  c.xor        a5, a3
                  c.li         t1, -1
                  slt          a7, s7, t1
                  c.addi       t0, -1
                  auipc        a6, 688424
                  sub          t4, t4, a3
                  c.and        a0, a3
                  mulh         zero, s4, s7
                  or           t1, gp, s6
                  c.addi       t4, 10
                  csrrci       a7, 0x340, 31
                  c.addi4spn   a4, sp, 272
                  c.addi       t4, 5
                  csrrci       s10, 0x340, 0
                  c.addi       a2, 21
                  c.andi       s1, 26
                  mul          t1, s5, s1
                  csrrwi       sp, 0x340, 1
                  c.mv         t5, s1
                  divu         s2, s9, a2
                  auipc        s6, 552537
                  or           t0, s0, s7
                  c.sub        a4, a1
                  srl          gp, a0, t4
                  c.addi4spn   s0, sp, 896
                  auipc        s6, 591802
                  c.lui        a6, 20
                  c.srli       s1, 23
                  lui          a2, 462480
                  slt          tp, t2, t6
                  csrrs        t4, 0x340, zero
                  mulhsu       s4, t1, sp
                  addi         ra, tp, -1309
                  c.sub        s1, s1
                  c.addi4spn   s0, sp, 272
                  c.add        a6, sp
                  add          s9, s11, s0
                  c.andi       s0, 21
                  sltu         t5, t1, t5
                  c.slli       sp, 25
                  srli         t1, a1, 28
                  xori         s4, t1, 1219
                  srli         s8, a7, 28
                  slli         tp, a3, 10
                  slli         a0, a3, 28
                  div          s3, t2, a5
                  srli         a4, s4, 27
                  mul          s3, a6, s0
                  c.xor        a5, a2
                  slti         s11, a1, -1660
                  slt          sp, t5, t3
                  c.slli       t4, 7
                  c.addi       gp, -1
                  srai         a5, gp, 28
                  and          s7, tp, s11
                  srl          s10, t3, t5
                  divu         s11, a1, a7
                  c.andi       a5, 15
                  c.nop
                  and          a2, a5, s9
                  slti         s7, a5, -1225
                  mulh         s7, a2, gp
                  c.lui        s5, 9
                  csrrs        t1, 0x340, zero
                  andi         a6, t3, 360
                  mulhu        s11, a4, s1
                  csrrci       t1, 0x340, 0
                  c.li         s1, 23
                  c.nop
                  csrrci       t3, 0x340, 22
                  srai         s10, t5, 11
                  mulh         t6, t3, a1
                  rem          s1, s9, t4
                  mul          s1, a7, s6
                  csrrsi       s9, 0x340, 23
                  srai         t4, a2, 10
                  c.and        a0, a4
                  lui          gp, 805262
                  c.nop
                  csrrsi       a5, 0x340, 0
                  c.sub        a2, a5
                  csrrs        s7, 0x340, zero
                  or           t4, a4, tp
                  c.slli       s4, 31
                  mul          s7, s5, gp
                  divu         s4, a7, s1
                  addi         s9, t2, 263
                  nop
                  c.add        s11, s0
                  xor          s3, a4, s11
                  csrrc        t4, 0x340, zero
                  c.slli       s6, 9
                  c.add        sp, s4
                  c.and        a0, a2
                  csrrc        a7, 0x340, zero
                  csrrs        a5, 0x340, t0
                  srli         a0, a0, 1
                  c.and        s1, s0
                  ori          t6, s11, 1087
                  csrrw        t6, 0x340, s4
                  c.mv         s0, sp
                  sub          s5, a1, a5
                  c.and        a4, a0
                  slti         a0, s2, 609
                  c.addi16sp   sp, 368
                  and          s5, t3, s10
                  c.lui        tp, 29
                  srai         s1, zero, 30
                  c.and        s0, a3
                  csrrsi       a2, 0x340, 0
                  c.slli       s6, 29
                  c.mv         sp, gp
                  srli         s2, s8, 17
                  slt          gp, t6, s4
                  xor          zero, sp, t2
                  c.srli       a2, 28
                  c.mv         sp, s6
                  c.addi16sp   sp, 304
                  or           s5, t1, t6
                  mul          s10, zero, t1
                  c.addi4spn   s1, sp, 656
                  sltu         s4, t2, s7
                  c.andi       s0, 30
                  sra          a5, t3, s7
                  and          t0, tp, t3
                  srli         s8, s2, 3
                  srai         a2, s5, 27
                  c.mv         t4, s8
                  srli         s7, t4, 26
                  c.xor        a4, a2
                  xor          s6, a5, s4
                  add          zero, a5, ra
                  auipc        ra, 756608
                  divu         s9, sp, t1
                  andi         s2, a1, 785
                  srli         ra, t3, 0
                  lui          a2, 884902
                  rem          zero, t1, sp
                  csrrs        a7, 0x340, zero
                  c.addi       s7, -1
                  or           a6, s4, t4
                  andi         s11, a6, -1792
                  or           s0, a7, a5
                  mulh         s10, a1, s2
                  csrrci       s7, 0x340, 4
                  sll          t0, s3, s8
                  and          s10, a6, s10
                  sub          ra, a5, a2
                  csrrci       ra, 0x340, 16
                  auipc        s6, 1030022
                  mul          a2, a3, ra
                  c.xor        s1, a5
                  c.nop
                  ori          s5, a4, 403
                  csrrci       s9, 0x340, 0
                  mulhu        s10, s1, s3
                  c.mv         s4, t4
                  c.nop
                  srai         s4, a2, 5
                  c.xor        a4, s1
                  add          s7, s0, s10
                  c.andi       s0, -1
                  c.or         a5, a1
                  c.srli       s1, 1
                  c.addi       s0, -1
                  mulhsu       gp, t2, s0
                  sltiu        t5, t1, 966
                  sltiu        t6, s4, -315
                  mulhu        t5, a5, t4
                  c.mv         s3, a4
                  c.add        s5, sp
                  slti         a7, s5, 893
                  c.addi16sp   sp, -16
                  c.lui        a5, 29
                  xori         s6, a6, 1106
                  csrrwi       s7, 0x340, 28
                  c.andi       s1, 13
                  c.mv         gp, s6
                  div          t4, s9, a3
                  csrrci       s9, 0x340, 0
                  or           s0, sp, s4
                  and          s11, a4, a6
                  c.lui        s9, 13
                  c.slli       s11, 20
                  mulh         s10, a1, s9
                  divu         tp, a7, s3
                  c.and        a2, a2
                  c.addi16sp   sp, 448
                  sltu         a0, s0, t2
                  ori          t4, s6, -124
                  c.andi       s0, 17
                  slli         ra, s1, 17
                  slli         s5, sp, 4
                  remu         t5, t6, sp
                  sub          a2, a4, a7
                  srli         s7, gp, 14
                  c.or         a2, s1
                  srli         t3, t1, 6
                  rem          t0, a6, t1
                  csrrci       s7, 0x340, 0
                  c.or         a0, a2
                  c.and        s0, s1
                  xor          s10, t0, s4
                  csrrci       s5, 0x340, 0
                  c.sub        a4, s0
                  nop
                  csrrs        s7, 0x340, s3
                  srl          t6, s7, t0
                  c.srai       s1, 2
                  c.xor        a0, a5
                  c.add        s7, s8
                  c.addi4spn   a0, sp, 1008
                  csrrc        s5, 0x340, s5
                  mulhsu       gp, a4, ra
                  sub          a7, s5, a4
                  and          s8, ra, s1
                  nop
                  csrrc        t0, 0x340, zero
                  c.mv         s3, s7
                  auipc        gp, 629716
                  mulhu        s5, sp, s7
                  mulhu        s5, t2, t1
                  sltu         s3, t5, t0
                  or           s4, s5, s9
                  nop
                  slti         s5, a0, -463
                  slli         s1, t1, 21
                  c.nop
                  srli         s5, s3, 7
                  sltiu        t1, a4, -1770
                  divu         s9, s6, gp
                  add          sp, sp, s1
                  c.srai       a2, 26
                  c.srli       a5, 7
                  or           s10, s9, s10
                  c.mv         a2, a4
                  or           a6, t6, t5
                  c.sub        a5, s1
                  srai         s8, a2, 26
                  c.li         a5, 10
                  divu         a0, a3, a6
                  c.andi       a0, 0
                  sltiu        s3, s2, 1832
                  add          s6, a6, s2
                  c.mv         tp, tp
                  csrrsi       ra, 0x340, 25
                  rem          s3, a6, a3
                  sltiu        s9, t6, -184
                  csrrs        s0, 0x340, t0
                  c.addi16sp   sp, -16
                  ori          a0, t6, -1430
                  c.srai       a4, 21
                  xor          t4, s0, s7
                  rem          s2, s2, t6
                  auipc        gp, 314875
                  c.srai       s1, 27
                  c.nop
                  mulh         a7, s10, a1
                  c.and        s0, a4
                  ori          t4, t2, 508
                  c.slli       a5, 24
                  c.sub        s0, a2
                  csrrs        s1, 0x340, gp
                  or           s6, a4, sp
                  c.sub        s0, a2
                  csrrwi       s6, 0x340, 4
                  ori          s5, a4, -781
                  srli         s4, s9, 13
                  c.srli       a0, 12
                  c.and        s1, a0
                  c.mv         a6, s10
                  srl          zero, zero, t3
                  c.or         a5, a0
                  mul          tp, a4, t5
                  or           s7, a2, t0
                  c.add        t3, a4
                  nop
                  c.srai       a5, 9
                  slli         s2, a6, 17
                  c.slli       s6, 21
                  srli         t5, s4, 26
                  div          s8, a2, s2
                  mulhu        sp, s11, s4
                  c.srli       a4, 10
                  divu         s2, s11, a5
                  mulhu        s9, tp, s4
                  csrrci       t0, 0x340, 14
                  add          a7, ra, t1
                  csrrwi       s8, 0x340, 6
                  csrrw        s5, 0x340, s0
                  ori          a6, s10, -1291
                  slli         t3, tp, 15
                  add          s4, a5, a4
                  slt          s11, t5, a0
                  and          a6, t5, a7
                  div          tp, s5, zero
                  and          s7, a6, t5
                  c.srli       s1, 30
                  sll          t1, ra, ra
                  mulhsu       s7, gp, a3
                  sltiu        a6, a2, -1263
                  csrrsi       a2, 0x340, 0
                  slt          a2, a7, zero
                  slti         a5, a0, 1632
                  c.addi       t3, 18
                  c.slli       t1, 9
                  c.nop
                  sra          s8, t0, s11
                  sub          s11, tp, t3
                  csrrs        sp, 0x340, zero
                  c.srli       a2, 29
                  c.addi16sp   sp, -16
                  c.sub        a0, a1
                  mul          t0, s7, s2
                  c.li         t6, -1
                  c.sub        a2, a1
                  or           zero, t4, s8
                  slt          s5, a7, t0
                  c.slli       s2, 11
                  div          a5, s1, t4
                  or           s3, s4, a4
                  div          gp, s9, tp
                  sltiu        ra, s2, -196
                  c.nop
                  csrrs        s11, 0x340, t6
                  c.lui        s8, 16
                  c.addi16sp   sp, -16
                  c.sub        s0, s0
                  c.xor        s1, s1
                  div          sp, a7, s0
                  c.sub        s1, a4
                  c.nop
                  mul          zero, s1, s2
                  c.andi       s1, 30
                  or           s8, s3, t6
                  c.mv         s0, a7
                  xor          t4, a0, t6
                  c.addi16sp   sp, 48
                  c.andi       a5, 9
                  sll          t4, t4, s6
                  divu         s3, tp, s4
                  c.xor        a4, a1
                  c.addi16sp   sp, -16
                  csrrc        s4, 0x340, zero
                  c.nop
                  auipc        s11, 753377
                  c.li         ra, -1
                  csrrc        s1, 0x340, zero
                  sltiu        ra, a6, 1296
                  csrrci       a4, 0x340, 0
                  c.or         a4, a4
                  remu         s3, tp, a1
                  sltu         s5, a5, s8
                  sll          t4, s3, s11
                  or           s4, s8, a6
                  csrrci       s2, 0x340, 0
                  addi         t5, s4, -350
                  c.andi       s0, -1
                  csrrsi       ra, 0x340, 4
                  c.or         s1, a2
                  lui          t0, 972645
                  c.mv         a4, a2
                  auipc        s3, 998245
                  srl          t6, a7, s1
                  csrrc        a7, 0x340, zero
                  c.li         s4, -1
                  c.or         a5, a3
                  slt          ra, zero, s10
                  xor          s7, t0, a0
                  c.addi       s3, -1
                  csrrsi       a0, 0x340, 0
                  addi         t4, a4, 1315
                  xor          a0, s5, a7
                  csrrwi       zero, 0x340, 28
                  sub          s7, s9, t5
                  c.or         s1, a3
                  c.slli       t0, 30
                  mulhu        s11, s10, s0
                  c.mv         a4, s2
                  add          s2, s2, t3
                  c.srai       a4, 27
                  sra          t6, t6, s6
                  remu         s11, t0, zero
                  mulhu        s10, s2, a0
                  rem          t4, a5, t2
                  c.srai       a2, 19
                  ori          a7, s1, -1330
                  mulhu        sp, tp, s8
                  addi         s2, t0, 1140
                  csrrw        zero, 0x340, a4
                  sltiu        zero, ra, 1781
                  mulh         a4, a0, a6
                  c.xor        s0, a3
                  c.or         s1, a0
                  c.nop
                  csrrci       ra, 0x340, 17
                  xor          a6, a1, s9
                  csrrw        a4, 0x340, a7
                  slti         s9, s11, -1391
                  csrrci       s11, 0x340, 2
                  lui          s11, 294732
                  nop
                  srai         a6, s7, 27
                  c.addi       tp, -1
                  c.or         a2, a4
                  c.andi       a5, -1
                  mulhu        tp, ra, s4
                  add          s1, sp, a2
                  sll          a5, sp, s5
                  rem          t3, s1, s8
                  sll          s10, ra, t5
                  srli         s4, t6, 5
                  mul          zero, t3, s0
                  srai         tp, a3, 24
                  csrrci       tp, 0x340, 0
                  c.or         a0, a1
                  c.xor        s0, a2
                  sra          t3, zero, t2
                  c.slli       a0, 13
                  c.addi16sp   sp, 48
                  remu         a4, s7, s0
                  c.addi16sp   sp, -16
                  remu         s3, s11, ra
                  addi         zero, s5, -941
                  addi         t4, s10, -241
                  div          a6, ra, s1
                  sltu         s9, a7, s10
                  slti         a4, a2, 1950
                  ori          s2, s6, -570
                  srl          t1, s1, a3
                  c.andi       a0, 10
                  slli         sp, s6, 11
                  c.srai       s1, 25
                  c.srli       a2, 10
                  add          a7, s1, a7
                  mulh         sp, s3, t6
                  auipc        t0, 290419
                  csrrc        t0, 0x340, zero
                  divu         s5, s4, t3
                  c.addi16sp   sp, 80
                  slli         ra, t3, 5
                  sub          t5, a1, s0
                  c.or         a0, a2
                  andi         a2, a2, 520
                  slt          s9, s3, zero
                  srl          t6, a4, t5
                  div          s2, t0, ra
                  xor          s0, s2, a0
                  c.addi       t1, 23
                  mulhsu       s1, t6, s1
                  sub          s2, tp, s11
                  sll          ra, t6, s11
                  c.srai       a0, 5
                  c.mv         s2, s0
                  sll          ra, ra, t0
                  divu         a0, s7, t5
                  mul          s10, a5, a3
                  c.srai       a4, 16
                  mulhsu       a7, s5, a0
                  addi         s2, s2, -1765
                  srl          s10, t0, a1
                  csrrc        t4, 0x340, zero
                  csrrci       a4, 0x340, 22
                  mulhu        s4, a1, tp
                  c.addi4spn   a4, sp, 960
                  sub          a5, gp, s8
                  divu         s2, t1, a6
                  sll          t6, s1, a0
                  mulhu        a0, a7, t6
                  csrrci       s1, 0x340, 23
                  srl          s6, t3, a6
                  csrrc        s5, 0x340, s1
                  c.slli       a0, 31
                  csrrw        s3, 0x340, a5
                  c.and        a4, a2
                  sltu         s9, a6, s3
                  mul          a7, a4, sp
                  auipc        t1, 370976
                  remu         a6, zero, tp
                  slt          t4, a1, t3
                  auipc        t1, 273396
                  and          sp, t0, a0
                  divu         t6, t1, gp
                  mulhu        t3, a1, tp
                  xori         a5, t6, -1431
                  c.addi       s7, -1
                  c.srai       a2, 17
                  csrrc        s6, 0x340, zero
                  mulhu        s1, s3, s4
                  auipc        s0, 613457
                  csrrs        s0, 0x340, a5
                  c.addi16sp   sp, -16
                  sltu         a6, s1, a5
                  lui          a0, 495986
                  auipc        s3, 276805
                  srl          s0, s7, a7
                  c.addi       t5, -1
                  auipc        tp, 667036
                  c.addi       t0, -1
                  c.xor        a0, a1
                  auipc        s10, 813338
                  mulhsu       t1, zero, t6
                  xor          s6, zero, sp
                  csrrw        s2, 0x340, s4
                  remu         gp, a3, s10
                  or           a2, a5, t5
                  c.sub        s0, s1
                  csrrs        s8, 0x340, gp
                  div          s10, s9, s10
                  csrrc        ra, 0x340, zero
                  add          s3, a5, s1
                  nop
                  add          zero, s0, s7
                  sltu         a7, t1, sp
                  c.and        a0, s1
                  c.srai       s0, 28
                  c.addi       a2, -1
                  mulhsu       s4, t6, a5
                  addi         t0, t3, -1666
                  c.li         t0, 2
                  nop
                  c.addi       t3, 6
                  slt          s5, a6, a2
                  csrrw        a2, 0x340, a4
                  c.add        t4, s7
                  c.xor        a5, a5
                  c.addi16sp   sp, -16
                  c.addi       s11, 26
                  c.nop
                  nop
                  c.add        a6, a1
                  c.srli       a5, 21
                  c.nop
                  csrrwi       t6, 0x340, 2
                  divu         a6, s7, t4
                  c.sub        s1, s1
                  auipc        a6, 444255
                  or           tp, s8, s0
                  lui          a2, 293682
                  add          s10, tp, s2
                  csrrwi       s4, 0x340, 8
                  c.srai       s0, 29
                  or           ra, tp, t0
                  c.nop
                  c.sub        a2, a5
                  c.slli       a6, 20
                  c.or         a2, a1
                  or           s4, s7, s0
                  divu         a7, s1, a1
                  mulhu        tp, t3, a4
                  divu         t6, sp, t5
                  csrrsi       zero, 0x340, 9
                  c.srai       a4, 15
                  sub          a5, s9, t1
                  remu         gp, s7, ra
                  csrrw        s10, 0x340, a5
                  mulhu        sp, s9, a4
                  c.add        a5, s3
                  lui          s6, 727687
                  c.sub        s1, a4
                  sltiu        s1, a7, 1949
                  c.sub        s1, s0
                  c.add        s5, t0
                  sltu         sp, t6, zero
                  csrrci       tp, 0x340, 0
                  c.srli       a0, 12
                  c.srai       a5, 15
                  c.addi4spn   a2, sp, 80
                  c.addi       a5, 1
                  sltu         s7, t4, t5
                  slt          t1, a0, t6
                  mulhsu       s10, s5, s5
                  c.or         a5, a1
                  c.slli       sp, 28
                  mulhu        a5, a5, a6
                  ori          t0, ra, 1512
                  mulhu        a5, t4, s10
                  sub          a6, a5, tp
                  sra          s9, s6, s3
                  xor          s9, a2, t6
                  xori         s8, s6, 1738
                  sub          gp, s7, t5
                  and          s8, s7, a0
                  c.addi4spn   a4, sp, 240
                  mulhu        a2, a6, tp
                  c.li         s4, -1
                  mulhsu       a6, s6, s0
                  c.srli       a5, 18
                  divu         a2, t3, t5
                  remu         t4, s3, s3
                  csrrci       a6, 0x340, 0
                  c.slli       sp, 18
                  and          t4, s0, t0
                  c.addi       a7, -1
                  c.addi4spn   s0, sp, 128
                  sltiu        a5, a1, -1638
                  divu         t0, t1, a2
                  divu         s5, s8, t0
                  add          a4, s0, s11
                  slli         s9, s1, 12
                  csrrci       t3, 0x340, 9
                  xor          a7, t3, gp
                  add          s3, a6, t3
                  div          t5, a7, t0
                  c.or         a4, a4
                  csrrwi       s1, 0x340, 29
                  c.nop
                  c.xor        a4, a4
                  sll          s9, a3, a7
                  c.andi       s1, 4
                  mulhu        s9, zero, s3
                  srli         t1, t4, 10
                  c.srli       s1, 11
                  c.andi       a0, -1
                  sll          s4, t3, a0
                  csrrci       s0, 0x340, 0
                  or           gp, ra, a6
                  c.srli       a2, 25
                  ori          s1, s10, 447
                  c.or         a4, s1
                  csrrsi       s3, 0x340, 0
                  c.li         t4, 18
                  csrrci       s8, 0x340, 0
                  sll          a2, t4, s2
                  rem          s2, a7, s6
                  c.mv         a5, a6
                  c.li         t3, 13
                  c.andi       a2, -1
                  srl          s11, s10, s7
                  srli         ra, t1, 1
                  xori         a6, a5, 1362
                  sltu         t4, t6, a2
                  sub          s11, t6, s5
                  c.slli       s7, 10
                  csrrs        t6, 0x340, tp
                  c.slli       s8, 14
                  csrrwi       s7, 0x340, 7
                  slli         a0, t6, 11
                  xor          tp, a0, s7
                  c.andi       a0, -1
                  add          a4, sp, s10
                  slt          t0, t0, t4
                  ori          tp, s4, 616
                  csrrsi       a2, 0x340, 0
                  divu         t5, s11, a0
                  mulhsu       s4, s8, a1
                  c.andi       a2, 21
                  mulh         s6, t0, a1
                  c.add        t5, a3
                  c.srli       a5, 21
                  ori          a0, a1, 1043
                  csrrw        s5, 0x340, a0
                  c.xor        s0, a1
                  nop
                  div          gp, s10, ra
                  mulh         t5, s2, s2
                  or           ra, s11, t4
                  c.add        t5, gp
                  csrrc        t0, 0x340, t1
                  c.and        a5, a4
                  slli         s8, a2, 14
                  c.srai       a5, 5
                  srli         t1, sp, 4
                  mulh         t5, gp, a0
                  c.mv         s8, a0
                  div          s3, a7, a0
                  sll          a5, s11, s1
                  csrrsi       a5, 0x340, 6
                  slti         a2, sp, -961
                  nop
                  csrrsi       s2, 0x340, 5
                  c.li         a4, 3
                  csrrci       s3, 0x340, 0
                  c.mv         s1, tp
                  sltiu        t1, t1, 696
                  slli         t5, t1, 10
                  csrrsi       s4, 0x340, 0
                  and          s8, t4, s11
                  and          s5, s11, s9
                  div          t0, s9, a2
                  sll          t1, t2, s2
                  c.add        a6, a1
                  rem          tp, t1, s2
                  c.nop
                  csrrw        gp, 0x340, t0
                  c.srai       s1, 11
                  c.sub        a0, a4
                  lui          s3, 335134
                  csrrs        s0, 0x340, zero
                  ori          s8, t6, -1802
                  mulhu        ra, s9, s3
                  slli         t0, ra, 29
                  mul          t1, t3, t1
                  divu         zero, t1, s2
                  xori         s8, s5, -1472
                  and          tp, s3, s1
                  sra          ra, a5, s7
                  csrrsi       t4, 0x340, 0
                  slt          gp, a5, ra
                  slt          t0, s3, t2
                  srl          t5, s11, t5
                  srli         t6, t5, 25
                  sra          sp, s1, t1
                  div          s6, ra, s5
                  csrrci       gp, 0x340, 17
                  slli         a5, ra, 3
                  c.slli       a0, 7
                  csrrsi       tp, 0x340, 1
                  slli         a0, a3, 30
                  c.nop
                  slti         s7, t2, 773
                  ori          a6, s1, 1828
                  or           s6, s5, t5
                  addi         s9, t3, 247
                  mulh         t1, zero, t5
                  c.xor        a2, a5
                  sltiu        s8, s2, 837
                  c.or         a2, a1
                  c.add        t3, t5
                  csrrc        s5, 0x340, zero
                  nop
                  c.xor        s0, a2
                  sltiu        t5, zero, -1692
                  c.addi4spn   s0, sp, 720
                  rem          s1, s11, s11
                  div          a5, s5, t4
                  ori          s7, s7, 693
                  mulhsu       t3, s0, s10
                  andi         gp, s5, 1215
                  divu         s6, t1, s9
                  csrrw        ra, 0x340, a2
                  mulhu        t5, s3, tp
                  mulhu        a5, s2, sp
                  sra          s5, t1, s6
                  ori          t1, t5, -917
                  slti         s7, a5, -1293
                  div          a4, s9, s6
                  remu         t6, tp, a3
                  c.li         t4, -1
                  andi         s4, s5, -1330
                  xor          s5, zero, s2
                  c.addi16sp   sp, 480
                  c.mv         s2, gp
                  c.nop
                  c.nop
                  div          a6, s5, a1
                  slt          t0, a5, s7
                  lui          gp, 991842
                  csrrwi       a0, 0x340, 27
                  xor          s1, ra, s9
                  slli         a7, a7, 11
                  xori         ra, a3, -736
                  c.lui        s2, 28
                  remu         s3, s0, t0
                  c.slli       s3, 27
                  nop
                  lui          gp, 545217
                  or           t1, ra, s2
                  srl          s3, t2, s11
                  sub          s7, a6, a1
                  srai         s7, s2, 22
                  srli         a6, gp, 1
                  csrrs        t4, 0x340, zero
                  div          tp, a2, s9
                  c.srai       a0, 1
                  csrrci       t5, 0x340, 0
                  rem          a7, s7, t5
                  c.andi       a0, 11
                  c.srai       s0, 10
                  c.or         s0, a0
                  and          a0, t5, zero
                  slt          s4, zero, a3
                  csrrc        s0, 0x340, zero
                  mul          a4, t5, s8
                  csrrsi       s4, 0x340, 21
                  sll          s10, gp, t4
                  lui          s9, 340710
                  csrrs        gp, 0x340, zero
                  mulhsu       t3, sp, s6
                  mulh         s0, a4, t3
                  srai         a7, a7, 1
                  c.srli       s1, 2
                  sub          t1, t5, s5
                  c.sub        a2, a5
                  c.li         s8, 23
                  c.or         a0, a2
                  mulhu        a2, s5, s8
                  c.addi16sp   sp, -16
                  divu         t6, s5, s6
                  auipc        s9, 268235
                  xor          s10, zero, a4
                  addi         a2, zero, 1884
                  srai         s11, t1, 9
                  remu         ra, a6, ra
                  xori         t4, a2, 1493
                  csrrw        s8, 0x340, t0
                  c.and        a0, a3
                  sltiu        sp, s2, 1550
                  mul          s6, t0, zero
                  srl          s10, t3, a7
                  nop
                  c.addi       s0, -1
                  nop
                  c.and        a5, s0
                  lui          t5, 624117
                  csrrs        a7, 0x340, s1
                  csrrwi       s11, 0x340, 2
                  c.xor        a2, a0
                  slli         t5, sp, 25
                  c.sub        a5, a2
                  c.srai       a2, 19
                  csrrs        t1, 0x340, zero
                  csrrci       a0, 0x340, 6
                  nop
                  c.li         s8, 10
                  c.lui        t3, 16
                  sltu         zero, t1, t4
                  c.andi       s0, -1
                  csrrsi       sp, 0x340, 16
                  c.srai       a4, 11
                  sltu         s2, s5, s6
                  sra          zero, s5, s5
                  c.or         a5, s0
                  div          a7, t1, gp
                  csrrsi       t0, 0x340, 6
                  nop
                  lui          s7, 407760
                  or           a6, s11, zero
                  remu         s10, s8, s4
                  srai         sp, gp, 15
                  slli         ra, t6, 0
                  addi         s3, t5, 697
                  nop
                  c.add        t5, gp
                  csrrci       gp, 0x340, 0
                  c.li         tp, 0
                  c.mv         s2, a4
                  c.mv         s2, s0
                  csrrw        s8, 0x340, s9
                  auipc        s4, 920313
                  c.nop
                  remu         t0, s1, a2
                  remu         s6, s9, s7
                  xori         s2, t5, 1666
                  xori         s9, s7, -229
                  c.li         sp, 6
                  csrrsi       s7, 0x340, 8
                  mul          s4, t4, a1
                  auipc        zero, 184966
                  mul          t5, a5, s0
                  andi         ra, t2, 1488
                  csrrwi       s7, 0x340, 12
                  srai         s1, tp, 26
                  csrrci       a2, 0x340, 5
                  csrrc        sp, 0x340, s0
                  rem          s1, a1, a0
                  c.xor        a2, a1
                  c.li         tp, -1
                  c.srai       a0, 27
                  csrrsi       sp, 0x340, 0
                  c.addi16sp   sp, 416
                  csrrci       a5, 0x340, 29
                  sub          s11, a7, tp
                  csrrw        t4, 0x340, s6
                  sltiu        t3, t2, 488
                  div          t0, s6, s7
                  c.srli       a4, 19
                  c.slli       t5, 3
                  andi         a0, s7, 1079
                  csrrsi       s11, 0x340, 0
                  c.addi       s0, 11
                  sltu         tp, t6, a1
                  c.srai       a4, 31
                  and          s11, t1, a2
                  c.sub        a4, s0
                  c.nop
                  andi         zero, a7, -214
                  or           tp, tp, s5
                  mul          t4, s0, a7
                  c.sub        a5, a1
                  srl          a5, t6, s1
                  c.slli       a2, 10
                  srli         s6, s0, 15
                  div          s9, a1, t1
                  andi         t0, s11, 559
                  c.add        gp, s0
                  nop
                  c.add        a7, s1
                  addi         s7, s8, -1061
                  nop
                  c.andi       a5, -1
                  c.addi16sp   sp, 304
                  mulhsu       s8, sp, a3
                  nop
                  c.sub        s1, s0
                  csrrw        t5, 0x340, a4
                  xori         s11, s6, -1720
                  csrrc        a5, 0x340, gp
                  csrrwi       a0, 0x340, 10
                  remu         gp, s2, s6
                  csrrc        s10, 0x340, zero
                  mulhsu       tp, t2, a7
                  ori          t3, a2, -1434
                  slt          s11, t3, a1
                  or           s9, s5, s7
                  and          a5, s3, s3
                  or           s6, a6, s0
                  ori          t6, t4, 1952
                  addi         gp, s1, -1249
                  c.slli       t0, 29
                  and          t3, s11, t1
                  xori         s10, a2, -1185
                  c.xor        a2, a1
                  or           s10, t4, t1
                  c.srai       a0, 12
                  and          s3, a0, a4
                  csrrsi       t3, 0x340, 0
                  rem          s5, t6, t1
                  xori         sp, s7, -1249
                  remu         s3, s6, a6
                  mul          s4, t1, a7
                  auipc        ra, 123904
                  c.nop
                  xori         a6, s11, 490
                  c.addi       s5, -1
                  sltu         a4, s2, s8
                  c.or         a0, a3
                  csrrsi       s7, 0x340, 7
                  csrrs        s1, 0x340, zero
                  c.lui        t5, 2
                  c.and        s1, a4
                  xor          a5, a0, a0
                  slti         t4, s10, 1271
                  c.addi16sp   sp, -16
                  csrrs        s8, 0x340, zero
                  andi         gp, s2, -858
                  andi         s4, s8, -1943
                  csrrc        ra, 0x340, zero
                  c.addi       tp, 18
                  csrrwi       t4, 0x340, 10
                  c.srli       s1, 17
                  andi         a7, s6, 1535
                  slli         s10, a5, 28
                  mulh         s11, s11, a5
                  c.addi       sp, -1
                  c.andi       s1, 15
                  c.li         s4, 16
                  csrrw        s2, 0x340, s6
                  mul          sp, t4, s3
                  nop
                  xor          a7, t4, s11
                  c.addi16sp   sp, -16
                  divu         s1, t4, t0
                  sra          t4, a3, t0
                  div          t0, t6, s2
                  slti         a4, gp, 1475
                  andi         s1, s5, 430
                  c.sub        a2, a2
                  sra          t3, s8, a5
                  c.and        a0, a2
                  csrrwi       s7, 0x340, 13
                  csrrci       t3, 0x340, 5
                  remu         t1, a1, t0
                  c.addi       sp, 18
                  xor          zero, gp, gp
                  csrrci       a4, 0x340, 0
                  sra          t0, s9, s6
                  rem          a4, zero, a7
                  c.addi4spn   a2, sp, 128
                  mul          s1, s3, t0
                  sll          a4, zero, s2
                  andi         t3, t0, -1491
                  c.addi4spn   a5, sp, 224
                  c.xor        a5, a1
                  c.mv         t3, tp
                  ori          a2, tp, 1615
                  sltu         s2, zero, s4
                  mulhu        sp, t5, s9
                  srl          tp, a2, sp
                  lui          t4, 660364
                  addi         s3, s7, -1678
                  csrrci       s8, 0x340, 0
                  c.addi16sp   sp, 144
                  lui          s0, 431637
                  slti         a2, sp, 1920
                  srl          s9, a2, s4
                  slt          t3, s7, s4
                  srai         sp, s4, 4
                  divu         t6, zero, s2
                  lui          t3, 604149
                  divu         a6, s4, s4
                  c.add        s1, s1
                  lui          a6, 712061
                  nop
                  c.and        s0, a2
                  nop
                  or           tp, sp, t4
                  xori         a7, a6, -765
                  srli         s2, a1, 15
                  addi         s4, t2, -1329
                  xori         t1, s4, 901
                  c.or         s0, a2
                  sltu         s8, t3, a4
                  csrrsi       s11, 0x340, 0
                  csrrc        a6, 0x340, zero
                  c.mv         t6, a2
                  slti         s9, t4, 1474
                  c.srli       s1, 24
                  c.addi4spn   a0, sp, 608
                  div          s8, gp, a7
                  c.add        a2, s9
                  mulh         s3, s4, s7
                  sll          t5, ra, s2
                  csrrc        ra, 0x340, zero
                  div          a2, a3, a3
                  srli         a4, s1, 5
                  slti         t0, a6, 1129
                  c.sub        s1, s1
                  sltu         tp, s7, a3
                  c.lui        t1, 15
                  c.nop
                  srli         gp, t3, 16
                  c.and        s1, s1
                  divu         a6, t4, a6
                  divu         gp, s7, gp
                  sub          s8, tp, sp
                  c.addi4spn   s0, sp, 944
                  sll          s3, a2, t5
                  nop
                  srli         sp, a1, 16
                  csrrw        s9, 0x340, s5
                  c.nop
                  csrrc        gp, 0x340, s5
                  c.andi       s0, 1
                  xori         sp, t0, -746
                  sub          a7, a2, s11
                  csrrw        a4, 0x340, s7
                  div          s10, t1, a0
                  nop
                  c.li         s11, 26
                  c.xor        a5, a3
                  nop
                  addi         s0, gp, 21
                  c.and        s1, a5
                  addi         s1, a5, 1728
                  mulhu        s7, tp, s8
                  divu         a7, s3, s5
                  sltiu        t3, s5, 1159
                  csrrsi       a0, 0x340, 9
                  addi         s0, t5, -1986
                  c.addi4spn   s0, sp, 128
                  c.srli       a5, 10
                  srl          a7, ra, s2
                  div          s5, ra, s1
                  slli         a5, s9, 15
                  xori         s5, s9, -476
                  or           s2, t2, t5
                  c.xor        a2, s0
                  c.xor        a0, a3
                  c.and        a2, a5
                  lui          a0, 325739
                  addi         s4, s7, 590
                  c.srai       a4, 3
                  c.srai       a4, 28
                  lui          s8, 394578
                  srl          ra, s1, s4
                  mulhsu       sp, t6, t4
                  c.and        s1, a5
                  and          a2, s1, gp
                  c.addi16sp   sp, 112
                  rem          gp, s1, s3
                  addi         s8, t2, -1965
                  andi         sp, ra, 590
                  c.addi16sp   sp, -16
                  mulh         s2, a1, a7
                  csrrc        gp, 0x340, zero
                  sra          zero, s3, s7
                  srli         a7, s2, 12
                  sll          s4, t4, s6
                  div          gp, s1, a3
                  csrrc        s8, 0x340, a5
                  lui          s10, 891981
                  c.addi       s8, 13
                  slti         s5, tp, -826
                  c.addi4spn   s0, sp, 992
                  mulh         t6, a2, tp
                  sub          zero, s3, t2
                  rem          s5, s1, gp
                  csrrsi       zero, 0x340, 15
                  addi         a5, s3, -429
                  c.addi16sp   sp, -16
                  or           a6, a0, a4
                  divu         a6, s9, s3
                  csrrsi       s0, 0x340, 26
                  c.or         a4, a1
                  xor          s4, ra, s3
                  andi         s0, sp, 1435
                  auipc        s2, 488776
                  sll          gp, tp, a1
                  c.srai       s0, 16
                  xori         s3, t2, -919
                  add          ra, s2, s11
                  mulhsu       s10, t5, t1
                  auipc        s6, 557336
                  rem          s5, a2, s2
                  nop
                  xor          a7, s1, t6
                  c.addi       s5, -1
                  sltiu        s11, a5, 670
                  c.add        s1, s8
                  nop
                  c.nop
                  mul          ra, gp, s10
                  sll          a2, tp, t0
                  srl          t0, s3, a3
                  sltiu        s5, a3, -1269
                  ori          t4, s1, 330
                  c.add        a5, t4
                  mulh         s6, sp, s3
                  sltu         s1, t1, s8
                  c.sub        s0, a3
                  c.addi       s9, -1
                  nop
                  c.srai       a0, 11
                  csrrsi       zero, 0x340, 0
                  andi         s4, s6, -890
                  sll          s10, gp, t1
                  ori          s9, s5, -1830
                  divu         a5, t0, zero
                  c.mv         t1, a7
                  ori          s7, sp, 272
                  slti         s6, ra, 1066
                  csrrw        a6, 0x340, a4
                  c.li         t6, -1
                  slti         s7, t6, -706
                  rem          a5, ra, a3
                  slti         s7, a6, -1277
                  auipc        sp, 675291
                  lui          s11, 690876
                  mulhsu       s4, s4, sp
                  andi         a7, t6, 1798
                  sll          a2, s9, s0
                  sub          s2, s8, s8
                  slti         tp, s8, -1698
                  c.andi       a5, -1
                  mulhu        s3, a4, s7
                  csrrs        s5, 0x340, t0
                  c.addi16sp   sp, -16
                  c.addi16sp   sp, 352
                  c.lui        a6, 22
                  sltiu        s11, s0, 585
                  c.and        s1, a0
                  csrrs        s9, 0x340, zero
                  c.addi16sp   sp, 64
                  div          s10, s6, s6
                  c.sub        s1, s1
                  srli         s10, s7, 19
                  csrrs        s11, 0x340, tp
                  c.add        s10, s2
                  and          zero, gp, ra
                  mulh         s2, s6, s8
                  c.addi16sp   sp, 80
                  c.addi       s4, 9
                  andi         s2, t4, 1659
                  and          a0, s9, t5
                  add          t4, a3, t0
                  csrrwi       a7, 0x340, 31
                  srli         s6, s2, 28
                  srai         t1, s9, 22
                  csrrc        s3, 0x340, t1
                  c.and        a0, s0
                  sll          s9, s5, s11
                  c.slli       t3, 16
                  c.addi       a5, -1
                  sra          a5, sp, ra
                  add          t0, tp, t3
                  srai         t3, t5, 0
                  add          s10, ra, t3
                  c.or         a5, a2
                  c.or         s1, a4
                  c.or         s1, s1
                  c.sub        a5, a4
                  add          tp, t2, s1
                  mulhu        t0, s4, s10
                  div          a4, t6, zero
                  mulhu        tp, s6, a3
                  c.addi4spn   a0, sp, 208
                  lui          s10, 785262
                  or           gp, s4, a0
                  c.lui        a7, 26
                  csrrs        t4, 0x340, zero
                  ori          s5, a4, 1053
                  c.andi       a2, 6
                  sra          s9, t2, s6
                  csrrs        a5, 0x340, a1
                  mulhsu       s6, a1, t1
                  xori         tp, s11, -776
                  mulhu        s5, t0, t2
                  c.li         t0, 17
                  c.addi16sp   sp, -16
                  slli         a6, tp, 28
                  auipc        gp, 416957
                  csrrsi       t3, 0x340, 0
                  c.addi4spn   a2, sp, 416
                  andi         a5, a3, 1653
                  rem          s6, s6, a6
                  divu         a4, s11, t5
                  slt          ra, t1, a0
                  auipc        t1, 384358
                  c.or         s1, a0
                  c.sub        s0, s1
                  csrrw        s5, 0x340, t4
                  add          s0, s5, t2
                  xori         sp, s0, 1228
                  addi         a4, gp, -1576
                  srli         s6, a1, 24
                  and          a2, a0, a3
                  ori          ra, t2, 607
                  c.andi       s0, 0
                  andi         a7, a7, 480
                  c.add        t6, ra
                  and          t5, t5, a4
                  andi         zero, a5, -284
                  c.mv         s11, a4
                  mulhsu       t5, t6, s1
                  c.addi16sp   sp, 208
                  c.srli       a0, 4
                  mulh         s10, t6, sp
                  c.mv         a2, gp
                  sra          s1, s7, s10
                  c.addi16sp   sp, 64
                  auipc        t3, 33916
                  rem          a4, zero, t3
                  xor          a7, s2, a2
                  c.xor        s0, a5
                  srl          t1, zero, s8
                  c.addi16sp   sp, -16
                  c.xor        a4, a5
                  nop
                  csrrs        sp, 0x340, zero
                  nop
                  c.addi16sp   sp, 192
                  slli         s3, t6, 11
                  div          t3, t1, s1
                  c.and        s0, a2
                  sltu         s11, s3, s9
                  mul          s3, a5, a2
                  nop
                  c.slli       t5, 14
                  xor          s11, s3, s9
                  slli         ra, s2, 4
                  andi         s4, s8, 124
                  rem          a5, s10, ra
                  sub          s7, a5, s4
                  xor          a7, a2, t4
                  andi         ra, a7, 1971
                  slti         t0, t2, 1245
                  xori         sp, a6, 1277
                  mulhu        tp, a4, t6
                  c.or         a2, a4
                  csrrw        a7, 0x340, a7
                  c.sub        a4, a4
                  mulh         s1, a4, s9
                  remu         s6, s6, t6
                  csrrci       s0, 0x340, 0
                  c.lui        a7, 25
                  srli         t5, t2, 17
                  slti         s2, a4, -1101
                  sltiu        s6, ra, 1343
                  c.sub        a4, a1
                  add          s3, a3, ra
                  c.srai       a4, 20
                  slt          a4, gp, t6
                  c.xor        a0, a1
                  sra          a7, t3, a1
                  slti         t4, t3, -90
                  xori         ra, gp, 1902
                  csrrw        s11, 0x340, a6
                  csrrci       t1, 0x340, 0
                  c.and        s1, a2
                  c.addi       t5, 15
                  add          t1, s7, s4
                  c.srli       a4, 5
                  mulhsu       zero, s6, sp
                  ori          a2, a2, -1407
                  slli         s4, t1, 21
                  slli         sp, s5, 10
                  c.lui        ra, 4
                  xori         s10, s6, -88
                  c.addi       ra, 28
                  c.or         s1, a4
                  srl          t4, s2, a3
                  sub          tp, a0, ra
                  csrrs        s9, 0x340, zero
                  c.and        s1, s0
                  srli         s11, t0, 28
                  ori          t0, s10, 1698
                  c.and        a0, a1
                  c.andi       s0, -1
                  sltiu        a2, a5, -1240
                  nop
                  or           zero, s0, zero
                  c.add        s7, a3
                  sltu         ra, a5, sp
                  srli         gp, s11, 31
                  c.addi       s3, 30
                  csrrs        s11, 0x340, zero
                  add          a0, t3, zero
                  slli         a7, s1, 4
                  ori          sp, s8, 942
                  srai         tp, t6, 14
                  c.li         t5, -1
                  mulhsu       a5, s11, s2
                  srl          ra, t3, a5
                  srli         s9, ra, 11
                  csrrci       s9, 0x340, 0
                  slti         sp, a1, -104
                  remu         s8, s4, t2
                  xori         s6, s3, -1760
                  slti         t5, s4, 1309
                  andi         s3, a6, 374
                  csrrw        t4, 0x340, t1
                  c.addi       t1, 17
                  sll          s6, s6, s0
                  c.lui        s0, 6
                  addi         ra, a6, -949
                  add          s5, a1, t1
                  mul          s8, a3, a1
                  c.nop
                  divu         s7, t1, t0
                  c.li         t1, -1
                  c.lui        s4, 16
                  mulhsu       s10, a2, s5
                  lui          t1, 585098
                  lui          a6, 26216
                  slt          s7, s6, s7
                  nop
                  c.addi4spn   s1, sp, 400
                  add          a7, a3, t2
                  div          t4, t0, a6
                  divu         a5, s4, s10
                  sub          t6, s8, ra
                  andi         a5, a6, 595
                  remu         a6, a0, a3
                  c.mv         a4, t5
                  andi         gp, s9, 392
                  c.add        a2, a3
                  sltiu        s7, s10, 1259
                  csrrw        a7, 0x340, tp
                  c.or         a5, a1
                  sltu         s7, s10, a2
                  c.andi       s1, -1
                  addi         ra, s6, -1290
                  slli         s10, s4, 16
                  srl          s10, a0, gp
                  c.and        a5, a0
                  srli         gp, s0, 9
                  slli         t6, s5, 23
                  sltu         gp, sp, t2
                  c.addi4spn   s0, sp, 672
                  csrrci       s8, 0x340, 0
                  csrrw        t6, 0x340, s0
                  c.mv         s9, t4
                  lui          a0, 826883
                  srai         s7, t5, 19
                  c.andi       a5, 4
                  or           t1, a1, s1
                  c.srai       a4, 18
                  slt          zero, s11, a3
                  and          s6, ra, a5
                  andi         zero, s6, -1432
                  srai         ra, t6, 18
                  csrrsi       zero, 0x340, 20
                  addi         s9, s0, 270
                  and          a7, s10, t4
                  addi         t3, s1, -743
                  csrrsi       zero, 0x340, 12
                  sub          t6, t3, a4
                  c.srli       a0, 8
                  c.srai       a5, 30
                  mulh         s0, ra, a5
                  c.addi       t5, -1
                  slti         t3, s0, 527
                  sltiu        t1, zero, 1350
                  xori         t6, a1, -1661
                  andi         s10, s0, -384
                  sub          s10, s10, s9
                  c.and        a0, s1
                  slt          a7, t0, t1
                  csrrw        t5, 0x340, s8
                  c.mv         ra, a0
                  slti         t5, a7, -1027
                  srli         s8, s11, 25
                  addi         sp, t3, -1507
                  andi         a6, a4, -1609
                  sltu         t3, s11, s5
                  c.srli       a0, 11
                  c.li         s8, 16
                  c.nop
                  div          ra, t4, a3
                  c.or         a0, a4
                  c.addi4spn   a5, sp, 928
                  c.mv         a5, s9
                  c.addi4spn   a5, sp, 416
                  nop
                  c.mv         t4, s7
                  c.nop
                  sra          sp, ra, t6
                  remu         a7, t0, t0
                  mulhsu       s10, sp, gp
                  ori          s8, a0, -615
                  c.and        a5, a0
                  c.andi       s0, -1
                  mulh         s11, a3, a4
                  c.addi       s9, -1
                  c.xor        a4, a0
                  add          s5, s2, sp
                  c.slli       s6, 8
                  csrrwi       s6, 0x340, 4
                  c.srai       a2, 25
                  xor          t5, a1, t3
                  c.lui        a4, 19
                  csrrwi       s2, 0x340, 25
                  sra          s7, s8, ra
                  csrrw        a6, 0x340, t5
                  csrrw        a5, 0x340, s3
                  csrrw        s2, 0x340, s11
                  xori         a0, a3, -1455
                  add          s7, t5, ra
                  mulhsu       a7, tp, s1
                  c.addi       a2, 25
                  addi         s3, t1, -1915
                  mulhu        t6, s2, ra
                  andi         t3, a5, -1263
                  add          a7, zero, tp
                  srl          tp, s10, s11
                  sub          t0, s7, s7
                  c.slli       a0, 17
                  xor          t1, a2, a2
                  div          t4, t0, s11
                  c.xor        a4, a4
                  csrrc        s1, 0x340, zero
                  c.slli       s5, 26
                  slli         s5, sp, 21
                  c.srli       a5, 29
                  sltiu        t0, zero, 1416
                  c.srai       s1, 2
                  sra          s8, a3, s4
                  slt          a4, s3, a3
                  mulh         t5, t0, ra
                  c.addi16sp   sp, 480
                  srli         t6, a7, 0
                  csrrci       a4, 0x340, 6
                  c.srai       a0, 21
                  srai         s5, s10, 26
                  c.slli       s8, 14
                  sub          gp, a6, t6
                  add          s5, a4, t5
                  c.addi       t4, -1
                  c.lui        s4, 4
                  c.lui        s4, 20
                  sll          a5, s6, gp
                  c.xor        a0, a2
                  mul          a7, s4, t6
                  mul          s9, t4, s10
                  c.or         s1, a1
                  divu         s10, gp, sp
                  mulhsu       t3, a6, s8
                  andi         a6, s0, -792
                  c.addi16sp   sp, 128
                  remu         s3, a2, t6
                  sltu         gp, s2, a1
                  c.nop
                  c.add        s4, s10
                  mulh         s2, a0, a4
                  c.addi4spn   s0, sp, 592
                  c.srli       a2, 8
                  slli         a4, s2, 21
                  nop
                  xor          sp, s9, s6
                  mul          t4, a6, s4
                  rem          s3, sp, s10
                  srli         t0, s5, 9
                  csrrwi       t3, 0x340, 9
                  sll          s2, a6, t3
                  addi         a0, t1, -974
                  c.and        a2, s0
                  c.andi       a0, -1
                  csrrci       s7, 0x340, 0
                  c.and        s0, a1
                  remu         t0, a4, t0
                  sltu         s1, s5, s11
                  csrrci       t0, 0x340, 0
                  mulh         a6, zero, ra
                  csrrs        s7, 0x340, zero
                  c.lui        t0, 29
                  remu         a5, s0, s4
                  mul          zero, s9, a6
                  c.xor        s0, a0
                  andi         a0, s10, -580
                  sub          tp, gp, s6
                  mulhsu       s3, s6, t4
                  csrrwi       tp, 0x340, 12
                  c.sub        a5, a3
                  c.add        t0, a7
                  c.li         a5, 25
                  sltiu        t4, tp, -809
                  add          a6, s11, s2
                  sra          s9, s8, s3
                  c.addi       t3, -1
                  c.nop
                  mulhu        s1, ra, t1
                  c.andi       a5, 25
                  sll          a6, s1, s3
                  c.srli       a2, 6
                  c.nop
                  c.add        sp, s6
                  rem          s6, s5, ra
                  csrrci       a4, 0x340, 0
                  sra          s4, a6, s9
                  srli         s7, t5, 24
                  add          s3, t2, gp
                  slli         tp, t3, 13
                  lui          s3, 56451
                  c.xor        s0, a5
                  csrrci       s8, 0x340, 0
                  c.addi16sp   sp, 80
                  sltu         s10, a2, tp
                  xori         s8, s10, 1994
                  csrrc        s10, 0x340, zero
                  c.addi       tp, 23
                  nop
                  srai         a7, s6, 10
                  c.slli       s1, 22
                  ori          zero, s1, -1651
                  c.and        s1, a0
                  ori          tp, s4, -570
                  srai         a4, a0, 6
                  auipc        s9, 1004012
                  csrrw        s3, 0x340, a2
                  c.slli       a4, 4
                  div          t0, s6, tp
                  or           s10, s10, s2
                  slt          t6, gp, ra
                  c.xor        s0, s0
                  csrrsi       t4, 0x340, 0
                  rem          s2, a0, ra
                  csrrc        gp, 0x340, s2
                  divu         gp, a0, a5
                  sll          a5, s1, t5
                  mulh         t5, t0, sp
                  sll          a7, s5, a3
                  c.addi       t1, -1
                  c.sub        a5, a2
                  sra          gp, a2, s7
                  csrrwi       s1, 0x340, 17
                  srai         t4, sp, 11
                  mulh         s2, s6, a6
                  c.and        s1, a1
                  remu         t3, sp, s0
                  xori         tp, s3, -407
                  c.nop
                  c.srli       a0, 2
                  lui          a2, 345216
                  srl          a0, a3, t0
                  ori          a2, s9, -1093
                  and          gp, s3, s3
                  slti         t4, t1, -1502
                  c.slli       sp, 27
                  or           gp, zero, t1
                  c.li         s3, 28
                  andi         ra, s3, 1282
                  nop
                  csrrw        t1, 0x340, t1
                  or           a6, a0, t1
                  slt          ra, t6, t1
                  ori          s2, a1, -414
                  sra          s7, s0, a4
                  c.li         s2, 29
                  or           s2, t0, t2
                  c.addi4spn   a4, sp, 384
                  xor          s9, a6, a2
                  csrrwi       a6, 0x340, 3
                  remu         s2, t2, s6
                  sub          a2, t4, a6
                  sra          s5, s8, zero
                  c.andi       a2, 20
                  c.nop
                  c.and        a4, s1
                  xori         s6, zero, 265
                  slli         s11, s6, 6
                  mul          a4, s11, t0
                  c.or         a4, s0
                  sub          s6, t0, ra
                  c.mv         a4, t2
                  sll          a0, t3, s3
                  slt          gp, a7, s9
                  srai         a2, s11, 7
                  c.lui        a2, 8
                  addi         s7, zero, 1695
                  csrrc        zero, 0x340, zero
                  sub          s10, t3, zero
                  add          s0, t0, s5
                  ori          s4, sp, -848
                  c.addi4spn   a4, sp, 1008
                  c.mv         a4, a6
                  c.mv         gp, s2
                  and          a2, s6, s7
                  xor          s10, t1, tp
                  sll          a0, s0, a4
                  c.or         s0, a5
                  auipc        a7, 119780
                  remu         tp, t1, s11
                  or           s0, a5, a3
                  nop
                  xori         s10, zero, -435
                  nop
                  lui          t4, 934290
                  sra          s0, s3, t5
                  c.mv         a6, a4
                  mulhu        a5, t2, s5
                  sll          s0, s0, s9
                  mulhu        gp, sp, s10
                  mul          s3, t2, s5
                  div          gp, a2, a1
                  c.srai       s0, 2
                  ori          a4, s8, 7
                  remu         s0, a2, a2
                  sltu         a2, t4, tp
                  c.nop
                  addi         a7, t3, -84
                  srl          t3, s4, t6
                  c.addi4spn   a5, sp, 272
                  nop
                  add          s10, s7, t2
                  sltu         a2, gp, gp
                  srai         t6, s7, 18
                  srl          s7, t0, s3
                  mulh         s8, t0, s7
                  mulhu        zero, s1, t6
                  slti         a4, s1, 375
                  or           s8, t2, s8
                  c.xor        a5, a3
                  add          a0, t0, s2
                  slt          s11, a1, t1
                  mulhsu       t6, s6, t4
                  c.addi       a7, 7
                  srli         sp, t4, 13
                  csrrw        a2, 0x340, a5
                  c.addi       s8, 13
                  csrrsi       zero, 0x340, 0
                  c.or         a2, s0
                  c.srai       s1, 27
                  nop
                  csrrci       s1, 0x340, 0
                  c.sub        a2, a1
                  mulhsu       zero, s8, gp
                  divu         s11, a2, a4
                  nop
                  rem          a0, tp, s11
                  sra          t5, s10, s4
                  srl          t4, s3, s9
                  c.srai       s0, 29
                  csrrc        s5, 0x340, s0
                  srli         t4, s4, 16
                  div          a7, zero, t5
                  c.sub        a4, a0
                  srli         t3, a0, 28
                  c.xor        a2, s0
                  c.xor        a4, a3
                  srli         s7, a3, 9
                  c.lui        s8, 28
                  xor          ra, t2, t0
                  sltiu        t3, a2, 1408
                  c.sub        s0, s0
                  c.nop
                  mul          s4, t6, t1
                  ori          s0, s9, 1332
                  divu         gp, a6, s5
                  sltiu        zero, s9, 517
                  lui          zero, 94982
                  c.srli       a4, 2
                  slli         t5, a1, 22
                  c.sub        s0, a3
                  add          s4, s5, tp
                  csrrwi       t5, 0x340, 21
                  csrrw        s8, 0x340, t0
                  add          s10, t4, a6
                  c.li         s9, -1
                  c.and        a0, s1
                  mulh         t3, s3, t4
                  c.and        s0, a1
                  nop
                  c.add        a2, a0
                  c.add        ra, sp
                  c.addi       a5, 28
                  c.andi       a5, -1
                  c.slli       t3, 20
                  csrrsi       s6, 0x340, 13
                  c.mv         s4, a7
                  nop
                  auipc        a0, 775217
                  c.and        s0, a2
                  sll          a6, a5, a0
                  remu         s11, t5, s7
                  remu         s0, s6, s10
                  slti         a2, ra, -2035
                  csrrci       t0, 0x340, 0
                  c.addi       a0, -1
                  c.mv         t0, s11
                  ori          a0, s2, 1499
                  c.slli       t1, 29
                  csrrci       t5, 0x340, 12
                  auipc        gp, 656678
                  c.addi       s2, 1
                  addi         a4, a3, 1869
                  rem          tp, t1, s1
                  addi         a7, s2, 1355
                  remu         s11, a4, s6
                  csrrsi       zero, 0x340, 4
                  srli         tp, a6, 18
                  slli         s4, gp, 27
                  divu         s5, t1, ra
                  c.srli       s0, 15
                  csrrwi       s0, 0x340, 21
                  c.srai       a5, 17
                  c.mv         a7, a6
                  rem          s4, zero, t1
                  sll          a7, gp, s3
                  add          s1, t3, s10
                  csrrc        t5, 0x340, a1
                  csrrs        t4, 0x340, s5
                  c.lui        s5, 27
                  slt          s2, s10, t0
                  c.srli       a0, 1
                  srl          t1, t0, s10
                  c.and        a4, a5
                  c.srai       s0, 15
                  or           s6, a7, s7
                  addi         a7, s3, 1277
                  c.xor        a5, a3
                  mulhsu       t6, a2, a5
                  c.lui        a2, 14
                  sll          s1, t2, t3
                  c.xor        a2, s1
                  mulh         s3, s6, a1
                  div          s9, s4, s2
                  c.xor        a5, a0
                  slti         a0, a3, 751
                  c.nop
                  csrrci       a6, 0x340, 0
                  remu         s5, t0, s8
                  c.xor        a2, a4
                  xor          t1, t3, t1
                  c.andi       a2, 15
                  c.addi16sp   sp, -16
                  c.and        s0, s0
                  add          s7, s1, s3
                  c.srai       a4, 24
                  c.and        a5, a1
                  andi         ra, t4, -1773
                  add          sp, t1, s2
                  nop
                  sra          s5, s9, a4
                  sll          s11, s3, a1
                  c.addi4spn   a2, sp, 64
                  srli         zero, t0, 19
                  c.addi16sp   sp, -16
                  and          s10, s3, s6
                  sub          t3, t6, s11
                  c.sub        a5, a1
                  mul          t3, a3, t3
                  csrrs        t5, 0x340, zero
                  c.add        a0, ra
                  mulhu        s6, ra, gp
                  c.addi16sp   sp, -16
                  mulhu        s1, t4, s4
                  csrrw        a0, 0x340, t2
                  csrrsi       s9, 0x340, 11
                  auipc        a2, 6559
                  mulh         tp, s4, s7
                  sll          sp, s9, a3
                  c.li         s4, -1
                  c.addi4spn   a2, sp, 832
                  csrrsi       ra, 0x340, 0
                  csrrs        gp, 0x340, zero
                  sltiu        s6, s4, -205
                  csrrci       s3, 0x340, 27
                  c.lui        t0, 19
                  c.mv         s1, t0
                  sll          a5, a6, t3
                  auipc        t4, 222101
                  addi         t6, zero, 549
                  and          s6, s7, a2
                  xor          s6, s3, s1
                  srl          s3, t3, a5
                  sltu         s7, a3, s0
                  mulhsu       a4, t0, s11
                  ori          s9, s10, -1355
                  slli         s1, t1, 16
                  c.slli       t6, 26
                  sub          s0, a4, s9
                  c.addi16sp   sp, 128
                  csrrc        a4, 0x340, s3
                  sltu         s8, tp, s11
                  sub          sp, s11, s4
                  c.andi       a2, -1
                  sra          t0, a2, zero
                  c.srli       a2, 28
                  mulhsu       tp, s2, zero
                  and          a5, tp, t0
                  or           s4, s7, s6
                  sll          tp, s5, a6
                  remu         a4, s1, t3
                  andi         ra, a1, 1707
                  c.addi       s5, 22
                  c.addi       a6, -1
                  c.mv         s7, a6
                  addi         s4, s3, 532
                  csrrc        s10, 0x340, t6
                  xor          s8, tp, a0
                  c.nop
                  c.andi       a5, -1
                  mulh         s9, s3, t6
                  c.nop
                  xori         gp, sp, -832
                  rem          s11, a7, s10
                  sltiu        t6, s6, 900
                  c.li         a0, -1
                  c.and        a4, a0
                  c.sub        a5, a1
                  mul          s9, s10, s4
                  c.li         s2, 30
                  sll          t0, a4, t5
                  srli         s5, a6, 30
                  sltu         a4, t4, a0
                  c.slli       s0, 23
                  c.srai       s0, 14
                  csrrc        t4, 0x340, s7
                  slli         s0, a1, 14
                  csrrci       s7, 0x340, 31
                  lui          t6, 542422
                  mulhu        s9, a2, s4
                  add          a7, t4, a1
                  srl          s6, s8, a3
                  c.addi       gp, -1
                  and          t3, s10, s8
                  mulhsu       sp, a0, s3
                  auipc        t3, 70920
                  c.or         a2, a2
                  srl          s10, s3, s0
                  c.andi       a2, -1
                  ori          tp, s3, 802
                  andi         a2, gp, -174
                  csrrsi       t5, 0x340, 0
                  c.sub        a0, s0
                  c.addi16sp   sp, 416
                  div          s9, t6, a4
                  ori          t0, tp, 1083
                  remu         s2, a0, s10
                  c.andi       s1, 3
                  ori          t5, a4, -1858
                  divu         s3, t5, a0
                  c.srai       a5, 29
                  c.srai       a5, 27
                  sltiu        a0, gp, -251
                  c.srai       s1, 30
                  csrrw        s5, 0x340, s9
                  c.srai       s0, 12
                  addi         sp, gp, 927
                  c.and        a4, a0
                  remu         s0, t1, t3
                  csrrsi       t4, 0x340, 0
                  srai         s4, t5, 11
                  xori         gp, s9, -256
                  add          sp, s6, s3
                  ori          sp, a6, 1393
                  csrrc        tp, 0x340, s10
                  andi         s7, s9, 600
                  c.li         s9, 8
                  sltu         t1, a0, ra
                  srli         a5, zero, 21
                  rem          s8, a4, s9
                  rem          t4, s8, s9
                  c.addi4spn   s0, sp, 304
                  mul          s1, a0, s8
                  remu         t1, s9, a7
                  slli         a2, t2, 2
                  c.addi4spn   a5, sp, 272
                  csrrc        a2, 0x340, zero
                  c.srli       a4, 11
                  c.add        t0, t0
                  c.andi       s0, -1
                  auipc        a5, 1028819
                  srl          s7, t3, a0
                  ori          sp, a3, -753
                  csrrsi       s5, 0x340, 0
                  rem          t4, a3, a4
                  sra          a5, a4, a5
                  slti         s3, a7, -1773
                  csrrw        s10, 0x340, sp
                  c.srai       s1, 25
                  c.li         s0, 0
                  nop
                  c.li         t0, -1
                  xor          s9, s10, zero
                  c.addi4spn   a2, sp, 112
                  csrrc        gp, 0x340, zero
                  c.srli       s0, 9
                  csrrwi       s0, 0x340, 28
                  slti         a7, s4, -294
                  c.and        a0, s1
                  csrrci       s8, 0x340, 0
                  nop
                  or           s8, t4, a3
                  c.addi16sp   sp, -16
                  srai         s10, s8, 23
                  sra          a0, t0, s1
                  sltu         sp, s2, t0
                  c.slli       s2, 14
                  csrrwi       a7, 0x340, 29
                  csrrc        t1, 0x340, s11
                  csrrs        s8, 0x340, zero
                  add          s1, a0, sp
                  sltiu        a4, s0, -932
                  add          a5, t6, t3
                  sltiu        s3, s7, -508
                  srl          t5, sp, a0
                  slt          t3, s6, a2
                  sll          s2, s5, t1
                  mulh         a5, t1, t4
                  sra          a7, s2, s7
                  c.slli       a2, 3
                  sra          t3, s1, s0
                  auipc        zero, 961797
                  addi         s8, s7, 1145
                  or           tp, s9, tp
                  c.addi4spn   a5, sp, 624
                  c.mv         s6, t2
                  c.xor        s1, a4
                  or           t0, ra, s8
                  or           s9, a7, a7
                  or           s0, s11, s4
                  mulhu        a6, s0, s10
                  xor          t4, s1, s3
                  csrrsi       sp, 0x340, 0
                  div          t5, s10, a1
                  c.andi       a0, 29
                  c.addi4spn   a0, sp, 416
                  c.lui        a7, 12
                  mulhsu       t4, s7, s3
                  c.andi       a4, 9
                  slt          t5, a5, s2
                  c.andi       a5, -1
                  addi         ra, t4, 1038
                  sltu         s10, t2, a6
                  csrrc        s9, 0x340, a2
                  sltu         a5, s0, gp
                  c.nop
                  sra          s1, t0, s2
                  csrrs        s0, 0x340, a7
                  sll          a5, s10, s11
                  c.addi4spn   a4, sp, 912
                  nop
                  auipc        a5, 507631
                  mulhu        t6, a6, a2
                  srli         s4, a2, 11
                  slt          s11, t3, s0
                  c.addi16sp   sp, 256
                  ori          gp, t4, -595
                  c.mv         s10, t6
                  srai         gp, s6, 9
                  mul          s9, s0, t3
                  c.or         s0, a2
                  c.and        a2, s1
                  xor          s8, a6, s9
                  mulh         s7, a6, a3
                  c.addi16sp   sp, 96
                  xori         s7, ra, 1078
                  sra          s1, s7, tp
                  xori         tp, s8, -1305
                  csrrs        t3, 0x340, zero
                  csrrsi       s10, 0x340, 0
                  andi         zero, s5, -1080
                  nop
                  c.xor        s1, a2
                  sra          s10, a1, sp
                  c.sub        s0, a3
                  mul          a2, t3, t2
                  csrrw        t3, 0x340, t6
                  lui          s7, 840078
                  c.addi16sp   sp, 32
                  mul          s3, s2, s8
                  csrrsi       t5, 0x340, 19
                  c.or         a0, a5
                  c.addi4spn   s0, sp, 544
                  c.srli       a2, 15
                  srai         t3, s5, 20
                  auipc        s3, 916552
                  c.and        a4, s0
                  c.addi       s2, -1
                  slti         a6, t5, 844
                  c.slli       t3, 22
                  c.xor        a4, a4
                  c.add        s6, tp
                  add          a0, sp, t1
                  xori         s11, s7, 47
                  c.slli       t3, 6
                  remu         s10, zero, s6
                  auipc        a2, 820242
                  csrrci       t3, 0x340, 0
                  slti         a5, t5, 1040
                  c.add        s4, t0
                  srl          s8, t6, s5
                  mul          gp, a2, s11
                  auipc        s8, 216135
                  c.mv         sp, sp
                  srl          s10, s5, t6
                  csrrc        t3, 0x340, s1
                  srli         zero, gp, 2
                  sra          t4, s10, t2
                  csrrs        s5, 0x340, s0
                  c.andi       a0, 30
                  slti         s0, s9, -1285
                  ori          s0, a5, 1674
                  mulhsu       sp, s8, t4
                  c.andi       s0, -1
                  csrrwi       ra, 0x340, 17
                  div          t0, tp, sp
                  add          ra, t3, t0
                  srl          a7, s2, t3
                  csrrci       a7, 0x340, 0
                  auipc        a0, 963851
                  csrrc        sp, 0x340, zero
                  slli         a6, t5, 23
                  mul          t6, a5, a2
                  mulhu        gp, s9, t0
                  mulhu        sp, gp, s1
                  c.slli       a6, 13
                  slli         zero, a4, 23
                  slti         a6, a2, 1045
                  or           s11, ra, ra
                  c.andi       s0, -1
                  xori         s3, a2, 1534
                  mulh         s10, tp, t1
                  c.lui        a4, 26
                  divu         t5, sp, a1
                  divu         a4, t4, t0
                  c.and        a2, a1
                  csrrwi       t3, 0x340, 2
                  mulhsu       t3, a0, s2
                  xor          t1, t4, s10
                  sll          t6, a1, t0
                  remu         s1, s3, a7
                  c.addi16sp   sp, -16
                  sltiu        a5, t6, 1267
                  c.li         t6, 4
                  divu         sp, s6, a4
                  sra          s9, s4, s0
                  slt          a6, sp, s10
                  csrrsi       a4, 0x340, 6
                  xor          s6, a4, a0
                  c.add        tp, a1
                  c.sub        s1, a4
                  sll          t6, a4, t6
                  mulhsu       t3, sp, t2
                  c.li         tp, 19
                  auipc        gp, 244223
                  sll          t5, a5, a3
                  c.andi       a4, -1
                  mulhu        gp, s6, t4
                  c.srai       a4, 2
                  c.mv         s6, a0
                  sub          t4, s10, s0
                  c.mv         t1, t2
                  mulhu        s6, s3, t2
                  sll          t6, ra, a1
                  ori          s2, a7, 1782
                  addi         ra, gp, -604
                  slt          a4, s5, s4
                  c.addi4spn   a0, sp, 944
                  sltu         s1, a3, s11
                  lui          t4, 79865
                  c.addi4spn   a4, sp, 800
                  slt          t6, t0, a4
                  mulhu        a7, tp, s0
                  lui          t0, 1040843
                  sltiu        s9, a4, 1118
                  div          s10, s1, s10
                  csrrsi       sp, 0x340, 6
                  c.or         s0, a2
                  rem          t5, tp, a0
                  c.andi       a5, -1
                  and          t3, a0, sp
                  mul          a2, s2, tp
                  c.sub        a4, a1
                  c.sub        s1, s0
                  mulhu        s5, s0, a4
                  c.sub        a5, a3
                  csrrw        t1, 0x340, a1
                  slti         t4, s3, 1819
                  or           t1, t5, s5
                  add          tp, ra, s0
                  c.addi16sp   sp, -16
                  c.nop
                  sltiu        s2, a3, -604
                  andi         zero, a0, 1907
                  slti         tp, t6, 1307
                  c.addi       s11, 24
                  divu         s6, s9, s7
                  mulhu        zero, a5, t1
                  mul          s3, s10, s5
                  c.and        a2, a3
                  c.addi       sp, 1
                  slti         tp, s0, -221
                  xor          s1, t4, tp
                  andi         a0, t0, -934
                  c.sub        a5, a4
                  sub          s8, t4, s10
                  c.srai       s1, 19
                  divu         s4, zero, a1
                  nop
                  nop
                  mulhsu       t5, a6, t2
                  nop
                  mulh         s6, s6, tp
                  xori         t5, s5, 1969
                  c.srli       a0, 7
                  csrrwi       s4, 0x340, 10
                  srai         s9, gp, 14
                  srli         s2, a1, 22
                  divu         tp, a3, a2
                  div          s3, a3, s7
                  c.or         a4, a2
                  c.addi       t6, 14
                  c.li         s7, 19
                  csrrci       s1, 0x340, 0
                  add          ra, a3, a3
                  srli         a4, a7, 17
                  addi         t6, t2, 1803
                  srl          s4, s5, t4
                  mulhu        t4, t5, t3
                  csrrci       sp, 0x340, 0
                  c.sub        a5, s0
                  c.addi       s11, 27
                  c.srai       s0, 3
                  srl          ra, t2, a3
                  csrrwi       sp, 0x340, 18
                  c.nop
                  ori          s4, t0, -223
                  c.li         s9, 15
                  c.li         s9, 15
                  csrrs        a5, 0x340, zero
                  c.lui        t4, 31
                  srai         t4, t1, 6
                  auipc        t3, 844803
                  sra          t3, s8, s7
                  mul          a0, s3, a4
                  c.andi       a5, 7
                  sll          s7, a1, sp
                  ori          s0, a3, -323
                  c.srli       a5, 12
                  csrrsi       s4, 0x340, 1
                  add          tp, s11, a2
                  sll          a6, t3, a6
                  csrrc        a7, 0x340, zero
                  slt          zero, s6, s1
                  slt          gp, s5, a7
                  auipc        s7, 601816
                  sub          s9, s3, s8
                  xori         a7, s3, 1219
                  c.li         t0, -1
                  and          a7, a4, s2
                  c.addi4spn   a2, sp, 720
                  mulh         sp, sp, ra
                  csrrwi       t5, 0x340, 11
                  csrrc        a5, 0x340, zero
                  auipc        t4, 789975
                  addi         s3, t2, 1445
                  c.add        t4, a6
                  c.xor        a2, a2
                  c.addi16sp   sp, 496
                  csrrw        t5, 0x340, a1
                  slti         s1, a5, -1226
                  c.andi       a2, 24
                  csrrc        s3, 0x340, a4
                  sra          a4, a4, t4
                  c.xor        a0, s0
                  csrrsi       ra, 0x340, 17
                  csrrs        a0, 0x340, zero
                  c.srai       a2, 14
                  divu         s9, t6, a1
                  xori         s4, s10, -1302
                  c.add        ra, s1
                  c.slli       s8, 13
                  c.li         gp, 30
                  c.xor        a5, a4
                  remu         t6, s10, t2
                  c.xor        a5, a4
                  csrrci       t6, 0x340, 0
                  csrrwi       t1, 0x340, 0
                  srli         a2, t1, 6
                  sll          t5, t4, s6
                  sll          s10, ra, a7
                  c.srli       a4, 11
                  sub          a5, a1, s7
                  c.addi4spn   s0, sp, 544
                  xor          s6, a2, sp
                  slli         a7, tp, 10
                  mulhu        s10, s4, s6
                  slli         a7, s4, 12
                  ori          t0, s8, 1349
                  c.and        a5, a4
                  c.xor        a5, s0
                  addi         tp, s8, 419
                  csrrc        gp, 0x340, sp
                  remu         gp, s0, s2
                  andi         s1, a7, -1293
                  addi         t3, s0, 1483
                  c.andi       s1, 16
                  csrrsi       zero, 0x340, 0
                  c.addi       s6, 28
                  sra          s3, t0, s10
                  c.slli       s3, 25
                  remu         s11, t6, t3
                  csrrsi       t4, 0x340, 0
                  csrrs        zero, 0x340, zero
                  rem          ra, s4, a2
                  sltu         t0, s2, s7
                  mulhsu       a7, a3, tp
                  csrrs        s8, 0x340, zero
                  c.and        s0, a3
                  sub          s6, gp, ra
                  nop
                  csrrc        sp, 0x340, zero
                  andi         s6, t5, -1220
                  or           s9, s6, s9
                  c.add        a7, a0
                  slti         a0, a3, 1336
                  sll          s6, s5, a5
                  sub          s3, a1, t0
                  addi         s9, zero, 182
                  csrrci       t5, 0x340, 16
                  remu         t0, t1, a0
                  mul          s11, tp, zero
                  c.slli       s9, 6
                  slli         t0, s1, 1
                  c.or         s0, a3
                  c.andi       s0, 20
                  mulhu        t5, tp, s6
                  ori          a4, s8, -1610
                  c.nop
                  slti         zero, s1, -1655
                  c.add        a6, a5
                  csrrwi       s9, 0x340, 12
                  slt          s11, a4, s4
                  andi         s1, s11, 539
                  sll          s2, ra, a4
                  c.sub        a0, s1
                  srli         t3, a4, 12
                  c.mv         t1, s1
                  add          t1, s3, s1
                  c.srai       a4, 12
                  sra          gp, s8, s3
                  slt          s10, s9, s5
                  csrrwi       s8, 0x340, 19
                  c.or         s1, s1
                  or           t0, t6, s4
                  slti         t3, t6, -1908
                  srli         s9, t0, 25
                  c.addi       ra, -1
                  ori          t6, t2, 1359
                  c.slli       t6, 4
                  c.or         a0, s1
                  mulhsu       t3, s11, a5
                  csrrc        s6, 0x340, tp
                  srai         t0, a0, 18
                  sub          s1, s5, a6
                  remu         s4, t3, a0
                  sltiu        a2, s2, -1881
                  c.xor        a2, a2
                  rem          t6, s11, zero
                  c.xor        a5, s0
                  c.srli       a5, 17
                  c.addi4spn   a0, sp, 576
                  remu         ra, s7, s2
                  mulhu        tp, a5, tp
                  sra          t5, a1, s10
                  csrrci       s0, 0x340, 25
                  c.slli       s2, 22
                  sub          a6, sp, a4
                  or           zero, t1, a7
                  xori         s3, s5, -1642
                  nop
                  c.srai       a0, 24
                  slti         s11, t3, 929
                  mulhu        t0, s0, s11
                  sltiu        s11, t2, -1051
                  csrrc        tp, 0x340, a4
                  andi         s8, s11, -520
                  c.srai       a2, 20
                  csrrs        tp, 0x340, zero
                  rem          zero, a5, a3
                  c.or         s1, a0
                  csrrsi       s9, 0x340, 0
                  ori          a5, s1, 843
                  c.or         s0, a2
                  slt          s8, t3, a3
                  mul          a6, s0, zero
                  xori         a2, zero, 1004
                  c.and        s1, a4
                  c.addi       s4, 11
                  c.srai       s0, 27
                  ori          s6, a1, -1367
                  c.addi       s2, 14
                  csrrci       s0, 0x340, 1
                  srai         sp, s7, 21
                  mul          ra, a3, t4
                  srli         s3, t6, 31
                  c.mv         ra, a7
                  ori          s3, a0, -1296
                  ori          t4, ra, -297
                  nop
                  c.slli       s6, 22
                  c.srli       a4, 27
                  srai         s3, a4, 12
                  srai         a6, t0, 30
                  remu         s3, t2, ra
                  srai         s6, a4, 25
                  srl          s9, s9, s3
                  add          zero, t5, t6
                  slti         zero, s0, -932
                  sltiu        s4, s0, -1249
                  c.addi       t0, -1
                  auipc        gp, 68990
                  rem          tp, s11, s4
                  ori          gp, s6, -678
                  c.lui        a7, 25
                  c.xor        a5, a0
                  csrrwi       s0, 0x340, 24
                  add          gp, t0, s4
                  srli         s2, a1, 9
                  c.addi16sp   sp, 192
                  xori         s10, s0, 561
                  c.mv         s3, a4
                  div          tp, a4, t6
                  slli         t4, a5, 4
                  c.lui        t1, 25
                  c.addi4spn   a0, sp, 880
                  c.xor        a5, a2
                  c.lui        s2, 27
                  c.nop
                  andi         zero, t6, 445
                  c.lui        s1, 16
                  c.lui        s11, 4
                  c.addi       s2, -1
                  c.addi       tp, -1
                  c.xor        a2, s0
                  csrrs        a0, 0x340, s8
                  c.sub        s1, a2
                  sra          t6, ra, t5
                  c.srai       s1, 14
                  srl          a7, s4, zero
                  c.li         a7, -1
                  mulhsu       t3, t5, t3
                  srl          s6, gp, t2
                  divu         s6, a7, s10
                  add          a4, gp, t4
                  add          t3, s1, a6
                  c.sub        a5, s0
                  c.lui        a4, 14
                  or           s3, t2, a4
                  csrrw        a4, 0x340, a5
                  csrrs        s3, 0x340, zero
                  sra          ra, s5, t4
                  srli         s7, gp, 6
                  c.slli       t6, 29
                  sltu         sp, t1, s4
                  mul          s5, s10, zero
                  c.mv         t0, s0
                  c.lui        a0, 20
                  or           s3, s1, a1
                  or           t6, t3, a7
                  divu         s10, t6, zero
                  c.add        s1, a1
                  c.addi       s6, -1
                  sltu         t1, t2, s1
                  srl          t5, t2, zero
                  csrrsi       s5, 0x340, 21
                  c.srli       s0, 16
                  lui          a7, 14905
                  mulh         t6, t2, a6
                  c.and        a2, a3
                  c.sub        a2, a3
                  and          a0, s7, s3
                  sltu         ra, s4, s7
                  c.li         a5, 4
                  c.addi16sp   sp, -16
                  c.add        t6, s0
                  auipc        s3, 1035485
                  c.srai       s1, 3
                  c.or         a5, a5
                  sra          a6, tp, a5
                  c.addi16sp   sp, -16
                  nop
                  c.sub        s0, s0
                  c.andi       a5, -1
                  div          sp, s7, t3
                  c.add        s10, s6
                  c.andi       a4, 12
                  sltu         a2, a6, s3
                  c.sub        s0, s0
                  c.li         a6, -1
                  csrrsi       a4, 0x340, 0
                  c.addi16sp   sp, 80
                  c.xor        s1, a3
                  srli         s4, a4, 22
                  c.xor        a0, a4
                  c.sub        s0, a3
                  c.li         a4, 9
                  c.srai       a2, 3
                  and          a0, t4, tp
                  c.li         s5, 12
                  c.xor        a4, s0
                  sltiu        s2, a1, -231
                  c.add        t3, t0
                  c.nop
                  nop
                  div          a0, s0, t6
                  srai         t6, tp, 11
                  csrrwi       s5, 0x340, 11
                  xor          s8, s6, a7
                  xor          s2, t3, s5
                  srli         ra, t4, 24
                  andi         s6, t0, -1875
                  divu         t3, a7, s3
                  xori         s5, gp, -1364
                  andi         s3, s11, -393
                  c.srai       a5, 21
                  nop
                  csrrc        t3, 0x340, a3
                  andi         s1, ra, 1853
                  nop
                  nop
                  addi         gp, t1, -502
                  or           s2, a1, t0
                  c.addi       t4, -1
                  csrrs        t0, 0x340, t2
                  or           t6, a0, a7
                  srl          s7, a4, t6
                  c.srli       s0, 13
                  sll          a5, s5, a1
                  c.add        s1, s4
                  c.or         a0, a5
                  sltu         s2, s6, t6
                  mulh         t5, s11, a2
                  rem          s6, s4, a2
                  remu         s6, a0, t3
                  c.addi16sp   sp, 48
                  csrrci       tp, 0x340, 0
                  c.lui        t0, 7
                  nop
                  xori         t0, t1, 1542
                  mul          zero, s3, ra
                  sll          t6, s4, s1
                  c.lui        s8, 25
                  div          s7, s10, t1
                  c.nop
                  c.srai       s0, 6
                  csrrci       s5, 0x340, 28
                  sll          s4, a6, ra
                  remu         a6, s9, a3
                  slli         tp, s5, 8
                  sll          zero, s2, s11
                  srli         a4, s10, 14
                  c.addi16sp   sp, -16
                  add          s3, gp, s5
                  c.srai       s0, 13
                  c.addi4spn   a2, sp, 672
                  add          t4, a4, t2
                  c.mv         tp, tp
                  c.sub        a4, a4
                  div          t3, s9, a2
                  slt          s6, a1, t6
                  mulhu        s7, a6, a5
                  c.srli       s1, 13
                  c.andi       s0, 26
                  slli         s3, zero, 13
                  xor          a0, a2, a1
                  c.lui        s11, 13
                  mulh         t0, zero, ra
                  slli         s7, a3, 14
                  csrrci       s10, 0x340, 26
                  c.and        s1, a2
                  srai         s9, a2, 31
                  xori         t6, tp, 168
                  c.sub        a5, a5
                  c.mv         s0, gp
                  sltiu        a5, t1, 1108
                  c.lui        s10, 24
                  csrrwi       s9, 0x340, 10
                  lui          s9, 91482
                  remu         t1, s7, t1
                  addi         t5, a0, -132
                  slti         t6, a5, 514
                  ori          t0, a0, -1411
                  c.and        a0, a0
                  lui          a7, 87185
                  csrrci       s6, 0x340, 0
                  csrrw        a4, 0x340, ra
                  mulhsu       sp, a1, tp
                  nop
                  c.nop
                  mulh         a0, sp, s4
                  c.andi       a4, -1
                  auipc        a2, 947570
                  c.addi       s0, 8
                  c.addi4spn   s1, sp, 928
                  csrrs        tp, 0x340, zero
                  c.lui        s2, 15
                  c.or         a4, a3
                  slt          a0, t5, s1
                  mul          s8, t3, a4
                  mulhsu       a4, s0, a4
                  c.addi4spn   a2, sp, 464
                  ori          a2, t1, 697
                  c.slli       t1, 11
                  sll          a4, s2, a1
                  c.sub        a2, a4
                  mulh         s10, s0, t1
                  c.addi       t3, -1
                  csrrwi       s7, 0x340, 24
                  sltiu        tp, s5, -1117
                  c.srai       a4, 5
                  mulh         ra, s4, a7
                  slt          zero, s3, t2
                  mulh         s9, t0, a0
                  ori          a7, s9, 586
                  slli         s1, tp, 15
                  xor          s2, a0, a5
                  mulhu        s1, sp, a3
                  csrrwi       sp, 0x340, 1
                  slt          s5, a5, s7
                  auipc        s5, 262341
                  c.srai       s0, 15
                  c.xor        a4, a4
                  slt          t6, ra, s11
                  divu         s4, t6, s11
                  add          a7, s6, s0
                  addi         s0, s9, -906
                  addi         s1, s1, 650
                  c.slli       t6, 21
                  divu         a0, s9, s4
                  div          a5, a4, t0
                  csrrsi       a7, 0x340, 0
                  sltu         s3, a5, a5
                  c.or         s1, s1
                  c.add        s9, a3
                  c.li         sp, 22
                  csrrci       gp, 0x340, 0
                  auipc        s1, 241150
                  srai         a6, t4, 11
                  csrrw        s2, 0x340, s7
                  or           s10, s8, s6
                  lui          s5, 511078
                  mulhu        sp, a7, a3
                  mulhsu       t0, tp, a7
                  and          gp, s2, s0
                  c.slli       a5, 13
                  div          t6, a7, t4
                  lui          zero, 98197
                  csrrsi       s9, 0x340, 0
                  c.srai       s1, 24
                  c.and        a2, s0
                  c.slli       s3, 19
                  sltiu        t6, s11, -1539
                  csrrs        s3, 0x340, zero
                  nop
                  or           s4, a0, sp
                  remu         t1, t6, t1
                  c.lui        a0, 28
                  andi         t3, s11, 1215
                  csrrsi       a0, 0x340, 21
                  c.srli       a2, 25
                  c.addi       s7, 30
                  sub          s4, a1, a7
                  c.add        t5, s3
                  c.sub        s1, a0
                  c.srli       a2, 13
                  c.andi       s0, -1
                  c.mv         t5, t4
                  mul          s2, s7, s2
                  div          s5, t2, ra
                  c.slli       s3, 24
                  c.mv         s6, s7
                  sra          zero, s1, s4
                  c.srai       a0, 21
                  c.li         t1, -1
                  c.addi4spn   a2, sp, 624
                  c.xor        s0, a0
                  auipc        a6, 732875
                  srl          ra, s10, s6
                  mulh         s5, a4, s4
                  c.addi16sp   sp, 272
                  csrrw        gp, 0x340, a6
                  and          gp, t0, ra
                  mulhu        s2, zero, t3
                  nop
                  mulh         s11, s1, a5
                  sll          a4, t4, a7
                  c.li         t1, -1
                  ori          s3, a3, 1107
                  c.or         a5, a4
                  csrrc        s1, 0x340, a3
                  addi         s2, a0, -1845
                  slti         a4, s10, -1496
                  csrrci       s3, 0x340, 0
                  c.slli       t4, 19
                  and          s8, s11, zero
                  rem          s1, a0, s7
                  c.mv         s6, s11
                  lui          t0, 940100
                  c.xor        s1, s1
                  srli         t6, t2, 29
                  mulhsu       gp, a1, a2
                  auipc        s7, 766131
                  c.xor        a5, a5
                  c.and        a5, a1
                  c.and        s1, s1
                  xor          s9, a1, t1
                  mul          s10, t1, sp
                  c.li         t5, 0
                  c.or         a5, a2
                  srai         a0, t4, 25
                  sub          s10, a7, s6
                  sltu         t6, s4, s3
                  c.srli       a4, 29
                  sltu         t6, s4, t3
                  c.addi       a6, -1
                  c.xor        s0, s1
                  c.addi16sp   sp, -16
                  c.and        a5, a4
                  c.andi       a5, -1
                  srl          s1, t5, sp
                  sll          s10, a4, s7
                  xor          s8, s10, a6
                  rem          a4, tp, s4
                  and          t6, s3, ra
                  add          s6, t6, a6
                  c.li         s5, 11
                  csrrsi       s8, 0x340, 0
                  c.lui        tp, 30
                  mulh         ra, zero, ra
                  c.slli       a2, 7
                  c.srli       a2, 25
                  lui          s2, 330565
                  and          s5, t6, t5
                  mulhu        s7, tp, t2
                  addi         s5, a3, -1523
                  csrrwi       a7, 0x340, 26
                  or           s11, t2, a3
                  nop
                  divu         s10, s7, t3
                  csrrw        a2, 0x340, s0
                  div          s3, s2, a6
                  c.addi       s5, 12
                  sltu         a0, s10, a2
                  c.srai       a5, 13
                  c.addi16sp   sp, -16
                  c.or         a4, a0
                  sub          a0, tp, s7
                  c.slli       t0, 1
                  ori          t0, tp, 1639
                  c.slli       a4, 9
                  c.slli       a7, 17
                  addi         s2, tp, -318
                  sra          s1, sp, t6
                  csrrwi       s11, 0x340, 14
                  or           t4, a2, s11
                  slli         s7, a4, 17
                  mulhu        a0, a5, s5
                  c.slli       s0, 21
                  srl          a5, ra, s8
                  srai         s1, a6, 24
                  mulhu        a5, a2, sp
                  c.addi16sp   sp, 32
                  rem          s10, gp, s0
                  slti         a4, s9, 1159
                  c.slli       s6, 2
                  mulhsu       s6, t5, s1
                  c.srai       a5, 7
                  addi         t5, tp, -542
                  c.sub        s0, s0
                  sra          a4, s1, s6
                  lui          gp, 755316
                  sub          tp, s2, s11
                  sll          ra, t6, s11
                  c.srai       a5, 17
                  c.xor        s0, a2
                  rem          s10, t3, s6
                  csrrs        a4, 0x340, t1
                  c.srli       s0, 3
                  c.andi       a5, -1
                  c.or         s0, a4
                  csrrs        s9, 0x340, zero
                  csrrci       t4, 0x340, 0
                  c.lui        t0, 1
                  mul          a2, t1, t4
                  c.addi       s9, 11
                  rem          t5, a5, t3
                  or           ra, a6, a4
                  srl          tp, s1, ra
                  mul          t1, sp, s0
                  xori         t1, a0, 1235
                  c.xor        s0, a2
                  add          s5, t3, s6
                  mulhu        s9, s2, s6
                  c.slli       s1, 17
                  remu         a5, gp, s4
                  csrrwi       t6, 0x340, 19
                  c.addi       s0, -1
                  c.xor        s0, a3
                  c.addi16sp   sp, 432
                  c.xor        a5, a4
                  divu         a7, s1, s4
                  divu         s4, zero, s7
                  c.add        t4, s7
                  xori         sp, t4, 2044
                  div          s8, t3, gp
                  srl          tp, t2, a3
                  srl          a5, sp, s0
                  sra          t5, t4, s3
                  div          t0, t5, s4
                  auipc        a2, 210779
                  c.lui        s4, 31
                  auipc        a2, 757458
                  c.xor        a0, a5
                  nop
                  c.andi       a0, -1
                  c.xor        a2, a1
                  c.addi16sp   sp, 128
                  csrrc        tp, 0x340, a2
                  or           s0, a2, s6
                  mulhsu       t6, s2, a1
                  c.addi       t1, -1
                  slti         a0, s2, 1826
                  c.nop
                  c.sub        a4, a1
                  c.srli       a0, 31
                  c.addi16sp   sp, -16
                  ori          s9, a4, -70
                  c.xor        a5, a2
                  sltiu        a5, sp, 494
                  c.mv         t1, s5
                  c.xor        s0, a4
                  slti         a4, a5, -1517
                  sltiu        s2, a3, -1597
                  xor          s1, s6, s11
                  c.srai       s0, 15
                  c.slli       ra, 23
                  c.sub        a2, a2
                  or           zero, s11, t4
                  c.addi4spn   s0, sp, 384
                  sra          s7, t0, t3
                  mulhu        t5, s0, s5
                  sll          s4, a7, a3
                  c.nop
                  xor          s7, zero, a0
                  c.srai       a2, 5
                  c.sub        s1, a4
                  divu         s7, s7, sp
                  ori          t1, s1, 60
                  mulhsu       t3, s5, a6
                  c.sub        a5, s0
                  nop
                  c.add        s3, a0
                  c.or         a5, a2
                  nop
                  xori         s8, t0, -1988
                  xor          s9, t1, a0
                  mul          s5, a6, zero
                  c.sub        a5, a4
                  rem          t1, s7, ra
                  c.and        a4, s1
                  mulhsu       a6, s9, s6
                  csrrs        t6, 0x340, zero
                  sltu         s4, tp, a0
                  sltu         s3, a7, s0
                  c.srli       a0, 31
                  c.or         s1, a3
                  c.add        a5, a2
                  divu         a7, t6, a0
                  csrrw        s10, 0x340, a1
                  mulhu        s10, s9, s9
                  mulh         t1, s3, gp
                  andi         tp, t0, -1043
                  xor          a7, tp, s0
                  c.li         a0, -1
                  divu         t0, t0, s3
                  csrrc        tp, 0x340, zero
                  xor          s9, a2, t2
                  andi         a2, t4, -468
                  xor          s8, a2, s3
                  remu         a6, t3, s1
                  and          sp, s7, s5
                  mulh         t1, sp, a7
                  remu         s5, ra, t1
                  slli         t4, t2, 6
                  div          s2, t6, t2
                  xori         s6, a4, 39
                  sll          zero, a1, zero
                  sltu         gp, t1, sp
                  xor          sp, a5, s3
                  slti         zero, a0, 105
                  csrrw        s11, 0x340, s2
                  c.nop
                  xori         a5, t0, 293
                  c.and        s1, a3
                  sra          a5, s3, a6
                  sltiu        a0, s6, 281
                  srai         a2, t5, 15
                  csrrw        s7, 0x340, tp
                  div          s8, s3, t6
                  c.addi16sp   sp, 16
                  sll          t5, t3, t6
                  srli         tp, t5, 15
                  c.add        s6, s11
                  c.mv         tp, t0
                  xor          gp, t2, sp
                  slli         t4, sp, 8
                  c.xor        a5, a4
                  mulh         s9, t3, s0
                  srli         t6, s1, 13
                  sra          a0, s8, a2
                  sra          s4, a2, sp
                  csrrsi       s5, 0x340, 0
                  addi         sp, s1, -1054
                  or           a2, s9, t2
                  c.addi16sp   sp, 224
                  and          t1, s7, a6
                  xor          a4, s0, t4
                  c.sub        a5, a3
                  addi         s11, a0, 1541
                  srai         s0, sp, 4
                  csrrs        s10, 0x340, zero
                  slti         s11, t4, -1160
                  sub          s5, s6, ra
                  csrrwi       sp, 0x340, 14
                  mulhsu       s3, t3, a5
                  csrrsi       s11, 0x340, 25
                  c.and        s1, a0
                  auipc        s2, 385565
                  c.srli       a4, 16
                  remu         s8, t1, zero
                  c.andi       s0, -1
                  c.sub        s1, s1
                  csrrwi       a6, 0x340, 0
                  c.add        s1, s10
                  sra          t0, t6, zero
                  rem          s0, s6, s1
                  ori          t0, gp, 874
                  sll          t5, s7, a4
                  srli         t4, s10, 11
                  divu         t6, t3, a5
                  auipc        s10, 33384
                  c.mv         s6, t2
                  srai         s7, s1, 29
                  c.mv         t4, s2
                  srai         s10, t3, 20
                  or           a2, a3, a6
                  add          sp, ra, a4
                  andi         a6, a7, -291
                  xori         s0, s1, -1701
                  srl          s11, a4, s3
                  c.mv         a4, t2
                  auipc        s3, 769481
                  c.srli       a5, 22
                  c.mv         a4, s4
                  c.addi16sp   sp, 368
                  xor          s7, t3, tp
                  ori          s11, a5, -126
                  c.li         s6, 3
                  xori         s5, t1, -1621
                  c.nop
                  srai         t3, t6, 19
                  srai         s4, a2, 16
                  sltiu        s0, a7, -679
                  c.addi       t1, -1
                  div          s0, a4, t4
                  xor          s4, t0, t6
                  andi         a7, t3, -791
                  xori         tp, a6, -1728
                  div          sp, s3, a2
                  c.andi       s0, -1
                  and          s4, s1, ra
                  c.srai       s0, 21
                  c.li         t4, 3
                  addi         t4, gp, 12
                  divu         s11, t5, t2
                  csrrc        s8, 0x340, zero
                  remu         t4, t6, s4
                  c.andi       a0, -1
                  csrrs        s5, 0x340, zero
                  mulhsu       gp, a6, s10
                  sll          a4, a5, t5
                  lui          a2, 349464
                  xor          a7, t1, t6
                  div          s10, s4, a2
                  sra          a6, ra, a7
                  csrrs        s11, 0x340, zero
                  remu         t3, a6, a0
                  c.li         a7, -1
                  addi         t1, t1, 143
                  xori         s9, a3, -379
                  sll          sp, gp, t0
                  rem          s0, s0, a1
                  mulhsu       s11, a1, a4
                  add          s4, t6, zero
                  csrrwi       a7, 0x340, 21
                  c.xor        s1, a3
                  and          s10, a0, a6
                  c.lui        s2, 27
                  sll          tp, s4, zero
                  csrrci       a2, 0x340, 11
                  mulhsu       s10, t0, t3
                  csrrsi       a7, 0x340, 3
                  nop
                  c.sub        a4, a5
                  srl          s5, t5, a1
                  remu         ra, a7, t5
                  sltu         a0, a7, a0
                  div          s3, s2, a3
                  lui          s6, 632836
                  sub          ra, s10, t6
                  lui          t0, 498893
                  slli         tp, zero, 2
                  c.lui        t4, 12
                  and          zero, t3, s8
                  div          s11, t6, s9
                  csrrw        t5, 0x340, a4
                  c.or         a0, a1
                  andi         a0, a7, 1611
                  xori         s7, t1, -2000
                  mulhsu       s6, a3, t1
                  srl          s11, t0, t4
                  c.lui        ra, 29
                  mulhu        s8, t1, s0
                  addi         gp, ra, 1356
                  mulhu        zero, a2, s7
                  add          s7, t1, a0
                  srli         sp, a2, 3
                  c.srli       a2, 10
                  c.nop
                  csrrwi       s2, 0x340, 19
                  c.add        s5, a2
                  remu         sp, s1, gp
                  c.slli       a6, 25
                  c.lui        t3, 7
                  remu         s6, a6, a4
                  remu         s5, s8, a5
                  c.srli       s1, 3
                  slt          s5, a3, a7
                  sll          a2, t5, a3
                  csrrwi       t3, 0x340, 6
                  slt          tp, s0, a7
                  csrrci       a7, 0x340, 0
                  xor          zero, s9, s7
                  c.mv         a7, s6
                  c.addi       t3, 3
                  andi         s11, s3, 1384
                  c.and        s1, s0
                  sub          s3, a4, a7
                  and          t5, t2, s1
                  srl          s1, s0, t3
                  andi         s10, s5, 1101
                  sltiu        t0, a7, -893
                  srl          a4, a4, t6
                  c.and        a5, a2
                  auipc        s10, 945586
                  c.add        s7, a2
                  c.li         t0, 3
                  mulh         a6, s1, t1
                  c.and        a2, a2
                  sltu         s3, s5, sp
                  c.li         a7, -1
                  sub          sp, a2, a7
                  slt          s8, s9, a1
                  and          s10, s11, ra
                  auipc        gp, 798917
                  andi         t5, t3, -1849
                  c.lui        t1, 16
                  sll          sp, s6, s9
                  sra          a2, t6, s9
                  remu         s2, a5, ra
                  slli         s7, a3, 8
                  c.addi16sp   sp, 272
                  csrrc        a2, 0x340, t4
                  xori         s11, ra, -1740
                  or           s2, a1, a6
                  c.addi       t6, 14
                  divu         ra, s11, a5
                  c.sub        a0, a3
                  andi         gp, a7, -403
                  mulhu        s3, s11, a7
                  slti         a2, t3, -16
                  sll          t6, t5, s10
                  xor          s2, s3, zero
                  c.lui        a6, 6
                  c.addi       s8, 26
                  div          s1, a3, s7
                  mulhu        s3, t4, t4
                  csrrw        s5, 0x340, s9
                  c.slli       s10, 30
                  mul          a4, a3, s9
                  rem          a4, s1, t3
                  csrrwi       gp, 0x340, 19
                  c.lui        a5, 25
                  xor          a7, tp, a5
                  c.nop
                  c.or         s1, a4
                  c.srai       s0, 6
                  c.addi4spn   a2, sp, 16
                  c.srli       s1, 16
                  slli         s7, zero, 3
                  srai         a5, s5, 16
                  xori         s5, t5, -1918
                  xor          t1, t5, s11
                  sub          ra, sp, s4
                  csrrwi       s11, 0x340, 10
                  csrrs        sp, 0x340, t6
                  c.andi       a4, -1
                  addi         s6, s3, -991
                  c.slli       a6, 31
                  sll          s8, s9, a0
                  slt          ra, s6, t1
                  c.srai       s0, 27
                  and          a0, s3, a6
                  add          t0, s6, a6
                  c.srli       a2, 27
                  sll          t5, t5, s0
                  div          s6, a6, a1
                  srai         tp, a4, 14
                  or           s6, zero, a2
                  c.addi       s3, 24
                  divu         s3, a1, s7
                  sll          s2, s8, gp
                  mul          s0, t0, t6
                  sll          s4, s2, t4
                  nop
                  c.or         a4, a4
                  c.mv         a5, s1
                  c.xor        a4, a3
                  add          tp, s1, s11
                  auipc        t0, 227809
                  c.add        a4, sp
                  c.and        s0, a5
                  xor          t4, s6, a3
                  and          t3, s3, s7
                  divu         s7, s8, a5
                  rem          a7, a5, t4
                  c.addi4spn   s1, sp, 880
                  srai         a7, t0, 1
                  nop
                  xori         a4, tp, -1094
                  slt          a6, a7, s7
                  slli         gp, s5, 10
                  c.addi4spn   a0, sp, 32
                  c.andi       a0, -1
                  c.andi       s1, 23
                  div          s9, t1, t2
                  sll          s4, s5, ra
                  sltiu        a4, a4, -1493
                  c.srai       a0, 7
                  sra          s3, a0, s3
                  mulhu        s7, s1, a5
                  mul          s5, a4, a2
                  c.addi       a5, 24
                  c.add        s4, t3
                  c.andi       a0, -1
                  srli         a2, sp, 25
                  or           s4, a1, s8
                  c.and        a5, a5
                  c.li         sp, 26
                  c.mv         s11, s0
                  csrrw        t3, 0x340, zero
                  c.addi4spn   s1, sp, 160
                  c.mv         s6, a7
                  sll          t1, s9, t0
                  c.xor        a0, a3
                  slt          s0, s3, zero
                  ori          a2, gp, -1228
                  c.xor        a4, a5
                  ori          a4, sp, 1644
                  lui          a4, 68231
                  mulhu        s11, t3, s9
                  slti         s2, s4, -1873
                  c.nop
                  div          s9, s7, a7
                  sll          s1, s6, t4
                  c.addi4spn   a4, sp, 640
                  add          sp, t5, ra
                  add          a6, s6, a7
                  csrrc        t4, 0x340, tp
                  c.and        s0, s0
                  c.and        s0, a4
                  remu         t3, t2, s11
                  c.lui        a4, 4
                  srl          a6, t5, s7
                  xor          t4, a0, s0
                  ori          s1, a7, 1808
                  xori         s9, ra, -697
                  c.addi       a2, -1
                  sltiu        t5, t3, -1952
                  rem          s5, t5, s10
                  nop
                  csrrs        t5, 0x340, zero
                  sub          a0, s5, a2
                  c.addi       a5, -1
                  and          s8, t6, t1
                  sra          a0, a2, t3
                  sltiu        gp, gp, 535
                  sll          ra, t0, s8
                  divu         a7, s11, t5
                  srai         s7, a0, 12
                  div          t6, s0, s9
                  c.mv         s11, a3
                  ori          s1, s11, 1661
                  add          s9, a7, sp
                  divu         t6, t4, t2
                  csrrw        gp, 0x340, a4
                  and          t1, s3, a6
                  remu         t6, t6, s9
                  c.add        s7, s1
                  c.lui        a4, 14
                  divu         ra, s7, s9
                  csrrci       gp, 0x340, 17
                  csrrc        s3, 0x340, a7
                  addi         gp, a1, -25
                  c.slli       s1, 17
                  c.addi4spn   a4, sp, 224
                  mulhsu       s3, s6, a6
                  c.srai       s1, 9
                  c.addi4spn   a2, sp, 400
                  rem          sp, a6, s9
                  c.lui        t4, 2
                  csrrwi       s9, 0x340, 13
                  add          ra, gp, s0
                  csrrw        sp, 0x340, a6
                  mulhu        s3, s6, a4
                  div          s1, t3, a3
                  c.xor        s1, s0
                  mul          gp, t2, ra
                  nop
                  c.addi4spn   a4, sp, 864
                  csrrc        gp, 0x340, s11
                  c.andi       a0, -1
                  and          t5, t6, a4
                  sra          t1, t2, t1
                  c.and        s0, s0
                  sltiu        s11, zero, -395
                  mulhsu       gp, zero, t6
                  mulhu        ra, a5, a3
                  and          a6, s6, a1
                  mulh         zero, a3, t6
                  c.sub        a2, a1
                  lui          s3, 715243
                  c.sub        a2, a3
                  auipc        tp, 372747
                  csrrs        a7, 0x340, zero
                  sub          s6, a1, t1
                  c.or         s1, a0
                  srli         s1, t0, 9
                  c.srli       s0, 22
                  c.srai       a5, 14
                  c.addi       s3, -1
                  slli         t4, s3, 5
                  sll          t0, s6, t6
                  auipc        s0, 73126
                  c.srai       a5, 14
                  csrrci       a6, 0x340, 0
                  and          t1, t1, a0
                  c.mv         sp, t3
                  c.addi16sp   sp, -16
                  slti         s11, sp, 1
                  and          zero, a0, s0
                  div          zero, a7, a0
                  c.srai       a2, 25
                  c.nop
                  rem          t3, t3, s11
                  c.sub        a0, a3
                  csrrc        a5, 0x340, zero
                  sll          s1, s3, a7
                  or           a4, a1, s7
                  divu         t6, s1, zero
                  slt          zero, s4, a6
                  csrrwi       a6, 0x340, 19
                  rem          t5, zero, sp
                  lui          gp, 183958
                  c.srli       a4, 26
                  c.mv         t4, s8
                  c.srai       a2, 8
                  c.add        s8, s7
                  addi         a4, a1, -284
                  mulhu        a2, s4, a7
                  c.slli       s8, 6
                  c.addi16sp   sp, 224
                  slti         zero, s2, -1981
                  mulhu        sp, s1, a7
                  srli         s11, ra, 23
                  sll          a0, ra, sp
                  srl          zero, s4, t6
                  csrrci       t1, 0x340, 0
                  addi         a7, s11, -196
                  c.add        a4, s2
                  mulh         s5, zero, t2
                  c.srai       a0, 4
                  rem          s6, a0, t6
                  c.or         a0, s1
                  mul          s4, ra, a0
                  srli         zero, s4, 19
                  csrrc        tp, 0x340, zero
                  remu         sp, t3, s10
                  c.slli       sp, 12
                  c.li         t5, -1
                  ori          a2, t3, -1347
                  c.addi4spn   a5, sp, 16
                  csrrs        s6, 0x340, s4
                  srli         t6, s8, 21
                  slti         s11, tp, 342
                  add          t6, t3, sp
                  xori         s0, s7, -137
                  c.slli       s5, 11
                  auipc        s10, 260765
                  csrrw        gp, 0x340, t3
                  auipc        zero, 1016708
                  lui          t4, 808817
                  c.sub        s0, a4
                  sltu         s1, a6, a0
                  and          s7, a1, t6
                  c.slli       s1, 29
                  csrrwi       s2, 0x340, 0
                  sltiu        s1, t6, -821
                  c.slli       a0, 12
                  sra          tp, t6, s0
                  mulh         s3, s2, a7
                  xor          sp, t3, a3
                  csrrs        t0, 0x340, zero
                  csrrci       s2, 0x340, 5
                  sltu         s9, t0, t3
                  c.nop
                  mulhu        s7, t3, t0
                  lui          s1, 252926
                  mulhu        a4, t0, s11
                  csrrwi       s1, 0x340, 8
                  lui          s8, 986156
                  xori         s10, a6, -971
                  mulhu        t6, s8, a6
                  csrrwi       t6, 0x340, 25
                  mulhu        zero, t1, a1
                  c.or         a0, a1
                  addi         s9, a2, -1002
                  c.lui        t3, 22
                  mulhu        s9, a2, a1
                  c.srli       a5, 11
                  xor          a2, a0, zero
                  lui          s8, 677519
                  rem          t1, s8, a4
                  auipc        zero, 889897
                  divu         s11, s9, gp
                  xori         tp, tp, 95
                  c.addi16sp   sp, -16
                  csrrwi       t3, 0x340, 16
                  sll          a2, a6, t3
                  c.slli       t5, 7
                  div          s10, a2, a4
                  c.srli       a5, 8
                  sub          s3, a4, t4
                  c.sub        a5, s1
                  c.add        t4, s2
                  c.srli       a0, 6
                  div          t3, t6, tp
                  mulh         a2, a6, s5
                  csrrci       zero, 0x340, 0
                  csrrs        s2, 0x340, a2
                  ori          s3, s5, -1407
                  andi         s6, t5, -1956
                  xori         zero, s2, -274
                  sll          a6, a7, s8
                  add          a0, s4, s4
                  ori          s10, a3, -378
                  c.li         s3, 16
                  c.mv         a5, sp
                  c.mv         s0, gp
                  c.nop
                  c.and        a4, a5
                  c.slli       t0, 24
                  csrrc        s11, 0x340, zero
                  addi         a2, s8, 1409
                  c.sub        s0, a5
                  sra          s9, t2, ra
                  srli         sp, a7, 12
                  mul          a0, t6, s4
                  csrrs        s7, 0x340, zero
                  addi         s8, a5, -351
                  srai         s3, ra, 22
                  and          s0, a1, s1
                  srl          s4, a2, t5
                  slti         t3, ra, -2047
                  c.andi       s1, -1
                  and          s0, a2, a3
                  csrrwi       a2, 0x340, 13
                  mulhu        s2, sp, s9
                  add          s9, a2, s11
                  mulhu        tp, a3, s8
                  c.srai       a2, 5
                  and          ra, sp, s8
                  mul          s3, s4, s1
                  c.srli       a2, 21
                  sub          s5, ra, t2
                  c.srai       s1, 25
                  c.andi       a4, 27
                  sll          a0, t4, s3
                  c.nop
                  addi         s4, t4, -317
                  andi         a6, a0, 1895
                  and          a5, s10, t1
                  nop
                  div          zero, s8, sp
                  and          s10, a7, s3
                  sub          s6, s0, s10
                  sra          s1, s11, a4
                  slli         s4, s9, 15
                  or           s8, a3, ra
                  mul          gp, s6, a7
                  csrrsi       a6, 0x340, 26
                  c.xor        s1, a5
                  csrrw        s11, 0x340, t1
                  c.sub        s0, a2
                  c.srai       s0, 17
                  slli         gp, t6, 26
                  or           tp, s0, s8
                  c.mv         s4, s4
                  sra          t1, t3, gp
                  auipc        a5, 790424
                  csrrci       a7, 0x340, 10
                  sltiu        a0, zero, -1279
                  csrrwi       tp, 0x340, 3
                  c.xor        s0, s0
                  c.or         a4, a0
                  c.li         ra, 11
                  div          a7, ra, a7
                  c.mv         ra, tp
                  lui          a6, 993844
                  sll          a7, ra, t1
                  srli         s1, s7, 30
                  addi         s5, s7, -1149
                  csrrc        s6, 0x340, t4
                  csrrc        a6, 0x340, zero
                  c.nop
                  xori         zero, s0, 737
                  c.nop
                  nop
                  csrrw        s3, 0x340, a6
                  remu         s8, a7, t0
                  c.xor        s0, a3
                  sltiu        t3, s2, 724
                  slt          s0, t5, tp
                  ori          s7, s0, -796
                  srli         s2, s11, 2
                  addi         a6, zero, 1455
                  mulhu        a6, ra, s9
                  csrrw        tp, 0x340, gp
                  lui          s5, 202675
                  mulhsu       s10, a1, s1
                  srl          s1, s2, a6
                  ori          s0, a6, -1844
                  remu         gp, a6, s1
                  divu         tp, a5, s11
                  c.srai       a0, 5
                  andi         ra, a1, 304
                  div          a2, t4, a5
                  ori          t1, s9, 418
                  c.or         s0, a0
                  c.or         a4, a2
                  slli         gp, s2, 3
                  csrrw        a0, 0x340, sp
                  slti         a2, s11, 1741
                  c.srai       a0, 9
                  nop
                  c.addi       t1, 23
                  c.or         a5, a2
                  c.mv         s9, t5
                  slli         a0, a2, 14
                  c.addi4spn   a4, sp, 528
                  mulhsu       a5, t2, s11
                  and          t1, s1, tp
                  c.srai       s1, 3
                  lui          s1, 400845
                  sltu         s8, s11, a7
                  ori          s11, s1, 506
                  auipc        s4, 943361
                  c.andi       a5, -1
                  csrrs        a2, 0x340, zero
                  sll          a7, t3, t3
                  sltiu        s1, a7, 593
                  csrrci       a6, 0x340, 9
                  c.xor        a0, a5
                  csrrsi       a6, 0x340, 0
                  c.add        s6, ra
                  c.li         s0, -1
                  ori          tp, a1, -1828
                  divu         a6, a6, a2
                  ori          s11, s6, 1367
                  csrrw        s3, 0x340, a7
                  mul          tp, t5, s11
                  mulhsu       a4, s8, sp
                  c.add        s1, s1
                  c.slli       a4, 19
                  slti         t5, t0, -1893
                  c.slli       a2, 6
                  c.andi       a5, 3
                  mulh         s7, ra, t0
                  csrrwi       t4, 0x340, 19
                  c.addi4spn   a5, sp, 832
                  mulhu        tp, t2, a5
                  sra          t1, tp, t2
                  c.andi       a4, 8
                  c.nop
                  sra          s10, t5, t1
                  c.xor        s0, a1
                  ori          t6, a0, 1380
                  srl          t5, s3, a4
                  c.add        sp, sp
                  csrrci       s2, 0x340, 0
                  c.andi       s1, -1
                  csrrc        gp, 0x340, t4
                  c.srai       a4, 13
                  c.slli       gp, 13
                  div          a6, t3, s3
                  c.and        s1, a1
                  sra          ra, a5, a4
                  csrrci       s0, 0x340, 0
                  c.and        a2, a3
                  slli         s11, t3, 6
                  div          s1, a1, s6
                  add          a2, a5, t0
                  sltiu        t4, s4, 1284
                  or           t5, ra, t0
                  divu         s2, s4, s2
                  c.nop
                  c.addi       s8, 3
                  c.li         a6, 25
                  xor          s0, t5, a0
                  auipc        s2, 686393
                  c.addi16sp   sp, 96
                  div          t1, a3, t1
                  addi         s9, s7, 1892
                  c.sub        a4, a1
                  c.lui        a5, 16
                  rem          t3, s10, s7
                  slt          s3, s11, tp
                  xor          s5, a6, a0
                  c.or         a4, a4
                  slli         zero, s10, 11
                  nop
                  auipc        s7, 180659
                  slti         gp, s4, 1105
                  xor          a0, s3, s2
                  sll          zero, zero, s5
                  mulhu        a7, a5, a1
                  andi         gp, t3, -239
                  c.lui        s4, 24
                  csrrc        s2, 0x340, a2
                  auipc        s11, 226241
                  xor          tp, t1, a6
                  csrrs        a2, 0x340, zero
                  nop
                  csrrwi       s10, 0x340, 9
                  c.slli       s11, 2
                  c.srli       a5, 12
                  c.mv         a4, gp
                  slti         a2, a2, -202
                  mulhu        s1, a6, a5
                  csrrc        s5, 0x340, s5
                  mulhsu       s6, t4, t3
                  xor          s10, s3, s11
                  andi         s8, a4, 159
                  or           s10, s9, s5
                  div          a2, a0, t5
                  xori         t0, t1, 1949
                  csrrc        s11, 0x340, zero
                  srl          ra, s1, t4
                  sra          s5, t4, s3
                  csrrc        gp, 0x340, t2
                  c.slli       ra, 9
                  srai         tp, tp, 27
                  addi         s0, sp, 1650
                  c.li         t5, -1
                  c.mv         t6, sp
                  c.andi       s0, -1
                  slt          t1, t3, a2
                  c.lui        t4, 23
                  auipc        s1, 712090
                  xor          t4, s3, a2
                  addi         t3, a4, 784
                  c.and        a2, a2
                  rem          t0, t5, a2
                  c.and        a0, a2
                  c.andi       a0, 27
                  and          s6, gp, ra
                  add          s8, a7, s11
                  xor          t4, t6, t1
                  c.slli       t6, 29
                  mulhu        s1, a4, s3
                  srai         s1, sp, 30
                  lui          a4, 907786
                  c.sub        s1, a2
                  xori         s10, a5, 1612
                  remu         s9, t2, s0
                  mul          a4, s1, a3
                  ori          s7, s7, -442
                  c.and        a0, a1
                  ori          s1, s4, 1761
                  csrrc        s8, 0x340, t2
                  sltu         a7, gp, s6
                  rem          t0, tp, a5
                  csrrci       a0, 0x340, 15
                  slti         sp, s6, 959
                  c.xor        a0, a5
                  csrrsi       t3, 0x340, 0
                  c.addi4spn   a4, sp, 144
                  c.andi       a0, 27
                  c.addi16sp   sp, -16
                  addi         s2, s1, -88
                  slt          t3, s10, ra
                  c.addi4spn   a4, sp, 240
                  c.add        s2, s11
                  srai         t6, s4, 18
                  c.nop
                  rem          a4, a1, a0
                  divu         a0, s2, s4
                  addi         tp, t4, 2040
                  sltu         s8, s1, t1
                  slti         s4, a1, -538
                  lui          s2, 698336
                  c.li         a6, 1
                  c.addi16sp   sp, 80
                  c.slli       a7, 16
                  c.srli       a4, 8
                  sra          s2, t4, t1
                  and          t3, a4, a0
                  mulhsu       sp, s6, a7
                  add          sp, a7, a3
                  c.lui        a0, 30
                  c.srai       s1, 2
                  nop
                  auipc        gp, 268746
                  c.li         ra, -1
                  csrrwi       a5, 0x340, 0
                  c.sub        a4, a0
                  sra          a7, t3, a0
                  remu         gp, t5, s3
                  xori         zero, a1, -1149
                  and          t6, ra, s0
                  slti         ra, s10, 1272
                  c.and        a4, a2
                  slli         a4, s0, 23
                  rem          t6, s6, s7
                  remu         t6, tp, s0
                  csrrwi       s4, 0x340, 17
                  c.addi4spn   s0, sp, 784
                  xori         a7, a4, 1351
                  csrrci       s3, 0x340, 22
                  csrrs        sp, 0x340, a2
                  csrrsi       t1, 0x340, 26
                  mulh         s10, s11, a6
                  c.addi4spn   a2, sp, 400
                  sltiu        s6, s10, -777
                  c.li         s10, 12
                  csrrs        s1, 0x340, zero
                  ori          t5, a2, 609
                  or           s2, a3, a5
                  c.addi16sp   sp, 368
                  csrrci       t4, 0x340, 0
                  c.addi4spn   a4, sp, 560
                  c.srli       s0, 24
                  xori         a6, t1, 1443
                  c.andi       s1, -1
                  c.addi       a2, -1
                  csrrsi       t6, 0x340, 0
                  xor          t1, tp, sp
                  c.addi       s1, -1
                  c.mv         s5, s6
                  csrrc        t1, 0x340, t6
                  nop
                  div          a7, gp, a4
                  slt          gp, a7, a2
                  sltiu        a4, a2, 127
                  c.nop
                  c.mv         tp, t1
                  mulh         s8, s4, s8
                  sll          t1, t6, s11
                  remu         t5, a4, s0
                  c.sub        a0, a3
                  c.andi       a2, -1
                  c.and        a0, a3
                  mulh         s2, a3, s4
                  c.andi       s0, -1
                  c.addi16sp   sp, 256
                  div          t4, a4, t4
                  csrrwi       a6, 0x340, 14
                  srli         t5, s3, 18
                  mulhsu       s1, s11, t1
                  slli         ra, s6, 26
                  csrrs        s5, 0x340, zero
                  or           s3, s5, a4
                  srl          s4, t0, t0
                  addi         t4, a6, 2027
                  srl          a4, a1, s3
                  c.sub        a5, a2
                  sll          s1, s11, s7
                  remu         s2, gp, s6
                  mulh         s11, s7, t6
                  ori          a7, s7, 904
                  c.add        a2, s1
                  c.lui        s8, 20
                  sltiu        s2, s5, -1109
                  c.and        a4, s1
                  c.xor        s0, a2
                  sub          t6, s1, t3
                  csrrsi       s1, 0x340, 0
                  csrrci       a0, 0x340, 0
                  add          t3, s9, s5
                  srl          t0, t3, a2
                  c.or         a2, a3
                  mulhsu       s4, tp, a3
                  csrrsi       t0, 0x340, 0
                  mulh         s3, gp, s7
                  slti         s7, a7, -961
                  sll          ra, s0, s4
                  divu         sp, t2, s6
                  srli         a2, a3, 2
                  addi         s10, s1, -139
                  c.and        a4, a0
                  c.mv         t5, a7
                  sltiu        a0, t3, -1002
                  andi         s9, t3, -208
                  csrrsi       sp, 0x340, 1
                  mul          ra, a7, gp
                  sll          a6, s9, t4
                  c.addi16sp   sp, 224
                  c.mv         a0, gp
                  c.or         s1, s0
                  add          a4, s3, gp
                  c.nop
                  c.nop
                  and          sp, tp, s9
                  c.srli       s1, 7
                  c.nop
                  lui          s2, 699046
                  c.add        s6, a7
                  c.or         s1, a4
                  xori         tp, t6, 1324
                  add          a5, a2, s5
                  csrrci       tp, 0x340, 21
                  lui          sp, 470825
                  sll          s4, a6, sp
                  or           ra, a7, s3
                  c.or         s1, a0
                  xor          a0, s0, ra
                  divu         t0, s3, s9
                  csrrwi       t3, 0x340, 6
                  srl          s5, gp, s7
                  c.addi16sp   sp, -16
                  c.sub        a5, a1
                  remu         s8, tp, s5
                  or           a5, s3, t3
                  addi         ra, a4, -2039
                  and          s2, ra, s11
                  c.andi       s0, 3
                  c.and        a0, a0
                  rem          s10, s8, a2
                  or           a7, s9, sp
                  csrrc        a7, 0x340, s6
                  nop
                  xori         a0, tp, -359
                  sra          t4, s5, sp
                  sub          s5, t2, t5
                  csrrs        s0, 0x340, zero
                  lui          a4, 1006801
                  c.lui        s2, 24
                  or           s7, s3, a0
                  csrrw        s6, 0x340, a0
                  ori          t0, gp, -487
                  mul          t5, t6, t3
                  add          ra, s7, a1
                  rem          s8, a7, a7
                  sll          s7, s3, s5
                  c.sub        s0, s1
                  csrrw        t5, 0x340, t3
                  and          tp, s9, gp
                  c.li         s5, -1
                  c.addi16sp   sp, -16
                  addi         s1, a3, -1765
                  c.sub        a2, a3
                  mulhsu       s8, s4, sp
                  c.sub        s1, s0
                  c.or         a4, s0
                  and          s10, s3, a2
                  csrrs        s10, 0x340, t1
                  c.mv         a4, gp
                  c.nop
                  c.xor        s1, a2
                  mulh         s3, s5, s8
                  and          sp, t3, s5
                  lui          a5, 977508
                  slli         a4, zero, 31
                  c.and        s0, a4
                  auipc        t3, 804671
                  andi         t6, t2, -483
                  csrrci       a4, 0x340, 0
                  csrrs        zero, 0x340, zero
                  slt          a4, t5, s4
                  mulh         tp, ra, gp
                  mulh         t6, a7, s6
                  c.addi4spn   a0, sp, 640
                  c.srli       a5, 6
                  c.addi       ra, -1
                  srli         a2, ra, 7
                  c.addi4spn   a5, sp, 176
                  csrrs        tp, 0x340, a5
                  c.nop
                  sll          ra, a2, a2
                  csrrsi       s4, 0x340, 28
                  c.srli       s0, 26
                  c.mv         t1, a0
                  and          s4, t5, s4
                  mulhu        tp, s7, a2
                  c.mv         s1, a7
                  slt          s1, gp, t6
                  divu         s1, s8, sp
                  or           t4, t0, s2
                  sll          s6, zero, t4
                  c.and        a4, a0
                  c.sub        s0, a5
                  add          s11, a2, tp
                  c.li         t0, 18
                  remu         s6, sp, t5
                  srai         s10, t4, 28
                  xor          t3, t1, a7
                  csrrw        sp, 0x340, s11
                  csrrci       s11, 0x340, 0
                  c.addi16sp   sp, -16
                  c.sub        a0, a4
                  c.addi16sp   sp, 368
                  sub          t1, s11, a0
                  sll          s7, t6, a5
                  c.mv         s6, a2
                  add          s6, s1, a7
                  auipc        a6, 85423
                  csrrci       t4, 0x340, 0
                  c.slli       s9, 30
                  csrrsi       t6, 0x340, 2
                  c.addi16sp   sp, 464
                  sltiu        t6, a6, 1634
                  sll          zero, t5, ra
                  csrrw        s9, 0x340, s4
                  xor          t0, a5, t0
                  c.add        t5, a7
                  c.mv         a7, s4
                  lui          a7, 574409
                  csrrs        s4, 0x340, t2
                  remu         a4, a3, s8
                  c.xor        a4, a2
                  c.srli       a0, 11
                  c.lui        s0, 25
                  auipc        s1, 917982
                  slti         a6, s4, -873
                  addi         s9, s0, -1585
                  c.slli       s7, 3
                  remu         s2, sp, zero
                  div          a6, a0, t2
                  slti         s3, t1, -1102
                  c.nop
                  lui          sp, 1046553
                  csrrwi       a6, 0x340, 28
                  divu         s4, a3, s5
                  div          t0, s11, t2
                  mulhsu       tp, s3, s11
                  c.addi16sp   sp, -16
                  xor          a7, s11, s8
                  divu         s8, s2, s3
                  c.sub        s0, a4
                  mulhsu       gp, s4, s7
                  slt          a6, a6, s10
                  csrrc        t4, 0x340, zero
                  mulhsu       ra, s7, s9
                  add          zero, ra, s6
                  srl          s9, t4, t1
                  slli         t0, t6, 28
                  ori          t1, a0, 1808
                  csrrc        sp, 0x340, s10
                  lui          s8, 474009
                  lui          t3, 557353
                  csrrci       a7, 0x340, 13
                  andi         t1, a0, 1700
                  c.mv         tp, a6
                  c.nop
                  csrrs        s1, 0x340, zero
                  remu         s3, s4, a4
                  c.andi       a4, -1
                  addi         a0, s7, -171
                  csrrc        s9, 0x340, zero
                  srl          t1, t6, t4
                  csrrwi       s11, 0x340, 23
                  srl          a4, s10, tp
                  c.li         a5, 5
                  csrrci       tp, 0x340, 14
                  c.mv         s3, t6
                  auipc        s10, 784158
                  rem          a6, s5, a6
                  c.srli       a5, 11
                  slti         s8, t1, -1680
                  rem          a0, t6, t4
                  mulhsu       s9, s7, s11
                  c.nop
                  lui          s8, 527218
                  mulhsu       a4, t1, gp
                  or           zero, s10, s4
                  addi         sp, s11, -221
                  or           a7, t4, s10
                  auipc        t0, 757043
                  srli         a5, sp, 2
                  slt          a4, s11, t0
                  c.slli       s2, 26
                  c.lui        s10, 10
                  mulh         s0, gp, a2
                  mulhu        s1, t0, a3
                  xori         gp, t2, 1181
                  c.srli       s1, 1
                  sra          zero, gp, a7
                  remu         s4, t1, s7
                  srl          t0, a3, a1
                  c.andi       s1, 4
                  c.lui        s2, 5
                  sub          s6, s4, a2
                  c.add        s10, s5
                  c.mv         a6, a5
                  c.lui        t1, 21
                  c.srai       a5, 13
                  sll          sp, t2, s7
                  sra          a6, a5, a3
                  srli         a7, t2, 30
                  auipc        a0, 495973
                  sub          s3, s4, s9
                  xori         s1, a5, -1902
                  or           ra, a1, a0
                  csrrwi       s10, 0x340, 0
                  csrrc        t1, 0x340, zero
                  c.nop
                  c.li         a2, 6
                  slt          a6, a1, s7
                  c.srai       a4, 13
                  c.nop
                  sltu         s0, a0, s7
                  auipc        s9, 1032450
                  srai         s1, s5, 0
                  c.addi16sp   sp, -16
                  sltiu        s9, s9, -822
                  c.srai       a0, 16
                  c.andi       a2, -1
                  c.srli       a2, 10
                  xor          s9, s5, a5
                  c.srli       s0, 20
                  srli         a4, t1, 12
                  slli         t1, zero, 1
                  sltiu        s0, s6, -2027
                  sra          s0, t1, t5
                  c.srli       a0, 5
                  c.slli       a2, 4
                  c.li         t1, 25
                  mul          a7, gp, zero
                  mulhsu       s11, a7, zero
                  div          a2, s11, t0
                  auipc        t5, 706822
                  c.addi       s7, -1
                  sltu         t0, a1, a1
                  srli         s7, tp, 24
                  and          s6, zero, s11
                  sll          t5, a0, t0
                  c.addi4spn   s1, sp, 592
                  divu         t3, a0, a7
                  csrrc        s1, 0x340, zero
                  csrrwi       s3, 0x340, 31
                  nop
                  addi         a4, a1, 100
                  mulh         t4, s5, a1
                  c.li         s11, 27
                  c.addi       s6, -1
                  xori         ra, t3, 398
                  c.addi4spn   s1, sp, 560
                  srl          s11, tp, t4
                  slli         a6, zero, 20
                  c.or         s0, a2
                  c.mv         t0, t5
                  csrrs        a2, 0x340, zero
                  c.sub        a2, s1
                  c.addi4spn   a4, sp, 784
                  srl          tp, a1, a4
                  c.add        t6, s1
                  or           a6, t3, a0
                  c.lui        a4, 9
                  srai         s7, s11, 14
                  c.add        sp, ra
                  c.add        s0, sp
                  c.and        a4, a2
                  mulhu        t1, sp, a2
                  c.lui        s8, 5
                  c.srai       a4, 27
                  or           s1, t3, s6
                  c.or         a4, a5
                  remu         a4, t6, s8
                  sll          a6, t1, zero
                  mulhsu       s9, sp, s0
                  srai         t5, s1, 11
                  c.addi4spn   a4, sp, 816
                  and          s2, a4, a1
                  sltiu        a7, s8, -1190
                  slt          s0, s1, t3
                  csrrsi       t3, 0x340, 22
                  sltu         t4, s5, s5
                  c.srli       a2, 19
                  csrrw        s4, 0x340, s3
                  csrrc        t6, 0x340, s8
                  rem          ra, s0, sp
                  div          s2, t2, gp
                  nop
                  c.srli       a5, 24
                  srli         s11, a6, 14
                  csrrc        s0, 0x340, t5
                  csrrw        s9, 0x340, s1
                  sub          t3, s3, s11
                  mul          a6, t0, a5
                  sll          t6, s2, s1
                  sll          s11, s2, zero
                  c.lui        s3, 5
                  or           gp, a5, s10
                  auipc        t4, 444013
                  xor          s11, s1, s10
                  csrrw        s1, 0x340, s7
                  and          t3, a2, t1
                  add          tp, a2, tp
                  mulhsu       t5, s7, s4
                  sltu         a2, a0, t1
                  c.sub        a2, s1
                  c.mv         a5, tp
                  slt          ra, t5, t0
                  addi         tp, a5, -467
                  xor          a7, s9, gp
                  c.addi16sp   sp, 448
                  auipc        a4, 598421
                  and          s7, tp, gp
                  slt          s11, a0, sp
                  andi         t1, s11, 1636
                  slti         s8, s11, -1499
                  c.add        t5, gp
                  slti         a2, s3, 1234
                  sub          s4, t4, gp
                  nop
                  sltu         zero, s7, s6
                  c.srai       s0, 7
                  c.mv         t4, t2
                  c.addi16sp   sp, -16
                  csrrc        s5, 0x340, a3
                  xori         s6, s8, -1170
                  csrrci       s11, 0x340, 0
                  c.and        a0, a5
                  mulhu        t3, t5, ra
                  nop
                  and          a4, a0, a1
                  xor          a4, a5, a7
                  c.addi       a0, -1
                  xor          s11, s3, t2
                  c.mv         s8, s8
                  c.nop
                  c.and        a5, s1
                  c.addi16sp   sp, 112
                  csrrc        tp, 0x340, zero
                  csrrsi       s8, 0x340, 0
                  srl          s9, sp, s8
                  c.li         t3, 28
                  lui          s5, 894016
                  andi         a2, t3, 652
                  csrrc        ra, 0x340, t1
                  slli         a5, s3, 26
                  remu         s2, t0, s5
                  rem          a6, a2, s10
                  xori         s5, a3, -1214
                  addi         ra, a2, -1279
                  srai         t6, t1, 16
                  divu         a5, s5, a1
                  c.addi       ra, -1
                  divu         a7, t4, s10
                  csrrsi       t3, 0x340, 0
                  c.mv         t5, tp
                  xori         a6, tp, -309
                  rem          t3, a2, t5
                  remu         tp, a5, s9
                  or           t4, t0, s9
                  remu         ra, s3, t3
                  c.srli       a4, 25
                  slli         s9, t2, 23
                  csrrc        t6, 0x340, zero
                  c.lui        s9, 19
                  or           s3, ra, s4
                  add          t6, s8, t3
                  rem          tp, s8, ra
                  lui          s6, 309731
                  c.addi       s6, -1
                  srli         t1, s4, 2
                  mulhsu       t1, s3, s10
                  srl          a2, ra, a4
                  sltu         t1, t4, t3
                  c.slli       s2, 13
                  slti         zero, zero, 1357
                  csrrw        t6, 0x340, ra
                  divu         s5, s0, a6
                  sltu         t1, a4, t1
                  srl          s6, a6, t5
                  c.li         t1, 5
                  nop
                  c.li         sp, -1
                  srli         s7, tp, 15
                  mulh         s4, s7, s0
                  slli         a0, gp, 25
                  mulhu        s3, t3, s1
                  lui          s3, 176468
                  mul          a7, a5, t2
                  c.andi       a0, 9
                  andi         a0, a0, -1758
                  rem          s2, t5, s4
                  nop
                  ori          s10, a4, -981
                  c.and        a5, s0
                  sltu         s11, a6, gp
                  sra          s1, t6, s0
                  csrrs        s10, 0x340, zero
                  add          a4, s2, s3
                  c.add        sp, a6
                  slti         s4, t1, 1595
                  csrrsi       s7, 0x340, 2
                  addi         gp, zero, -109
                  srai         a7, s2, 1
                  sltiu        s3, t3, -378
                  divu         tp, t1, t2
                  mulhu        s9, a0, s0
                  srai         t4, a5, 6
                  rem          a6, s6, s0
                  srl          s5, s2, a6
                  rem          s6, t1, s3
                  sltiu        sp, s5, -1431
                  csrrwi       t3, 0x340, 20
                  mulhu        s10, a0, a5
                  srai         a4, a2, 23
                  csrrs        gp, 0x340, zero
                  c.and        s0, a3
                  c.andi       s1, 4
                  sltiu        s7, a6, -873
                  nop
                  csrrw        t3, 0x340, s5
                  c.add        t5, ra
                  c.sub        a2, s0
                  csrrwi       t0, 0x340, 13
                  srai         s0, a5, 21
                  xor          s1, a4, ra
                  c.srli       a0, 8
                  c.mv         t1, a5
                  c.lui        a4, 14
                  c.andi       a2, 27
                  and          s9, gp, a1
                  srai         s2, s4, 10
                  csrrci       a7, 0x340, 25
                  sra          s10, s8, s10
                  mul          s6, s7, a3
                  slt          s0, s9, a2
                  mulhu        a4, a2, s5
                  csrrw        tp, 0x340, s7
                  mulh         t5, a2, t1
                  sub          s3, t5, s10
                  csrrwi       s8, 0x340, 13
                  c.srli       a0, 1
                  c.srai       a0, 26
                  srli         s9, t0, 6
                  nop
                  c.addi16sp   sp, 144
                  nop
                  c.lui        a0, 10
                  srai         s7, zero, 9
                  sub          t1, a5, s7
                  addi         a2, s2, 342
                  csrrc        s1, 0x340, zero
                  c.addi       s3, 17
                  mul          t1, tp, a2
                  mulhsu       zero, ra, a6
                  c.li         s2, 7
                  sll          s10, a4, s7
                  sll          t1, t1, a4
                  mulhsu       s8, a4, a2
                  divu         t6, s5, s1
                  add          a2, s1, t2
                  c.or         s0, s0
                  csrrci       t1, 0x340, 29
                  srai         t1, a3, 2
                  auipc        s3, 451589
                  mulhu        sp, t4, t2
                  nop
                  c.addi16sp   sp, -16
                  csrrs        s7, 0x340, zero
                  slti         a6, s11, -948
                  c.addi4spn   a5, sp, 976
                  sll          s9, s2, t4
                  srai         s7, t6, 30
                  csrrc        gp, 0x340, zero
                  slli         s10, a7, 11
                  c.addi4spn   s1, sp, 176
                  csrrw        ra, 0x340, t0
                  add          s5, sp, s9
                  csrrsi       t1, 0x340, 14
                  c.and        a0, s0
                  c.andi       a0, -1
                  slli         a0, a6, 15
                  mulhu        a0, s3, s2
                  c.and        a2, a3
                  mul          a4, a7, a0
                  sll          a5, t4, t5
                  xor          t1, s7, s2
                  c.srai       a0, 26
                  c.add        gp, a1
                  xori         s6, gp, -351
                  nop
                  c.addi4spn   a2, sp, 144
                  csrrc        t6, 0x340, zero
                  rem          s5, t0, a3
                  srai         s6, sp, 12
                  sltiu        s4, a4, -2030
                  c.and        a0, s1
                  srai         s11, t6, 6
                  divu         s2, ra, s7
                  c.addi4spn   a4, sp, 896
                  csrrs        s0, 0x340, zero
                  c.addi       a0, 30
                  srl          s6, a7, a4
                  c.xor        a0, s0
                  csrrwi       sp, 0x340, 29
                  mulhsu       t1, a0, s11
                  and          a2, tp, s4
                  xori         s11, t6, -982
                  c.srai       a5, 23
                  c.andi       a5, -1
                  sltu         s10, a4, s0
                  mulhsu       zero, t0, s6
                  rem          s3, t0, a6
                  c.addi       s2, 29
                  c.lui        t6, 23
                  sltu         s10, a3, s11
                  c.sub        a5, s1
                  and          s4, tp, a6
                  sub          t4, t1, t4
                  addi         s6, a0, 1572
                  c.slli       a7, 12
                  c.addi16sp   sp, 80
                  and          s9, s0, a1
                  c.addi       s7, -1
                  mulhsu       t3, a0, t6
                  divu         s6, a1, sp
                  srl          s8, t1, a4
                  srai         ra, a7, 25
                  auipc        s3, 613037
                  csrrw        t5, 0x340, t5
                  and          s1, t1, gp
                  div          t5, tp, tp
                  sub          t5, ra, t6
                  mulhsu       s8, s5, t4
                  addi         t1, s3, 939
                  remu         s4, t6, s11
                  andi         t0, t1, -1322
                  mulh         s3, a3, s9
                  srai         a7, s7, 31
                  csrrw        s6, 0x340, s0
                  csrrwi       a6, 0x340, 12
                  csrrc        s3, 0x340, zero
                  addi         s8, gp, -581
                  slli         s5, tp, 24
                  slt          s5, s10, s3
                  c.slli       s1, 30
                  c.mv         a5, s9
                  c.nop
                  div          s4, s6, ra
                  sll          ra, s9, s5
                  remu         t1, s10, t5
                  div          tp, s1, s4
                  c.slli       t6, 21
                  srai         zero, ra, 17
                  divu         gp, ra, a5
                  xori         s4, s10, 973
                  div          t4, a3, zero
                  c.lui        tp, 26
                  c.nop
                  csrrc        t1, 0x340, a0
                  c.li         s11, 7
                  c.mv         t0, s3
                  c.addi4spn   a0, sp, 720
                  c.sub        a0, a2
                  auipc        a5, 355005
                  sra          t4, t0, a7
                  xori         tp, a4, -293
                  c.slli       t5, 17
                  c.add        t0, t0
                  slti         s2, a2, 1473
                  c.srli       a5, 31
                  c.andi       a5, 13
                  srli         t0, a0, 19
                  c.srai       s1, 23
                  c.andi       s1, 22
                  c.addi16sp   sp, 304
                  csrrw        s2, 0x340, s3
                  c.srli       a5, 15
                  c.or         s0, s1
                  c.sub        a0, s1
                  c.mv         s10, a6
                  lui          t5, 821951
                  nop
                  mulhu        s10, a1, a7
                  c.xor        s0, a4
                  c.sub        s0, a3
                  csrrci       t0, 0x340, 15
                  xor          tp, s6, ra
                  srl          a5, t2, t4
                  c.srli       a2, 7
                  slli         s0, s5, 31
                  srli         a2, s2, 2
                  c.sub        s1, s0
                  csrrci       t0, 0x340, 0
                  andi         s5, a2, -1458
                  srli         a0, a6, 12
                  mulhu        t1, s1, a3
                  sltiu        zero, t3, 1718
                  div          t6, tp, t0
                  mulhu        s3, s2, t2
                  c.addi4spn   a0, sp, 144
                  xor          s0, t6, t5
                  c.xor        s0, a4
                  mulhu        s11, s8, zero
                  xor          s9, s11, a0
                  addi         a0, a4, -43
                  srai         tp, sp, 16
                  c.andi       a5, 14
                  auipc        s6, 205049
                  c.and        a2, a3
                  remu         s1, sp, s7
                  addi         s2, a1, 1936
                  csrrwi       a0, 0x340, 0
                  c.xor        a2, a0
                  c.sub        s0, a4
                  csrrs        a7, 0x340, zero
                  remu         sp, s6, sp
                  c.or         s1, s0
                  lui          s10, 628776
                  csrrci       s8, 0x340, 1
                  c.srli       a5, 10
                  xori         t5, a2, 712
                  sub          s8, ra, a0
                  divu         s7, s10, t1
                  addi         tp, a4, -213
                  c.addi4spn   a0, sp, 752
                  csrrw        s9, 0x340, t3
                  or           s10, a7, t5
                  andi         t0, s10, -1718
                  sra          a0, a2, a7
                  c.xor        a5, a3
                  sll          a5, s8, t6
                  c.srai       a0, 31
                  sra          t6, s8, s7
                  mulh         s7, s1, a6
                  c.addi16sp   sp, -16
                  csrrsi       t1, 0x340, 2
                  auipc        s11, 436865
                  c.addi4spn   s1, sp, 464
                  csrrs        s1, 0x340, s0
                  csrrw        t5, 0x340, s9
                  c.andi       s1, -1
                  c.mv         a5, t6
                  mulhu        s9, s8, s8
                  c.srli       s0, 1
                  remu         gp, t1, s8
                  xor          a7, s4, t3
                  c.xor        a5, a4
                  c.addi4spn   a2, sp, 48
                  mulhu        s4, t5, a3
                  c.srli       a0, 24
                  lui          s10, 248880
                  mulhu        s2, s6, a1
                  sltiu        t4, s1, -1901
                  c.srai       a5, 26
                  xor          t1, s4, s6
                  srli         a2, gp, 16
                  c.slli       ra, 22
                  slli         s6, a1, 7
                  slti         s6, s0, 196
                  slt          s0, s9, s4
                  lui          s9, 409886
                  div          a4, tp, s5
                  mulhsu       s9, s11, s11
                  divu         a0, t2, a1
                  slti         s3, t1, 858
                  csrrw        s9, 0x340, a6
                  sra          t5, s4, t0
                  xor          ra, t1, a4
                  mul          a4, a5, a0
                  srli         t0, s8, 12
                  rem          s6, t0, s2
                  mulh         a7, a6, t5
                  csrrwi       a6, 0x340, 13
                  andi         a2, t3, 1681
                  c.xor        a4, s0
                  c.lui        s7, 24
                  nop
                  or           t1, a0, s9
                  mulhsu       t0, s9, t4
                  nop
                  mulh         a6, s1, a0
                  srai         s1, s10, 30
                  csrrwi       s10, 0x340, 24
                  addi         s3, t3, 1264
                  c.addi       s2, -1
                  srl          zero, tp, a1
                  sll          s4, a0, gp
                  c.andi       a5, -1
                  srl          tp, t1, s5
                  div          s1, s9, s5
                  mulhu        sp, t1, s2
                  sll          t5, s7, t6
                  remu         t0, t5, gp
                  c.xor        a2, s1
                  c.addi16sp   sp, -16
                  srli         s6, s0, 24
                  srl          tp, t6, s5
                  auipc        zero, 120987
                  slli         a2, a5, 2
                  sra          s11, a2, s6
                  srai         s7, gp, 6
                  ori          t3, a5, -1439
                  nop
                  c.srai       a5, 26
                  srl          t1, t0, t2
                  csrrs        sp, 0x340, zero
                  c.or         a0, a1
                  slti         gp, a7, 1039
                  csrrci       t4, 0x340, 0
                  c.srai       s1, 9
                  mulh         s8, a5, a0
                  csrrsi       s10, 0x340, 28
                  slti         a2, a6, 1787
                  csrrc        t3, 0x340, zero
                  and          t1, a6, s8
                  c.addi       s2, -1
                  nop
                  csrrw        t5, 0x340, a2
                  csrrwi       t3, 0x340, 11
                  div          s10, a2, t4
                  c.lui        t4, 21
                  c.andi       a0, -1
                  sub          gp, s9, s0
                  lui          s7, 290949
                  c.xor        a2, a5
                  c.sub        a2, a4
                  div          s5, s2, s7
                  divu         s10, t6, s3
                  c.slli       t5, 14
                  srli         a5, t4, 3
                  andi         tp, t6, 1803
                  xori         s2, tp, 1650
                  c.lui        s11, 27
                  div          zero, s6, ra
                  c.andi       a2, 19
                  c.addi       t0, -1
                  div          s7, a1, t1
                  andi         a2, a6, 1882
                  mulhu        a5, t5, t1
                  sra          ra, t1, s10
                  srl          s5, t5, s2
                  mulh         s1, t1, s5
                  remu         t4, tp, a7
                  c.add        t0, a3
                  c.nop
                  mulhsu       s2, zero, s8
                  c.srai       a4, 29
                  andi         s1, t6, -1390
                  c.srai       s1, 2
                  csrrw        gp, 0x340, s3
                  divu         t1, t3, t3
                  c.sub        a5, s0
                  sub          t6, s6, a0
                  csrrci       s1, 0x340, 30
                  auipc        t4, 976225
                  srai         s7, s7, 25
                  xori         t0, t4, -1010
                  c.or         a2, a5
                  divu         s3, a0, s6
                  sub          a4, a7, sp
                  csrrw        a7, 0x340, t4
                  or           sp, s10, a3
                  c.sub        a0, a0
                  slti         t5, s9, 1705
                  srli         s1, s5, 10
                  csrrci       a2, 0x340, 0
                  c.addi16sp   sp, 176
                  srli         s5, a5, 13
                  c.li         t3, -1
                  sll          t4, t6, sp
                  slli         t3, sp, 2
                  c.or         s1, a3
                  sra          a5, sp, t5
                  sra          t1, a7, tp
                  csrrwi       s7, 0x340, 10
                  slt          sp, tp, s10
                  c.add        s5, t0
                  remu         s5, a0, s10
                  sltu         a5, s8, s7
                  c.xor        a2, a1
                  auipc        a0, 519088
                  xori         s2, t5, -689
                  add          tp, t2, t0
                  csrrwi       a4, 0x340, 7
                  c.slli       s1, 17
                  srai         s10, tp, 23
                  xori         t0, t2, 710
                  csrrs        t4, 0x340, zero
                  addi         s3, gp, -503
                  nop
                  remu         t1, a4, s6
                  mul          s4, s11, sp
                  c.addi4spn   a5, sp, 304
                  c.add        s0, s6
                  c.nop
                  c.and        a2, a2
                  sll          sp, t2, a0
                  c.addi       s0, -1
                  srai         s6, a2, 12
                  auipc        s6, 997446
                  c.or         s0, a5
                  csrrc        s10, 0x340, zero
                  c.and        a5, a5
                  c.or         a4, a0
                  csrrc        s5, 0x340, zero
                  csrrsi       t1, 0x340, 28
                  csrrwi       ra, 0x340, 2
                  remu         t6, a1, a4
                  csrrwi       s7, 0x340, 27
                  c.li         s5, -1
                  c.lui        t4, 14
                  sll          t4, tp, a6
                  sub          a7, t6, tp
                  slt          s4, sp, a1
                  c.addi       a6, 5
                  xori         s7, t3, -2044
                  c.andi       s0, 14
                  c.xor        s1, a1
                  sltu         t0, a6, s10
                  c.addi       s4, 9
                  csrrs        a5, 0x340, zero
                  csrrw        s2, 0x340, s0
                  csrrw        s10, 0x340, s9
                  mulhu        t6, t2, a5
                  csrrwi       s8, 0x340, 3
                  add          t1, s11, zero
                  c.addi       s10, -1
                  divu         t3, a0, t5
                  c.addi16sp   sp, 32
                  c.lui        t4, 2
                  c.addi16sp   sp, -16
                  csrrwi       a6, 0x340, 17
                  csrrc        s9, 0x340, s9
                  c.lui        a5, 1
                  andi         s10, zero, 1011
                  lui          t4, 604541
                  c.slli       t6, 27
                  srai         s7, s2, 26
                  c.lui        s6, 15
                  csrrci       s6, 0x340, 0
                  c.mv         a5, a5
                  remu         t0, tp, ra
                  slti         s9, s8, 2002
                  add          s9, gp, a1
                  csrrw        s6, 0x340, a1
                  divu         s0, a4, a1
                  c.xor        a0, s1
                  addi         s5, gp, 137
                  c.andi       s0, 2
                  c.addi       a4, -1
                  c.lui        s11, 18
                  srai         s3, s6, 1
                  slli         a2, s2, 22
                  srli         t5, s10, 8
                  csrrc        s9, 0x340, zero
                  c.srai       a4, 13
                  csrrwi       t1, 0x340, 23
                  csrrs        s9, 0x340, s3
                  srai         a0, t3, 23
                  sll          s6, s8, t6
                  remu         a2, t4, s6
                  c.srai       s0, 23
                  auipc        s0, 768641
                  c.srli       a0, 7
                  c.mv         s5, s5
                  c.nop
                  srli         s9, s2, 3
                  c.addi16sp   sp, 496
                  c.addi       s0, 29
                  c.addi       a0, -1
                  csrrc        s10, 0x340, zero
                  mulhu        t0, a7, a7
                  lui          a4, 629058
                  c.or         a0, a1
                  c.lui        t5, 26
                  addi         s9, s9, 745
                  c.srli       a5, 5
                  sub          s3, a3, a4
                  c.xor        a4, s1
                  c.nop
                  c.nop
                  csrrc        t0, 0x340, zero
                  c.sub        a5, a5
                  auipc        gp, 785664
                  xori         s5, t4, 15
                  csrrc        t5, 0x340, s3
                  lui          a5, 414346
                  andi         gp, s9, 1274
                  csrrsi       t1, 0x340, 0
                  mulhsu       zero, s9, s9
                  csrrw        a4, 0x340, t4
                  c.xor        a4, s0
                  slli         ra, a5, 17
                  slt          s1, a4, a4
                  sltiu        s7, a0, 367
                  mulhu        t5, a5, s8
                  c.srai       a5, 8
                  sltiu        s2, t1, -1112
                  c.or         a2, a2
                  divu         sp, t0, s3
                  c.srai       a4, 9
                  mul          t4, a1, t4
                  srai         sp, t4, 28
                  addi         sp, a3, -1240
                  remu         a0, t0, sp
                  c.srli       a5, 31
                  andi         a7, a0, 516
                  c.xor        s1, a5
                  csrrw        a6, 0x340, s9
                  csrrw        tp, 0x340, s5
                  and          tp, s0, t1
                  slli         s4, a7, 0
                  mul          t0, s2, s2
                  mulhu        s9, t1, gp
                  or           t5, s0, s2
                  sra          s6, a2, t0
                  lui          s2, 457930
                  divu         s11, a2, s6
                  srai         t3, s5, 5
                  lui          s2, 611498
                  andi         s5, s3, -1205
                  c.srai       a4, 29
                  c.addi4spn   a4, sp, 144
                  divu         s0, s6, t5
                  mulhu        tp, a5, s2
                  srai         t3, t5, 22
                  xor          a2, s6, gp
                  divu         a2, s4, t5
                  xori         t6, t6, -1590
                  csrrci       ra, 0x340, 0
                  c.add        a6, a6
                  c.or         a4, s1
                  csrrs        s7, 0x340, zero
                  c.xor        a0, a4
                  srai         a0, sp, 9
                  remu         s1, s3, t1
                  sltiu        s2, tp, 1147
                  c.sub        a2, a2
                  or           s1, a4, s4
                  c.li         s10, 22
                  remu         s9, a5, tp
                  c.srai       a5, 29
                  c.addi       s5, 7
                  mulh         s3, a2, t2
                  c.nop
                  c.mv         s5, s7
                  divu         s4, t6, sp
                  slti         sp, a0, 853
                  div          t6, s0, s6
                  rem          gp, s9, zero
                  mulh         s7, a7, s1
                  c.mv         s5, tp
                  c.srai       a5, 4
                  c.or         a2, a2
                  c.nop
                  slt          a2, a3, s0
                  slt          s9, s3, a6
                  c.li         s1, -1
                  c.mv         s10, a0
                  srl          s9, t0, a3
                  c.sub        a0, a4
                  remu         t4, s0, tp
                  c.xor        a5, a5
                  c.xor        a2, a1
                  xori         tp, s8, 1391
                  c.addi       s6, -1
                  csrrw        ra, 0x340, t0
                  sub          ra, a7, ra
                  c.addi4spn   a5, sp, 208
                  c.addi16sp   sp, 256
                  c.srli       s1, 13
                  slt          s8, a7, s0
                  mulh         s3, s1, s10
                  c.add        t5, a1
                  divu         s3, a5, s2
                  lui          t1, 759410
                  srli         s9, s4, 19
                  c.addi4spn   a2, sp, 240
                  sra          a5, s6, a4
                  csrrw        zero, 0x340, zero
                  mulhsu       t3, s6, t4
                  sltu         s8, a1, s10
                  csrrw        t6, 0x340, a5
                  rem          s7, s5, a5
                  c.slli       t3, 31
                  c.add        a5, a5
                  c.nop
                  c.add        s5, a1
                  or           zero, ra, t2
                  csrrsi       t0, 0x340, 0
                  c.mv         a0, s2
                  c.addi       s2, 1
                  mul          t6, s7, t4
                  mulhsu       s7, a6, s11
                  div          s8, t6, a5
                  slli         a4, s1, 8
                  c.lui        t3, 5
                  la x7, test_done
                  jalr x0, x7, 0
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
                  li x27, 0x8ffffffc
                  li x18, 0xd
                  slli x18, x18, 8
                  addi x18, x18, 0x0
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x342
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x342
                  sw x18, 0(x27)
                  csrr  x18, 0x341
                  addi  x18, x18, 4
                  csrw  0x341, x18
                  add x11, x13, zero
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
                  add x13, x11, zero
                  lw  x11, (x13)
                  addi x13, x13, 4
                  mret

illegal_instr_handler:
                  li x27, 0x8ffffffc
                  li x18, 0xa
                  slli x18, x18, 8
                  addi x18, x18, 0x0
                  sw x18, 0(x27)
                  li x27, 0x8ffffffc
                  li x18, 0x342
                  slli x18, x18, 8
                  addi x18, x18, 0x3
                  sw x18, 0(x27)
                  csrr x18, 0x342
                  sw x18, 0(x27)
                  csrr  x18, 0x341
                  addi  x18, x18, 4
                  csrw  0x341, x18
                  add x11, x13, zero
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
                  add x13, x11, zero
                  lw  x11, (x13)
                  addi x13, x13, 4
                  mret

pt_fault_handler: 
                  li x27, 0x8ffffffc
                  li x18, 0x8
                  slli x18, x18, 8
                  addi x18, x18, 0x0
                  sw x18, 0(x27)
                  nop

.align 2
mmode_intr_handler:
                  csrr  x18, 0x300 # MSTATUS;
                  csrr  x18, 0x304 # MIE;
                  csrr  x18, 0x344 # MIP;
                  csrrc x18, 0x344, x18 # MIP;
                  li x27, 0x8ffffffc
                  li x18, 0x7
                  slli x18, x18, 8
                  addi x18, x18, 0x0
                  sw x18, 0(x27)
                  add x11, x13, zero
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
                  add x13, x11, zero
                  lw  x11, (x13)
                  addi x13, x13, 4
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
