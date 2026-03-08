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
                  li x26, 0x40001106
                  csrw 0x301, x26
kernel_sp:        
                  la x15, kernel_stack_end

trap_vec_init:    
                  la x26, mtvec_handler
                  ori x26, x26, 1
                  csrw 0x305, x26 # MTVEC

pmp_setup:        
                  csrwi 0x747, 4
                  la x7, main
                  li x26, 0x0
                  add x7, x7, x26
                  srli x7, x7, 2
                  csrw 0x3b0, x7
                  la x7, main
                  li x26, 0x11111111
                  add x7, x7, x26
                  srli x7, x7, 2
                  csrw 0x3b1, x7
                  la x7, main
                  li x26, 0x22222222
                  add x7, x7, x26
                  srli x7, x7, 2
                  csrw 0x3b2, x7
                  la x7, main
                  li x26, 0x33333333
                  add x7, x7, x26
                  srli x7, x7, 2
                  csrw 0x3b3, x7
                  li x7, 0xf0f0f0f
                  csrw 0x3a0, x7
                  la x7, main
                  li x26, 0x44444444
                  add x7, x7, x26
                  srli x7, x7, 2
                  csrw 0x3b4, x7
                  la x7, main
                  li x26, 0x55555555
                  add x7, x7, x26
                  srli x7, x7, 2
                  csrw 0x3b5, x7
                  la x7, main
                  li x26, 0x66666666
                  add x7, x7, x26
                  srli x7, x7, 2
                  csrw 0x3b6, x7
                  la x7, main
                  li x26, 0x77777777
                  add x7, x7, x26
                  srli x7, x7, 2
                  csrw 0x3b7, x7
                  li x7, 0xf0f0f0f
                  csrw 0x3a1, x7
                  la x7, main
                  li x26, 0x88888888
                  add x7, x7, x26
                  srli x7, x7, 2
                  csrw 0x3b8, x7
                  la x7, main
                  li x26, 0x99999999
                  add x7, x7, x26
                  srli x7, x7, 2
                  csrw 0x3b9, x7
                  la x7, main
                  li x26, 0xaaaaaaaa
                  add x7, x7, x26
                  srli x7, x7, 2
                  csrw 0x3ba, x7
                  la x7, main
                  li x26, 0xbbbbbbbb
                  add x7, x7, x26
                  srli x7, x7, 2
                  csrw 0x3bb, x7
                  li x7, 0xf0f0f0f
                  csrw 0x3a2, x7
                  la x7, main
                  li x26, 0xcccccccc
                  add x7, x7, x26
                  srli x7, x7, 2
                  csrw 0x3bc, x7
                  la x7, main
                  li x26, 0xdddddddd
                  add x7, x7, x26
                  srli x7, x7, 2
                  csrw 0x3bd, x7
                  la x7, main
                  li x26, 0xeeeeeeee
                  add x7, x7, x26
                  srli x7, x7, 2
                  csrw 0x3be, x7
                  la x7, main
                  li x26, 0xffffffff
                  add x7, x7, x26
                  srli x7, x7, 2
                  csrw 0x3bf, x7
                  li x7, 0xf0f0f0f
                  csrw 0x3a3, x7

mepc_setup:       
                  la x26, init
                  csrw 0x341, x26

custom_csr_setup: 
                  csrwi 0x7c0, 1

init_machine_mode:
                  li x26, 0x1800
                  csrw 0x300, x26 # MSTATUS
                  li x26, 0x0
                  csrw 0x304, x26 # MIE
                  li x4, 0x8ffffffc
                  li x26, 0x300
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x300
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x304
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x304
                  sw x26, 0(x4)
                  mret
init:             
                  li x0, 0x1
                  li x1, 0x49ecc087
                  li x2, 0x0
                  li x3, 0x80000000
                  li x4, 0x80000000
                  li x5, 0x0
                  li x6, 0x80000000
                  li x7, 0x80000000
                  li x8, 0xd
                  li x9, 0xf3c46492
                  li x10, 0x7db2402d
                  li x11, 0xf1e8b1fd
                  li x12, 0xea41e80f
                  li x13, 0x5
                  li x14, 0x0
                  li x16, 0x80000000
                  li x17, 0x80000000
                  li x18, 0x80000000
                  li x19, 0x247fa134
                  li x20, 0x80000000
                  li x21, 0x3377a6b3
                  li x22, 0xe
                  li x23, 0x80000000
                  li x24, 0xe41184b0
                  li x25, 0xff8e342d
                  li x26, 0x0
                  li x27, 0xf756e58b
                  li x29, 0xb0c56673
                  li x30, 0xf208cd6c
                  li x31, 0x92492b6
                  la x28, user_stack_end
                  li x4, 0x8ffffffc
                  li x26, 0x0
                  slli x26, x26, 8
                  addi x26, x26, 0x0
                  sw x26, 0(x4)
                  j main
test_done:        
                  li x4, 0x8ffffff8
                  li x26, 0x0
                  slli x26, x26, 8
                  addi x26, x26, 0x1
                  sw x26, 0(x4)
                  ecall

test_fail:        
                  li x4, 0x8ffffff8
                  li x26, 0x1
                  slli x26, x26, 8
                  addi x26, x26, 0x1
                  sw x26, 0(x4)
                  ecall

mmode_intr_vector_1:
                  addi x15, x15, -4
                  sw  x28, (x15)
                  add x28, x15, zero
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
                  add x15, x28, zero
                  li x4, 0x8ffffffc
                  li x26, 0x6
                  slli x26, x26, 8
                  addi x26, x26, 0x0
                  sw x26, 0(x4)
                  csrr x26, 0x342 # MCAUSE
                  srli x26, x26, 0x1f
                  beqz x26, 1f
                  li x4, 0x8ffffffc
                  li x26, 0x300
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x300
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x342
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x342
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x304
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x304
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x344
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x344
                  sw x26, 0(x4)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_2:
                  addi x15, x15, -4
                  sw  x28, (x15)
                  add x28, x15, zero
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
                  add x15, x28, zero
                  li x4, 0x8ffffffc
                  li x26, 0x6
                  slli x26, x26, 8
                  addi x26, x26, 0x0
                  sw x26, 0(x4)
                  csrr x26, 0x342 # MCAUSE
                  srli x26, x26, 0x1f
                  beqz x26, 1f
                  li x4, 0x8ffffffc
                  li x26, 0x300
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x300
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x342
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x342
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x304
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x304
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x344
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x344
                  sw x26, 0(x4)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_3:
                  addi x15, x15, -4
                  sw  x28, (x15)
                  add x28, x15, zero
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
                  add x15, x28, zero
                  li x4, 0x8ffffffc
                  li x26, 0x6
                  slli x26, x26, 8
                  addi x26, x26, 0x0
                  sw x26, 0(x4)
                  csrr x26, 0x342 # MCAUSE
                  srli x26, x26, 0x1f
                  beqz x26, 1f
                  li x4, 0x8ffffffc
                  li x26, 0x300
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x300
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x342
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x342
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x304
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x304
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x344
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x344
                  sw x26, 0(x4)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_4:
                  addi x15, x15, -4
                  sw  x28, (x15)
                  add x28, x15, zero
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
                  add x15, x28, zero
                  li x4, 0x8ffffffc
                  li x26, 0x6
                  slli x26, x26, 8
                  addi x26, x26, 0x0
                  sw x26, 0(x4)
                  csrr x26, 0x342 # MCAUSE
                  srli x26, x26, 0x1f
                  beqz x26, 1f
                  li x4, 0x8ffffffc
                  li x26, 0x300
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x300
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x342
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x342
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x304
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x304
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x344
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x344
                  sw x26, 0(x4)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_5:
                  addi x15, x15, -4
                  sw  x28, (x15)
                  add x28, x15, zero
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
                  add x15, x28, zero
                  li x4, 0x8ffffffc
                  li x26, 0x6
                  slli x26, x26, 8
                  addi x26, x26, 0x0
                  sw x26, 0(x4)
                  csrr x26, 0x342 # MCAUSE
                  srli x26, x26, 0x1f
                  beqz x26, 1f
                  li x4, 0x8ffffffc
                  li x26, 0x300
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x300
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x342
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x342
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x304
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x304
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x344
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x344
                  sw x26, 0(x4)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_6:
                  addi x15, x15, -4
                  sw  x28, (x15)
                  add x28, x15, zero
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
                  add x15, x28, zero
                  li x4, 0x8ffffffc
                  li x26, 0x6
                  slli x26, x26, 8
                  addi x26, x26, 0x0
                  sw x26, 0(x4)
                  csrr x26, 0x342 # MCAUSE
                  srli x26, x26, 0x1f
                  beqz x26, 1f
                  li x4, 0x8ffffffc
                  li x26, 0x300
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x300
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x342
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x342
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x304
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x304
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x344
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x344
                  sw x26, 0(x4)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_7:
                  addi x15, x15, -4
                  sw  x28, (x15)
                  add x28, x15, zero
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
                  add x15, x28, zero
                  li x4, 0x8ffffffc
                  li x26, 0x6
                  slli x26, x26, 8
                  addi x26, x26, 0x0
                  sw x26, 0(x4)
                  csrr x26, 0x342 # MCAUSE
                  srli x26, x26, 0x1f
                  beqz x26, 1f
                  li x4, 0x8ffffffc
                  li x26, 0x300
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x300
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x342
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x342
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x304
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x304
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x344
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x344
                  sw x26, 0(x4)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_8:
                  addi x15, x15, -4
                  sw  x28, (x15)
                  add x28, x15, zero
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
                  add x15, x28, zero
                  li x4, 0x8ffffffc
                  li x26, 0x6
                  slli x26, x26, 8
                  addi x26, x26, 0x0
                  sw x26, 0(x4)
                  csrr x26, 0x342 # MCAUSE
                  srli x26, x26, 0x1f
                  beqz x26, 1f
                  li x4, 0x8ffffffc
                  li x26, 0x300
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x300
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x342
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x342
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x304
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x304
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x344
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x344
                  sw x26, 0(x4)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_9:
                  addi x15, x15, -4
                  sw  x28, (x15)
                  add x28, x15, zero
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
                  add x15, x28, zero
                  li x4, 0x8ffffffc
                  li x26, 0x6
                  slli x26, x26, 8
                  addi x26, x26, 0x0
                  sw x26, 0(x4)
                  csrr x26, 0x342 # MCAUSE
                  srli x26, x26, 0x1f
                  beqz x26, 1f
                  li x4, 0x8ffffffc
                  li x26, 0x300
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x300
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x342
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x342
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x304
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x304
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x344
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x344
                  sw x26, 0(x4)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_10:
                  addi x15, x15, -4
                  sw  x28, (x15)
                  add x28, x15, zero
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
                  add x15, x28, zero
                  li x4, 0x8ffffffc
                  li x26, 0x6
                  slli x26, x26, 8
                  addi x26, x26, 0x0
                  sw x26, 0(x4)
                  csrr x26, 0x342 # MCAUSE
                  srli x26, x26, 0x1f
                  beqz x26, 1f
                  li x4, 0x8ffffffc
                  li x26, 0x300
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x300
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x342
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x342
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x304
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x304
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x344
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x344
                  sw x26, 0(x4)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_11:
                  addi x15, x15, -4
                  sw  x28, (x15)
                  add x28, x15, zero
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
                  add x15, x28, zero
                  li x4, 0x8ffffffc
                  li x26, 0x6
                  slli x26, x26, 8
                  addi x26, x26, 0x0
                  sw x26, 0(x4)
                  csrr x26, 0x342 # MCAUSE
                  srli x26, x26, 0x1f
                  beqz x26, 1f
                  li x4, 0x8ffffffc
                  li x26, 0x300
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x300
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x342
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x342
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x304
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x304
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x344
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x344
                  sw x26, 0(x4)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_12:
                  addi x15, x15, -4
                  sw  x28, (x15)
                  add x28, x15, zero
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
                  add x15, x28, zero
                  li x4, 0x8ffffffc
                  li x26, 0x6
                  slli x26, x26, 8
                  addi x26, x26, 0x0
                  sw x26, 0(x4)
                  csrr x26, 0x342 # MCAUSE
                  srli x26, x26, 0x1f
                  beqz x26, 1f
                  li x4, 0x8ffffffc
                  li x26, 0x300
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x300
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x342
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x342
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x304
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x304
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x344
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x344
                  sw x26, 0(x4)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_13:
                  addi x15, x15, -4
                  sw  x28, (x15)
                  add x28, x15, zero
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
                  add x15, x28, zero
                  li x4, 0x8ffffffc
                  li x26, 0x6
                  slli x26, x26, 8
                  addi x26, x26, 0x0
                  sw x26, 0(x4)
                  csrr x26, 0x342 # MCAUSE
                  srli x26, x26, 0x1f
                  beqz x26, 1f
                  li x4, 0x8ffffffc
                  li x26, 0x300
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x300
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x342
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x342
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x304
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x304
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x344
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x344
                  sw x26, 0(x4)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_14:
                  addi x15, x15, -4
                  sw  x28, (x15)
                  add x28, x15, zero
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
                  add x15, x28, zero
                  li x4, 0x8ffffffc
                  li x26, 0x6
                  slli x26, x26, 8
                  addi x26, x26, 0x0
                  sw x26, 0(x4)
                  csrr x26, 0x342 # MCAUSE
                  srli x26, x26, 0x1f
                  beqz x26, 1f
                  li x4, 0x8ffffffc
                  li x26, 0x300
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x300
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x342
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x342
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x304
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x304
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x344
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x344
                  sw x26, 0(x4)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_15:
                  addi x15, x15, -4
                  sw  x28, (x15)
                  add x28, x15, zero
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
                  add x15, x28, zero
                  li x4, 0x8ffffffc
                  li x26, 0x6
                  slli x26, x26, 8
                  addi x26, x26, 0x0
                  sw x26, 0(x4)
                  csrr x26, 0x342 # MCAUSE
                  srli x26, x26, 0x1f
                  beqz x26, 1f
                  li x4, 0x8ffffffc
                  li x26, 0x300
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x300
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x342
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x342
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x304
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x304
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x344
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x344
                  sw x26, 0(x4)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_16:
                  addi x15, x15, -4
                  sw  x28, (x15)
                  add x28, x15, zero
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
                  add x15, x28, zero
                  li x4, 0x8ffffffc
                  li x26, 0x6
                  slli x26, x26, 8
                  addi x26, x26, 0x0
                  sw x26, 0(x4)
                  csrr x26, 0x342 # MCAUSE
                  srli x26, x26, 0x1f
                  beqz x26, 1f
                  li x4, 0x8ffffffc
                  li x26, 0x300
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x300
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x342
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x342
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x304
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x304
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x344
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x344
                  sw x26, 0(x4)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_17:
                  addi x15, x15, -4
                  sw  x28, (x15)
                  add x28, x15, zero
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
                  add x15, x28, zero
                  li x4, 0x8ffffffc
                  li x26, 0x6
                  slli x26, x26, 8
                  addi x26, x26, 0x0
                  sw x26, 0(x4)
                  csrr x26, 0x342 # MCAUSE
                  srli x26, x26, 0x1f
                  beqz x26, 1f
                  li x4, 0x8ffffffc
                  li x26, 0x300
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x300
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x342
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x342
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x304
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x304
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x344
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x344
                  sw x26, 0(x4)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_18:
                  addi x15, x15, -4
                  sw  x28, (x15)
                  add x28, x15, zero
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
                  add x15, x28, zero
                  li x4, 0x8ffffffc
                  li x26, 0x6
                  slli x26, x26, 8
                  addi x26, x26, 0x0
                  sw x26, 0(x4)
                  csrr x26, 0x342 # MCAUSE
                  srli x26, x26, 0x1f
                  beqz x26, 1f
                  li x4, 0x8ffffffc
                  li x26, 0x300
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x300
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x342
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x342
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x304
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x304
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x344
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x344
                  sw x26, 0(x4)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_19:
                  addi x15, x15, -4
                  sw  x28, (x15)
                  add x28, x15, zero
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
                  add x15, x28, zero
                  li x4, 0x8ffffffc
                  li x26, 0x6
                  slli x26, x26, 8
                  addi x26, x26, 0x0
                  sw x26, 0(x4)
                  csrr x26, 0x342 # MCAUSE
                  srli x26, x26, 0x1f
                  beqz x26, 1f
                  li x4, 0x8ffffffc
                  li x26, 0x300
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x300
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x342
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x342
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x304
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x304
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x344
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x344
                  sw x26, 0(x4)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_20:
                  addi x15, x15, -4
                  sw  x28, (x15)
                  add x28, x15, zero
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
                  add x15, x28, zero
                  li x4, 0x8ffffffc
                  li x26, 0x6
                  slli x26, x26, 8
                  addi x26, x26, 0x0
                  sw x26, 0(x4)
                  csrr x26, 0x342 # MCAUSE
                  srli x26, x26, 0x1f
                  beqz x26, 1f
                  li x4, 0x8ffffffc
                  li x26, 0x300
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x300
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x342
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x342
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x304
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x304
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x344
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x344
                  sw x26, 0(x4)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_21:
                  addi x15, x15, -4
                  sw  x28, (x15)
                  add x28, x15, zero
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
                  add x15, x28, zero
                  li x4, 0x8ffffffc
                  li x26, 0x6
                  slli x26, x26, 8
                  addi x26, x26, 0x0
                  sw x26, 0(x4)
                  csrr x26, 0x342 # MCAUSE
                  srli x26, x26, 0x1f
                  beqz x26, 1f
                  li x4, 0x8ffffffc
                  li x26, 0x300
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x300
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x342
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x342
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x304
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x304
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x344
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x344
                  sw x26, 0(x4)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_22:
                  addi x15, x15, -4
                  sw  x28, (x15)
                  add x28, x15, zero
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
                  add x15, x28, zero
                  li x4, 0x8ffffffc
                  li x26, 0x6
                  slli x26, x26, 8
                  addi x26, x26, 0x0
                  sw x26, 0(x4)
                  csrr x26, 0x342 # MCAUSE
                  srli x26, x26, 0x1f
                  beqz x26, 1f
                  li x4, 0x8ffffffc
                  li x26, 0x300
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x300
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x342
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x342
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x304
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x304
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x344
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x344
                  sw x26, 0(x4)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_23:
                  addi x15, x15, -4
                  sw  x28, (x15)
                  add x28, x15, zero
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
                  add x15, x28, zero
                  li x4, 0x8ffffffc
                  li x26, 0x6
                  slli x26, x26, 8
                  addi x26, x26, 0x0
                  sw x26, 0(x4)
                  csrr x26, 0x342 # MCAUSE
                  srli x26, x26, 0x1f
                  beqz x26, 1f
                  li x4, 0x8ffffffc
                  li x26, 0x300
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x300
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x342
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x342
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x304
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x304
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x344
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x344
                  sw x26, 0(x4)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_24:
                  addi x15, x15, -4
                  sw  x28, (x15)
                  add x28, x15, zero
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
                  add x15, x28, zero
                  li x4, 0x8ffffffc
                  li x26, 0x6
                  slli x26, x26, 8
                  addi x26, x26, 0x0
                  sw x26, 0(x4)
                  csrr x26, 0x342 # MCAUSE
                  srli x26, x26, 0x1f
                  beqz x26, 1f
                  li x4, 0x8ffffffc
                  li x26, 0x300
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x300
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x342
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x342
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x304
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x304
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x344
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x344
                  sw x26, 0(x4)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_25:
                  addi x15, x15, -4
                  sw  x28, (x15)
                  add x28, x15, zero
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
                  add x15, x28, zero
                  li x4, 0x8ffffffc
                  li x26, 0x6
                  slli x26, x26, 8
                  addi x26, x26, 0x0
                  sw x26, 0(x4)
                  csrr x26, 0x342 # MCAUSE
                  srli x26, x26, 0x1f
                  beqz x26, 1f
                  li x4, 0x8ffffffc
                  li x26, 0x300
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x300
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x342
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x342
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x304
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x304
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x344
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x344
                  sw x26, 0(x4)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_26:
                  addi x15, x15, -4
                  sw  x28, (x15)
                  add x28, x15, zero
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
                  add x15, x28, zero
                  li x4, 0x8ffffffc
                  li x26, 0x6
                  slli x26, x26, 8
                  addi x26, x26, 0x0
                  sw x26, 0(x4)
                  csrr x26, 0x342 # MCAUSE
                  srli x26, x26, 0x1f
                  beqz x26, 1f
                  li x4, 0x8ffffffc
                  li x26, 0x300
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x300
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x342
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x342
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x304
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x304
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x344
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x344
                  sw x26, 0(x4)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_27:
                  addi x15, x15, -4
                  sw  x28, (x15)
                  add x28, x15, zero
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
                  add x15, x28, zero
                  li x4, 0x8ffffffc
                  li x26, 0x6
                  slli x26, x26, 8
                  addi x26, x26, 0x0
                  sw x26, 0(x4)
                  csrr x26, 0x342 # MCAUSE
                  srli x26, x26, 0x1f
                  beqz x26, 1f
                  li x4, 0x8ffffffc
                  li x26, 0x300
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x300
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x342
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x342
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x304
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x304
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x344
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x344
                  sw x26, 0(x4)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_28:
                  addi x15, x15, -4
                  sw  x28, (x15)
                  add x28, x15, zero
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
                  add x15, x28, zero
                  li x4, 0x8ffffffc
                  li x26, 0x6
                  slli x26, x26, 8
                  addi x26, x26, 0x0
                  sw x26, 0(x4)
                  csrr x26, 0x342 # MCAUSE
                  srli x26, x26, 0x1f
                  beqz x26, 1f
                  li x4, 0x8ffffffc
                  li x26, 0x300
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x300
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x342
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x342
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x304
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x304
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x344
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x344
                  sw x26, 0(x4)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_29:
                  addi x15, x15, -4
                  sw  x28, (x15)
                  add x28, x15, zero
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
                  add x15, x28, zero
                  li x4, 0x8ffffffc
                  li x26, 0x6
                  slli x26, x26, 8
                  addi x26, x26, 0x0
                  sw x26, 0(x4)
                  csrr x26, 0x342 # MCAUSE
                  srli x26, x26, 0x1f
                  beqz x26, 1f
                  li x4, 0x8ffffffc
                  li x26, 0x300
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x300
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x342
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x342
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x304
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x304
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x344
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x344
                  sw x26, 0(x4)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_30:
                  addi x15, x15, -4
                  sw  x28, (x15)
                  add x28, x15, zero
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
                  add x15, x28, zero
                  li x4, 0x8ffffffc
                  li x26, 0x6
                  slli x26, x26, 8
                  addi x26, x26, 0x0
                  sw x26, 0(x4)
                  csrr x26, 0x342 # MCAUSE
                  srli x26, x26, 0x1f
                  beqz x26, 1f
                  li x4, 0x8ffffffc
                  li x26, 0x300
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x300
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x342
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x342
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x304
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x304
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x344
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x344
                  sw x26, 0(x4)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_31:
                  addi x15, x15, -4
                  sw  x28, (x15)
                  add x28, x15, zero
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
                  add x15, x28, zero
                  li x4, 0x8ffffffc
                  li x26, 0x6
                  slli x26, x26, 8
                  addi x26, x26, 0x0
                  sw x26, 0(x4)
                  csrr x26, 0x342 # MCAUSE
                  srli x26, x26, 0x1f
                  beqz x26, 1f
                  li x4, 0x8ffffffc
                  li x26, 0x300
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x300
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x342
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x342
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x304
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x304
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x344
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x344
                  sw x26, 0(x4)
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
                  addi x15, x15, -4
                  sw  x28, (x15)
                  add x28, x15, zero
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
                  add x15, x28, zero
                  li x4, 0x8ffffffc
                  li x26, 0x8
                  slli x26, x26, 8
                  addi x26, x26, 0x0
                  sw x26, 0(x4)
                  csrr x26, 0x341 # MEPC
                  csrr x26, 0x342 # MCAUSE
                  li x4, 0x3 # BREAKPOINT
                  beq x26, x4, ebreak_handler
                  li x4, 0x8 # ECALL_UMODE
                  beq x26, x4, ecall_handler
                  li x4, 0x9 # ECALL_SMODE
                  beq x26, x4, ecall_handler
                  li x4, 0xb # ECALL_MMODE
                  beq x26, x4, ecall_handler
                  li x4, 0x1
                  beq x26, x4, instr_fault_handler
                  li x4, 0x5
                  beq x26, x4, load_fault_handler
                  li x4, 0x7
                  beq x26, x4, store_fault_handler
                  li x4, 0xc
                  beq x26, x4, pt_fault_handler
                  li x4, 0xd
                  beq x26, x4, pt_fault_handler
                  li x4, 0xf
                  beq x26, x4, pt_fault_handler
                  li x4, 0x2 # ILLEGAL_INSTRUCTION
                  beq x26, x4, illegal_instr_handler
                  csrr x4, 0x343 # MTVAL
                  1: la x7, test_done
                  jalr x1, x7, 0

ecall_handler:    
                  li x4, 0x8ffffffc
                  li x26, 0xb00
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0xb00
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0xb80
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0xb80
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0xb03
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0xb03
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0xb83
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0xb83
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0xb04
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0xb04
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0xb84
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0xb84
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0xb05
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0xb05
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0xb85
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0xb85
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0xb06
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0xb06
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0xb86
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0xb86
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0xb07
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0xb07
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0xb87
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0xb87
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0xb08
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0xb08
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0xb88
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0xb88
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0xb09
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0xb09
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0xb89
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0xb89
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0xb0a
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0xb0a
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0xb8a
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0xb8a
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0xb0b
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0xb0b
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0xb8b
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0xb8b
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0xb0c
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0xb0c
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0xb8c
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0xb8c
                  sw x26, 0(x4)
                  la x26, _start
                  sw x0, 0(x26)
                  sw x1, 4(x26)
                  sw x2, 8(x26)
                  sw x3, 12(x26)
                  sw x4, 16(x26)
                  sw x5, 20(x26)
                  sw x6, 24(x26)
                  sw x7, 28(x26)
                  sw x8, 32(x26)
                  sw x9, 36(x26)
                  sw x10, 40(x26)
                  sw x11, 44(x26)
                  sw x12, 48(x26)
                  sw x13, 52(x26)
                  sw x14, 56(x26)
                  sw x15, 60(x26)
                  sw x16, 64(x26)
                  sw x17, 68(x26)
                  sw x18, 72(x26)
                  sw x19, 76(x26)
                  sw x20, 80(x26)
                  sw x21, 84(x26)
                  sw x22, 88(x26)
                  sw x23, 92(x26)
                  sw x24, 96(x26)
                  sw x25, 100(x26)
                  sw x26, 104(x26)
                  sw x27, 108(x26)
                  sw x28, 112(x26)
                  sw x29, 116(x26)
                  sw x30, 120(x26)
                  sw x31, 124(x26)
                  csrr  x26, 0x341
                  addi  x26, x26, 4
                  csrw  0x341, x26
                  mret

instr_fault_handler:
                  li x4, 0x8ffffffc
                  li x26, 0x9
                  slli x26, x26, 8
                  addi x26, x26, 0x0
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x342
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x342
                  sw x26, 0(x4)
                  li x26, 0
                  mv x20, x26
                  li x1, 0
                  0: mv x26, x20
                  mv x7, x26
                  li x7, 0
                  beq x26, x7, 1f
                  li x7, 1
                  beq x26, x7, 2f
                  li x7, 2
                  beq x26, x7, 3f
                  li x7, 3
                  beq x26, x7, 4f
                  li x7, 4
                  beq x26, x7, 5f
                  li x7, 5
                  beq x26, x7, 6f
                  li x7, 6
                  beq x26, x7, 7f
                  li x7, 7
                  beq x26, x7, 8f
                  li x7, 8
                  beq x26, x7, 9f
                  li x7, 9
                  beq x26, x7, 10f
                  li x7, 10
                  beq x26, x7, 11f
                  li x7, 11
                  beq x26, x7, 12f
                  li x7, 12
                  beq x26, x7, 13f
                  li x7, 13
                  beq x26, x7, 14f
                  li x7, 14
                  beq x26, x7, 15f
                  li x7, 15
                  beq x26, x7, 16f
                  1: csrr x4, 0x3b0
                  csrr x9, 0x3a0
                  j 17f
                  2: csrr x4, 0x3b1
                  csrr x9, 0x3a0
                  j 17f
                  3: csrr x4, 0x3b2
                  csrr x9, 0x3a0
                  j 17f
                  4: csrr x4, 0x3b3
                  csrr x9, 0x3a0
                  j 17f
                  5: csrr x4, 0x3b4
                  csrr x9, 0x3a1
                  j 17f
                  6: csrr x4, 0x3b5
                  csrr x9, 0x3a1
                  j 17f
                  7: csrr x4, 0x3b6
                  csrr x9, 0x3a1
                  j 17f
                  8: csrr x4, 0x3b7
                  csrr x9, 0x3a1
                  j 17f
                  9: csrr x4, 0x3b8
                  csrr x9, 0x3a2
                  j 17f
                  10: csrr x4, 0x3b9
                  csrr x9, 0x3a2
                  j 17f
                  11: csrr x4, 0x3ba
                  csrr x9, 0x3a2
                  j 17f
                  12: csrr x4, 0x3bb
                  csrr x9, 0x3a2
                  j 17f
                  13: csrr x4, 0x3bc
                  csrr x9, 0x3a3
                  j 17f
                  14: csrr x4, 0x3bd
                  csrr x9, 0x3a3
                  j 17f
                  15: csrr x4, 0x3be
                  csrr x9, 0x3a3
                  j 17f
                  16: csrr x4, 0x3bf
                  csrr x9, 0x3a3
                  j 17f
                  17: li x29, 4
                  slli x26, x20, 30
                  srli x26, x26, 30
                  sub x7, x29, x26
                  addi x7, x7, -1
                  slli x7, x7, 3
                  sll x29, x9, x7
                  slli x26, x26, 3
                  add x7, x7, x26
                  srl x29, x29, x7
                  slli x7, x29, 27
                  srli x7, x7, 30
                  beqz x7, 20f
                  li x26, 1
                  beq x7, x26, 21f
                  li x26, 2
                  beq x7, x26, 24f
                  li x26, 3
                  beq x7, x26, 25f
                  la x26, test_done
                  jalr x0, x26, 0
                  18: mv x26, x20
                  mv x1, x4
                  addi x26, x26, 1
                  mv x20, x26
                  li x4, 16
                  ble x4, x26, 19f
                  j 0b
                  19: csrr x26, 0x747
                  andi x26, x26, 2
                  bnez x26, 27f
                  la x26, test_done
                  jalr x0, x26, 0
                  20: j 18b
                  21: mv x26, x20
                  csrr x7, 0x343
                  srli x7, x7, 2
                  bnez x26, 22f
                  bltz x7, 18b
                  j 23f
                  22: bgtu x1, x7, 18b
                  23: bleu x4, x7, 18b
                  j 26f
                  24: csrr x26, 0x343
                  srli x26, x26, 2
                  slli x7, x4, 2
                  srli x7, x7, 2
                  bne x26, x7, 18b
                  j 26f
                  25: csrr x26, 0x343
                  srli x26, x26, 2
                  srli x26, x26, 0
                  slli x26, x26, 0
                  slli x7, x4, 2
                  srli x7, x7, 2
                  srli x7, x7, 0
                  slli x7, x7, 0
                  bne x26, x7, 18b
                  j 26f
                  26: csrr x7, 0x747
                  andi x7, x7, 1
                  bnez x7, 27f
                  andi x7, x29, 128
                  bnez x7, 27f
                  j 29f
                  27: la x26, test_done
                  jalr x0, x26, 0
                  29: ori x29, x29, 4
                  li x7, 30
                  sll x26, x20, x7
                  srl x26, x26, x7
                  slli x7, x26, 3
                  sll x29, x29, x7
                  or x9, x9, x29
                  mv x26, x20
                  srli x26, x26, 2
                  beqz x26, 30f
                  li x7, 1
                  beq x26, x7, 31f
                  li x7, 2
                  beq x26, x7, 32f
                  li x7, 3
                  beq x26, x7, 33f
                  30: csrw 0x3a0, x9
                  j 34f
                  31: csrw 0x3a1, x9
                  j 34f
                  32: csrw 0x3a2, x9
                  j 34f
                  33: csrw 0x3a3, x9
                  34: nop
                  add x28, x15, zero
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
                  add x15, x28, zero
                  lw  x28, (x15)
                  addi x15, x15, 4
                  mret

load_fault_handler:
                  li x4, 0x8ffffffc
                  li x26, 0xb
                  slli x26, x26, 8
                  addi x26, x26, 0x0
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x342
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x342
                  sw x26, 0(x4)
                  li x26, 0
                  mv x20, x26
                  li x1, 0
                  0: mv x26, x20
                  mv x7, x26
                  li x7, 0
                  beq x26, x7, 1f
                  li x7, 1
                  beq x26, x7, 2f
                  li x7, 2
                  beq x26, x7, 3f
                  li x7, 3
                  beq x26, x7, 4f
                  li x7, 4
                  beq x26, x7, 5f
                  li x7, 5
                  beq x26, x7, 6f
                  li x7, 6
                  beq x26, x7, 7f
                  li x7, 7
                  beq x26, x7, 8f
                  li x7, 8
                  beq x26, x7, 9f
                  li x7, 9
                  beq x26, x7, 10f
                  li x7, 10
                  beq x26, x7, 11f
                  li x7, 11
                  beq x26, x7, 12f
                  li x7, 12
                  beq x26, x7, 13f
                  li x7, 13
                  beq x26, x7, 14f
                  li x7, 14
                  beq x26, x7, 15f
                  li x7, 15
                  beq x26, x7, 16f
                  1: csrr x4, 0x3b0
                  csrr x9, 0x3a0
                  j 17f
                  2: csrr x4, 0x3b1
                  csrr x9, 0x3a0
                  j 17f
                  3: csrr x4, 0x3b2
                  csrr x9, 0x3a0
                  j 17f
                  4: csrr x4, 0x3b3
                  csrr x9, 0x3a0
                  j 17f
                  5: csrr x4, 0x3b4
                  csrr x9, 0x3a1
                  j 17f
                  6: csrr x4, 0x3b5
                  csrr x9, 0x3a1
                  j 17f
                  7: csrr x4, 0x3b6
                  csrr x9, 0x3a1
                  j 17f
                  8: csrr x4, 0x3b7
                  csrr x9, 0x3a1
                  j 17f
                  9: csrr x4, 0x3b8
                  csrr x9, 0x3a2
                  j 17f
                  10: csrr x4, 0x3b9
                  csrr x9, 0x3a2
                  j 17f
                  11: csrr x4, 0x3ba
                  csrr x9, 0x3a2
                  j 17f
                  12: csrr x4, 0x3bb
                  csrr x9, 0x3a2
                  j 17f
                  13: csrr x4, 0x3bc
                  csrr x9, 0x3a3
                  j 17f
                  14: csrr x4, 0x3bd
                  csrr x9, 0x3a3
                  j 17f
                  15: csrr x4, 0x3be
                  csrr x9, 0x3a3
                  j 17f
                  16: csrr x4, 0x3bf
                  csrr x9, 0x3a3
                  j 17f
                  17: li x29, 4
                  slli x26, x20, 30
                  srli x26, x26, 30
                  sub x7, x29, x26
                  addi x7, x7, -1
                  slli x7, x7, 3
                  sll x29, x9, x7
                  slli x26, x26, 3
                  add x7, x7, x26
                  srl x29, x29, x7
                  slli x7, x29, 27
                  srli x7, x7, 30
                  beqz x7, 20f
                  li x26, 1
                  beq x7, x26, 21f
                  li x26, 2
                  beq x7, x26, 24f
                  li x26, 3
                  beq x7, x26, 25f
                  la x26, test_done
                  jalr x0, x26, 0
                  18: mv x26, x20
                  mv x1, x4
                  addi x26, x26, 1
                  mv x20, x26
                  li x4, 16
                  ble x4, x26, 19f
                  j 0b
                  19: csrr x26, 0x747
                  andi x26, x26, 2
                  bnez x26, 27f
                  la x26, test_done
                  jalr x0, x26, 0
                  20: j 18b
                  21: mv x26, x20
                  csrr x7, 0x343
                  srli x7, x7, 2
                  bnez x26, 22f
                  bltz x7, 18b
                  j 23f
                  22: bgtu x1, x7, 18b
                  23: bleu x4, x7, 18b
                  j 26f
                  24: csrr x26, 0x343
                  srli x26, x26, 2
                  slli x7, x4, 2
                  srli x7, x7, 2
                  bne x26, x7, 18b
                  j 26f
                  25: csrr x26, 0x343
                  srli x26, x26, 2
                  srli x26, x26, 0
                  slli x26, x26, 0
                  slli x7, x4, 2
                  srli x7, x7, 2
                  srli x7, x7, 0
                  slli x7, x7, 0
                  bne x26, x7, 18b
                  j 26f
                  26: csrr x7, 0x747
                  andi x7, x7, 1
                  bnez x7, 27f
                  andi x7, x29, 128
                  bnez x7, 27f
                  j 29f
                  27: csrr x26, 0x341
                  la x7, main
                  bge x26, x7, 40f
                  la x26, test_done
                  jalr x0, x26, 0
                  40: lw x26, 0(x26)
                  li x7, 3
                  and x26, x26, x7
                  beq x26, x7, 28f
                  csrr x26, 0x341
                  addi x26, x26, 2
                  csrw 0x341, x26
                  j 34f
                  28: csrr x26, 0x341
                  addi x26, x26, 4
                  csrw 0x341, x26
                  j 34f
                  29: ori x29, x29, 1
                  li x7, 30
                  sll x26, x20, x7
                  srl x26, x26, x7
                  slli x7, x26, 3
                  sll x29, x29, x7
                  or x9, x9, x29
                  mv x26, x20
                  srli x26, x26, 2
                  beqz x26, 30f
                  li x7, 1
                  beq x26, x7, 31f
                  li x7, 2
                  beq x26, x7, 32f
                  li x7, 3
                  beq x26, x7, 33f
                  30: csrw 0x3a0, x9
                  j 34f
                  31: csrw 0x3a1, x9
                  j 34f
                  32: csrw 0x3a2, x9
                  j 34f
                  33: csrw 0x3a3, x9
                  34: nop
                  add x28, x15, zero
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
                  add x15, x28, zero
                  lw  x28, (x15)
                  addi x15, x15, 4
                  mret

store_fault_handler:
                  li x4, 0x8ffffffc
                  li x26, 0xc
                  slli x26, x26, 8
                  addi x26, x26, 0x0
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x342
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x342
                  sw x26, 0(x4)
                  li x26, 0
                  mv x20, x26
                  li x1, 0
                  0: mv x26, x20
                  mv x7, x26
                  li x7, 0
                  beq x26, x7, 1f
                  li x7, 1
                  beq x26, x7, 2f
                  li x7, 2
                  beq x26, x7, 3f
                  li x7, 3
                  beq x26, x7, 4f
                  li x7, 4
                  beq x26, x7, 5f
                  li x7, 5
                  beq x26, x7, 6f
                  li x7, 6
                  beq x26, x7, 7f
                  li x7, 7
                  beq x26, x7, 8f
                  li x7, 8
                  beq x26, x7, 9f
                  li x7, 9
                  beq x26, x7, 10f
                  li x7, 10
                  beq x26, x7, 11f
                  li x7, 11
                  beq x26, x7, 12f
                  li x7, 12
                  beq x26, x7, 13f
                  li x7, 13
                  beq x26, x7, 14f
                  li x7, 14
                  beq x26, x7, 15f
                  li x7, 15
                  beq x26, x7, 16f
                  1: csrr x4, 0x3b0
                  csrr x9, 0x3a0
                  j 17f
                  2: csrr x4, 0x3b1
                  csrr x9, 0x3a0
                  j 17f
                  3: csrr x4, 0x3b2
                  csrr x9, 0x3a0
                  j 17f
                  4: csrr x4, 0x3b3
                  csrr x9, 0x3a0
                  j 17f
                  5: csrr x4, 0x3b4
                  csrr x9, 0x3a1
                  j 17f
                  6: csrr x4, 0x3b5
                  csrr x9, 0x3a1
                  j 17f
                  7: csrr x4, 0x3b6
                  csrr x9, 0x3a1
                  j 17f
                  8: csrr x4, 0x3b7
                  csrr x9, 0x3a1
                  j 17f
                  9: csrr x4, 0x3b8
                  csrr x9, 0x3a2
                  j 17f
                  10: csrr x4, 0x3b9
                  csrr x9, 0x3a2
                  j 17f
                  11: csrr x4, 0x3ba
                  csrr x9, 0x3a2
                  j 17f
                  12: csrr x4, 0x3bb
                  csrr x9, 0x3a2
                  j 17f
                  13: csrr x4, 0x3bc
                  csrr x9, 0x3a3
                  j 17f
                  14: csrr x4, 0x3bd
                  csrr x9, 0x3a3
                  j 17f
                  15: csrr x4, 0x3be
                  csrr x9, 0x3a3
                  j 17f
                  16: csrr x4, 0x3bf
                  csrr x9, 0x3a3
                  j 17f
                  17: li x29, 4
                  slli x26, x20, 30
                  srli x26, x26, 30
                  sub x7, x29, x26
                  addi x7, x7, -1
                  slli x7, x7, 3
                  sll x29, x9, x7
                  slli x26, x26, 3
                  add x7, x7, x26
                  srl x29, x29, x7
                  slli x7, x29, 27
                  srli x7, x7, 30
                  beqz x7, 20f
                  li x26, 1
                  beq x7, x26, 21f
                  li x26, 2
                  beq x7, x26, 24f
                  li x26, 3
                  beq x7, x26, 25f
                  la x26, test_done
                  jalr x0, x26, 0
                  18: mv x26, x20
                  mv x1, x4
                  addi x26, x26, 1
                  mv x20, x26
                  li x4, 16
                  ble x4, x26, 19f
                  j 0b
                  19: csrr x26, 0x747
                  andi x26, x26, 2
                  bnez x26, 27f
                  la x26, test_done
                  jalr x0, x26, 0
                  20: j 18b
                  21: mv x26, x20
                  csrr x7, 0x343
                  srli x7, x7, 2
                  bnez x26, 22f
                  bltz x7, 18b
                  j 23f
                  22: bgtu x1, x7, 18b
                  23: bleu x4, x7, 18b
                  j 26f
                  24: csrr x26, 0x343
                  srli x26, x26, 2
                  slli x7, x4, 2
                  srli x7, x7, 2
                  bne x26, x7, 18b
                  j 26f
                  25: csrr x26, 0x343
                  srli x26, x26, 2
                  srli x26, x26, 0
                  slli x26, x26, 0
                  slli x7, x4, 2
                  srli x7, x7, 2
                  srli x7, x7, 0
                  slli x7, x7, 0
                  bne x26, x7, 18b
                  j 26f
                  26: csrr x7, 0x747
                  andi x7, x7, 1
                  bnez x7, 27f
                  andi x7, x29, 128
                  bnez x7, 27f
                  j 29f
                  27: csrr x26, 0x341
                  lw x26, 0(x26)
                  li x7, 3
                  and x26, x26, x7
                  beq x26, x7, 28f
                  csrr x26, 0x341
                  addi x26, x26, 2
                  csrw 0x341, x26
                  j 34f
                  28: csrr x26, 0x341
                  addi x26, x26, 4
                  csrw 0x341, x26
                  j 34f
                  29: ori x29, x29, 3
                  li x7, 30
                  sll x26, x20, x7
                  srl x26, x26, x7
                  slli x7, x26, 3
                  sll x29, x29, x7
                  or x9, x9, x29
                  mv x26, x20
                  srli x26, x26, 2
                  beqz x26, 30f
                  li x7, 1
                  beq x26, x7, 31f
                  li x7, 2
                  beq x26, x7, 32f
                  li x7, 3
                  beq x26, x7, 33f
                  30: csrw 0x3a0, x9
                  j 34f
                  31: csrw 0x3a1, x9
                  j 34f
                  32: csrw 0x3a2, x9
                  j 34f
                  33: csrw 0x3a3, x9
                  34: nop
                  add x28, x15, zero
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
                  add x15, x28, zero
                  lw  x28, (x15)
                  addi x15, x15, 4
                  mret

.align 2
main:             c.or         a2, a1
                  c.xor        s0, s1
                  and          t6, a4, t2
                  c.add        s4, s4
                  remu         s4, t4, t6
                  xor          s0, t3, t6
                  rem          s7, gp, t6
                  c.srli       a0, 1
                  remu         t4, a3, tp
                  c.lui        s2, 13
                  csrrs        s10, 0x340, zero
                  remu         a1, t0, s9
                  nop
                  lui          tp, 730505
                  c.addi4spn   a3, sp, 32
                  c.mv         s9, s7
                  mul          a2, ra, ra
                  srl          a6, s6, t3
                  c.sub        a1, a3
                  slli         sp, a0, 15
                  c.mv         s0, s11
                  csrrw        s9, 0x340, t1
                  mulh         t4, a0, s4
                  or           a1, a5, t6
                  csrrw        s1, 0x340, s8
                  ori          a6, a4, -313
                  xor          a2, sp, t0
                  c.srli       a1, 4
                  lui          sp, 154940
                  c.and        a2, a1
                  sll          gp, ra, a2
                  sltiu        s6, s1, 648
                  c.add        a4, ra
                  csrrw        zero, 0x340, a7
                  andi         sp, t3, 210
                  andi         t4, a4, 714
                  mulh         s8, tp, sp
                  c.nop
                  srl          s1, zero, a5
                  srli         t5, s5, 24
                  c.addi       s10, -1
                  csrrsi       s5, 0x340, 20
                  lui          a7, 562985
                  c.lui        t4, 8
                  lui          s10, 267204
                  divu         zero, a6, sp
                  slt          s0, s8, a5
                  srl          sp, a2, s4
                  sub          s4, a6, a7
                  c.li         t6, -1
                  and          t5, t4, a1
                  slli         s9, t3, 1
                  c.srli       a2, 11
                  c.add        s10, t6
                  sltu         s3, a6, ra
                  add          s8, gp, t2
                  c.li         sp, 10
                  c.mv         tp, t3
                  c.addi16sp   sp, 16
                  mul          gp, s9, ra
                  csrrs        gp, 0x340, zero
                  c.add        a3, tp
                  lui          a7, 371884
                  c.srai       s0, 19
                  add          t1, t1, t6
                  c.srai       a0, 15
                  xori         s4, s5, -847
                  c.addi4spn   a1, sp, 928
                  divu         t4, t6, s9
                  mulhsu       a4, t4, s10
                  sra          t6, zero, zero
                  c.add        s3, sp
                  add          sp, a2, s3
                  slli         t6, t1, 25
                  sltu         s3, t6, s11
                  divu         a4, s7, a1
                  andi         s11, t1, -1337
                  slti         s8, t2, 412
                  xor          s7, t5, s3
                  mulh         s10, t5, ra
                  c.li         t4, 10
                  mulhsu       s5, t5, gp
                  c.nop
                  and          s2, a3, s3
                  slli         s10, ra, 23
                  xori         a4, s3, 5
                  sltu         s10, ra, s2
                  sra          t6, a2, a6
                  xor          s10, s0, a5
                  ori          tp, t4, -1643
                  slti         s4, gp, -1502
                  lui          t5, 584887
                  add          t0, a5, t5
                  mulh         a6, a5, s8
                  srli         s0, s0, 18
                  ori          t1, zero, -316
                  c.addi       a7, 8
                  sltiu        s11, a5, -43
                  srli         a3, tp, 10
                  xor          t1, t6, s9
                  auipc        s10, 636811
                  xori         s8, a7, 1006
                  slli         a0, zero, 20
                  xori         s0, s4, -1515
                  mulhsu       a7, sp, t1
                  csrrsi       a0, 0x340, 0
                  csrrs        a2, 0x340, zero
                  c.nop
                  addi         tp, a2, -1400
                  mulhsu       s6, s7, s5
                  c.slli       s0, 25
                  mul          t0, t0, t4
                  c.and        a1, a3
                  c.mv         s7, s8
                  or           a2, a3, t0
                  andi         s2, tp, -1916
                  slt          s8, zero, t3
                  slt          a1, tp, a4
                  c.addi       s2, -1
                  mulhu        a3, tp, a2
                  csrrci       s8, 0x340, 17
                  sltu         a7, t1, ra
                  csrrc        a1, 0x340, zero
                  mulhu        a1, s5, s5
                  c.srli       a3, 31
                  slti         t0, zero, -1732
                  slti         t4, s2, 1913
                  c.addi4spn   a0, sp, 496
                  mul          a7, ra, a3
                  c.lui        ra, 27
                  ori          s11, s9, 782
                  csrrwi       s7, 0x340, 22
                  mulhu        t5, s10, s4
                  xori         sp, s3, 609
                  sll          s7, t3, a4
                  mulhsu       s7, tp, t5
                  c.nop
                  add          t4, a2, s3
                  div          s2, s10, a1
                  nop
                  xor          ra, t5, s2
                  c.li         a3, -1
                  nop
                  rem          ra, a2, a5
                  c.nop
                  srli         s2, a0, 22
                  mulhsu       a0, sp, t4
                  c.sub        s1, a1
                  div          t1, gp, a2
                  lui          s7, 912585
                  srai         s1, s0, 7
                  lui          s9, 882602
                  c.addi16sp   sp, 128
                  c.xor        s1, s0
                  xor          s9, a2, s2
                  mulhsu       s7, tp, t1
                  add          s7, s3, a3
                  c.slli       sp, 7
                  c.andi       a1, 27
                  sltu         gp, sp, t3
                  sub          s7, a7, t6
                  c.nop
                  csrrsi       ra, 0x340, 15
                  c.mv         t6, a1
                  add          tp, t6, t2
                  sra          a0, a1, s7
                  c.addi16sp   sp, -16
                  csrrwi       s11, 0x340, 28
                  mulhsu       tp, a4, tp
                  sll          s6, a6, s5
                  remu         s7, sp, ra
                  rem          s10, t2, t6
                  srai         s8, s1, 9
                  divu         a4, t1, t5
                  c.or         a2, a3
                  c.li         a3, -1
                  c.srai       s0, 14
                  nop
                  csrrc        a3, 0x340, a2
                  sra          s9, t4, t1
                  slt          a6, a3, s1
                  xor          s7, gp, sp
                  or           ra, s11, a5
                  c.nop
                  c.srai       s1, 1
                  mul          gp, sp, a7
                  sub          s8, a2, s11
                  c.add        gp, a3
                  c.nop
                  ori          s5, s5, 590
                  lui          s10, 939579
                  c.sub        a1, a2
                  c.nop
                  or           t4, s7, s1
                  c.and        a2, a1
                  or           t0, a2, s1
                  lui          t1, 386673
                  auipc        s10, 736413
                  slli         a6, t2, 22
                  csrrsi       ra, 0x340, 0
                  c.addi       a4, -1
                  sltiu        s8, sp, 952
                  sltiu        a3, ra, -1678
                  mul          ra, s2, t4
                  c.and        a2, a5
                  c.addi16sp   sp, 48
                  csrrwi       s9, 0x340, 4
                  sra          a4, s3, s10
                  nop
                  divu         s3, a3, s9
                  add          s11, zero, a6
                  c.slli       s9, 27
                  slti         a0, t4, 355
                  auipc        s6, 376070
                  c.srli       s0, 2
                  srli         gp, s2, 8
                  csrrs        s5, 0x340, zero
                  c.slli       t5, 28
                  c.add        s6, t2
                  slli         t6, t2, 23
                  c.srai       a4, 5
                  nop
                  mul          s0, tp, s11
                  sltiu        s7, a1, -1457
                  c.mv         s7, s9
                  remu         s8, a2, s3
                  srli         s7, t5, 4
                  csrrci       zero, 0x340, 15
                  c.slli       s0, 14
                  xor          t5, s2, ra
                  nop
                  c.and        a3, a1
                  c.srli       a0, 14
                  xori         t4, a5, -1189
                  c.add        s5, s4
                  c.mv         tp, s5
                  andi         t0, t2, 253
                  csrrw        t4, 0x340, s8
                  xor          s3, s3, zero
                  csrrci       gp, 0x340, 0
                  andi         a6, t0, -200
                  srli         a6, t3, 20
                  c.lui        s5, 25
                  csrrc        a6, 0x340, zero
                  srl          t6, a6, a0
                  c.srai       a2, 15
                  xor          s8, s8, t2
                  ori          s0, t0, 871
                  sub          s2, t4, a7
                  mul          s9, a6, s4
                  remu         a2, t2, s4
                  c.mv         s1, s2
                  csrrwi       s6, 0x340, 19
                  sub          s11, t2, s8
                  csrrci       s3, 0x340, 0
                  c.andi       a3, 11
                  sll          s5, t6, zero
                  div          s5, s3, a1
                  c.add        s6, s2
                  c.mv         s7, sp
                  rem          s2, s6, s9
                  slt          s2, a7, t6
                  srl          s11, s5, t3
                  nop
                  slt          t0, sp, t0
                  csrrs        t0, 0x340, zero
                  srli         a0, s7, 26
                  c.slli       ra, 26
                  remu         t1, t2, s11
                  csrrwi       s9, 0x340, 5
                  addi         s6, s3, 1326
                  nop
                  mulh         s3, ra, t5
                  csrrci       ra, 0x340, 26
                  c.addi4spn   a1, sp, 96
                  ori          s6, a1, 955
                  c.srai       a3, 2
                  xori         ra, t3, -1595
                  nop
                  slti         a2, s0, -357
                  sub          a4, s9, t3
                  sll          a0, s9, sp
                  mulhsu       s7, a6, t5
                  c.slli       s10, 28
                  andi         s11, s9, -797
                  csrrci       a2, 0x340, 0
                  xori         s0, s1, -136
                  c.slli       t4, 12
                  xori         s10, t2, 705
                  csrrw        t5, 0x340, s3
                  c.mv         a3, s1
                  c.addi4spn   a0, sp, 304
                  or           s1, a1, s5
                  nop
                  c.addi4spn   a4, sp, 656
                  slt          a2, s4, a4
                  c.add        s0, gp
                  ori          s8, a5, 1108
                  csrrc        a4, 0x340, zero
                  c.addi16sp   sp, -16
                  and          s2, tp, t6
                  mulhu        t1, t6, a7
                  c.srli       a0, 27
                  c.srai       a4, 31
                  c.lui        tp, 18
                  c.sub        s1, a1
                  sltiu        gp, s11, -2048
                  slli         s10, a7, 27
                  rem          s3, s10, s5
                  c.li         t6, 23
                  sub          t6, t3, s7
                  c.addi16sp   sp, -16
                  srl          s10, s3, s7
                  lui          s4, 364296
                  csrrw        a6, 0x340, a6
                  c.srli       a2, 5
                  c.srli       a0, 12
                  c.addi16sp   sp, 160
                  c.and        a1, a0
                  divu         gp, t5, s1
                  div          tp, s11, s7
                  c.mv         gp, s3
                  c.lui        s3, 21
                  sll          s3, s4, s9
                  sltiu        a6, s7, -332
                  mulhu        s3, s11, tp
                  sub          s6, t6, t6
                  c.nop
                  add          s9, s6, s1
                  csrrs        a0, 0x340, a2
                  csrrwi       t5, 0x340, 11
                  c.mv         t0, s0
                  sll          s4, a0, s11
                  sll          gp, s11, a3
                  c.slli       a2, 6
                  mulhsu       a2, t3, s4
                  sub          sp, a6, a3
                  sltiu        t4, s11, -550
                  c.mv         t1, s7
                  andi         t6, s9, 1463
                  csrrs        sp, 0x340, a2
                  mul          gp, a0, s11
                  c.and        a0, a3
                  slli         ra, s1, 5
                  xori         tp, a7, -1851
                  c.srai       a4, 23
                  sltu         zero, ra, a6
                  mul          t6, s11, ra
                  sra          s5, a6, a0
                  c.add        s0, a5
                  c.addi       tp, -1
                  slli         s2, a7, 8
                  csrrci       t6, 0x340, 13
                  c.andi       a4, 8
                  csrrwi       s4, 0x340, 23
                  c.andi       a4, -1
                  rem          a0, s2, s8
                  slt          sp, a3, a4
                  auipc        t5, 67317
                  c.lui        a0, 28
                  c.srli       s0, 31
                  mul          t5, sp, t6
                  mulh         t4, a0, zero
                  slt          s3, t5, zero
                  remu         s6, sp, s2
                  c.or         a0, s0
                  slt          a0, s2, s6
                  c.addi16sp   sp, 336
                  mul          t5, s0, tp
                  mulhsu       a0, a4, t2
                  auipc        s11, 736435
                  mulhu        s5, s10, s2
                  lui          a3, 547571
                  remu         s2, a2, ra
                  slti         sp, a5, -523
                  remu         s1, s11, s0
                  sll          sp, a7, t1
                  addi         sp, s10, 760
                  mulh         s1, a6, s7
                  c.srli       a0, 8
                  add          gp, ra, t5
                  nop
                  addi         sp, zero, 1591
                  c.nop
                  c.add        s10, s6
                  slt          a1, s11, t3
                  sll          zero, t2, a3
                  c.mv         a1, t2
                  lui          a1, 582356
                  divu         a7, s6, tp
                  csrrw        a6, 0x340, s3
                  c.addi       a2, 27
                  lui          s6, 715541
                  c.addi4spn   a4, sp, 976
                  c.addi16sp   sp, 160
                  srai         gp, s3, 2
                  sltiu        t4, s0, 701
                  c.addi       s8, 4
                  slli         s4, tp, 24
                  c.srai       a1, 20
                  c.addi16sp   sp, -16
                  c.srai       a2, 12
                  slt          t0, s6, zero
                  srl          t1, gp, sp
                  remu         s0, s2, a7
                  sra          s5, tp, s5
                  csrrw        t4, 0x340, a4
                  csrrwi       zero, 0x340, 27
                  c.addi16sp   sp, 368
                  add          zero, tp, t1
                  remu         t1, gp, t4
                  addi         s0, s5, -564
                  c.lui        s8, 1
                  c.srli       a1, 24
                  csrrs        s2, 0x340, zero
                  csrrw        sp, 0x340, gp
                  c.mv         s9, s8
                  xor          s4, gp, a4
                  mul          s9, s4, s11
                  srl          s3, t3, a5
                  csrrwi       a1, 0x340, 8
                  rem          s6, t3, t1
                  slt          s0, s5, s6
                  c.srai       s1, 19
                  nop
                  c.addi       s0, 7
                  c.nop
                  c.mv         s5, t6
                  rem          a0, t0, a3
                  sll          a3, s5, zero
                  c.lui        s1, 25
                  slti         s0, s1, -1117
                  andi         s3, s0, 2040
                  srl          s8, s11, s0
                  sltu         a2, s3, t3
                  c.srai       a0, 2
                  auipc        a7, 83132
                  csrrs        t6, 0x340, t1
                  c.li         tp, 27
                  c.or         s1, s0
                  sra          gp, ra, t2
                  xor          s7, s9, a3
                  c.xor        a1, a4
                  c.addi4spn   s1, sp, 832
                  c.addi16sp   sp, 208
                  c.xor        a0, a3
                  xor          t5, t4, t3
                  c.xor        a4, a1
                  c.xor        a0, a1
                  srl          t4, a1, a6
                  slli         t1, s4, 0
                  c.slli       gp, 24
                  csrrci       s1, 0x340, 4
                  csrrci       t0, 0x340, 0
                  c.srli       s1, 5
                  add          a0, s5, s0
                  sub          s3, s6, s7
                  csrrw        zero, 0x340, s8
                  slli         s0, s3, 16
                  auipc        s11, 14142
                  srli         s5, s5, 21
                  csrrs        s10, 0x340, gp
                  add          t1, a1, a6
                  andi         s9, t4, -799
                  c.addi16sp   sp, 208
                  srl          s6, s5, s0
                  mulh         s0, s5, t6
                  c.addi16sp   sp, 288
                  or           tp, ra, a2
                  csrrc        a2, 0x340, t2
                  csrrsi       t6, 0x340, 0
                  andi         t1, tp, -145
                  sra          s2, sp, s3
                  c.sub        a0, a0
                  c.andi       s0, -1
                  mulhu        t4, s5, s8
                  c.addi16sp   sp, -16
                  srai         zero, s0, 27
                  mulhsu       s4, s11, s9
                  ori          s11, s0, -1108
                  div          a1, s11, s7
                  csrrc        s10, 0x340, ra
                  c.addi4spn   a2, sp, 496
                  csrrc        s2, 0x340, s6
                  andi         s7, a2, 1390
                  sltu         t5, a2, a5
                  mulhsu       t6, a5, t3
                  mulhsu       gp, s1, s1
                  sub          t1, a2, s6
                  c.slli       s6, 17
                  c.slli       tp, 20
                  c.add        s6, a3
                  slli         tp, s11, 15
                  c.and        a2, a0
                  divu         s10, sp, ra
                  slt          s1, s5, a1
                  c.li         a6, -1
                  c.sub        a0, a2
                  csrrc        a0, 0x340, zero
                  c.or         a4, s0
                  csrrc        a4, 0x340, zero
                  xori         a4, s11, 98
                  mulhu        s9, s4, s4
                  c.nop
                  mulhsu       s6, a3, sp
                  c.slli       s9, 1
                  addi         ra, s3, -825
                  srai         s7, s4, 12
                  remu         s8, a6, s3
                  ori          s1, t6, -507
                  c.srli       a3, 15
                  c.and        s1, a4
                  auipc        s10, 635689
                  xor          a7, t6, s9
                  nop
                  c.or         s0, s1
                  mul          a6, ra, t4
                  add          a1, a4, gp
                  c.or         s1, a4
                  add          sp, t5, s3
                  csrrwi       t4, 0x340, 12
                  mulhsu       s7, a3, a4
                  c.addi16sp   sp, -16
                  c.srai       s1, 30
                  sltu         a7, t1, a3
                  c.mv         a7, a5
                  sra          s8, ra, s8
                  c.or         a0, a4
                  addi         t6, a1, -1962
                  remu         s11, t0, t2
                  c.addi16sp   sp, -16
                  srli         s5, t5, 27
                  mulh         zero, s11, a0
                  sltu         a3, s5, gp
                  srli         s5, a1, 14
                  mulhu        a0, s7, s5
                  csrrsi       s10, 0x340, 0
                  xori         t1, t1, -1031
                  or           ra, t3, a2
                  or           a7, gp, a1
                  c.add        t5, s0
                  lui          t0, 472627
                  slti         a6, s3, -1969
                  or           s1, a6, s11
                  c.and        a1, a5
                  sra          s5, t2, s9
                  auipc        ra, 545462
                  c.and        s1, a2
                  divu         s4, s2, a4
                  mulhu        t0, s2, s0
                  c.addi16sp   sp, 368
                  sub          s10, a2, t0
                  csrrwi       a0, 0x340, 4
                  mulhu        s3, t0, t1
                  divu         s6, a5, t4
                  c.mv         t1, s2
                  csrrci       a0, 0x340, 22
                  c.addi       s1, -1
                  csrrw        t0, 0x340, s0
                  and          s1, a5, s0
                  remu         t4, a4, s9
                  slti         tp, a4, -63
                  divu         a0, ra, s0
                  andi         a0, t0, 1472
                  sltiu        gp, a3, -1711
                  c.or         a2, a1
                  csrrci       t0, 0x340, 0
                  div          gp, s7, a4
                  xor          s0, a2, t5
                  sltiu        s3, t5, 1647
                  or           s11, a5, ra
                  c.srai       a3, 22
                  srli         s7, gp, 8
                  div          t4, s1, a6
                  slli         tp, s1, 0
                  c.slli       a3, 10
                  divu         sp, s7, s6
                  csrrc        s0, 0x340, sp
                  slt          s5, s8, a7
                  csrrwi       s8, 0x340, 7
                  c.srai       a2, 15
                  xor          ra, s4, s7
                  addi         t5, s2, 567
                  c.add        ra, t5
                  csrrsi       a2, 0x340, 5
                  c.addi16sp   sp, 48
                  slt          ra, a7, a2
                  addi         tp, s5, 1355
                  add          a4, zero, a6
                  c.li         ra, -1
                  sltu         a6, t3, s11
                  ori          t5, t5, 1022
                  c.add        tp, t6
                  srli         a2, s4, 0
                  mulhu        t6, s8, a7
                  srl          gp, s0, a4
                  csrrci       s3, 0x340, 30
                  sltu         a6, t4, t1
                  slti         s10, s1, -1668
                  csrrci       s1, 0x340, 5
                  mul          gp, zero, s0
                  lui          s4, 190673
                  auipc        ra, 978681
                  c.srli       a0, 27
                  slti         s3, a3, -1069
                  sra          tp, s6, s5
                  c.lui        s5, 30
                  c.or         s0, s0
                  andi         s1, t1, -1037
                  addi         tp, ra, -778
                  addi         s9, t1, -656
                  csrrc        s4, 0x340, t0
                  auipc        zero, 517906
                  c.srli       a3, 11
                  c.nop
                  c.xor        a3, a5
                  andi         s7, a4, -1618
                  sltu         a3, t0, s4
                  c.srli       a0, 22
                  sll          s0, s0, a3
                  and          gp, a4, s10
                  csrrw        s11, 0x340, s6
                  c.slli       a2, 25
                  srl          t0, t0, a6
                  lui          a0, 422381
                  auipc        a0, 491770
                  c.nop
                  sltu         t1, s11, a0
                  xor          t5, a1, s0
                  addi         s7, a7, 1574
                  auipc        s3, 129154
                  auipc        s9, 328124
                  ori          s0, s2, 166
                  c.andi       a0, -1
                  slli         a3, a7, 14
                  mulhu        t1, sp, s2
                  csrrc        a3, 0x340, zero
                  c.slli       a2, 6
                  c.addi4spn   a4, sp, 896
                  sub          t1, a5, s2
                  sltiu        a7, s1, 675
                  c.li         s0, -1
                  csrrci       s8, 0x340, 8
                  ori          t4, a6, -1038
                  slt          s8, t2, s8
                  c.andi       a2, -1
                  c.xor        s0, s0
                  csrrsi       a1, 0x340, 0
                  c.addi16sp   sp, -16
                  srl          s8, t5, s7
                  c.srai       a0, 4
                  slti         s4, a1, -291
                  ori          a6, s7, -1038
                  mulhsu       s9, t3, t3
                  c.xor        a3, a2
                  rem          s1, a3, ra
                  c.lui        s10, 12
                  add          s7, s2, s5
                  srl          t5, a6, t6
                  srli         t6, s10, 16
                  or           t5, s5, t3
                  mulhsu       gp, a6, s1
                  sll          zero, s10, s8
                  mulhsu       t1, s6, t3
                  div          s4, s2, sp
                  c.mv         s7, a2
                  csrrwi       a3, 0x340, 26
                  nop
                  add          a1, t3, s6
                  andi         sp, ra, -1487
                  c.add        ra, t5
                  mul          a1, s2, s2
                  csrrw        a1, 0x340, a2
                  andi         a7, s6, -1338
                  slt          s9, s3, s6
                  nop
                  csrrs        zero, 0x340, s7
                  andi         s1, a0, -734
                  csrrwi       gp, 0x340, 6
                  csrrsi       a6, 0x340, 0
                  and          s7, a3, a3
                  c.addi4spn   a3, sp, 464
                  c.srli       a4, 16
                  c.srli       a4, 28
                  slt          tp, t4, a7
                  csrrci       s2, 0x340, 0
                  sltu         a0, a3, ra
                  c.nop
                  c.mv         t4, s2
                  add          a4, s8, s3
                  c.andi       s1, -1
                  c.xor        a2, s1
                  srai         sp, sp, 16
                  c.or         a3, s1
                  csrrs        a6, 0x340, zero
                  add          t5, a1, t1
                  sll          t4, a4, t4
                  nop
                  srai         a2, a6, 9
                  lui          t6, 877795
                  slti         s4, s3, 215
                  remu         t4, t0, sp
                  csrrw        gp, 0x340, zero
                  csrrc        s1, 0x340, s7
                  slti         s4, a7, 1666
                  c.addi16sp   sp, -16
                  divu         a7, zero, s2
                  rem          s4, t3, zero
                  c.add        a3, a4
                  addi         s6, a3, 1025
                  ori          t6, s0, -1968
                  mulhsu       a6, t1, s5
                  c.srai       a4, 12
                  and          ra, s11, a6
                  csrrw        sp, 0x340, t6
                  csrrc        a0, 0x340, s6
                  srli         a4, s2, 27
                  c.sub        a4, a4
                  c.srli       s1, 21
                  slli         zero, zero, 25
                  div          a1, t2, t6
                  c.andi       s0, -1
                  c.addi       s7, 3
                  rem          s3, s11, sp
                  or           t0, s11, s6
                  srl          t4, a4, t6
                  csrrci       s6, 0x340, 8
                  c.srai       a0, 25
                  divu         a1, s9, a3
                  srai         s8, s6, 20
                  sltu         a6, s4, s8
                  csrrc        s3, 0x340, zero
                  remu         s9, sp, s6
                  remu         a0, gp, s9
                  sll          s10, t1, a7
                  auipc        a2, 287761
                  sub          s3, s4, s2
                  c.nop
                  mul          s10, a2, s6
                  csrrci       s3, 0x340, 26
                  srai         a6, a3, 0
                  auipc        t6, 409188
                  mul          a0, s7, a6
                  and          s2, t3, tp
                  divu         zero, s0, a7
                  xori         s8, t3, 650
                  csrrw        s6, 0x340, a4
                  addi         t0, s9, -1218
                  c.mv         a3, t4
                  mulh         s11, a7, t2
                  sll          s6, a4, s10
                  c.add        s8, a0
                  c.xor        a2, a1
                  mulhu        a3, gp, s8
                  csrrsi       s6, 0x340, 26
                  and          s0, ra, zero
                  c.li         s3, -1
                  auipc        ra, 358549
                  mulhsu       a2, a6, t6
                  c.sub        a1, a4
                  sra          t0, s8, s1
                  c.srai       a3, 12
                  lui          ra, 137399
                  c.and        a3, a2
                  lui          s5, 309303
                  csrrci       zero, 0x340, 0
                  div          tp, a5, s6
                  c.nop
                  slli         s7, s6, 10
                  c.sub        s0, a0
                  sll          s0, tp, t4
                  slli         sp, s4, 26
                  slti         t5, t6, -618
                  c.addi16sp   sp, -16
                  srai         tp, a7, 17
                  srl          a4, a6, s8
                  mul          s3, a1, s0
                  nop
                  rem          s6, zero, sp
                  mulh         s9, t0, a0
                  slti         a2, a1, 171
                  c.mv         t4, t2
                  rem          s1, s10, t1
                  csrrwi       s0, 0x340, 6
                  xori         a6, ra, 1367
                  c.slli       a1, 3
                  c.srli       a1, 26
                  c.srai       a2, 16
                  c.and        a0, a5
                  csrrwi       a2, 0x340, 5
                  c.addi4spn   s1, sp, 720
                  nop
                  c.srli       s0, 22
                  csrrs        s9, 0x340, a4
                  c.xor        a3, a5
                  divu         a0, s7, a7
                  sll          s9, s7, s0
                  c.add        gp, gp
                  c.add        a1, a7
                  c.lui        s6, 7
                  csrrwi       a2, 0x340, 16
                  slli         ra, t5, 11
                  and          tp, s0, t0
                  c.addi4spn   a1, sp, 832
                  srl          gp, a4, a0
                  mulhu        s10, a1, s5
                  slti         s1, s2, -410
                  c.li         s0, -1
                  rem          s3, s4, a4
                  lui          gp, 133361
                  mulhsu       t4, a6, sp
                  mulhu        s3, a0, s11
                  mulhu        t0, s8, a7
                  csrrsi       t0, 0x340, 0
                  slt          s11, a4, s11
                  c.addi       s4, -1
                  sltu         sp, s1, sp
                  srli         s7, a2, 0
                  c.xor        a0, s1
                  c.xor        a1, a5
                  c.and        a3, a1
                  c.li         s6, -1
                  sub          a6, s4, s1
                  c.nop
                  ori          t6, a5, -966
                  xor          a4, s6, a7
                  slti         a6, s4, -551
                  slli         t4, s7, 19
                  or           tp, s0, t6
                  andi         tp, s2, 842
                  csrrw        t1, 0x340, s11
                  csrrc        zero, 0x340, zero
                  mulh         t6, t4, s7
                  c.srli       a0, 15
                  c.and        s0, a0
                  mul          t0, s9, t6
                  sltu         a3, zero, a1
                  c.mv         a1, a7
                  mulh         s7, s11, s10
                  csrrsi       s11, 0x340, 28
                  srli         a4, s3, 5
                  sltu         s2, a1, s3
                  remu         s2, s4, a5
                  slti         a2, zero, 1777
                  csrrsi       t4, 0x340, 9
                  csrrw        a6, 0x340, zero
                  sll          a3, s11, s6
                  nop
                  c.srai       s1, 20
                  andi         s8, t3, 1149
                  csrrsi       gp, 0x340, 17
                  c.sub        a3, s0
                  c.add        s7, ra
                  c.srai       s1, 8
                  and          t4, a5, a4
                  c.lui        t5, 10
                  mulh         a4, a4, t2
                  csrrci       s6, 0x340, 0
                  sltiu        a1, sp, -325
                  slti         a7, t6, 947
                  mul          s10, s1, t5
                  c.nop
                  c.addi16sp   sp, 80
                  c.slli       s1, 16
                  rem          zero, t3, s4
                  srl          a7, s10, s11
                  srl          t0, a0, s9
                  c.andi       a2, -1
                  mulhu        a6, s5, tp
                  div          s11, s6, s1
                  mulhsu       a1, a2, s5
                  sll          t5, t0, a3
                  csrrc        t0, 0x340, zero
                  mulhsu       t6, s9, zero
                  csrrci       s3, 0x340, 0
                  sub          t5, s9, s4
                  csrrsi       t4, 0x340, 20
                  divu         t5, a7, s7
                  xor          s4, gp, s4
                  slti         s1, s9, -1863
                  csrrwi       gp, 0x340, 18
                  c.srli       s1, 28
                  xori         t5, a0, -1124
                  slti         a1, gp, 798
                  nop
                  csrrw        s6, 0x340, ra
                  andi         s4, s0, -512
                  c.slli       s10, 29
                  srai         s11, t2, 27
                  c.andi       a2, 6
                  auipc        s9, 863089
                  c.and        a0, s0
                  addi         s11, s6, 1662
                  nop
                  srai         t5, t6, 5
                  csrrw        gp, 0x340, zero
                  slti         s3, a0, -1374
                  c.add        s11, t4
                  mul          s7, a2, s10
                  c.addi       gp, 28
                  mulhsu       s4, a7, s10
                  add          s6, s6, t0
                  csrrc        s2, 0x340, zero
                  ori          a1, s4, 803
                  sltiu        s7, s4, 1695
                  c.andi       s1, 19
                  add          a7, t5, s10
                  csrrwi       a7, 0x340, 26
                  sll          t5, t0, a2
                  mul          a2, s7, gp
                  slli         s6, a4, 4
                  mulh         s10, s5, a3
                  csrrwi       s1, 0x340, 8
                  addi         t6, tp, 377
                  csrrci       a4, 0x340, 8
                  csrrw        s2, 0x340, t4
                  auipc        s9, 1035375
                  c.li         s7, 5
                  c.nop
                  c.srai       a2, 25
                  sltiu        sp, gp, 702
                  sra          s9, s4, a1
                  lui          t0, 834812
                  rem          gp, s4, a7
                  c.add        t4, s11
                  ori          gp, s5, 694
                  sra          sp, s5, s0
                  or           s11, t2, s3
                  mul          s6, s3, sp
                  remu         ra, a6, a2
                  c.addi4spn   a1, sp, 16
                  srli         a6, a3, 4
                  c.nop
                  c.addi       ra, 22
                  csrrc        s9, 0x340, zero
                  c.addi4spn   a4, sp, 656
                  auipc        sp, 523258
                  lui          t4, 510112
                  slli         a2, a5, 21
                  mulhsu       s0, t5, a1
                  mulhsu       s9, t3, sp
                  addi         a4, t4, -518
                  c.add        s10, s1
                  mulhsu       t5, s7, a6
                  addi         s1, tp, 1745
                  sltiu        s8, s11, 1951
                  sltu         a2, ra, s7
                  c.srai       a1, 27
                  c.or         s1, a5
                  andi         s4, a3, 1753
                  csrrwi       t0, 0x340, 0
                  auipc        t5, 1031436
                  ori          t1, a0, 1661
                  c.addi       s9, -1
                  c.xor        a1, a5
                  div          s2, sp, a4
                  divu         a6, a2, a3
                  mulhsu       t6, t3, s5
                  srl          a1, a1, a0
                  c.sub        a1, a2
                  csrrw        t5, 0x340, s8
                  c.slli       a4, 1
                  c.li         a1, 12
                  c.lui        s11, 10
                  sub          gp, s1, ra
                  divu         s8, a2, s11
                  divu         a1, s8, tp
                  div          t4, a6, t3
                  c.addi16sp   sp, -16
                  sltu         a4, sp, a1
                  c.andi       a1, -1
                  c.and        s0, a3
                  csrrci       s9, 0x340, 26
                  mul          s11, s11, ra
                  srai         t1, s5, 16
                  c.lui        s3, 17
                  remu         a4, s5, s6
                  mulhsu       tp, a0, tp
                  addi         zero, s2, 1986
                  c.nop
                  sub          tp, t3, t6
                  c.and        a2, s1
                  div          s10, t2, a3
                  c.li         s8, -1
                  sll          t5, a6, s4
                  mulhu        s2, a4, t0
                  c.add        s4, s9
                  and          ra, s7, a6
                  srl          a2, s5, a4
                  srl          a0, zero, s5
                  c.sub        a3, a3
                  ori          s0, a0, 166
                  c.and        a3, s0
                  remu         s0, s6, t0
                  slti         t5, tp, -44
                  div          ra, sp, s8
                  c.slli       s10, 30
                  slt          a2, ra, a3
                  andi         s11, s5, 1830
                  c.srli       a0, 28
                  lui          a7, 526477
                  c.li         s2, 10
                  rem          a3, s5, s11
                  srli         a6, s1, 9
                  c.addi16sp   sp, 384
                  xori         s8, s8, 512
                  sra          a1, sp, s9
                  sltu         s7, a2, tp
                  csrrs        t1, 0x340, t4
                  c.mv         a2, s4
                  slli         s11, s10, 8
                  csrrw        s10, 0x340, s2
                  nop
                  remu         t1, a0, sp
                  divu         zero, t0, tp
                  divu         s7, a0, s10
                  c.addi       s5, 23
                  srai         gp, a0, 14
                  andi         s8, t6, -491
                  rem          a2, gp, a3
                  c.srai       a4, 13
                  lui          s8, 520088
                  csrrs        s3, 0x340, t0
                  auipc        s4, 12486
                  xor          t4, a1, a0
                  auipc        gp, 1038428
                  c.lui        s2, 29
                  add          a0, gp, t1
                  c.add        t0, a7
                  auipc        ra, 128419
                  slt          s4, t2, s1
                  csrrci       s5, 0x340, 0
                  c.sub        s0, a5
                  mulh         s2, t3, s0
                  sltiu        a6, a3, -531
                  c.add        a4, a4
                  nop
                  xori         a0, t0, 1916
                  rem          s5, ra, t6
                  xori         a0, gp, -514
                  csrrs        s2, 0x340, zero
                  sltu         t5, s6, a6
                  mulhsu       s0, tp, a6
                  c.lui        a2, 16
                  c.xor        a3, a2
                  c.lui        s1, 22
                  sra          t6, a7, s7
                  c.lui        tp, 20
                  div          a4, s7, t5
                  c.srai       s1, 2
                  sltu         t4, s4, a6
                  c.mv         a0, a7
                  addi         t4, t6, 317
                  c.addi16sp   sp, -16
                  c.li         a0, -1
                  c.addi4spn   a0, sp, 320
                  lui          s11, 444802
                  c.srli       a1, 6
                  csrrwi       a7, 0x340, 1
                  csrrci       s2, 0x340, 0
                  mulh         a6, s9, t2
                  csrrs        s8, 0x340, zero
                  slli         s7, t6, 11
                  c.lui        t0, 8
                  srai         s1, s8, 22
                  mulhsu       s2, t1, s2
                  auipc        s1, 968912
                  sra          tp, s3, s9
                  ori          s1, tp, -1481
                  csrrw        a7, 0x340, s10
                  lui          ra, 1044439
                  csrrwi       s1, 0x340, 28
                  c.lui        a3, 21
                  slli         s3, s6, 28
                  c.xor        s1, a4
                  c.sub        a4, a0
                  c.srai       a0, 17
                  srli         ra, t6, 23
                  mulhsu       t0, t5, t5
                  xor          t0, s11, t0
                  sra          a0, gp, s1
                  csrrw        s2, 0x340, t3
                  srl          t6, zero, a5
                  csrrwi       t6, 0x340, 13
                  c.add        t5, s4
                  xori         t1, s6, -1887
                  div          a1, s5, tp
                  add          s5, t6, s4
                  sub          gp, t1, s0
                  mul          s8, a4, s7
                  c.li         t4, -1
                  addi         t0, a3, -968
                  csrrs        s7, 0x340, a5
                  srli         a7, s1, 12
                  srl          a0, a5, zero
                  csrrs        t0, 0x340, t5
                  srai         s4, a1, 2
                  c.li         a2, 27
                  c.or         a2, a5
                  sll          gp, s10, t6
                  xori         a1, s9, 823
                  c.and        a3, a5
                  mul          zero, s9, s7
                  c.mv         t6, t0
                  sltu         t5, s4, s7
                  lui          ra, 94831
                  csrrwi       sp, 0x340, 1
                  slli         gp, t0, 27
                  slti         s10, ra, 1961
                  c.andi       a3, 17
                  sltiu        a7, a4, 1294
                  c.addi16sp   sp, -16
                  mulhsu       a4, a4, t1
                  srai         a7, s8, 25
                  c.mv         s1, a0
                  divu         s11, s9, s11
                  andi         s1, s1, 859
                  rem          t0, zero, s9
                  divu         s3, t1, s11
                  c.add        t6, a3
                  csrrci       s9, 0x340, 0
                  xor          a7, t4, zero
                  c.add        s3, gp
                  c.lui        a0, 2
                  c.srai       a0, 19
                  or           s6, t2, gp
                  andi         s9, s4, 376
                  csrrwi       s6, 0x340, 26
                  c.or         a4, s0
                  c.or         s1, s0
                  csrrsi       s2, 0x340, 26
                  csrrs        s11, 0x340, sp
                  c.andi       s0, -1
                  slti         tp, a6, -1980
                  c.slli       s9, 1
                  csrrs        a2, 0x340, zero
                  csrrsi       gp, 0x340, 0
                  c.addi16sp   sp, -16
                  xor          s1, s0, a6
                  remu         s1, tp, a2
                  mul          t4, tp, zero
                  c.addi       gp, -1
                  c.srli       a3, 26
                  sltu         t5, s0, s11
                  mulh         s2, a7, a4
                  c.add        s10, s0
                  c.mv         t0, a0
                  addi         s5, s7, 612
                  srai         t0, t1, 29
                  slt          a3, t2, t5
                  c.srli       a0, 2
                  csrrc        a7, 0x340, zero
                  nop
                  slli         s7, sp, 4
                  csrrs        s3, 0x340, zero
                  csrrc        t1, 0x340, zero
                  addi         ra, s3, 679
                  csrrwi       t1, 0x340, 21
                  ori          s3, t6, 355
                  csrrci       a1, 0x340, 3
                  c.addi16sp   sp, -16
                  srl          tp, s0, a6
                  csrrci       t0, 0x340, 0
                  xori         a2, t0, 916
                  slli         a2, s1, 0
                  slti         a4, a7, 1275
                  add          s2, s3, a0
                  xor          ra, t1, s7
                  srl          a6, a6, tp
                  ori          a1, s6, -591
                  csrrsi       gp, 0x340, 29
                  csrrw        a1, 0x340, s9
                  c.srai       a0, 2
                  divu         sp, s7, ra
                  ori          sp, s3, 1574
                  csrrc        tp, 0x340, sp
                  rem          s6, s7, s5
                  mul          a1, s8, t4
                  mulhu        s10, a1, s11
                  mulhsu       t1, s1, gp
                  sll          tp, a3, s2
                  c.nop
                  csrrsi       ra, 0x340, 0
                  csrrci       a6, 0x340, 0
                  add          s9, t0, t2
                  or           a3, s9, s4
                  xor          a1, tp, a3
                  divu         s4, s1, a5
                  csrrs        s3, 0x340, zero
                  sltu         s10, t3, a1
                  c.add        s0, t0
                  srl          s9, s7, t0
                  xori         t1, s8, -1799
                  and          s9, a5, gp
                  xor          s5, s6, a7
                  auipc        s7, 814882
                  sub          t4, a0, a0
                  c.lui        s5, 15
                  mulhsu       a3, a2, tp
                  c.nop
                  csrrs        t4, 0x340, s9
                  c.srai       s1, 24
                  c.srai       a2, 9
                  or           s6, t2, zero
                  csrrwi       s1, 0x340, 21
                  add          t0, a4, a2
                  c.addi       a3, 23
                  csrrs        s4, 0x340, zero
                  c.addi       s11, -1
                  csrrwi       s6, 0x340, 17
                  srai         s3, s9, 23
                  c.sub        a4, a1
                  sltu         s9, s9, t3
                  add          s4, sp, zero
                  auipc        sp, 805169
                  csrrs        t4, 0x340, s11
                  sltu         a2, t4, s0
                  sltu         t6, sp, a2
                  csrrc        s4, 0x340, s4
                  c.slli       sp, 31
                  mulhsu       s6, s0, sp
                  c.addi4spn   a4, sp, 1008
                  mulhu        s0, t2, s5
                  slli         a6, s11, 3
                  mul          s7, s7, s3
                  lui          a2, 653142
                  mulh         gp, a4, s0
                  csrrci       s11, 0x340, 8
                  nop
                  c.slli       gp, 13
                  c.srli       s1, 17
                  sra          ra, a0, a2
                  add          a4, tp, s9
                  c.addi4spn   a0, sp, 688
                  divu         a4, t2, a0
                  c.or         a2, a0
                  csrrs        s4, 0x340, zero
                  slt          a4, s4, a6
                  nop
                  auipc        t5, 635582
                  c.srli       a2, 15
                  ori          t4, a6, 811
                  c.nop
                  rem          s3, a7, s8
                  c.slli       a7, 16
                  c.or         a3, a0
                  c.addi       t5, 3
                  mulh         s10, s4, t6
                  slti         t5, s10, 122
                  sra          s1, t1, t3
                  mulhu        tp, t2, s8
                  c.addi       s8, -1
                  csrrs        t4, 0x340, zero
                  c.lui        t0, 9
                  add          gp, t4, a0
                  mul          zero, t0, s0
                  nop
                  mulhu        sp, t2, a0
                  c.sub        a2, a4
                  slt          s4, s0, sp
                  csrrw        sp, 0x340, s1
                  divu         s6, s7, a4
                  c.or         a3, a1
                  rem          gp, s7, t6
                  c.srli       a2, 21
                  addi         a1, t6, -1466
                  c.addi4spn   a4, sp, 16
                  c.xor        s1, a5
                  c.addi4spn   a3, sp, 400
                  c.xor        a1, a3
                  slt          s2, gp, s11
                  sltu         t1, s10, a2
                  sub          s4, s5, a1
                  c.xor        a4, a4
                  c.and        a4, s1
                  csrrc        ra, 0x340, zero
                  srai         a0, s8, 1
                  c.li         a2, 10
                  mulhsu       gp, ra, s3
                  sll          a6, s10, s3
                  c.andi       a2, 26
                  add          s10, t6, ra
                  slli         a2, a0, 29
                  sll          s2, a0, a1
                  lui          s5, 64860
                  c.srai       s1, 5
                  sltiu        s9, a1, -708
                  csrrci       a4, 0x340, 17
                  divu         s9, t5, s5
                  c.add        s4, t4
                  xori         s6, s3, 1450
                  mul          a2, zero, a3
                  mul          s3, t4, ra
                  srli         t6, s2, 0
                  rem          t1, s3, s0
                  c.addi       a4, 19
                  csrrc        zero, 0x340, s6
                  csrrsi       s0, 0x340, 13
                  addi         a4, s11, -1321
                  and          t5, t5, s4
                  remu         gp, t1, s1
                  div          ra, s10, a0
                  c.or         a2, a2
                  c.xor        a0, a2
                  xor          a4, a7, tp
                  srai         a6, s2, 7
                  nop
                  lui          sp, 608583
                  c.mv         s11, t4
                  ori          t5, s11, -1921
                  slt          a6, s6, t6
                  sub          a7, s3, s6
                  c.andi       s0, -1
                  csrrw        a2, 0x340, tp
                  c.addi16sp   sp, 400
                  csrrs        t0, 0x340, s1
                  c.srli       a2, 8
                  sltu         ra, s7, s3
                  sltiu        a3, s8, 1375
                  sra          a7, zero, s11
                  auipc        s8, 43346
                  sra          zero, s9, s0
                  xori         zero, t4, -1966
                  c.sub        s1, a0
                  sub          zero, t1, a0
                  c.mv         s2, t4
                  srl          a6, a7, s2
                  xor          a0, tp, s8
                  sll          t4, s5, s1
                  addi         a0, a5, -1466
                  c.add        s1, s10
                  lui          ra, 827472
                  sltiu        a0, ra, 328
                  srli         t0, a6, 10
                  slli         a0, s3, 19
                  c.andi       s1, 11
                  div          a1, gp, s9
                  c.or         a4, a5
                  mulhu        s11, s1, a0
                  csrrwi       t5, 0x340, 17
                  c.slli       s4, 14
                  c.add        a0, a0
                  sltu         s10, a3, t4
                  sll          a7, s6, gp
                  c.lui        s2, 25
                  c.slli       s7, 5
                  c.srli       a2, 22
                  or           a2, sp, s0
                  csrrc        s1, 0x340, zero
                  sltu         a3, s11, a0
                  auipc        zero, 444547
                  xor          a4, s8, t2
                  add          t5, t1, a4
                  and          t6, gp, ra
                  remu         t5, a1, s2
                  mulhsu       s11, t2, s6
                  sltiu        a0, t0, -832
                  div          a6, a5, s2
                  auipc        s2, 978860
                  csrrci       sp, 0x340, 2
                  csrrc        a2, 0x340, a1
                  sltiu        s2, a6, 1580
                  c.xor        a0, a0
                  srai         a1, a2, 14
                  slli         a2, a2, 24
                  remu         s3, s11, sp
                  srl          s0, s4, s0
                  c.add        s0, s3
                  mulh         a3, s1, s1
                  c.and        s0, a4
                  c.or         a2, a3
                  srl          a4, s4, s7
                  srai         s8, s8, 31
                  sltu         a1, s9, s9
                  c.add        s5, s11
                  c.mv         a4, s1
                  c.srli       s0, 15
                  divu         s0, a0, a3
                  c.and        a1, a2
                  lui          s10, 569322
                  sll          s11, ra, a0
                  csrrsi       s0, 0x340, 0
                  csrrsi       gp, 0x340, 0
                  mulh         t0, t6, a4
                  ori          t1, s6, -1446
                  sll          sp, a5, s10
                  xor          s9, zero, s6
                  csrrsi       ra, 0x340, 0
                  and          s8, ra, a6
                  slt          s0, s5, sp
                  sll          s2, zero, t6
                  mulhu        a0, s8, t1
                  c.srli       s0, 7
                  mulhsu       a7, t4, a1
                  auipc        s8, 655982
                  and          a7, s5, a2
                  c.andi       s1, -1
                  slt          t5, ra, a2
                  sll          t0, s8, t1
                  slli         s0, t6, 29
                  csrrc        s3, 0x340, zero
                  c.xor        a3, a1
                  mulhu        t6, t2, ra
                  add          sp, s9, t3
                  auipc        a4, 241237
                  or           s1, a2, a5
                  c.addi4spn   a1, sp, 112
                  csrrs        tp, 0x340, zero
                  csrrwi       s2, 0x340, 2
                  c.srai       a1, 5
                  csrrs        s4, 0x340, s1
                  sltiu        s4, a0, 1819
                  srai         s0, a7, 12
                  c.xor        a1, s1
                  csrrwi       t5, 0x340, 6
                  c.lui        t4, 2
                  mulh         tp, s11, sp
                  c.nop
                  nop
                  or           s5, a4, s10
                  c.nop
                  c.li         a0, 24
                  c.addi       s11, 16
                  csrrci       tp, 0x340, 3
                  auipc        s11, 918508
                  c.add        s1, s8
                  slti         t5, s1, 308
                  srai         a1, ra, 16
                  sltiu        s7, a3, 1825
                  sub          s1, s2, s11
                  c.nop
                  srl          a1, a0, s7
                  csrrw        s4, 0x340, t3
                  lui          s4, 146277
                  sltu         s2, s2, a2
                  c.and        a3, a3
                  and          s9, s1, t1
                  lui          a3, 930123
                  c.xor        s0, s0
                  slti         a6, tp, 112
                  c.lui        tp, 28
                  mulhu        a3, ra, t2
                  csrrwi       s2, 0x340, 31
                  rem          s6, t1, s6
                  mulhu        s1, t5, tp
                  c.lui        gp, 25
                  c.li         t1, 9
                  csrrsi       s8, 0x340, 20
                  c.or         a0, s0
                  c.xor        a1, a3
                  sra          s4, s4, t4
                  srai         a6, s2, 27
                  srai         a0, tp, 22
                  c.addi16sp   sp, -16
                  csrrs        a1, 0x340, s3
                  c.srli       a3, 6
                  mulhsu       t4, s7, t0
                  csrrc        s11, 0x340, s3
                  csrrwi       zero, 0x340, 4
                  c.addi4spn   a3, sp, 944
                  c.srli       a0, 20
                  c.mv         a4, a7
                  c.addi4spn   a2, sp, 144
                  sltu         s2, s6, t2
                  csrrc        s7, 0x340, a0
                  c.andi       s1, 2
                  c.andi       a1, -1
                  xor          a0, s2, t0
                  nop
                  auipc        t5, 842024
                  lui          s0, 90347
                  mulh         t1, a3, s2
                  mulhu        zero, s10, a5
                  sltu         s2, s6, a6
                  xor          a6, a7, s6
                  c.nop
                  c.addi4spn   a4, sp, 240
                  sltu         s10, gp, gp
                  c.nop
                  c.andi       a1, 23
                  srli         s6, s5, 20
                  sll          s8, a6, s2
                  c.or         a3, a1
                  csrrw        s1, 0x340, s7
                  sra          t1, t0, a4
                  lui          ra, 420036
                  c.addi16sp   sp, 384
                  c.srai       a1, 2
                  srai         a3, a6, 23
                  and          sp, s5, t5
                  c.li         s2, -1
                  c.nop
                  addi         gp, a7, 127
                  srli         s5, a6, 8
                  srli         zero, t1, 28
                  c.lui        s8, 11
                  c.addi4spn   s1, sp, 656
                  addi         zero, s3, 597
                  xori         s0, zero, -199
                  add          s3, t4, t3
                  rem          s4, t0, t1
                  csrrsi       s2, 0x340, 14
                  srli         s11, ra, 15
                  c.mv         s0, s4
                  sltu         s7, s4, t5
                  c.xor        s0, a4
                  csrrw        s8, 0x340, a1
                  andi         a1, t6, 147
                  xori         s10, t5, 141
                  c.srli       a4, 17
                  slti         t6, sp, -1448
                  csrrc        a4, 0x340, zero
                  srai         s10, s5, 16
                  addi         t5, a0, 1129
                  div          a0, s8, s10
                  sltu         s0, s4, s6
                  mulhsu       s4, t5, tp
                  addi         sp, s7, 21
                  c.sub        a4, a5
                  xor          s2, t3, a2
                  xor          s10, a6, a7
                  srl          s7, s6, a3
                  c.li         s9, 1
                  srl          t5, sp, t4
                  xori         s4, a3, -892
                  and          ra, s3, s6
                  csrrc        a3, 0x340, t1
                  c.srai       s0, 2
                  nop
                  c.srai       s1, 16
                  lui          a7, 339693
                  c.slli       a0, 2
                  sltu         a1, s10, ra
                  and          a7, s3, s10
                  c.and        s1, s1
                  xori         s1, a5, 175
                  csrrc        s7, 0x340, s5
                  sltu         t6, zero, a2
                  sra          s0, t0, t0
                  xori         a1, s10, 1895
                  lui          s9, 137010
                  csrrs        ra, 0x340, zero
                  sll          gp, s1, a0
                  csrrwi       a6, 0x340, 19
                  or           t4, t5, t2
                  srai         a3, t6, 23
                  srl          gp, s4, s8
                  mul          s8, s4, a5
                  csrrc        tp, 0x340, t5
                  c.mv         t0, s7
                  c.addi       s10, 18
                  mul          a7, s3, gp
                  rem          s8, s10, s0
                  slti         a7, a3, 1783
                  divu         t1, s5, a3
                  c.slli       s2, 10
                  sll          s8, a4, sp
                  auipc        s11, 444348
                  c.andi       s1, 9
                  auipc        s0, 432801
                  nop
                  andi         a6, s8, -1204
                  mulh         a2, t1, s7
                  xori         gp, t3, 439
                  sltu         sp, a1, s5
                  sra          s8, t4, a2
                  mulhu        ra, tp, a7
                  rem          tp, t0, s1
                  andi         ra, s3, -881
                  and          t1, s11, s2
                  c.srai       a0, 11
                  sra          a0, a5, tp
                  sra          t4, t3, s7
                  slti         sp, t5, 585
                  sltiu        a2, s8, -695
                  or           s3, t4, s11
                  c.and        a1, a3
                  auipc        s6, 512880
                  csrrc        a6, 0x340, zero
                  xori         t1, s4, -323
                  mul          s0, a5, zero
                  csrrw        t4, 0x340, a6
                  c.srli       a0, 12
                  slti         a6, s8, -1213
                  nop
                  c.sub        s1, s1
                  and          sp, a3, t0
                  div          zero, s3, s11
                  divu         s1, a1, s10
                  c.nop
                  c.srai       a3, 19
                  xori         t0, ra, 1901
                  csrrci       sp, 0x340, 0
                  xor          gp, t4, s8
                  c.lui        a4, 7
                  sltiu        t4, t5, -466
                  slti         a1, a2, -1611
                  xor          s4, s2, tp
                  mulhsu       gp, t0, a4
                  or           s2, s3, s7
                  c.slli       gp, 13
                  sra          a0, s8, s11
                  sra          tp, zero, s3
                  nop
                  nop
                  c.mv         a4, a7
                  c.xor        a4, a0
                  lui          a6, 638582
                  mul          s7, s1, a7
                  and          s0, s11, a6
                  ori          zero, s0, -598
                  mulhu        a3, s0, t1
                  addi         s2, s1, 964
                  xori         ra, s2, -1437
                  remu         s0, zero, a4
                  c.addi4spn   a0, sp, 480
                  c.slli       t0, 11
                  ori          a1, s8, -1047
                  and          sp, s4, t0
                  addi         s8, t2, 1263
                  sub          t1, s0, s9
                  csrrci       a4, 0x340, 0
                  divu         a4, a7, a0
                  csrrc        s1, 0x340, zero
                  c.slli       s5, 10
                  nop
                  csrrs        a6, 0x340, s4
                  c.slli       s6, 2
                  sub          s0, a3, s11
                  mulhsu       s5, t3, a0
                  csrrci       s4, 0x340, 8
                  ori          ra, s7, -7
                  mul          s7, s5, zero
                  csrrwi       s10, 0x340, 13
                  c.srli       a2, 19
                  mulhsu       s8, a5, s2
                  c.addi16sp   sp, 336
                  sra          s5, s7, t1
                  slti         s0, tp, -35
                  c.mv         a1, s4
                  c.nop
                  srli         sp, s6, 1
                  rem          s9, s11, t1
                  c.and        a4, s0
                  xori         s8, a3, 461
                  slti         s0, a6, -1203
                  or           a6, a0, a7
                  mulhsu       s11, t6, sp
                  add          t6, t6, s10
                  lui          ra, 747688
                  sub          s8, a1, gp
                  csrrsi       s8, 0x340, 30
                  mulh         t4, a2, gp
                  csrrsi       s1, 0x340, 10
                  c.srli       a4, 21
                  csrrs        s9, 0x340, s4
                  slli         s6, a4, 4
                  csrrc        gp, 0x340, zero
                  divu         s11, tp, a6
                  nop
                  csrrwi       s5, 0x340, 14
                  srli         t4, s4, 6
                  c.and        s1, s1
                  csrrsi       s0, 0x340, 23
                  csrrw        t4, 0x340, t0
                  csrrw        s0, 0x340, s0
                  csrrwi       t1, 0x340, 14
                  andi         tp, a5, -1160
                  csrrci       s10, 0x340, 26
                  addi         s9, a5, -132
                  div          s11, a6, ra
                  c.sub        a0, a2
                  csrrci       s5, 0x340, 22
                  csrrs        s10, 0x340, zero
                  srai         s2, s7, 26
                  andi         t5, sp, -1825
                  c.and        a0, a0
                  slli         s7, s5, 10
                  srai         zero, s11, 30
                  mulhsu       a3, sp, ra
                  nop
                  rem          t6, a4, t4
                  c.addi       t4, -1
                  rem          s4, tp, sp
                  xori         ra, s9, -1279
                  csrrw        tp, 0x340, sp
                  c.slli       s5, 7
                  c.nop
                  c.xor        a3, s1
                  c.mv         t5, s6
                  or           a6, gp, s11
                  mulhu        s3, t3, a4
                  sltu         gp, s9, s9
                  andi         s8, a6, 1561
                  lui          a6, 692637
                  c.or         a1, a4
                  csrrs        s6, 0x340, s8
                  csrrsi       s6, 0x340, 0
                  c.xor        a3, a5
                  mul          s9, s0, t4
                  c.and        s0, s1
                  or           t6, a7, t1
                  slt          sp, t1, s10
                  lui          s0, 532453
                  c.srli       a4, 23
                  c.addi       s9, 16
                  addi         sp, tp, -1486
                  add          t4, a1, s0
                  c.or         a3, a5
                  sra          ra, s6, s4
                  csrrs        gp, 0x340, zero
                  c.addi16sp   sp, 464
                  andi         s10, t2, -884
                  rem          t0, s5, s1
                  slli         s11, s10, 13
                  remu         s10, a7, s5
                  csrrw        s4, 0x340, t5
                  slt          gp, t3, ra
                  remu         t0, s6, gp
                  slti         s5, sp, -184
                  c.srai       a1, 19
                  c.addi       ra, 25
                  slti         a6, a7, 314
                  csrrwi       t1, 0x340, 13
                  sltiu        t5, t1, -1404
                  c.and        a3, a2
                  lui          a3, 1002479
                  csrrci       a1, 0x340, 0
                  c.addi4spn   s1, sp, 448
                  csrrwi       zero, 0x340, 8
                  auipc        s10, 142669
                  remu         sp, ra, s7
                  add          ra, t4, s10
                  c.lui        s7, 18
                  csrrci       s11, 0x340, 0
                  c.or         s1, a5
                  slli         a2, a1, 4
                  c.nop
                  or           a7, t3, t1
                  divu         sp, t4, a6
                  slt          t4, t1, sp
                  c.srai       a0, 5
                  srai         a7, s11, 20
                  c.or         s1, a3
                  c.nop
                  divu         a7, s10, s5
                  sll          a0, s1, tp
                  mul          s2, t6, s11
                  csrrwi       s0, 0x340, 6
                  andi         gp, t0, -164
                  auipc        s6, 675902
                  c.and        s0, s1
                  c.andi       a3, -1
                  slti         t1, t4, -861
                  c.andi       s0, -1
                  csrrc        s6, 0x340, t3
                  csrrwi       s5, 0x340, 16
                  csrrw        sp, 0x340, a4
                  c.lui        s2, 26
                  remu         sp, s10, s5
                  xor          a1, s10, t4
                  mul          tp, t0, a2
                  and          a3, zero, s3
                  andi         s2, t3, 1390
                  or           s3, s8, a1
                  slti         t5, s5, 829
                  csrrs        s10, 0x340, s0
                  srl          s4, s2, s10
                  srai         t4, a3, 28
                  mulhsu       s7, s5, s7
                  sub          s5, s7, s3
                  auipc        a3, 1000149
                  mulhsu       s2, a0, s6
                  csrrc        s0, 0x340, zero
                  divu         a0, s0, s6
                  mulh         s7, a6, a1
                  lui          a0, 568771
                  srl          s7, a5, t3
                  c.lui        s5, 29
                  mulhsu       a3, a7, s4
                  rem          a6, s6, a1
                  slti         s0, s2, 959
                  mulhu        s1, t4, a3
                  sll          s6, t2, t1
                  slli         a1, s6, 17
                  c.addi4spn   s0, sp, 928
                  c.lui        gp, 23
                  c.addi16sp   sp, 352
                  rem          s11, tp, s7
                  c.srai       a1, 28
                  or           a4, gp, zero
                  c.addi4spn   a0, sp, 416
                  sub          t4, t2, t4
                  csrrw        gp, 0x340, t2
                  andi         s2, t1, -900
                  c.sub        s0, a5
                  csrrci       t1, 0x340, 0
                  div          s9, s11, a1
                  srl          zero, s3, t0
                  div          tp, s5, s4
                  nop
                  slli         t0, t6, 6
                  c.lui        s1, 23
                  c.nop
                  c.slli       s8, 9
                  c.sub        s0, a1
                  sra          s0, gp, a0
                  csrrsi       a3, 0x340, 0
                  mul          s8, sp, t6
                  csrrc        s11, 0x340, a3
                  csrrwi       t4, 0x340, 4
                  addi         t6, s1, -1043
                  c.add        s1, s6
                  or           gp, a5, t0
                  c.and        a4, a4
                  c.sub        a4, s1
                  add          a3, t3, s1
                  lui          a3, 27867
                  c.srli       s0, 30
                  srl          sp, zero, s3
                  remu         sp, s1, s4
                  sra          a0, s7, gp
                  remu         a6, a6, zero
                  c.sub        a3, a5
                  csrrs        s0, 0x340, s6
                  sltiu        ra, s0, -42
                  sll          t4, s7, s5
                  csrrw        zero, 0x340, a1
                  slt          s4, zero, s0
                  c.xor        a4, a4
                  c.slli       s9, 2
                  c.lui        a2, 30
                  c.or         a4, a2
                  slt          a0, s3, sp
                  mul          t0, s10, t2
                  c.add        t5, s8
                  divu         zero, a3, t3
                  c.srli       a2, 23
                  slti         t0, t0, -557
                  nop
                  sltu         ra, t5, a1
                  sra          a7, s6, t4
                  sll          sp, s10, s5
                  c.andi       a4, -1
                  addi         tp, a1, -1689
                  c.sub        a2, a5
                  c.srai       a2, 25
                  csrrci       s5, 0x340, 0
                  c.xor        a2, a5
                  sra          s3, t6, a1
                  c.lui        s0, 20
                  c.srai       s1, 15
                  srai         s11, a7, 29
                  c.sub        s1, s1
                  srli         sp, sp, 26
                  csrrsi       t6, 0x340, 0
                  and          s9, t4, a3
                  c.or         s1, s1
                  lui          a0, 681575
                  auipc        a4, 865257
                  lui          sp, 318270
                  mulhu        ra, gp, s8
                  addi         s0, t2, -1857
                  csrrs        a6, 0x340, zero
                  csrrw        s6, 0x340, a0
                  slti         s10, tp, 1844
                  c.nop
                  mulhsu       s0, t3, t5
                  mul          t5, a6, s6
                  c.slli       s1, 13
                  c.xor        a0, a2
                  c.addi16sp   sp, -16
                  addi         s4, t1, -277
                  ori          s3, s7, 430
                  sltu         s9, s9, a7
                  c.nop
                  lui          t1, 946426
                  c.nop
                  c.addi4spn   a4, sp, 288
                  csrrs        ra, 0x340, zero
                  and          t1, a0, t6
                  mulh         s2, s2, t4
                  c.srli       a0, 18
                  c.li         sp, 24
                  and          a7, a5, a5
                  mulhu        a0, s5, s8
                  srai         a7, a3, 15
                  sll          t5, zero, t3
                  srl          t0, s0, t4
                  or           a4, a2, gp
                  sltiu        a3, s9, 604
                  addi         t6, a6, 399
                  c.nop
                  csrrsi       s8, 0x340, 24
                  srl          s11, s9, a0
                  csrrs        t5, 0x340, t3
                  sltu         s11, s4, t6
                  auipc        zero, 176134
                  ori          t6, a0, 503
                  slli         s1, s9, 18
                  srai         s5, a0, 8
                  srl          s5, s5, s8
                  csrrwi       a6, 0x340, 26
                  c.andi       a0, 2
                  ori          s5, a7, 1545
                  csrrw        s0, 0x340, a1
                  csrrci       a6, 0x340, 24
                  csrrci       a1, 0x340, 10
                  auipc        gp, 732455
                  mulhsu       s5, s2, ra
                  and          s0, t2, s5
                  mul          tp, a4, s6
                  c.addi4spn   a2, sp, 704
                  srai         ra, t0, 19
                  c.mv         s3, a0
                  c.nop
                  or           s8, s11, tp
                  lui          sp, 358124
                  rem          s1, a7, t1
                  sltiu        a2, tp, 1427
                  c.srli       s0, 9
                  ori          s7, sp, -704
                  xori         ra, s5, -36
                  ori          t4, s2, -2003
                  add          s4, s10, ra
                  c.slli       t1, 4
                  csrrsi       tp, 0x340, 0
                  csrrc        s11, 0x340, zero
                  c.srai       a1, 22
                  slli         a2, gp, 26
                  div          ra, t1, s8
                  c.slli       s7, 3
                  remu         s2, a6, a4
                  c.nop
                  c.or         a4, a5
                  srli         tp, zero, 4
                  srai         sp, a4, 10
                  mulhu        a6, s0, s3
                  xor          s2, s10, s10
                  auipc        s6, 953195
                  andi         s3, t5, -1851
                  mulhu        a3, s7, zero
                  c.addi16sp   sp, 192
                  c.lui        gp, 4
                  csrrci       a4, 0x340, 10
                  slt          gp, t4, a5
                  mulhsu       a0, t4, a6
                  csrrw        s7, 0x340, t2
                  ori          s0, gp, 472
                  c.andi       s1, 23
                  auipc        s3, 368132
                  csrrs        s10, 0x340, zero
                  sll          a4, s10, s9
                  divu         s7, s7, s4
                  c.mv         t6, s8
                  add          a2, s4, a5
                  auipc        a3, 584890
                  c.sub        a4, a5
                  srai         a0, s1, 11
                  auipc        sp, 385108
                  c.and        a3, a2
                  csrrw        s8, 0x340, sp
                  c.mv         ra, a2
                  srai         s6, ra, 10
                  slt          tp, s4, a7
                  c.addi4spn   a1, sp, 48
                  c.and        a4, a2
                  c.li         a6, -1
                  c.li         tp, -1
                  c.or         a0, a4
                  nop
                  csrrci       a4, 0x340, 5
                  c.mv         t0, s0
                  sltiu        a0, tp, 70
                  rem          a4, s5, s7
                  c.li         a1, 5
                  srl          s4, a4, sp
                  c.lui        s5, 28
                  addi         a7, ra, -1792
                  sub          s4, s5, ra
                  c.nop
                  c.and        a1, s1
                  xori         s6, s9, -1539
                  slt          a1, s11, t3
                  c.add        t5, s3
                  c.xor        a2, a5
                  mulhu        t1, sp, a3
                  divu         s3, s2, s7
                  c.srli       a0, 11
                  mulhsu       a0, a1, a3
                  sltu         s5, t3, s6
                  c.sub        a2, a1
                  addi         s4, t1, -272
                  srli         s2, a0, 6
                  c.mv         t1, t4
                  and          a2, s9, s9
                  sltu         a2, a6, a5
                  divu         a7, a5, zero
                  or           a4, a4, s4
                  andi         s5, a6, -1832
                  addi         a0, a4, -1972
                  mulhsu       t4, a3, s8
                  csrrw        a1, 0x340, t5
                  sub          t5, a0, s10
                  divu         a2, gp, t3
                  sll          t4, s10, a3
                  c.srli       a2, 20
                  auipc        a1, 317778
                  mulh         s5, s8, tp
                  csrrc        s1, 0x340, zero
                  sub          a6, s11, t1
                  c.slli       t5, 28
                  c.srli       a2, 29
                  auipc        sp, 1047606
                  div          t4, s10, a7
                  addi         a0, t0, 718
                  div          a3, a7, a2
                  addi         a7, t0, -1166
                  ori          s8, a4, -238
                  c.xor        a2, s1
                  mulh         t4, s2, a5
                  csrrwi       t4, 0x340, 27
                  sltiu        ra, a3, 1563
                  c.lui        t1, 30
                  sltu         s5, t2, gp
                  c.sub        a1, a3
                  c.slli       t5, 15
                  c.nop
                  sub          s6, gp, s7
                  csrrwi       a6, 0x340, 30
                  ori          s1, s6, -774
                  sra          a4, t5, a2
                  sll          a3, a5, a0
                  c.srli       s0, 13
                  c.mv         s1, a7
                  remu         t6, s1, tp
                  c.addi16sp   sp, -16
                  lui          s9, 86174
                  mul          s1, t1, sp
                  sub          s8, s7, s5
                  add          a3, s10, gp
                  c.or         a0, s1
                  c.or         a1, a0
                  c.nop
                  csrrci       a6, 0x340, 0
                  srl          a0, a5, s10
                  csrrc        t0, 0x340, a2
                  c.sub        s0, a2
                  c.li         a4, 0
                  mulhsu       s0, a6, t0
                  sll          t5, s4, s5
                  divu         s11, s5, t5
                  c.addi16sp   sp, -16
                  c.and        s0, a1
                  divu         s11, a2, s2
                  srai         t1, s5, 11
                  c.srli       a1, 7
                  csrrwi       s6, 0x340, 13
                  addi         t1, t3, 695
                  c.lui        s6, 1
                  csrrw        s8, 0x340, s4
                  xor          gp, sp, sp
                  sra          s2, zero, a5
                  slli         zero, a6, 5
                  csrrsi       s0, 0x340, 0
                  mulh         zero, ra, a5
                  sub          s10, tp, s1
                  xor          a1, s5, t5
                  c.slli       s8, 2
                  c.slli       gp, 7
                  addi         s8, a6, 864
                  csrrc        s4, 0x340, zero
                  c.or         a4, a3
                  c.addi16sp   sp, -16
                  slli         t5, zero, 3
                  lui          s9, 382182
                  csrrsi       zero, 0x340, 0
                  c.or         s0, a3
                  c.and        s0, a2
                  and          t6, t0, ra
                  sub          a0, zero, a5
                  andi         s10, a2, 374
                  c.addi       a3, -1
                  c.andi       s0, -1
                  nop
                  sub          t1, a5, s8
                  andi         sp, s8, -1050
                  c.srli       a1, 23
                  mulhu        s3, s1, s11
                  c.nop
                  slti         a0, t3, -976
                  csrrsi       a7, 0x340, 0
                  ori          a7, s3, 1602
                  c.addi       t5, 18
                  sltiu        a1, zero, -891
                  sltiu        s3, s4, 1928
                  mulh         a3, t5, t5
                  c.and        s0, a1
                  c.andi       a0, -1
                  slt          s10, a4, a4
                  sltiu        a6, a0, -1097
                  csrrw        a4, 0x340, s11
                  c.andi       a0, -1
                  csrrsi       ra, 0x340, 20
                  c.slli       t1, 21
                  csrrs        s6, 0x340, zero
                  c.slli       ra, 1
                  srai         s10, s5, 23
                  addi         sp, s1, -1250
                  c.addi       a2, 31
                  and          a4, s0, t2
                  c.li         a4, 4
                  mulhsu       s2, s0, s8
                  and          ra, s8, s7
                  add          s3, a5, sp
                  c.add        s4, s8
                  sub          s0, s3, t4
                  div          a6, t3, t3
                  c.addi16sp   sp, -16
                  c.srai       a2, 30
                  c.addi       s5, -1
                  andi         t5, gp, -1248
                  srli         s1, s5, 6
                  mul          a1, zero, a3
                  sub          s3, s8, gp
                  div          s5, s10, s6
                  xor          s2, s10, s0
                  div          a3, s2, t6
                  add          s7, gp, t4
                  c.lui        gp, 4
                  slt          s4, gp, s3
                  csrrw        t0, 0x340, s7
                  srl          t4, tp, t3
                  c.and        a3, s1
                  c.addi16sp   sp, -16
                  add          a4, s6, a7
                  mul          t4, a4, a4
                  nop
                  csrrc        t1, 0x340, zero
                  c.addi       t6, 17
                  c.addi       a2, 30
                  c.mv         s11, s10
                  remu         s2, s5, t4
                  sra          a4, s6, t5
                  c.or         a4, a4
                  sll          s10, t1, a3
                  sltiu        t5, a1, 1569
                  slt          a7, a1, t3
                  xor          s10, s4, s4
                  c.addi       t6, 12
                  c.addi16sp   sp, -16
                  c.and        s1, a4
                  sltu         a3, a4, tp
                  c.xor        a2, a1
                  nop
                  addi         t0, a0, -774
                  sra          s5, s9, s4
                  srl          sp, tp, s1
                  div          tp, s3, s10
                  lui          t4, 350711
                  sltu         a3, sp, t6
                  sltu         s4, s6, s9
                  csrrc        ra, 0x340, zero
                  csrrci       a7, 0x340, 2
                  c.or         a0, a5
                  divu         tp, t0, s8
                  slt          gp, t2, t3
                  divu         t0, s11, a2
                  remu         a4, t2, t1
                  c.slli       a3, 14
                  div          s5, t4, s11
                  mulhu        a3, s9, s11
                  csrrci       t6, 0x340, 30
                  slti         s2, s8, 1322
                  c.srli       a4, 31
                  nop
                  c.srli       a3, 21
                  or           t6, a1, ra
                  c.andi       a4, 9
                  sub          s7, t6, a0
                  or           a4, s10, s2
                  and          s0, a1, a1
                  csrrsi       s0, 0x340, 12
                  mulhsu       s11, s0, t5
                  add          a1, s1, a2
                  csrrwi       s7, 0x340, 19
                  csrrsi       s4, 0x340, 31
                  sub          gp, t6, t0
                  andi         ra, t0, 1313
                  auipc        s11, 574338
                  c.and        s1, a0
                  div          s0, s0, t6
                  c.addi16sp   sp, -16
                  nop
                  c.andi       s0, -1
                  csrrs        a6, 0x340, zero
                  srai         t0, t4, 11
                  slti         a6, tp, 1683
                  div          t6, s9, s2
                  c.xor        a2, a5
                  add          a3, a1, t2
                  c.or         a4, a5
                  slt          s10, s3, a3
                  sll          s1, s5, s10
                  xor          t1, s11, a0
                  lui          t0, 302245
                  sll          s5, zero, ra
                  remu         t1, s6, s1
                  remu         zero, s11, a4
                  lui          s6, 807478
                  csrrsi       s7, 0x340, 0
                  sltu         s0, t0, a0
                  c.addi       a1, 28
                  c.andi       a0, -1
                  c.or         a1, s0
                  addi         s6, t6, -1203
                  c.andi       a3, -1
                  csrrs        s6, 0x340, zero
                  slt          a1, ra, s7
                  slt          s3, a3, a1
                  mul          s6, s6, a5
                  sltiu        sp, a2, -1417
                  sltu         s6, sp, a7
                  sra          s0, t0, a6
                  c.addi       s11, -1
                  divu         s5, s7, a3
                  remu         s5, t6, s4
                  or           a1, gp, s2
                  divu         t1, sp, t5
                  csrrci       s0, 0x340, 0
                  and          t5, a2, t4
                  c.addi4spn   s0, sp, 112
                  c.addi       s3, -1
                  sltiu        sp, t1, -612
                  c.addi4spn   a3, sp, 688
                  rem          s6, t3, t2
                  or           a4, s7, a1
                  slti         t0, s11, -1398
                  divu         s1, tp, a0
                  sltiu        zero, s8, -566
                  lui          s1, 1019024
                  ori          t4, a5, 122
                  c.srai       a0, 23
                  mulhsu       a2, t0, gp
                  c.srai       s1, 4
                  srai         s1, s8, 13
                  slt          s4, a4, a4
                  c.nop
                  mulh         s8, ra, a3
                  c.xor        a2, a3
                  ori          s7, t1, 658
                  divu         s3, s1, gp
                  slt          s8, s6, gp
                  lui          s2, 897328
                  csrrw        s4, 0x340, t6
                  c.srai       a4, 28
                  csrrw        t5, 0x340, s10
                  c.addi4spn   a1, sp, 752
                  c.andi       a1, 26
                  auipc        a1, 271738
                  slti         s3, a5, 797
                  c.addi4spn   a4, sp, 432
                  c.sub        s0, a2
                  sra          tp, t0, s11
                  mulh         s7, t5, s4
                  c.andi       a0, 14
                  sltu         t6, s7, s7
                  csrrwi       s3, 0x340, 23
                  c.li         s11, 1
                  csrrw        s9, 0x340, t5
                  c.srli       s0, 9
                  or           s1, zero, s1
                  c.li         tp, -1
                  c.xor        a3, a2
                  remu         gp, t4, a1
                  and          s6, t6, s6
                  or           t0, zero, s9
                  csrrsi       s0, 0x340, 0
                  sll          a1, t2, t3
                  slti         s9, t3, -690
                  xor          a3, t3, t5
                  xori         s1, s0, -236
                  c.mv         s0, s9
                  sll          s9, s1, a4
                  auipc        t5, 464195
                  csrrs        a1, 0x340, s9
                  lui          a1, 297228
                  c.and        a4, a3
                  lui          s10, 346265
                  add          a6, t0, a1
                  slti         s4, s1, -981
                  csrrwi       gp, 0x340, 19
                  slt          s11, s2, s3
                  csrrw        s6, 0x340, gp
                  c.addi4spn   a4, sp, 544
                  sra          s10, a1, a3
                  csrrsi       t5, 0x340, 0
                  mulhsu       s2, sp, a7
                  sltiu        sp, t3, 63
                  sltiu        s9, s1, 1619
                  c.mv         a7, a3
                  c.addi4spn   a4, sp, 368
                  c.sub        a3, a5
                  c.xor        a1, a5
                  c.addi4spn   a2, sp, 624
                  remu         t5, s8, s9
                  slti         a1, t2, -1997
                  c.andi       a4, -1
                  srl          zero, t0, s0
                  c.and        a3, a3
                  c.lui        s2, 7
                  csrrsi       a3, 0x340, 0
                  lui          s3, 465802
                  nop
                  or           s2, a5, a0
                  srai         s8, s5, 6
                  xori         t5, s4, -444
                  mulhu        s9, t3, a0
                  sra          tp, sp, ra
                  csrrci       s8, 0x340, 16
                  c.and        a1, a5
                  ori          gp, a1, -188
                  srai         a6, t3, 22
                  csrrci       a0, 0x340, 0
                  lui          s6, 958114
                  c.xor        s1, a5
                  c.andi       a2, -1
                  c.or         s1, a5
                  c.slli       a4, 27
                  divu         a7, sp, s0
                  div          ra, s4, s3
                  c.addi4spn   a0, sp, 896
                  c.xor        a0, a2
                  c.addi16sp   sp, -16
                  mul          s1, a3, tp
                  c.or         a0, a4
                  divu         a7, a4, gp
                  slti         tp, a2, -341
                  c.or         a3, s1
                  slli         gp, a2, 14
                  c.srai       s1, 29
                  srl          a4, s8, s6
                  c.addi4spn   a2, sp, 304
                  c.lui        s5, 15
                  c.lui        s1, 17
                  xor          t4, s5, t4
                  c.addi4spn   s0, sp, 368
                  c.addi16sp   sp, -16
                  csrrwi       t4, 0x340, 21
                  c.and        s0, s0
                  csrrci       t1, 0x340, 0
                  csrrsi       t1, 0x340, 0
                  or           gp, s2, gp
                  csrrw        t0, 0x340, t0
                  divu         s5, s8, a6
                  c.or         a2, s0
                  rem          s11, t1, a3
                  csrrc        s9, 0x340, zero
                  c.mv         ra, t1
                  andi         s11, s4, 1649
                  nop
                  nop
                  c.addi       s0, -1
                  c.lui        t0, 15
                  c.slli       t6, 14
                  c.li         a3, 21
                  xori         s9, t4, -29
                  addi         s3, a0, -836
                  csrrci       a1, 0x340, 0
                  ori          sp, a1, 698
                  srai         s1, ra, 27
                  csrrs        s6, 0x340, zero
                  nop
                  mulhsu       a4, s5, gp
                  slli         s3, t2, 9
                  sltiu        t5, zero, 286
                  lui          sp, 754461
                  mulh         zero, ra, a7
                  auipc        sp, 1048139
                  and          sp, s3, zero
                  c.addi4spn   a1, sp, 224
                  c.addi4spn   a3, sp, 272
                  c.andi       s0, -1
                  div          s8, zero, s11
                  xor          t0, a5, t1
                  csrrc        t1, 0x340, zero
                  c.sub        s1, s1
                  addi         s11, gp, 1230
                  remu         s5, a7, s7
                  c.addi16sp   sp, -16
                  auipc        t4, 774999
                  c.slli       a3, 14
                  nop
                  remu         a6, s0, ra
                  slti         a0, t3, 573
                  c.nop
                  c.and        s0, s0
                  auipc        s9, 734228
                  sra          gp, t6, t1
                  c.add        tp, a5
                  c.mv         s4, s1
                  sra          tp, s9, t1
                  csrrs        s5, 0x340, zero
                  srai         s0, t5, 17
                  c.lui        a0, 1
                  divu         s7, t3, t6
                  slt          a6, ra, t6
                  sra          t6, a7, sp
                  csrrc        s2, 0x340, gp
                  or           t1, t3, t5
                  xor          s10, s10, s4
                  srl          ra, a3, s11
                  xor          s2, t3, zero
                  c.xor        s0, a1
                  c.addi16sp   sp, 240
                  slt          s9, t0, s6
                  csrrwi       gp, 0x340, 12
                  c.and        a3, s0
                  slt          s0, t1, t4
                  add          a6, t3, t5
                  div          s9, s2, s11
                  sll          a4, s6, t3
                  or           s4, t1, s1
                  lui          s0, 798242
                  slti         s7, a1, -2032
                  c.li         a6, 5
                  andi         tp, zero, 1378
                  xor          a4, s10, s0
                  c.addi       t0, 5
                  mulh         zero, zero, t1
                  mulhu        s3, s8, t3
                  nop
                  nop
                  sll          t4, a4, s9
                  and          s6, t1, s10
                  rem          s9, t1, t0
                  c.sub        a0, a4
                  c.srai       a3, 20
                  mulh         t1, t2, a6
                  c.addi16sp   sp, 240
                  sltiu        s0, a5, -325
                  remu         a7, a3, tp
                  remu         s1, sp, s1
                  c.slli       s11, 22
                  srl          t6, s6, ra
                  sltu         s4, s11, gp
                  slti         s10, s3, 858
                  c.slli       t5, 25
                  mulhu        t5, a5, a7
                  c.srli       a0, 5
                  c.li         a3, 24
                  csrrsi       t0, 0x340, 0
                  c.lui        t4, 15
                  mulh         ra, t1, a5
                  c.sub        a3, a5
                  c.nop
                  mulhsu       a1, s3, gp
                  c.nop
                  mulhsu       s5, a6, t1
                  csrrc        s10, 0x340, zero
                  csrrs        s5, 0x340, zero
                  c.addi4spn   a3, sp, 400
                  c.srli       a0, 19
                  mulh         a7, a6, gp
                  nop
                  c.mv         s5, t0
                  srai         a4, s7, 14
                  c.xor        a1, a1
                  c.addi       s1, -1
                  c.li         t1, -1
                  mul          zero, a0, t3
                  srli         tp, s8, 5
                  sra          s0, sp, s8
                  sltiu        zero, t0, -900
                  sll          s9, s3, tp
                  c.lui        t6, 17
                  slli         zero, t5, 1
                  srl          a1, s11, zero
                  sltiu        a1, t5, 1967
                  c.xor        a1, s0
                  slti         a7, t6, 71
                  sltiu        s0, a6, 342
                  add          s8, a1, s2
                  div          a6, s2, t4
                  c.add        sp, t2
                  csrrc        a1, 0x340, s3
                  c.andi       a4, 19
                  c.or         a1, a1
                  lui          t0, 4638
                  slti         s4, s6, -1661
                  c.nop
                  add          zero, s9, s4
                  div          s4, a5, t6
                  rem          a3, zero, a4
                  c.addi       s1, 22
                  ori          gp, a6, 455
                  c.mv         s9, a3
                  srl          t1, a6, zero
                  c.add        gp, s2
                  c.add        tp, a0
                  and          s10, a5, s2
                  sub          ra, t1, s10
                  or           s7, s9, tp
                  nop
                  and          s5, t5, s3
                  remu         s7, t2, s7
                  auipc        t6, 702366
                  addi         s6, s9, 1237
                  c.add        t6, s1
                  ori          t6, t0, -436
                  rem          a7, s11, gp
                  c.srli       a1, 16
                  srl          s7, t5, sp
                  c.andi       s1, -1
                  lui          t0, 951025
                  c.addi       s3, -1
                  csrrsi       a0, 0x340, 0
                  srai         t0, s8, 9
                  csrrs        s5, 0x340, zero
                  c.addi16sp   sp, 352
                  sltiu        a4, t4, 707
                  c.srai       a4, 15
                  srl          zero, s11, s4
                  mul          a2, t5, s3
                  or           ra, t3, s10
                  c.sub        a4, a0
                  c.slli       s5, 31
                  c.xor        a3, a4
                  mul          t1, s9, t6
                  csrrs        ra, 0x340, zero
                  c.and        a2, s0
                  xori         s10, s0, 353
                  xor          s11, s10, s10
                  c.or         a4, a4
                  c.xor        a3, a2
                  xori         a7, tp, -1742
                  srai         s0, a0, 22
                  sltiu        ra, ra, -285
                  c.addi16sp   sp, 496
                  c.addi4spn   a0, sp, 688
                  slti         tp, a4, 186
                  sltu         s7, a6, sp
                  c.nop
                  mul          s3, a2, s1
                  ori          tp, a7, 31
                  sltu         sp, s7, s10
                  sll          s9, s6, s5
                  csrrw        s6, 0x340, s10
                  mulh         a0, ra, t2
                  slli         zero, s5, 22
                  csrrw        s3, 0x340, a5
                  nop
                  and          t6, t2, s2
                  c.li         a3, 17
                  slt          a0, t2, s7
                  c.addi       s0, -1
                  sub          s9, t6, a1
                  csrrwi       s7, 0x340, 3
                  c.mv         s3, t5
                  slli         t1, sp, 14
                  sltu         s8, a0, s10
                  c.mv         s7, s10
                  c.add        s10, s2
                  csrrs        a3, 0x340, a7
                  c.addi4spn   s0, sp, 704
                  c.xor        a2, a5
                  c.mv         t0, s5
                  csrrsi       t6, 0x340, 27
                  lui          a0, 800419
                  csrrw        t6, 0x340, s0
                  c.or         a4, a0
                  sltiu        a7, a4, -1538
                  c.srai       a2, 9
                  ori          s11, s11, 579
                  ori          t6, a6, 1052
                  c.and        a3, a2
                  csrrci       s11, 0x340, 6
                  sltiu        t5, tp, 1895
                  xor          a2, s4, t0
                  auipc        s4, 32241
                  c.and        a2, a2
                  xori         s8, s9, 1516
                  c.xor        a0, a4
                  xor          s9, t4, t2
                  slt          t5, t0, a5
                  nop
                  lui          s2, 21764
                  c.addi4spn   a4, sp, 208
                  c.addi       s1, -1
                  c.srli       a1, 15
                  slti         s1, t1, -1629
                  c.addi       s10, 10
                  lui          s2, 588728
                  xor          t1, s10, s11
                  xor          tp, s5, a5
                  xori         a2, zero, 2046
                  c.srli       a0, 20
                  c.addi16sp   sp, -16
                  csrrc        tp, 0x340, zero
                  c.sub        a1, a0
                  csrrs        a0, 0x340, tp
                  andi         zero, a3, -509
                  slli         a2, a4, 3
                  c.addi4spn   a0, sp, 832
                  andi         s7, s6, 1339
                  mul          s2, sp, s0
                  csrrc        s3, 0x340, zero
                  sra          a0, sp, t5
                  div          s0, ra, ra
                  c.add        tp, a7
                  sub          s10, s4, t4
                  div          t5, s5, s3
                  csrrw        a0, 0x340, s7
                  c.addi4spn   a1, sp, 928
                  sltiu        t5, s4, 1476
                  c.mv         s4, a4
                  c.addi       s10, -1
                  xori         s2, a7, -1910
                  csrrw        s1, 0x340, a1
                  mulhu        t1, s8, a1
                  sll          t0, s11, a3
                  csrrsi       s9, 0x340, 0
                  c.addi       t6, -1
                  csrrs        s0, 0x340, t5
                  xori         s8, a3, 1699
                  c.add        ra, ra
                  srai         s9, tp, 9
                  csrrc        t5, 0x340, a7
                  sub          a7, s5, ra
                  c.add        a2, t1
                  remu         ra, t4, t6
                  c.addi4spn   a3, sp, 736
                  c.li         a0, 23
                  c.srai       s0, 27
                  ori          s1, a0, 1299
                  andi         a6, sp, -1208
                  div          a3, a3, s7
                  slli         sp, ra, 19
                  sltiu        ra, ra, -436
                  c.lui        s8, 28
                  c.add        a0, s4
                  srl          s4, t2, s4
                  c.xor        a2, a5
                  c.lui        s9, 18
                  c.xor        a0, a4
                  c.addi       s3, 19
                  sltiu        s10, t0, -2041
                  csrrsi       s3, 0x340, 0
                  slli         s0, s1, 5
                  nop
                  c.srai       a0, 5
                  srl          ra, a3, t4
                  c.lui        s2, 23
                  srli         s11, a1, 5
                  auipc        t6, 111287
                  c.mv         a4, s4
                  srai         s4, t0, 22
                  srl          a7, t1, ra
                  c.nop
                  csrrw        t0, 0x340, ra
                  rem          a3, sp, t1
                  nop
                  c.slli       a6, 16
                  c.or         a2, a1
                  sltiu        s2, s9, -1114
                  divu         a4, t6, s0
                  c.lui        s10, 31
                  c.add        ra, s2
                  c.xor        a0, s0
                  csrrwi       a6, 0x340, 30
                  c.add        s11, s3
                  c.xor        s0, a3
                  divu         tp, s4, s8
                  csrrw        s0, 0x340, t4
                  c.srli       a4, 20
                  c.andi       a0, -1
                  c.addi4spn   a3, sp, 928
                  mul          s11, s9, s5
                  sltu         s1, s3, a2
                  c.andi       a0, -1
                  slt          ra, t4, s11
                  slti         s7, s10, 1614
                  xori         s3, a3, -994
                  c.or         s1, s1
                  c.srli       a1, 1
                  csrrc        a6, 0x340, zero
                  sub          t6, gp, a2
                  mul          a3, t6, s9
                  sub          a1, s9, s10
                  mulh         a2, gp, a4
                  and          a6, s4, s10
                  c.srli       a0, 31
                  c.xor        a4, a5
                  auipc        tp, 701942
                  remu         s1, a3, t2
                  csrrci       t5, 0x340, 0
                  add          t1, s3, gp
                  sltiu        s0, s5, 425
                  lui          a6, 265578
                  csrrw        ra, 0x340, a4
                  xor          s11, s8, sp
                  csrrsi       gp, 0x340, 0
                  slti         a2, a0, -42
                  div          tp, a1, s0
                  xor          s10, t3, a0
                  c.srai       a2, 28
                  csrrc        a3, 0x340, zero
                  nop
                  auipc        a6, 52792
                  ori          s0, t3, -1274
                  remu         sp, s4, sp
                  c.nop
                  c.li         s6, -1
                  c.addi       s11, -1
                  mulhsu       a0, s9, t0
                  divu         s3, sp, a6
                  c.addi4spn   s1, sp, 16
                  csrrs        ra, 0x340, zero
                  c.srli       a4, 13
                  remu         s0, s4, zero
                  c.sub        a2, a3
                  csrrs        a2, 0x340, zero
                  sll          s11, a3, s6
                  csrrci       tp, 0x340, 0
                  mulhu        a2, a6, t6
                  ori          s3, tp, -1807
                  slli         a0, s8, 2
                  c.sub        a2, a4
                  lui          sp, 249485
                  csrrwi       s11, 0x340, 12
                  xori         s11, s0, -1240
                  sub          a2, a2, a6
                  auipc        s2, 644896
                  csrrw        s5, 0x340, t5
                  srli         s11, t2, 3
                  csrrc        s0, 0x340, s7
                  csrrsi       s9, 0x340, 1
                  c.lui        tp, 5
                  and          a6, ra, a4
                  c.addi4spn   a3, sp, 656
                  andi         tp, t2, 1992
                  divu         zero, a0, a6
                  c.addi16sp   sp, -16
                  c.nop
                  nop
                  c.srli       a4, 24
                  sltiu        tp, a2, -749
                  mulhsu       s5, a7, s4
                  addi         t0, zero, 22
                  slt          a6, s5, s0
                  mulhu        s11, s4, a5
                  sltu         zero, a4, s1
                  mulh         t0, s11, t1
                  csrrsi       a6, 0x340, 15
                  slti         s0, t3, -355
                  c.mv         t4, ra
                  csrrwi       t4, 0x340, 2
                  c.slli       s10, 11
                  srli         s11, t2, 13
                  csrrsi       s7, 0x340, 0
                  sra          tp, s2, t2
                  csrrc        s4, 0x340, a2
                  c.xor        s0, s1
                  slli         s0, s0, 4
                  c.or         a4, a3
                  addi         s4, a3, -668
                  csrrwi       t0, 0x340, 1
                  c.add        s11, gp
                  slt          a7, ra, gp
                  or           ra, s4, s0
                  c.addi4spn   s0, sp, 528
                  mulhu        t6, t4, t6
                  slt          gp, a1, s0
                  csrrw        s8, 0x340, s11
                  sra          s0, s10, a6
                  mulhsu       ra, t4, a5
                  c.srli       a2, 19
                  lui          t6, 859954
                  csrrc        gp, 0x340, zero
                  csrrw        s4, 0x340, ra
                  slt          s2, s7, a6
                  mulhsu       ra, sp, a4
                  add          s7, a0, s9
                  c.srli       a4, 7
                  sra          t4, s7, sp
                  sub          t5, a4, t3
                  sltu         a4, s7, s10
                  c.sub        s0, s1
                  slt          zero, a4, t6
                  ori          t6, a5, -1427
                  c.li         s3, 18
                  srl          s5, a7, s0
                  xori         tp, t6, 591
                  mulh         a7, ra, t4
                  auipc        s6, 578159
                  add          s5, a6, a2
                  slti         s4, a1, 34
                  c.or         s1, s1
                  c.addi16sp   sp, -16
                  and          s2, s3, s8
                  add          tp, s4, t5
                  csrrsi       s2, 0x340, 3
                  andi         s4, s1, 1798
                  csrrsi       s9, 0x340, 0
                  mulh         t4, s11, a1
                  sltiu        s1, t5, -1460
                  csrrs        sp, 0x340, t0
                  and          a7, s4, s9
                  c.or         a4, s0
                  c.addi       s6, 24
                  or           s8, a3, a4
                  nop
                  nop
                  srai         s1, s2, 1
                  srai         gp, s1, 17
                  div          a7, a1, gp
                  xori         s9, s11, -1924
                  srli         s4, t2, 25
                  csrrw        s4, 0x340, s9
                  csrrc        ra, 0x340, zero
                  c.nop
                  c.lui        s7, 31
                  slti         zero, t0, 1074
                  c.andi       s1, 31
                  xor          t1, s1, tp
                  c.sub        a4, a4
                  slti         a0, t0, -302
                  c.and        a1, s0
                  c.sub        s0, a1
                  remu         s7, t5, s8
                  lui          s4, 754805
                  slti         a7, s7, 1556
                  mulh         t4, s4, s1
                  mulhu        s2, a7, s9
                  csrrs        a3, 0x340, zero
                  mulhu        zero, a0, tp
                  c.nop
                  sltu         s9, s6, a2
                  c.lui        a2, 30
                  sltiu        s0, s11, 1418
                  c.slli       sp, 2
                  mul          tp, s0, s7
                  c.andi       s1, 27
                  and          t0, t4, s6
                  c.andi       a0, -1
                  c.srai       a2, 15
                  csrrci       a6, 0x340, 0
                  csrrs        a0, 0x340, zero
                  and          s10, t6, s5
                  addi         sp, s11, 1233
                  c.addi16sp   sp, -16
                  slti         s8, s10, -1408
                  csrrs        s8, 0x340, zero
                  c.srli       s1, 7
                  srl          s1, t3, s1
                  addi         t5, a7, -1581
                  c.mv         t6, s11
                  xori         a7, a1, -825
                  xori         s5, t4, 1067
                  srli         t0, a0, 27
                  sll          a1, s0, ra
                  srai         s2, gp, 4
                  div          gp, s3, t2
                  csrrc        a6, 0x340, zero
                  c.srai       a2, 31
                  add          s8, t6, s9
                  csrrs        s5, 0x340, zero
                  rem          s8, s1, ra
                  lui          s0, 435
                  addi         sp, s1, 1470
                  nop
                  rem          t5, s8, t5
                  c.li         t5, 4
                  sltiu        a3, s2, 1131
                  sra          s8, t4, s5
                  srli         s4, gp, 17
                  rem          a6, t3, a5
                  c.sub        a3, s1
                  srl          s3, s9, s5
                  csrrwi       a2, 0x340, 22
                  c.xor        a3, a2
                  c.nop
                  mulh         s10, s11, t6
                  auipc        t1, 771838
                  andi         s6, a3, 1895
                  sltu         s0, t4, s10
                  xor          zero, a0, a6
                  c.slli       s8, 7
                  lui          s8, 175405
                  csrrci       s9, 0x340, 20
                  c.srli       a1, 5
                  csrrc        s2, 0x340, s6
                  c.addi       a0, -1
                  c.xor        a1, s0
                  divu         s3, t1, a6
                  srli         s9, s3, 31
                  c.sub        a4, a0
                  nop
                  c.lui        a7, 29
                  mul          s2, s0, t1
                  auipc        t6, 394538
                  csrrwi       t6, 0x340, 20
                  lui          a7, 674063
                  srli         t6, s7, 27
                  c.sub        a2, a2
                  c.addi       s9, 20
                  xor          sp, s6, s11
                  remu         zero, s1, s6
                  sll          s9, s7, s7
                  c.addi16sp   sp, -16
                  c.addi4spn   s0, sp, 672
                  slti         s10, s6, -1927
                  and          s1, ra, s1
                  c.addi       a1, 26
                  c.xor        a2, a5
                  add          s5, s4, gp
                  div          a6, a0, s2
                  c.addi       a4, 14
                  srli         a7, tp, 30
                  srai         s2, a4, 9
                  andi         s0, t3, 1157
                  csrrw        t6, 0x340, t4
                  csrrc        s7, 0x340, t6
                  sltu         sp, t3, a7
                  mulhu        s9, s5, a5
                  srli         s8, s0, 30
                  mulhsu       t1, t6, t3
                  c.addi4spn   a4, sp, 688
                  srai         s2, tp, 24
                  mulh         a7, t2, s2
                  c.or         a0, a2
                  c.and        a3, a5
                  c.srli       a0, 19
                  sltu         s7, s2, s10
                  nop
                  add          s5, s9, s7
                  c.xor        a3, s0
                  c.mv         t6, s2
                  divu         a3, s4, a2
                  nop
                  c.srli       s1, 18
                  mulhsu       s0, t4, s2
                  c.xor        a4, a3
                  ori          a2, tp, -1617
                  xori         a4, s6, 203
                  c.add        t5, t3
                  sltu         gp, s11, s0
                  c.and        a3, s1
                  andi         a7, a5, -1521
                  xor          s8, ra, s9
                  sltiu        t0, t5, -96
                  mulh         s0, gp, ra
                  srai         s0, s2, 31
                  lui          s11, 390255
                  xori         s8, t2, -883
                  c.srli       s1, 21
                  c.mv         s5, s9
                  c.lui        s2, 7
                  mulhsu       a6, t6, gp
                  sltiu        a2, t1, 97
                  and          a4, s0, t6
                  csrrwi       a0, 0x340, 1
                  c.add        s8, s3
                  sub          a0, s2, s5
                  c.addi4spn   s1, sp, 432
                  mulhsu       a3, a5, s11
                  csrrs        t5, 0x340, s0
                  sub          a7, sp, t0
                  csrrci       s8, 0x340, 0
                  slli         tp, a3, 20
                  slt          t0, t0, s1
                  c.li         t6, 18
                  csrrci       t6, 0x340, 14
                  mulhsu       t4, s1, t1
                  sltu         s4, gp, a3
                  slli         s2, s10, 19
                  rem          s6, t1, s10
                  add          t6, s2, s6
                  csrrsi       t1, 0x340, 28
                  c.addi16sp   sp, -16
                  mulh         gp, t1, s4
                  csrrw        t4, 0x340, t6
                  c.srai       a4, 17
                  auipc        tp, 559100
                  mulh         t4, s7, a2
                  c.srai       a3, 19
                  csrrci       s9, 0x340, 0
                  ori          s1, a4, -577
                  c.addi4spn   a3, sp, 576
                  csrrsi       t0, 0x340, 0
                  csrrs        sp, 0x340, s4
                  c.addi       t1, -1
                  csrrw        t0, 0x340, a6
                  slli         a1, s8, 26
                  sltu         s7, s0, s11
                  csrrc        tp, 0x340, zero
                  and          s4, t2, tp
                  csrrc        s0, 0x340, a1
                  sra          s10, tp, a7
                  c.and        a0, s0
                  sra          t4, s8, s7
                  c.srli       a4, 13
                  sltu         s9, a3, a0
                  csrrwi       a6, 0x340, 4
                  srai         tp, a0, 29
                  rem          s3, t1, a0
                  c.srli       s1, 20
                  csrrc        sp, 0x340, s10
                  ori          s6, a2, 200
                  c.lui        s10, 2
                  csrrw        a1, 0x340, ra
                  c.addi16sp   sp, -16
                  auipc        ra, 978977
                  csrrwi       gp, 0x340, 19
                  mul          a0, t5, a4
                  c.and        s1, a0
                  csrrci       s1, 0x340, 0
                  csrrwi       s7, 0x340, 11
                  add          tp, t0, t0
                  c.slli       s2, 21
                  c.srli       a0, 8
                  mulhsu       s10, s4, tp
                  lui          s9, 970539
                  c.lui        s5, 27
                  sltu         s8, t6, s2
                  add          t6, s8, s5
                  srl          ra, a5, s8
                  c.li         a3, 24
                  add          s4, gp, s6
                  xor          s10, sp, a3
                  sltiu        s1, s1, 602
                  or           s2, s7, s8
                  andi         a3, zero, -1731
                  mulhsu       s0, s7, s9
                  sub          a2, zero, s3
                  slli         gp, s0, 11
                  remu         sp, t0, a1
                  c.andi       a2, -1
                  c.andi       s1, 16
                  sltiu        gp, s4, 770
                  srli         s4, t0, 16
                  c.slli       s0, 21
                  c.add        a6, a7
                  srai         s2, a3, 29
                  andi         t5, t3, 977
                  auipc        s9, 569036
                  c.lui        a6, 20
                  c.addi4spn   a4, sp, 384
                  csrrw        s1, 0x340, s1
                  remu         s6, a3, s0
                  lui          tp, 37603
                  lui          s10, 660941
                  and          s2, a2, a7
                  c.or         a1, a2
                  c.nop
                  slt          s1, s0, s10
                  addi         s5, t0, -3
                  slt          t6, t4, a2
                  csrrsi       s1, 0x340, 0
                  srli         s10, s1, 23
                  lui          s7, 880107
                  c.and        s0, a0
                  sltu         s7, a0, s9
                  csrrw        s7, 0x340, ra
                  slt          s0, t4, s5
                  c.nop
                  slti         t6, s7, -523
                  c.addi4spn   s0, sp, 544
                  c.addi16sp   sp, 96
                  rem          s4, gp, t5
                  addi         s7, a2, 8
                  xor          s7, a7, s9
                  xor          zero, t4, s11
                  lui          a7, 284102
                  c.addi       a0, 24
                  c.addi4spn   a4, sp, 96
                  mul          s7, a7, a1
                  c.srli       a1, 17
                  divu         t1, s1, a7
                  c.addi16sp   sp, -16
                  c.and        s0, a0
                  mulhsu       s2, s6, sp
                  mulhu        sp, s5, t6
                  slti         s3, t5, -1097
                  lui          t5, 313115
                  and          tp, zero, s9
                  ori          s3, s10, 1582
                  andi         t4, s9, 1375
                  sra          s10, a5, t0
                  c.srli       a1, 12
                  csrrw        t4, 0x340, t4
                  srl          zero, t5, a1
                  sltu         a4, a4, s0
                  slli         t5, t5, 17
                  c.sub        a4, a4
                  rem          a3, s4, t0
                  c.nop
                  div          s7, gp, s10
                  divu         s4, s5, s2
                  csrrw        a3, 0x340, s1
                  csrrwi       a0, 0x340, 4
                  sll          s2, a7, s5
                  c.slli       t4, 17
                  nop
                  c.mv         ra, t0
                  csrrci       a7, 0x340, 30
                  addi         a7, t3, -1750
                  and          s1, s2, a1
                  remu         s11, ra, a0
                  or           s11, a7, s0
                  c.add        t0, s5
                  slti         s7, a7, -536
                  c.mv         s1, s10
                  c.or         a3, a2
                  c.sub        a3, a0
                  csrrc        s11, 0x340, zero
                  sltiu        a2, ra, 48
                  sltu         s4, t4, s0
                  c.and        a2, a0
                  c.srli       s1, 5
                  andi         a2, s8, 475
                  mul          a0, s11, s8
                  mulh         a7, zero, tp
                  sra          s0, a1, s8
                  sltiu        a6, t0, 1890
                  csrrsi       s4, 0x340, 26
                  csrrci       a3, 0x340, 0
                  c.slli       s10, 14
                  slt          ra, sp, s3
                  c.xor        a4, a0
                  ori          s10, s6, -862
                  srli         zero, t3, 22
                  sltu         t6, a7, t2
                  sra          s7, sp, a1
                  add          tp, s1, t2
                  or           s11, s2, s1
                  c.srai       a3, 28
                  slti         t0, t3, -1082
                  c.addi4spn   s1, sp, 976
                  mulhu        tp, s1, a1
                  add          a2, s4, t6
                  remu         tp, a1, t1
                  c.lui        s11, 20
                  lui          s9, 288030
                  remu         s2, s2, ra
                  c.srli       a4, 4
                  mulhsu       s9, s1, t1
                  ori          t5, t1, 784
                  sltiu        gp, s10, -1386
                  csrrw        s4, 0x340, t3
                  slli         a0, a1, 24
                  andi         a4, s6, 48
                  c.and        s1, a5
                  srai         a0, s9, 25
                  div          a4, s3, s5
                  sra          tp, t0, s8
                  auipc        s11, 947456
                  addi         ra, s5, 1871
                  add          sp, s7, sp
                  csrrwi       s4, 0x340, 11
                  c.add        s8, s5
                  c.addi4spn   a0, sp, 128
                  mulhu        ra, a1, s5
                  c.slli       ra, 14
                  csrrci       t4, 0x340, 0
                  srli         t0, s11, 24
                  sub          s8, zero, s1
                  slli         a3, a3, 4
                  sll          a7, t2, t0
                  c.lui        a7, 9
                  andi         a6, tp, -224
                  andi         a0, s11, -1651
                  c.li         tp, -1
                  sll          s9, s5, s0
                  sltiu        s10, s9, 1797
                  c.and        a1, a3
                  mul          s10, t3, s11
                  add          a3, s9, t6
                  auipc        zero, 532104
                  auipc        a0, 183093
                  sub          s5, t2, a0
                  sltu         s5, a5, s2
                  c.add        s10, sp
                  c.or         a2, s1
                  csrrsi       a1, 0x340, 7
                  add          s4, ra, t5
                  xori         s8, s11, 382
                  c.add        a6, a4
                  sll          a2, sp, s3
                  sltu         t1, s9, s11
                  ori          t4, s0, -591
                  remu         t0, t2, a2
                  c.lui        s6, 4
                  srai         a3, s6, 31
                  c.or         s1, a4
                  sub          t1, s7, t3
                  mulhu        s0, ra, t2
                  c.li         ra, -1
                  mulhsu       a1, t4, a6
                  nop
                  c.add        sp, tp
                  rem          a2, s2, s4
                  add          tp, a6, s3
                  lui          t4, 517024
                  c.mv         a4, a3
                  slt          s0, s9, s7
                  c.andi       s0, -1
                  csrrs        t4, 0x340, zero
                  c.addi4spn   s0, sp, 48
                  xor          s1, t1, sp
                  mulhsu       s2, s3, t5
                  c.addi16sp   sp, 384
                  c.or         a4, a4
                  c.srli       s0, 3
                  mul          a2, t3, t4
                  mulhu        a7, s7, t0
                  sub          s8, a5, t4
                  sra          s0, gp, t2
                  c.lui        a3, 30
                  xori         s5, a2, -1802
                  srai         s11, s9, 14
                  or           tp, s7, a1
                  sll          s11, tp, ra
                  auipc        s5, 305861
                  and          s8, sp, a5
                  ori          s8, s1, -126
                  c.slli       s1, 1
                  csrrc        a7, 0x340, t4
                  c.sub        s1, a3
                  auipc        s9, 78460
                  rem          t0, t0, s0
                  c.srai       a4, 1
                  c.li         t1, -1
                  remu         zero, t5, a4
                  c.or         s1, a1
                  div          t0, s3, t4
                  addi         s7, a3, 1703
                  sltu         ra, a2, t2
                  divu         ra, s1, tp
                  slt          gp, a6, a5
                  srli         t6, a0, 25
                  c.addi16sp   sp, 320
                  c.srai       a4, 12
                  nop
                  and          t0, s8, a7
                  srl          s0, s0, s8
                  remu         a6, s3, a5
                  c.addi16sp   sp, 128
                  c.addi16sp   sp, 192
                  auipc        a2, 699862
                  c.nop
                  slt          s0, a7, s5
                  c.xor        a3, a0
                  mul          s3, s5, s5
                  mulhsu       a7, s9, tp
                  c.mv         ra, a3
                  sltu         a1, s2, s11
                  sltu         a4, a4, s9
                  mulhsu       s5, t6, a1
                  c.srli       a1, 19
                  ori          a3, s10, 1704
                  lui          s6, 1009044
                  mulhu        s7, sp, a0
                  sltu         s7, sp, a2
                  c.mv         t0, a7
                  auipc        sp, 969621
                  sltu         s7, a1, a6
                  c.or         s1, a2
                  xori         gp, s2, 1915
                  c.lui        a6, 10
                  c.srli       s0, 19
                  sra          s11, a3, t5
                  csrrci       s5, 0x340, 16
                  sltiu        tp, t4, 260
                  add          s1, t5, t3
                  csrrci       s1, 0x340, 15
                  sra          t4, ra, s5
                  csrrc        s8, 0x340, zero
                  csrrwi       s10, 0x340, 5
                  mul          a7, a5, a5
                  c.srli       a4, 15
                  c.xor        a2, a5
                  xor          t5, sp, t5
                  sll          sp, a7, t5
                  csrrwi       tp, 0x340, 2
                  mulhsu       zero, a6, a1
                  csrrci       s10, 0x340, 28
                  mul          s7, gp, s2
                  mulh         s11, s6, t1
                  c.or         s0, a0
                  c.add        s7, s3
                  c.mv         s2, s7
                  xor          t1, a1, a6
                  addi         s3, t4, 586
                  sll          t6, s0, s7
                  nop
                  auipc        s9, 867515
                  c.nop
                  c.mv         s3, s1
                  c.addi16sp   sp, -16
                  csrrwi       a1, 0x340, 13
                  xor          s2, s3, s5
                  addi         sp, sp, -995
                  sltiu        t0, sp, -99
                  slt          t0, a2, t5
                  csrrsi       s4, 0x340, 0
                  mulh         ra, t2, s6
                  c.li         s2, 21
                  c.addi4spn   a4, sp, 176
                  mulhsu       t4, a1, a7
                  sll          s5, s4, sp
                  and          s7, s9, gp
                  slti         s5, a4, -776
                  c.addi       s4, 16
                  slt          t0, s10, t1
                  c.add        s1, a7
                  andi         s5, t4, 853
                  c.xor        a2, a0
                  srai         t1, s7, 1
                  csrrwi       s11, 0x340, 22
                  srli         gp, zero, 19
                  mul          a2, sp, zero
                  rem          sp, a7, a6
                  sltiu        ra, ra, -33
                  slt          a0, t4, t4
                  slti         s3, s4, 384
                  or           ra, s5, s7
                  nop
                  c.slli       s7, 23
                  csrrw        t6, 0x340, s5
                  c.srai       s1, 13
                  c.sub        a4, a4
                  c.li         s1, -1
                  csrrwi       s11, 0x340, 0
                  lui          a2, 878399
                  c.srai       a2, 12
                  ori          a6, a6, -1809
                  c.addi4spn   a4, sp, 912
                  c.xor        a0, s1
                  lui          ra, 253065
                  slli         s1, t2, 4
                  c.or         a0, s0
                  sltiu        a1, t5, -2022
                  csrrsi       tp, 0x340, 0
                  add          s11, s2, t5
                  c.srai       s0, 20
                  xor          s11, t6, s8
                  add          a4, s0, s10
                  auipc        s2, 343906
                  c.lui        tp, 5
                  c.slli       a0, 20
                  csrrwi       a0, 0x340, 25
                  csrrc        s2, 0x340, zero
                  divu         t5, zero, s8
                  c.addi16sp   sp, -16
                  div          gp, s1, s4
                  divu         a1, t1, s11
                  srl          s2, tp, a4
                  auipc        a1, 429824
                  rem          t1, s8, s9
                  c.lui        a4, 10
                  and          gp, t4, t0
                  srl          s7, gp, s11
                  c.nop
                  addi         t6, a7, -1877
                  and          s2, t0, tp
                  mul          t0, s7, a1
                  sra          s4, s0, a2
                  nop
                  add          a7, t6, s2
                  xor          s8, s4, t2
                  c.sub        a1, a0
                  xor          a3, sp, sp
                  sltu         t6, zero, a4
                  csrrw        s1, 0x340, s3
                  or           s11, zero, a4
                  mul          s10, t3, zero
                  srl          s1, sp, zero
                  xor          t5, s9, a4
                  c.slli       sp, 30
                  c.and        a3, a0
                  c.nop
                  c.slli       a6, 14
                  c.lui        s10, 1
                  c.srli       a3, 11
                  csrrw        s4, 0x340, s8
                  c.addi       a2, -1
                  andi         s1, sp, -303
                  slti         t4, a7, 1068
                  c.add        t0, s5
                  or           s4, t1, zero
                  c.mv         s4, t0
                  addi         sp, s5, 1485
                  auipc        t1, 890082
                  remu         s6, s11, s8
                  remu         t1, t0, a1
                  c.addi4spn   a4, sp, 480
                  slt          sp, s11, a3
                  and          a4, tp, ra
                  mul          sp, a2, s5
                  ori          s11, s6, -815
                  ori          t4, s1, -1730
                  add          s11, a5, ra
                  c.srai       s1, 27
                  c.xor        a0, a5
                  slli         t0, a4, 1
                  c.or         a4, s1
                  remu         s8, a7, gp
                  add          zero, s8, a5
                  csrrs        a1, 0x340, t1
                  xori         t0, t0, -731
                  c.and        a0, a4
                  srli         t1, s3, 1
                  c.or         s0, a1
                  c.and        s1, a1
                  csrrci       s4, 0x340, 0
                  srli         s3, a0, 21
                  slt          a3, tp, gp
                  c.mv         t6, sp
                  csrrw        s5, 0x340, s1
                  c.and        a2, a4
                  srl          a0, a3, s8
                  div          s8, s4, t0
                  srai         s11, a7, 1
                  ori          s4, s7, 1127
                  csrrsi       s5, 0x340, 18
                  csrrc        t4, 0x340, zero
                  andi         zero, s6, -249
                  div          gp, s8, t2
                  c.andi       s1, -1
                  divu         tp, t3, s7
                  auipc        t6, 990019
                  xor          zero, t2, s0
                  c.addi16sp   sp, -16
                  lui          s0, 232248
                  srai         s2, a0, 3
                  c.and        s0, s0
                  c.or         s1, a5
                  mulh         t1, a4, s11
                  srl          zero, t5, t4
                  mulhsu       t4, t2, s4
                  srl          a7, ra, a3
                  xori         s6, s6, 433
                  c.lui        s11, 14
                  c.slli       t0, 20
                  c.or         a2, a4
                  c.add        ra, s8
                  srl          s9, s5, s8
                  divu         s5, s8, s7
                  slli         s10, sp, 18
                  remu         a6, s0, s4
                  rem          t5, t6, a4
                  mul          tp, a1, a5
                  sltiu        a2, s6, -1892
                  mulh         a7, a3, t3
                  sltu         s10, sp, a7
                  c.slli       s11, 16
                  ori          a0, ra, 1520
                  div          t5, a3, t5
                  c.slli       a7, 29
                  csrrsi       s4, 0x340, 18
                  sll          t4, s11, t5
                  c.andi       s1, 5
                  xori         a7, s7, -230
                  ori          s3, a6, 858
                  c.srli       a3, 29
                  c.andi       s0, -1
                  slli         a4, s1, 23
                  csrrs        zero, 0x340, zero
                  add          s0, t0, t2
                  srli         t6, s10, 8
                  csrrwi       s1, 0x340, 18
                  c.xor        s0, a4
                  srai         s5, a5, 30
                  slli         s0, t0, 23
                  c.or         a1, a0
                  lui          tp, 160359
                  csrrw        t6, 0x340, s4
                  csrrs        tp, 0x340, s8
                  slt          zero, s1, a1
                  sltu         s8, tp, t5
                  add          a0, t1, s2
                  c.lui        s1, 1
                  csrrw        a6, 0x340, s4
                  andi         gp, s11, -1779
                  c.and        a4, s0
                  c.lui        s6, 27
                  c.andi       a0, -1
                  and          a6, sp, t2
                  slli         s5, t0, 5
                  c.addi       s4, -1
                  divu         a6, tp, s10
                  c.li         a1, -1
                  c.or         a4, s1
                  csrrsi       sp, 0x340, 23
                  andi         s1, a3, 1187
                  remu         s4, s5, t4
                  sltu         s2, t2, s0
                  c.srli       a1, 12
                  srli         s11, t5, 20
                  c.addi16sp   sp, 48
                  c.li         s0, -1
                  c.addi       t4, 31
                  sltu         s0, t0, a3
                  c.nop
                  c.addi16sp   sp, -16
                  c.addi16sp   sp, 16
                  c.sub        s0, s1
                  c.slli       s5, 6
                  mulh         s1, t5, t1
                  csrrs        t4, 0x340, zero
                  c.addi       s3, -1
                  csrrc        s8, 0x340, zero
                  csrrci       s11, 0x340, 0
                  sub          a1, t4, s10
                  xori         s4, t4, -333
                  c.addi       s5, -1
                  sltu         s7, s10, t6
                  slt          t5, a4, a0
                  auipc        s7, 36111
                  mulhu        gp, s1, s1
                  auipc        ra, 336460
                  c.sub        a2, a3
                  c.nop
                  div          s3, s11, t2
                  mulhu        s10, s8, t0
                  csrrci       t0, 0x340, 26
                  srli         t0, a6, 8
                  andi         s4, a3, -297
                  c.srli       a1, 3
                  sub          s10, t6, ra
                  c.add        s5, s1
                  c.add        s9, ra
                  nop
                  and          s6, s5, s1
                  sltu         s2, t6, s6
                  sll          sp, s2, s9
                  csrrwi       s6, 0x340, 1
                  csrrc        ra, 0x340, s2
                  c.mv         t0, t3
                  slt          a1, t3, s2
                  sltiu        s9, a4, -1817
                  rem          s2, s10, t1
                  sltu         gp, t3, ra
                  mulhsu       s3, s10, s7
                  lui          s3, 283750
                  lui          a6, 236962
                  c.and        a0, a0
                  nop
                  div          a4, a5, s4
                  xor          a2, s5, s5
                  sll          sp, t3, s0
                  srl          s8, s6, s11
                  c.xor        s1, a3
                  mulhsu       t1, a5, a2
                  slti         a4, s2, -673
                  sub          s10, t6, t6
                  c.lui        a2, 13
                  sra          sp, sp, s10
                  slt          s1, t0, a1
                  csrrs        a7, 0x340, zero
                  addi         t5, s1, 1154
                  c.or         a1, a3
                  sltu         gp, ra, t3
                  sra          s7, zero, s1
                  slti         s4, s11, 718
                  mulhu        a7, zero, t1
                  auipc        t0, 911086
                  c.li         t5, 15
                  srai         s3, a1, 1
                  c.addi16sp   sp, 208
                  auipc        sp, 65771
                  sltiu        s5, s1, 1152
                  and          s4, a0, s9
                  sll          s10, s6, ra
                  sra          s6, s5, s7
                  csrrc        a7, 0x340, s10
                  c.slli       s5, 30
                  c.addi16sp   sp, -16
                  mulh         s9, t5, s0
                  div          a6, s2, gp
                  andi         a4, a2, 1854
                  addi         s4, a6, 1961
                  sltiu        a0, s1, 319
                  srli         s11, a4, 13
                  c.addi16sp   sp, -16
                  sub          a4, ra, s11
                  ori          s3, t4, -783
                  sra          s11, tp, s0
                  csrrc        sp, 0x340, s0
                  csrrsi       s9, 0x340, 0
                  srai         a6, t2, 5
                  c.and        a2, a0
                  slt          s6, t1, s8
                  c.and        a1, a3
                  lui          s4, 841145
                  sltu         s11, a4, s0
                  nop
                  csrrsi       s6, 0x340, 9
                  slti         a1, s3, 753
                  mul          s10, a0, tp
                  divu         s0, a1, a3
                  c.or         a1, s1
                  c.lui        s7, 4
                  slti         t4, s8, -469
                  sra          s7, s2, a2
                  csrrw        t0, 0x340, s9
                  c.lui        tp, 4
                  ori          a6, ra, -352
                  mulhsu       s3, a4, s6
                  c.li         sp, 5
                  mul          tp, s9, t2
                  sltu         t1, t1, a6
                  c.add        a2, a6
                  mulhu        a3, t4, sp
                  c.srli       a1, 21
                  addi         t1, s4, -1283
                  rem          s1, a5, s8
                  c.or         a0, a2
                  c.li         a4, -1
                  slt          t6, s1, s4
                  c.and        a2, a0
                  sub          s8, a0, s9
                  c.srai       s1, 3
                  mulhu        s11, a7, zero
                  c.addi16sp   sp, 32
                  nop
                  mulhsu       a2, tp, s2
                  remu         s10, tp, s4
                  add          tp, s9, s0
                  divu         t4, t2, s10
                  andi         a4, s3, -1468
                  c.addi16sp   sp, 320
                  slt          s5, s6, t3
                  div          s6, ra, t0
                  lui          s0, 40965
                  div          s2, sp, a5
                  nop
                  c.slli       a2, 16
                  c.srli       a2, 28
                  mulh         a1, s11, a7
                  andi         s4, a3, 491
                  or           s5, s7, s9
                  ori          ra, s8, -2031
                  csrrw        s6, 0x340, s4
                  c.addi       t6, 13
                  c.srai       a1, 10
                  c.add        s11, a4
                  c.add        s5, s11
                  sub          a7, s7, s10
                  lui          s5, 931532
                  xor          a6, s1, t6
                  slli         s2, s8, 15
                  csrrw        gp, 0x340, s1
                  nop
                  slti         a0, t1, -2029
                  csrrwi       s8, 0x340, 31
                  andi         s6, t5, -1441
                  divu         a3, ra, t1
                  sltu         s0, t0, t5
                  c.srli       s1, 8
                  sltiu        a2, a4, 1606
                  slli         s10, t1, 18
                  slti         s10, a2, -1658
                  and          a2, ra, ra
                  sll          t6, a2, s4
                  c.or         a0, a0
                  c.slli       s7, 26
                  remu         s9, a0, ra
                  slli         a0, s4, 21
                  sub          s4, s11, s1
                  csrrw        a0, 0x340, a3
                  c.srai       a2, 30
                  sltiu        s8, a0, -1338
                  c.mv         s4, s9
                  c.and        s0, s1
                  csrrci       t0, 0x340, 1
                  srai         s5, a3, 29
                  nop
                  divu         s4, s5, s0
                  and          s11, t0, s1
                  srli         s11, zero, 27
                  c.li         s11, 30
                  csrrci       s5, 0x340, 25
                  c.andi       a2, -1
                  andi         s10, a4, -385
                  andi         s9, s4, -1452
                  mul          s6, s7, a1
                  xori         s4, t0, 211
                  c.xor        s0, a1
                  slti         s4, s7, 968
                  slti         a4, s0, -1786
                  c.nop
                  c.add        t1, t6
                  c.sub        s1, a5
                  srai         a7, t1, 20
                  c.lui        a7, 5
                  xor          t6, s1, t4
                  add          t5, a4, s3
                  sltu         a6, t3, s11
                  csrrs        s11, 0x340, zero
                  slti         t1, s5, -452
                  csrrc        tp, 0x340, s8
                  srli         t0, s5, 16
                  lui          s3, 587864
                  mulhsu       a6, a2, a7
                  sltu         zero, a4, a6
                  mulhsu       a2, t2, s4
                  csrrw        tp, 0x340, zero
                  c.addi16sp   sp, 48
                  slti         s3, s0, -1212
                  auipc        s8, 501830
                  csrrw        t6, 0x340, a3
                  c.add        s9, s8
                  csrrwi       t6, 0x340, 24
                  c.add        t5, sp
                  ori          s3, s6, -85
                  nop
                  mulhu        s9, s7, t5
                  or           a0, s6, a3
                  c.addi16sp   sp, 480
                  c.srai       s1, 2
                  c.and        s0, a3
                  c.addi16sp   sp, 384
                  sltu         t1, t4, a1
                  add          s6, sp, s3
                  mulhsu       s0, t0, gp
                  rem          s6, t2, t3
                  mulh         s3, s7, a1
                  csrrci       s7, 0x340, 0
                  c.srai       a4, 22
                  xori         s10, a3, 136
                  xor          s4, t4, a7
                  csrrw        s5, 0x340, s6
                  andi         a7, a5, -1045
                  mulhu        s6, t2, sp
                  div          a7, a3, t6
                  lui          a4, 580674
                  c.sub        s0, a4
                  c.add        a2, a1
                  and          a2, a5, a7
                  c.and        a0, a3
                  remu         a2, a7, a3
                  c.slli       s7, 15
                  srli         t4, s11, 18
                  slli         ra, a2, 13
                  c.xor        s0, a3
                  c.mv         s0, s9
                  sll          t6, a5, s0
                  c.lui        s1, 26
                  div          s1, t4, s11
                  div          t6, a4, zero
                  c.or         a1, a0
                  c.or         s0, s1
                  sltu         s8, sp, a5
                  or           s3, a5, s9
                  slli         a6, a6, 19
                  csrrci       t0, 0x340, 25
                  c.sub        a0, a2
                  c.srai       a2, 20
                  add          s6, a5, s5
                  slti         gp, s4, 177
                  csrrwi       tp, 0x340, 22
                  c.xor        a0, s0
                  sub          zero, s3, s5
                  csrrw        s2, 0x340, a1
                  csrrci       s7, 0x340, 21
                  and          tp, sp, s10
                  sltu         s7, a1, t1
                  c.mv         s9, a4
                  c.addi4spn   a4, sp, 480
                  c.andi       a3, 7
                  remu         a7, t3, t6
                  csrrsi       s1, 0x340, 27
                  auipc        t4, 252101
                  add          s8, s0, a0
                  c.and        s0, s0
                  addi         zero, s9, -1635
                  csrrsi       t0, 0x340, 0
                  remu         t0, t3, tp
                  c.xor        a2, s1
                  mulh         zero, s4, s3
                  c.addi4spn   a0, sp, 528
                  srli         sp, s1, 29
                  c.mv         sp, s8
                  c.andi       a0, -1
                  c.nop
                  addi         s4, a0, -1136
                  csrrwi       t1, 0x340, 18
                  sub          s0, t3, s5
                  rem          s0, s5, a3
                  c.add        s7, a2
                  sll          tp, t4, t3
                  c.addi       a4, 8
                  c.lui        s4, 11
                  remu         zero, t2, s5
                  srai         a4, a4, 15
                  csrrw        t0, 0x340, s4
                  csrrc        s3, 0x340, zero
                  mul          s7, s1, s0
                  remu         ra, s7, tp
                  c.slli       gp, 7
                  c.srli       a4, 3
                  xori         t6, a2, -117
                  c.andi       a2, -1
                  c.lui        a2, 14
                  srl          t6, a7, s10
                  slti         s4, s0, -563
                  ori          sp, s4, 759
                  rem          a6, s6, zero
                  slt          sp, t5, t6
                  csrrwi       s11, 0x340, 27
                  c.addi4spn   a4, sp, 544
                  c.srai       a4, 27
                  xori         a0, s6, -1610
                  sll          a0, tp, a0
                  c.slli       s8, 17
                  csrrci       s5, 0x340, 13
                  c.xor        a3, a2
                  or           ra, a2, s3
                  srai         t1, zero, 23
                  sub          a0, ra, ra
                  auipc        t0, 948690
                  remu         a3, a7, s8
                  addi         s0, s3, -457
                  slt          t4, s10, a0
                  sltu         a3, t0, s3
                  slli         zero, t6, 22
                  c.xor        a2, a1
                  c.srai       a1, 25
                  addi         s9, a7, 123
                  srli         s3, s8, 19
                  andi         ra, zero, 1228
                  nop
                  rem          a3, a5, t3
                  csrrwi       s8, 0x340, 28
                  sub          s0, s4, s5
                  and          a7, zero, s2
                  sltu         s11, zero, a1
                  csrrw        s4, 0x340, s0
                  c.add        a6, sp
                  div          s11, a4, s0
                  c.srai       s0, 15
                  mul          tp, t3, s9
                  or           s5, a5, s3
                  c.sub        a2, a2
                  c.nop
                  srai         t6, zero, 9
                  c.or         s0, a3
                  divu         s5, a5, t6
                  csrrsi       gp, 0x340, 0
                  mulhu        s9, s8, t0
                  sltu         a7, t1, t5
                  nop
                  c.nop
                  sra          a4, sp, a5
                  csrrc        a0, 0x340, zero
                  slli         a1, a4, 1
                  slli         s6, t5, 4
                  csrrc        s4, 0x340, gp
                  slti         a4, a2, -1861
                  nop
                  csrrc        t4, 0x340, zero
                  c.xor        s0, a0
                  divu         s11, t6, a5
                  c.addi4spn   a1, sp, 464
                  c.mv         tp, a0
                  auipc        s8, 406900
                  nop
                  slti         s10, t3, 271
                  c.sub        a3, a2
                  mulhsu       t6, s3, a1
                  csrrsi       s10, 0x340, 0
                  csrrw        t6, 0x340, gp
                  c.andi       s1, 20
                  mulh         s9, s4, gp
                  sltiu        s4, s7, 261
                  csrrc        s3, 0x340, s10
                  csrrwi       t5, 0x340, 17
                  rem          a0, a0, t1
                  c.nop
                  lui          t1, 1010636
                  c.slli       a7, 15
                  csrrs        t4, 0x340, zero
                  c.sub        a4, s1
                  c.sub        a2, a4
                  c.andi       s1, -1
                  srai         gp, s11, 25
                  mulh         s1, t2, s4
                  rem          t5, s11, s3
                  c.or         a0, a0
                  auipc        s9, 943777
                  csrrs        s4, 0x340, zero
                  lui          s2, 517457
                  c.or         a4, a4
                  mulh         gp, tp, a5
                  c.nop
                  xori         a0, t0, -1578
                  c.add        a7, a5
                  remu         gp, zero, gp
                  c.lui        s5, 27
                  c.srli       s1, 11
                  csrrsi       t4, 0x340, 0
                  mul          a1, ra, t1
                  c.sub        a4, a5
                  remu         a0, s10, a0
                  c.li         s10, 8
                  lui          ra, 391677
                  c.addi       gp, 1
                  csrrci       sp, 0x340, 0
                  mulhu        s7, a6, s5
                  mulhu        gp, ra, s8
                  csrrw        a7, 0x340, s6
                  sra          a6, gp, t5
                  csrrwi       s3, 0x340, 5
                  sub          t0, s9, zero
                  slt          a6, s0, a5
                  sub          s7, a6, a0
                  sub          a7, a6, s10
                  or           s4, s9, a3
                  lui          s10, 130849
                  mulh         s5, s10, sp
                  mulh         s5, tp, s8
                  csrrsi       a6, 0x340, 0
                  c.or         a0, a0
                  mulhu        a4, s8, zero
                  csrrc        s11, 0x340, zero
                  csrrc        s11, 0x340, sp
                  sll          s10, a5, t4
                  xor          tp, s2, ra
                  c.srai       a0, 26
                  slli         s8, a0, 31
                  xor          s5, a2, s2
                  c.addi       s11, -1
                  csrrw        a7, 0x340, s1
                  c.addi       a4, 14
                  ori          s4, a3, -1608
                  srai         s3, s3, 25
                  c.srli       a3, 15
                  auipc        a2, 601532
                  or           a7, s6, sp
                  c.and        a0, a4
                  mul          gp, a7, ra
                  remu         t0, a7, s9
                  csrrsi       s11, 0x340, 19
                  c.li         s11, -1
                  srli         t0, s7, 3
                  csrrci       a3, 0x340, 0
                  slli         s4, t3, 17
                  csrrci       s8, 0x340, 31
                  csrrw        ra, 0x340, t6
                  sltu         s0, a7, s11
                  c.li         t5, -1
                  c.and        a0, a0
                  slli         a0, s6, 0
                  c.addi       a7, -1
                  csrrw        a1, 0x340, t5
                  srl          gp, s5, t3
                  mulh         s4, t0, a0
                  xori         sp, s5, 1757
                  c.or         a3, a1
                  c.addi16sp   sp, 320
                  divu         s5, s10, a4
                  sltu         gp, a4, a7
                  c.addi4spn   s0, sp, 64
                  slt          t1, s3, t6
                  nop
                  c.slli       s4, 1
                  c.addi4spn   a0, sp, 224
                  slli         a3, ra, 5
                  addi         s10, t2, 1460
                  csrrwi       sp, 0x340, 25
                  csrrci       t4, 0x340, 9
                  rem          gp, t5, a5
                  slt          tp, t2, s7
                  nop
                  srai         t6, t2, 9
                  andi         a0, t4, -1211
                  slt          s5, s8, t4
                  c.or         a0, a0
                  c.nop
                  sll          a3, gp, t4
                  nop
                  csrrwi       a0, 0x340, 7
                  c.sub        s0, a5
                  srl          s10, a5, s8
                  xori         s10, a6, -1776
                  mul          a3, s0, tp
                  ori          zero, a6, 1945
                  sub          a7, a2, s8
                  slti         t1, a2, 2014
                  c.srli       s1, 9
                  xor          t1, t3, s5
                  c.addi16sp   sp, 224
                  slti         s10, t2, -679
                  c.srli       s0, 21
                  sll          t5, s9, s6
                  div          a6, s11, s4
                  c.lui        s5, 5
                  csrrsi       t6, 0x340, 0
                  c.addi16sp   sp, 64
                  rem          a1, zero, gp
                  div          s11, s6, t4
                  c.mv         s5, s5
                  sub          s4, t6, t2
                  xor          gp, zero, s5
                  mul          t5, s5, s8
                  csrrci       s1, 0x340, 16
                  c.add        t0, t1
                  csrrwi       s11, 0x340, 29
                  c.srli       a2, 22
                  sltiu        t4, a1, -1464
                  mulhu        s7, s9, s1
                  auipc        a1, 183300
                  c.xor        a0, a0
                  csrrc        ra, 0x340, zero
                  rem          s1, a2, tp
                  c.addi4spn   s1, sp, 208
                  addi         t1, s2, -568
                  sltu         a1, s0, sp
                  csrrs        t4, 0x340, zero
                  divu         a6, s0, a4
                  addi         s7, s0, 87
                  mulh         s2, s3, t1
                  slli         a6, s7, 25
                  c.srli       s0, 24
                  c.mv         t5, t5
                  remu         t6, ra, a4
                  c.add        t4, t6
                  c.mv         s11, t4
                  csrrs        t0, 0x340, s9
                  c.lui        t4, 26
                  sub          s2, s8, s10
                  xor          a4, s4, s1
                  xor          t1, s10, ra
                  c.addi16sp   sp, -16
                  remu         s4, s11, sp
                  csrrsi       a4, 0x340, 0
                  sltiu        zero, t5, -1281
                  c.add        s5, s7
                  rem          a6, zero, s8
                  slti         zero, s10, -1561
                  remu         a2, a7, s8
                  slt          s3, a2, sp
                  c.andi       a1, -1
                  csrrwi       a2, 0x340, 5
                  c.add        s11, s4
                  sltu         t6, zero, t2
                  sll          a3, s10, t2
                  mulhu        a1, s3, gp
                  xori         s6, t3, 498
                  xori         s4, a5, -1484
                  c.srai       s0, 3
                  c.or         a1, a3
                  andi         t1, a6, -891
                  slt          s3, sp, s10
                  csrrw        t5, 0x340, s9
                  sra          a6, a0, t4
                  csrrw        s3, 0x340, s6
                  c.and        a2, a4
                  c.lui        s3, 12
                  srl          s10, t0, s6
                  sll          t5, s0, s3
                  xori         s10, t5, 52
                  divu         zero, s3, a6
                  csrrci       a6, 0x340, 0
                  and          t5, s8, a5
                  slli         sp, s5, 29
                  slt          a1, a7, a3
                  c.srli       s0, 8
                  sltu         s10, a1, s8
                  csrrc        s7, 0x340, a4
                  remu         t5, a3, a1
                  srai         a1, s2, 15
                  csrrwi       s2, 0x340, 10
                  sub          s10, ra, a0
                  and          s11, t4, sp
                  c.li         s8, 23
                  xor          t5, a6, ra
                  ori          s1, a0, -1800
                  srli         s11, a1, 7
                  mulh         s4, s3, sp
                  c.srli       a1, 23
                  ori          t1, s2, 302
                  remu         s9, zero, a6
                  addi         a2, a4, 373
                  divu         s7, t0, t2
                  xori         ra, s4, -648
                  srai         zero, t1, 20
                  divu         a6, tp, s11
                  c.or         a2, a1
                  c.mv         s4, a4
                  sra          s2, s0, a3
                  or           sp, a1, t5
                  c.addi4spn   a1, sp, 448
                  mul          s8, a1, s7
                  csrrwi       t6, 0x340, 22
                  slti         sp, a4, 1290
                  c.slli       s8, 14
                  srl          a3, t2, s8
                  mul          s3, ra, a2
                  sub          a0, s9, a0
                  divu         ra, s0, a7
                  sll          ra, s7, s10
                  mulhsu       ra, s7, a6
                  and          tp, s7, t3
                  csrrs        t4, 0x340, zero
                  xor          a1, sp, t0
                  c.slli       a2, 7
                  csrrw        a3, 0x340, t4
                  c.add        t5, s1
                  c.addi       s3, -1
                  mul          zero, s6, s11
                  c.or         a3, a1
                  csrrci       a6, 0x340, 28
                  csrrci       sp, 0x340, 16
                  c.nop
                  andi         ra, s9, 1983
                  mulhsu       s10, s0, s3
                  and          s0, s8, s8
                  c.or         a4, a3
                  srl          zero, s1, t3
                  csrrc        a2, 0x340, zero
                  remu         a2, zero, ra
                  c.and        a4, a5
                  c.nop
                  c.addi       a1, 19
                  div          s11, t2, s2
                  c.lui        a7, 17
                  auipc        s5, 746511
                  c.lui        s0, 27
                  csrrc        s1, 0x340, zero
                  c.addi4spn   s0, sp, 832
                  and          s1, a3, gp
                  slti         s8, s4, 1840
                  c.addi       s9, -1
                  nop
                  srai         a6, s6, 4
                  slli         zero, t5, 14
                  and          s5, s11, sp
                  c.slli       a0, 7
                  slti         s5, s8, 1275
                  nop
                  sltu         s5, s5, a4
                  csrrw        t4, 0x340, t3
                  sll          a4, s8, s8
                  c.srai       a3, 20
                  xori         sp, a1, -291
                  c.srli       a4, 15
                  c.li         ra, -1
                  mulhu        t4, a3, s1
                  andi         s7, s5, 1204
                  csrrsi       a4, 0x340, 7
                  csrrs        t5, 0x340, zero
                  c.addi4spn   a1, sp, 912
                  c.slli       s0, 5
                  slti         gp, t3, -1548
                  xori         s7, zero, -483
                  c.andi       a1, 6
                  sltiu        ra, t5, 1123
                  mulhu        a0, s5, a0
                  rem          t1, t3, a6
                  mul          s8, a7, a5
                  divu         s6, s9, s8
                  andi         s3, t1, -877
                  c.and        a4, a1
                  c.mv         a7, s1
                  mulh         s11, s10, s8
                  or           tp, zero, t1
                  c.sub        a2, a1
                  c.mv         a3, s4
                  csrrwi       a0, 0x340, 1
                  xor          s3, s9, a2
                  xori         tp, a7, 365
                  ori          s3, s5, -1505
                  c.xor        s0, s1
                  csrrsi       a1, 0x340, 28
                  c.srli       a3, 11
                  sltiu        s11, t5, 150
                  mulhsu       s11, s4, zero
                  auipc        s11, 1040119
                  csrrw        s6, 0x340, a7
                  sltu         t0, a4, s4
                  csrrc        s1, 0x340, zero
                  c.addi4spn   a3, sp, 624
                  add          gp, s3, t1
                  srli         t0, s3, 26
                  c.xor        s1, a0
                  c.xor        a0, a0
                  c.lui        s9, 27
                  auipc        a2, 473839
                  nop
                  srli         gp, a1, 10
                  c.slli       s11, 30
                  c.xor        a1, a4
                  or           s9, s10, a7
                  srli         s2, s2, 31
                  c.srli       a0, 6
                  sra          t0, t0, t2
                  auipc        a3, 1043238
                  c.addi4spn   s1, sp, 288
                  csrrw        zero, 0x340, gp
                  mulhu        s2, sp, t0
                  ori          s7, a5, -1502
                  csrrw        t4, 0x340, ra
                  c.addi16sp   sp, 112
                  div          tp, t2, t2
                  c.li         s9, -1
                  c.addi4spn   s1, sp, 720
                  c.add        a7, s9
                  sltiu        a7, a4, -1731
                  c.mv         s0, s1
                  andi         s9, t3, -678
                  rem          a6, t0, t2
                  slt          t6, t2, a1
                  addi         a4, t4, -1080
                  slti         s10, s9, -583
                  and          s4, s5, t2
                  mulhu        s5, a1, t6
                  c.add        s10, a0
                  c.add        a4, s1
                  slt          a3, a7, a4
                  add          s11, t3, a6
                  c.addi4spn   s0, sp, 480
                  andi         a6, sp, -1127
                  c.add        a1, s10
                  csrrci       a1, 0x340, 30
                  div          t1, t1, s4
                  addi         a6, t3, 532
                  slt          tp, a6, t6
                  srai         s3, a0, 23
                  mulhsu       s9, s10, t2
                  c.addi4spn   a0, sp, 848
                  c.addi4spn   a2, sp, 80
                  andi         t1, t2, 1422
                  sltiu        a6, a7, -517
                  sltiu        s11, t0, 826
                  sltu         a3, t0, s0
                  rem          s11, s11, a1
                  lui          s3, 150112
                  div          a4, a7, s2
                  csrrwi       t4, 0x340, 15
                  mul          s5, t3, tp
                  c.addi4spn   a4, sp, 208
                  c.li         a3, -1
                  csrrci       s10, 0x340, 19
                  nop
                  srl          t1, s2, s11
                  lui          a4, 605888
                  ori          a0, sp, 1908
                  slti         s6, s5, -1286
                  addi         t0, ra, 861
                  csrrwi       s1, 0x340, 10
                  c.lui        gp, 21
                  srai         s10, t1, 8
                  slti         a2, a0, -1949
                  c.andi       a3, 2
                  c.and        a2, s1
                  c.mv         s4, s11
                  remu         a3, t3, s6
                  add          s0, s9, a2
                  c.sub        s1, s1
                  c.addi4spn   s1, sp, 480
                  sll          s1, s9, a2
                  auipc        ra, 656158
                  rem          s10, gp, s5
                  csrrc        t5, 0x340, zero
                  csrrc        ra, 0x340, zero
                  xor          s11, s8, s3
                  addi         tp, s10, 828
                  sra          s9, s7, s10
                  c.mv         s6, s4
                  srai         s3, t1, 28
                  xori         gp, t4, 763
                  csrrc        ra, 0x340, s0
                  divu         s2, tp, a7
                  csrrw        s11, 0x340, s6
                  c.srai       a1, 22
                  c.and        a0, a0
                  slt          a6, a6, a4
                  slt          s3, a3, a6
                  remu         s1, a5, s3
                  xor          ra, a0, a5
                  rem          a3, s4, ra
                  divu         s11, s5, s8
                  nop
                  xor          s5, t4, s5
                  sra          a1, s10, s8
                  xori         ra, a4, -1841
                  nop
                  c.addi4spn   a1, sp, 528
                  c.andi       a0, -1
                  nop
                  srai         t0, tp, 16
                  sub          a2, s5, s7
                  csrrs        s7, 0x340, s0
                  mulhsu       s3, s5, tp
                  c.mv         s10, t2
                  csrrci       s8, 0x340, 0
                  xori         s8, t6, -517
                  c.slli       sp, 28
                  c.xor        a0, a2
                  sll          a7, gp, t6
                  csrrs        a2, 0x340, s5
                  and          s4, s2, t3
                  srai         s6, zero, 20
                  divu         a6, t6, t0
                  csrrci       a7, 0x340, 0
                  mulhu        s11, a0, t2
                  c.addi4spn   a4, sp, 112
                  c.and        s1, a3
                  xor          a2, tp, a2
                  sltiu        s4, t1, -586
                  csrrc        s9, 0x340, t5
                  xor          t1, s7, s4
                  c.and        a3, a0
                  andi         sp, t1, -201
                  csrrs        sp, 0x340, a4
                  add          s6, t1, a7
                  or           a3, a7, t6
                  mulhu        ra, t0, s8
                  c.and        a4, a0
                  c.slli       a2, 9
                  mulhsu       s2, gp, a7
                  c.sub        a0, a3
                  sltu         gp, sp, sp
                  ori          s3, s2, 567
                  slti         a6, a2, -197
                  div          a6, s4, a3
                  c.li         gp, 20
                  nop
                  lui          a1, 833467
                  mulh         t4, s5, s6
                  srl          s8, s11, a5
                  mulhu        s10, s2, s2
                  sra          a7, ra, a5
                  nop
                  csrrc        a1, 0x340, ra
                  and          s5, s4, a4
                  c.nop
                  nop
                  c.srai       a2, 26
                  slt          sp, a5, s6
                  csrrw        t6, 0x340, s4
                  c.addi4spn   a2, sp, 16
                  nop
                  or           a6, sp, a2
                  addi         s5, t6, 213
                  c.li         t6, -1
                  slti         s11, s5, -1267
                  mul          t4, t1, s5
                  c.srli       a3, 9
                  c.slli       a4, 9
                  slti         a7, s4, 1443
                  srai         gp, zero, 11
                  and          a6, s2, a5
                  auipc        s9, 261125
                  c.srli       s0, 23
                  remu         s5, s10, s5
                  c.nop
                  c.srai       a3, 3
                  srli         zero, s1, 2
                  slti         s3, s7, -1303
                  c.addi4spn   a2, sp, 224
                  c.sub        a0, a4
                  remu         s5, t6, s10
                  c.sub        a2, s1
                  rem          a2, t0, sp
                  mulh         a4, a0, a6
                  slt          s9, a7, s2
                  c.addi16sp   sp, -16
                  c.srai       a3, 4
                  sub          s5, ra, t3
                  slli         s5, t0, 17
                  c.addi16sp   sp, 176
                  c.add        s9, a2
                  c.slli       a3, 5
                  c.addi4spn   a4, sp, 656
                  c.srli       s0, 7
                  c.andi       s1, -1
                  c.nop
                  rem          gp, s3, a3
                  add          sp, t1, a2
                  sra          s5, sp, ra
                  divu         t5, t4, s4
                  sll          t1, t0, s4
                  andi         a1, a4, -1995
                  csrrw        s7, 0x340, s5
                  mul          s9, t0, s2
                  xori         s4, t4, -590
                  or           sp, a7, tp
                  mul          t6, s7, t0
                  c.srai       a0, 14
                  mulhu        a3, t6, s6
                  c.slli       s5, 14
                  sltiu        t5, s10, 515
                  mulhu        a6, t2, s9
                  c.mv         s8, t3
                  c.andi       a0, -1
                  c.sub        s0, a0
                  sltiu        s1, s10, 791
                  c.slli       s6, 15
                  csrrci       s2, 0x340, 0
                  nop
                  csrrw        a0, 0x340, t3
                  rem          t0, t0, s7
                  ori          ra, s7, -324
                  c.lui        s10, 2
                  div          a3, s6, zero
                  lui          sp, 825746
                  div          a0, s2, t2
                  c.li         t4, -1
                  csrrci       s11, 0x340, 0
                  and          a3, t4, zero
                  c.and        a1, a3
                  sltiu        a2, s10, -181
                  slt          ra, a4, s7
                  xor          t4, s8, s9
                  srai         a6, t4, 10
                  ori          s3, s4, 823
                  sltu         t0, t1, t6
                  mulhsu       tp, t1, zero
                  add          a0, s11, t3
                  or           s8, a4, t0
                  sltu         a7, s10, s1
                  rem          t0, s9, t0
                  slti         a2, a2, -505
                  and          a7, tp, t4
                  ori          a1, s9, -999
                  addi         a2, a2, 336
                  xor          s10, s3, a0
                  slt          zero, s2, a0
                  mul          s8, t1, s0
                  xor          a3, a2, t1
                  csrrw        a1, 0x340, a3
                  lui          s8, 450104
                  add          t5, s4, s11
                  csrrw        t0, 0x340, ra
                  sll          tp, t6, a1
                  c.mv         s9, a0
                  divu         tp, s4, s4
                  c.sub        a4, s1
                  c.add        a7, ra
                  mulhu        s11, a2, tp
                  c.lui        s2, 11
                  add          s7, s6, s8
                  srai         s8, t3, 19
                  andi         a0, a1, 1129
                  add          s9, s4, a6
                  srai         a4, t6, 27
                  rem          s7, s9, s9
                  slt          gp, s6, s11
                  divu         t5, gp, a5
                  sra          s4, t3, s5
                  auipc        sp, 962208
                  srl          a3, a3, t5
                  c.add        gp, s7
                  lui          s3, 531238
                  csrrc        zero, 0x340, zero
                  add          s9, t5, a2
                  mulhsu       a4, s9, gp
                  xori         s3, sp, 1201
                  or           s2, gp, t0
                  csrrwi       a7, 0x340, 29
                  sra          s9, a5, t6
                  sltu         a2, a5, gp
                  srai         a2, s0, 21
                  c.or         s1, a4
                  auipc        s10, 564024
                  c.add        s9, a2
                  andi         s6, gp, 566
                  slti         t4, t2, -636
                  slti         t4, t5, 1321
                  remu         s8, s1, s5
                  mulhu        s7, sp, t2
                  mulhsu       zero, a5, t1
                  c.srli       a3, 29
                  c.mv         a7, s3
                  srl          t5, sp, s2
                  csrrc        t6, 0x340, zero
                  ori          s11, s9, -100
                  lui          s3, 631431
                  csrrw        t4, 0x340, tp
                  mulhsu       s11, t2, a6
                  c.slli       t6, 22
                  rem          s0, a0, a4
                  ori          s11, s1, -766
                  ori          a6, a1, -68
                  or           tp, sp, a1
                  mulhsu       t6, ra, a2
                  c.addi16sp   sp, 416
                  div          tp, s6, s2
                  c.nop
                  sltu         zero, s8, t6
                  srli         a1, a0, 22
                  mulh         s1, s3, a0
                  mul          s6, s0, s8
                  c.li         s1, -1
                  mulhsu       gp, s10, sp
                  srli         s3, sp, 1
                  mul          ra, a4, s11
                  ori          ra, a2, -831
                  or           a7, a2, zero
                  andi         tp, t1, 988
                  sll          s0, a5, s3
                  c.addi       t4, -1
                  sltiu        s2, t1, 278
                  and          a3, t1, ra
                  c.mv         s10, tp
                  mulh         s0, s8, s9
                  c.andi       a1, -1
                  div          gp, a4, a0
                  srl          tp, s0, t4
                  csrrwi       s4, 0x340, 9
                  c.sub        a0, a2
                  auipc        s5, 627037
                  c.andi       a1, -1
                  ori          t6, a4, -194
                  add          a2, s8, t4
                  xor          s6, s2, s6
                  csrrci       sp, 0x340, 0
                  srl          s6, sp, a5
                  csrrwi       s4, 0x340, 6
                  sll          a2, t2, s3
                  or           s9, t2, a0
                  csrrc        t5, 0x340, zero
                  sll          s1, gp, s6
                  c.or         a1, a2
                  csrrsi       a0, 0x340, 0
                  c.addi4spn   a2, sp, 192
                  nop
                  csrrs        s7, 0x340, s1
                  divu         tp, a4, t3
                  srai         a7, t5, 13
                  srai         zero, s2, 21
                  rem          s10, s9, t1
                  csrrc        s5, 0x340, zero
                  nop
                  mulhu        s0, s5, s5
                  c.mv         s11, s7
                  sltiu        sp, s4, 1686
                  csrrs        zero, 0x340, a5
                  srli         t0, ra, 0
                  remu         s5, s10, t5
                  sltu         t4, t6, tp
                  and          s6, s9, t5
                  sll          gp, a4, sp
                  lui          s11, 455545
                  csrrs        s11, 0x340, t0
                  c.and        s1, s1
                  c.srai       a2, 12
                  addi         a7, a4, 1496
                  c.srli       a2, 28
                  c.or         a4, s0
                  c.addi16sp   sp, -16
                  sra          s4, tp, s6
                  c.andi       a3, -1
                  c.nop
                  xor          a0, s8, a5
                  add          a6, a4, t1
                  c.lui        t6, 7
                  xori         s5, s9, -301
                  mul          s2, s3, s2
                  mul          a4, tp, t4
                  add          a3, t2, a6
                  srai         s9, s0, 29
                  c.sub        a2, a4
                  sll          s0, s1, a0
                  lui          t4, 1045075
                  csrrc        a6, 0x340, a0
                  c.sub        s1, s1
                  csrrw        t0, 0x340, zero
                  sll          a6, s4, s6
                  csrrs        a4, 0x340, a0
                  auipc        s2, 729170
                  slli         ra, ra, 7
                  sra          a4, s0, t4
                  sub          a3, s0, t0
                  c.addi       t4, 18
                  sub          a3, t0, t4
                  divu         s0, tp, t5
                  csrrsi       s10, 0x340, 28
                  srli         s7, t4, 9
                  srli         a0, s0, 21
                  c.add        tp, s6
                  c.mv         t5, s5
                  c.and        a3, s1
                  c.mv         t6, a6
                  c.li         t1, 26
                  c.srli       a3, 7
                  auipc        t6, 63392
                  c.mv         a1, t0
                  csrrs        ra, 0x340, s9
                  csrrc        zero, 0x340, zero
                  c.and        a2, s0
                  add          t0, t5, t0
                  andi         sp, s0, 1656
                  sub          zero, t6, s7
                  or           a3, s9, a2
                  sub          a1, ra, a7
                  or           s10, s0, t5
                  c.nop
                  c.srli       a3, 14
                  csrrc        a4, 0x340, a3
                  xor          s5, a1, t5
                  slli         zero, gp, 9
                  or           s6, s11, t1
                  c.addi4spn   a3, sp, 208
                  c.srai       a0, 17
                  mulhu        a2, zero, a6
                  lui          a1, 834624
                  csrrsi       a4, 0x340, 0
                  c.srai       a4, 10
                  c.srai       a2, 30
                  sll          s5, a4, a2
                  c.li         s11, -1
                  slli         s3, t1, 31
                  c.or         a1, a4
                  srai         t4, s5, 29
                  csrrwi       s5, 0x340, 16
                  sltiu        zero, a4, 1107
                  c.or         s1, a0
                  ori          s6, s11, -1667
                  c.addi16sp   sp, 128
                  c.or         a4, a1
                  csrrsi       s4, 0x340, 0
                  sub          a1, s9, s10
                  slt          a0, sp, t3
                  c.slli       a0, 13
                  mul          s0, tp, ra
                  mulhu        s11, a5, s6
                  lui          t1, 789780
                  div          s1, s3, t1
                  addi         a2, a5, 70
                  c.srai       a3, 24
                  c.and        s0, a4
                  xor          a7, t1, a1
                  lui          s1, 812574
                  nop
                  remu         t5, a7, t4
                  slti         s7, a5, 460
                  c.srai       a4, 11
                  xori         gp, s6, -9
                  mul          a0, t0, s10
                  ori          s0, t2, -1314
                  rem          s3, sp, s11
                  mulhsu       s9, s11, zero
                  c.addi16sp   sp, 48
                  csrrc        tp, 0x340, t1
                  c.srai       a4, 14
                  div          s8, ra, a6
                  sltiu        sp, s5, 918
                  c.addi16sp   sp, -16
                  c.slli       s9, 15
                  mulhu        s2, s1, t3
                  c.andi       s0, -1
                  slli         a0, a4, 4
                  xori         a6, sp, 1169
                  srai         a0, s1, 13
                  sltiu        tp, t5, -1120
                  c.addi4spn   a1, sp, 672
                  c.lui        s1, 10
                  c.mv         a7, s9
                  xor          s4, s5, tp
                  csrrci       gp, 0x340, 24
                  c.li         s4, -1
                  c.nop
                  c.sub        a4, s0
                  c.li         t1, -1
                  csrrci       a2, 0x340, 0
                  mulhu        t6, sp, s8
                  andi         t5, a4, 320
                  c.addi4spn   s0, sp, 656
                  ori          a1, s2, 334
                  srai         t5, t1, 28
                  mul          a0, s3, s4
                  sltiu        t5, s8, 960
                  srl          s1, s3, a6
                  sub          t1, t2, t3
                  c.nop
                  rem          a1, t0, s10
                  mulhu        s11, s8, zero
                  remu         t0, a2, t0
                  xor          s4, a4, ra
                  c.addi       s4, 18
                  remu         gp, gp, tp
                  slli         a4, s0, 25
                  c.andi       a3, 15
                  nop
                  sub          s5, gp, t1
                  c.addi       gp, -1
                  c.addi16sp   sp, -16
                  slti         t6, t0, 1626
                  c.mv         s2, s4
                  divu         a1, a6, s3
                  c.andi       a3, 22
                  c.srli       a0, 6
                  sll          sp, s6, gp
                  csrrsi       a3, 0x340, 0
                  mul          a6, s4, s5
                  c.srai       a3, 20
                  srl          t6, s10, a7
                  lui          s8, 756124
                  c.mv         t5, s8
                  ori          ra, t1, -970
                  remu         s4, s1, s6
                  ori          s9, s10, 83
                  csrrc        a7, 0x340, a5
                  slt          a1, tp, a0
                  csrrsi       a7, 0x340, 0
                  c.and        a1, a1
                  csrrsi       a4, 0x340, 0
                  nop
                  csrrw        s6, 0x340, a6
                  add          zero, s9, s6
                  mul          s2, s2, zero
                  xori         a1, t2, 1699
                  or           s8, t6, a1
                  srli         a2, zero, 22
                  addi         a6, s5, -1489
                  c.nop
                  andi         tp, a2, 715
                  mulhsu       s0, t5, a7
                  c.srli       s0, 28
                  c.or         a3, a0
                  remu         s10, t3, a7
                  c.add        s3, s10
                  c.srli       a3, 20
                  and          t4, sp, t3
                  csrrw        t4, 0x340, s8
                  slt          t0, a3, t2
                  remu         t0, t0, a0
                  c.xor        a2, a3
                  csrrw        t6, 0x340, s10
                  c.li         tp, 25
                  csrrci       a4, 0x340, 0
                  csrrsi       s7, 0x340, 26
                  csrrc        s0, 0x340, t2
                  remu         s0, a0, s9
                  and          t5, s8, s9
                  sll          ra, a6, s5
                  ori          a1, ra, -1765
                  c.nop
                  xori         s2, tp, -1235
                  srli         t1, s11, 3
                  srai         a6, s11, 11
                  csrrs        s11, 0x340, zero
                  mulhu        a1, a4, a2
                  c.or         a3, a4
                  c.sub        s0, a0
                  c.add        s8, s4
                  c.or         a3, a0
                  c.and        a2, a5
                  c.sub        a4, a2
                  sll          s10, s4, a5
                  csrrw        a3, 0x340, a7
                  c.addi16sp   sp, 240
                  lui          s5, 742557
                  c.addi4spn   a0, sp, 208
                  sltiu        s6, zero, 512
                  sub          s4, s9, s7
                  andi         s3, ra, -61
                  c.mv         a3, t2
                  and          a2, s1, s8
                  c.andi       s0, 5
                  csrrc        s8, 0x340, zero
                  c.srli       a2, 6
                  xor          zero, t5, sp
                  div          t5, a4, t6
                  c.addi4spn   a4, sp, 272
                  slti         a7, a7, 2023
                  mulhsu       s5, a5, t3
                  c.srli       a3, 18
                  xori         s11, t0, 321
                  mulhu        s2, a6, s11
                  c.nop
                  c.sub        s0, a1
                  nop
                  sub          t0, s0, s4
                  rem          a1, a0, s2
                  c.add        tp, sp
                  c.lui        t1, 20
                  c.srli       s0, 9
                  div          a2, s11, t2
                  sub          sp, t1, s2
                  xor          a3, s1, a1
                  c.li         a2, 4
                  and          s0, a3, zero
                  csrrsi       sp, 0x340, 0
                  c.lui        s7, 24
                  sltu         s8, s3, sp
                  csrrci       s10, 0x340, 16
                  c.srli       a4, 2
                  c.lui        a1, 31
                  sub          ra, s10, t4
                  sra          zero, t6, ra
                  nop
                  c.nop
                  sltiu        t6, s7, -69
                  srai         a7, a1, 30
                  sltu         tp, a1, s11
                  c.nop
                  sltu         tp, s10, s9
                  andi         s9, t5, -855
                  c.and        s1, a0
                  auipc        t1, 458589
                  and          t5, t6, s8
                  csrrci       zero, 0x340, 17
                  slti         s0, a2, 1454
                  and          s0, s11, t6
                  srai         s8, s10, 29
                  csrrwi       s2, 0x340, 20
                  c.li         s5, -1
                  sll          ra, a3, t0
                  srl          gp, s4, s6
                  c.or         a2, a3
                  nop
                  slli         t0, a1, 26
                  add          s1, t2, sp
                  sltu         s11, tp, a5
                  srai         s10, s4, 26
                  c.addi4spn   a0, sp, 208
                  ori          s8, s0, -1429
                  srl          s11, t4, s10
                  csrrc        s3, 0x340, zero
                  mulhsu       a3, ra, s0
                  nop
                  c.srli       a3, 26
                  csrrci       a2, 0x340, 22
                  csrrw        tp, 0x340, t0
                  srli         s4, s0, 24
                  c.or         a2, a2
                  and          s6, s5, t3
                  sltu         a0, t0, t6
                  c.addi4spn   a1, sp, 48
                  c.add        a3, s0
                  csrrs        a1, 0x340, zero
                  mulh         s6, ra, sp
                  nop
                  c.addi4spn   a4, sp, 656
                  addi         s4, s1, -1421
                  c.slli       s1, 6
                  c.addi       a4, 7
                  auipc        t4, 320894
                  mulh         s3, zero, t0
                  csrrwi       a0, 0x340, 17
                  csrrs        a0, 0x340, s0
                  csrrw        zero, 0x340, a7
                  c.addi4spn   s1, sp, 400
                  c.nop
                  c.andi       a4, 20
                  csrrc        a1, 0x340, s1
                  c.addi4spn   a3, sp, 832
                  c.xor        a1, a2
                  srli         a3, s6, 8
                  c.srli       s1, 26
                  c.srai       a3, 12
                  sltiu        s6, s8, -851
                  csrrc        a3, 0x340, t1
                  xori         s5, a2, -301
                  csrrw        s2, 0x340, t1
                  remu         s8, s2, s2
                  divu         a7, t2, s0
                  or           s0, a5, a1
                  mulhsu       s0, s8, a2
                  c.and        a1, s0
                  divu         s6, a7, s8
                  srl          a3, t3, t1
                  c.addi       a4, -1
                  c.nop
                  andi         t5, s8, -605
                  add          s9, s9, tp
                  csrrci       a7, 0x340, 10
                  auipc        s7, 532424
                  mul          t1, t3, s11
                  c.srli       a0, 31
                  sltiu        a0, a4, 784
                  xori         s10, t4, -1094
                  andi         tp, a6, 837
                  add          a2, a7, s10
                  or           t0, s7, a7
                  srl          tp, sp, a4
                  srl          a3, t0, t1
                  mulhu        a3, a3, zero
                  mulhu        zero, s7, t5
                  c.mv         s5, tp
                  mulhsu       gp, a3, s8
                  c.addi       s2, -1
                  div          s0, t3, s3
                  c.xor        a1, a4
                  csrrsi       t1, 0x340, 14
                  c.addi4spn   s1, sp, 224
                  c.slli       a4, 1
                  xor          s7, t2, s11
                  csrrw        t1, 0x340, a2
                  sub          s2, t2, s8
                  mulh         s1, s5, t2
                  and          a1, s10, t5
                  c.slli       tp, 22
                  c.addi16sp   sp, 144
                  mul          a4, a1, a6
                  c.add        s6, t2
                  auipc        s10, 828600
                  sltu         t4, s0, a5
                  c.srai       s0, 22
                  auipc        s7, 131125
                  andi         zero, a6, 1883
                  sltu         zero, a7, ra
                  sltiu        s10, s3, 290
                  csrrc        t5, 0x340, a2
                  or           s11, t3, s2
                  lui          t1, 754202
                  srl          s11, a3, s7
                  srl          t5, a2, a7
                  sltu         s0, t6, s5
                  rem          tp, s6, s4
                  lui          a3, 417005
                  or           s8, s7, a4
                  xori         s8, t0, 40
                  slti         a4, t1, 1525
                  or           t5, a7, s6
                  slt          zero, s8, s5
                  auipc        sp, 345054
                  mulhsu       s10, a7, s2
                  remu         s0, s3, t0
                  c.slli       s4, 7
                  nop
                  xor          s1, s4, a3
                  sltiu        a4, sp, -2017
                  srai         a4, s9, 27
                  ori          a3, zero, 1966
                  csrrwi       sp, 0x340, 12
                  divu         s1, t0, a3
                  remu         s8, zero, zero
                  mul          s2, s8, zero
                  xori         s6, a0, -431
                  csrrsi       s0, 0x340, 0
                  csrrs        a7, 0x340, zero
                  auipc        a4, 263392
                  c.nop
                  and          ra, t2, a4
                  mul          s0, a0, s11
                  or           s1, s11, s9
                  csrrc        a2, 0x340, a4
                  c.srai       a4, 30
                  mulhu        t4, a4, a3
                  csrrci       s3, 0x340, 17
                  c.nop
                  sltu         s0, gp, s0
                  c.or         s0, a3
                  c.and        s0, a5
                  c.addi       ra, -1
                  sll          t4, a0, a7
                  c.andi       a3, -1
                  mul          s6, t2, t4
                  c.xor        s1, a4
                  sub          s2, s1, t0
                  c.xor        a2, a5
                  srai         t0, s11, 30
                  and          s11, s8, t4
                  xori         s5, t4, 579
                  srai         t5, a2, 20
                  div          a0, s5, a7
                  sra          t6, s9, a3
                  csrrw        s11, 0x340, t4
                  c.xor        s0, a2
                  sltiu        t4, a1, 1273
                  auipc        a3, 441970
                  mul          t5, sp, t1
                  divu         zero, t6, t6
                  div          s1, a7, s1
                  c.lui        s2, 15
                  mul          t0, s0, s6
                  srl          t6, a5, a5
                  mul          s2, t5, s8
                  c.or         a3, a0
                  srai         a3, ra, 21
                  xor          t5, zero, s5
                  c.xor        a3, a4
                  c.addi4spn   s1, sp, 144
                  mulhu        ra, s3, a1
                  andi         s10, t2, 781
                  c.lui        s4, 4
                  mul          s3, t1, ra
                  xori         s8, a6, -42
                  srli         s4, s11, 28
                  csrrci       gp, 0x340, 16
                  c.slli       a6, 22
                  c.nop
                  c.xor        a0, a0
                  c.addi16sp   sp, 128
                  divu         s5, a5, gp
                  lui          t0, 511421
                  sltu         s8, gp, s9
                  xor          s2, s0, s0
                  c.slli       a6, 15
                  csrrci       s8, 0x340, 19
                  c.add        a4, s10
                  c.addi16sp   sp, 240
                  c.or         a4, a1
                  c.and        a0, s1
                  c.or         s1, a3
                  srl          a7, s6, t4
                  c.and        a4, a4
                  divu         s4, t4, gp
                  sltiu        tp, a7, 1879
                  xori         s0, s6, 135
                  c.xor        a2, s0
                  mul          t4, s10, a1
                  srl          t0, t6, s2
                  xori         s7, t2, 1366
                  c.addi16sp   sp, -16
                  c.and        a1, a0
                  slt          a1, t2, s2
                  c.xor        a0, a2
                  c.lui        a1, 7
                  remu         a7, s0, t4
                  mulh         t1, t5, s9
                  c.add        a3, s6
                  csrrw        s4, 0x340, a2
                  lui          a0, 905179
                  slti         s9, s6, 336
                  slt          a3, t3, t1
                  mulhsu       t4, s5, s9
                  csrrsi       s10, 0x340, 27
                  csrrwi       s10, 0x340, 4
                  remu         s9, s4, t0
                  c.sub        a3, a5
                  and          s6, a1, t0
                  c.andi       a0, 15
                  ori          s5, a7, 527
                  or           s1, t5, s6
                  c.lui        a3, 25
                  addi         s1, s9, 1406
                  c.or         s1, s0
                  div          s3, t1, t6
                  remu         a3, a0, ra
                  mul          a4, t5, t1
                  c.addi       s9, -1
                  ori          ra, a2, 30
                  mulh         s4, s7, s7
                  mulhu        t0, a0, t1
                  csrrs        t4, 0x340, s5
                  c.sub        s0, a3
                  xori         a4, s1, -37
                  div          s9, s6, t2
                  srl          sp, s11, s11
                  and          a4, a0, s3
                  sll          s3, a7, s6
                  c.slli       gp, 26
                  xor          a3, a2, t1
                  slt          a6, s5, s9
                  rem          zero, zero, t4
                  c.or         s1, a1
                  c.and        a4, s1
                  rem          a7, sp, a4
                  sra          t1, t3, s6
                  csrrs        s7, 0x340, gp
                  c.andi       s0, -1
                  auipc        s4, 810999
                  remu         s2, s3, s0
                  c.andi       a0, -1
                  c.and        s0, a0
                  c.lui        a7, 22
                  divu         ra, a2, t4
                  c.addi16sp   sp, -16
                  mulhsu       s2, s0, ra
                  remu         s7, s0, s7
                  nop
                  or           s9, s0, t4
                  csrrw        s3, 0x340, s4
                  srai         s4, s3, 4
                  div          a1, s8, a7
                  c.and        a3, a5
                  srai         a1, s10, 12
                  or           ra, a6, tp
                  xor          s2, s7, s0
                  csrrsi       t0, 0x340, 9
                  csrrwi       t6, 0x340, 19
                  ori          t0, tp, 1407
                  c.srai       s1, 13
                  ori          s1, zero, 81
                  addi         s7, zero, 71
                  sltu         s2, t2, t6
                  c.and        a4, a2
                  ori          a0, zero, -1558
                  remu         a6, s7, t1
                  slti         sp, a1, -179
                  addi         t4, s6, -1406
                  nop
                  srai         t0, t3, 28
                  c.add        sp, t2
                  c.sub        a4, a0
                  slt          s1, s7, a1
                  csrrwi       s5, 0x340, 9
                  c.sub        a3, a2
                  sll          a3, s11, t4
                  lui          a3, 849539
                  c.or         a1, s1
                  csrrsi       zero, 0x340, 0
                  remu         t1, s1, s11
                  c.and        a0, a0
                  srli         s8, a3, 27
                  c.addi16sp   sp, 256
                  c.addi4spn   s1, sp, 304
                  or           s4, s6, ra
                  csrrsi       t4, 0x340, 0
                  sra          s9, s5, t5
                  csrrc        s7, 0x340, a2
                  csrrc        gp, 0x340, zero
                  csrrs        a2, 0x340, s8
                  mul          a1, t1, s1
                  add          ra, s5, s5
                  c.li         t1, -1
                  slti         a2, a2, 920
                  c.nop
                  c.li         a6, -1
                  c.addi       s0, 30
                  sltu         sp, t2, s4
                  csrrw        t4, 0x340, a6
                  nop
                  srli         s3, ra, 29
                  srai         a3, t1, 12
                  remu         t4, t6, t5
                  remu         s9, t2, s0
                  c.addi       s8, -1
                  mulhsu       t5, s1, s8
                  slli         gp, ra, 21
                  xor          ra, a5, sp
                  c.or         a2, a1
                  c.srai       s1, 23
                  sra          zero, s8, s5
                  auipc        t6, 833130
                  rem          s5, a3, s6
                  sltiu        s10, s4, 1731
                  c.addi4spn   s1, sp, 992
                  c.and        a2, s0
                  c.li         s9, -1
                  sub          a7, a7, s6
                  mulhsu       s0, a1, t2
                  or           a3, t2, sp
                  c.add        a3, t4
                  c.addi16sp   sp, -16
                  mulhsu       s3, t6, gp
                  csrrs        zero, 0x340, zero
                  sub          s4, s7, s9
                  c.nop
                  c.addi16sp   sp, -16
                  and          t0, sp, s0
                  c.mv         t1, s9
                  csrrw        zero, 0x340, a6
                  c.sub        s1, s1
                  srl          s3, gp, s8
                  rem          a3, t0, t1
                  rem          s1, a4, a0
                  c.srai       s1, 2
                  slti         s1, s4, 675
                  c.addi       gp, 23
                  auipc        s2, 85285
                  c.sub        s1, a4
                  c.add        s4, a0
                  csrrsi       s10, 0x340, 0
                  c.srli       a2, 3
                  srai         a7, s8, 27
                  xor          s6, t5, zero
                  srli         a7, t5, 21
                  c.andi       a1, 22
                  mulhsu       s7, sp, a5
                  div          a3, a1, s3
                  c.srai       a2, 11
                  c.mv         t1, sp
                  nop
                  srl          a6, s9, zero
                  csrrs        ra, 0x340, zero
                  srai         a2, t5, 9
                  csrrc        t0, 0x340, t4
                  csrrs        a6, 0x340, a4
                  div          s7, t4, t4
                  c.or         a1, a0
                  c.add        gp, gp
                  c.lui        s9, 8
                  sltiu        a4, t0, -1668
                  csrrc        a3, 0x340, s3
                  c.addi       s1, -1
                  slli         s6, s9, 20
                  sll          s0, a0, a1
                  c.slli       s9, 5
                  add          s2, s3, t1
                  sra          a7, s6, s5
                  slli         zero, s8, 29
                  c.addi16sp   sp, 16
                  ori          a7, s0, -44
                  sll          s6, a4, gp
                  and          t6, zero, s2
                  remu         a7, a1, t6
                  c.mv         t1, t1
                  mulhsu       ra, s9, t2
                  ori          s3, t0, -502
                  sll          a4, t2, s2
                  nop
                  csrrw        t6, 0x340, s8
                  csrrc        a0, 0x340, s11
                  c.add        s3, s2
                  c.xor        s1, a1
                  csrrsi       s1, 0x340, 12
                  and          s6, t1, t1
                  sltu         ra, s2, a0
                  sltiu        s5, t4, -275
                  xor          s6, a4, t3
                  xori         a2, s7, -831
                  c.addi4spn   s0, sp, 864
                  rem          a6, a2, s1
                  mul          s2, t0, a2
                  div          s2, s2, a7
                  c.add        a1, s0
                  sltiu        s1, a7, 1646
                  mulhsu       t0, s4, a7
                  div          sp, t6, s10
                  mulhu        s3, s2, s1
                  mulhu        tp, gp, tp
                  ori          s1, t4, -1680
                  sltu         s4, a0, s10
                  c.li         s4, -1
                  slti         t6, zero, 733
                  csrrwi       s0, 0x340, 13
                  c.srli       a3, 18
                  divu         s9, s4, t5
                  c.addi       s9, -1
                  slli         s0, a7, 17
                  c.srli       a0, 31
                  lui          s4, 511827
                  xori         a2, a1, 1703
                  rem          a0, s0, a5
                  c.lui        a1, 9
                  csrrw        s9, 0x340, s8
                  csrrci       s6, 0x340, 0
                  c.or         a0, s1
                  xori         s8, a6, 760
                  c.andi       a0, -1
                  c.srai       a2, 31
                  mulh         sp, s5, s2
                  srl          a7, s7, s9
                  csrrwi       s8, 0x340, 9
                  xori         s4, a7, 627
                  mul          s8, s2, gp
                  sltiu        a0, s7, -741
                  srl          t4, s8, s9
                  c.andi       a3, 12
                  xori         s10, s3, -60
                  sub          s8, s7, t2
                  srli         s2, s7, 15
                  c.addi4spn   a3, sp, 752
                  srli         s10, t4, 6
                  c.add        s4, s4
                  c.xor        s0, a2
                  c.slli       ra, 18
                  csrrsi       tp, 0x340, 20
                  c.lui        s9, 11
                  c.addi16sp   sp, -16
                  mulhu        t1, t0, t2
                  c.srai       s1, 22
                  srli         s7, a4, 3
                  c.add        s10, a6
                  c.and        a0, s0
                  srli         s11, a4, 18
                  and          s1, t2, t1
                  nop
                  csrrwi       s4, 0x340, 9
                  mulhsu       s9, ra, s6
                  csrrw        ra, 0x340, a4
                  csrrsi       s11, 0x340, 0
                  c.and        s0, a5
                  sra          t0, s8, a0
                  or           s4, s6, t6
                  srli         t4, s7, 16
                  csrrci       s4, 0x340, 0
                  xor          t6, s1, t5
                  c.andi       s0, 26
                  or           s11, sp, s10
                  slti         gp, s1, -589
                  slt          t0, zero, a4
                  and          sp, s11, s0
                  divu         s2, s11, s10
                  csrrci       s10, 0x340, 0
                  csrrwi       s3, 0x340, 15
                  ori          t4, t0, 1555
                  c.and        a4, a3
                  xori         zero, ra, 137
                  sra          a2, zero, a5
                  c.addi4spn   s0, sp, 864
                  sltu         a2, ra, t5
                  mul          tp, t1, s10
                  sltu         s5, s3, s5
                  andi         s5, s3, -1597
                  sra          s9, s6, s10
                  sra          a0, s4, s6
                  csrrsi       s3, 0x340, 0
                  c.addi       gp, 2
                  add          t5, t5, s6
                  csrrci       a6, 0x340, 0
                  c.and        a1, a4
                  csrrwi       sp, 0x340, 10
                  c.sub        a2, a1
                  sub          a0, sp, sp
                  csrrw        a7, 0x340, s5
                  xor          s11, s9, s8
                  csrrsi       s8, 0x340, 0
                  c.nop
                  auipc        a4, 937972
                  mul          t1, s8, t5
                  csrrci       t6, 0x340, 22
                  or           a7, t1, a1
                  mul          s6, t5, t1
                  csrrs        a2, 0x340, zero
                  c.srli       a1, 13
                  c.andi       a2, -1
                  auipc        s6, 937120
                  nop
                  div          s3, t2, s7
                  c.xor        a2, a4
                  c.srai       a2, 1
                  mulhsu       sp, sp, s2
                  csrrwi       a4, 0x340, 21
                  xori         s11, a3, -657
                  lui          a1, 542701
                  remu         t0, tp, s3
                  sll          t4, t2, t6
                  c.srai       s1, 24
                  divu         a2, s10, s6
                  or           a6, s6, zero
                  csrrsi       s4, 0x340, 26
                  c.xor        s1, a1
                  auipc        a4, 511602
                  slti         a0, t0, -80
                  csrrwi       s8, 0x340, 29
                  csrrc        a3, 0x340, a3
                  c.and        a3, s0
                  c.sub        a3, a1
                  mulhsu       sp, t2, a4
                  c.srai       a0, 25
                  srai         s5, s8, 6
                  c.andi       s0, -1
                  xori         s8, s8, 5
                  c.slli       s0, 14
                  c.srai       a2, 5
                  mulhsu       s4, s3, s8
                  slti         zero, s1, 1122
                  add          s2, s4, s8
                  auipc        a3, 287273
                  divu         s11, t4, a1
                  mul          a6, s8, a0
                  srai         tp, sp, 8
                  ori          s4, a7, -1473
                  sltiu        zero, a4, 934
                  c.xor        a0, s1
                  or           s0, zero, s1
                  remu         a4, a5, s2
                  c.addi       s11, -1
                  srai         s10, t2, 0
                  c.srli       a0, 25
                  andi         tp, a1, -1040
                  rem          t1, t0, a4
                  rem          a1, a6, a7
                  csrrci       s11, 0x340, 15
                  xor          s3, s2, a2
                  rem          s10, a6, t5
                  csrrsi       tp, 0x340, 0
                  c.slli       sp, 3
                  xor          a6, a7, s2
                  c.or         s0, a4
                  c.nop
                  csrrsi       a4, 0x340, 0
                  mulhsu       tp, s6, t1
                  lui          a0, 64575
                  csrrsi       gp, 0x340, 0
                  c.addi4spn   a2, sp, 576
                  mul          s4, s8, gp
                  mul          t1, zero, t6
                  csrrwi       a1, 0x340, 3
                  mul          gp, s5, s0
                  sub          s9, a6, a3
                  ori          s5, s11, 1881
                  c.srli       a4, 23
                  divu         sp, s1, t6
                  csrrci       s3, 0x340, 5
                  c.mv         s10, s6
                  mulhu        a3, t2, t4
                  and          s8, t6, s11
                  c.nop
                  nop
                  c.add        s9, t4
                  c.addi       s11, -1
                  c.addi       s11, 4
                  c.add        a0, a1
                  andi         s11, tp, 1861
                  c.or         a4, a3
                  c.slli       s3, 14
                  or           s0, a0, ra
                  auipc        s9, 52902
                  c.and        a0, a1
                  xor          sp, a7, t4
                  or           s5, s2, s8
                  slti         s2, t3, -1118
                  c.and        s0, s1
                  c.mv         s0, a7
                  sltu         a4, s4, s8
                  lui          t5, 622475
                  remu         a2, a4, s1
                  c.andi       a0, -1
                  c.and        a2, a3
                  nop
                  csrrs        t1, 0x340, a4
                  divu         s2, a6, t0
                  c.li         ra, -1
                  rem          a6, t0, a5
                  slti         a0, a0, -1665
                  and          t1, a5, sp
                  lui          a1, 688925
                  sltu         t1, t2, s6
                  c.srai       a1, 20
                  nop
                  srai         s0, s11, 22
                  add          s1, a6, a2
                  c.srai       a1, 10
                  c.srai       s1, 29
                  remu         s4, sp, a1
                  sra          s11, sp, gp
                  lui          t4, 312520
                  c.lui        s8, 20
                  slt          s9, tp, t4
                  csrrw        tp, 0x340, a6
                  nop
                  lui          sp, 308697
                  div          s10, s11, gp
                  csrrs        s3, 0x340, t0
                  remu         s4, a3, t4
                  mul          s3, s0, sp
                  xori         a2, s8, 291
                  lui          a1, 213140
                  csrrwi       s3, 0x340, 24
                  or           s8, ra, s5
                  sra          ra, s7, tp
                  lui          gp, 410451
                  csrrw        ra, 0x340, gp
                  c.andi       a1, 21
                  c.or         a2, a1
                  sra          s8, t4, a3
                  nop
                  xori         s10, a4, 315
                  c.addi4spn   a1, sp, 320
                  c.or         a4, a4
                  c.addi16sp   sp, -16
                  csrrc        zero, 0x340, zero
                  srai         a2, a7, 31
                  andi         t1, t6, -1972
                  srli         a1, a0, 19
                  srai         t5, ra, 8
                  c.andi       s1, -1
                  c.addi4spn   a4, sp, 688
                  csrrwi       s2, 0x340, 9
                  slli         a0, a7, 25
                  div          a6, a5, zero
                  slt          a3, s10, a5
                  div          a1, a4, s7
                  sub          ra, a3, s2
                  div          s7, s9, tp
                  auipc        a6, 649830
                  c.add        a7, t0
                  slli         a4, a3, 22
                  rem          s7, s8, a2
                  c.slli       s4, 10
                  c.xor        s0, a5
                  sra          sp, s3, a3
                  lui          t6, 383517
                  srl          s4, s3, s4
                  andi         s6, sp, 719
                  addi         t1, t3, -297
                  sll          s6, gp, s8
                  c.nop
                  csrrs        a7, 0x340, s2
                  csrrwi       a0, 0x340, 9
                  auipc        s3, 940019
                  c.and        a0, a4
                  ori          a1, s10, 1477
                  div          s6, a2, a2
                  c.addi       t5, 3
                  csrrw        t5, 0x340, a0
                  sub          t5, a7, a2
                  xori         a2, ra, 111
                  c.andi       s0, -1
                  andi         s2, zero, 850
                  auipc        s0, 104815
                  sltu         s4, a3, sp
                  c.srai       s1, 17
                  c.lui        s5, 28
                  auipc        t5, 801320
                  csrrw        zero, 0x340, tp
                  lui          a1, 971396
                  xori         a4, a3, 1024
                  slli         tp, s10, 24
                  xor          s0, a3, s2
                  sltu         t1, sp, s4
                  sll          a3, gp, s1
                  c.nop
                  c.add        a1, t0
                  csrrsi       t5, 0x340, 0
                  andi         a2, a0, 1528
                  ori          a7, a1, 1078
                  srli         a0, s2, 31
                  c.lui        s11, 22
                  c.addi       a4, -1
                  sltu         a4, s3, a6
                  c.add        s3, a4
                  c.srli       a0, 11
                  andi         s2, tp, -1400
                  c.and        s0, s0
                  c.lui        s4, 24
                  srai         tp, a6, 19
                  sub          ra, t6, t4
                  c.srai       a0, 13
                  slti         s4, t4, -939
                  sra          s5, a7, a0
                  auipc        sp, 512956
                  rem          s4, t6, s8
                  slti         t0, s11, -86
                  c.mv         s4, s5
                  csrrsi       a3, 0x340, 12
                  srl          s5, sp, zero
                  sra          gp, s8, a6
                  csrrwi       s1, 0x340, 13
                  slti         s7, a6, 1864
                  csrrc        a0, 0x340, zero
                  c.or         a3, a3
                  c.srli       a2, 4
                  c.and        a1, a4
                  or           s6, a2, s2
                  c.mv         a1, s8
                  slt          t4, s11, a6
                  or           tp, t4, a7
                  csrrsi       tp, 0x340, 31
                  csrrc        a3, 0x340, zero
                  div          gp, a4, a2
                  rem          t0, zero, s5
                  csrrc        tp, 0x340, zero
                  or           s4, a0, t3
                  c.li         gp, -1
                  srai         s0, s2, 15
                  slti         s6, s5, -1364
                  andi         s9, s7, 547
                  csrrc        s1, 0x340, zero
                  sltiu        t0, a4, -71
                  ori          a0, s11, 1713
                  csrrci       s7, 0x340, 0
                  srli         s5, a3, 21
                  c.srai       a1, 25
                  c.lui        s5, 17
                  csrrci       ra, 0x340, 0
                  c.nop
                  lui          s0, 171244
                  c.andi       a3, 3
                  c.srai       a2, 27
                  andi         a1, s1, 1165
                  c.srli       a3, 29
                  div          a3, a0, t5
                  slli         s5, t1, 2
                  sll          t0, a4, t6
                  andi         s9, s3, 1021
                  c.srli       s1, 25
                  divu         t5, s9, s8
                  csrrci       gp, 0x340, 0
                  addi         s2, a4, -890
                  and          s11, a0, t5
                  c.lui        a2, 28
                  add          t0, zero, a1
                  csrrci       t4, 0x340, 10
                  divu         a3, s8, a1
                  csrrwi       t0, 0x340, 18
                  csrrc        ra, 0x340, ra
                  srli         s4, s0, 23
                  divu         a6, a6, s7
                  remu         s5, t6, ra
                  nop
                  addi         s3, s11, -1257
                  rem          s11, gp, a3
                  xori         a3, s3, -1150
                  andi         sp, a1, 1459
                  c.mv         t1, t5
                  or           ra, a1, a6
                  csrrwi       t0, 0x340, 2
                  mul          s5, s2, t2
                  csrrs        s10, 0x340, s7
                  mul          t5, s9, a7
                  mulhu        s8, ra, a7
                  ori          sp, s11, -2044
                  sra          a3, a1, tp
                  remu         a2, s6, zero
                  c.add        a0, gp
                  divu         zero, t3, s7
                  c.li         a6, 4
                  srai         a7, zero, 20
                  sltiu        ra, tp, -402
                  c.addi16sp   sp, -16
                  xori         s4, a3, -1348
                  slti         a6, a2, -1062
                  mulh         s5, t2, gp
                  c.andi       s1, 1
                  c.nop
                  sll          t5, a7, a6
                  xor          sp, gp, a2
                  csrrs        s10, 0x340, zero
                  c.and        a2, a4
                  and          s1, gp, s2
                  c.mv         s10, s0
                  c.srai       a2, 14
                  csrrc        s10, 0x340, zero
                  mul          t5, s6, t4
                  add          a7, gp, t4
                  slt          s4, s5, t5
                  slli         a7, s3, 7
                  addi         tp, a4, -104
                  csrrwi       ra, 0x340, 28
                  div          s11, t2, a7
                  c.sub        s0, a5
                  srl          zero, t1, s8
                  csrrwi       s10, 0x340, 21
                  or           a7, a5, a5
                  c.srai       a4, 29
                  mulhu        a3, s7, a4
                  c.and        s1, a1
                  mul          s10, t4, s8
                  sra          a6, s3, s4
                  sltiu        s4, t6, -174
                  remu         a1, a0, s10
                  srai         s2, t5, 2
                  csrrwi       a2, 0x340, 15
                  slti         ra, s5, -880
                  xor          t4, gp, gp
                  rem          a4, t6, t0
                  csrrs        sp, 0x340, a3
                  c.andi       a1, -1
                  slti         s10, s5, -1537
                  c.xor        a0, a1
                  andi         s9, t5, -1586
                  add          s10, s8, a2
                  xori         zero, a6, -1135
                  lui          t0, 847107
                  c.slli       s5, 8
                  c.addi16sp   sp, 400
                  and          a7, t6, gp
                  mul          a3, t1, s3
                  csrrci       t5, 0x340, 0
                  csrrwi       t6, 0x340, 27
                  csrrc        a0, 0x340, zero
                  div          a4, a5, a5
                  csrrc        a1, 0x340, a1
                  remu         a4, a7, a6
                  csrrw        s9, 0x340, a0
                  slt          s11, a5, gp
                  csrrs        t1, 0x340, zero
                  mul          a4, t5, zero
                  c.add        a1, a0
                  or           s7, t0, t1
                  csrrw        t0, 0x340, s1
                  c.addi4spn   a0, sp, 864
                  srl          a7, a0, a7
                  csrrsi       tp, 0x340, 0
                  divu         s6, s6, zero
                  mulh         a7, s3, a1
                  mul          t4, ra, a7
                  c.srai       a1, 28
                  c.addi       t5, 30
                  addi         t5, s1, -901
                  addi         gp, s1, 1728
                  remu         s11, s8, a5
                  csrrs        a6, 0x340, s2
                  slli         zero, t2, 13
                  csrrs        s6, 0x340, zero
                  auipc        s11, 789068
                  c.slli       a2, 23
                  mulhsu       a2, s2, a3
                  lui          s1, 406544
                  slt          t1, gp, a5
                  c.add        s11, a1
                  and          t1, tp, a3
                  remu         a4, s3, gp
                  remu         s1, t6, a4
                  c.srai       a3, 4
                  csrrci       t5, 0x340, 0
                  csrrci       t1, 0x340, 12
                  c.addi16sp   sp, 400
                  sub          s1, zero, s7
                  xori         gp, a7, -1587
                  csrrs        gp, 0x340, zero
                  c.addi       sp, 23
                  auipc        s3, 59824
                  csrrw        s9, 0x340, t3
                  csrrw        t5, 0x340, a0
                  c.addi4spn   s0, sp, 432
                  addi         s8, s4, -2019
                  csrrc        tp, 0x340, zero
                  sltu         s3, s11, s2
                  sltu         s8, t0, s8
                  csrrsi       tp, 0x340, 0
                  c.sub        s1, a1
                  csrrsi       s2, 0x340, 0
                  srl          a3, s8, t2
                  mul          s0, s7, s10
                  remu         a6, s6, a3
                  div          s11, a7, t3
                  c.srai       a4, 12
                  slt          sp, t5, a5
                  slli         a3, a4, 12
                  c.or         s0, a3
                  c.srli       a2, 30
                  sltiu        a3, a3, -816
                  c.add        gp, a1
                  xor          a1, t0, ra
                  mulhu        a0, a7, s8
                  c.addi16sp   sp, -16
                  csrrci       s2, 0x340, 7
                  auipc        s4, 161975
                  slli         ra, s10, 29
                  csrrs        s1, 0x340, zero
                  slti         tp, s8, 1771
                  csrrwi       s4, 0x340, 9
                  c.andi       a0, -1
                  andi         a2, t6, -1222
                  c.nop
                  c.mv         t6, a2
                  mul          a6, s2, s7
                  csrrw        t6, 0x340, s6
                  divu         s5, tp, s11
                  srli         s11, a6, 3
                  c.srli       a2, 12
                  c.srai       a3, 4
                  c.slli       a6, 14
                  xori         s4, s1, -44
                  c.and        s0, s1
                  c.slli       s1, 30
                  sub          t5, sp, a7
                  auipc        gp, 927916
                  csrrci       s9, 0x340, 11
                  div          a2, a3, s0
                  remu         a4, t4, t2
                  csrrwi       s11, 0x340, 12
                  div          a3, t1, t4
                  xor          ra, a1, gp
                  rem          s1, s1, s6
                  c.lui        s1, 10
                  slt          t0, sp, ra
                  mulhu        s10, a4, a1
                  c.slli       t5, 7
                  mulhu        s1, zero, a3
                  c.add        gp, t1
                  xor          ra, gp, s9
                  lui          tp, 881966
                  sub          a6, s7, s10
                  c.sub        a3, a2
                  c.add        s2, s6
                  srai         s6, sp, 25
                  auipc        a3, 3694
                  srl          zero, t0, t1
                  mul          s6, t0, gp
                  csrrc        s3, 0x340, t1
                  c.andi       a2, 1
                  csrrci       sp, 0x340, 6
                  remu         s5, a6, t2
                  addi         t0, s3, -697
                  csrrs        tp, 0x340, zero
                  c.or         a2, a1
                  remu         t4, t4, a1
                  slli         zero, a7, 14
                  or           t1, t3, s5
                  andi         s10, t2, 1399
                  nop
                  sra          zero, ra, t2
                  c.li         s5, -1
                  xor          a6, a5, a3
                  slti         t6, t0, -1506
                  c.addi16sp   sp, -16
                  xor          s1, a4, a3
                  csrrs        a0, 0x340, zero
                  sra          s3, t2, s1
                  c.add        s3, a7
                  c.addi4spn   s0, sp, 640
                  c.addi4spn   a1, sp, 576
                  c.lui        t4, 17
                  or           zero, a3, a5
                  lui          s11, 82573
                  remu         t0, s4, t1
                  sltu         s9, a6, s11
                  andi         sp, a6, 1994
                  sub          a1, s6, a3
                  c.addi16sp   sp, 320
                  c.srli       s0, 21
                  c.or         a4, a3
                  remu         t6, tp, s4
                  add          s6, s7, s10
                  c.li         s5, -1
                  csrrci       a1, 0x340, 0
                  or           t0, a2, t6
                  lui          s5, 872989
                  srl          s5, tp, a3
                  srli         a6, s7, 4
                  slli         s5, a4, 7
                  ori          zero, sp, 1206
                  csrrw        gp, 0x340, zero
                  andi         tp, gp, 403
                  mulh         s11, t6, t6
                  c.sub        a1, a1
                  c.addi       s9, -1
                  remu         t5, gp, s2
                  slti         s7, t5, 643
                  slti         t5, a5, -312
                  sub          a3, zero, tp
                  slt          zero, t5, t0
                  xor          ra, t2, zero
                  csrrc        s6, 0x340, zero
                  c.srli       a2, 17
                  slti         tp, s2, -1591
                  c.nop
                  lui          t5, 146577
                  xori         t0, a0, -619
                  slt          s1, a0, ra
                  remu         sp, t2, t2
                  divu         s9, a6, s9
                  addi         t5, s3, 208
                  sra          s1, s4, sp
                  addi         s11, t2, 50
                  c.mv         tp, a4
                  csrrsi       s5, 0x340, 6
                  c.li         s5, -1
                  auipc        t5, 442177
                  mulh         s8, s9, ra
                  csrrwi       sp, 0x340, 11
                  mul          s0, gp, s0
                  c.addi4spn   a2, sp, 592
                  srai         a6, a7, 14
                  mulhu        ra, a0, s9
                  andi         sp, a3, -1888
                  c.addi4spn   a1, sp, 16
                  addi         s6, sp, 377
                  slli         a6, t6, 3
                  add          t1, tp, a6
                  or           a2, s5, a4
                  mulhu        a0, a5, s1
                  add          t1, s5, s6
                  srli         zero, s8, 5
                  sra          s0, s0, a5
                  mul          s6, t3, t2
                  c.nop
                  remu         s2, s6, t5
                  slt          tp, t2, t5
                  mulhsu       s9, gp, t5
                  csrrci       tp, 0x340, 4
                  csrrci       tp, 0x340, 14
                  xor          t5, s7, gp
                  or           t5, a1, s0
                  sra          a3, s6, s1
                  slt          a3, s2, s10
                  c.addi       a2, 8
                  lui          t5, 506695
                  c.srli       a2, 25
                  lui          s3, 796060
                  c.addi4spn   a1, sp, 32
                  c.addi       s11, 8
                  xor          sp, s7, s3
                  rem          s3, t0, s6
                  sltu         zero, ra, t0
                  sltu         ra, s11, zero
                  slti         s7, t6, 1121
                  c.add        s7, s2
                  c.and        s1, s0
                  csrrci       a0, 0x340, 24
                  sra          s1, tp, t2
                  csrrc        t5, 0x340, zero
                  remu         s8, gp, s3
                  divu         s10, t6, s4
                  slti         a0, t1, -1499
                  add          a2, s0, t3
                  mul          gp, a1, t1
                  c.slli       t6, 11
                  c.addi16sp   sp, 224
                  or           s7, a2, s3
                  slli         t0, s2, 20
                  lui          s6, 594351
                  remu         s4, a5, a7
                  mulhsu       a6, s4, t1
                  csrrwi       tp, 0x340, 20
                  nop
                  mulh         t5, s2, sp
                  sltu         a4, t0, ra
                  xori         sp, a2, 1959
                  c.srli       s0, 23
                  or           s7, s3, s9
                  ori          t4, t0, 1774
                  c.or         a2, a1
                  add          s3, a5, a4
                  sltiu        gp, a0, -963
                  addi         t0, a7, -596
                  sll          s5, t0, s0
                  remu         t0, t6, s3
                  divu         s10, s6, t0
                  c.slli       s2, 15
                  c.add        t5, s1
                  c.srai       s1, 16
                  srai         s3, t0, 2
                  c.srai       a2, 4
                  slti         s9, t0, -1159
                  sltu         a4, s9, tp
                  c.lui        a0, 27
                  add          a1, sp, t6
                  c.srli       s0, 12
                  c.li         sp, -1
                  c.li         s8, 9
                  andi         s6, gp, -1030
                  c.lui        s9, 28
                  c.slli       s9, 6
                  c.li         s2, 26
                  add          t1, t4, sp
                  c.srli       a4, 30
                  c.lui        s11, 23
                  addi         sp, zero, 1251
                  c.or         a3, a3
                  or           s2, s4, sp
                  lui          tp, 368392
                  c.lui        s3, 10
                  srli         sp, a3, 0
                  c.addi16sp   sp, -16
                  div          t5, t1, t2
                  csrrc        s11, 0x340, zero
                  div          s2, a1, ra
                  slli         t5, s3, 22
                  slli         s2, s8, 7
                  c.li         a7, -1
                  c.add        a3, s10
                  or           s8, s6, s5
                  srli         s8, a2, 13
                  csrrwi       sp, 0x340, 1
                  srli         a4, gp, 18
                  sltu         t5, a2, t6
                  mulh         s9, s11, s0
                  c.addi16sp   sp, -16
                  mul          s3, t6, t2
                  mulh         a7, a7, a3
                  divu         s7, zero, a3
                  c.add        s5, t4
                  csrrw        s2, 0x340, t4
                  or           t0, s4, t6
                  xori         s1, ra, 1257
                  c.nop
                  add          s9, sp, s4
                  andi         s3, a5, -1209
                  srl          s0, t6, a1
                  srl          t6, sp, a0
                  ori          ra, sp, 1306
                  csrrci       s0, 0x340, 26
                  and          t6, s3, t5
                  ori          s6, s11, 702
                  sltu         t0, a6, s5
                  slti         a4, t3, -1613
                  andi         gp, s1, -560
                  c.sub        a0, a5
                  csrrsi       s8, 0x340, 18
                  xori         s6, s3, -688
                  csrrwi       a1, 0x340, 6
                  c.sub        s1, a4
                  mulhu        sp, a0, s10
                  c.sub        s0, a0
                  mulhsu       zero, a7, a4
                  c.srli       a1, 31
                  csrrs        a7, 0x340, zero
                  c.xor        a2, a5
                  csrrc        a1, 0x340, zero
                  c.sub        s0, a2
                  srli         a6, a7, 27
                  mulhu        s0, a1, a6
                  c.add        s10, t6
                  xor          s2, a2, s6
                  c.srli       a3, 7
                  srai         zero, s7, 6
                  c.xor        a2, s0
                  sra          a6, s11, a7
                  c.addi4spn   s1, sp, 608
                  csrrc        sp, 0x340, zero
                  c.addi4spn   a2, sp, 560
                  auipc        t5, 576246
                  csrrs        s10, 0x340, zero
                  add          gp, s8, s9
                  mulhsu       a4, a6, s1
                  c.or         a3, s0
                  csrrwi       s8, 0x340, 16
                  c.sub        a0, a5
                  c.srai       a3, 8
                  xori         a6, s0, 668
                  c.slli       s3, 29
                  srai         a2, sp, 26
                  divu         a4, t2, s6
                  srli         s0, a7, 2
                  csrrci       s1, 0x340, 0
                  c.xor        a3, a3
                  csrrwi       s2, 0x340, 15
                  nop
                  c.andi       a2, -1
                  xor          s1, ra, s9
                  srl          t1, ra, a5
                  c.sub        a2, a1
                  c.or         a1, a5
                  nop
                  divu         a6, s10, s4
                  c.nop
                  c.or         s0, s0
                  addi         a0, s3, -1445
                  and          s2, s2, s6
                  c.and        a0, a3
                  c.addi       t6, 7
                  c.and        a1, a2
                  xori         sp, s6, 1924
                  c.slli       a2, 1
                  remu         t5, s10, gp
                  xori         t5, t1, -1357
                  c.xor        a0, a2
                  ori          s0, s0, 455
                  xor          a1, a6, a1
                  c.andi       s1, 5
                  c.lui        s1, 3
                  mul          s1, s1, a2
                  mulhu        s1, a3, s10
                  mul          s10, t1, zero
                  xori         s6, s8, -907
                  csrrci       s8, 0x340, 0
                  c.mv         s0, s7
                  c.addi16sp   sp, -16
                  sltiu        s8, a3, 1501
                  mulh         zero, a2, s2
                  divu         a3, s5, t2
                  add          tp, s2, a7
                  c.srai       a1, 17
                  srli         s0, s3, 17
                  nop
                  c.srli       a1, 23
                  nop
                  div          a0, s6, t6
                  slli         a2, zero, 8
                  srl          t0, s11, t1
                  slti         s11, s4, -326
                  mulhsu       a3, s2, t0
                  andi         s10, tp, -262
                  mulh         s6, a5, ra
                  c.xor        a0, s0
                  csrrc        t4, 0x340, zero
                  c.addi16sp   sp, -16
                  mulhu        a4, t0, sp
                  divu         tp, t3, tp
                  c.srai       a4, 18
                  mulh         ra, t4, t3
                  sltiu        s8, a5, 390
                  sra          sp, t3, a2
                  c.li         sp, -1
                  sra          s3, a7, zero
                  nop
                  csrrci       t5, 0x340, 0
                  lui          s4, 479022
                  lui          sp, 225674
                  auipc        s2, 1039950
                  and          s1, sp, a3
                  c.or         a3, a2
                  c.xor        a2, a4
                  slli         a1, sp, 26
                  csrrs        t5, 0x340, gp
                  c.or         a1, a5
                  xori         s0, s5, -1573
                  c.srli       a1, 21
                  c.srli       a1, 23
                  mul          s2, tp, a2
                  srli         s8, s5, 31
                  addi         t0, tp, -104
                  c.addi       s8, -1
                  ori          s4, s0, 1482
                  srl          a7, t4, gp
                  rem          s11, tp, s2
                  csrrci       t6, 0x340, 0
                  andi         s3, s8, -343
                  c.nop
                  c.and        s0, a4
                  c.sub        a1, a3
                  sltu         a4, a5, t6
                  slt          s6, a7, gp
                  c.srli       a1, 18
                  mulh         a2, ra, a2
                  sltu         a4, t6, t1
                  auipc        s7, 1038631
                  slti         s7, t0, -215
                  sll          a3, s7, a5
                  c.lui        a1, 28
                  srli         a0, t2, 17
                  slt          s2, s0, tp
                  slt          t5, t2, a7
                  remu         a0, tp, s8
                  nop
                  c.or         s0, a2
                  c.or         a2, a5
                  srl          ra, s3, zero
                  c.nop
                  xori         s10, s7, 1334
                  c.add        sp, s3
                  sub          s5, s0, ra
                  sltu         tp, s0, s10
                  csrrci       t6, 0x340, 11
                  ori          s4, s11, -911
                  c.addi       s2, 4
                  csrrc        a1, 0x340, zero
                  c.li         sp, -1
                  ori          s1, t2, 1234
                  c.slli       gp, 9
                  csrrci       s9, 0x340, 31
                  srl          s8, a6, sp
                  c.srli       a1, 5
                  xori         a2, s2, 1326
                  c.addi4spn   s1, sp, 784
                  rem          a6, t4, tp
                  csrrwi       s5, 0x340, 6
                  slt          t1, s5, a5
                  c.addi       s1, -1
                  xor          s8, s8, t6
                  c.addi4spn   a1, sp, 896
                  slti         s0, s6, 69
                  nop
                  c.sub        a4, a0
                  xori         s5, zero, 1044
                  lui          tp, 664917
                  c.lui        s5, 11
                  sll          a0, a0, t6
                  rem          t5, s0, s1
                  rem          a2, a6, s3
                  csrrwi       s3, 0x340, 18
                  c.addi       a3, -1
                  nop
                  div          t1, a0, a5
                  slt          s9, t2, s2
                  sra          s8, a3, s1
                  auipc        a4, 600365
                  sltiu        t4, a2, -1635
                  mul          s4, t5, a3
                  c.add        s4, a2
                  mulhsu       s4, s7, t1
                  c.andi       a3, 4
                  c.li         s5, 19
                  sltu         s11, s11, s5
                  csrrwi       t0, 0x340, 13
                  csrrci       a3, 0x340, 2
                  csrrw        a2, 0x340, s3
                  csrrs        t0, 0x340, zero
                  divu         ra, s9, zero
                  nop
                  c.or         a3, a1
                  c.and        a3, s0
                  sra          a1, s3, a6
                  c.xor        a1, s1
                  mulhsu       a6, s6, s10
                  xor          s11, s10, s6
                  c.and        s1, a0
                  xori         s10, sp, -86
                  c.mv         t1, a5
                  c.addi16sp   sp, -16
                  addi         s7, s5, -1185
                  sltiu        s2, a0, 1844
                  ori          a2, gp, -1096
                  slli         a0, s9, 26
                  c.slli       a0, 9
                  srli         s6, a6, 12
                  sltu         t6, a7, a3
                  srli         s1, s8, 30
                  mulhu        a0, t2, t1
                  mulhu        zero, zero, s4
                  csrrwi       t6, 0x340, 14
                  c.add        s0, s1
                  or           s10, sp, s0
                  c.srai       a4, 31
                  andi         ra, t5, 409
                  c.addi4spn   a4, sp, 368
                  xori         a1, t2, -107
                  c.li         s2, 30
                  add          t6, a7, a6
                  slli         s7, gp, 1
                  c.addi16sp   sp, -16
                  csrrsi       t6, 0x340, 0
                  c.mv         s3, a7
                  srli         zero, s1, 21
                  c.or         s0, a2
                  rem          sp, sp, s0
                  srai         a6, s11, 28
                  c.andi       s1, 3
                  xori         tp, s4, -1045
                  srl          s9, sp, s11
                  c.xor        s1, a3
                  c.srai       s0, 8
                  c.srli       a1, 10
                  c.addi       s3, -1
                  sll          t6, zero, a0
                  c.srli       s0, 13
                  nop
                  c.add        a7, gp
                  csrrwi       t1, 0x340, 22
                  and          t1, s8, s4
                  c.addi       s7, -1
                  and          ra, s11, s7
                  div          a6, t2, t1
                  c.addi4spn   a1, sp, 224
                  sra          sp, a2, s8
                  andi         s5, a4, 1693
                  c.slli       s10, 27
                  sub          t6, t0, a6
                  ori          s7, s9, -932
                  csrrwi       a4, 0x340, 19
                  mul          a6, a6, a7
                  c.srli       s0, 27
                  divu         sp, s10, s8
                  sltu         s3, a6, s10
                  slti         a1, a1, 807
                  c.and        s1, s0
                  sltiu        s1, a0, -789
                  xori         a7, s2, -278
                  xori         t4, a6, -1233
                  divu         s0, a2, t3
                  divu         ra, tp, t1
                  c.slli       s3, 19
                  slti         tp, s5, -199
                  srli         s5, s6, 14
                  sll          a2, t4, ra
                  csrrsi       t4, 0x340, 0
                  div          gp, t3, a1
                  csrrwi       s9, 0x340, 8
                  xori         t1, ra, -1628
                  c.sub        a1, a3
                  srai         s1, s11, 8
                  mulhu        s10, a2, a0
                  c.li         tp, -1
                  c.slli       s11, 14
                  c.lui        s2, 25
                  xori         s3, t3, 1919
                  c.slli       a3, 6
                  slt          sp, s3, s6
                  auipc        a3, 211045
                  csrrs        tp, 0x340, s6
                  csrrwi       s10, 0x340, 1
                  srai         s11, s6, 22
                  c.li         s4, 2
                  c.nop
                  slli         t1, a6, 14
                  c.addi4spn   a1, sp, 864
                  srli         a7, ra, 10
                  c.andi       a1, -1
                  xor          t4, s4, a3
                  srli         s8, s10, 16
                  divu         s8, tp, a2
                  lui          a2, 736877
                  c.andi       a1, 24
                  sltiu        s0, s3, 26
                  divu         s4, s5, s11
                  sll          s8, t4, s1
                  sltu         s5, s10, s4
                  c.add        s3, s8
                  mulh         a6, zero, a2
                  addi         ra, t6, 1303
                  csrrc        a2, 0x340, t0
                  srl          t5, s5, zero
                  xor          s1, a2, s0
                  csrrc        a4, 0x340, a4
                  addi         ra, s5, 452
                  nop
                  slti         s3, tp, 1665
                  sltu         s6, a6, sp
                  c.addi16sp   sp, 384
                  c.add        t0, t2
                  mulhu        t4, s11, a0
                  c.or         a3, a5
                  c.lui        t6, 16
                  c.srli       a3, 8
                  add          t1, s8, a5
                  slti         s0, s2, -17
                  c.or         a0, s1
                  remu         a4, s10, a4
                  c.addi16sp   sp, -16
                  remu         s11, s7, tp
                  slti         s11, s3, 799
                  lui          s10, 818192
                  sub          t4, s1, a1
                  divu         a3, s3, a3
                  c.srli       a1, 25
                  and          zero, t3, a7
                  lui          gp, 289247
                  c.slli       s2, 5
                  remu         s1, t6, s3
                  sltu         t0, s5, a5
                  c.addi4spn   a0, sp, 576
                  slli         ra, t2, 0
                  auipc        tp, 716721
                  sub          s5, a0, t0
                  slli         s11, s10, 22
                  addi         s10, a1, 1034
                  slti         a2, s3, 596
                  c.sub        a3, s1
                  slt          ra, s4, a3
                  srai         s11, s9, 17
                  c.or         a1, a0
                  c.sub        a4, a1
                  slli         s4, gp, 27
                  mulh         s0, s1, sp
                  c.addi4spn   s1, sp, 976
                  addi         s8, t6, -650
                  csrrsi       s11, 0x340, 0
                  c.xor        a2, s1
                  slli         tp, s6, 18
                  csrrsi       s8, 0x340, 0
                  csrrwi       s7, 0x340, 28
                  c.andi       a1, -1
                  addi         s4, s6, -828
                  csrrs        t5, 0x340, a3
                  mulh         a4, zero, ra
                  divu         s2, s10, a5
                  c.slli       s2, 13
                  and          a0, sp, s0
                  c.lui        s8, 1
                  slli         zero, a0, 19
                  sltu         t5, t6, a3
                  c.sub        s0, a4
                  mulhsu       t0, sp, t1
                  divu         t5, a1, s0
                  csrrsi       a7, 0x340, 27
                  csrrs        a2, 0x340, a5
                  div          t6, s10, a3
                  slt          s2, t4, a2
                  srl          s2, a5, t6
                  c.mv         a6, sp
                  c.or         s0, a0
                  nop
                  c.slli       s3, 20
                  srl          zero, a0, a5
                  sra          a3, gp, s10
                  slti         s2, a2, -1720
                  c.sub        a0, a1
                  xor          s9, a7, ra
                  c.addi4spn   a0, sp, 528
                  xori         a7, zero, 1187
                  xor          s3, a4, t5
                  add          s7, s0, s5
                  slt          a2, t3, tp
                  csrrci       s4, 0x340, 0
                  auipc        s8, 236417
                  sra          zero, a3, t2
                  c.and        a1, s1
                  rem          s2, a2, s10
                  csrrw        s11, 0x340, s8
                  addi         s9, zero, 205
                  addi         s6, s2, -1857
                  sll          s10, a7, s5
                  csrrc        a2, 0x340, zero
                  lui          a4, 980369
                  divu         a7, s10, a6
                  sub          sp, a0, s10
                  c.xor        a2, a3
                  c.addi4spn   s1, sp, 624
                  mulhsu       s8, s8, t3
                  sltu         t1, s1, a2
                  rem          t0, a7, a4
                  slli         s11, zero, 7
                  c.add        s10, t6
                  divu         tp, sp, s1
                  add          s9, s3, s1
                  csrrs        a4, 0x340, zero
                  add          s2, zero, a4
                  c.and        a4, a1
                  div          t5, ra, s9
                  c.addi16sp   sp, -16
                  sll          t5, s0, s11
                  c.and        s0, a0
                  sra          s6, s1, s11
                  sltu         a2, t5, s11
                  and          s11, s4, t3
                  c.sub        a4, a1
                  c.slli       sp, 23
                  srl          s2, zero, s9
                  csrrc        a7, 0x340, zero
                  csrrsi       a7, 0x340, 3
                  c.add        s11, t0
                  c.sub        a0, a5
                  xori         a4, a7, -324
                  nop
                  csrrsi       s8, 0x340, 0
                  mul          s3, t5, a7
                  mul          a1, s11, a1
                  csrrwi       a6, 0x340, 31
                  sltiu        s8, a1, 1556
                  slli         s6, s8, 29
                  div          s10, s2, t1
                  c.mv         s7, tp
                  c.srai       s0, 13
                  and          t6, s4, s8
                  c.addi       s5, -1
                  c.mv         s9, s3
                  c.sub        a0, a2
                  addi         zero, zero, 235
                  sltu         t5, s11, s7
                  sll          s2, s0, a5
                  srai         a2, s5, 9
                  csrrci       a7, 0x340, 0
                  sltu         a7, t3, s4
                  c.lui        s0, 10
                  c.mv         a0, a5
                  srli         s5, t1, 30
                  auipc        s5, 740853
                  mulhu        s4, ra, t5
                  csrrc        s6, 0x340, s4
                  c.andi       a1, -1
                  ori          zero, t3, 1800
                  csrrc        s3, 0x340, zero
                  c.addi4spn   a3, sp, 80
                  c.sub        a3, a1
                  auipc        t6, 783517
                  srl          t6, s0, s0
                  sub          s4, t4, a3
                  sra          t4, s10, s8
                  c.xor        a3, a3
                  auipc        ra, 526036
                  c.sub        a0, a3
                  or           s11, a6, a1
                  c.srli       a2, 7
                  sltu         t6, a5, s3
                  c.nop
                  c.slli       t5, 19
                  srai         zero, a3, 15
                  csrrs        a7, 0x340, tp
                  andi         s8, t5, 646
                  or           tp, tp, t4
                  csrrwi       a4, 0x340, 11
                  slt          s8, s1, s5
                  div          s6, a4, t3
                  c.srai       a3, 3
                  sra          a6, s10, t6
                  ori          a3, s6, 1454
                  xor          gp, t5, a2
                  csrrwi       t6, 0x340, 25
                  sltiu        s5, sp, -1095
                  csrrc        s4, 0x340, a3
                  and          t1, s4, t1
                  div          s1, s2, s8
                  sra          a2, a0, s0
                  slt          s6, t5, a4
                  c.srli       a4, 2
                  c.mv         a3, s5
                  csrrw        s2, 0x340, a7
                  srai         s5, s5, 27
                  xori         s3, s5, -332
                  sub          t6, ra, s7
                  sra          t6, a2, s9
                  c.or         a3, s0
                  c.mv         s4, s1
                  srl          s10, s5, t2
                  add          s6, s9, t2
                  c.sub        s0, a2
                  div          s5, a3, s6
                  c.or         s1, a4
                  c.xor        a3, a2
                  div          s3, s6, a0
                  ori          s0, zero, -573
                  srli         a1, t3, 17
                  c.add        s10, a7
                  xor          s11, tp, s4
                  c.li         s10, -1
                  srai         t4, t3, 7
                  srli         a7, s8, 21
                  lui          a4, 297013
                  csrrci       s6, 0x340, 21
                  auipc        s4, 898053
                  divu         a4, a2, s3
                  sra          s10, a3, a2
                  remu         s11, t6, a5
                  addi         zero, tp, -1599
                  c.addi16sp   sp, -16
                  add          s6, a2, a4
                  c.sub        a4, a2
                  csrrsi       s8, 0x340, 0
                  srai         s8, t0, 25
                  csrrci       t0, 0x340, 0
                  andi         s5, t6, -1475
                  ori          s1, s9, 1725
                  csrrsi       s1, 0x340, 0
                  c.slli       tp, 8
                  auipc        t1, 2957
                  addi         t0, a3, -817
                  sltiu        ra, t2, 162
                  or           a1, gp, s8
                  sra          zero, s0, s9
                  xori         t1, a7, 166
                  c.xor        a2, a5
                  csrrwi       zero, 0x340, 14
                  srl          s5, s8, a4
                  csrrs        s6, 0x340, t3
                  c.slli       a7, 10
                  c.slli       a0, 20
                  slt          tp, t0, s2
                  slt          t0, gp, s5
                  c.lui        s9, 17
                  rem          s11, s10, s8
                  rem          s6, s10, a2
                  andi         a2, gp, 1967
                  mulhu        a6, t3, t1
                  c.add        t1, a3
                  mul          a7, gp, s9
                  c.addi4spn   a4, sp, 704
                  xor          t1, zero, s8
                  xor          tp, s11, ra
                  slli         gp, zero, 14
                  sub          a0, a6, s5
                  csrrsi       tp, 0x340, 16
                  srli         a0, a6, 0
                  sltu         a0, s11, s5
                  sub          gp, a4, s5
                  sltiu        a3, s4, 1244
                  slt          t5, sp, a1
                  c.lui        a4, 6
                  srli         s10, t3, 23
                  c.sub        a1, a0
                  divu         s2, t6, s7
                  andi         tp, t3, 1483
                  lui          s11, 204715
                  csrrs        s0, 0x340, zero
                  c.andi       a3, -1
                  c.add        s10, t5
                  c.addi4spn   a3, sp, 800
                  c.or         a0, a3
                  remu         s1, t6, t1
                  c.sub        s0, s0
                  csrrci       a2, 0x340, 20
                  csrrci       a6, 0x340, 13
                  mulhu        a7, s9, a7
                  c.slli       t4, 13
                  srl          sp, s11, gp
                  csrrw        a6, 0x340, t2
                  c.addi16sp   sp, 96
                  c.xor        a3, a1
                  c.mv         t6, s11
                  addi         tp, a5, 1152
                  csrrw        a6, 0x340, ra
                  sltiu        s8, s10, -919
                  remu         a4, t0, gp
                  mulhsu       sp, s2, s8
                  c.addi16sp   sp, -16
                  c.li         ra, -1
                  slt          t4, gp, t1
                  c.sub        a0, a0
                  c.slli       s11, 2
                  c.srli       a3, 14
                  c.mv         s6, t4
                  sll          s4, s11, a2
                  lui          zero, 150619
                  sub          s10, a7, a7
                  csrrci       sp, 0x340, 6
                  csrrw        a3, 0x340, s11
                  mul          a0, s10, s5
                  divu         s8, a7, t5
                  sub          a4, tp, s5
                  c.addi4spn   s1, sp, 656
                  slti         a2, s8, 1133
                  c.add        a1, s6
                  c.add        t6, a3
                  c.or         s0, a2
                  c.srli       a0, 11
                  srl          sp, t6, t2
                  sltiu        ra, t3, -1509
                  srli         s1, a6, 7
                  ori          gp, s2, -1486
                  addi         s5, a2, -1139
                  c.slli       t0, 15
                  c.addi16sp   sp, -16
                  mulhsu       t0, s1, s1
                  csrrwi       t6, 0x340, 13
                  and          s1, s8, gp
                  sltu         s4, t3, s4
                  c.lui        s5, 12
                  c.li         s3, -1
                  c.addi       a3, 31
                  or           s0, a1, s6
                  xori         a3, a3, 1223
                  and          a4, s11, s7
                  csrrsi       s4, 0x340, 10
                  csrrc        s10, 0x340, t4
                  c.addi16sp   sp, -16
                  remu         s2, a4, s3
                  add          ra, s6, a5
                  c.srai       a1, 10
                  c.srli       a3, 13
                  sll          s1, a3, a0
                  andi         a2, t6, 366
                  div          s7, s7, a3
                  div          a1, zero, zero
                  slli         t5, a7, 11
                  mulhu        a6, t0, ra
                  divu         zero, gp, a6
                  csrrw        s11, 0x340, a0
                  csrrci       sp, 0x340, 0
                  sub          s5, a2, t4
                  or           s2, t5, zero
                  c.andi       s0, -1
                  and          t1, gp, t0
                  slli         s0, s10, 12
                  nop
                  sra          a2, s7, tp
                  sltu         tp, s1, tp
                  mulh         t0, s6, t4
                  c.and        a3, a2
                  div          sp, a1, s2
                  mulhu        a4, s0, s10
                  c.srai       s0, 24
                  c.add        a7, s11
                  srli         a4, ra, 0
                  c.slli       s3, 10
                  slt          s1, a2, s9
                  add          a4, s2, s3
                  srli         s4, s7, 7
                  auipc        t6, 659621
                  add          t6, s6, s11
                  srl          s5, t4, t6
                  csrrwi       tp, 0x340, 28
                  rem          s6, a4, s7
                  or           s6, t6, t6
                  sltu         s3, sp, s9
                  c.addi       s2, -1
                  c.slli       a4, 13
                  srai         a6, s2, 15
                  c.andi       s0, 21
                  c.nop
                  c.andi       a0, 27
                  sll          a7, s5, s2
                  xor          s7, t3, t4
                  sll          s1, a5, s1
                  srli         s5, s5, 13
                  srai         a2, t5, 12
                  divu         gp, a2, t5
                  srl          a2, ra, a2
                  c.andi       s0, 19
                  or           s6, t2, a0
                  csrrs        t6, 0x340, a3
                  c.lui        s6, 25
                  and          s7, s5, s11
                  andi         a2, s2, 1821
                  xori         s3, a3, 658
                  and          s7, a6, t0
                  andi         tp, t3, -71
                  c.add        s3, a6
                  div          t0, s6, a5
                  sub          t0, s5, a7
                  mulh         s7, a0, t0
                  sub          zero, a5, s2
                  add          s3, s1, a3
                  c.and        a3, a1
                  sltu         s9, s2, t1
                  c.andi       a1, -1
                  c.addi4spn   a2, sp, 944
                  mulhsu       gp, gp, s8
                  c.andi       a4, 20
                  or           zero, t6, t4
                  addi         a1, a1, -1373
                  c.srli       s0, 17
                  sub          s2, ra, sp
                  c.mv         tp, a4
                  sll          zero, s1, s10
                  c.srli       a4, 6
                  slti         a3, zero, 962
                  sub          gp, a2, a6
                  xori         a2, t2, -1791
                  csrrw        s0, 0x340, s7
                  div          s3, s6, ra
                  mul          s8, tp, s5
                  sltiu        ra, ra, -212
                  csrrwi       sp, 0x340, 17
                  and          a2, tp, a4
                  c.addi4spn   a2, sp, 896
                  andi         a6, gp, 74
                  c.addi4spn   a1, sp, 144
                  c.add        t0, t4
                  nop
                  and          sp, s2, zero
                  c.xor        a0, a0
                  c.or         s0, a3
                  c.mv         sp, a3
                  and          a3, a3, s6
                  c.slli       s4, 12
                  addi         t1, s1, 42
                  c.andi       a0, 22
                  lui          s10, 254820
                  c.lui        s11, 8
                  srli         s7, s7, 27
                  divu         t4, gp, s4
                  nop
                  csrrsi       a6, 0x340, 0
                  c.sub        a2, a5
                  c.srai       s0, 13
                  nop
                  slt          t6, s6, t3
                  mulh         ra, t6, s3
                  csrrs        zero, 0x340, zero
                  add          ra, s2, t0
                  auipc        t5, 992960
                  srli         s10, t1, 20
                  srai         s4, t5, 23
                  rem          t5, zero, s2
                  sub          a1, tp, a7
                  c.srai       s0, 15
                  c.and        s0, a1
                  c.lui        t4, 13
                  c.add        sp, s11
                  sll          gp, tp, t2
                  c.add        a3, sp
                  c.nop
                  xor          a6, s4, a0
                  csrrsi       t0, 0x340, 0
                  slt          a1, ra, sp
                  sltiu        a3, s4, 578
                  c.or         s1, s0
                  c.andi       a0, 26
                  c.sub        a2, a1
                  or           s5, t2, a6
                  c.addi       gp, 18
                  xori         tp, t3, -716
                  sltiu        s3, s9, 1182
                  c.andi       a0, -1
                  nop
                  c.or         a4, s0
                  c.slli       t1, 22
                  mulhsu       s4, s11, t1
                  sll          a6, sp, s1
                  ori          s7, zero, -776
                  c.or         a4, a2
                  and          a1, s3, zero
                  csrrc        s2, 0x340, a4
                  c.sub        s0, a2
                  csrrw        s10, 0x340, t2
                  sub          s10, t4, s9
                  xori         a6, a2, -1982
                  ori          s5, t1, -594
                  auipc        s0, 405085
                  c.srai       a0, 3
                  sra          s1, s11, s9
                  c.andi       a1, -1
                  sub          zero, zero, zero
                  c.addi16sp   sp, 32
                  srl          t1, s2, s1
                  mulh         s11, a0, s9
                  remu         s4, a5, s9
                  c.xor        a3, a0
                  slt          s8, ra, s2
                  ori          tp, s11, -1220
                  c.srai       a0, 11
                  div          tp, a1, a2
                  divu         s1, s6, s7
                  c.srai       s1, 11
                  remu         t1, a2, s3
                  c.add        a1, s3
                  c.mv         t4, a5
                  c.and        a4, s1
                  csrrsi       t5, 0x340, 0
                  csrrwi       ra, 0x340, 12
                  slti         s10, s3, 1818
                  c.slli       a3, 7
                  csrrci       s7, 0x340, 0
                  xori         s7, t4, -1048
                  ori          t4, s9, 370
                  mulh         a2, t3, s3
                  c.lui        a0, 12
                  c.slli       s10, 6
                  divu         s5, t2, s1
                  andi         s11, gp, 689
                  auipc        t0, 911067
                  mul          gp, a1, s1
                  mulhu        a2, a6, a1
                  c.lui        a1, 15
                  c.srai       a0, 24
                  or           t6, s5, s7
                  c.addi4spn   s0, sp, 448
                  xori         s11, gp, 1336
                  xori         s10, s11, 814
                  srl          a2, t5, s2
                  div          s11, sp, s3
                  mulhsu       gp, t3, s9
                  slli         gp, t0, 21
                  mulh         s8, zero, s5
                  nop
                  sltiu        s7, s0, 1408
                  c.addi4spn   a3, sp, 416
                  and          s6, a1, a3
                  rem          a3, tp, a2
                  ori          a2, t5, -473
                  addi         gp, t6, -1798
                  srai         s5, ra, 8
                  rem          s9, t6, t0
                  auipc        s8, 532178
                  and          t4, s4, t2
                  lui          t6, 759183
                  add          a3, sp, a6
                  remu         t5, t0, a7
                  sub          a4, s3, s7
                  or           gp, t3, s0
                  lui          tp, 9283
                  sltu         a6, t0, s1
                  srli         a1, s8, 27
                  sra          t5, gp, s10
                  sra          s7, s2, zero
                  c.li         tp, -1
                  sll          sp, a3, a3
                  c.srli       a1, 17
                  sltu         a3, s4, sp
                  srai         s1, s11, 20
                  csrrc        t0, 0x340, s7
                  c.and        s0, s0
                  c.srai       a3, 7
                  divu         a7, t0, s10
                  sll          s5, s5, s1
                  c.srli       s1, 19
                  csrrw        t5, 0x340, s3
                  rem          s3, sp, s8
                  divu         a4, a5, a3
                  c.lui        s3, 10
                  rem          s4, t4, zero
                  xori         t6, a7, -1663
                  c.srli       a4, 19
                  c.lui        t0, 30
                  slt          zero, s9, t3
                  csrrsi       a7, 0x340, 25
                  lui          a3, 941101
                  c.srai       a4, 11
                  mulh         s10, s7, s4
                  divu         s0, a6, s1
                  sra          s9, t2, zero
                  sra          a6, a3, s4
                  xor          s10, s1, a2
                  sll          s10, s0, s0
                  rem          tp, s6, t2
                  or           a7, s0, s1
                  c.addi4spn   s1, sp, 384
                  csrrw        a4, 0x340, s9
                  xori         gp, s2, 32
                  csrrw        a6, 0x340, s7
                  csrrci       t1, 0x340, 12
                  sltu         s8, t4, s4
                  sra          zero, t5, t4
                  sltu         s5, ra, a4
                  xor          s4, s3, a1
                  remu         a2, s11, s5
                  c.sub        a0, a2
                  auipc        s5, 980157
                  csrrs        t5, 0x340, t4
                  slt          t5, ra, s8
                  c.mv         s2, a3
                  c.addi4spn   a4, sp, 400
                  c.lui        t5, 24
                  sll          ra, a3, s9
                  mulh         t4, s8, a4
                  srli         t1, s2, 25
                  c.srai       a4, 24
                  ori          a3, s9, 60
                  rem          s10, a2, zero
                  andi         a1, a7, 648
                  or           s6, s1, a2
                  sltu         t6, gp, s1
                  nop
                  c.li         a1, -1
                  srl          s4, ra, a5
                  csrrci       s2, 0x340, 0
                  or           a4, a1, t0
                  mulhu        t4, t3, t3
                  xor          a3, s7, a2
                  c.xor        a1, s1
                  c.xor        a0, a3
                  sub          a2, ra, s0
                  auipc        s1, 844552
                  c.srai       a3, 4
                  mulhu        s11, t5, s1
                  sub          ra, a1, t5
                  srl          a2, a1, t0
                  c.mv         s0, a3
                  mulhsu       ra, t0, s1
                  rem          a6, a1, s8
                  c.or         a2, a2
                  c.srli       a0, 19
                  c.xor        s0, a5
                  c.srli       a3, 25
                  c.addi       a1, -1
                  c.li         s7, -1
                  c.slli       gp, 17
                  sltiu        t1, s2, 1739
                  c.addi16sp   sp, 464
                  csrrwi       a7, 0x340, 4
                  c.andi       a3, 12
                  c.srli       a3, 24
                  sltiu        t4, s1, -239
                  remu         s4, s9, s8
                  c.srai       s1, 10
                  xori         a3, t0, 1101
                  sltiu        tp, gp, -1321
                  csrrs        t5, 0x340, a3
                  slt          t5, s3, t3
                  csrrw        s6, 0x340, a5
                  srai         a4, s6, 1
                  srl          a0, a1, a5
                  csrrci       a0, 0x340, 27
                  sub          a6, t1, ra
                  c.srai       a4, 11
                  c.lui        t4, 31
                  slt          t1, s5, a5
                  xor          t0, a1, s2
                  div          t0, ra, a7
                  mulhu        s0, a5, t5
                  csrrw        s11, 0x340, s10
                  divu         tp, t4, t1
                  c.li         a3, 18
                  csrrs        s10, 0x340, s2
                  sltiu        s5, a7, -1462
                  csrrs        t1, 0x340, zero
                  c.add        a4, s1
                  c.or         a3, a1
                  c.nop
                  c.xor        a2, a3
                  csrrci       a0, 0x340, 0
                  c.xor        s1, s1
                  c.addi       a4, -1
                  sll          s6, a6, s5
                  ori          s10, gp, 1237
                  c.addi       a7, -1
                  div          t0, s8, t2
                  c.lui        a3, 30
                  div          tp, zero, s6
                  slt          t1, t2, s4
                  c.srli       a1, 20
                  c.sub        a2, a0
                  sltiu        ra, s7, -1366
                  lui          a1, 240094
                  c.addi       s4, 20
                  c.and        s1, a2
                  sltiu        s9, t5, -1917
                  sra          a7, t6, s5
                  c.srli       a2, 3
                  mulhsu       ra, a1, s6
                  c.srai       s1, 19
                  c.slli       t6, 31
                  c.slli       a6, 27
                  add          s1, s11, t6
                  sra          a1, sp, ra
                  mul          ra, s6, s9
                  sub          t4, t5, a6
                  srl          ra, a1, s7
                  mulhsu       t1, a6, s0
                  c.srli       a3, 27
                  div          a2, zero, t2
                  c.srai       a4, 14
                  addi         s5, t5, -1456
                  mulh         s11, a0, a6
                  slli         s2, a3, 0
                  mulhu        tp, zero, a0
                  rem          t1, gp, a1
                  rem          s6, s1, s3
                  srl          gp, s1, s1
                  divu         a7, sp, t2
                  ori          s11, s6, 349
                  slli         s11, t1, 0
                  c.addi16sp   sp, 128
                  rem          s1, t2, tp
                  sltu         a0, t5, a1
                  slli         a0, a0, 24
                  c.add        t0, s6
                  nop
                  srl          a3, s2, sp
                  c.nop
                  sub          sp, a3, t3
                  csrrwi       a1, 0x340, 28
                  c.and        s0, a5
                  sll          a1, s1, sp
                  c.or         a0, a4
                  c.slli       t6, 18
                  c.or         a4, a5
                  csrrc        a4, 0x340, s3
                  sll          s5, s7, a3
                  slli         s5, ra, 16
                  sra          s9, s6, a7
                  c.or         a0, s1
                  csrrw        a1, 0x340, s2
                  sub          a1, a3, t6
                  mulhsu       a1, t2, t0
                  srli         a1, t0, 26
                  ori          s5, t3, 1705
                  srai         t5, t2, 15
                  auipc        a3, 336384
                  c.and        a4, s1
                  sll          a1, s3, s6
                  c.mv         s7, s0
                  c.addi16sp   sp, -16
                  divu         s1, a2, a2
                  or           t6, t3, a5
                  c.add        s1, s2
                  c.mv         gp, a2
                  c.andi       a0, 17
                  and          t6, a5, a2
                  mulhu        t4, t4, s1
                  mulhsu       s10, a7, a3
                  srai         a0, s6, 18
                  srl          zero, t4, t5
                  c.slli       t6, 6
                  sltiu        ra, s1, -802
                  c.srai       a1, 16
                  srai         sp, a3, 5
                  c.addi       s5, -1
                  csrrs        s9, 0x340, zero
                  auipc        a3, 918965
                  c.xor        s0, a2
                  remu         a2, s2, s0
                  add          s0, t0, a4
                  mulh         a6, s8, a1
                  sltu         s3, t3, a2
                  and          s8, zero, s7
                  c.li         sp, -1
                  c.li         a6, -1
                  csrrc        a6, 0x340, zero
                  lui          a4, 99588
                  srli         tp, t6, 19
                  slli         s10, gp, 30
                  sub          t1, s6, s4
                  or           a7, s5, s8
                  sra          a3, s7, t0
                  slli         zero, t5, 0
                  rem          s10, t2, s9
                  srai         s8, t1, 2
                  c.addi4spn   a3, sp, 32
                  mulh         s4, s4, t1
                  sltiu        s8, s1, -1128
                  c.lui        a6, 5
                  c.and        a1, a4
                  xor          s4, a1, a4
                  nop
                  srli         s8, sp, 8
                  csrrwi       t6, 0x340, 27
                  c.nop
                  divu         a6, a4, a7
                  c.nop
                  csrrw        a6, 0x340, s1
                  or           t5, t3, gp
                  sltiu        a0, a6, -1997
                  sltiu        s5, ra, -921
                  slt          s6, s8, a7
                  c.slli       s9, 18
                  csrrwi       s3, 0x340, 24
                  csrrc        a1, 0x340, zero
                  c.add        s5, t1
                  xori         s4, t3, 1549
                  c.srai       a3, 6
                  slli         a6, a4, 26
                  c.and        a4, a2
                  mulhsu       s1, a1, s2
                  mulh         zero, zero, t2
                  c.xor        a0, a0
                  andi         a1, t4, 799
                  ori          s8, s9, 1282
                  add          s8, a3, s4
                  divu         s6, t0, t6
                  divu         a0, t5, ra
                  mulh         t5, sp, ra
                  c.lui        s7, 30
                  c.srli       a3, 9
                  c.xor        s0, a3
                  ori          t4, a6, 1300
                  addi         s11, s1, 1024
                  c.slli       s4, 6
                  csrrsi       s1, 0x340, 0
                  sub          s0, s1, s10
                  mulh         t5, sp, a7
                  or           t5, a0, ra
                  c.or         a1, a1
                  sltiu        s8, a3, 275
                  c.addi       s10, -1
                  sub          s7, t4, t6
                  c.mv         s7, ra
                  c.lui        s5, 2
                  c.slli       a1, 11
                  xor          t6, s7, s2
                  c.slli       gp, 31
                  c.xor        a2, a5
                  csrrci       a2, 0x340, 9
                  srai         tp, s9, 22
                  auipc        s3, 792316
                  c.srli       a3, 13
                  c.addi16sp   sp, -16
                  lui          s2, 305655
                  csrrw        a1, 0x340, t1
                  csrrsi       s11, 0x340, 0
                  or           s7, s1, tp
                  xori         s1, ra, 651
                  c.srai       a1, 22
                  srl          s11, s2, a6
                  sltu         a1, t6, a4
                  div          t6, a7, s7
                  c.li         s9, 30
                  c.add        s3, t0
                  lui          s0, 404857
                  slt          gp, s9, a5
                  csrrw        s2, 0x340, a4
                  addi         s7, t2, -315
                  c.addi       t6, -1
                  c.li         s11, 29
                  srl          s4, a6, t3
                  sll          gp, a4, t0
                  c.slli       a3, 10
                  xor          a0, zero, s7
                  c.addi16sp   sp, -16
                  c.addi16sp   sp, -16
                  add          s4, t6, s2
                  srli         t1, sp, 13
                  mul          s10, t3, t4
                  sltu         a4, a3, a3
                  xor          a0, s8, s11
                  mulh         a0, s8, a1
                  csrrsi       s11, 0x340, 30
                  c.add        s8, a0
                  sra          s3, s4, tp
                  mul          a4, t5, s8
                  auipc        s0, 811280
                  andi         gp, t4, -493
                  rem          s3, a6, s4
                  divu         s10, s2, t0
                  or           a4, t1, t2
                  srli         s0, t3, 23
                  c.addi4spn   a2, sp, 720
                  csrrc        a0, 0x340, s8
                  srai         s1, zero, 12
                  c.lui        a4, 5
                  sltu         gp, t0, t3
                  add          t0, s7, t0
                  nop
                  rem          s1, a1, a5
                  c.and        s0, s0
                  div          a4, t5, zero
                  c.slli       sp, 10
                  remu         a3, t0, s9
                  lui          s4, 618336
                  mulhu        s10, a6, s9
                  c.srli       a4, 29
                  xor          a0, t5, s8
                  csrrw        t0, 0x340, s7
                  lui          t0, 1001714
                  csrrc        s1, 0x340, zero
                  lui          a4, 91622
                  slti         a0, a3, -116
                  csrrci       t5, 0x340, 0
                  and          s6, a2, a7
                  srai         zero, s6, 4
                  csrrsi       s7, 0x340, 13
                  nop
                  csrrci       s4, 0x340, 0
                  sub          s8, s0, s9
                  rem          a4, s5, a6
                  csrrs        t1, 0x340, a3
                  c.addi16sp   sp, -16
                  c.andi       s0, 25
                  csrrci       a6, 0x340, 14
                  sra          ra, t6, a0
                  div          s9, a5, a0
                  c.mv         s0, t1
                  csrrs        t4, 0x340, s10
                  slti         a0, s7, 206
                  c.or         s1, a2
                  auipc        tp, 317004
                  add          a6, a4, s11
                  addi         s0, a1, -2026
                  and          s3, t4, s7
                  srli         t1, a2, 23
                  nop
                  slli         s11, a7, 20
                  srl          zero, s2, s3
                  slli         s10, a2, 19
                  or           a7, a7, s6
                  slti         zero, a4, -136
                  srl          s3, s6, a7
                  slt          a1, a2, a1
                  and          s1, s8, a5
                  remu         t5, t4, s7
                  c.addi4spn   a2, sp, 464
                  c.lui        s4, 9
                  mulhu        ra, t3, a5
                  sltu         gp, t4, t6
                  c.addi       s5, -1
                  c.or         a3, s1
                  auipc        s2, 580221
                  or           t1, t2, s0
                  csrrw        zero, 0x340, s0
                  csrrw        s9, 0x340, s6
                  c.andi       a1, 23
                  c.and        a1, a1
                  div          s4, sp, s9
                  c.xor        a1, a3
                  divu         s6, a3, t0
                  sll          t6, a4, s0
                  csrrsi       s5, 0x340, 0
                  sra          a4, a1, a6
                  srl          s0, t6, s7
                  sra          a0, s6, a0
                  c.nop
                  rem          t0, a6, s0
                  c.andi       a3, -1
                  srl          s2, t3, s4
                  sltiu        s4, a5, 856
                  and          s6, t1, s11
                  c.and        a0, a1
                  c.mv         t6, a0
                  c.addi4spn   a2, sp, 320
                  csrrwi       s5, 0x340, 26
                  slt          s2, s7, s0
                  divu         s1, s0, s2
                  andi         t1, s3, -1281
                  sra          t0, s5, s0
                  slti         s4, a0, -921
                  andi         s4, s5, -678
                  c.and        s0, s1
                  lui          s0, 956806
                  slt          s6, s1, ra
                  slti         s5, a3, 1016
                  auipc        a1, 844637
                  c.add        a1, t5
                  lui          t6, 520340
                  remu         s5, a4, sp
                  c.xor        a4, a2
                  csrrsi       a6, 0x340, 1
                  add          sp, a4, s1
                  lui          s6, 776044
                  slt          a4, sp, a2
                  csrrc        sp, 0x340, t4
                  c.or         s1, a5
                  c.addi16sp   sp, -16
                  c.addi4spn   s0, sp, 672
                  csrrsi       gp, 0x340, 5
                  mulhsu       a6, zero, s2
                  c.srli       s0, 12
                  remu         s9, a4, a1
                  div          zero, t0, s11
                  csrrw        t4, 0x340, s6
                  c.srai       a2, 15
                  divu         a1, ra, a0
                  srl          t6, t2, tp
                  divu         a1, s2, a0
                  nop
                  slli         s8, a6, 7
                  slti         t1, ra, 895
                  c.mv         ra, t2
                  lui          t1, 267103
                  sll          gp, s6, s4
                  c.lui        t6, 17
                  srli         s7, t3, 28
                  c.addi       a3, -1
                  c.srai       s1, 10
                  csrrs        s8, 0x340, s0
                  ori          t4, t2, 563
                  csrrw        s6, 0x340, sp
                  c.andi       a1, 2
                  sub          t6, s10, zero
                  csrrsi       s10, 0x340, 0
                  and          s5, t5, t0
                  addi         s0, s6, 1992
                  c.andi       s1, -1
                  or           s7, t3, s5
                  xor          t1, s1, t6
                  or           s0, a0, s4
                  andi         s8, a3, -1065
                  mulhu        s2, a1, t0
                  slti         t0, t2, 1144
                  add          s0, tp, a4
                  c.lui        s1, 1
                  c.lui        a3, 2
                  sra          a3, a2, a1
                  andi         s6, s0, 117
                  auipc        a1, 633378
                  add          a4, t5, s6
                  sub          a7, s7, s10
                  or           t5, a4, t4
                  c.nop
                  c.srli       s1, 9
                  csrrs        t5, 0x340, zero
                  mulh         a6, t4, a4
                  mulhu        a4, a4, t2
                  c.add        a0, t0
                  srai         a3, a5, 3
                  remu         ra, t5, s10
                  xori         tp, s0, 1001
                  c.mv         ra, ra
                  c.addi       s11, 26
                  c.andi       a3, 31
                  mulh         tp, sp, a2
                  c.addi16sp   sp, -16
                  rem          s3, s11, t5
                  xori         gp, sp, 1173
                  divu         s2, s6, t5
                  srli         s7, t2, 18
                  sra          s1, a7, tp
                  c.nop
                  mulhu        t5, a6, a5
                  or           tp, sp, sp
                  c.add        a3, s3
                  andi         a1, t1, -72
                  csrrc        a3, 0x340, zero
                  nop
                  c.srai       a3, 5
                  c.and        a4, s1
                  xori         s5, s10, -379
                  sra          a3, s9, a2
                  mulhu        s1, t1, s9
                  c.li         t6, -1
                  c.sub        s0, a0
                  or           a3, a5, gp
                  or           s10, a5, a6
                  sltu         a0, s10, t6
                  c.li         s3, -1
                  addi         sp, s6, -294
                  auipc        tp, 371055
                  c.or         a1, a2
                  andi         s3, a2, -764
                  csrrci       t0, 0x340, 24
                  c.sub        a4, s0
                  lui          t4, 1025745
                  c.add        s8, gp
                  c.nop
                  srai         a7, s7, 9
                  c.mv         a3, s7
                  csrrci       t1, 0x340, 0
                  c.srai       a4, 14
                  c.xor        s0, s0
                  ori          t0, s6, -885
                  csrrsi       t4, 0x340, 0
                  ori          gp, a3, 272
                  csrrc        s0, 0x340, zero
                  add          t5, zero, a3
                  csrrs        tp, 0x340, s8
                  c.addi       a2, -1
                  nop
                  sll          s3, s9, t0
                  c.sub        a0, a5
                  c.add        s10, a4
                  sltiu        tp, a5, 1132
                  c.addi       sp, -1
                  sll          zero, t5, t5
                  srai         a7, sp, 10
                  mulhsu       s8, t6, a1
                  mulh         t4, sp, sp
                  csrrw        t6, 0x340, t3
                  mul          s11, s6, t1
                  mulhsu       s1, s11, s3
                  and          a3, s6, a5
                  andi         ra, a2, -411
                  sra          tp, s5, s2
                  sll          s6, t2, t1
                  csrrsi       s9, 0x340, 21
                  c.srli       a1, 11
                  c.andi       a4, -1
                  and          a2, s3, s11
                  and          ra, t6, s7
                  c.srli       a3, 8
                  div          s11, a1, t3
                  remu         a4, a3, s7
                  csrrc        a6, 0x340, zero
                  srli         s3, a1, 18
                  c.lui        ra, 22
                  csrrsi       a1, 0x340, 0
                  sra          s9, t4, s5
                  c.and        a1, a5
                  xori         s9, a6, 703
                  csrrsi       t1, 0x340, 18
                  lui          s1, 52085
                  andi         t6, t5, -1686
                  c.nop
                  csrrw        s6, 0x340, t5
                  mulhu        a4, s8, t0
                  div          t6, t3, a3
                  add          t4, s3, a3
                  mulhsu       t5, s5, s3
                  add          a4, a4, s6
                  c.add        s1, t6
                  or           s2, s8, s2
                  c.nop
                  mulhu        a0, a5, s6
                  srl          a7, t6, t5
                  and          a3, s3, s1
                  lui          s8, 468967
                  c.addi16sp   sp, -16
                  addi         zero, s2, 124
                  xori         gp, gp, 1538
                  srli         gp, tp, 10
                  csrrsi       zero, 0x340, 4
                  c.mv         s4, a0
                  ori          s4, s6, 1326
                  sra          s0, a7, s10
                  c.addi16sp   sp, -16
                  ori          s6, a1, 1741
                  ori          t0, tp, 461
                  c.and        s0, a2
                  sra          s11, a0, zero
                  csrrs        zero, 0x340, zero
                  csrrwi       s8, 0x340, 27
                  csrrci       s4, 0x340, 29
                  c.add        s7, a3
                  sll          sp, s10, t0
                  c.li         tp, 19
                  c.addi       sp, 4
                  slt          ra, a3, s2
                  c.li         a6, -1
                  and          a3, t1, t6
                  auipc        a4, 999079
                  mulh         gp, a1, t4
                  xori         gp, s7, -1707
                  sub          a3, s4, tp
                  slli         a6, a6, 25
                  or           t4, t6, a4
                  c.add        s7, t5
                  addi         a7, s5, -646
                  c.add        s5, gp
                  xori         t5, t4, -1317
                  sltiu        tp, zero, 530
                  c.or         a1, a1
                  c.li         a1, -1
                  or           s2, t4, t0
                  slli         t0, t4, 17
                  csrrs        s6, 0x340, zero
                  slt          s5, sp, t1
                  srl          zero, s8, s11
                  xori         a2, a0, 1599
                  slli         ra, s6, 3
                  add          s11, s6, zero
                  csrrsi       t5, 0x340, 0
                  and          t4, s10, s1
                  and          a7, a1, t4
                  c.addi16sp   sp, -16
                  c.srai       a2, 4
                  c.mv         a4, tp
                  sra          s2, s11, a4
                  xor          zero, a3, t2
                  sll          s10, s5, t3
                  csrrci       s6, 0x340, 20
                  nop
                  mulhsu       tp, t6, t1
                  remu         s11, sp, t6
                  c.xor        a4, a5
                  addi         s9, s1, -581
                  sra          a4, s9, a5
                  c.addi       t5, 6
                  auipc        gp, 806097
                  addi         s3, s5, 617
                  c.addi4spn   a0, sp, 784
                  remu         t6, s7, a6
                  slt          t4, t0, a1
                  mulhu        t4, s5, t3
                  xori         ra, tp, -217
                  slti         s11, s11, -766
                  c.sub        s1, a3
                  csrrwi       t1, 0x340, 31
                  c.addi16sp   sp, -16
                  srai         s8, a0, 0
                  nop
                  c.sub        s1, a0
                  c.slli       s2, 23
                  xori         s8, s0, 1050
                  c.xor        a4, a4
                  c.li         t6, 0
                  c.add        ra, t2
                  divu         a2, a7, s7
                  csrrsi       a3, 0x340, 8
                  rem          s5, s0, s10
                  addi         zero, gp, -1199
                  csrrci       s11, 0x340, 15
                  csrrci       s1, 0x340, 19
                  addi         s9, s9, -372
                  lui          s1, 842966
                  sltu         a0, sp, a4
                  c.srli       s1, 15
                  div          s5, t1, t6
                  xori         tp, s2, -897
                  add          s5, t0, s3
                  csrrw        t1, 0x340, a6
                  srai         s10, a0, 14
                  csrrw        s5, 0x340, tp
                  c.mv         s6, a0
                  add          a1, s0, s2
                  add          t1, gp, zero
                  sltu         tp, s9, a2
                  add          a3, s7, a6
                  slli         a6, a2, 26
                  c.li         a4, -1
                  xori         ra, ra, 1390
                  rem          t0, s3, a2
                  c.sub        s0, a0
                  divu         a7, tp, a0
                  rem          s4, zero, t1
                  mulh         s8, s6, t5
                  csrrs        a0, 0x340, zero
                  csrrc        a0, 0x340, zero
                  srai         a6, zero, 3
                  csrrw        t1, 0x340, s4
                  andi         t4, s10, -808
                  srli         t4, a4, 16
                  c.or         s1, s1
                  sra          a4, s4, t0
                  lui          gp, 728907
                  c.srai       s0, 10
                  mul          s5, s1, t2
                  sra          s2, t3, gp
                  slli         a1, a5, 23
                  add          ra, s7, t4
                  mulhsu       tp, s9, a2
                  csrrw        t0, 0x340, s4
                  c.addi       s6, 30
                  rem          a7, s11, s5
                  c.andi       a2, 21
                  c.mv         s9, a1
                  c.andi       a1, -1
                  c.lui        s9, 22
                  csrrc        s11, 0x340, tp
                  c.xor        a2, a0
                  csrrsi       a7, 0x340, 6
                  slt          t1, a6, t5
                  c.mv         s2, t1
                  mulh         a0, tp, s6
                  c.add        a3, gp
                  slli         t1, a0, 25
                  lui          a3, 404466
                  divu         a1, s2, s9
                  c.addi16sp   sp, -16
                  andi         t6, gp, 2043
                  c.addi       ra, 19
                  srl          a1, a2, a5
                  srai         s5, s2, 13
                  xori         s8, t5, 1716
                  sra          tp, s10, a1
                  c.and        a2, a2
                  c.addi4spn   a2, sp, 320
                  c.add        a7, gp
                  mulh         s1, a6, s5
                  xori         a6, s4, -1224
                  div          s6, sp, s11
                  xor          t4, s8, a6
                  mulh         s5, a7, s8
                  sll          a3, t2, ra
                  andi         s3, s10, 1634
                  slti         a4, zero, -1056
                  c.lui        s11, 6
                  c.sub        a2, a3
                  sltu         tp, a6, a7
                  c.xor        s0, a3
                  c.srai       a0, 28
                  mulhsu       s7, t0, a1
                  addi         s5, s2, -288
                  c.srli       s1, 21
                  csrrc        t5, 0x340, s0
                  sltu         a7, sp, sp
                  c.mv         ra, ra
                  add          s11, s9, s7
                  csrrwi       s3, 0x340, 24
                  xori         a7, s7, -927
                  mulh         a6, s4, t1
                  lui          gp, 514281
                  c.xor        s0, a0
                  csrrc        a3, 0x340, zero
                  csrrc        t1, 0x340, zero
                  sub          s5, s11, tp
                  c.and        a3, a1
                  c.xor        a0, a2
                  c.or         s1, s1
                  andi         s7, a4, -1557
                  and          t4, s10, t1
                  divu         t6, a0, s0
                  c.srli       a1, 14
                  addi         tp, s7, 1302
                  c.andi       s0, -1
                  c.or         s1, a0
                  nop
                  add          t6, t2, tp
                  andi         a6, a3, -1844
                  or           a2, s10, s2
                  csrrw        s11, 0x340, s0
                  c.srai       a4, 30
                  mulhsu       t6, s5, s8
                  xori         a6, a5, -937
                  xor          s3, s5, gp
                  and          s0, s8, t4
                  mulhu        zero, s2, s1
                  srl          zero, gp, s3
                  div          s2, s8, s8
                  xor          s11, t3, s2
                  c.sub        s1, s1
                  sra          a3, s8, s10
                  c.and        s0, a0
                  auipc        s3, 319902
                  rem          a4, t1, s1
                  c.or         s1, s1
                  csrrc        sp, 0x340, zero
                  div          s5, s9, t6
                  xori         tp, ra, 661
                  mulh         t6, s1, s3
                  c.slli       s6, 5
                  c.nop
                  c.or         a1, a2
                  c.andi       a4, -1
                  divu         s7, s11, a2
                  ori          sp, a5, -613
                  add          ra, s10, s11
                  and          a2, s4, t6
                  c.xor        s0, a5
                  csrrc        t6, 0x340, zero
                  c.and        a0, a2
                  sra          a4, s3, t6
                  c.add        t5, t6
                  csrrc        a0, 0x340, zero
                  xori         s6, zero, 1295
                  c.and        a0, s1
                  ori          s8, s7, 2029
                  srl          a4, a6, t0
                  c.lui        s2, 17
                  slti         a3, t4, -1728
                  csrrs        s11, 0x340, zero
                  sltu         a4, t3, a7
                  xor          gp, s8, a7
                  xori         a7, a2, 745
                  slti         s11, sp, -1147
                  c.add        a7, s4
                  mul          t0, s6, s5
                  c.srli       s0, 2
                  c.srli       s0, 30
                  csrrs        gp, 0x340, zero
                  sub          zero, gp, tp
                  c.xor        a4, a0
                  csrrw        s2, 0x340, s6
                  ori          t5, s11, 1825
                  mul          s7, a6, a4
                  c.addi16sp   sp, 32
                  csrrw        sp, 0x340, s3
                  csrrs        s5, 0x340, tp
                  c.lui        s5, 15
                  mulh         a2, t2, s4
                  slt          s2, ra, sp
                  sltiu        t5, s2, 714
                  c.and        a4, a5
                  ori          ra, zero, 878
                  divu         s8, t1, s2
                  c.addi4spn   a1, sp, 624
                  divu         s8, s3, s10
                  sra          a2, t5, ra
                  rem          s10, a6, s1
                  slti         s3, s1, 1050
                  c.sub        a0, s1
                  slt          s3, t4, a0
                  and          a6, s1, sp
                  c.sub        a4, a0
                  sltiu        a3, s7, 2016
                  lui          sp, 239460
                  div          a4, t4, s4
                  andi         a7, s5, 944
                  slt          s2, a6, s6
                  c.li         a4, 23
                  c.srai       a1, 6
                  div          zero, t0, a7
                  slt          s1, t4, s3
                  xori         s11, a1, -654
                  ori          gp, t3, 593
                  srl          s10, s2, t6
                  slli         s5, t6, 16
                  ori          sp, s3, 1016
                  c.sub        a2, a4
                  c.srli       a2, 31
                  xor          s5, t0, t3
                  c.and        s1, a5
                  sltu         s5, s8, gp
                  c.add        t4, s2
                  c.nop
                  slt          t4, s8, a2
                  c.add        t6, t3
                  c.srai       a2, 29
                  c.addi       a6, 9
                  lui          ra, 638208
                  csrrsi       s0, 0x340, 11
                  sub          s4, a6, ra
                  c.srai       s0, 10
                  c.lui        t4, 31
                  srl          s11, s9, s9
                  mulhsu       a6, ra, a2
                  c.andi       a1, 29
                  srl          a3, a0, sp
                  c.slli       s7, 24
                  c.slli       t6, 15
                  c.addi16sp   sp, 48
                  srai         t6, t3, 27
                  c.li         s2, -1
                  or           s4, a6, t2
                  rem          gp, s10, s0
                  sltu         tp, s3, t0
                  srai         a0, t2, 17
                  srai         s4, zero, 16
                  slli         a4, a4, 7
                  lui          s7, 976327
                  mul          s11, s3, sp
                  c.or         s0, a2
                  c.add        s3, t5
                  div          s1, s10, ra
                  slli         s3, ra, 19
                  sra          t5, a1, a5
                  sll          s5, a2, t4
                  sltu         s1, a2, s4
                  c.xor        a3, a1
                  c.addi16sp   sp, -16
                  c.xor        s0, a2
                  sll          t0, a6, s8
                  rem          a0, s3, t6
                  andi         s7, t3, 408
                  c.li         s7, -1
                  c.mv         s3, s10
                  c.xor        a1, a0
                  csrrc        a7, 0x340, zero
                  csrrwi       a4, 0x340, 7
                  div          s3, t4, ra
                  srl          a7, s5, s8
                  srl          gp, s10, a2
                  sub          ra, a4, a6
                  c.xor        s1, s0
                  slti         s11, t2, 481
                  auipc        sp, 654926
                  or           s1, s6, s6
                  c.or         a3, a1
                  addi         a1, zero, 280
                  sltiu        s8, a1, 13
                  c.sub        s0, a4
                  mulhu        t5, s8, s3
                  mul          gp, t4, a6
                  divu         a7, s11, s7
                  and          s5, s3, s3
                  c.mv         a2, s0
                  xori         t4, gp, 1897
                  sra          s10, a6, a6
                  remu         s6, s2, a0
                  c.sub        s1, a0
                  add          s7, tp, s5
                  c.andi       a4, 12
                  c.or         s0, s1
                  slti         a3, sp, -302
                  c.xor        a1, a1
                  c.srai       a0, 7
                  xori         s8, t1, 1070
                  c.slli       a0, 1
                  addi         a2, s9, -1450
                  slt          a6, t5, t2
                  divu         t6, s11, t4
                  addi         s11, t6, 1961
                  c.and        a2, a4
                  xor          s6, t4, t4
                  slti         s6, tp, 999
                  and          ra, a2, t1
                  c.srai       a0, 14
                  andi         t1, t1, -268
                  nop
                  csrrwi       s3, 0x340, 2
                  srai         s6, s10, 6
                  xori         s9, tp, -424
                  csrrwi       s5, 0x340, 13
                  srai         zero, s7, 30
                  and          a2, a7, t3
                  c.srai       a4, 15
                  c.srai       a4, 3
                  c.andi       a2, -1
                  andi         s5, a6, -353
                  slli         s1, t3, 25
                  c.srai       s0, 28
                  c.andi       s1, -1
                  ori          a2, tp, -2009
                  remu         s10, t1, s3
                  sub          tp, t2, s6
                  c.srli       s0, 3
                  srli         s1, tp, 31
                  sll          a4, tp, t3
                  rem          tp, t3, a2
                  c.addi4spn   s1, sp, 848
                  div          s0, ra, zero
                  or           s6, s7, gp
                  rem          tp, t1, sp
                  mulhu        a7, gp, s0
                  sltiu        s2, t4, 88
                  c.nop
                  c.addi       s1, 5
                  div          a1, sp, t3
                  sltiu        sp, s3, 1179
                  mulh         s7, a7, a0
                  xor          sp, s3, a4
                  and          s5, a1, t2
                  c.addi       s6, -1
                  c.slli       sp, 29
                  ori          a1, sp, -331
                  add          a6, t5, a2
                  sub          tp, t3, t4
                  sll          a1, s7, t3
                  csrrw        a0, 0x340, s0
                  csrrc        gp, 0x340, zero
                  c.addi       a7, -1
                  sll          s4, a5, gp
                  c.lui        a7, 5
                  add          s5, a2, s11
                  c.lui        s5, 5
                  c.slli       t4, 22
                  c.sub        a0, a3
                  csrrw        a2, 0x340, a6
                  xor          s0, s7, t1
                  sll          t5, t3, s0
                  srli         a1, zero, 20
                  add          a7, a2, s5
                  srai         gp, s8, 19
                  sub          a3, t6, a7
                  c.mv         t0, s9
                  c.lui        s2, 28
                  c.andi       a1, 0
                  csrrwi       a6, 0x340, 12
                  divu         s7, s4, a7
                  lui          s2, 1043276
                  srli         s7, s11, 15
                  csrrs        a2, 0x340, zero
                  sll          t1, gp, gp
                  c.srai       a3, 12
                  c.sub        a0, a0
                  srai         sp, s9, 6
                  mulh         zero, s4, s1
                  lui          a1, 656366
                  c.addi       a3, -1
                  div          a0, s11, t4
                  csrrwi       s7, 0x340, 15
                  csrrsi       s0, 0x340, 0
                  c.add        s4, tp
                  srli         a1, t0, 25
                  c.srai       s0, 14
                  c.lui        a4, 12
                  xor          zero, a6, ra
                  c.andi       a4, -1
                  c.nop
                  addi         tp, s8, 1331
                  divu         s7, t0, t4
                  sll          t1, s8, s9
                  srai         a1, tp, 5
                  remu         gp, s7, t4
                  lui          t5, 885380
                  srai         s8, s4, 14
                  c.slli       a7, 22
                  addi         t1, s6, -1437
                  slt          s9, s11, s10
                  or           s5, a0, t6
                  c.nop
                  slli         s7, zero, 8
                  c.srai       a3, 2
                  c.li         s1, -1
                  sltu         t0, a2, gp
                  c.srai       a4, 15
                  csrrc        a3, 0x340, zero
                  nop
                  xori         a3, a4, -854
                  mulh         a6, zero, s10
                  c.srai       a2, 5
                  c.xor        s1, a3
                  c.srli       a1, 2
                  sra          a6, t2, a4
                  xor          ra, t3, s7
                  c.mv         s4, t4
                  csrrsi       a4, 0x340, 0
                  c.addi16sp   sp, 448
                  slti         a3, s4, -1996
                  andi         gp, s2, -434
                  slti         a6, a5, 283
                  c.srai       a3, 24
                  div          s7, s3, s5
                  rem          t4, s3, s7
                  srl          s4, s0, a7
                  c.slli       ra, 14
                  mulhu        a3, s8, a0
                  slti         s3, ra, -1556
                  auipc        gp, 119843
                  csrrci       s3, 0x340, 21
                  lui          s11, 195303
                  c.srai       a3, 11
                  ori          s10, sp, -989
                  rem          tp, s1, a4
                  slti         s2, a4, -1389
                  sra          zero, a1, s8
                  c.andi       a0, 17
                  c.add        a2, t4
                  c.sub        s1, a2
                  slt          s8, s9, t6
                  mulh         sp, s8, a1
                  srli         s4, a1, 7
                  mul          tp, s5, s6
                  csrrs        s0, 0x340, zero
                  mulhu        t0, a2, tp
                  csrrci       a1, 0x340, 0
                  slt          gp, t1, a7
                  and          t1, a0, t1
                  c.add        s0, a3
                  c.or         a3, a0
                  slli         ra, t2, 16
                  mul          s11, t6, s9
                  rem          a1, s11, a7
                  csrrw        tp, 0x340, s2
                  nop
                  and          a3, t0, s0
                  mul          s2, s8, t0
                  c.add        s10, a6
                  c.and        a0, a4
                  srl          tp, s7, s11
                  xor          s9, t2, s10
                  xor          a4, a7, s2
                  srli         a0, t3, 8
                  mulhsu       s10, t1, s9
                  mul          s0, a0, s5
                  slt          s6, gp, t2
                  sra          s11, t5, sp
                  slt          a0, a0, s10
                  csrrsi       s0, 0x340, 6
                  mulh         s0, s1, t6
                  c.addi4spn   s0, sp, 784
                  c.li         a0, 11
                  c.li         t6, 28
                  sltu         s0, s3, zero
                  c.and        a4, a2
                  c.sub        a1, a2
                  srl          gp, a5, tp
                  lui          a6, 735543
                  nop
                  sra          a1, sp, t4
                  c.addi16sp   sp, 240
                  csrrc        s4, 0x340, t3
                  sra          zero, s0, s7
                  c.sub        s1, s0
                  srli         s6, s10, 18
                  csrrci       t4, 0x340, 0
                  csrrc        t4, 0x340, t6
                  c.or         a3, s1
                  c.srai       a4, 20
                  c.xor        s0, a4
                  div          t5, s11, s5
                  div          s8, t0, s6
                  c.srli       a4, 17
                  srl          t6, a2, s4
                  mul          gp, t5, gp
                  auipc        s4, 519719
                  srl          a2, t5, gp
                  remu         t6, s7, a4
                  c.slli       s5, 20
                  c.lui        t4, 20
                  c.add        t5, t5
                  xori         s1, s8, 956
                  c.addi16sp   sp, 496
                  mul          s6, a2, a3
                  c.addi4spn   s0, sp, 432
                  c.lui        t6, 1
                  sll          ra, a1, s0
                  csrrc        a7, 0x340, ra
                  csrrci       s5, 0x340, 9
                  c.lui        s1, 3
                  csrrsi       s5, 0x340, 17
                  c.addi4spn   s0, sp, 752
                  c.lui        s6, 28
                  nop
                  csrrs        t1, 0x340, s8
                  xori         t5, a3, 620
                  sub          s4, zero, a1
                  xor          s9, sp, s4
                  csrrw        s10, 0x340, s5
                  div          t1, t5, s11
                  sub          s1, gp, s10
                  c.sub        s1, a0
                  slli         sp, s4, 9
                  mulh         ra, s2, a7
                  c.addi4spn   a1, sp, 192
                  c.add        s7, s8
                  remu         s3, s7, t3
                  ori          sp, a5, 438
                  c.and        s0, a2
                  div          a3, s0, a3
                  sra          zero, s7, s0
                  c.andi       a1, 11
                  slti         a7, s2, 189
                  csrrw        a6, 0x340, s1
                  csrrc        s6, 0x340, zero
                  slti         s4, zero, 377
                  c.slli       s1, 24
                  or           t6, s3, t1
                  sll          s8, zero, a7
                  c.srli       s0, 1
                  c.lui        s7, 23
                  c.and        a3, a2
                  sra          s3, a0, t3
                  sltiu        s5, s4, -1288
                  srli         sp, a4, 4
                  srai         s10, s7, 1
                  csrrci       a6, 0x340, 0
                  c.mv         t6, s2
                  xori         tp, t0, 1976
                  div          t1, a6, s8
                  c.andi       a2, -1
                  c.lui        s8, 4
                  div          s0, gp, zero
                  csrrci       s0, 0x340, 24
                  c.srai       a4, 8
                  c.li         s1, -1
                  csrrc        gp, 0x340, zero
                  sll          s0, s7, t2
                  c.nop
                  xor          a6, a2, a4
                  c.srai       s0, 9
                  c.lui        ra, 21
                  slli         s10, tp, 19
                  auipc        s1, 1004632
                  c.addi16sp   sp, 208
                  and          a4, a5, s6
                  lui          s6, 419772
                  xori         s1, t1, 1892
                  srai         zero, sp, 6
                  auipc        t1, 397205
                  divu         a7, zero, t0
                  csrrwi       a2, 0x340, 13
                  csrrci       s3, 0x340, 5
                  mul          s1, a1, a0
                  mulhu        a7, s0, a0
                  c.lui        s6, 18
                  auipc        s7, 713020
                  csrrs        gp, 0x340, zero
                  csrrsi       t6, 0x340, 1
                  srl          s2, tp, s11
                  nop
                  or           sp, t1, sp
                  csrrwi       a0, 0x340, 20
                  or           s8, t0, a2
                  xor          t5, zero, s7
                  sub          a2, s8, ra
                  c.xor        s0, s1
                  c.or         a3, s1
                  c.add        t0, ra
                  rem          s10, s0, s7
                  c.andi       s1, 17
                  slti         s7, t4, -26
                  srl          a1, s1, a7
                  csrrwi       sp, 0x340, 29
                  csrrwi       t1, 0x340, 27
                  slti         a6, zero, 265
                  c.srli       s0, 9
                  c.srai       a4, 30
                  sltiu        a1, s8, 2035
                  c.mv         a0, a0
                  ori          s9, ra, 622
                  csrrwi       ra, 0x340, 5
                  csrrci       a0, 0x340, 0
                  slti         s9, a3, 299
                  mul          s4, a1, a6
                  mul          s4, s5, s11
                  add          a3, s4, s4
                  add          a4, s10, s1
                  lui          t0, 380812
                  c.and        s1, a4
                  or           s9, t4, s8
                  srai         ra, a6, 23
                  auipc        s10, 697523
                  add          ra, a3, a5
                  mulhu        t5, a3, s11
                  mulh         a2, s8, a6
                  c.addi       s10, 20
                  add          s4, s8, s9
                  csrrc        s5, 0x340, a1
                  c.or         a4, a0
                  auipc        s4, 806735
                  c.nop
                  sltu         s2, a3, s7
                  csrrw        a4, 0x340, t5
                  c.addi       t1, 11
                  andi         t6, sp, 1830
                  srli         t5, a4, 29
                  csrrs        gp, 0x340, s6
                  c.srli       a2, 31
                  c.and        a1, s0
                  csrrw        gp, 0x340, s0
                  ori          gp, sp, 1191
                  mulhu        s8, a4, gp
                  auipc        s11, 291655
                  c.and        s1, a2
                  xori         s10, s9, -218
                  divu         ra, s4, a1
                  sra          t6, t5, t5
                  auipc        s4, 780064
                  c.mv         ra, s7
                  c.xor        a4, s0
                  c.lui        a0, 13
                  c.and        a2, a0
                  csrrw        tp, 0x340, s3
                  csrrci       gp, 0x340, 31
                  c.addi       s9, 28
                  auipc        a6, 258116
                  lui          zero, 700102
                  mulh         a7, zero, a5
                  add          a6, t0, gp
                  mulh         ra, s10, zero
                  rem          zero, gp, s8
                  c.addi       s0, 20
                  and          a6, s10, a7
                  c.xor        a1, a3
                  auipc        a6, 957395
                  srl          s11, t5, s0
                  c.mv         s8, s5
                  c.xor        a3, a1
                  divu         a7, zero, a2
                  c.srai       a0, 24
                  divu         s1, a1, s4
                  c.xor        a3, s0
                  sra          s8, a4, s7
                  slti         s10, t5, 1292
                  csrrwi       s10, 0x340, 17
                  sub          s10, s6, s5
                  lui          a6, 172360
                  csrrc        zero, 0x340, a6
                  xor          a2, s3, zero
                  mulh         s11, a4, a7
                  c.xor        s0, a2
                  sra          gp, t3, t3
                  slt          tp, a3, s5
                  remu         t4, s0, s10
                  slt          a3, t5, t3
                  c.and        s0, a1
                  c.nop
                  mulhu        a3, t5, s1
                  csrrwi       s6, 0x340, 25
                  sub          s7, ra, a2
                  and          sp, sp, gp
                  addi         a6, s7, -1190
                  srai         a1, s3, 18
                  auipc        s7, 995042
                  csrrci       a0, 0x340, 27
                  sltu         s2, a7, t2
                  auipc        a6, 287547
                  c.srai       a1, 12
                  c.or         s0, a0
                  mulhu        zero, t1, a3
                  c.or         s1, s0
                  srai         a2, tp, 5
                  mulhu        s8, gp, t5
                  c.mv         a0, tp
                  c.or         a0, a1
                  add          a6, a1, s1
                  csrrc        tp, 0x340, zero
                  sltu         s3, s8, sp
                  c.slli       s2, 15
                  csrrwi       s5, 0x340, 15
                  csrrc        a4, 0x340, ra
                  or           t1, tp, s9
                  csrrs        t6, 0x340, zero
                  rem          t0, zero, t1
                  c.sub        a3, a1
                  slt          tp, a0, t1
                  srli         s4, s3, 7
                  ori          t0, a4, -147
                  c.addi       s10, -1
                  nop
                  slt          t5, s7, s2
                  rem          a0, ra, s9
                  nop
                  mulhu        s4, s6, s11
                  srli         t5, s11, 1
                  xor          t5, t6, s2
                  or           s3, s3, tp
                  sltu         s10, a4, tp
                  mulhsu       s0, s11, a2
                  add          t0, t4, s0
                  c.and        a2, a3
                  xori         t5, t4, 1324
                  srai         s10, s6, 26
                  sra          t1, s10, ra
                  c.andi       a2, -1
                  c.mv         tp, s7
                  c.srli       s0, 31
                  auipc        s6, 190901
                  or           t0, s1, a7
                  csrrs        s3, 0x340, zero
                  addi         s5, t3, 170
                  rem          zero, s0, s6
                  c.lui        gp, 19
                  sub          gp, s7, s1
                  csrrw        ra, 0x340, s10
                  c.mv         a0, a6
                  xori         ra, tp, -802
                  sra          s9, a4, t4
                  c.li         sp, -1
                  srli         s3, s2, 9
                  srl          s5, s6, t6
                  csrrsi       s6, 0x340, 31
                  rem          s6, t1, s3
                  srl          gp, ra, zero
                  slti         t4, a7, -1881
                  csrrs        a3, 0x340, s9
                  sll          s8, zero, a7
                  c.slli       t4, 27
                  csrrs        s1, 0x340, a5
                  csrrwi       s7, 0x340, 8
                  xor          s9, t4, s5
                  remu         s9, s7, t2
                  ori          s8, s4, 1929
                  c.add        sp, ra
                  c.mv         t5, tp
                  ori          s5, a5, -648
                  c.andi       a4, 30
                  sub          s2, ra, s10
                  c.slli       s9, 7
                  andi         t5, s8, 1036
                  c.slli       s4, 6
                  sra          s2, s2, t5
                  mulhsu       s7, t5, a0
                  xor          s11, a7, s7
                  divu         a6, s8, a5
                  c.srai       a0, 14
                  c.addi16sp   sp, -16
                  andi         s9, sp, -560
                  c.nop
                  mulh         t5, a5, s11
                  c.slli       a7, 2
                  c.mv         s5, t3
                  c.srli       a3, 26
                  c.slli       tp, 3
                  remu         t5, t1, a4
                  c.add        s3, t2
                  c.andi       s1, 24
                  mulh         a0, t2, ra
                  c.addi       s6, -1
                  mulhu        a4, t0, a1
                  csrrci       s6, 0x340, 0
                  mulhu        a7, sp, s2
                  c.nop
                  mulhsu       s10, t4, s2
                  c.nop
                  c.addi       t1, -1
                  c.andi       s0, -1
                  sltu         s8, a7, s3
                  or           s5, a4, zero
                  remu         s8, s7, t2
                  c.sub        a2, a4
                  slli         s10, t4, 16
                  remu         s2, a6, a6
                  lui          s10, 156703
                  c.sub        s1, s0
                  c.addi4spn   s1, sp, 128
                  c.sub        a1, a3
                  andi         s0, a0, -1208
                  andi         s9, t0, -396
                  addi         s5, t6, -71
                  divu         t1, tp, s2
                  addi         s0, s10, -124
                  c.mv         s9, s10
                  mul          tp, a4, a5
                  lui          a0, 916340
                  c.srai       a0, 17
                  csrrw        s10, 0x340, s3
                  xor          sp, t0, t5
                  c.mv         s1, s8
                  mulhsu       a3, a5, sp
                  divu         s0, s6, t2
                  sltiu        t0, s3, 930
                  addi         ra, t0, -1459
                  mulhu        s0, s5, a0
                  c.nop
                  c.lui        s7, 28
                  lui          s7, 124278
                  c.addi16sp   sp, -16
                  csrrw        a0, 0x340, t6
                  and          tp, t4, a4
                  div          a3, s6, s5
                  sra          t1, s8, s0
                  c.srli       s0, 14
                  srli         t6, t4, 6
                  c.and        a2, a3
                  srai         s2, a2, 24
                  c.xor        s1, a3
                  sra          a4, s4, s9
                  csrrwi       tp, 0x340, 6
                  c.and        a0, a0
                  xori         s0, a4, 806
                  sltu         a0, t2, a5
                  div          t1, t2, s0
                  c.addi16sp   sp, 192
                  c.andi       s1, 21
                  c.add        t5, t5
                  c.lui        t4, 10
                  c.slli       a3, 2
                  c.srai       a4, 12
                  slli         t6, s11, 10
                  slli         s6, a4, 24
                  lui          a3, 633965
                  ori          s4, a0, -128
                  srl          s5, t2, t2
                  div          s8, s8, zero
                  mulhu        t0, s5, s3
                  c.li         t0, -1
                  remu         s9, zero, s0
                  c.sub        s0, a3
                  add          s4, s6, s1
                  andi         s5, t0, 70
                  divu         s6, gp, a2
                  c.or         a0, a1
                  slli         s6, t2, 23
                  srl          zero, s9, a2
                  slti         a1, a4, -392
                  lui          s3, 748851
                  c.srli       a0, 19
                  csrrw        a4, 0x340, s0
                  mulhsu       s0, s2, s11
                  remu         t4, a0, t3
                  slli         s5, t0, 25
                  divu         a7, s9, s7
                  lui          gp, 798423
                  csrrc        t0, 0x340, s1
                  slt          s7, s11, t6
                  or           a2, a5, s4
                  c.srli       a4, 13
                  xor          a3, s2, a3
                  mul          s7, s8, t1
                  xori         a2, s5, -760
                  nop
                  mulh         ra, sp, ra
                  divu         a1, s9, a4
                  add          a0, a6, s10
                  srai         s11, a2, 7
                  c.nop
                  c.srli       a1, 27
                  xor          a1, t2, ra
                  c.add        t0, a2
                  xori         s1, s1, 1150
                  c.lui        tp, 22
                  c.andi       s1, 24
                  sll          s1, a0, s9
                  rem          s5, a3, ra
                  c.andi       a1, 1
                  c.sub        s1, a2
                  csrrwi       s3, 0x340, 4
                  div          s3, tp, s3
                  andi         ra, t3, 722
                  c.nop
                  c.or         a3, s1
                  sra          t5, a0, s5
                  mulhsu       sp, tp, a2
                  mulh         s5, a1, s9
                  slli         s4, s7, 8
                  slli         s0, a7, 26
                  csrrc        s8, 0x340, a7
                  c.nop
                  addi         t1, sp, -1308
                  slt          s9, a0, a7
                  auipc        t6, 965935
                  srli         t4, a1, 13
                  sra          s6, s0, a2
                  sltiu        zero, s9, 1051
                  srli         zero, s3, 7
                  sub          a3, t2, a3
                  slt          s5, s0, s9
                  xor          s8, s5, s6
                  c.mv         s8, a3
                  csrrci       t4, 0x340, 7
                  slti         a3, a4, -2044
                  xor          a4, s10, s10
                  mulhsu       s0, tp, t0
                  c.mv         a1, a7
                  c.addi       a7, -1
                  remu         t4, s4, zero
                  or           s11, t3, s11
                  c.and        s0, a1
                  mulh         a1, a4, s2
                  mulhu        s5, a4, s6
                  xor          s5, gp, sp
                  mulhsu       s3, a5, a2
                  xor          gp, sp, a7
                  mulhsu       s7, t6, s4
                  c.and        a2, a4
                  c.li         t6, 19
                  c.add        a0, a5
                  or           a2, s11, a2
                  csrrci       t1, 0x340, 0
                  csrrs        sp, 0x340, zero
                  c.andi       s1, 4
                  c.addi       ra, 6
                  slti         t4, t6, -808
                  c.addi       s0, 15
                  addi         s1, s2, 416
                  srai         zero, ra, 21
                  c.addi16sp   sp, 256
                  sltiu        a7, s11, -1124
                  c.addi16sp   sp, 48
                  slli         zero, zero, 5
                  csrrs        t1, 0x340, t0
                  csrrsi       s11, 0x340, 0
                  csrrc        s4, 0x340, zero
                  auipc        a4, 237030
                  div          a2, s0, a5
                  c.addi4spn   s1, sp, 304
                  slt          a1, t5, s7
                  c.sub        a3, s1
                  csrrwi       ra, 0x340, 2
                  c.slli       t1, 18
                  sltu         a3, t0, t1
                  srai         tp, s11, 19
                  divu         s9, t4, tp
                  slt          s3, a1, a2
                  srai         t6, a5, 9
                  c.sub        a4, s1
                  xor          s11, a6, t2
                  mulhsu       s6, a1, t6
                  c.li         s1, -1
                  c.nop
                  or           s8, t1, s11
                  slt          a6, gp, s10
                  csrrc        s1, 0x340, s2
                  divu         ra, s8, a5
                  and          t5, s9, zero
                  csrrc        s11, 0x340, zero
                  nop
                  rem          s11, t3, t6
                  divu         s11, tp, s7
                  c.addi16sp   sp, 448
                  mul          tp, ra, s5
                  c.li         s8, -1
                  mulhu        s3, a1, a4
                  c.xor        a2, a5
                  c.li         gp, 21
                  addi         a3, t5, -2
                  csrrci       s1, 0x340, 21
                  sltu         a2, a5, s8
                  mulh         s9, s4, s3
                  mul          t0, sp, gp
                  mulhu        gp, tp, a2
                  c.addi       gp, 31
                  srai         s11, sp, 29
                  addi         s4, gp, 1046
                  lui          t4, 446547
                  srli         s0, a5, 28
                  slti         a3, t4, -1254
                  srl          a0, a6, a2
                  csrrw        t4, 0x340, s7
                  mul          t0, t2, t6
                  c.addi4spn   a1, sp, 528
                  c.addi4spn   a1, sp, 848
                  mulhsu       a2, a1, a2
                  divu         a2, t5, ra
                  c.mv         a0, gp
                  xori         t6, s8, 744
                  lui          s11, 825139
                  sltiu        s3, a4, 1277
                  c.lui        gp, 7
                  mulhsu       t5, a3, s9
                  nop
                  c.mv         s11, a3
                  srli         zero, tp, 4
                  c.sub        s1, a1
                  csrrsi       s11, 0x340, 4
                  divu         a0, t3, s8
                  mul          a3, t3, zero
                  slti         t0, a7, 1296
                  c.or         a3, a3
                  c.xor        s0, a5
                  or           s5, t2, t6
                  mulhu        s4, a2, t3
                  c.li         s1, -1
                  div          t5, tp, s7
                  andi         s7, s8, 281
                  c.addi4spn   a4, sp, 192
                  c.addi       s4, -1
                  csrrw        s10, 0x340, s0
                  c.li         t0, 1
                  c.nop
                  rem          s3, s11, s2
                  ori          s0, t6, -8
                  xori         a6, t2, -1425
                  c.addi4spn   s0, sp, 48
                  slt          ra, s11, t2
                  c.addi16sp   sp, -16
                  csrrs        a6, 0x340, zero
                  c.li         ra, 23
                  sltu         a1, gp, s7
                  c.xor        s1, a0
                  c.nop
                  sra          gp, s10, s8
                  c.sub        a1, s1
                  c.or         a2, a5
                  csrrsi       s0, 0x340, 11
                  srl          a2, t4, s10
                  c.srai       a4, 14
                  srai         tp, s6, 0
                  srli         a3, a2, 19
                  csrrsi       ra, 0x340, 0
                  mulh         a1, zero, tp
                  csrrs        t4, 0x340, zero
                  c.mv         a6, s2
                  c.mv         s10, s5
                  c.lui        s4, 13
                  c.li         t6, 15
                  csrrs        s11, 0x340, a5
                  c.andi       a0, -1
                  c.slli       gp, 12
                  c.lui        s0, 22
                  c.and        a3, a1
                  mulh         s1, s5, a5
                  c.xor        s1, a5
                  c.slli       t0, 25
                  rem          a3, a0, t2
                  mul          t5, gp, s8
                  sra          s11, s0, a2
                  srli         a7, a5, 15
                  c.mv         s7, s8
                  slt          s6, tp, t5
                  div          s2, s11, t6
                  mul          s10, s7, ra
                  add          s8, s0, s10
                  c.addi4spn   a2, sp, 1008
                  csrrc        s8, 0x340, a2
                  c.or         a0, a1
                  xor          t1, s0, a7
                  c.or         a2, a0
                  sra          s6, t1, s11
                  rem          a0, s5, a5
                  c.sub        s0, s0
                  c.srai       s0, 31
                  mulhu        s10, a2, a5
                  c.andi       a4, 23
                  csrrc        sp, 0x340, zero
                  c.li         t4, -1
                  c.lui        s5, 2
                  csrrs        s0, 0x340, t6
                  csrrsi       a6, 0x340, 28
                  c.mv         ra, s3
                  c.nop
                  c.srli       a0, 31
                  slli         a1, ra, 21
                  c.nop
                  c.sub        a0, a1
                  csrrsi       t5, 0x340, 0
                  mulhu        s0, s0, s1
                  ori          a1, s7, -755
                  srai         s3, s2, 15
                  divu         t4, s1, a1
                  c.nop
                  c.sub        a0, s1
                  mul          s3, a3, s5
                  c.lui        s7, 24
                  c.lui        a3, 8
                  csrrs        s7, 0x340, zero
                  addi         t0, a7, 1553
                  srli         a4, zero, 24
                  sra          s3, t4, a3
                  csrrsi       a0, 0x340, 1
                  c.nop
                  srai         s7, t4, 11
                  c.and        a4, s0
                  sub          a3, a7, a6
                  c.or         a4, a4
                  c.or         a3, s1
                  csrrsi       s11, 0x340, 2
                  divu         s3, t2, t0
                  c.li         a7, 26
                  c.slli       s11, 14
                  add          t6, tp, a0
                  mul          s7, s10, sp
                  csrrsi       t5, 0x340, 31
                  andi         tp, a5, -640
                  or           s5, sp, ra
                  or           s8, a5, a1
                  xor          t1, s6, s11
                  srli         t6, a0, 28
                  csrrwi       a0, 0x340, 19
                  c.lui        t5, 2
                  lui          a4, 922718
                  c.add        a6, a1
                  csrrc        t5, 0x340, t3
                  divu         a7, a6, a6
                  csrrci       t0, 0x340, 0
                  slli         s11, zero, 17
                  add          s11, t3, a5
                  ori          a4, a4, 1013
                  c.xor        a0, a5
                  c.or         s1, a3
                  and          t0, t2, t2
                  c.nop
                  srai         s5, zero, 23
                  slt          s8, t6, s9
                  csrrsi       s9, 0x340, 30
                  c.or         a3, a4
                  c.srai       a2, 14
                  slti         a7, a3, -1055
                  c.addi16sp   sp, -16
                  c.nop
                  csrrc        gp, 0x340, t5
                  c.or         s0, s0
                  c.srai       s1, 6
                  csrrw        s1, 0x340, s6
                  slli         s10, tp, 30
                  rem          s10, gp, s6
                  sra          a0, a3, s0
                  srli         s5, a0, 5
                  mulhsu       s9, tp, t0
                  lui          t1, 295186
                  csrrsi       s11, 0x340, 0
                  xor          s7, a7, t6
                  sltiu        a7, a7, 842
                  c.or         s0, a5
                  c.xor        a4, a2
                  c.srai       a1, 12
                  srai         t0, ra, 13
                  mulh         t6, a6, a0
                  c.addi4spn   s1, sp, 736
                  c.srli       a0, 7
                  c.lui        s8, 6
                  csrrs        s0, 0x340, t3
                  c.slli       sp, 28
                  addi         s4, s7, -716
                  srl          a1, t0, t5
                  csrrc        zero, 0x340, t2
                  csrrci       a2, 0x340, 2
                  sltu         s9, sp, zero
                  sub          s9, s1, a5
                  c.or         s0, a0
                  or           tp, t6, a1
                  mul          s4, t2, a6
                  c.add        a4, s9
                  and          tp, a4, a0
                  c.nop
                  c.mv         a3, a5
                  srli         s5, zero, 9
                  csrrwi       s3, 0x340, 21
                  sra          t4, s3, a3
                  auipc        a7, 350724
                  slti         s2, tp, 1321
                  csrrsi       t1, 0x340, 0
                  srl          s0, t5, tp
                  rem          s1, t2, a1
                  sra          t4, a2, a5
                  csrrs        s2, 0x340, a4
                  addi         t1, a6, -1423
                  xori         s11, s2, -762
                  add          t5, s3, t1
                  slt          a4, sp, a6
                  srl          s11, t0, gp
                  csrrw        a0, 0x340, a1
                  c.li         s0, 7
                  slt          s5, t4, sp
                  csrrwi       t4, 0x340, 18
                  csrrw        tp, 0x340, tp
                  add          a2, s5, zero
                  and          s0, zero, a5
                  slt          s10, a2, gp
                  add          gp, a0, t6
                  mulhsu       a0, a6, s6
                  slt          s6, s10, t5
                  div          s8, s11, s6
                  andi         a6, s4, -1534
                  slti         s0, t4, 1527
                  mulhu        s2, s11, a3
                  sub          s2, a3, s10
                  mulhu        s3, a7, s6
                  mulhsu       a1, t2, s8
                  remu         s5, t2, a4
                  remu         a6, s5, a1
                  c.li         sp, -1
                  c.or         a2, a3
                  mulhsu       a7, ra, zero
                  c.lui        s10, 5
                  c.addi16sp   sp, -16
                  xori         s8, tp, -819
                  c.sub        a2, a1
                  divu         s10, s6, s0
                  slti         a4, t3, 484
                  c.xor        s1, a2
                  rem          a4, s11, a1
                  auipc        t0, 565725
                  c.srai       a0, 30
                  c.lui        a0, 16
                  ori          t4, s8, -570
                  slt          a2, tp, s3
                  c.mv         a0, a3
                  srli         a7, s2, 29
                  srl          t6, s8, t3
                  mul          s6, gp, t3
                  sltu         t5, t3, s6
                  csrrsi       a7, 0x340, 0
                  c.xor        s0, a2
                  ori          t6, a6, -952
                  mulhu        s10, gp, t2
                  csrrw        a1, 0x340, s2
                  auipc        s11, 376571
                  lui          tp, 635594
                  or           t4, t6, ra
                  c.slli       tp, 30
                  slt          t4, zero, tp
                  slti         s5, sp, 1433
                  sltiu        s10, ra, 1139
                  addi         ra, tp, -1467
                  c.or         a3, a3
                  csrrci       s9, 0x340, 0
                  add          ra, t6, a0
                  c.addi16sp   sp, 336
                  c.mv         sp, s7
                  c.srli       a1, 9
                  c.addi16sp   sp, -16
                  c.slli       a6, 22
                  auipc        a2, 982343
                  c.nop
                  sltiu        a7, t0, -207
                  c.nop
                  slt          sp, s9, a3
                  csrrw        a7, 0x340, a4
                  srli         s7, s2, 25
                  add          s6, s9, t6
                  and          s3, s8, s7
                  ori          t5, t2, -2043
                  slli         s3, s2, 9
                  c.srli       a4, 9
                  and          s4, zero, a0
                  divu         s7, s7, s8
                  div          s4, s6, s4
                  csrrsi       s3, 0x340, 0
                  mulhsu       t0, t5, s11
                  sll          t4, s6, s3
                  div          s7, sp, a4
                  nop
                  divu         t1, tp, s2
                  c.sub        s1, s0
                  c.add        tp, t0
                  c.add        a0, a4
                  and          s4, s9, s4
                  c.li         s11, 25
                  mulhu        a1, s7, a4
                  lui          t4, 127863
                  sra          s4, a0, s2
                  div          a2, s11, t6
                  xori         s2, a0, -504
                  c.slli       t4, 4
                  c.srai       s0, 10
                  c.add        a1, ra
                  xor          s0, s0, a5
                  rem          t1, s3, t5
                  xori         t0, sp, -1719
                  csrrs        s7, 0x340, zero
                  csrrw        s4, 0x340, s1
                  or           s11, a6, s3
                  c.andi       a0, 3
                  xori         zero, t5, -1482
                  add          s1, a7, t3
                  div          a4, a7, t2
                  csrrwi       a1, 0x340, 17
                  csrrsi       a6, 0x340, 0
                  mul          sp, tp, s7
                  srl          a3, zero, ra
                  addi         t5, t5, -1582
                  auipc        a7, 646336
                  c.addi4spn   a3, sp, 224
                  remu         s9, gp, s7
                  mulh         s3, s3, t3
                  c.slli       a6, 10
                  sltu         s4, a5, ra
                  mulhsu       a7, t1, t2
                  lui          a4, 1009656
                  c.srli       a2, 31
                  c.andi       a2, 30
                  c.li         t4, 14
                  c.srli       a3, 31
                  c.and        a3, s0
                  csrrw        s1, 0x340, gp
                  csrrc        s1, 0x340, zero
                  sltiu        a1, ra, -1245
                  c.srai       a3, 18
                  sub          s6, t2, tp
                  c.addi       s4, -1
                  c.add        s0, t1
                  c.srai       a3, 18
                  andi         s0, zero, -1083
                  c.lui        a6, 22
                  mulhsu       a6, t4, a2
                  c.and        a2, a1
                  csrrs        t4, 0x340, zero
                  xor          s1, tp, gp
                  mul          a3, s4, a3
                  sltiu        s0, s6, 1948
                  sub          s7, t2, zero
                  c.and        a4, a4
                  sltiu        tp, a2, 1462
                  auipc        t5, 354863
                  csrrw        ra, 0x340, tp
                  divu         s5, t0, a7
                  or           s7, tp, sp
                  sll          gp, ra, s0
                  sub          s8, s5, a1
                  srai         s2, tp, 8
                  div          t5, zero, tp
                  sltiu        a4, a1, -163
                  sltu         t5, t0, ra
                  srli         t5, t3, 4
                  c.lui        s0, 21
                  c.srai       a1, 16
                  addi         tp, s0, -92
                  c.srai       a3, 20
                  or           s4, a6, t0
                  srl          tp, s6, a3
                  c.srai       a3, 29
                  sltiu        a3, a2, 1552
                  andi         a0, s5, 1764
                  c.andi       s1, -1
                  csrrw        s3, 0x340, s6
                  c.addi4spn   a2, sp, 720
                  and          s9, a4, sp
                  c.xor        s1, a5
                  c.and        a4, a5
                  c.addi4spn   a0, sp, 16
                  lui          t1, 498290
                  c.addi4spn   a3, sp, 400
                  c.mv         a3, t1
                  and          zero, s6, t2
                  or           s9, s10, s1
                  c.slli       gp, 20
                  c.lui        s8, 22
                  xori         a1, s8, -748
                  c.srai       s0, 15
                  c.addi16sp   sp, 464
                  and          s7, a6, a3
                  addi         t1, t3, -335
                  c.li         t4, -1
                  c.xor        a2, a3
                  c.nop
                  lui          zero, 71051
                  ori          s1, a4, 87
                  div          sp, s11, a3
                  c.li         tp, -1
                  c.srai       a3, 30
                  c.slli       tp, 28
                  c.lui        a1, 24
                  srl          t5, a4, a1
                  divu         t6, a0, s9
                  mul          t4, s2, a6
                  sltiu        s5, sp, -1705
                  mulhsu       ra, s10, ra
                  srai         a6, s1, 7
                  add          a6, s9, s3
                  c.lui        a2, 21
                  sll          s1, t3, a2
                  mul          a2, s4, t0
                  mulh         a3, a6, a4
                  c.and        s0, a2
                  sltiu        s5, t5, 868
                  srli         s9, a6, 29
                  mulh         t4, t4, s3
                  csrrwi       t5, 0x340, 10
                  rem          a7, s8, t4
                  c.mv         s5, t2
                  xor          t4, s2, s1
                  nop
                  and          t0, a4, s8
                  c.slli       t0, 21
                  csrrw        ra, 0x340, t1
                  lui          tp, 226356
                  c.lui        s2, 15
                  or           a6, a1, sp
                  csrrc        s9, 0x340, zero
                  c.add        s10, s11
                  andi         a4, t0, 106
                  xori         s2, ra, 1346
                  c.and        a4, s1
                  div          s6, t3, t5
                  andi         s6, gp, 1955
                  sltiu        a7, tp, -699
                  c.sub        a1, a1
                  c.addi16sp   sp, 192
                  addi         a0, a3, 1670
                  slli         t1, a3, 28
                  nop
                  mul          sp, s4, t2
                  div          s9, a4, s3
                  c.andi       a3, -1
                  divu         s7, s5, a3
                  and          s1, s9, s3
                  c.srli       a4, 24
                  addi         s0, s9, -182
                  ori          ra, s11, 30
                  c.srli       s1, 21
                  c.lui        s10, 28
                  csrrw        a2, 0x340, ra
                  sltu         s1, t6, t1
                  andi         s7, ra, 356
                  sra          a0, s2, s2
                  c.nop
                  c.mv         s0, s4
                  c.addi4spn   s1, sp, 368
                  and          s4, a6, a3
                  c.li         a4, -1
                  c.addi16sp   sp, -16
                  slt          a2, s3, t5
                  c.slli       s10, 1
                  divu         gp, s0, tp
                  add          sp, s1, t5
                  csrrw        s8, 0x340, s1
                  andi         s3, a1, -1650
                  srli         s11, a2, 0
                  sltu         a3, a7, s10
                  slli         tp, t5, 4
                  addi         zero, a4, -1138
                  rem          a3, a6, a4
                  c.addi       t6, -1
                  c.addi4spn   s0, sp, 64
                  addi         s6, s5, 408
                  slli         gp, a3, 27
                  srai         zero, ra, 1
                  div          s5, s3, t6
                  c.or         s1, a4
                  sltiu        sp, a1, 1070
                  c.addi16sp   sp, -16
                  rem          s7, s4, a4
                  c.slli       s7, 14
                  c.addi       s3, -1
                  sub          s2, zero, a5
                  c.addi4spn   a0, sp, 464
                  sra          gp, a0, a0
                  csrrc        a0, 0x340, s1
                  sltu         s10, s6, a4
                  nop
                  csrrc        s5, 0x340, zero
                  srli         t0, t2, 5
                  c.nop
                  divu         ra, s2, s9
                  c.xor        s1, a0
                  srli         zero, gp, 18
                  c.and        a0, a1
                  auipc        a7, 361938
                  srli         s5, a5, 24
                  xori         s3, a6, 73
                  div          gp, s3, t1
                  csrrci       a7, 0x340, 0
                  sltiu        a0, ra, 87
                  ori          a1, sp, -1837
                  lui          s5, 29437
                  nop
                  csrrc        sp, 0x340, t4
                  srai         sp, t0, 12
                  c.addi16sp   sp, 496
                  addi         a1, s4, 242
                  c.srli       a2, 30
                  c.xor        s1, a4
                  sltu         s9, s3, ra
                  c.xor        s0, a2
                  mul          a2, t3, sp
                  c.add        s6, s6
                  c.xor        s1, a1
                  mul          a6, s1, a1
                  csrrc        zero, 0x340, zero
                  rem          s6, s2, a6
                  sll          a6, t0, t5
                  srli         tp, t6, 1
                  c.mv         t4, s0
                  remu         a0, sp, t6
                  auipc        s0, 235321
                  c.sub        s1, a5
                  mulhu        t1, s8, t6
                  c.addi4spn   s0, sp, 176
                  c.addi16sp   sp, 336
                  c.srli       a3, 3
                  xor          a0, tp, t4
                  divu         s6, s5, s9
                  addi         sp, t6, 1961
                  c.addi       a0, -1
                  lui          a0, 830171
                  c.li         s8, 14
                  rem          gp, a6, a6
                  csrrc        s8, 0x340, zero
                  c.add        s10, a5
                  c.addi16sp   sp, -16
                  c.sub        s0, a2
                  csrrc        tp, 0x340, zero
                  div          gp, s2, a1
                  rem          s1, s5, a1
                  sra          sp, s0, a4
                  csrrci       s1, 0x340, 25
                  c.lui        s8, 24
                  c.addi4spn   s1, sp, 272
                  nop
                  csrrsi       t5, 0x340, 12
                  csrrsi       a2, 0x340, 0
                  mulhu        s0, t1, ra
                  remu         zero, s0, a5
                  c.and        a4, a4
                  c.nop
                  addi         s11, t0, 817
                  slli         s2, s7, 12
                  c.xor        a1, s1
                  srl          tp, s5, t4
                  sltiu        a2, tp, -1189
                  srli         s7, sp, 23
                  mulhsu       s6, a4, gp
                  csrrc        t6, 0x340, s8
                  slti         a2, a5, -421
                  remu         ra, s7, sp
                  srl          s0, s5, s1
                  c.li         s11, 23
                  srai         gp, t3, 2
                  c.srli       s0, 23
                  c.or         s1, s1
                  auipc        s3, 311515
                  c.slli       a6, 2
                  c.and        s1, a3
                  c.addi       ra, -1
                  srl          s11, s3, a3
                  c.li         s3, -1
                  c.andi       a2, 27
                  srl          s4, s4, s5
                  c.lui        t5, 11
                  xor          a7, t5, t5
                  sub          s2, s2, a2
                  c.lui        s1, 1
                  c.li         s9, -1
                  remu         s1, a5, t3
                  c.sub        a0, s1
                  xor          s10, t5, zero
                  rem          a0, s1, s5
                  srai         s4, a0, 14
                  srl          s7, s3, t3
                  rem          s7, t3, ra
                  div          s9, a1, a0
                  addi         tp, s1, 459
                  mul          s7, a1, t3
                  xor          a2, s0, s4
                  csrrci       s5, 0x340, 22
                  c.or         a1, a5
                  slti         t4, a3, -755
                  sub          s6, zero, s7
                  andi         t5, a2, 571
                  slli         ra, s11, 11
                  sltiu        a6, zero, -1068
                  csrrw        a0, 0x340, a1
                  csrrc        t1, 0x340, zero
                  c.and        a4, s1
                  c.nop
                  c.andi       s0, -1
                  slli         a4, tp, 31
                  mulhsu       sp, s8, tp
                  mulhsu       a2, a3, s3
                  srai         sp, s6, 18
                  ori          gp, a5, -236
                  c.nop
                  or           gp, t0, s7
                  nop
                  or           a6, ra, s9
                  lui          zero, 535893
                  andi         s4, gp, 1710
                  nop
                  c.or         s1, a1
                  csrrwi       t4, 0x340, 6
                  add          a6, s11, t4
                  div          ra, a0, ra
                  csrrw        s9, 0x340, s6
                  c.addi16sp   sp, 304
                  csrrw        s5, 0x340, t5
                  add          t1, a6, a3
                  lui          a4, 672654
                  c.xor        a0, a0
                  c.mv         s3, a0
                  c.addi16sp   sp, -16
                  mulhu        a2, zero, t2
                  and          s8, a2, t1
                  sltu         a2, tp, t4
                  c.add        s11, s6
                  srli         s7, a0, 2
                  remu         s6, t6, s9
                  csrrsi       zero, 0x340, 15
                  slti         s9, s8, -398
                  remu         s4, a2, a3
                  c.addi4spn   a4, sp, 144
                  slt          s6, zero, a0
                  remu         a0, tp, s6
                  c.or         s1, s1
                  mulhu        s3, t0, s8
                  csrrci       gp, 0x340, 0
                  sltiu        t1, s11, 208
                  nop
                  divu         a0, a0, t0
                  sltu         zero, ra, s11
                  c.srai       s1, 27
                  rem          a3, t1, t4
                  sltiu        t5, t4, 1216
                  nop
                  c.addi16sp   sp, 400
                  c.addi16sp   sp, -16
                  and          s4, a5, t3
                  c.addi4spn   a2, sp, 816
                  slti         s0, t2, -1036
                  sltu         s3, a0, gp
                  slt          a7, s8, s11
                  divu         t0, a3, a3
                  mul          s1, t4, tp
                  addi         s11, s1, -1338
                  xori         gp, s2, 410
                  c.mv         s8, s9
                  csrrsi       a3, 0x340, 8
                  andi         s0, s8, -681
                  xori         s10, a6, -1357
                  c.lui        tp, 29
                  c.addi       a4, 28
                  auipc        t5, 906222
                  c.addi4spn   a1, sp, 128
                  csrrsi       a0, 0x340, 18
                  mulhsu       a6, s9, t6
                  c.sub        s1, a1
                  mulh         ra, tp, a4
                  c.mv         s10, t6
                  xori         tp, t5, -195
                  c.and        a0, a0
                  slli         a2, a5, 19
                  andi         t4, a4, -578
                  csrrci       s10, 0x340, 0
                  c.addi4spn   a0, sp, 32
                  mulhsu       s2, s1, s3
                  c.addi       a3, -1
                  csrrc        s9, 0x340, tp
                  slt          tp, ra, s6
                  c.xor        a4, s0
                  c.nop
                  lui          s2, 303262
                  sll          a7, t5, t1
                  nop
                  mulhsu       s10, s4, s0
                  c.sub        s0, s0
                  c.srai       a2, 26
                  csrrci       t0, 0x340, 24
                  slti         t1, a1, 1313
                  c.srai       a3, 13
                  divu         zero, t4, s2
                  xor          t0, s3, a1
                  c.srai       a0, 4
                  sll          a3, s10, t5
                  c.xor        a2, a0
                  c.srli       s1, 13
                  sltu         t0, a6, t5
                  nop
                  srai         t0, s3, 31
                  auipc        s1, 424070
                  c.or         a0, a3
                  slti         s7, a6, 2021
                  sltu         s9, s1, s2
                  sll          s0, s4, s4
                  c.addi4spn   a0, sp, 736
                  srl          s2, s0, s6
                  c.slli       t6, 18
                  and          t1, zero, a0
                  rem          a1, sp, t5
                  andi         sp, s3, -627
                  xori         gp, sp, 1759
                  sub          s4, tp, s11
                  addi         t1, s7, -32
                  sra          a0, s7, a6
                  csrrc        a7, 0x340, a4
                  add          s1, a7, t4
                  csrrs        s3, 0x340, s2
                  andi         ra, t0, -678
                  c.li         a4, -1
                  nop
                  addi         s1, a0, 1989
                  srl          t6, a5, a1
                  andi         s10, ra, 249
                  csrrwi       s8, 0x340, 8
                  c.addi16sp   sp, -16
                  csrrsi       a4, 0x340, 18
                  c.xor        a4, a5
                  mulhsu       s10, t4, a4
                  ori          s1, s6, 159
                  mul          s2, gp, t1
                  c.li         tp, -1
                  sub          s7, a2, s8
                  mul          a3, s2, tp
                  addi         t4, s10, -1653
                  c.andi       a1, 7
                  c.or         s1, a4
                  c.add        a0, s9
                  divu         t5, s1, s7
                  c.andi       a2, 10
                  sll          a2, zero, a4
                  lui          s10, 181599
                  sra          s6, s9, s11
                  c.addi16sp   sp, 96
                  or           a0, a2, s9
                  c.addi       a1, -1
                  and          t5, s4, t5
                  c.addi       s4, 9
                  srl          s3, a7, t3
                  c.srli       s1, 11
                  ori          t6, t5, -1786
                  c.or         a3, a2
                  add          s8, t6, s0
                  csrrs        s2, 0x340, t4
                  addi         t1, zero, 43
                  srl          s0, zero, s0
                  c.lui        t1, 24
                  c.slli       s7, 11
                  or           t6, zero, s3
                  mul          s10, a3, s5
                  xor          t5, t5, s1
                  add          s0, a7, a2
                  ori          t5, sp, -1942
                  c.srai       s1, 7
                  mul          s3, s0, tp
                  auipc        s8, 744736
                  slli         s11, sp, 30
                  c.li         a7, 9
                  add          a0, a2, t0
                  c.sub        s1, a5
                  slti         s3, t6, -882
                  or           s8, t0, s0
                  srai         s9, s3, 6
                  or           s1, s10, gp
                  c.addi       a3, -1
                  sltiu        t1, a7, 1747
                  slt          ra, t3, t4
                  csrrw        a3, 0x340, t1
                  nop
                  slt          s11, s10, sp
                  nop
                  rem          ra, t3, t5
                  c.and        s0, s0
                  c.and        s0, a3
                  c.or         a4, s0
                  c.add        sp, s6
                  nop
                  slli         s11, a0, 7
                  divu         t6, a5, t6
                  csrrs        s1, 0x340, a6
                  c.xor        s1, a4
                  divu         t5, s11, a7
                  xor          ra, a7, t1
                  srl          a1, t1, s6
                  ori          zero, ra, -1517
                  remu         s8, s3, s4
                  c.sub        a0, a4
                  c.srai       a4, 26
                  c.mv         t6, t4
                  c.andi       a1, -1
                  mulhu        a0, a1, s0
                  mulh         a4, a2, t5
                  mulhsu       ra, s0, s7
                  lui          a1, 859477
                  sltiu        s9, a3, 194
                  csrrwi       gp, 0x340, 16
                  c.srai       a2, 15
                  sltiu        t0, a5, 1527
                  c.li         s8, -1
                  c.li         a6, -1
                  ori          s8, t5, 46
                  c.nop
                  sltu         s0, s10, a5
                  sra          s4, s6, s8
                  mulhsu       a7, s8, s4
                  csrrw        tp, 0x340, s10
                  and          s0, s5, s4
                  csrrci       t6, 0x340, 5
                  div          t0, t3, t2
                  sra          sp, t0, s6
                  c.srai       a0, 4
                  lui          s11, 22473
                  srai         s2, a2, 18
                  mulhu        s4, s6, ra
                  c.srli       s0, 14
                  remu         t5, s2, s0
                  c.addi       a3, 17
                  ori          tp, a6, -557
                  c.srai       a4, 17
                  nop
                  c.andi       a0, -1
                  c.sub        s1, a2
                  xori         t5, a4, -674
                  sltu         s0, s7, s7
                  nop
                  slli         s8, a6, 20
                  and          a6, s6, t3
                  csrrwi       ra, 0x340, 30
                  c.sub        a0, s0
                  csrrwi       t5, 0x340, 16
                  srl          s8, ra, t3
                  ori          s11, s0, 702
                  c.li         t4, -1
                  slt          t0, a3, a6
                  csrrs        t4, 0x340, s4
                  xori         s1, a2, 546
                  csrrsi       t4, 0x340, 0
                  sltiu        t1, a5, -1307
                  c.addi4spn   a3, sp, 416
                  c.lui        t6, 31
                  mul          s7, t3, a6
                  csrrci       s0, 0x340, 1
                  sltiu        s10, s8, 1987
                  mulhsu       s11, s7, s10
                  c.addi       s0, -1
                  mulhu        s0, s4, gp
                  xori         a4, t1, -1346
                  andi         s0, a4, 1042
                  csrrc        t1, 0x340, zero
                  csrrw        s9, 0x340, s4
                  slti         a7, t6, -715
                  c.lui        s5, 12
                  c.andi       a1, 13
                  c.and        a1, s0
                  sll          zero, a2, s6
                  mul          s10, sp, s11
                  c.srai       a4, 5
                  mulh         s2, a6, gp
                  c.srai       a4, 31
                  csrrci       s5, 0x340, 14
                  csrrs        t4, 0x340, t0
                  slt          t1, s6, s3
                  sltu         a4, s7, ra
                  sltu         s9, tp, s6
                  c.lui        s7, 9
                  c.slli       s10, 4
                  c.or         a3, s0
                  c.sub        a2, s1
                  sll          a3, t5, s3
                  sltiu        t6, a3, -1095
                  div          s0, tp, a0
                  c.andi       s1, 11
                  sub          s8, t5, s7
                  mulh         s2, a5, t4
                  c.mv         a3, t1
                  csrrci       s9, 0x340, 18
                  mulhu        a1, s7, a0
                  div          a0, t6, s7
                  add          s0, a6, t6
                  c.lui        a0, 6
                  c.addi       s8, -1
                  srl          a6, sp, a3
                  c.nop
                  c.or         a0, a1
                  or           a0, s7, s10
                  xori         t5, tp, -1672
                  mul          tp, a3, s2
                  divu         a6, s9, zero
                  div          s2, s7, t0
                  csrrs        s10, 0x340, zero
                  mul          t1, s3, a0
                  c.andi       s1, -1
                  sra          s1, s5, t2
                  c.addi       a7, 24
                  c.slli       t0, 20
                  csrrsi       s4, 0x340, 0
                  sltu         a4, ra, t2
                  addi         a1, tp, -1416
                  nop
                  c.lui        a7, 29
                  remu         tp, a2, t3
                  andi         s3, tp, 909
                  csrrci       gp, 0x340, 20
                  mulhu        s10, a4, s1
                  c.slli       tp, 21
                  c.nop
                  c.srai       a3, 26
                  c.lui        a7, 5
                  c.slli       t1, 6
                  sltiu        a7, a3, -1089
                  or           zero, s11, t0
                  mul          a3, s2, s6
                  mulhsu       s3, s9, s1
                  and          s5, s0, s4
                  lui          ra, 709318
                  c.li         a1, -1
                  csrrw        s5, 0x340, s6
                  ori          a4, s5, -716
                  c.srli       s1, 1
                  mul          a4, ra, a2
                  add          s8, a2, a5
                  divu         s10, t3, a7
                  xori         t0, s5, -1365
                  slti         s9, s11, -1750
                  c.addi4spn   s1, sp, 1008
                  sra          s3, gp, s3
                  c.or         s1, a5
                  c.or         a4, a1
                  and          ra, a0, s8
                  rem          a7, s0, t6
                  mulh         s9, s0, zero
                  mulhu        s11, gp, sp
                  slt          t5, t0, t4
                  c.add        t1, t5
                  c.srli       s1, 18
                  csrrs        a7, 0x340, a4
                  c.and        s0, s1
                  c.srli       a2, 24
                  or           s8, s0, a3
                  srl          s0, s1, s11
                  srai         a0, s7, 23
                  or           s4, t0, a7
                  slli         a7, tp, 25
                  add          s4, gp, t1
                  divu         t0, s5, a2
                  csrrsi       a7, 0x340, 7
                  c.slli       s5, 4
                  csrrc        a2, 0x340, zero
                  mulh         a1, s2, t1
                  c.addi16sp   sp, 384
                  c.slli       a6, 16
                  rem          s3, s11, a0
                  c.andi       a1, 6
                  lui          ra, 687012
                  ori          s4, s2, 1651
                  xor          t6, ra, s8
                  andi         t4, a3, 345
                  divu         a7, gp, tp
                  sltiu        a7, s9, -799
                  add          sp, sp, sp
                  slt          a7, a4, a3
                  c.xor        a0, s1
                  xori         t0, t3, 682
                  srli         a0, a5, 5
                  csrrs        s9, 0x340, s4
                  sltiu        s6, t1, 1117
                  c.li         a3, 4
                  c.li         t0, -1
                  c.andi       a3, 5
                  c.and        a0, a0
                  rem          s0, a4, s7
                  ori          a4, a5, -1431
                  add          s1, s10, a0
                  c.srli       s1, 18
                  csrrci       a7, 0x340, 0
                  xori         a6, t2, 1312
                  sub          t4, s7, zero
                  csrrsi       t0, 0x340, 9
                  xor          s5, t6, ra
                  mulh         a1, a3, a5
                  c.and        a0, s0
                  c.addi4spn   s1, sp, 304
                  c.sub        a1, a2
                  rem          s1, a4, a2
                  c.mv         a2, a6
                  ori          zero, t5, 621
                  c.addi16sp   sp, 416
                  srl          a1, a7, s8
                  and          t0, s7, a2
                  csrrsi       s7, 0x340, 0
                  srai         s2, a7, 9
                  sra          zero, a5, t1
                  csrrsi       s2, 0x340, 24
                  csrrsi       s7, 0x340, 9
                  addi         ra, s1, 51
                  c.addi4spn   a4, sp, 32
                  c.li         s0, 2
                  csrrc        a3, 0x340, zero
                  remu         s1, s9, t3
                  c.nop
                  slt          t0, t2, a0
                  sra          zero, s11, t5
                  c.srli       s0, 29
                  ori          s6, s9, 1426
                  csrrwi       t4, 0x340, 18
                  mulhsu       a2, s0, tp
                  c.srli       s0, 15
                  c.addi4spn   a1, sp, 448
                  csrrs        a0, 0x340, a6
                  c.add        a3, s2
                  c.nop
                  rem          gp, a1, s4
                  xori         sp, a2, -505
                  auipc        t5, 197707
                  xori         t1, zero, 685
                  c.addi4spn   a3, sp, 144
                  add          gp, s0, t1
                  c.nop
                  c.or         a2, a4
                  mul          t6, zero, a0
                  nop
                  slt          a1, a6, s2
                  sltu         ra, s11, a0
                  c.sub        a2, a0
                  c.or         s0, a4
                  ori          tp, s6, -1380
                  mulh         s5, a7, a7
                  divu         t4, a2, a0
                  c.nop
                  sltu         a0, s8, s11
                  or           s7, t3, s5
                  c.addi4spn   a1, sp, 528
                  srl          t1, t5, gp
                  csrrs        t5, 0x340, t3
                  divu         t0, a3, s0
                  addi         a4, sp, 1839
                  lui          ra, 748941
                  csrrw        s6, 0x340, a5
                  mul          s6, a1, s3
                  c.addi       a2, -1
                  add          s8, zero, t2
                  csrrwi       t1, 0x340, 20
                  c.srli       s1, 9
                  csrrc        t0, 0x340, zero
                  ori          a0, tp, 61
                  mulh         tp, s2, t2
                  auipc        a1, 478398
                  andi         s2, a7, -369
                  c.and        a4, a4
                  csrrci       sp, 0x340, 0
                  mulh         a7, a5, a0
                  c.nop
                  sltiu        ra, s8, -708
                  csrrw        zero, 0x340, s6
                  c.add        t5, a1
                  slti         s7, t6, 51
                  c.or         s1, s1
                  srai         s3, s6, 14
                  andi         s6, s6, 1592
                  c.srai       a1, 6
                  c.xor        a2, a5
                  lui          s6, 833830
                  c.nop
                  mulh         t5, sp, s11
                  mulh         ra, a7, s1
                  c.sub        a2, a1
                  add          s5, ra, s9
                  c.sub        s1, s0
                  remu         s11, s7, a5
                  sub          a0, a2, s11
                  srli         s3, zero, 18
                  csrrs        s6, 0x340, tp
                  c.mv         s4, s11
                  rem          a3, s3, s6
                  slti         s5, t4, -1818
                  mulhu        gp, a6, s5
                  c.slli       a3, 14
                  csrrw        s8, 0x340, a7
                  csrrc        s5, 0x340, a7
                  c.mv         s0, s2
                  sltu         s11, zero, zero
                  sra          s9, a6, s1
                  csrrs        gp, 0x340, zero
                  sltiu        t5, s3, 711
                  c.mv         s4, s2
                  sltiu        zero, s3, -1798
                  slli         a6, s5, 10
                  divu         a3, a3, s10
                  srai         s4, a2, 22
                  sltiu        a1, a7, -1745
                  c.addi       s4, 30
                  c.srli       a1, 31
                  mul          a0, s1, s5
                  csrrs        a2, 0x340, s1
                  sub          t0, s11, t5
                  csrrs        sp, 0x340, zero
                  csrrs        t0, 0x340, zero
                  slti         s11, t1, -740
                  csrrci       a0, 0x340, 0
                  c.srai       a2, 8
                  c.addi16sp   sp, -16
                  mulhu        s9, a4, s5
                  c.xor        a4, s0
                  sra          t1, s7, t2
                  c.add        t4, ra
                  csrrw        t1, 0x340, a1
                  rem          s1, a6, ra
                  c.slli       t1, 10
                  csrrwi       s10, 0x340, 9
                  c.addi       a7, -1
                  divu         t0, s3, a7
                  c.lui        s6, 22
                  c.sub        a2, a2
                  c.addi16sp   sp, -16
                  mulh         s3, a3, t1
                  andi         a6, t0, 265
                  remu         s6, t2, t6
                  xor          a2, ra, a7
                  sll          s7, a5, a1
                  sltu         t4, s6, t1
                  xor          gp, s2, a7
                  slli         zero, s11, 19
                  c.li         s5, -1
                  c.andi       a4, 26
                  c.andi       a1, 31
                  rem          a3, t0, a7
                  c.addi       a0, 8
                  csrrwi       t5, 0x340, 23
                  srl          s2, s0, zero
                  sll          t4, t3, s3
                  divu         s9, a7, gp
                  divu         s10, a1, s7
                  srai         a6, s7, 9
                  sub          s11, a4, a7
                  c.mv         tp, t5
                  csrrc        s8, 0x340, zero
                  c.lui        t5, 29
                  c.addi16sp   sp, 336
                  slt          a3, t1, t0
                  csrrsi       s7, 0x340, 9
                  c.addi4spn   a3, sp, 800
                  csrrc        s11, 0x340, s0
                  c.addi4spn   s0, sp, 400
                  c.sub        a4, a4
                  c.sub        a2, a0
                  nop
                  sltu         a2, a2, a2
                  csrrc        sp, 0x340, zero
                  ori          a4, a5, -1863
                  lui          t5, 851854
                  c.and        a4, s1
                  csrrwi       s4, 0x340, 3
                  mulh         t6, ra, zero
                  mul          a1, t6, zero
                  sra          sp, s5, ra
                  csrrs        s7, 0x340, a0
                  csrrci       t6, 0x340, 11
                  add          t4, a0, a0
                  addi         s4, t1, 739
                  sra          s8, t5, s10
                  csrrc        t4, 0x340, t6
                  rem          sp, tp, sp
                  sra          s5, tp, a3
                  or           s4, t1, s1
                  slti         s2, a5, -60
                  csrrci       s6, 0x340, 0
                  srl          a6, a2, a4
                  c.xor        a4, s1
                  csrrc        t6, 0x340, zero
                  slt          s10, a1, s5
                  div          s11, s4, t5
                  c.add        s6, tp
                  c.xor        a3, a5
                  slli         a7, s1, 1
                  andi         s10, s10, 1512
                  csrrci       t6, 0x340, 20
                  c.lui        s9, 19
                  c.addi       t4, 31
                  mulhu        sp, s3, s0
                  sltiu        s3, sp, 49
                  srli         s9, s4, 8
                  c.add        t0, s6
                  c.slli       s11, 6
                  nop
                  c.xor        a0, a1
                  c.addi       s8, 16
                  c.li         a3, -1
                  add          s3, s10, s1
                  mul          t4, s0, t6
                  slt          a7, a1, t4
                  c.li         tp, 3
                  srai         t6, a5, 1
                  remu         gp, a0, a4
                  auipc        a3, 923136
                  andi         s1, a6, -1598
                  mulh         s6, s11, a7
                  c.lui        a1, 23
                  c.add        s5, s11
                  c.srli       a0, 13
                  sltiu        s4, t2, -286
                  slt          s7, a0, a5
                  c.andi       a1, -1
                  mul          a4, ra, a0
                  mulh         s5, a5, a2
                  c.andi       s0, -1
                  xor          s11, s6, s8
                  lui          s0, 229835
                  or           s8, zero, zero
                  csrrw        a3, 0x340, t3
                  c.addi       a1, -1
                  csrrsi       t1, 0x340, 10
                  csrrci       zero, 0x340, 5
                  c.addi       a2, 15
                  or           s5, s10, s9
                  ori          s0, zero, 2037
                  csrrs        t5, 0x340, zero
                  c.addi4spn   a1, sp, 928
                  srai         a1, a0, 21
                  csrrwi       a0, 0x340, 21
                  srli         a3, gp, 17
                  and          s7, a7, t4
                  c.andi       s1, 0
                  nop
                  c.xor        a2, a0
                  slt          s10, ra, sp
                  csrrc        s7, 0x340, sp
                  mul          s0, t4, gp
                  csrrw        sp, 0x340, s6
                  andi         s8, t4, 1547
                  c.add        gp, t5
                  xor          t1, t4, zero
                  srl          t6, s3, s1
                  csrrc        a1, 0x340, tp
                  nop
                  csrrsi       a2, 0x340, 0
                  csrrsi       a7, 0x340, 12
                  c.addi4spn   a3, sp, 400
                  div          t0, zero, tp
                  sra          s4, gp, s8
                  div          t5, t1, s9
                  c.sub        a4, a3
                  c.addi4spn   s1, sp, 112
                  sll          s6, s3, t5
                  xori         s4, a7, 1463
                  nop
                  c.lui        a6, 5
                  xor          a3, s6, s1
                  andi         s0, a6, 1937
                  auipc        s2, 994325
                  c.addi       a7, -1
                  c.slli       s6, 1
                  slti         t5, a1, -396
                  mul          s3, sp, s4
                  c.nop
                  remu         t5, s6, s5
                  c.mv         gp, a2
                  c.addi16sp   sp, -16
                  addi         a0, a5, -1346
                  mulh         a0, tp, s9
                  c.lui        s7, 23
                  xori         a7, a1, -1730
                  c.nop
                  c.sub        a2, a5
                  c.and        a0, s0
                  mulhsu       s0, tp, zero
                  csrrsi       s5, 0x340, 31
                  and          zero, s0, t2
                  divu         a2, s8, s9
                  sll          s3, t1, s1
                  sll          a4, t6, s7
                  or           s0, s7, a4
                  c.slli       s3, 2
                  srli         s0, t0, 4
                  csrrw        s10, 0x340, t3
                  csrrw        a1, 0x340, t3
                  nop
                  sub          t1, a6, s11
                  xori         t0, a3, -121
                  mul          s3, s1, s4
                  andi         a3, a0, -378
                  slt          t1, s5, ra
                  slti         s2, a7, 1490
                  slt          t4, a3, t6
                  csrrc        zero, 0x340, zero
                  slli         sp, s9, 29
                  srl          gp, t2, t6
                  csrrc        s7, 0x340, zero
                  mulhsu       a3, a3, s7
                  sll          s11, s5, t2
                  slt          t5, a0, s4
                  c.nop
                  ori          s11, a1, 1044
                  xori         s3, a4, 1341
                  c.addi       a0, -1
                  mulh         a2, a0, t4
                  div          t6, ra, s9
                  c.xor        s0, a0
                  srli         t6, ra, 10
                  xori         t4, t0, -118
                  slli         tp, a3, 2
                  sub          s10, a5, a5
                  csrrw        s6, 0x340, a7
                  nop
                  srl          s0, s2, s1
                  srli         a0, a0, 30
                  remu         zero, s7, t2
                  srai         t1, a6, 31
                  mulhsu       t0, gp, a5
                  lui          s8, 260076
                  c.mv         ra, s8
                  divu         s7, s8, s1
                  c.xor        a3, a0
                  sra          a7, a5, a7
                  mulh         s9, a4, a3
                  csrrsi       t4, 0x340, 0
                  srai         a2, s2, 17
                  ori          s1, a7, -1246
                  auipc        gp, 588445
                  c.mv         t1, t0
                  c.addi4spn   a3, sp, 480
                  c.xor        a3, a1
                  c.or         a3, a3
                  srli         gp, gp, 20
                  div          ra, s7, t4
                  c.addi       t4, 20
                  srai         t0, a5, 8
                  or           a4, a3, tp
                  remu         s11, sp, t5
                  or           s6, s6, s0
                  csrrsi       sp, 0x340, 17
                  csrrwi       t6, 0x340, 3
                  mul          t4, t3, tp
                  c.lui        s8, 25
                  c.xor        a1, s0
                  andi         sp, s0, -389
                  c.mv         a0, a4
                  c.lui        s5, 16
                  div          s5, a2, s1
                  c.and        s0, a3
                  srli         t6, s9, 4
                  mulh         s5, s5, t5
                  c.sub        s1, s0
                  srl          s6, gp, s3
                  c.and        a2, a5
                  c.srai       s0, 8
                  csrrw        a1, 0x340, a4
                  csrrw        gp, 0x340, s1
                  slti         sp, s2, -1994
                  addi         a1, t1, -675
                  c.or         a1, a4
                  mulhsu       gp, t5, t1
                  csrrwi       a2, 0x340, 14
                  c.add        t1, s2
                  c.and        a2, a0
                  mulhsu       s9, t5, t6
                  mul          t1, s3, sp
                  sll          s0, s1, s5
                  rem          s6, s7, tp
                  sra          a6, t4, t6
                  ori          a3, a2, -537
                  c.lui        s6, 8
                  c.or         a0, a4
                  sll          s9, a2, s8
                  sltu         a4, zero, s11
                  c.srai       a1, 13
                  slli         s1, a2, 17
                  rem          s5, t0, s4
                  andi         a2, s4, -872
                  c.add        a0, t2
                  c.xor        a2, a3
                  rem          gp, a7, a7
                  mulhu        s0, s0, t5
                  c.and        s0, a3
                  ori          s1, gp, -289
                  csrrs        a4, 0x340, t1
                  mulhu        s0, a3, s3
                  c.and        a2, a1
                  remu         s1, a2, a0
                  divu         s4, a4, a0
                  c.nop
                  c.addi4spn   a3, sp, 144
                  add          a1, t2, s2
                  c.srli       s0, 22
                  addi         s6, tp, -248
                  c.add        t4, s0
                  csrrw        s2, 0x340, s1
                  slli         s9, gp, 2
                  csrrci       a6, 0x340, 3
                  c.srli       a3, 2
                  and          t1, t5, a2
                  xori         s1, s6, 1699
                  mulhu        t5, t2, sp
                  c.srai       a1, 9
                  sub          s1, a5, a4
                  sub          ra, s2, sp
                  c.nop
                  srai         s9, t3, 18
                  c.or         a2, a3
                  c.slli       s5, 28
                  srai         a0, tp, 27
                  c.lui        a6, 14
                  srai         t0, zero, 5
                  sltu         s3, s11, s5
                  srai         a7, s11, 9
                  divu         t4, s9, t3
                  c.srai       a1, 23
                  auipc        s1, 774119
                  csrrsi       s0, 0x340, 13
                  c.lui        s10, 27
                  addi         s3, t2, -1079
                  slti         t0, a5, -1540
                  c.slli       a0, 19
                  c.or         a4, a4
                  slti         s8, s7, 1392
                  c.li         a3, -1
                  add          sp, t4, tp
                  srli         s11, s1, 11
                  rem          s9, a0, s0
                  mulhu        s10, a1, a0
                  srl          s6, t1, a4
                  sltu         a2, s11, a0
                  c.andi       a4, 4
                  csrrci       s10, 0x340, 0
                  c.addi4spn   a3, sp, 320
                  slti         sp, s5, -61
                  rem          gp, t4, t3
                  or           tp, s1, a2
                  srai         ra, a1, 7
                  xor          a6, a7, s8
                  addi         s10, tp, 1965
                  csrrs        s8, 0x340, zero
                  slti         a2, s3, -1547
                  csrrs        sp, 0x340, a5
                  srl          a7, a3, t4
                  remu         s10, t6, a1
                  srai         s0, a7, 20
                  c.andi       s1, -1
                  slli         zero, s11, 6
                  sltiu        s4, t6, 585
                  c.srai       a0, 13
                  xori         sp, zero, 162
                  rem          t6, a2, gp
                  csrrci       ra, 0x340, 6
                  mulh         ra, a3, s10
                  and          a6, a1, s7
                  c.mv         sp, s7
                  sra          s0, a0, a4
                  slti         a7, sp, 181
                  c.li         a6, 10
                  remu         a3, s1, s4
                  c.xor        s0, a0
                  srli         tp, s1, 13
                  andi         s2, t1, 864
                  csrrsi       s6, 0x340, 0
                  c.nop
                  mul          gp, s3, t1
                  auipc        t4, 507198
                  mul          a7, ra, s9
                  sub          s3, s6, s7
                  srai         s9, t0, 27
                  lui          tp, 830174
                  srai         a4, tp, 11
                  csrrw        s7, 0x340, a7
                  c.addi4spn   a4, sp, 576
                  slli         s5, s4, 7
                  c.mv         t1, s3
                  c.xor        a4, a5
                  mulhu        a3, a3, a1
                  addi         s1, t2, -95
                  c.addi       ra, -1
                  or           s5, a6, gp
                  or           a6, a1, s5
                  srli         t1, s10, 24
                  ori          tp, s10, 939
                  sltiu        t5, s3, -22
                  or           s8, s11, s3
                  xori         s9, s2, -562
                  xori         s1, t3, -1689
                  c.slli       ra, 12
                  c.slli       a3, 30
                  csrrwi       s5, 0x340, 3
                  sll          t5, s5, s8
                  csrrc        a0, 0x340, tp
                  divu         a1, t1, t0
                  c.mv         s5, t1
                  c.or         a2, a2
                  c.nop
                  lui          s4, 168311
                  slt          tp, t1, s5
                  srli         s8, s9, 28
                  sub          a2, s5, t4
                  sra          s2, s7, s11
                  c.addi4spn   a4, sp, 848
                  remu         sp, ra, s11
                  div          s4, tp, s11
                  c.sub        a1, a5
                  c.xor        a4, a5
                  add          sp, tp, a0
                  c.sub        a2, s0
                  mulhu        tp, tp, s2
                  auipc        gp, 99
                  c.mv         s2, sp
                  srl          s7, t3, s4
                  srli         t0, s8, 14
                  c.mv         a1, s7
                  srl          s11, zero, tp
                  or           s8, t4, s3
                  srai         s9, a6, 21
                  mul          s11, a6, a3
                  add          t6, s10, tp
                  c.add        s11, t0
                  xor          s0, s8, tp
                  sra          s1, s2, zero
                  srl          s6, s7, sp
                  and          s9, a1, s3
                  auipc        t1, 98188
                  c.addi       s8, 31
                  c.addi16sp   sp, 400
                  csrrwi       t0, 0x340, 30
                  rem          s2, s0, t4
                  c.srli       a2, 3
                  sub          s8, t2, ra
                  rem          s10, s5, s3
                  sltiu        t5, s8, 1011
                  c.slli       s9, 8
                  srl          s11, a5, t4
                  c.addi       ra, -1
                  srli         s9, ra, 0
                  c.nop
                  auipc        a2, 926312
                  c.lui        s10, 30
                  xor          t0, s6, s6
                  sub          zero, a1, t1
                  c.addi4spn   s0, sp, 576
                  c.li         t4, -1
                  csrrc        a4, 0x340, a6
                  c.srli       a3, 8
                  xor          s8, a5, a0
                  c.srai       a3, 29
                  ori          a4, a7, 452
                  slli         s9, gp, 29
                  xor          s10, t2, sp
                  slti         s5, t0, -1765
                  rem          a0, s5, s11
                  c.srli       a3, 24
                  csrrc        s6, 0x340, zero
                  c.addi4spn   s1, sp, 864
                  c.li         s4, -1
                  c.addi4spn   a3, sp, 976
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
                  li x4, 0x8ffffffc
                  li x26, 0xd
                  slli x26, x26, 8
                  addi x26, x26, 0x0
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x342
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x342
                  sw x26, 0(x4)
                  csrr  x26, 0x341
                  addi  x26, x26, 4
                  csrw  0x341, x26
                  add x28, x15, zero
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
                  add x15, x28, zero
                  lw  x28, (x15)
                  addi x15, x15, 4
                  mret

illegal_instr_handler:
                  li x4, 0x8ffffffc
                  li x26, 0xa
                  slli x26, x26, 8
                  addi x26, x26, 0x0
                  sw x26, 0(x4)
                  li x4, 0x8ffffffc
                  li x26, 0x342
                  slli x26, x26, 8
                  addi x26, x26, 0x3
                  sw x26, 0(x4)
                  csrr x26, 0x342
                  sw x26, 0(x4)
                  csrr  x26, 0x341
                  addi  x26, x26, 4
                  csrw  0x341, x26
                  add x28, x15, zero
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
                  add x15, x28, zero
                  lw  x28, (x15)
                  addi x15, x15, 4
                  mret

pt_fault_handler: 
                  li x4, 0x8ffffffc
                  li x26, 0x8
                  slli x26, x26, 8
                  addi x26, x26, 0x0
                  sw x26, 0(x4)
                  nop

.align 2
mmode_intr_handler:
                  csrr  x26, 0x300 # MSTATUS;
                  csrr  x26, 0x304 # MIE;
                  csrr  x26, 0x344 # MIP;
                  csrrc x26, 0x344, x26 # MIP;
                  li x4, 0x8ffffffc
                  li x26, 0x7
                  slli x26, x26, 8
                  addi x26, x26, 0x0
                  sw x26, 0(x4)
                  add x28, x15, zero
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
                  add x15, x28, zero
                  lw  x28, (x15)
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
