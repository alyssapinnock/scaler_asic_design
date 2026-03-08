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
                  li x11, 0x40001106
                  csrw 0x301, x11
kernel_sp:        
                  la x7, kernel_stack_end

trap_vec_init:    
                  la x11, mtvec_handler
                  ori x11, x11, 1
                  csrw 0x305, x11 # MTVEC

pmp_setup:        
                  csrwi 0x747, 4
                  la x2, main
                  li x11, 0x0
                  add x2, x2, x11
                  srli x2, x2, 2
                  csrw 0x3b0, x2
                  la x2, main
                  li x11, 0x11111111
                  add x2, x2, x11
                  srli x2, x2, 2
                  csrw 0x3b1, x2
                  la x2, main
                  li x11, 0x22222222
                  add x2, x2, x11
                  srli x2, x2, 2
                  csrw 0x3b2, x2
                  la x2, main
                  li x11, 0x33333333
                  add x2, x2, x11
                  srli x2, x2, 2
                  csrw 0x3b3, x2
                  li x2, 0xf0f0f0f
                  csrw 0x3a0, x2
                  la x2, main
                  li x11, 0x44444444
                  add x2, x2, x11
                  srli x2, x2, 2
                  csrw 0x3b4, x2
                  la x2, main
                  li x11, 0x55555555
                  add x2, x2, x11
                  srli x2, x2, 2
                  csrw 0x3b5, x2
                  la x2, main
                  li x11, 0x66666666
                  add x2, x2, x11
                  srli x2, x2, 2
                  csrw 0x3b6, x2
                  la x2, main
                  li x11, 0x77777777
                  add x2, x2, x11
                  srli x2, x2, 2
                  csrw 0x3b7, x2
                  li x2, 0xf0f0f0f
                  csrw 0x3a1, x2
                  la x2, main
                  li x11, 0x88888888
                  add x2, x2, x11
                  srli x2, x2, 2
                  csrw 0x3b8, x2
                  la x2, main
                  li x11, 0x99999999
                  add x2, x2, x11
                  srli x2, x2, 2
                  csrw 0x3b9, x2
                  la x2, main
                  li x11, 0xaaaaaaaa
                  add x2, x2, x11
                  srli x2, x2, 2
                  csrw 0x3ba, x2
                  la x2, main
                  li x11, 0xbbbbbbbb
                  add x2, x2, x11
                  srli x2, x2, 2
                  csrw 0x3bb, x2
                  li x2, 0xf0f0f0f
                  csrw 0x3a2, x2
                  la x2, main
                  li x11, 0xcccccccc
                  add x2, x2, x11
                  srli x2, x2, 2
                  csrw 0x3bc, x2
                  la x2, main
                  li x11, 0xdddddddd
                  add x2, x2, x11
                  srli x2, x2, 2
                  csrw 0x3bd, x2
                  la x2, main
                  li x11, 0xeeeeeeee
                  add x2, x2, x11
                  srli x2, x2, 2
                  csrw 0x3be, x2
                  la x2, main
                  li x11, 0xffffffff
                  add x2, x2, x11
                  srli x2, x2, 2
                  csrw 0x3bf, x2
                  li x2, 0xf0f0f0f
                  csrw 0x3a3, x2

mepc_setup:       
                  la x11, init
                  csrw 0x341, x11

custom_csr_setup: 
                  csrwi 0x7c0, 1

init_machine_mode:
                  li x11, 0x1800
                  csrw 0x300, x11 # MSTATUS
                  li x11, 0x0
                  csrw 0x304, x11 # MIE
                  li x27, 0x8ffffffc
                  li x11, 0x300
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x300
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x304
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x304
                  sw x11, 0(x27)
                  mret
init:             
                  li x0, 0x11c83145
                  li x1, 0x0
                  li x2, 0x0
                  li x3, 0x80000000
                  li x4, 0x96d77057
                  li x5, 0x80000000
                  li x6, 0xf29f2984
                  li x8, 0xa
                  li x9, 0xf58d1855
                  li x10, 0xf1ac4965
                  li x11, 0x0
                  li x12, 0xa
                  li x13, 0xf
                  li x14, 0x40f0bd54
                  li x15, 0xf4443f65
                  li x17, 0xc61f705b
                  li x18, 0x0
                  li x19, 0x80000000
                  li x20, 0x4187dfb4
                  li x21, 0x80000000
                  li x22, 0xf0587b37
                  li x23, 0x80000000
                  li x24, 0x7
                  li x25, 0xff744b2e
                  li x26, 0xf57aa35a
                  li x27, 0xf2c3b60a
                  li x28, 0x9
                  li x29, 0xc
                  li x30, 0x8
                  li x31, 0x80000000
                  la x16, user_stack_end
                  li x27, 0x8ffffffc
                  li x11, 0x0
                  slli x11, x11, 8
                  addi x11, x11, 0x0
                  sw x11, 0(x27)
                  j main
test_done:        
                  li x27, 0x8ffffff8
                  li x11, 0x0
                  slli x11, x11, 8
                  addi x11, x11, 0x1
                  sw x11, 0(x27)
                  ecall

test_fail:        
                  li x27, 0x8ffffff8
                  li x11, 0x1
                  slli x11, x11, 8
                  addi x11, x11, 0x1
                  sw x11, 0(x27)
                  ecall

mmode_intr_vector_1:
                  addi x7, x7, -4
                  sw  x16, (x7)
                  add x16, x7, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x7, x16, zero
                  li x27, 0x8ffffffc
                  li x11, 0x6
                  slli x11, x11, 8
                  addi x11, x11, 0x0
                  sw x11, 0(x27)
                  csrr x11, 0x342 # MCAUSE
                  srli x11, x11, 0x1f
                  beqz x11, 1f
                  li x27, 0x8ffffffc
                  li x11, 0x300
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x300
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x342
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x342
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x304
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x304
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x344
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x344
                  sw x11, 0(x27)
                  j mmode_intr_handler
                  1: la x2, test_done
                  jalr x0, x2, 0

mmode_intr_vector_2:
                  addi x7, x7, -4
                  sw  x16, (x7)
                  add x16, x7, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x7, x16, zero
                  li x27, 0x8ffffffc
                  li x11, 0x6
                  slli x11, x11, 8
                  addi x11, x11, 0x0
                  sw x11, 0(x27)
                  csrr x11, 0x342 # MCAUSE
                  srli x11, x11, 0x1f
                  beqz x11, 1f
                  li x27, 0x8ffffffc
                  li x11, 0x300
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x300
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x342
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x342
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x304
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x304
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x344
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x344
                  sw x11, 0(x27)
                  j mmode_intr_handler
                  1: la x2, test_done
                  jalr x0, x2, 0

mmode_intr_vector_3:
                  addi x7, x7, -4
                  sw  x16, (x7)
                  add x16, x7, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x7, x16, zero
                  li x27, 0x8ffffffc
                  li x11, 0x6
                  slli x11, x11, 8
                  addi x11, x11, 0x0
                  sw x11, 0(x27)
                  csrr x11, 0x342 # MCAUSE
                  srli x11, x11, 0x1f
                  beqz x11, 1f
                  li x27, 0x8ffffffc
                  li x11, 0x300
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x300
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x342
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x342
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x304
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x304
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x344
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x344
                  sw x11, 0(x27)
                  j mmode_intr_handler
                  1: la x2, test_done
                  jalr x0, x2, 0

mmode_intr_vector_4:
                  addi x7, x7, -4
                  sw  x16, (x7)
                  add x16, x7, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x7, x16, zero
                  li x27, 0x8ffffffc
                  li x11, 0x6
                  slli x11, x11, 8
                  addi x11, x11, 0x0
                  sw x11, 0(x27)
                  csrr x11, 0x342 # MCAUSE
                  srli x11, x11, 0x1f
                  beqz x11, 1f
                  li x27, 0x8ffffffc
                  li x11, 0x300
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x300
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x342
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x342
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x304
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x304
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x344
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x344
                  sw x11, 0(x27)
                  j mmode_intr_handler
                  1: la x2, test_done
                  jalr x0, x2, 0

mmode_intr_vector_5:
                  addi x7, x7, -4
                  sw  x16, (x7)
                  add x16, x7, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x7, x16, zero
                  li x27, 0x8ffffffc
                  li x11, 0x6
                  slli x11, x11, 8
                  addi x11, x11, 0x0
                  sw x11, 0(x27)
                  csrr x11, 0x342 # MCAUSE
                  srli x11, x11, 0x1f
                  beqz x11, 1f
                  li x27, 0x8ffffffc
                  li x11, 0x300
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x300
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x342
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x342
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x304
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x304
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x344
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x344
                  sw x11, 0(x27)
                  j mmode_intr_handler
                  1: la x2, test_done
                  jalr x0, x2, 0

mmode_intr_vector_6:
                  addi x7, x7, -4
                  sw  x16, (x7)
                  add x16, x7, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x7, x16, zero
                  li x27, 0x8ffffffc
                  li x11, 0x6
                  slli x11, x11, 8
                  addi x11, x11, 0x0
                  sw x11, 0(x27)
                  csrr x11, 0x342 # MCAUSE
                  srli x11, x11, 0x1f
                  beqz x11, 1f
                  li x27, 0x8ffffffc
                  li x11, 0x300
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x300
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x342
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x342
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x304
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x304
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x344
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x344
                  sw x11, 0(x27)
                  j mmode_intr_handler
                  1: la x2, test_done
                  jalr x0, x2, 0

mmode_intr_vector_7:
                  addi x7, x7, -4
                  sw  x16, (x7)
                  add x16, x7, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x7, x16, zero
                  li x27, 0x8ffffffc
                  li x11, 0x6
                  slli x11, x11, 8
                  addi x11, x11, 0x0
                  sw x11, 0(x27)
                  csrr x11, 0x342 # MCAUSE
                  srli x11, x11, 0x1f
                  beqz x11, 1f
                  li x27, 0x8ffffffc
                  li x11, 0x300
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x300
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x342
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x342
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x304
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x304
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x344
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x344
                  sw x11, 0(x27)
                  j mmode_intr_handler
                  1: la x2, test_done
                  jalr x0, x2, 0

mmode_intr_vector_8:
                  addi x7, x7, -4
                  sw  x16, (x7)
                  add x16, x7, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x7, x16, zero
                  li x27, 0x8ffffffc
                  li x11, 0x6
                  slli x11, x11, 8
                  addi x11, x11, 0x0
                  sw x11, 0(x27)
                  csrr x11, 0x342 # MCAUSE
                  srli x11, x11, 0x1f
                  beqz x11, 1f
                  li x27, 0x8ffffffc
                  li x11, 0x300
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x300
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x342
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x342
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x304
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x304
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x344
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x344
                  sw x11, 0(x27)
                  j mmode_intr_handler
                  1: la x2, test_done
                  jalr x0, x2, 0

mmode_intr_vector_9:
                  addi x7, x7, -4
                  sw  x16, (x7)
                  add x16, x7, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x7, x16, zero
                  li x27, 0x8ffffffc
                  li x11, 0x6
                  slli x11, x11, 8
                  addi x11, x11, 0x0
                  sw x11, 0(x27)
                  csrr x11, 0x342 # MCAUSE
                  srli x11, x11, 0x1f
                  beqz x11, 1f
                  li x27, 0x8ffffffc
                  li x11, 0x300
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x300
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x342
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x342
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x304
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x304
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x344
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x344
                  sw x11, 0(x27)
                  j mmode_intr_handler
                  1: la x2, test_done
                  jalr x0, x2, 0

mmode_intr_vector_10:
                  addi x7, x7, -4
                  sw  x16, (x7)
                  add x16, x7, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x7, x16, zero
                  li x27, 0x8ffffffc
                  li x11, 0x6
                  slli x11, x11, 8
                  addi x11, x11, 0x0
                  sw x11, 0(x27)
                  csrr x11, 0x342 # MCAUSE
                  srli x11, x11, 0x1f
                  beqz x11, 1f
                  li x27, 0x8ffffffc
                  li x11, 0x300
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x300
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x342
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x342
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x304
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x304
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x344
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x344
                  sw x11, 0(x27)
                  j mmode_intr_handler
                  1: la x2, test_done
                  jalr x0, x2, 0

mmode_intr_vector_11:
                  addi x7, x7, -4
                  sw  x16, (x7)
                  add x16, x7, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x7, x16, zero
                  li x27, 0x8ffffffc
                  li x11, 0x6
                  slli x11, x11, 8
                  addi x11, x11, 0x0
                  sw x11, 0(x27)
                  csrr x11, 0x342 # MCAUSE
                  srli x11, x11, 0x1f
                  beqz x11, 1f
                  li x27, 0x8ffffffc
                  li x11, 0x300
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x300
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x342
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x342
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x304
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x304
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x344
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x344
                  sw x11, 0(x27)
                  j mmode_intr_handler
                  1: la x2, test_done
                  jalr x0, x2, 0

mmode_intr_vector_12:
                  addi x7, x7, -4
                  sw  x16, (x7)
                  add x16, x7, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x7, x16, zero
                  li x27, 0x8ffffffc
                  li x11, 0x6
                  slli x11, x11, 8
                  addi x11, x11, 0x0
                  sw x11, 0(x27)
                  csrr x11, 0x342 # MCAUSE
                  srli x11, x11, 0x1f
                  beqz x11, 1f
                  li x27, 0x8ffffffc
                  li x11, 0x300
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x300
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x342
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x342
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x304
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x304
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x344
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x344
                  sw x11, 0(x27)
                  j mmode_intr_handler
                  1: la x2, test_done
                  jalr x0, x2, 0

mmode_intr_vector_13:
                  addi x7, x7, -4
                  sw  x16, (x7)
                  add x16, x7, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x7, x16, zero
                  li x27, 0x8ffffffc
                  li x11, 0x6
                  slli x11, x11, 8
                  addi x11, x11, 0x0
                  sw x11, 0(x27)
                  csrr x11, 0x342 # MCAUSE
                  srli x11, x11, 0x1f
                  beqz x11, 1f
                  li x27, 0x8ffffffc
                  li x11, 0x300
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x300
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x342
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x342
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x304
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x304
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x344
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x344
                  sw x11, 0(x27)
                  j mmode_intr_handler
                  1: la x2, test_done
                  jalr x0, x2, 0

mmode_intr_vector_14:
                  addi x7, x7, -4
                  sw  x16, (x7)
                  add x16, x7, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x7, x16, zero
                  li x27, 0x8ffffffc
                  li x11, 0x6
                  slli x11, x11, 8
                  addi x11, x11, 0x0
                  sw x11, 0(x27)
                  csrr x11, 0x342 # MCAUSE
                  srli x11, x11, 0x1f
                  beqz x11, 1f
                  li x27, 0x8ffffffc
                  li x11, 0x300
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x300
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x342
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x342
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x304
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x304
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x344
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x344
                  sw x11, 0(x27)
                  j mmode_intr_handler
                  1: la x2, test_done
                  jalr x0, x2, 0

mmode_intr_vector_15:
                  addi x7, x7, -4
                  sw  x16, (x7)
                  add x16, x7, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x7, x16, zero
                  li x27, 0x8ffffffc
                  li x11, 0x6
                  slli x11, x11, 8
                  addi x11, x11, 0x0
                  sw x11, 0(x27)
                  csrr x11, 0x342 # MCAUSE
                  srli x11, x11, 0x1f
                  beqz x11, 1f
                  li x27, 0x8ffffffc
                  li x11, 0x300
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x300
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x342
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x342
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x304
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x304
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x344
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x344
                  sw x11, 0(x27)
                  j mmode_intr_handler
                  1: la x2, test_done
                  jalr x0, x2, 0

mmode_intr_vector_16:
                  addi x7, x7, -4
                  sw  x16, (x7)
                  add x16, x7, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x7, x16, zero
                  li x27, 0x8ffffffc
                  li x11, 0x6
                  slli x11, x11, 8
                  addi x11, x11, 0x0
                  sw x11, 0(x27)
                  csrr x11, 0x342 # MCAUSE
                  srli x11, x11, 0x1f
                  beqz x11, 1f
                  li x27, 0x8ffffffc
                  li x11, 0x300
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x300
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x342
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x342
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x304
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x304
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x344
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x344
                  sw x11, 0(x27)
                  j mmode_intr_handler
                  1: la x2, test_done
                  jalr x0, x2, 0

mmode_intr_vector_17:
                  addi x7, x7, -4
                  sw  x16, (x7)
                  add x16, x7, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x7, x16, zero
                  li x27, 0x8ffffffc
                  li x11, 0x6
                  slli x11, x11, 8
                  addi x11, x11, 0x0
                  sw x11, 0(x27)
                  csrr x11, 0x342 # MCAUSE
                  srli x11, x11, 0x1f
                  beqz x11, 1f
                  li x27, 0x8ffffffc
                  li x11, 0x300
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x300
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x342
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x342
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x304
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x304
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x344
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x344
                  sw x11, 0(x27)
                  j mmode_intr_handler
                  1: la x2, test_done
                  jalr x0, x2, 0

mmode_intr_vector_18:
                  addi x7, x7, -4
                  sw  x16, (x7)
                  add x16, x7, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x7, x16, zero
                  li x27, 0x8ffffffc
                  li x11, 0x6
                  slli x11, x11, 8
                  addi x11, x11, 0x0
                  sw x11, 0(x27)
                  csrr x11, 0x342 # MCAUSE
                  srli x11, x11, 0x1f
                  beqz x11, 1f
                  li x27, 0x8ffffffc
                  li x11, 0x300
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x300
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x342
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x342
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x304
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x304
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x344
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x344
                  sw x11, 0(x27)
                  j mmode_intr_handler
                  1: la x2, test_done
                  jalr x0, x2, 0

mmode_intr_vector_19:
                  addi x7, x7, -4
                  sw  x16, (x7)
                  add x16, x7, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x7, x16, zero
                  li x27, 0x8ffffffc
                  li x11, 0x6
                  slli x11, x11, 8
                  addi x11, x11, 0x0
                  sw x11, 0(x27)
                  csrr x11, 0x342 # MCAUSE
                  srli x11, x11, 0x1f
                  beqz x11, 1f
                  li x27, 0x8ffffffc
                  li x11, 0x300
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x300
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x342
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x342
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x304
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x304
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x344
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x344
                  sw x11, 0(x27)
                  j mmode_intr_handler
                  1: la x2, test_done
                  jalr x0, x2, 0

mmode_intr_vector_20:
                  addi x7, x7, -4
                  sw  x16, (x7)
                  add x16, x7, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x7, x16, zero
                  li x27, 0x8ffffffc
                  li x11, 0x6
                  slli x11, x11, 8
                  addi x11, x11, 0x0
                  sw x11, 0(x27)
                  csrr x11, 0x342 # MCAUSE
                  srli x11, x11, 0x1f
                  beqz x11, 1f
                  li x27, 0x8ffffffc
                  li x11, 0x300
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x300
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x342
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x342
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x304
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x304
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x344
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x344
                  sw x11, 0(x27)
                  j mmode_intr_handler
                  1: la x2, test_done
                  jalr x0, x2, 0

mmode_intr_vector_21:
                  addi x7, x7, -4
                  sw  x16, (x7)
                  add x16, x7, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x7, x16, zero
                  li x27, 0x8ffffffc
                  li x11, 0x6
                  slli x11, x11, 8
                  addi x11, x11, 0x0
                  sw x11, 0(x27)
                  csrr x11, 0x342 # MCAUSE
                  srli x11, x11, 0x1f
                  beqz x11, 1f
                  li x27, 0x8ffffffc
                  li x11, 0x300
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x300
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x342
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x342
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x304
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x304
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x344
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x344
                  sw x11, 0(x27)
                  j mmode_intr_handler
                  1: la x2, test_done
                  jalr x0, x2, 0

mmode_intr_vector_22:
                  addi x7, x7, -4
                  sw  x16, (x7)
                  add x16, x7, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x7, x16, zero
                  li x27, 0x8ffffffc
                  li x11, 0x6
                  slli x11, x11, 8
                  addi x11, x11, 0x0
                  sw x11, 0(x27)
                  csrr x11, 0x342 # MCAUSE
                  srli x11, x11, 0x1f
                  beqz x11, 1f
                  li x27, 0x8ffffffc
                  li x11, 0x300
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x300
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x342
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x342
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x304
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x304
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x344
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x344
                  sw x11, 0(x27)
                  j mmode_intr_handler
                  1: la x2, test_done
                  jalr x0, x2, 0

mmode_intr_vector_23:
                  addi x7, x7, -4
                  sw  x16, (x7)
                  add x16, x7, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x7, x16, zero
                  li x27, 0x8ffffffc
                  li x11, 0x6
                  slli x11, x11, 8
                  addi x11, x11, 0x0
                  sw x11, 0(x27)
                  csrr x11, 0x342 # MCAUSE
                  srli x11, x11, 0x1f
                  beqz x11, 1f
                  li x27, 0x8ffffffc
                  li x11, 0x300
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x300
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x342
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x342
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x304
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x304
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x344
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x344
                  sw x11, 0(x27)
                  j mmode_intr_handler
                  1: la x2, test_done
                  jalr x0, x2, 0

mmode_intr_vector_24:
                  addi x7, x7, -4
                  sw  x16, (x7)
                  add x16, x7, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x7, x16, zero
                  li x27, 0x8ffffffc
                  li x11, 0x6
                  slli x11, x11, 8
                  addi x11, x11, 0x0
                  sw x11, 0(x27)
                  csrr x11, 0x342 # MCAUSE
                  srli x11, x11, 0x1f
                  beqz x11, 1f
                  li x27, 0x8ffffffc
                  li x11, 0x300
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x300
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x342
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x342
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x304
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x304
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x344
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x344
                  sw x11, 0(x27)
                  j mmode_intr_handler
                  1: la x2, test_done
                  jalr x0, x2, 0

mmode_intr_vector_25:
                  addi x7, x7, -4
                  sw  x16, (x7)
                  add x16, x7, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x7, x16, zero
                  li x27, 0x8ffffffc
                  li x11, 0x6
                  slli x11, x11, 8
                  addi x11, x11, 0x0
                  sw x11, 0(x27)
                  csrr x11, 0x342 # MCAUSE
                  srli x11, x11, 0x1f
                  beqz x11, 1f
                  li x27, 0x8ffffffc
                  li x11, 0x300
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x300
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x342
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x342
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x304
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x304
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x344
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x344
                  sw x11, 0(x27)
                  j mmode_intr_handler
                  1: la x2, test_done
                  jalr x0, x2, 0

mmode_intr_vector_26:
                  addi x7, x7, -4
                  sw  x16, (x7)
                  add x16, x7, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x7, x16, zero
                  li x27, 0x8ffffffc
                  li x11, 0x6
                  slli x11, x11, 8
                  addi x11, x11, 0x0
                  sw x11, 0(x27)
                  csrr x11, 0x342 # MCAUSE
                  srli x11, x11, 0x1f
                  beqz x11, 1f
                  li x27, 0x8ffffffc
                  li x11, 0x300
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x300
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x342
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x342
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x304
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x304
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x344
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x344
                  sw x11, 0(x27)
                  j mmode_intr_handler
                  1: la x2, test_done
                  jalr x0, x2, 0

mmode_intr_vector_27:
                  addi x7, x7, -4
                  sw  x16, (x7)
                  add x16, x7, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x7, x16, zero
                  li x27, 0x8ffffffc
                  li x11, 0x6
                  slli x11, x11, 8
                  addi x11, x11, 0x0
                  sw x11, 0(x27)
                  csrr x11, 0x342 # MCAUSE
                  srli x11, x11, 0x1f
                  beqz x11, 1f
                  li x27, 0x8ffffffc
                  li x11, 0x300
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x300
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x342
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x342
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x304
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x304
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x344
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x344
                  sw x11, 0(x27)
                  j mmode_intr_handler
                  1: la x2, test_done
                  jalr x0, x2, 0

mmode_intr_vector_28:
                  addi x7, x7, -4
                  sw  x16, (x7)
                  add x16, x7, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x7, x16, zero
                  li x27, 0x8ffffffc
                  li x11, 0x6
                  slli x11, x11, 8
                  addi x11, x11, 0x0
                  sw x11, 0(x27)
                  csrr x11, 0x342 # MCAUSE
                  srli x11, x11, 0x1f
                  beqz x11, 1f
                  li x27, 0x8ffffffc
                  li x11, 0x300
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x300
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x342
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x342
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x304
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x304
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x344
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x344
                  sw x11, 0(x27)
                  j mmode_intr_handler
                  1: la x2, test_done
                  jalr x0, x2, 0

mmode_intr_vector_29:
                  addi x7, x7, -4
                  sw  x16, (x7)
                  add x16, x7, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x7, x16, zero
                  li x27, 0x8ffffffc
                  li x11, 0x6
                  slli x11, x11, 8
                  addi x11, x11, 0x0
                  sw x11, 0(x27)
                  csrr x11, 0x342 # MCAUSE
                  srli x11, x11, 0x1f
                  beqz x11, 1f
                  li x27, 0x8ffffffc
                  li x11, 0x300
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x300
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x342
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x342
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x304
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x304
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x344
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x344
                  sw x11, 0(x27)
                  j mmode_intr_handler
                  1: la x2, test_done
                  jalr x0, x2, 0

mmode_intr_vector_30:
                  addi x7, x7, -4
                  sw  x16, (x7)
                  add x16, x7, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x7, x16, zero
                  li x27, 0x8ffffffc
                  li x11, 0x6
                  slli x11, x11, 8
                  addi x11, x11, 0x0
                  sw x11, 0(x27)
                  csrr x11, 0x342 # MCAUSE
                  srli x11, x11, 0x1f
                  beqz x11, 1f
                  li x27, 0x8ffffffc
                  li x11, 0x300
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x300
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x342
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x342
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x304
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x304
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x344
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x344
                  sw x11, 0(x27)
                  j mmode_intr_handler
                  1: la x2, test_done
                  jalr x0, x2, 0

mmode_intr_vector_31:
                  addi x7, x7, -4
                  sw  x16, (x7)
                  add x16, x7, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x7, x16, zero
                  li x27, 0x8ffffffc
                  li x11, 0x6
                  slli x11, x11, 8
                  addi x11, x11, 0x0
                  sw x11, 0(x27)
                  csrr x11, 0x342 # MCAUSE
                  srli x11, x11, 0x1f
                  beqz x11, 1f
                  li x27, 0x8ffffffc
                  li x11, 0x300
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x300
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x342
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x342
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x304
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x304
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x344
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x344
                  sw x11, 0(x27)
                  j mmode_intr_handler
                  1: la x2, test_done
                  jalr x0, x2, 0

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
                  addi x7, x7, -4
                  sw  x16, (x7)
                  add x16, x7, zero
                  addi x16, x16, -128
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  add x7, x16, zero
                  li x27, 0x8ffffffc
                  li x11, 0x8
                  slli x11, x11, 8
                  addi x11, x11, 0x0
                  sw x11, 0(x27)
                  csrr x11, 0x341 # MEPC
                  csrr x11, 0x342 # MCAUSE
                  li x27, 0x3 # BREAKPOINT
                  beq x11, x27, ebreak_handler
                  li x27, 0x8 # ECALL_UMODE
                  beq x11, x27, ecall_handler
                  li x27, 0x9 # ECALL_SMODE
                  beq x11, x27, ecall_handler
                  li x27, 0xb # ECALL_MMODE
                  beq x11, x27, ecall_handler
                  li x27, 0x1
                  beq x11, x27, instr_fault_handler
                  li x27, 0x5
                  beq x11, x27, load_fault_handler
                  li x27, 0x7
                  beq x11, x27, store_fault_handler
                  li x27, 0xc
                  beq x11, x27, pt_fault_handler
                  li x27, 0xd
                  beq x11, x27, pt_fault_handler
                  li x27, 0xf
                  beq x11, x27, pt_fault_handler
                  li x27, 0x2 # ILLEGAL_INSTRUCTION
                  beq x11, x27, illegal_instr_handler
                  csrr x27, 0x343 # MTVAL
                  1: la x2, test_done
                  jalr x1, x2, 0

ecall_handler:    
                  li x27, 0x8ffffffc
                  li x11, 0xb00
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0xb00
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0xb80
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0xb80
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0xb03
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0xb03
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0xb83
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0xb83
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0xb04
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0xb04
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0xb84
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0xb84
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0xb05
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0xb05
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0xb85
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0xb85
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0xb06
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0xb06
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0xb86
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0xb86
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0xb07
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0xb07
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0xb87
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0xb87
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0xb08
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0xb08
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0xb88
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0xb88
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0xb09
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0xb09
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0xb89
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0xb89
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0xb0a
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0xb0a
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0xb8a
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0xb8a
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0xb0b
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0xb0b
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0xb8b
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0xb8b
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0xb0c
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0xb0c
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0xb8c
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0xb8c
                  sw x11, 0(x27)
                  la x11, _start
                  sw x0, 0(x11)
                  sw x1, 4(x11)
                  sw x2, 8(x11)
                  sw x3, 12(x11)
                  sw x4, 16(x11)
                  sw x5, 20(x11)
                  sw x6, 24(x11)
                  sw x7, 28(x11)
                  sw x8, 32(x11)
                  sw x9, 36(x11)
                  sw x10, 40(x11)
                  sw x11, 44(x11)
                  sw x12, 48(x11)
                  sw x13, 52(x11)
                  sw x14, 56(x11)
                  sw x15, 60(x11)
                  sw x16, 64(x11)
                  sw x17, 68(x11)
                  sw x18, 72(x11)
                  sw x19, 76(x11)
                  sw x20, 80(x11)
                  sw x21, 84(x11)
                  sw x22, 88(x11)
                  sw x23, 92(x11)
                  sw x24, 96(x11)
                  sw x25, 100(x11)
                  sw x26, 104(x11)
                  sw x27, 108(x11)
                  sw x28, 112(x11)
                  sw x29, 116(x11)
                  sw x30, 120(x11)
                  sw x31, 124(x11)
                  csrr  x11, 0x341
                  addi  x11, x11, 4
                  csrw  0x341, x11
                  mret

instr_fault_handler:
                  li x27, 0x8ffffffc
                  li x11, 0x9
                  slli x11, x11, 8
                  addi x11, x11, 0x0
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x342
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x342
                  sw x11, 0(x27)
                  li x11, 0
                  mv x29, x11
                  li x31, 0
                  0: mv x11, x29
                  mv x2, x11
                  li x2, 0
                  beq x11, x2, 1f
                  li x2, 1
                  beq x11, x2, 2f
                  li x2, 2
                  beq x11, x2, 3f
                  li x2, 3
                  beq x11, x2, 4f
                  li x2, 4
                  beq x11, x2, 5f
                  li x2, 5
                  beq x11, x2, 6f
                  li x2, 6
                  beq x11, x2, 7f
                  li x2, 7
                  beq x11, x2, 8f
                  li x2, 8
                  beq x11, x2, 9f
                  li x2, 9
                  beq x11, x2, 10f
                  li x2, 10
                  beq x11, x2, 11f
                  li x2, 11
                  beq x11, x2, 12f
                  li x2, 12
                  beq x11, x2, 13f
                  li x2, 13
                  beq x11, x2, 14f
                  li x2, 14
                  beq x11, x2, 15f
                  li x2, 15
                  beq x11, x2, 16f
                  1: csrr x27, 0x3b0
                  csrr x18, 0x3a0
                  j 17f
                  2: csrr x27, 0x3b1
                  csrr x18, 0x3a0
                  j 17f
                  3: csrr x27, 0x3b2
                  csrr x18, 0x3a0
                  j 17f
                  4: csrr x27, 0x3b3
                  csrr x18, 0x3a0
                  j 17f
                  5: csrr x27, 0x3b4
                  csrr x18, 0x3a1
                  j 17f
                  6: csrr x27, 0x3b5
                  csrr x18, 0x3a1
                  j 17f
                  7: csrr x27, 0x3b6
                  csrr x18, 0x3a1
                  j 17f
                  8: csrr x27, 0x3b7
                  csrr x18, 0x3a1
                  j 17f
                  9: csrr x27, 0x3b8
                  csrr x18, 0x3a2
                  j 17f
                  10: csrr x27, 0x3b9
                  csrr x18, 0x3a2
                  j 17f
                  11: csrr x27, 0x3ba
                  csrr x18, 0x3a2
                  j 17f
                  12: csrr x27, 0x3bb
                  csrr x18, 0x3a2
                  j 17f
                  13: csrr x27, 0x3bc
                  csrr x18, 0x3a3
                  j 17f
                  14: csrr x27, 0x3bd
                  csrr x18, 0x3a3
                  j 17f
                  15: csrr x27, 0x3be
                  csrr x18, 0x3a3
                  j 17f
                  16: csrr x27, 0x3bf
                  csrr x18, 0x3a3
                  j 17f
                  17: li x22, 4
                  slli x11, x29, 30
                  srli x11, x11, 30
                  sub x2, x22, x11
                  addi x2, x2, -1
                  slli x2, x2, 3
                  sll x22, x18, x2
                  slli x11, x11, 3
                  add x2, x2, x11
                  srl x22, x22, x2
                  slli x2, x22, 27
                  srli x2, x2, 30
                  beqz x2, 20f
                  li x11, 1
                  beq x2, x11, 21f
                  li x11, 2
                  beq x2, x11, 24f
                  li x11, 3
                  beq x2, x11, 25f
                  la x11, test_done
                  jalr x0, x11, 0
                  18: mv x11, x29
                  mv x31, x27
                  addi x11, x11, 1
                  mv x29, x11
                  li x27, 16
                  ble x27, x11, 19f
                  j 0b
                  19: csrr x11, 0x747
                  andi x11, x11, 2
                  bnez x11, 27f
                  la x11, test_done
                  jalr x0, x11, 0
                  20: j 18b
                  21: mv x11, x29
                  csrr x2, 0x343
                  srli x2, x2, 2
                  bnez x11, 22f
                  bltz x2, 18b
                  j 23f
                  22: bgtu x31, x2, 18b
                  23: bleu x27, x2, 18b
                  j 26f
                  24: csrr x11, 0x343
                  srli x11, x11, 2
                  slli x2, x27, 2
                  srli x2, x2, 2
                  bne x11, x2, 18b
                  j 26f
                  25: csrr x11, 0x343
                  srli x11, x11, 2
                  srli x11, x11, 0
                  slli x11, x11, 0
                  slli x2, x27, 2
                  srli x2, x2, 2
                  srli x2, x2, 0
                  slli x2, x2, 0
                  bne x11, x2, 18b
                  j 26f
                  26: csrr x2, 0x747
                  andi x2, x2, 1
                  bnez x2, 27f
                  andi x2, x22, 128
                  bnez x2, 27f
                  j 29f
                  27: la x11, test_done
                  jalr x0, x11, 0
                  29: ori x22, x22, 4
                  li x2, 30
                  sll x11, x29, x2
                  srl x11, x11, x2
                  slli x2, x11, 3
                  sll x22, x22, x2
                  or x18, x18, x22
                  mv x11, x29
                  srli x11, x11, 2
                  beqz x11, 30f
                  li x2, 1
                  beq x11, x2, 31f
                  li x2, 2
                  beq x11, x2, 32f
                  li x2, 3
                  beq x11, x2, 33f
                  30: csrw 0x3a0, x18
                  j 34f
                  31: csrw 0x3a1, x18
                  j 34f
                  32: csrw 0x3a2, x18
                  j 34f
                  33: csrw 0x3a3, x18
                  34: nop
                  add x16, x7, zero
                  lw  x1, 4(x16)
                  lw  x2, 8(x16)
                  lw  x3, 12(x16)
                  lw  x4, 16(x16)
                  lw  x5, 20(x16)
                  lw  x6, 24(x16)
                  lw  x7, 28(x16)
                  lw  x8, 32(x16)
                  lw  x9, 36(x16)
                  lw  x10, 40(x16)
                  lw  x11, 44(x16)
                  lw  x12, 48(x16)
                  lw  x13, 52(x16)
                  lw  x14, 56(x16)
                  lw  x15, 60(x16)
                  lw  x16, 64(x16)
                  lw  x17, 68(x16)
                  lw  x18, 72(x16)
                  lw  x19, 76(x16)
                  lw  x20, 80(x16)
                  lw  x21, 84(x16)
                  lw  x22, 88(x16)
                  lw  x23, 92(x16)
                  lw  x24, 96(x16)
                  lw  x25, 100(x16)
                  lw  x26, 104(x16)
                  lw  x27, 108(x16)
                  lw  x28, 112(x16)
                  lw  x29, 116(x16)
                  lw  x30, 120(x16)
                  lw  x31, 124(x16)
                  addi x16, x16, 128
                  add x7, x16, zero
                  lw  x16, (x7)
                  addi x7, x7, 4
                  mret

load_fault_handler:
                  li x27, 0x8ffffffc
                  li x11, 0xb
                  slli x11, x11, 8
                  addi x11, x11, 0x0
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x342
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x342
                  sw x11, 0(x27)
                  li x11, 0
                  mv x29, x11
                  li x31, 0
                  0: mv x11, x29
                  mv x2, x11
                  li x2, 0
                  beq x11, x2, 1f
                  li x2, 1
                  beq x11, x2, 2f
                  li x2, 2
                  beq x11, x2, 3f
                  li x2, 3
                  beq x11, x2, 4f
                  li x2, 4
                  beq x11, x2, 5f
                  li x2, 5
                  beq x11, x2, 6f
                  li x2, 6
                  beq x11, x2, 7f
                  li x2, 7
                  beq x11, x2, 8f
                  li x2, 8
                  beq x11, x2, 9f
                  li x2, 9
                  beq x11, x2, 10f
                  li x2, 10
                  beq x11, x2, 11f
                  li x2, 11
                  beq x11, x2, 12f
                  li x2, 12
                  beq x11, x2, 13f
                  li x2, 13
                  beq x11, x2, 14f
                  li x2, 14
                  beq x11, x2, 15f
                  li x2, 15
                  beq x11, x2, 16f
                  1: csrr x27, 0x3b0
                  csrr x18, 0x3a0
                  j 17f
                  2: csrr x27, 0x3b1
                  csrr x18, 0x3a0
                  j 17f
                  3: csrr x27, 0x3b2
                  csrr x18, 0x3a0
                  j 17f
                  4: csrr x27, 0x3b3
                  csrr x18, 0x3a0
                  j 17f
                  5: csrr x27, 0x3b4
                  csrr x18, 0x3a1
                  j 17f
                  6: csrr x27, 0x3b5
                  csrr x18, 0x3a1
                  j 17f
                  7: csrr x27, 0x3b6
                  csrr x18, 0x3a1
                  j 17f
                  8: csrr x27, 0x3b7
                  csrr x18, 0x3a1
                  j 17f
                  9: csrr x27, 0x3b8
                  csrr x18, 0x3a2
                  j 17f
                  10: csrr x27, 0x3b9
                  csrr x18, 0x3a2
                  j 17f
                  11: csrr x27, 0x3ba
                  csrr x18, 0x3a2
                  j 17f
                  12: csrr x27, 0x3bb
                  csrr x18, 0x3a2
                  j 17f
                  13: csrr x27, 0x3bc
                  csrr x18, 0x3a3
                  j 17f
                  14: csrr x27, 0x3bd
                  csrr x18, 0x3a3
                  j 17f
                  15: csrr x27, 0x3be
                  csrr x18, 0x3a3
                  j 17f
                  16: csrr x27, 0x3bf
                  csrr x18, 0x3a3
                  j 17f
                  17: li x22, 4
                  slli x11, x29, 30
                  srli x11, x11, 30
                  sub x2, x22, x11
                  addi x2, x2, -1
                  slli x2, x2, 3
                  sll x22, x18, x2
                  slli x11, x11, 3
                  add x2, x2, x11
                  srl x22, x22, x2
                  slli x2, x22, 27
                  srli x2, x2, 30
                  beqz x2, 20f
                  li x11, 1
                  beq x2, x11, 21f
                  li x11, 2
                  beq x2, x11, 24f
                  li x11, 3
                  beq x2, x11, 25f
                  la x11, test_done
                  jalr x0, x11, 0
                  18: mv x11, x29
                  mv x31, x27
                  addi x11, x11, 1
                  mv x29, x11
                  li x27, 16
                  ble x27, x11, 19f
                  j 0b
                  19: csrr x11, 0x747
                  andi x11, x11, 2
                  bnez x11, 27f
                  la x11, test_done
                  jalr x0, x11, 0
                  20: j 18b
                  21: mv x11, x29
                  csrr x2, 0x343
                  srli x2, x2, 2
                  bnez x11, 22f
                  bltz x2, 18b
                  j 23f
                  22: bgtu x31, x2, 18b
                  23: bleu x27, x2, 18b
                  j 26f
                  24: csrr x11, 0x343
                  srli x11, x11, 2
                  slli x2, x27, 2
                  srli x2, x2, 2
                  bne x11, x2, 18b
                  j 26f
                  25: csrr x11, 0x343
                  srli x11, x11, 2
                  srli x11, x11, 0
                  slli x11, x11, 0
                  slli x2, x27, 2
                  srli x2, x2, 2
                  srli x2, x2, 0
                  slli x2, x2, 0
                  bne x11, x2, 18b
                  j 26f
                  26: csrr x2, 0x747
                  andi x2, x2, 1
                  bnez x2, 27f
                  andi x2, x22, 128
                  bnez x2, 27f
                  j 29f
                  27: csrr x11, 0x341
                  la x2, main
                  bge x11, x2, 40f
                  la x11, test_done
                  jalr x0, x11, 0
                  40: lw x11, 0(x11)
                  li x2, 3
                  and x11, x11, x2
                  beq x11, x2, 28f
                  csrr x11, 0x341
                  addi x11, x11, 2
                  csrw 0x341, x11
                  j 34f
                  28: csrr x11, 0x341
                  addi x11, x11, 4
                  csrw 0x341, x11
                  j 34f
                  29: ori x22, x22, 1
                  li x2, 30
                  sll x11, x29, x2
                  srl x11, x11, x2
                  slli x2, x11, 3
                  sll x22, x22, x2
                  or x18, x18, x22
                  mv x11, x29
                  srli x11, x11, 2
                  beqz x11, 30f
                  li x2, 1
                  beq x11, x2, 31f
                  li x2, 2
                  beq x11, x2, 32f
                  li x2, 3
                  beq x11, x2, 33f
                  30: csrw 0x3a0, x18
                  j 34f
                  31: csrw 0x3a1, x18
                  j 34f
                  32: csrw 0x3a2, x18
                  j 34f
                  33: csrw 0x3a3, x18
                  34: nop
                  add x16, x7, zero
                  lw  x1, 4(x16)
                  lw  x2, 8(x16)
                  lw  x3, 12(x16)
                  lw  x4, 16(x16)
                  lw  x5, 20(x16)
                  lw  x6, 24(x16)
                  lw  x7, 28(x16)
                  lw  x8, 32(x16)
                  lw  x9, 36(x16)
                  lw  x10, 40(x16)
                  lw  x11, 44(x16)
                  lw  x12, 48(x16)
                  lw  x13, 52(x16)
                  lw  x14, 56(x16)
                  lw  x15, 60(x16)
                  lw  x16, 64(x16)
                  lw  x17, 68(x16)
                  lw  x18, 72(x16)
                  lw  x19, 76(x16)
                  lw  x20, 80(x16)
                  lw  x21, 84(x16)
                  lw  x22, 88(x16)
                  lw  x23, 92(x16)
                  lw  x24, 96(x16)
                  lw  x25, 100(x16)
                  lw  x26, 104(x16)
                  lw  x27, 108(x16)
                  lw  x28, 112(x16)
                  lw  x29, 116(x16)
                  lw  x30, 120(x16)
                  lw  x31, 124(x16)
                  addi x16, x16, 128
                  add x7, x16, zero
                  lw  x16, (x7)
                  addi x7, x7, 4
                  mret

store_fault_handler:
                  li x27, 0x8ffffffc
                  li x11, 0xc
                  slli x11, x11, 8
                  addi x11, x11, 0x0
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x342
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x342
                  sw x11, 0(x27)
                  li x11, 0
                  mv x29, x11
                  li x31, 0
                  0: mv x11, x29
                  mv x2, x11
                  li x2, 0
                  beq x11, x2, 1f
                  li x2, 1
                  beq x11, x2, 2f
                  li x2, 2
                  beq x11, x2, 3f
                  li x2, 3
                  beq x11, x2, 4f
                  li x2, 4
                  beq x11, x2, 5f
                  li x2, 5
                  beq x11, x2, 6f
                  li x2, 6
                  beq x11, x2, 7f
                  li x2, 7
                  beq x11, x2, 8f
                  li x2, 8
                  beq x11, x2, 9f
                  li x2, 9
                  beq x11, x2, 10f
                  li x2, 10
                  beq x11, x2, 11f
                  li x2, 11
                  beq x11, x2, 12f
                  li x2, 12
                  beq x11, x2, 13f
                  li x2, 13
                  beq x11, x2, 14f
                  li x2, 14
                  beq x11, x2, 15f
                  li x2, 15
                  beq x11, x2, 16f
                  1: csrr x27, 0x3b0
                  csrr x18, 0x3a0
                  j 17f
                  2: csrr x27, 0x3b1
                  csrr x18, 0x3a0
                  j 17f
                  3: csrr x27, 0x3b2
                  csrr x18, 0x3a0
                  j 17f
                  4: csrr x27, 0x3b3
                  csrr x18, 0x3a0
                  j 17f
                  5: csrr x27, 0x3b4
                  csrr x18, 0x3a1
                  j 17f
                  6: csrr x27, 0x3b5
                  csrr x18, 0x3a1
                  j 17f
                  7: csrr x27, 0x3b6
                  csrr x18, 0x3a1
                  j 17f
                  8: csrr x27, 0x3b7
                  csrr x18, 0x3a1
                  j 17f
                  9: csrr x27, 0x3b8
                  csrr x18, 0x3a2
                  j 17f
                  10: csrr x27, 0x3b9
                  csrr x18, 0x3a2
                  j 17f
                  11: csrr x27, 0x3ba
                  csrr x18, 0x3a2
                  j 17f
                  12: csrr x27, 0x3bb
                  csrr x18, 0x3a2
                  j 17f
                  13: csrr x27, 0x3bc
                  csrr x18, 0x3a3
                  j 17f
                  14: csrr x27, 0x3bd
                  csrr x18, 0x3a3
                  j 17f
                  15: csrr x27, 0x3be
                  csrr x18, 0x3a3
                  j 17f
                  16: csrr x27, 0x3bf
                  csrr x18, 0x3a3
                  j 17f
                  17: li x22, 4
                  slli x11, x29, 30
                  srli x11, x11, 30
                  sub x2, x22, x11
                  addi x2, x2, -1
                  slli x2, x2, 3
                  sll x22, x18, x2
                  slli x11, x11, 3
                  add x2, x2, x11
                  srl x22, x22, x2
                  slli x2, x22, 27
                  srli x2, x2, 30
                  beqz x2, 20f
                  li x11, 1
                  beq x2, x11, 21f
                  li x11, 2
                  beq x2, x11, 24f
                  li x11, 3
                  beq x2, x11, 25f
                  la x11, test_done
                  jalr x0, x11, 0
                  18: mv x11, x29
                  mv x31, x27
                  addi x11, x11, 1
                  mv x29, x11
                  li x27, 16
                  ble x27, x11, 19f
                  j 0b
                  19: csrr x11, 0x747
                  andi x11, x11, 2
                  bnez x11, 27f
                  la x11, test_done
                  jalr x0, x11, 0
                  20: j 18b
                  21: mv x11, x29
                  csrr x2, 0x343
                  srli x2, x2, 2
                  bnez x11, 22f
                  bltz x2, 18b
                  j 23f
                  22: bgtu x31, x2, 18b
                  23: bleu x27, x2, 18b
                  j 26f
                  24: csrr x11, 0x343
                  srli x11, x11, 2
                  slli x2, x27, 2
                  srli x2, x2, 2
                  bne x11, x2, 18b
                  j 26f
                  25: csrr x11, 0x343
                  srli x11, x11, 2
                  srli x11, x11, 0
                  slli x11, x11, 0
                  slli x2, x27, 2
                  srli x2, x2, 2
                  srli x2, x2, 0
                  slli x2, x2, 0
                  bne x11, x2, 18b
                  j 26f
                  26: csrr x2, 0x747
                  andi x2, x2, 1
                  bnez x2, 27f
                  andi x2, x22, 128
                  bnez x2, 27f
                  j 29f
                  27: csrr x11, 0x341
                  lw x11, 0(x11)
                  li x2, 3
                  and x11, x11, x2
                  beq x11, x2, 28f
                  csrr x11, 0x341
                  addi x11, x11, 2
                  csrw 0x341, x11
                  j 34f
                  28: csrr x11, 0x341
                  addi x11, x11, 4
                  csrw 0x341, x11
                  j 34f
                  29: ori x22, x22, 3
                  li x2, 30
                  sll x11, x29, x2
                  srl x11, x11, x2
                  slli x2, x11, 3
                  sll x22, x22, x2
                  or x18, x18, x22
                  mv x11, x29
                  srli x11, x11, 2
                  beqz x11, 30f
                  li x2, 1
                  beq x11, x2, 31f
                  li x2, 2
                  beq x11, x2, 32f
                  li x2, 3
                  beq x11, x2, 33f
                  30: csrw 0x3a0, x18
                  j 34f
                  31: csrw 0x3a1, x18
                  j 34f
                  32: csrw 0x3a2, x18
                  j 34f
                  33: csrw 0x3a3, x18
                  34: nop
                  add x16, x7, zero
                  lw  x1, 4(x16)
                  lw  x2, 8(x16)
                  lw  x3, 12(x16)
                  lw  x4, 16(x16)
                  lw  x5, 20(x16)
                  lw  x6, 24(x16)
                  lw  x7, 28(x16)
                  lw  x8, 32(x16)
                  lw  x9, 36(x16)
                  lw  x10, 40(x16)
                  lw  x11, 44(x16)
                  lw  x12, 48(x16)
                  lw  x13, 52(x16)
                  lw  x14, 56(x16)
                  lw  x15, 60(x16)
                  lw  x16, 64(x16)
                  lw  x17, 68(x16)
                  lw  x18, 72(x16)
                  lw  x19, 76(x16)
                  lw  x20, 80(x16)
                  lw  x21, 84(x16)
                  lw  x22, 88(x16)
                  lw  x23, 92(x16)
                  lw  x24, 96(x16)
                  lw  x25, 100(x16)
                  lw  x26, 104(x16)
                  lw  x27, 108(x16)
                  lw  x28, 112(x16)
                  lw  x29, 116(x16)
                  lw  x30, 120(x16)
                  lw  x31, 124(x16)
                  addi x16, x16, 128
                  add x7, x16, zero
                  lw  x16, (x7)
                  addi x7, x7, 4
                  mret

.align 2
main:             mul          s5, a2, s6
                  srai         tp, t2, 14
                  c.sub        a4, a1
                  c.li         s0, -1
                  srli         t6, s7, 29
                  csrrci       s10, 0x340, 0
                  c.add        t1, gp
                  andi         ra, s1, -778
                  srai         s4, a6, 20
                  mul          s10, zero, t2
                  auipc        s3, 706302
                  c.or         s1, s0
                  csrrw        s6, 0x340, s0
                  c.addi       a0, -1
                  c.addi       gp, 24
                  add          a4, s11, t4
                  c.nop
                  slli         a7, gp, 28
                  div          s11, s4, s2
                  csrrci       t4, 0x340, 20
                  c.add        t4, t2
                  divu         gp, s7, s11
                  mulhsu       a4, t0, ra
                  or           a1, a2, s5
                  c.mv         s2, s11
                  ori          s6, s6, 2019
                  lui          s10, 287924
                  c.sub        a0, a5
                  sltu         t3, t3, s1
                  sll          tp, s5, s5
                  c.nop
                  csrrs        t1, 0x340, s6
                  xor          s6, a7, s1
                  sll          s6, ra, t1
                  csrrc        a1, 0x340, zero
                  xor          a2, a3, a6
                  c.srli       a0, 30
                  mulh         t4, s1, ra
                  csrrw        a5, 0x340, s0
                  sll          s0, a4, t1
                  c.srli       s1, 17
                  nop
                  div          t1, s3, s0
                  xori         s11, tp, 1753
                  c.mv         a7, s8
                  add          a1, s6, t0
                  xor          s11, t0, t6
                  c.mv         t6, t6
                  slti         gp, sp, 294
                  csrrs        t1, 0x340, s10
                  srl          a5, s2, a2
                  addi         tp, a2, -874
                  csrrc        s7, 0x340, s2
                  sltu         t0, a5, s5
                  c.sub        s0, a3
                  c.or         s0, s0
                  c.lui        a0, 27
                  srai         gp, a0, 19
                  rem          s8, s9, ra
                  c.slli       a5, 30
                  add          s4, a2, s8
                  div          s4, s0, gp
                  lui          a3, 615437
                  csrrw        s6, 0x340, s1
                  c.xor        a1, a4
                  c.srli       a2, 27
                  sub          zero, t5, s7
                  c.srli       a2, 13
                  slti         a7, t6, 473
                  sub          gp, a7, ra
                  add          t6, s7, a6
                  srai         s4, s5, 0
                  csrrwi       s0, 0x340, 28
                  c.li         s3, 20
                  ori          t3, a6, -1803
                  nop
                  srli         zero, a4, 21
                  srai         s6, s8, 8
                  slti         a0, s7, 1963
                  srai         a5, a0, 15
                  c.srli       a3, 17
                  divu         gp, gp, t6
                  srli         a7, a3, 19
                  div          a2, a7, t2
                  c.srai       a5, 15
                  or           s1, s8, s4
                  mulhu        s5, s1, s1
                  slt          s11, s0, a3
                  c.addi       t5, -1
                  c.li         gp, -1
                  sub          s5, s6, t0
                  srai         s6, a7, 5
                  sltiu        a4, s3, 1647
                  srai         s4, t2, 31
                  csrrs        s2, 0x340, zero
                  sub          t5, t2, s10
                  c.or         a5, s0
                  csrrs        s2, 0x340, t4
                  andi         a5, t1, -337
                  sub          a7, a1, a2
                  ori          s6, a4, 570
                  c.lui        s7, 28
                  c.addi       ra, -1
                  mulhu        a3, t2, a0
                  andi         a5, s0, 1605
                  add          s7, a7, s5
                  c.srai       a1, 6
                  mul          s5, gp, s5
                  c.srli       a3, 24
                  mulhu        t5, t2, s10
                  c.nop
                  mul          s10, s3, a6
                  or           s10, t4, a6
                  divu         a2, t1, s6
                  slli         s11, zero, 0
                  c.srai       s1, 17
                  mulhsu       s4, s1, a6
                  c.slli       ra, 27
                  csrrsi       a1, 0x340, 25
                  mulh         a2, t5, s10
                  mul          a0, s2, t5
                  csrrs        t5, 0x340, a3
                  csrrsi       ra, 0x340, 28
                  sll          zero, t1, sp
                  c.addi       a3, 1
                  add          t1, s8, t5
                  sltu         t4, s6, t2
                  lui          t0, 62927
                  nop
                  mulhu        s3, t0, t3
                  srai         s7, s1, 5
                  mul          s1, tp, a3
                  c.add        s4, s5
                  c.or         a2, a4
                  slti         a7, a3, -1899
                  c.sub        a3, a5
                  csrrsi       zero, 0x340, 0
                  srli         t4, a3, 1
                  c.srli       a1, 12
                  csrrci       s9, 0x340, 29
                  c.add        t0, gp
                  sub          s1, s4, a6
                  slli         t0, s0, 31
                  c.li         s1, -1
                  c.xor        s0, a1
                  sub          ra, t3, s3
                  sll          t0, t5, s4
                  auipc        t4, 8940
                  lui          t1, 359300
                  div          s3, t0, a3
                  mulh         s7, s3, zero
                  c.addi       s8, -1
                  c.sub        a0, a5
                  div          a0, a3, a7
                  c.add        s7, ra
                  ori          a5, tp, 128
                  c.xor        a3, a3
                  remu         a4, a2, t0
                  csrrwi       ra, 0x340, 4
                  mulhsu       a4, a2, a2
                  c.li         t6, 26
                  xor          a0, t3, s3
                  or           s5, a6, s7
                  remu         s10, s7, t1
                  auipc        s7, 794516
                  srai         tp, s4, 31
                  c.andi       a2, -1
                  sub          a0, t3, s9
                  remu         zero, t3, s5
                  mulh         t0, t3, t1
                  rem          t6, t6, s11
                  xor          t0, a2, t6
                  c.slli       t5, 16
                  sltu         t0, gp, s8
                  ori          a0, s5, 232
                  c.li         s3, 20
                  mul          a4, t6, t6
                  slli         a4, s11, 27
                  csrrsi       s3, 0x340, 1
                  slti         a2, a5, 1810
                  lui          tp, 586227
                  c.sub        a4, a5
                  c.srli       a1, 24
                  rem          t3, a7, t5
                  andi         gp, a7, -431
                  lui          zero, 621013
                  c.andi       a3, 22
                  nop
                  csrrwi       t0, 0x340, 27
                  sra          s10, t4, gp
                  sltiu        s4, ra, -2046
                  nop
                  mul          t5, t4, s7
                  or           t5, sp, sp
                  remu         s4, s1, t3
                  divu         ra, s7, t6
                  sub          t0, a3, a6
                  and          s6, s7, a4
                  csrrw        t6, 0x340, a5
                  c.li         s10, 24
                  and          s9, a4, t0
                  srli         t0, s5, 8
                  c.addi       a2, -1
                  xori         s4, a1, 1037
                  csrrw        a7, 0x340, t5
                  c.sub        a2, a2
                  nop
                  mul          a1, s9, s7
                  c.lui        s5, 27
                  nop
                  c.slli       a4, 17
                  xor          gp, s3, s2
                  c.xor        a4, a5
                  srai         s8, s4, 8
                  sll          tp, s6, t3
                  csrrw        zero, 0x340, a5
                  add          t5, t3, t3
                  mul          a3, a7, s7
                  slt          a2, s6, a6
                  mulhsu       s4, s4, a7
                  c.slli       t1, 27
                  csrrc        s3, 0x340, zero
                  c.nop
                  sub          a7, s3, t1
                  srli         t4, t0, 8
                  auipc        a4, 24609
                  srai         s6, t1, 14
                  csrrs        s0, 0x340, t5
                  csrrs        s7, 0x340, zero
                  add          s0, t0, s1
                  srai         t6, gp, 18
                  andi         s8, sp, 1135
                  c.or         a4, a1
                  sub          t3, s0, a6
                  c.and        a1, s1
                  mulhu        s3, s9, s2
                  mulhu        s0, a2, sp
                  csrrci       t3, 0x340, 3
                  c.xor        a2, a4
                  srai         a7, t6, 4
                  csrrc        t0, 0x340, a7
                  xor          s3, t6, t2
                  srli         s0, s7, 17
                  c.slli       s9, 14
                  sltiu        s2, t2, 618
                  auipc        s8, 662180
                  sltu         a7, s5, a1
                  addi         a3, zero, 305
                  c.nop
                  ori          t1, s11, 1907
                  xori         tp, s8, 85
                  c.mv         t0, s6
                  c.sub        a2, a3
                  c.nop
                  c.add        s4, a0
                  csrrw        s9, 0x340, t0
                  mul          a3, a2, tp
                  c.li         s7, 11
                  csrrwi       a4, 0x340, 16
                  slti         s0, a7, 460
                  mulh         t0, a7, t2
                  c.and        a0, a0
                  ori          ra, s6, -482
                  and          s4, a3, s7
                  c.sub        a1, a0
                  c.li         gp, 6
                  csrrs        s8, 0x340, zero
                  sltu         a2, ra, s11
                  slt          ra, s6, tp
                  c.addi       tp, -1
                  slli         a1, tp, 20
                  c.mv         a7, t0
                  c.add        ra, t6
                  csrrwi       s6, 0x340, 4
                  c.xor        a0, a4
                  csrrw        s3, 0x340, s4
                  c.addi       s9, 11
                  sltu         t5, s5, s0
                  c.slli       t4, 27
                  c.li         s11, 18
                  slli         s11, s3, 18
                  c.xor        a2, a2
                  csrrc        s8, 0x340, zero
                  sra          s8, t6, s7
                  sll          t3, a4, t3
                  c.srai       s1, 23
                  c.nop
                  csrrw        s7, 0x340, s7
                  c.xor        s1, s0
                  div          s5, t4, s2
                  and          t6, s1, tp
                  c.lui        s2, 19
                  srai         t4, t4, 2
                  c.srli       a3, 21
                  slli         t0, zero, 13
                  csrrsi       t4, 0x340, 8
                  xor          a7, s9, t1
                  csrrw        s3, 0x340, s3
                  nop
                  srai         s2, tp, 25
                  c.li         s11, -1
                  slti         t1, t3, -1900
                  c.xor        a5, s1
                  add          s1, t2, a6
                  c.mv         s9, s9
                  ori          t5, s5, 2036
                  or           s2, t3, s1
                  c.srli       a1, 28
                  csrrs        s0, 0x340, t1
                  mul          a1, s4, a7
                  and          t6, a6, a4
                  c.or         a3, a5
                  auipc        s8, 583307
                  c.srli       s0, 17
                  sltiu        s5, tp, -1132
                  mulhu        s3, s10, sp
                  csrrs        gp, 0x340, zero
                  slt          a4, s1, a0
                  mul          s10, s0, t5
                  sll          s4, t3, t2
                  sll          s3, a5, s0
                  c.nop
                  c.xor        a2, a5
                  auipc        tp, 442715
                  mulh         s10, s8, s0
                  andi         s6, s0, 1523
                  srl          s7, a1, t1
                  c.add        t0, a4
                  mulh         t1, a3, s0
                  mulhsu       s7, t4, s0
                  xori         t5, tp, 116
                  sra          s9, s10, a1
                  rem          a2, a5, s9
                  mulhu        a7, t5, s4
                  csrrw        s0, 0x340, a7
                  mulhsu       s5, s9, ra
                  csrrw        s8, 0x340, a0
                  remu         tp, t3, a3
                  slti         a5, s6, 1934
                  srai         t4, t1, 23
                  mulhsu       s7, t4, a7
                  c.nop
                  lui          a3, 942293
                  sltu         zero, zero, t0
                  divu         ra, s8, t0
                  ori          ra, s11, -355
                  and          t1, t4, a4
                  rem          s4, t5, s4
                  slli         t3, tp, 20
                  nop
                  andi         s5, a0, 1879
                  auipc        t6, 664120
                  nop
                  csrrsi       a7, 0x340, 0
                  mulhsu       t6, t0, gp
                  sra          s7, gp, t2
                  csrrc        a5, 0x340, zero
                  div          t6, sp, s6
                  divu         a1, s6, t3
                  mul          t3, a6, t1
                  xor          t6, t5, s9
                  c.srli       a5, 24
                  csrrc        s3, 0x340, s4
                  srl          a3, t2, s1
                  andi         s8, a2, 580
                  andi         gp, gp, -1622
                  slli         s3, s11, 18
                  c.srai       s0, 8
                  remu         s2, sp, s0
                  csrrs        t1, 0x340, gp
                  csrrci       t0, 0x340, 0
                  csrrs        t5, 0x340, zero
                  sub          s2, ra, t5
                  sltiu        tp, s7, -1455
                  lui          a7, 264324
                  csrrs        a3, 0x340, zero
                  c.andi       s1, 5
                  c.addi       t6, 29
                  c.andi       a1, 14
                  mulh         s2, a1, gp
                  div          t6, a5, s4
                  slt          s1, gp, s2
                  mul          a0, gp, a3
                  divu         tp, a7, s6
                  csrrc        s4, 0x340, zero
                  csrrsi       t1, 0x340, 26
                  csrrc        ra, 0x340, zero
                  csrrsi       s6, 0x340, 0
                  c.sub        a3, a3
                  mulhsu       a2, ra, s9
                  and          s5, s11, s1
                  sra          a5, s10, a5
                  c.xor        a2, a4
                  c.srli       a0, 18
                  sltiu        t6, a3, 161
                  andi         a5, a0, -1773
                  sra          t4, tp, t6
                  c.or         a5, a5
                  auipc        s1, 353694
                  c.andi       s0, -1
                  csrrc        a1, 0x340, zero
                  remu         ra, t3, s3
                  mulhu        t1, t3, a0
                  csrrci       a0, 0x340, 1
                  divu         t6, s2, ra
                  c.slli       s8, 28
                  c.mv         s3, s9
                  nop
                  csrrs        a7, 0x340, zero
                  c.li         a5, 13
                  c.or         a2, s1
                  sltu         s9, a6, s6
                  mulhu        s10, s5, t0
                  mulhsu       t1, a4, a3
                  c.andi       s1, 10
                  xor          a0, ra, zero
                  div          s8, t5, t1
                  c.nop
                  csrrwi       a7, 0x340, 20
                  csrrsi       a4, 0x340, 0
                  slti         t6, s8, 1337
                  mulh         s9, s6, a0
                  csrrs        tp, 0x340, t4
                  csrrwi       a1, 0x340, 12
                  c.or         a4, a4
                  csrrci       t5, 0x340, 0
                  remu         ra, t5, s8
                  and          a2, s2, s8
                  xori         zero, a3, 407
                  c.srli       s0, 30
                  auipc        t4, 99157
                  div          t0, s3, s2
                  auipc        a1, 319028
                  xori         a5, a3, 117
                  remu         t6, a3, sp
                  csrrw        s8, 0x340, ra
                  mulhsu       s10, t0, s4
                  c.mv         t5, t5
                  c.add        s9, t0
                  add          a1, a0, s9
                  c.or         a4, s0
                  csrrsi       t1, 0x340, 0
                  remu         a7, t5, t4
                  and          t5, s6, t0
                  xori         s5, a2, -1334
                  xori         a7, s6, -920
                  mul          a5, ra, a4
                  srl          t3, t6, s0
                  sltu         t4, t6, a7
                  mulhu        zero, t2, zero
                  rem          a4, s9, s2
                  xor          zero, t2, tp
                  slt          s1, s7, tp
                  divu         a1, t2, a7
                  c.addi       s10, 17
                  c.sub        a3, a5
                  nop
                  rem          s6, t2, t3
                  c.nop
                  csrrc        t3, 0x340, t3
                  mulhsu       t3, a5, tp
                  csrrw        t5, 0x340, s11
                  slli         gp, s4, 18
                  sltu         zero, s10, t3
                  srai         a4, a5, 13
                  c.lui        t1, 27
                  srli         a7, s0, 10
                  slli         t3, s3, 13
                  auipc        s10, 299045
                  slli         zero, t6, 7
                  csrrwi       t4, 0x340, 20
                  xori         s1, s5, 601
                  c.srai       s1, 18
                  c.or         a2, a2
                  divu         a2, a7, a0
                  csrrs        t3, 0x340, zero
                  sra          t3, a2, t3
                  slti         ra, s3, 1231
                  ori          a5, a6, 873
                  csrrci       ra, 0x340, 14
                  c.li         t0, -1
                  c.addi       s4, -1
                  c.nop
                  sltiu        s10, a6, -1889
                  srli         ra, zero, 21
                  c.addi       s8, -1
                  c.srai       a4, 18
                  andi         s8, a7, -1034
                  c.li         s2, -1
                  mulh         s6, t4, tp
                  c.and        s0, s0
                  c.andi       a0, 9
                  mulhu        s6, zero, t4
                  remu         t1, a5, s5
                  csrrw        ra, 0x340, s3
                  slli         gp, zero, 14
                  mulhu        s0, s3, a5
                  sltu         a4, s2, t3
                  csrrci       a4, 0x340, 13
                  c.add        s5, s11
                  add          s4, a2, t6
                  slli         s1, t3, 26
                  srli         s7, s0, 21
                  csrrci       gp, 0x340, 11
                  add          s7, a1, s9
                  sra          s2, a2, a1
                  c.li         t3, 13
                  c.and        a3, a0
                  ori          s1, s2, 985
                  csrrc        a4, 0x340, a7
                  csrrsi       t5, 0x340, 12
                  mulh         a0, s10, s8
                  rem          s8, s0, s11
                  lui          a2, 819961
                  andi         ra, a0, -241
                  divu         ra, tp, a5
                  andi         s1, s2, 44
                  divu         t6, s10, a4
                  csrrci       s5, 0x340, 19
                  c.sub        a2, a3
                  csrrci       a3, 0x340, 12
                  c.slli       s5, 30
                  c.slli       t5, 4
                  xori         t4, a2, -471
                  ori          t1, t4, 1959
                  remu         a1, s3, s4
                  c.xor        a3, a2
                  sra          s2, s3, t5
                  c.mv         a7, a3
                  sub          t5, a6, gp
                  c.or         a2, a0
                  xor          a7, sp, t5
                  c.nop
                  mul          s4, sp, s8
                  mulhu        s5, t5, ra
                  c.srli       s0, 26
                  nop
                  xor          a3, ra, s9
                  c.nop
                  mulhsu       gp, tp, t5
                  divu         t5, s4, a6
                  sltiu        t1, t1, -1388
                  c.add        s9, s1
                  nop
                  ori          s8, s10, 893
                  csrrw        s1, 0x340, s9
                  c.li         t5, -1
                  c.mv         ra, s2
                  c.or         a1, a0
                  c.nop
                  nop
                  c.srai       s0, 21
                  remu         a5, t3, a0
                  csrrs        s0, 0x340, zero
                  srli         a3, tp, 14
                  slt          s3, sp, t4
                  nop
                  lui          t0, 245128
                  andi         s0, a5, -99
                  c.lui        s6, 7
                  c.srli       a2, 1
                  auipc        a4, 58977
                  csrrw        a2, 0x340, s8
                  c.srli       s1, 11
                  nop
                  csrrsi       t0, 0x340, 13
                  sltiu        a1, s6, -1620
                  slli         t6, a4, 23
                  ori          t1, s10, -520
                  sltiu        t5, a3, 186
                  slti         t4, a1, -2022
                  c.nop
                  remu         s1, a4, s5
                  andi         s10, gp, -669
                  c.add        s10, s9
                  xori         t6, s0, -1067
                  srl          tp, s10, a1
                  c.or         a4, a4
                  srli         ra, sp, 2
                  sltu         t6, t4, s4
                  c.xor        a0, s1
                  c.add        s8, a5
                  csrrs        a2, 0x340, zero
                  nop
                  ori          s2, t1, -604
                  csrrw        a2, 0x340, s10
                  mulhu        t0, a0, s8
                  slt          tp, s6, ra
                  srai         a5, tp, 8
                  c.andi       a4, -1
                  c.sub        a4, a1
                  c.nop
                  xori         gp, a4, -789
                  srai         s1, a5, 0
                  add          a7, t1, s11
                  csrrw        a4, 0x340, t1
                  and          s1, a2, a5
                  sltu         t3, s1, t3
                  rem          s10, s8, a0
                  xor          s11, a7, s7
                  mulhu        zero, sp, t5
                  sltu         s8, t1, s5
                  mulh         a4, a7, s1
                  srai         s3, a5, 10
                  sub          s7, s1, s2
                  divu         t5, a1, s8
                  csrrs        t4, 0x340, zero
                  c.xor        a1, a2
                  slti         s5, t6, 624
                  mulh         s3, s1, a5
                  csrrci       t4, 0x340, 9
                  csrrc        a7, 0x340, zero
                  c.sub        a3, s1
                  csrrwi       t5, 0x340, 26
                  mulhu        s1, a5, t4
                  c.xor        s0, a4
                  c.andi       a5, -1
                  c.and        a4, s0
                  auipc        t1, 816865
                  xori         a4, tp, 406
                  c.srli       s1, 8
                  c.mv         s7, s5
                  and          a4, a1, s10
                  lui          a0, 698561
                  srai         t0, a4, 30
                  c.or         a1, s0
                  c.and        a4, s1
                  c.addi       s3, 27
                  slt          a2, s5, s9
                  csrrsi       s4, 0x340, 5
                  slt          t4, a2, s9
                  xor          a1, t2, a0
                  mulhsu       s5, s4, gp
                  c.nop
                  addi         s1, zero, 9
                  c.and        a5, a5
                  mul          t4, s11, sp
                  sra          a4, sp, s1
                  sltiu        s1, s5, -1715
                  srli         t5, s11, 28
                  mul          s1, a3, a0
                  nop
                  c.srli       s0, 10
                  csrrwi       s10, 0x340, 19
                  sltiu        s1, s11, -474
                  xor          a4, a1, s9
                  c.slli       a3, 13
                  and          s9, a3, s8
                  c.andi       a4, -1
                  csrrci       a3, 0x340, 0
                  div          t4, s5, a3
                  csrrci       t6, 0x340, 14
                  c.sub        a2, s0
                  add          s11, t5, ra
                  xori         s4, t5, 596
                  c.or         a4, a1
                  mulhsu       t5, s9, gp
                  or           s9, s4, s2
                  remu         s0, s10, s2
                  sra          t4, a7, s6
                  andi         s5, s11, 370
                  div          t4, a7, a2
                  lui          s10, 890586
                  andi         t6, s6, -1471
                  sltiu        a0, t4, -1553
                  c.sub        a2, s1
                  c.li         s5, 29
                  csrrs        s8, 0x340, zero
                  or           s7, a7, a2
                  csrrsi       ra, 0x340, 18
                  csrrc        s8, 0x340, zero
                  mulh         a2, t0, a3
                  csrrci       s0, 0x340, 0
                  c.addi       t0, -1
                  div          t5, s7, s10
                  xor          s5, s8, s0
                  xori         zero, sp, 1179
                  mulhsu       gp, a5, a2
                  sltiu        tp, t5, -1585
                  c.srli       s0, 11
                  sltiu        t1, t4, 998
                  mulhu        s8, a2, t5
                  sub          a4, a7, t6
                  csrrc        tp, 0x340, zero
                  nop
                  div          t3, a0, a0
                  ori          t4, s5, 346
                  mul          s0, t0, s3
                  srai         s10, t0, 21
                  and          s8, s10, zero
                  mulhu        t4, s3, a4
                  c.srai       a0, 21
                  csrrc        s6, 0x340, zero
                  xor          zero, s1, a6
                  srl          gp, s1, t4
                  andi         s0, a0, -528
                  srl          s7, sp, s3
                  mulhu        s7, s4, s9
                  and          a7, s7, s3
                  and          a4, t2, s4
                  c.nop
                  c.and        a4, a0
                  rem          s5, s1, a4
                  c.srai       s1, 2
                  addi         t3, a4, 432
                  srai         s7, gp, 10
                  div          a7, t0, s2
                  sll          a2, gp, sp
                  c.or         a1, a1
                  slti         t1, t0, 310
                  divu         s4, t6, s9
                  c.add        s1, s5
                  csrrw        s3, 0x340, a1
                  c.add        s9, s2
                  csrrw        s11, 0x340, a3
                  sub          t4, s2, t3
                  c.srli       s0, 2
                  srli         gp, t1, 15
                  csrrs        s2, 0x340, zero
                  slti         gp, t2, -1596
                  sltiu        s9, sp, -284
                  xori         a7, s5, 1777
                  remu         tp, s5, t6
                  sra          tp, ra, s7
                  csrrs        a2, 0x340, zero
                  ori          t4, t1, 299
                  sra          t4, s8, s6
                  csrrwi       s9, 0x340, 6
                  xori         t4, a0, -54
                  divu         s2, a7, ra
                  srli         a7, t0, 2
                  sltu         a5, s1, ra
                  xori         a3, a5, -1151
                  c.mv         a7, s1
                  csrrw        s0, 0x340, s6
                  c.xor        a0, s1
                  xor          s3, tp, a4
                  andi         a4, t0, -1697
                  c.srai       a1, 27
                  remu         s0, t3, a6
                  c.sub        s0, a1
                  lui          a1, 215178
                  ori          a7, t0, 1199
                  c.add        t5, t4
                  mulhsu       t0, s5, s1
                  c.and        s0, a1
                  slti         t6, gp, -239
                  andi         t6, t5, 396
                  mulhu        t6, s6, a4
                  c.xor        s0, a2
                  addi         s0, s0, -1816
                  divu         s5, a5, a6
                  c.lui        s0, 10
                  slt          a4, s10, s10
                  c.slli       s6, 2
                  c.nop
                  csrrwi       s1, 0x340, 14
                  c.and        a0, s1
                  addi         s10, a1, 155
                  mulhsu       t6, s2, s6
                  div          t0, s4, a4
                  mulhu        a1, a7, t1
                  ori          s6, s10, 1535
                  mulhsu       a3, s5, gp
                  rem          zero, gp, t2
                  c.xor        a3, a3
                  and          s7, s7, ra
                  c.addi       s4, 3
                  xori         a3, t0, 1890
                  csrrsi       a7, 0x340, 0
                  sra          t1, a1, s2
                  lui          s4, 933326
                  c.nop
                  srl          a1, gp, t5
                  c.nop
                  c.srli       a4, 14
                  sub          s6, t3, s9
                  csrrwi       s6, 0x340, 14
                  sra          s0, s0, a4
                  srl          s2, s2, s3
                  mulhu        a3, a5, s2
                  remu         gp, t6, s10
                  sltu         s1, zero, t5
                  c.andi       a4, -1
                  c.slli       a4, 8
                  c.and        a0, a4
                  lui          gp, 817089
                  add          s0, a4, s9
                  slti         a0, a2, -1430
                  c.xor        s1, a4
                  srl          t3, ra, a5
                  andi         s6, a1, 36
                  rem          s9, s5, t4
                  c.srai       s0, 13
                  srli         s6, a5, 14
                  remu         a7, t1, gp
                  sub          s5, a2, s9
                  div          s5, a1, s9
                  c.add        a5, s0
                  nop
                  divu         a7, a2, s4
                  xori         s1, a6, -452
                  add          s7, s6, tp
                  or           s4, gp, s0
                  slt          a2, t0, s0
                  sltu         t1, t6, a0
                  remu         t4, s2, s6
                  nop
                  rem          s9, s5, a2
                  csrrc        s10, 0x340, zero
                  csrrw        a5, 0x340, a3
                  sra          tp, sp, a5
                  xori         t3, a5, 238
                  c.or         a2, a2
                  remu         a5, s2, t2
                  auipc        s4, 946126
                  mulhsu       s6, s9, a7
                  remu         s11, t0, t4
                  csrrwi       tp, 0x340, 5
                  csrrwi       s0, 0x340, 0
                  or           a3, a3, t3
                  lui          s7, 792322
                  c.srli       a4, 1
                  srl          a7, t1, a0
                  sub          t1, gp, s11
                  divu         s6, s11, s8
                  and          t0, s9, s4
                  div          a7, t3, a1
                  c.mv         a5, s0
                  csrrci       s6, 0x340, 0
                  c.srli       a3, 8
                  csrrs        s10, 0x340, a5
                  c.addi       t1, -1
                  andi         t0, s11, -653
                  c.srai       a5, 7
                  mulh         t1, gp, zero
                  sra          t1, t1, zero
                  mulhu        s5, ra, t6
                  mul          a0, s0, s8
                  c.add        t4, sp
                  mulhu        ra, t2, s8
                  sltu         s0, s11, a3
                  sub          s9, t5, s8
                  add          s11, s4, s8
                  sra          gp, a3, a7
                  csrrwi       s6, 0x340, 15
                  sra          s5, ra, s0
                  sltiu        s1, a3, 1579
                  slli         s7, sp, 9
                  c.nop
                  csrrc        a5, 0x340, s5
                  mulhu        t3, a4, a3
                  srai         a0, a4, 3
                  c.and        a2, a1
                  slti         t0, a0, -645
                  sra          s11, a5, tp
                  mul          a5, s9, a5
                  c.addi       ra, 29
                  c.lui        s6, 8
                  or           a2, s2, t3
                  xor          s10, s6, s1
                  c.and        a1, a0
                  c.lui        a5, 1
                  csrrsi       s0, 0x340, 20
                  slt          tp, a5, tp
                  div          a0, a5, a2
                  add          s0, s5, tp
                  mulhu        t6, t5, a3
                  csrrsi       t6, 0x340, 2
                  or           s5, s9, s11
                  mul          s3, s9, a0
                  csrrs        s6, 0x340, t4
                  addi         t6, s5, 2016
                  mulhsu       tp, s5, a7
                  divu         a4, t2, s6
                  or           t3, a4, t3
                  andi         t0, t0, 1820
                  csrrs        a1, 0x340, zero
                  div          t4, a0, a0
                  rem          tp, s5, s11
                  c.nop
                  nop
                  mulhu        s9, t5, ra
                  mul          gp, a3, a4
                  c.srai       a1, 29
                  c.add        tp, tp
                  c.srli       s0, 12
                  srli         s6, s7, 17
                  or           s1, s1, a2
                  c.andi       a2, 6
                  slt          s11, s4, s1
                  xor          a5, t0, zero
                  csrrc        a7, 0x340, zero
                  csrrw        s1, 0x340, s3
                  c.xor        a3, a5
                  c.add        s2, a2
                  mulhu        a3, gp, a4
                  xor          a2, s6, a6
                  sltiu        t3, s0, -1020
                  csrrs        s8, 0x340, zero
                  slt          s8, t1, sp
                  addi         s8, s2, -1681
                  c.addi       s7, 14
                  c.sub        s0, a4
                  sll          a5, s11, a6
                  slti         s3, t0, -1439
                  xor          s8, s2, a0
                  div          s2, a6, s2
                  slti         t3, t1, -786
                  c.xor        s1, a1
                  srli         s10, s7, 24
                  c.mv         s1, s0
                  csrrw        gp, 0x340, s9
                  xor          t6, tp, s3
                  sll          t1, s6, s5
                  xor          a1, s1, t6
                  c.slli       tp, 27
                  srai         t0, a2, 12
                  sra          s0, s1, s4
                  remu         s8, t4, ra
                  c.nop
                  c.mv         a2, t2
                  mulhsu       t6, s10, a0
                  mulhu        ra, a6, s5
                  andi         s10, a4, -719
                  csrrw        s7, 0x340, a1
                  xor          t0, s2, s6
                  c.andi       s0, 25
                  csrrs        t6, 0x340, zero
                  csrrs        a1, 0x340, s4
                  c.srli       a2, 29
                  ori          s5, t6, 2035
                  andi         s1, gp, -1033
                  slli         a1, t3, 6
                  mul          zero, s4, t0
                  xor          a3, t6, s3
                  rem          a5, s8, t6
                  lui          t4, 674918
                  div          s6, a1, s9
                  c.and        s0, a4
                  c.li         t4, -1
                  csrrs        t3, 0x340, zero
                  c.srli       a4, 2
                  csrrs        t3, 0x340, t0
                  divu         t0, t5, a6
                  remu         ra, s3, gp
                  addi         t1, s8, 1394
                  mulhu        a2, s11, t2
                  csrrsi       s5, 0x340, 0
                  ori          a1, zero, 800
                  sltiu        s5, a1, -802
                  mulhsu       s6, a6, a5
                  csrrsi       s0, 0x340, 0
                  c.nop
                  sltiu        gp, s3, -788
                  mul          s1, s0, s1
                  mulh         t6, s1, t5
                  c.and        a4, s0
                  add          a2, s1, s9
                  lui          a5, 988299
                  or           t6, a1, gp
                  sltu         s8, a0, t6
                  mulhu        t5, gp, t6
                  c.and        a5, a4
                  c.srli       a5, 30
                  c.addi       a0, 30
                  andi         s7, s2, 821
                  csrrsi       t0, 0x340, 0
                  csrrs        a1, 0x340, s11
                  and          a1, t5, s8
                  srai         s7, a3, 19
                  srl          t3, s7, s7
                  c.mv         ra, t5
                  csrrwi       s3, 0x340, 12
                  c.mv         t1, a5
                  or           t1, tp, a3
                  and          gp, zero, t1
                  sub          t4, a5, sp
                  slli         s10, t2, 16
                  mul          a2, t4, zero
                  c.and        a1, a0
                  slti         gp, s10, 459
                  c.sub        a2, s0
                  ori          a2, s8, -18
                  rem          a1, sp, a6
                  csrrw        a0, 0x340, a2
                  add          t6, s9, s7
                  andi         a1, a4, -1928
                  csrrsi       t4, 0x340, 0
                  csrrci       a2, 0x340, 19
                  c.lui        ra, 5
                  c.mv         t5, a2
                  addi         a2, s0, 1408
                  c.andi       a2, -1
                  mulhsu       s0, s0, s8
                  srai         ra, gp, 10
                  c.and        a3, a3
                  csrrc        s9, 0x340, t3
                  remu         gp, s10, a6
                  c.and        s1, a1
                  csrrs        s1, 0x340, zero
                  andi         t5, a5, -190
                  sltu         s8, gp, t2
                  mul          a3, s6, a6
                  mulhu        zero, sp, t3
                  srl          a3, sp, a1
                  c.and        a5, a1
                  sub          zero, t3, s4
                  c.and        a3, a4
                  sll          tp, t6, t1
                  auipc        s11, 51088
                  slt          zero, a6, s10
                  c.srli       a4, 11
                  remu         a1, s0, t5
                  mulhu        ra, s9, a1
                  slt          a4, a2, t2
                  sub          t6, t5, s8
                  sub          a1, s4, s7
                  c.lui        a7, 2
                  slt          s4, s7, s6
                  nop
                  div          s6, a7, s8
                  andi         s11, t4, -253
                  c.or         a0, a4
                  c.srai       a3, 28
                  sltu         s1, s6, t2
                  c.li         t0, -1
                  mulhsu       s8, a6, a7
                  csrrci       gp, 0x340, 0
                  remu         a4, a2, a7
                  ori          s0, t5, 1262
                  mulh         s4, s4, a2
                  or           s4, s0, t2
                  lui          s11, 696787
                  or           a3, tp, s2
                  mulhsu       t0, a0, s2
                  mulh         a3, a3, t4
                  remu         s10, gp, tp
                  csrrs        tp, 0x340, s5
                  csrrwi       a5, 0x340, 8
                  c.and        a0, a0
                  c.addi       s5, -1
                  srai         a2, a2, 10
                  xori         s6, s2, -273
                  srli         tp, t5, 17
                  csrrwi       t3, 0x340, 19
                  slti         t6, t1, 1519
                  csrrwi       s9, 0x340, 19
                  c.add        t5, s6
                  csrrwi       t4, 0x340, 11
                  rem          s11, s11, sp
                  add          s1, a1, tp
                  srli         a5, s4, 8
                  csrrc        t6, 0x340, zero
                  c.mv         a3, s5
                  and          a0, zero, t6
                  csrrs        ra, 0x340, a0
                  csrrc        t1, 0x340, s6
                  auipc        ra, 1022895
                  c.andi       a2, 5
                  c.add        s2, ra
                  xori         s2, s5, 1
                  c.nop
                  slti         a3, t0, 643
                  add          t4, a2, a4
                  csrrc        s1, 0x340, t2
                  srl          t6, t4, s7
                  csrrs        s9, 0x340, zero
                  csrrc        s2, 0x340, s6
                  c.xor        a1, a5
                  srli         t6, zero, 3
                  mulh         a2, s9, s9
                  nop
                  sra          t3, t1, t0
                  csrrci       a7, 0x340, 30
                  sub          t4, sp, s2
                  srl          s1, s7, s4
                  c.lui        s10, 31
                  xor          s1, s11, sp
                  csrrsi       s3, 0x340, 0
                  srl          s1, t1, s7
                  csrrwi       t1, 0x340, 0
                  c.li         s4, 23
                  lui          a5, 6480
                  c.andi       a4, -1
                  c.mv         s11, s9
                  mulhu        tp, a5, tp
                  auipc        s3, 955064
                  add          s5, t1, s3
                  sra          a4, s7, s1
                  ori          t5, s11, -1930
                  c.or         a3, a1
                  c.or         s0, s0
                  add          a7, zero, a7
                  rem          s0, t2, t0
                  div          s8, s4, s3
                  lui          a0, 1013685
                  slli         a0, a0, 27
                  c.li         s8, -1
                  andi         gp, a4, -111
                  csrrci       s3, 0x340, 16
                  srli         zero, t4, 3
                  srl          t5, t6, s11
                  csrrc        gp, 0x340, zero
                  remu         a7, s3, t1
                  csrrc        a0, 0x340, zero
                  sub          t3, t1, t0
                  srli         a3, a5, 25
                  lui          ra, 797929
                  srai         s1, s1, 8
                  c.li         s11, -1
                  or           s10, s5, gp
                  csrrwi       tp, 0x340, 9
                  c.lui        s5, 17
                  c.slli       s0, 19
                  c.or         a5, a4
                  and          s4, s1, a3
                  c.andi       a2, -1
                  nop
                  srai         s4, a4, 6
                  csrrwi       ra, 0x340, 23
                  remu         s2, a4, zero
                  rem          a7, t5, a6
                  c.li         s11, 6
                  slt          a2, t4, a7
                  sll          s2, a1, a1
                  csrrsi       t3, 0x340, 22
                  c.or         a4, a3
                  mul          t5, s10, a6
                  sltu         gp, zero, s6
                  ori          s0, a6, 992
                  c.slli       s9, 20
                  c.srli       a2, 28
                  srai         a3, s11, 26
                  c.xor        a3, a3
                  srai         a5, t5, 22
                  csrrwi       s1, 0x340, 0
                  c.lui        s3, 9
                  sra          s0, zero, s9
                  sltiu        t6, gp, -1594
                  csrrw        t4, 0x340, s7
                  ori          s9, t6, 7
                  auipc        s2, 373712
                  slti         t0, t6, 383
                  slli         t6, ra, 30
                  add          a1, t0, a4
                  xor          t6, zero, a4
                  slt          s3, a1, a2
                  and          a3, s5, t4
                  csrrsi       s2, 0x340, 13
                  or           s7, a3, a3
                  csrrs        a4, 0x340, zero
                  rem          s11, s10, a2
                  add          s0, s3, s1
                  sltiu        a5, a1, 504
                  nop
                  csrrc        zero, 0x340, a0
                  c.srai       a5, 27
                  csrrwi       t1, 0x340, 11
                  div          t5, a3, a1
                  mulhsu       gp, t4, sp
                  c.or         a1, a5
                  csrrsi       s0, 0x340, 0
                  sub          s9, a4, ra
                  csrrci       t3, 0x340, 0
                  add          s5, tp, s7
                  sub          s2, a4, t4
                  or           s10, a0, s8
                  lui          ra, 323860
                  c.srli       s0, 1
                  c.nop
                  c.sub        s0, a1
                  and          gp, zero, gp
                  csrrc        s3, 0x340, a2
                  remu         gp, s6, s0
                  c.andi       a4, 20
                  mulhsu       t3, s9, s5
                  c.and        a0, s0
                  csrrw        zero, 0x340, zero
                  c.srai       s1, 22
                  slt          s5, s7, gp
                  sra          t4, sp, s5
                  csrrs        t3, 0x340, zero
                  mul          s4, zero, a1
                  sra          gp, t6, a1
                  srai         t6, t0, 2
                  c.and        a4, a3
                  csrrc        gp, 0x340, zero
                  srli         s9, t5, 17
                  c.addi       a1, -1
                  mulhu        ra, t6, t2
                  auipc        a7, 575582
                  slli         s2, s1, 10
                  divu         t3, t2, s6
                  sll          s10, s0, t0
                  divu         a1, t5, s0
                  mulhsu       s4, s8, a7
                  c.mv         s1, a6
                  ori          a5, s0, 1998
                  or           s11, ra, t1
                  div          zero, t2, ra
                  xori         s2, s1, 1202
                  c.li         s11, 22
                  sll          ra, sp, a4
                  sub          s8, s2, t3
                  auipc        s9, 581967
                  sll          gp, a4, t6
                  andi         s3, s5, -476
                  csrrci       t0, 0x340, 0
                  c.srli       a4, 9
                  rem          t3, a7, a7
                  divu         a2, s1, a1
                  srli         a5, s9, 20
                  divu         s10, ra, a4
                  remu         t6, s8, t0
                  csrrs        t6, 0x340, zero
                  c.andi       a4, -1
                  mulhu        s9, s0, s5
                  mulhsu       s7, a2, s0
                  csrrci       a3, 0x340, 21
                  divu         ra, t1, zero
                  ori          a4, s0, 1621
                  c.and        s0, a2
                  csrrw        s1, 0x340, s2
                  csrrc        gp, 0x340, zero
                  c.and        a2, a1
                  csrrs        t1, 0x340, zero
                  c.and        a3, s1
                  mulh         s11, s9, t4
                  c.andi       a2, 16
                  remu         t6, t3, s2
                  c.andi       s1, 6
                  remu         t4, s3, s9
                  or           s3, t5, s3
                  csrrc        s11, 0x340, s7
                  c.srli       s1, 7
                  slti         s6, t2, 1213
                  auipc        t5, 356575
                  mulhu        a5, a2, s1
                  mul          s4, gp, tp
                  mulh         a3, s9, s2
                  add          t4, s9, a0
                  csrrsi       t6, 0x340, 2
                  lui          s10, 446808
                  srl          t1, gp, t6
                  andi         s6, s10, -1770
                  c.srli       a3, 24
                  srai         a1, s9, 25
                  c.lui        s9, 9
                  sub          a1, s7, s2
                  nop
                  c.add        t5, t6
                  mulhu        a1, sp, a4
                  xor          s10, a6, s9
                  auipc        s6, 589386
                  c.xor        a3, a4
                  xor          a7, sp, s11
                  sltu         t4, a5, a5
                  lui          t1, 991783
                  c.add        a5, s10
                  mulhu        t5, gp, t6
                  csrrsi       t0, 0x340, 0
                  csrrwi       s10, 0x340, 9
                  c.nop
                  c.lui        s7, 29
                  add          zero, t0, s3
                  or           s5, a2, s7
                  c.lui        s4, 14
                  divu         s2, t5, a2
                  csrrwi       s8, 0x340, 16
                  c.slli       s2, 24
                  c.srli       s1, 15
                  add          gp, ra, t4
                  rem          a3, a6, s4
                  andi         a2, s4, 501
                  lui          a7, 702247
                  csrrsi       s2, 0x340, 5
                  sltiu        s2, a6, 1320
                  sltu         a4, t1, gp
                  div          s6, a1, s7
                  add          zero, s9, s5
                  xor          t4, zero, t3
                  or           s11, t3, t1
                  c.xor        a5, a3
                  xori         a5, s0, -834
                  and          s3, t2, a2
                  mul          s2, s3, s0
                  sra          s5, t3, a5
                  c.mv         a7, a1
                  srli         t4, a2, 1
                  c.add        s0, t1
                  c.sub        a0, a5
                  c.mv         s1, t1
                  remu         t6, gp, a4
                  csrrw        t3, 0x340, s2
                  add          a0, s7, s7
                  c.or         s0, a2
                  csrrci       gp, 0x340, 0
                  nop
                  mulhu        a3, a2, a1
                  sltu         tp, t0, s1
                  andi         s10, s8, -1732
                  and          a4, s9, t1
                  c.sub        a4, a1
                  addi         t4, ra, 26
                  mulh         t4, s3, a3
                  ori          a2, s3, 997
                  csrrwi       s8, 0x340, 27
                  mulh         a7, s8, t3
                  csrrc        a1, 0x340, a4
                  c.mv         s2, sp
                  or           zero, s2, s10
                  csrrs        t4, 0x340, t6
                  c.xor        s0, a4
                  csrrwi       s5, 0x340, 30
                  lui          gp, 779258
                  sra          s8, a1, t3
                  sltu         t4, t4, s5
                  csrrc        gp, 0x340, a6
                  c.add        t5, a7
                  sltiu        zero, t1, 1989
                  csrrwi       s0, 0x340, 31
                  c.srli       a2, 8
                  csrrci       s9, 0x340, 21
                  c.li         ra, 2
                  remu         gp, s4, t6
                  csrrsi       ra, 0x340, 19
                  csrrwi       t0, 0x340, 20
                  sub          t4, s8, sp
                  auipc        t0, 371247
                  mulhsu       s6, t6, t4
                  c.slli       a7, 19
                  sltu         s3, a0, s7
                  sub          t4, a6, a5
                  mulhu        tp, a6, t0
                  c.addi       t0, -1
                  csrrw        s8, 0x340, s8
                  csrrsi       t6, 0x340, 0
                  c.li         s7, 26
                  div          t5, a6, s4
                  andi         s8, tp, 26
                  slti         ra, a4, -1264
                  csrrs        t1, 0x340, t5
                  c.xor        s1, a0
                  srai         t4, s9, 23
                  mulh         t1, t2, a6
                  c.li         s2, 9
                  addi         t5, s1, 1001
                  ori          a3, a6, -876
                  csrrwi       s2, 0x340, 2
                  c.srli       s1, 24
                  xori         a2, s11, -1241
                  divu         s4, a7, s9
                  auipc        s5, 314107
                  c.li         t1, -1
                  slti         s8, s3, -1112
                  slti         a5, t6, -1660
                  addi         t4, s9, 1555
                  c.li         s9, 8
                  c.xor        s1, s1
                  sra          zero, t0, s1
                  c.or         a5, a3
                  c.slli       a2, 30
                  mulh         t3, t0, s4
                  csrrw        ra, 0x340, a0
                  c.srai       a4, 17
                  andi         t4, a3, -937
                  and          s1, t6, s5
                  csrrw        s0, 0x340, sp
                  sll          a7, s1, zero
                  xori         s6, a0, -611
                  sltiu        ra, s7, -1230
                  csrrc        a1, 0x340, s2
                  xori         a2, zero, 1757
                  xori         gp, t6, 577
                  c.andi       s0, 26
                  c.addi       s0, 29
                  c.lui        gp, 14
                  mul          t4, sp, zero
                  c.xor        a0, a1
                  divu         t1, a6, a0
                  andi         s3, t6, -1009
                  csrrc        zero, 0x340, ra
                  srl          a4, s11, t1
                  mul          a1, s11, a2
                  lui          s6, 817875
                  c.sub        a1, a1
                  rem          t0, s4, gp
                  andi         ra, a2, 599
                  c.lui        t5, 13
                  csrrc        t5, 0x340, zero
                  nop
                  lui          s10, 977692
                  or           t3, s10, t2
                  xori         s10, s10, -1661
                  divu         ra, t5, t1
                  xori         s10, ra, -881
                  csrrci       s0, 0x340, 5
                  csrrsi       tp, 0x340, 0
                  c.or         a0, a4
                  and          a0, s5, s5
                  csrrs        t1, 0x340, a3
                  sll          a7, s9, a5
                  mulhsu       a7, s1, a5
                  xor          s9, a1, s2
                  mulhsu       t3, t6, a4
                  mulhu        s10, t4, tp
                  xor          s6, t2, s3
                  c.li         t3, 11
                  ori          s8, s11, -1642
                  or           s1, a2, t1
                  and          t0, a6, t6
                  rem          a1, t6, a2
                  c.lui        a2, 21
                  sltu         t6, a1, sp
                  nop
                  c.mv         s9, s10
                  nop
                  c.add        tp, s8
                  sltu         a2, ra, gp
                  srl          s5, a1, sp
                  c.xor        s1, s0
                  xor          s8, t3, s6
                  mulhsu       a4, s7, t3
                  and          s7, t1, gp
                  mul          ra, s8, s1
                  rem          t1, sp, t4
                  sltiu        t1, t4, -1084
                  and          s11, t6, t1
                  c.lui        a5, 25
                  slti         a5, t5, -964
                  csrrci       a3, 0x340, 8
                  add          s11, a6, a0
                  auipc        a7, 1043311
                  sltu         s6, t6, t5
                  c.add        s11, a3
                  c.mv         s0, s4
                  slt          t6, zero, s4
                  c.or         a0, a5
                  and          a0, t0, a1
                  sll          s4, s10, s9
                  sll          s6, t1, a6
                  sltiu        a7, s6, 1716
                  lui          a7, 1042909
                  add          t0, s3, s0
                  csrrci       a1, 0x340, 2
                  sll          s5, s11, s4
                  sltu         t1, s4, zero
                  srl          s5, s1, a5
                  addi         gp, a0, -1096
                  srli         t3, gp, 15
                  xori         a7, s2, 1872
                  xori         a0, s6, -1087
                  ori          a3, s6, 223
                  c.add        ra, sp
                  slt          t1, t0, gp
                  sltu         tp, s5, s4
                  auipc        a4, 570006
                  andi         s4, s3, 484
                  mulhu        a0, t4, a7
                  csrrw        t4, 0x340, a0
                  andi         t3, zero, 1123
                  csrrs        s3, 0x340, zero
                  c.add        s4, sp
                  lui          a0, 415857
                  c.nop
                  c.lui        a2, 10
                  remu         s1, tp, ra
                  remu         t3, s5, t0
                  nop
                  slti         t3, s4, -1572
                  c.slli       t5, 16
                  mul          s2, s2, s6
                  srai         t5, t0, 31
                  mul          a7, s9, a1
                  srli         a5, t5, 9
                  csrrci       t0, 0x340, 0
                  c.srai       a5, 6
                  sra          a2, s6, s3
                  lui          s3, 971000
                  csrrsi       gp, 0x340, 26
                  xori         s9, a5, 891
                  remu         s1, s5, a6
                  srli         s10, t0, 11
                  c.mv         s4, s5
                  sra          s2, a5, a0
                  csrrs        t4, 0x340, zero
                  mulh         t1, zero, s3
                  csrrsi       ra, 0x340, 3
                  csrrsi       a0, 0x340, 0
                  csrrsi       s2, 0x340, 0
                  c.nop
                  csrrwi       s11, 0x340, 7
                  c.and        a0, a0
                  lui          s11, 169599
                  c.li         s10, -1
                  mul          s4, t1, s3
                  lui          s4, 416083
                  slti         t6, a4, -740
                  csrrs        t5, 0x340, t2
                  rem          a4, t3, a7
                  sub          s7, a0, a5
                  xori         s5, gp, -792
                  csrrwi       a7, 0x340, 21
                  sra          a1, t3, a3
                  c.mv         t0, ra
                  sub          a7, a2, ra
                  csrrs        a3, 0x340, zero
                  sra          a0, a4, s4
                  sub          s8, s2, s2
                  mulhsu       s9, tp, s7
                  c.srai       a5, 15
                  srli         a2, s0, 12
                  div          t5, t4, a7
                  xori         s7, s0, -788
                  sltiu        t3, a1, -151
                  mulhu        t4, a7, t2
                  addi         s3, s1, 1941
                  xori         t0, t4, 1988
                  remu         t1, t3, a4
                  csrrsi       s11, 0x340, 14
                  srai         s2, a6, 2
                  c.lui        s4, 16
                  mulh         a5, t3, sp
                  sltiu        a7, s7, -1876
                  slt          a1, a7, a2
                  c.mv         t5, t5
                  auipc        s2, 616972
                  div          s1, s1, s10
                  c.lui        t3, 18
                  c.srai       a5, 11
                  c.mv         gp, a0
                  csrrs        s0, 0x340, s5
                  c.srai       a2, 22
                  csrrw        s1, 0x340, gp
                  div          a5, t1, t3
                  c.slli       s8, 19
                  c.xor        a5, s1
                  addi         a5, sp, 425
                  csrrci       s8, 0x340, 3
                  c.mv         a4, a3
                  andi         a3, s9, -1673
                  divu         tp, s3, s9
                  andi         t5, a2, -745
                  div          a2, t5, a1
                  sra          t6, t5, sp
                  c.and        s0, a0
                  sltiu        s9, s4, -390
                  c.srli       a1, 1
                  remu         s1, t0, s7
                  csrrw        t3, 0x340, sp
                  div          ra, s3, t0
                  c.or         a5, a2
                  sra          a0, t3, s9
                  div          t3, tp, s5
                  sub          a4, sp, s3
                  nop
                  c.lui        t4, 23
                  c.lui        a1, 16
                  xor          s4, t4, sp
                  srai         a0, s4, 20
                  remu         a7, t2, t6
                  or           tp, s8, s5
                  mul          s3, s9, a4
                  c.nop
                  addi         s1, s5, -1680
                  c.mv         a5, s4
                  or           s0, a0, a7
                  c.addi       a0, -1
                  c.mv         ra, a1
                  sll          a3, a6, t2
                  csrrw        s10, 0x340, tp
                  c.add        s8, t1
                  csrrc        s1, 0x340, zero
                  sub          gp, t5, s1
                  mulh         ra, a4, a6
                  mulh         s0, s4, s6
                  csrrsi       s9, 0x340, 5
                  mul          s8, t2, a0
                  div          s8, a4, s3
                  nop
                  csrrsi       t3, 0x340, 0
                  ori          gp, tp, -428
                  and          s7, s1, t6
                  slti         s10, t4, -1168
                  c.add        s11, s4
                  divu         s0, s6, s5
                  c.add        s9, s6
                  sll          a2, t5, a0
                  rem          s6, a6, zero
                  c.addi       s5, -1
                  c.and        s1, a3
                  csrrci       t1, 0x340, 0
                  csrrsi       a3, 0x340, 0
                  ori          a3, t4, -1584
                  auipc        t0, 166918
                  or           a0, t3, s4
                  csrrs        tp, 0x340, zero
                  slt          t5, s8, sp
                  rem          t1, s6, s3
                  mulh         s9, a2, a2
                  c.srai       a0, 23
                  sltiu        a4, s7, -554
                  slli         s10, s9, 31
                  div          s2, a3, a5
                  auipc        s6, 1001413
                  c.and        a4, a0
                  c.xor        a5, a0
                  addi         s0, ra, 1611
                  c.or         s1, a3
                  sra          ra, a5, a5
                  lui          tp, 970542
                  c.xor        a4, s0
                  c.andi       a0, -1
                  c.xor        a1, a2
                  addi         t0, a3, -1749
                  auipc        a3, 659711
                  c.li         t5, 21
                  c.srai       a0, 22
                  mulhsu       s6, a7, a2
                  c.or         a1, a2
                  ori          t5, t2, 1082
                  c.srai       s0, 28
                  csrrw        a0, 0x340, zero
                  or           s11, s0, s0
                  rem          a2, t4, a7
                  c.srli       a3, 9
                  mul          s10, s9, gp
                  mul          t3, a3, t5
                  srl          t0, a5, a1
                  andi         tp, a1, -1945
                  c.andi       s0, 27
                  c.mv         a5, t3
                  c.andi       s1, 9
                  sltu         t6, sp, s7
                  csrrsi       s10, 0x340, 0
                  slt          t4, s9, s11
                  auipc        s7, 325343
                  nop
                  c.mv         s9, s10
                  slt          zero, s9, a3
                  c.add        s0, s4
                  sltu         t5, sp, s10
                  csrrs        s2, 0x340, zero
                  c.srli       a3, 4
                  slt          zero, a4, a2
                  addi         t5, t3, -1635
                  div          s6, tp, s0
                  c.srli       a4, 14
                  sltu         s10, a7, s5
                  c.lui        s11, 31
                  slti         s4, s1, -739
                  ori          t3, t3, 109
                  c.nop
                  auipc        a0, 161683
                  c.lui        a0, 3
                  c.addi       t0, 4
                  c.addi       s5, -1
                  lui          s5, 1029362
                  c.mv         a1, s6
                  sub          tp, s2, s5
                  rem          t4, a5, a2
                  rem          s5, t5, a4
                  c.lui        t1, 27
                  c.srai       a2, 28
                  lui          s8, 993889
                  divu         s1, s10, ra
                  sra          s0, s1, s9
                  c.or         a5, a0
                  csrrc        s2, 0x340, s3
                  sltiu        a1, s10, -593
                  c.sub        a0, a2
                  lui          a7, 795709
                  nop
                  or           t1, t0, t2
                  c.li         ra, 19
                  add          a5, a4, s4
                  add          t5, s3, t6
                  or           a4, a3, a3
                  csrrs        t5, 0x340, a6
                  c.sub        a4, a0
                  nop
                  sll          t0, s11, s9
                  mulhu        s0, s5, a1
                  div          a2, t5, a0
                  nop
                  andi         t3, tp, -1861
                  sub          a0, a4, s4
                  csrrci       s10, 0x340, 5
                  lui          s0, 11401
                  slli         t5, s3, 6
                  c.nop
                  remu         t5, ra, s0
                  srai         gp, t3, 29
                  csrrw        a2, 0x340, s5
                  csrrsi       gp, 0x340, 0
                  slli         s7, tp, 20
                  c.mv         a2, a6
                  mulhsu       tp, s7, t5
                  c.andi       a0, -1
                  sll          s10, a7, s10
                  xori         s2, a0, -1695
                  divu         s5, t3, t0
                  mul          s7, t4, a5
                  csrrsi       a0, 0x340, 13
                  remu         s1, a1, s0
                  mulhsu       a4, s5, a0
                  c.sub        a1, a5
                  nop
                  mulhsu       t1, t1, s1
                  c.xor        a0, a2
                  srli         s9, ra, 21
                  c.srli       a1, 8
                  sltu         s5, tp, sp
                  c.sub        a3, a2
                  c.sub        a1, a0
                  xori         s4, t0, -1755
                  sll          t6, t2, s8
                  div          t4, s2, s6
                  csrrsi       s8, 0x340, 30
                  c.li         s2, 31
                  c.slli       t0, 25
                  csrrw        s2, 0x340, a7
                  csrrci       s6, 0x340, 30
                  divu         gp, s7, t2
                  srli         s2, s8, 19
                  sra          s8, t3, t0
                  ori          a2, a7, 815
                  sltu         t0, a4, a1
                  divu         s8, a3, a6
                  csrrci       s9, 0x340, 0
                  srli         t0, s11, 16
                  nop
                  srai         ra, a3, 20
                  c.srli       a1, 6
                  xori         t6, s2, 91
                  csrrci       s2, 0x340, 26
                  mulhsu       s11, a6, s2
                  c.add        s6, t1
                  c.lui        t0, 21
                  andi         s9, a4, 1173
                  srli         s11, s7, 10
                  srai         t3, t1, 27
                  xor          gp, zero, a7
                  auipc        ra, 884240
                  divu         a4, t6, gp
                  slt          s1, a6, tp
                  mul          a7, t1, a2
                  c.mv         a4, a7
                  slli         t6, a5, 4
                  auipc        a7, 994223
                  mulhsu       t1, zero, s9
                  or           s7, gp, s5
                  csrrsi       s9, 0x340, 0
                  c.or         s0, a5
                  c.add        t3, a1
                  ori          s2, s10, 169
                  mulhu        zero, a3, a0
                  and          s0, t6, t1
                  c.srai       a0, 14
                  c.srli       a4, 5
                  sra          t4, t0, tp
                  addi         a7, s7, -1167
                  c.and        s1, s1
                  sltiu        t6, s1, 1485
                  c.lui        s11, 8
                  c.or         a3, a1
                  c.li         t5, 12
                  addi         a4, t1, -221
                  c.nop
                  srli         s0, gp, 5
                  csrrwi       t1, 0x340, 23
                  mulhu        s8, a5, s6
                  srai         s0, s6, 21
                  c.add        s4, a2
                  slt          gp, s2, a1
                  addi         a2, a3, -1216
                  srli         s5, t5, 12
                  c.and        a1, a0
                  c.mv         t5, ra
                  sra          s3, sp, s9
                  sltiu        t6, s1, -475
                  c.andi       a3, -1
                  csrrsi       s9, 0x340, 27
                  div          t6, t2, a6
                  or           zero, t3, s10
                  slli         a3, t1, 4
                  mulhu        s10, a6, a0
                  sra          t1, s8, zero
                  sub          s1, s1, tp
                  mulhsu       s7, a3, t2
                  addi         s6, s3, -1243
                  sra          a5, sp, s11
                  ori          s6, zero, 1423
                  c.nop
                  sra          a2, t5, a4
                  csrrwi       a3, 0x340, 4
                  csrrc        s8, 0x340, zero
                  andi         a7, ra, -573
                  c.mv         a2, gp
                  srl          a3, t3, a6
                  csrrsi       tp, 0x340, 30
                  c.andi       a1, -1
                  slti         a5, t0, -1161
                  mulhu        s5, t0, t4
                  remu         t0, a2, s3
                  mulh         t0, ra, a3
                  slti         s3, a1, -1942
                  c.xor        a1, s0
                  slli         s7, a7, 16
                  c.sub        s0, a5
                  auipc        t1, 920669
                  csrrci       s3, 0x340, 25
                  rem          t6, s1, s1
                  csrrc        s7, 0x340, s9
                  sll          a4, a0, tp
                  csrrs        t1, 0x340, s4
                  slli         t4, tp, 3
                  c.or         s1, s0
                  xori         s1, a4, 1159
                  xori         t0, t3, 1301
                  xor          a5, tp, s1
                  c.slli       a5, 27
                  sra          a5, t0, s2
                  sll          s4, t1, s10
                  srl          t6, tp, a7
                  c.lui        s3, 29
                  c.and        a1, a5
                  csrrw        s1, 0x340, t1
                  rem          s1, zero, a7
                  csrrwi       s0, 0x340, 7
                  add          a3, t5, s5
                  andi         a4, a1, -11
                  csrrci       a2, 0x340, 9
                  xor          a5, a1, a0
                  c.addi       gp, -1
                  ori          s0, s7, -684
                  sra          t0, a6, a3
                  srl          t0, zero, a4
                  c.mv         s10, s11
                  c.li         a7, 20
                  mulhu        t0, s8, s0
                  remu         t4, a1, s4
                  remu         s4, s0, s1
                  add          s10, a3, a1
                  csrrc        a2, 0x340, zero
                  sll          s0, zero, sp
                  xor          s5, s1, a5
                  div          s0, t0, s3
                  and          s6, s6, a4
                  csrrw        a1, 0x340, t6
                  divu         tp, t4, s3
                  mulhu        s1, s3, s1
                  c.xor        a0, a2
                  ori          t6, sp, -1831
                  csrrsi       s4, 0x340, 0
                  c.add        s2, t5
                  rem          s0, s10, a2
                  rem          t3, tp, t1
                  csrrs        a3, 0x340, s9
                  slti         s3, s9, -1979
                  slti         t6, s10, 1246
                  srl          zero, zero, ra
                  xor          s2, a4, a6
                  remu         s3, s9, a4
                  srli         s0, s5, 4
                  slti         s3, s9, 1882
                  csrrci       t4, 0x340, 10
                  or           a5, s0, s10
                  csrrwi       s10, 0x340, 30
                  sub          s5, t3, a7
                  sra          s0, gp, ra
                  c.add        a4, a6
                  sub          s11, a4, a4
                  remu         ra, a2, t5
                  srli         s6, t2, 10
                  rem          t6, s10, a7
                  c.addi       a2, 24
                  srai         a5, t5, 23
                  csrrs        a1, 0x340, s8
                  xor          s7, tp, s4
                  c.slli       a7, 15
                  slli         t1, t2, 29
                  c.and        a4, a2
                  div          ra, s9, s10
                  mulh         s1, s1, s0
                  c.addi       s7, -1
                  csrrc        a4, 0x340, a0
                  div          s6, t5, a6
                  c.xor        a5, a5
                  c.li         s11, 0
                  mulhu        t3, s5, t1
                  xori         t3, s3, -1283
                  c.srli       a2, 30
                  or           t0, t1, a5
                  sub          s2, sp, a5
                  c.srli       a4, 10
                  divu         a7, t5, sp
                  c.slli       ra, 17
                  add          a0, t0, t4
                  slli         zero, t1, 23
                  auipc        t1, 985440
                  slt          s11, a1, a4
                  c.or         a3, s0
                  slt          ra, s11, a2
                  srl          t6, t1, gp
                  c.sub        a2, s0
                  c.li         t0, -1
                  divu         ra, s9, zero
                  andi         s4, tp, 985
                  slt          a5, s6, a3
                  c.mv         a7, t4
                  c.srli       s1, 17
                  c.nop
                  auipc        t0, 156044
                  div          t5, s8, t6
                  slli         a1, s8, 21
                  c.lui        s3, 10
                  srai         s0, s11, 18
                  sll          t0, s11, a7
                  c.xor        a3, s0
                  c.andi       s0, 3
                  c.add        a5, s0
                  xor          t1, a5, a7
                  auipc        t0, 617440
                  srli         t6, s10, 7
                  andi         a1, gp, -1472
                  and          s8, a4, s5
                  srl          t3, t6, t0
                  c.srli       s0, 8
                  c.mv         ra, s5
                  srl          s7, t4, sp
                  remu         a7, s5, a1
                  c.xor        a2, a2
                  csrrs        a7, 0x340, zero
                  add          s4, zero, t5
                  sra          s3, s11, s7
                  c.or         a2, a3
                  c.lui        s8, 3
                  c.sub        a2, a4
                  ori          t1, a0, 25
                  auipc        s1, 525633
                  csrrc        a4, 0x340, s8
                  divu         t6, s8, a5
                  c.li         s0, -1
                  addi         t5, a3, -1543
                  lui          s9, 877945
                  auipc        ra, 203229
                  csrrs        s6, 0x340, t5
                  ori          s9, s3, -1605
                  andi         a5, a2, -1343
                  slli         t1, a3, 26
                  slti         tp, t0, -1468
                  rem          a1, a7, a5
                  auipc        s3, 805287
                  div          t1, t0, a7
                  sltu         t4, gp, t0
                  c.mv         s2, a4
                  c.srai       a0, 18
                  c.andi       a1, 20
                  remu         t4, t3, s2
                  slti         s7, t4, -361
                  c.add        s11, s5
                  slt          s5, s8, s8
                  c.lui        t3, 18
                  srl          zero, s2, t4
                  c.srli       a5, 14
                  xori         gp, t6, 509
                  c.addi       s0, -1
                  mulhsu       zero, s7, a5
                  sub          a1, a6, s10
                  sltiu        tp, ra, 870
                  sra          t3, t3, gp
                  or           s7, s6, t3
                  c.sub        a3, a3
                  slti         s7, s1, -1602
                  add          a5, a2, tp
                  c.sub        a3, a0
                  andi         t3, zero, -1384
                  sltu         a3, t5, sp
                  sll          a2, t2, sp
                  andi         a0, s2, 600
                  c.sub        a1, a3
                  mulh         t6, a4, t3
                  addi         gp, t2, 1618
                  div          zero, s8, s5
                  csrrwi       s6, 0x340, 15
                  c.lui        a7, 14
                  sltu         a7, s10, a7
                  c.or         a4, a0
                  mulhsu       s8, zero, s10
                  add          a4, a5, t4
                  mul          a1, a7, a5
                  mulhsu       s5, t5, t1
                  c.lui        a1, 18
                  addi         ra, s7, -829
                  sltu         s8, t1, s8
                  csrrwi       a7, 0x340, 20
                  slti         a1, s0, 1053
                  sltiu        a7, gp, -1954
                  xor          s10, a1, a2
                  c.srai       a0, 2
                  c.srai       s1, 3
                  ori          s9, t2, 13
                  ori          s1, s6, -1647
                  slli         t0, tp, 9
                  slti         t6, t1, -33
                  lui          t3, 489758
                  csrrs        s1, 0x340, a3
                  c.sub        a3, s1
                  and          t6, s9, a1
                  c.andi       a2, -1
                  c.sub        a5, a2
                  add          t4, t6, t2
                  c.addi       s8, 30
                  xor          t4, s4, a1
                  c.srai       s0, 28
                  c.and        s1, a0
                  c.or         s0, a5
                  remu         a7, zero, s8
                  and          s5, t5, zero
                  lui          t3, 890496
                  csrrsi       t0, 0x340, 30
                  remu         t5, zero, t0
                  lui          s8, 539755
                  addi         s2, s6, 453
                  slt          zero, s4, zero
                  c.and        a0, s0
                  div          s8, t6, s7
                  sra          t1, a6, t1
                  mul          s11, s7, a6
                  mulh         s5, a4, s11
                  srli         t4, a5, 4
                  slli         ra, s5, 20
                  add          a4, t2, s7
                  sub          a4, s9, a5
                  div          t0, s3, s8
                  and          a2, t0, t3
                  rem          s11, s2, s3
                  lui          s3, 432061
                  srai         s11, t4, 19
                  lui          zero, 228682
                  c.andi       s1, -1
                  sltu         s1, s8, s1
                  c.slli       s5, 18
                  c.add        t3, s11
                  c.li         t5, 15
                  srli         s10, s5, 22
                  c.or         a3, a4
                  divu         zero, s0, a1
                  mulhu        s9, t2, t3
                  csrrc        s7, 0x340, a4
                  sltiu        s1, a0, 365
                  c.sub        a4, a4
                  mulh         a1, s10, ra
                  xor          a3, s8, s0
                  addi         s8, s3, 201
                  remu         t5, a0, a3
                  c.lui        s2, 6
                  sltu         a5, gp, a4
                  csrrs        t1, 0x340, t4
                  remu         s9, t2, t5
                  auipc        a5, 393692
                  c.lui        t1, 31
                  c.sub        a4, s1
                  ori          t4, s5, -903
                  srai         s0, a2, 23
                  c.slli       s5, 28
                  divu         s3, t6, s10
                  xor          ra, a2, a1
                  srli         s2, sp, 29
                  mulhsu       a5, s10, s1
                  c.addi       a4, 18
                  c.and        a4, a3
                  sltiu        gp, a7, -1774
                  c.and        a4, a4
                  csrrwi       a3, 0x340, 15
                  c.xor        a1, a2
                  c.slli       a5, 17
                  srl          s3, a7, a0
                  c.andi       a5, -1
                  c.addi       s0, -1
                  sub          tp, a6, a7
                  slti         s11, a0, -1940
                  c.addi       s4, 31
                  c.or         a3, s0
                  c.srli       a0, 31
                  divu         s8, t6, a3
                  c.add        t1, s1
                  mul          s8, gp, a5
                  xori         s1, a3, -772
                  c.srai       a1, 27
                  nop
                  srai         t6, s2, 25
                  c.and        a3, a4
                  srai         tp, s11, 31
                  c.nop
                  slt          zero, a7, ra
                  c.lui        tp, 27
                  nop
                  srli         a3, s3, 15
                  sll          gp, s3, sp
                  c.slli       t0, 8
                  lui          s8, 816977
                  c.li         a1, -1
                  c.nop
                  c.srli       a5, 19
                  auipc        s0, 75460
                  c.xor        a3, s0
                  c.nop
                  mulh         s8, a3, a1
                  srl          s1, s6, t4
                  slti         s5, sp, 1463
                  mul          s5, t6, s10
                  auipc        a5, 363101
                  c.li         s7, -1
                  and          s7, s5, a0
                  xori         a4, a4, -1255
                  auipc        t3, 512985
                  c.slli       tp, 16
                  sltiu        s1, s3, 1414
                  c.or         a4, s0
                  c.xor        a0, a5
                  mul          s9, s11, t4
                  slti         t0, a1, 1054
                  srli         t0, zero, 8
                  div          s3, a6, a2
                  c.li         s5, -1
                  div          gp, sp, tp
                  divu         zero, a2, t3
                  mulhsu       tp, t1, a3
                  mulh         s2, s3, zero
                  csrrwi       ra, 0x340, 8
                  addi         t4, sp, -1494
                  c.or         a0, a1
                  csrrwi       s9, 0x340, 26
                  sll          s9, t3, a7
                  sub          a5, t6, s9
                  srl          s11, a7, s10
                  sll          s11, t1, s10
                  c.li         s3, 8
                  c.srai       a3, 4
                  and          t4, s11, a5
                  andi         s4, s4, -1384
                  xori         tp, zero, 712
                  c.slli       s7, 24
                  ori          tp, s10, -910
                  mulh         s9, s4, ra
                  csrrs        a5, 0x340, a3
                  xor          s10, ra, t4
                  srl          s7, a2, a4
                  c.andi       a0, -1
                  lui          a2, 725660
                  sra          gp, gp, s3
                  csrrc        s9, 0x340, zero
                  mulhsu       s0, sp, s2
                  c.srai       a1, 14
                  mulhsu       s7, gp, s2
                  csrrsi       s2, 0x340, 1
                  c.xor        s0, a5
                  c.nop
                  c.mv         s3, sp
                  mul          s10, a4, a2
                  slli         t6, t5, 16
                  sltu         a3, sp, t6
                  mulh         a1, s10, s3
                  c.srli       a4, 22
                  c.srai       a4, 16
                  mul          a3, s5, ra
                  c.nop
                  auipc        a0, 762342
                  xor          s9, sp, a6
                  xori         t4, s2, 1005
                  c.andi       a4, 0
                  c.nop
                  csrrs        s6, 0x340, a7
                  c.slli       s5, 7
                  rem          s0, a7, s2
                  csrrc        a1, 0x340, zero
                  sltu         a2, a0, s10
                  auipc        s8, 601123
                  c.andi       s1, 12
                  c.add        s5, a1
                  nop
                  remu         a2, s8, s11
                  xor          a1, zero, ra
                  sub          a1, t1, a5
                  sll          s0, gp, zero
                  srai         s8, zero, 6
                  add          t6, t6, a2
                  csrrci       s1, 0x340, 18
                  lui          a7, 149532
                  c.nop
                  slti         a3, ra, 1963
                  rem          s3, a1, s9
                  and          s5, s10, a4
                  c.or         a2, a3
                  sltu         s2, s4, a7
                  c.sub        a4, s0
                  c.mv         a1, t5
                  or           s7, s0, t5
                  andi         s2, a1, -1638
                  andi         s6, t1, -955
                  srli         t3, a6, 31
                  sub          t5, t0, s9
                  auipc        a0, 684738
                  csrrw        t1, 0x340, s1
                  csrrwi       a3, 0x340, 25
                  slli         t1, a0, 1
                  nop
                  slli         t4, tp, 29
                  csrrw        ra, 0x340, t4
                  srl          a0, a7, s0
                  csrrwi       s7, 0x340, 16
                  csrrw        ra, 0x340, a4
                  c.and        a4, a3
                  c.or         a3, a5
                  c.addi       t3, 9
                  andi         s0, a5, -621
                  c.add        s2, a0
                  xori         a4, a7, 1991
                  slt          gp, gp, a1
                  remu         s11, t4, s10
                  lui          t4, 244905
                  nop
                  c.and        a0, s1
                  c.mv         s11, a6
                  csrrw        a2, 0x340, s2
                  c.add        s0, a7
                  csrrwi       a2, 0x340, 7
                  sltiu        t4, t3, 700
                  c.and        s1, s1
                  c.add        tp, t5
                  c.srli       a1, 10
                  andi         t0, a3, -374
                  lui          a4, 333781
                  srl          s9, t2, s1
                  c.add        s10, s1
                  auipc        s5, 198234
                  or           t5, tp, s9
                  div          s4, s6, t2
                  add          s2, s6, a2
                  csrrc        s2, 0x340, s9
                  and          t3, t3, s7
                  srli         a4, gp, 22
                  slt          t4, a2, a6
                  slti         s4, s1, 684
                  xor          t4, s11, a4
                  mulh         t4, s3, zero
                  xor          gp, s1, a6
                  srli         a3, s3, 11
                  mulhu        tp, a0, sp
                  csrrs        a0, 0x340, a2
                  c.andi       a0, 17
                  mulhsu       s2, t5, s4
                  addi         t1, t0, 1620
                  mulhu        t3, a6, s6
                  c.slli       a4, 7
                  slti         a3, s9, 1326
                  xor          gp, a4, s2
                  mul          zero, s3, s9
                  or           s10, t1, t5
                  sltiu        a7, t4, 1127
                  divu         s4, gp, a7
                  sra          s1, t0, s11
                  mulhsu       t5, ra, s3
                  c.li         s6, -1
                  divu         gp, a7, s4
                  sltu         s3, a4, sp
                  xor          s10, a3, tp
                  mulhsu       s11, s4, a5
                  andi         t0, t0, -148
                  or           s11, t4, a1
                  csrrc        t0, 0x340, zero
                  c.mv         s3, s8
                  srai         tp, a7, 19
                  c.srai       a3, 25
                  csrrwi       gp, 0x340, 19
                  auipc        s8, 419556
                  div          t5, t0, s0
                  mul          s6, a1, s4
                  or           s6, s8, s4
                  sra          s6, a5, s7
                  addi         zero, s10, 1807
                  div          a5, s4, s8
                  csrrsi       s0, 0x340, 0
                  andi         a7, a5, -1599
                  c.li         t0, 14
                  xor          s8, ra, a1
                  andi         s4, tp, 1411
                  mulhsu       s8, t1, s7
                  auipc        a4, 829495
                  c.slli       a5, 20
                  c.add        s2, s7
                  mul          a4, s8, t2
                  sll          a2, a6, t0
                  mulhu        t3, a4, s6
                  c.or         s0, a3
                  srli         s3, s8, 5
                  lui          s10, 1025358
                  add          s8, s0, s5
                  or           ra, s5, s2
                  c.and        a3, a0
                  xor          s3, ra, zero
                  csrrc        s8, 0x340, zero
                  c.add        s1, s4
                  slt          s5, gp, a7
                  ori          s1, t0, 1245
                  c.slli       t4, 23
                  and          s5, s1, sp
                  xori         t3, s9, 395
                  c.srli       a1, 26
                  c.sub        a3, a0
                  c.or         a4, a2
                  rem          a1, s6, a1
                  mul          a5, s9, t1
                  sltu         s8, a4, s9
                  rem          zero, a4, t1
                  c.addi       t5, -1
                  srai         a4, tp, 20
                  c.andi       a1, -1
                  mulhu        s10, tp, zero
                  lui          gp, 180555
                  c.andi       a1, 4
                  c.srli       a3, 3
                  c.sub        a3, s0
                  c.xor        a0, a5
                  c.add        a5, ra
                  c.nop
                  sra          s1, sp, sp
                  mulh         t4, zero, s2
                  nop
                  c.slli       s0, 30
                  andi         t3, t0, 1370
                  c.slli       t4, 21
                  srl          a0, a5, t6
                  sltiu        a3, s3, -1113
                  nop
                  c.slli       t6, 1
                  csrrwi       gp, 0x340, 15
                  csrrsi       s10, 0x340, 12
                  sra          s1, s0, gp
                  c.li         t0, 3
                  c.li         s10, -1
                  csrrwi       s5, 0x340, 20
                  mulh         a4, gp, sp
                  c.slli       tp, 27
                  c.and        a5, a5
                  c.lui        a2, 16
                  addi         a2, a6, 1569
                  slli         t4, a3, 9
                  c.lui        a7, 16
                  c.srai       a5, 8
                  sltiu        a1, s10, -440
                  c.srai       s0, 16
                  andi         t6, t2, 535
                  andi         t1, a5, -995
                  remu         ra, zero, a2
                  div          s0, s0, t0
                  srli         s5, s0, 10
                  c.sub        a3, s0
                  slt          zero, t6, gp
                  csrrci       t4, 0x340, 0
                  rem          t0, gp, sp
                  c.srli       a1, 3
                  sra          t3, t5, s8
                  c.lui        s0, 5
                  slli         a0, a3, 22
                  csrrs        s10, 0x340, t5
                  slli         t5, t3, 23
                  mulhu        a2, gp, s8
                  csrrwi       a7, 0x340, 28
                  c.slli       s6, 3
                  andi         s10, s4, -2040
                  c.lui        t0, 19
                  csrrci       t5, 0x340, 0
                  c.li         t0, -1
                  c.addi       s1, 15
                  csrrc        s8, 0x340, gp
                  nop
                  remu         t4, s4, zero
                  c.xor        a4, a1
                  auipc        s4, 221988
                  xori         t4, s3, -2033
                  sltu         zero, t4, t0
                  csrrsi       s3, 0x340, 0
                  csrrc        ra, 0x340, zero
                  mulh         s7, t4, s4
                  sltu         s8, a6, s1
                  div          a7, s0, a2
                  sll          gp, t3, a3
                  csrrsi       s10, 0x340, 0
                  srai         a4, t5, 21
                  divu         s5, t4, tp
                  csrrwi       t1, 0x340, 14
                  c.li         gp, 16
                  c.andi       a4, -1
                  csrrc        s1, 0x340, a2
                  slti         a3, t4, 465
                  c.andi       a0, -1
                  xor          t6, gp, t2
                  c.nop
                  or           tp, t2, s7
                  xori         s2, sp, 1450
                  c.andi       s0, 4
                  c.slli       t6, 24
                  slt          a7, t4, t2
                  andi         s9, a5, 484
                  csrrwi       s3, 0x340, 10
                  slti         a0, s0, -1059
                  mul          tp, a3, t5
                  lui          s5, 782225
                  slli         s11, a5, 27
                  ori          ra, a0, -1740
                  c.li         s3, -1
                  addi         s7, a7, -756
                  mul          s10, a3, a4
                  slt          s5, a0, s9
                  sltu         s0, t0, s7
                  c.sub        s0, s0
                  sra          zero, a1, s8
                  c.li         s1, -1
                  auipc        t3, 315307
                  rem          a0, ra, a6
                  srl          a1, t0, a5
                  add          t1, zero, s4
                  addi         gp, s11, 1723
                  div          s3, a5, tp
                  auipc        t3, 679593
                  c.and        s0, a4
                  csrrwi       t1, 0x340, 17
                  mul          tp, s10, s2
                  c.nop
                  c.nop
                  sll          s7, t4, s11
                  sll          a4, s5, s5
                  add          a2, s0, s7
                  c.and        s0, a5
                  c.li         s10, -1
                  c.sub        a2, a0
                  csrrc        a0, 0x340, zero
                  c.slli       s10, 21
                  c.andi       s1, -1
                  c.sub        a2, a5
                  or           tp, s6, s1
                  c.sub        a2, a2
                  mulhsu       s0, sp, gp
                  slti         zero, s11, -1707
                  xor          s6, a4, sp
                  csrrsi       s10, 0x340, 27
                  sll          zero, sp, s5
                  c.slli       t1, 18
                  sra          a2, t6, a4
                  mulh         s5, s1, s2
                  csrrci       s1, 0x340, 0
                  div          s8, t6, s2
                  lui          s7, 650439
                  sub          t0, t6, s2
                  c.nop
                  srl          a5, zero, t0
                  lui          a3, 450135
                  nop
                  auipc        s9, 727962
                  xor          a7, ra, s9
                  div          a0, t3, a6
                  slli         tp, s1, 30
                  slt          t6, s3, s3
                  sub          t0, s10, s10
                  or           s1, a7, a1
                  slti         a5, a2, 860
                  sltiu        s9, tp, -242
                  sltiu        s4, sp, -68
                  div          s4, tp, s10
                  xori         t0, tp, 139
                  mul          s9, a0, s4
                  csrrs        t4, 0x340, s2
                  ori          s2, s2, 1426
                  c.lui        t0, 26
                  mulhsu       a0, ra, t0
                  and          s11, t0, a3
                  c.or         a1, a4
                  and          s4, s2, tp
                  sra          zero, s3, t3
                  c.andi       a5, -1
                  slt          ra, a4, sp
                  mulhsu       t1, a6, a0
                  csrrs        s10, 0x340, zero
                  csrrw        gp, 0x340, zero
                  nop
                  c.addi       a1, -1
                  c.srai       a4, 2
                  and          s11, s6, a6
                  c.lui        t4, 16
                  c.addi       a3, -1
                  csrrwi       s11, 0x340, 6
                  sub          s8, a2, a1
                  c.srai       a4, 17
                  slt          s10, ra, s6
                  csrrs        zero, 0x340, zero
                  slti         a7, s1, 740
                  slti         s3, s8, -1159
                  c.add        s7, s3
                  c.andi       a5, -1
                  nop
                  mulhsu       s4, gp, s1
                  c.andi       s1, 3
                  csrrw        t4, 0x340, s7
                  sra          a2, tp, gp
                  mulhu        a5, s0, s8
                  rem          s1, t4, a6
                  c.li         s9, 29
                  c.sub        a4, a3
                  c.slli       a1, 12
                  sub          a7, t1, a3
                  mulh         s3, s6, a2
                  csrrsi       ra, 0x340, 21
                  xor          s6, t5, t3
                  div          s2, s1, s0
                  ori          tp, a4, 678
                  slti         s2, t1, 1772
                  srl          t3, a5, tp
                  or           ra, a6, s11
                  c.lui        a0, 3
                  csrrsi       a7, 0x340, 0
                  csrrci       s11, 0x340, 0
                  rem          t4, t4, a5
                  slti         ra, a4, -1648
                  csrrw        s7, 0x340, s11
                  mulh         t4, s8, s10
                  sra          a3, s4, a0
                  c.lui        s4, 20
                  c.add        s6, ra
                  csrrsi       s6, 0x340, 20
                  c.xor        a3, a2
                  nop
                  mulhsu       s9, s8, s9
                  c.slli       s6, 25
                  remu         a4, s8, gp
                  csrrs        t4, 0x340, t0
                  csrrw        a1, 0x340, t5
                  div          t4, t0, t3
                  rem          s5, a5, a2
                  or           a1, s7, t0
                  xor          s10, s0, a4
                  csrrc        a5, 0x340, zero
                  ori          a7, s10, 1799
                  c.add        s5, a6
                  slti         a4, a2, -1020
                  auipc        s7, 844452
                  c.lui        a7, 9
                  csrrw        a4, 0x340, tp
                  c.lui        a5, 7
                  nop
                  csrrwi       s11, 0x340, 21
                  c.sub        a1, a2
                  c.add        s10, sp
                  c.srli       a4, 20
                  divu         a2, s1, s6
                  divu         s2, t0, a6
                  csrrc        gp, 0x340, a5
                  c.add        s2, s4
                  csrrw        s8, 0x340, a2
                  csrrci       s7, 0x340, 21
                  and          s7, a3, zero
                  csrrc        s8, 0x340, zero
                  slt          a5, sp, s9
                  slli         a3, s0, 8
                  mulh         t3, t5, zero
                  c.addi       t1, 24
                  sll          t0, s3, a5
                  mulhu        t5, s2, s4
                  c.srai       a3, 5
                  andi         s7, a3, -824
                  rem          t0, s2, t4
                  slli         s4, t6, 15
                  c.and        a0, s1
                  c.srai       a0, 27
                  c.and        a4, a1
                  srai         s10, s6, 13
                  remu         zero, ra, a0
                  c.and        a1, a1
                  c.or         a2, a0
                  c.or         a0, a3
                  auipc        t5, 403973
                  srli         t5, a7, 26
                  rem          t1, s8, s3
                  div          t6, s8, tp
                  c.mv         t6, a7
                  addi         s0, t5, -205
                  remu         s11, a6, s8
                  c.and        a3, a3
                  xor          t6, a6, t0
                  mulhu        a3, t3, a1
                  srli         a1, s0, 7
                  csrrsi       a3, 0x340, 0
                  c.add        s6, t5
                  andi         s9, a7, -529
                  lui          s2, 30936
                  addi         t3, s1, -1414
                  or           s6, a3, a7
                  addi         s2, t5, 1029
                  mulhsu       a3, t2, a1
                  c.slli       ra, 19
                  c.nop
                  csrrw        s9, 0x340, s2
                  sra          s1, t3, zero
                  c.addi       s1, -1
                  auipc        a2, 37604
                  mulhu        s4, ra, s8
                  c.xor        a5, s1
                  c.xor        a4, a1
                  sltu         a2, t1, a0
                  ori          s2, s5, 1734
                  srli         s4, zero, 0
                  srai         s7, s2, 20
                  or           s11, t2, s8
                  c.mv         t3, s9
                  c.xor        s1, a3
                  slli         s9, s0, 29
                  addi         a5, ra, -308
                  sltiu        s10, zero, -1472
                  c.lui        s10, 6
                  c.and        a5, a0
                  lui          s5, 629121
                  c.sub        a5, s0
                  or           t6, a2, s8
                  c.andi       a1, 6
                  addi         gp, s7, -340
                  slli         s0, t4, 21
                  srli         t3, s3, 30
                  sltiu        s1, t6, -981
                  lui          a4, 575108
                  andi         a5, s1, 326
                  mulh         a5, zero, a1
                  sltiu        s2, s7, 1549
                  c.nop
                  add          s11, s2, a3
                  c.srai       a2, 28
                  andi         t0, s1, 1795
                  sub          s3, s3, zero
                  or           s6, a1, s9
                  auipc        s9, 526731
                  or           t5, t0, s10
                  slli         s1, a0, 0
                  xori         s3, s10, -892
                  ori          s9, t2, -739
                  c.mv         t1, a5
                  csrrci       t1, 0x340, 0
                  andi         t4, s5, -1991
                  c.lui        s4, 17
                  rem          a4, s10, s0
                  sltu         t5, a4, s10
                  c.and        s0, a1
                  lui          tp, 638632
                  c.srai       a1, 28
                  c.lui        a7, 16
                  mul          a5, t3, gp
                  addi         s8, s10, 985
                  c.andi       s1, -1
                  add          t4, zero, a4
                  sub          ra, gp, s4
                  c.srai       s1, 19
                  sub          t1, a5, a2
                  c.addi       a1, 11
                  slti         ra, s0, 875
                  mulh         s11, a1, s2
                  divu         s8, t4, s3
                  c.srai       a1, 15
                  c.srai       a3, 6
                  c.slli       a1, 17
                  c.nop
                  slt          s8, s2, s2
                  slti         a7, sp, 1627
                  c.and        a5, a4
                  addi         s6, s3, -1680
                  sub          s11, a6, sp
                  c.xor        a4, a2
                  srli         a1, s7, 11
                  csrrsi       s4, 0x340, 29
                  csrrci       a2, 0x340, 15
                  andi         t1, s1, 789
                  csrrc        s8, 0x340, zero
                  addi         s8, s7, 1079
                  c.add        t0, t6
                  or           t0, a0, a1
                  c.nop
                  lui          s8, 1045553
                  slti         s0, zero, -1101
                  c.srli       a0, 24
                  c.or         s0, a1
                  mul          t1, a5, s3
                  add          s11, a3, t1
                  nop
                  mulhu        tp, t2, t2
                  csrrci       ra, 0x340, 3
                  addi         s2, s8, -369
                  xori         t3, a5, -33
                  divu         s11, a0, a6
                  xori         a1, ra, 396
                  csrrw        t0, 0x340, t6
                  c.xor        s0, a4
                  srai         s6, sp, 31
                  rem          s4, a1, a1
                  andi         s3, sp, 251
                  c.add        s4, s3
                  c.add        s9, tp
                  c.add        s3, a4
                  slli         s5, a6, 19
                  srli         s1, s11, 7
                  c.xor        a4, a0
                  sll          s2, a0, t6
                  sra          s11, a6, tp
                  c.and        a0, s1
                  srl          s5, t1, s4
                  c.sub        a4, a3
                  csrrsi       gp, 0x340, 0
                  ori          t3, a5, 854
                  srli         s9, s1, 4
                  nop
                  csrrc        a1, 0x340, a4
                  mulhsu       a3, t4, s0
                  sra          gp, t2, a0
                  nop
                  slti         s7, zero, -120
                  csrrw        s4, 0x340, t2
                  c.and        a0, a0
                  c.nop
                  sra          t0, t6, s2
                  c.nop
                  c.lui        s3, 26
                  c.add        a1, t3
                  auipc        t1, 780675
                  csrrw        a0, 0x340, ra
                  slli         a0, s3, 11
                  csrrsi       s10, 0x340, 17
                  csrrw        s11, 0x340, a1
                  slti         s2, t1, -806
                  add          s1, tp, a7
                  csrrw        tp, 0x340, s8
                  sltiu        s1, a7, 505
                  c.and        a1, a2
                  c.addi       t1, 16
                  andi         a4, t2, 1550
                  csrrc        s8, 0x340, zero
                  c.srai       a1, 24
                  divu         t3, a1, s3
                  csrrwi       gp, 0x340, 15
                  addi         s10, a1, 843
                  sra          t6, s2, s8
                  csrrc        s7, 0x340, zero
                  c.add        t4, a4
                  remu         zero, s2, t0
                  csrrci       t5, 0x340, 0
                  divu         s9, a6, t3
                  nop
                  c.nop
                  andi         s10, s11, 1532
                  srl          a2, a2, t3
                  slt          s6, s5, t3
                  csrrci       a1, 0x340, 0
                  mulhu        s11, s10, s8
                  addi         s6, s9, -50
                  rem          s3, t2, sp
                  csrrs        t5, 0x340, zero
                  c.srli       a5, 7
                  slli         s0, s3, 10
                  csrrwi       tp, 0x340, 13
                  mulhsu       s8, t0, t1
                  addi         s11, gp, -2003
                  c.srai       s1, 16
                  c.slli       a0, 27
                  c.li         a0, 16
                  slli         tp, s4, 18
                  xor          s7, s8, t1
                  slli         t6, s0, 25
                  c.addi       s5, 14
                  c.slli       a3, 19
                  slli         ra, s3, 19
                  slt          s0, a3, a0
                  sra          s3, s10, s7
                  csrrs        ra, 0x340, s10
                  slt          s4, a7, s11
                  or           s0, t1, s3
                  c.lui        a7, 4
                  c.andi       s0, -1
                  mulh         s5, s0, s9
                  mulh         a0, ra, a0
                  csrrw        a3, 0x340, t1
                  sub          t1, a2, s2
                  sll          s4, gp, t0
                  srai         t4, s2, 20
                  csrrci       s11, 0x340, 0
                  c.srli       a3, 30
                  c.sub        a0, a0
                  mul          ra, s4, s10
                  c.sub        a3, a1
                  div          s0, t3, s8
                  c.sub        a2, a5
                  mulhu        s1, s7, t0
                  c.xor        a3, s1
                  mulhu        t0, s8, s7
                  xori         t1, a0, -116
                  slti         t3, t1, -636
                  ori          a1, s0, 994
                  srai         s7, t3, 8
                  mul          s5, ra, s1
                  sltu         s8, s1, s8
                  lui          tp, 709215
                  srli         s4, a4, 19
                  ori          a0, a2, 1582
                  add          zero, a4, a0
                  div          s5, t2, s4
                  slti         a0, t1, -567
                  csrrci       t4, 0x340, 18
                  csrrci       s7, 0x340, 0
                  mulhu        s2, a0, t0
                  mulhsu       s8, zero, s4
                  c.nop
                  c.xor        a2, a4
                  sltiu        s2, a3, -499
                  addi         s11, a7, -28
                  div          tp, s4, a6
                  mulhsu       t4, s8, a5
                  sra          t5, t0, t1
                  nop
                  sltiu        s0, sp, -1707
                  mul          s8, ra, s2
                  andi         t5, a6, -1265
                  sll          a4, s2, gp
                  rem          t4, t4, s11
                  c.or         a5, s1
                  xor          s7, sp, zero
                  c.srli       a3, 12
                  c.addi       s2, 31
                  nop
                  mulh         a3, zero, a1
                  csrrc        ra, 0x340, zero
                  csrrsi       a1, 0x340, 21
                  mulhsu       zero, t0, gp
                  sra          zero, a4, s9
                  add          s0, gp, s1
                  csrrci       s1, 0x340, 7
                  slt          tp, s10, s6
                  c.lui        tp, 15
                  csrrw        t3, 0x340, a0
                  csrrs        a0, 0x340, s6
                  c.and        s1, a0
                  xor          a3, t0, s2
                  auipc        a1, 422239
                  mul          gp, a5, s0
                  lui          t3, 1009055
                  ori          t5, a6, 289
                  mulhu        s6, t3, s6
                  srai         s3, t2, 17
                  xor          gp, s10, s2
                  lui          t5, 266384
                  c.xor        a1, s1
                  mulhsu       t1, s1, t0
                  remu         a0, s7, zero
                  csrrw        gp, 0x340, a0
                  ori          s10, gp, -1869
                  csrrc        s3, 0x340, zero
                  lui          tp, 751050
                  mul          gp, s3, s2
                  csrrw        a2, 0x340, a4
                  csrrsi       s1, 0x340, 0
                  c.slli       ra, 2
                  c.or         a1, a2
                  sltiu        a5, s5, -1762
                  c.mv         s9, s2
                  remu         ra, s10, s5
                  mul          a5, a0, s10
                  sub          t5, t5, s5
                  andi         s11, a6, 764
                  csrrwi       t4, 0x340, 29
                  remu         a2, tp, a3
                  xor          a3, t5, ra
                  mulhu        s11, zero, tp
                  c.addi       t6, -1
                  c.nop
                  srl          a3, zero, zero
                  mulhsu       s8, s4, a2
                  mulh         s9, a5, t5
                  xor          t5, a0, s0
                  rem          t5, zero, a6
                  srai         t5, a0, 31
                  srli         a3, a7, 17
                  c.li         s10, -1
                  c.srai       a4, 6
                  csrrw        a2, 0x340, s9
                  c.nop
                  c.and        s1, a2
                  mulh         t6, s2, t3
                  csrrc        a0, 0x340, zero
                  csrrci       t6, 0x340, 9
                  mulhu        s10, t1, a6
                  c.and        a3, a4
                  c.srai       a1, 1
                  sll          a7, a2, a0
                  xori         s4, a3, 880
                  mulh         t3, a1, s9
                  csrrci       zero, 0x340, 30
                  xor          zero, t1, ra
                  mulh         t4, s11, t2
                  xori         s5, a2, -997
                  add          s5, a3, a6
                  c.sub        a3, a3
                  csrrw        s5, 0x340, s6
                  c.nop
                  sub          s4, a6, s7
                  remu         s3, s4, a6
                  nop
                  c.srli       a4, 27
                  c.andi       s1, 14
                  lui          s7, 598592
                  sra          a4, s3, a7
                  sll          t0, s1, tp
                  rem          s9, s2, sp
                  srli         a4, tp, 7
                  addi         a0, s9, 1846
                  add          t0, s7, s11
                  c.li         ra, 12
                  ori          a5, tp, 1060
                  mul          a1, a3, s8
                  slli         a1, s4, 6
                  csrrw        a4, 0x340, s5
                  div          a4, t3, ra
                  csrrwi       t3, 0x340, 22
                  c.sub        a5, s0
                  sub          a0, t2, a5
                  ori          a0, t0, -1894
                  c.mv         a1, t0
                  csrrwi       s6, 0x340, 1
                  mulhu        a5, t3, s3
                  c.srai       a1, 14
                  and          s2, a2, a1
                  csrrw        a2, 0x340, tp
                  c.li         s9, 14
                  slti         s0, ra, 943
                  auipc        s10, 625938
                  auipc        a1, 680701
                  mulh         gp, s2, s1
                  c.srai       a4, 10
                  c.xor        s1, a4
                  srli         t4, a1, 10
                  c.srli       a4, 3
                  c.sub        a5, a2
                  srai         a3, gp, 27
                  mulhu        t6, s8, s3
                  srl          a5, s9, s7
                  srl          t5, t4, s7
                  nop
                  csrrw        tp, 0x340, s11
                  srai         a0, s1, 23
                  rem          a7, a3, a4
                  addi         t5, a0, 1239
                  slti         s8, gp, -506
                  c.sub        s0, a0
                  c.li         a2, -1
                  srai         a1, t1, 17
                  sltu         a0, s11, t0
                  andi         gp, zero, -853
                  rem          zero, a3, zero
                  remu         tp, sp, t5
                  mulhsu       zero, s10, s4
                  remu         s9, s7, gp
                  mulhu        t5, tp, s6
                  slti         t5, t6, 1514
                  csrrsi       tp, 0x340, 0
                  csrrw        s6, 0x340, t5
                  remu         a7, s8, a6
                  rem          t3, a2, t1
                  c.srai       a0, 30
                  csrrsi       a1, 0x340, 18
                  nop
                  sra          s4, ra, s3
                  c.mv         a2, s11
                  c.slli       s5, 8
                  mul          a5, gp, a7
                  auipc        t5, 683172
                  csrrc        gp, 0x340, zero
                  csrrs        a2, 0x340, zero
                  mulhu        s0, t5, s6
                  mulhu        s0, ra, t0
                  slli         s7, sp, 24
                  andi         a0, s11, 1327
                  xori         a4, s5, -659
                  div          s11, a6, s9
                  c.lui        s10, 22
                  csrrw        s8, 0x340, a3
                  nop
                  c.mv         a3, a2
                  csrrsi       s10, 0x340, 28
                  csrrsi       s0, 0x340, 3
                  csrrs        t6, 0x340, t3
                  sll          s2, t0, a2
                  add          a0, a3, a0
                  c.sub        s1, s1
                  xor          s1, zero, s9
                  c.andi       a1, 16
                  mulhu        s2, s7, ra
                  mulhsu       t4, t3, a1
                  srli         s0, gp, 0
                  addi         t4, t0, 1616
                  slli         t1, a6, 16
                  sub          t5, s3, a1
                  slli         s3, a1, 24
                  remu         zero, a7, gp
                  slt          s11, ra, s3
                  add          s9, t5, s10
                  and          s9, s2, s11
                  mulhu        gp, a1, t6
                  sub          t4, a4, zero
                  sub          a1, gp, s8
                  srai         s8, s2, 1
                  div          t3, t0, t4
                  div          t5, a7, t6
                  csrrci       t1, 0x340, 18
                  c.mv         ra, a4
                  c.srli       s1, 24
                  c.add        t5, t5
                  csrrc        t3, 0x340, zero
                  sub          s1, a5, s1
                  srl          t6, s11, s5
                  sub          s10, a2, t5
                  slti         s1, zero, -533
                  or           s7, s6, a1
                  c.mv         t1, t4
                  mulhsu       s9, a7, sp
                  sltiu        t6, t1, 467
                  srli         s9, t0, 19
                  xori         s7, a1, -1083
                  add          s3, s11, a5
                  c.srli       a5, 31
                  sltiu        s3, tp, 1722
                  srai         s6, t2, 29
                  xor          s4, zero, t2
                  c.or         s0, s0
                  rem          s10, a0, s6
                  c.and        a5, a1
                  and          s6, s2, sp
                  lui          s4, 739653
                  or           s1, sp, a5
                  c.xor        a2, s1
                  c.nop
                  c.srli       a1, 25
                  xor          a7, a7, zero
                  csrrc        s9, 0x340, zero
                  div          t4, s1, gp
                  xori         a0, a2, 1923
                  div          s4, t2, s7
                  sltiu        s1, t1, -1834
                  div          s2, tp, a4
                  c.mv         t4, s0
                  srai         s3, s5, 1
                  c.srli       a0, 1
                  c.lui        s3, 20
                  slti         a2, gp, 1583
                  csrrw        t1, 0x340, s1
                  slli         a2, t0, 8
                  csrrc        zero, 0x340, ra
                  sra          tp, tp, s8
                  srli         s4, s5, 0
                  csrrwi       ra, 0x340, 14
                  mulhsu       t0, a4, zero
                  csrrc        s1, 0x340, zero
                  c.xor        a1, a0
                  srl          t1, sp, a2
                  mulhu        a4, s7, a4
                  mulhsu       t5, t4, a1
                  sltiu        s1, t0, -2032
                  c.lui        s3, 26
                  auipc        s9, 374884
                  sub          gp, t2, a5
                  csrrsi       s5, 0x340, 14
                  srl          s8, s4, a7
                  c.or         a0, a5
                  mul          a2, s8, a6
                  addi         s10, s4, -2034
                  andi         s6, a2, 767
                  ori          tp, a7, 1132
                  andi         s9, tp, 431
                  csrrc        t5, 0x340, zero
                  auipc        s4, 335165
                  c.or         s0, a5
                  rem          s5, t6, tp
                  sltu         s4, s8, a7
                  lui          s6, 505184
                  c.lui        a4, 24
                  csrrci       s8, 0x340, 0
                  mulhu        s9, gp, t3
                  csrrc        s7, 0x340, zero
                  sltiu        s7, s0, -349
                  slli         a2, s9, 13
                  xor          a0, s11, t5
                  c.addi       a4, -1
                  csrrc        tp, 0x340, a1
                  lui          zero, 659708
                  c.srli       a5, 16
                  slt          s9, a5, zero
                  c.sub        a4, a0
                  csrrci       s9, 0x340, 21
                  c.or         a5, a5
                  sltu         zero, t6, s6
                  nop
                  c.mv         t5, a7
                  c.srli       a5, 26
                  mul          a3, a6, s9
                  auipc        zero, 996145
                  and          t3, s10, zero
                  mulhsu       t6, t4, t5
                  c.slli       s0, 4
                  and          s4, s0, t0
                  mulhu        s1, a5, gp
                  csrrs        a7, 0x340, s1
                  nop
                  slt          t0, gp, t1
                  c.sub        s1, a5
                  csrrci       t4, 0x340, 0
                  slti         s11, zero, 1134
                  slt          s10, s7, a3
                  srli         t5, s2, 3
                  c.add        a7, sp
                  mulhu        t0, t5, t1
                  addi         a4, a5, -1448
                  nop
                  mulh         s9, a0, t5
                  c.li         a5, -1
                  remu         s6, s0, a4
                  c.addi       s11, -1
                  c.andi       a0, 23
                  slti         t1, a1, -1073
                  mul          s5, t4, t4
                  slt          a1, a1, a2
                  mul          s9, tp, s1
                  c.slli       s11, 24
                  xor          s3, s0, a2
                  c.andi       a1, 22
                  c.nop
                  mulhu        s5, a3, s1
                  c.sub        a2, a4
                  sub          s0, t5, s1
                  sltu         s6, a0, s10
                  add          a1, t0, s4
                  srli         t0, a7, 23
                  sltu         a3, s2, s10
                  mulh         t5, gp, t2
                  c.sub        s0, a0
                  mul          a0, a6, a2
                  slli         a3, a5, 18
                  c.slli       s0, 24
                  rem          a7, a0, s6
                  mul          s5, t5, a2
                  slt          a2, a4, sp
                  slli         t3, t3, 8
                  mul          a5, a6, s11
                  c.nop
                  csrrs        ra, 0x340, s7
                  sub          gp, s1, a4
                  mulhsu       a0, a1, t6
                  addi         s7, t4, -779
                  mulhu        gp, a1, t5
                  lui          a2, 881651
                  c.slli       s7, 25
                  lui          a2, 611037
                  csrrc        a7, 0x340, s10
                  sra          ra, a0, s11
                  xori         t4, a1, 589
                  auipc        t5, 359617
                  slli         t3, a0, 17
                  csrrs        t6, 0x340, s7
                  csrrc        a2, 0x340, s7
                  mulhu        zero, gp, s8
                  mul          a2, s8, s7
                  andi         a7, s0, -183
                  mulhu        s2, t5, a3
                  c.addi       t0, 29
                  csrrw        t1, 0x340, s6
                  c.sub        a5, s1
                  srl          a3, a1, t2
                  c.srai       a3, 9
                  slli         a1, t5, 3
                  slli         s1, t0, 11
                  c.li         t3, 8
                  srl          s7, a4, s2
                  c.xor        a2, s0
                  c.srli       a4, 2
                  srl          s5, s4, gp
                  andi         s10, a7, 686
                  mulhsu       ra, s10, t4
                  slt          a1, t6, a7
                  slt          s7, s2, t6
                  c.nop
                  c.nop
                  sltiu        a1, s5, 451
                  srl          zero, a7, s11
                  sll          t3, a3, ra
                  c.nop
                  xor          tp, gp, t6
                  sra          t6, s5, s11
                  srai         t6, ra, 31
                  rem          s9, a5, s9
                  nop
                  slli         t3, gp, 14
                  c.andi       a4, -1
                  slti         a3, s8, -69
                  ori          t0, t3, 1687
                  c.sub        a2, a2
                  c.srli       a5, 15
                  csrrs        s8, 0x340, zero
                  c.sub        s1, a4
                  c.mv         s4, tp
                  mul          a3, gp, a4
                  srai         tp, t5, 2
                  c.andi       a0, -1
                  sll          t0, zero, s7
                  c.slli       s5, 18
                  mulhsu       s6, zero, t6
                  sll          zero, t2, a5
                  c.addi       ra, 8
                  xori         s0, s3, 318
                  andi         t6, s7, 1837
                  c.add        a1, a5
                  ori          t3, t4, 884
                  andi         s7, s10, -478
                  csrrci       a2, 0x340, 29
                  csrrci       s6, 0x340, 3
                  c.sub        s0, s1
                  mul          t3, zero, a7
                  c.nop
                  and          s0, t1, t5
                  csrrs        s1, 0x340, zero
                  c.xor        s0, s1
                  div          a7, s1, s3
                  rem          s11, a6, t6
                  c.mv         s0, s10
                  csrrsi       a7, 0x340, 0
                  lui          s7, 98041
                  sub          s3, s4, s5
                  c.or         a2, a4
                  srl          s6, t2, s8
                  c.srai       a4, 16
                  csrrsi       s2, 0x340, 0
                  sltiu        s8, t4, -497
                  rem          s7, s2, s1
                  c.and        a3, a0
                  srl          a5, a0, s3
                  c.and        a1, a1
                  c.nop
                  c.andi       s1, -1
                  mul          a3, a2, s4
                  div          a5, a3, t6
                  c.andi       a5, 25
                  c.add        t4, s5
                  csrrsi       s10, 0x340, 20
                  sra          gp, s10, s1
                  sltiu        t0, a3, 1776
                  csrrci       a5, 0x340, 0
                  xori         gp, ra, 499
                  xori         a5, s4, -1722
                  c.sub        a0, a0
                  lui          s9, 601051
                  div          gp, s10, a2
                  sra          s11, t1, t0
                  auipc        t4, 467888
                  c.addi       s3, 29
                  or           t1, a3, s4
                  slt          s6, s9, t2
                  slti         s5, a1, -912
                  nop
                  csrrsi       t5, 0x340, 6
                  c.li         s8, 18
                  divu         s8, ra, a0
                  mul          s10, s0, ra
                  sltu         zero, s5, s7
                  xor          a2, a1, s7
                  lui          t6, 327367
                  c.srai       a4, 18
                  lui          zero, 692657
                  sltiu        a0, s2, -867
                  mul          s10, t6, s6
                  srai         a5, t3, 0
                  c.and        a1, s1
                  csrrc        tp, 0x340, zero
                  c.slli       a5, 31
                  c.add        a3, s4
                  add          zero, s10, s2
                  c.srli       s0, 1
                  c.srai       s1, 1
                  mulhsu       s1, t0, s10
                  mulhu        t5, t2, t5
                  slti         t6, ra, 1973
                  mulhu        s3, a0, s2
                  c.lui        a3, 24
                  add          a2, t4, s1
                  sltiu        s4, s10, -501
                  c.li         t0, -1
                  remu         s10, s0, s4
                  srai         a0, a7, 2
                  remu         a5, a3, t1
                  c.add        s10, s9
                  auipc        ra, 597856
                  c.slli       s3, 8
                  csrrw        a3, 0x340, zero
                  csrrwi       s1, 0x340, 28
                  csrrw        t5, 0x340, s8
                  c.li         s8, -1
                  or           s0, ra, s11
                  div          a7, s11, a2
                  sra          s8, a3, a5
                  sltiu        t3, s5, -863
                  sra          t4, s9, zero
                  c.and        a5, a1
                  addi         a1, s11, -145
                  c.srai       a4, 13
                  srai         a0, gp, 10
                  c.lui        t1, 12
                  andi         a4, t1, 1441
                  addi         t3, t5, 277
                  mul          s0, t5, s9
                  sltiu        s9, s10, 1086
                  div          s0, a2, a6
                  sub          gp, a0, gp
                  auipc        s0, 630800
                  srai         s6, tp, 27
                  remu         s3, s11, a0
                  add          s3, s7, s7
                  c.slli       a1, 17
                  c.addi       s9, 29
                  c.srli       a5, 28
                  slli         s6, a2, 7
                  c.mv         a2, sp
                  csrrw        t3, 0x340, a7
                  sltiu        s3, gp, 1299
                  srli         s6, s10, 17
                  sltiu        tp, a6, -378
                  srli         s9, t2, 22
                  xor          zero, a2, t2
                  nop
                  sll          a2, tp, t2
                  c.add        s9, a1
                  rem          a7, a2, a2
                  c.srai       s0, 21
                  csrrs        s2, 0x340, zero
                  c.li         s8, 15
                  sra          zero, t2, t6
                  c.sub        a4, a5
                  sra          s2, a5, t5
                  lui          tp, 773923
                  csrrci       s4, 0x340, 0
                  auipc        a0, 500971
                  c.li         s3, 31
                  c.lui        s3, 11
                  c.li         s9, -1
                  lui          a7, 857866
                  c.srai       a3, 10
                  c.or         s0, s0
                  slli         a5, s8, 10
                  c.or         a3, a5
                  slt          s10, t6, s8
                  c.add        t6, gp
                  addi         t5, a5, -1127
                  sll          s7, s1, a6
                  c.xor        a1, a0
                  remu         zero, a5, t4
                  mulh         s7, gp, t2
                  c.xor        s1, s1
                  csrrci       tp, 0x340, 26
                  c.xor        a2, a2
                  div          a7, a7, s5
                  sub          s5, s3, t2
                  xor          tp, a5, a6
                  c.lui        gp, 8
                  divu         a3, a0, a3
                  srli         a5, t2, 29
                  or           a5, t4, a7
                  xori         a2, s7, 1092
                  slti         a7, s5, 126
                  c.or         s0, a2
                  srl          ra, s9, zero
                  lui          s3, 863301
                  csrrwi       s8, 0x340, 26
                  andi         s3, s4, -1856
                  c.mv         t5, s1
                  sra          t4, s6, a6
                  auipc        s1, 59469
                  xor          s2, s7, s6
                  remu         s11, s6, s7
                  c.srai       a3, 11
                  rem          a4, s11, a5
                  or           s1, t4, a5
                  c.lui        a7, 2
                  remu         s8, gp, s7
                  c.sub        a3, s0
                  csrrsi       s10, 0x340, 0
                  c.and        a5, a3
                  csrrs        s6, 0x340, a7
                  slt          s2, t0, a2
                  and          a7, t6, sp
                  c.add        s11, t1
                  c.sub        a2, a1
                  slli         t1, s9, 30
                  srai         a0, a2, 4
                  c.lui        t6, 18
                  sltiu        a5, a4, 686
                  andi         s10, s11, -397
                  addi         s6, a6, 564
                  ori          s9, s11, -1536
                  add          s0, s3, s4
                  csrrw        s3, 0x340, t4
                  slti         a1, sp, -354
                  andi         s11, t1, -858
                  c.srli       a0, 9
                  csrrs        a5, 0x340, zero
                  and          s3, t4, s4
                  mulhu        gp, sp, s7
                  csrrw        s0, 0x340, s9
                  c.addi       s6, 5
                  srl          a3, t0, zero
                  andi         t0, s9, -840
                  nop
                  c.addi       t6, 31
                  addi         tp, a2, 1945
                  xor          a7, a7, s6
                  csrrs        ra, 0x340, zero
                  c.nop
                  c.and        s1, a1
                  mulhsu       gp, s5, s7
                  c.nop
                  csrrw        t1, 0x340, a6
                  xori         s7, a6, -316
                  sll          t1, t0, sp
                  mulhsu       t0, s6, t5
                  ori          s3, a0, 1047
                  sltu         a7, s0, a0
                  xori         t3, a6, -364
                  slli         s5, t0, 8
                  c.li         t0, 2
                  and          t1, zero, s9
                  c.add        s2, a7
                  csrrw        a4, 0x340, s10
                  srai         tp, a6, 4
                  csrrwi       gp, 0x340, 6
                  div          a1, s3, tp
                  slli         ra, s2, 17
                  srai         a5, t1, 16
                  c.srli       a4, 19
                  andi         t3, s2, -1426
                  c.lui        a5, 10
                  c.li         tp, -1
                  sltiu        a1, s7, -740
                  divu         s1, a7, gp
                  c.nop
                  csrrw        s4, 0x340, s5
                  c.lui        t3, 3
                  srli         s1, s3, 8
                  csrrwi       s7, 0x340, 5
                  mul          a2, a3, s6
                  andi         s8, a5, -798
                  andi         ra, t3, -735
                  srl          ra, s10, s7
                  csrrc        s0, 0x340, zero
                  c.mv         s9, s11
                  andi         s11, s11, -1454
                  add          t6, a2, a1
                  mul          t3, ra, a2
                  csrrci       a4, 0x340, 0
                  csrrci       t5, 0x340, 31
                  mul          s11, s11, gp
                  c.sub        a0, a0
                  c.and        a4, a5
                  srl          s5, s10, s11
                  sll          s2, t6, s6
                  div          tp, ra, s11
                  srli         a4, a5, 12
                  csrrs        t3, 0x340, t2
                  c.xor        a4, a1
                  nop
                  addi         a7, s0, -801
                  c.lui        t4, 25
                  slt          s1, s6, t5
                  mulhu        a4, a0, s9
                  and          s10, a3, s2
                  sub          tp, tp, a5
                  xor          a3, s5, s11
                  c.and        s0, a2
                  add          a1, a2, a0
                  rem          s10, s11, s0
                  c.lui        t4, 21
                  or           a4, t3, t2
                  c.andi       a0, -1
                  c.lui        s5, 8
                  mul          ra, gp, s2
                  c.sub        a3, a4
                  slti         s0, t0, -955
                  rem          t4, a2, a3
                  csrrsi       t4, 0x340, 0
                  srli         s9, t4, 31
                  c.slli       s7, 24
                  c.srai       a2, 28
                  ori          a5, s2, 1934
                  xori         a7, s5, 1520
                  sll          a2, ra, s9
                  c.andi       s1, 11
                  slli         s7, ra, 22
                  or           t6, s8, s0
                  mul          s10, s0, t0
                  addi         zero, t5, 1737
                  andi         a4, a7, 773
                  slli         s2, s2, 5
                  c.addi       a4, 31
                  sltu         t6, t4, t4
                  c.andi       a1, -1
                  csrrc        t0, 0x340, zero
                  c.sub        a4, a4
                  auipc        t6, 512071
                  csrrw        s0, 0x340, a5
                  c.srli       a1, 19
                  c.sub        s0, s0
                  c.andi       a0, 23
                  csrrwi       s3, 0x340, 31
                  divu         t4, s3, tp
                  srl          s1, t2, s7
                  andi         s5, t1, 1996
                  c.or         s0, a5
                  xori         s3, s10, -1757
                  sra          t4, s9, s10
                  c.xor        a0, a3
                  rem          a0, s9, a5
                  sub          s9, s0, s0
                  slli         a5, s6, 3
                  c.or         a5, a1
                  lui          a5, 5848
                  sub          gp, t4, s4
                  c.andi       a1, 6
                  sra          s2, a3, a2
                  c.xor        s1, a4
                  srl          s4, a2, a2
                  slli         t4, t4, 13
                  sltiu        a2, a6, 1008
                  srai         s1, s11, 2
                  c.slli       a7, 24
                  sub          s2, a1, ra
                  slli         t4, t4, 16
                  xori         s4, s4, -1869
                  c.srli       s0, 19
                  slli         s11, s0, 7
                  sltiu        t3, tp, -1405
                  slti         a5, a6, 953
                  sra          a3, a6, a4
                  addi         t3, ra, 1791
                  and          s6, s4, s1
                  c.sub        a0, a3
                  ori          a7, s4, 438
                  lui          s1, 445893
                  srli         s10, s3, 22
                  rem          t3, s5, t6
                  csrrci       s5, 0x340, 12
                  add          t1, s2, t2
                  or           a2, t2, tp
                  sra          t3, t0, a2
                  c.srli       a1, 29
                  c.andi       a5, 13
                  c.srli       a1, 8
                  div          t5, s6, t0
                  auipc        gp, 903279
                  rem          s10, a2, a3
                  csrrsi       a3, 0x340, 22
                  c.and        a4, a1
                  auipc        gp, 12706
                  sltiu        s6, s9, 1482
                  sll          gp, s8, s6
                  c.and        a4, s1
                  and          a1, t0, sp
                  auipc        t4, 945206
                  sub          s7, s1, a0
                  slli         ra, t3, 31
                  sll          a4, s0, t5
                  c.and        a0, s0
                  c.nop
                  csrrs        t4, 0x340, a7
                  andi         s7, t0, -574
                  or           t1, s1, t3
                  csrrsi       a3, 0x340, 14
                  andi         t4, s0, -1960
                  addi         s9, gp, 1195
                  csrrci       a5, 0x340, 21
                  slt          s5, a5, gp
                  lui          s0, 333100
                  csrrw        s10, 0x340, t5
                  mulhu        s2, s6, t6
                  c.addi       s8, -1
                  c.andi       a0, 25
                  csrrc        t5, 0x340, zero
                  srl          t5, s6, s1
                  csrrwi       a1, 0x340, 22
                  c.srai       s1, 11
                  rem          a7, s7, a0
                  csrrw        s4, 0x340, a6
                  c.xor        a2, a4
                  c.addi       s5, -1
                  slli         a4, t4, 15
                  xor          s11, a5, t1
                  sub          gp, t5, sp
                  ori          t4, t4, 196
                  remu         t6, a6, s4
                  sra          t4, s4, ra
                  ori          s9, a1, -1517
                  c.slli       ra, 11
                  srai         t6, a2, 10
                  csrrc        s4, 0x340, a7
                  mulhu        s9, a3, t3
                  sra          t4, s10, sp
                  or           t4, t0, s11
                  c.or         s0, a5
                  slt          a0, s8, a0
                  add          t4, t0, s2
                  nop
                  mulh         gp, t2, t4
                  srli         t3, s2, 31
                  xori         a3, s9, 1226
                  c.srli       s1, 8
                  c.and        s0, a4
                  slli         t6, tp, 7
                  c.lui        s2, 1
                  divu         a7, t4, a1
                  auipc        s6, 1032347
                  addi         s3, s8, -323
                  csrrw        s6, 0x340, zero
                  csrrwi       s2, 0x340, 4
                  sra          t3, a4, t4
                  c.slli       a1, 29
                  xor          t3, s3, a6
                  c.srli       s0, 18
                  c.mv         s1, tp
                  slti         a2, ra, 1934
                  csrrwi       s8, 0x340, 5
                  divu         a5, gp, s3
                  c.add        ra, ra
                  mulh         s6, a0, t2
                  sltiu        ra, s9, -805
                  mulhsu       s11, ra, s6
                  add          s4, a7, tp
                  sltiu        a7, a7, -1236
                  c.li         a3, 0
                  mulhu        s9, t4, s0
                  add          s9, t2, t2
                  mulh         s9, s4, gp
                  and          s5, s2, a5
                  srli         a0, a1, 11
                  auipc        s6, 847689
                  slli         a4, a6, 30
                  c.nop
                  xor          a5, s6, t5
                  csrrsi       a2, 0x340, 0
                  nop
                  add          a1, s3, t3
                  auipc        s9, 497253
                  csrrwi       s2, 0x340, 24
                  rem          s7, t5, t4
                  c.or         a0, s0
                  c.srai       a2, 20
                  nop
                  csrrwi       t4, 0x340, 14
                  c.li         a0, -1
                  mul          t1, tp, a1
                  lui          a0, 353857
                  c.nop
                  mulh         a1, s0, t4
                  c.lui        t6, 25
                  c.xor        a2, a2
                  divu         t0, zero, s4
                  srli         s6, a5, 2
                  srli         t6, a7, 20
                  sltiu        t3, s10, -220
                  mulhu        a1, gp, a1
                  sra          tp, a5, a6
                  c.add        t6, a2
                  c.nop
                  remu         t6, a4, a5
                  slli         a0, a5, 15
                  nop
                  sltiu        s6, s2, 52
                  c.li         a3, -1
                  sltiu        a5, a5, -538
                  xor          t3, a2, a7
                  addi         s8, s3, -374
                  csrrsi       s3, 0x340, 28
                  csrrs        a7, 0x340, s10
                  c.add        s7, s9
                  divu         t0, t1, a5
                  mulh         s6, s9, s4
                  c.srai       s1, 9
                  sll          gp, s11, a4
                  mulhu        ra, s2, a4
                  c.nop
                  div          a4, a0, t2
                  c.andi       s1, 15
                  sub          s10, a2, tp
                  csrrw        a4, 0x340, s4
                  c.addi       a5, 24
                  div          zero, a2, s0
                  auipc        t6, 795023
                  lui          ra, 601751
                  csrrci       ra, 0x340, 27
                  add          s1, a7, t6
                  xori         t6, gp, 1808
                  addi         s9, a5, 498
                  c.and        a4, s1
                  auipc        t0, 121595
                  mulhu        s8, t5, s8
                  divu         s8, t6, t4
                  auipc        t4, 171357
                  csrrs        s2, 0x340, a7
                  csrrw        ra, 0x340, t5
                  xori         a3, t3, -1624
                  andi         s1, gp, -1287
                  c.lui        a7, 17
                  c.nop
                  nop
                  srli         s10, s1, 5
                  xori         a1, a7, -632
                  sltu         s1, s8, s2
                  slli         s5, a3, 29
                  sub          a0, s2, s7
                  srai         t0, s11, 27
                  c.add        t3, a1
                  and          gp, sp, s6
                  c.or         a5, a0
                  sub          zero, zero, s5
                  rem          s0, s5, tp
                  srl          s3, a4, t1
                  srl          tp, gp, t2
                  rem          a3, t5, s2
                  and          a5, tp, a1
                  csrrs        t0, 0x340, zero
                  divu         s10, a3, a4
                  c.addi       s1, 30
                  sub          t5, t5, s7
                  c.addi       a1, -1
                  sltiu        s4, s1, -10
                  c.andi       a2, -1
                  or           a2, s1, t4
                  nop
                  divu         s5, t4, s10
                  ori          s8, s2, -379
                  c.mv         t3, gp
                  mul          t4, zero, s8
                  mulhsu       s2, s2, a4
                  and          gp, tp, a4
                  c.srai       a0, 5
                  andi         s2, a2, 507
                  remu         t0, s3, sp
                  c.andi       a5, -1
                  slti         zero, s6, -906
                  sll          t6, sp, s6
                  csrrw        s7, 0x340, s6
                  mulh         a2, a0, t0
                  slli         ra, t2, 23
                  c.addi       t1, -1
                  mulhu        t5, tp, a3
                  ori          s11, a4, -1491
                  srai         a3, s4, 31
                  sltiu        gp, ra, 565
                  c.li         t4, -1
                  and          a7, s9, s0
                  c.and        a0, a5
                  c.li         s1, -1
                  slt          s8, a0, s0
                  and          s0, s11, ra
                  csrrci       s9, 0x340, 0
                  xor          s9, tp, t3
                  addi         s2, a4, -1785
                  c.srai       s1, 7
                  sltu         a0, t1, a2
                  auipc        zero, 706327
                  c.srai       a3, 30
                  sub          s6, s2, tp
                  xor          a3, s10, a0
                  c.sub        a3, s1
                  c.lui        t1, 23
                  csrrwi       s0, 0x340, 3
                  c.li         t5, 28
                  c.add        gp, s5
                  c.addi       t5, -1
                  c.li         s7, 12
                  nop
                  srli         s9, t2, 9
                  slli         s10, a7, 11
                  slli         a7, a4, 13
                  c.srli       a2, 2
                  c.xor        a2, a3
                  srai         ra, a7, 1
                  csrrc        s1, 0x340, zero
                  remu         s8, s7, a4
                  slt          a2, s9, s0
                  div          a5, s7, a1
                  c.or         a2, a5
                  slt          zero, t5, s1
                  c.andi       a5, -1
                  rem          a7, s4, t2
                  mul          s10, t1, s5
                  c.nop
                  srai         t3, s0, 15
                  c.srli       a1, 20
                  andi         t6, a7, -257
                  srl          zero, s9, a7
                  remu         s7, a7, a1
                  csrrw        s0, 0x340, a4
                  c.andi       a2, -1
                  srai         s7, s5, 18
                  c.add        a7, s7
                  nop
                  srl          s10, s3, t1
                  c.andi       s0, 1
                  xor          tp, t1, a7
                  add          a1, t5, s9
                  c.addi       a2, 25
                  c.slli       s11, 7
                  c.xor        a0, a2
                  div          s3, t0, a4
                  srli         gp, s0, 5
                  sll          s6, s2, t5
                  c.andi       a2, 3
                  xori         t3, t6, -1937
                  lui          s11, 311057
                  sll          s9, ra, a3
                  sltu         ra, s1, s3
                  slti         a3, tp, 1879
                  sltiu        a1, a6, -172
                  c.or         a4, a3
                  c.li         s0, -1
                  mulhsu       s11, s2, a7
                  csrrc        s7, 0x340, zero
                  sll          s2, s6, t0
                  rem          s9, t2, a4
                  sltiu        a7, t2, 541
                  c.xor        a4, a1
                  csrrci       a7, 0x340, 7
                  remu         t3, s2, a5
                  c.sub        a1, a4
                  mulh         gp, a7, t2
                  c.li         s4, -1
                  c.or         a2, a0
                  c.sub        a3, a3
                  c.srli       a0, 31
                  srai         zero, tp, 27
                  c.srli       a2, 26
                  csrrsi       t3, 0x340, 22
                  divu         a7, a0, a0
                  slt          ra, s3, a5
                  c.lui        t6, 26
                  div          a3, gp, a2
                  rem          t1, a2, zero
                  xori         a0, a2, 50
                  mulhsu       gp, a6, t2
                  c.addi       s9, 4
                  c.li         a0, -1
                  and          t1, s6, t2
                  andi         s9, ra, -1519
                  sub          t6, s1, a3
                  srl          t3, a5, zero
                  c.addi       s2, 15
                  csrrc        s7, 0x340, a6
                  lui          tp, 734424
                  c.mv         t6, t4
                  c.nop
                  andi         a4, s1, 127
                  c.lui        s4, 18
                  c.mv         s6, t6
                  c.xor        s0, a0
                  sll          t5, a6, gp
                  c.lui        a0, 20
                  c.srai       a3, 12
                  csrrci       a3, 0x340, 3
                  mulhu        s6, s4, gp
                  c.srli       a5, 31
                  c.nop
                  ori          zero, a5, -1237
                  csrrc        s8, 0x340, zero
                  sltu         s8, s8, s11
                  rem          s8, sp, sp
                  remu         ra, t0, t1
                  andi         s1, s3, -889
                  ori          s3, a1, 1813
                  srl          s6, t4, a5
                  c.slli       t3, 9
                  srai         ra, t4, 12
                  csrrsi       ra, 0x340, 0
                  csrrw        s6, 0x340, ra
                  csrrwi       s5, 0x340, 25
                  mul          t4, s10, s0
                  c.nop
                  andi         a1, s10, -1721
                  csrrsi       t4, 0x340, 23
                  auipc        s10, 84903
                  srli         t1, s5, 4
                  csrrs        t1, 0x340, s1
                  csrrci       gp, 0x340, 0
                  c.addi       s1, -1
                  lui          t4, 771657
                  srli         t0, s10, 14
                  slti         s2, s2, -1903
                  and          a5, sp, s5
                  srli         s1, t6, 12
                  srli         s5, s2, 17
                  csrrs        t0, 0x340, zero
                  srai         s5, s6, 6
                  add          s6, a2, a0
                  sra          t5, s5, a6
                  div          s9, s5, a6
                  c.xor        a2, a1
                  c.or         s1, a0
                  c.srli       a4, 13
                  remu         s3, s11, zero
                  mulhu        tp, a3, s11
                  and          s6, t5, t3
                  csrrc        s9, 0x340, a6
                  c.andi       s1, 29
                  c.and        a0, s0
                  c.andi       a4, 2
                  slti         t6, a3, 626
                  xori         t1, a3, -927
                  csrrci       a7, 0x340, 0
                  or           a3, s3, s5
                  or           gp, a6, s7
                  csrrs        s3, 0x340, s5
                  rem          tp, a7, s3
                  add          s2, gp, ra
                  mulhsu       t4, zero, a1
                  sll          s8, s10, a2
                  or           s5, s8, a5
                  auipc        zero, 743279
                  sub          s2, a5, s5
                  divu         s0, t6, s2
                  or           s3, s7, s5
                  or           a4, s0, s1
                  addi         tp, s1, 896
                  csrrsi       s11, 0x340, 2
                  c.xor        a4, a0
                  csrrw        a4, 0x340, s6
                  srai         a5, t4, 1
                  lui          a0, 147958
                  div          t5, s3, t4
                  c.add        t4, t5
                  c.srai       a2, 2
                  csrrc        t5, 0x340, zero
                  c.slli       t4, 21
                  slli         s6, a2, 11
                  sub          t5, s1, a4
                  c.xor        s0, a1
                  andi         a7, s6, -1863
                  andi         s7, s6, -488
                  andi         s7, s2, -1008
                  mulhu        s9, s1, zero
                  c.nop
                  sra          a2, s3, s4
                  nop
                  csrrsi       s3, 0x340, 23
                  c.srli       a3, 8
                  xor          s5, s1, a3
                  csrrc        s8, 0x340, t1
                  xori         s9, tp, 553
                  addi         t0, t0, 18
                  c.andi       s1, -1
                  sltiu        zero, t6, -1282
                  andi         s0, s8, 619
                  slli         s1, s3, 27
                  sltiu        gp, gp, -1182
                  sra          s8, a4, s8
                  c.li         a7, -1
                  slti         s0, a7, 1669
                  andi         s3, a3, -742
                  csrrc        t4, 0x340, sp
                  c.srli       a0, 27
                  c.sub        a2, a5
                  csrrsi       t1, 0x340, 22
                  c.slli       s1, 19
                  and          a3, ra, a3
                  c.sub        s0, a1
                  c.addi       ra, -1
                  c.sub        a1, s1
                  mul          a4, s2, a7
                  csrrc        t3, 0x340, zero
                  add          s10, s4, a4
                  remu         t0, tp, s11
                  sub          s0, a1, a1
                  sub          s7, t6, s4
                  c.addi       s3, 7
                  c.add        t4, t0
                  c.li         s0, 8
                  slli         s2, a7, 2
                  slt          a0, s0, t4
                  c.andi       a0, -1
                  xori         s3, t4, 336
                  sltiu        s5, s5, -956
                  sll          s4, ra, a0
                  c.addi       s9, 25
                  ori          a4, s6, -944
                  auipc        s11, 547733
                  mul          s4, s5, a0
                  and          t6, a5, s6
                  csrrwi       t1, 0x340, 21
                  or           s10, s10, s5
                  div          t4, t1, s3
                  slt          a4, a4, s8
                  nop
                  and          a4, t3, s8
                  c.or         a0, s1
                  srai         s4, a2, 21
                  csrrs        s11, 0x340, t4
                  c.nop
                  c.lui        a1, 21
                  srl          s4, tp, ra
                  sltiu        s6, t5, -474
                  mulhu        s5, t3, t6
                  sltiu        s8, zero, 461
                  nop
                  divu         a4, s2, s11
                  csrrs        ra, 0x340, s2
                  slti         ra, a1, -639
                  addi         a1, s4, -1733
                  c.add        s4, s1
                  slt          tp, s11, a4
                  xori         a3, a7, 647
                  srl          t0, a2, s6
                  sub          t1, a5, t1
                  c.or         a3, a3
                  c.slli       a1, 23
                  csrrci       a3, 0x340, 0
                  c.lui        t5, 20
                  csrrc        t5, 0x340, zero
                  csrrci       a5, 0x340, 0
                  mul          s8, a7, gp
                  slt          t0, t2, a3
                  csrrwi       s9, 0x340, 6
                  div          s9, zero, ra
                  nop
                  srai         a7, a7, 15
                  c.xor        a2, a5
                  c.li         s4, -1
                  csrrsi       a1, 0x340, 0
                  rem          s1, s2, zero
                  c.li         s8, -1
                  xor          a5, t5, s6
                  csrrc        s2, 0x340, zero
                  csrrci       ra, 0x340, 23
                  mulhsu       a0, t6, a5
                  srli         t1, s11, 4
                  mulhsu       t5, s8, s11
                  addi         t1, tp, -64
                  csrrwi       s4, 0x340, 1
                  andi         s5, s3, 492
                  c.sub        a3, a1
                  xor          a2, s4, a1
                  add          t5, s7, sp
                  lui          tp, 571249
                  xor          t3, s4, a2
                  csrrwi       tp, 0x340, 2
                  c.or         a2, a3
                  add          a4, s7, t1
                  c.andi       a1, 0
                  divu         s3, a6, t1
                  c.sub        a0, a5
                  auipc        a7, 930694
                  sub          t5, s6, a5
                  c.slli       s7, 27
                  csrrw        s11, 0x340, ra
                  andi         s8, a5, -1756
                  slt          s1, t6, zero
                  andi         s2, a2, 430
                  slt          s0, t3, gp
                  sltiu        s8, s9, 920
                  srli         a1, a3, 28
                  csrrsi       a7, 0x340, 0
                  xor          s8, a4, t6
                  div          t3, s7, s9
                  srl          a3, a5, s6
                  xori         t3, a6, 60
                  and          t3, a0, t0
                  addi         t6, s7, 961
                  andi         zero, t1, 664
                  div          s3, s2, a4
                  srl          s8, s3, a4
                  srl          a1, a1, gp
                  c.andi       a0, -1
                  c.mv         t1, t0
                  c.addi       t5, -1
                  csrrc        s11, 0x340, a4
                  c.srli       a2, 22
                  c.slli       s8, 25
                  sra          s9, t2, s1
                  sltu         a4, a7, s4
                  slt          ra, s5, ra
                  rem          a3, t1, s4
                  sltiu        s8, a7, -1709
                  slt          a3, gp, t1
                  xor          s3, a1, t2
                  and          a3, a2, s0
                  srai         t6, a7, 15
                  and          s3, s7, s10
                  c.or         s1, a0
                  srai         t3, s7, 16
                  mulh         s7, s11, s11
                  add          a2, s9, tp
                  c.sub        a2, a3
                  add          a1, t2, gp
                  or           s11, t1, t3
                  csrrc        a4, 0x340, zero
                  divu         t0, a6, s2
                  mulhsu       t4, a0, s2
                  auipc        a0, 813611
                  remu         zero, s8, t3
                  c.srai       a5, 17
                  srai         s5, tp, 27
                  auipc        s5, 417735
                  sra          s0, a0, a1
                  srli         t0, s0, 5
                  csrrw        t4, 0x340, t0
                  c.andi       a2, 27
                  sll          s1, s10, t5
                  and          s9, a3, t0
                  srli         s11, t0, 14
                  c.add        t3, ra
                  slli         ra, s11, 2
                  srai         a1, zero, 4
                  c.xor        s1, a3
                  sub          zero, zero, t3
                  auipc        s3, 720755
                  auipc        t1, 552522
                  auipc        a4, 173796
                  div          s10, t0, s1
                  srli         s4, s10, 28
                  slt          a1, ra, t5
                  and          a7, t0, a7
                  remu         t3, a5, a2
                  c.xor        a3, s1
                  remu         s6, tp, t0
                  c.sub        a0, a5
                  add          t6, s9, a7
                  csrrci       s0, 0x340, 0
                  srli         s10, a3, 12
                  srai         t6, s3, 19
                  c.li         t5, -1
                  c.sub        a0, a3
                  xori         t5, s9, 718
                  remu         s8, ra, a6
                  c.srai       a0, 12
                  c.or         a2, a0
                  c.or         a2, a0
                  sltiu        t0, s7, -764
                  add          t0, gp, t5
                  slt          s4, s9, s8
                  csrrc        a1, 0x340, zero
                  c.or         a0, s1
                  sltiu        s8, ra, -321
                  sub          t5, tp, a3
                  mulh         a7, s4, s1
                  lui          a5, 39936
                  sub          t3, a6, sp
                  mul          zero, s0, a0
                  and          a5, zero, s10
                  divu         s4, a3, t1
                  csrrc        s2, 0x340, a4
                  c.li         t3, -1
                  and          s9, s6, s11
                  c.li         s1, 12
                  div          a5, s9, s7
                  sll          s10, tp, s11
                  c.mv         t0, a2
                  xor          s4, s7, a5
                  csrrci       s10, 0x340, 10
                  c.slli       s9, 2
                  andi         a5, a3, -553
                  lui          s1, 425163
                  lui          gp, 294000
                  csrrc        s7, 0x340, a6
                  c.sub        a3, s0
                  c.xor        a3, a2
                  ori          t1, ra, 1586
                  srli         a7, tp, 17
                  c.nop
                  addi         ra, s6, -1884
                  remu         a7, s4, a1
                  c.addi       a3, -1
                  and          t5, zero, s8
                  nop
                  xor          s11, a4, gp
                  xori         s11, zero, 316
                  andi         gp, zero, 1722
                  srl          a4, s4, a5
                  addi         a2, s5, -409
                  mulhsu       t4, t2, s0
                  xori         s9, s1, 265
                  c.nop
                  c.nop
                  c.srai       a4, 26
                  slti         s3, t1, -1891
                  sltu         t0, s0, gp
                  and          t3, gp, a4
                  srli         t3, a6, 29
                  csrrwi       s4, 0x340, 10
                  c.and        a4, a4
                  rem          t1, s6, a3
                  c.andi       a0, -1
                  mulh         ra, a1, s9
                  or           s6, t6, sp
                  sra          a1, a2, a4
                  c.slli       t6, 8
                  c.lui        t3, 27
                  c.nop
                  csrrci       t6, 0x340, 1
                  lui          s5, 422640
                  sub          t3, zero, t3
                  c.nop
                  csrrwi       a4, 0x340, 19
                  xori         s11, sp, 1648
                  c.li         s2, -1
                  ori          a0, s0, 1510
                  sra          t6, s6, s2
                  c.li         a4, 18
                  slli         zero, s5, 18
                  c.slli       tp, 29
                  c.add        tp, s2
                  andi         s8, s7, 838
                  sll          gp, tp, t1
                  xor          s3, s5, s5
                  addi         s1, t0, 653
                  srl          s7, s6, ra
                  srai         a7, a4, 10
                  mulh         a4, t0, s6
                  lui          s0, 512328
                  c.xor        a5, s1
                  csrrs        a7, 0x340, s9
                  c.nop
                  div          t6, s1, s0
                  c.srai       a4, 10
                  srli         s5, s7, 7
                  divu         s5, a2, t3
                  csrrci       s2, 0x340, 0
                  c.sub        a5, a0
                  divu         s11, s7, a2
                  auipc        a2, 865490
                  c.lui        a5, 23
                  mulh         t3, s10, a0
                  add          zero, t3, s3
                  mulh         t5, t0, a3
                  srai         s6, s0, 20
                  slt          s7, a2, s8
                  c.slli       s4, 17
                  lui          s11, 161218
                  sub          s9, s10, a5
                  c.or         s1, a0
                  div          a3, s2, a4
                  or           a5, a7, a3
                  and          s8, a6, s11
                  csrrs        a2, 0x340, t6
                  c.or         a1, s1
                  c.andi       s1, 7
                  srli         s8, s7, 13
                  rem          t5, gp, t2
                  c.srai       a5, 23
                  slti         s5, a4, 1730
                  rem          zero, a7, a3
                  slti         gp, s6, 1426
                  c.xor        a4, s0
                  c.or         a3, a3
                  nop
                  c.li         ra, 5
                  sll          s1, sp, a3
                  sll          a4, t1, t4
                  csrrci       s7, 0x340, 17
                  slt          a7, s1, a1
                  c.addi       s2, -1
                  sltiu        ra, zero, 1270
                  c.andi       s1, 22
                  divu         a5, s1, a1
                  andi         a7, t5, -1659
                  auipc        t0, 798223
                  csrrsi       s0, 0x340, 16
                  csrrwi       s0, 0x340, 2
                  slt          a4, s7, a5
                  csrrs        t1, 0x340, zero
                  csrrwi       gp, 0x340, 16
                  csrrsi       s9, 0x340, 10
                  sltu         t5, t4, a5
                  c.mv         t5, a5
                  c.mv         a4, a1
                  slt          s3, s10, t0
                  rem          t6, a3, s5
                  sll          a3, a5, s9
                  andi         s10, a4, 1519
                  csrrsi       t0, 0x340, 0
                  mulh         a0, a2, t1
                  c.add        a1, tp
                  csrrc        s9, 0x340, zero
                  c.lui        gp, 6
                  csrrs        t4, 0x340, zero
                  c.slli       s11, 3
                  auipc        t5, 1036369
                  csrrc        a0, 0x340, t3
                  c.srli       s0, 26
                  slt          s9, s5, s3
                  sra          tp, s8, s9
                  csrrc        s6, 0x340, zero
                  c.li         s10, 17
                  csrrc        s4, 0x340, zero
                  remu         a7, t2, zero
                  sll          s3, gp, s7
                  c.srai       a3, 8
                  srl          s4, a2, t1
                  c.or         a3, s1
                  mulh         s5, s0, a7
                  xori         s10, t2, 1364
                  addi         a4, s1, 427
                  c.addi       s3, 19
                  c.mv         s9, t2
                  nop
                  c.add        t0, s11
                  addi         tp, a0, 1895
                  c.or         a1, a4
                  c.mv         t4, gp
                  c.addi       s6, 16
                  c.andi       a2, 21
                  lui          t4, 543404
                  c.srai       s0, 6
                  c.addi       t0, 4
                  add          a4, s3, a5
                  c.mv         s10, tp
                  csrrwi       s1, 0x340, 17
                  xor          s8, s5, a4
                  c.addi       a0, -1
                  divu         tp, a7, s4
                  csrrwi       a3, 0x340, 10
                  c.addi       tp, -1
                  lui          s2, 311303
                  srli         tp, ra, 10
                  csrrc        s9, 0x340, zero
                  c.and        a4, s0
                  and          s7, t4, s1
                  mulhu        t6, tp, t4
                  mulhu        s8, t2, s2
                  c.andi       a1, 14
                  csrrc        a4, 0x340, zero
                  slli         a2, s11, 27
                  or           a7, a2, a7
                  slt          s0, gp, a4
                  slti         s6, t6, 537
                  c.xor        s1, s1
                  c.slli       s9, 14
                  c.sub        a5, a4
                  add          s11, s5, t2
                  c.nop
                  sra          t0, t2, a6
                  slti         s3, t5, 250
                  c.andi       a5, -1
                  addi         s5, a3, 1035
                  add          s3, s6, s10
                  mulhu        t0, t6, sp
                  sra          a2, s5, a5
                  slti         s3, tp, -1369
                  csrrwi       s3, 0x340, 7
                  andi         s8, t1, -1849
                  nop
                  xor          s11, s0, s5
                  divu         a3, a0, a7
                  auipc        a1, 92008
                  c.li         a7, 21
                  rem          ra, a3, t1
                  c.and        a5, a2
                  and          s10, a0, a1
                  remu         ra, s6, ra
                  csrrc        tp, 0x340, t4
                  c.and        a3, a1
                  slli         a1, t3, 23
                  c.lui        s11, 26
                  csrrsi       t0, 0x340, 0
                  slli         t6, s9, 8
                  rem          s5, ra, t1
                  csrrc        zero, 0x340, zero
                  slt          a0, a6, ra
                  c.lui        a1, 27
                  c.sub        a3, a1
                  sub          s6, s9, a0
                  mulh         s1, t1, t0
                  sll          a5, a7, t4
                  c.srai       a2, 3
                  sub          s1, s0, a3
                  c.xor        s0, a5
                  xori         t4, s9, -76
                  rem          s3, s2, a4
                  xor          zero, a7, a5
                  rem          s5, s1, s7
                  c.addi       s4, -1
                  mulhsu       t6, t4, tp
                  xor          a7, t4, a0
                  c.srli       s1, 11
                  auipc        s2, 394900
                  c.li         s3, 0
                  auipc        tp, 935631
                  divu         s6, a0, a1
                  andi         t1, a4, -1867
                  nop
                  csrrsi       t6, 0x340, 0
                  c.addi       s8, -1
                  sra          t1, a1, a4
                  c.and        a2, a2
                  and          zero, t5, a6
                  or           s4, gp, s4
                  c.nop
                  andi         s5, s0, 625
                  c.li         s1, 19
                  csrrc        t0, 0x340, a2
                  c.nop
                  sltiu        s1, a5, -1656
                  slti         tp, s10, -517
                  c.mv         s0, t4
                  mulhu        a5, a0, s7
                  and          t6, s7, t6
                  c.lui        a7, 17
                  csrrwi       zero, 0x340, 17
                  csrrw        s3, 0x340, s10
                  c.xor        s0, s1
                  ori          a2, zero, 187
                  c.slli       s9, 27
                  c.xor        a3, s0
                  csrrci       ra, 0x340, 0
                  csrrc        tp, 0x340, zero
                  c.addi       a3, -1
                  srl          a1, a2, s1
                  xor          s7, t0, s4
                  or           s1, a5, a1
                  slli         s9, a6, 4
                  srl          a2, s8, sp
                  c.and        a5, a1
                  c.add        ra, a6
                  lui          zero, 836275
                  sltu         ra, tp, a4
                  csrrsi       a5, 0x340, 0
                  c.li         t4, 17
                  c.addi       t6, -1
                  slli         s10, tp, 29
                  mulhsu       t6, a5, s9
                  c.srai       a4, 13
                  srli         a4, t2, 13
                  or           s3, a5, s4
                  lui          s10, 548593
                  mulhsu       a2, a4, gp
                  c.andi       a3, 11
                  slli         zero, t2, 10
                  slli         gp, s9, 17
                  csrrci       s2, 0x340, 0
                  add          t0, t1, ra
                  mulhu        s8, s10, s4
                  div          s7, a0, s9
                  div          s3, t2, t5
                  rem          a4, s0, t0
                  srai         t5, s1, 16
                  rem          s8, s2, t4
                  csrrs        t6, 0x340, s8
                  srli         t1, a5, 7
                  xori         t4, s5, 1722
                  addi         t6, a7, -224
                  mulh         a3, s1, ra
                  nop
                  xori         t4, a1, 1426
                  c.addi       s3, 6
                  mul          a5, a2, a0
                  c.slli       ra, 12
                  rem          s3, tp, s8
                  slt          s8, t5, t6
                  c.or         a2, a1
                  auipc        t5, 516136
                  c.and        s1, a5
                  andi         s1, s10, -584
                  remu         ra, t4, a1
                  rem          t5, sp, zero
                  sub          s3, s8, a4
                  csrrw        s1, 0x340, s7
                  csrrs        s8, 0x340, zero
                  srai         t3, sp, 14
                  slli         a0, s4, 31
                  addi         t1, tp, -659
                  lui          gp, 736687
                  mul          a3, a4, gp
                  sll          t0, t4, t5
                  sra          a2, a4, ra
                  nop
                  c.and        a5, s0
                  srai         s4, t1, 20
                  slt          t1, tp, s10
                  sll          a1, s6, s4
                  and          s10, t0, ra
                  c.andi       a2, 23
                  div          s3, s4, s4
                  mulhsu       s11, t6, s5
                  srli         s10, t4, 31
                  xor          a2, ra, s10
                  rem          s6, a6, s1
                  auipc        a0, 1020876
                  slti         a4, gp, -2026
                  sub          t4, t2, sp
                  slli         a3, s5, 2
                  c.xor        a2, s1
                  c.andi       s0, -1
                  c.add        s2, t6
                  mulhu        s9, a2, s1
                  and          t0, s6, s11
                  divu         a1, a5, t4
                  mul          s6, t2, tp
                  ori          s5, s10, -1896
                  auipc        s9, 299617
                  sra          t3, zero, s9
                  mulhu        a5, s7, t3
                  slti         a3, s0, 1812
                  c.or         s1, a0
                  c.addi       a3, 2
                  sra          a2, a7, a2
                  c.add        s3, t2
                  c.mv         s2, s2
                  sltiu        s11, a6, -405
                  sub          gp, zero, a1
                  auipc        zero, 364274
                  sltu         a7, a4, s3
                  andi         s2, t1, -602
                  c.li         a3, -1
                  srai         s5, t0, 18
                  csrrw        t1, 0x340, a5
                  c.li         t5, 11
                  andi         s8, s0, 1112
                  c.srli       a3, 26
                  c.addi       s1, -1
                  remu         s7, s4, t5
                  sll          t3, a2, zero
                  srai         t3, s7, 25
                  divu         a0, zero, a0
                  sra          s7, ra, s9
                  add          s0, s7, a7
                  c.and        s0, a1
                  csrrs        s7, 0x340, gp
                  andi         a1, t2, -1183
                  slti         a0, s9, -1434
                  csrrw        ra, 0x340, s6
                  andi         ra, s9, 535
                  auipc        zero, 339047
                  sll          tp, a4, s2
                  sub          s2, gp, a6
                  remu         a7, s5, t3
                  and          a1, gp, tp
                  srai         gp, ra, 27
                  csrrw        a7, 0x340, s1
                  lui          t0, 558160
                  c.srli       s1, 6
                  c.add        t3, a4
                  c.lui        t3, 12
                  mulhsu       t0, s6, t5
                  div          s8, sp, sp
                  addi         s8, t4, 493
                  addi         s7, s1, 14
                  xori         a0, t6, -1229
                  c.srli       a1, 14
                  c.or         a1, a2
                  c.sub        s0, a0
                  c.and        a2, a2
                  remu         s11, t3, t3
                  c.li         t6, 2
                  or           s1, t6, a0
                  sll          s9, t5, t5
                  csrrc        s6, 0x340, a5
                  xori         t1, s1, 1168
                  c.sub        a3, a2
                  mul          s6, t3, t4
                  and          s3, s7, a6
                  auipc        s2, 723728
                  lui          t3, 842186
                  srl          s10, s7, t3
                  csrrs        t5, 0x340, s4
                  srl          s10, gp, a0
                  csrrci       a4, 0x340, 0
                  remu         t1, gp, s8
                  c.xor        s1, s0
                  addi         t3, t0, 388
                  addi         a7, t4, -40
                  slli         s7, s0, 0
                  srl          t5, s11, s9
                  c.sub        a1, a5
                  mulhu        gp, zero, s7
                  add          a7, s10, s8
                  divu         gp, a5, sp
                  divu         ra, a5, a6
                  xor          s5, s3, t0
                  c.xor        a0, s0
                  xor          t5, s6, s8
                  csrrci       s1, 0x340, 0
                  xori         ra, a4, -255
                  csrrw        a5, 0x340, s9
                  c.and        a4, a5
                  nop
                  remu         s1, t0, s1
                  c.nop
                  mulh         s6, s1, s0
                  lui          t0, 605093
                  c.mv         s6, gp
                  remu         a7, a1, a0
                  slli         a7, s2, 9
                  csrrw        s0, 0x340, zero
                  csrrwi       s11, 0x340, 24
                  or           s10, t3, s0
                  and          gp, t4, sp
                  c.and        a5, s1
                  c.nop
                  andi         s8, a5, -1074
                  c.andi       a2, -1
                  mulh         t5, t5, ra
                  csrrci       a2, 0x340, 0
                  slli         t0, t1, 9
                  c.and        a2, s0
                  c.srai       a0, 15
                  sltiu        zero, s6, 235
                  add          s1, a2, a0
                  slli         s9, ra, 29
                  divu         s0, a7, t1
                  c.li         gp, 25
                  slli         gp, t0, 15
                  divu         s5, t1, s3
                  c.addi       t0, 10
                  mulhu        s8, a1, a4
                  remu         s2, s1, s3
                  mulhsu       s7, t3, a7
                  csrrci       s5, 0x340, 4
                  c.or         s0, s0
                  sub          t4, t5, a0
                  c.srli       a4, 1
                  mulh         s8, t1, tp
                  csrrw        gp, 0x340, s2
                  lui          s9, 653026
                  remu         s1, t6, a0
                  addi         s6, s10, 1882
                  c.sub        a1, a0
                  add          a7, t6, a7
                  c.li         a2, -1
                  div          gp, s3, a3
                  sltu         s8, s0, s5
                  rem          s10, t4, a6
                  sll          a4, a7, tp
                  sltu         t5, t3, t6
                  c.mv         s5, a6
                  mulhsu       tp, a1, s1
                  add          a4, t2, a5
                  c.li         s8, -1
                  or           a0, tp, gp
                  and          t1, s1, t3
                  csrrs        t3, 0x340, zero
                  mulhsu       t5, t1, a7
                  auipc        a0, 196187
                  mul          s3, t0, s11
                  csrrc        s8, 0x340, zero
                  rem          t1, a2, s2
                  lui          s9, 582733
                  sll          t5, s5, a0
                  srl          a5, s6, s9
                  csrrwi       s1, 0x340, 18
                  csrrs        tp, 0x340, zero
                  mulh         t0, s4, s0
                  csrrc        a4, 0x340, zero
                  srl          a2, a2, s7
                  sll          a3, zero, t6
                  xori         s10, tp, -1729
                  c.li         s2, 24
                  xori         t0, t4, -95
                  c.andi       s1, -1
                  auipc        a1, 973523
                  slti         a4, s11, -304
                  c.sub        a5, a1
                  xor          s0, zero, sp
                  csrrsi       s6, 0x340, 21
                  csrrwi       s3, 0x340, 19
                  csrrs        s8, 0x340, zero
                  c.add        t3, t3
                  c.xor        a3, a1
                  sltu         a7, a0, s11
                  c.addi       gp, 17
                  c.andi       a4, -1
                  and          t0, t6, gp
                  sub          s7, s1, s5
                  c.srli       s0, 17
                  c.addi       a3, -1
                  c.srli       s1, 3
                  mulh         tp, t3, t2
                  csrrci       a0, 0x340, 0
                  c.srai       s1, 3
                  csrrci       s4, 0x340, 4
                  csrrsi       ra, 0x340, 7
                  c.or         s0, a4
                  c.add        s3, s1
                  c.lui        s11, 1
                  c.add        s10, s5
                  mulh         zero, s4, t0
                  c.srli       a2, 29
                  auipc        a1, 315484
                  slt          zero, gp, t6
                  mulhu        t3, s6, t5
                  c.add        tp, s5
                  divu         s7, a2, s9
                  nop
                  add          a3, tp, s3
                  mulhsu       s1, s9, s2
                  xori         t0, s3, 1456
                  sub          t5, s6, t6
                  c.nop
                  c.mv         gp, a6
                  sltu         s2, s0, s1
                  mulhsu       s1, sp, t1
                  div          t0, a3, s4
                  ori          a2, s11, 833
                  add          s10, a0, zero
                  c.andi       s0, 20
                  c.and        a0, s1
                  slt          s9, s6, s7
                  c.andi       a1, -1
                  auipc        a0, 782952
                  c.addi       s8, 31
                  csrrw        s1, 0x340, s10
                  mulhu        ra, a3, a7
                  mul          t0, a4, s5
                  c.srli       a2, 4
                  c.srli       a5, 23
                  c.lui        s6, 25
                  c.mv         s8, t2
                  mulhsu       s10, t3, s9
                  andi         s0, s6, 527
                  sra          s10, t5, s2
                  mulhsu       s6, t0, tp
                  xor          s6, tp, a0
                  mulhsu       s10, s1, s0
                  c.li         s4, 4
                  sll          tp, a4, a7
                  slti         s8, t0, 1856
                  srl          a4, a4, gp
                  c.srli       a1, 20
                  c.lui        s10, 11
                  c.slli       t4, 2
                  slli         a5, a1, 30
                  c.sub        a2, a0
                  slt          a4, zero, s7
                  c.srai       s0, 12
                  c.sub        s0, a4
                  mulhu        zero, s5, s7
                  c.or         s1, a2
                  srli         a1, a7, 22
                  csrrci       gp, 0x340, 15
                  rem          zero, a2, s5
                  c.srai       a1, 19
                  c.srli       a2, 6
                  sub          t0, s11, sp
                  csrrci       t1, 0x340, 0
                  c.andi       s0, -1
                  csrrsi       a5, 0x340, 0
                  csrrsi       t6, 0x340, 0
                  mul          a4, sp, ra
                  csrrw        t4, 0x340, t4
                  sll          a1, a2, s10
                  c.mv         tp, a5
                  mulh         s2, sp, a7
                  nop
                  csrrc        a0, 0x340, zero
                  sra          s0, t6, a5
                  or           a3, a4, a5
                  sll          gp, a2, a3
                  sra          s0, s8, s8
                  srai         a7, s3, 19
                  rem          t5, s8, s2
                  c.lui        s3, 15
                  rem          a2, a4, t4
                  mulhsu       a2, s6, zero
                  or           a5, a6, s1
                  andi         a2, t5, -1896
                  c.and        a0, a3
                  nop
                  mulhsu       s11, a3, a7
                  csrrs        zero, 0x340, a5
                  mul          a2, a3, tp
                  c.addi       s5, 23
                  sra          t5, s2, sp
                  and          a2, s4, s0
                  addi         t5, a0, 1428
                  srli         a1, s1, 28
                  slt          t0, a6, s8
                  mulh         s0, s5, s2
                  or           s2, zero, a0
                  and          a0, t6, zero
                  srai         t1, a1, 7
                  remu         a1, s3, a7
                  slli         s3, s5, 29
                  mulh         a7, a0, s1
                  sltu         s5, s0, s9
                  csrrc        zero, 0x340, zero
                  lui          a3, 20458
                  c.and        s1, a3
                  mulhsu       s10, s4, t5
                  and          s4, s1, a3
                  c.andi       s0, -1
                  srai         ra, t6, 31
                  c.addi       t3, -1
                  slt          t6, a2, zero
                  div          s5, a2, gp
                  slti         a3, t5, 562
                  ori          t5, s8, 817
                  c.srai       a3, 25
                  srli         a1, s7, 7
                  andi         s3, a5, -613
                  remu         a2, s4, gp
                  c.srai       a0, 10
                  andi         s10, s0, -199
                  mulhsu       s2, s1, gp
                  csrrs        s5, 0x340, s3
                  c.lui        t0, 23
                  c.nop
                  sll          a0, s3, s4
                  srl          gp, a6, s1
                  mulhu        t4, t1, s6
                  remu         t5, a7, s10
                  and          t3, ra, s0
                  c.mv         ra, a7
                  csrrs        s10, 0x340, s1
                  c.mv         a2, t4
                  or           s5, t1, s5
                  nop
                  xor          t6, a7, zero
                  c.and        s0, a1
                  xor          a1, a6, s5
                  divu         a0, sp, tp
                  addi         s8, s9, -435
                  srai         gp, gp, 27
                  srl          s0, s5, zero
                  srli         s0, zero, 10
                  mulh         t6, a3, t1
                  mul          tp, a5, t1
                  mulhu        a5, a5, s4
                  ori          s4, t6, -1503
                  c.add        s9, s8
                  div          a3, t1, s5
                  lui          s2, 221711
                  sll          t1, tp, s11
                  divu         t3, s8, a3
                  c.andi       a2, -1
                  mulh         zero, t2, s8
                  csrrw        a4, 0x340, zero
                  csrrc        a1, 0x340, sp
                  div          s9, a1, a0
                  csrrc        t1, 0x340, a7
                  csrrc        s11, 0x340, a3
                  c.lui        a7, 7
                  add          a4, t1, gp
                  mul          t4, a5, gp
                  srai         a5, t1, 6
                  sll          s0, a5, s4
                  c.and        s1, a5
                  xor          s1, a2, a6
                  remu         s3, sp, sp
                  c.addi       a2, 31
                  c.xor        a5, a5
                  or           zero, s0, a6
                  csrrsi       s4, 0x340, 5
                  xori         ra, a0, 455
                  slli         tp, t3, 2
                  div          t3, s1, s5
                  c.lui        a1, 27
                  or           t0, zero, t2
                  c.mv         t3, ra
                  add          tp, s4, a5
                  lui          t4, 564521
                  mulhsu       s3, s5, t2
                  xori         a4, a6, -90
                  auipc        tp, 821683
                  csrrs        s5, 0x340, zero
                  lui          s9, 746536
                  divu         s7, s1, sp
                  srli         a3, t3, 27
                  c.xor        a3, a5
                  div          s2, s3, t0
                  csrrci       s6, 0x340, 30
                  c.sub        a2, a2
                  c.add        a5, s11
                  c.addi       t3, -1
                  srli         a1, a6, 3
                  c.xor        a5, a1
                  mulh         t3, s1, t0
                  mulhu        s6, tp, t3
                  addi         s9, s1, 1803
                  or           s9, t0, ra
                  c.andi       s0, 31
                  and          s11, t2, t6
                  mulhsu       s5, a3, t4
                  c.sub        a3, a1
                  srai         zero, s7, 9
                  or           t4, t2, s1
                  csrrwi       t4, 0x340, 27
                  or           s9, gp, s11
                  rem          ra, t3, zero
                  c.add        s10, gp
                  csrrwi       t5, 0x340, 17
                  c.and        a2, a1
                  c.xor        a5, s0
                  c.mv         t5, t0
                  c.li         s6, -1
                  slli         ra, s3, 7
                  csrrc        t4, 0x340, zero
                  andi         s5, a3, 1094
                  c.nop
                  mul          s8, a3, s10
                  slt          s2, ra, s10
                  sltu         tp, s0, t0
                  srl          s2, s2, s1
                  addi         s11, t3, 1416
                  c.srai       s0, 1
                  csrrci       tp, 0x340, 0
                  mulhsu       a5, tp, s8
                  auipc        a2, 578301
                  c.srli       a2, 22
                  mulh         s1, t1, s7
                  c.slli       t6, 29
                  mulhsu       t6, s4, a7
                  c.li         t4, -1
                  c.nop
                  csrrwi       s10, 0x340, 10
                  divu         t5, s11, t0
                  addi         a4, s1, -1193
                  csrrw        a1, 0x340, a2
                  c.xor        a4, a1
                  srl          a5, t2, t0
                  slti         s9, a5, 1398
                  rem          t5, ra, t5
                  csrrwi       t0, 0x340, 30
                  sltu         t6, s7, a6
                  xor          a7, s5, s0
                  c.nop
                  mulh         zero, t3, a5
                  csrrw        s10, 0x340, tp
                  xor          a0, tp, a2
                  c.mv         a1, a5
                  csrrs        s0, 0x340, zero
                  sra          s5, t3, s0
                  mul          s9, gp, a0
                  c.lui        s10, 3
                  mulhsu       a3, t6, t2
                  rem          s8, a3, t6
                  xori         t4, a1, 1028
                  c.or         a4, a1
                  srai         t0, t2, 7
                  mulh         t1, sp, a5
                  c.srli       s0, 15
                  c.and        a1, a5
                  c.nop
                  c.mv         tp, s7
                  csrrwi       a4, 0x340, 6
                  sra          a7, a0, t3
                  c.xor        s0, a5
                  div          s5, a7, tp
                  xor          gp, a4, s4
                  lui          zero, 786947
                  slt          s6, a1, s5
                  c.or         a4, a4
                  sltiu        zero, a2, -503
                  mulhsu       s11, t1, sp
                  c.nop
                  c.nop
                  c.or         a0, a4
                  and          s2, sp, s0
                  c.or         s1, a0
                  c.xor        a2, a3
                  csrrsi       s0, 0x340, 0
                  srli         a7, s0, 13
                  nop
                  csrrwi       a1, 0x340, 31
                  c.li         s2, -1
                  remu         a2, a5, s7
                  slti         ra, sp, 956
                  srli         s11, t4, 6
                  addi         t6, a5, 939
                  srai         t4, s4, 8
                  sll          zero, ra, s8
                  auipc        a2, 680233
                  mulhu        t5, tp, a6
                  c.li         s4, 18
                  sub          a5, t3, ra
                  slli         a3, s5, 23
                  slti         s7, s3, 1565
                  csrrsi       a5, 0x340, 0
                  and          s1, s5, s2
                  c.li         s11, -1
                  c.lui        s5, 3
                  xor          t5, sp, s6
                  auipc        ra, 326279
                  mulhu        s4, a2, a0
                  andi         s9, t1, -1634
                  c.add        t4, s3
                  div          t1, a6, s10
                  or           s10, t1, s6
                  lui          s0, 980741
                  mulhu        a7, s9, s4
                  srl          t5, a2, t3
                  andi         t5, a4, 1613
                  c.li         ra, 16
                  sltiu        s11, t6, -353
                  c.andi       a2, 30
                  addi         s0, s0, 1439
                  c.li         s3, 13
                  slli         a2, gp, 20
                  csrrci       s3, 0x340, 6
                  c.slli       t4, 11
                  divu         s11, s4, s11
                  sltu         s6, t0, s4
                  c.srai       s1, 16
                  c.or         a0, a0
                  slt          t3, a0, s5
                  slti         a5, t1, -968
                  auipc        s10, 535355
                  c.srli       a1, 2
                  c.li         t6, -1
                  srli         tp, t4, 14
                  and          s10, ra, zero
                  c.nop
                  sll          a5, a0, t3
                  slli         s10, s6, 2
                  sltiu        a2, t0, 1540
                  xor          a5, s1, t3
                  c.or         a4, a1
                  c.andi       a5, -1
                  c.li         s3, -1
                  sub          s1, t6, t5
                  srai         a5, s5, 24
                  xor          s1, s1, a2
                  slt          s4, t3, s5
                  c.sub        a1, a5
                  addi         zero, a4, 1947
                  c.srli       a5, 1
                  and          s3, a3, a4
                  c.xor        a3, a0
                  sll          t3, a0, gp
                  or           s1, s7, s2
                  srl          a1, a4, s2
                  c.or         a1, a1
                  div          s0, s11, zero
                  c.mv         s10, a0
                  csrrwi       a2, 0x340, 21
                  mulh         s4, t2, t5
                  srli         t3, tp, 31
                  slli         zero, t4, 28
                  xori         t6, s7, 1549
                  slt          tp, sp, s10
                  csrrc        a2, 0x340, zero
                  mulhu        gp, s8, a4
                  c.xor        s0, a0
                  xori         s8, t4, -2004
                  mulh         t6, sp, t1
                  c.srli       a2, 1
                  rem          t1, s3, a1
                  srli         a0, a5, 23
                  sra          t4, a1, s5
                  slli         s5, t2, 1
                  addi         s2, t0, 403
                  divu         ra, a2, s7
                  add          a3, tp, a2
                  c.andi       a0, 1
                  divu         s2, a1, s2
                  and          s9, a6, tp
                  csrrw        a7, 0x340, a6
                  c.add        s8, a3
                  csrrs        tp, 0x340, t2
                  c.andi       a0, 29
                  c.or         s0, a2
                  xori         tp, a1, -627
                  ori          a7, t0, -1288
                  c.srai       a3, 2
                  addi         t0, s0, -1582
                  sltu         s7, sp, t1
                  divu         s10, a0, a7
                  csrrw        zero, 0x340, a0
                  xor          a0, t3, a1
                  srai         s10, t5, 21
                  c.addi       t5, -1
                  sltiu        a3, s7, -1175
                  sll          a1, sp, zero
                  mul          s1, s1, zero
                  csrrwi       t6, 0x340, 25
                  mulhu        s5, sp, a2
                  c.add        a5, t4
                  c.and        a1, a3
                  csrrs        t6, 0x340, zero
                  slli         s11, s5, 18
                  c.add        s9, s0
                  sltu         t4, s1, t6
                  ori          a7, tp, 804
                  c.li         t1, 9
                  slti         t1, zero, -998
                  c.andi       a1, 13
                  sub          s7, a1, a4
                  xori         a7, t1, -816
                  divu         t1, ra, s10
                  divu         s10, sp, s8
                  c.add        s4, s10
                  c.srli       a2, 1
                  addi         a4, s8, -804
                  mulhu        s2, a5, zero
                  c.xor        a3, s1
                  c.sub        s1, a4
                  csrrci       s8, 0x340, 0
                  srli         t4, t2, 25
                  lui          zero, 6913
                  csrrw        a3, 0x340, s9
                  c.addi       a3, 5
                  andi         s9, t4, 856
                  csrrsi       gp, 0x340, 0
                  c.add        s2, s3
                  and          s1, zero, s8
                  lui          a3, 369781
                  mulhsu       s2, zero, s5
                  auipc        s11, 909654
                  divu         s8, zero, s9
                  csrrsi       s1, 0x340, 6
                  remu         s2, zero, s4
                  slt          zero, zero, a4
                  sltiu        a7, s9, -759
                  csrrc        t5, 0x340, zero
                  auipc        s8, 973921
                  div          t6, sp, a7
                  csrrsi       s5, 0x340, 0
                  sltu         s2, tp, t2
                  slt          t4, s4, t0
                  c.andi       s1, 20
                  c.addi       t1, -1
                  c.li         a0, 5
                  divu         s10, s10, a2
                  c.or         s1, a3
                  sltu         t6, s0, t6
                  mulhu        t3, t6, a6
                  sra          s7, t2, s9
                  mul          s2, t1, tp
                  c.xor        a3, a4
                  c.sub        a5, a4
                  c.srli       a1, 8
                  mul          s2, s4, s11
                  c.slli       tp, 3
                  auipc        s0, 1047383
                  c.srli       a5, 22
                  c.or         s0, a2
                  srl          a0, s6, s10
                  add          a4, s10, t0
                  csrrs        t6, 0x340, zero
                  c.andi       a1, 23
                  srai         ra, t3, 6
                  c.slli       gp, 12
                  ori          ra, s9, -653
                  mul          s0, s5, a5
                  sltu         a0, t1, s3
                  sra          s5, tp, t2
                  rem          tp, a1, s1
                  srai         s3, s11, 26
                  csrrc        a4, 0x340, zero
                  mulh         a7, a2, gp
                  c.lui        a5, 10
                  mulhu        a5, a0, t1
                  mulh         gp, a3, a0
                  mulhsu       t4, t6, s2
                  c.srai       a5, 10
                  srl          s3, t3, s3
                  or           a0, t1, s8
                  ori          t3, a1, 1003
                  lui          t5, 397210
                  xori         a0, s6, 1877
                  c.nop
                  c.nop
                  sltiu        a5, t6, 178
                  c.sub        a1, a4
                  c.add        t6, s1
                  rem          a1, a2, t0
                  add          s1, s10, tp
                  c.slli       a7, 6
                  ori          ra, zero, -1350
                  c.slli       gp, 4
                  c.and        a3, a0
                  csrrwi       s2, 0x340, 28
                  c.andi       a0, 30
                  c.andi       a0, -1
                  lui          s6, 76916
                  c.add        a4, s2
                  srl          a5, a7, s5
                  sll          s7, t1, s7
                  csrrci       a1, 0x340, 0
                  sltu         a0, t5, t4
                  addi         a7, s10, 493
                  sra          t4, a6, a5
                  csrrw        s0, 0x340, a7
                  addi         a7, a4, -320
                  sll          s1, a7, gp
                  mul          a1, a2, s7
                  andi         a0, s9, 90
                  add          s2, s4, a7
                  slt          a5, s9, sp
                  nop
                  xori         t5, a7, -390
                  mulh         s3, s4, a7
                  c.mv         t6, a5
                  rem          ra, a5, t0
                  c.srai       a5, 1
                  c.or         a4, a5
                  c.andi       s1, 16
                  c.xor        s0, s0
                  ori          s3, t2, -1404
                  c.and        a1, a4
                  c.nop
                  csrrw        s8, 0x340, s1
                  c.slli       s11, 11
                  sltu         s1, s0, sp
                  lui          s7, 1005006
                  add          s8, s11, t3
                  srl          zero, s11, t1
                  add          a4, tp, t4
                  add          a1, s3, ra
                  c.add        t0, s8
                  c.xor        a5, a3
                  lui          a2, 95720
                  srai         zero, a2, 31
                  c.and        a3, s0
                  mul          s2, ra, a5
                  sltu         s3, a1, a2
                  csrrci       t1, 0x340, 0
                  c.andi       a1, -1
                  andi         tp, s9, 1670
                  c.li         a5, -1
                  mulh         tp, t0, t0
                  srai         gp, s6, 26
                  rem          a3, s0, tp
                  c.lui        s0, 11
                  c.addi       s4, 15
                  csrrwi       gp, 0x340, 30
                  remu         s1, t0, s9
                  csrrci       a2, 0x340, 0
                  csrrwi       a1, 0x340, 29
                  csrrsi       s7, 0x340, 0
                  csrrc        s10, 0x340, s11
                  srli         a2, s9, 24
                  and          gp, s4, s10
                  csrrw        t3, 0x340, s7
                  csrrc        t3, 0x340, t5
                  sll          a2, a6, s6
                  sll          s9, tp, zero
                  and          a7, t3, a0
                  lui          s8, 569830
                  c.slli       a3, 25
                  csrrs        s10, 0x340, s1
                  c.srli       a5, 26
                  sra          s11, a7, gp
                  slti         t3, a5, 1867
                  nop
                  c.add        s4, tp
                  c.andi       a3, -1
                  remu         s0, a0, a0
                  sra          t3, s9, s6
                  mul          tp, ra, s11
                  srli         s11, t3, 10
                  ori          s2, a4, 408
                  c.srai       a0, 4
                  c.srli       s0, 3
                  nop
                  rem          t1, s11, s10
                  xor          t3, s7, s2
                  divu         s4, t2, s5
                  andi         a2, s2, -721
                  sub          s5, ra, s1
                  c.mv         a0, a0
                  c.add        s10, a2
                  auipc        s8, 502081
                  div          tp, t3, s9
                  c.and        a5, a3
                  c.sub        s0, a1
                  xor          s2, t5, t3
                  srl          a0, a4, gp
                  srl          s5, s7, a5
                  slti         t0, t1, 41
                  nop
                  csrrs        t1, 0x340, t4
                  rem          t1, t4, t3
                  c.xor        a1, a0
                  sltu         s3, sp, gp
                  c.and        a4, a5
                  csrrs        s0, 0x340, zero
                  csrrsi       s10, 0x340, 19
                  c.mv         s3, s6
                  remu         a3, a0, s11
                  c.srli       a5, 29
                  c.srai       a1, 23
                  c.or         a0, a2
                  c.slli       s7, 15
                  slli         s10, s9, 7
                  c.sub        a4, a1
                  mulhu        a2, a2, t3
                  slt          s5, s4, t3
                  c.mv         s7, a4
                  csrrsi       s8, 0x340, 28
                  mulhu        a1, a5, s6
                  c.srli       s1, 9
                  mulh         s2, a1, a2
                  c.and        a5, s0
                  addi         s7, s6, 278
                  c.and        a3, s1
                  addi         gp, a0, -508
                  add          a5, gp, t5
                  mulhu        t4, a7, s9
                  mul          a5, gp, a7
                  sll          s4, tp, ra
                  csrrsi       s10, 0x340, 0
                  sll          s1, a6, s6
                  andi         s5, t6, -876
                  auipc        s8, 1003652
                  addi         t4, t3, -1316
                  c.addi       s8, -1
                  ori          s7, t2, -1881
                  xor          s5, a0, t6
                  c.sub        a2, a1
                  slti         s4, a4, 1028
                  divu         s3, a0, t5
                  rem          s8, t5, s7
                  slti         s11, a3, -1395
                  c.srli       a4, 2
                  mulh         s3, a5, t0
                  mulhu        t3, s1, ra
                  and          a2, a7, s10
                  auipc        t3, 1007195
                  addi         s9, s7, 1420
                  sub          tp, a7, t5
                  c.li         a4, 16
                  mulhu        t4, s2, t1
                  csrrc        a0, 0x340, zero
                  andi         s1, a7, 918
                  srl          t0, s7, s5
                  csrrwi       a1, 0x340, 11
                  c.addi       s2, 29
                  xori         s0, a5, -1827
                  lui          a4, 872289
                  xori         s5, s9, -7
                  c.mv         a5, t3
                  c.li         a2, 26
                  csrrc        t3, 0x340, t2
                  slt          s10, t0, t0
                  sltu         t5, s4, t2
                  csrrw        tp, 0x340, t5
                  auipc        t6, 715237
                  xor          s10, tp, s5
                  csrrci       a3, 0x340, 0
                  lui          a2, 801985
                  rem          a7, t4, a5
                  mulh         s0, tp, a0
                  srai         s7, a2, 8
                  c.add        ra, a3
                  divu         s8, s3, s6
                  xori         a0, a7, 1518
                  or           t5, s11, a6
                  c.and        s0, s1
                  c.lui        s10, 27
                  or           s11, t4, zero
                  c.srli       a3, 9
                  mulh         t0, s3, sp
                  csrrs        s9, 0x340, zero
                  mulhsu       s9, s5, s5
                  sltu         t6, s8, s1
                  csrrc        a5, 0x340, a7
                  mul          t1, a3, s4
                  andi         s5, s9, 1321
                  srl          s2, t1, s9
                  sltiu        s7, s8, 1380
                  mul          a2, s0, t3
                  addi         s3, gp, 1696
                  slli         ra, a0, 15
                  c.andi       a2, 2
                  nop
                  srl          a5, s2, a5
                  sltiu        s2, a6, -1388
                  rem          a7, t4, a4
                  c.srli       a1, 5
                  or           s11, s9, zero
                  divu         ra, gp, s11
                  c.srai       s0, 8
                  lui          s5, 274121
                  csrrw        s11, 0x340, ra
                  srl          s7, t0, gp
                  c.add        t6, s5
                  c.nop
                  divu         s5, s8, s2
                  xor          ra, tp, t5
                  div          s11, t3, s2
                  mulhsu       a3, zero, a7
                  slli         s0, t5, 17
                  c.mv         s0, s6
                  c.li         s7, 3
                  c.add        s3, s1
                  c.li         tp, -1
                  slt          a4, tp, s11
                  lui          a5, 411225
                  slt          s0, s1, s7
                  sub          a2, s3, t5
                  sltiu        a2, a2, -396
                  slt          s9, s9, a3
                  mulhu        s0, a3, zero
                  csrrw        s11, 0x340, s1
                  c.andi       a5, 3
                  srli         s1, s6, 21
                  srli         ra, a1, 14
                  csrrwi       s0, 0x340, 8
                  addi         tp, a5, 1312
                  c.lui        s11, 4
                  sll          a0, t3, s6
                  c.or         a4, a0
                  csrrc        a2, 0x340, t0
                  ori          s6, a3, 1353
                  ori          s6, s6, 266
                  c.srli       s0, 26
                  c.nop
                  divu         s4, t2, a4
                  c.srli       a3, 1
                  div          s7, zero, gp
                  and          s0, s0, t3
                  c.slli       t0, 16
                  mulhsu       s5, t6, t3
                  c.mv         t5, t0
                  slli         t0, t1, 26
                  c.addi       s7, -1
                  c.nop
                  c.sub        a1, a1
                  and          t3, t3, sp
                  srli         t4, s10, 12
                  c.srai       a3, 10
                  c.srai       a3, 25
                  c.add        tp, a2
                  c.lui        s4, 3
                  srli         s11, a2, 0
                  auipc        a5, 360119
                  xor          s2, a1, t0
                  divu         t6, s0, a4
                  slt          gp, s0, t4
                  add          s10, ra, s5
                  sltu         a2, s5, t5
                  div          s7, t3, gp
                  c.srai       a5, 27
                  mulh         ra, t5, s9
                  auipc        t3, 936293
                  csrrci       s2, 0x340, 0
                  sltiu        s8, zero, -1609
                  sltu         tp, s9, s10
                  c.mv         a2, tp
                  srli         a2, t6, 9
                  xori         t3, a1, 689
                  csrrc        t4, 0x340, s7
                  mulhu        a4, a6, s7
                  divu         a3, s5, s6
                  sltiu        s4, t1, -1800
                  c.or         a0, s1
                  csrrs        t4, 0x340, zero
                  csrrsi       a1, 0x340, 24
                  csrrc        a5, 0x340, t1
                  ori          s11, s4, 1694
                  div          a5, s7, s2
                  c.sub        a0, a3
                  c.srai       a3, 21
                  csrrci       s8, 0x340, 0
                  auipc        gp, 328069
                  srai         s7, s7, 10
                  csrrsi       a3, 0x340, 0
                  slti         a3, a4, 111
                  srl          s10, zero, a5
                  c.mv         s3, t3
                  csrrw        t0, 0x340, s6
                  or           t6, a0, t2
                  rem          s8, t5, a3
                  srl          s4, a4, s11
                  addi         tp, a1, 131
                  c.li         a3, -1
                  c.nop
                  c.srli       a2, 11
                  ori          s9, a3, 48
                  sll          s2, a6, a4
                  c.add        t1, a7
                  c.srai       a1, 1
                  srli         a4, t4, 17
                  c.addi       t1, -1
                  c.nop
                  add          tp, sp, a7
                  c.nop
                  auipc        t1, 646545
                  c.slli       a5, 4
                  ori          s8, a0, 1040
                  c.lui        gp, 15
                  mulhu        s9, a1, s9
                  csrrc        a5, 0x340, zero
                  sra          s6, s3, s9
                  sltu         s4, s11, t3
                  c.li         gp, 1
                  srli         t4, ra, 14
                  c.addi       a5, -1
                  sra          s11, a5, a2
                  mul          a3, s10, s0
                  div          s0, a2, t5
                  or           t6, t0, s0
                  csrrs        s0, 0x340, ra
                  c.nop
                  addi         a2, t5, 107
                  div          a0, t6, s5
                  sltiu        s8, a0, -183
                  slti         a5, t4, -326
                  c.andi       a5, 10
                  c.sub        s1, a2
                  auipc        a2, 183339
                  remu         s11, t0, t4
                  lui          gp, 599147
                  c.nop
                  csrrw        t5, 0x340, t0
                  c.andi       s1, -1
                  srai         zero, s7, 20
                  c.or         s0, a4
                  ori          s3, s7, 1877
                  c.or         a3, a0
                  sub          s6, t4, s11
                  c.sub        a1, a0
                  mul          s1, a7, t1
                  slti         t1, t1, 1339
                  sltu         ra, s8, s6
                  c.nop
                  mulh         gp, s7, a5
                  ori          a3, s8, 1483
                  csrrwi       zero, 0x340, 16
                  mulhu        s4, ra, s1
                  c.nop
                  sub          t5, s3, s1
                  c.nop
                  c.nop
                  c.xor        a3, a3
                  c.sub        s1, s1
                  mulhsu       s8, a0, a3
                  csrrwi       s5, 0x340, 12
                  c.and        a3, a2
                  remu         s2, a3, t4
                  c.srli       a3, 3
                  c.addi       s4, 27
                  remu         t5, tp, t4
                  xor          a5, sp, s7
                  or           s1, ra, s9
                  add          s2, s7, a2
                  andi         a3, t4, -1515
                  sltiu        s6, s9, 1471
                  c.andi       s0, 13
                  sltiu        s10, a5, 513
                  auipc        tp, 971503
                  c.slli       s0, 18
                  c.nop
                  xori         a5, gp, -1679
                  c.andi       a4, -1
                  c.li         s4, 16
                  c.nop
                  ori          t3, s9, 516
                  sra          s3, s1, s11
                  andi         t3, s3, 1708
                  c.mv         s9, s0
                  c.srli       a0, 27
                  c.andi       a3, -1
                  or           t6, zero, sp
                  c.add        t6, ra
                  c.addi       t4, 9
                  sll          s5, ra, tp
                  c.sub        a2, a1
                  ori          s6, s0, 1489
                  c.mv         s4, t5
                  mulhu        s11, ra, s11
                  ori          t0, t1, 1350
                  c.or         a2, s0
                  csrrw        a7, 0x340, s3
                  c.xor        a5, s1
                  or           a4, s8, a5
                  c.and        a4, a0
                  sltu         ra, s3, s0
                  auipc        ra, 596568
                  addi         s1, a2, -1780
                  xor          s11, s5, a4
                  or           s0, a4, tp
                  c.addi       s11, -1
                  slli         s0, t1, 21
                  mulh         gp, gp, t1
                  csrrs        t5, 0x340, zero
                  c.mv         a7, a7
                  mulh         t3, sp, a0
                  csrrwi       a3, 0x340, 16
                  or           s11, a7, zero
                  c.slli       s0, 14
                  slt          s8, t5, ra
                  sll          t6, t1, t3
                  c.andi       a5, 29
                  c.addi       t5, 16
                  c.nop
                  xor          s6, t4, s6
                  sltu         a4, a0, a0
                  slti         s5, s5, 628
                  mulh         s8, s10, a5
                  xor          zero, t4, t6
                  rem          ra, a3, t5
                  c.and        a1, a4
                  c.sub        s0, s1
                  csrrsi       t5, 0x340, 24
                  mulhu        s0, a4, t5
                  csrrci       s7, 0x340, 0
                  c.slli       tp, 26
                  slt          s5, ra, t0
                  srai         s0, s0, 18
                  divu         a1, s11, gp
                  lui          a0, 926747
                  c.li         t1, -1
                  csrrc        s10, 0x340, a1
                  c.and        s0, a5
                  c.and        a0, a1
                  xor          a0, tp, s0
                  div          t6, s5, a0
                  c.li         s7, -1
                  c.or         a0, a5
                  srli         s11, a2, 21
                  csrrs        s0, 0x340, s11
                  c.nop
                  c.li         a2, -1
                  c.nop
                  lui          t5, 799001
                  csrrc        t0, 0x340, a1
                  c.lui        s6, 13
                  xor          zero, a2, s2
                  c.add        t6, a1
                  div          gp, s6, s7
                  csrrwi       a4, 0x340, 8
                  c.or         a1, a2
                  auipc        t3, 731010
                  srl          ra, a2, t3
                  c.addi       a1, -1
                  add          zero, t4, gp
                  mulh         tp, s5, t1
                  divu         a2, t3, s11
                  mulhu        t5, a2, t2
                  addi         t0, gp, 1119
                  divu         gp, s11, a6
                  c.andi       a3, -1
                  divu         gp, s8, t1
                  lui          t5, 937070
                  nop
                  mulh         s6, s2, t0
                  slti         s8, s9, 1511
                  srli         a1, t0, 1
                  mulhu        ra, a3, a6
                  c.li         s10, -1
                  sra          s11, t6, a1
                  lui          t0, 898283
                  srl          s1, a2, s2
                  mul          t6, s1, a4
                  c.nop
                  mulh         t4, s8, a4
                  rem          a2, s10, s6
                  c.li         t1, 4
                  or           t5, a1, a6
                  c.srai       s1, 3
                  slli         s4, a7, 11
                  c.addi       s9, 20
                  c.or         a2, a2
                  c.andi       a2, -1
                  c.or         s1, a5
                  csrrw        gp, 0x340, s8
                  c.xor        a5, a4
                  c.lui        s0, 5
                  c.srli       a5, 6
                  c.mv         s2, gp
                  c.srai       a0, 27
                  c.li         s6, -1
                  c.li         s3, 19
                  csrrs        a5, 0x340, zero
                  csrrc        s3, 0x340, gp
                  c.mv         a3, t5
                  srli         s7, tp, 16
                  sltu         s7, t3, s8
                  mulhsu       t6, ra, sp
                  srai         a4, a4, 26
                  csrrw        s10, 0x340, a6
                  c.mv         a0, a5
                  xor          a2, zero, t2
                  remu         t4, t2, a0
                  slti         t6, sp, 927
                  c.and        a0, a2
                  xori         gp, t3, 418
                  xor          s5, a7, sp
                  ori          zero, s8, -1900
                  nop
                  nop
                  slli         a1, a0, 10
                  csrrc        a5, 0x340, t2
                  sltu         a1, s3, a0
                  nop
                  c.and        a3, a0
                  c.slli       s6, 2
                  addi         a0, a6, -1927
                  mulhu        a4, s4, s4
                  andi         a0, a3, -755
                  lui          a1, 788032
                  and          s11, s1, a4
                  slli         s3, a2, 23
                  csrrci       s6, 0x340, 0
                  xori         s0, s4, 1898
                  c.and        s1, s1
                  c.srli       a2, 25
                  or           s8, a4, sp
                  srl          s10, t0, s6
                  ori          s1, s4, -1099
                  or           s10, s9, a5
                  sra          s1, a2, a5
                  sltiu        s3, s7, -31
                  slt          a2, a5, t2
                  c.addi       s3, -1
                  addi         s8, s5, -1367
                  c.or         a3, a5
                  c.li         t4, 21
                  c.add        t1, a4
                  srli         t5, t0, 5
                  rem          s0, t0, t2
                  mulhsu       t0, ra, sp
                  slt          a1, s9, t6
                  c.slli       t3, 25
                  mulhsu       s9, t5, a1
                  divu         a7, tp, a7
                  csrrw        t5, 0x340, s3
                  and          t4, s3, a0
                  csrrs        a5, 0x340, zero
                  and          t6, a6, s2
                  mulhu        t1, s5, sp
                  c.mv         a7, t6
                  xori         s6, a6, 1371
                  mulhu        zero, s5, a1
                  srl          s4, a5, t5
                  csrrwi       s7, 0x340, 9
                  mul          a5, t3, tp
                  c.andi       a1, 14
                  sub          t3, t1, t4
                  c.sub        a3, s0
                  csrrw        t1, 0x340, a7
                  csrrc        t0, 0x340, s8
                  mulhu        a0, sp, a1
                  divu         s6, a4, tp
                  c.andi       a5, -1
                  and          s7, a3, s8
                  sltu         t1, s11, s7
                  slt          a5, s8, t3
                  add          s10, s7, a4
                  sltiu        t0, s6, 731
                  divu         t5, t4, sp
                  srai         a3, t2, 10
                  mul          s1, s5, tp
                  slt          a1, tp, s5
                  mulhu        s0, s10, t0
                  mul          a0, t3, a6
                  mul          a4, a2, tp
                  csrrsi       s6, 0x340, 0
                  c.slli       a2, 8
                  add          a7, t1, s1
                  mulh         s8, a4, a3
                  slt          ra, s8, s7
                  nop
                  mulhsu       s2, t5, s0
                  lui          t6, 803660
                  sra          t3, s4, s1
                  sub          s2, s0, a2
                  mulh         a4, t1, a0
                  c.sub        a3, a3
                  sll          s7, ra, s1
                  srli         s7, a3, 16
                  sll          t1, t1, s5
                  c.mv         a1, t5
                  c.li         t4, 28
                  slti         s1, s9, -1209
                  c.srli       a4, 4
                  xori         s9, s2, 441
                  addi         s0, a2, 1115
                  srl          a4, t0, a3
                  div          s4, ra, t4
                  rem          t5, s7, t4
                  srai         s11, t0, 17
                  add          gp, t0, s10
                  srl          s8, t1, s3
                  sra          a0, gp, a6
                  c.li         a7, -1
                  andi         t4, a4, 987
                  xor          s1, sp, s0
                  xor          s11, a4, a4
                  addi         tp, t1, -1202
                  mulh         t1, t0, a2
                  c.addi       s6, -1
                  sltu         ra, ra, tp
                  c.mv         s5, s1
                  remu         s3, s4, s0
                  and          ra, a1, s5
                  csrrs        t6, 0x340, zero
                  c.or         a3, s1
                  c.add        s5, t0
                  c.srai       a5, 30
                  c.mv         s6, t0
                  csrrs        t3, 0x340, zero
                  mul          s10, a2, a6
                  c.li         s4, -1
                  csrrs        a7, 0x340, t4
                  csrrc        t5, 0x340, s8
                  mulh         s8, a4, sp
                  and          t5, s3, a2
                  csrrs        t6, 0x340, zero
                  csrrw        tp, 0x340, t3
                  c.xor        a2, s1
                  div          s11, t5, s7
                  c.add        t1, s11
                  srai         gp, s6, 10
                  mulhsu       s1, a2, t2
                  div          a0, a6, s4
                  addi         a7, t5, -1672
                  remu         s3, zero, t3
                  ori          zero, s8, 562
                  sub          t3, t4, ra
                  csrrwi       a7, 0x340, 25
                  auipc        t5, 502758
                  remu         a0, t0, s3
                  xori         s3, s11, 1431
                  mulh         s3, tp, a0
                  c.nop
                  c.srai       a0, 9
                  sra          s4, s3, t6
                  csrrci       s8, 0x340, 16
                  c.or         s0, a0
                  c.or         a2, s0
                  c.sub        s1, a2
                  c.or         a4, s1
                  srli         s11, t0, 2
                  andi         s10, s6, 585
                  sltiu        a2, s9, -1380
                  ori          a7, sp, -1601
                  rem          s2, a5, a5
                  slt          s3, s2, a6
                  c.addi       ra, -1
                  divu         s6, a3, s3
                  srl          s1, s0, tp
                  csrrci       a2, 0x340, 0
                  csrrci       s7, 0x340, 0
                  andi         s2, s2, -1167
                  add          zero, s6, t2
                  addi         a5, s2, -366
                  csrrci       a0, 0x340, 0
                  nop
                  slli         t5, s1, 20
                  mul          a3, a6, t1
                  slt          s5, s3, s1
                  mulhsu       a3, zero, t0
                  c.slli       s9, 23
                  lui          a0, 113396
                  c.or         a1, a3
                  remu         t0, s6, a2
                  c.li         s2, 21
                  sltiu        t4, s11, -35
                  csrrw        t4, 0x340, s10
                  c.mv         a0, t0
                  and          a7, t2, s2
                  c.srai       a3, 10
                  or           t4, a3, a6
                  mulhu        gp, t1, t4
                  divu         a2, t3, gp
                  slli         tp, t5, 8
                  c.sub        a3, a3
                  sltiu        ra, t0, 1789
                  c.slli       a7, 10
                  srai         t6, t6, 0
                  rem          t6, a1, sp
                  rem          t4, s6, s2
                  remu         zero, s2, s7
                  rem          t4, a7, t0
                  slti         t5, s4, -397
                  c.add        s1, s0
                  ori          a0, a4, 36
                  divu         s3, t0, s2
                  sra          t5, tp, a1
                  c.li         a5, 10
                  and          s6, a2, sp
                  srli         a4, a0, 24
                  csrrc        s2, 0x340, zero
                  c.lui        s4, 8
                  slti         s2, t5, -363
                  mul          s1, a6, s6
                  csrrsi       s9, 0x340, 0
                  mulhu        s0, a2, tp
                  mul          t1, a3, s8
                  sra          a0, t6, a2
                  divu         s6, s10, s11
                  sra          s11, s5, a4
                  remu         a2, t2, t1
                  c.srai       a1, 3
                  c.or         a1, a4
                  srli         s1, t3, 14
                  divu         s2, sp, a7
                  divu         s9, t5, s3
                  csrrs        s1, 0x340, zero
                  c.srai       a0, 21
                  mul          s0, ra, t0
                  csrrw        s2, 0x340, a3
                  and          zero, tp, s6
                  csrrsi       t1, 0x340, 12
                  c.nop
                  lui          a5, 569821
                  c.nop
                  remu         s8, t6, t1
                  c.andi       a4, -1
                  csrrw        s5, 0x340, a3
                  csrrwi       s7, 0x340, 22
                  srai         gp, s9, 4
                  andi         a1, s7, -1577
                  sll          t4, a4, a1
                  c.srai       a1, 30
                  slli         s11, s4, 24
                  srli         t5, t4, 15
                  mul          s6, gp, zero
                  xor          gp, s0, t1
                  sra          t3, t2, t5
                  c.and        a3, a3
                  lui          s8, 863627
                  c.sub        s0, a4
                  divu         s9, s10, t0
                  csrrc        a7, 0x340, s3
                  c.andi       a2, -1
                  csrrsi       a0, 0x340, 0
                  c.sub        a2, a2
                  andi         s2, gp, 754
                  xor          a0, s6, s10
                  add          t4, a3, t2
                  c.li         a7, -1
                  c.or         a4, a3
                  sll          s4, a5, a0
                  sll          t4, s4, a4
                  srli         a5, ra, 29
                  c.and        a1, s0
                  slli         a4, t0, 27
                  c.srli       a4, 17
                  sub          s4, s7, t2
                  remu         t0, a2, t4
                  rem          s3, s4, s1
                  div          s1, a7, tp
                  c.srli       a1, 22
                  divu         s2, a5, s8
                  c.srai       s1, 1
                  c.li         s1, -1
                  sltu         ra, gp, t1
                  rem          t1, s7, t6
                  div          t1, a1, s5
                  sub          a5, s7, s4
                  c.andi       s1, -1
                  mul          ra, t4, a5
                  divu         a3, zero, a3
                  sub          s5, a0, a6
                  c.lui        s0, 20
                  csrrwi       t1, 0x340, 25
                  lui          a4, 746167
                  slli         s5, a4, 21
                  addi         t4, a4, -496
                  nop
                  csrrw        s8, 0x340, s0
                  ori          s10, s8, -1426
                  slli         s6, a4, 7
                  rem          a2, a2, a2
                  and          s3, s2, s5
                  sll          s1, s7, zero
                  c.slli       s5, 21
                  sltiu        tp, a6, 1064
                  addi         s9, s3, -374
                  c.addi       a1, 31
                  c.and        a0, s1
                  rem          s11, tp, s10
                  xori         t4, t4, 382
                  sra          s5, t4, a6
                  nop
                  rem          s5, t1, a1
                  csrrsi       s11, 0x340, 0
                  mulhsu       a3, s6, t1
                  slt          s9, gp, t3
                  c.or         a3, a3
                  csrrwi       ra, 0x340, 15
                  sltu         t5, s3, s5
                  mulhsu       ra, t6, gp
                  c.lui        t6, 27
                  csrrc        tp, 0x340, s8
                  c.and        a5, a5
                  rem          s7, s4, s8
                  xor          s3, a3, t6
                  c.mv         t6, t0
                  slti         s9, s5, -316
                  srl          zero, zero, s1
                  srli         a0, s8, 15
                  sra          a2, s9, s5
                  slli         t0, s1, 3
                  rem          s10, s1, s2
                  lui          s5, 427518
                  csrrc        s0, 0x340, zero
                  and          s1, s8, s2
                  add          s11, a2, a0
                  slti         t0, t2, -1331
                  c.li         s0, -1
                  c.srli       s0, 17
                  xori         t3, s5, 702
                  csrrwi       s8, 0x340, 2
                  csrrw        s0, 0x340, a6
                  srai         a1, s7, 20
                  xori         ra, s10, -121
                  srai         a3, s10, 16
                  remu         s4, a7, t3
                  slti         t3, t3, -468
                  slti         zero, zero, 1588
                  mulh         a2, s3, t1
                  c.andi       s0, -1
                  csrrsi       s9, 0x340, 3
                  sltiu        t6, t4, 32
                  csrrc        s0, 0x340, t2
                  c.srli       s1, 30
                  and          a4, a0, t2
                  nop
                  remu         a7, s4, s1
                  and          s6, a1, tp
                  c.add        t5, a7
                  csrrs        a1, 0x340, zero
                  c.li         gp, -1
                  c.srai       s1, 4
                  srl          zero, t5, a6
                  srai         a1, t2, 4
                  sltiu        a0, s11, 687
                  csrrsi       a4, 0x340, 0
                  divu         s5, a5, t4
                  mulhu        t1, a0, a2
                  c.srai       a0, 29
                  mulhu        s0, a7, t4
                  csrrwi       s8, 0x340, 2
                  or           a4, t6, s10
                  divu         zero, s2, gp
                  xor          a5, a6, t6
                  srai         t1, s9, 18
                  ori          s3, s0, 2014
                  csrrwi       s4, 0x340, 11
                  slti         s6, a2, -118
                  c.add        s5, t6
                  c.add        s1, s1
                  rem          s11, s4, t1
                  xor          s6, a1, a6
                  c.xor        s1, a3
                  xori         s6, t0, -230
                  c.nop
                  sll          t5, s11, a7
                  addi         tp, s2, -773
                  ori          s4, a2, 1503
                  or           s2, t4, t2
                  srl          t4, zero, t3
                  mulh         s1, gp, a4
                  and          a4, s8, t3
                  c.srli       s0, 18
                  lui          a4, 645119
                  divu         a4, zero, a2
                  nop
                  c.mv         s9, s0
                  sub          a0, a5, a2
                  slli         a0, s3, 16
                  c.sub        a3, a5
                  rem          s3, a4, sp
                  c.add        a7, s4
                  sltiu        s4, a1, -503
                  csrrwi       a3, 0x340, 13
                  mul          s4, a4, s4
                  addi         s0, t0, 1423
                  xor          t5, t2, s4
                  srai         tp, zero, 12
                  sltu         a1, a2, a6
                  or           a4, s8, t2
                  remu         s7, s2, t0
                  or           s1, a3, a7
                  c.srai       a3, 2
                  slt          zero, s5, s0
                  slti         a5, s7, -908
                  sub          s7, ra, s2
                  c.nop
                  srai         ra, t6, 17
                  c.lui        s0, 19
                  div          t3, s7, sp
                  c.and        a5, a1
                  xori         a7, t2, 892
                  ori          s2, a4, 764
                  slli         a1, t0, 8
                  srl          s7, s8, t3
                  csrrw        s0, 0x340, s4
                  sltu         s7, t5, s2
                  c.slli       s9, 6
                  addi         s4, s7, -1717
                  nop
                  sra          zero, s7, t3
                  c.xor        a2, a4
                  c.srli       a3, 9
                  csrrwi       t1, 0x340, 3
                  mul          s7, a1, s5
                  csrrw        a4, 0x340, a3
                  c.srai       a1, 18
                  c.mv         gp, tp
                  mulhsu       a5, t5, s9
                  c.mv         a1, s8
                  c.or         a0, s0
                  slli         s0, s7, 5
                  mulhsu       a7, s5, s11
                  c.and        a3, a3
                  csrrsi       s3, 0x340, 0
                  remu         a1, s6, s8
                  remu         a5, t3, s3
                  srli         t0, a0, 13
                  csrrc        a0, 0x340, s7
                  mulh         s2, s2, gp
                  c.add        t5, s1
                  c.andi       a3, -1
                  sll          t3, s11, ra
                  sltu         gp, s2, t3
                  csrrs        s4, 0x340, zero
                  c.srli       a5, 14
                  divu         a7, s10, a0
                  xor          s9, s10, s3
                  csrrw        zero, 0x340, ra
                  c.mv         s4, t2
                  xor          a2, s6, a3
                  c.mv         s5, tp
                  rem          s8, a5, s4
                  c.addi       t0, 28
                  addi         s9, t6, 1042
                  csrrc        s6, 0x340, zero
                  srli         s1, gp, 5
                  srli         a1, s6, 12
                  mul          t4, a3, ra
                  sll          t5, t0, a3
                  or           a4, sp, t5
                  nop
                  c.add        a2, a1
                  c.and        s1, a1
                  mulhu        s11, s4, s10
                  slt          ra, s6, tp
                  c.lui        a1, 1
                  slt          s1, s8, s7
                  srli         s5, t4, 11
                  sra          s11, t4, a2
                  c.li         a1, 28
                  slli         a4, s7, 20
                  csrrwi       t5, 0x340, 10
                  slli         t5, gp, 0
                  and          a5, s11, a0
                  c.nop
                  c.add        a0, t2
                  nop
                  csrrwi       tp, 0x340, 22
                  div          a3, t1, gp
                  sub          s9, a4, t3
                  mul          a3, t3, s6
                  mul          s3, ra, s8
                  c.and        a0, a5
                  mulhu        a4, zero, s2
                  and          s2, a7, s2
                  slti         s2, a0, -2004
                  c.slli       t5, 12
                  remu         ra, sp, a4
                  c.srai       a3, 2
                  csrrwi       ra, 0x340, 16
                  slti         s10, a4, -1161
                  slt          a4, s11, a7
                  auipc        a4, 221638
                  csrrci       s6, 0x340, 0
                  c.andi       a0, -1
                  c.srai       a1, 25
                  andi         a5, s5, -1602
                  csrrsi       s1, 0x340, 0
                  srl          s3, s11, tp
                  c.li         s7, -1
                  c.andi       s0, 9
                  csrrsi       a5, 0x340, 0
                  srai         a7, s11, 26
                  auipc        a5, 200531
                  slt          s10, t3, t5
                  auipc        a1, 147231
                  c.sub        a5, a3
                  sltu         a1, a4, s10
                  c.slli       t1, 24
                  lui          t4, 719782
                  slli         s10, t1, 6
                  c.lui        tp, 25
                  lui          s3, 597478
                  remu         s2, a3, t1
                  xor          t1, a1, s9
                  sltu         t6, a4, s3
                  c.li         t6, 18
                  c.xor        a1, a1
                  csrrci       t5, 0x340, 4
                  srl          t1, sp, ra
                  csrrw        t1, 0x340, s3
                  csrrsi       t0, 0x340, 6
                  ori          zero, t0, -1667
                  c.nop
                  andi         s0, zero, 2040
                  c.and        a1, a3
                  sltu         t5, s8, s6
                  sltu         t6, s0, a7
                  andi         tp, a1, -645
                  mulh         s11, s3, s8
                  c.xor        a2, a5
                  c.xor        a5, a1
                  add          a5, s7, gp
                  andi         s0, ra, 734
                  remu         s11, s7, t2
                  sra          s5, t4, sp
                  add          t5, s2, s7
                  csrrw        t1, 0x340, s3
                  lui          s5, 52400
                  remu         a5, s8, tp
                  ori          a5, a7, 113
                  c.lui        t3, 28
                  ori          s1, s10, -866
                  csrrwi       t5, 0x340, 11
                  csrrci       s1, 0x340, 30
                  srl          s6, t5, s3
                  divu         t5, s2, a5
                  andi         gp, t5, 897
                  csrrwi       s8, 0x340, 6
                  c.slli       a1, 31
                  div          s4, a3, t2
                  xori         s1, s9, 552
                  c.slli       s5, 30
                  mulhu        s2, a5, a3
                  csrrsi       a0, 0x340, 0
                  csrrsi       gp, 0x340, 0
                  or           tp, s3, a7
                  c.lui        s8, 16
                  c.lui        s5, 12
                  slt          s11, t2, t1
                  srl          a5, zero, s4
                  rem          zero, s10, a2
                  mul          t3, s10, sp
                  c.lui        s7, 11
                  c.addi       ra, 11
                  mul          ra, s8, t3
                  sra          t4, t0, t3
                  c.sub        a5, s1
                  csrrsi       s5, 0x340, 0
                  sra          zero, a3, s10
                  div          a3, s1, tp
                  rem          s1, t2, t1
                  xori         t1, a4, -1110
                  c.andi       s0, 0
                  mul          a2, a3, s7
                  or           a0, a0, s11
                  c.and        a1, a1
                  c.srli       a1, 2
                  mulh         s9, a5, s2
                  ori          s3, a5, -187
                  c.and        a5, s1
                  c.nop
                  sll          tp, s11, a1
                  auipc        s1, 139002
                  nop
                  c.slli       s11, 12
                  sub          t0, s6, s8
                  add          t5, a4, a2
                  nop
                  ori          s5, s9, -704
                  c.srli       a0, 31
                  c.xor        s0, a3
                  c.sub        a1, a3
                  div          t0, a1, a7
                  c.addi       a0, 9
                  c.srai       a1, 9
                  c.add        a0, s9
                  rem          a7, s3, s1
                  csrrwi       s8, 0x340, 0
                  srli         t6, t6, 12
                  c.sub        a4, a2
                  xori         s5, s10, 511
                  mulh         t6, s1, t3
                  csrrw        s6, 0x340, a0
                  slti         tp, a4, -339
                  csrrci       s10, 0x340, 12
                  slli         s3, t6, 20
                  and          a5, s6, s7
                  add          zero, s4, a1
                  remu         a5, a5, zero
                  c.add        a4, s5
                  sub          t5, s4, a5
                  c.mv         t3, s11
                  slt          a7, t3, t3
                  c.and        a1, a4
                  sltiu        a2, t6, -603
                  xori         t0, t6, 2028
                  c.addi       s3, -1
                  nop
                  slti         s0, t2, 1734
                  sltu         t6, s10, t2
                  sll          s3, s5, ra
                  sll          a7, s9, s1
                  sltu         a2, a4, s9
                  sltu         t5, a6, a4
                  c.add        tp, t5
                  slti         s11, tp, 867
                  c.li         tp, 22
                  c.addi       t0, 2
                  csrrsi       t3, 0x340, 17
                  csrrci       t1, 0x340, 0
                  c.add        gp, a1
                  sll          s1, s7, s3
                  c.add        t0, t2
                  c.slli       a2, 22
                  srl          s11, t0, ra
                  c.srli       s0, 9
                  slli         t4, a6, 22
                  sub          s2, s0, t2
                  mul          t5, a5, t2
                  remu         s5, t0, a4
                  ori          t5, s0, 983
                  csrrci       s5, 0x340, 0
                  csrrwi       s1, 0x340, 21
                  rem          gp, s9, s3
                  sra          s3, t4, s4
                  c.mv         ra, t3
                  sll          a4, t1, s4
                  addi         a0, s3, 164
                  auipc        s9, 166919
                  srai         s5, s10, 13
                  auipc        s1, 801941
                  c.addi       s6, -1
                  div          t3, s9, t4
                  c.slli       s4, 20
                  c.srai       a0, 24
                  c.sub        a1, a4
                  c.srli       a1, 25
                  rem          s11, s10, t0
                  addi         tp, tp, -1256
                  csrrw        t1, 0x340, s1
                  c.xor        s0, s0
                  c.xor        a5, s1
                  mulh         s6, gp, a2
                  c.lui        t1, 18
                  c.mv         s4, ra
                  mulhsu       s9, a5, t1
                  or           s8, s2, s0
                  c.addi       gp, -1
                  csrrwi       a5, 0x340, 26
                  c.lui        t1, 4
                  c.xor        s1, s0
                  c.and        a1, a1
                  srl          a5, a2, t0
                  mul          s8, s6, s4
                  c.and        a4, a1
                  add          s1, s4, a3
                  or           ra, gp, t4
                  csrrw        t6, 0x340, s10
                  mulhsu       zero, zero, a3
                  add          a1, a7, s11
                  ori          s5, t0, -625
                  c.or         a3, a4
                  andi         s8, gp, -959
                  c.srli       s0, 22
                  xor          a7, s5, t6
                  sra          s2, s4, zero
                  c.and        a0, a3
                  auipc        s6, 768730
                  xori         a5, t5, 1330
                  xori         s8, t1, -460
                  csrrwi       ra, 0x340, 5
                  c.mv         s3, s6
                  srai         t5, s5, 5
                  mulhsu       t3, t6, s2
                  srl          t6, s0, t3
                  mul          a3, t6, tp
                  ori          ra, zero, -452
                  div          s2, s7, t5
                  mul          zero, t4, s3
                  andi         t6, gp, -1407
                  divu         zero, s10, a3
                  csrrc        s0, 0x340, zero
                  auipc        t5, 718529
                  csrrci       a7, 0x340, 31
                  addi         s7, t3, -23
                  slti         t4, s9, 697
                  andi         a2, tp, -327
                  c.srli       a1, 2
                  xor          s7, a1, s3
                  slt          s9, t0, t0
                  c.slli       a5, 20
                  remu         s4, s4, s9
                  c.nop
                  xor          a5, sp, t5
                  or           a1, a7, tp
                  xori         a7, s10, -1374
                  sub          t3, s9, a4
                  srl          s10, t3, tp
                  c.srli       a0, 27
                  ori          zero, s3, 926
                  srai         a5, a1, 23
                  c.andi       a2, 26
                  mulhsu       s5, a0, gp
                  mul          t5, ra, a5
                  sltu         t0, zero, a4
                  csrrsi       a0, 0x340, 0
                  sub          zero, t4, s10
                  mulhu        a3, tp, sp
                  xori         t1, sp, 1025
                  csrrci       zero, 0x340, 0
                  c.or         a0, a5
                  divu         tp, s3, a6
                  srl          ra, t2, a3
                  div          t4, s4, a7
                  mulhsu       s6, s2, s9
                  c.and        s0, a0
                  csrrci       a3, 0x340, 0
                  c.addi       s0, -1
                  c.andi       a0, 18
                  slt          gp, gp, t4
                  srli         t3, s10, 21
                  mul          t6, a6, a6
                  and          s0, a2, s3
                  xori         a3, a0, -1972
                  slti         s4, t6, -28
                  mulhu        s10, a0, a1
                  c.srli       a0, 19
                  csrrci       s2, 0x340, 13
                  c.mv         s2, tp
                  xori         s8, s11, 353
                  c.srli       a0, 28
                  andi         s4, t3, 937
                  csrrc        s1, 0x340, zero
                  c.addi       t1, -1
                  mulh         s5, gp, s10
                  c.mv         s6, s3
                  srl          s9, t4, a5
                  and          s11, s7, sp
                  slt          s3, s4, t6
                  sra          t6, s3, t3
                  c.xor        a4, a5
                  c.xor        a5, a2
                  slti         a4, t0, -1292
                  rem          s7, t6, s9
                  c.srli       a4, 27
                  lui          s1, 64783
                  addi         a0, t4, -1827
                  csrrci       t1, 0x340, 0
                  csrrsi       t3, 0x340, 7
                  c.sub        a5, a5
                  sra          tp, t4, s1
                  c.and        a4, a2
                  c.andi       a1, -1
                  auipc        a5, 723984
                  sub          s8, sp, s9
                  mulhu        t3, s7, t1
                  auipc        zero, 113705
                  csrrci       zero, 0x340, 0
                  auipc        t4, 211176
                  c.srai       a2, 29
                  sltu         tp, a2, s9
                  xor          s8, a1, s8
                  c.mv         s1, t4
                  c.xor        a4, a3
                  slli         zero, s9, 26
                  sub          ra, s3, t4
                  srli         a4, a3, 7
                  csrrwi       a5, 0x340, 20
                  xor          s4, s2, ra
                  c.addi       s10, -1
                  csrrc        s9, 0x340, zero
                  c.add        s10, t4
                  srai         t1, a2, 0
                  auipc        s4, 173633
                  divu         a7, ra, s1
                  remu         s4, a1, t2
                  c.li         s4, -1
                  srl          gp, s4, t4
                  c.and        a0, a3
                  c.slli       s11, 22
                  lui          s9, 289434
                  slli         t1, a5, 21
                  addi         a3, t6, -725
                  slti         tp, a0, -1460
                  c.add        s4, t2
                  andi         t6, t6, -711
                  c.srli       s0, 20
                  c.add        a5, s11
                  mul          t5, s1, tp
                  c.mv         ra, a2
                  remu         ra, s5, tp
                  c.xor        a0, a3
                  c.sub        s0, s1
                  c.andi       a4, 21
                  div          a2, s2, t0
                  c.or         s0, a2
                  addi         s2, s0, -253
                  mulhu        s5, a5, a3
                  c.srli       s1, 15
                  c.xor        s0, s0
                  add          s10, t5, s1
                  sub          s1, a2, a6
                  c.srai       a5, 31
                  mulh         s1, s4, t3
                  c.xor        a5, a2
                  srl          s2, a6, s8
                  ori          a5, sp, 842
                  csrrwi       s8, 0x340, 15
                  srli         s10, t2, 5
                  sltiu        tp, a0, 925
                  mulhu        a5, ra, s4
                  csrrs        s2, 0x340, zero
                  slt          a0, t6, a4
                  srai         s6, s6, 2
                  addi         a1, gp, -1172
                  xor          s3, a4, s3
                  mulhu        a5, a6, t1
                  srl          t5, t6, t6
                  csrrci       a2, 0x340, 0
                  c.slli       a4, 8
                  remu         t3, a4, s5
                  csrrwi       s4, 0x340, 29
                  sub          t3, s5, tp
                  c.lui        t3, 17
                  addi         s4, s5, -1691
                  c.xor        a2, a4
                  or           t0, t0, a1
                  sra          s5, s6, t5
                  remu         s11, zero, t6
                  mulhu        s7, tp, a0
                  and          a0, s8, a0
                  mulhsu       gp, a5, sp
                  c.or         s1, a0
                  add          s2, s7, s8
                  c.add        a5, a5
                  lui          s6, 577622
                  xori         a5, s7, 498
                  ori          a3, sp, 1210
                  sub          s2, s9, s4
                  c.add        a5, a6
                  nop
                  c.srai       a2, 18
                  csrrc        t3, 0x340, s5
                  c.and        a5, s1
                  addi         s6, a3, -12
                  andi         a2, s0, -573
                  c.andi       a2, -1
                  and          s0, s1, s3
                  slli         s7, a3, 16
                  c.sub        a0, a4
                  nop
                  lui          ra, 959837
                  srl          a2, tp, zero
                  csrrsi       a3, 0x340, 0
                  sra          zero, a3, s11
                  csrrs        s8, 0x340, s7
                  auipc        s11, 499329
                  addi         s10, a3, 1608
                  c.mv         s8, s3
                  c.slli       t6, 13
                  c.xor        a0, a5
                  c.xor        a2, a0
                  csrrci       t5, 0x340, 0
                  slli         a0, t1, 7
                  add          t3, a7, s5
                  divu         s5, s6, s3
                  mulh         t4, s6, a2
                  csrrsi       t1, 0x340, 0
                  andi         zero, s5, 986
                  or           tp, sp, s1
                  c.lui        s7, 12
                  mulh         t6, a3, a5
                  slli         s6, t2, 29
                  c.addi       s4, -1
                  csrrc        a3, 0x340, zero
                  c.nop
                  mulhsu       s5, t5, s0
                  c.sub        a4, a1
                  c.or         a3, a0
                  slt          s9, s1, s7
                  c.add        s9, s1
                  sltu         s7, ra, a1
                  csrrs        a7, 0x340, t6
                  c.or         s0, a5
                  c.srli       s1, 8
                  auipc        tp, 657350
                  csrrsi       a0, 0x340, 19
                  lui          t1, 1045472
                  c.srli       s0, 29
                  rem          t0, s4, s2
                  or           t4, a2, s11
                  addi         s5, a7, -727
                  csrrsi       a4, 0x340, 0
                  c.addi       s4, 19
                  lui          ra, 782048
                  c.srai       a5, 4
                  c.li         s5, -1
                  sll          a5, t5, t2
                  addi         ra, sp, 1559
                  c.xor        a0, a4
                  c.add        t4, t2
                  c.addi       s5, -1
                  div          t6, s5, a5
                  auipc        t5, 715430
                  divu         gp, a6, a2
                  nop
                  mulhu        tp, tp, s9
                  div          s9, a5, a1
                  div          s3, t3, a2
                  remu         s10, s4, zero
                  andi         t1, t1, 1850
                  lui          a2, 348260
                  and          t5, a7, s1
                  and          a2, a5, s11
                  div          a2, sp, t0
                  csrrc        a2, 0x340, t3
                  remu         a1, s2, a7
                  divu         s7, s5, s6
                  c.mv         t3, a4
                  mulhu        a3, s0, gp
                  add          s8, a6, a3
                  div          s8, a5, gp
                  div          zero, a7, s9
                  sub          s1, a7, a6
                  c.add        s0, ra
                  c.srai       s1, 17
                  xor          s2, s3, tp
                  csrrw        a3, 0x340, zero
                  csrrc        t1, 0x340, zero
                  srl          t0, a6, t1
                  c.mv         s6, gp
                  c.xor        s0, s1
                  remu         s2, t2, s11
                  c.nop
                  divu         t6, s10, a2
                  mul          t3, zero, a6
                  rem          s9, s8, s6
                  div          s5, t6, a0
                  c.and        a0, a1
                  ori          tp, a1, 405
                  srli         tp, sp, 28
                  sltiu        s8, s4, 11
                  csrrsi       t1, 0x340, 12
                  c.andi       a0, -1
                  mulhsu       gp, s2, a5
                  sltiu        ra, gp, -1293
                  c.mv         s1, a7
                  slt          s9, t3, gp
                  ori          s3, a5, -1465
                  c.srli       a3, 26
                  xori         tp, t6, 12
                  div          t1, a2, a1
                  c.srai       a1, 7
                  csrrs        s7, 0x340, zero
                  c.slli       a2, 12
                  sll          gp, s9, t4
                  c.and        a1, a4
                  sltiu        s6, gp, 94
                  c.lui        s3, 9
                  c.or         a5, a1
                  c.or         a2, s0
                  c.or         s1, a4
                  rem          a4, a6, a6
                  c.and        a3, a3
                  andi         s11, s3, -1032
                  slti         s2, t3, 319
                  c.andi       a5, -1
                  c.slli       s8, 26
                  srli         a7, t4, 27
                  div          s9, a4, t4
                  addi         s7, sp, 457
                  remu         s11, t2, gp
                  csrrsi       s6, 0x340, 14
                  csrrci       s7, 0x340, 0
                  c.li         a3, 20
                  srli         a5, s4, 30
                  sltu         zero, s10, a3
                  srai         a4, s11, 31
                  ori          s10, a2, 1473
                  csrrs        tp, 0x340, s3
                  xor          gp, s6, s1
                  sltiu        a3, s3, 1064
                  c.li         a2, -1
                  slti         ra, t1, 1094
                  slti         t6, t4, -1019
                  divu         s1, t1, s3
                  c.srli       a4, 17
                  ori          s4, t3, -1981
                  srl          a4, t6, s9
                  slt          s4, tp, a5
                  slti         a3, a1, -681
                  nop
                  mulhsu       s6, s2, a2
                  mulhsu       zero, t4, a7
                  mul          a7, t0, t4
                  c.andi       a5, 9
                  and          s9, a2, t6
                  c.xor        a4, a5
                  mulh         s11, sp, tp
                  mulh         t6, s3, s9
                  csrrc        s9, 0x340, a4
                  ori          zero, s8, -1993
                  mulhsu       a1, t4, s9
                  div          s9, s7, s7
                  srl          s11, s1, s2
                  csrrwi       ra, 0x340, 14
                  nop
                  div          a3, a4, a5
                  c.srli       a3, 8
                  c.srli       a4, 31
                  c.addi       s7, -1
                  c.srai       a2, 25
                  auipc        a7, 676431
                  slli         a0, zero, 17
                  sra          s11, zero, s4
                  slli         s0, t0, 20
                  xori         zero, s9, 86
                  c.addi       a4, 12
                  c.lui        s5, 3
                  andi         gp, t1, -534
                  csrrci       ra, 0x340, 23
                  auipc        zero, 95957
                  c.srai       s0, 10
                  c.srai       a1, 17
                  c.sub        a4, a2
                  c.lui        a0, 8
                  mulh         t3, s8, t1
                  csrrw        s1, 0x340, ra
                  csrrc        t6, 0x340, zero
                  c.xor        a4, a3
                  slt          s11, zero, s4
                  divu         t6, s2, t4
                  sll          s1, ra, s3
                  c.lui        t1, 10
                  auipc        t5, 918906
                  addi         s1, t1, -800
                  c.add        s3, a5
                  c.slli       a1, 27
                  c.lui        t0, 27
                  c.and        s0, a2
                  c.srli       a2, 30
                  csrrci       s11, 0x340, 28
                  srli         s4, ra, 23
                  c.nop
                  csrrwi       s8, 0x340, 7
                  slti         s8, s5, -717
                  c.or         s1, s0
                  slti         tp, s4, 213
                  c.slli       s0, 11
                  srl          s6, t6, a5
                  c.and        a3, a3
                  mul          s10, t3, s8
                  sll          tp, t5, s6
                  rem          a1, t2, s4
                  or           a5, gp, sp
                  c.nop
                  mulh         s8, sp, s0
                  ori          t0, s3, 1647
                  c.li         s4, -1
                  sub          t0, a4, zero
                  sltiu        a3, s3, -1288
                  addi         a1, a3, -1047
                  c.xor        a1, a5
                  c.slli       t3, 6
                  c.sub        s1, a3
                  c.or         a5, a4
                  c.xor        a4, s0
                  sltiu        t1, ra, 226
                  c.nop
                  csrrci       s5, 0x340, 9
                  c.xor        a2, s1
                  sltiu        s8, s7, 1694
                  sll          a7, a5, tp
                  c.srli       s1, 2
                  slli         a4, a1, 4
                  c.nop
                  csrrc        s10, 0x340, zero
                  c.lui        t1, 28
                  sub          s5, s11, ra
                  divu         s1, a2, s11
                  csrrs        zero, 0x340, zero
                  c.mv         s9, s6
                  csrrwi       a4, 0x340, 15
                  c.lui        a0, 29
                  c.lui        a7, 28
                  csrrsi       s10, 0x340, 0
                  xori         a3, s1, -115
                  c.nop
                  auipc        gp, 376696
                  nop
                  sll          s4, s5, t0
                  nop
                  csrrs        a4, 0x340, zero
                  c.mv         s6, s0
                  sltu         s8, t2, s11
                  mul          s3, s6, a5
                  c.and        s0, a2
                  slli         s9, s7, 3
                  mul          s7, s9, a1
                  mulhu        t1, s6, t2
                  divu         s0, a4, ra
                  mulhsu       s8, sp, s4
                  divu         t4, s1, s11
                  c.slli       s3, 4
                  csrrsi       s6, 0x340, 23
                  srli         ra, s10, 27
                  c.srli       a4, 5
                  c.srli       a1, 22
                  csrrwi       gp, 0x340, 15
                  mulhu        a7, a5, a4
                  mulh         a1, tp, a7
                  div          s2, t3, a7
                  c.srli       a4, 31
                  srl          a5, a7, s1
                  sltu         s3, gp, s11
                  slt          a0, s8, s6
                  c.lui        tp, 24
                  c.andi       a3, -1
                  srai         s9, a3, 9
                  c.andi       s1, 18
                  c.or         a1, a2
                  srai         s0, s3, 2
                  add          a4, s8, gp
                  c.srli       a5, 1
                  xor          t4, s11, a7
                  auipc        t6, 772467
                  xor          s5, s7, a3
                  auipc        s1, 939812
                  csrrc        a1, 0x340, zero
                  csrrci       t0, 0x340, 0
                  and          a7, a6, a4
                  c.or         a0, a2
                  c.nop
                  c.srai       s0, 3
                  mulhsu       t5, s2, a5
                  divu         s6, s1, a3
                  slt          a3, a3, t5
                  addi         t3, s3, 1813
                  divu         s5, a3, a5
                  nop
                  sub          a1, t1, s7
                  c.mv         s3, t5
                  rem          a5, gp, s5
                  lui          t0, 1007672
                  and          s9, a0, t3
                  csrrw        zero, 0x340, s2
                  c.sub        s1, s1
                  csrrwi       s7, 0x340, 5
                  sll          a0, a7, t4
                  slt          a4, s8, a3
                  csrrw        zero, 0x340, t1
                  csrrs        s2, 0x340, zero
                  mulhu        t3, s9, t4
                  c.mv         tp, s8
                  c.srai       a4, 15
                  c.add        gp, s6
                  c.nop
                  sltu         t6, t0, t3
                  c.or         a2, s1
                  mulh         s5, s4, t1
                  c.andi       a2, -1
                  ori          t3, s10, 900
                  sra          t6, tp, t2
                  or           s5, t4, s6
                  c.mv         s1, s10
                  c.sub        a1, a1
                  rem          s5, s5, tp
                  add          s11, a0, t0
                  c.sub        a2, s0
                  sra          t6, s11, s6
                  divu         t4, s4, t6
                  and          s0, s8, a5
                  lui          a3, 1041033
                  csrrw        tp, 0x340, t2
                  csrrc        a7, 0x340, zero
                  csrrc        gp, 0x340, s7
                  csrrwi       s9, 0x340, 10
                  sub          t5, s5, tp
                  sll          a4, s5, a4
                  csrrci       s6, 0x340, 25
                  csrrci       s7, 0x340, 16
                  add          t1, t3, s10
                  ori          ra, t3, 484
                  c.li         s3, -1
                  c.slli       a0, 31
                  c.xor        s1, a0
                  sub          t0, sp, a3
                  c.nop
                  mul          t4, t3, s0
                  addi         s2, tp, 1881
                  c.li         a5, -1
                  c.add        s9, ra
                  rem          gp, s10, s3
                  c.srli       a5, 29
                  csrrc        s6, 0x340, zero
                  c.nop
                  xor          a2, a7, s9
                  c.addi       a0, 23
                  c.and        a0, a4
                  c.xor        a1, a4
                  c.or         a3, a4
                  c.srai       s1, 6
                  c.andi       a3, 25
                  nop
                  csrrci       t6, 0x340, 9
                  and          t0, s1, a6
                  and          s10, s0, a3
                  c.lui        a0, 22
                  xori         s3, t1, 1712
                  csrrwi       s11, 0x340, 4
                  remu         s7, a7, ra
                  nop
                  xor          t1, s5, s6
                  mulhu        s7, a5, t1
                  nop
                  csrrc        zero, 0x340, s11
                  c.addi       a3, -1
                  slli         gp, t2, 20
                  csrrc        t6, 0x340, zero
                  c.srai       s1, 21
                  c.srli       s0, 13
                  sub          t5, s9, tp
                  c.li         t1, 20
                  c.nop
                  auipc        t0, 676204
                  div          s0, zero, s7
                  c.li         ra, 16
                  ori          s5, a4, -311
                  csrrwi       s1, 0x340, 3
                  sra          gp, t5, sp
                  csrrsi       a2, 0x340, 0
                  slti         s2, t2, -239
                  nop
                  mulhu        zero, a6, s2
                  csrrwi       s0, 0x340, 14
                  c.srai       s1, 14
                  mulh         a1, t1, s4
                  c.andi       a1, 24
                  csrrc        gp, 0x340, s0
                  c.or         a5, a0
                  csrrc        s7, 0x340, a7
                  csrrw        s4, 0x340, s10
                  c.lui        t3, 30
                  xori         t1, s2, -1952
                  c.or         a5, a1
                  srai         a1, a3, 8
                  c.sub        a0, a3
                  c.or         a3, a0
                  lui          t0, 461923
                  c.srli       a1, 4
                  c.sub        a3, a1
                  csrrw        t0, 0x340, a2
                  mulhsu       s6, t2, s2
                  c.or         a2, a4
                  c.or         s1, a1
                  or           tp, s1, s5
                  slli         s7, tp, 8
                  c.mv         s5, s0
                  sltiu        s9, t0, 988
                  sra          t0, a4, s5
                  slli         s9, a1, 0
                  slli         s7, s7, 20
                  csrrs        s1, 0x340, s3
                  sra          s8, s9, s11
                  c.li         s9, -1
                  sll          a2, a6, t5
                  sll          s5, a2, a6
                  csrrci       s6, 0x340, 0
                  ori          s2, t2, 1072
                  nop
                  remu         s0, t5, t1
                  c.srai       s1, 20
                  sra          s7, s4, t2
                  lui          s8, 317257
                  mulhsu       a1, t5, t3
                  c.and        a1, a0
                  c.mv         s10, a0
                  sub          s4, t0, s10
                  ori          t4, gp, 366
                  c.xor        a2, a1
                  sltiu        t3, tp, 886
                  c.srai       a1, 20
                  remu         s1, t6, s8
                  c.xor        a4, a0
                  div          s0, a1, t1
                  c.addi       s10, -1
                  csrrw        t4, 0x340, ra
                  addi         ra, t3, 967
                  ori          a1, s6, 1527
                  csrrw        s5, 0x340, s8
                  and          s2, s10, t1
                  nop
                  mulhu        t6, s2, tp
                  nop
                  c.andi       a0, 24
                  csrrc        s0, 0x340, zero
                  mulh         s10, s10, s6
                  and          t1, a5, s5
                  c.sub        a2, a1
                  nop
                  csrrw        tp, 0x340, s11
                  csrrc        a4, 0x340, a6
                  and          zero, t6, ra
                  mul          s7, s8, zero
                  div          t5, s7, s7
                  srai         s9, s7, 22
                  mul          a7, s2, t6
                  add          s11, sp, t0
                  csrrc        gp, 0x340, a0
                  c.li         a7, -1
                  c.sub        a1, a4
                  c.add        a7, s6
                  c.mv         a3, t5
                  lui          a7, 584485
                  remu         tp, a7, t3
                  csrrs        t3, 0x340, a7
                  mulh         t5, s9, s2
                  c.addi       s8, -1
                  xor          a2, zero, t6
                  rem          s9, s6, a7
                  srai         t4, gp, 19
                  or           a5, s11, s0
                  xori         a2, s10, -2004
                  sltu         s6, sp, t6
                  mul          s6, ra, s6
                  c.lui        tp, 17
                  mulhsu       s2, gp, s7
                  nop
                  slt          t3, zero, t4
                  c.mv         a5, s5
                  slt          a3, t1, s3
                  c.sub        a1, a1
                  sll          t6, a1, a3
                  addi         a1, s2, -1008
                  sll          a1, s2, a7
                  ori          s8, a1, 1228
                  srl          s9, a4, a2
                  c.srai       a1, 7
                  rem          t6, a4, s5
                  divu         a5, a1, t1
                  c.andi       s1, -1
                  nop
                  and          ra, s7, ra
                  c.add        s1, s8
                  auipc        t4, 23970
                  c.mv         a4, t4
                  c.sub        a2, a2
                  c.sub        a1, a0
                  c.srai       s0, 28
                  csrrc        t0, 0x340, zero
                  c.or         a1, a5
                  slli         a0, s2, 10
                  xori         s3, s9, 829
                  c.srai       a0, 21
                  mulhu        t1, a0, s7
                  lui          t4, 292515
                  lui          s3, 925627
                  mulhsu       a7, a3, s5
                  sub          s6, s11, a4
                  slli         s7, s7, 20
                  lui          a0, 722319
                  csrrs        s9, 0x340, s11
                  csrrc        s2, 0x340, a5
                  csrrwi       ra, 0x340, 3
                  c.or         s1, a3
                  remu         s9, s8, t2
                  c.or         a2, s1
                  c.srai       a0, 13
                  c.sub        a5, s1
                  or           a2, sp, t2
                  c.slli       a0, 13
                  c.and        s1, a1
                  divu         tp, ra, a6
                  csrrci       s11, 0x340, 0
                  xori         zero, a5, -1174
                  mulhu        s5, a7, s8
                  andi         s3, a1, 1129
                  slti         a4, a4, 746
                  csrrw        s7, 0x340, s2
                  mulhu        s7, a2, s10
                  csrrwi       t1, 0x340, 4
                  nop
                  sltu         zero, t5, t2
                  c.li         s4, -1
                  c.srai       a3, 25
                  or           s11, s3, tp
                  sltu         s5, s6, s9
                  c.srai       a4, 4
                  sub          a1, t2, a5
                  andi         s7, s4, -2030
                  auipc        s10, 279606
                  lui          ra, 655156
                  c.or         a4, a5
                  slli         s3, sp, 1
                  c.sub        a4, a4
                  c.add        t1, t4
                  c.nop
                  c.or         s0, a3
                  or           t6, s10, s6
                  lui          s8, 113151
                  lui          s5, 1043704
                  srai         a2, t5, 10
                  addi         t5, t4, -1552
                  c.add        a3, a7
                  lui          s2, 363376
                  c.srli       a1, 31
                  auipc        s7, 377233
                  xori         a4, s8, -1508
                  csrrwi       a7, 0x340, 29
                  srl          s1, t6, zero
                  slt          s3, ra, gp
                  csrrc        s11, 0x340, zero
                  c.li         t4, 7
                  c.srai       a0, 31
                  csrrwi       zero, 0x340, 23
                  and          tp, a7, s7
                  c.nop
                  csrrw        a2, 0x340, gp
                  ori          s4, a5, -1491
                  andi         s5, s8, 762
                  divu         s2, s11, t6
                  c.nop
                  mulhsu       a0, t5, a2
                  nop
                  lui          t6, 925274
                  xor          t3, a7, s4
                  remu         t3, a5, gp
                  csrrci       a3, 0x340, 2
                  mulh         t5, t5, s3
                  add          a2, t4, s3
                  lui          s0, 879683
                  xor          a0, tp, s7
                  csrrs        s2, 0x340, zero
                  c.xor        a4, a0
                  mul          s2, s5, s9
                  c.xor        a1, a3
                  ori          t5, s0, 1442
                  c.slli       a4, 31
                  and          a4, s10, a5
                  rem          s10, a0, t6
                  div          t0, a5, a0
                  xori         a5, ra, -1565
                  c.sub        a0, a2
                  c.slli       a5, 3
                  sra          a1, a3, a7
                  or           a5, s0, zero
                  c.sub        a2, a3
                  sltiu        s7, t3, 581
                  rem          t3, sp, s1
                  c.mv         s9, t3
                  sltiu        s10, s1, -919
                  mulh         s2, a0, a3
                  csrrc        t3, 0x340, zero
                  c.nop
                  slt          s11, s3, t1
                  c.slli       s7, 1
                  sltu         s10, s3, s1
                  c.mv         t3, a7
                  remu         a3, s6, s9
                  c.mv         s5, s9
                  c.add        s9, sp
                  auipc        s3, 533530
                  slt          ra, s7, a5
                  csrrs        s1, 0x340, zero
                  divu         a1, a7, s1
                  c.srli       a2, 30
                  slli         s8, s8, 23
                  mul          t5, a6, zero
                  xori         a4, s8, -730
                  sra          gp, a3, s9
                  slti         t1, s9, 2009
                  sltu         a1, a6, a7
                  slt          s9, sp, s7
                  xor          a2, t1, t4
                  sll          s8, t2, t4
                  mulh         s4, gp, t6
                  csrrc        a7, 0x340, s11
                  and          s9, s9, tp
                  rem          s6, s9, s9
                  ori          a5, tp, 1729
                  c.or         a3, a5
                  div          gp, s9, ra
                  srli         s8, s9, 16
                  c.sub        a5, a0
                  csrrc        t6, 0x340, t6
                  slli         s11, t0, 1
                  srli         a4, ra, 25
                  csrrs        s6, 0x340, a3
                  csrrci       s0, 0x340, 6
                  c.lui        a3, 30
                  c.andi       s0, -1
                  c.srli       a3, 28
                  c.sub        a4, s1
                  slt          a4, ra, s11
                  c.nop
                  and          a0, s2, s11
                  c.or         a0, a1
                  csrrwi       s1, 0x340, 29
                  c.lui        a4, 16
                  xori         a7, s6, -1279
                  andi         t0, t3, -1118
                  mulh         zero, zero, s11
                  srl          t1, a6, t0
                  addi         s10, s6, 546
                  remu         s3, a6, gp
                  c.nop
                  c.xor        a0, a5
                  slti         s7, a5, -1694
                  c.lui        s0, 10
                  c.and        a2, a1
                  divu         a3, ra, t5
                  c.slli       s11, 23
                  slli         a3, a2, 5
                  c.srli       a0, 21
                  nop
                  c.and        a1, s0
                  mul          t3, zero, t5
                  c.sub        s1, a5
                  csrrsi       zero, 0x340, 0
                  sltiu        a3, t2, -482
                  c.addi       a5, 11
                  srli         s8, a2, 15
                  csrrw        a1, 0x340, s3
                  csrrs        t4, 0x340, ra
                  add          s7, t0, s10
                  lui          t3, 197287
                  add          zero, a5, t3
                  srli         a0, gp, 5
                  mulhsu       zero, gp, s5
                  sub          t6, a5, t1
                  csrrw        t0, 0x340, a6
                  c.addi       a0, -1
                  addi         s7, a6, 1193
                  csrrs        s9, 0x340, t6
                  c.li         s7, 11
                  sltiu        a1, t0, -1970
                  mulhsu       s7, a0, a4
                  c.sub        a3, a4
                  c.srai       a5, 19
                  div          t6, t5, s7
                  csrrsi       s7, 0x340, 0
                  mulh         a2, a4, t6
                  c.srli       a1, 20
                  c.add        t4, a5
                  mulh         gp, a4, s1
                  ori          gp, s10, 1923
                  c.srai       s1, 15
                  c.srai       a1, 5
                  slt          s2, a6, sp
                  csrrci       s2, 0x340, 30
                  auipc        a1, 752910
                  addi         a5, s0, -2006
                  or           tp, t3, zero
                  csrrs        zero, 0x340, a3
                  sub          s4, t4, s0
                  remu         s11, a4, t6
                  or           a2, gp, s7
                  c.and        s1, s0
                  divu         s5, t3, s11
                  slti         a7, a2, 550
                  c.li         s2, -1
                  csrrw        s11, 0x340, s2
                  sub          s3, s1, a7
                  c.xor        a2, a3
                  c.addi       s0, -1
                  c.srai       a1, 5
                  lui          a3, 687748
                  mulhu        s8, sp, t0
                  auipc        a3, 282336
                  csrrw        s6, 0x340, s6
                  divu         a4, s8, zero
                  csrrsi       s9, 0x340, 0
                  c.srli       s0, 9
                  remu         gp, t5, t5
                  slti         a7, s9, 587
                  csrrs        t5, 0x340, s4
                  c.sub        a4, a5
                  slt          zero, t2, a0
                  addi         a3, t4, 1810
                  csrrsi       a2, 0x340, 0
                  slti         s10, a0, 1296
                  csrrwi       t3, 0x340, 22
                  srl          s3, s8, t2
                  csrrwi       s6, 0x340, 8
                  c.andi       s0, 17
                  sra          s1, s10, gp
                  c.srli       a0, 16
                  remu         t5, t6, sp
                  slti         s4, a1, 242
                  c.nop
                  sll          a2, a0, t1
                  csrrs        a7, 0x340, zero
                  csrrwi       s10, 0x340, 17
                  csrrwi       a1, 0x340, 9
                  srli         t0, t0, 24
                  slli         s9, a2, 18
                  c.or         a2, a2
                  sltu         t3, s3, a2
                  remu         s7, s1, a0
                  c.slli       t6, 11
                  add          a5, a7, s7
                  div          a7, s3, s11
                  div          a2, a4, t6
                  lui          t1, 628228
                  csrrsi       t1, 0x340, 0
                  auipc        t4, 944950
                  slli         tp, s11, 29
                  c.sub        a4, a5
                  mulh         t4, s11, s7
                  slli         t1, s0, 30
                  remu         s5, t2, a5
                  slti         s7, t4, 324
                  div          ra, ra, a0
                  sub          s1, s1, t0
                  csrrci       t6, 0x340, 0
                  remu         t5, a7, s3
                  c.lui        a5, 29
                  c.addi       t1, -1
                  srai         ra, a2, 18
                  srai         t0, s6, 13
                  csrrwi       tp, 0x340, 17
                  c.srai       a1, 14
                  c.li         a3, -1
                  c.add        s9, a5
                  mulhsu       s1, s10, s0
                  c.mv         s9, s11
                  slt          s3, s0, a5
                  sub          t1, s0, s0
                  mul          s8, s1, a4
                  slt          s9, zero, s8
                  sub          s10, a5, tp
                  nop
                  sltiu        t4, a0, 109
                  mulhsu       t0, a1, s7
                  c.lui        t3, 9
                  addi         s11, gp, -1582
                  rem          t0, a6, a5
                  add          s7, zero, s3
                  remu         s3, sp, a0
                  srai         s7, s9, 27
                  c.or         a4, a4
                  c.xor        a3, a5
                  add          t4, t6, s6
                  remu         zero, t3, a1
                  remu         a3, s9, s0
                  csrrw        a1, 0x340, a2
                  remu         zero, a4, a2
                  xori         s5, a0, 1158
                  add          a3, s2, sp
                  slt          a7, s6, s7
                  srl          t5, s6, t6
                  c.srai       a2, 8
                  csrrw        s2, 0x340, s10
                  c.srai       a1, 20
                  sltiu        a1, a0, -146
                  auipc        s0, 212332
                  c.or         a0, a5
                  c.slli       s2, 11
                  csrrwi       t6, 0x340, 18
                  slli         a0, s10, 25
                  c.and        a2, s0
                  c.addi       s10, 31
                  c.li         ra, -1
                  csrrsi       s0, 0x340, 0
                  or           ra, s0, tp
                  slti         s5, s10, 226
                  slli         a0, a6, 25
                  div          t5, s8, t0
                  c.li         s10, -1
                  auipc        t6, 800990
                  xori         s7, s10, -1654
                  csrrw        ra, 0x340, s5
                  rem          zero, s7, a1
                  c.lui        s0, 26
                  sltu         s3, a2, t1
                  csrrsi       gp, 0x340, 0
                  sll          tp, a7, gp
                  add          s3, t3, s10
                  csrrs        a5, 0x340, s7
                  mulhu        a7, a3, a4
                  csrrw        s1, 0x340, s6
                  slt          ra, s9, s4
                  c.li         a7, -1
                  mulhsu       s0, s1, ra
                  add          s4, a3, s1
                  lui          t5, 116773
                  c.andi       a2, 30
                  slli         a5, a2, 13
                  divu         a2, t3, t5
                  c.addi       s7, -1
                  c.or         a0, a2
                  csrrwi       s4, 0x340, 24
                  c.nop
                  srl          s7, s10, t3
                  c.sub        a3, a4
                  srli         a7, s0, 24
                  sra          t5, a0, t0
                  mulhu        t3, t0, s3
                  slli         t4, s4, 2
                  c.xor        s1, a1
                  c.xor        a4, a1
                  c.addi       a4, -1
                  c.mv         t6, gp
                  csrrwi       t3, 0x340, 6
                  rem          t6, s10, t6
                  or           a0, a2, s9
                  c.add        a3, ra
                  slli         zero, s9, 11
                  mulhu        s5, t3, tp
                  c.add        s8, t5
                  sra          s10, a1, a0
                  c.add        a7, s8
                  slli         s6, s8, 23
                  c.li         s4, 26
                  mul          zero, s5, sp
                  slli         s3, s5, 12
                  xori         t1, a3, -1524
                  c.slli       s10, 27
                  csrrw        a5, 0x340, a7
                  andi         gp, t2, -1945
                  c.or         s0, a2
                  divu         a2, t4, s3
                  xori         t3, a0, 1433
                  c.addi       t4, -1
                  csrrw        t3, 0x340, s5
                  nop
                  c.srai       a2, 27
                  nop
                  c.lui        s5, 12
                  divu         a0, s0, a2
                  remu         a2, a0, s10
                  or           s9, a0, t2
                  srli         s0, s2, 16
                  mulh         s7, t3, gp
                  mulhu        gp, a6, gp
                  or           zero, s6, a5
                  c.nop
                  div          s1, zero, a4
                  c.and        a0, a5
                  sll          zero, zero, s2
                  csrrs        s3, 0x340, s3
                  rem          tp, s2, t0
                  and          a1, s0, t0
                  sub          t1, sp, t0
                  divu         s10, a0, a4
                  or           s1, s5, a5
                  csrrci       t5, 0x340, 12
                  add          t4, t3, t1
                  c.xor        a1, a1
                  c.sub        a4, a0
                  srli         a5, t4, 19
                  sll          a0, a4, a0
                  lui          s1, 390585
                  nop
                  c.lui        t5, 12
                  sltiu        s9, s3, -1648
                  rem          t4, s9, s11
                  c.add        a7, t2
                  srl          s2, s2, a3
                  csrrc        t6, 0x340, zero
                  xori         s9, t4, -325
                  auipc        t4, 192044
                  xori         tp, s8, 661
                  c.nop
                  sltu         s10, t1, t2
                  c.slli       s4, 26
                  csrrw        zero, 0x340, a6
                  sltiu        t1, a7, 1119
                  c.srai       s1, 26
                  mulhu        s5, a5, s7
                  c.nop
                  srli         s11, s9, 26
                  add          s6, a7, t2
                  c.lui        s11, 2
                  mulh         gp, a5, s10
                  c.li         gp, -1
                  rem          s4, a2, a4
                  csrrwi       a4, 0x340, 6
                  divu         a1, s3, t2
                  sltiu        s8, s11, -792
                  xor          s3, sp, s1
                  sltu         tp, t2, s9
                  sltiu        s0, a6, 136
                  c.andi       s1, 22
                  c.sub        a4, a4
                  div          a0, s9, a4
                  sll          t1, t4, tp
                  csrrci       s2, 0x340, 0
                  nop
                  rem          tp, gp, s6
                  sltiu        a0, gp, 2023
                  or           gp, s3, s10
                  c.addi       a5, 15
                  c.or         a3, s0
                  c.slli       s2, 9
                  ori          a7, a2, 1858
                  mulhu        gp, gp, a1
                  csrrw        t1, 0x340, a0
                  and          s0, t6, t6
                  c.or         s0, a4
                  xori         s8, a4, 1989
                  c.nop
                  and          s7, s5, s11
                  or           tp, s6, a6
                  andi         s8, zero, 1625
                  remu         t4, s1, s6
                  c.or         a5, a5
                  c.or         a1, a4
                  srli         t1, s7, 24
                  sltu         a4, t2, s9
                  c.and        a1, a0
                  csrrsi       a7, 0x340, 20
                  srl          a1, a5, s9
                  addi         t3, s4, 724
                  xori         s11, t0, -1610
                  sll          s6, t2, t5
                  csrrs        s4, 0x340, a3
                  rem          t6, gp, ra
                  csrrw        s5, 0x340, s9
                  c.sub        s1, s1
                  c.mv         s7, s5
                  c.sub        s0, s0
                  csrrs        s8, 0x340, zero
                  sltiu        s2, t1, 1650
                  or           a7, t4, a0
                  mul          a7, s2, a1
                  mulhsu       a1, a5, a5
                  sra          s1, zero, s4
                  sltu         t5, a6, t3
                  and          ra, ra, s7
                  csrrwi       s6, 0x340, 20
                  add          s0, sp, tp
                  srai         s9, t3, 3
                  remu         t5, s8, s5
                  sll          s0, s4, a7
                  c.lui        s5, 16
                  c.sub        a0, a0
                  rem          gp, s11, t3
                  slti         t4, a4, 437
                  csrrwi       s0, 0x340, 10
                  csrrs        s7, 0x340, a1
                  c.srai       a0, 28
                  auipc        t1, 1024254
                  mulh         tp, s7, a3
                  mulh         t1, sp, ra
                  sub          ra, t0, s0
                  slt          a7, tp, t6
                  c.srli       s0, 4
                  slli         tp, a7, 31
                  addi         t0, t6, -1467
                  c.nop
                  c.mv         s4, a4
                  c.add        s1, s2
                  srai         a3, s9, 1
                  c.nop
                  c.or         s0, a5
                  nop
                  sra          zero, t6, sp
                  csrrw        gp, 0x340, a4
                  nop
                  srai         zero, s5, 23
                  c.sub        a5, a1
                  c.li         s4, 20
                  divu         t0, s8, s11
                  c.srai       s0, 21
                  c.srai       a3, 14
                  c.lui        a4, 31
                  andi         t3, a3, 1613
                  c.sub        a3, s0
                  remu         t5, t0, t1
                  divu         s7, sp, t0
                  c.sub        a1, a4
                  sub          s11, a7, a7
                  c.add        s1, s2
                  mul          t6, s6, s6
                  divu         a7, t0, t2
                  ori          a4, t5, 1555
                  c.and        s1, a0
                  mulhsu       zero, t1, zero
                  mulhsu       gp, a1, a7
                  sra          s0, s9, t2
                  c.sub        a1, s1
                  c.slli       s11, 18
                  c.or         a3, a0
                  csrrs        s6, 0x340, zero
                  auipc        s3, 937467
                  or           ra, gp, t2
                  sub          s10, s1, a4
                  xori         s1, s10, -701
                  slli         gp, t4, 8
                  and          a2, s7, tp
                  sltu         s2, t5, s9
                  c.or         a5, a4
                  csrrw        a3, 0x340, a3
                  lui          t6, 775209
                  c.slli       a2, 22
                  slli         s3, a4, 10
                  slti         a1, a3, -1016
                  ori          s9, s3, -1172
                  mulhu        a2, tp, a0
                  slt          a0, zero, a5
                  c.li         a5, -1
                  ori          gp, s3, -576
                  csrrc        s5, 0x340, zero
                  c.andi       s0, -1
                  and          s7, t5, sp
                  csrrsi       s8, 0x340, 0
                  srl          t5, sp, s2
                  andi         zero, s7, 853
                  c.li         t3, 23
                  mulhu        s5, sp, s3
                  auipc        gp, 955408
                  csrrc        a5, 0x340, zero
                  c.nop
                  c.nop
                  mulhu        zero, s5, a5
                  c.lui        a7, 11
                  sltu         s6, gp, s1
                  c.li         s11, 30
                  rem          s3, t5, a6
                  sll          ra, s5, t4
                  nop
                  csrrwi       t5, 0x340, 5
                  auipc        s9, 970648
                  c.mv         s1, s4
                  csrrsi       a3, 0x340, 22
                  sra          a2, s0, s9
                  slt          t3, a6, a2
                  auipc        ra, 51830
                  lui          a1, 56939
                  c.and        a0, a3
                  c.and        a2, a2
                  mul          s4, s0, a7
                  xori         s6, s0, 1826
                  mulhsu       s0, a7, t1
                  c.sub        s1, a3
                  c.or         a0, s0
                  sub          t4, a1, sp
                  c.lui        s8, 4
                  mulhsu       a4, s7, a0
                  csrrs        a5, 0x340, s5
                  sub          a2, sp, zero
                  sra          t6, s5, s7
                  auipc        s8, 144339
                  xori         ra, ra, -182
                  sltu         t6, s7, zero
                  mul          a5, t2, gp
                  srai         s5, s7, 10
                  mul          ra, t3, a5
                  csrrsi       s11, 0x340, 21
                  c.sub        a0, a5
                  c.mv         a0, s8
                  sltiu        s11, s7, -166
                  c.nop
                  c.li         s10, -1
                  c.andi       a5, 21
                  c.addi       a1, 13
                  slli         a1, a1, 19
                  csrrw        s11, 0x340, s5
                  c.and        a0, a2
                  rem          a1, s4, a4
                  xor          s3, a1, a6
                  csrrci       s7, 0x340, 0
                  csrrw        t6, 0x340, s10
                  c.lui        a3, 25
                  c.mv         t5, tp
                  c.addi       t1, -1
                  andi         s4, t3, 1596
                  csrrw        s9, 0x340, s6
                  csrrci       s3, 0x340, 0
                  csrrw        a7, 0x340, t1
                  divu         s5, ra, t1
                  csrrsi       t1, 0x340, 21
                  csrrci       a5, 0x340, 5
                  c.srai       a5, 9
                  lui          s2, 409374
                  csrrwi       s2, 0x340, 6
                  sltiu        a7, t3, -268
                  sll          ra, s5, t1
                  c.xor        a5, a3
                  rem          a0, gp, t0
                  c.add        a0, s3
                  divu         t5, gp, t5
                  csrrwi       ra, 0x340, 6
                  rem          t6, a6, a5
                  c.lui        a5, 5
                  divu         a3, s4, t5
                  slli         tp, s7, 22
                  c.srai       a4, 19
                  c.lui        a2, 2
                  csrrci       a7, 0x340, 0
                  mulhu        s5, s1, a6
                  c.sub        a1, a5
                  div          t0, s9, a7
                  xor          zero, t5, t3
                  c.add        a1, a3
                  csrrw        s10, 0x340, a3
                  c.srai       a1, 24
                  mulhsu       s2, t3, t3
                  c.srai       a1, 4
                  c.srli       a2, 9
                  auipc        a7, 618585
                  sll          t4, zero, s3
                  mul          s8, t2, a7
                  sltiu        gp, s0, 883
                  csrrc        t6, 0x340, s4
                  rem          s10, a0, t1
                  c.li         s9, -1
                  and          t4, a4, a5
                  xor          a3, s8, tp
                  c.li         tp, -1
                  slti         s11, a6, 118
                  slt          t3, a7, t4
                  slti         s1, s0, 997
                  mulhsu       ra, t1, s10
                  c.mv         a2, a2
                  c.srli       a0, 11
                  xori         t1, s7, 765
                  or           tp, s3, s11
                  mulhsu       zero, s5, s8
                  div          s3, t2, s7
                  c.mv         s10, t1
                  srai         s4, s8, 25
                  slli         t1, s3, 7
                  csrrc        a2, 0x340, s11
                  csrrs        t4, 0x340, s0
                  sub          t1, t5, a1
                  c.addi       t0, 20
                  c.slli       s1, 10
                  nop
                  mulhu        s4, t4, a7
                  c.andi       a2, -1
                  div          s1, a7, s0
                  csrrc        a4, 0x340, s4
                  srai         a2, gp, 9
                  slt          s8, s8, sp
                  csrrw        a4, 0x340, s1
                  c.or         s0, a2
                  and          s7, a4, a4
                  srli         zero, a3, 3
                  slt          s5, s6, a5
                  mulhu        s11, s2, s11
                  xori         gp, a2, -1851
                  or           gp, a0, s3
                  c.srai       a1, 11
                  c.or         a5, a3
                  rem          t6, s2, s1
                  divu         a5, s3, s0
                  sra          a0, a5, s10
                  c.slli       s1, 11
                  c.slli       s11, 9
                  c.xor        s1, a4
                  mulh         s1, s8, t5
                  slt          t6, s8, s6
                  lui          a0, 1003704
                  c.srai       a0, 27
                  c.slli       a2, 22
                  c.li         gp, -1
                  sltu         s5, s6, s8
                  sltu         s2, s0, ra
                  c.or         a0, a2
                  srai         tp, s9, 4
                  c.srli       s0, 20
                  csrrs        s0, 0x340, zero
                  c.srai       a4, 2
                  or           a0, a5, a3
                  sltu         a1, s1, t0
                  csrrci       t0, 0x340, 26
                  slt          t0, t2, a6
                  csrrs        s4, 0x340, zero
                  slt          s4, s5, t6
                  c.li         a2, -1
                  c.slli       tp, 27
                  c.and        a1, a2
                  c.xor        a2, a3
                  csrrwi       s6, 0x340, 11
                  slti         s2, zero, -895
                  c.and        s1, s0
                  c.slli       a2, 7
                  srai         a3, t3, 10
                  c.li         s3, -1
                  c.and        s0, a3
                  mul          s6, s4, s8
                  c.mv         s2, s3
                  c.srai       s0, 1
                  xori         a1, a1, -199
                  sra          s2, s3, s2
                  srai         a1, gp, 25
                  c.sub        a3, a1
                  add          tp, tp, sp
                  csrrwi       s5, 0x340, 26
                  c.nop
                  srl          a5, t3, sp
                  csrrw        a7, 0x340, s7
                  c.xor        a4, s1
                  mulhsu       a4, s4, zero
                  xori         a0, t0, -203
                  rem          tp, sp, zero
                  csrrci       s2, 0x340, 22
                  csrrw        s1, 0x340, s1
                  c.and        a1, a5
                  csrrwi       t5, 0x340, 2
                  sltu         a3, s11, a1
                  div          s2, s7, a0
                  c.mv         a3, s3
                  nop
                  csrrwi       s9, 0x340, 18
                  csrrs        a0, 0x340, zero
                  and          s9, a1, a5
                  xori         tp, s6, -1231
                  lui          s8, 152037
                  c.xor        a0, a2
                  mulhu        gp, gp, gp
                  sltiu        gp, a3, 1895
                  add          s1, a5, s0
                  c.xor        a3, s1
                  csrrci       s8, 0x340, 0
                  or           s11, a1, t1
                  addi         s6, s11, -1117
                  sll          s1, a7, a3
                  slt          a5, zero, a6
                  andi         s6, t2, 1174
                  c.sub        a4, s1
                  srai         zero, s3, 12
                  mulhsu       ra, s3, a0
                  or           a0, s6, s5
                  sub          a5, sp, a6
                  csrrs        s0, 0x340, zero
                  xori         a2, s8, -1276
                  lui          t1, 975
                  c.and        s0, a5
                  c.and        a3, a1
                  c.srai       a1, 3
                  srl          s2, t6, s2
                  csrrw        ra, 0x340, sp
                  auipc        s5, 26915
                  ori          s7, a5, 1647
                  c.lui        s4, 3
                  sll          a0, s11, tp
                  add          a4, s0, a6
                  or           t6, t3, s2
                  c.xor        s0, a2
                  csrrwi       s7, 0x340, 19
                  addi         t4, t2, -603
                  lui          s1, 675048
                  slli         zero, s2, 29
                  auipc        zero, 384768
                  mulh         s10, s10, s1
                  xor          s8, a3, s9
                  srli         t3, t2, 5
                  sll          s1, s3, t1
                  sra          t0, t5, t5
                  csrrc        s3, 0x340, zero
                  csrrci       t1, 0x340, 5
                  addi         a4, a7, -344
                  csrrsi       s3, 0x340, 0
                  srl          a3, t3, t1
                  slt          s9, s10, t3
                  c.srai       a1, 24
                  c.sub        a0, a4
                  andi         t3, t5, 1975
                  csrrwi       a3, 0x340, 18
                  andi         t3, t5, 2013
                  csrrci       t3, 0x340, 0
                  div          s11, s2, s10
                  rem          s7, a3, s10
                  c.li         a7, -1
                  addi         a4, a4, 957
                  sltiu        tp, zero, -362
                  c.li         t1, 16
                  srli         gp, t0, 6
                  sll          s0, a7, s9
                  csrrwi       t0, 0x340, 15
                  c.srai       a2, 7
                  c.li         t0, -1
                  xor          ra, zero, t3
                  slli         s10, a3, 28
                  sub          a2, t3, s10
                  c.lui        s3, 27
                  ori          s9, s6, -1060
                  slt          t0, t6, s6
                  c.and        s0, a5
                  mulhu        s6, s1, a5
                  slt          s8, s8, a5
                  srai         s2, s7, 16
                  xori         s6, s4, -1258
                  divu         s3, t4, s2
                  divu         a3, t1, a1
                  c.or         a0, a0
                  xori         s1, s11, -1820
                  sub          s5, s7, t2
                  c.add        s2, s3
                  addi         a1, tp, 875
                  srai         s7, a6, 7
                  c.srai       a3, 5
                  csrrci       a3, 0x340, 0
                  c.lui        s8, 16
                  c.andi       a1, 20
                  c.addi       s10, -1
                  srl          s5, t5, a2
                  c.andi       a2, 26
                  csrrs        s7, 0x340, zero
                  add          s11, a6, s1
                  csrrwi       t4, 0x340, 19
                  andi         s1, zero, 1640
                  csrrs        ra, 0x340, zero
                  divu         tp, a1, t3
                  csrrw        t0, 0x340, a7
                  srai         s7, tp, 20
                  sra          t1, s9, t5
                  slti         a2, ra, 1789
                  c.lui        t3, 3
                  mulh         t6, gp, a0
                  xori         s9, s0, -242
                  c.li         a3, -1
                  auipc        t1, 53904
                  rem          s1, t5, ra
                  andi         t1, t3, 1686
                  andi         t0, s10, 1309
                  mulhu        s11, a0, a1
                  c.and        a1, s0
                  c.slli       t5, 1
                  divu         s10, t5, a5
                  lui          ra, 452958
                  c.addi       t4, -1
                  srl          s5, s5, a4
                  sltu         gp, s7, t4
                  csrrsi       s1, 0x340, 1
                  c.mv         s5, s5
                  andi         s7, t1, 633
                  csrrs        s3, 0x340, t4
                  c.srai       s1, 4
                  c.srai       a3, 19
                  c.srai       a5, 25
                  and          s1, t4, t3
                  c.and        s1, a3
                  mul          s1, s11, s10
                  add          s7, a3, s4
                  sltu         gp, zero, a0
                  sra          t0, s8, s8
                  sub          t3, s6, tp
                  xori         t4, a4, 26
                  slt          gp, s7, s10
                  c.srai       a5, 7
                  c.or         a2, s1
                  c.mv         ra, s4
                  csrrc        s0, 0x340, zero
                  c.xor        a2, a4
                  rem          a3, s8, t1
                  mulhu        a7, a0, s3
                  csrrwi       t6, 0x340, 16
                  and          a1, t4, s4
                  nop
                  c.and        a1, a1
                  c.andi       a3, -1
                  c.and        s1, a1
                  c.slli       t6, 24
                  c.mv         s3, a2
                  xor          s10, s11, s1
                  c.and        s1, a1
                  srl          s4, s6, t1
                  nop
                  mul          t1, s9, a5
                  sll          a1, zero, s9
                  c.srai       a1, 7
                  c.or         a4, a1
                  c.li         s1, 15
                  slti         s1, s2, -299
                  csrrc        s7, 0x340, a4
                  nop
                  sltiu        a3, tp, 1811
                  xori         tp, t4, 615
                  srli         s6, s2, 27
                  sltu         s0, s11, tp
                  div          t4, ra, s0
                  add          tp, a6, s7
                  divu         zero, tp, t2
                  c.add        s1, s6
                  div          a7, t3, s8
                  sll          t1, sp, zero
                  slli         ra, s10, 16
                  sltu         a2, s7, gp
                  c.srai       s0, 20
                  lui          t5, 178369
                  c.li         s10, 26
                  slti         tp, s3, -1524
                  rem          a5, s7, t1
                  csrrci       s6, 0x340, 28
                  mulhsu       ra, s10, a3
                  c.addi       a3, -1
                  csrrci       s4, 0x340, 28
                  csrrs        s0, 0x340, tp
                  csrrci       ra, 0x340, 25
                  srli         s2, sp, 16
                  c.li         ra, -1
                  c.sub        a1, a2
                  addi         s7, a6, 625
                  andi         s5, a3, 866
                  c.add        a2, t2
                  srai         tp, a3, 9
                  sltiu        s8, s4, -426
                  auipc        s6, 408967
                  auipc        zero, 73504
                  c.mv         s4, s11
                  c.and        s0, a1
                  c.add        a3, a6
                  csrrs        a1, 0x340, zero
                  srl          a7, sp, a3
                  mul          s7, a6, s11
                  andi         t6, a2, 1978
                  c.and        s0, a3
                  c.li         s3, -1
                  csrrw        s0, 0x340, a7
                  nop
                  remu         s10, tp, sp
                  rem          s3, a3, s9
                  csrrci       a7, 0x340, 9
                  c.nop
                  rem          a1, t6, s3
                  auipc        s4, 726171
                  c.li         a0, -1
                  c.nop
                  c.nop
                  c.xor        a4, a4
                  add          t5, s4, t3
                  c.or         a5, a0
                  csrrs        a1, 0x340, t6
                  ori          t5, a7, -323
                  slti         t4, t4, 1335
                  addi         a1, s4, 1884
                  csrrci       a5, 0x340, 16
                  srli         s4, s1, 18
                  xori         s6, a6, -106
                  c.add        s10, s1
                  sltiu        tp, t0, 1526
                  srl          a4, a7, zero
                  auipc        s1, 820582
                  c.srli       a1, 26
                  csrrsi       s0, 0x340, 0
                  sll          s8, t1, ra
                  auipc        ra, 643246
                  andi         s5, a0, 888
                  rem          s0, a1, s1
                  sltu         s11, s0, tp
                  srai         gp, a0, 26
                  c.and        a5, a3
                  c.li         a1, 0
                  sltu         a4, ra, s5
                  auipc        s11, 653257
                  c.srli       a0, 6
                  c.srai       a0, 5
                  mulhsu       a1, a3, zero
                  remu         a1, s3, a7
                  and          s4, s5, s6
                  c.sub        a0, s0
                  sltu         a7, a6, a2
                  rem          s6, s11, t2
                  c.lui        a2, 25
                  sltu         a5, ra, sp
                  slli         a1, tp, 16
                  c.xor        s1, a4
                  addi         a1, s1, -1779
                  lui          t5, 363529
                  xor          t6, t4, t5
                  c.nop
                  lui          t0, 303512
                  slt          t5, a0, tp
                  c.andi       s1, 18
                  c.andi       a4, -1
                  divu         t1, s11, s6
                  auipc        t0, 768755
                  lui          zero, 706041
                  c.or         a5, a1
                  div          a1, t2, s0
                  mulhsu       t6, s5, t2
                  and          a7, s7, s4
                  c.lui        t6, 6
                  c.srli       a5, 6
                  c.slli       s5, 7
                  sll          t6, ra, t0
                  mulh         s3, sp, s7
                  xor          s2, t0, a4
                  c.nop
                  div          tp, a2, a1
                  csrrwi       s9, 0x340, 12
                  slt          t0, tp, t4
                  nop
                  mulhsu       s10, s11, s1
                  div          a7, a5, s5
                  srli         s7, a5, 14
                  sltu         ra, s2, s3
                  srli         a3, a6, 16
                  or           t3, a2, t3
                  rem          t1, a4, s7
                  c.and        s1, a1
                  c.sub        a1, a2
                  slt          ra, s9, s7
                  c.srli       a1, 23
                  div          t1, a6, s11
                  c.nop
                  addi         ra, a1, 979
                  mul          a5, gp, ra
                  c.mv         t4, a6
                  c.sub        a4, a1
                  srai         a5, a6, 10
                  csrrc        s10, 0x340, zero
                  divu         s4, tp, s7
                  addi         s1, tp, -1242
                  c.srai       a2, 16
                  ori          a3, s11, 1414
                  srl          s4, ra, a5
                  nop
                  c.srai       a2, 8
                  slti         ra, a7, 248
                  add          a0, gp, s9
                  c.addi       a3, 24
                  c.li         s1, 17
                  mulhu        zero, a4, zero
                  srl          s6, a2, s5
                  c.addi       s0, -1
                  xori         s7, s4, -1255
                  mulhu        s0, s11, t3
                  nop
                  addi         t5, a2, 736
                  c.add        t0, t6
                  csrrwi       s8, 0x340, 15
                  div          t4, gp, a1
                  slt          a7, t0, t1
                  sll          s11, t6, a1
                  c.li         s4, -1
                  c.xor        a1, s0
                  c.li         s10, -1
                  addi         s7, t5, -1333
                  csrrwi       t5, 0x340, 0
                  c.addi       s10, -1
                  add          t4, sp, ra
                  add          s7, s3, a4
                  sub          s2, a1, s11
                  c.xor        s1, a4
                  c.xor        a0, a3
                  sra          s7, t5, s8
                  nop
                  nop
                  and          s4, tp, zero
                  csrrsi       a2, 0x340, 0
                  sub          a0, a7, s3
                  c.srli       a2, 28
                  c.add        s10, s1
                  csrrc        t0, 0x340, s2
                  andi         a0, sp, 940
                  c.andi       a5, -1
                  div          s8, s3, a6
                  srl          s1, s2, s7
                  mulhsu       a7, t3, s1
                  remu         a2, t1, a1
                  c.nop
                  sll          a1, a5, t5
                  c.srli       s1, 8
                  csrrci       a4, 0x340, 0
                  c.srai       a1, 19
                  c.or         s0, a0
                  ori          a5, zero, 1277
                  csrrs        tp, 0x340, t3
                  sltiu        t1, t3, -1859
                  c.srai       a3, 25
                  c.or         a5, a0
                  div          a3, a6, a4
                  remu         t1, s3, a5
                  csrrw        t0, 0x340, s5
                  csrrw        tp, 0x340, s10
                  csrrs        s1, 0x340, zero
                  csrrw        a3, 0x340, a5
                  rem          t5, a1, s2
                  sltu         s6, s1, s8
                  csrrwi       s4, 0x340, 25
                  srai         s3, t4, 15
                  lui          s8, 943324
                  c.and        a3, s0
                  srai         t5, s8, 13
                  nop
                  c.lui        gp, 10
                  andi         gp, zero, -323
                  srli         s10, a5, 19
                  and          t4, t6, s5
                  sltiu        s9, t4, 1621
                  slt          a3, ra, s7
                  csrrs        s9, 0x340, t6
                  csrrc        s11, 0x340, s1
                  srl          s5, zero, a2
                  sub          s5, t1, a6
                  mul          s2, t2, a4
                  c.sub        s0, s1
                  mulhu        t4, a4, a0
                  c.li         s7, 19
                  csrrwi       s6, 0x340, 8
                  c.add        s2, a6
                  c.srai       a5, 12
                  csrrs        s9, 0x340, zero
                  c.addi       t1, -1
                  c.andi       a2, 2
                  mulh         s10, s1, zero
                  csrrsi       s11, 0x340, 18
                  and          a7, a2, a3
                  csrrc        s9, 0x340, s4
                  csrrsi       t5, 0x340, 0
                  mulhu        t5, s9, gp
                  csrrs        a5, 0x340, zero
                  c.and        s0, s0
                  and          a3, sp, s9
                  c.addi       s9, 29
                  c.or         a4, a5
                  c.srli       a5, 15
                  c.mv         s7, sp
                  mulh         t1, s3, s8
                  c.add        s7, s3
                  slti         a5, sp, -1315
                  mulhu        t3, a4, a0
                  divu         a7, s2, t2
                  or           s4, s7, s0
                  c.addi       a0, -1
                  and          s7, s6, zero
                  slli         s11, a2, 0
                  c.li         s5, 18
                  addi         a3, s3, 290
                  mul          a0, t3, gp
                  c.srai       s0, 8
                  c.xor        a4, a2
                  csrrci       a3, 0x340, 0
                  c.xor        a2, a2
                  csrrwi       a0, 0x340, 9
                  c.slli       s11, 28
                  sltu         ra, a0, s8
                  srai         s4, tp, 21
                  c.nop
                  andi         zero, s2, -947
                  srl          s4, s11, s1
                  auipc        t6, 662247
                  andi         t1, tp, 1887
                  slti         tp, t2, 2015
                  csrrci       s7, 0x340, 1
                  mul          a7, s2, sp
                  mul          gp, s11, t1
                  c.addi       t0, 21
                  slt          s10, t5, ra
                  mul          s2, zero, a2
                  srai         a7, t1, 15
                  mulh         t6, ra, a7
                  div          ra, t4, a5
                  div          s11, t1, s2
                  c.li         s4, -1
                  csrrci       zero, 0x340, 0
                  srai         s11, t2, 4
                  slt          t6, s5, s4
                  csrrci       t1, 0x340, 0
                  div          a5, s1, s3
                  auipc        t3, 590108
                  slt          t1, a3, s5
                  addi         t6, s4, 1659
                  mulhu        s7, s3, a6
                  srli         s5, s8, 24
                  andi         a3, a5, 762
                  c.nop
                  sltiu        s6, s4, -244
                  csrrw        ra, 0x340, s0
                  mulhu        s3, a7, s11
                  lui          a4, 719609
                  csrrsi       a4, 0x340, 0
                  divu         s4, s2, t1
                  slt          a5, a3, s3
                  xori         a1, t6, -1625
                  sub          zero, s9, s10
                  andi         a2, s6, 1729
                  srai         s5, s5, 23
                  csrrc        s3, 0x340, s11
                  mul          s7, s2, s1
                  c.or         a3, a4
                  c.xor        s0, a1
                  slt          s4, t4, s8
                  sra          t4, s4, t6
                  c.nop
                  slli         gp, a3, 26
                  auipc        t6, 206849
                  mulhu        a4, a3, a1
                  csrrw        zero, 0x340, a4
                  andi         a0, s10, 609
                  xori         a2, tp, -1277
                  srai         s8, a1, 24
                  c.mv         a5, s2
                  xor          s10, a5, a5
                  csrrc        s2, 0x340, zero
                  csrrci       s5, 0x340, 15
                  csrrs        t3, 0x340, tp
                  srli         tp, s1, 26
                  divu         t6, s3, ra
                  csrrs        s7, 0x340, zero
                  c.sub        a5, a0
                  csrrci       a5, 0x340, 0
                  c.srli       a4, 3
                  andi         s2, gp, -1969
                  c.srai       a3, 5
                  c.sub        a4, a1
                  csrrci       s4, 0x340, 23
                  c.add        tp, ra
                  slli         t3, zero, 31
                  div          s4, s7, s7
                  and          t5, s3, a7
                  csrrci       t5, 0x340, 23
                  lui          tp, 55289
                  divu         a5, zero, gp
                  c.sub        a0, a4
                  slt          s11, a0, s4
                  srli         a2, s10, 4
                  csrrs        s1, 0x340, s4
                  c.li         t6, 5
                  xor          a3, s6, t2
                  csrrc        a1, 0x340, tp
                  c.srli       a0, 10
                  ori          a5, gp, -760
                  c.srai       s0, 24
                  c.li         ra, 31
                  mulh         s11, s3, s1
                  add          a7, gp, a6
                  mulh         t6, s3, a0
                  c.srli       a4, 23
                  srai         s0, s0, 4
                  c.srai       s0, 29
                  addi         s1, a6, 996
                  nop
                  and          t4, t2, s10
                  c.addi       s4, 15
                  remu         a0, t2, a0
                  c.lui        t0, 14
                  csrrw        s5, 0x340, s4
                  andi         s0, a5, 1161
                  c.nop
                  srl          s0, s11, sp
                  mul          a4, gp, zero
                  c.srli       s0, 22
                  divu         s1, s1, s9
                  sub          t6, s11, s5
                  div          s9, t0, a1
                  mul          s5, s7, a5
                  srl          zero, a4, s2
                  sltu         t4, t4, a5
                  sll          t6, s8, s3
                  csrrsi       s1, 0x340, 0
                  andi         s10, t2, -934
                  sra          a0, a1, a3
                  c.slli       a2, 25
                  mulhsu       s3, s9, sp
                  sub          a7, s1, t3
                  srai         s1, a1, 16
                  srli         a3, a3, 13
                  csrrsi       s0, 0x340, 17
                  c.lui        t6, 14
                  c.mv         tp, a7
                  sltiu        t3, s2, -1312
                  ori          s6, a4, -71
                  mulh         s4, zero, s4
                  c.lui        a3, 28
                  andi         t6, tp, -749
                  c.xor        s0, s0
                  c.or         s0, a4
                  csrrci       a2, 0x340, 0
                  mulhu        t5, a5, s7
                  add          s8, s11, t5
                  addi         s11, a3, -1863
                  srl          s1, t6, s3
                  mul          gp, s9, a1
                  sra          t1, zero, s7
                  c.slli       s7, 17
                  sltu         t6, tp, s4
                  slti         s10, s3, -689
                  c.li         a1, 22
                  csrrsi       s9, 0x340, 14
                  sll          t5, s5, t2
                  c.sub        s0, a4
                  mul          s3, s9, a1
                  ori          s11, t3, 901
                  addi         tp, s7, -1815
                  mul          s2, zero, a3
                  sll          s9, tp, a4
                  sra          s7, s2, a4
                  c.li         t0, -1
                  lui          s5, 971391
                  xor          tp, t0, gp
                  divu         s9, sp, tp
                  c.and        a4, s0
                  xor          t0, s10, s5
                  srli         t1, s11, 1
                  srai         zero, s11, 10
                  srl          s8, s8, t5
                  c.add        s7, t6
                  c.li         t0, -1
                  c.addi       s11, -1
                  andi         t6, tp, -1327
                  csrrsi       s11, 0x340, 0
                  c.li         t0, 27
                  slli         a4, t2, 0
                  andi         s1, a2, -1439
                  srai         t3, t0, 19
                  or           t5, ra, s6
                  auipc        a1, 284890
                  srli         t3, s7, 12
                  c.slli       s2, 15
                  xori         tp, t1, -1912
                  c.xor        a0, a3
                  addi         s8, a6, -367
                  c.slli       s8, 14
                  or           s4, s9, s7
                  sub          ra, a3, s5
                  c.sub        s0, a5
                  c.nop
                  or           t6, a3, a7
                  c.sub        a5, a3
                  c.add        t1, ra
                  mulhsu       t3, a6, s8
                  mul          a0, t2, s0
                  slt          s0, t1, a0
                  rem          a4, a4, t3
                  csrrci       t1, 0x340, 13
                  ori          a3, a0, 1332
                  sub          s1, s0, t4
                  divu         tp, s9, a6
                  sltu         s10, s5, s11
                  c.srli       a3, 10
                  auipc        t6, 720482
                  c.sub        a5, a0
                  rem          tp, a5, a4
                  csrrs        t6, 0x340, zero
                  mulhsu       t6, a1, s5
                  c.srai       a4, 4
                  auipc        s8, 205939
                  c.xor        a4, a5
                  mul          zero, s8, s0
                  xori         a4, gp, -452
                  auipc        t6, 102728
                  nop
                  slti         t0, s7, 668
                  c.and        a0, a3
                  csrrsi       s6, 0x340, 16
                  divu         a3, a0, s2
                  csrrc        s11, 0x340, zero
                  slli         ra, t3, 28
                  c.and        a4, a1
                  c.add        s5, s0
                  c.addi       s10, -1
                  auipc        s6, 824435
                  rem          a1, t5, a0
                  lui          t1, 226137
                  c.or         a2, a1
                  sltu         s2, s11, a4
                  div          gp, t1, a3
                  c.andi       a0, -1
                  c.nop
                  c.srai       a2, 14
                  slt          ra, s1, a4
                  auipc        t3, 740092
                  srl          a5, s1, s7
                  sltiu        t3, t5, 1861
                  sra          a4, s0, s5
                  mulhu        zero, s7, a7
                  sltu         t3, t4, sp
                  csrrsi       t6, 0x340, 0
                  and          s11, a7, s1
                  csrrci       zero, 0x340, 6
                  sltiu        s10, t2, 912
                  divu         a3, s7, t6
                  mul          s2, s6, a6
                  add          t6, s4, a5
                  divu         ra, a3, t0
                  xor          s11, a7, a0
                  c.or         a4, a2
                  ori          a4, a4, -682
                  c.or         a2, a4
                  mulhsu       a0, s5, s4
                  xor          gp, t6, ra
                  c.addi       t3, -1
                  c.addi       s8, -1
                  auipc        t3, 272334
                  slt          s7, a5, s4
                  srli         s4, s4, 4
                  sra          tp, t6, s8
                  slli         t1, s11, 10
                  sll          a1, s8, s11
                  remu         a2, a0, tp
                  c.xor        s1, s0
                  c.lui        s4, 28
                  c.addi       a1, 1
                  c.nop
                  c.srai       a4, 21
                  nop
                  c.srai       a5, 19
                  c.and        a0, a4
                  mulhu        zero, s6, s5
                  csrrsi       t5, 0x340, 0
                  or           t1, s0, s9
                  divu         s0, a6, zero
                  c.srli       s1, 26
                  lui          s11, 805571
                  csrrsi       a4, 0x340, 0
                  c.add        a2, a4
                  andi         t6, t0, -680
                  c.sub        a4, a3
                  c.li         t3, -1
                  addi         t1, sp, -979
                  ori          ra, s9, -985
                  c.sub        s1, a4
                  csrrsi       a4, 0x340, 0
                  c.mv         a0, a1
                  c.or         a5, a4
                  csrrsi       a3, 0x340, 0
                  divu         a0, t1, a7
                  sll          a5, t1, a3
                  c.slli       a0, 4
                  sub          t1, ra, t3
                  divu         s10, s9, a7
                  mulhsu       t4, s11, s10
                  xori         tp, s10, 1056
                  csrrci       t4, 0x340, 3
                  lui          s5, 901104
                  sltiu        tp, s8, -1436
                  ori          a5, t0, 928
                  mulh         a2, a4, gp
                  c.lui        a4, 9
                  nop
                  srai         t4, t0, 8
                  srli         a5, s0, 31
                  csrrw        tp, 0x340, sp
                  c.srli       s1, 19
                  csrrs        s4, 0x340, s7
                  csrrw        s11, 0x340, s1
                  divu         s9, s5, s11
                  c.or         s1, a0
                  sub          s5, zero, s11
                  csrrwi       s4, 0x340, 22
                  xori         zero, zero, -1072
                  nop
                  c.srai       a4, 1
                  c.slli       a3, 1
                  add          s4, a3, tp
                  srl          gp, t0, tp
                  c.mv         t1, t6
                  c.srli       s1, 15
                  csrrci       s3, 0x340, 3
                  mulhu        s4, t1, a6
                  c.nop
                  mulh         s6, a1, s6
                  mul          t1, s8, s8
                  csrrci       t0, 0x340, 0
                  nop
                  andi         t1, s8, -1369
                  c.li         s2, 19
                  csrrc        t0, 0x340, zero
                  c.xor        s0, s1
                  mul          a3, s4, gp
                  srai         s1, t5, 4
                  slti         tp, s4, 1700
                  csrrs        t6, 0x340, t2
                  or           t6, gp, s2
                  andi         s4, s0, -1631
                  or           a1, s3, zero
                  slt          a7, t1, s3
                  remu         a3, a6, sp
                  xor          s11, a6, s3
                  lui          tp, 544739
                  c.srli       a4, 18
                  addi         s9, t1, -1224
                  sub          ra, zero, zero
                  lui          ra, 84400
                  xor          a3, tp, zero
                  c.srai       a4, 6
                  remu         s1, t3, t2
                  srai         s6, t3, 28
                  sltu         s10, a6, t4
                  sll          s6, gp, a4
                  c.andi       a4, -1
                  add          a3, a1, t1
                  c.or         a3, s0
                  c.lui        a7, 8
                  sra          ra, gp, s3
                  csrrsi       s4, 0x340, 11
                  c.or         a2, a3
                  c.xor        a2, a5
                  slt          a1, ra, tp
                  sll          a3, s6, a1
                  csrrs        a3, 0x340, zero
                  sra          s2, s0, a6
                  csrrw        ra, 0x340, a3
                  c.srli       a1, 31
                  sub          t3, t1, t2
                  and          s2, t2, a4
                  csrrwi       a4, 0x340, 4
                  c.srli       a1, 20
                  add          s2, sp, a3
                  c.srli       a0, 16
                  c.li         s2, 12
                  c.sub        a2, a1
                  rem          a5, t1, a7
                  auipc        ra, 789361
                  c.add        a0, s0
                  auipc        zero, 163492
                  lui          t3, 592390
                  csrrsi       s1, 0x340, 6
                  rem          s3, a3, s7
                  csrrsi       s0, 0x340, 0
                  c.or         s0, a4
                  c.andi       a2, 13
                  sltiu        t3, a3, -1892
                  sll          s1, s0, a4
                  c.and        a0, a3
                  c.li         s9, -1
                  ori          tp, t3, 1524
                  c.mv         s7, s8
                  srai         a2, s9, 6
                  xori         s1, gp, -2003
                  xor          zero, s11, s8
                  csrrsi       a3, 0x340, 0
                  srai         a1, a4, 14
                  c.mv         s3, a1
                  slli         s10, a6, 31
                  remu         a7, s5, sp
                  divu         ra, a2, t3
                  sub          s0, s3, t5
                  csrrw        s0, 0x340, s5
                  divu         tp, s11, t6
                  xor          s7, s0, s10
                  divu         s2, t6, a4
                  divu         gp, s8, s8
                  c.xor        s0, s1
                  c.addi       t0, -1
                  divu         s7, s0, a1
                  sltu         t1, s4, tp
                  csrrwi       tp, 0x340, 1
                  sra          s6, s9, s5
                  slti         s1, tp, -393
                  slli         tp, sp, 19
                  auipc        a2, 358732
                  sltu         s7, t3, s2
                  srai         gp, s7, 2
                  csrrc        s4, 0x340, zero
                  c.mv         s6, t4
                  addi         a3, s10, 408
                  csrrci       a7, 0x340, 0
                  c.mv         s3, a6
                  mul          a4, a4, s9
                  c.mv         a7, t4
                  csrrw        s11, 0x340, s2
                  csrrc        a0, 0x340, zero
                  c.nop
                  sltiu        a1, s9, 941
                  remu         a3, a0, a2
                  rem          s3, a1, gp
                  srai         a1, s11, 4
                  divu         t1, t6, t0
                  auipc        s3, 891439
                  csrrwi       a4, 0x340, 9
                  csrrsi       gp, 0x340, 0
                  mul          ra, a2, a3
                  or           s5, ra, s11
                  sltiu        ra, t6, 468
                  slti         a7, a4, -1500
                  c.and        a4, s0
                  remu         a3, a5, s1
                  sub          s3, s7, sp
                  slli         gp, a7, 12
                  auipc        t1, 125381
                  rem          s8, a7, t6
                  nop
                  sltiu        t0, s11, 1605
                  csrrsi       s1, 0x340, 9
                  andi         a4, a7, 191
                  srli         a2, s10, 27
                  sltu         t6, a0, a4
                  xori         s11, t1, 859
                  srli         s3, a0, 11
                  sll          ra, tp, tp
                  div          a2, a6, gp
                  mul          s11, a0, a5
                  mulhsu       ra, s3, s10
                  slli         t5, a2, 22
                  c.srai       a4, 3
                  ori          a7, a6, 1715
                  c.add        s6, s0
                  rem          zero, gp, s2
                  mulhsu       s11, s6, s5
                  srai         s2, t6, 31
                  divu         a3, a3, s3
                  addi         s8, ra, 39
                  c.sub        a3, a5
                  c.mv         s11, s8
                  c.srli       a5, 30
                  sltu         s5, t0, s6
                  csrrwi       tp, 0x340, 20
                  c.nop
                  andi         a1, s2, 1787
                  c.mv         ra, a6
                  slt          t4, t4, a1
                  slti         a5, s9, 1701
                  c.srli       a0, 16
                  srli         t3, s1, 26
                  and          a7, t6, s7
                  c.xor        a0, a5
                  slli         s2, s1, 27
                  ori          gp, s5, -1219
                  csrrci       s7, 0x340, 6
                  csrrci       zero, 0x340, 0
                  c.and        a4, a5
                  srai         s6, ra, 27
                  csrrw        s2, 0x340, s1
                  sltu         s10, a0, ra
                  mulh         a0, a2, t4
                  divu         s6, zero, t4
                  srai         s5, s8, 14
                  slt          gp, s9, s7
                  srl          a7, t2, sp
                  srai         s3, t2, 16
                  mulhu        a0, a7, s11
                  mulhu        a4, t2, a5
                  sra          t4, a3, t2
                  or           t0, t2, s7
                  sra          s6, ra, s6
                  srli         ra, ra, 4
                  mul          a2, t1, s4
                  lui          s7, 1014411
                  sll          a4, s6, t0
                  or           a2, t6, a6
                  rem          a0, tp, a4
                  c.sub        a4, a5
                  c.xor        a2, s0
                  sltiu        s2, s3, 1160
                  ori          t6, s3, -1727
                  c.addi       s7, 26
                  lui          a0, 725021
                  c.addi       s0, 24
                  auipc        t0, 525984
                  c.andi       a1, -1
                  slt          s4, s1, t2
                  slti         s5, s1, 2025
                  slli         s1, zero, 19
                  c.mv         t1, a3
                  c.or         s0, a3
                  srli         t5, t6, 29
                  or           t4, t3, s4
                  mulh         a7, s7, tp
                  csrrc        s3, 0x340, zero
                  mulh         tp, s8, t3
                  csrrsi       t3, 0x340, 28
                  csrrc        t4, 0x340, zero
                  c.slli       t6, 28
                  c.and        s0, a0
                  sra          s2, zero, s2
                  srai         s5, a1, 21
                  xor          t0, zero, gp
                  c.sub        a3, a0
                  remu         a2, s3, gp
                  csrrc        t6, 0x340, zero
                  csrrw        a7, 0x340, a2
                  c.nop
                  and          a3, s0, sp
                  c.sub        s1, a3
                  mulhu        gp, zero, sp
                  csrrs        t5, 0x340, zero
                  add          t0, t1, a4
                  c.lui        s6, 13
                  slti         s11, t1, -711
                  remu         s10, s8, t3
                  c.add        a0, s1
                  sltiu        s2, t4, -1718
                  csrrc        s2, 0x340, zero
                  mulh         s3, t1, gp
                  csrrsi       a3, 0x340, 0
                  c.lui        a5, 13
                  or           s9, a4, t1
                  srai         s5, s0, 22
                  auipc        a0, 130827
                  divu         s9, sp, t3
                  c.lui        s2, 6
                  c.srli       a5, 4
                  csrrsi       s11, 0x340, 21
                  slt          s4, s11, a6
                  c.li         a5, 10
                  mulhsu       a4, s8, tp
                  mulh         s2, a0, t1
                  c.srai       a2, 24
                  c.li         s3, 18
                  srl          a1, s0, a3
                  lui          ra, 444280
                  csrrs        s6, 0x340, zero
                  srai         t5, t6, 6
                  nop
                  mulhu        s11, t0, a3
                  addi         t4, t3, -1752
                  c.sub        a1, s1
                  c.add        s10, s9
                  ori          s6, s3, 1491
                  sltu         a7, a2, a6
                  mulh         s4, ra, s5
                  c.sub        a3, a5
                  csrrs        a5, 0x340, t4
                  c.lui        s0, 21
                  csrrsi       t5, 0x340, 0
                  slli         a4, s10, 0
                  c.addi       gp, 28
                  c.slli       ra, 23
                  nop
                  sra          ra, t2, t5
                  c.li         s5, 10
                  sll          ra, s4, s8
                  slli         a7, t5, 15
                  xor          s10, s1, a1
                  srl          a7, a7, s4
                  c.sub        a5, a4
                  c.sub        a2, a5
                  andi         t5, t4, -87
                  mulhsu       s6, s5, t6
                  c.slli       tp, 14
                  sra          s6, gp, a5
                  lui          a3, 690303
                  xori         a5, a0, 770
                  remu         a3, s4, s3
                  nop
                  auipc        s11, 703718
                  remu         s5, t0, t5
                  auipc        s11, 589305
                  sub          s1, s10, a0
                  srl          a0, s10, t3
                  c.mv         a2, t0
                  mulhu        ra, tp, a4
                  slt          a3, s4, t4
                  sltiu        s1, a3, 588
                  csrrs        t4, 0x340, zero
                  slti         s7, s11, -170
                  c.nop
                  ori          tp, t6, -931
                  c.addi       s2, 29
                  andi         s3, t5, 1226
                  sub          a3, a4, s8
                  rem          s4, s11, s10
                  lui          a3, 425648
                  mulhu        s0, t3, sp
                  mulhsu       a7, s9, s4
                  sra          t3, s3, a0
                  ori          s6, s5, 51
                  c.slli       gp, 13
                  andi         s5, a3, 609
                  ori          t4, s3, 1430
                  csrrs        gp, 0x340, zero
                  csrrsi       t5, 0x340, 0
                  nop
                  c.li         a3, 0
                  auipc        a2, 566502
                  add          gp, s5, a5
                  addi         s4, s7, -1296
                  c.lui        a1, 20
                  mulhsu       a3, a6, tp
                  c.srli       a5, 13
                  ori          a4, s10, 1712
                  mul          s7, sp, sp
                  rem          s2, zero, a0
                  csrrw        s8, 0x340, ra
                  csrrw        s4, 0x340, s3
                  sub          s6, t4, t0
                  slli         s11, t3, 30
                  csrrc        s8, 0x340, s6
                  addi         a4, s0, -1695
                  divu         t1, s3, a4
                  csrrci       s8, 0x340, 10
                  slli         s10, tp, 3
                  csrrwi       t1, 0x340, 8
                  add          ra, s9, a3
                  sra          s7, s11, a3
                  csrrwi       a1, 0x340, 11
                  sltiu        s6, s0, -837
                  mulhu        ra, t3, s6
                  c.addi       a5, -1
                  csrrwi       s6, 0x340, 2
                  slt          s9, sp, s8
                  c.add        s10, t4
                  andi         s4, ra, 1737
                  c.slli       s1, 10
                  c.mv         s7, a4
                  c.li         s10, 25
                  divu         s0, tp, zero
                  mulhu        a1, t5, ra
                  c.nop
                  c.and        a0, a0
                  div          s10, s3, a6
                  xori         a3, a0, -1057
                  csrrw        t4, 0x340, s1
                  c.srli       s0, 3
                  slti         s4, a5, -490
                  csrrci       a2, 0x340, 0
                  remu         s10, s11, t5
                  c.srli       s1, 3
                  and          t4, a2, t0
                  c.lui        s6, 3
                  c.li         ra, -1
                  c.or         s1, a5
                  srai         s2, s7, 29
                  c.add        a5, t1
                  c.addi       gp, 13
                  nop
                  csrrci       s7, 0x340, 0
                  and          s8, a5, a7
                  csrrw        s0, 0x340, s1
                  srl          ra, a5, a5
                  lui          s10, 939752
                  c.sub        a0, s1
                  xori         s0, a1, 1815
                  c.mv         a7, a6
                  c.slli       s9, 24
                  c.srai       a3, 24
                  divu         a3, s1, a7
                  auipc        a1, 185782
                  mulh         s4, t1, sp
                  csrrsi       t6, 0x340, 0
                  auipc        s0, 786514
                  c.slli       s6, 30
                  xori         t0, a3, 584
                  c.andi       a1, -1
                  add          s11, tp, sp
                  mulh         s6, s5, s8
                  csrrsi       a1, 0x340, 10
                  mulhsu       s7, a2, ra
                  c.xor        a3, a2
                  srli         s6, t0, 13
                  csrrw        t4, 0x340, s5
                  c.sub        a1, a4
                  rem          t0, a0, a1
                  addi         s9, s5, -34
                  c.mv         s7, a2
                  srli         t3, s1, 7
                  slt          s6, t1, a2
                  slli         zero, t1, 5
                  mul          s3, a7, s1
                  auipc        s7, 682248
                  srli         s2, ra, 18
                  srai         s9, sp, 14
                  or           zero, s8, a3
                  remu         a2, tp, a7
                  c.lui        s1, 30
                  ori          t4, s2, -1112
                  sub          s8, s5, a6
                  srli         a2, a5, 10
                  c.andi       a5, -1
                  addi         a3, s5, -1948
                  c.lui        a3, 4
                  mulh         a3, s0, s8
                  c.srai       s0, 6
                  csrrwi       s8, 0x340, 10
                  div          a0, t4, s4
                  sltiu        a3, s8, -1473
                  csrrci       ra, 0x340, 0
                  csrrwi       t6, 0x340, 24
                  c.andi       a2, -1
                  c.li         ra, 27
                  c.add        s5, t3
                  divu         a0, s0, s0
                  xor          t6, s10, t0
                  c.andi       s1, -1
                  sltu         s9, a1, t4
                  srai         s9, gp, 10
                  add          t6, t6, s1
                  div          a7, t5, s0
                  sll          a7, ra, gp
                  c.addi       s3, 29
                  or           s5, sp, a3
                  c.add        t0, s2
                  or           t4, sp, t2
                  srai         s0, a3, 23
                  mulh         a5, a6, t6
                  addi         zero, a7, -1080
                  mulhu        s1, t0, tp
                  addi         a5, a0, 737
                  divu         ra, t3, gp
                  sra          tp, s5, a4
                  srli         s7, a0, 28
                  or           s5, t5, a5
                  csrrw        s2, 0x340, zero
                  ori          t5, s3, 9
                  c.srli       a0, 15
                  xori         s9, t0, 22
                  div          t4, s5, s11
                  ori          gp, tp, -152
                  xor          a2, t0, a1
                  mulh         s6, s2, t3
                  c.mv         s9, t6
                  auipc        a2, 338524
                  mul          t6, t1, a7
                  remu         s9, a1, t5
                  lui          s4, 344235
                  xori         zero, a5, -138
                  divu         s1, a4, s3
                  mulhu        s7, s1, t1
                  mulhu        t5, gp, zero
                  srl          t5, s1, tp
                  c.slli       s3, 10
                  csrrs        a3, 0x340, zero
                  auipc        a7, 1007231
                  ori          s10, t5, 1038
                  csrrsi       a3, 0x340, 0
                  srl          t1, s6, s3
                  mulhsu       a4, s1, t1
                  srli         s7, s11, 10
                  c.slli       t0, 19
                  csrrw        s5, 0x340, s11
                  c.and        s0, a4
                  auipc        s10, 908923
                  or           a3, s8, t4
                  c.or         a5, s1
                  c.li         t4, -1
                  csrrw        ra, 0x340, t4
                  nop
                  csrrsi       t4, 0x340, 21
                  c.addi       s10, 28
                  c.mv         ra, s6
                  srl          s7, s4, t6
                  c.srli       s1, 16
                  c.xor        s1, s1
                  div          t4, s11, t2
                  csrrs        s6, 0x340, a2
                  csrrci       s5, 0x340, 0
                  c.srai       s0, 15
                  andi         a1, a3, 590
                  remu         a7, a1, t6
                  sra          s2, tp, s4
                  c.andi       a5, -1
                  nop
                  c.li         t6, 16
                  xor          t0, a4, tp
                  c.lui        s1, 23
                  addi         s0, s3, 1455
                  c.xor        a3, a4
                  mulhu        t1, a0, a6
                  csrrw        t6, 0x340, s2
                  c.andi       a0, -1
                  nop
                  c.nop
                  c.add        s3, a0
                  csrrc        a3, 0x340, ra
                  sub          s5, a2, ra
                  sub          s6, sp, s4
                  c.xor        a1, a3
                  slt          t4, a7, t2
                  c.srai       a1, 12
                  lui          s6, 554215
                  sll          s11, zero, t4
                  csrrci       s10, 0x340, 7
                  remu         t3, s4, s5
                  nop
                  mulhu        a5, s0, s4
                  or           s2, s4, zero
                  c.andi       a4, 24
                  csrrwi       s4, 0x340, 26
                  ori          s0, t4, 699
                  c.nop
                  c.addi       a0, -1
                  mulhu        zero, a2, t2
                  c.sub        a4, a1
                  lui          t6, 220452
                  sltu         a0, a7, s10
                  xor          a5, t5, a0
                  addi         s0, t4, -29
                  c.lui        t1, 13
                  sltiu        s7, sp, -284
                  c.and        s0, a2
                  xori         t3, a4, 845
                  add          ra, ra, s11
                  sra          s1, s2, ra
                  or           s9, s0, s3
                  c.sub        s1, a0
                  nop
                  c.nop
                  csrrw        s10, 0x340, s4
                  c.srli       s1, 16
                  c.or         a4, s1
                  c.xor        a5, a1
                  csrrci       ra, 0x340, 0
                  mul          t0, a3, s7
                  c.nop
                  csrrwi       a3, 0x340, 29
                  sra          a7, s8, a3
                  srli         s0, ra, 5
                  csrrci       a5, 0x340, 5
                  sra          s11, s6, gp
                  mulhu        s3, s8, a4
                  csrrci       s4, 0x340, 0
                  addi         t5, gp, 25
                  c.xor        a0, s1
                  srli         s6, t5, 25
                  rem          a3, a7, t1
                  sra          s6, t1, s2
                  or           tp, zero, t0
                  csrrs        s3, 0x340, a3
                  nop
                  c.nop
                  mulhu        s6, a7, s11
                  srl          a1, t1, s7
                  c.xor        a3, s1
                  ori          s10, a0, -331
                  c.srli       a2, 27
                  or           t4, t3, s3
                  csrrci       t1, 0x340, 13
                  csrrwi       tp, 0x340, 28
                  c.or         a1, s1
                  divu         a0, a2, zero
                  csrrci       t0, 0x340, 22
                  c.nop
                  xori         s5, a7, 1846
                  xori         s11, s11, 1380
                  c.addi       s2, -1
                  and          s0, s1, t4
                  srai         a3, t4, 27
                  c.nop
                  c.xor        a1, s0
                  srai         s2, s7, 26
                  sra          s3, t6, a0
                  c.xor        a3, s0
                  c.srai       s1, 15
                  or           t6, tp, sp
                  slli         a1, s9, 28
                  lui          s2, 283576
                  sra          gp, s6, a1
                  srai         t3, s6, 21
                  slti         a1, s1, -317
                  c.li         gp, -1
                  div          ra, s8, zero
                  rem          a3, s4, s5
                  mul          s2, s1, s1
                  slti         t0, t1, -1412
                  slli         a3, a4, 11
                  c.andi       s1, -1
                  sra          a5, s4, s7
                  c.or         s1, a2
                  slti         a0, s6, 1142
                  xori         t1, t3, 159
                  c.or         a4, a1
                  nop
                  ori          t4, a5, 12
                  mulh         t6, s0, s11
                  csrrci       s3, 0x340, 0
                  sltiu        s3, s2, -1370
                  srli         s11, a0, 11
                  csrrsi       a1, 0x340, 0
                  sra          s10, s7, s3
                  csrrc        t4, 0x340, zero
                  slti         a1, s0, -1990
                  div          a4, t5, s10
                  c.andi       a4, 20
                  sll          t6, t0, s8
                  c.xor        s0, s1
                  csrrwi       s0, 0x340, 9
                  xor          t4, t2, s7
                  c.and        a2, s0
                  rem          t0, a7, gp
                  c.sub        a0, a3
                  div          a4, a0, s1
                  slt          a2, t5, s6
                  divu         a3, t3, t3
                  andi         t1, t3, 461
                  c.mv         t5, a0
                  mulhsu       s1, s8, s10
                  mul          gp, s4, t6
                  and          a7, s8, s3
                  nop
                  remu         t6, a7, t4
                  rem          s11, s6, tp
                  mulh         t3, ra, s8
                  c.srai       a1, 25
                  srl          a5, s3, s11
                  c.srai       a3, 24
                  c.nop
                  srli         s5, t0, 12
                  c.add        s10, a3
                  c.lui        s10, 26
                  ori          ra, s7, 1582
                  lui          t3, 545598
                  xori         s5, a1, -1333
                  or           tp, t3, s5
                  mulhsu       s5, t5, t1
                  csrrs        s8, 0x340, zero
                  csrrwi       s8, 0x340, 9
                  c.lui        s9, 9
                  mulhu        s10, s11, t3
                  xori         s10, s8, -253
                  and          ra, a1, s10
                  nop
                  c.nop
                  and          t0, s9, t6
                  csrrs        s1, 0x340, s1
                  csrrwi       tp, 0x340, 18
                  andi         s3, a4, 453
                  csrrsi       a1, 0x340, 0
                  sltu         a1, s2, s6
                  c.srli       a4, 3
                  remu         gp, s11, a5
                  c.slli       a1, 20
                  divu         s3, a6, s5
                  csrrs        a2, 0x340, a0
                  xor          s6, s3, zero
                  c.srai       a5, 30
                  and          tp, s8, s10
                  auipc        s7, 583178
                  c.xor        a2, a2
                  mulhsu       t5, s2, t5
                  c.mv         s3, s5
                  sub          a3, t5, s11
                  csrrwi       ra, 0x340, 24
                  c.srai       a5, 8
                  csrrci       t3, 0x340, 4
                  csrrwi       ra, 0x340, 14
                  addi         s4, s4, -241
                  mul          a3, t3, s3
                  divu         zero, a3, ra
                  csrrs        t0, 0x340, zero
                  sub          s6, t3, t6
                  srl          s3, t2, s4
                  c.addi       s4, 10
                  c.sub        s0, s1
                  mulhu        s3, a2, tp
                  mulhsu       a0, s6, a6
                  slt          tp, s11, tp
                  slli         gp, a1, 13
                  divu         a7, s9, s4
                  csrrci       s4, 0x340, 1
                  andi         a7, a7, 1177
                  c.andi       s1, 25
                  c.srai       a4, 16
                  mulhu        tp, gp, tp
                  c.lui        a0, 14
                  sltiu        a1, s2, 946
                  srl          s8, t1, s11
                  c.addi       s0, 7
                  mulhsu       a2, a4, t6
                  xor          zero, s5, tp
                  sub          zero, a4, a4
                  and          t3, a7, sp
                  c.addi       a3, 13
                  sltiu        t5, s0, 1419
                  or           s9, t5, s10
                  srl          a7, sp, s7
                  and          s6, s10, a2
                  csrrs        s8, 0x340, zero
                  sll          s10, s10, zero
                  c.srli       a0, 18
                  remu         s0, s1, s4
                  lui          a7, 603523
                  div          a7, a5, s10
                  sltiu        t5, a0, -839
                  ori          s2, s9, -405
                  sra          s8, t3, t2
                  sltu         ra, s2, t1
                  lui          s7, 699236
                  c.addi       a3, -1
                  c.slli       s5, 4
                  c.mv         ra, gp
                  csrrw        s5, 0x340, s6
                  ori          ra, a3, -1165
                  rem          a5, tp, zero
                  srli         t1, s5, 24
                  c.lui        a5, 28
                  lui          a4, 334679
                  slli         a7, gp, 0
                  c.andi       s1, -1
                  c.slli       a1, 18
                  c.mv         t3, s9
                  csrrs        s6, 0x340, s8
                  and          a3, s8, t4
                  rem          s2, s2, t2
                  sltiu        zero, zero, 135
                  ori          s7, t2, 998
                  c.lui        s8, 9
                  csrrwi       t0, 0x340, 7
                  xor          a0, s11, a5
                  add          s7, a7, t4
                  c.add        tp, s6
                  c.xor        a0, a0
                  sra          t1, s7, s4
                  mulhu        t5, s2, s3
                  csrrci       s2, 0x340, 29
                  c.slli       t4, 25
                  csrrsi       a4, 0x340, 0
                  csrrci       s0, 0x340, 5
                  c.mv         a1, s5
                  c.addi       s7, -1
                  nop
                  add          s0, s9, a1
                  remu         a5, s8, t2
                  c.addi       s3, 24
                  sub          t0, t1, s6
                  sra          t4, a1, s8
                  mulhsu       s7, s11, s1
                  xori         t0, s9, -934
                  xori         s8, a0, 567
                  slti         s6, s10, 84
                  andi         s7, s11, 1251
                  srl          t4, t5, a5
                  andi         s2, t1, 551
                  nop
                  sltiu        t6, sp, -170
                  ori          t4, s1, -600
                  csrrwi       s4, 0x340, 0
                  sra          ra, a2, a4
                  mulhu        s0, s4, a4
                  and          s1, t0, t3
                  addi         a4, gp, 1133
                  srli         a4, sp, 28
                  csrrc        s2, 0x340, s8
                  c.mv         t0, t1
                  srli         s4, s6, 21
                  addi         s4, a1, -429
                  csrrsi       a5, 0x340, 0
                  andi         zero, s0, 642
                  csrrci       t3, 0x340, 0
                  c.nop
                  sra          a1, a0, s1
                  srli         tp, a2, 30
                  slt          t1, s8, ra
                  div          a5, s7, sp
                  csrrsi       zero, 0x340, 4
                  c.sub        s1, a1
                  csrrwi       zero, 0x340, 14
                  sub          s8, s9, a1
                  c.xor        s1, a2
                  c.xor        a5, a4
                  mulhu        s3, s1, s11
                  c.xor        a0, a3
                  csrrc        s9, 0x340, s11
                  sltu         a0, t1, s8
                  c.li         s8, -1
                  srai         a5, ra, 26
                  csrrsi       s7, 0x340, 0
                  auipc        s5, 24101
                  csrrci       s1, 0x340, 30
                  c.slli       t1, 12
                  c.xor        s1, s0
                  c.lui        a2, 22
                  sra          a5, a5, s8
                  csrrsi       s8, 0x340, 19
                  csrrc        tp, 0x340, zero
                  nop
                  ori          a0, s1, 114
                  slti         s1, t5, -652
                  xori         s5, a0, -1900
                  c.lui        a1, 24
                  csrrs        a5, 0x340, zero
                  divu         s1, a5, ra
                  mul          s11, tp, s4
                  c.mv         s4, gp
                  sll          a4, a4, t0
                  c.xor        a2, a1
                  addi         s10, t0, 1647
                  slli         gp, s10, 23
                  c.and        a4, a3
                  csrrs        a5, 0x340, t5
                  mulhsu       a3, gp, a0
                  andi         s6, a2, -1202
                  lui          a5, 618655
                  mulhsu       zero, ra, s8
                  csrrc        s4, 0x340, zero
                  slti         s11, zero, -153
                  add          t4, a7, s5
                  slt          t6, s10, sp
                  csrrs        a1, 0x340, zero
                  or           s7, t3, t2
                  csrrs        a3, 0x340, zero
                  nop
                  addi         gp, s5, -410
                  sltu         s1, t3, s3
                  c.sub        s0, a0
                  xor          gp, t5, t6
                  csrrc        ra, 0x340, zero
                  sll          s6, s3, t2
                  add          s9, s6, t6
                  andi         s1, a5, -1987
                  c.mv         s7, a5
                  c.li         a1, -1
                  auipc        a3, 363768
                  slli         ra, t4, 31
                  sub          t6, t0, t1
                  c.and        a0, a4
                  or           zero, a6, a1
                  c.and        s0, a3
                  c.xor        s0, a0
                  c.andi       a3, -1
                  slli         zero, s1, 19
                  c.and        s0, a2
                  c.add        s4, ra
                  c.sub        a4, a4
                  c.srai       a3, 8
                  csrrw        s6, 0x340, t3
                  mul          s5, s5, sp
                  sll          t3, gp, sp
                  csrrc        tp, 0x340, zero
                  csrrc        tp, 0x340, zero
                  csrrc        a1, 0x340, zero
                  srl          a4, s2, s6
                  auipc        s4, 446572
                  csrrc        gp, 0x340, s6
                  mulhsu       a7, ra, t5
                  sltu         s3, a5, s0
                  slli         s10, t3, 9
                  sltiu        t5, a2, -508
                  sll          s4, a7, t6
                  mul          s2, s2, a6
                  csrrw        a5, 0x340, zero
                  slti         t4, s1, -1788
                  sub          t3, tp, s9
                  sra          a4, s0, a7
                  c.nop
                  c.lui        s1, 6
                  c.addi       a0, 10
                  addi         s2, s11, 1281
                  div          s1, t4, t5
                  c.lui        a1, 1
                  mulhsu       s6, a2, s7
                  slli         s10, s8, 23
                  c.sub        a1, a2
                  c.sub        a5, a1
                  slt          a2, ra, s8
                  c.li         t1, 25
                  csrrs        s8, 0x340, s11
                  nop
                  ori          a2, tp, 246
                  c.mv         t3, s0
                  c.or         s1, s1
                  c.or         a2, a1
                  andi         s10, t3, 109
                  c.li         t4, -1
                  c.nop
                  andi         s1, a7, 1990
                  remu         s1, t4, s2
                  c.lui        ra, 30
                  c.slli       t1, 7
                  add          s2, t6, t1
                  addi         t6, t6, -598
                  addi         t5, sp, -127
                  c.andi       s1, -1
                  c.sub        a2, s0
                  srai         a5, zero, 1
                  c.srai       a0, 19
                  c.srai       a1, 15
                  and          s0, s10, s3
                  remu         s0, s7, sp
                  c.slli       t4, 12
                  c.mv         a4, s5
                  csrrw        s2, 0x340, a2
                  csrrs        s0, 0x340, s9
                  c.xor        a3, a4
                  or           tp, t3, t4
                  csrrsi       a3, 0x340, 25
                  remu         s1, a0, zero
                  remu         s7, s10, a6
                  sll          a3, t3, a6
                  remu         a7, zero, s6
                  csrrc        s2, 0x340, zero
                  c.srli       s0, 24
                  c.srli       a4, 21
                  slti         zero, s9, 157
                  add          s2, s8, s3
                  and          s9, sp, a5
                  c.andi       s1, -1
                  or           a1, a2, s0
                  c.slli       gp, 31
                  nop
                  csrrci       a4, 0x340, 5
                  srai         s5, t3, 16
                  mulhsu       s5, t4, s8
                  csrrc        s4, 0x340, a6
                  addi         s2, t2, 1808
                  mulhsu       tp, s3, gp
                  c.mv         t0, t1
                  c.or         a1, a1
                  c.srli       a3, 30
                  slli         t1, a2, 21
                  srli         s10, sp, 8
                  c.add        s9, t2
                  xor          a7, s1, tp
                  c.sub        a4, a2
                  sra          s3, gp, t0
                  c.addi       a2, -1
                  slti         t1, s3, 441
                  c.mv         s0, a7
                  slti         s1, s2, -1093
                  mulhu        a7, s8, s9
                  srli         s2, s3, 1
                  c.srai       s1, 22
                  xor          a3, s5, sp
                  ori          t5, s11, 1230
                  c.andi       a0, 22
                  add          s0, t2, s11
                  sra          t5, s11, a3
                  addi         a2, a4, -671
                  c.srai       a2, 20
                  csrrw        t1, 0x340, a0
                  div          gp, s3, zero
                  csrrsi       t0, 0x340, 13
                  slt          t4, s2, t5
                  srl          s9, a4, tp
                  divu         a2, s8, t4
                  or           a7, ra, s1
                  remu         s11, s3, s0
                  add          s10, t3, s6
                  c.slli       s1, 6
                  andi         a5, a6, 843
                  c.or         a3, a4
                  add          t1, s8, tp
                  nop
                  srai         t5, s9, 7
                  sltu         s5, s8, a4
                  mul          s6, gp, s4
                  csrrc        s4, 0x340, zero
                  nop
                  c.andi       s1, -1
                  c.srli       a2, 11
                  c.andi       a1, -1
                  mulhsu       t6, s4, s1
                  sll          s10, t3, a4
                  c.addi       a5, 28
                  c.mv         a2, s9
                  mulh         a4, s3, t0
                  c.nop
                  srai         s9, s6, 5
                  or           s0, s8, t0
                  andi         t5, s10, 2025
                  c.slli       s11, 6
                  sltu         a0, gp, s2
                  csrrci       a2, 0x340, 0
                  and          t6, tp, a0
                  srli         s1, a0, 13
                  c.or         a0, a5
                  add          s9, zero, a3
                  c.xor        s1, a1
                  srai         s4, a3, 29
                  csrrw        t4, 0x340, a6
                  c.slli       s9, 23
                  csrrc        s7, 0x340, zero
                  c.add        t5, t1
                  ori          s8, s0, 1991
                  srli         a5, a5, 21
                  c.slli       s4, 13
                  csrrci       a0, 0x340, 25
                  c.nop
                  sltiu        t0, s11, -1110
                  mul          a7, t1, a7
                  mul          s11, s1, sp
                  sltu         gp, a3, s8
                  ori          a7, a4, 495
                  auipc        s8, 694558
                  csrrc        t5, 0x340, zero
                  csrrs        s0, 0x340, zero
                  c.andi       a4, 22
                  csrrsi       a7, 0x340, 21
                  auipc        s3, 250929
                  div          zero, s3, a5
                  mulh         t0, a6, a1
                  c.addi       s3, -1
                  or           a1, s9, a6
                  lui          gp, 813507
                  c.nop
                  c.andi       a3, -1
                  srai         s4, a4, 28
                  sltu         ra, t0, a1
                  mul          s2, a6, s1
                  lui          t4, 281673
                  c.xor        s1, a3
                  c.li         s6, -1
                  slli         t0, a4, 18
                  auipc        a3, 399214
                  sub          s7, a3, gp
                  srli         s8, a5, 24
                  c.addi       a7, 22
                  addi         s1, s2, 1953
                  add          a7, a6, tp
                  c.and        a3, a1
                  csrrc        t6, 0x340, t6
                  csrrci       s9, 0x340, 28
                  slli         s11, a6, 20
                  c.slli       s5, 28
                  add          s1, s6, s7
                  rem          t4, t4, s2
                  c.sub        s1, a3
                  auipc        s3, 823017
                  remu         gp, tp, t1
                  c.slli       s10, 2
                  csrrc        t4, 0x340, a1
                  c.or         a3, a5
                  slli         a0, gp, 0
                  csrrs        a4, 0x340, zero
                  slt          s11, t6, gp
                  c.srai       s1, 11
                  divu         s0, s6, t3
                  mulhu        tp, s6, a0
                  or           s9, s11, ra
                  c.sub        a2, a0
                  and          s7, a2, s11
                  csrrwi       s2, 0x340, 13
                  c.slli       s0, 2
                  c.sub        a5, a5
                  slli         s11, a4, 23
                  divu         s9, a7, ra
                  c.lui        t3, 9
                  mulhu        s9, a0, s8
                  c.lui        gp, 4
                  divu         a5, ra, zero
                  addi         s4, t1, 1426
                  lui          s7, 454927
                  or           gp, a6, s9
                  c.nop
                  srai         s2, s11, 28
                  sltiu        tp, a6, -1315
                  c.sub        a5, a2
                  c.lui        s5, 7
                  slti         s8, s1, 669
                  divu         t0, a1, a7
                  xor          s1, t0, s5
                  csrrsi       s5, 0x340, 0
                  mul          s7, s4, t0
                  xor          s9, tp, a3
                  srli         a2, s9, 24
                  divu         s10, a1, s8
                  c.andi       a1, -1
                  ori          a1, s11, 295
                  c.mv         s5, t4
                  and          s0, gp, s9
                  rem          t4, s5, a7
                  mulhu        s2, s11, s8
                  c.srli       a0, 31
                  srli         a5, s10, 5
                  c.sub        a3, s0
                  c.srli       a2, 3
                  c.add        t5, a4
                  csrrc        s4, 0x340, zero
                  andi         a2, a5, 1543
                  c.xor        s1, a2
                  sltu         s8, a5, s8
                  csrrs        s7, 0x340, s1
                  auipc        s1, 952110
                  sltiu        t6, a6, 358
                  sll          t3, s7, a2
                  mulh         a2, a2, t1
                  mulh         s4, s9, a4
                  srl          s10, s5, zero
                  srli         a7, t5, 16
                  addi         s4, t1, -219
                  remu         a3, a5, t1
                  c.or         s0, a1
                  remu         s3, s9, t3
                  mul          s3, s0, s10
                  csrrci       a3, 0x340, 21
                  c.xor        a1, a5
                  csrrsi       t0, 0x340, 21
                  addi         a0, t2, -335
                  srai         s8, s5, 7
                  mul          t5, a2, s8
                  c.addi       t0, -1
                  sub          s8, s10, s2
                  sltiu        t1, a1, -1276
                  sltiu        s5, t0, -1469
                  rem          a2, a5, zero
                  xor          a1, tp, t0
                  c.slli       t3, 26
                  csrrsi       a2, 0x340, 0
                  sra          ra, a1, t6
                  c.lui        t6, 5
                  c.add        a7, ra
                  nop
                  mulhsu       t6, t6, t4
                  c.addi       t4, -1
                  ori          s1, t1, -1483
                  c.xor        a3, s0
                  c.xor        a0, s0
                  divu         a4, a4, s9
                  csrrci       t4, 0x340, 17
                  nop
                  addi         s11, s9, 1105
                  csrrw        a7, 0x340, a7
                  srai         a1, zero, 17
                  slli         s0, s6, 31
                  nop
                  c.li         ra, -1
                  andi         t4, s4, -935
                  slli         t0, a4, 24
                  mulh         zero, t4, a1
                  csrrw        t6, 0x340, a7
                  add          a3, s0, a5
                  c.andi       a0, -1
                  lui          s7, 993085
                  csrrci       a4, 0x340, 0
                  csrrs        s9, 0x340, t2
                  sltiu        a1, s1, 1129
                  c.lui        t3, 19
                  c.slli       s4, 15
                  c.xor        s1, a0
                  sltiu        a2, a4, 451
                  sll          a2, s11, a5
                  add          tp, s2, ra
                  mulhu        s8, a4, s2
                  rem          zero, a6, t3
                  nop
                  andi         zero, s3, 1412
                  sra          a7, s3, t3
                  and          tp, s9, s8
                  c.and        s0, a2
                  sll          a1, a0, s5
                  csrrc        s1, 0x340, s0
                  xor          t3, s7, t3
                  remu         t5, t0, a7
                  csrrsi       t0, 0x340, 0
                  or           s5, a3, t0
                  slt          s4, t5, t1
                  mulhu        a2, a2, s6
                  c.lui        a1, 27
                  mulh         a5, s11, zero
                  xori         s7, t3, -747
                  andi         t1, a0, -213
                  srai         s9, s0, 27
                  remu         t3, tp, gp
                  c.or         a5, a4
                  slti         a0, a1, -737
                  auipc        a5, 543088
                  c.add        t0, s4
                  rem          s11, t5, s4
                  c.andi       a1, 9
                  remu         a4, t4, s0
                  srai         zero, a5, 8
                  c.lui        tp, 6
                  sra          s0, t4, a0
                  andi         gp, t6, -1992
                  nop
                  c.lui        t5, 20
                  srl          s1, a6, s7
                  addi         a3, tp, 856
                  c.li         t4, -1
                  csrrsi       s10, 0x340, 4
                  slti         s6, a5, -1998
                  c.and        s1, a0
                  lui          t5, 764398
                  addi         s2, zero, 1667
                  c.sub        a4, a4
                  mulhsu       s8, s10, gp
                  c.and        a2, a2
                  add          tp, s5, t3
                  sltu         s5, a7, s7
                  c.and        s1, a4
                  csrrc        t5, 0x340, sp
                  xori         a0, t5, -1864
                  csrrc        t6, 0x340, zero
                  c.add        gp, t5
                  csrrwi       s1, 0x340, 20
                  c.srli       a2, 26
                  c.and        s0, s0
                  srl          a1, a4, a0
                  c.srli       a4, 29
                  c.srai       s1, 19
                  mulhu        a4, s2, s8
                  c.mv         tp, a5
                  rem          s10, t0, a1
                  c.andi       a2, -1
                  csrrw        s10, 0x340, s5
                  csrrwi       s5, 0x340, 21
                  or           tp, t5, a4
                  rem          a1, s11, t5
                  c.nop
                  and          s11, s2, a7
                  nop
                  srli         s11, s8, 19
                  auipc        tp, 778258
                  sltu         a4, t4, sp
                  c.mv         t1, s8
                  c.xor        a5, a2
                  csrrwi       s0, 0x340, 20
                  csrrw        zero, 0x340, a2
                  c.andi       a5, -1
                  csrrsi       a0, 0x340, 6
                  c.lui        a0, 30
                  add          t3, a3, a7
                  c.lui        gp, 22
                  sra          a5, t0, t3
                  srl          a5, tp, s10
                  c.and        a3, a2
                  csrrs        a4, 0x340, zero
                  csrrwi       t0, 0x340, 0
                  csrrw        zero, 0x340, t2
                  or           s2, s3, t6
                  csrrwi       a5, 0x340, 31
                  sub          zero, t4, a6
                  csrrs        a1, 0x340, zero
                  sra          s9, a2, s8
                  addi         a4, s1, 33
                  slt          t5, t3, a6
                  auipc        s10, 676947
                  slti         s4, zero, 1288
                  csrrs        s4, 0x340, zero
                  and          a2, ra, s3
                  remu         s4, a2, s3
                  csrrwi       t3, 0x340, 30
                  divu         gp, t2, s7
                  csrrw        a4, 0x340, s4
                  c.lui        t6, 23
                  nop
                  c.li         t5, 20
                  add          s10, t2, a4
                  c.slli       s6, 5
                  c.addi       s7, 12
                  c.or         s1, a5
                  c.sub        a2, a3
                  c.li         ra, -1
                  auipc        s3, 338075
                  divu         zero, s7, s11
                  c.sub        a0, a2
                  c.add        s11, s3
                  addi         a1, s7, 970
                  mul          t3, s8, gp
                  auipc        a7, 858415
                  c.mv         a3, a2
                  remu         s10, s2, s7
                  or           a3, a1, zero
                  c.srai       a3, 16
                  div          t1, s0, ra
                  sub          s6, t1, t5
                  c.srai       a3, 26
                  and          a2, t2, s1
                  or           t4, t4, s8
                  sltiu        t1, s1, -1679
                  rem          s11, s8, zero
                  c.addi       s3, -1
                  sra          tp, s9, s10
                  c.nop
                  srli         s8, s10, 14
                  csrrsi       t5, 0x340, 0
                  c.nop
                  sub          a2, a6, s6
                  rem          s2, t0, t3
                  rem          s8, t1, zero
                  c.xor        a1, a2
                  srai         s0, t4, 16
                  xori         s10, a1, -676
                  sub          s3, tp, a2
                  srai         a0, t2, 13
                  sll          s0, t4, a0
                  add          t4, s2, t3
                  sltu         zero, s6, t0
                  ori          s4, s11, 157
                  c.and        a2, s0
                  c.srai       a5, 8
                  divu         s5, a0, a7
                  csrrw        gp, 0x340, ra
                  lui          ra, 65849
                  or           t1, t6, a3
                  addi         t4, s8, 1613
                  xor          s8, a1, s7
                  mulh         s6, a0, t1
                  csrrw        s3, 0x340, a7
                  srl          s5, s5, s10
                  sub          a0, s9, ra
                  mul          s4, t1, s9
                  c.sub        a2, a0
                  mulhsu       s1, gp, s9
                  c.add        s7, t0
                  or           s4, s5, s1
                  mulh         s1, t1, a4
                  nop
                  c.addi       gp, -1
                  csrrsi       gp, 0x340, 12
                  c.lui        s11, 4
                  c.add        gp, s0
                  slt          a1, s0, t2
                  ori          s11, zero, 1756
                  andi         a3, s6, -1411
                  c.li         t5, -1
                  csrrs        a5, 0x340, tp
                  c.nop
                  div          s10, s10, s8
                  c.sub        s0, a0
                  remu         s2, ra, s2
                  c.mv         s5, t5
                  csrrsi       zero, 0x340, 17
                  addi         t6, s8, -1673
                  mul          a4, zero, a4
                  csrrwi       s1, 0x340, 8
                  csrrci       tp, 0x340, 0
                  sltiu        a7, a7, 165
                  c.srli       a2, 14
                  xori         t3, s4, -1535
                  srai         a3, s5, 15
                  ori          s9, s1, -1093
                  c.xor        a4, a0
                  add          a2, a5, s2
                  slt          a7, sp, a4
                  c.sub        a4, a5
                  srl          a7, a6, s1
                  auipc        s9, 719860
                  c.slli       ra, 28
                  slli         t1, s10, 22
                  sub          s7, a0, a7
                  sltiu        s5, s8, 1063
                  c.nop
                  srl          a2, tp, s8
                  csrrwi       t1, 0x340, 9
                  csrrsi       a4, 0x340, 0
                  mulhu        a4, s10, t2
                  lui          a1, 340118
                  srai         a1, tp, 23
                  c.xor        a4, a2
                  csrrci       tp, 0x340, 0
                  andi         t6, s8, 1870
                  c.xor        a1, a4
                  slli         a1, a7, 31
                  and          s1, zero, s3
                  xori         s6, a2, -355
                  srli         a5, s5, 5
                  srli         t4, s1, 17
                  c.sub        s1, a5
                  sltiu        a1, a1, -930
                  c.li         s11, 28
                  sltiu        a5, s7, 906
                  xori         a4, s4, 1451
                  c.nop
                  remu         a1, s4, t4
                  srl          a4, t6, gp
                  c.slli       tp, 6
                  slti         s3, s4, 449
                  csrrc        a1, 0x340, zero
                  ori          a4, a6, 1921
                  c.xor        a4, a1
                  c.nop
                  sltu         a3, t1, a5
                  sub          tp, s2, s7
                  sltiu        tp, s7, 1232
                  c.nop
                  srai         t3, a6, 7
                  sltiu        s3, s0, 761
                  mul          ra, s1, gp
                  c.srli       s1, 27
                  c.addi       s10, 27
                  c.andi       a2, -1
                  divu         s11, s4, t0
                  andi         t5, gp, 1575
                  csrrw        a3, 0x340, tp
                  mulh         s6, s11, t4
                  ori          t4, s2, -465
                  srai         a1, s6, 18
                  mulh         s7, sp, s10
                  xor          a3, sp, t3
                  add          s10, t4, s0
                  c.and        a0, a5
                  srai         s7, s8, 27
                  csrrsi       t4, 0x340, 0
                  slli         gp, t2, 25
                  and          s8, s8, s5
                  div          s11, t3, a5
                  c.slli       s3, 27
                  csrrw        s0, 0x340, s1
                  slli         s5, t5, 9
                  andi         a3, s11, 813
                  divu         t1, a0, t6
                  c.add        t5, gp
                  srl          t3, s9, s5
                  c.lui        s2, 10
                  sub          s7, s11, s8
                  mulh         gp, a0, t2
                  c.addi       t5, 25
                  remu         zero, a1, s4
                  ori          a4, t1, -1288
                  c.addi       s11, 20
                  add          s10, gp, a6
                  c.lui        t5, 15
                  c.li         s3, 6
                  sub          gp, a4, a0
                  slli         s4, t2, 1
                  nop
                  lui          zero, 918451
                  mul          gp, s8, a2
                  ori          s5, gp, -877
                  csrrc        t1, 0x340, t5
                  c.slli       tp, 30
                  mul          s5, zero, a7
                  c.sub        a1, a5
                  csrrw        s11, 0x340, t1
                  andi         s8, a2, 1011
                  srl          s7, s2, s1
                  c.and        a2, a2
                  or           ra, s11, sp
                  divu         t5, sp, t3
                  sltiu        s0, gp, -76
                  xori         tp, gp, -1294
                  mulh         s1, a2, t2
                  and          s7, a5, t1
                  sltiu        a3, t3, -286
                  c.srai       a1, 3
                  add          zero, t6, a3
                  add          s0, t5, zero
                  or           tp, a4, s0
                  slt          s4, a1, a4
                  rem          s7, a3, s1
                  mulhsu       s2, a1, gp
                  srl          gp, t4, t5
                  c.slli       t4, 7
                  la x2, test_done
                  jalr x0, x2, 0
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
                  li x11, 0xd
                  slli x11, x11, 8
                  addi x11, x11, 0x0
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x342
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x342
                  sw x11, 0(x27)
                  csrr  x11, 0x341
                  addi  x11, x11, 4
                  csrw  0x341, x11
                  add x16, x7, zero
                  lw  x1, 4(x16)
                  lw  x2, 8(x16)
                  lw  x3, 12(x16)
                  lw  x4, 16(x16)
                  lw  x5, 20(x16)
                  lw  x6, 24(x16)
                  lw  x7, 28(x16)
                  lw  x8, 32(x16)
                  lw  x9, 36(x16)
                  lw  x10, 40(x16)
                  lw  x11, 44(x16)
                  lw  x12, 48(x16)
                  lw  x13, 52(x16)
                  lw  x14, 56(x16)
                  lw  x15, 60(x16)
                  lw  x16, 64(x16)
                  lw  x17, 68(x16)
                  lw  x18, 72(x16)
                  lw  x19, 76(x16)
                  lw  x20, 80(x16)
                  lw  x21, 84(x16)
                  lw  x22, 88(x16)
                  lw  x23, 92(x16)
                  lw  x24, 96(x16)
                  lw  x25, 100(x16)
                  lw  x26, 104(x16)
                  lw  x27, 108(x16)
                  lw  x28, 112(x16)
                  lw  x29, 116(x16)
                  lw  x30, 120(x16)
                  lw  x31, 124(x16)
                  addi x16, x16, 128
                  add x7, x16, zero
                  lw  x16, (x7)
                  addi x7, x7, 4
                  mret

illegal_instr_handler:
                  li x27, 0x8ffffffc
                  li x11, 0xa
                  slli x11, x11, 8
                  addi x11, x11, 0x0
                  sw x11, 0(x27)
                  li x27, 0x8ffffffc
                  li x11, 0x342
                  slli x11, x11, 8
                  addi x11, x11, 0x3
                  sw x11, 0(x27)
                  csrr x11, 0x342
                  sw x11, 0(x27)
                  csrr  x11, 0x341
                  addi  x11, x11, 4
                  csrw  0x341, x11
                  add x16, x7, zero
                  lw  x1, 4(x16)
                  lw  x2, 8(x16)
                  lw  x3, 12(x16)
                  lw  x4, 16(x16)
                  lw  x5, 20(x16)
                  lw  x6, 24(x16)
                  lw  x7, 28(x16)
                  lw  x8, 32(x16)
                  lw  x9, 36(x16)
                  lw  x10, 40(x16)
                  lw  x11, 44(x16)
                  lw  x12, 48(x16)
                  lw  x13, 52(x16)
                  lw  x14, 56(x16)
                  lw  x15, 60(x16)
                  lw  x16, 64(x16)
                  lw  x17, 68(x16)
                  lw  x18, 72(x16)
                  lw  x19, 76(x16)
                  lw  x20, 80(x16)
                  lw  x21, 84(x16)
                  lw  x22, 88(x16)
                  lw  x23, 92(x16)
                  lw  x24, 96(x16)
                  lw  x25, 100(x16)
                  lw  x26, 104(x16)
                  lw  x27, 108(x16)
                  lw  x28, 112(x16)
                  lw  x29, 116(x16)
                  lw  x30, 120(x16)
                  lw  x31, 124(x16)
                  addi x16, x16, 128
                  add x7, x16, zero
                  lw  x16, (x7)
                  addi x7, x7, 4
                  mret

pt_fault_handler: 
                  li x27, 0x8ffffffc
                  li x11, 0x8
                  slli x11, x11, 8
                  addi x11, x11, 0x0
                  sw x11, 0(x27)
                  nop

.align 2
mmode_intr_handler:
                  csrr  x11, 0x300 # MSTATUS;
                  csrr  x11, 0x304 # MIE;
                  csrr  x11, 0x344 # MIP;
                  csrrc x11, 0x344, x11 # MIP;
                  li x27, 0x8ffffffc
                  li x11, 0x7
                  slli x11, x11, 8
                  addi x11, x11, 0x0
                  sw x11, 0(x27)
                  add x16, x7, zero
                  lw  x1, 4(x16)
                  lw  x2, 8(x16)
                  lw  x3, 12(x16)
                  lw  x4, 16(x16)
                  lw  x5, 20(x16)
                  lw  x6, 24(x16)
                  lw  x7, 28(x16)
                  lw  x8, 32(x16)
                  lw  x9, 36(x16)
                  lw  x10, 40(x16)
                  lw  x11, 44(x16)
                  lw  x12, 48(x16)
                  lw  x13, 52(x16)
                  lw  x14, 56(x16)
                  lw  x15, 60(x16)
                  lw  x16, 64(x16)
                  lw  x17, 68(x16)
                  lw  x18, 72(x16)
                  lw  x19, 76(x16)
                  lw  x20, 80(x16)
                  lw  x21, 84(x16)
                  lw  x22, 88(x16)
                  lw  x23, 92(x16)
                  lw  x24, 96(x16)
                  lw  x25, 100(x16)
                  lw  x26, 104(x16)
                  lw  x27, 108(x16)
                  lw  x28, 112(x16)
                  lw  x29, 116(x16)
                  lw  x30, 120(x16)
                  lw  x31, 124(x16)
                  addi x16, x16, 128
                  add x7, x16, zero
                  lw  x16, (x7)
                  addi x7, x7, 4
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
