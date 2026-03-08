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
                  li x12, 0x40001106
                  csrw 0x301, x12
kernel_sp:        
                  la x26, kernel_stack_end

trap_vec_init:    
                  la x12, mtvec_handler
                  ori x12, x12, 1
                  csrw 0x305, x12 # MTVEC

pmp_setup:        
                  csrwi 0x747, 4
                  la x7, main
                  li x12, 0x0
                  add x7, x7, x12
                  srli x7, x7, 2
                  csrw 0x3b0, x7
                  la x7, main
                  li x12, 0x11111111
                  add x7, x7, x12
                  srli x7, x7, 2
                  csrw 0x3b1, x7
                  la x7, main
                  li x12, 0x22222222
                  add x7, x7, x12
                  srli x7, x7, 2
                  csrw 0x3b2, x7
                  la x7, main
                  li x12, 0x33333333
                  add x7, x7, x12
                  srli x7, x7, 2
                  csrw 0x3b3, x7
                  li x7, 0xf0f0f0f
                  csrw 0x3a0, x7
                  la x7, main
                  li x12, 0x44444444
                  add x7, x7, x12
                  srli x7, x7, 2
                  csrw 0x3b4, x7
                  la x7, main
                  li x12, 0x55555555
                  add x7, x7, x12
                  srli x7, x7, 2
                  csrw 0x3b5, x7
                  la x7, main
                  li x12, 0x66666666
                  add x7, x7, x12
                  srli x7, x7, 2
                  csrw 0x3b6, x7
                  la x7, main
                  li x12, 0x77777777
                  add x7, x7, x12
                  srli x7, x7, 2
                  csrw 0x3b7, x7
                  li x7, 0xf0f0f0f
                  csrw 0x3a1, x7
                  la x7, main
                  li x12, 0x88888888
                  add x7, x7, x12
                  srli x7, x7, 2
                  csrw 0x3b8, x7
                  la x7, main
                  li x12, 0x99999999
                  add x7, x7, x12
                  srli x7, x7, 2
                  csrw 0x3b9, x7
                  la x7, main
                  li x12, 0xaaaaaaaa
                  add x7, x7, x12
                  srli x7, x7, 2
                  csrw 0x3ba, x7
                  la x7, main
                  li x12, 0xbbbbbbbb
                  add x7, x7, x12
                  srli x7, x7, 2
                  csrw 0x3bb, x7
                  li x7, 0xf0f0f0f
                  csrw 0x3a2, x7
                  la x7, main
                  li x12, 0xcccccccc
                  add x7, x7, x12
                  srli x7, x7, 2
                  csrw 0x3bc, x7
                  la x7, main
                  li x12, 0xdddddddd
                  add x7, x7, x12
                  srli x7, x7, 2
                  csrw 0x3bd, x7
                  la x7, main
                  li x12, 0xeeeeeeee
                  add x7, x7, x12
                  srli x7, x7, 2
                  csrw 0x3be, x7
                  la x7, main
                  li x12, 0xffffffff
                  add x7, x7, x12
                  srli x7, x7, 2
                  csrw 0x3bf, x7
                  li x7, 0xf0f0f0f
                  csrw 0x3a3, x7

mepc_setup:       
                  la x12, init
                  csrw 0x341, x12

custom_csr_setup: 
                  csrwi 0x7c0, 1

init_machine_mode:
                  li x12, 0x1800
                  csrw 0x300, x12 # MSTATUS
                  li x12, 0x0
                  csrw 0x304, x12 # MIE
                  li x22, 0x8ffffffc
                  li x12, 0x300
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x300
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x304
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x304
                  sw x12, 0(x22)
                  mret
init:             
                  li x0, 0xcdc09ec9
                  li x1, 0x80000000
                  li x2, 0x80000000
                  li x3, 0xfff6ebeb
                  li x4, 0x3
                  li x5, 0x0
                  li x6, 0x80000000
                  li x7, 0xfaeb9c09
                  li x8, 0x4
                  li x9, 0x6
                  li x10, 0xff3c409b
                  li x11, 0xf8f2625c
                  li x12, 0x80000000
                  li x13, 0xb
                  li x14, 0x7f8da334
                  li x15, 0xfd21787b
                  li x16, 0x0
                  li x17, 0x7
                  li x18, 0x4
                  li x20, 0xf15b5b64
                  li x21, 0xf2d69361
                  li x22, 0x0
                  li x23, 0x8fde8a6f
                  li x24, 0x2
                  li x25, 0x7576ad53
                  li x27, 0x80000000
                  li x28, 0x0
                  li x29, 0xd947e9b5
                  li x30, 0xb
                  li x31, 0x3
                  la x19, user_stack_end
                  li x22, 0x8ffffffc
                  li x12, 0x0
                  slli x12, x12, 8
                  addi x12, x12, 0x0
                  sw x12, 0(x22)
                  j main
test_done:        
                  li x22, 0x8ffffff8
                  li x12, 0x0
                  slli x12, x12, 8
                  addi x12, x12, 0x1
                  sw x12, 0(x22)
                  ecall

test_fail:        
                  li x22, 0x8ffffff8
                  li x12, 0x1
                  slli x12, x12, 8
                  addi x12, x12, 0x1
                  sw x12, 0(x22)
                  ecall

mmode_intr_vector_1:
                  addi x26, x26, -4
                  sw  x19, (x26)
                  add x19, x26, zero
                  addi x19, x19, -128
                  sw  x1, 4(x19)
                  sw  x2, 8(x19)
                  sw  x3, 12(x19)
                  sw  x4, 16(x19)
                  sw  x5, 20(x19)
                  sw  x6, 24(x19)
                  sw  x7, 28(x19)
                  sw  x8, 32(x19)
                  sw  x9, 36(x19)
                  sw  x10, 40(x19)
                  sw  x11, 44(x19)
                  sw  x12, 48(x19)
                  sw  x13, 52(x19)
                  sw  x14, 56(x19)
                  sw  x15, 60(x19)
                  sw  x16, 64(x19)
                  sw  x17, 68(x19)
                  sw  x18, 72(x19)
                  sw  x19, 76(x19)
                  sw  x20, 80(x19)
                  sw  x21, 84(x19)
                  sw  x22, 88(x19)
                  sw  x23, 92(x19)
                  sw  x24, 96(x19)
                  sw  x25, 100(x19)
                  sw  x26, 104(x19)
                  sw  x27, 108(x19)
                  sw  x28, 112(x19)
                  sw  x29, 116(x19)
                  sw  x30, 120(x19)
                  sw  x31, 124(x19)
                  add x26, x19, zero
                  li x22, 0x8ffffffc
                  li x12, 0x6
                  slli x12, x12, 8
                  addi x12, x12, 0x0
                  sw x12, 0(x22)
                  csrr x12, 0x342 # MCAUSE
                  srli x12, x12, 0x1f
                  beqz x12, 1f
                  li x22, 0x8ffffffc
                  li x12, 0x300
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x300
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x342
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x342
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x304
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x304
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x344
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x344
                  sw x12, 0(x22)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_2:
                  addi x26, x26, -4
                  sw  x19, (x26)
                  add x19, x26, zero
                  addi x19, x19, -128
                  sw  x1, 4(x19)
                  sw  x2, 8(x19)
                  sw  x3, 12(x19)
                  sw  x4, 16(x19)
                  sw  x5, 20(x19)
                  sw  x6, 24(x19)
                  sw  x7, 28(x19)
                  sw  x8, 32(x19)
                  sw  x9, 36(x19)
                  sw  x10, 40(x19)
                  sw  x11, 44(x19)
                  sw  x12, 48(x19)
                  sw  x13, 52(x19)
                  sw  x14, 56(x19)
                  sw  x15, 60(x19)
                  sw  x16, 64(x19)
                  sw  x17, 68(x19)
                  sw  x18, 72(x19)
                  sw  x19, 76(x19)
                  sw  x20, 80(x19)
                  sw  x21, 84(x19)
                  sw  x22, 88(x19)
                  sw  x23, 92(x19)
                  sw  x24, 96(x19)
                  sw  x25, 100(x19)
                  sw  x26, 104(x19)
                  sw  x27, 108(x19)
                  sw  x28, 112(x19)
                  sw  x29, 116(x19)
                  sw  x30, 120(x19)
                  sw  x31, 124(x19)
                  add x26, x19, zero
                  li x22, 0x8ffffffc
                  li x12, 0x6
                  slli x12, x12, 8
                  addi x12, x12, 0x0
                  sw x12, 0(x22)
                  csrr x12, 0x342 # MCAUSE
                  srli x12, x12, 0x1f
                  beqz x12, 1f
                  li x22, 0x8ffffffc
                  li x12, 0x300
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x300
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x342
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x342
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x304
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x304
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x344
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x344
                  sw x12, 0(x22)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_3:
                  addi x26, x26, -4
                  sw  x19, (x26)
                  add x19, x26, zero
                  addi x19, x19, -128
                  sw  x1, 4(x19)
                  sw  x2, 8(x19)
                  sw  x3, 12(x19)
                  sw  x4, 16(x19)
                  sw  x5, 20(x19)
                  sw  x6, 24(x19)
                  sw  x7, 28(x19)
                  sw  x8, 32(x19)
                  sw  x9, 36(x19)
                  sw  x10, 40(x19)
                  sw  x11, 44(x19)
                  sw  x12, 48(x19)
                  sw  x13, 52(x19)
                  sw  x14, 56(x19)
                  sw  x15, 60(x19)
                  sw  x16, 64(x19)
                  sw  x17, 68(x19)
                  sw  x18, 72(x19)
                  sw  x19, 76(x19)
                  sw  x20, 80(x19)
                  sw  x21, 84(x19)
                  sw  x22, 88(x19)
                  sw  x23, 92(x19)
                  sw  x24, 96(x19)
                  sw  x25, 100(x19)
                  sw  x26, 104(x19)
                  sw  x27, 108(x19)
                  sw  x28, 112(x19)
                  sw  x29, 116(x19)
                  sw  x30, 120(x19)
                  sw  x31, 124(x19)
                  add x26, x19, zero
                  li x22, 0x8ffffffc
                  li x12, 0x6
                  slli x12, x12, 8
                  addi x12, x12, 0x0
                  sw x12, 0(x22)
                  csrr x12, 0x342 # MCAUSE
                  srli x12, x12, 0x1f
                  beqz x12, 1f
                  li x22, 0x8ffffffc
                  li x12, 0x300
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x300
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x342
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x342
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x304
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x304
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x344
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x344
                  sw x12, 0(x22)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_4:
                  addi x26, x26, -4
                  sw  x19, (x26)
                  add x19, x26, zero
                  addi x19, x19, -128
                  sw  x1, 4(x19)
                  sw  x2, 8(x19)
                  sw  x3, 12(x19)
                  sw  x4, 16(x19)
                  sw  x5, 20(x19)
                  sw  x6, 24(x19)
                  sw  x7, 28(x19)
                  sw  x8, 32(x19)
                  sw  x9, 36(x19)
                  sw  x10, 40(x19)
                  sw  x11, 44(x19)
                  sw  x12, 48(x19)
                  sw  x13, 52(x19)
                  sw  x14, 56(x19)
                  sw  x15, 60(x19)
                  sw  x16, 64(x19)
                  sw  x17, 68(x19)
                  sw  x18, 72(x19)
                  sw  x19, 76(x19)
                  sw  x20, 80(x19)
                  sw  x21, 84(x19)
                  sw  x22, 88(x19)
                  sw  x23, 92(x19)
                  sw  x24, 96(x19)
                  sw  x25, 100(x19)
                  sw  x26, 104(x19)
                  sw  x27, 108(x19)
                  sw  x28, 112(x19)
                  sw  x29, 116(x19)
                  sw  x30, 120(x19)
                  sw  x31, 124(x19)
                  add x26, x19, zero
                  li x22, 0x8ffffffc
                  li x12, 0x6
                  slli x12, x12, 8
                  addi x12, x12, 0x0
                  sw x12, 0(x22)
                  csrr x12, 0x342 # MCAUSE
                  srli x12, x12, 0x1f
                  beqz x12, 1f
                  li x22, 0x8ffffffc
                  li x12, 0x300
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x300
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x342
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x342
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x304
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x304
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x344
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x344
                  sw x12, 0(x22)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_5:
                  addi x26, x26, -4
                  sw  x19, (x26)
                  add x19, x26, zero
                  addi x19, x19, -128
                  sw  x1, 4(x19)
                  sw  x2, 8(x19)
                  sw  x3, 12(x19)
                  sw  x4, 16(x19)
                  sw  x5, 20(x19)
                  sw  x6, 24(x19)
                  sw  x7, 28(x19)
                  sw  x8, 32(x19)
                  sw  x9, 36(x19)
                  sw  x10, 40(x19)
                  sw  x11, 44(x19)
                  sw  x12, 48(x19)
                  sw  x13, 52(x19)
                  sw  x14, 56(x19)
                  sw  x15, 60(x19)
                  sw  x16, 64(x19)
                  sw  x17, 68(x19)
                  sw  x18, 72(x19)
                  sw  x19, 76(x19)
                  sw  x20, 80(x19)
                  sw  x21, 84(x19)
                  sw  x22, 88(x19)
                  sw  x23, 92(x19)
                  sw  x24, 96(x19)
                  sw  x25, 100(x19)
                  sw  x26, 104(x19)
                  sw  x27, 108(x19)
                  sw  x28, 112(x19)
                  sw  x29, 116(x19)
                  sw  x30, 120(x19)
                  sw  x31, 124(x19)
                  add x26, x19, zero
                  li x22, 0x8ffffffc
                  li x12, 0x6
                  slli x12, x12, 8
                  addi x12, x12, 0x0
                  sw x12, 0(x22)
                  csrr x12, 0x342 # MCAUSE
                  srli x12, x12, 0x1f
                  beqz x12, 1f
                  li x22, 0x8ffffffc
                  li x12, 0x300
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x300
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x342
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x342
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x304
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x304
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x344
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x344
                  sw x12, 0(x22)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_6:
                  addi x26, x26, -4
                  sw  x19, (x26)
                  add x19, x26, zero
                  addi x19, x19, -128
                  sw  x1, 4(x19)
                  sw  x2, 8(x19)
                  sw  x3, 12(x19)
                  sw  x4, 16(x19)
                  sw  x5, 20(x19)
                  sw  x6, 24(x19)
                  sw  x7, 28(x19)
                  sw  x8, 32(x19)
                  sw  x9, 36(x19)
                  sw  x10, 40(x19)
                  sw  x11, 44(x19)
                  sw  x12, 48(x19)
                  sw  x13, 52(x19)
                  sw  x14, 56(x19)
                  sw  x15, 60(x19)
                  sw  x16, 64(x19)
                  sw  x17, 68(x19)
                  sw  x18, 72(x19)
                  sw  x19, 76(x19)
                  sw  x20, 80(x19)
                  sw  x21, 84(x19)
                  sw  x22, 88(x19)
                  sw  x23, 92(x19)
                  sw  x24, 96(x19)
                  sw  x25, 100(x19)
                  sw  x26, 104(x19)
                  sw  x27, 108(x19)
                  sw  x28, 112(x19)
                  sw  x29, 116(x19)
                  sw  x30, 120(x19)
                  sw  x31, 124(x19)
                  add x26, x19, zero
                  li x22, 0x8ffffffc
                  li x12, 0x6
                  slli x12, x12, 8
                  addi x12, x12, 0x0
                  sw x12, 0(x22)
                  csrr x12, 0x342 # MCAUSE
                  srli x12, x12, 0x1f
                  beqz x12, 1f
                  li x22, 0x8ffffffc
                  li x12, 0x300
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x300
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x342
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x342
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x304
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x304
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x344
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x344
                  sw x12, 0(x22)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_7:
                  addi x26, x26, -4
                  sw  x19, (x26)
                  add x19, x26, zero
                  addi x19, x19, -128
                  sw  x1, 4(x19)
                  sw  x2, 8(x19)
                  sw  x3, 12(x19)
                  sw  x4, 16(x19)
                  sw  x5, 20(x19)
                  sw  x6, 24(x19)
                  sw  x7, 28(x19)
                  sw  x8, 32(x19)
                  sw  x9, 36(x19)
                  sw  x10, 40(x19)
                  sw  x11, 44(x19)
                  sw  x12, 48(x19)
                  sw  x13, 52(x19)
                  sw  x14, 56(x19)
                  sw  x15, 60(x19)
                  sw  x16, 64(x19)
                  sw  x17, 68(x19)
                  sw  x18, 72(x19)
                  sw  x19, 76(x19)
                  sw  x20, 80(x19)
                  sw  x21, 84(x19)
                  sw  x22, 88(x19)
                  sw  x23, 92(x19)
                  sw  x24, 96(x19)
                  sw  x25, 100(x19)
                  sw  x26, 104(x19)
                  sw  x27, 108(x19)
                  sw  x28, 112(x19)
                  sw  x29, 116(x19)
                  sw  x30, 120(x19)
                  sw  x31, 124(x19)
                  add x26, x19, zero
                  li x22, 0x8ffffffc
                  li x12, 0x6
                  slli x12, x12, 8
                  addi x12, x12, 0x0
                  sw x12, 0(x22)
                  csrr x12, 0x342 # MCAUSE
                  srli x12, x12, 0x1f
                  beqz x12, 1f
                  li x22, 0x8ffffffc
                  li x12, 0x300
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x300
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x342
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x342
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x304
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x304
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x344
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x344
                  sw x12, 0(x22)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_8:
                  addi x26, x26, -4
                  sw  x19, (x26)
                  add x19, x26, zero
                  addi x19, x19, -128
                  sw  x1, 4(x19)
                  sw  x2, 8(x19)
                  sw  x3, 12(x19)
                  sw  x4, 16(x19)
                  sw  x5, 20(x19)
                  sw  x6, 24(x19)
                  sw  x7, 28(x19)
                  sw  x8, 32(x19)
                  sw  x9, 36(x19)
                  sw  x10, 40(x19)
                  sw  x11, 44(x19)
                  sw  x12, 48(x19)
                  sw  x13, 52(x19)
                  sw  x14, 56(x19)
                  sw  x15, 60(x19)
                  sw  x16, 64(x19)
                  sw  x17, 68(x19)
                  sw  x18, 72(x19)
                  sw  x19, 76(x19)
                  sw  x20, 80(x19)
                  sw  x21, 84(x19)
                  sw  x22, 88(x19)
                  sw  x23, 92(x19)
                  sw  x24, 96(x19)
                  sw  x25, 100(x19)
                  sw  x26, 104(x19)
                  sw  x27, 108(x19)
                  sw  x28, 112(x19)
                  sw  x29, 116(x19)
                  sw  x30, 120(x19)
                  sw  x31, 124(x19)
                  add x26, x19, zero
                  li x22, 0x8ffffffc
                  li x12, 0x6
                  slli x12, x12, 8
                  addi x12, x12, 0x0
                  sw x12, 0(x22)
                  csrr x12, 0x342 # MCAUSE
                  srli x12, x12, 0x1f
                  beqz x12, 1f
                  li x22, 0x8ffffffc
                  li x12, 0x300
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x300
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x342
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x342
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x304
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x304
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x344
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x344
                  sw x12, 0(x22)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_9:
                  addi x26, x26, -4
                  sw  x19, (x26)
                  add x19, x26, zero
                  addi x19, x19, -128
                  sw  x1, 4(x19)
                  sw  x2, 8(x19)
                  sw  x3, 12(x19)
                  sw  x4, 16(x19)
                  sw  x5, 20(x19)
                  sw  x6, 24(x19)
                  sw  x7, 28(x19)
                  sw  x8, 32(x19)
                  sw  x9, 36(x19)
                  sw  x10, 40(x19)
                  sw  x11, 44(x19)
                  sw  x12, 48(x19)
                  sw  x13, 52(x19)
                  sw  x14, 56(x19)
                  sw  x15, 60(x19)
                  sw  x16, 64(x19)
                  sw  x17, 68(x19)
                  sw  x18, 72(x19)
                  sw  x19, 76(x19)
                  sw  x20, 80(x19)
                  sw  x21, 84(x19)
                  sw  x22, 88(x19)
                  sw  x23, 92(x19)
                  sw  x24, 96(x19)
                  sw  x25, 100(x19)
                  sw  x26, 104(x19)
                  sw  x27, 108(x19)
                  sw  x28, 112(x19)
                  sw  x29, 116(x19)
                  sw  x30, 120(x19)
                  sw  x31, 124(x19)
                  add x26, x19, zero
                  li x22, 0x8ffffffc
                  li x12, 0x6
                  slli x12, x12, 8
                  addi x12, x12, 0x0
                  sw x12, 0(x22)
                  csrr x12, 0x342 # MCAUSE
                  srli x12, x12, 0x1f
                  beqz x12, 1f
                  li x22, 0x8ffffffc
                  li x12, 0x300
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x300
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x342
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x342
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x304
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x304
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x344
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x344
                  sw x12, 0(x22)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_10:
                  addi x26, x26, -4
                  sw  x19, (x26)
                  add x19, x26, zero
                  addi x19, x19, -128
                  sw  x1, 4(x19)
                  sw  x2, 8(x19)
                  sw  x3, 12(x19)
                  sw  x4, 16(x19)
                  sw  x5, 20(x19)
                  sw  x6, 24(x19)
                  sw  x7, 28(x19)
                  sw  x8, 32(x19)
                  sw  x9, 36(x19)
                  sw  x10, 40(x19)
                  sw  x11, 44(x19)
                  sw  x12, 48(x19)
                  sw  x13, 52(x19)
                  sw  x14, 56(x19)
                  sw  x15, 60(x19)
                  sw  x16, 64(x19)
                  sw  x17, 68(x19)
                  sw  x18, 72(x19)
                  sw  x19, 76(x19)
                  sw  x20, 80(x19)
                  sw  x21, 84(x19)
                  sw  x22, 88(x19)
                  sw  x23, 92(x19)
                  sw  x24, 96(x19)
                  sw  x25, 100(x19)
                  sw  x26, 104(x19)
                  sw  x27, 108(x19)
                  sw  x28, 112(x19)
                  sw  x29, 116(x19)
                  sw  x30, 120(x19)
                  sw  x31, 124(x19)
                  add x26, x19, zero
                  li x22, 0x8ffffffc
                  li x12, 0x6
                  slli x12, x12, 8
                  addi x12, x12, 0x0
                  sw x12, 0(x22)
                  csrr x12, 0x342 # MCAUSE
                  srli x12, x12, 0x1f
                  beqz x12, 1f
                  li x22, 0x8ffffffc
                  li x12, 0x300
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x300
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x342
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x342
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x304
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x304
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x344
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x344
                  sw x12, 0(x22)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_11:
                  addi x26, x26, -4
                  sw  x19, (x26)
                  add x19, x26, zero
                  addi x19, x19, -128
                  sw  x1, 4(x19)
                  sw  x2, 8(x19)
                  sw  x3, 12(x19)
                  sw  x4, 16(x19)
                  sw  x5, 20(x19)
                  sw  x6, 24(x19)
                  sw  x7, 28(x19)
                  sw  x8, 32(x19)
                  sw  x9, 36(x19)
                  sw  x10, 40(x19)
                  sw  x11, 44(x19)
                  sw  x12, 48(x19)
                  sw  x13, 52(x19)
                  sw  x14, 56(x19)
                  sw  x15, 60(x19)
                  sw  x16, 64(x19)
                  sw  x17, 68(x19)
                  sw  x18, 72(x19)
                  sw  x19, 76(x19)
                  sw  x20, 80(x19)
                  sw  x21, 84(x19)
                  sw  x22, 88(x19)
                  sw  x23, 92(x19)
                  sw  x24, 96(x19)
                  sw  x25, 100(x19)
                  sw  x26, 104(x19)
                  sw  x27, 108(x19)
                  sw  x28, 112(x19)
                  sw  x29, 116(x19)
                  sw  x30, 120(x19)
                  sw  x31, 124(x19)
                  add x26, x19, zero
                  li x22, 0x8ffffffc
                  li x12, 0x6
                  slli x12, x12, 8
                  addi x12, x12, 0x0
                  sw x12, 0(x22)
                  csrr x12, 0x342 # MCAUSE
                  srli x12, x12, 0x1f
                  beqz x12, 1f
                  li x22, 0x8ffffffc
                  li x12, 0x300
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x300
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x342
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x342
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x304
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x304
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x344
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x344
                  sw x12, 0(x22)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_12:
                  addi x26, x26, -4
                  sw  x19, (x26)
                  add x19, x26, zero
                  addi x19, x19, -128
                  sw  x1, 4(x19)
                  sw  x2, 8(x19)
                  sw  x3, 12(x19)
                  sw  x4, 16(x19)
                  sw  x5, 20(x19)
                  sw  x6, 24(x19)
                  sw  x7, 28(x19)
                  sw  x8, 32(x19)
                  sw  x9, 36(x19)
                  sw  x10, 40(x19)
                  sw  x11, 44(x19)
                  sw  x12, 48(x19)
                  sw  x13, 52(x19)
                  sw  x14, 56(x19)
                  sw  x15, 60(x19)
                  sw  x16, 64(x19)
                  sw  x17, 68(x19)
                  sw  x18, 72(x19)
                  sw  x19, 76(x19)
                  sw  x20, 80(x19)
                  sw  x21, 84(x19)
                  sw  x22, 88(x19)
                  sw  x23, 92(x19)
                  sw  x24, 96(x19)
                  sw  x25, 100(x19)
                  sw  x26, 104(x19)
                  sw  x27, 108(x19)
                  sw  x28, 112(x19)
                  sw  x29, 116(x19)
                  sw  x30, 120(x19)
                  sw  x31, 124(x19)
                  add x26, x19, zero
                  li x22, 0x8ffffffc
                  li x12, 0x6
                  slli x12, x12, 8
                  addi x12, x12, 0x0
                  sw x12, 0(x22)
                  csrr x12, 0x342 # MCAUSE
                  srli x12, x12, 0x1f
                  beqz x12, 1f
                  li x22, 0x8ffffffc
                  li x12, 0x300
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x300
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x342
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x342
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x304
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x304
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x344
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x344
                  sw x12, 0(x22)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_13:
                  addi x26, x26, -4
                  sw  x19, (x26)
                  add x19, x26, zero
                  addi x19, x19, -128
                  sw  x1, 4(x19)
                  sw  x2, 8(x19)
                  sw  x3, 12(x19)
                  sw  x4, 16(x19)
                  sw  x5, 20(x19)
                  sw  x6, 24(x19)
                  sw  x7, 28(x19)
                  sw  x8, 32(x19)
                  sw  x9, 36(x19)
                  sw  x10, 40(x19)
                  sw  x11, 44(x19)
                  sw  x12, 48(x19)
                  sw  x13, 52(x19)
                  sw  x14, 56(x19)
                  sw  x15, 60(x19)
                  sw  x16, 64(x19)
                  sw  x17, 68(x19)
                  sw  x18, 72(x19)
                  sw  x19, 76(x19)
                  sw  x20, 80(x19)
                  sw  x21, 84(x19)
                  sw  x22, 88(x19)
                  sw  x23, 92(x19)
                  sw  x24, 96(x19)
                  sw  x25, 100(x19)
                  sw  x26, 104(x19)
                  sw  x27, 108(x19)
                  sw  x28, 112(x19)
                  sw  x29, 116(x19)
                  sw  x30, 120(x19)
                  sw  x31, 124(x19)
                  add x26, x19, zero
                  li x22, 0x8ffffffc
                  li x12, 0x6
                  slli x12, x12, 8
                  addi x12, x12, 0x0
                  sw x12, 0(x22)
                  csrr x12, 0x342 # MCAUSE
                  srli x12, x12, 0x1f
                  beqz x12, 1f
                  li x22, 0x8ffffffc
                  li x12, 0x300
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x300
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x342
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x342
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x304
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x304
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x344
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x344
                  sw x12, 0(x22)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_14:
                  addi x26, x26, -4
                  sw  x19, (x26)
                  add x19, x26, zero
                  addi x19, x19, -128
                  sw  x1, 4(x19)
                  sw  x2, 8(x19)
                  sw  x3, 12(x19)
                  sw  x4, 16(x19)
                  sw  x5, 20(x19)
                  sw  x6, 24(x19)
                  sw  x7, 28(x19)
                  sw  x8, 32(x19)
                  sw  x9, 36(x19)
                  sw  x10, 40(x19)
                  sw  x11, 44(x19)
                  sw  x12, 48(x19)
                  sw  x13, 52(x19)
                  sw  x14, 56(x19)
                  sw  x15, 60(x19)
                  sw  x16, 64(x19)
                  sw  x17, 68(x19)
                  sw  x18, 72(x19)
                  sw  x19, 76(x19)
                  sw  x20, 80(x19)
                  sw  x21, 84(x19)
                  sw  x22, 88(x19)
                  sw  x23, 92(x19)
                  sw  x24, 96(x19)
                  sw  x25, 100(x19)
                  sw  x26, 104(x19)
                  sw  x27, 108(x19)
                  sw  x28, 112(x19)
                  sw  x29, 116(x19)
                  sw  x30, 120(x19)
                  sw  x31, 124(x19)
                  add x26, x19, zero
                  li x22, 0x8ffffffc
                  li x12, 0x6
                  slli x12, x12, 8
                  addi x12, x12, 0x0
                  sw x12, 0(x22)
                  csrr x12, 0x342 # MCAUSE
                  srli x12, x12, 0x1f
                  beqz x12, 1f
                  li x22, 0x8ffffffc
                  li x12, 0x300
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x300
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x342
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x342
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x304
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x304
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x344
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x344
                  sw x12, 0(x22)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_15:
                  addi x26, x26, -4
                  sw  x19, (x26)
                  add x19, x26, zero
                  addi x19, x19, -128
                  sw  x1, 4(x19)
                  sw  x2, 8(x19)
                  sw  x3, 12(x19)
                  sw  x4, 16(x19)
                  sw  x5, 20(x19)
                  sw  x6, 24(x19)
                  sw  x7, 28(x19)
                  sw  x8, 32(x19)
                  sw  x9, 36(x19)
                  sw  x10, 40(x19)
                  sw  x11, 44(x19)
                  sw  x12, 48(x19)
                  sw  x13, 52(x19)
                  sw  x14, 56(x19)
                  sw  x15, 60(x19)
                  sw  x16, 64(x19)
                  sw  x17, 68(x19)
                  sw  x18, 72(x19)
                  sw  x19, 76(x19)
                  sw  x20, 80(x19)
                  sw  x21, 84(x19)
                  sw  x22, 88(x19)
                  sw  x23, 92(x19)
                  sw  x24, 96(x19)
                  sw  x25, 100(x19)
                  sw  x26, 104(x19)
                  sw  x27, 108(x19)
                  sw  x28, 112(x19)
                  sw  x29, 116(x19)
                  sw  x30, 120(x19)
                  sw  x31, 124(x19)
                  add x26, x19, zero
                  li x22, 0x8ffffffc
                  li x12, 0x6
                  slli x12, x12, 8
                  addi x12, x12, 0x0
                  sw x12, 0(x22)
                  csrr x12, 0x342 # MCAUSE
                  srli x12, x12, 0x1f
                  beqz x12, 1f
                  li x22, 0x8ffffffc
                  li x12, 0x300
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x300
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x342
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x342
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x304
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x304
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x344
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x344
                  sw x12, 0(x22)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_16:
                  addi x26, x26, -4
                  sw  x19, (x26)
                  add x19, x26, zero
                  addi x19, x19, -128
                  sw  x1, 4(x19)
                  sw  x2, 8(x19)
                  sw  x3, 12(x19)
                  sw  x4, 16(x19)
                  sw  x5, 20(x19)
                  sw  x6, 24(x19)
                  sw  x7, 28(x19)
                  sw  x8, 32(x19)
                  sw  x9, 36(x19)
                  sw  x10, 40(x19)
                  sw  x11, 44(x19)
                  sw  x12, 48(x19)
                  sw  x13, 52(x19)
                  sw  x14, 56(x19)
                  sw  x15, 60(x19)
                  sw  x16, 64(x19)
                  sw  x17, 68(x19)
                  sw  x18, 72(x19)
                  sw  x19, 76(x19)
                  sw  x20, 80(x19)
                  sw  x21, 84(x19)
                  sw  x22, 88(x19)
                  sw  x23, 92(x19)
                  sw  x24, 96(x19)
                  sw  x25, 100(x19)
                  sw  x26, 104(x19)
                  sw  x27, 108(x19)
                  sw  x28, 112(x19)
                  sw  x29, 116(x19)
                  sw  x30, 120(x19)
                  sw  x31, 124(x19)
                  add x26, x19, zero
                  li x22, 0x8ffffffc
                  li x12, 0x6
                  slli x12, x12, 8
                  addi x12, x12, 0x0
                  sw x12, 0(x22)
                  csrr x12, 0x342 # MCAUSE
                  srli x12, x12, 0x1f
                  beqz x12, 1f
                  li x22, 0x8ffffffc
                  li x12, 0x300
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x300
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x342
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x342
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x304
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x304
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x344
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x344
                  sw x12, 0(x22)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_17:
                  addi x26, x26, -4
                  sw  x19, (x26)
                  add x19, x26, zero
                  addi x19, x19, -128
                  sw  x1, 4(x19)
                  sw  x2, 8(x19)
                  sw  x3, 12(x19)
                  sw  x4, 16(x19)
                  sw  x5, 20(x19)
                  sw  x6, 24(x19)
                  sw  x7, 28(x19)
                  sw  x8, 32(x19)
                  sw  x9, 36(x19)
                  sw  x10, 40(x19)
                  sw  x11, 44(x19)
                  sw  x12, 48(x19)
                  sw  x13, 52(x19)
                  sw  x14, 56(x19)
                  sw  x15, 60(x19)
                  sw  x16, 64(x19)
                  sw  x17, 68(x19)
                  sw  x18, 72(x19)
                  sw  x19, 76(x19)
                  sw  x20, 80(x19)
                  sw  x21, 84(x19)
                  sw  x22, 88(x19)
                  sw  x23, 92(x19)
                  sw  x24, 96(x19)
                  sw  x25, 100(x19)
                  sw  x26, 104(x19)
                  sw  x27, 108(x19)
                  sw  x28, 112(x19)
                  sw  x29, 116(x19)
                  sw  x30, 120(x19)
                  sw  x31, 124(x19)
                  add x26, x19, zero
                  li x22, 0x8ffffffc
                  li x12, 0x6
                  slli x12, x12, 8
                  addi x12, x12, 0x0
                  sw x12, 0(x22)
                  csrr x12, 0x342 # MCAUSE
                  srli x12, x12, 0x1f
                  beqz x12, 1f
                  li x22, 0x8ffffffc
                  li x12, 0x300
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x300
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x342
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x342
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x304
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x304
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x344
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x344
                  sw x12, 0(x22)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_18:
                  addi x26, x26, -4
                  sw  x19, (x26)
                  add x19, x26, zero
                  addi x19, x19, -128
                  sw  x1, 4(x19)
                  sw  x2, 8(x19)
                  sw  x3, 12(x19)
                  sw  x4, 16(x19)
                  sw  x5, 20(x19)
                  sw  x6, 24(x19)
                  sw  x7, 28(x19)
                  sw  x8, 32(x19)
                  sw  x9, 36(x19)
                  sw  x10, 40(x19)
                  sw  x11, 44(x19)
                  sw  x12, 48(x19)
                  sw  x13, 52(x19)
                  sw  x14, 56(x19)
                  sw  x15, 60(x19)
                  sw  x16, 64(x19)
                  sw  x17, 68(x19)
                  sw  x18, 72(x19)
                  sw  x19, 76(x19)
                  sw  x20, 80(x19)
                  sw  x21, 84(x19)
                  sw  x22, 88(x19)
                  sw  x23, 92(x19)
                  sw  x24, 96(x19)
                  sw  x25, 100(x19)
                  sw  x26, 104(x19)
                  sw  x27, 108(x19)
                  sw  x28, 112(x19)
                  sw  x29, 116(x19)
                  sw  x30, 120(x19)
                  sw  x31, 124(x19)
                  add x26, x19, zero
                  li x22, 0x8ffffffc
                  li x12, 0x6
                  slli x12, x12, 8
                  addi x12, x12, 0x0
                  sw x12, 0(x22)
                  csrr x12, 0x342 # MCAUSE
                  srli x12, x12, 0x1f
                  beqz x12, 1f
                  li x22, 0x8ffffffc
                  li x12, 0x300
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x300
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x342
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x342
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x304
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x304
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x344
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x344
                  sw x12, 0(x22)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_19:
                  addi x26, x26, -4
                  sw  x19, (x26)
                  add x19, x26, zero
                  addi x19, x19, -128
                  sw  x1, 4(x19)
                  sw  x2, 8(x19)
                  sw  x3, 12(x19)
                  sw  x4, 16(x19)
                  sw  x5, 20(x19)
                  sw  x6, 24(x19)
                  sw  x7, 28(x19)
                  sw  x8, 32(x19)
                  sw  x9, 36(x19)
                  sw  x10, 40(x19)
                  sw  x11, 44(x19)
                  sw  x12, 48(x19)
                  sw  x13, 52(x19)
                  sw  x14, 56(x19)
                  sw  x15, 60(x19)
                  sw  x16, 64(x19)
                  sw  x17, 68(x19)
                  sw  x18, 72(x19)
                  sw  x19, 76(x19)
                  sw  x20, 80(x19)
                  sw  x21, 84(x19)
                  sw  x22, 88(x19)
                  sw  x23, 92(x19)
                  sw  x24, 96(x19)
                  sw  x25, 100(x19)
                  sw  x26, 104(x19)
                  sw  x27, 108(x19)
                  sw  x28, 112(x19)
                  sw  x29, 116(x19)
                  sw  x30, 120(x19)
                  sw  x31, 124(x19)
                  add x26, x19, zero
                  li x22, 0x8ffffffc
                  li x12, 0x6
                  slli x12, x12, 8
                  addi x12, x12, 0x0
                  sw x12, 0(x22)
                  csrr x12, 0x342 # MCAUSE
                  srli x12, x12, 0x1f
                  beqz x12, 1f
                  li x22, 0x8ffffffc
                  li x12, 0x300
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x300
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x342
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x342
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x304
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x304
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x344
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x344
                  sw x12, 0(x22)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_20:
                  addi x26, x26, -4
                  sw  x19, (x26)
                  add x19, x26, zero
                  addi x19, x19, -128
                  sw  x1, 4(x19)
                  sw  x2, 8(x19)
                  sw  x3, 12(x19)
                  sw  x4, 16(x19)
                  sw  x5, 20(x19)
                  sw  x6, 24(x19)
                  sw  x7, 28(x19)
                  sw  x8, 32(x19)
                  sw  x9, 36(x19)
                  sw  x10, 40(x19)
                  sw  x11, 44(x19)
                  sw  x12, 48(x19)
                  sw  x13, 52(x19)
                  sw  x14, 56(x19)
                  sw  x15, 60(x19)
                  sw  x16, 64(x19)
                  sw  x17, 68(x19)
                  sw  x18, 72(x19)
                  sw  x19, 76(x19)
                  sw  x20, 80(x19)
                  sw  x21, 84(x19)
                  sw  x22, 88(x19)
                  sw  x23, 92(x19)
                  sw  x24, 96(x19)
                  sw  x25, 100(x19)
                  sw  x26, 104(x19)
                  sw  x27, 108(x19)
                  sw  x28, 112(x19)
                  sw  x29, 116(x19)
                  sw  x30, 120(x19)
                  sw  x31, 124(x19)
                  add x26, x19, zero
                  li x22, 0x8ffffffc
                  li x12, 0x6
                  slli x12, x12, 8
                  addi x12, x12, 0x0
                  sw x12, 0(x22)
                  csrr x12, 0x342 # MCAUSE
                  srli x12, x12, 0x1f
                  beqz x12, 1f
                  li x22, 0x8ffffffc
                  li x12, 0x300
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x300
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x342
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x342
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x304
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x304
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x344
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x344
                  sw x12, 0(x22)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_21:
                  addi x26, x26, -4
                  sw  x19, (x26)
                  add x19, x26, zero
                  addi x19, x19, -128
                  sw  x1, 4(x19)
                  sw  x2, 8(x19)
                  sw  x3, 12(x19)
                  sw  x4, 16(x19)
                  sw  x5, 20(x19)
                  sw  x6, 24(x19)
                  sw  x7, 28(x19)
                  sw  x8, 32(x19)
                  sw  x9, 36(x19)
                  sw  x10, 40(x19)
                  sw  x11, 44(x19)
                  sw  x12, 48(x19)
                  sw  x13, 52(x19)
                  sw  x14, 56(x19)
                  sw  x15, 60(x19)
                  sw  x16, 64(x19)
                  sw  x17, 68(x19)
                  sw  x18, 72(x19)
                  sw  x19, 76(x19)
                  sw  x20, 80(x19)
                  sw  x21, 84(x19)
                  sw  x22, 88(x19)
                  sw  x23, 92(x19)
                  sw  x24, 96(x19)
                  sw  x25, 100(x19)
                  sw  x26, 104(x19)
                  sw  x27, 108(x19)
                  sw  x28, 112(x19)
                  sw  x29, 116(x19)
                  sw  x30, 120(x19)
                  sw  x31, 124(x19)
                  add x26, x19, zero
                  li x22, 0x8ffffffc
                  li x12, 0x6
                  slli x12, x12, 8
                  addi x12, x12, 0x0
                  sw x12, 0(x22)
                  csrr x12, 0x342 # MCAUSE
                  srli x12, x12, 0x1f
                  beqz x12, 1f
                  li x22, 0x8ffffffc
                  li x12, 0x300
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x300
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x342
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x342
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x304
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x304
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x344
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x344
                  sw x12, 0(x22)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_22:
                  addi x26, x26, -4
                  sw  x19, (x26)
                  add x19, x26, zero
                  addi x19, x19, -128
                  sw  x1, 4(x19)
                  sw  x2, 8(x19)
                  sw  x3, 12(x19)
                  sw  x4, 16(x19)
                  sw  x5, 20(x19)
                  sw  x6, 24(x19)
                  sw  x7, 28(x19)
                  sw  x8, 32(x19)
                  sw  x9, 36(x19)
                  sw  x10, 40(x19)
                  sw  x11, 44(x19)
                  sw  x12, 48(x19)
                  sw  x13, 52(x19)
                  sw  x14, 56(x19)
                  sw  x15, 60(x19)
                  sw  x16, 64(x19)
                  sw  x17, 68(x19)
                  sw  x18, 72(x19)
                  sw  x19, 76(x19)
                  sw  x20, 80(x19)
                  sw  x21, 84(x19)
                  sw  x22, 88(x19)
                  sw  x23, 92(x19)
                  sw  x24, 96(x19)
                  sw  x25, 100(x19)
                  sw  x26, 104(x19)
                  sw  x27, 108(x19)
                  sw  x28, 112(x19)
                  sw  x29, 116(x19)
                  sw  x30, 120(x19)
                  sw  x31, 124(x19)
                  add x26, x19, zero
                  li x22, 0x8ffffffc
                  li x12, 0x6
                  slli x12, x12, 8
                  addi x12, x12, 0x0
                  sw x12, 0(x22)
                  csrr x12, 0x342 # MCAUSE
                  srli x12, x12, 0x1f
                  beqz x12, 1f
                  li x22, 0x8ffffffc
                  li x12, 0x300
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x300
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x342
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x342
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x304
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x304
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x344
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x344
                  sw x12, 0(x22)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_23:
                  addi x26, x26, -4
                  sw  x19, (x26)
                  add x19, x26, zero
                  addi x19, x19, -128
                  sw  x1, 4(x19)
                  sw  x2, 8(x19)
                  sw  x3, 12(x19)
                  sw  x4, 16(x19)
                  sw  x5, 20(x19)
                  sw  x6, 24(x19)
                  sw  x7, 28(x19)
                  sw  x8, 32(x19)
                  sw  x9, 36(x19)
                  sw  x10, 40(x19)
                  sw  x11, 44(x19)
                  sw  x12, 48(x19)
                  sw  x13, 52(x19)
                  sw  x14, 56(x19)
                  sw  x15, 60(x19)
                  sw  x16, 64(x19)
                  sw  x17, 68(x19)
                  sw  x18, 72(x19)
                  sw  x19, 76(x19)
                  sw  x20, 80(x19)
                  sw  x21, 84(x19)
                  sw  x22, 88(x19)
                  sw  x23, 92(x19)
                  sw  x24, 96(x19)
                  sw  x25, 100(x19)
                  sw  x26, 104(x19)
                  sw  x27, 108(x19)
                  sw  x28, 112(x19)
                  sw  x29, 116(x19)
                  sw  x30, 120(x19)
                  sw  x31, 124(x19)
                  add x26, x19, zero
                  li x22, 0x8ffffffc
                  li x12, 0x6
                  slli x12, x12, 8
                  addi x12, x12, 0x0
                  sw x12, 0(x22)
                  csrr x12, 0x342 # MCAUSE
                  srli x12, x12, 0x1f
                  beqz x12, 1f
                  li x22, 0x8ffffffc
                  li x12, 0x300
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x300
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x342
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x342
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x304
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x304
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x344
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x344
                  sw x12, 0(x22)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_24:
                  addi x26, x26, -4
                  sw  x19, (x26)
                  add x19, x26, zero
                  addi x19, x19, -128
                  sw  x1, 4(x19)
                  sw  x2, 8(x19)
                  sw  x3, 12(x19)
                  sw  x4, 16(x19)
                  sw  x5, 20(x19)
                  sw  x6, 24(x19)
                  sw  x7, 28(x19)
                  sw  x8, 32(x19)
                  sw  x9, 36(x19)
                  sw  x10, 40(x19)
                  sw  x11, 44(x19)
                  sw  x12, 48(x19)
                  sw  x13, 52(x19)
                  sw  x14, 56(x19)
                  sw  x15, 60(x19)
                  sw  x16, 64(x19)
                  sw  x17, 68(x19)
                  sw  x18, 72(x19)
                  sw  x19, 76(x19)
                  sw  x20, 80(x19)
                  sw  x21, 84(x19)
                  sw  x22, 88(x19)
                  sw  x23, 92(x19)
                  sw  x24, 96(x19)
                  sw  x25, 100(x19)
                  sw  x26, 104(x19)
                  sw  x27, 108(x19)
                  sw  x28, 112(x19)
                  sw  x29, 116(x19)
                  sw  x30, 120(x19)
                  sw  x31, 124(x19)
                  add x26, x19, zero
                  li x22, 0x8ffffffc
                  li x12, 0x6
                  slli x12, x12, 8
                  addi x12, x12, 0x0
                  sw x12, 0(x22)
                  csrr x12, 0x342 # MCAUSE
                  srli x12, x12, 0x1f
                  beqz x12, 1f
                  li x22, 0x8ffffffc
                  li x12, 0x300
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x300
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x342
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x342
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x304
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x304
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x344
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x344
                  sw x12, 0(x22)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_25:
                  addi x26, x26, -4
                  sw  x19, (x26)
                  add x19, x26, zero
                  addi x19, x19, -128
                  sw  x1, 4(x19)
                  sw  x2, 8(x19)
                  sw  x3, 12(x19)
                  sw  x4, 16(x19)
                  sw  x5, 20(x19)
                  sw  x6, 24(x19)
                  sw  x7, 28(x19)
                  sw  x8, 32(x19)
                  sw  x9, 36(x19)
                  sw  x10, 40(x19)
                  sw  x11, 44(x19)
                  sw  x12, 48(x19)
                  sw  x13, 52(x19)
                  sw  x14, 56(x19)
                  sw  x15, 60(x19)
                  sw  x16, 64(x19)
                  sw  x17, 68(x19)
                  sw  x18, 72(x19)
                  sw  x19, 76(x19)
                  sw  x20, 80(x19)
                  sw  x21, 84(x19)
                  sw  x22, 88(x19)
                  sw  x23, 92(x19)
                  sw  x24, 96(x19)
                  sw  x25, 100(x19)
                  sw  x26, 104(x19)
                  sw  x27, 108(x19)
                  sw  x28, 112(x19)
                  sw  x29, 116(x19)
                  sw  x30, 120(x19)
                  sw  x31, 124(x19)
                  add x26, x19, zero
                  li x22, 0x8ffffffc
                  li x12, 0x6
                  slli x12, x12, 8
                  addi x12, x12, 0x0
                  sw x12, 0(x22)
                  csrr x12, 0x342 # MCAUSE
                  srli x12, x12, 0x1f
                  beqz x12, 1f
                  li x22, 0x8ffffffc
                  li x12, 0x300
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x300
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x342
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x342
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x304
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x304
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x344
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x344
                  sw x12, 0(x22)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_26:
                  addi x26, x26, -4
                  sw  x19, (x26)
                  add x19, x26, zero
                  addi x19, x19, -128
                  sw  x1, 4(x19)
                  sw  x2, 8(x19)
                  sw  x3, 12(x19)
                  sw  x4, 16(x19)
                  sw  x5, 20(x19)
                  sw  x6, 24(x19)
                  sw  x7, 28(x19)
                  sw  x8, 32(x19)
                  sw  x9, 36(x19)
                  sw  x10, 40(x19)
                  sw  x11, 44(x19)
                  sw  x12, 48(x19)
                  sw  x13, 52(x19)
                  sw  x14, 56(x19)
                  sw  x15, 60(x19)
                  sw  x16, 64(x19)
                  sw  x17, 68(x19)
                  sw  x18, 72(x19)
                  sw  x19, 76(x19)
                  sw  x20, 80(x19)
                  sw  x21, 84(x19)
                  sw  x22, 88(x19)
                  sw  x23, 92(x19)
                  sw  x24, 96(x19)
                  sw  x25, 100(x19)
                  sw  x26, 104(x19)
                  sw  x27, 108(x19)
                  sw  x28, 112(x19)
                  sw  x29, 116(x19)
                  sw  x30, 120(x19)
                  sw  x31, 124(x19)
                  add x26, x19, zero
                  li x22, 0x8ffffffc
                  li x12, 0x6
                  slli x12, x12, 8
                  addi x12, x12, 0x0
                  sw x12, 0(x22)
                  csrr x12, 0x342 # MCAUSE
                  srli x12, x12, 0x1f
                  beqz x12, 1f
                  li x22, 0x8ffffffc
                  li x12, 0x300
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x300
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x342
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x342
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x304
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x304
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x344
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x344
                  sw x12, 0(x22)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_27:
                  addi x26, x26, -4
                  sw  x19, (x26)
                  add x19, x26, zero
                  addi x19, x19, -128
                  sw  x1, 4(x19)
                  sw  x2, 8(x19)
                  sw  x3, 12(x19)
                  sw  x4, 16(x19)
                  sw  x5, 20(x19)
                  sw  x6, 24(x19)
                  sw  x7, 28(x19)
                  sw  x8, 32(x19)
                  sw  x9, 36(x19)
                  sw  x10, 40(x19)
                  sw  x11, 44(x19)
                  sw  x12, 48(x19)
                  sw  x13, 52(x19)
                  sw  x14, 56(x19)
                  sw  x15, 60(x19)
                  sw  x16, 64(x19)
                  sw  x17, 68(x19)
                  sw  x18, 72(x19)
                  sw  x19, 76(x19)
                  sw  x20, 80(x19)
                  sw  x21, 84(x19)
                  sw  x22, 88(x19)
                  sw  x23, 92(x19)
                  sw  x24, 96(x19)
                  sw  x25, 100(x19)
                  sw  x26, 104(x19)
                  sw  x27, 108(x19)
                  sw  x28, 112(x19)
                  sw  x29, 116(x19)
                  sw  x30, 120(x19)
                  sw  x31, 124(x19)
                  add x26, x19, zero
                  li x22, 0x8ffffffc
                  li x12, 0x6
                  slli x12, x12, 8
                  addi x12, x12, 0x0
                  sw x12, 0(x22)
                  csrr x12, 0x342 # MCAUSE
                  srli x12, x12, 0x1f
                  beqz x12, 1f
                  li x22, 0x8ffffffc
                  li x12, 0x300
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x300
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x342
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x342
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x304
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x304
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x344
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x344
                  sw x12, 0(x22)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_28:
                  addi x26, x26, -4
                  sw  x19, (x26)
                  add x19, x26, zero
                  addi x19, x19, -128
                  sw  x1, 4(x19)
                  sw  x2, 8(x19)
                  sw  x3, 12(x19)
                  sw  x4, 16(x19)
                  sw  x5, 20(x19)
                  sw  x6, 24(x19)
                  sw  x7, 28(x19)
                  sw  x8, 32(x19)
                  sw  x9, 36(x19)
                  sw  x10, 40(x19)
                  sw  x11, 44(x19)
                  sw  x12, 48(x19)
                  sw  x13, 52(x19)
                  sw  x14, 56(x19)
                  sw  x15, 60(x19)
                  sw  x16, 64(x19)
                  sw  x17, 68(x19)
                  sw  x18, 72(x19)
                  sw  x19, 76(x19)
                  sw  x20, 80(x19)
                  sw  x21, 84(x19)
                  sw  x22, 88(x19)
                  sw  x23, 92(x19)
                  sw  x24, 96(x19)
                  sw  x25, 100(x19)
                  sw  x26, 104(x19)
                  sw  x27, 108(x19)
                  sw  x28, 112(x19)
                  sw  x29, 116(x19)
                  sw  x30, 120(x19)
                  sw  x31, 124(x19)
                  add x26, x19, zero
                  li x22, 0x8ffffffc
                  li x12, 0x6
                  slli x12, x12, 8
                  addi x12, x12, 0x0
                  sw x12, 0(x22)
                  csrr x12, 0x342 # MCAUSE
                  srli x12, x12, 0x1f
                  beqz x12, 1f
                  li x22, 0x8ffffffc
                  li x12, 0x300
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x300
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x342
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x342
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x304
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x304
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x344
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x344
                  sw x12, 0(x22)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_29:
                  addi x26, x26, -4
                  sw  x19, (x26)
                  add x19, x26, zero
                  addi x19, x19, -128
                  sw  x1, 4(x19)
                  sw  x2, 8(x19)
                  sw  x3, 12(x19)
                  sw  x4, 16(x19)
                  sw  x5, 20(x19)
                  sw  x6, 24(x19)
                  sw  x7, 28(x19)
                  sw  x8, 32(x19)
                  sw  x9, 36(x19)
                  sw  x10, 40(x19)
                  sw  x11, 44(x19)
                  sw  x12, 48(x19)
                  sw  x13, 52(x19)
                  sw  x14, 56(x19)
                  sw  x15, 60(x19)
                  sw  x16, 64(x19)
                  sw  x17, 68(x19)
                  sw  x18, 72(x19)
                  sw  x19, 76(x19)
                  sw  x20, 80(x19)
                  sw  x21, 84(x19)
                  sw  x22, 88(x19)
                  sw  x23, 92(x19)
                  sw  x24, 96(x19)
                  sw  x25, 100(x19)
                  sw  x26, 104(x19)
                  sw  x27, 108(x19)
                  sw  x28, 112(x19)
                  sw  x29, 116(x19)
                  sw  x30, 120(x19)
                  sw  x31, 124(x19)
                  add x26, x19, zero
                  li x22, 0x8ffffffc
                  li x12, 0x6
                  slli x12, x12, 8
                  addi x12, x12, 0x0
                  sw x12, 0(x22)
                  csrr x12, 0x342 # MCAUSE
                  srli x12, x12, 0x1f
                  beqz x12, 1f
                  li x22, 0x8ffffffc
                  li x12, 0x300
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x300
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x342
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x342
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x304
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x304
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x344
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x344
                  sw x12, 0(x22)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_30:
                  addi x26, x26, -4
                  sw  x19, (x26)
                  add x19, x26, zero
                  addi x19, x19, -128
                  sw  x1, 4(x19)
                  sw  x2, 8(x19)
                  sw  x3, 12(x19)
                  sw  x4, 16(x19)
                  sw  x5, 20(x19)
                  sw  x6, 24(x19)
                  sw  x7, 28(x19)
                  sw  x8, 32(x19)
                  sw  x9, 36(x19)
                  sw  x10, 40(x19)
                  sw  x11, 44(x19)
                  sw  x12, 48(x19)
                  sw  x13, 52(x19)
                  sw  x14, 56(x19)
                  sw  x15, 60(x19)
                  sw  x16, 64(x19)
                  sw  x17, 68(x19)
                  sw  x18, 72(x19)
                  sw  x19, 76(x19)
                  sw  x20, 80(x19)
                  sw  x21, 84(x19)
                  sw  x22, 88(x19)
                  sw  x23, 92(x19)
                  sw  x24, 96(x19)
                  sw  x25, 100(x19)
                  sw  x26, 104(x19)
                  sw  x27, 108(x19)
                  sw  x28, 112(x19)
                  sw  x29, 116(x19)
                  sw  x30, 120(x19)
                  sw  x31, 124(x19)
                  add x26, x19, zero
                  li x22, 0x8ffffffc
                  li x12, 0x6
                  slli x12, x12, 8
                  addi x12, x12, 0x0
                  sw x12, 0(x22)
                  csrr x12, 0x342 # MCAUSE
                  srli x12, x12, 0x1f
                  beqz x12, 1f
                  li x22, 0x8ffffffc
                  li x12, 0x300
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x300
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x342
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x342
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x304
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x304
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x344
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x344
                  sw x12, 0(x22)
                  j mmode_intr_handler
                  1: la x7, test_done
                  jalr x0, x7, 0

mmode_intr_vector_31:
                  addi x26, x26, -4
                  sw  x19, (x26)
                  add x19, x26, zero
                  addi x19, x19, -128
                  sw  x1, 4(x19)
                  sw  x2, 8(x19)
                  sw  x3, 12(x19)
                  sw  x4, 16(x19)
                  sw  x5, 20(x19)
                  sw  x6, 24(x19)
                  sw  x7, 28(x19)
                  sw  x8, 32(x19)
                  sw  x9, 36(x19)
                  sw  x10, 40(x19)
                  sw  x11, 44(x19)
                  sw  x12, 48(x19)
                  sw  x13, 52(x19)
                  sw  x14, 56(x19)
                  sw  x15, 60(x19)
                  sw  x16, 64(x19)
                  sw  x17, 68(x19)
                  sw  x18, 72(x19)
                  sw  x19, 76(x19)
                  sw  x20, 80(x19)
                  sw  x21, 84(x19)
                  sw  x22, 88(x19)
                  sw  x23, 92(x19)
                  sw  x24, 96(x19)
                  sw  x25, 100(x19)
                  sw  x26, 104(x19)
                  sw  x27, 108(x19)
                  sw  x28, 112(x19)
                  sw  x29, 116(x19)
                  sw  x30, 120(x19)
                  sw  x31, 124(x19)
                  add x26, x19, zero
                  li x22, 0x8ffffffc
                  li x12, 0x6
                  slli x12, x12, 8
                  addi x12, x12, 0x0
                  sw x12, 0(x22)
                  csrr x12, 0x342 # MCAUSE
                  srli x12, x12, 0x1f
                  beqz x12, 1f
                  li x22, 0x8ffffffc
                  li x12, 0x300
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x300
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x342
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x342
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x304
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x304
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x344
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x344
                  sw x12, 0(x22)
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
                  addi x26, x26, -4
                  sw  x19, (x26)
                  add x19, x26, zero
                  addi x19, x19, -128
                  sw  x1, 4(x19)
                  sw  x2, 8(x19)
                  sw  x3, 12(x19)
                  sw  x4, 16(x19)
                  sw  x5, 20(x19)
                  sw  x6, 24(x19)
                  sw  x7, 28(x19)
                  sw  x8, 32(x19)
                  sw  x9, 36(x19)
                  sw  x10, 40(x19)
                  sw  x11, 44(x19)
                  sw  x12, 48(x19)
                  sw  x13, 52(x19)
                  sw  x14, 56(x19)
                  sw  x15, 60(x19)
                  sw  x16, 64(x19)
                  sw  x17, 68(x19)
                  sw  x18, 72(x19)
                  sw  x19, 76(x19)
                  sw  x20, 80(x19)
                  sw  x21, 84(x19)
                  sw  x22, 88(x19)
                  sw  x23, 92(x19)
                  sw  x24, 96(x19)
                  sw  x25, 100(x19)
                  sw  x26, 104(x19)
                  sw  x27, 108(x19)
                  sw  x28, 112(x19)
                  sw  x29, 116(x19)
                  sw  x30, 120(x19)
                  sw  x31, 124(x19)
                  add x26, x19, zero
                  li x22, 0x8ffffffc
                  li x12, 0x8
                  slli x12, x12, 8
                  addi x12, x12, 0x0
                  sw x12, 0(x22)
                  csrr x12, 0x341 # MEPC
                  csrr x12, 0x342 # MCAUSE
                  li x22, 0x3 # BREAKPOINT
                  beq x12, x22, ebreak_handler
                  li x22, 0x8 # ECALL_UMODE
                  beq x12, x22, ecall_handler
                  li x22, 0x9 # ECALL_SMODE
                  beq x12, x22, ecall_handler
                  li x22, 0xb # ECALL_MMODE
                  beq x12, x22, ecall_handler
                  li x22, 0x1
                  beq x12, x22, instr_fault_handler
                  li x22, 0x5
                  beq x12, x22, load_fault_handler
                  li x22, 0x7
                  beq x12, x22, store_fault_handler
                  li x22, 0xc
                  beq x12, x22, pt_fault_handler
                  li x22, 0xd
                  beq x12, x22, pt_fault_handler
                  li x22, 0xf
                  beq x12, x22, pt_fault_handler
                  li x22, 0x2 # ILLEGAL_INSTRUCTION
                  beq x12, x22, illegal_instr_handler
                  csrr x22, 0x343 # MTVAL
                  1: la x7, test_done
                  jalr x1, x7, 0

ecall_handler:    
                  li x22, 0x8ffffffc
                  li x12, 0xb00
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0xb00
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0xb80
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0xb80
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0xb03
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0xb03
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0xb83
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0xb83
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0xb04
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0xb04
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0xb84
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0xb84
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0xb05
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0xb05
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0xb85
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0xb85
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0xb06
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0xb06
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0xb86
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0xb86
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0xb07
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0xb07
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0xb87
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0xb87
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0xb08
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0xb08
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0xb88
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0xb88
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0xb09
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0xb09
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0xb89
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0xb89
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0xb0a
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0xb0a
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0xb8a
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0xb8a
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0xb0b
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0xb0b
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0xb8b
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0xb8b
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0xb0c
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0xb0c
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0xb8c
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0xb8c
                  sw x12, 0(x22)
                  la x12, _start
                  sw x0, 0(x12)
                  sw x1, 4(x12)
                  sw x2, 8(x12)
                  sw x3, 12(x12)
                  sw x4, 16(x12)
                  sw x5, 20(x12)
                  sw x6, 24(x12)
                  sw x7, 28(x12)
                  sw x8, 32(x12)
                  sw x9, 36(x12)
                  sw x10, 40(x12)
                  sw x11, 44(x12)
                  sw x12, 48(x12)
                  sw x13, 52(x12)
                  sw x14, 56(x12)
                  sw x15, 60(x12)
                  sw x16, 64(x12)
                  sw x17, 68(x12)
                  sw x18, 72(x12)
                  sw x19, 76(x12)
                  sw x20, 80(x12)
                  sw x21, 84(x12)
                  sw x22, 88(x12)
                  sw x23, 92(x12)
                  sw x24, 96(x12)
                  sw x25, 100(x12)
                  sw x26, 104(x12)
                  sw x27, 108(x12)
                  sw x28, 112(x12)
                  sw x29, 116(x12)
                  sw x30, 120(x12)
                  sw x31, 124(x12)
                  csrr  x12, 0x341
                  addi  x12, x12, 4
                  csrw  0x341, x12
                  mret

instr_fault_handler:
                  li x22, 0x8ffffffc
                  li x12, 0x9
                  slli x12, x12, 8
                  addi x12, x12, 0x0
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x342
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x342
                  sw x12, 0(x22)
                  li x12, 0
                  mv x31, x12
                  li x5, 0
                  0: mv x12, x31
                  mv x7, x12
                  li x7, 0
                  beq x12, x7, 1f
                  li x7, 1
                  beq x12, x7, 2f
                  li x7, 2
                  beq x12, x7, 3f
                  li x7, 3
                  beq x12, x7, 4f
                  li x7, 4
                  beq x12, x7, 5f
                  li x7, 5
                  beq x12, x7, 6f
                  li x7, 6
                  beq x12, x7, 7f
                  li x7, 7
                  beq x12, x7, 8f
                  li x7, 8
                  beq x12, x7, 9f
                  li x7, 9
                  beq x12, x7, 10f
                  li x7, 10
                  beq x12, x7, 11f
                  li x7, 11
                  beq x12, x7, 12f
                  li x7, 12
                  beq x12, x7, 13f
                  li x7, 13
                  beq x12, x7, 14f
                  li x7, 14
                  beq x12, x7, 15f
                  li x7, 15
                  beq x12, x7, 16f
                  1: csrr x22, 0x3b0
                  csrr x17, 0x3a0
                  j 17f
                  2: csrr x22, 0x3b1
                  csrr x17, 0x3a0
                  j 17f
                  3: csrr x22, 0x3b2
                  csrr x17, 0x3a0
                  j 17f
                  4: csrr x22, 0x3b3
                  csrr x17, 0x3a0
                  j 17f
                  5: csrr x22, 0x3b4
                  csrr x17, 0x3a1
                  j 17f
                  6: csrr x22, 0x3b5
                  csrr x17, 0x3a1
                  j 17f
                  7: csrr x22, 0x3b6
                  csrr x17, 0x3a1
                  j 17f
                  8: csrr x22, 0x3b7
                  csrr x17, 0x3a1
                  j 17f
                  9: csrr x22, 0x3b8
                  csrr x17, 0x3a2
                  j 17f
                  10: csrr x22, 0x3b9
                  csrr x17, 0x3a2
                  j 17f
                  11: csrr x22, 0x3ba
                  csrr x17, 0x3a2
                  j 17f
                  12: csrr x22, 0x3bb
                  csrr x17, 0x3a2
                  j 17f
                  13: csrr x22, 0x3bc
                  csrr x17, 0x3a3
                  j 17f
                  14: csrr x22, 0x3bd
                  csrr x17, 0x3a3
                  j 17f
                  15: csrr x22, 0x3be
                  csrr x17, 0x3a3
                  j 17f
                  16: csrr x22, 0x3bf
                  csrr x17, 0x3a3
                  j 17f
                  17: li x20, 4
                  slli x12, x31, 30
                  srli x12, x12, 30
                  sub x7, x20, x12
                  addi x7, x7, -1
                  slli x7, x7, 3
                  sll x20, x17, x7
                  slli x12, x12, 3
                  add x7, x7, x12
                  srl x20, x20, x7
                  slli x7, x20, 27
                  srli x7, x7, 30
                  beqz x7, 20f
                  li x12, 1
                  beq x7, x12, 21f
                  li x12, 2
                  beq x7, x12, 24f
                  li x12, 3
                  beq x7, x12, 25f
                  la x12, test_done
                  jalr x0, x12, 0
                  18: mv x12, x31
                  mv x5, x22
                  addi x12, x12, 1
                  mv x31, x12
                  li x22, 16
                  ble x22, x12, 19f
                  j 0b
                  19: csrr x12, 0x747
                  andi x12, x12, 2
                  bnez x12, 27f
                  la x12, test_done
                  jalr x0, x12, 0
                  20: j 18b
                  21: mv x12, x31
                  csrr x7, 0x343
                  srli x7, x7, 2
                  bnez x12, 22f
                  bltz x7, 18b
                  j 23f
                  22: bgtu x5, x7, 18b
                  23: bleu x22, x7, 18b
                  j 26f
                  24: csrr x12, 0x343
                  srli x12, x12, 2
                  slli x7, x22, 2
                  srli x7, x7, 2
                  bne x12, x7, 18b
                  j 26f
                  25: csrr x12, 0x343
                  srli x12, x12, 2
                  srli x12, x12, 0
                  slli x12, x12, 0
                  slli x7, x22, 2
                  srli x7, x7, 2
                  srli x7, x7, 0
                  slli x7, x7, 0
                  bne x12, x7, 18b
                  j 26f
                  26: csrr x7, 0x747
                  andi x7, x7, 1
                  bnez x7, 27f
                  andi x7, x20, 128
                  bnez x7, 27f
                  j 29f
                  27: la x12, test_done
                  jalr x0, x12, 0
                  29: ori x20, x20, 4
                  li x7, 30
                  sll x12, x31, x7
                  srl x12, x12, x7
                  slli x7, x12, 3
                  sll x20, x20, x7
                  or x17, x17, x20
                  mv x12, x31
                  srli x12, x12, 2
                  beqz x12, 30f
                  li x7, 1
                  beq x12, x7, 31f
                  li x7, 2
                  beq x12, x7, 32f
                  li x7, 3
                  beq x12, x7, 33f
                  30: csrw 0x3a0, x17
                  j 34f
                  31: csrw 0x3a1, x17
                  j 34f
                  32: csrw 0x3a2, x17
                  j 34f
                  33: csrw 0x3a3, x17
                  34: nop
                  add x19, x26, zero
                  lw  x1, 4(x19)
                  lw  x2, 8(x19)
                  lw  x3, 12(x19)
                  lw  x4, 16(x19)
                  lw  x5, 20(x19)
                  lw  x6, 24(x19)
                  lw  x7, 28(x19)
                  lw  x8, 32(x19)
                  lw  x9, 36(x19)
                  lw  x10, 40(x19)
                  lw  x11, 44(x19)
                  lw  x12, 48(x19)
                  lw  x13, 52(x19)
                  lw  x14, 56(x19)
                  lw  x15, 60(x19)
                  lw  x16, 64(x19)
                  lw  x17, 68(x19)
                  lw  x18, 72(x19)
                  lw  x19, 76(x19)
                  lw  x20, 80(x19)
                  lw  x21, 84(x19)
                  lw  x22, 88(x19)
                  lw  x23, 92(x19)
                  lw  x24, 96(x19)
                  lw  x25, 100(x19)
                  lw  x26, 104(x19)
                  lw  x27, 108(x19)
                  lw  x28, 112(x19)
                  lw  x29, 116(x19)
                  lw  x30, 120(x19)
                  lw  x31, 124(x19)
                  addi x19, x19, 128
                  add x26, x19, zero
                  lw  x19, (x26)
                  addi x26, x26, 4
                  mret

load_fault_handler:
                  li x22, 0x8ffffffc
                  li x12, 0xb
                  slli x12, x12, 8
                  addi x12, x12, 0x0
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x342
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x342
                  sw x12, 0(x22)
                  li x12, 0
                  mv x31, x12
                  li x5, 0
                  0: mv x12, x31
                  mv x7, x12
                  li x7, 0
                  beq x12, x7, 1f
                  li x7, 1
                  beq x12, x7, 2f
                  li x7, 2
                  beq x12, x7, 3f
                  li x7, 3
                  beq x12, x7, 4f
                  li x7, 4
                  beq x12, x7, 5f
                  li x7, 5
                  beq x12, x7, 6f
                  li x7, 6
                  beq x12, x7, 7f
                  li x7, 7
                  beq x12, x7, 8f
                  li x7, 8
                  beq x12, x7, 9f
                  li x7, 9
                  beq x12, x7, 10f
                  li x7, 10
                  beq x12, x7, 11f
                  li x7, 11
                  beq x12, x7, 12f
                  li x7, 12
                  beq x12, x7, 13f
                  li x7, 13
                  beq x12, x7, 14f
                  li x7, 14
                  beq x12, x7, 15f
                  li x7, 15
                  beq x12, x7, 16f
                  1: csrr x22, 0x3b0
                  csrr x17, 0x3a0
                  j 17f
                  2: csrr x22, 0x3b1
                  csrr x17, 0x3a0
                  j 17f
                  3: csrr x22, 0x3b2
                  csrr x17, 0x3a0
                  j 17f
                  4: csrr x22, 0x3b3
                  csrr x17, 0x3a0
                  j 17f
                  5: csrr x22, 0x3b4
                  csrr x17, 0x3a1
                  j 17f
                  6: csrr x22, 0x3b5
                  csrr x17, 0x3a1
                  j 17f
                  7: csrr x22, 0x3b6
                  csrr x17, 0x3a1
                  j 17f
                  8: csrr x22, 0x3b7
                  csrr x17, 0x3a1
                  j 17f
                  9: csrr x22, 0x3b8
                  csrr x17, 0x3a2
                  j 17f
                  10: csrr x22, 0x3b9
                  csrr x17, 0x3a2
                  j 17f
                  11: csrr x22, 0x3ba
                  csrr x17, 0x3a2
                  j 17f
                  12: csrr x22, 0x3bb
                  csrr x17, 0x3a2
                  j 17f
                  13: csrr x22, 0x3bc
                  csrr x17, 0x3a3
                  j 17f
                  14: csrr x22, 0x3bd
                  csrr x17, 0x3a3
                  j 17f
                  15: csrr x22, 0x3be
                  csrr x17, 0x3a3
                  j 17f
                  16: csrr x22, 0x3bf
                  csrr x17, 0x3a3
                  j 17f
                  17: li x20, 4
                  slli x12, x31, 30
                  srli x12, x12, 30
                  sub x7, x20, x12
                  addi x7, x7, -1
                  slli x7, x7, 3
                  sll x20, x17, x7
                  slli x12, x12, 3
                  add x7, x7, x12
                  srl x20, x20, x7
                  slli x7, x20, 27
                  srli x7, x7, 30
                  beqz x7, 20f
                  li x12, 1
                  beq x7, x12, 21f
                  li x12, 2
                  beq x7, x12, 24f
                  li x12, 3
                  beq x7, x12, 25f
                  la x12, test_done
                  jalr x0, x12, 0
                  18: mv x12, x31
                  mv x5, x22
                  addi x12, x12, 1
                  mv x31, x12
                  li x22, 16
                  ble x22, x12, 19f
                  j 0b
                  19: csrr x12, 0x747
                  andi x12, x12, 2
                  bnez x12, 27f
                  la x12, test_done
                  jalr x0, x12, 0
                  20: j 18b
                  21: mv x12, x31
                  csrr x7, 0x343
                  srli x7, x7, 2
                  bnez x12, 22f
                  bltz x7, 18b
                  j 23f
                  22: bgtu x5, x7, 18b
                  23: bleu x22, x7, 18b
                  j 26f
                  24: csrr x12, 0x343
                  srli x12, x12, 2
                  slli x7, x22, 2
                  srli x7, x7, 2
                  bne x12, x7, 18b
                  j 26f
                  25: csrr x12, 0x343
                  srli x12, x12, 2
                  srli x12, x12, 0
                  slli x12, x12, 0
                  slli x7, x22, 2
                  srli x7, x7, 2
                  srli x7, x7, 0
                  slli x7, x7, 0
                  bne x12, x7, 18b
                  j 26f
                  26: csrr x7, 0x747
                  andi x7, x7, 1
                  bnez x7, 27f
                  andi x7, x20, 128
                  bnez x7, 27f
                  j 29f
                  27: csrr x12, 0x341
                  la x7, main
                  bge x12, x7, 40f
                  la x12, test_done
                  jalr x0, x12, 0
                  40: lw x12, 0(x12)
                  li x7, 3
                  and x12, x12, x7
                  beq x12, x7, 28f
                  csrr x12, 0x341
                  addi x12, x12, 2
                  csrw 0x341, x12
                  j 34f
                  28: csrr x12, 0x341
                  addi x12, x12, 4
                  csrw 0x341, x12
                  j 34f
                  29: ori x20, x20, 1
                  li x7, 30
                  sll x12, x31, x7
                  srl x12, x12, x7
                  slli x7, x12, 3
                  sll x20, x20, x7
                  or x17, x17, x20
                  mv x12, x31
                  srli x12, x12, 2
                  beqz x12, 30f
                  li x7, 1
                  beq x12, x7, 31f
                  li x7, 2
                  beq x12, x7, 32f
                  li x7, 3
                  beq x12, x7, 33f
                  30: csrw 0x3a0, x17
                  j 34f
                  31: csrw 0x3a1, x17
                  j 34f
                  32: csrw 0x3a2, x17
                  j 34f
                  33: csrw 0x3a3, x17
                  34: nop
                  add x19, x26, zero
                  lw  x1, 4(x19)
                  lw  x2, 8(x19)
                  lw  x3, 12(x19)
                  lw  x4, 16(x19)
                  lw  x5, 20(x19)
                  lw  x6, 24(x19)
                  lw  x7, 28(x19)
                  lw  x8, 32(x19)
                  lw  x9, 36(x19)
                  lw  x10, 40(x19)
                  lw  x11, 44(x19)
                  lw  x12, 48(x19)
                  lw  x13, 52(x19)
                  lw  x14, 56(x19)
                  lw  x15, 60(x19)
                  lw  x16, 64(x19)
                  lw  x17, 68(x19)
                  lw  x18, 72(x19)
                  lw  x19, 76(x19)
                  lw  x20, 80(x19)
                  lw  x21, 84(x19)
                  lw  x22, 88(x19)
                  lw  x23, 92(x19)
                  lw  x24, 96(x19)
                  lw  x25, 100(x19)
                  lw  x26, 104(x19)
                  lw  x27, 108(x19)
                  lw  x28, 112(x19)
                  lw  x29, 116(x19)
                  lw  x30, 120(x19)
                  lw  x31, 124(x19)
                  addi x19, x19, 128
                  add x26, x19, zero
                  lw  x19, (x26)
                  addi x26, x26, 4
                  mret

store_fault_handler:
                  li x22, 0x8ffffffc
                  li x12, 0xc
                  slli x12, x12, 8
                  addi x12, x12, 0x0
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x342
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x342
                  sw x12, 0(x22)
                  li x12, 0
                  mv x31, x12
                  li x5, 0
                  0: mv x12, x31
                  mv x7, x12
                  li x7, 0
                  beq x12, x7, 1f
                  li x7, 1
                  beq x12, x7, 2f
                  li x7, 2
                  beq x12, x7, 3f
                  li x7, 3
                  beq x12, x7, 4f
                  li x7, 4
                  beq x12, x7, 5f
                  li x7, 5
                  beq x12, x7, 6f
                  li x7, 6
                  beq x12, x7, 7f
                  li x7, 7
                  beq x12, x7, 8f
                  li x7, 8
                  beq x12, x7, 9f
                  li x7, 9
                  beq x12, x7, 10f
                  li x7, 10
                  beq x12, x7, 11f
                  li x7, 11
                  beq x12, x7, 12f
                  li x7, 12
                  beq x12, x7, 13f
                  li x7, 13
                  beq x12, x7, 14f
                  li x7, 14
                  beq x12, x7, 15f
                  li x7, 15
                  beq x12, x7, 16f
                  1: csrr x22, 0x3b0
                  csrr x17, 0x3a0
                  j 17f
                  2: csrr x22, 0x3b1
                  csrr x17, 0x3a0
                  j 17f
                  3: csrr x22, 0x3b2
                  csrr x17, 0x3a0
                  j 17f
                  4: csrr x22, 0x3b3
                  csrr x17, 0x3a0
                  j 17f
                  5: csrr x22, 0x3b4
                  csrr x17, 0x3a1
                  j 17f
                  6: csrr x22, 0x3b5
                  csrr x17, 0x3a1
                  j 17f
                  7: csrr x22, 0x3b6
                  csrr x17, 0x3a1
                  j 17f
                  8: csrr x22, 0x3b7
                  csrr x17, 0x3a1
                  j 17f
                  9: csrr x22, 0x3b8
                  csrr x17, 0x3a2
                  j 17f
                  10: csrr x22, 0x3b9
                  csrr x17, 0x3a2
                  j 17f
                  11: csrr x22, 0x3ba
                  csrr x17, 0x3a2
                  j 17f
                  12: csrr x22, 0x3bb
                  csrr x17, 0x3a2
                  j 17f
                  13: csrr x22, 0x3bc
                  csrr x17, 0x3a3
                  j 17f
                  14: csrr x22, 0x3bd
                  csrr x17, 0x3a3
                  j 17f
                  15: csrr x22, 0x3be
                  csrr x17, 0x3a3
                  j 17f
                  16: csrr x22, 0x3bf
                  csrr x17, 0x3a3
                  j 17f
                  17: li x20, 4
                  slli x12, x31, 30
                  srli x12, x12, 30
                  sub x7, x20, x12
                  addi x7, x7, -1
                  slli x7, x7, 3
                  sll x20, x17, x7
                  slli x12, x12, 3
                  add x7, x7, x12
                  srl x20, x20, x7
                  slli x7, x20, 27
                  srli x7, x7, 30
                  beqz x7, 20f
                  li x12, 1
                  beq x7, x12, 21f
                  li x12, 2
                  beq x7, x12, 24f
                  li x12, 3
                  beq x7, x12, 25f
                  la x12, test_done
                  jalr x0, x12, 0
                  18: mv x12, x31
                  mv x5, x22
                  addi x12, x12, 1
                  mv x31, x12
                  li x22, 16
                  ble x22, x12, 19f
                  j 0b
                  19: csrr x12, 0x747
                  andi x12, x12, 2
                  bnez x12, 27f
                  la x12, test_done
                  jalr x0, x12, 0
                  20: j 18b
                  21: mv x12, x31
                  csrr x7, 0x343
                  srli x7, x7, 2
                  bnez x12, 22f
                  bltz x7, 18b
                  j 23f
                  22: bgtu x5, x7, 18b
                  23: bleu x22, x7, 18b
                  j 26f
                  24: csrr x12, 0x343
                  srli x12, x12, 2
                  slli x7, x22, 2
                  srli x7, x7, 2
                  bne x12, x7, 18b
                  j 26f
                  25: csrr x12, 0x343
                  srli x12, x12, 2
                  srli x12, x12, 0
                  slli x12, x12, 0
                  slli x7, x22, 2
                  srli x7, x7, 2
                  srli x7, x7, 0
                  slli x7, x7, 0
                  bne x12, x7, 18b
                  j 26f
                  26: csrr x7, 0x747
                  andi x7, x7, 1
                  bnez x7, 27f
                  andi x7, x20, 128
                  bnez x7, 27f
                  j 29f
                  27: csrr x12, 0x341
                  lw x12, 0(x12)
                  li x7, 3
                  and x12, x12, x7
                  beq x12, x7, 28f
                  csrr x12, 0x341
                  addi x12, x12, 2
                  csrw 0x341, x12
                  j 34f
                  28: csrr x12, 0x341
                  addi x12, x12, 4
                  csrw 0x341, x12
                  j 34f
                  29: ori x20, x20, 3
                  li x7, 30
                  sll x12, x31, x7
                  srl x12, x12, x7
                  slli x7, x12, 3
                  sll x20, x20, x7
                  or x17, x17, x20
                  mv x12, x31
                  srli x12, x12, 2
                  beqz x12, 30f
                  li x7, 1
                  beq x12, x7, 31f
                  li x7, 2
                  beq x12, x7, 32f
                  li x7, 3
                  beq x12, x7, 33f
                  30: csrw 0x3a0, x17
                  j 34f
                  31: csrw 0x3a1, x17
                  j 34f
                  32: csrw 0x3a2, x17
                  j 34f
                  33: csrw 0x3a3, x17
                  34: nop
                  add x19, x26, zero
                  lw  x1, 4(x19)
                  lw  x2, 8(x19)
                  lw  x3, 12(x19)
                  lw  x4, 16(x19)
                  lw  x5, 20(x19)
                  lw  x6, 24(x19)
                  lw  x7, 28(x19)
                  lw  x8, 32(x19)
                  lw  x9, 36(x19)
                  lw  x10, 40(x19)
                  lw  x11, 44(x19)
                  lw  x12, 48(x19)
                  lw  x13, 52(x19)
                  lw  x14, 56(x19)
                  lw  x15, 60(x19)
                  lw  x16, 64(x19)
                  lw  x17, 68(x19)
                  lw  x18, 72(x19)
                  lw  x19, 76(x19)
                  lw  x20, 80(x19)
                  lw  x21, 84(x19)
                  lw  x22, 88(x19)
                  lw  x23, 92(x19)
                  lw  x24, 96(x19)
                  lw  x25, 100(x19)
                  lw  x26, 104(x19)
                  lw  x27, 108(x19)
                  lw  x28, 112(x19)
                  lw  x29, 116(x19)
                  lw  x30, 120(x19)
                  lw  x31, 124(x19)
                  addi x19, x19, 128
                  add x26, x19, zero
                  lw  x19, (x26)
                  addi x26, x26, 4
                  mret

.align 2
main:             sub          t4, s0, s9
                  div          s5, sp, a7
                  mulh         a3, ra, a4
                  c.nop
                  c.or         a4, a0
                  c.mv         a6, s1
                  divu         s0, t3, t0
                  csrrc        t3, 0x340, t4
                  sub          t4, zero, s3
                  c.slli       t3, 22
                  srli         t6, t1, 20
                  sra          s9, a0, t6
                  sra          t0, a1, s0
                  sll          s4, a4, a3
                  csrrsi       tp, 0x340, 0
                  c.addi       a0, 22
                  c.or         a4, a4
                  srl          a2, t3, s3
                  srai         t3, a5, 14
                  addi         t3, s0, 437
                  csrrw        ra, 0x340, s6
                  add          s11, a3, a5
                  csrrci       t6, 0x340, 0
                  c.sub        a0, a1
                  c.srai       a2, 22
                  sltiu        s8, tp, 860
                  andi         s6, s5, -962
                  csrrw        s7, 0x340, s3
                  csrrs        s2, 0x340, s0
                  c.lui        t3, 23
                  sub          a6, t0, s1
                  c.add        sp, t5
                  c.addi       a3, 6
                  mulhu        a4, t1, a5
                  nop
                  sltu         s1, a5, s9
                  c.nop
                  srai         t6, zero, 24
                  csrrsi       t4, 0x340, 0
                  c.slli       a6, 3
                  div          sp, s11, s4
                  c.sub        a4, a3
                  c.and        a5, a5
                  sltiu        a7, a4, 1705
                  mul          s11, a7, s2
                  c.li         a7, -1
                  slt          s7, s8, s0
                  srl          a2, a0, t6
                  c.addi16sp   sp, 128
                  c.nop
                  xor          a1, a2, a4
                  slti         a4, a5, -15
                  mulh         s2, s1, a6
                  csrrci       a2, 0x340, 0
                  c.sub        a2, a0
                  addi         zero, a3, -497
                  div          s7, t2, s0
                  csrrs        a6, 0x340, zero
                  srli         a4, s0, 25
                  csrrw        gp, 0x340, tp
                  addi         t0, s10, -1009
                  nop
                  slti         a1, zero, -500
                  c.addi16sp   sp, 96
                  srai         s0, s6, 22
                  csrrc        s9, 0x340, zero
                  slli         t6, s1, 3
                  xori         t5, sp, 287
                  sltiu        s6, s4, -424
                  remu         t0, a6, s5
                  slti         zero, s2, -301
                  remu         t1, a3, t2
                  divu         a3, s9, t2
                  c.srli       a0, 20
                  c.srai       a1, 2
                  remu         a0, s2, t4
                  srli         s2, s8, 25
                  sltu         t6, s7, a7
                  c.add        gp, s8
                  csrrsi       zero, 0x340, 0
                  c.srli       s1, 20
                  remu         s2, s4, t2
                  divu         ra, s8, s2
                  andi         sp, sp, 1785
                  add          s2, a2, t4
                  mul          a3, zero, s9
                  auipc        sp, 799406
                  c.nop
                  srl          s2, t0, s4
                  csrrs        gp, 0x340, zero
                  andi         s5, t2, -1063
                  c.addi4spn   s1, sp, 48
                  slt          a3, s4, t1
                  auipc        t1, 639987
                  c.slli       s11, 20
                  sltu         sp, s7, a5
                  auipc        s4, 864936
                  ori          s4, s10, -833
                  c.andi       a0, 3
                  divu         zero, s2, a0
                  c.addi       t1, 26
                  c.xor        s1, a1
                  csrrc        zero, 0x340, zero
                  c.and        s0, a4
                  c.sub        a3, a5
                  ori          a7, a5, 599
                  c.slli       s8, 30
                  xori         a1, zero, 1076
                  sub          t5, s2, s0
                  auipc        a4, 877524
                  sltiu        t0, s11, 501
                  mulhsu       s5, a3, s4
                  add          a2, a3, s1
                  slt          a1, s6, gp
                  and          s9, a3, t3
                  c.lui        t4, 15
                  and          s2, s7, s1
                  ori          s2, a5, -796
                  slli         tp, zero, 3
                  csrrsi       s9, 0x340, 0
                  c.srli       s1, 17
                  csrrci       gp, 0x340, 0
                  divu         s4, s2, zero
                  csrrsi       s4, 0x340, 0
                  sll          s5, t1, t5
                  addi         sp, a1, 1798
                  c.srai       s1, 2
                  srl          ra, a2, a3
                  c.sub        s0, a4
                  c.slli       s6, 13
                  nop
                  srl          s5, tp, a6
                  c.addi16sp   sp, -16
                  mulhsu       a7, a0, a3
                  c.srli       a4, 21
                  c.and        a4, a0
                  and          s2, a6, a5
                  mulhu        ra, t6, t2
                  lui          tp, 996244
                  c.addi16sp   sp, -16
                  addi         a0, zero, 487
                  and          zero, t0, a1
                  csrrsi       a4, 0x340, 29
                  csrrsi       s8, 0x340, 4
                  or           s6, a7, a6
                  c.addi       a2, 8
                  andi         a5, t4, 1559
                  mulhsu       zero, a6, a2
                  c.and        a5, s1
                  srai         ra, s11, 23
                  csrrwi       t0, 0x340, 31
                  c.addi       a0, -1
                  xori         s8, t5, -553
                  c.li         a0, 7
                  c.srli       a4, 14
                  nop
                  mulh         gp, t2, t0
                  csrrw        a7, 0x340, t0
                  srai         a5, t2, 25
                  add          s4, t1, s11
                  srai         zero, s8, 16
                  c.slli       s8, 18
                  c.nop
                  c.and        a0, s0
                  csrrsi       s1, 0x340, 15
                  auipc        s0, 863389
                  mulhu        a5, a6, s7
                  csrrsi       sp, 0x340, 0
                  ori          tp, s0, 1916
                  div          a2, s0, s10
                  c.slli       s1, 16
                  addi         a3, ra, 1556
                  addi         t6, t0, 1207
                  c.andi       a5, 0
                  remu         a4, a3, s4
                  mul          t4, sp, tp
                  ori          a7, t2, -1456
                  auipc        a4, 192517
                  c.andi       s0, -1
                  sltiu        t1, a7, -363
                  sra          a4, t2, t4
                  c.mv         a5, s1
                  remu         t3, gp, a2
                  rem          s2, a7, a7
                  c.xor        s1, a3
                  and          sp, t3, s1
                  mulh         t4, s11, s6
                  c.or         a5, a0
                  csrrsi       t0, 0x340, 0
                  mulhsu       zero, zero, t2
                  c.andi       s1, 31
                  c.sub        s1, s1
                  slli         sp, gp, 30
                  rem          t3, s9, s9
                  and          a3, t4, s2
                  mulhu        t1, t0, ra
                  slti         t0, s7, 1459
                  c.lui        t0, 18
                  c.or         a3, a2
                  auipc        tp, 954550
                  andi         a5, tp, -727
                  c.xor        s0, a3
                  c.li         t0, -1
                  csrrc        zero, 0x340, zero
                  srli         s0, sp, 11
                  divu         zero, s4, t0
                  c.li         a7, 26
                  srl          ra, a4, t3
                  c.addi4spn   a3, sp, 976
                  xori         tp, s9, -395
                  mul          s0, s4, s4
                  c.sub        s1, a2
                  csrrsi       s9, 0x340, 11
                  slli         s8, s3, 1
                  csrrs        zero, 0x340, zero
                  sra          a0, t6, s0
                  xori         t1, s6, 1262
                  c.or         a2, a5
                  mulhu        s11, a2, a5
                  c.nop
                  slti         t1, a7, -1314
                  csrrwi       a6, 0x340, 21
                  c.addi4spn   s1, sp, 688
                  sll          s6, ra, a4
                  c.lui        t0, 1
                  c.sub        a4, a2
                  c.or         a2, s0
                  c.or         a5, a0
                  c.srli       s0, 2
                  csrrci       s6, 0x340, 0
                  c.sub        a1, s1
                  csrrc        s0, 0x340, zero
                  slli         a4, a7, 10
                  c.slli       s5, 26
                  c.lui        s2, 15
                  c.mv         t5, s7
                  sll          a2, s10, s1
                  add          t3, a6, tp
                  c.addi16sp   sp, -16
                  c.xor        a4, s0
                  or           sp, zero, sp
                  c.srli       a0, 9
                  c.srai       a3, 4
                  lui          a6, 820979
                  c.nop
                  csrrc        s0, 0x340, zero
                  c.addi4spn   a4, sp, 176
                  c.nop
                  csrrwi       t5, 0x340, 15
                  csrrs        t5, 0x340, t3
                  c.srli       a2, 2
                  xori         a6, s7, 1195
                  rem          s1, s1, s6
                  c.and        a3, a4
                  sll          t6, sp, a0
                  xori         gp, a0, -51
                  sra          a5, gp, s1
                  xori         a7, ra, 1445
                  c.addi       a7, -1
                  sltu         t4, s3, s8
                  c.addi16sp   sp, 256
                  srli         t1, t5, 25
                  ori          s6, t1, 1166
                  slti         t6, s3, -270
                  c.mv         tp, t4
                  csrrc        t3, 0x340, zero
                  mulhsu       s5, t1, s8
                  slti         a2, a0, -188
                  c.slli       a2, 11
                  sra          s4, s0, s8
                  add          t1, gp, a4
                  srai         a1, a6, 1
                  sltu         a2, a4, s10
                  div          gp, a7, s11
                  add          a7, t6, a2
                  csrrci       s9, 0x340, 0
                  xor          t5, t6, t1
                  ori          t4, s8, -1624
                  auipc        a0, 536698
                  c.and        a4, a0
                  mulhu        s9, s3, s10
                  slti         gp, ra, 1403
                  sub          s7, ra, s0
                  add          s5, tp, s11
                  c.xor        a4, a4
                  mulh         tp, a3, t5
                  c.add        s1, s8
                  divu         a6, zero, a1
                  csrrw        s2, 0x340, s1
                  csrrci       s9, 0x340, 0
                  xor          t6, t1, a4
                  c.li         a0, 27
                  srl          a6, a7, t0
                  srl          s2, s3, a0
                  nop
                  sra          t3, s0, gp
                  slt          s5, s1, gp
                  mulhu        a4, s7, a7
                  c.mv         s0, s6
                  mul          t3, s6, s4
                  c.and        a4, a4
                  csrrci       t5, 0x340, 24
                  sll          tp, s1, s8
                  c.lui        a3, 22
                  xori         a2, s8, 1688
                  c.nop
                  mulhsu       tp, a1, gp
                  c.nop
                  srai         a5, a7, 17
                  mulh         s1, s2, a0
                  c.slli       t3, 19
                  sltu         t6, a6, t4
                  mulhsu       a4, a5, a0
                  c.slli       a4, 17
                  csrrci       a0, 0x340, 24
                  csrrwi       a1, 0x340, 5
                  sltu         s7, s11, s5
                  mulhsu       a0, zero, s10
                  c.mv         ra, t0
                  mul          a0, a5, s2
                  c.or         a4, a5
                  c.nop
                  or           a0, s9, a5
                  or           s4, s8, s9
                  c.mv         sp, a6
                  slli         t0, s4, 0
                  sll          a5, sp, a3
                  addi         a0, a2, -457
                  c.andi       s1, 24
                  c.andi       s0, 10
                  rem          sp, s1, s10
                  sll          tp, t2, s9
                  c.srli       a1, 16
                  c.addi16sp   sp, -16
                  csrrs        t1, 0x340, a7
                  c.lui        a7, 15
                  rem          s8, a5, a0
                  c.srai       s1, 19
                  slt          s2, ra, s4
                  c.addi16sp   sp, 448
                  andi         s4, s10, 1736
                  c.srai       a2, 6
                  sltiu        t6, t1, -1572
                  lui          t4, 90121
                  div          s4, t6, a1
                  divu         a2, a1, a5
                  add          gp, s7, s4
                  andi         s8, a4, 767
                  divu         a2, s3, s11
                  nop
                  and          s2, t2, s5
                  auipc        a0, 265822
                  mulhu        s5, a1, t6
                  srli         s2, s3, 6
                  c.srli       a2, 1
                  mul          t1, gp, s5
                  csrrsi       a5, 0x340, 0
                  c.mv         s8, gp
                  mulhsu       zero, s7, a3
                  sra          a7, t3, s7
                  c.slli       s11, 15
                  c.li         t3, -1
                  rem          s1, a7, s2
                  addi         s8, a4, 242
                  div          a1, t2, a3
                  c.lui        s6, 4
                  or           a6, a4, a6
                  c.or         a4, a0
                  addi         a0, t6, 914
                  addi         s1, t5, 1776
                  csrrc        a3, 0x340, zero
                  c.srli       a2, 7
                  mulhu        s9, s10, s5
                  csrrsi       t6, 0x340, 0
                  csrrwi       t6, 0x340, 20
                  c.sub        a1, s0
                  csrrs        t0, 0x340, s9
                  andi         gp, a1, 234
                  c.sub        s0, a2
                  srli         zero, s0, 26
                  xori         s0, a7, 1807
                  c.andi       a3, -1
                  sltu         a3, t6, t0
                  c.add        t5, a0
                  addi         a6, s0, -1811
                  slli         s8, a4, 19
                  srl          tp, a0, zero
                  c.nop
                  csrrw        a0, 0x340, s8
                  csrrci       ra, 0x340, 0
                  or           sp, s1, sp
                  csrrci       t4, 0x340, 0
                  c.addi       a7, 17
                  auipc        s4, 409975
                  c.srai       a3, 24
                  slli         gp, a5, 18
                  mulhsu       ra, ra, t3
                  or           s4, s5, s5
                  srl          zero, s5, s0
                  c.add        s5, sp
                  c.xor        a3, a1
                  andi         t0, t3, 579
                  andi         s4, s7, -733
                  sltiu        t0, sp, -1887
                  c.slli       s0, 3
                  srli         a7, t0, 7
                  sltu         sp, a6, t5
                  c.or         a2, a1
                  xori         ra, t4, -678
                  c.addi16sp   sp, 240
                  c.li         a4, 29
                  nop
                  c.nop
                  ori          a6, a7, 1739
                  slti         tp, s8, 656
                  xor          t6, t6, gp
                  srl          s7, a1, t1
                  csrrc        t5, 0x340, gp
                  addi         s11, s4, -1565
                  or           s6, a4, t3
                  sra          sp, t1, t0
                  c.or         s1, a3
                  sub          s9, t4, s1
                  srl          s0, t5, s8
                  c.srli       s1, 30
                  mulh         a4, s11, s10
                  and          s2, s5, a4
                  xor          s7, a0, s10
                  c.slli       a2, 28
                  slt          zero, t5, s11
                  sltu         a1, a2, a4
                  xor          tp, t5, a2
                  c.srli       a4, 8
                  c.srai       s1, 29
                  csrrs        a1, 0x340, zero
                  addi         a3, a4, -1170
                  c.andi       s1, 7
                  c.xor        s1, a1
                  and          t4, zero, s11
                  sltu         a7, s2, s0
                  c.addi       a6, 14
                  c.srai       a0, 4
                  srai         t3, gp, 11
                  csrrci       s11, 0x340, 0
                  csrrs        s6, 0x340, a1
                  c.add        ra, s11
                  c.slli       t3, 3
                  c.andi       a4, -1
                  srli         t4, t4, 29
                  slt          t6, s1, zero
                  c.addi4spn   s1, sp, 624
                  divu         a5, s6, gp
                  and          a5, t4, a4
                  c.lui        s2, 30
                  xori         a3, s6, 694
                  divu         a4, s4, tp
                  xori         t0, s11, 501
                  sub          t6, t5, t2
                  c.andi       a3, 16
                  slti         t5, a0, -1635
                  c.lui        t5, 18
                  c.add        sp, s8
                  mul          a6, a7, t3
                  csrrc        sp, 0x340, sp
                  csrrwi       zero, 0x340, 6
                  csrrc        t4, 0x340, s7
                  sll          s9, a2, s5
                  mulhu        a3, s5, a3
                  mulhu        s5, s6, zero
                  and          t6, s6, s5
                  divu         t6, s9, s6
                  c.andi       a4, -1
                  auipc        ra, 386409
                  mulh         ra, a0, a3
                  c.addi       a7, 7
                  csrrc        a6, 0x340, zero
                  sltiu        s1, t6, -1744
                  csrrsi       s8, 0x340, 0
                  sra          s8, s1, s8
                  rem          t5, a7, t5
                  add          t0, a3, s4
                  csrrw        s1, 0x340, s6
                  srai         ra, s4, 22
                  lui          zero, 94823
                  add          a7, zero, s11
                  srl          t1, s11, t4
                  xor          gp, s10, a2
                  c.slli       a5, 17
                  mulhsu       a0, s7, ra
                  slt          a2, s10, s0
                  c.srli       a3, 29
                  mulhsu       a1, t4, a2
                  c.or         a4, a1
                  xori         a3, sp, 163
                  csrrs        s4, 0x340, zero
                  c.addi16sp   sp, 96
                  rem          a1, zero, s5
                  sltiu        s2, gp, 1118
                  c.srli       s1, 7
                  srai         ra, zero, 12
                  sll          t6, a6, gp
                  srl          sp, s7, a1
                  csrrw        t5, 0x340, s3
                  lui          s5, 44330
                  ori          t1, s11, 1927
                  c.lui        gp, 29
                  auipc        a4, 451754
                  div          s6, s2, tp
                  ori          s9, s7, 1536
                  c.andi       s0, 3
                  nop
                  c.nop
                  c.li         s7, 5
                  mulhsu       t6, a7, gp
                  ori          s11, s9, 954
                  c.addi4spn   s0, sp, 864
                  c.li         tp, -1
                  csrrc        a4, 0x340, zero
                  sltu         gp, tp, t0
                  rem          s8, s1, s3
                  c.nop
                  csrrsi       t0, 0x340, 28
                  c.addi       t3, 4
                  c.li         a6, -1
                  csrrsi       s2, 0x340, 0
                  c.andi       s1, -1
                  sra          t4, zero, s4
                  csrrw        s0, 0x340, t5
                  srl          gp, s0, t1
                  andi         a2, s11, -830
                  xor          a0, s9, a2
                  c.addi16sp   sp, 496
                  csrrci       s0, 0x340, 0
                  c.andi       s0, 12
                  srli         t3, s5, 27
                  auipc        a3, 423122
                  div          a2, t5, s10
                  or           s4, s4, t4
                  mulhu        s1, gp, s4
                  rem          a7, s3, gp
                  remu         a4, t3, a5
                  xori         a6, sp, 1165
                  srai         t4, a3, 8
                  xor          s2, tp, a4
                  c.nop
                  sltiu        a5, a3, -244
                  mul          zero, a5, a6
                  auipc        s0, 778307
                  sltiu        t6, s10, 1159
                  ori          s0, a3, 98
                  c.lui        s1, 9
                  xor          a6, tp, s7
                  csrrw        a4, 0x340, t5
                  csrrsi       a6, 0x340, 12
                  mul          s11, a0, t3
                  c.andi       a1, 24
                  csrrsi       t6, 0x340, 0
                  c.srli       a0, 30
                  c.nop
                  mul          t1, t2, t1
                  c.mv         a4, t5
                  srai         s9, a5, 3
                  add          t6, s4, tp
                  csrrc        t6, 0x340, zero
                  srli         s1, t5, 29
                  add          s7, a3, ra
                  c.and        a0, a3
                  remu         t1, s4, s5
                  auipc        ra, 743769
                  div          gp, s2, s9
                  slt          t0, a7, s3
                  c.xor        a3, s0
                  sll          t3, s3, t0
                  c.li         a1, -1
                  mulhsu       ra, s5, s6
                  ori          ra, zero, 531
                  ori          a7, a1, -1689
                  xor          gp, t1, s11
                  c.addi16sp   sp, -16
                  csrrc        t5, 0x340, zero
                  auipc        a0, 56022
                  nop
                  csrrc        s5, 0x340, zero
                  c.addi16sp   sp, 256
                  srli         s9, t0, 3
                  or           a6, ra, sp
                  mul          sp, s1, t0
                  c.add        s1, s10
                  divu         a2, a3, s6
                  c.xor        s1, a3
                  c.sub        a3, a3
                  nop
                  csrrw        a6, 0x340, s3
                  sll          a0, s7, a1
                  csrrsi       gp, 0x340, 0
                  sltu         a0, a6, s10
                  c.addi16sp   sp, -16
                  srli         t3, t2, 21
                  sltu         t5, t0, t5
                  mulh         a7, t0, s4
                  csrrs        s4, 0x340, t0
                  c.mv         tp, a4
                  srl          s9, a5, t3
                  c.addi16sp   sp, -16
                  mulhsu       ra, t5, s3
                  c.add        t3, s0
                  srai         t6, a1, 22
                  nop
                  and          a3, a6, t0
                  or           t3, s0, s10
                  sub          t5, s3, s6
                  csrrsi       s0, 0x340, 5
                  srai         gp, a0, 28
                  c.addi       a3, -1
                  mulhsu       t5, a7, a3
                  sra          s2, s6, sp
                  srli         a0, gp, 19
                  slti         t0, t4, 350
                  srli         t1, a3, 18
                  srl          s0, s4, gp
                  divu         a1, a1, a6
                  csrrsi       sp, 0x340, 0
                  sub          s4, t3, a2
                  sra          a0, a5, t0
                  remu         sp, s1, t5
                  sub          t1, a6, s1
                  c.mv         a0, s9
                  lui          s6, 669046
                  srli         s5, s0, 23
                  sub          s2, s0, t2
                  auipc        a1, 156193
                  rem          a1, s8, gp
                  c.mv         ra, s4
                  sra          s7, s7, s4
                  sra          t5, s11, t5
                  c.addi       s0, 26
                  mulhsu       gp, s5, a0
                  sub          t0, s7, s10
                  csrrwi       s6, 0x340, 2
                  slli         t6, s6, 31
                  c.li         a5, -1
                  c.mv         s4, a0
                  mulhsu       a4, a3, zero
                  c.addi       a6, 7
                  csrrs        zero, 0x340, a5
                  csrrc        t1, 0x340, zero
                  sltiu        a3, t3, 861
                  srai         s1, s7, 25
                  csrrc        t0, 0x340, zero
                  sra          s8, t6, a3
                  lui          a3, 236978
                  c.mv         s4, t3
                  ori          gp, s0, -1077
                  c.srli       s1, 24
                  ori          a6, sp, -1001
                  c.xor        s1, a5
                  sra          s9, zero, a2
                  xori         s7, t5, 138
                  c.nop
                  sra          s6, s5, a5
                  sltu         ra, t1, s3
                  srl          t4, gp, a7
                  mulhsu       tp, tp, t6
                  csrrc        a3, 0x340, zero
                  add          t0, s5, s7
                  rem          gp, s11, zero
                  slti         t3, t5, 840
                  rem          t0, s8, s10
                  c.and        a0, a5
                  or           s0, s7, t2
                  c.addi4spn   a4, sp, 272
                  srl          a0, a3, t3
                  xor          gp, t4, s8
                  slt          s0, a2, s7
                  srl          zero, s2, s9
                  c.mv         gp, sp
                  slti         a6, t0, -1648
                  srl          s4, a3, a0
                  c.mv         s1, t3
                  c.addi4spn   a3, sp, 368
                  xor          a0, s9, s4
                  c.slli       s6, 16
                  c.nop
                  slt          s2, t5, zero
                  xori         s7, t1, 68
                  sub          a2, a6, a1
                  divu         gp, a2, a7
                  c.add        a5, sp
                  srl          a5, t0, a5
                  c.andi       a1, -1
                  c.add        t1, a7
                  slli         t3, a2, 30
                  divu         s1, ra, s4
                  remu         tp, a4, s0
                  sra          s1, a1, s7
                  add          a5, a0, s0
                  sub          sp, t5, zero
                  slt          a4, s11, s10
                  csrrc        ra, 0x340, t1
                  c.nop
                  c.lui        s1, 21
                  mulhu        a7, a2, s3
                  divu         s8, a6, s9
                  mul          t0, s1, a2
                  sub          s11, t2, a6
                  remu         s2, t1, s2
                  rem          t1, s8, a5
                  srli         gp, s7, 19
                  auipc        a5, 971544
                  div          s2, s5, s10
                  csrrc        s0, 0x340, t5
                  c.andi       s1, 11
                  c.or         a0, a4
                  c.addi       t4, -1
                  csrrs        s2, 0x340, s3
                  and          gp, a0, s8
                  mul          s4, s3, a6
                  csrrci       t5, 0x340, 16
                  remu         gp, tp, a6
                  c.nop
                  csrrwi       gp, 0x340, 31
                  auipc        s9, 845195
                  sltiu        s11, a5, -820
                  csrrw        s8, 0x340, s5
                  c.addi16sp   sp, -16
                  c.slli       ra, 1
                  sltu         s0, s4, t0
                  csrrs        zero, 0x340, s10
                  slli         s8, tp, 22
                  c.mv         s7, s10
                  csrrwi       a0, 0x340, 7
                  and          s0, s0, t0
                  c.slli       s5, 9
                  c.or         a2, a4
                  xor          t0, s1, gp
                  sltiu        a7, sp, 1700
                  andi         t3, zero, -1967
                  nop
                  slli         s11, a1, 31
                  ori          a2, s7, -446
                  srai         a5, a7, 15
                  sra          s4, t5, a1
                  sra          s9, a4, s4
                  slti         s1, s8, -207
                  c.add        s9, ra
                  addi         s1, t0, -103
                  c.nop
                  csrrw        s0, 0x340, a6
                  sub          t4, a2, tp
                  addi         a5, a4, -97
                  csrrci       s9, 0x340, 12
                  andi         s1, s1, 309
                  c.sub        a5, s1
                  lui          a2, 781111
                  c.addi       a5, 19
                  xor          a0, s3, a6
                  csrrs        s1, 0x340, a6
                  c.xor        a5, a0
                  sltu         t5, s10, t6
                  remu         a1, t4, sp
                  sub          a6, s10, t5
                  c.lui        ra, 25
                  c.xor        a4, a4
                  c.li         s1, 29
                  rem          s7, t3, zero
                  c.xor        a5, a3
                  c.mv         a5, t4
                  c.andi       a4, -1
                  slli         s4, s1, 22
                  csrrw        s2, 0x340, t2
                  csrrs        s11, 0x340, zero
                  sra          a6, s5, s0
                  csrrsi       s8, 0x340, 7
                  xor          s4, a7, t2
                  div          s5, t6, gp
                  c.xor        s1, s1
                  c.and        a2, a1
                  and          gp, t0, s11
                  add          a5, ra, tp
                  andi         s11, a3, -657
                  nop
                  lui          t1, 792354
                  c.nop
                  c.mv         a7, s5
                  lui          ra, 595927
                  c.sub        a2, a2
                  slt          a5, s4, t1
                  srl          t3, a7, t5
                  xori         sp, t5, 265
                  csrrs        tp, 0x340, zero
                  slt          a4, s2, a2
                  remu         t4, a2, t5
                  csrrs        s7, 0x340, s11
                  c.lui        a3, 13
                  sub          t3, t2, a0
                  c.sub        a2, s1
                  remu         s4, a5, t0
                  slli         t6, s0, 31
                  csrrs        t0, 0x340, zero
                  csrrw        s6, 0x340, s8
                  csrrci       tp, 0x340, 0
                  c.addi4spn   a1, sp, 848
                  csrrci       a0, 0x340, 0
                  xor          s0, s7, s8
                  mulhsu       s6, a1, zero
                  slti         a1, s0, 1860
                  div          t5, t1, s11
                  andi         a7, t6, 593
                  xor          t6, s2, t5
                  addi         tp, t6, 1124
                  remu         a4, t1, a4
                  mulhsu       s9, tp, a7
                  div          tp, s8, s11
                  add          s2, a7, a1
                  c.slli       t5, 7
                  mulhsu       a1, a4, a3
                  sltu         a1, t2, sp
                  c.li         t5, -1
                  sltiu        t0, s11, -781
                  rem          zero, sp, t1
                  csrrsi       s7, 0x340, 0
                  slti         t3, s7, 1057
                  c.xor        a5, a4
                  nop
                  rem          s9, zero, s5
                  srl          ra, s6, s4
                  rem          t3, a0, s1
                  c.li         sp, 16
                  srli         a5, t0, 5
                  c.srli       s0, 29
                  nop
                  xor          t5, t0, t0
                  c.mv         s11, a7
                  c.slli       t4, 22
                  srai         ra, s8, 19
                  sra          ra, s11, a7
                  ori          zero, s7, -1662
                  c.addi4spn   a0, sp, 496
                  rem          s8, sp, s2
                  csrrw        a5, 0x340, a3
                  sra          s5, zero, t0
                  div          t1, ra, s0
                  sll          a5, ra, s0
                  srl          s11, s3, a1
                  csrrci       t1, 0x340, 0
                  div          tp, zero, t1
                  rem          a3, s10, s11
                  rem          s7, s10, s10
                  c.slli       t6, 27
                  sra          a2, ra, gp
                  csrrc        t3, 0x340, zero
                  c.slli       a1, 11
                  c.xor        a0, s1
                  c.addi       s11, -1
                  srai         a7, s0, 18
                  c.lui        s7, 29
                  c.add        s2, a1
                  csrrwi       s1, 0x340, 21
                  c.addi4spn   a3, sp, 896
                  c.nop
                  c.srai       a5, 26
                  lui          sp, 666540
                  xori         sp, a3, -1336
                  slli         s7, a3, 19
                  rem          tp, a5, ra
                  csrrwi       t6, 0x340, 18
                  ori          s0, a0, 914
                  remu         t1, s1, gp
                  c.addi4spn   a1, sp, 528
                  auipc        t6, 50454
                  c.addi4spn   a3, sp, 112
                  c.srli       a3, 13
                  c.srli       a3, 31
                  c.addi16sp   sp, 208
                  c.nop
                  sra          s8, a6, s9
                  c.lui        t4, 22
                  rem          a1, t2, t0
                  csrrc        a6, 0x340, s10
                  c.addi       t5, -1
                  c.xor        a3, s1
                  ori          s9, a1, -1136
                  c.and        s0, a0
                  auipc        gp, 135975
                  csrrsi       s7, 0x340, 0
                  c.sub        s1, a3
                  c.addi16sp   sp, 448
                  sltiu        s6, tp, 1159
                  add          s1, a1, t6
                  or           t1, t6, s4
                  c.srai       a0, 20
                  mulhu        a3, s2, a3
                  divu         zero, a4, s7
                  auipc        a6, 761720
                  lui          gp, 104450
                  csrrwi       a0, 0x340, 12
                  mulhu        s6, s6, tp
                  ori          tp, s0, 1844
                  add          s1, s4, a6
                  slt          t4, s2, a3
                  slt          a7, s9, t6
                  or           a0, s5, a3
                  sltu         a2, t5, s7
                  sltiu        s8, t2, -2
                  c.srai       s1, 28
                  remu         tp, t0, zero
                  srl          a0, a7, a3
                  nop
                  addi         s7, a1, -720
                  mulhu        t1, s7, s5
                  auipc        t1, 981557
                  c.mv         s2, a0
                  c.slli       t5, 18
                  xori         a7, s1, -137
                  mul          s5, a6, s5
                  c.srli       s0, 13
                  c.li         t6, -1
                  csrrw        a6, 0x340, a7
                  c.li         s7, 24
                  csrrci       gp, 0x340, 0
                  andi         t4, a0, -1136
                  auipc        a2, 766443
                  c.srli       a2, 7
                  c.sub        a3, a4
                  rem          t1, s5, t2
                  srl          t5, s9, s5
                  div          gp, s6, gp
                  c.li         a3, -1
                  remu         s1, s6, sp
                  c.addi16sp   sp, -16
                  c.and        a4, a5
                  sra          s4, s5, a3
                  c.srli       a0, 21
                  sra          s0, s9, sp
                  c.add        gp, sp
                  c.xor        s1, a0
                  csrrci       s6, 0x340, 0
                  and          s4, a5, gp
                  c.xor        s0, a5
                  and          s11, s11, t2
                  c.nop
                  remu         zero, s4, s6
                  xori         a4, sp, 1080
                  csrrci       t4, 0x340, 10
                  div          s4, sp, ra
                  andi         t1, sp, 1967
                  c.addi16sp   sp, 336
                  c.addi16sp   sp, 320
                  c.slli       s6, 11
                  csrrwi       s2, 0x340, 2
                  csrrw        a7, 0x340, sp
                  or           s11, zero, gp
                  mulhsu       t6, s10, tp
                  xor          s11, zero, s1
                  csrrw        a4, 0x340, t0
                  and          a1, t4, s6
                  c.slli       s6, 2
                  sltiu        zero, s9, -1280
                  xori         tp, s4, -32
                  addi         s11, tp, -97
                  c.xor        a1, a1
                  c.lui        s11, 26
                  c.li         t4, -1
                  xor          a6, a2, a3
                  andi         t1, s7, 151
                  csrrwi       a1, 0x340, 15
                  mul          t0, sp, a1
                  sll          sp, a3, a0
                  sra          a3, t6, t0
                  xor          t6, s11, ra
                  or           a7, t5, s10
                  nop
                  csrrc        a7, 0x340, t2
                  c.sub        a0, a5
                  c.andi       s1, 25
                  rem          a4, a5, a5
                  c.andi       a1, 10
                  c.srai       a2, 10
                  csrrci       t4, 0x340, 16
                  mulh         s7, s5, t6
                  c.li         sp, -1
                  mulhu        a5, s1, t3
                  c.andi       a5, 15
                  xor          sp, s7, a0
                  sra          a4, s1, s8
                  csrrwi       sp, 0x340, 1
                  divu         s6, s10, t0
                  c.xor        a2, a4
                  div          a5, t2, s1
                  divu         a5, s10, t6
                  auipc        s9, 413004
                  c.sub        a1, s0
                  c.sub        a0, s1
                  auipc        t5, 799420
                  slti         t6, t4, 516
                  div          a0, a7, t0
                  c.andi       a3, -1
                  divu         s8, sp, s6
                  c.sub        s1, a2
                  rem          a3, a4, s9
                  c.and        a1, s1
                  c.and        s1, a5
                  remu         a3, s3, tp
                  sub          s7, a3, a6
                  srl          a1, a2, a0
                  addi         s11, s4, -568
                  c.and        a1, a3
                  sll          t5, s2, t1
                  slt          t1, s4, zero
                  xori         s9, t2, 417
                  slli         s7, s4, 29
                  addi         sp, s11, 518
                  c.slli       t5, 5
                  sltu         s1, sp, sp
                  c.sub        a3, s0
                  rem          t0, s10, t0
                  c.nop
                  slti         a6, s3, -93
                  div          s8, s7, s6
                  c.srai       a3, 10
                  addi         s1, t6, -1252
                  rem          t1, tp, a6
                  c.sub        s1, a5
                  c.or         s1, a4
                  slli         s1, s7, 25
                  csrrc        ra, 0x340, zero
                  c.andi       s0, 3
                  mulhsu       s4, a2, a3
                  add          s1, t1, s5
                  add          sp, s10, gp
                  slli         gp, s4, 28
                  xor          s9, tp, gp
                  csrrsi       tp, 0x340, 8
                  mul          t3, s8, t0
                  c.or         a0, a1
                  slli         a3, s2, 25
                  divu         s11, t5, a6
                  c.li         s5, 24
                  c.srai       a4, 14
                  csrrci       a5, 0x340, 19
                  csrrw        s2, 0x340, s2
                  srli         t1, t1, 9
                  sra          s11, sp, s11
                  srl          a0, ra, a2
                  ori          t0, s2, -1179
                  addi         tp, s8, -12
                  slti         t4, a1, 1161
                  mulhsu       sp, s9, s8
                  c.mv         a3, s7
                  div          s6, s3, ra
                  c.srli       a0, 27
                  lui          a1, 871979
                  divu         s2, a1, a6
                  slti         t4, t0, -888
                  and          ra, s8, t1
                  rem          s1, s1, t4
                  c.andi       a2, -1
                  mulh         s8, s1, s4
                  addi         a0, t2, 1514
                  srli         s1, s10, 31
                  c.add        a1, s2
                  c.sub        a4, a4
                  c.li         s4, -1
                  add          sp, t4, a7
                  mulhu        s1, a2, s7
                  sra          t4, s0, t4
                  c.add        a6, s10
                  sra          a3, a3, t6
                  srai         tp, gp, 9
                  mulhu        a7, s7, a5
                  c.mv         s7, t1
                  sltiu        s5, a7, -1127
                  c.srai       a0, 25
                  c.sub        a3, a0
                  c.srai       s1, 24
                  c.srli       s1, 8
                  c.mv         t4, s2
                  c.nop
                  c.xor        a2, a5
                  c.srli       s1, 23
                  lui          s9, 914921
                  c.li         a6, 30
                  remu         s11, t0, a1
                  and          s5, s9, s5
                  sltiu        s7, a2, 2024
                  c.addi16sp   sp, -16
                  mulh         s2, t0, a1
                  div          s5, gp, a0
                  c.srai       a5, 20
                  rem          t6, a5, s7
                  csrrwi       s4, 0x340, 13
                  xor          a1, s2, ra
                  slt          zero, s8, s1
                  remu         ra, t4, t1
                  csrrw        s8, 0x340, a6
                  ori          s11, a5, -438
                  c.andi       a5, -1
                  c.mv         t1, t5
                  lui          a6, 1047867
                  srli         s1, s1, 6
                  c.or         s0, s0
                  c.slli       s0, 22
                  slli         s5, s4, 0
                  csrrsi       ra, 0x340, 0
                  lui          t3, 998316
                  csrrwi       tp, 0x340, 23
                  sltu         s2, a6, ra
                  c.srli       s1, 13
                  remu         a4, s1, t5
                  slli         a3, a2, 21
                  and          s2, s9, s8
                  or           a4, a4, ra
                  and          gp, gp, a5
                  xori         zero, ra, 1603
                  c.or         a0, a0
                  xor          t4, s11, s3
                  remu         s0, s0, s9
                  mul          a1, t3, t2
                  c.slli       a7, 16
                  sll          s5, a7, a3
                  sra          s5, s2, a7
                  csrrc        s6, 0x340, zero
                  sltu         t5, a1, s5
                  csrrsi       t3, 0x340, 30
                  slt          s2, t3, s8
                  srai         a6, s5, 26
                  add          s4, s10, s11
                  c.sub        a3, a2
                  c.srli       a4, 9
                  c.slli       s1, 15
                  mulhsu       s0, s10, s0
                  csrrci       s4, 0x340, 0
                  sub          gp, t1, s4
                  csrrc        s0, 0x340, a1
                  mul          s5, a7, a0
                  c.xor        a1, s0
                  c.addi16sp   sp, 384
                  c.addi       a0, 25
                  csrrsi       gp, 0x340, 17
                  c.slli       s5, 7
                  remu         a1, s2, t3
                  mulh         s6, s6, s10
                  c.and        a4, s0
                  c.srli       s1, 8
                  c.slli       s1, 26
                  mul          s11, s3, s8
                  csrrci       gp, 0x340, 11
                  csrrci       t3, 0x340, 10
                  c.or         a2, a4
                  sra          s6, s5, s5
                  csrrsi       s11, 0x340, 0
                  slt          sp, t1, a1
                  rem          s8, a1, t3
                  slli         tp, t1, 22
                  or           s0, t0, s4
                  rem          t6, ra, gp
                  remu         a6, a1, gp
                  c.addi       s4, -1
                  sltu         a3, a5, s6
                  c.addi16sp   sp, 64
                  div          t5, a3, a1
                  slli         tp, s8, 28
                  xori         a1, a3, 1290
                  remu         s0, t6, a6
                  c.addi4spn   s1, sp, 240
                  csrrc        s6, 0x340, zero
                  addi         a4, a0, -1759
                  srl          a6, s11, a4
                  sub          a0, t6, tp
                  slli         a5, t3, 16
                  srai         ra, t0, 6
                  csrrs        s11, 0x340, sp
                  c.mv         t6, a4
                  srl          a7, t4, t1
                  sltu         s0, t4, a1
                  addi         tp, s8, -215
                  csrrci       a2, 0x340, 0
                  c.srai       s1, 8
                  or           a1, a6, s4
                  c.xor        a3, a3
                  addi         s9, gp, -701
                  csrrsi       a2, 0x340, 18
                  c.li         ra, 0
                  c.addi       s0, 30
                  sra          t4, a1, a7
                  c.srli       a2, 27
                  sltiu        s7, s8, -1848
                  mulh         a5, s9, s1
                  c.slli       t5, 21
                  c.nop
                  c.srai       a4, 11
                  sub          a7, ra, t4
                  c.and        s1, a3
                  lui          a5, 293686
                  srl          a7, s7, gp
                  c.nop
                  c.li         ra, -1
                  remu         a2, t6, s11
                  rem          s11, a4, s8
                  c.nop
                  xori         s11, s10, 406
                  sltiu        t5, s1, -1189
                  mulhsu       s8, a2, t2
                  sltiu        t0, s6, -1152
                  c.and        a1, a1
                  csrrci       t3, 0x340, 14
                  addi         t1, ra, 561
                  c.sub        a0, a4
                  csrrs        t1, 0x340, t5
                  rem          s11, t6, s11
                  andi         a6, s2, -1784
                  xor          a6, s1, s5
                  csrrc        s9, 0x340, t3
                  rem          s6, sp, t4
                  csrrs        t3, 0x340, zero
                  c.nop
                  rem          s1, s6, s11
                  rem          t0, t3, a7
                  c.nop
                  and          a6, s4, s6
                  c.andi       a5, -1
                  c.addi16sp   sp, -16
                  c.xor        a3, a0
                  c.andi       a4, 20
                  c.andi       s0, -1
                  c.slli       a5, 26
                  csrrc        a3, 0x340, sp
                  sll          tp, a2, s6
                  c.srai       a3, 22
                  mul          t3, s2, a3
                  slti         t5, a6, -591
                  mulhsu       t4, a4, t1
                  addi         s0, gp, -493
                  slti         a2, s1, 2006
                  sll          sp, sp, s4
                  csrrsi       s11, 0x340, 1
                  csrrs        s11, 0x340, a2
                  mulhsu       a6, a0, a4
                  mulhu        t1, t5, a4
                  mulhsu       s6, s11, s3
                  c.srli       a1, 20
                  slti         sp, t3, 1186
                  c.nop
                  xori         t5, a5, 609
                  c.sub        a5, a0
                  sltu         s4, t4, a2
                  c.addi       s8, -1
                  lui          a2, 437472
                  add          s8, s11, s10
                  div          a3, a0, a2
                  srli         s2, t1, 18
                  or           t4, a6, s3
                  c.nop
                  remu         t1, s6, a0
                  add          ra, t6, s10
                  c.and        s1, a3
                  c.addi       ra, 7
                  c.addi4spn   a4, sp, 528
                  c.mv         s1, a6
                  nop
                  xori         sp, s11, -1930
                  srl          t1, s3, s10
                  nop
                  c.or         a2, a0
                  sltu         a4, s2, a3
                  c.or         a0, s1
                  slli         t1, ra, 27
                  csrrci       s1, 0x340, 26
                  csrrsi       s4, 0x340, 0
                  c.addi16sp   sp, 32
                  csrrsi       sp, 0x340, 30
                  lui          a0, 25518
                  add          a4, a3, t5
                  mulhsu       s2, a1, t5
                  c.add        t0, s0
                  c.or         s1, s0
                  c.srai       a5, 16
                  xor          s9, s6, s3
                  c.addi       ra, -1
                  remu         s11, t6, s2
                  sltiu        tp, s9, -595
                  xori         s0, s7, 561
                  divu         zero, s0, s2
                  srai         s6, s7, 22
                  c.nop
                  sra          s1, t0, t0
                  slti         a7, s8, 1286
                  c.addi4spn   s1, sp, 128
                  sll          a0, a2, a2
                  addi         a2, s2, 725
                  rem          a5, a6, t0
                  c.addi4spn   a5, sp, 336
                  div          t6, sp, a6
                  addi         a7, s9, 1721
                  csrrci       s0, 0x340, 0
                  c.nop
                  csrrsi       sp, 0x340, 21
                  c.add        a0, a4
                  rem          t4, sp, s1
                  csrrwi       t5, 0x340, 9
                  mulhsu       s6, a0, s8
                  mul          s11, a6, s7
                  c.lui        a1, 29
                  mulhsu       s0, t5, s5
                  div          ra, a7, s6
                  mulhsu       s8, s4, sp
                  mulh         a6, t4, s4
                  csrrwi       a3, 0x340, 8
                  c.lui        a4, 20
                  c.add        t0, t0
                  mulhu        s2, t2, a5
                  addi         a1, s1, 1623
                  ori          gp, s10, -1376
                  lui          ra, 225844
                  slti         a0, s3, 697
                  sltiu        a5, a2, 1865
                  auipc        zero, 969558
                  csrrw        a4, 0x340, ra
                  c.andi       a5, 28
                  auipc        s11, 488238
                  c.sub        a1, a3
                  sltiu        s2, ra, -664
                  csrrsi       t4, 0x340, 0
                  c.or         a2, s0
                  or           s4, t4, s7
                  or           tp, a0, ra
                  c.srai       s0, 8
                  divu         a5, s3, t2
                  csrrc        t4, 0x340, zero
                  c.xor        a3, s1
                  csrrci       s5, 0x340, 0
                  c.add        t3, s4
                  and          tp, t4, a4
                  sltu         a4, gp, t6
                  c.or         a0, a4
                  mulh         a4, s11, s8
                  c.or         a2, a5
                  srai         s11, t6, 23
                  nop
                  xor          a5, s3, a7
                  c.slli       s4, 28
                  c.addi16sp   sp, 288
                  c.addi4spn   a0, sp, 992
                  mulh         a3, a4, t2
                  mulhsu       s9, t1, ra
                  c.mv         s9, s0
                  slli         s2, gp, 0
                  xor          t5, a0, s5
                  slti         zero, zero, -1299
                  c.slli       a5, 7
                  remu         tp, t2, s1
                  xor          a4, s7, s0
                  srai         s11, s3, 6
                  mulhsu       s7, a6, ra
                  csrrsi       s1, 0x340, 31
                  c.srli       a5, 18
                  srli         s5, t4, 10
                  div          a6, a2, a7
                  nop
                  sltu         tp, t2, a0
                  c.sub        a5, a4
                  srl          tp, t2, s11
                  c.addi4spn   a5, sp, 304
                  c.and        a4, s0
                  mulhu        t0, t6, s2
                  sll          t3, a1, s8
                  c.xor        a0, a5
                  srai         gp, a2, 22
                  csrrw        s7, 0x340, sp
                  c.add        a1, a0
                  c.srli       s1, 21
                  remu         a7, s3, s1
                  xor          ra, zero, s10
                  slli         t0, a4, 27
                  c.addi16sp   sp, -16
                  mulh         t5, s3, t0
                  c.and        a3, a3
                  c.srli       a3, 11
                  sra          a1, t5, a3
                  c.li         t4, 16
                  slli         a2, s4, 8
                  mulhu        a5, s4, t4
                  c.add        s4, a6
                  sltiu        s11, s5, -992
                  c.addi4spn   a2, sp, 576
                  andi         a4, tp, 21
                  csrrs        s0, 0x340, zero
                  ori          s4, sp, -853
                  addi         a0, a6, -1126
                  srai         t4, tp, 22
                  c.sub        a2, a2
                  c.sub        a2, a3
                  srli         s5, s4, 17
                  csrrc        gp, 0x340, a6
                  mulhsu       s1, a5, s6
                  slli         s6, s6, 15
                  csrrci       ra, 0x340, 0
                  mulh         t1, ra, a0
                  csrrci       t6, 0x340, 23
                  and          a0, s0, t1
                  addi         a5, s5, 1115
                  c.nop
                  and          sp, s2, s6
                  xori         s6, s6, -1684
                  mulhu        a3, ra, gp
                  andi         s11, gp, 1195
                  auipc        t0, 428948
                  sll          s9, s5, s10
                  slli         a5, s0, 20
                  nop
                  c.addi4spn   a3, sp, 144
                  slli         a0, ra, 5
                  c.addi4spn   a1, sp, 80
                  csrrs        t3, 0x340, zero
                  sub          s0, s6, t2
                  slli         t6, s6, 19
                  csrrci       t4, 0x340, 0
                  c.lui        t3, 11
                  slti         s6, a3, 587
                  div          t0, t5, a0
                  mul          a2, ra, s6
                  srli         s6, a0, 7
                  c.lui        s9, 9
                  c.sub        a5, a0
                  c.addi16sp   sp, -16
                  c.li         t1, 9
                  csrrs        s0, 0x340, s9
                  xori         a1, s1, -851
                  sltiu        t6, s1, -891
                  rem          s1, s0, s2
                  slti         s9, t6, 1669
                  rem          a6, a6, tp
                  sra          s6, a5, t0
                  csrrci       tp, 0x340, 28
                  sll          s5, s2, s1
                  slli         a6, sp, 5
                  mulh         s4, s0, t4
                  c.xor        a1, s1
                  c.addi       s5, -1
                  csrrw        t6, 0x340, s0
                  c.andi       a4, 0
                  sub          a0, t1, a5
                  c.xor        s0, a4
                  c.mv         a3, a0
                  rem          s5, t3, t0
                  c.lui        a1, 18
                  sltiu        s7, a3, 528
                  c.slli       a0, 12
                  c.and        a5, s1
                  ori          s2, ra, 1521
                  c.addi       s1, 27
                  c.andi       a5, -1
                  c.mv         ra, s1
                  ori          t5, s11, -1299
                  sub          a1, s3, t6
                  csrrci       sp, 0x340, 5
                  c.li         a4, -1
                  c.mv         a0, a2
                  c.srli       a4, 28
                  srl          s5, t5, s11
                  sltu         t0, ra, a6
                  remu         s1, a5, t1
                  auipc        a3, 797960
                  sltu         zero, zero, s4
                  xori         s6, s0, 25
                  auipc        s8, 219882
                  csrrsi       t0, 0x340, 0
                  c.srli       a2, 21
                  xori         a7, ra, 550
                  c.slli       s0, 3
                  mulh         t1, zero, s2
                  slli         t5, s3, 3
                  mulh         a6, s9, s2
                  c.nop
                  c.nop
                  csrrc        a7, 0x340, s6
                  sll          sp, t4, a1
                  or           a5, zero, t6
                  c.nop
                  c.srli       a2, 20
                  xori         s7, a7, -468
                  csrrci       zero, 0x340, 0
                  srli         a0, s1, 17
                  c.lui        s1, 19
                  addi         t1, a1, 581
                  sll          t1, t1, s8
                  mulh         gp, s6, a0
                  sub          s0, s10, gp
                  sll          t1, ra, s8
                  csrrci       a6, 0x340, 25
                  c.and        a1, a0
                  sub          s11, s7, t2
                  c.or         s0, s0
                  c.andi       a3, -1
                  c.or         a0, a1
                  nop
                  divu         sp, a2, t4
                  csrrs        s11, 0x340, zero
                  srli         t0, ra, 20
                  div          t3, a6, ra
                  c.lui        s2, 31
                  xori         t0, t0, 247
                  sub          gp, zero, s7
                  c.srli       a2, 6
                  c.and        a3, a1
                  addi         a7, t3, 513
                  csrrci       ra, 0x340, 30
                  mul          a6, t1, s4
                  c.mv         t4, t5
                  csrrs        tp, 0x340, zero
                  xori         gp, t5, 694
                  srl          t3, s2, s9
                  c.slli       s9, 14
                  srl          s0, t4, ra
                  sra          s11, a7, ra
                  srl          a1, s2, s11
                  sll          gp, a7, s1
                  nop
                  mulh         s4, s5, t6
                  xor          s11, a6, a3
                  srai         s6, s3, 4
                  divu         a1, s8, sp
                  xor          s7, t0, zero
                  c.lui        t4, 18
                  xori         s7, a6, -1833
                  rem          t4, s11, t3
                  c.slli       a1, 2
                  xori         s1, a4, -1857
                  srl          s1, zero, s3
                  c.srai       a2, 27
                  csrrsi       a6, 0x340, 15
                  slti         a3, s8, -661
                  addi         ra, a3, -1577
                  slt          s6, t6, s9
                  csrrsi       t3, 0x340, 8
                  slt          t1, s5, sp
                  xor          t1, t6, gp
                  csrrsi       s2, 0x340, 0
                  csrrc        s8, 0x340, zero
                  srli         a3, a7, 17
                  nop
                  c.add        a2, t2
                  mulh         s1, s11, a3
                  slli         s9, s2, 26
                  c.mv         a0, s8
                  c.andi       a2, 29
                  mulhu        s2, a2, a1
                  sub          a6, t0, s8
                  mulhsu       s11, a2, s2
                  remu         s2, gp, s4
                  c.li         t1, 6
                  c.li         a3, -1
                  sra          t6, t5, s9
                  srli         ra, a4, 27
                  sll          t3, s1, t5
                  c.lui        a0, 4
                  lui          s9, 985598
                  addi         t3, a4, -444
                  nop
                  slli         a3, s0, 28
                  c.and        a0, s0
                  divu         t4, t2, a2
                  csrrc        s7, 0x340, zero
                  slt          t0, sp, t2
                  add          ra, t2, tp
                  nop
                  sra          s11, a5, sp
                  divu         a3, s6, s0
                  lui          a1, 695849
                  auipc        t5, 945794
                  c.addi       s8, -1
                  slt          zero, a5, t1
                  c.sub        a4, s1
                  csrrwi       s6, 0x340, 15
                  mul          t3, a6, s8
                  andi         a4, s10, 203
                  c.andi       a3, 1
                  slti         s8, a0, -394
                  csrrs        t6, 0x340, t4
                  c.and        a1, a3
                  and          a4, s3, t4
                  slt          a6, s3, s9
                  sra          s4, a5, a3
                  srai         a4, t5, 19
                  sub          a0, a1, a2
                  slli         a6, tp, 7
                  c.add        s6, s9
                  rem          sp, gp, t0
                  c.li         tp, 28
                  slt          s0, s0, ra
                  c.nop
                  c.xor        a2, a2
                  srli         s9, sp, 16
                  ori          s8, s4, -820
                  mulhu        s2, t0, t5
                  c.andi       s0, -1
                  mulh         s1, zero, s8
                  sltu         zero, t4, t0
                  csrrci       a4, 0x340, 10
                  mulhu        a6, t4, t4
                  c.addi16sp   sp, -16
                  csrrci       s9, 0x340, 10
                  xor          a6, a5, s5
                  c.and        s0, a0
                  c.nop
                  c.li         a0, 28
                  add          s8, a2, s0
                  divu         s7, t4, t1
                  c.add        t1, s9
                  nop
                  c.sub        a5, a1
                  slti         a4, s9, 1242
                  xor          t1, t3, a0
                  sltiu        s5, t2, -668
                  srli         s9, s7, 5
                  andi         a0, sp, 922
                  c.addi       s0, 29
                  andi         a1, s1, -595
                  sll          s5, s8, t1
                  c.srli       a4, 3
                  c.mv         t5, s0
                  nop
                  div          a3, s2, a6
                  c.addi       gp, 16
                  xor          a1, t6, t6
                  divu         sp, s9, s9
                  csrrsi       s5, 0x340, 31
                  c.nop
                  slti         t6, s10, -1759
                  c.addi4spn   a4, sp, 528
                  c.li         a6, 9
                  c.lui        s4, 21
                  slli         a5, zero, 16
                  xori         gp, a3, -45
                  and          a0, s2, s1
                  sll          s6, t3, gp
                  c.mv         t4, s6
                  c.xor        a0, a4
                  csrrc        t3, 0x340, zero
                  c.lui        t1, 6
                  andi         t3, s9, 528
                  c.srli       a5, 17
                  div          a4, s4, t0
                  mul          t5, s1, t4
                  slli         s11, a6, 22
                  c.mv         a1, s4
                  rem          t0, a3, t5
                  or           zero, s1, t6
                  c.add        t1, s9
                  addi         tp, tp, -498
                  c.li         s1, 28
                  c.addi16sp   sp, -16
                  div          s0, s11, s10
                  c.addi4spn   a5, sp, 704
                  sll          s0, tp, s5
                  c.andi       a2, -1
                  c.and        a4, a0
                  c.addi       t3, -1
                  xori         s5, ra, 966
                  c.srli       a2, 6
                  sll          tp, gp, s3
                  sub          t0, s3, a3
                  lui          a2, 19338
                  sll          s1, a3, s11
                  divu         t3, s8, s5
                  add          t5, sp, s9
                  csrrsi       ra, 0x340, 0
                  c.lui        s4, 15
                  c.add        a1, s11
                  slt          a0, s5, a6
                  andi         a6, a1, -42
                  and          s6, t1, sp
                  rem          s4, s10, s9
                  c.lui        s2, 7
                  c.addi       gp, 8
                  c.nop
                  remu         s11, s2, gp
                  divu         s4, t5, t4
                  sltu         s8, t5, s10
                  c.sub        a1, a3
                  sra          s5, s2, t0
                  csrrs        a7, 0x340, s8
                  c.srai       a2, 2
                  ori          s4, s11, 1345
                  c.xor        a4, a2
                  andi         a6, t3, 983
                  c.and        a4, a1
                  mulhu        t6, t4, zero
                  andi         t0, a0, 694
                  nop
                  c.mv         s2, s0
                  c.add        s5, t6
                  c.addi4spn   a4, sp, 752
                  or           s9, s5, s10
                  sll          s5, s2, t3
                  c.srai       a5, 24
                  auipc        a1, 431292
                  sub          a0, a1, s7
                  c.and        a4, s1
                  sll          a4, t6, a3
                  srai         a0, s2, 14
                  mulh         a2, s10, t2
                  c.xor        a2, a1
                  csrrs        s6, 0x340, zero
                  c.andi       a5, 17
                  rem          t1, t1, sp
                  and          t1, s1, s10
                  mulhsu       gp, tp, a1
                  c.mv         t3, t4
                  nop
                  addi         a6, s0, 1103
                  srli         t3, a4, 13
                  srli         t4, s1, 16
                  lui          t3, 696876
                  xor          a0, a0, zero
                  c.mv         s9, s2
                  csrrwi       t4, 0x340, 24
                  sub          zero, s11, a5
                  nop
                  c.slli       gp, 10
                  csrrsi       a2, 0x340, 4
                  c.xor        s0, a4
                  c.srli       a2, 8
                  sltiu        s8, s1, -992
                  c.srai       a4, 11
                  c.slli       t5, 17
                  rem          a1, t1, s2
                  andi         s7, a2, -1007
                  rem          s5, s3, tp
                  c.slli       ra, 17
                  mulh         a7, t1, t5
                  sra          s11, s11, a5
                  nop
                  c.addi       s6, -1
                  rem          s2, s0, s6
                  ori          s7, s11, -1800
                  xori         sp, a4, -531
                  c.or         a5, a2
                  xori         a7, a5, 343
                  auipc        t3, 541033
                  c.srli       a5, 22
                  c.addi16sp   sp, -16
                  srai         t0, tp, 18
                  csrrw        s11, 0x340, t0
                  c.add        t1, s0
                  sltu         a7, gp, s4
                  c.srai       a4, 26
                  csrrs        a2, 0x340, zero
                  slt          a7, t0, s9
                  c.or         a2, s1
                  c.and        a3, a3
                  srai         s11, t0, 9
                  csrrc        t3, 0x340, a3
                  div          s2, a2, zero
                  csrrci       ra, 0x340, 0
                  xori         t0, s5, -1606
                  c.addi4spn   a1, sp, 272
                  remu         t6, t0, a7
                  div          zero, a0, t5
                  auipc        ra, 266999
                  lui          t6, 111047
                  sltiu        a4, s1, -1338
                  rem          t5, s11, a1
                  slt          t1, t1, s3
                  remu         a2, s8, t0
                  or           t1, s2, s8
                  c.andi       a3, -1
                  srai         ra, a1, 8
                  sll          gp, t4, s6
                  xor          tp, t2, s11
                  c.addi16sp   sp, -16
                  andi         s5, s5, -875
                  c.lui        a1, 28
                  c.mv         tp, t4
                  xori         a0, a7, 336
                  rem          a0, s0, ra
                  auipc        sp, 512836
                  remu         s8, ra, a2
                  c.mv         sp, tp
                  sltu         gp, t3, s0
                  xori         t1, gp, 1790
                  c.lui        a3, 30
                  c.lui        s1, 20
                  srai         zero, a1, 14
                  c.srli       s1, 8
                  c.andi       a5, -1
                  srl          tp, ra, s10
                  slli         s7, s9, 24
                  and          s4, t1, a7
                  c.xor        s0, a3
                  slt          t1, s11, t2
                  csrrci       s2, 0x340, 0
                  c.add        s7, ra
                  c.addi16sp   sp, 480
                  c.addi       a1, 31
                  slt          s4, a2, s1
                  c.lui        s7, 17
                  mulhu        s6, t3, sp
                  and          gp, s11, zero
                  c.andi       a3, 12
                  xori         s4, a1, -599
                  nop
                  srai         a5, s2, 28
                  csrrsi       s2, 0x340, 24
                  c.nop
                  xor          gp, t1, tp
                  add          gp, a6, s11
                  mulh         s2, s3, a6
                  c.and        s0, s0
                  csrrw        sp, 0x340, sp
                  xori         s0, s1, 1028
                  nop
                  csrrci       s6, 0x340, 18
                  andi         t3, s9, 1183
                  nop
                  auipc        a7, 895333
                  slt          a4, s0, s7
                  sll          s6, t2, s2
                  auipc        tp, 193232
                  c.addi       t1, -1
                  csrrc        a1, 0x340, a0
                  c.add        ra, ra
                  slt          zero, s1, a6
                  sra          a3, s9, gp
                  divu         s5, t5, s5
                  nop
                  nop
                  c.addi4spn   a2, sp, 144
                  slt          zero, s4, a0
                  c.li         t0, -1
                  sll          a0, a3, t3
                  ori          sp, s4, -2042
                  lui          s1, 404153
                  c.add        s4, a3
                  csrrci       t6, 0x340, 0
                  csrrsi       s2, 0x340, 4
                  srl          s6, gp, s8
                  c.and        s0, a5
                  c.lui        a3, 20
                  addi         sp, zero, -1860
                  c.nop
                  csrrsi       s0, 0x340, 0
                  c.add        t0, s1
                  csrrc        t3, 0x340, t1
                  c.or         a3, a4
                  c.nop
                  auipc        a0, 215464
                  c.lui        s0, 14
                  sll          a5, s7, s8
                  srli         a5, t3, 5
                  sltiu        a6, s6, 1962
                  csrrci       a0, 0x340, 0
                  c.li         t6, -1
                  c.mv         a5, gp
                  c.xor        a5, a5
                  mulhu        s4, tp, s7
                  sltu         s4, a0, sp
                  c.lui        a1, 4
                  c.andi       a5, -1
                  auipc        t1, 41175
                  divu         t6, s9, tp
                  srai         s11, a6, 29
                  c.mv         t5, t2
                  csrrw        a6, 0x340, t0
                  mul          sp, a0, t0
                  csrrci       s4, 0x340, 29
                  nop
                  c.addi16sp   sp, 176
                  c.srai       s0, 15
                  c.or         a2, a0
                  srl          s8, s8, t6
                  mulhsu       s7, tp, tp
                  sltiu        a7, t0, -1387
                  c.srli       a2, 17
                  c.add        ra, t1
                  and          s2, s8, gp
                  srai         t5, s5, 25
                  c.li         s5, -1
                  sll          a3, a2, a2
                  mulh         s5, t1, tp
                  c.li         a7, 21
                  sra          zero, a4, s8
                  add          ra, a0, a5
                  or           a2, s8, s7
                  sra          a2, sp, s9
                  or           ra, a4, t6
                  xori         t1, s3, -1953
                  c.srli       a0, 12
                  sub          s5, s7, t2
                  csrrs        s8, 0x340, ra
                  lui          s7, 951321
                  remu         ra, s3, a0
                  mulhsu       a7, ra, a5
                  add          a0, s4, ra
                  slli         s6, gp, 29
                  c.srai       s0, 22
                  add          tp, t1, t6
                  xor          t3, a7, s3
                  addi         t0, t3, 1277
                  and          s6, s1, a7
                  srl          s2, t0, s0
                  or           s8, t5, ra
                  slli         a3, s4, 18
                  add          sp, t3, t5
                  andi         t5, s0, -2030
                  addi         a4, t6, 88
                  slt          ra, tp, t6
                  sltiu        s2, a4, 1537
                  lui          sp, 578579
                  andi         a5, sp, 1572
                  c.addi16sp   sp, -16
                  c.sub        s1, a2
                  mulhsu       s1, a2, sp
                  csrrs        t3, 0x340, zero
                  addi         s1, s6, -95
                  c.slli       t4, 26
                  c.addi16sp   sp, 208
                  srai         s1, a2, 11
                  divu         a0, sp, s0
                  c.andi       a4, -1
                  nop
                  sll          tp, s5, s8
                  csrrs        s0, 0x340, zero
                  auipc        a7, 632910
                  add          s4, sp, s8
                  c.srai       s1, 23
                  xori         t0, tp, 669
                  mulh         s0, a4, a3
                  c.mv         t6, s7
                  c.addi16sp   sp, -16
                  nop
                  mulhu        s2, t2, a0
                  csrrsi       gp, 0x340, 21
                  sll          t1, t6, a7
                  or           s5, t3, t2
                  rem          t1, tp, s4
                  csrrc        gp, 0x340, t6
                  srli         s2, t4, 20
                  sub          zero, s4, s2
                  c.addi       a7, 18
                  csrrc        a7, 0x340, zero
                  srl          a4, gp, t6
                  c.lui        t0, 6
                  c.lui        s8, 30
                  sltiu        t1, t6, -424
                  c.addi       s4, 5
                  mul          s5, ra, s2
                  csrrs        s1, 0x340, a6
                  srli         zero, t4, 16
                  sra          s7, ra, s8
                  c.or         a4, a4
                  addi         t0, s2, -844
                  mulh         s2, a3, s9
                  rem          t0, s6, s2
                  sll          s2, tp, a6
                  sra          a6, s11, zero
                  remu         a6, a5, s8
                  andi         t1, t1, -1909
                  xori         s11, t4, 1355
                  c.slli       a2, 3
                  c.li         t1, 16
                  csrrsi       s1, 0x340, 0
                  sltiu        s8, t1, -470
                  c.lui        a0, 10
                  c.addi4spn   a3, sp, 1008
                  andi         t3, t1, -768
                  c.srli       a2, 13
                  srli         s4, a6, 21
                  add          tp, a5, s8
                  rem          a1, s4, ra
                  sltu         t1, t2, t1
                  mulh         gp, t4, t3
                  csrrw        t1, 0x340, a6
                  rem          t3, s11, zero
                  xori         a2, a5, -1889
                  srai         a7, s7, 26
                  remu         a4, sp, a0
                  or           a1, s4, ra
                  mulh         a5, t0, a5
                  csrrs        a6, 0x340, a5
                  xori         s4, t0, -1549
                  srai         s7, t4, 11
                  addi         s7, sp, 1472
                  csrrsi       t4, 0x340, 0
                  csrrsi       a1, 0x340, 0
                  srl          zero, s7, t2
                  sub          t1, a2, s7
                  slt          ra, a5, s4
                  c.srai       a0, 14
                  c.xor        a1, s0
                  srai         a5, a5, 28
                  mul          zero, a4, s4
                  srl          a7, a2, s2
                  csrrwi       s1, 0x340, 10
                  nop
                  c.xor        s1, a5
                  c.addi16sp   sp, 112
                  nop
                  c.and        a2, s1
                  sub          zero, s11, a0
                  sltiu        tp, s8, -127
                  c.addi4spn   a0, sp, 112
                  mulhu        t0, t3, t0
                  mulh         tp, t2, s0
                  mulhsu       s1, s8, t3
                  mulhsu       t1, a1, t0
                  c.srai       a0, 30
                  and          t5, t0, s4
                  csrrsi       a4, 0x340, 22
                  srl          a6, t4, s1
                  sub          s0, a5, t5
                  lui          s4, 753428
                  sub          t5, tp, t2
                  srl          zero, s8, a2
                  csrrsi       a1, 0x340, 0
                  srai         s2, s8, 30
                  div          a3, gp, gp
                  csrrwi       s4, 0x340, 16
                  c.addi       s6, 18
                  srli         s11, s5, 20
                  srli         s1, a5, 26
                  sra          gp, s3, s9
                  sltu         a7, tp, t1
                  add          a4, s4, s9
                  nop
                  and          t6, s11, s0
                  csrrci       ra, 0x340, 0
                  c.mv         s2, sp
                  sub          a3, s10, s6
                  sra          a3, a7, t2
                  csrrwi       s5, 0x340, 24
                  sra          a5, a0, s6
                  c.li         a5, -1
                  c.li         s2, -1
                  mulh         s1, s10, zero
                  c.sub        a3, a4
                  csrrs        tp, 0x340, s0
                  c.andi       a2, 29
                  nop
                  csrrsi       s6, 0x340, 0
                  remu         a0, gp, s6
                  slti         t5, s10, -1161
                  addi         s8, s8, -1434
                  mulhsu       a3, t2, a7
                  c.addi       t5, 12
                  c.addi       s9, -1
                  c.nop
                  sub          s6, s1, sp
                  srl          t6, s11, s9
                  mulh         ra, s4, t6
                  and          t6, sp, a4
                  c.addi16sp   sp, 240
                  slti         t6, a1, 627
                  andi         a0, tp, -1461
                  rem          a4, a4, t4
                  auipc        sp, 772531
                  sltiu        s4, a7, -586
                  nop
                  c.and        a4, s1
                  c.xor        a3, a4
                  c.lui        s8, 7
                  srai         s7, t5, 0
                  c.andi       a4, -1
                  c.addi4spn   s1, sp, 48
                  srl          t4, s2, s1
                  mul          a3, s6, s2
                  auipc        a6, 549143
                  csrrsi       a6, 0x340, 12
                  csrrw        s7, 0x340, a5
                  srli         t0, t6, 20
                  lui          t3, 541042
                  sll          t5, s10, a3
                  auipc        s11, 230299
                  sub          s0, s7, t6
                  div          t3, s2, a0
                  c.slli       s11, 14
                  c.nop
                  mulh         a7, t3, gp
                  c.sub        s0, s1
                  c.andi       a0, 24
                  srai         zero, sp, 18
                  c.add        s1, sp
                  csrrs        t6, 0x340, zero
                  xor          s11, s11, t4
                  add          s5, t4, s8
                  c.add        a1, t6
                  slli         t6, gp, 13
                  xori         a6, a6, 861
                  mulhu        a3, a6, a5
                  c.add        a0, t3
                  c.addi       s2, -1
                  csrrsi       s0, 0x340, 27
                  c.sub        a0, a4
                  xor          s5, t6, s10
                  and          t0, t6, t6
                  sll          ra, zero, s7
                  slti         s0, s2, -1901
                  sra          a0, a6, a2
                  c.and        a5, s0
                  mul          ra, a0, gp
                  c.srai       a4, 3
                  nop
                  c.srli       a1, 16
                  mulhu        s0, a3, t2
                  c.addi4spn   s0, sp, 832
                  c.lui        t6, 28
                  csrrci       a3, 0x340, 0
                  c.sub        a3, a3
                  andi         s5, a3, -997
                  slti         s2, a5, 362
                  c.mv         tp, s10
                  c.srli       a1, 31
                  xori         t0, a1, 216
                  slt          a4, s9, t2
                  xor          s7, t6, s4
                  or           s11, a1, s9
                  mulh         ra, a1, a1
                  sltu         zero, s5, s10
                  csrrs        s6, 0x340, a5
                  c.or         s1, a4
                  mulhsu       a3, ra, s4
                  csrrwi       ra, 0x340, 16
                  csrrci       t6, 0x340, 0
                  c.xor        a4, a4
                  srl          s7, s3, s1
                  slt          t3, a7, s11
                  mulh         s1, t4, ra
                  addi         s7, a1, -1804
                  c.sub        a1, a3
                  c.slli       s0, 8
                  c.srai       s0, 18
                  srli         s9, s3, 6
                  c.srli       a5, 2
                  rem          sp, t2, zero
                  xori         s7, ra, 887
                  c.xor        a1, a4
                  c.addi       t4, -1
                  lui          gp, 99860
                  xor          zero, s0, t2
                  csrrc        t1, 0x340, a1
                  and          t4, t6, a1
                  csrrsi       a3, 0x340, 6
                  srl          t5, s9, s0
                  lui          t4, 290013
                  srl          t0, a4, a5
                  add          a3, t3, s1
                  addi         t4, sp, 141
                  sra          s5, s11, tp
                  ori          s4, s4, -1843
                  c.srli       a2, 2
                  c.xor        a0, a3
                  c.mv         a4, s11
                  c.or         a4, a3
                  auipc        a7, 224859
                  or           a6, t5, a7
                  c.nop
                  c.xor        a4, a3
                  xor          a3, s7, s5
                  c.addi16sp   sp, -16
                  c.slli       t4, 12
                  csrrwi       gp, 0x340, 18
                  divu         s1, t0, zero
                  c.andi       s1, 20
                  c.addi       s7, -1
                  nop
                  slti         a2, s8, -148
                  csrrwi       s6, 0x340, 21
                  csrrsi       s5, 0x340, 0
                  xor          s4, t2, a5
                  mulhsu       a0, t6, s9
                  slt          a6, t4, a6
                  srli         a1, s3, 9
                  slli         s9, gp, 16
                  csrrw        a0, 0x340, s6
                  c.xor        a3, a0
                  addi         a5, s9, 843
                  mulhsu       t0, s2, t2
                  sra          a6, a2, s6
                  divu         sp, gp, t4
                  slt          ra, s3, s0
                  c.or         a4, s1
                  slli         a0, a5, 28
                  c.and        a4, a3
                  auipc        zero, 426858
                  c.andi       a5, 20
                  c.li         tp, 4
                  mulhu        a1, a0, s5
                  csrrci       a5, 0x340, 1
                  c.srli       a4, 8
                  c.xor        a5, a5
                  csrrs        t6, 0x340, zero
                  sra          gp, s6, t2
                  c.sub        a3, a2
                  addi         t5, sp, -404
                  c.andi       a3, 19
                  slli         s6, s4, 30
                  c.lui        s8, 16
                  csrrwi       a2, 0x340, 27
                  rem          s9, zero, t2
                  mulhsu       sp, s4, s4
                  sll          t3, a0, zero
                  csrrci       t3, 0x340, 0
                  mulhu        s11, t2, s6
                  nop
                  srl          s8, s4, a0
                  sub          a3, a1, a4
                  c.andi       a4, 27
                  add          s5, t1, s1
                  remu         s2, s6, t5
                  c.mv         a4, a7
                  c.addi16sp   sp, -16
                  c.addi16sp   sp, 80
                  remu         a6, t4, s4
                  srai         s7, s8, 21
                  c.slli       ra, 10
                  lui          t6, 942726
                  xor          s6, a2, a0
                  rem          s1, s6, a6
                  c.andi       s1, 24
                  addi         ra, s11, 1800
                  div          s0, t4, a5
                  sltiu        t1, a4, 851
                  remu         a4, s6, s8
                  slli         s8, t3, 24
                  slti         t3, t6, -89
                  xori         s0, t0, -1140
                  add          t0, t5, s0
                  srl          a1, s3, s11
                  auipc        t3, 197849
                  csrrw        s4, 0x340, s8
                  rem          t6, t3, a5
                  csrrci       s0, 0x340, 0
                  c.add        a6, t4
                  mul          sp, s7, s6
                  mul          s0, sp, sp
                  or           ra, a5, s3
                  sltiu        a3, s11, 1662
                  c.li         gp, 27
                  ori          a2, s10, 1906
                  sltiu        t6, a5, 1016
                  c.slli       tp, 23
                  csrrc        a4, 0x340, s6
                  mulhsu       t3, t0, t4
                  c.add        a4, a3
                  c.mv         s0, s9
                  c.sub        a2, a3
                  andi         s0, a3, 689
                  c.addi       a2, 21
                  andi         sp, s0, 721
                  c.andi       a4, -1
                  or           s6, s4, s3
                  or           a2, tp, s11
                  remu         t5, a1, t5
                  andi         a2, a4, 1369
                  c.sub        s0, a4
                  mulhu        s6, t3, t1
                  c.add        s7, gp
                  div          s2, s6, s8
                  srl          tp, a6, a4
                  sltu         sp, tp, s1
                  slli         ra, a6, 0
                  srl          s7, s11, a4
                  sll          a3, a6, s2
                  c.nop
                  c.nop
                  xor          s2, a2, t2
                  nop
                  addi         s1, t1, 182
                  sltiu        a3, t2, 459
                  csrrs        t0, 0x340, a6
                  and          a5, s9, s0
                  c.add        s1, s3
                  lui          t1, 802248
                  auipc        s11, 499572
                  divu         a2, s3, s10
                  csrrs        a1, 0x340, zero
                  sltu         s9, t5, a1
                  c.xor        a1, a1
                  csrrs        s7, 0x340, zero
                  slt          t5, t3, ra
                  c.sub        a2, a3
                  rem          a4, s7, s0
                  and          t0, s7, s8
                  or           a2, tp, s11
                  rem          a4, s5, tp
                  c.slli       s4, 4
                  sll          a0, s3, s10
                  lui          tp, 916913
                  nop
                  c.and        s1, a2
                  mulh         a6, s8, ra
                  add          a6, t0, s6
                  auipc        gp, 531399
                  csrrwi       s2, 0x340, 13
                  srai         a2, t4, 5
                  remu         t1, t2, a1
                  nop
                  c.srli       a0, 20
                  divu         a3, t4, t5
                  csrrci       s5, 0x340, 10
                  csrrs        a4, 0x340, a3
                  andi         a3, a5, 1584
                  sltiu        t1, gp, -1968
                  c.srli       a5, 26
                  c.mv         a2, a4
                  or           a7, s3, t0
                  and          a4, tp, a0
                  c.srai       a3, 25
                  div          t0, t0, a3
                  c.addi16sp   sp, 80
                  rem          s8, s1, tp
                  c.slli       sp, 10
                  srli         t5, s2, 16
                  csrrwi       t4, 0x340, 16
                  remu         ra, s11, t6
                  addi         s1, t5, 867
                  srai         s0, a6, 5
                  c.nop
                  c.and        a5, a1
                  c.or         a4, s1
                  csrrw        t5, 0x340, ra
                  sltiu        gp, ra, 1490
                  srai         gp, t6, 5
                  c.srai       a0, 17
                  nop
                  c.addi       t3, 31
                  sltiu        s5, a0, -270
                  csrrsi       ra, 0x340, 0
                  slt          s4, s10, s3
                  sll          t4, a6, t0
                  c.slli       s7, 15
                  sra          zero, sp, t5
                  xor          gp, a7, zero
                  c.slli       t0, 1
                  csrrwi       t0, 0x340, 27
                  slti         a5, s2, -1612
                  c.addi4spn   a0, sp, 128
                  srai         t0, s9, 21
                  andi         s8, s4, -827
                  c.or         s0, a2
                  mulh         t6, t0, a3
                  srl          t5, a3, s3
                  c.addi       a4, 23
                  c.nop
                  srai         a0, a2, 3
                  csrrwi       tp, 0x340, 8
                  or           sp, gp, t0
                  sll          s7, a6, t5
                  lui          a5, 404527
                  ori          t1, a2, 660
                  c.srli       a4, 29
                  c.add        s9, s0
                  auipc        a4, 299663
                  c.nop
                  mulhsu       a0, a6, zero
                  slt          s1, a2, t6
                  sub          t4, a6, s3
                  c.lui        s2, 24
                  c.sub        a2, a0
                  c.addi       t3, 30
                  div          t3, s5, a6
                  csrrwi       s6, 0x340, 26
                  div          s7, gp, s11
                  slti         s7, s11, -1169
                  remu         t4, t3, s6
                  sll          a2, tp, a3
                  slti         t5, a1, 1197
                  srl          a4, a1, s3
                  div          s6, t5, s9
                  c.addi16sp   sp, 496
                  rem          t4, t2, t4
                  div          zero, ra, gp
                  c.srai       a4, 2
                  c.mv         a1, a1
                  auipc        s4, 813795
                  c.addi16sp   sp, -16
                  slt          sp, t0, t6
                  slli         a5, s10, 7
                  lui          s0, 883768
                  lui          a0, 466445
                  sltiu        t6, t1, 704
                  sltu         sp, ra, t0
                  csrrs        s0, 0x340, tp
                  c.or         a4, a5
                  c.addi4spn   s1, sp, 192
                  c.addi       s0, 30
                  c.addi16sp   sp, -16
                  c.nop
                  c.srai       a0, 6
                  srl          a6, a7, s3
                  xori         t1, a3, -2047
                  c.addi4spn   s0, sp, 832
                  c.add        t1, s1
                  srli         s4, sp, 21
                  addi         s7, t4, 68
                  lui          a4, 716557
                  mul          zero, a4, a3
                  mul          a2, t6, t6
                  sltiu        s9, s11, 1882
                  c.addi16sp   sp, 368
                  nop
                  slti         s7, gp, 1433
                  mulhsu       s0, a0, a0
                  auipc        t5, 652392
                  divu         a1, s2, a6
                  srl          s0, t6, s9
                  slli         a3, s1, 11
                  add          ra, a3, s6
                  c.srli       a2, 18
                  mulhsu       a0, s0, zero
                  srli         ra, s2, 10
                  slt          t5, a1, t0
                  csrrci       s8, 0x340, 0
                  c.mv         a7, s1
                  csrrs        a4, 0x340, s6
                  srli         s6, ra, 27
                  mulhu        a1, s1, t1
                  xor          zero, s3, a5
                  c.xor        s1, s0
                  mulhu        a2, s2, s2
                  remu         sp, tp, s7
                  csrrw        s7, 0x340, gp
                  auipc        a7, 419597
                  csrrci       a5, 0x340, 8
                  mulh         s11, a0, s3
                  sub          s11, s4, t0
                  srai         t5, s5, 30
                  mulhsu       s5, s3, gp
                  c.sub        a5, a2
                  csrrci       s4, 0x340, 0
                  c.addi4spn   a4, sp, 320
                  mulhu        s6, sp, gp
                  c.srai       a4, 11
                  lui          a3, 261691
                  andi         a0, a0, 844
                  mul          s8, t4, t0
                  sra          a0, t3, t1
                  c.mv         s7, s11
                  c.or         s1, a4
                  c.addi       s0, -1
                  lui          a1, 773748
                  divu         t6, s2, sp
                  csrrwi       s1, 0x340, 20
                  c.srai       a1, 9
                  sll          t5, a0, s3
                  c.add        t0, a2
                  c.addi4spn   a0, sp, 880
                  c.add        s4, s5
                  c.nop
                  c.nop
                  nop
                  ori          s9, a4, -1104
                  nop
                  c.xor        a4, a0
                  mulh         s1, a2, sp
                  sltiu        a4, t2, -470
                  mulhu        sp, s9, s10
                  c.addi16sp   sp, -16
                  auipc        s9, 699071
                  c.addi16sp   sp, 400
                  sll          a5, s1, s8
                  srli         t6, a1, 18
                  csrrwi       s2, 0x340, 15
                  c.lui        t6, 15
                  ori          zero, s7, 611
                  csrrci       zero, 0x340, 0
                  c.and        a1, a0
                  srai         a4, tp, 14
                  csrrci       gp, 0x340, 0
                  or           a3, s11, s9
                  c.or         a2, a0
                  nop
                  c.srli       a5, 10
                  c.and        s0, a1
                  c.srli       s1, 31
                  c.add        t1, s10
                  lui          s1, 214336
                  slli         s0, s1, 14
                  xori         s7, s8, 1800
                  c.lui        s4, 5
                  c.or         a5, a4
                  andi         t3, ra, -1039
                  srli         s2, t0, 16
                  c.srli       a0, 2
                  mulh         t6, s7, a6
                  sll          s11, s5, sp
                  sll          sp, gp, s5
                  csrrwi       tp, 0x340, 30
                  sub          a2, s3, s11
                  c.sub        a3, s1
                  slli         s1, tp, 28
                  auipc        zero, 234704
                  csrrci       s11, 0x340, 10
                  or           s0, t3, ra
                  c.sub        a4, a0
                  ori          t3, t2, 1107
                  div          s8, s6, t3
                  slt          s2, t2, a6
                  xor          s1, s9, zero
                  remu         gp, a1, s5
                  c.or         a1, s0
                  div          gp, t3, sp
                  c.li         s9, 28
                  mul          s2, t0, t6
                  c.srai       a1, 17
                  ori          a3, a1, 761
                  c.xor        s0, s0
                  c.andi       s0, 26
                  csrrc        a2, 0x340, a6
                  or           tp, s7, a4
                  divu         sp, s8, gp
                  sll          t6, a4, a5
                  c.slli       s0, 16
                  xori         s0, t6, 1809
                  c.mv         s7, a0
                  sltiu        t1, s1, 873
                  c.srai       a3, 29
                  add          s5, s5, t4
                  xori         s8, s7, 221
                  xor          s7, sp, a2
                  xor          zero, s2, s4
                  c.sub        a1, a1
                  add          zero, zero, s2
                  csrrci       s6, 0x340, 24
                  sra          a4, a3, a5
                  nop
                  sltu         s9, a7, s0
                  c.srai       a5, 15
                  c.nop
                  divu         a0, s6, s11
                  c.sub        s0, a3
                  lui          s1, 564489
                  c.lui        a7, 25
                  csrrc        s4, 0x340, zero
                  slt          s8, a0, s2
                  mulhsu       a2, t4, a4
                  rem          s8, t0, zero
                  slli         s9, s10, 28
                  c.srli       a0, 10
                  mul          sp, a0, zero
                  srl          zero, zero, t3
                  csrrw        s8, 0x340, s6
                  slt          t4, a4, a7
                  csrrs        s1, 0x340, s11
                  slt          s11, a1, tp
                  addi         t1, t5, -1620
                  c.xor        a0, a5
                  c.nop
                  csrrw        s5, 0x340, a7
                  csrrci       sp, 0x340, 3
                  c.addi16sp   sp, -16
                  c.slli       t6, 16
                  c.mv         tp, sp
                  mulhu        s11, gp, gp
                  c.srli       a4, 5
                  c.nop
                  xor          s8, t1, t4
                  sltu         s4, a5, t0
                  sll          a5, gp, t6
                  srl          s5, a4, s6
                  remu         s4, a0, a4
                  sra          t0, t3, t0
                  add          a0, a4, zero
                  rem          a7, s0, s2
                  c.mv         a2, t1
                  sltiu        a4, a7, 1677
                  mul          a3, sp, a0
                  sll          a4, s10, s10
                  csrrw        t5, 0x340, t5
                  c.xor        a1, a3
                  div          s7, s2, t2
                  lui          a1, 518572
                  nop
                  c.srai       a2, 19
                  c.sub        a0, a1
                  csrrsi       t6, 0x340, 12
                  csrrci       t3, 0x340, 0
                  div          tp, s9, t5
                  mulh         a3, a3, a3
                  c.andi       a3, -1
                  nop
                  sll          gp, a7, t2
                  csrrwi       s1, 0x340, 1
                  and          s5, s1, s5
                  or           s8, a4, s6
                  csrrc        s9, 0x340, a7
                  c.xor        s0, a5
                  c.nop
                  ori          t5, t2, 1467
                  sll          s5, sp, a4
                  sll          gp, a1, s3
                  xori         t6, a1, 577
                  c.srai       a1, 3
                  c.addi       s11, 24
                  csrrwi       s11, 0x340, 7
                  mul          t6, s9, a3
                  csrrci       a1, 0x340, 0
                  divu         s1, t3, a7
                  c.srai       a1, 6
                  c.and        a0, s1
                  or           t6, gp, t3
                  c.xor        s1, s0
                  csrrc        gp, 0x340, s9
                  c.mv         a2, t0
                  sra          a2, t2, s4
                  sub          a0, gp, ra
                  mulhu        s5, s8, s0
                  add          s0, ra, gp
                  csrrsi       a1, 0x340, 3
                  c.addi       s4, 28
                  c.srai       a2, 23
                  slt          t5, s8, s4
                  sub          s2, s6, s1
                  slli         s0, t5, 0
                  div          a2, s3, a5
                  rem          a4, s10, s7
                  c.add        a2, t0
                  slti         s8, s10, -571
                  c.or         a4, a4
                  c.lui        t4, 21
                  ori          ra, s5, -1618
                  xor          t3, t4, s10
                  srl          a1, sp, a0
                  srli         t4, t1, 22
                  sra          s8, s10, t0
                  sub          s8, t3, s2
                  sltu         sp, a6, s10
                  sltu         a1, a1, s0
                  andi         t0, ra, 1729
                  csrrsi       t6, 0x340, 0
                  c.add        s1, s7
                  lui          s4, 1046568
                  mulhu        s5, t3, s8
                  csrrw        sp, 0x340, s9
                  sll          a5, ra, a6
                  slti         s9, t5, -1401
                  lui          ra, 462733
                  or           t6, s0, s5
                  srai         a6, t1, 21
                  lui          sp, 198831
                  auipc        t1, 264443
                  srli         a7, a1, 26
                  c.mv         t4, s10
                  srli         s4, t1, 6
                  mul          t3, gp, s11
                  sltiu        a1, a1, -988
                  sll          s8, t6, a7
                  srli         gp, sp, 16
                  c.srli       a3, 27
                  or           a5, s2, s3
                  nop
                  rem          t4, s9, s4
                  mulhsu       a1, s3, a1
                  csrrs        s0, 0x340, a0
                  mulhu        s6, s3, sp
                  srai         a6, s4, 9
                  c.or         a5, s1
                  sra          t4, a5, tp
                  auipc        a7, 957313
                  andi         t0, a3, 1034
                  sub          a7, s11, a5
                  auipc        a1, 803532
                  and          s11, s11, s10
                  sltiu        a7, s7, -1427
                  c.or         a1, a5
                  c.or         a4, a4
                  csrrw        t6, 0x340, a1
                  c.andi       a0, -1
                  xor          s4, a2, ra
                  c.mv         t0, s4
                  xori         a5, sp, 1246
                  add          t4, s0, a5
                  sub          s7, ra, a5
                  sub          ra, t4, t3
                  or           s9, t0, t0
                  c.slli       s5, 27
                  c.mv         ra, s0
                  divu         a7, t3, s8
                  c.andi       a3, -1
                  c.srli       a3, 9
                  auipc        a1, 57658
                  sltu         sp, t0, s9
                  sra          s4, a7, t5
                  c.lui        tp, 1
                  xor          a4, t3, s5
                  csrrw        gp, 0x340, ra
                  c.addi4spn   a0, sp, 736
                  srl          a0, a3, s2
                  mulh         t6, a6, a0
                  csrrs        t4, 0x340, zero
                  slt          s9, s6, s4
                  xori         s4, a0, 690
                  c.or         a4, a0
                  csrrwi       s0, 0x340, 1
                  sltu         a4, s1, gp
                  and          s7, a1, a7
                  nop
                  slti         s8, s2, -1525
                  csrrc        a2, 0x340, t4
                  ori          t4, a4, 1788
                  c.and        a5, a0
                  csrrsi       zero, 0x340, 0
                  addi         a4, s6, 1016
                  c.mv         s11, a7
                  c.lui        t4, 7
                  sra          t5, s7, t0
                  csrrc        s6, 0x340, zero
                  c.or         a5, a5
                  sra          s7, t6, tp
                  nop
                  mulhsu       s5, s1, t5
                  slti         s5, t5, -1132
                  c.andi       a4, -1
                  csrrs        t5, 0x340, zero
                  c.and        s0, a4
                  andi         tp, s5, -478
                  c.and        a4, a1
                  c.lui        s11, 27
                  srai         t3, s9, 18
                  add          a0, a5, s4
                  c.or         a1, s0
                  divu         t5, s1, t6
                  add          s2, s1, s9
                  sltu         a3, tp, s9
                  srl          s5, a4, s8
                  c.lui        t6, 28
                  lui          a5, 987256
                  csrrsi       a6, 0x340, 0
                  and          a6, s11, a2
                  sll          t0, a4, a7
                  sra          tp, s9, s4
                  sub          a0, t1, s1
                  auipc        s2, 687076
                  c.add        s9, s3
                  c.and        s1, a0
                  and          s9, ra, s9
                  csrrci       a0, 0x340, 10
                  rem          tp, t0, t0
                  andi         s2, tp, -1259
                  c.andi       a1, -1
                  csrrc        s11, 0x340, zero
                  c.addi16sp   sp, 352
                  xori         a2, t6, -1958
                  c.xor        a2, a2
                  csrrc        t4, 0x340, s0
                  srai         a5, t3, 25
                  slt          t5, s10, s6
                  csrrwi       tp, 0x340, 15
                  srai         s8, s5, 17
                  andi         a3, a2, 1136
                  slli         a3, t4, 19
                  csrrc        s2, 0x340, zero
                  mulhsu       a5, a3, a0
                  sra          s6, t3, t0
                  srl          t0, zero, tp
                  slt          a1, zero, t4
                  and          zero, s8, gp
                  c.sub        a1, a4
                  csrrs        s1, 0x340, t1
                  add          a3, a1, a6
                  c.slli       s2, 26
                  csrrc        a6, 0x340, zero
                  mulh         t6, s7, s8
                  nop
                  c.srai       a4, 6
                  c.add        t6, s4
                  c.xor        a4, a3
                  c.andi       a3, -1
                  auipc        gp, 219459
                  c.add        a3, a3
                  sra          t5, t5, a3
                  ori          t1, tp, -1021
                  csrrc        a7, 0x340, zero
                  c.lui        a0, 10
                  csrrs        sp, 0x340, zero
                  srl          s11, s9, t0
                  c.li         sp, -1
                  sub          a5, s5, s5
                  addi         s9, s10, 1432
                  xori         s7, t4, 1373
                  c.or         a4, a0
                  csrrs        s4, 0x340, zero
                  rem          a3, a6, a1
                  slt          t1, s2, sp
                  srl          t3, a2, s7
                  or           s2, s10, s6
                  csrrwi       sp, 0x340, 12
                  div          s2, s0, a5
                  divu         a7, a4, s8
                  csrrsi       a3, 0x340, 0
                  add          a5, ra, s10
                  c.xor        a5, s1
                  nop
                  add          s4, t5, a3
                  csrrw        a4, 0x340, t3
                  c.srai       a2, 26
                  srl          t0, gp, t2
                  c.mv         s1, t0
                  c.srli       a3, 24
                  c.and        s0, s1
                  rem          s9, s8, a7
                  sub          t1, a0, s3
                  c.addi4spn   a4, sp, 976
                  csrrs        a4, 0x340, t5
                  c.addi4spn   a2, sp, 560
                  srai         ra, s10, 30
                  andi         s0, s0, 1170
                  sll          a4, gp, s1
                  srli         tp, a7, 22
                  c.add        a2, t1
                  auipc        s6, 697906
                  c.add        a0, a6
                  nop
                  mulhu        t6, a7, a2
                  c.addi16sp   sp, -16
                  xori         a2, a3, 1641
                  c.slli       s9, 28
                  sltiu        s0, s10, 781
                  c.sub        a1, a5
                  c.srli       s1, 25
                  or           s9, s8, s11
                  c.sub        a1, a2
                  lui          a7, 482594
                  xor          a0, a7, s11
                  srli         t0, s5, 1
                  slti         a4, a6, 1572
                  srli         a0, a3, 27
                  c.slli       a0, 2
                  lui          sp, 770665
                  c.mv         s9, s0
                  mul          a2, a3, a7
                  csrrs        t0, 0x340, t4
                  slti         gp, zero, -1329
                  mul          t0, s5, tp
                  c.add        s7, s4
                  srl          t3, ra, s6
                  and          sp, a5, s10
                  andi         t6, a4, 1314
                  srai         a6, s4, 24
                  mulhsu       s4, s0, t1
                  nop
                  xori         s4, a3, -46
                  sub          s11, a2, t6
                  slt          a2, sp, t5
                  auipc        s6, 1029854
                  slti         sp, a1, -893
                  andi         ra, s8, -1020
                  lui          s4, 205371
                  auipc        s4, 893465
                  slti         a1, s1, 1374
                  addi         a1, zero, 264
                  c.nop
                  csrrwi       a2, 0x340, 9
                  sll          ra, a4, t4
                  andi         zero, a3, -1451
                  nop
                  remu         gp, s3, s7
                  csrrci       s5, 0x340, 0
                  csrrs        ra, 0x340, zero
                  auipc        s11, 429451
                  ori          t4, s5, -1140
                  add          t4, t5, zero
                  c.sub        a1, a2
                  srli         s7, a5, 5
                  mulhu        a7, a3, a5
                  csrrw        t3, 0x340, tp
                  c.li         s0, 28
                  mulh         zero, t2, zero
                  rem          s0, s0, a3
                  nop
                  sltu         s5, s5, s5
                  slti         t5, ra, 787
                  slt          s5, s0, tp
                  sltiu        a5, s3, -1688
                  mulh         a3, t4, a1
                  csrrwi       s0, 0x340, 31
                  add          s1, t0, s0
                  csrrwi       t0, 0x340, 29
                  or           t4, a7, sp
                  sll          s2, a1, a1
                  c.andi       a3, 2
                  c.nop
                  andi         a3, t5, 1327
                  mulhsu       a5, a1, sp
                  c.addi4spn   s1, sp, 240
                  slti         a4, zero, 1073
                  csrrwi       s8, 0x340, 25
                  c.addi4spn   s1, sp, 720
                  c.andi       a4, -1
                  c.srai       a2, 7
                  c.nop
                  c.lui        s7, 31
                  c.or         a2, a1
                  c.lui        a0, 21
                  andi         a0, s3, -1005
                  ori          a0, s11, -2027
                  srli         t3, s2, 9
                  or           s9, a5, s8
                  csrrci       s9, 0x340, 6
                  csrrci       s11, 0x340, 0
                  csrrwi       t3, 0x340, 29
                  slti         a3, ra, -221
                  c.or         s1, a3
                  nop
                  c.and        a0, a1
                  srl          s0, a2, t1
                  c.xor        a1, a0
                  remu         a3, a6, a1
                  xori         t5, t1, 1037
                  lui          a2, 389082
                  div          s7, s1, s11
                  csrrci       a3, 0x340, 0
                  xor          a6, s7, tp
                  c.addi4spn   s1, sp, 992
                  c.andi       a2, 12
                  srl          a1, tp, sp
                  xor          a0, t6, s2
                  c.li         t4, -1
                  c.add        a4, a1
                  mul          t3, a1, s6
                  mulhu        tp, s0, t4
                  c.xor        a4, s0
                  sra          a1, s3, a6
                  xor          a5, zero, t6
                  auipc        s11, 263374
                  divu         zero, t5, tp
                  c.addi4spn   a5, sp, 96
                  remu         s5, t3, s3
                  mulhsu       a3, t2, s10
                  csrrc        t1, 0x340, ra
                  csrrc        t0, 0x340, t6
                  sltu         a7, s5, s5
                  auipc        a3, 590512
                  srai         t3, s3, 0
                  srli         a7, t4, 12
                  sltiu        a2, a6, -3
                  c.xor        a5, s0
                  auipc        t6, 917483
                  c.or         a4, s1
                  add          s7, t2, s2
                  sltiu        a4, s9, -658
                  lui          s5, 800545
                  slti         a6, s5, 313
                  nop
                  lui          s1, 744169
                  c.and        a0, s0
                  rem          s1, t2, a6
                  c.add        a0, t3
                  mulhu        a5, a0, s6
                  sra          t0, a5, a7
                  addi         t4, t1, 44
                  sltu         a1, gp, a0
                  div          s4, s2, t2
                  or           t0, a6, s3
                  add          t6, t4, t5
                  slt          t4, zero, zero
                  slti         sp, s0, -1903
                  c.nop
                  csrrw        a1, 0x340, s9
                  mulhu        a3, a3, s9
                  nop
                  c.sub        a0, a3
                  mul          t3, s3, sp
                  slli         a3, t6, 2
                  srli         t3, t6, 23
                  mulhsu       tp, s8, a1
                  sll          s2, t3, sp
                  divu         t6, a4, s5
                  div          s8, s3, gp
                  c.andi       a0, -1
                  csrrw        t5, 0x340, a3
                  div          s7, s4, ra
                  and          tp, a4, t4
                  xori         t5, t6, -324
                  c.add        a4, a3
                  c.sub        a5, a0
                  csrrci       s6, 0x340, 0
                  and          a1, gp, t0
                  c.andi       s0, -1
                  mulhsu       sp, t5, tp
                  c.nop
                  xor          a2, sp, s1
                  addi         s4, zero, 1727
                  xor          s0, s8, s11
                  mulhu        a3, t1, s9
                  slt          s11, a0, sp
                  c.xor        a5, a0
                  c.xor        a5, s1
                  c.sub        a2, s1
                  add          s0, ra, a5
                  and          t6, t4, a6
                  c.addi16sp   sp, 32
                  nop
                  c.andi       a0, -1
                  c.lui        s1, 1
                  slti         s4, t6, -1264
                  c.add        t1, a2
                  or           t1, t3, t2
                  remu         tp, zero, a6
                  or           s2, a1, t6
                  nop
                  addi         t1, s0, -471
                  csrrci       t4, 0x340, 26
                  sltu         s7, a7, tp
                  c.andi       s1, -1
                  srl          s6, a7, sp
                  divu         s6, t4, gp
                  c.add        t6, a3
                  csrrs        sp, 0x340, tp
                  ori          t0, t6, -1839
                  lui          ra, 477274
                  c.srli       a1, 22
                  slti         a2, t2, -1114
                  c.sub        a5, a0
                  csrrsi       s1, 0x340, 10
                  c.li         a6, -1
                  rem          a6, gp, t0
                  c.add        s7, t0
                  c.and        a5, s1
                  rem          s1, s1, a3
                  div          a3, a4, s0
                  mul          a3, s1, a3
                  c.xor        a4, s0
                  slli         a7, gp, 7
                  xori         t4, t6, -1017
                  csrrs        t3, 0x340, gp
                  c.slli       t0, 5
                  sub          s9, t4, a2
                  csrrsi       s0, 0x340, 0
                  srai         a1, s4, 13
                  c.sub        a1, a5
                  div          t6, s11, s0
                  srai         s9, zero, 3
                  add          a0, a1, s9
                  or           t5, tp, tp
                  div          s4, s5, a2
                  c.slli       t3, 31
                  nop
                  sra          t1, a0, a3
                  c.add        t6, a3
                  srai         s11, sp, 15
                  slli         t1, ra, 2
                  sltiu        s6, s8, -1920
                  rem          a6, s6, s0
                  c.srai       a4, 12
                  xor          a3, s11, s2
                  divu         a1, s5, s1
                  csrrc        t3, 0x340, s5
                  c.slli       gp, 11
                  c.li         a7, -1
                  c.slli       a3, 11
                  mulhsu       t1, a0, s10
                  divu         t3, s1, a0
                  add          s0, sp, a4
                  slti         s4, t6, 1689
                  c.srli       a1, 28
                  c.sub        a4, a1
                  c.li         a3, 22
                  c.xor        s0, a1
                  c.xor        a0, s0
                  csrrw        zero, 0x340, t4
                  mulhu        a7, a1, a7
                  and          t4, s3, t1
                  csrrc        a4, 0x340, a7
                  mulh         a6, s3, a6
                  remu         s6, s6, a0
                  mulhu        zero, a6, a3
                  divu         a7, t6, s1
                  sub          s9, s10, t0
                  c.srai       a2, 18
                  c.sub        a4, a5
                  csrrci       t4, 0x340, 0
                  csrrc        gp, 0x340, s9
                  c.li         s11, 8
                  c.addi4spn   s0, sp, 208
                  csrrci       a0, 0x340, 0
                  c.srai       s1, 7
                  slt          sp, t3, a6
                  c.and        a1, a3
                  sltu         s1, sp, tp
                  andi         a6, a6, -1733
                  sltu         sp, s2, a1
                  c.nop
                  c.mv         t5, s2
                  csrrw        s1, 0x340, s8
                  mul          t4, a4, ra
                  or           ra, s10, a5
                  c.srai       a5, 21
                  csrrci       gp, 0x340, 0
                  slti         s8, a1, -370
                  c.addi16sp   sp, 144
                  sll          s7, s10, a6
                  c.add        a1, a5
                  ori          a6, gp, -1962
                  c.andi       a1, -1
                  c.or         a1, a3
                  mul          s6, t2, s5
                  c.addi       s8, 8
                  c.andi       s0, 5
                  csrrw        t1, 0x340, s0
                  and          t1, a7, a4
                  ori          s6, t0, -272
                  csrrs        s8, 0x340, zero
                  lui          tp, 452973
                  mulhsu       t0, a6, sp
                  sra          tp, s7, s8
                  csrrci       t1, 0x340, 0
                  c.andi       a5, -1
                  c.or         s1, s0
                  c.sub        a0, s1
                  slti         s9, tp, 904
                  xori         a1, t6, 773
                  c.li         tp, 8
                  c.slli       s8, 7
                  c.add        s6, s8
                  auipc        s5, 334172
                  csrrwi       t5, 0x340, 9
                  c.nop
                  c.lui        t6, 27
                  xor          ra, a4, a1
                  csrrwi       s0, 0x340, 1
                  csrrw        s5, 0x340, zero
                  c.addi4spn   a5, sp, 16
                  c.nop
                  srai         s2, s9, 17
                  sltu         ra, a7, t0
                  c.nop
                  c.xor        a1, a4
                  csrrs        a5, 0x340, a6
                  csrrci       a3, 0x340, 0
                  c.andi       a1, -1
                  mulhsu       s11, ra, s5
                  divu         t4, s7, s5
                  sltiu        a0, t5, -1295
                  c.srai       a4, 28
                  divu         t5, a3, a4
                  csrrc        zero, 0x340, zero
                  c.addi4spn   a2, sp, 496
                  c.addi4spn   a0, sp, 992
                  csrrw        a3, 0x340, s6
                  c.srli       a1, 28
                  sub          a2, s8, s5
                  addi         s9, a5, 222
                  or           t1, a1, a2
                  divu         s0, s3, a0
                  c.add        a4, sp
                  sra          zero, t0, a1
                  sltu         a6, s5, a6
                  xori         sp, sp, -1232
                  c.addi16sp   sp, -16
                  c.addi       tp, -1
                  c.or         a0, a3
                  sltu         s9, s7, s4
                  slt          t1, s4, a3
                  mul          sp, s2, sp
                  c.addi       t6, 30
                  c.srai       s0, 7
                  c.addi       a2, 2
                  sll          s7, a7, a6
                  csrrc        a5, 0x340, zero
                  xori         t6, a2, -272
                  andi         a7, a6, 892
                  slt          t1, a6, s0
                  c.srai       a0, 14
                  csrrsi       t1, 0x340, 0
                  auipc        t0, 733870
                  srl          a6, t2, s10
                  srli         gp, a2, 16
                  or           s4, a4, a3
                  csrrsi       s5, 0x340, 0
                  divu         gp, a1, t2
                  xori         t1, a3, 1539
                  slt          a3, s10, a1
                  sub          a0, s11, t3
                  csrrci       s8, 0x340, 24
                  c.slli       t4, 27
                  srai         s0, s4, 19
                  divu         t3, s8, a2
                  c.addi4spn   s1, sp, 800
                  sltu         a6, s8, s2
                  slli         t0, a1, 0
                  xor          t4, t2, s4
                  srl          gp, t4, s10
                  c.li         s11, 28
                  and          t4, tp, a1
                  c.or         a4, s1
                  mul          a3, a2, s11
                  mul          t0, s10, a3
                  mulhu        a1, a1, s5
                  rem          t1, ra, a1
                  andi         a4, t1, -1805
                  lui          ra, 236737
                  mulhsu       a6, a5, s4
                  c.srli       s0, 24
                  c.mv         s5, s9
                  sra          a6, s6, s6
                  c.srli       a0, 15
                  sltu         t6, t1, t5
                  add          t0, s11, zero
                  and          t3, s3, s4
                  or           tp, a7, s1
                  c.xor        a0, a1
                  or           a1, s1, zero
                  csrrc        s7, 0x340, gp
                  addi         s7, s8, 502
                  csrrw        a2, 0x340, a4
                  c.add        a4, s8
                  sltu         ra, s0, a6
                  xor          s9, sp, s8
                  slli         zero, s11, 11
                  c.mv         s2, ra
                  c.xor        a3, s1
                  c.or         s1, s1
                  div          s7, a2, s5
                  c.nop
                  sltiu        s7, t1, -1496
                  auipc        a1, 383218
                  auipc        t4, 520417
                  div          gp, t4, s5
                  c.add        s8, t5
                  csrrw        t0, 0x340, s7
                  andi         a7, a6, -80
                  c.mv         a3, a0
                  c.xor        a2, a0
                  slli         s7, t4, 23
                  c.nop
                  c.or         a1, s0
                  sll          s7, s10, s8
                  xori         gp, t6, -435
                  c.addi16sp   sp, -16
                  sll          gp, a0, a7
                  divu         tp, t6, s10
                  c.or         a0, s0
                  c.or         a5, a2
                  c.addi4spn   a5, sp, 192
                  c.addi4spn   a2, sp, 704
                  and          a1, a3, t6
                  csrrwi       a2, 0x340, 1
                  srli         s9, sp, 7
                  ori          t6, zero, -138
                  csrrci       s6, 0x340, 0
                  sltiu        s9, sp, 1689
                  c.srli       s0, 31
                  mul          s9, a6, a0
                  nop
                  c.slli       t0, 2
                  slti         a3, t0, -1885
                  nop
                  c.or         a3, a4
                  slti         t1, gp, -242
                  nop
                  xor          zero, a1, a3
                  c.li         s1, -1
                  c.addi16sp   sp, 496
                  nop
                  slli         s6, t4, 12
                  mulh         s0, a3, tp
                  xori         s0, t6, 809
                  srai         s11, a2, 26
                  lui          a4, 805474
                  or           t6, gp, a3
                  addi         ra, s3, -1464
                  c.xor        a4, a2
                  c.and        a5, a4
                  auipc        s0, 606174
                  c.slli       t5, 28
                  csrrw        t1, 0x340, gp
                  nop
                  sll          a4, a6, s11
                  c.lui        a6, 27
                  mulhu        t1, tp, s11
                  c.mv         t5, ra
                  rem          s6, tp, s2
                  csrrc        ra, 0x340, zero
                  slti         s11, sp, 517
                  sra          zero, t0, s10
                  srai         ra, a7, 13
                  c.addi       s7, -1
                  csrrsi       a5, 0x340, 0
                  c.sub        s1, a2
                  mul          sp, a2, s0
                  rem          a5, s11, t2
                  auipc        s2, 750153
                  andi         s4, t6, -426
                  c.slli       tp, 16
                  c.addi4spn   a5, sp, 992
                  nop
                  csrrwi       t5, 0x340, 0
                  mulhu        s11, sp, s8
                  sll          s7, t1, s11
                  sub          t6, s3, a2
                  c.add        s9, s0
                  lui          a0, 315191
                  c.srli       a4, 24
                  c.addi16sp   sp, 64
                  lui          s6, 522428
                  andi         s1, gp, -890
                  nop
                  mulhsu       s9, s2, s7
                  andi         s2, t4, -1163
                  remu         tp, s8, a3
                  sltu         s7, a6, a7
                  csrrci       s7, 0x340, 0
                  slli         tp, s2, 9
                  c.nop
                  c.addi16sp   sp, -16
                  and          a7, sp, s2
                  c.addi4spn   a2, sp, 832
                  c.li         a5, 26
                  auipc        ra, 469006
                  xor          a6, a2, a4
                  ori          a5, s7, -1638
                  mulh         a3, s4, s6
                  c.addi       ra, 13
                  andi         t1, a4, -1119
                  c.xor        a0, a3
                  and          a6, a3, s1
                  csrrci       zero, 0x340, 10
                  srli         tp, s4, 2
                  csrrsi       s1, 0x340, 0
                  c.or         a4, s0
                  div          t4, s4, a3
                  mulhu        s0, t2, t0
                  c.addi16sp   sp, 192
                  addi         tp, gp, 353
                  sra          a1, a2, a7
                  srli         tp, t0, 8
                  slt          s9, a4, t1
                  mulh         sp, t6, a3
                  rem          s5, ra, s11
                  mulh         a1, a4, a2
                  c.xor        a1, s0
                  csrrw        s9, 0x340, tp
                  or           s2, s7, gp
                  add          a3, s2, s8
                  slti         s0, s2, 1041
                  c.sub        a0, s1
                  addi         t5, zero, 788
                  c.andi       a4, -1
                  mulh         a1, s0, s10
                  c.lui        t1, 31
                  srl          a4, s1, zero
                  xori         s0, s10, 24
                  c.xor        a3, a1
                  csrrs        t3, 0x340, a0
                  c.and        a0, a1
                  xori         s9, t4, -1227
                  c.addi4spn   a5, sp, 720
                  addi         t0, s9, 1088
                  slt          t6, a2, s7
                  remu         gp, t4, t2
                  add          s9, tp, t1
                  mulhsu       t5, s0, s6
                  mulh         s2, s0, s0
                  slli         tp, t5, 12
                  rem          a5, t3, zero
                  c.nop
                  c.lui        ra, 27
                  srai         a4, s10, 22
                  nop
                  slti         tp, s11, -1125
                  sltiu        t0, t6, 1483
                  c.and        a3, s0
                  add          s1, a3, s0
                  mulhsu       a2, a2, tp
                  divu         a1, s8, zero
                  csrrs        a5, 0x340, a4
                  c.xor        a4, a2
                  mulh         t1, s5, a0
                  csrrci       s1, 0x340, 1
                  slt          t0, s5, s9
                  sub          ra, zero, s8
                  rem          s0, s3, a3
                  slli         a5, a4, 24
                  csrrw        t4, 0x340, t6
                  or           s7, t0, s10
                  c.li         s7, -1
                  c.andi       a3, 5
                  xor          s6, a0, t2
                  ori          t1, s8, -643
                  c.li         t0, 8
                  slt          s5, zero, zero
                  csrrs        s0, 0x340, s6
                  srl          s0, sp, a1
                  xor          s8, t6, t5
                  add          a3, s0, a6
                  divu         tp, s7, s1
                  c.nop
                  and          a7, gp, s9
                  c.srli       a2, 22
                  xori         t0, a3, 1206
                  add          s6, a5, s2
                  remu         sp, s3, ra
                  c.xor        a4, a3
                  sll          ra, a1, ra
                  slli         tp, t0, 27
                  xor          s9, a6, gp
                  remu         a4, s6, t2
                  xor          t5, t0, s4
                  csrrwi       a4, 0x340, 25
                  c.add        s2, t0
                  ori          a7, s8, 1867
                  csrrc        s1, 0x340, s3
                  csrrwi       a3, 0x340, 2
                  slti         s8, a5, -1965
                  c.mv         s1, t2
                  xori         a3, tp, -1793
                  csrrci       t1, 0x340, 0
                  csrrc        a2, 0x340, zero
                  c.xor        s1, a2
                  csrrs        a0, 0x340, s2
                  or           a5, gp, tp
                  c.nop
                  lui          a0, 600231
                  div          a1, s4, t3
                  sltiu        t1, s11, 918
                  lui          s8, 494713
                  div          a1, ra, s1
                  slt          a6, a6, a3
                  xor          s6, s1, s3
                  csrrc        s2, 0x340, a7
                  xori         zero, sp, 502
                  nop
                  sltu         s1, s10, ra
                  sll          t5, a3, a6
                  sub          a1, s2, s10
                  xori         t0, t4, 1081
                  andi         a2, s2, -586
                  csrrwi       a3, 0x340, 3
                  c.li         s6, 10
                  c.srai       a3, 12
                  and          tp, t6, t0
                  rem          s5, ra, s3
                  andi         s0, a7, 973
                  sra          s4, s11, a5
                  c.slli       s1, 10
                  remu         sp, t1, a2
                  mul          s2, a2, s2
                  c.slli       a7, 15
                  auipc        s7, 445047
                  xor          s9, a4, s3
                  csrrs        s7, 0x340, s1
                  c.lui        s7, 17
                  csrrsi       s6, 0x340, 20
                  csrrci       s4, 0x340, 0
                  sltiu        a1, s3, 347
                  divu         ra, a1, s6
                  srai         s5, t3, 20
                  lui          t1, 486102
                  ori          s9, a0, -1957
                  mulhu        s11, a0, tp
                  csrrwi       ra, 0x340, 21
                  srai         s0, s1, 6
                  csrrw        s8, 0x340, gp
                  c.nop
                  andi         s0, s0, -391
                  csrrs        t6, 0x340, zero
                  mul          a7, s8, a3
                  xor          zero, s10, s0
                  c.srai       a4, 1
                  c.li         s1, 21
                  slt          t1, s2, gp
                  xor          t6, a6, a5
                  sltiu        t0, t1, 213
                  mulhsu       s6, a7, s5
                  c.addi16sp   sp, -16
                  c.slli       s2, 4
                  csrrs        a1, 0x340, a3
                  sub          s1, sp, a7
                  c.lui        a6, 1
                  sub          a3, tp, t1
                  c.andi       a3, -1
                  divu         t3, gp, s4
                  srai         a1, s0, 30
                  c.srai       a3, 20
                  srli         a0, s8, 19
                  add          a5, a0, t3
                  c.addi16sp   sp, 272
                  c.add        s2, a5
                  csrrwi       t3, 0x340, 20
                  add          ra, t2, t1
                  mul          s11, a1, a1
                  lui          a4, 1046057
                  slti         a3, s8, 440
                  c.xor        a3, a0
                  c.addi16sp   sp, -16
                  c.srli       a5, 20
                  c.or         s1, s1
                  c.lui        a5, 30
                  mulhu        s8, gp, s2
                  c.or         a0, a0
                  c.nop
                  c.andi       s1, -1
                  c.slli       a6, 31
                  c.li         a7, -1
                  c.srli       a2, 16
                  srai         s8, a0, 16
                  csrrwi       sp, 0x340, 26
                  rem          s8, s8, a7
                  sll          s2, ra, gp
                  srli         s11, a7, 11
                  mulhu        s11, t0, t1
                  c.xor        s0, a0
                  sltiu        a5, a1, -1699
                  remu         a1, t6, s10
                  sub          tp, t0, gp
                  rem          t3, s6, t6
                  c.srai       a3, 15
                  c.andi       s1, 14
                  c.lui        t5, 10
                  sub          s8, tp, s10
                  c.nop
                  mul          s6, s10, a0
                  lui          t0, 759971
                  rem          t3, s5, t3
                  sub          t3, zero, ra
                  c.sub        a4, a4
                  add          s5, t6, sp
                  andi         t6, tp, -683
                  addi         t3, a2, 221
                  andi         a6, s3, 421
                  c.li         s8, 14
                  srl          s4, t4, a1
                  sra          a6, a3, t4
                  c.or         a2, a0
                  mulh         sp, s9, a7
                  srl          zero, s8, t2
                  addi         a5, a2, 44
                  rem          t1, a5, s8
                  c.addi16sp   sp, 48
                  csrrsi       s5, 0x340, 18
                  div          t5, sp, s7
                  div          s6, s3, s4
                  c.xor        a0, s1
                  mulh         s7, s7, sp
                  or           s9, a3, s5
                  rem          s4, s10, sp
                  c.or         s1, a0
                  lui          s4, 231776
                  c.or         s1, s0
                  c.xor        a4, s1
                  slt          s1, s2, a5
                  addi         t3, a7, 1789
                  c.and        s1, a2
                  sltu         s0, gp, s2
                  c.srai       a2, 16
                  csrrci       ra, 0x340, 0
                  c.addi4spn   a3, sp, 976
                  sltu         ra, s7, s0
                  xori         t4, s2, -317
                  c.mv         t3, t4
                  c.nop
                  slti         ra, t4, -146
                  csrrsi       t5, 0x340, 24
                  c.slli       gp, 31
                  remu         s11, gp, s11
                  ori          s2, t6, 365
                  srli         ra, a1, 25
                  sra          a6, s1, t5
                  c.sub        a5, a5
                  c.sub        a3, a4
                  mulh         a7, a3, a5
                  csrrw        t6, 0x340, a3
                  andi         a4, a5, 1544
                  csrrw        s6, 0x340, a7
                  mulhsu       t4, t3, t1
                  c.srli       a2, 27
                  mulhsu       a3, t1, t1
                  sll          a3, s7, a6
                  srai         s8, s8, 4
                  remu         t0, s4, s7
                  sra          ra, s4, t4
                  c.andi       a0, -1
                  ori          s8, s1, -792
                  c.lui        s6, 5
                  sub          s0, gp, a6
                  c.nop
                  c.mv         s11, s5
                  csrrs        s4, 0x340, ra
                  c.nop
                  c.addi4spn   a1, sp, 816
                  slti         t1, t5, 373
                  c.addi4spn   s0, sp, 384
                  c.sub        a4, a0
                  addi         s9, s3, 651
                  ori          a6, s4, 73
                  mulhu        s5, s10, s4
                  csrrci       a7, 0x340, 11
                  c.or         a4, a2
                  csrrs        t5, 0x340, zero
                  csrrc        ra, 0x340, zero
                  c.and        a5, s0
                  add          s7, a5, t4
                  c.addi       t3, -1
                  mulhu        a4, sp, s4
                  add          s5, s5, t4
                  mulhsu       t0, a1, zero
                  mulhsu       s9, a5, s0
                  srai         a6, a3, 6
                  c.addi16sp   sp, -16
                  auipc        s11, 749526
                  srl          t6, s3, s6
                  sltiu        sp, s11, 1437
                  addi         t4, a1, -481
                  div          t3, a6, s2
                  sltu         t4, a6, s9
                  mulhu        s11, t0, t5
                  c.slli       t4, 4
                  c.and        a3, s0
                  c.andi       s0, -1
                  add          a5, s7, s4
                  mulh         a2, s10, t3
                  rem          gp, sp, t6
                  addi         a2, zero, -74
                  c.mv         s4, s4
                  c.addi       s9, 13
                  c.add        s4, s2
                  srai         s0, t2, 1
                  and          a1, s10, tp
                  c.addi4spn   a5, sp, 992
                  addi         t6, t5, -2009
                  c.and        a0, s1
                  srli         a5, a0, 2
                  addi         tp, s7, 1795
                  divu         a0, a1, tp
                  c.mv         s6, t0
                  divu         t6, t5, s10
                  c.srai       a3, 14
                  srli         t0, a5, 11
                  csrrc        t1, 0x340, s2
                  slli         sp, a4, 4
                  csrrw        a4, 0x340, s8
                  csrrc        s2, 0x340, a5
                  c.li         a1, -1
                  c.lui        s9, 21
                  mulhsu       s2, t4, s3
                  mulhu        gp, s11, s9
                  div          tp, a1, s6
                  csrrci       a0, 0x340, 0
                  c.addi       t0, 10
                  c.mv         a5, a2
                  srai         a5, t4, 8
                  sll          ra, s7, s7
                  c.addi4spn   a3, sp, 208
                  csrrsi       t3, 0x340, 0
                  div          a0, gp, a4
                  andi         zero, s10, -1461
                  sltu         a3, a4, a3
                  c.srli       a0, 6
                  nop
                  c.srli       a3, 26
                  addi         s5, ra, -296
                  addi         s8, sp, -982
                  auipc        gp, 801592
                  csrrw        a0, 0x340, s11
                  xor          sp, s5, s8
                  sub          zero, s1, s5
                  c.slli       s2, 28
                  srl          t5, a6, s6
                  c.add        s2, s6
                  slti         a2, t2, -2031
                  slli         t5, t1, 18
                  c.lui        t4, 4
                  slli         t3, a3, 16
                  slli         s7, a6, 29
                  c.li         a6, 3
                  c.srli       a2, 14
                  add          tp, t4, s6
                  srli         zero, a6, 14
                  c.and        a0, a3
                  and          t0, s8, a2
                  c.li         s0, 8
                  add          s8, s0, s8
                  c.addi       t0, -1
                  c.addi       t3, -1
                  and          a1, s5, s11
                  ori          a0, s2, 32
                  sra          a5, t3, tp
                  csrrw        sp, 0x340, t3
                  srl          s0, s5, s10
                  sra          t1, t1, a4
                  or           t0, t5, s7
                  c.or         a2, a0
                  c.slli       a1, 24
                  xori         a5, t2, 342
                  c.sub        a4, s0
                  rem          a1, s6, s8
                  mulhu        tp, a5, gp
                  rem          t1, a3, s7
                  slli         s4, zero, 18
                  div          s9, t6, t0
                  c.mv         s6, s5
                  srai         t6, a7, 27
                  lui          t0, 478970
                  csrrsi       a2, 0x340, 0
                  c.andi       a5, 26
                  sltiu        a0, a0, 2022
                  c.lui        s1, 4
                  csrrs        sp, 0x340, zero
                  slt          t3, t6, s8
                  csrrwi       a4, 0x340, 21
                  csrrci       s0, 0x340, 21
                  csrrci       s8, 0x340, 0
                  xori         s1, t4, 257
                  c.addi16sp   sp, -16
                  mulh         a4, zero, a5
                  slt          s7, ra, s8
                  srai         s1, a6, 11
                  csrrc        tp, 0x340, ra
                  c.add        t5, a5
                  divu         ra, s11, s1
                  c.slli       s8, 26
                  c.srli       a4, 31
                  c.addi       s11, -1
                  or           t5, s3, t1
                  lui          sp, 588827
                  c.nop
                  c.add        s1, s0
                  srli         s0, s0, 18
                  slti         ra, gp, 1605
                  srai         s6, s1, 11
                  sra          a1, t5, s5
                  c.addi16sp   sp, 464
                  sltu         a4, a4, s3
                  xor          s6, zero, a4
                  sltu         s2, t2, s11
                  lui          s7, 485329
                  c.and        s1, s0
                  sltiu        a5, t2, -1978
                  auipc        a1, 549839
                  mulhsu       sp, a7, s3
                  slli         tp, sp, 5
                  sltiu        a0, ra, 298
                  csrrwi       s9, 0x340, 20
                  mulhsu       t1, tp, t2
                  c.lui        t3, 15
                  c.or         a0, s0
                  c.srli       a4, 16
                  c.mv         s9, t4
                  lui          s0, 384418
                  c.sub        a0, s0
                  c.or         a4, a5
                  mulhu        sp, s8, t2
                  csrrwi       s2, 0x340, 13
                  srli         sp, s5, 16
                  mulh         a5, t1, s10
                  andi         a0, s8, 296
                  csrrc        a1, 0x340, s3
                  csrrw        s11, 0x340, tp
                  andi         t3, s2, 329
                  slli         a7, a0, 30
                  sll          s5, zero, gp
                  auipc        s2, 1029492
                  csrrci       s2, 0x340, 4
                  remu         t1, s4, s8
                  csrrwi       s5, 0x340, 28
                  c.lui        t6, 22
                  slt          s5, a6, s5
                  c.or         a0, a5
                  mulhsu       t0, t5, a3
                  mulh         a4, tp, s2
                  csrrwi       a6, 0x340, 25
                  sra          s5, s2, s5
                  c.add        a0, a6
                  mulhu        s0, t4, a0
                  c.lui        a1, 28
                  add          s2, a6, a2
                  mulhu        a0, t3, s9
                  sltiu        t0, t1, -1167
                  xori         a7, s0, 1372
                  mul          a6, s1, zero
                  div          s9, s0, s8
                  remu         a1, a4, a0
                  xor          t0, s4, s10
                  srl          s6, a1, s8
                  c.nop
                  csrrc        t6, 0x340, a6
                  xori         zero, s11, 738
                  c.andi       a4, 3
                  slli         t4, s8, 7
                  xor          t0, a7, s6
                  div          a4, t3, zero
                  remu         a3, t6, t1
                  c.addi16sp   sp, -16
                  sll          s8, s2, s6
                  mulhu        t5, a2, t6
                  mul          a7, s1, s2
                  sra          ra, s1, a5
                  add          s6, t6, t4
                  div          sp, zero, a6
                  csrrwi       a7, 0x340, 15
                  csrrci       s9, 0x340, 0
                  c.srli       a5, 11
                  div          t3, s5, s8
                  c.and        a5, a3
                  xori         a5, s5, 855
                  xori         a4, gp, 327
                  c.xor        a4, a4
                  mulhsu       a7, t0, t2
                  andi         a3, s5, -160
                  c.li         a0, -1
                  mul          t5, zero, s8
                  andi         tp, a4, 1433
                  c.addi       tp, 29
                  andi         t1, s9, 1862
                  csrrwi       s9, 0x340, 3
                  rem          s9, s7, s3
                  ori          s6, t6, -2037
                  andi         t6, s4, -172
                  sltiu        a7, zero, 838
                  c.addi16sp   sp, -16
                  sra          a2, a4, gp
                  sub          a3, s6, s8
                  xor          s7, sp, s4
                  csrrwi       a6, 0x340, 25
                  csrrci       ra, 0x340, 0
                  sra          t6, s3, s0
                  lui          t0, 626447
                  ori          t1, a7, -1892
                  slt          s1, a3, ra
                  csrrci       gp, 0x340, 0
                  csrrw        s1, 0x340, a1
                  csrrsi       t4, 0x340, 27
                  lui          t1, 862460
                  xor          sp, t2, s7
                  mul          s11, a7, s4
                  srai         s5, sp, 1
                  c.addi       a1, 12
                  srl          t4, a6, s7
                  mulh         a1, s1, a1
                  slti         t6, s7, -1723
                  csrrwi       a1, 0x340, 23
                  c.mv         a7, t4
                  remu         gp, s9, ra
                  remu         a4, t0, s8
                  c.andi       s1, -1
                  c.addi       t0, 23
                  mulhu        a6, a7, s9
                  xori         a5, s10, 1514
                  c.or         a1, a0
                  xori         s7, s3, -1413
                  nop
                  c.addi16sp   sp, -16
                  csrrwi       t6, 0x340, 7
                  c.nop
                  c.or         a3, s0
                  sra          a4, a2, sp
                  csrrc        s6, 0x340, s6
                  rem          t1, s0, a1
                  slli         t5, s0, 6
                  c.and        a2, s1
                  srl          a5, s7, ra
                  c.slli       s7, 5
                  c.xor        a4, a4
                  slt          a2, a4, zero
                  nop
                  srai         t0, t2, 3
                  mulhu        s9, t4, t4
                  c.srli       a4, 21
                  c.or         a1, a3
                  c.addi4spn   a5, sp, 944
                  sra          t6, tp, a7
                  andi         gp, t5, -1589
                  div          s0, sp, t3
                  srl          zero, sp, a0
                  csrrwi       a2, 0x340, 3
                  mul          s7, zero, s4
                  andi         a7, sp, 1872
                  addi         a4, s0, -169
                  sll          s8, t3, t0
                  srl          t6, s9, t3
                  slli         t0, t3, 11
                  slt          s1, s9, s11
                  csrrc        t0, 0x340, zero
                  xor          a4, a0, s2
                  c.li         sp, 7
                  c.slli       t4, 13
                  csrrci       a7, 0x340, 0
                  sll          a2, a7, a5
                  sub          a3, s11, a3
                  lui          s9, 74823
                  auipc        s6, 706628
                  sll          a5, t4, t6
                  sra          a6, a0, a6
                  or           t5, s4, s0
                  c.srai       a3, 22
                  c.sub        a2, a4
                  nop
                  sub          a2, a3, a2
                  and          s11, a1, a6
                  c.li         s0, -1
                  c.nop
                  c.slli       t0, 19
                  sll          sp, s3, a4
                  c.sub        s1, a3
                  slli         t1, s8, 7
                  lui          s2, 941893
                  or           t0, a5, zero
                  mulhsu       s5, s11, s9
                  slt          t6, tp, t1
                  c.sub        a0, a4
                  div          a1, tp, a0
                  c.srai       a5, 7
                  csrrw        a7, 0x340, s8
                  csrrci       a3, 0x340, 0
                  sll          s0, t6, a2
                  csrrs        s0, 0x340, zero
                  c.sub        a3, a1
                  c.li         s6, 3
                  c.and        a5, a1
                  csrrwi       a3, 0x340, 31
                  andi         s8, a5, 930
                  c.addi16sp   sp, 48
                  c.slli       a6, 2
                  csrrwi       s9, 0x340, 30
                  c.and        a3, s1
                  csrrci       s5, 0x340, 27
                  csrrsi       gp, 0x340, 0
                  csrrc        zero, 0x340, zero
                  mul          a0, s2, a1
                  sltu         t4, gp, a3
                  csrrw        zero, 0x340, s0
                  sra          s11, s2, a6
                  slt          gp, t0, t6
                  sltu         s6, a7, t2
                  remu         gp, t4, s2
                  srai         s4, t1, 6
                  slt          a5, s6, s7
                  slti         ra, s9, 289
                  c.sub        a0, s1
                  ori          a6, a4, -238
                  sub          tp, a7, a7
                  c.andi       a1, -1
                  addi         s8, s6, 534
                  c.addi16sp   sp, -16
                  c.or         a1, a2
                  rem          tp, t2, s2
                  c.xor        a1, s1
                  auipc        s1, 203930
                  add          s9, gp, t6
                  and          s0, a1, ra
                  c.mv         t3, s2
                  c.addi16sp   sp, 240
                  or           s4, a4, t2
                  c.mv         a4, a5
                  nop
                  c.andi       a1, 10
                  c.srli       a1, 8
                  c.srli       s1, 14
                  or           zero, s5, s3
                  lui          t5, 648405
                  andi         a3, a7, -1668
                  sll          s5, s11, s4
                  csrrsi       t1, 0x340, 9
                  xori         a6, t0, 600
                  c.andi       a0, -1
                  csrrs        t6, 0x340, a1
                  c.addi4spn   a2, sp, 848
                  c.addi       s7, 13
                  c.and        a5, a3
                  csrrwi       s1, 0x340, 17
                  remu         zero, s3, ra
                  c.add        t4, t4
                  c.addi16sp   sp, 384
                  c.and        a3, a5
                  c.nop
                  c.xor        s0, a1
                  ori          s6, a6, -1207
                  mul          a6, s6, s11
                  sra          t4, a3, a3
                  rem          a2, a1, s5
                  c.mv         a4, t5
                  c.addi       t1, -1
                  srai         t3, ra, 9
                  c.slli       a6, 17
                  andi         s2, s5, -6
                  and          s1, s9, t3
                  csrrw        s7, 0x340, a7
                  mulhu        a0, a6, t3
                  c.nop
                  nop
                  csrrs        a0, 0x340, s11
                  c.li         ra, 30
                  c.lui        a0, 22
                  sra          a2, t6, t6
                  addi         t5, s10, -1009
                  sra          t6, t1, tp
                  srli         t0, t2, 19
                  sltiu        s11, zero, -1918
                  c.add        t6, t3
                  c.sub        s0, s0
                  slt          t5, s9, a6
                  c.nop
                  mulh         sp, s1, s4
                  slti         a4, t4, -865
                  srli         s1, a6, 14
                  c.srli       s1, 20
                  c.addi4spn   s0, sp, 800
                  remu         sp, s10, s10
                  andi         s5, t2, 211
                  csrrsi       sp, 0x340, 12
                  add          a7, t0, a2
                  c.mv         s6, t2
                  mulhsu       s6, a2, a1
                  add          a1, a0, s1
                  mul          t0, a0, a1
                  c.or         a0, a1
                  csrrci       t4, 0x340, 29
                  divu         s5, a1, a4
                  mulh         s9, t4, a4
                  mulhu        s7, gp, ra
                  sltu         s6, a0, a4
                  addi         ra, s9, -616
                  sra          a0, t1, s8
                  csrrs        t4, 0x340, zero
                  csrrsi       a6, 0x340, 0
                  csrrci       t0, 0x340, 0
                  mulhsu       t4, t5, s4
                  slt          t5, t3, a3
                  csrrw        t0, 0x340, ra
                  xori         sp, s11, 755
                  sra          tp, a1, s9
                  c.add        s2, s6
                  c.add        a3, t2
                  sra          tp, a6, s9
                  nop
                  csrrc        s6, 0x340, zero
                  c.slli       a5, 10
                  srai         t6, t5, 19
                  srai         zero, a1, 0
                  c.nop
                  c.mv         t5, s4
                  csrrw        a7, 0x340, zero
                  c.lui        a4, 17
                  csrrw        s0, 0x340, zero
                  sll          s5, t5, a0
                  c.nop
                  c.srai       a0, 29
                  c.slli       a6, 27
                  c.srai       a3, 14
                  slt          a4, s6, s6
                  rem          s9, tp, tp
                  addi         a2, gp, 776
                  c.srli       s1, 11
                  c.slli       gp, 10
                  c.add        a1, a4
                  c.srli       s1, 31
                  srai         tp, t3, 21
                  mul          s2, s9, s3
                  remu         a6, a3, ra
                  ori          s8, ra, -1750
                  c.slli       s1, 10
                  c.mv         gp, t4
                  slt          t0, s5, a6
                  andi         a6, t5, 1244
                  c.nop
                  c.sub        a3, a3
                  nop
                  slti         a6, t3, 1811
                  ori          t6, a3, -1148
                  andi         t5, s4, -219
                  csrrci       a6, 0x340, 17
                  andi         tp, a5, -698
                  c.andi       a4, 12
                  srai         t5, a5, 10
                  xori         s7, a1, -1603
                  c.addi4spn   a2, sp, 64
                  div          a3, a7, s9
                  remu         a2, a0, sp
                  c.mv         a2, s0
                  c.sub        a5, a5
                  c.andi       a2, 7
                  divu         s11, zero, s10
                  c.srli       a0, 7
                  c.srai       s1, 26
                  mulh         sp, s6, a1
                  c.addi4spn   s1, sp, 528
                  auipc        t0, 686529
                  c.xor        a5, a1
                  divu         t0, s8, a5
                  addi         a2, s7, 338
                  c.srai       a4, 29
                  c.lui        t5, 30
                  add          tp, s6, s10
                  csrrwi       zero, 0x340, 5
                  nop
                  addi         t6, s0, 1314
                  c.xor        s1, a4
                  c.mv         gp, t6
                  mulh         a4, s4, t4
                  c.slli       s9, 9
                  csrrw        s9, 0x340, t6
                  auipc        a6, 68714
                  sll          s9, a0, a6
                  sll          s11, ra, a3
                  c.or         a4, a5
                  auipc        a3, 493762
                  c.and        a1, s1
                  auipc        t5, 677341
                  csrrs        tp, 0x340, s5
                  srai         zero, s3, 20
                  csrrci       a4, 0x340, 15
                  nop
                  slti         a0, s2, -1780
                  c.li         gp, -1
                  xori         s6, t5, -1601
                  c.mv         t4, a3
                  c.addi4spn   s1, sp, 672
                  c.and        a3, a0
                  c.addi4spn   a5, sp, 864
                  csrrs        t1, 0x340, ra
                  sub          gp, s6, tp
                  csrrci       s8, 0x340, 0
                  c.slli       t6, 15
                  slt          zero, a1, a4
                  csrrw        s6, 0x340, s0
                  add          t0, t1, s6
                  nop
                  c.xor        a4, s1
                  c.or         s0, s1
                  sra          s9, t0, a0
                  c.and        a3, a2
                  c.and        a3, a3
                  rem          s8, s4, s11
                  lui          s9, 425875
                  divu         a6, a6, ra
                  c.or         a5, a1
                  add          a2, a3, a4
                  sltiu        a0, a2, 1592
                  csrrwi       a3, 0x340, 28
                  xor          s8, sp, tp
                  sltu         s11, s1, sp
                  srai         s9, a5, 31
                  sltiu        s6, a7, 856
                  c.lui        t6, 2
                  c.addi       s4, -1
                  c.srai       a0, 14
                  c.addi16sp   sp, 304
                  divu         t6, a4, s0
                  c.mv         a7, s1
                  c.and        a3, a4
                  c.mv         a1, s5
                  srli         t1, s3, 17
                  c.add        t5, sp
                  sra          a5, ra, a5
                  c.srli       a4, 18
                  c.addi4spn   a2, sp, 656
                  srai         a0, t4, 0
                  srl          s11, s2, s5
                  sll          tp, a0, ra
                  c.addi16sp   sp, -16
                  div          a7, zero, s9
                  divu         s0, t1, s4
                  c.andi       s1, -1
                  sub          zero, a4, s6
                  srai         s5, s9, 13
                  andi         s7, s3, 587
                  auipc        s2, 215883
                  srli         s9, a7, 22
                  c.andi       s1, 29
                  slli         s2, s10, 28
                  addi         s11, s7, 313
                  slli         zero, tp, 23
                  and          a5, s7, s11
                  csrrc        t3, 0x340, zero
                  c.xor        s0, a1
                  auipc        t5, 449249
                  csrrwi       t3, 0x340, 21
                  csrrwi       t6, 0x340, 14
                  c.sub        s1, a5
                  mul          a2, gp, tp
                  lui          t5, 928044
                  c.lui        s7, 3
                  c.slli       s5, 18
                  slti         tp, zero, -722
                  sltiu        t0, zero, -1039
                  mulhsu       t1, s5, t4
                  c.add        s1, a2
                  slti         a0, a1, -1019
                  c.srai       a5, 24
                  xor          t6, s3, t5
                  c.srai       a5, 5
                  andi         t5, a3, 394
                  c.and        a0, a1
                  c.or         s1, a2
                  srli         a2, zero, 15
                  srai         tp, s0, 24
                  srai         gp, a7, 25
                  csrrc        t3, 0x340, zero
                  csrrw        t5, 0x340, s2
                  csrrci       s8, 0x340, 16
                  srl          a1, a3, gp
                  c.and        s1, a5
                  c.and        a2, a4
                  slti         t4, s4, -1735
                  c.lui        t6, 23
                  addi         s2, s0, -1097
                  c.andi       a4, -1
                  remu         s1, sp, t3
                  srli         s5, s10, 9
                  csrrc        a0, 0x340, s4
                  rem          a2, s4, a3
                  c.xor        a3, s0
                  slti         s9, a7, 1450
                  c.slli       s7, 28
                  c.lui        t5, 24
                  sub          t1, t4, gp
                  div          a1, ra, s6
                  csrrwi       s5, 0x340, 26
                  c.andi       s0, -1
                  c.addi       t4, 14
                  csrrw        t3, 0x340, t3
                  sra          s5, s11, s5
                  mul          s7, ra, t2
                  mulhu        s4, s2, s6
                  slt          s11, t4, t6
                  csrrw        s1, 0x340, s3
                  c.addi       s0, 24
                  sub          t0, a6, s8
                  c.addi       s7, -1
                  c.slli       s7, 13
                  remu         s4, t6, gp
                  slti         s2, t3, 802
                  srli         gp, s9, 1
                  xor          a7, s4, a7
                  sra          a0, s3, a0
                  or           s11, s4, s5
                  srl          s2, tp, s6
                  sltu         sp, a3, tp
                  andi         s8, t6, -1409
                  sll          s2, sp, t0
                  or           a3, a6, s2
                  andi         sp, t1, -798
                  auipc        a7, 61910
                  xor          s7, s2, s10
                  c.addi       t6, -1
                  slti         t3, s1, 1740
                  mulhu        a0, s4, s10
                  andi         s0, t6, -1192
                  srli         a0, a7, 2
                  mulh         s6, s8, s5
                  nop
                  or           s4, t0, s11
                  c.sub        s0, s0
                  csrrwi       t5, 0x340, 9
                  xori         a5, s3, -1771
                  c.and        a0, a2
                  slti         a2, t3, 1377
                  c.srli       a5, 27
                  sltiu        s4, t2, 1550
                  auipc        t4, 360661
                  c.lui        ra, 21
                  c.lui        ra, 6
                  mulhsu       s9, t2, s8
                  ori          t3, sp, 1327
                  c.li         s6, -1
                  nop
                  rem          s7, s0, t3
                  remu         s7, s6, a2
                  mulhsu       gp, s5, s4
                  csrrwi       a0, 0x340, 8
                  csrrci       t6, 0x340, 0
                  c.addi4spn   a5, sp, 80
                  c.srai       s0, 26
                  csrrci       s5, 0x340, 5
                  divu         s0, ra, t3
                  xor          a1, s10, t4
                  csrrsi       a7, 0x340, 0
                  c.and        s0, a5
                  and          tp, zero, a2
                  mulh         t6, s2, s0
                  sra          tp, gp, t3
                  and          t1, s7, gp
                  csrrci       a3, 0x340, 0
                  sltiu        a5, a2, -884
                  c.srai       a5, 6
                  srl          s6, zero, s5
                  and          a1, t6, t4
                  xori         a3, t1, 158
                  slti         s8, s1, 41
                  mulh         a4, s0, s6
                  c.srli       s0, 9
                  c.nop
                  csrrwi       t4, 0x340, 18
                  c.sub        s0, a4
                  c.and        a5, a2
                  sltiu        a6, s7, 210
                  csrrsi       zero, 0x340, 0
                  csrrs        s5, 0x340, s9
                  sltiu        s2, a1, -451
                  slti         t0, t2, 176
                  csrrsi       t0, 0x340, 6
                  rem          s0, t3, sp
                  remu         tp, t6, t4
                  c.li         t3, -1
                  xor          s0, zero, t6
                  sltu         s1, ra, t2
                  c.addi16sp   sp, -16
                  xor          s5, t5, s8
                  sltiu        s6, s7, 959
                  c.addi       a7, 14
                  or           s5, t2, s11
                  c.add        t5, t3
                  c.xor        a5, a3
                  mulh         s9, s4, s1
                  csrrc        gp, 0x340, zero
                  addi         ra, s6, 1763
                  c.li         a0, 0
                  remu         t5, a3, a0
                  srl          s2, tp, t6
                  csrrs        ra, 0x340, zero
                  sra          s9, s8, s4
                  divu         t1, gp, a7
                  or           sp, s6, s4
                  addi         s9, s10, 1836
                  sltu         sp, s0, a5
                  c.li         s6, 25
                  c.slli       s7, 16
                  c.andi       a4, 16
                  csrrci       gp, 0x340, 0
                  c.lui        a2, 27
                  c.slli       t1, 5
                  ori          t4, s4, -1642
                  srai         gp, s0, 10
                  sltu         a4, s3, t0
                  sub          a3, a1, a0
                  csrrci       ra, 0x340, 0
                  rem          a6, s3, a1
                  divu         a7, t1, sp
                  c.sub        a1, s0
                  add          s1, s7, a7
                  sll          a2, s8, s8
                  sltu         t3, t3, s8
                  srai         s6, s1, 9
                  remu         a4, s2, s6
                  sltu         s1, ra, t6
                  andi         a6, a5, -350
                  mulhu        s1, t2, t4
                  c.mv         t1, s9
                  mulhu        t0, zero, a2
                  mulhu        s11, t6, s2
                  csrrsi       t3, 0x340, 31
                  srai         t1, s8, 4
                  auipc        t3, 589716
                  csrrsi       a2, 0x340, 0
                  sub          s4, a3, a7
                  mulhsu       s7, a7, s7
                  remu         a4, t0, t0
                  c.and        a1, a3
                  add          t6, t3, gp
                  slli         ra, s1, 30
                  c.srli       s0, 20
                  auipc        a0, 817756
                  sra          t4, ra, t0
                  c.mv         a7, s1
                  div          t0, s4, s9
                  srli         s9, t0, 16
                  c.sub        a4, s0
                  srai         t0, t2, 22
                  c.andi       a2, -1
                  c.addi4spn   a0, sp, 800
                  mulhu        a0, t2, a0
                  csrrci       t0, 0x340, 0
                  csrrci       a3, 0x340, 18
                  andi         a5, t3, -987
                  c.li         t1, -1
                  rem          sp, a2, s1
                  slti         t5, gp, -973
                  c.srai       a0, 25
                  add          tp, t0, a4
                  csrrc        s4, 0x340, t5
                  or           ra, t5, tp
                  csrrsi       s0, 0x340, 13
                  c.or         s1, a5
                  c.addi16sp   sp, -16
                  or           t5, gp, t4
                  or           t1, a4, sp
                  mul          t1, s8, a2
                  c.addi16sp   sp, -16
                  c.mv         s8, ra
                  slli         s0, s6, 20
                  auipc        s5, 521290
                  c.and        s1, a2
                  c.sub        a3, a1
                  nop
                  add          s2, s1, s6
                  rem          s7, tp, s6
                  and          s11, t6, s11
                  c.srli       a5, 29
                  remu         ra, sp, t5
                  csrrw        s6, 0x340, a4
                  c.slli       sp, 20
                  csrrc        s5, 0x340, zero
                  c.and        s1, a4
                  lui          s7, 711939
                  srli         s1, t0, 31
                  sltu         a6, a2, s7
                  c.addi4spn   a3, sp, 336
                  csrrs        t6, 0x340, s6
                  and          a5, sp, t4
                  div          zero, a0, t3
                  c.addi16sp   sp, -16
                  c.srai       a3, 13
                  c.sub        a1, a0
                  c.srli       a4, 2
                  div          s5, s2, zero
                  c.andi       a1, -1
                  sltu         t5, s1, s10
                  srl          t4, s2, a0
                  c.add        a5, s8
                  c.addi16sp   sp, -16
                  slli         s2, s0, 25
                  slli         a1, t2, 31
                  c.add        tp, a3
                  mulh         s6, s1, t5
                  csrrwi       s6, 0x340, 0
                  c.mv         a2, s1
                  or           s7, s1, zero
                  div          gp, t1, t2
                  c.addi       t1, 3
                  csrrw        t1, 0x340, s6
                  csrrs        s8, 0x340, zero
                  or           a6, s4, a5
                  andi         t5, t4, -873
                  addi         a6, s1, -995
                  lui          a5, 614836
                  csrrsi       a4, 0x340, 0
                  mul          a7, s3, a6
                  slli         s11, s8, 18
                  csrrwi       a6, 0x340, 19
                  c.addi4spn   s0, sp, 576
                  div          s0, a3, t4
                  mulh         s6, a1, t2
                  srai         t1, t6, 19
                  slt          sp, a5, t5
                  mul          s2, s0, s9
                  nop
                  add          t0, t0, sp
                  c.nop
                  c.slli       s9, 28
                  add          gp, ra, t3
                  csrrc        a2, 0x340, zero
                  c.slli       t4, 3
                  slli         a7, s0, 13
                  sub          t1, s2, t4
                  slli         sp, a2, 25
                  auipc        s6, 1040949
                  csrrsi       s9, 0x340, 0
                  c.andi       a5, 22
                  csrrci       s9, 0x340, 0
                  csrrc        s1, 0x340, ra
                  c.addi       t6, -1
                  sll          s0, a1, s4
                  divu         a2, s2, a2
                  xor          a0, s7, s1
                  xor          a4, sp, s4
                  c.addi       a0, 16
                  sub          t6, a4, t0
                  csrrc        s9, 0x340, s11
                  mulhu        s4, a1, sp
                  srai         s2, gp, 21
                  remu         t6, t4, s11
                  c.sub        a4, a3
                  c.srli       s1, 31
                  addi         sp, s2, -166
                  div          s11, a2, s0
                  c.and        a1, a0
                  c.addi16sp   sp, -16
                  ori          tp, a2, -1700
                  srli         s8, s8, 0
                  lui          s5, 294374
                  c.andi       a0, 0
                  srli         a6, s10, 9
                  sll          s5, s0, t5
                  csrrw        a5, 0x340, a1
                  or           a6, s0, s4
                  xor          a1, s1, s10
                  lui          tp, 196388
                  csrrc        s0, 0x340, zero
                  csrrwi       s7, 0x340, 0
                  csrrc        s9, 0x340, a2
                  c.and        a5, a4
                  or           zero, s5, t5
                  csrrs        s7, 0x340, zero
                  sra          gp, t6, gp
                  c.addi4spn   s0, sp, 288
                  c.xor        a2, a1
                  mul          s2, s6, a7
                  mul          a0, t4, s3
                  c.slli       a5, 12
                  c.and        a1, a2
                  srai         s2, s1, 11
                  sub          s4, s6, a5
                  csrrci       a1, 0x340, 0
                  c.or         a2, s0
                  mulhsu       t6, t2, a5
                  divu         s7, s1, a4
                  rem          t0, t4, ra
                  c.li         t3, 19
                  csrrw        s9, 0x340, tp
                  srli         s11, s1, 16
                  csrrc        s6, 0x340, zero
                  c.lui        s8, 6
                  c.addi       a5, 29
                  andi         a7, ra, -1890
                  c.lui        s5, 22
                  sll          s4, s2, a7
                  c.srai       a2, 3
                  csrrci       s6, 0x340, 13
                  c.li         s1, -1
                  c.li         t4, -1
                  mulh         a0, a1, s11
                  c.li         s7, -1
                  addi         gp, s8, 756
                  srai         s11, s4, 21
                  ori          s7, t2, -351
                  c.or         a3, a5
                  and          t3, t2, s7
                  sll          a3, s2, t2
                  nop
                  sltu         s4, a6, tp
                  c.li         a7, -1
                  c.lui        s9, 2
                  c.and        a5, a1
                  csrrwi       s5, 0x340, 10
                  slti         a4, s9, -987
                  slti         a6, a3, -1806
                  slli         a4, tp, 26
                  sra          a0, t3, t1
                  srl          s2, s5, s9
                  c.srli       s1, 22
                  c.addi16sp   sp, 256
                  remu         a7, t2, t2
                  c.nop
                  c.slli       sp, 18
                  div          t1, s9, s1
                  mulhu        s1, a0, s10
                  csrrw        t3, 0x340, s6
                  csrrc        t5, 0x340, s11
                  c.and        a3, a1
                  csrrs        a4, 0x340, zero
                  srl          gp, t3, tp
                  slli         s9, s9, 0
                  sltiu        sp, s8, -1655
                  csrrs        s6, 0x340, zero
                  srl          t6, s8, tp
                  c.or         a5, a0
                  andi         s1, s10, 1043
                  nop
                  c.lui        s4, 18
                  sltiu        s8, tp, -893
                  c.addi16sp   sp, 480
                  c.and        a2, a5
                  addi         s8, s5, -1747
                  rem          a2, tp, t0
                  rem          s2, tp, a0
                  mul          s8, a1, a2
                  c.add        s2, s11
                  csrrw        s2, 0x340, s9
                  c.li         ra, 11
                  c.xor        a3, s1
                  c.li         t0, 30
                  sub          t5, a0, s10
                  rem          s7, s10, t2
                  c.mv         s5, a7
                  csrrc        s9, 0x340, zero
                  csrrwi       tp, 0x340, 8
                  addi         a2, s5, 1130
                  slt          zero, gp, a0
                  div          s8, a1, s4
                  srli         a1, zero, 17
                  c.nop
                  lui          t4, 80976
                  sltu         a4, a4, ra
                  sub          t0, a0, s4
                  lui          t6, 290979
                  andi         t4, s5, -295
                  sub          t3, s5, a6
                  addi         gp, a2, 1572
                  csrrsi       s7, 0x340, 8
                  sll          a0, s4, s10
                  c.andi       s1, -1
                  csrrw        s0, 0x340, s10
                  slt          tp, s5, s2
                  c.srli       a3, 16
                  c.li         s4, 0
                  c.addi4spn   a4, sp, 112
                  c.slli       t1, 2
                  sra          a2, s11, s10
                  sll          gp, t2, s9
                  c.addi4spn   a2, sp, 224
                  csrrc        t4, 0x340, s5
                  c.or         a0, a4
                  mulh         a5, sp, t2
                  sltu         s5, a6, t0
                  c.and        s1, a3
                  c.srli       a5, 6
                  c.srai       a5, 27
                  csrrs        s2, 0x340, zero
                  csrrs        a6, 0x340, s5
                  mul          a1, t6, t4
                  andi         s9, a3, -796
                  div          zero, a7, a5
                  slt          ra, s10, s3
                  c.addi16sp   sp, 336
                  c.slli       a3, 7
                  c.or         a1, a3
                  c.srai       a2, 30
                  c.nop
                  xori         a0, zero, 568
                  csrrsi       t0, 0x340, 20
                  c.addi4spn   a1, sp, 720
                  srai         t1, s0, 2
                  c.andi       s1, -1
                  c.srai       s0, 8
                  sub          a3, ra, s4
                  c.slli       s11, 25
                  c.mv         t3, t1
                  auipc        ra, 675144
                  csrrc        zero, 0x340, zero
                  slli         s5, s6, 23
                  sll          t6, s10, t2
                  divu         s6, s7, ra
                  mulh         a0, t0, tp
                  srli         gp, t3, 12
                  lui          t0, 734256
                  csrrwi       t1, 0x340, 0
                  c.sub        s1, a2
                  mulhu        s5, s3, gp
                  csrrw        s1, 0x340, ra
                  sub          s6, gp, t5
                  addi         t6, a4, 153
                  c.srli       s0, 17
                  c.addi4spn   a0, sp, 128
                  c.add        tp, s2
                  divu         a2, a4, t1
                  csrrw        a2, 0x340, a3
                  div          t5, t5, a1
                  add          s9, a3, a1
                  c.addi       s8, -1
                  c.andi       s0, 12
                  and          a1, t5, s8
                  c.lui        a5, 27
                  c.srli       a0, 18
                  mulh         zero, t0, a1
                  csrrwi       a1, 0x340, 17
                  sra          ra, a5, a3
                  csrrs        a6, 0x340, zero
                  lui          a0, 349264
                  ori          a2, s11, -429
                  or           tp, s0, s4
                  c.sub        s1, a0
                  srli         s8, gp, 23
                  c.lui        s0, 12
                  csrrc        t5, 0x340, a7
                  c.slli       t0, 31
                  c.addi       t6, 10
                  c.srai       a4, 22
                  mulh         t4, s5, s2
                  srai         sp, s1, 19
                  auipc        s4, 41705
                  c.srai       a0, 25
                  csrrw        s0, 0x340, t4
                  c.nop
                  c.sub        a2, s0
                  rem          a2, a2, a7
                  csrrs        gp, 0x340, tp
                  mulh         s9, a2, s7
                  mulhu        a1, s1, s3
                  c.sub        a1, a1
                  sub          s11, s1, s3
                  c.srai       a0, 21
                  c.srai       a1, 16
                  c.slli       a0, 25
                  auipc        a4, 682983
                  sltu         a1, sp, s7
                  sltu         a4, s8, s10
                  c.addi4spn   s0, sp, 112
                  c.srli       a5, 20
                  slt          a5, s3, t5
                  mul          zero, sp, t6
                  ori          a1, s7, 264
                  csrrwi       t4, 0x340, 9
                  slti         gp, zero, 719
                  c.sub        a1, a0
                  div          s6, s1, s9
                  c.xor        s1, s1
                  csrrc        t1, 0x340, zero
                  lui          s2, 30207
                  c.addi4spn   a1, sp, 288
                  divu         a1, s8, ra
                  slt          t6, s11, zero
                  c.srli       a3, 21
                  mulh         a0, s6, s4
                  slli         s8, ra, 10
                  csrrw        a0, 0x340, t5
                  srli         a4, a5, 25
                  div          t0, t5, a5
                  sltiu        tp, t1, -1682
                  sra          t3, t4, a7
                  auipc        a3, 814805
                  div          a6, s8, a3
                  c.addi       a3, -1
                  c.or         a2, a0
                  c.or         s1, s1
                  divu         t4, a6, a6
                  c.addi       s11, -1
                  c.addi4spn   a2, sp, 128
                  c.slli       s0, 7
                  c.addi16sp   sp, -16
                  c.sub        a4, a3
                  sll          s7, s9, t3
                  sll          a4, t0, s4
                  remu         a1, ra, a1
                  mulhu        a4, a6, s5
                  c.and        a3, a4
                  rem          gp, s9, s2
                  div          s2, s3, s7
                  c.lui        t3, 9
                  c.and        s1, s0
                  srl          t1, s11, sp
                  csrrw        s0, 0x340, zero
                  csrrsi       s8, 0x340, 24
                  addi         t5, a2, 603
                  slti         a4, s2, 717
                  c.addi16sp   sp, -16
                  csrrci       a3, 0x340, 29
                  sll          s8, s0, s5
                  sll          s2, t6, s8
                  c.or         s0, a5
                  andi         s8, t1, 2009
                  csrrci       s9, 0x340, 17
                  slt          a4, s1, s7
                  add          t0, s1, s5
                  slt          zero, a1, t6
                  slti         t0, s2, -1790
                  c.and        a3, a4
                  c.or         a0, s1
                  or           gp, s8, a0
                  c.addi16sp   sp, -16
                  srl          a0, s3, s9
                  xori         s7, t0, 1946
                  srai         t0, a2, 7
                  mulh         s9, s10, a2
                  nop
                  srli         a5, s0, 29
                  c.srli       a3, 22
                  lui          a5, 30061
                  mulhsu       s2, a0, a3
                  csrrw        s5, 0x340, t6
                  or           sp, a6, s11
                  sltiu        t6, t0, -715
                  srli         s5, t6, 22
                  xori         a2, t3, 1484
                  mulh         s9, s0, t4
                  div          t3, s2, s11
                  nop
                  csrrs        s11, 0x340, zero
                  sll          s7, zero, t0
                  slli         t6, s5, 30
                  xori         a0, s6, 594
                  remu         a6, s2, s2
                  slt          a3, t6, a4
                  c.mv         s11, t0
                  add          s4, t6, t0
                  or           a2, a7, s3
                  srl          tp, t3, t1
                  c.andi       a2, 27
                  c.or         a0, a3
                  sll          s2, a4, t0
                  divu         a0, s3, s7
                  csrrs        a5, 0x340, zero
                  c.slli       s5, 28
                  csrrsi       t0, 0x340, 0
                  c.andi       a2, 16
                  sra          t1, gp, t2
                  auipc        s2, 804213
                  c.addi4spn   a2, sp, 640
                  add          s6, s7, s7
                  rem          a4, t4, sp
                  c.xor        a2, a0
                  xor          tp, t2, ra
                  rem          s7, ra, t6
                  srai         t0, s7, 31
                  c.and        a2, a3
                  sub          ra, s9, s2
                  c.nop
                  sltiu        s8, s1, 1516
                  c.or         a5, a4
                  mulhsu       t3, s11, s3
                  sub          a5, sp, a3
                  mulh         s4, s3, s0
                  ori          s9, s10, 2047
                  mulhu        t4, s8, t3
                  addi         t3, s1, 1101
                  c.xor        a0, a1
                  nop
                  c.addi4spn   a1, sp, 480
                  c.lui        t0, 9
                  add          s11, a6, tp
                  c.add        s6, s11
                  lui          gp, 524879
                  lui          t6, 994031
                  rem          s7, a4, t2
                  slt          s5, a3, t0
                  divu         t6, a5, a6
                  divu         a2, a3, t5
                  c.add        s8, s6
                  sltu         zero, t3, ra
                  mulhsu       a3, t4, s8
                  c.mv         s7, tp
                  slt          t0, t1, t1
                  c.slli       tp, 14
                  or           s4, a7, s6
                  c.xor        a5, a3
                  mulhsu       s2, t6, s10
                  add          t0, s4, s5
                  sltu         s5, s2, t5
                  addi         a5, t6, 328
                  c.slli       sp, 22
                  c.add        tp, t6
                  c.nop
                  csrrsi       s0, 0x340, 0
                  c.li         s11, -1
                  csrrwi       s0, 0x340, 22
                  c.addi16sp   sp, 128
                  c.addi16sp   sp, -16
                  nop
                  srai         t0, a6, 30
                  csrrs        a7, 0x340, zero
                  addi         gp, s6, -524
                  c.li         s0, 3
                  c.addi       a2, -1
                  mul          s6, s6, tp
                  mul          s4, t1, s8
                  sra          ra, t3, a5
                  csrrc        sp, 0x340, zero
                  c.slli       a7, 5
                  or           a4, s10, a6
                  mulhu        tp, t3, ra
                  mulhsu       s5, a5, a6
                  ori          a3, s6, 712
                  divu         a7, a2, s7
                  add          gp, ra, t4
                  nop
                  c.lui        a2, 2
                  c.xor        a0, a3
                  div          a1, s10, gp
                  csrrs        a0, 0x340, s11
                  add          tp, s1, s2
                  auipc        s11, 500229
                  auipc        t6, 71792
                  c.slli       a6, 19
                  c.addi       a2, 28
                  c.slli       a0, 12
                  csrrwi       t1, 0x340, 23
                  c.lui        a0, 26
                  nop
                  c.or         a5, a2
                  c.or         a2, s0
                  mulh         a3, a1, s4
                  addi         s2, t2, 387
                  add          s2, tp, s7
                  and          a3, s9, sp
                  srai         t1, t0, 3
                  c.srli       a1, 25
                  sltu         s0, t4, a3
                  csrrw        zero, 0x340, t1
                  or           t6, s4, s2
                  mulhu        s1, gp, s11
                  sltiu        a4, t6, 1247
                  add          s0, tp, t5
                  mulhsu       s1, tp, t2
                  c.addi4spn   s0, sp, 752
                  xori         gp, s10, 1750
                  addi         a5, a4, -1362
                  c.andi       a4, 24
                  csrrci       t1, 0x340, 24
                  srl          s6, s7, s11
                  sltu         t3, a0, s10
                  ori          s8, a5, 269
                  remu         zero, s7, t1
                  xori         a4, s5, -504
                  slt          a1, s6, t1
                  c.slli       s0, 18
                  c.addi16sp   sp, 288
                  srli         s9, s11, 17
                  andi         gp, s4, 1222
                  c.mv         s2, a1
                  c.addi4spn   s1, sp, 384
                  csrrwi       sp, 0x340, 2
                  mulhsu       zero, s8, t2
                  and          a0, a2, s1
                  sltu         a6, a6, sp
                  csrrw        s5, 0x340, s3
                  c.slli       s4, 13
                  nop
                  sra          zero, t3, a2
                  c.addi4spn   a3, sp, 944
                  slti         s8, s10, -777
                  and          a3, t3, s3
                  nop
                  c.li         s5, 13
                  srli         ra, gp, 13
                  c.srai       a1, 17
                  xor          sp, sp, a1
                  c.slli       a3, 25
                  csrrs        s2, 0x340, a5
                  csrrs        s0, 0x340, a0
                  sltu         s4, ra, sp
                  sll          tp, a2, a6
                  sra          a3, ra, a5
                  c.xor        a5, s1
                  sll          t3, s0, a4
                  c.and        a2, s1
                  sltu         tp, s11, a0
                  addi         a1, a2, 498
                  c.addi16sp   sp, -16
                  sltiu        a0, t5, -1338
                  c.mv         sp, s4
                  c.addi       s8, -1
                  c.slli       t6, 31
                  srli         t5, a0, 18
                  c.lui        s9, 26
                  c.or         a4, s0
                  c.addi       t0, 5
                  c.andi       a1, 1
                  sltiu        tp, sp, -298
                  c.li         s1, -1
                  c.addi16sp   sp, 448
                  and          zero, a7, s3
                  c.li         s11, -1
                  c.addi16sp   sp, -16
                  auipc        s4, 1006686
                  sra          t4, s11, a3
                  srl          s6, s2, t3
                  lui          s5, 3291
                  c.add        t1, t5
                  slt          a0, s1, a7
                  divu         gp, s11, zero
                  mulh         a2, t1, a5
                  csrrwi       a3, 0x340, 18
                  add          a5, a0, a1
                  csrrc        s2, 0x340, zero
                  mulhsu       a1, gp, s9
                  ori          ra, a6, 441
                  srai         s0, a2, 17
                  and          s1, s4, t4
                  addi         s9, s1, -938
                  c.slli       t6, 24
                  slti         sp, s1, -1559
                  add          a1, a2, s8
                  c.lui        tp, 25
                  and          sp, s2, s5
                  c.sub        a2, a0
                  ori          a5, s11, -46
                  add          t6, a7, a7
                  slt          t5, s9, t0
                  srl          a7, s9, a3
                  c.sub        a2, a3
                  xor          s8, s3, t5
                  andi         t4, s5, -471
                  or           a5, s6, s7
                  andi         sp, s3, -930
                  c.lui        t6, 12
                  sll          a2, s8, t1
                  mulhsu       s0, a4, s1
                  remu         s5, s10, s1
                  sltiu        a4, gp, 1687
                  sltiu        zero, zero, 258
                  andi         ra, t3, 585
                  addi         s6, t3, -1340
                  remu         gp, s6, a0
                  c.addi       s6, -1
                  c.nop
                  mulh         s2, a6, gp
                  c.andi       a2, -1
                  csrrci       ra, 0x340, 27
                  slti         s7, t1, -367
                  c.slli       s11, 10
                  c.addi       s4, -1
                  andi         t5, s5, -630
                  c.addi16sp   sp, 448
                  divu         s8, a5, s4
                  mulh         t4, s7, a4
                  c.and        a0, a2
                  csrrs        t5, 0x340, s3
                  slt          s2, s3, a7
                  c.or         a2, a0
                  mul          s1, s8, t4
                  c.sub        a5, s1
                  nop
                  slt          sp, s2, a3
                  c.and        a3, a4
                  addi         gp, t2, 1281
                  addi         a4, t2, -1769
                  lui          t5, 629887
                  xor          a5, s4, a5
                  c.li         t1, -1
                  csrrw        a3, 0x340, a7
                  auipc        t5, 504750
                  c.li         s2, -1
                  sll          s6, zero, a0
                  c.and        a1, a5
                  srl          ra, t6, a5
                  mul          ra, zero, s6
                  xori         a4, s1, -1803
                  rem          s2, t4, s7
                  csrrs        s9, 0x340, s10
                  c.andi       a2, -1
                  slti         sp, s3, -923
                  remu         ra, a4, s6
                  divu         gp, gp, t0
                  ori          s4, s1, -1448
                  c.add        t4, sp
                  andi         t4, s9, 394
                  csrrw        t3, 0x340, t5
                  sll          a6, s4, t1
                  c.xor        a5, a5
                  c.mv         sp, ra
                  xor          a4, tp, s4
                  c.addi16sp   sp, 464
                  mulhsu       a7, gp, s2
                  and          t3, s0, ra
                  csrrsi       zero, 0x340, 0
                  mulhu        t0, a2, a7
                  c.or         a2, s1
                  c.add        s4, t3
                  sltu         a6, sp, s3
                  c.addi4spn   a3, sp, 160
                  c.nop
                  csrrc        s9, 0x340, t4
                  srli         t3, a1, 27
                  sltiu        gp, a5, 1553
                  mulhu        t1, a3, t6
                  sltu         s1, t2, t4
                  c.and        a2, s0
                  divu         s11, s4, s9
                  mulhu        t4, t5, t1
                  nop
                  c.addi16sp   sp, -16
                  sltu         a6, a7, sp
                  mul          t6, a3, t0
                  divu         s7, s0, t3
                  slli         a7, t6, 21
                  add          s4, zero, s0
                  auipc        a6, 710810
                  slt          a7, t5, a3
                  srli         t3, s10, 22
                  c.srai       a1, 24
                  div          t1, s9, s7
                  xor          s11, s11, s4
                  sra          a1, tp, a1
                  c.mv         tp, s9
                  mulhu        s9, a4, t5
                  c.nop
                  or           t3, s10, a5
                  csrrwi       a1, 0x340, 28
                  andi         s0, a3, -645
                  c.sub        s1, a4
                  c.sub        a0, a0
                  addi         t1, tp, 749
                  c.addi16sp   sp, 144
                  c.li         s4, 27
                  mulhu        s0, t1, a6
                  c.nop
                  ori          t4, s6, 1906
                  c.slli       t3, 27
                  nop
                  csrrs        s1, 0x340, a0
                  sra          t5, t1, t6
                  sub          s4, s10, s10
                  csrrsi       s0, 0x340, 29
                  divu         zero, a0, ra
                  c.xor        s0, s1
                  c.mv         s7, t5
                  c.li         s2, -1
                  c.srai       a3, 1
                  c.lui        s2, 14
                  c.li         a6, -1
                  csrrw        s2, 0x340, t1
                  mulh         s5, s2, ra
                  auipc        s6, 1041949
                  csrrc        tp, 0x340, zero
                  xor          s0, a6, t1
                  c.addi       ra, 20
                  slti         zero, a2, 2006
                  c.slli       t1, 12
                  rem          t0, a4, s5
                  c.srai       s1, 27
                  rem          ra, s10, s8
                  csrrs        s0, 0x340, zero
                  divu         s2, s1, a5
                  add          s11, s5, a6
                  sra          s2, s1, s10
                  and          t1, tp, sp
                  c.lui        s2, 24
                  csrrci       a2, 0x340, 27
                  mulhsu       s7, t2, tp
                  c.add        t5, tp
                  and          s1, t5, a7
                  csrrs        s2, 0x340, zero
                  sub          a6, a5, s3
                  c.addi4spn   a3, sp, 336
                  csrrw        s4, 0x340, a3
                  lui          t5, 872663
                  srl          a0, ra, t2
                  c.srai       a0, 25
                  c.slli       a3, 8
                  sltiu        s8, t2, -1042
                  nop
                  xori         a3, t4, -374
                  xor          s6, s10, s8
                  sll          t0, s4, a2
                  or           ra, s9, a4
                  c.li         s4, 22
                  c.srli       a2, 27
                  mulhsu       a3, gp, gp
                  c.or         a1, a4
                  nop
                  addi         zero, s5, 358
                  sub          s6, s9, s3
                  c.xor        a3, s0
                  rem          t3, a0, t3
                  remu         gp, t0, s6
                  csrrs        s2, 0x340, zero
                  add          a5, sp, a1
                  sra          a2, zero, s10
                  remu         t0, s10, a7
                  divu         a3, s4, ra
                  c.srli       a4, 14
                  c.add        tp, s5
                  slti         t1, a1, -1328
                  c.xor        a2, a2
                  c.srai       a3, 6
                  srl          s5, a6, s7
                  c.sub        a4, a4
                  c.srli       a1, 19
                  csrrc        s0, 0x340, s2
                  slli         s11, t2, 7
                  ori          t5, ra, 1863
                  csrrs        a6, 0x340, zero
                  mulhu        zero, t0, s10
                  sra          s1, t4, sp
                  csrrw        t4, 0x340, ra
                  slli         s11, s11, 15
                  c.nop
                  c.and        a3, a1
                  or           s8, t1, a7
                  or           s11, t5, s7
                  slti         a6, t1, -1033
                  sll          s0, s6, a0
                  xori         t0, s7, 1911
                  c.xor        s0, s1
                  sltu         t4, a6, a5
                  or           ra, a4, t5
                  c.sub        a2, a1
                  andi         s9, t5, 527
                  rem          t0, a3, sp
                  c.sub        a5, a2
                  c.slli       s8, 21
                  xori         t3, t1, 725
                  c.addi4spn   a4, sp, 992
                  auipc        s11, 33887
                  sltiu        t4, s9, -871
                  sltu         gp, a6, a0
                  slti         s2, a1, 241
                  c.andi       a3, -1
                  xori         s9, t2, -52
                  c.slli       s5, 20
                  sltu         sp, s9, a4
                  c.li         a3, 0
                  c.or         a4, s1
                  c.li         a2, -1
                  sltiu        a7, a6, -1770
                  c.mv         s11, s8
                  srl          a1, t0, a1
                  sltiu        t0, a0, -705
                  sltu         s1, a4, a5
                  c.addi16sp   sp, -16
                  c.addi16sp   sp, 336
                  mul          a1, s7, t1
                  sltiu        s4, s10, -1260
                  slti         t4, s4, -683
                  c.lui        a1, 29
                  c.xor        a4, a1
                  slt          t0, s7, a1
                  andi         s1, a5, 1393
                  addi         s4, s9, 20
                  c.add        a6, s7
                  mulhsu       s9, s9, t5
                  c.srai       a0, 16
                  c.srai       a5, 30
                  xori         s6, t4, -2010
                  sra          s2, s4, s7
                  sltu         s8, t4, t1
                  andi         a7, sp, -1983
                  srli         a0, t6, 16
                  c.nop
                  ori          sp, t1, -681
                  srli         s5, s0, 7
                  sltu         a5, a1, t5
                  c.or         a4, a2
                  c.and        a0, a1
                  csrrsi       tp, 0x340, 21
                  andi         gp, s2, -852
                  and          s5, sp, s4
                  sra          t5, s2, s3
                  addi         t4, a4, 250
                  c.andi       s0, -1
                  c.li         t3, 19
                  csrrw        a0, 0x340, s3
                  divu         t3, t3, gp
                  mulh         a2, s9, sp
                  c.addi4spn   s0, sp, 80
                  srl          ra, tp, t6
                  mul          a5, s6, s0
                  csrrs        zero, 0x340, t6
                  c.addi       s0, 11
                  c.and        a5, s0
                  c.add        a7, s9
                  c.add        t5, gp
                  c.srai       a0, 30
                  c.andi       a5, -1
                  mulhu        s1, a7, a2
                  slli         t1, t1, 8
                  addi         s7, s9, -587
                  c.addi       s6, -1
                  ori          t0, s1, 1187
                  slli         t5, s9, 15
                  csrrw        a4, 0x340, s8
                  slt          s2, s7, t6
                  csrrwi       a0, 0x340, 1
                  c.addi16sp   sp, 160
                  c.srli       a5, 17
                  c.add        a6, a0
                  andi         s6, s0, -990
                  mulhu        a4, a6, t4
                  ori          a0, a5, 1987
                  or           tp, s7, s7
                  slli         sp, t4, 15
                  and          a1, s7, ra
                  csrrc        s9, 0x340, zero
                  mulh         s11, t4, s2
                  lui          s5, 252993
                  csrrc        t0, 0x340, zero
                  div          s0, s2, s3
                  mulh         s6, a4, s5
                  auipc        s11, 142975
                  c.andi       a4, -1
                  mulh         tp, s8, s0
                  csrrc        t3, 0x340, a4
                  c.sub        s1, a5
                  csrrci       a3, 0x340, 0
                  csrrci       sp, 0x340, 22
                  mulhsu       a2, a3, a2
                  and          s9, s10, a0
                  c.sub        a3, a5
                  c.and        a0, a4
                  slti         t6, t5, -1509
                  sll          s1, t3, zero
                  csrrw        s9, 0x340, s0
                  sltiu        a0, s2, -1383
                  csrrwi       a1, 0x340, 12
                  and          ra, a0, zero
                  csrrci       s6, 0x340, 0
                  add          tp, a1, tp
                  mul          a7, a6, gp
                  c.xor        a2, a0
                  srai         a3, s9, 4
                  sub          gp, s7, a6
                  ori          t1, t5, 1446
                  srli         t5, a0, 29
                  c.xor        a2, a1
                  c.addi       s4, 4
                  and          a2, s6, gp
                  c.and        s1, s0
                  slli         a2, s1, 24
                  c.xor        s0, a0
                  rem          a7, t6, t0
                  c.slli       s4, 27
                  addi         ra, gp, -1470
                  sra          sp, t6, t4
                  c.addi4spn   a3, sp, 784
                  srl          s7, a5, a7
                  c.li         a4, -1
                  mulhu        a6, s10, t5
                  mulh         t6, s4, s10
                  andi         ra, s1, -1849
                  sltiu        a7, t6, -602
                  slti         s8, s1, 290
                  c.addi4spn   a5, sp, 272
                  c.nop
                  c.xor        a4, a0
                  xor          gp, ra, s0
                  divu         s8, t0, s3
                  c.or         a2, a5
                  sltu         ra, a6, s6
                  c.slli       t5, 7
                  remu         t4, a6, s6
                  div          gp, t3, a5
                  srli         zero, s3, 17
                  c.addi16sp   sp, -16
                  slli         t6, s11, 4
                  c.srli       a3, 18
                  srai         zero, s6, 18
                  c.sub        a2, a3
                  sltiu        a2, a1, -607
                  mulhsu       s8, t6, t6
                  sltu         s4, s0, a4
                  csrrsi       t3, 0x340, 0
                  sltiu        a5, a4, -574
                  c.lui        s9, 26
                  andi         a4, s4, -980
                  mul          gp, s0, a5
                  c.sub        a1, a2
                  csrrc        s2, 0x340, zero
                  rem          t3, t5, t5
                  and          s4, s7, s6
                  add          s2, a5, a3
                  mulhsu       gp, s11, s3
                  c.srli       a4, 27
                  csrrci       s2, 0x340, 0
                  srli         a6, t5, 19
                  c.andi       a1, -1
                  c.addi       sp, 13
                  sltu         s11, sp, gp
                  slli         s7, t0, 9
                  mulh         a2, s7, zero
                  c.andi       a4, 16
                  csrrc        a6, 0x340, a5
                  ori          a2, a3, 1203
                  csrrs        tp, 0x340, s3
                  sll          a1, t6, s2
                  c.lui        a5, 7
                  xor          a3, a1, tp
                  c.add        s9, s1
                  c.xor        a1, a3
                  c.nop
                  csrrsi       a1, 0x340, 0
                  c.lui        a3, 1
                  addi         t0, t2, -966
                  c.srai       s0, 1
                  sltiu        s8, s4, 244
                  ori          t1, s1, 1027
                  rem          zero, s0, a3
                  c.addi16sp   sp, 96
                  lui          s11, 539724
                  c.lui        s9, 26
                  slti         s5, s10, -1162
                  sll          t1, s10, s8
                  sll          tp, s3, s6
                  c.srli       a2, 13
                  addi         t1, s8, -1345
                  c.sub        a0, a2
                  csrrw        a7, 0x340, t5
                  slti         a7, a0, 1747
                  mulhsu       a4, zero, t3
                  mulh         s9, s10, tp
                  srai         sp, zero, 2
                  c.addi16sp   sp, 432
                  andi         tp, t5, 1183
                  xor          a5, a7, s0
                  remu         a3, s2, t0
                  slli         tp, a5, 8
                  mulhu        s1, a5, a1
                  c.srai       a1, 25
                  csrrsi       s6, 0x340, 16
                  c.srai       a3, 27
                  c.lui        s9, 27
                  c.srai       a0, 7
                  c.add        s5, t6
                  sub          a3, s4, s8
                  mulhsu       a1, t2, s11
                  c.andi       a0, 25
                  c.lui        ra, 30
                  addi         a0, s7, 1549
                  srl          a4, s10, s9
                  remu         s4, a4, t3
                  andi         s6, a6, -437
                  csrrs        gp, 0x340, s1
                  divu         s7, s8, a0
                  csrrc        t5, 0x340, s9
                  csrrwi       s0, 0x340, 15
                  slli         a4, s3, 12
                  sra          t4, a7, a0
                  csrrs        a7, 0x340, s6
                  sll          a0, a7, t0
                  ori          a1, a7, -663
                  csrrsi       a1, 0x340, 0
                  or           a5, s8, a0
                  c.lui        t3, 4
                  lui          gp, 676184
                  sub          t3, t4, t2
                  srl          gp, t4, s11
                  lui          t0, 351698
                  mulhsu       a5, s1, t6
                  xor          a1, s0, sp
                  c.xor        s1, s0
                  mulhu        t5, s3, gp
                  divu         s8, s10, a4
                  csrrci       a2, 0x340, 25
                  remu         a2, a5, t6
                  xori         s0, s9, 1491
                  divu         t0, s1, a5
                  csrrwi       a4, 0x340, 13
                  c.li         s7, -1
                  xor          s2, t1, t1
                  c.addi16sp   sp, 32
                  c.srai       s0, 23
                  auipc        zero, 393339
                  csrrw        s5, 0x340, t5
                  add          t5, tp, s0
                  csrrw        ra, 0x340, s4
                  c.andi       a0, -1
                  c.xor        a1, a0
                  csrrs        s8, 0x340, zero
                  csrrc        s1, 0x340, zero
                  addi         a3, s7, 1578
                  csrrwi       a3, 0x340, 12
                  c.and        a5, a0
                  add          t6, s3, gp
                  mulhu        a7, a5, t0
                  csrrw        s11, 0x340, a6
                  nop
                  c.addi4spn   s0, sp, 208
                  slti         s5, t0, 1759
                  mulh         s6, t0, a3
                  c.or         a3, a1
                  sltu         t6, s11, t0
                  mulhsu       t6, t6, t6
                  sltu         ra, t4, s6
                  srai         a0, a4, 21
                  xor          a6, s6, a4
                  srl          sp, t5, s11
                  sltiu        s5, t5, -158
                  c.addi       a7, -1
                  sll          s1, s10, a4
                  csrrwi       s9, 0x340, 12
                  sll          s7, t1, s3
                  mul          s0, t4, s9
                  ori          s6, s8, -440
                  xori         a5, s9, -641
                  c.li         a3, 20
                  div          t3, t5, s3
                  slli         a2, a1, 2
                  lui          a7, 669928
                  c.srai       a2, 25
                  sub          tp, t3, t0
                  remu         zero, s1, t6
                  sltiu        a1, s6, -676
                  slt          s0, t6, a2
                  add          s9, s11, gp
                  csrrsi       zero, 0x340, 0
                  remu         a3, sp, s7
                  srl          s6, s4, a3
                  mul          s6, a7, a4
                  srl          s2, s9, a6
                  ori          a2, a5, -1038
                  div          s9, a1, t6
                  csrrsi       a7, 0x340, 0
                  c.mv         sp, tp
                  sub          a3, s6, s10
                  sltu         s8, s11, s4
                  mulhu        s9, sp, a0
                  c.sub        a2, a4
                  andi         s8, a2, -356
                  srli         a0, t2, 29
                  c.andi       a4, 2
                  sltiu        s6, ra, 49
                  c.and        a0, a4
                  and          a2, s6, t6
                  csrrc        a2, 0x340, t6
                  c.addi       sp, 21
                  c.andi       a5, -1
                  c.addi4spn   a1, sp, 144
                  ori          t4, tp, -1267
                  or           s1, a1, gp
                  sltiu        s8, s1, 1032
                  addi         s1, gp, 1954
                  rem          a4, s1, s3
                  c.andi       a1, 11
                  sub          ra, s4, a0
                  csrrc        t0, 0x340, t3
                  c.or         s0, a2
                  csrrw        s1, 0x340, a2
                  mulh         s4, gp, gp
                  slli         t0, a1, 12
                  rem          a0, a7, t2
                  srli         s1, ra, 13
                  slt          t6, a6, a5
                  c.srli       s1, 20
                  nop
                  c.nop
                  sll          gp, s5, a6
                  c.srli       s0, 1
                  c.addi       t0, 10
                  xori         a3, s10, -1737
                  lui          gp, 876709
                  c.srai       a3, 16
                  mul          tp, t0, s0
                  and          a4, s11, s10
                  xori         t4, zero, -471
                  mulhsu       t0, zero, s1
                  c.lui        s7, 16
                  srl          a1, s11, a6
                  csrrwi       a5, 0x340, 9
                  csrrs        s0, 0x340, s8
                  slt          a2, sp, t1
                  csrrci       s5, 0x340, 0
                  auipc        t0, 964712
                  sltiu        a3, sp, -80
                  slli         a2, a6, 24
                  slli         s6, t2, 8
                  c.sub        s0, a1
                  c.sub        a5, a4
                  srl          s2, t5, a5
                  lui          t6, 912319
                  nop
                  div          s6, ra, s5
                  and          a0, zero, tp
                  c.andi       a2, -1
                  c.nop
                  mulh         s6, t4, a5
                  csrrsi       t1, 0x340, 1
                  c.or         a3, a0
                  c.xor        a1, a2
                  xor          a5, a7, a0
                  c.lui        s7, 5
                  c.add        s11, s8
                  lui          a0, 613222
                  csrrc        s1, 0x340, zero
                  c.li         s11, -1
                  xori         s11, a1, -667
                  srl          a6, zero, sp
                  c.sub        s0, a2
                  addi         t5, s10, -1347
                  auipc        a5, 22261
                  srli         a0, t6, 17
                  xor          a2, s10, s4
                  divu         a5, a7, gp
                  sra          s0, a5, zero
                  mulhsu       a0, a1, t6
                  add          a0, a6, t2
                  remu         a7, s11, s6
                  lui          t3, 121495
                  remu         a5, ra, s10
                  csrrsi       s0, 0x340, 0
                  slti         s2, t6, -1938
                  csrrwi       a7, 0x340, 18
                  c.slli       t0, 13
                  mulh         a2, s11, s10
                  divu         s1, s9, gp
                  c.addi16sp   sp, 80
                  rem          a1, s10, a4
                  csrrwi       sp, 0x340, 21
                  xor          s6, a0, s3
                  or           s5, s6, s5
                  sub          a3, s11, s11
                  sltu         t5, a2, t3
                  csrrc        t6, 0x340, s5
                  csrrs        s1, 0x340, zero
                  slti         s0, a0, 1661
                  c.mv         t4, s11
                  c.and        a4, s0
                  c.lui        t0, 4
                  sltiu        tp, t0, -133
                  nop
                  csrrci       a3, 0x340, 16
                  c.li         s7, -1
                  slt          a5, t3, s2
                  sltiu        a7, tp, -1744
                  c.srli       a3, 30
                  nop
                  sub          tp, a6, a2
                  c.xor        a5, a2
                  c.srli       a2, 30
                  mulh         t5, s8, a2
                  or           a5, t5, s2
                  csrrwi       s7, 0x340, 4
                  csrrw        t6, 0x340, s11
                  rem          a0, t2, a6
                  mul          s6, t3, s11
                  c.nop
                  sltiu        zero, a4, 640
                  addi         a7, a4, -1666
                  slti         s6, gp, 1376
                  csrrs        a5, 0x340, t2
                  c.and        a0, s0
                  lui          s0, 122232
                  c.addi16sp   sp, -16
                  csrrci       s9, 0x340, 0
                  mulhu        s1, t0, a5
                  mul          s11, s7, sp
                  c.slli       a0, 11
                  mulhsu       a6, a2, t5
                  c.addi4spn   a2, sp, 336
                  sltu         tp, a0, t6
                  andi         zero, a7, -101
                  sub          s11, gp, sp
                  xori         sp, s5, -173
                  c.andi       s1, 9
                  lui          s4, 1047044
                  c.and        s1, a2
                  and          t3, a3, t0
                  srai         a2, t3, 15
                  slli         a6, s6, 6
                  c.sub        a0, a3
                  csrrwi       s8, 0x340, 2
                  sra          a0, a3, s11
                  csrrs        s1, 0x340, gp
                  srai         t1, s3, 12
                  c.andi       a3, -1
                  auipc        a4, 429791
                  ori          t5, t3, 1618
                  mulhsu       a1, a5, s6
                  slti         a2, a2, -183
                  csrrwi       t1, 0x340, 31
                  xori         a3, t0, -858
                  csrrwi       zero, 0x340, 4
                  c.mv         t3, a2
                  sll          s2, s11, gp
                  sub          a0, s8, a0
                  andi         s1, a4, 1066
                  c.and        s1, a0
                  mulhu        sp, s4, t3
                  slti         a6, a4, 1798
                  csrrsi       t0, 0x340, 21
                  mulh         a0, a2, t0
                  c.li         s11, 21
                  slt          t5, tp, t1
                  nop
                  csrrwi       gp, 0x340, 26
                  csrrsi       t3, 0x340, 0
                  sub          t6, s0, a0
                  sra          t6, t2, s3
                  and          a2, t4, s3
                  c.add        a4, ra
                  mul          gp, a5, t2
                  srli         s0, s0, 21
                  c.addi4spn   s1, sp, 784
                  slt          t0, t1, a2
                  c.andi       a1, -1
                  rem          zero, t6, s0
                  div          s1, gp, s5
                  nop
                  rem          tp, t5, zero
                  csrrw        s6, 0x340, t6
                  remu         s8, ra, s6
                  xor          sp, ra, s11
                  ori          s9, s8, -600
                  or           a5, s11, s10
                  c.or         a4, s1
                  addi         t6, s4, -290
                  c.srli       a2, 11
                  c.lui        a7, 26
                  auipc        t5, 835891
                  addi         a7, t3, 1578
                  xori         s1, tp, -1328
                  c.and        a5, s1
                  sltiu        a1, a6, -491
                  srl          s5, s10, t5
                  divu         s8, a6, gp
                  c.xor        a1, a4
                  csrrw        a0, 0x340, tp
                  lui          a5, 359063
                  c.andi       a0, 24
                  c.mv         t5, t2
                  c.slli       s1, 24
                  sub          t5, s4, zero
                  xori         s4, s9, -1660
                  srai         s9, sp, 21
                  c.srai       a3, 27
                  addi         a4, s5, -282
                  csrrci       a6, 0x340, 0
                  lui          s9, 705695
                  csrrw        t3, 0x340, s6
                  c.and        a1, a4
                  sltiu        s5, s5, -1334
                  csrrci       s9, 0x340, 30
                  csrrwi       s4, 0x340, 30
                  lui          s2, 80148
                  c.andi       a4, 21
                  sltiu        a1, a0, 1673
                  c.li         a7, -1
                  c.sub        a0, a1
                  divu         ra, t0, s3
                  mulh         s11, ra, a7
                  mul          t5, a4, s10
                  c.li         s5, -1
                  mulh         a3, s8, a6
                  c.srai       a3, 22
                  mulhsu       ra, a6, s0
                  remu         s2, s11, sp
                  mul          s0, t0, s1
                  xori         a7, gp, -1630
                  slt          s1, t1, a7
                  and          a5, s8, gp
                  c.xor        s0, s0
                  remu         t4, s6, a1
                  c.and        a0, a2
                  c.lui        a3, 3
                  lui          ra, 789403
                  csrrsi       a2, 0x340, 9
                  sll          a1, s10, s4
                  xor          s0, a6, a0
                  c.xor        a5, a4
                  addi         s2, s11, -1115
                  srai         s9, s2, 31
                  slt          s7, a4, a3
                  slli         a4, s1, 1
                  csrrc        s11, 0x340, zero
                  addi         gp, a2, 1186
                  c.nop
                  csrrw        s0, 0x340, s1
                  xor          s5, zero, t4
                  ori          s9, s5, -1561
                  sltiu        a7, a6, 855
                  auipc        s6, 614313
                  slti         s7, a0, -1755
                  slt          s0, s0, s10
                  c.sub        a4, s0
                  csrrsi       s7, 0x340, 5
                  auipc        zero, 513033
                  xori         s6, s10, -730
                  rem          s1, s3, a1
                  slli         a3, a4, 14
                  c.and        a3, s1
                  mulhu        s1, a6, a2
                  slt          sp, a0, t1
                  slt          a2, zero, s11
                  mulh         a2, gp, s5
                  xori         s9, sp, 1052
                  mulh         ra, a2, s6
                  csrrw        a2, 0x340, s8
                  csrrci       tp, 0x340, 0
                  c.lui        t1, 31
                  c.slli       t4, 21
                  remu         t5, s3, a7
                  andi         a4, ra, 1111
                  divu         sp, t3, t1
                  srli         s6, a0, 29
                  c.andi       a0, -1
                  c.nop
                  lui          s4, 934859
                  sltiu        t4, t2, 1470
                  mul          s4, s0, a6
                  addi         a6, a2, -1337
                  mul          tp, s7, s4
                  c.lui        s9, 24
                  sltiu        a7, gp, -606
                  c.andi       a0, 27
                  xor          s1, t6, t3
                  mulh         s2, a4, a3
                  csrrw        t4, 0x340, s2
                  c.sub        a1, a5
                  c.addi16sp   sp, 176
                  csrrsi       t3, 0x340, 10
                  divu         a2, a0, s8
                  c.sub        a4, a3
                  mulhsu       s9, gp, a3
                  c.addi4spn   a2, sp, 288
                  xor          zero, ra, t3
                  lui          s11, 200186
                  srli         t5, a2, 28
                  c.or         a5, a5
                  mulhu        s0, t5, a5
                  ori          t6, a7, 421
                  sltu         s8, a3, s6
                  or           s2, s4, s3
                  mul          tp, t3, t0
                  csrrs        t6, 0x340, zero
                  sub          s8, t2, a7
                  and          s11, zero, s11
                  add          s4, t6, a0
                  csrrwi       ra, 0x340, 4
                  xor          ra, ra, s11
                  c.lui        s8, 1
                  csrrsi       a3, 0x340, 0
                  auipc        tp, 444156
                  slli         s2, t5, 0
                  srli         gp, a6, 29
                  csrrwi       s4, 0x340, 24
                  auipc        a4, 624065
                  c.and        a3, a3
                  c.nop
                  c.addi       t0, 12
                  rem          s2, t0, s3
                  addi         s5, ra, -162
                  sll          tp, s7, s10
                  mul          s2, a6, s4
                  c.lui        s6, 1
                  slli         s2, t5, 18
                  ori          t0, a1, 644
                  lui          a1, 193934
                  c.addi       t3, -1
                  c.lui        s9, 11
                  sltu         t1, a1, s1
                  c.sub        a3, s0
                  c.srai       a4, 8
                  c.sub        a3, s0
                  mulh         a6, a1, s10
                  div          s7, s4, t3
                  slti         tp, s7, -76
                  divu         a7, a2, ra
                  slli         s9, t4, 1
                  slt          a5, a0, s3
                  srli         s7, ra, 4
                  c.addi16sp   sp, -16
                  c.and        a1, a5
                  csrrwi       t5, 0x340, 9
                  add          gp, t1, a1
                  nop
                  remu         s5, t6, s7
                  and          t5, s2, t5
                  divu         zero, t5, a5
                  c.slli       t1, 13
                  mulhsu       t3, t5, a1
                  csrrc        s11, 0x340, zero
                  auipc        sp, 853875
                  sltu         a0, a2, t0
                  c.and        s0, a0
                  c.and        a4, a3
                  rem          a0, t4, s3
                  csrrs        a5, 0x340, zero
                  rem          t5, a0, t4
                  or           s5, t3, s11
                  c.addi4spn   a0, sp, 752
                  c.and        s0, a4
                  c.addi16sp   sp, 32
                  lui          a4, 557235
                  div          t3, a5, s10
                  csrrc        t3, 0x340, a1
                  mulhsu       ra, a7, gp
                  csrrc        tp, 0x340, a7
                  divu         t0, a3, s9
                  sltiu        a2, a7, 1592
                  csrrsi       a5, 0x340, 0
                  or           s11, s0, t2
                  srl          a2, zero, s8
                  c.li         s11, 3
                  slli         t5, t1, 18
                  csrrsi       s5, 0x340, 0
                  sltiu        ra, s7, 389
                  c.sub        a0, a3
                  auipc        s6, 936377
                  srai         s4, a3, 30
                  mulhsu       a4, s9, a4
                  mulhu        s8, sp, t5
                  c.andi       a4, 2
                  csrrw        s4, 0x340, s7
                  slti         s5, s6, -198
                  csrrw        t5, 0x340, s1
                  slt          a7, s8, s0
                  nop
                  slli         s0, t3, 17
                  ori          tp, a6, 31
                  slt          sp, tp, t5
                  slti         t3, ra, 853
                  sltiu        zero, s11, 1238
                  c.andi       s1, -1
                  c.addi16sp   sp, -16
                  csrrsi       gp, 0x340, 28
                  mulh         a0, t3, gp
                  csrrc        tp, 0x340, t1
                  csrrsi       a3, 0x340, 0
                  rem          s9, a4, s10
                  csrrci       a0, 0x340, 20
                  csrrw        a7, 0x340, a7
                  slti         s11, s1, -695
                  csrrw        tp, 0x340, s8
                  c.and        a4, a2
                  sub          t1, a0, t0
                  add          a0, s9, t4
                  csrrci       t3, 0x340, 0
                  c.addi16sp   sp, 496
                  auipc        a2, 584874
                  xor          s9, ra, s4
                  c.li         a4, 2
                  sll          a2, s3, t1
                  slt          a3, s6, gp
                  csrrci       t0, 0x340, 0
                  mul          s7, t0, a0
                  sub          sp, s0, a4
                  slt          t3, a6, t6
                  or           a5, s2, s9
                  rem          a6, s10, s0
                  c.and        a1, a5
                  sltu         a6, a5, s7
                  c.add        t5, a2
                  sll          ra, t5, tp
                  c.slli       a3, 12
                  c.lui        a3, 24
                  slt          ra, t6, s6
                  sltu         s4, s5, s11
                  csrrw        a1, 0x340, s0
                  c.addi16sp   sp, -16
                  c.add        t3, s4
                  div          t5, a3, s6
                  c.sub        a2, s1
                  div          s2, s7, t6
                  mul          a5, s5, a6
                  addi         a0, s5, 1360
                  csrrc        s9, 0x340, s9
                  c.lui        s0, 28
                  c.addi16sp   sp, 48
                  nop
                  andi         s5, t5, -934
                  sll          a0, s11, t0
                  xor          s7, a7, s7
                  c.srli       s0, 3
                  c.add        a7, t4
                  csrrsi       s7, 0x340, 0
                  nop
                  ori          s7, ra, 1992
                  csrrs        a2, 0x340, zero
                  divu         t5, a5, s2
                  c.srai       a0, 12
                  sra          t6, s8, t1
                  csrrs        s7, 0x340, s6
                  sub          a2, gp, a0
                  c.slli       ra, 29
                  c.and        a3, a3
                  xor          a0, s10, s0
                  c.srli       s1, 15
                  slli         s5, a5, 22
                  sra          t0, s2, s3
                  sra          zero, s8, a0
                  andi         sp, t3, -1178
                  div          t6, zero, a1
                  slli         s0, a1, 11
                  andi         t1, a3, -116
                  c.lui        a6, 15
                  csrrwi       a4, 0x340, 20
                  andi         s8, t1, -1152
                  csrrs        a1, 0x340, zero
                  and          a7, gp, s8
                  add          s5, s1, s6
                  csrrwi       t5, 0x340, 5
                  sltiu        a5, a7, 657
                  csrrs        t6, 0x340, zero
                  nop
                  div          t4, s8, gp
                  and          s11, s0, s10
                  add          tp, s6, s7
                  xor          s1, s5, t0
                  sltu         a6, a2, a5
                  c.andi       a3, -1
                  slti         a1, s4, 916
                  c.li         a6, -1
                  lui          t5, 266597
                  c.srai       s1, 26
                  mulhu        s2, a3, s5
                  c.mv         s8, t3
                  remu         sp, t4, tp
                  c.srli       s0, 22
                  ori          tp, s5, -838
                  csrrw        a6, 0x340, a6
                  lui          s5, 775538
                  xor          t3, gp, s8
                  sub          a7, s2, s6
                  csrrs        s7, 0x340, zero
                  sub          a5, t4, t6
                  srai         s7, s7, 7
                  slt          a5, t4, s10
                  srl          a2, s4, t2
                  c.slli       s11, 13
                  c.xor        a1, a0
                  sltu         sp, s11, sp
                  addi         a4, ra, 1079
                  and          s5, t2, t1
                  c.srai       a2, 29
                  andi         s7, t3, 993
                  c.sub        a5, a5
                  lui          sp, 377775
                  slli         s4, zero, 5
                  srli         t4, s6, 11
                  slli         sp, s8, 5
                  csrrw        ra, 0x340, s10
                  c.addi       a6, -1
                  divu         a1, a5, s9
                  c.srai       a2, 25
                  remu         s1, zero, t0
                  slt          s11, t4, s6
                  sub          tp, t6, a4
                  mul          sp, a6, t0
                  xor          t3, zero, a4
                  srli         s0, s1, 9
                  c.srai       a3, 4
                  c.and        a1, a4
                  c.addi       s4, -1
                  addi         t5, a4, 731
                  remu         s7, a2, tp
                  slti         s1, s0, -1554
                  sltiu        s5, zero, 109
                  csrrc        s1, 0x340, zero
                  rem          a2, a6, s10
                  c.sub        a1, s1
                  csrrwi       a4, 0x340, 25
                  mulh         gp, a7, a7
                  slli         s6, a4, 19
                  xori         s11, s1, -1221
                  srl          t0, t1, s1
                  sra          a1, s10, t1
                  c.srai       a5, 13
                  xori         t6, a7, 814
                  c.or         s0, s0
                  c.addi16sp   sp, -16
                  slti         t3, t4, -561
                  c.or         a0, a5
                  and          zero, s3, ra
                  remu         zero, zero, t3
                  csrrw        s0, 0x340, s11
                  xor          a1, t1, t5
                  sltu         a6, s10, s2
                  c.or         s0, a2
                  srli         s6, t5, 3
                  srai         s5, s1, 16
                  slt          s4, tp, s1
                  csrrs        t6, 0x340, sp
                  c.addi16sp   sp, 80
                  csrrs        t1, 0x340, ra
                  csrrsi       tp, 0x340, 12
                  sub          t4, s6, a1
                  mul          zero, s11, s2
                  c.andi       a1, -1
                  c.addi4spn   a5, sp, 896
                  mulhsu       sp, zero, s6
                  c.srli       a4, 25
                  andi         t5, s1, 1735
                  sltiu        a5, s4, 399
                  c.lui        s2, 7
                  c.andi       a0, 8
                  csrrc        s11, 0x340, s2
                  csrrsi       a1, 0x340, 0
                  xori         a0, t1, 284
                  c.addi       s5, 10
                  c.andi       a5, -1
                  andi         gp, s5, 720
                  add          gp, s4, ra
                  addi         a7, s2, -947
                  slt          a5, s2, ra
                  c.addi4spn   s1, sp, 544
                  and          s8, t3, a2
                  sltiu        t5, a4, 1478
                  c.nop
                  c.xor        a1, a2
                  c.xor        s1, s0
                  sltiu        s7, a3, 178
                  divu         s2, t2, t0
                  c.lui        a1, 4
                  c.addi       s2, 11
                  sltu         t3, ra, s1
                  mulhu        s6, s9, t5
                  mul          s2, s3, a2
                  slti         a1, gp, 926
                  csrrs        sp, 0x340, zero
                  addi         t4, t4, 60
                  csrrci       a7, 0x340, 0
                  xor          t5, t2, t2
                  c.srai       a2, 16
                  addi         t4, t2, -1975
                  c.lui        tp, 2
                  c.andi       a5, -1
                  sll          s4, s4, s9
                  c.slli       tp, 12
                  c.srai       s1, 28
                  slt          a2, s7, s10
                  xor          s2, a1, a4
                  sltiu        a5, s10, -1998
                  c.add        ra, t2
                  c.nop
                  add          a3, s6, s6
                  c.mv         t3, t1
                  c.addi16sp   sp, 384
                  and          gp, a7, ra
                  srli         a2, a2, 0
                  c.andi       a1, -1
                  c.sub        a4, a5
                  c.add        a0, s3
                  ori          t6, a4, 1113
                  nop
                  addi         s2, s0, -1577
                  c.addi       a2, -1
                  c.sub        a5, s1
                  c.or         s1, a2
                  add          a4, s0, t4
                  andi         a6, t0, -272
                  c.srli       s1, 7
                  slt          t1, a4, a1
                  csrrw        tp, 0x340, zero
                  slli         a2, s11, 10
                  c.addi       s4, 14
                  c.addi4spn   a3, sp, 544
                  sll          zero, zero, t4
                  c.addi4spn   a3, sp, 1008
                  csrrc        zero, 0x340, t4
                  mulhsu       s5, t5, s11
                  c.addi4spn   a2, sp, 624
                  lui          s8, 201592
                  sra          t3, s4, s6
                  slli         a6, a2, 18
                  andi         a2, zero, 557
                  sub          a2, t2, t3
                  csrrw        t3, 0x340, s7
                  xori         a4, s2, 1625
                  csrrw        a3, 0x340, s7
                  c.nop
                  and          a0, a1, a1
                  or           t3, a6, t2
                  remu         t6, s0, a5
                  c.srli       a1, 20
                  srai         s1, s3, 21
                  c.and        s0, a5
                  c.srli       a5, 4
                  rem          a7, a7, s5
                  srli         s9, a2, 16
                  c.sub        a3, s0
                  addi         a2, t1, 195
                  remu         t0, a7, a0
                  c.or         a1, a2
                  c.and        a0, a1
                  auipc        s0, 343038
                  slt          tp, sp, s2
                  csrrwi       s11, 0x340, 24
                  c.nop
                  xori         s8, tp, -1833
                  div          a1, t5, s11
                  c.addi16sp   sp, -16
                  c.srai       s0, 4
                  srai         a2, s9, 2
                  lui          t0, 263295
                  mulhsu       s8, a6, a6
                  mulhu        t1, gp, a2
                  lui          ra, 403989
                  csrrs        a3, 0x340, zero
                  div          a3, s1, t5
                  c.srli       a3, 11
                  csrrwi       a2, 0x340, 3
                  remu         s7, gp, s3
                  c.lui        ra, 19
                  sltiu        a5, s11, -1296
                  slli         s1, a0, 22
                  xor          t5, s9, s5
                  mulhu        s9, s2, s9
                  sltiu        t1, a1, 485
                  and          gp, t5, gp
                  csrrc        ra, 0x340, zero
                  c.add        s7, a5
                  add          a3, gp, t1
                  ori          t6, s2, -1440
                  c.xor        s0, a0
                  div          ra, a3, s3
                  remu         a5, a2, gp
                  c.or         a3, s0
                  c.xor        a1, s1
                  c.andi       s1, -1
                  rem          t1, a0, a3
                  c.li         s2, -1
                  xori         s9, a7, 1106
                  remu         a3, s1, t0
                  csrrc        a6, 0x340, zero
                  c.and        a4, a5
                  andi         s5, a1, 37
                  sll          gp, t4, t3
                  c.mv         a0, s2
                  csrrc        tp, 0x340, zero
                  c.addi       gp, 23
                  divu         s5, s9, a3
                  c.and        a4, a4
                  div          a6, a4, a5
                  c.or         a0, a5
                  c.nop
                  csrrc        a4, 0x340, zero
                  csrrs        ra, 0x340, zero
                  div          t0, a3, t2
                  xor          t1, t2, a7
                  lui          a5, 767694
                  csrrci       a0, 0x340, 16
                  c.addi16sp   sp, 16
                  c.add        a2, t0
                  c.addi16sp   sp, 256
                  sll          s11, a3, a2
                  c.srli       s1, 31
                  csrrsi       t5, 0x340, 0
                  c.andi       a3, 9
                  sltu         a3, t0, s1
                  add          ra, t5, t4
                  nop
                  mulh         a7, a6, a0
                  andi         gp, s5, -1642
                  andi         s1, t2, -835
                  mulhsu       s8, a4, s5
                  c.or         s1, s0
                  xor          a4, s5, t5
                  sra          s9, s1, ra
                  c.lui        ra, 4
                  c.nop
                  slt          t1, t2, t1
                  mul          a0, a3, a6
                  c.xor        a3, a2
                  c.slli       t0, 13
                  c.nop
                  addi         gp, s8, 762
                  mulh         a3, a2, s7
                  csrrc        s5, 0x340, zero
                  csrrsi       a6, 0x340, 0
                  c.xor        a1, s0
                  divu         zero, a4, t2
                  c.srai       a3, 13
                  c.add        a0, s2
                  sub          t4, zero, s4
                  c.mv         s9, s11
                  c.li         t0, 24
                  srai         a5, a7, 28
                  add          a4, s9, a1
                  srl          ra, a6, s1
                  slt          s11, t0, s0
                  or           s5, tp, s0
                  ori          s6, a7, -514
                  andi         a2, a1, -772
                  mul          t0, a0, a5
                  remu         a7, t2, a3
                  auipc        a5, 537174
                  c.srli       a5, 24
                  and          t5, t5, t5
                  slli         ra, t6, 7
                  addi         s6, a6, 188
                  sltiu        t1, a4, -2036
                  c.slli       a2, 2
                  sll          a6, zero, t1
                  rem          t4, t1, s2
                  c.and        a4, s0
                  c.and        a1, a4
                  csrrsi       a0, 0x340, 0
                  divu         s6, t3, gp
                  c.andi       a2, 12
                  c.or         a2, a2
                  csrrs        zero, 0x340, a0
                  srai         s6, zero, 24
                  auipc        s9, 859242
                  srl          a0, s4, a5
                  slt          s11, a2, a1
                  rem          t3, s11, s7
                  c.nop
                  csrrsi       s2, 0x340, 30
                  c.sub        a3, a1
                  lui          a0, 396587
                  divu         s6, t1, s6
                  mulh         t1, s5, a4
                  sltu         a3, s10, s3
                  srai         a7, s2, 8
                  csrrw        s0, 0x340, sp
                  c.li         a3, 26
                  ori          s9, zero, -1066
                  rem          s0, a0, s8
                  mul          a3, t2, a1
                  and          a6, a4, s8
                  and          s9, zero, t5
                  c.addi16sp   sp, 240
                  auipc        sp, 169408
                  sll          t4, s11, a2
                  c.addi       t1, -1
                  divu         a2, s3, t3
                  c.li         t1, 19
                  slti         s9, a5, 1197
                  csrrs        s4, 0x340, a0
                  c.xor        a2, a0
                  c.addi4spn   s0, sp, 848
                  srai         a0, t4, 22
                  c.nop
                  c.sub        a3, a5
                  mulhu        s9, a7, s1
                  c.slli       sp, 24
                  csrrci       t6, 0x340, 0
                  sltiu        a0, a6, 626
                  c.nop
                  c.addi16sp   sp, 176
                  rem          t5, ra, s1
                  srai         a3, ra, 29
                  c.srai       a3, 6
                  sll          a0, s6, sp
                  csrrs        a2, 0x340, t6
                  slt          gp, sp, t6
                  ori          t0, t4, -412
                  slli         a2, s10, 12
                  csrrsi       s1, 0x340, 5
                  c.lui        gp, 2
                  andi         s11, s7, 838
                  csrrsi       s5, 0x340, 0
                  c.addi4spn   a2, sp, 128
                  mul          t4, sp, a5
                  srl          tp, s4, t2
                  c.srai       a1, 3
                  csrrsi       s5, 0x340, 0
                  mulh         s5, s1, a6
                  mul          a5, t1, tp
                  c.lui        a5, 10
                  mulh         s5, a6, a1
                  slt          s6, s11, s6
                  c.nop
                  div          t4, gp, t3
                  c.addi4spn   a2, sp, 736
                  addi         a6, s7, -1405
                  c.addi4spn   s0, sp, 528
                  csrrci       a5, 0x340, 0
                  divu         s5, zero, t4
                  c.nop
                  srl          a2, s7, t2
                  mulh         a1, s8, s8
                  srl          a4, s8, t6
                  sltiu        t0, t5, -114
                  csrrci       t3, 0x340, 0
                  mulhu        a7, a2, tp
                  mulhsu       s8, t4, s1
                  csrrci       s5, 0x340, 24
                  and          s6, a0, a0
                  remu         gp, tp, t4
                  c.and        a3, a3
                  div          a4, a0, s3
                  ori          gp, s4, 1913
                  c.lui        t6, 28
                  c.and        a2, a3
                  add          a6, a5, s0
                  csrrc        tp, 0x340, gp
                  auipc        s7, 778574
                  mulhu        s7, t3, tp
                  csrrc        a1, 0x340, zero
                  auipc        s8, 660959
                  mulh         t0, t6, s11
                  csrrci       t0, 0x340, 0
                  sltiu        s9, ra, -460
                  mul          s11, s0, s1
                  csrrw        tp, 0x340, zero
                  andi         a7, a2, 1779
                  csrrsi       s11, 0x340, 31
                  csrrs        s8, 0x340, s0
                  srli         s0, a2, 25
                  c.srai       s1, 30
                  mulhu        s1, s9, a2
                  divu         zero, a3, s3
                  c.slli       a4, 14
                  sltiu        s4, s0, 2027
                  csrrsi       s6, 0x340, 20
                  srl          a0, s10, s7
                  c.addi4spn   a1, sp, 496
                  c.slli       t1, 17
                  c.li         t3, -1
                  c.or         a2, a3
                  csrrwi       a1, 0x340, 9
                  c.and        a0, a4
                  csrrsi       a4, 0x340, 20
                  c.addi       a7, -1
                  srl          a0, zero, s10
                  xori         s4, a4, 1362
                  c.slli       a2, 7
                  xori         a3, a5, 1703
                  or           tp, t1, zero
                  slt          t0, sp, s10
                  andi         s4, t5, -1971
                  sltu         a1, zero, s8
                  div          a3, s9, t1
                  xori         s7, t0, 1054
                  mul          t0, t0, gp
                  csrrwi       t3, 0x340, 16
                  c.li         sp, -1
                  c.li         s9, 27
                  c.slli       s2, 5
                  c.lui        a3, 22
                  or           s6, zero, t2
                  or           zero, s0, a4
                  csrrci       a0, 0x340, 26
                  srai         t5, s2, 2
                  sltiu        gp, s8, 1509
                  slli         s1, t0, 10
                  andi         a1, t3, 440
                  or           s1, s8, t6
                  srl          s6, a4, a0
                  andi         s11, t6, -1319
                  divu         a2, s6, s8
                  csrrw        t6, 0x340, s7
                  lui          s9, 776039
                  mulh         sp, s8, t0
                  add          s4, s7, s0
                  csrrs        s8, 0x340, zero
                  divu         s0, s9, a2
                  mulh         t0, s4, sp
                  xor          a1, s5, a0
                  rem          zero, s2, t2
                  c.and        a2, a3
                  c.addi       s1, 3
                  slt          t6, s6, a3
                  div          a7, t0, a3
                  csrrsi       t3, 0x340, 8
                  nop
                  and          a1, s7, a3
                  srai         gp, zero, 19
                  xor          tp, t2, a3
                  c.addi4spn   a1, sp, 992
                  and          a7, s11, a5
                  slti         a2, a1, 1154
                  csrrc        a2, 0x340, s6
                  sll          zero, t1, t3
                  ori          t0, a1, -580
                  slt          t1, s4, t2
                  sub          t5, a0, s1
                  or           a2, a4, s11
                  c.addi16sp   sp, -16
                  mulhu        t6, zero, a3
                  c.and        s0, a3
                  divu         a7, a4, t5
                  c.xor        a1, a5
                  c.addi4spn   a3, sp, 176
                  csrrwi       a4, 0x340, 6
                  sltu         s9, t3, ra
                  xori         a1, t2, 1750
                  mulhu        t0, a0, gp
                  addi         s2, a6, 1264
                  sll          a7, t5, s9
                  srai         t3, s5, 4
                  auipc        s4, 66776
                  mul          s7, zero, ra
                  or           t5, a6, a2
                  csrrc        gp, 0x340, s0
                  add          t3, tp, sp
                  c.srli       a3, 18
                  sltiu        a1, a1, -914
                  c.addi4spn   a0, sp, 160
                  c.addi16sp   sp, 448
                  sltu         s1, s4, t4
                  c.srli       s0, 22
                  slti         a3, s3, -1401
                  slt          t5, t2, t3
                  c.addi       t5, 11
                  sltiu        s6, s0, -28
                  slli         a2, s4, 0
                  c.addi4spn   a5, sp, 864
                  auipc        s0, 255821
                  c.addi4spn   a0, sp, 32
                  mulhsu       s9, a0, t3
                  mul          s11, zero, s2
                  c.slli       a4, 7
                  slli         s7, t5, 11
                  mulh         a0, t4, s2
                  c.add        a2, a5
                  srai         t4, t4, 30
                  sltu         s1, a5, a2
                  srli         s7, sp, 17
                  ori          a7, s7, 1383
                  divu         s7, a0, tp
                  or           s0, s6, t2
                  c.slli       s6, 25
                  remu         a3, a7, a2
                  c.li         s1, -1
                  sltiu        t1, t6, 139
                  sub          a4, a0, s9
                  c.or         a3, s1
                  andi         s11, s0, 1331
                  ori          s2, s5, 955
                  xor          sp, s0, s11
                  c.slli       a1, 25
                  c.addi4spn   a2, sp, 288
                  auipc        sp, 804457
                  c.xor        s1, a1
                  or           s2, s2, s4
                  lui          s6, 483981
                  srl          t4, t5, a7
                  c.addi4spn   s1, sp, 208
                  divu         t5, a4, s0
                  mul          a3, s9, a1
                  add          gp, s4, a1
                  c.srli       a4, 30
                  add          s1, t1, t3
                  c.lui        a5, 29
                  c.mv         t6, s2
                  srl          t6, s5, t3
                  xori         a3, a6, -177
                  slli         s5, s0, 24
                  auipc        t6, 752292
                  srl          zero, s3, s1
                  rem          s4, s5, t6
                  c.add        t5, s5
                  c.andi       a3, 27
                  mul          s7, zero, s4
                  c.lui        t5, 7
                  c.andi       s0, 31
                  mul          a0, s9, zero
                  csrrc        s11, 0x340, zero
                  mulhsu       t5, a5, sp
                  nop
                  divu         s9, a6, a7
                  andi         s9, s11, -1778
                  c.lui        t3, 22
                  c.nop
                  slt          a3, a3, a1
                  sltiu        s9, tp, 1820
                  sltiu        s6, s0, -1480
                  c.add        s8, t4
                  or           s11, s11, a5
                  xori         s11, s11, -278
                  c.addi16sp   sp, 352
                  slli         gp, s4, 26
                  mulhu        a3, t4, a6
                  csrrs        s11, 0x340, s9
                  add          s0, s3, t4
                  sltu         t0, s10, s0
                  remu         s9, t3, s8
                  csrrwi       t0, 0x340, 19
                  c.li         s7, -1
                  c.lui        s5, 10
                  csrrw        a7, 0x340, s4
                  rem          t0, a1, s9
                  csrrsi       a3, 0x340, 28
                  div          sp, a7, tp
                  srai         t4, a7, 22
                  sub          s2, sp, a3
                  sra          t6, t3, s9
                  c.addi       a4, -1
                  c.xor        a0, a0
                  sra          s9, zero, s9
                  c.sub        a5, a3
                  c.andi       a4, -1
                  c.nop
                  sltiu        tp, t4, -1303
                  andi         a1, a5, 353
                  mulhsu       t5, gp, s7
                  csrrwi       t1, 0x340, 9
                  c.and        a5, a3
                  c.addi16sp   sp, 144
                  csrrwi       t4, 0x340, 25
                  c.sub        a0, s1
                  remu         a2, sp, a7
                  andi         s7, tp, -755
                  c.slli       a6, 6
                  addi         s9, t1, 650
                  csrrci       s4, 0x340, 0
                  srl          t1, t1, s2
                  c.or         a4, a3
                  slli         s0, t5, 3
                  or           a7, t1, a4
                  nop
                  c.mv         a4, t5
                  add          s0, a5, a1
                  c.addi4spn   a0, sp, 992
                  csrrwi       s4, 0x340, 13
                  nop
                  mulh         t4, s9, a0
                  rem          a6, t2, t3
                  c.and        s0, s0
                  c.srli       s1, 25
                  ori          s4, tp, 822
                  slli         gp, s1, 18
                  sltu         a4, s7, t2
                  c.or         a1, s0
                  csrrc        a4, 0x340, zero
                  addi         s0, t5, -2036
                  div          s8, s11, t5
                  c.addi4spn   a5, sp, 544
                  c.nop
                  c.add        s4, t4
                  csrrwi       s9, 0x340, 5
                  addi         gp, s8, -102
                  sltu         t5, tp, tp
                  c.andi       a1, -1
                  mul          s7, gp, t2
                  sll          a6, a1, a0
                  remu         ra, t2, a3
                  srli         s9, t5, 17
                  slt          s7, a7, t1
                  c.srli       s1, 31
                  slli         t6, s0, 3
                  sub          t1, s4, s5
                  remu         s6, t2, t5
                  xor          s9, s7, s7
                  ori          a1, sp, 1986
                  auipc        a4, 987758
                  csrrs        a4, 0x340, s6
                  csrrsi       a4, 0x340, 13
                  ori          s8, a5, 612
                  addi         s7, t4, -1317
                  c.li         t6, 30
                  or           s5, a4, a1
                  c.mv         s9, s3
                  and          gp, t0, a1
                  csrrs        a0, 0x340, a4
                  xor          zero, s5, s7
                  mulhu        s4, t6, t4
                  c.and        a2, a2
                  and          s9, a4, t0
                  sll          a5, s3, gp
                  c.addi4spn   s0, sp, 80
                  or           a2, a1, t2
                  csrrci       ra, 0x340, 0
                  c.addi4spn   a5, sp, 112
                  rem          a7, s7, t6
                  sltiu        t0, a4, -1003
                  nop
                  addi         t6, s4, -32
                  andi         s0, a3, 1707
                  c.nop
                  c.xor        s1, a2
                  slli         s7, s1, 22
                  mulh         a0, a6, s8
                  xori         t4, s0, -1544
                  xori         a5, a1, -450
                  c.srai       a1, 20
                  and          s6, zero, sp
                  mulhsu       t4, a3, a4
                  c.sub        a5, a1
                  andi         t5, zero, 123
                  c.lui        a7, 28
                  c.andi       s1, -1
                  c.lui        s11, 1
                  csrrc        s0, 0x340, s10
                  csrrwi       t6, 0x340, 19
                  or           s2, a0, a4
                  c.slli       s5, 27
                  csrrwi       s11, 0x340, 22
                  c.or         a1, a3
                  c.andi       s1, -1
                  auipc        s0, 152600
                  c.nop
                  csrrci       gp, 0x340, 11
                  c.slli       s4, 30
                  c.xor        s1, a3
                  srli         s7, t5, 30
                  csrrs        tp, 0x340, zero
                  nop
                  ori          a1, ra, 1362
                  srli         sp, s0, 4
                  c.or         a3, a5
                  slti         s1, s4, -1857
                  nop
                  sub          a1, s9, a1
                  c.and        a3, a3
                  srai         zero, t2, 8
                  c.li         t6, -1
                  xor          t5, a5, s1
                  auipc        t3, 77323
                  ori          s11, s1, -1567
                  add          t5, t3, s8
                  mulh         gp, sp, a2
                  lui          s0, 10501
                  c.add        a6, sp
                  add          a4, zero, a4
                  sll          s7, a7, s3
                  c.mv         tp, a5
                  slt          t5, a7, t0
                  c.lui        t3, 6
                  csrrci       tp, 0x340, 0
                  andi         t1, s3, 150
                  add          s6, t6, t4
                  mul          ra, sp, t1
                  c.mv         t5, s0
                  sll          sp, s3, a6
                  sltu         a0, s7, t6
                  ori          gp, s2, -1857
                  rem          a3, a2, t3
                  c.andi       a4, 19
                  srli         s11, tp, 25
                  srl          s6, s0, s10
                  c.nop
                  sltiu        a0, a3, 73
                  c.sub        a5, a5
                  srli         s11, s2, 23
                  c.addi4spn   a2, sp, 464
                  c.add        a1, s8
                  remu         s7, s1, s3
                  slt          s7, s4, s6
                  c.and        s0, a4
                  c.srli       s1, 3
                  c.add        ra, a4
                  csrrci       a5, 0x340, 31
                  csrrw        s4, 0x340, s11
                  c.addi4spn   s0, sp, 688
                  sll          a5, a3, sp
                  slt          t1, s6, zero
                  nop
                  auipc        s4, 236577
                  c.xor        a0, a3
                  slt          s2, sp, gp
                  c.mv         t5, s5
                  nop
                  mul          ra, zero, gp
                  nop
                  sltu         t4, a5, s10
                  csrrw        a5, 0x340, a2
                  srli         a0, a2, 12
                  slti         sp, s7, -567
                  c.and        s0, a4
                  auipc        s4, 953324
                  andi         a1, t6, 526
                  c.addi16sp   sp, 464
                  csrrsi       ra, 0x340, 0
                  c.slli       s0, 7
                  sra          sp, a7, s6
                  sub          gp, a0, zero
                  xori         t3, s7, 2028
                  mulh         a7, a1, zero
                  sll          ra, t1, s7
                  sll          s9, s7, s8
                  slti         gp, t0, -582
                  sll          gp, tp, sp
                  andi         a2, t1, -541
                  csrrs        s9, 0x340, zero
                  c.mv         s2, s11
                  c.lui        t3, 15
                  sra          s0, s0, s6
                  mulhsu       t5, t1, a5
                  c.slli       a4, 31
                  slt          a1, a7, t4
                  rem          gp, t5, a4
                  nop
                  and          a4, s6, s6
                  and          t0, a7, t0
                  csrrsi       s5, 0x340, 0
                  sra          a1, t5, a1
                  sra          a3, t2, s7
                  c.addi       a3, -1
                  or           t4, s11, a3
                  c.addi16sp   sp, -16
                  c.and        a3, a4
                  c.lui        s0, 26
                  c.mv         ra, s3
                  mul          t5, s11, a3
                  mulhu        s11, t5, a7
                  remu         a4, s7, s1
                  or           s9, s6, s2
                  rem          s9, a2, a0
                  sltu         a1, s6, t2
                  srli         s2, t0, 19
                  addi         t0, tp, 1019
                  mulhsu       a4, s6, s2
                  mulhu        s7, a5, s10
                  remu         a5, s7, s1
                  c.mv         s7, s6
                  csrrs        t0, 0x340, zero
                  c.lui        s0, 8
                  sub          ra, t3, a1
                  c.lui        a4, 26
                  rem          t5, s1, s5
                  and          a4, s4, s9
                  slti         t5, a6, 1143
                  c.xor        a4, s0
                  ori          t3, a7, -173
                  c.li         tp, 2
                  c.srli       a1, 18
                  c.mv         s1, s0
                  slt          t5, t3, a2
                  c.nop
                  sltu         t1, a1, ra
                  csrrsi       s4, 0x340, 4
                  divu         s5, t3, t6
                  mul          a3, t5, tp
                  c.li         sp, 28
                  divu         t4, gp, t5
                  srai         s6, a2, 21
                  c.addi4spn   a1, sp, 896
                  xor          a7, t1, s2
                  c.sub        a5, a3
                  sll          a5, tp, a1
                  csrrs        tp, 0x340, s6
                  nop
                  mulhsu       s11, a0, a1
                  c.andi       s0, 3
                  ori          s6, a0, 1585
                  nop
                  c.or         a3, a0
                  csrrsi       s7, 0x340, 0
                  ori          ra, t1, -335
                  mulhu        t5, s4, a5
                  c.addi4spn   a4, sp, 16
                  auipc        gp, 62315
                  mulh         a6, gp, t4
                  srli         sp, a3, 10
                  c.li         a3, 2
                  c.xor        s1, s0
                  csrrw        a5, 0x340, a2
                  c.addi16sp   sp, -16
                  c.li         a6, 16
                  mulhu        a4, t6, tp
                  mul          s8, a6, s10
                  c.mv         sp, a6
                  c.or         a5, s1
                  xor          t6, a7, t4
                  ori          s1, a6, 95
                  mulhu        s5, s0, t3
                  csrrsi       t4, 0x340, 0
                  c.addi16sp   sp, -16
                  c.and        a5, s0
                  mul          a1, s11, s5
                  xori         t3, a4, 872
                  c.srli       a2, 28
                  c.nop
                  c.andi       a0, -1
                  add          ra, s7, t6
                  ori          s6, a2, 431
                  add          s1, t5, a6
                  mulh         t6, a0, t1
                  csrrs        s8, 0x340, zero
                  srl          t5, s10, s9
                  c.slli       s11, 26
                  mul          a4, t1, a5
                  srli         s5, s5, 0
                  or           t4, sp, s3
                  c.srli       a3, 27
                  or           s2, t1, t3
                  rem          s8, tp, t3
                  csrrwi       a4, 0x340, 20
                  c.addi16sp   sp, -16
                  mul          s8, zero, a7
                  sll          t1, s5, a7
                  auipc        tp, 1021025
                  c.mv         ra, tp
                  srl          a6, t6, a4
                  c.andi       a5, -1
                  mulh         t4, s7, a0
                  sll          a3, s3, a0
                  lui          t6, 371921
                  mulh         s0, s2, t4
                  ori          s2, s3, -384
                  remu         s11, zero, a1
                  c.addi4spn   a1, sp, 176
                  slti         a2, a5, 907
                  c.mv         a0, s8
                  addi         a0, s11, -222
                  c.and        a4, a0
                  srl          s9, s7, s5
                  c.srai       a4, 5
                  divu         s0, t4, a3
                  lui          a4, 543521
                  mulhsu       t1, gp, t1
                  add          a4, a4, s1
                  mulh         s5, a6, ra
                  sltiu        a3, a1, -1949
                  slli         t1, ra, 7
                  csrrci       a0, 0x340, 0
                  slti         ra, t6, 134
                  sltu         s6, s8, s11
                  mulhu        a6, s5, t1
                  c.addi4spn   a0, sp, 416
                  nop
                  mulh         a1, sp, t2
                  and          a2, a4, s4
                  xori         tp, s1, -1480
                  c.xor        a0, a3
                  srli         s7, a7, 25
                  csrrsi       a7, 0x340, 0
                  add          t1, s10, a1
                  c.lui        s0, 17
                  c.li         gp, 9
                  sll          sp, s8, s2
                  csrrci       s5, 0x340, 0
                  and          zero, s2, s6
                  c.srai       a2, 5
                  c.srai       a4, 6
                  c.or         a5, a5
                  csrrci       s2, 0x340, 0
                  andi         s11, zero, -1365
                  c.slli       tp, 17
                  c.lui        t1, 12
                  srli         a1, s11, 28
                  ori          t6, a3, -1342
                  c.srai       a4, 31
                  sltu         s0, a7, zero
                  c.nop
                  mul          s2, gp, a0
                  sra          s8, t1, s0
                  xor          s5, a7, s1
                  c.or         a2, a1
                  srai         s4, s11, 31
                  csrrwi       a4, 0x340, 21
                  csrrw        t5, 0x340, s7
                  c.li         s1, 10
                  srai         a1, sp, 19
                  andi         t1, s9, -1710
                  c.lui        t5, 31
                  or           a6, a0, s1
                  csrrsi       ra, 0x340, 23
                  nop
                  c.add        s0, gp
                  c.addi       t3, 3
                  c.addi       s8, 23
                  divu         s7, t3, t3
                  c.add        t5, a5
                  mulh         t0, a1, s4
                  c.add        t5, s8
                  lui          tp, 378342
                  c.xor        a1, s0
                  csrrw        t6, 0x340, s7
                  divu         s6, s1, a2
                  slti         a6, ra, -1811
                  xori         sp, s6, 204
                  c.li         a1, -1
                  slt          a4, zero, a1
                  c.sub        a5, a5
                  c.nop
                  remu         a6, s4, a0
                  csrrwi       tp, 0x340, 8
                  mulhsu       zero, t5, s1
                  c.addi16sp   sp, 480
                  ori          a5, a0, -1454
                  c.addi4spn   a2, sp, 928
                  div          t4, t2, t2
                  srli         s4, s5, 0
                  slt          ra, ra, s6
                  mulhsu       a1, t5, t0
                  srl          s1, t0, s10
                  csrrw        t6, 0x340, a4
                  mul          s11, t0, a7
                  c.srai       a0, 17
                  csrrs        s6, 0x340, s3
                  sra          s1, s11, a6
                  csrrci       a3, 0x340, 0
                  slt          s11, zero, ra
                  c.andi       s1, -1
                  c.srai       a1, 11
                  xori         s9, s10, 646
                  mulh         s2, tp, s0
                  slt          zero, s9, s0
                  mulhsu       t3, a4, s3
                  c.and        a3, a5
                  srai         a3, s9, 24
                  c.and        a3, a0
                  c.mv         t0, s9
                  srai         t0, s7, 6
                  slt          ra, a4, a0
                  rem          a3, tp, sp
                  mul          tp, a1, s5
                  lui          a2, 98525
                  mulh         a3, t2, t2
                  mulhu        s5, s10, t3
                  csrrci       s8, 0x340, 12
                  srl          a7, s0, s4
                  srai         a0, s6, 15
                  sltiu        t5, s7, -347
                  nop
                  csrrs        a5, 0x340, zero
                  nop
                  add          tp, ra, t5
                  c.srai       a1, 25
                  sra          a7, a7, s5
                  slli         t1, a4, 0
                  c.add        s6, s2
                  csrrs        a1, 0x340, sp
                  c.xor        a2, a2
                  xori         ra, t1, -261
                  nop
                  remu         sp, ra, t4
                  div          s7, zero, a7
                  c.addi       sp, 9
                  slti         a0, t1, 1479
                  and          t6, a3, s10
                  nop
                  sub          zero, a7, a2
                  remu         a5, a7, a2
                  divu         s7, s1, t5
                  csrrw        s1, 0x340, zero
                  c.lui        s4, 23
                  srli         tp, t3, 10
                  c.lui        s11, 10
                  andi         a5, a1, 870
                  addi         s5, t2, -1621
                  div          t1, s10, tp
                  slt          a1, t3, a4
                  c.nop
                  mul          a1, s4, s10
                  and          t1, s5, t4
                  csrrwi       s1, 0x340, 13
                  and          a4, s8, gp
                  csrrs        s4, 0x340, s6
                  and          s11, ra, a1
                  ori          zero, a7, 1528
                  slli         t3, sp, 20
                  sub          sp, s5, ra
                  or           s1, s1, s3
                  csrrc        s9, 0x340, t1
                  andi         s6, gp, 16
                  mul          t0, a5, t4
                  sltiu        s0, s4, 1748
                  auipc        s1, 2666
                  slti         s0, t0, -1012
                  srai         t5, s10, 19
                  c.slli       gp, 6
                  sra          t6, s9, t4
                  div          a4, t3, s10
                  csrrci       s4, 0x340, 0
                  c.nop
                  andi         s9, t0, -1393
                  c.mv         s7, s2
                  c.nop
                  slli         sp, t4, 5
                  ori          s6, gp, -532
                  rem          a1, ra, s3
                  slli         t3, t4, 22
                  c.srli       a1, 7
                  csrrw        s5, 0x340, s3
                  c.xor        a1, a5
                  csrrw        s0, 0x340, ra
                  srli         a0, s10, 30
                  mulh         a4, t4, t5
                  csrrwi       tp, 0x340, 20
                  c.andi       a5, -1
                  mulhsu       tp, s1, t3
                  c.addi16sp   sp, 176
                  c.mv         a3, s0
                  c.addi       s11, -1
                  csrrsi       s11, 0x340, 7
                  remu         a5, t6, t1
                  csrrs        ra, 0x340, zero
                  c.add        s11, s6
                  xori         a0, a3, 176
                  div          a6, a5, sp
                  sltiu        s5, a6, -1480
                  srl          t6, s8, gp
                  c.andi       a5, 3
                  c.xor        a5, a0
                  remu         t4, ra, s5
                  c.addi16sp   sp, -16
                  c.srli       s1, 26
                  addi         s9, s10, 682
                  sltu         t0, t1, t6
                  csrrs        a2, 0x340, zero
                  srl          s6, t3, a0
                  c.lui        ra, 1
                  c.addi       s7, 12
                  sub          s9, t2, sp
                  sltiu        t6, a3, 1489
                  c.lui        s9, 3
                  c.add        t5, t5
                  csrrwi       s11, 0x340, 6
                  c.addi16sp   sp, -16
                  c.addi4spn   a2, sp, 240
                  csrrc        a7, 0x340, zero
                  ori          gp, a4, -1198
                  csrrci       s11, 0x340, 0
                  c.addi16sp   sp, -16
                  sltu         a6, a1, s0
                  lui          s6, 65335
                  c.xor        a3, s0
                  mulhsu       t5, a6, a0
                  c.addi4spn   a4, sp, 832
                  sltu         s8, s1, t5
                  or           s5, s7, t3
                  slti         a7, a5, -1585
                  c.andi       a4, 21
                  c.addi4spn   a0, sp, 208
                  mul          tp, a7, s1
                  lui          t4, 35021
                  mulhsu       gp, sp, a6
                  c.or         a2, a0
                  c.and        a0, a0
                  remu         a1, a1, s1
                  c.xor        a2, s1
                  mulh         s4, t5, tp
                  xor          a3, gp, sp
                  xor          t3, t0, s1
                  addi         s6, a0, -851
                  c.srli       a2, 6
                  c.nop
                  c.slli       t1, 6
                  ori          tp, s5, 1049
                  c.or         a1, s1
                  sltu         s8, s7, s2
                  c.slli       ra, 31
                  xori         s9, a4, -391
                  div          s9, t5, zero
                  and          a7, t6, s11
                  csrrsi       gp, 0x340, 23
                  c.slli       s1, 23
                  csrrs        sp, 0x340, zero
                  add          a3, s5, s6
                  c.andi       a1, -1
                  c.nop
                  lui          zero, 412944
                  slt          s7, ra, a1
                  srli         tp, t1, 10
                  c.li         a5, 21
                  c.li         t4, -1
                  sll          s1, a5, t0
                  csrrwi       s4, 0x340, 27
                  andi         a4, t4, -123
                  csrrw        gp, 0x340, s4
                  c.addi16sp   sp, 304
                  csrrs        s5, 0x340, t0
                  xor          t5, s4, t1
                  c.addi4spn   s1, sp, 992
                  or           s6, s10, s7
                  c.nop
                  sltiu        a3, t0, -1767
                  c.slli       a0, 3
                  nop
                  c.sub        a4, a5
                  mul          sp, s2, t1
                  c.addi4spn   a5, sp, 48
                  c.or         s1, a1
                  sltu         s4, a2, s7
                  addi         a2, a5, 610
                  auipc        s1, 33443
                  auipc        a7, 585441
                  divu         s11, a2, t5
                  add          t5, a1, t5
                  c.add        ra, t0
                  divu         s7, a1, t5
                  remu         a1, a6, s9
                  ori          s1, s7, -354
                  csrrwi       s1, 0x340, 27
                  c.xor        a4, a1
                  c.add        a2, s11
                  c.and        s0, a0
                  add          s4, a1, a0
                  csrrsi       a4, 0x340, 0
                  c.add        t3, a2
                  c.mv         a2, s10
                  c.nop
                  div          t5, s6, t1
                  csrrwi       s2, 0x340, 29
                  csrrs        s0, 0x340, zero
                  divu         s0, s9, tp
                  c.slli       s5, 11
                  sra          t4, a2, ra
                  xori         a2, s10, 1272
                  sra          a1, a0, t6
                  c.srai       a5, 21
                  slt          a7, s4, a2
                  c.li         t5, 16
                  c.or         s1, s1
                  remu         s1, a5, t0
                  srli         s5, t0, 14
                  c.xor        a4, a0
                  ori          s7, s8, 702
                  c.addi4spn   a0, sp, 384
                  c.addi16sp   sp, -16
                  c.sub        a4, a3
                  c.sub        a0, s1
                  sltiu        a1, s0, 1589
                  csrrc        s9, 0x340, t5
                  mulhu        s7, gp, s8
                  srai         a6, s7, 1
                  mulh         s9, t2, t0
                  c.xor        a0, a0
                  sll          s2, s6, s2
                  sra          tp, s10, t4
                  ori          a7, s8, 573
                  auipc        a2, 1025596
                  c.xor        s1, s0
                  slti         t5, a0, 1009
                  c.li         t3, -1
                  csrrs        t3, 0x340, gp
                  div          a3, ra, t4
                  c.andi       a2, -1
                  xori         ra, zero, -1333
                  nop
                  slti         sp, a5, -1438
                  ori          t3, a0, 593
                  mulhsu       a0, a4, a5
                  nop
                  c.add        s8, a0
                  srli         t1, a4, 16
                  c.andi       a2, 15
                  mulh         s7, s3, s5
                  sltu         t0, t5, tp
                  sra          zero, a2, t3
                  slt          a7, a0, s9
                  addi         sp, s3, 1949
                  c.addi4spn   a3, sp, 464
                  slli         a2, s6, 14
                  xor          t6, sp, s1
                  mul          a4, gp, a0
                  csrrc        t1, 0x340, zero
                  csrrci       a5, 0x340, 27
                  c.nop
                  slli         sp, sp, 29
                  c.srli       a4, 26
                  add          t6, s5, a0
                  c.addi16sp   sp, -16
                  rem          ra, tp, t4
                  sub          a3, s8, tp
                  slti         zero, a5, 1769
                  slti         a1, a0, -1500
                  srli         s1, s5, 4
                  sll          t6, t4, t6
                  c.nop
                  rem          s11, s6, s6
                  c.or         s0, s1
                  c.and        s1, a0
                  div          a4, t6, sp
                  ori          s8, s4, -1149
                  div          a1, t5, t6
                  lui          tp, 412437
                  csrrwi       a1, 0x340, 18
                  rem          a0, a1, a1
                  c.li         s9, 11
                  xor          a2, t6, a2
                  c.addi       s11, 31
                  mulhu        a5, sp, t4
                  rem          s0, s9, gp
                  slti         gp, gp, 303
                  sltu         tp, a5, t6
                  div          s7, tp, s1
                  c.lui        s9, 23
                  mulhu        a6, sp, s8
                  c.srli       a1, 20
                  andi         ra, t0, -74
                  c.nop
                  c.sub        a1, a2
                  slt          a2, a5, s4
                  c.sub        a2, a2
                  sub          t0, s10, s9
                  c.add        tp, a2
                  auipc        t5, 950460
                  csrrs        s6, 0x340, s7
                  slt          t3, a2, t4
                  c.addi       t5, 30
                  csrrw        a3, 0x340, zero
                  c.xor        s0, s1
                  csrrwi       s6, 0x340, 18
                  mulhu        t4, a3, a0
                  sltiu        sp, gp, 1312
                  c.mv         s8, s8
                  c.li         s6, 5
                  andi         t4, s5, -1799
                  add          s9, s5, s3
                  csrrci       tp, 0x340, 0
                  c.slli       s0, 5
                  addi         a3, a5, 1494
                  c.andi       s1, -1
                  c.xor        a0, a3
                  c.addi4spn   s1, sp, 240
                  xori         a6, t4, -378
                  srai         t1, t4, 9
                  srai         zero, t5, 0
                  xor          s1, a0, s9
                  auipc        tp, 484661
                  slli         t6, s4, 15
                  sltiu        t3, s10, 1059
                  lui          s8, 584048
                  andi         a5, s7, 1236
                  div          t0, t3, t0
                  csrrsi       s7, 0x340, 1
                  c.slli       s2, 26
                  c.andi       a1, -1
                  c.addi       t3, 30
                  sra          t6, s11, t6
                  divu         s11, a7, a0
                  srl          s6, t4, s0
                  sra          s5, a5, a1
                  sra          t3, tp, s10
                  c.lui        t0, 8
                  div          a7, a3, t4
                  csrrci       s5, 0x340, 0
                  nop
                  sltu         a5, a0, s2
                  c.srli       s1, 21
                  divu         tp, a2, t3
                  xori         t6, s8, -789
                  ori          s6, t3, 244
                  mul          t5, s7, sp
                  mulhu        a0, s9, s5
                  c.add        a3, tp
                  c.addi16sp   sp, -16
                  csrrwi       tp, 0x340, 17
                  csrrw        t0, 0x340, a2
                  srai         gp, t1, 20
                  csrrsi       s7, 0x340, 0
                  nop
                  c.srai       a2, 20
                  csrrc        s5, 0x340, zero
                  c.nop
                  c.andi       a0, -1
                  slti         s11, a4, 75
                  c.sub        a5, a2
                  mulhsu       s0, t2, s6
                  c.srli       a2, 23
                  c.addi16sp   sp, -16
                  c.slli       tp, 22
                  remu         s2, s7, a4
                  c.srli       a1, 4
                  srai         a6, s11, 3
                  c.li         s8, 20
                  slt          a4, a1, gp
                  mulhsu       s9, a4, a7
                  and          a4, t3, s10
                  sll          ra, t1, s2
                  andi         s7, a0, -289
                  xori         t1, a4, -1154
                  c.slli       tp, 20
                  addi         t6, a2, 1792
                  c.sub        a2, a5
                  slti         s5, s5, -1975
                  mulh         a5, s7, s5
                  sub          t5, tp, t2
                  and          s1, a1, s0
                  csrrsi       s1, 0x340, 0
                  sltu         ra, s10, t0
                  srl          a3, t0, s6
                  c.andi       a0, -1
                  mul          sp, s8, s4
                  nop
                  slli         t6, a2, 16
                  divu         gp, t3, s1
                  c.and        a5, s1
                  and          t6, s10, s9
                  sra          s1, sp, a5
                  nop
                  c.andi       s1, -1
                  sltu         s2, s6, a3
                  sll          s1, s8, t3
                  mul          tp, s10, s2
                  c.sub        a0, s1
                  c.addi4spn   a4, sp, 832
                  sll          a7, t6, t2
                  andi         t4, s8, -317
                  sltu         gp, s5, t3
                  mulhsu       t3, sp, ra
                  xor          a2, t1, s5
                  remu         s5, s9, s10
                  and          zero, s2, s9
                  sltiu        t1, t0, 1091
                  csrrw        ra, 0x340, s2
                  c.li         s5, -1
                  div          t0, s11, sp
                  c.xor        a0, a3
                  sll          t4, s6, a4
                  srl          s0, tp, gp
                  sltu         s2, t5, s6
                  csrrc        t5, 0x340, ra
                  c.xor        a1, s1
                  csrrci       a4, 0x340, 25
                  rem          a4, s1, s10
                  csrrwi       t0, 0x340, 17
                  rem          s5, s5, a0
                  sub          ra, s0, a7
                  csrrci       a3, 0x340, 13
                  sub          zero, s4, sp
                  and          zero, t1, s10
                  c.sub        a4, s1
                  mulhu        a0, s7, ra
                  c.sub        a4, a4
                  csrrs        t0, 0x340, zero
                  c.add        s2, t6
                  c.li         t1, -1
                  sll          tp, t3, s9
                  xori         s5, a5, 1844
                  c.addi16sp   sp, 384
                  c.add        s7, s11
                  csrrc        a3, 0x340, zero
                  or           t4, a2, t6
                  remu         t3, t3, s6
                  c.sub        a4, a3
                  c.mv         s8, t1
                  slti         t0, gp, 1871
                  c.andi       a3, -1
                  rem          t0, t2, s7
                  and          s8, sp, t2
                  c.add        t3, ra
                  auipc        s2, 72615
                  c.mv         t0, s9
                  csrrci       zero, 0x340, 25
                  c.mv         t1, s5
                  slli         s7, s4, 30
                  mul          s2, s3, t0
                  c.and        a1, s1
                  mulhsu       a1, s8, a4
                  ori          s2, ra, 829
                  auipc        s9, 422564
                  c.xor        a1, a5
                  remu         t4, a3, a6
                  c.srai       a3, 12
                  c.sub        a4, s0
                  srl          ra, s6, gp
                  csrrci       t5, 0x340, 24
                  c.xor        s1, a2
                  rem          a1, s9, a0
                  or           s0, t2, t5
                  add          zero, t5, ra
                  lui          s2, 791373
                  sra          s5, t4, t4
                  mulhsu       s5, t2, s0
                  mul          a7, a1, a2
                  xori         ra, s1, 181
                  add          a2, a3, a0
                  c.lui        s0, 24
                  xori         a4, ra, -1053
                  slti         s4, sp, 1038
                  divu         sp, s1, t3
                  csrrs        t4, 0x340, zero
                  c.li         gp, 26
                  sltu         t4, a2, s0
                  c.add        s4, s6
                  add          s5, t5, t2
                  srai         s8, t3, 30
                  andi         s9, t5, -519
                  c.nop
                  c.srai       a5, 22
                  c.lui        s9, 12
                  mul          s11, a4, s8
                  lui          ra, 768309
                  sub          t6, t4, a2
                  lui          t6, 806574
                  csrrs        zero, 0x340, zero
                  c.nop
                  csrrs        a4, 0x340, zero
                  c.and        a4, a1
                  c.nop
                  c.or         a4, a0
                  csrrs        sp, 0x340, zero
                  lui          a6, 528495
                  csrrs        t4, 0x340, zero
                  csrrw        s7, 0x340, t3
                  slt          gp, a5, tp
                  mul          s8, a4, gp
                  csrrw        a3, 0x340, s10
                  mulh         a5, s10, s2
                  mulhu        s8, t5, zero
                  sltiu        t5, s5, 1895
                  sltiu        s9, s7, -1726
                  and          s0, s3, s3
                  lui          s2, 994705
                  slli         a0, s2, 21
                  mulhsu       s0, t5, a5
                  slli         gp, s9, 1
                  nop
                  remu         s9, s3, t3
                  and          s5, zero, a2
                  csrrw        t1, 0x340, s11
                  csrrs        sp, 0x340, zero
                  mulhsu       s6, s9, s1
                  lui          a4, 345742
                  mulhu        a6, a1, s5
                  c.or         a2, s1
                  slt          a3, t4, a6
                  mulh         zero, s11, a7
                  c.srai       a1, 26
                  c.addi4spn   a0, sp, 240
                  add          s0, t6, a4
                  lui          a1, 82580
                  c.addi16sp   sp, 416
                  sltu         a1, a4, a5
                  xori         s5, t3, -203
                  c.add        tp, s3
                  sltu         t6, t2, gp
                  sub          a7, a4, t5
                  auipc        t5, 845173
                  csrrw        a4, 0x340, a3
                  div          t1, s4, s10
                  c.sub        a1, s1
                  csrrwi       s9, 0x340, 10
                  slli         s7, s0, 14
                  xor          t3, s7, s0
                  slli         t1, s4, 4
                  lui          a1, 170879
                  mulhu        t6, t1, s2
                  slli         a4, s9, 9
                  c.sub        a3, s0
                  xori         a0, t1, 659
                  c.or         a3, a0
                  csrrsi       a6, 0x340, 15
                  csrrc        a6, 0x340, s7
                  lui          t4, 6366
                  mulhsu       gp, gp, ra
                  slti         a2, t1, 629
                  mul          a7, s6, t5
                  srai         s5, s7, 27
                  or           s8, s11, a2
                  c.li         a6, 15
                  mulhu        t0, a7, zero
                  csrrwi       sp, 0x340, 0
                  c.li         s9, 24
                  csrrsi       t3, 0x340, 31
                  c.addi       a6, -1
                  slli         a7, a5, 6
                  xor          a7, t2, t1
                  mulhu        a3, s4, zero
                  nop
                  c.add        s11, t6
                  mulhsu       a5, a0, t4
                  slli         a5, a1, 29
                  srli         a4, a0, 25
                  nop
                  c.li         a3, 9
                  srli         a5, s0, 1
                  csrrwi       s0, 0x340, 28
                  auipc        sp, 696144
                  rem          gp, s3, s3
                  sll          a0, s11, a2
                  c.addi       t1, 21
                  c.srli       s1, 7
                  sll          a3, t3, a2
                  slt          a5, a4, s0
                  c.lui        s2, 28
                  csrrs        t5, 0x340, zero
                  sltu         a4, t4, s7
                  lui          t3, 885924
                  auipc        s1, 254082
                  c.srai       a0, 13
                  c.addi16sp   sp, -16
                  c.li         t5, 30
                  sub          gp, s4, s11
                  c.and        a4, a5
                  addi         a1, a7, -1901
                  mulhu        t0, t4, s9
                  divu         s4, t5, s3
                  mulh         s11, t0, a4
                  csrrci       s7, 0x340, 0
                  nop
                  csrrwi       sp, 0x340, 17
                  c.addi       s7, -1
                  c.slli       t5, 10
                  nop
                  csrrs        s1, 0x340, zero
                  c.andi       a2, 13
                  sll          sp, s3, zero
                  or           gp, s11, ra
                  slli         a5, a7, 25
                  andi         s4, s10, 1574
                  c.add        sp, gp
                  slt          s6, s3, a1
                  andi         s11, s6, 1056
                  divu         s4, t0, s2
                  c.srli       a5, 1
                  csrrs        a5, 0x340, zero
                  mul          a2, a3, sp
                  add          t0, a7, gp
                  c.andi       a1, -1
                  divu         tp, a6, s7
                  addi         a0, s11, -161
                  andi         a0, s10, -1898
                  slli         a3, t6, 20
                  srl          t4, s10, s2
                  srl          a3, a7, a0
                  slt          a7, sp, t2
                  xor          ra, a2, a0
                  c.sub        a4, s0
                  csrrs        a2, 0x340, zero
                  remu         tp, t1, zero
                  slt          s4, a3, s1
                  and          s7, s5, a5
                  c.addi4spn   a4, sp, 464
                  c.and        a3, a4
                  mulh         a2, a1, a3
                  csrrw        a7, 0x340, s3
                  c.mv         sp, s4
                  c.add        t0, s5
                  sltu         a0, t3, a6
                  srli         t1, s10, 8
                  c.addi16sp   sp, 96
                  mul          s9, s9, t6
                  c.andi       s1, -1
                  slt          gp, t6, a7
                  c.add        s1, s1
                  c.and        a1, a5
                  c.addi4spn   s1, sp, 176
                  slti         t1, t6, 1607
                  lui          s5, 781413
                  xor          s1, t1, s3
                  c.addi       a1, -1
                  add          s0, a2, tp
                  c.addi16sp   sp, -16
                  nop
                  add          a3, s9, s9
                  slti         zero, a2, 624
                  srl          s0, s4, s3
                  srli         zero, zero, 31
                  c.addi16sp   sp, 384
                  xor          s9, tp, t5
                  c.mv         a6, s3
                  sltiu        s11, s7, 1738
                  c.srli       a2, 9
                  csrrs        s0, 0x340, s9
                  c.addi16sp   sp, -16
                  rem          s11, t0, a2
                  csrrc        ra, 0x340, zero
                  c.and        s0, a5
                  c.add        a0, a3
                  sra          a7, s7, s4
                  c.li         a2, -1
                  c.and        a4, s0
                  c.nop
                  c.or         a3, a0
                  sltiu        a6, a4, -1021
                  mul          t4, s3, s2
                  c.or         a3, s0
                  nop
                  c.srai       a1, 11
                  slli         s0, t4, 12
                  c.addi4spn   a0, sp, 640
                  lui          tp, 500726
                  c.and        a5, a5
                  add          a4, t4, a0
                  mulhu        a5, s11, s11
                  csrrs        a0, 0x340, zero
                  nop
                  c.or         a3, s1
                  div          s2, sp, ra
                  c.addi4spn   a0, sp, 16
                  sra          s7, a7, a4
                  c.lui        t3, 7
                  slt          sp, s4, s6
                  sll          s6, tp, t3
                  or           a1, a7, s2
                  c.lui        a3, 28
                  c.lui        s0, 3
                  sltu         tp, t0, s8
                  c.sub        s1, a5
                  xori         s1, t6, -1090
                  mulhu        ra, t1, s11
                  auipc        s2, 77846
                  add          s7, s10, a7
                  c.addi16sp   sp, 240
                  c.or         a0, s0
                  sll          s9, t2, t5
                  c.addi16sp   sp, 160
                  c.mv         a5, s1
                  c.sub        a0, a3
                  c.add        s11, sp
                  c.addi4spn   a1, sp, 608
                  and          a4, s2, s0
                  srl          s0, s4, s5
                  c.andi       a1, 8
                  divu         a7, sp, a2
                  and          a3, t3, t4
                  sltiu        t4, a1, -501
                  addi         a1, s2, -1032
                  csrrc        s1, 0x340, tp
                  srl          s0, t6, t4
                  sra          a1, s5, s11
                  mul          t6, zero, a3
                  c.srai       a0, 29
                  csrrs        s6, 0x340, zero
                  sltiu        a7, t3, -1198
                  c.addi       t4, -1
                  mulhu        a1, sp, a4
                  slli         zero, t1, 25
                  csrrs        a0, 0x340, zero
                  slti         tp, s5, 726
                  lui          s7, 991638
                  remu         sp, a0, s6
                  auipc        a5, 271889
                  xori         ra, s0, 1754
                  slli         s7, t5, 12
                  c.mv         a6, a0
                  mulh         s8, a6, s5
                  addi         s7, s7, 1015
                  slt          t0, t3, s5
                  auipc        a1, 1020678
                  and          ra, zero, s9
                  mulhsu       ra, a1, ra
                  remu         s2, s1, sp
                  c.and        a0, a4
                  c.srli       a2, 2
                  c.srli       a4, 30
                  auipc        a6, 530412
                  sll          s5, tp, sp
                  addi         t4, s0, -323
                  srl          ra, a2, s7
                  c.and        s0, a4
                  divu         a7, s3, a5
                  rem          a2, t5, zero
                  c.addi4spn   a5, sp, 528
                  sltiu        a6, zero, -425
                  c.andi       s1, 24
                  c.lui        s8, 4
                  sub          s5, s5, s4
                  csrrsi       a2, 0x340, 11
                  mulh         s5, a0, sp
                  c.nop
                  c.sub        s1, a5
                  sltiu        a3, a1, 1474
                  c.li         s2, -1
                  csrrw        a1, 0x340, s4
                  slti         sp, s7, -956
                  c.xor        a2, a1
                  c.addi16sp   sp, -16
                  srli         ra, t5, 27
                  sub          s5, a2, gp
                  c.and        a1, a1
                  c.addi4spn   a2, sp, 960
                  sll          a3, s1, s2
                  c.srli       a3, 7
                  csrrci       t1, 0x340, 0
                  sll          a3, t6, t2
                  srai         zero, s6, 15
                  c.xor        a5, a4
                  srl          s0, s1, zero
                  c.srai       a3, 11
                  c.nop
                  c.addi       a3, -1
                  ori          sp, s2, 1725
                  add          s11, a0, sp
                  nop
                  add          s1, a5, s6
                  c.sub        a2, a5
                  srli         ra, s2, 1
                  sltu         a5, sp, s0
                  csrrci       s4, 0x340, 31
                  slli         t5, s2, 10
                  csrrw        a3, 0x340, sp
                  rem          t1, tp, t1
                  auipc        t3, 55939
                  c.xor        a5, a4
                  c.addi       a0, 15
                  slli         t6, a7, 26
                  sub          t4, t2, s9
                  divu         s4, s1, a6
                  srl          a0, s8, s3
                  sra          s8, zero, zero
                  sub          s4, a4, zero
                  csrrsi       a2, 0x340, 24
                  mulh         t5, s8, t1
                  c.addi16sp   sp, -16
                  c.or         s0, a3
                  lui          ra, 827078
                  c.addi16sp   sp, -16
                  c.addi16sp   sp, -16
                  csrrci       s4, 0x340, 27
                  c.srai       a0, 20
                  c.li         tp, 11
                  mul          t0, s3, s11
                  c.addi16sp   sp, 320
                  c.addi16sp   sp, 336
                  c.andi       a1, 20
                  c.mv         t6, s11
                  sub          s4, s2, s2
                  srai         t5, a1, 21
                  srl          t3, s4, s1
                  c.xor        a1, a3
                  csrrw        s9, 0x340, sp
                  c.li         s5, 31
                  csrrs        a3, 0x340, sp
                  slt          a5, tp, s4
                  sltu         t3, sp, a4
                  divu         t3, sp, s0
                  c.xor        a1, a2
                  slt          s7, s7, a7
                  auipc        t3, 432107
                  slti         s8, s2, -504
                  c.addi4spn   a2, sp, 400
                  slli         a6, s7, 1
                  sra          t5, t4, a4
                  sll          a5, s0, t2
                  c.slli       a3, 1
                  sltiu        tp, ra, 1650
                  sra          s9, tp, gp
                  lui          s11, 12075
                  csrrwi       zero, 0x340, 8
                  c.or         a2, a3
                  c.li         s8, -1
                  slt          a1, t6, gp
                  auipc        t4, 905844
                  c.srli       a0, 13
                  srai         s9, gp, 0
                  mulhsu       gp, a2, t2
                  csrrc        t3, 0x340, t5
                  and          s8, t1, a5
                  nop
                  c.nop
                  or           a1, tp, a5
                  c.li         a2, 27
                  nop
                  rem          a4, s4, t1
                  c.sub        s0, a5
                  srl          s9, a1, t1
                  mulh         s2, s9, t5
                  or           gp, zero, s6
                  c.and        a5, a5
                  c.srai       s1, 4
                  mulh         a7, a5, a0
                  csrrs        t5, 0x340, s3
                  c.sub        a1, a5
                  sltu         zero, s10, tp
                  c.sub        a4, a2
                  c.nop
                  addi         s8, t1, 755
                  divu         a1, s6, gp
                  xori         a7, s8, -1088
                  xori         t4, t6, 626
                  nop
                  remu         a3, a6, t1
                  c.andi       a1, 8
                  auipc        a1, 548728
                  andi         ra, s3, 399
                  c.addi4spn   a3, sp, 432
                  sub          s9, s3, ra
                  csrrw        s8, 0x340, ra
                  xor          a7, s7, s6
                  auipc        s0, 471636
                  xori         a1, s5, -1470
                  nop
                  auipc        sp, 958021
                  addi         s6, a0, 946
                  mulhsu       s2, s8, t2
                  andi         s5, a3, -739
                  remu         s9, s3, a5
                  c.andi       a2, -1
                  slti         sp, a0, -84
                  csrrc        s1, 0x340, sp
                  c.li         ra, -1
                  or           a5, s4, s4
                  sll          a3, t2, t3
                  csrrci       s6, 0x340, 1
                  slli         s8, t2, 29
                  lui          s2, 804817
                  c.add        s11, t3
                  c.andi       s1, 4
                  mulhsu       s1, s11, t2
                  csrrw        tp, 0x340, a1
                  xori         s9, gp, -345
                  andi         s2, gp, -601
                  lui          t0, 135049
                  mulh         s4, a5, a7
                  slt          ra, s5, s9
                  c.addi4spn   a2, sp, 288
                  addi         s2, a4, -673
                  c.addi4spn   a5, sp, 128
                  mulhsu       s9, s7, t2
                  and          a4, s11, t0
                  nop
                  ori          s8, t6, -1091
                  srl          t3, a7, a6
                  mul          s5, s5, s8
                  c.srai       a5, 3
                  or           a3, zero, s10
                  c.srai       a0, 26
                  csrrci       s6, 0x340, 0
                  sltu         a0, s8, s5
                  div          a7, t0, t1
                  csrrc        gp, 0x340, a7
                  sltiu        s7, sp, 1511
                  or           a5, s10, t4
                  or           a3, s4, t5
                  csrrci       t4, 0x340, 10
                  div          sp, a6, a2
                  c.srli       a5, 12
                  mul          s0, zero, zero
                  c.add        tp, t0
                  divu         a4, ra, s8
                  csrrci       a7, 0x340, 0
                  srai         s1, s5, 2
                  c.addi       t5, 16
                  slli         s5, sp, 6
                  mulh         t4, gp, a7
                  div          ra, t3, t3
                  c.li         sp, 7
                  xor          s1, t0, s4
                  ori          a0, a0, -92
                  c.addi       s7, 25
                  c.li         s9, 1
                  c.mv         a3, ra
                  srl          s7, a4, ra
                  csrrwi       s11, 0x340, 11
                  c.add        s2, t6
                  or           t0, t5, zero
                  c.srai       s0, 8
                  srl          s1, a6, t0
                  c.sub        a1, a3
                  addi         ra, a4, -1731
                  sra          s0, a4, a3
                  slti         s9, s4, 769
                  ori          a1, zero, -611
                  c.addi       s7, -1
                  remu         s0, a7, s11
                  lui          a2, 414405
                  xori         s9, t2, -1255
                  sll          a5, a7, s3
                  csrrw        t3, 0x340, a6
                  auipc        t0, 297413
                  c.xor        s1, a1
                  srl          s11, a4, zero
                  c.and        a5, a3
                  csrrci       s9, 0x340, 0
                  c.srli       s1, 21
                  csrrc        sp, 0x340, s7
                  slli         a6, a6, 26
                  slti         s7, t0, 1709
                  c.add        s8, a2
                  sltu         s2, a7, s4
                  nop
                  c.srli       a2, 25
                  slt          a1, t2, t5
                  c.sub        a2, a3
                  c.or         a2, s0
                  csrrci       a7, 0x340, 16
                  csrrc        a4, 0x340, a1
                  sub          a0, t3, s11
                  srl          s5, gp, s2
                  sltiu        t1, t3, -1043
                  csrrc        s0, 0x340, tp
                  csrrsi       s11, 0x340, 15
                  c.srli       s1, 4
                  c.addi4spn   a2, sp, 720
                  sltu         a6, s0, s7
                  add          t1, a7, t3
                  div          ra, a0, ra
                  c.and        s1, a4
                  slti         a7, a6, -493
                  remu         t1, s2, t2
                  or           s11, s2, s4
                  div          a2, s5, s0
                  mulhsu       t3, t0, a6
                  slli         a2, t6, 27
                  c.andi       a5, 8
                  sll          a0, t2, a1
                  csrrs        t6, 0x340, s5
                  c.slli       t4, 31
                  slli         tp, s4, 25
                  and          t5, a3, t3
                  mulhu        a1, a4, s10
                  c.addi4spn   a2, sp, 816
                  c.addi4spn   a0, sp, 432
                  mulhu        a0, a0, s2
                  c.sub        a1, a2
                  remu         a1, t1, s5
                  slli         zero, t0, 31
                  sltiu        a0, t1, 1393
                  sra          a4, sp, s5
                  csrrwi       t1, 0x340, 15
                  or           s9, t0, s3
                  csrrs        tp, 0x340, a4
                  nop
                  c.srai       a1, 29
                  c.lui        s4, 14
                  c.addi16sp   sp, 160
                  csrrsi       t3, 0x340, 5
                  csrrw        sp, 0x340, t6
                  slli         a7, a1, 4
                  srli         s9, s3, 22
                  andi         t3, a4, -853
                  sra          s8, s2, s6
                  slli         s4, s11, 30
                  remu         ra, t3, a1
                  sub          s2, s8, t2
                  divu         ra, ra, s2
                  c.add        s7, a2
                  and          tp, s10, a5
                  add          t5, s0, a6
                  c.nop
                  csrrs        a1, 0x340, a6
                  andi         sp, s11, 944
                  csrrw        gp, 0x340, a2
                  c.li         s8, 29
                  sltu         t6, s6, s9
                  csrrci       s11, 0x340, 19
                  c.srli       a2, 5
                  xor          s7, zero, a7
                  c.addi4spn   s1, sp, 896
                  c.sub        a4, a2
                  mulhsu       a0, a1, t5
                  add          sp, s6, s7
                  c.srli       a2, 31
                  sra          s5, s10, s0
                  mulhsu       a0, s4, s9
                  c.mv         ra, s6
                  sltu         a2, tp, s1
                  c.lui        a1, 4
                  srli         s6, a6, 29
                  c.lui        a1, 13
                  csrrci       s1, 0x340, 10
                  csrrc        s0, 0x340, a2
                  rem          a1, ra, t5
                  c.sub        s1, a2
                  nop
                  c.nop
                  nop
                  c.sub        a2, a1
                  auipc        zero, 579660
                  mulhsu       a0, s5, t4
                  c.srai       a4, 25
                  csrrsi       s0, 0x340, 0
                  c.li         a2, -1
                  sub          a1, t4, a1
                  c.nop
                  xor          t1, t6, s5
                  slt          gp, gp, s7
                  csrrs        s11, 0x340, t3
                  csrrs        s4, 0x340, zero
                  c.mv         t1, t6
                  c.or         a4, s1
                  xor          s9, a4, ra
                  slli         a6, gp, 23
                  csrrsi       s8, 0x340, 0
                  remu         s9, s11, s9
                  srai         s8, s7, 6
                  c.srli       a4, 5
                  sll          s11, s10, a6
                  div          t5, a0, s3
                  rem          s9, a2, s2
                  slti         s5, s1, -235
                  c.or         s1, a5
                  c.mv         s4, s4
                  sll          ra, t0, tp
                  sltiu        sp, a0, -639
                  divu         a0, s2, s5
                  c.addi16sp   sp, 48
                  c.and        a1, a5
                  c.nop
                  c.lui        s11, 29
                  c.add        t4, s4
                  c.lui        t6, 11
                  slli         s2, a2, 4
                  or           a4, s10, a0
                  addi         t4, zero, 1456
                  or           a3, a3, t1
                  csrrsi       a3, 0x340, 0
                  sltu         s5, s5, s1
                  c.and        s1, a0
                  ori          s2, s0, -1008
                  csrrs        zero, 0x340, zero
                  c.add        t5, s10
                  srl          s8, s11, s4
                  c.li         gp, 9
                  srli         tp, sp, 21
                  srai         zero, t0, 0
                  c.li         s2, -1
                  sltiu        a4, t0, 553
                  c.addi4spn   a0, sp, 960
                  mulhsu       s11, a3, t0
                  divu         t3, s2, t5
                  c.or         a1, a3
                  mulh         sp, s11, t6
                  c.xor        a2, a3
                  mulhsu       t4, a2, t0
                  add          s9, s2, s0
                  c.andi       a3, 14
                  c.li         s0, -1
                  csrrw        s11, 0x340, s8
                  sltiu        t4, t2, 1155
                  sll          a7, s1, s2
                  lui          a3, 432745
                  lui          s5, 13261
                  mulh         a4, s5, t5
                  and          a2, s1, t6
                  csrrwi       a6, 0x340, 31
                  add          s2, a1, s4
                  c.and        a5, a5
                  and          t6, a4, t2
                  mul          s2, s8, s10
                  andi         a6, s7, 807
                  csrrsi       a2, 0x340, 6
                  mul          a6, s7, a7
                  c.xor        a4, a2
                  c.addi4spn   a2, sp, 624
                  ori          tp, s8, -454
                  c.mv         t1, t4
                  c.addi       gp, -1
                  csrrc        a6, 0x340, s9
                  csrrw        s7, 0x340, t6
                  srli         s7, s10, 8
                  csrrci       t5, 0x340, 0
                  addi         t5, s3, -1626
                  add          s11, s6, a3
                  nop
                  or           a3, a7, s6
                  or           t5, a7, t2
                  c.addi4spn   a1, sp, 192
                  c.mv         s2, s4
                  csrrci       gp, 0x340, 0
                  sltu         t4, s9, t6
                  and          s11, t1, tp
                  lui          a1, 673383
                  lui          tp, 1026712
                  sltiu        s0, a1, -1950
                  srai         zero, a7, 28
                  lui          t0, 612486
                  addi         t5, s9, 1140
                  c.nop
                  srai         t5, s1, 18
                  remu         t0, t4, s10
                  nop
                  auipc        sp, 754838
                  slti         s1, s7, -819
                  c.nop
                  mulhsu       a7, t5, a1
                  slli         s5, s5, 6
                  sra          ra, s1, a6
                  c.sub        s0, a5
                  csrrw        zero, 0x340, s7
                  slli         s8, t6, 24
                  c.lui        a3, 30
                  c.addi       s11, -1
                  srai         gp, s1, 14
                  c.srli       a3, 10
                  sub          t6, a1, s4
                  c.srai       a5, 26
                  srai         a7, s10, 5
                  div          s7, sp, zero
                  c.sub        a5, a0
                  c.and        s1, s1
                  and          tp, s11, s5
                  lui          a1, 301881
                  sra          s11, a2, a5
                  mul          t3, s9, s8
                  remu         t0, gp, s0
                  c.sub        a2, a1
                  slt          a7, s8, a3
                  sltu         s1, a6, ra
                  c.addi16sp   sp, -16
                  andi         sp, t2, 1709
                  c.addi16sp   sp, 16
                  andi         tp, s4, 33
                  c.and        a2, a1
                  c.addi4spn   a0, sp, 864
                  mul          s0, s8, a4
                  c.lui        t0, 11
                  xori         s5, t1, -1989
                  lui          gp, 1012780
                  addi         sp, t0, -219
                  csrrsi       s2, 0x340, 0
                  xori         a5, a5, 1817
                  mulhu        a3, t3, s8
                  nop
                  sltiu        a7, t5, 116
                  c.li         a4, 17
                  c.slli       a7, 23
                  c.slli       s7, 21
                  addi         zero, s2, 1513
                  remu         t3, gp, a7
                  or           s0, a1, tp
                  div          a7, a4, t5
                  c.or         a0, a4
                  addi         t1, a3, -1021
                  csrrci       s2, 0x340, 0
                  c.li         t0, 2
                  sltu         a4, t3, s5
                  c.addi16sp   sp, -16
                  addi         ra, s9, -1100
                  slti         s0, gp, 846
                  sra          s1, t4, s0
                  c.add        a7, s10
                  sltu         a5, s6, sp
                  c.slli       t4, 25
                  csrrc        s2, 0x340, zero
                  c.andi       a4, -1
                  c.xor        a4, a5
                  c.srai       a4, 25
                  c.and        s1, a1
                  sltu         a5, a5, a5
                  srl          s0, a4, s8
                  sltu         s1, s10, s0
                  or           t0, t4, t3
                  csrrc        t3, 0x340, zero
                  csrrci       t3, 0x340, 18
                  c.addi16sp   sp, -16
                  mulhu        s7, a1, s3
                  mulhu        t5, gp, s4
                  c.sub        a3, a3
                  xori         s8, s11, 118
                  slt          t3, s10, s1
                  c.srli       a0, 10
                  srai         a1, a6, 27
                  xori         s11, s8, 1841
                  csrrci       a1, 0x340, 22
                  auipc        a1, 953248
                  c.xor        a3, a0
                  sltu         a3, s5, s7
                  div          t4, t3, t3
                  csrrwi       s5, 0x340, 3
                  auipc        t1, 241040
                  rem          s7, s11, a4
                  c.li         a0, 14
                  srli         a3, t1, 6
                  mul          a5, s11, s9
                  sltiu        a2, s6, -1918
                  addi         tp, a6, -207
                  c.andi       s1, 19
                  csrrsi       a5, 0x340, 0
                  c.mv         t0, t5
                  sra          t6, s1, s6
                  sltiu        a7, ra, 350
                  c.srli       s1, 17
                  csrrsi       tp, 0x340, 0
                  c.addi       s11, 23
                  sll          gp, tp, zero
                  csrrci       a4, 0x340, 0
                  csrrwi       a1, 0x340, 4
                  c.slli       t3, 16
                  sltu         a5, tp, a3
                  csrrsi       s0, 0x340, 0
                  slti         a6, zero, 553
                  c.or         a4, a1
                  csrrw        a2, 0x340, a4
                  slti         sp, t6, 128
                  divu         s6, a2, a7
                  mulhsu       s2, s1, sp
                  c.slli       a6, 9
                  c.lui        a5, 15
                  c.srai       s0, 17
                  mulh         a7, a4, a3
                  mul          s9, t3, s6
                  xori         t4, t3, -443
                  addi         a1, s6, -549
                  c.add        ra, s3
                  mulhu        s11, s2, tp
                  srl          zero, tp, s8
                  slti         a7, t4, -765
                  csrrs        t3, 0x340, zero
                  mulhu        a4, t1, a2
                  auipc        a7, 557119
                  and          tp, a4, s3
                  srli         s8, a4, 20
                  c.sub        s0, a5
                  sltu         s2, a0, s5
                  c.and        a0, a2
                  c.add        s2, s5
                  c.addi       a0, -1
                  remu         sp, t4, s11
                  and          t0, a0, a6
                  slti         s4, a3, 449
                  sll          t6, s0, s2
                  csrrwi       a7, 0x340, 17
                  c.xor        a3, s1
                  xor          s6, a6, s4
                  c.nop
                  remu         s6, t0, a0
                  c.srli       a1, 15
                  c.andi       a5, 15
                  mul          s5, s3, a5
                  c.li         a1, 5
                  auipc        s5, 612900
                  sub          gp, a5, a6
                  c.nop
                  c.andi       a0, 18
                  slt          s5, s6, s6
                  c.or         a2, a5
                  addi         t1, s8, 1578
                  c.nop
                  slt          t0, zero, s1
                  c.andi       a4, 22
                  addi         t3, a1, 922
                  srli         a6, a0, 15
                  c.addi4spn   a5, sp, 80
                  csrrc        s1, 0x340, s7
                  slti         a0, a0, 1551
                  rem          s2, s5, a0
                  csrrci       s6, 0x340, 0
                  slt          s2, s4, s5
                  c.sub        a5, a0
                  lui          a4, 255848
                  xori         s8, t3, -1918
                  sltiu        gp, s8, -1344
                  c.addi16sp   sp, 128
                  c.sub        a5, s0
                  sra          s4, a4, a5
                  c.li         s7, -1
                  csrrci       t5, 0x340, 0
                  mulhsu       sp, zero, s5
                  xor          s9, s2, a2
                  mul          s0, a6, s1
                  c.andi       a2, -1
                  c.nop
                  csrrci       s5, 0x340, 0
                  nop
                  c.sub        a5, a2
                  c.andi       a3, 16
                  c.slli       s1, 14
                  sltiu        zero, s10, -1728
                  sltu         t6, t4, s0
                  auipc        t0, 779584
                  slt          s7, t1, s1
                  csrrci       t5, 0x340, 0
                  sltiu        a3, s10, 1484
                  c.and        a0, a1
                  c.nop
                  c.slli       gp, 23
                  c.mv         s9, s0
                  mul          zero, s6, a6
                  add          a6, t1, t4
                  andi         gp, s0, 375
                  slli         a0, a0, 30
                  auipc        s2, 974891
                  csrrwi       zero, 0x340, 0
                  c.mv         s4, sp
                  and          s8, s8, zero
                  c.addi       a3, 13
                  sra          s4, a1, ra
                  c.srai       s1, 15
                  srai         ra, s5, 12
                  or           sp, t6, t1
                  csrrci       a5, 0x340, 14
                  csrrci       a5, 0x340, 9
                  c.lui        a6, 15
                  sub          a4, s7, s10
                  c.andi       a3, 13
                  xor          a0, s1, s9
                  srli         s7, a4, 30
                  sltu         a5, s11, s8
                  sra          s2, t3, ra
                  c.li         s9, -1
                  srl          s4, s5, s11
                  c.add        a3, s7
                  csrrsi       tp, 0x340, 0
                  c.nop
                  c.addi16sp   sp, -16
                  srl          a0, t4, a0
                  slt          ra, a1, t5
                  divu         s4, a5, a0
                  csrrs        s2, 0x340, zero
                  mulh         s1, a3, a5
                  divu         a0, a3, t2
                  c.and        s0, s1
                  ori          t5, a0, -1625
                  c.addi16sp   sp, -16
                  csrrc        s4, 0x340, zero
                  rem          t4, s7, ra
                  c.srai       a3, 8
                  srli         t4, s3, 25
                  add          a1, s3, a1
                  csrrs        s2, 0x340, s1
                  or           s7, zero, a1
                  c.lui        s11, 17
                  c.li         a6, -1
                  add          t5, t4, s2
                  c.or         a2, s0
                  add          tp, s6, a2
                  c.add        s11, s4
                  c.srai       a1, 25
                  csrrs        a3, 0x340, zero
                  c.or         a2, a1
                  auipc        t1, 105873
                  remu         a4, ra, s2
                  mulhsu       t3, a6, t4
                  c.slli       a2, 24
                  sltu         a3, t0, tp
                  csrrwi       zero, 0x340, 16
                  mulh         s5, s9, s6
                  csrrwi       s2, 0x340, 28
                  srai         s1, a1, 5
                  andi         gp, s2, -59
                  slli         s8, s5, 27
                  sll          zero, t6, s6
                  c.li         t1, 0
                  slt          t6, s2, s4
                  rem          t0, t5, s10
                  srl          t3, t0, a1
                  add          a7, t4, t2
                  divu         t3, a4, s11
                  csrrwi       s4, 0x340, 16
                  mul          zero, t5, a1
                  csrrsi       ra, 0x340, 0
                  c.and        a2, a4
                  slt          t0, s5, s7
                  sll          s11, s8, s9
                  lui          t6, 978229
                  sltiu        s11, s2, -1265
                  auipc        tp, 665603
                  add          gp, t5, t4
                  div          a0, gp, s1
                  divu         s6, a3, a5
                  csrrci       s2, 0x340, 29
                  remu         a0, t3, t3
                  c.add        t3, gp
                  c.li         s9, -1
                  addi         s7, a5, -450
                  slti         a4, gp, -884
                  c.add        gp, a3
                  slli         a6, s2, 5
                  xori         a5, a0, -347
                  add          a3, sp, s1
                  csrrc        s11, 0x340, a4
                  div          s11, tp, a4
                  c.srli       a4, 28
                  c.mv         a1, t2
                  sltu         gp, s4, s6
                  mulhsu       s0, s7, t5
                  c.addi       s1, -1
                  c.and        a2, s0
                  c.slli       s2, 26
                  c.addi16sp   sp, -16
                  c.nop
                  or           s5, s10, s8
                  c.add        t1, s5
                  sub          s7, zero, s9
                  c.xor        a4, a2
                  c.addi16sp   sp, -16
                  sltiu        t5, s5, 990
                  remu         a0, zero, zero
                  c.srai       a3, 12
                  mulhu        s9, t6, s3
                  mulh         a1, t4, s6
                  csrrwi       sp, 0x340, 7
                  c.srai       s0, 19
                  c.nop
                  srai         s9, s2, 6
                  c.addi4spn   a5, sp, 704
                  mul          a2, t0, sp
                  mulhsu       s0, s10, s11
                  csrrw        t1, 0x340, s6
                  rem          s4, s3, t2
                  c.li         t5, -1
                  sub          s1, s7, s2
                  xori         a7, t4, 554
                  add          tp, t5, a1
                  c.li         a5, -1
                  c.sub        a4, a0
                  and          ra, a1, t4
                  csrrci       s2, 0x340, 0
                  csrrc        zero, 0x340, s9
                  mulhu        t0, s0, gp
                  slti         a7, s0, 1736
                  sub          a0, tp, zero
                  c.or         a5, a1
                  remu         a3, s8, t6
                  c.and        a3, s1
                  sub          a0, t6, sp
                  xori         s2, s11, -1541
                  slt          a7, a3, t5
                  slli         a3, a4, 31
                  c.addi16sp   sp, 304
                  div          sp, zero, zero
                  srl          a3, s3, s5
                  srl          s2, a2, s4
                  c.addi16sp   sp, -16
                  lui          a5, 761060
                  xori         a0, a2, -1524
                  andi         t3, s8, 1846
                  div          ra, s2, s10
                  csrrsi       a5, 0x340, 29
                  sltu         a3, a6, t2
                  addi         s8, s2, -1460
                  ori          s8, t4, 217
                  srai         s8, s10, 25
                  srl          t1, t5, s4
                  c.srai       a0, 17
                  sll          s4, s0, s0
                  sltiu        s2, t3, -1838
                  c.srli       a3, 30
                  addi         s1, gp, 1648
                  remu         a7, a1, tp
                  c.addi       s9, 10
                  mul          ra, a7, ra
                  lui          s5, 967391
                  c.nop
                  srl          t5, s6, a6
                  andi         gp, s9, -947
                  sra          a4, s7, a0
                  divu         t0, s2, a7
                  rem          s4, t6, t6
                  lui          a4, 147277
                  nop
                  addi         s7, a1, -757
                  addi         t3, ra, -629
                  c.srli       a1, 6
                  srai         a1, a3, 31
                  sltiu        s5, s9, 375
                  srai         tp, s3, 15
                  c.lui        s8, 1
                  xori         t4, gp, -1969
                  c.slli       s0, 2
                  c.xor        s1, a3
                  csrrsi       a6, 0x340, 0
                  nop
                  mulhsu       t6, s8, t3
                  mulhsu       a4, t1, a2
                  sltu         s6, gp, s4
                  c.addi4spn   a1, sp, 400
                  xori         t4, s5, 1971
                  xor          a4, s10, t5
                  slli         t1, ra, 14
                  c.andi       a3, -1
                  c.xor        a0, a2
                  srl          tp, t2, t4
                  c.xor        a2, s0
                  slti         a0, s0, 1471
                  lui          s1, 639834
                  xor          sp, s3, a1
                  c.xor        a1, a1
                  ori          s2, s5, 362
                  c.lui        s1, 19
                  or           zero, sp, s4
                  c.xor        a1, a5
                  sra          s7, a7, a1
                  csrrc        gp, 0x340, s4
                  csrrwi       s1, 0x340, 23
                  c.sub        a4, a2
                  sltu         s1, s0, a7
                  c.xor        a1, s0
                  andi         zero, t2, 782
                  c.sub        s0, a3
                  csrrsi       s7, 0x340, 0
                  c.addi       s11, 1
                  mulh         s11, s9, a7
                  c.sub        s0, a3
                  srli         ra, s4, 15
                  c.and        s1, a1
                  c.li         a3, -1
                  addi         a3, t4, -144
                  addi         s4, a1, -1134
                  srai         a5, s0, 8
                  addi         s8, a6, -985
                  c.slli       a4, 3
                  csrrc        t5, 0x340, zero
                  slt          s1, t4, a3
                  c.andi       s1, -1
                  slti         zero, t6, -1843
                  slt          t4, s3, a7
                  csrrwi       s9, 0x340, 13
                  mul          t4, tp, t6
                  c.addi16sp   sp, -16
                  mul          t0, a7, t2
                  csrrwi       t3, 0x340, 16
                  xor          ra, a3, a4
                  csrrsi       a7, 0x340, 0
                  remu         t6, s5, s10
                  auipc        t5, 469466
                  csrrs        a7, 0x340, zero
                  c.andi       a4, -1
                  c.li         s5, 19
                  mulhsu       t0, gp, gp
                  csrrs        s0, 0x340, zero
                  c.lui        s8, 29
                  mulh         tp, ra, gp
                  csrrci       s4, 0x340, 25
                  c.sub        a3, s0
                  csrrci       sp, 0x340, 30
                  srli         s6, gp, 8
                  div          a2, s1, t2
                  mulhu        a4, t2, s6
                  csrrsi       t4, 0x340, 11
                  slli         sp, s8, 8
                  and          s0, a2, s5
                  csrrsi       a2, 0x340, 29
                  c.srai       s0, 21
                  c.slli       t1, 6
                  mulh         s4, s5, t1
                  remu         a3, t4, a1
                  csrrsi       s2, 0x340, 0
                  c.addi4spn   a4, sp, 720
                  mulhsu       a4, gp, tp
                  nop
                  remu         zero, s9, t5
                  csrrc        t1, 0x340, zero
                  mulhsu       a7, s4, t1
                  c.addi4spn   a0, sp, 64
                  c.lui        t5, 22
                  sra          t5, a6, a7
                  c.srai       a0, 17
                  c.srli       a5, 25
                  c.andi       a4, -1
                  mul          t3, s9, s0
                  slti         s7, a2, 85
                  mulhsu       a0, a2, s2
                  mulhsu       t3, t4, s9
                  mul          t5, s8, s2
                  sll          s0, t3, t5
                  srai         t6, a3, 23
                  auipc        a7, 51441
                  c.addi       tp, 5
                  c.or         s1, a2
                  div          tp, t2, s11
                  c.andi       a0, -1
                  mulhsu       t0, s3, s7
                  c.nop
                  slti         t6, a5, 1924
                  sra          s5, a3, t4
                  c.srai       a0, 26
                  c.srli       a5, 28
                  c.li         sp, 22
                  c.srli       s0, 23
                  c.xor        a5, a3
                  c.or         a4, a4
                  and          zero, ra, t3
                  sub          t0, t6, t0
                  add          a5, t6, s8
                  srai         a3, s5, 30
                  add          s5, s0, a3
                  c.sub        a2, s1
                  addi         gp, s8, -1477
                  c.addi4spn   s0, sp, 672
                  sub          s8, a0, a0
                  srai         s2, s10, 20
                  c.andi       a2, -1
                  csrrwi       a2, 0x340, 15
                  csrrsi       zero, 0x340, 25
                  c.sub        a0, a2
                  sub          t5, a0, s2
                  mul          a6, sp, s11
                  c.slli       a2, 22
                  c.addi16sp   sp, 448
                  div          s9, t6, s11
                  c.slli       a6, 14
                  mulhsu       s2, t5, s1
                  xor          a1, t6, t5
                  csrrs        s4, 0x340, zero
                  csrrwi       s1, 0x340, 17
                  c.mv         a3, s3
                  or           tp, a6, t1
                  c.addi16sp   sp, 320
                  c.lui        s4, 24
                  mulh         t0, gp, t5
                  rem          s7, ra, a6
                  mulh         s9, s5, s7
                  rem          a2, s3, s3
                  srl          t5, s4, s7
                  srl          zero, a7, ra
                  slti         a3, t6, 1401
                  sll          s8, t6, t0
                  mulhu        s2, ra, s11
                  csrrwi       s11, 0x340, 0
                  c.addi16sp   sp, -16
                  remu         sp, s6, s9
                  c.mv         gp, s8
                  c.li         s4, 14
                  csrrsi       t1, 0x340, 21
                  c.slli       s9, 29
                  sll          gp, s0, a0
                  c.add        a5, s4
                  xori         s0, t0, 1846
                  srai         s6, s1, 27
                  c.addi4spn   a1, sp, 784
                  slti         a3, tp, 399
                  andi         tp, s10, -1939
                  sltu         a2, s7, s8
                  rem          a0, s2, a6
                  csrrs        s5, 0x340, zero
                  c.lui        s7, 2
                  divu         zero, tp, s10
                  c.xor        a5, a0
                  srai         t4, s0, 6
                  remu         ra, t2, t3
                  c.srai       a4, 27
                  c.srli       a2, 1
                  addi         s8, t4, 1170
                  sub          s2, s4, t4
                  ori          t4, zero, -934
                  c.andi       a1, 29
                  auipc        s0, 469180
                  sltu         zero, s8, s11
                  and          gp, s9, zero
                  slti         t4, sp, -459
                  slti         a6, gp, 61
                  c.srai       a1, 3
                  c.xor        a1, a1
                  c.addi       s5, -1
                  div          t5, a2, a6
                  sub          s2, s5, a6
                  csrrs        a7, 0x340, a1
                  c.addi4spn   a1, sp, 272
                  c.mv         s8, a7
                  nop
                  c.mv         sp, t5
                  sub          zero, s4, s5
                  nop
                  csrrci       ra, 0x340, 0
                  c.addi       t4, -1
                  srai         gp, t3, 6
                  csrrci       a4, 0x340, 0
                  c.srli       a5, 23
                  c.xor        a0, a2
                  csrrs        s0, 0x340, t4
                  sltiu        t6, t3, 687
                  c.sub        s0, s1
                  c.sub        a5, a2
                  sra          s8, s11, t4
                  c.nop
                  c.srai       a0, 17
                  csrrwi       gp, 0x340, 30
                  remu         t6, s10, sp
                  c.nop
                  c.nop
                  sltu         a6, s10, tp
                  sltu         ra, tp, a4
                  srl          s6, t2, a2
                  andi         a0, a2, -1158
                  srli         s8, a4, 20
                  srai         t1, s8, 3
                  nop
                  xor          a3, t3, s9
                  c.srli       s1, 16
                  c.addi16sp   sp, 272
                  csrrwi       t6, 0x340, 25
                  ori          s1, t1, 1970
                  xor          t5, t0, t0
                  srli         a7, t0, 6
                  mulh         ra, ra, s1
                  c.srli       a0, 13
                  c.addi       a2, 21
                  ori          ra, s7, 573
                  add          t3, s3, a4
                  c.sub        a5, s1
                  addi         tp, s2, 1259
                  c.nop
                  c.andi       a1, 14
                  c.mv         s11, s4
                  rem          t1, tp, s2
                  c.srai       s1, 31
                  mul          s8, s9, a6
                  csrrwi       s8, 0x340, 21
                  xori         sp, t4, 1477
                  auipc        a7, 363723
                  csrrwi       a3, 0x340, 13
                  srli         s11, s7, 7
                  c.nop
                  c.slli       s1, 3
                  and          zero, s9, a6
                  sra          a1, t1, a7
                  addi         s4, a1, -748
                  c.srli       a4, 15
                  sltu         ra, a4, t0
                  c.and        a5, a2
                  lui          tp, 172267
                  remu         a4, a0, a7
                  c.addi4spn   a4, sp, 832
                  rem          a1, a0, a0
                  xori         zero, a1, -1770
                  ori          zero, sp, -385
                  remu         gp, t2, a2
                  mul          t1, a5, s8
                  slti         s6, gp, -293
                  divu         a5, s2, a0
                  mul          a0, a3, s10
                  sub          s1, t5, s11
                  andi         t4, s6, 149
                  c.srai       a1, 16
                  mul          s5, s9, t0
                  csrrci       a3, 0x340, 19
                  csrrwi       a3, 0x340, 20
                  sll          t6, s1, zero
                  c.or         s0, a2
                  c.slli       s5, 20
                  divu         sp, s6, a7
                  csrrc        tp, 0x340, zero
                  mul          a1, a2, tp
                  sltiu        s11, s2, -175
                  c.srli       a3, 20
                  rem          t1, t3, t5
                  c.or         s1, a0
                  slti         sp, t4, -1425
                  slli         s5, a5, 29
                  sll          t6, s8, tp
                  c.slli       ra, 12
                  c.addi4spn   s0, sp, 336
                  csrrsi       a4, 0x340, 0
                  c.add        s11, s6
                  mulhsu       s0, t6, a5
                  slti         a1, t1, -1613
                  and          s11, zero, s5
                  xor          gp, a7, s2
                  c.add        a2, s4
                  srai         a6, s0, 7
                  c.and        a0, a2
                  srl          t4, t6, t3
                  srli         s9, a0, 16
                  ori          t1, a4, 887
                  srli         s1, s8, 29
                  mulhsu       gp, zero, t5
                  remu         a6, t1, s10
                  slli         t0, t1, 21
                  or           s9, a1, t0
                  slli         t4, s1, 19
                  xori         a0, s1, 1343
                  mul          zero, a1, t0
                  mulh         a6, a5, a6
                  c.mv         a6, sp
                  mul          a7, a0, s9
                  or           s0, t3, s3
                  c.addi       a7, 14
                  c.srli       a3, 28
                  andi         a6, t0, 844
                  c.addi4spn   s1, sp, 544
                  sll          s11, s6, s11
                  sltiu        gp, t3, -1298
                  c.nop
                  srli         s5, a1, 12
                  rem          t1, s1, a2
                  sub          s4, s2, a4
                  c.addi       t1, -1
                  div          a1, t6, s9
                  csrrs        a4, 0x340, zero
                  lui          t6, 793984
                  sll          s8, a7, s7
                  or           s4, s7, s3
                  div          a1, a4, a3
                  sltu         ra, t6, s3
                  mulhu        s8, t1, a1
                  csrrwi       ra, 0x340, 2
                  divu         s5, s5, a4
                  and          s5, s9, ra
                  xori         t0, s7, -1995
                  sll          ra, a0, s3
                  c.mv         ra, t1
                  auipc        a7, 294925
                  csrrc        s1, 0x340, zero
                  c.srai       a1, 7
                  and          t0, a3, t2
                  c.and        a4, a5
                  c.addi       t1, -1
                  c.or         a1, a0
                  c.add        a4, a5
                  remu         a2, a0, a6
                  csrrsi       s0, 0x340, 0
                  slt          a1, ra, t1
                  c.add        t0, tp
                  sll          s0, s3, s3
                  add          s0, zero, t2
                  mul          t4, s7, ra
                  divu         gp, s6, s3
                  c.srli       a4, 12
                  sltiu        a5, zero, -723
                  srli         s5, s11, 2
                  addi         a4, s8, -71
                  c.and        s0, a3
                  csrrwi       zero, 0x340, 15
                  slt          a3, a2, s1
                  sltu         s9, s9, a5
                  csrrwi       t3, 0x340, 31
                  divu         a4, a4, t3
                  lui          t0, 696028
                  c.nop
                  c.mv         gp, a3
                  slt          a1, a7, s7
                  csrrci       s4, 0x340, 0
                  mulh         tp, a3, zero
                  c.srli       a1, 16
                  srl          a4, a5, t1
                  c.nop
                  c.or         a3, a3
                  c.slli       s1, 15
                  c.add        t1, s5
                  sltu         a6, t6, zero
                  c.and        s0, a5
                  c.or         a0, s1
                  divu         s1, tp, s9
                  divu         a3, s8, a0
                  remu         t1, s5, a0
                  rem          a3, s7, a2
                  c.mv         s1, t6
                  csrrsi       s8, 0x340, 18
                  rem          a3, s1, a0
                  lui          t4, 120076
                  remu         t1, s11, s9
                  mulh         tp, s2, sp
                  mulh         s11, a6, zero
                  divu         s6, gp, a1
                  divu         s1, t5, s8
                  c.sub        a0, a0
                  c.lui        a2, 12
                  div          s8, s8, s11
                  csrrc        ra, 0x340, s3
                  and          tp, t1, t1
                  sub          a5, t1, sp
                  srai         s9, t6, 19
                  c.srli       a3, 23
                  rem          a5, t1, t1
                  lui          zero, 115561
                  mulhsu       s11, a1, s0
                  csrrc        a3, 0x340, zero
                  c.add        t1, s5
                  csrrw        a1, 0x340, s2
                  div          s1, s4, s4
                  sra          a4, a2, t1
                  sub          s9, a1, s6
                  add          a7, t1, a2
                  c.nop
                  divu         t0, s7, s4
                  mulhsu       s8, t0, s11
                  ori          t4, gp, -1257
                  c.and        a0, a3
                  addi         gp, a0, 216
                  c.slli       a7, 19
                  mul          s2, t6, t6
                  c.srli       s1, 3
                  c.andi       a0, -1
                  or           t0, gp, a2
                  mulhsu       t4, tp, a1
                  c.addi16sp   sp, -16
                  c.addi4spn   a4, sp, 864
                  srli         a6, t2, 12
                  sltiu        a6, s6, 1701
                  slt          s7, a1, s1
                  andi         gp, sp, 1401
                  and          a1, a1, s9
                  c.srli       a2, 12
                  mulh         s7, s5, a6
                  csrrw        zero, 0x340, s0
                  sra          t4, s0, s7
                  mulh         t6, s8, s4
                  div          a1, a6, a0
                  csrrci       s1, 0x340, 0
                  srai         s1, a2, 22
                  srai         a5, a7, 23
                  slti         s2, a7, 681
                  csrrwi       s7, 0x340, 24
                  c.addi       s6, -1
                  slli         a4, s2, 30
                  sra          t6, s10, t1
                  slt          a5, t5, t5
                  rem          tp, s4, t6
                  c.addi4spn   s1, sp, 896
                  c.li         t3, 8
                  csrrw        ra, 0x340, s4
                  c.srli       a4, 19
                  andi         s4, a4, 1039
                  c.srli       s1, 23
                  auipc        s1, 718710
                  mulh         s8, zero, s10
                  srli         a7, a4, 29
                  sub          s0, s3, zero
                  srl          s5, t6, a4
                  divu         s2, s10, gp
                  mul          s5, a1, s7
                  mulhu        s9, a3, a4
                  rem          t3, s6, a6
                  c.addi       t0, 25
                  c.sub        a2, a0
                  mulh         a1, t6, s10
                  c.addi       s6, -1
                  lui          s9, 763605
                  csrrc        t0, 0x340, s3
                  srai         s11, s8, 4
                  slti         a6, s8, -1916
                  c.li         a4, -1
                  ori          sp, a6, -572
                  c.li         ra, -1
                  or           ra, s9, s5
                  srl          s11, a0, a0
                  sub          s5, t2, s11
                  srli         t0, t3, 13
                  ori          s9, a3, 1377
                  xor          sp, s9, t6
                  rem          a2, t4, s6
                  divu         a4, s9, ra
                  sub          a4, s3, a1
                  and          a1, s1, s4
                  slti         a6, sp, -1832
                  or           s1, a6, a4
                  csrrci       t6, 0x340, 0
                  xor          a0, a6, a0
                  sltiu        ra, sp, 1201
                  mulhu        a3, sp, s1
                  remu         a5, a7, t2
                  c.andi       s1, -1
                  c.slli       tp, 29
                  c.xor        a1, a3
                  addi         t5, s4, 101
                  c.mv         a6, a1
                  rem          s9, t1, s6
                  addi         s0, sp, -1081
                  sll          a0, s10, ra
                  slli         s6, s6, 15
                  c.or         a3, s1
                  c.slli       s2, 30
                  mulhu        tp, a5, ra
                  c.lui        gp, 12
                  srl          zero, a1, gp
                  c.andi       s0, -1
                  c.addi16sp   sp, 224
                  rem          t5, gp, t2
                  andi         ra, a2, -61
                  c.add        a1, t0
                  csrrw        a6, 0x340, t0
                  csrrs        s11, 0x340, zero
                  sltiu        s4, t3, 55
                  c.and        a5, a5
                  csrrs        a0, 0x340, zero
                  csrrw        t5, 0x340, s8
                  c.srli       a1, 11
                  c.srli       s0, 25
                  and          a4, gp, a0
                  c.srli       s1, 30
                  csrrwi       a2, 0x340, 30
                  c.srli       a1, 19
                  c.andi       a3, -1
                  csrrsi       s2, 0x340, 19
                  c.addi16sp   sp, -16
                  and          t3, tp, ra
                  and          s6, a4, zero
                  xori         s1, s1, -285
                  add          t3, zero, a4
                  c.andi       s0, -1
                  andi         sp, s2, -1342
                  c.li         s4, -1
                  xori         a7, s4, -726
                  divu         a1, a2, s0
                  csrrs        t6, 0x340, s7
                  sltiu        ra, s4, -550
                  c.xor        a0, a1
                  csrrci       a0, 0x340, 21
                  c.addi4spn   a0, sp, 192
                  csrrci       s8, 0x340, 0
                  c.addi4spn   a4, sp, 416
                  c.andi       a5, -1
                  add          s0, a0, t2
                  xor          s7, s1, t2
                  mulhsu       a5, a6, s1
                  csrrc        t1, 0x340, zero
                  nop
                  c.srli       a0, 17
                  sra          ra, s9, s11
                  c.addi16sp   sp, 224
                  mulh         s6, s5, a1
                  c.addi4spn   s0, sp, 176
                  c.srli       s0, 6
                  c.or         a2, a2
                  divu         ra, a1, t2
                  c.li         s9, -1
                  csrrsi       t0, 0x340, 0
                  mulhu        a1, sp, a5
                  c.xor        a2, a4
                  sll          a1, s1, t2
                  c.and        s1, s0
                  slti         gp, t5, -781
                  c.addi4spn   a2, sp, 176
                  lui          t0, 880643
                  c.sub        a5, s1
                  c.mv         t4, gp
                  c.srli       a4, 1
                  c.addi4spn   a5, sp, 896
                  c.addi4spn   s0, sp, 816
                  rem          a6, a5, a2
                  c.srai       a2, 26
                  c.addi16sp   sp, 192
                  c.lui        s0, 14
                  c.sub        a3, a0
                  c.srli       a0, 12
                  csrrw        ra, 0x340, s4
                  slt          ra, a4, s1
                  c.sub        a1, a1
                  mul          s0, s5, tp
                  xori         s7, s11, -72
                  sll          a2, a2, t0
                  sra          s6, a1, t6
                  mulh         s0, a5, s7
                  slti         tp, t5, -1427
                  c.xor        a0, a3
                  auipc        s6, 757525
                  c.lui        t0, 24
                  add          sp, t4, s6
                  c.addi4spn   a0, sp, 224
                  c.or         s0, a1
                  ori          s11, t2, -741
                  csrrc        zero, 0x340, s9
                  csrrsi       t4, 0x340, 0
                  div          s9, a2, t2
                  c.srli       a5, 2
                  mulhsu       s9, a7, zero
                  c.li         a5, 2
                  sltu         s4, zero, s11
                  c.lui        t1, 22
                  sub          s4, t3, t1
                  add          zero, a7, a3
                  mulhu        a6, s11, s3
                  srl          s9, s1, a4
                  c.nop
                  c.addi4spn   s0, sp, 128
                  c.addi4spn   a4, sp, 816
                  c.slli       s5, 6
                  andi         s11, t4, -730
                  c.add        a4, t3
                  xor          t6, t4, a0
                  c.and        a2, s0
                  div          s5, gp, ra
                  csrrci       s2, 0x340, 0
                  c.srai       s0, 31
                  and          t4, a6, gp
                  xor          s2, s11, t4
                  c.andi       s1, -1
                  mulh         t6, a5, a6
                  c.addi16sp   sp, 304
                  sra          s2, s11, t0
                  csrrc        s9, 0x340, zero
                  c.and        a1, a3
                  sltu         a7, t6, a2
                  or           s0, sp, s1
                  csrrci       s0, 0x340, 28
                  c.sub        a5, a0
                  c.srli       s1, 14
                  slt          s7, a0, t6
                  slti         a7, s2, 1594
                  srli         t3, a5, 8
                  c.slli       t3, 3
                  mulh         a4, s3, t5
                  c.srli       s1, 2
                  csrrc        a0, 0x340, zero
                  xori         s7, s2, 451
                  remu         s9, t3, a7
                  csrrw        s9, 0x340, a0
                  ori          s4, tp, 1235
                  remu         s9, s7, t2
                  c.sub        s1, a0
                  c.li         a2, 16
                  srl          t5, s11, t3
                  auipc        s2, 858581
                  remu         a6, ra, t3
                  c.addi4spn   a4, sp, 832
                  c.srli       s0, 18
                  srai         s4, s7, 6
                  xor          gp, sp, t0
                  andi         a3, sp, -1270
                  slti         s4, t5, -1541
                  c.or         s0, a5
                  c.and        s0, a0
                  sub          s9, a5, a5
                  nop
                  slt          sp, zero, s7
                  divu         s9, s3, zero
                  c.lui        s9, 22
                  lui          s7, 549733
                  srai         t6, t5, 16
                  csrrwi       s1, 0x340, 14
                  and          tp, s2, a3
                  c.add        gp, a6
                  sltiu        s0, t0, -76
                  csrrwi       ra, 0x340, 11
                  csrrci       a6, 0x340, 18
                  nop
                  add          s11, tp, s2
                  c.mv         a0, a5
                  slt          a2, s7, s10
                  sub          t3, s6, t3
                  c.addi16sp   sp, -16
                  xor          a2, s1, t4
                  andi         s2, s2, -1617
                  sll          sp, a7, t3
                  or           t3, gp, a3
                  sra          t4, a5, t1
                  c.addi16sp   sp, 128
                  c.srli       s1, 11
                  remu         s8, s4, s1
                  slli         t3, s1, 6
                  sltiu        a2, t6, -845
                  slli         s5, s10, 26
                  ori          t5, a6, -5
                  c.srai       a0, 7
                  c.mv         s2, t1
                  sra          gp, a7, ra
                  sub          sp, a0, a3
                  sll          t5, a1, t6
                  remu         t4, s6, a7
                  c.mv         a6, ra
                  ori          a7, a2, -225
                  slli         a0, a3, 12
                  c.sub        a5, s0
                  csrrs        zero, 0x340, t0
                  c.li         s4, 8
                  csrrci       a2, 0x340, 0
                  mulh         t6, s11, s4
                  csrrw        s8, 0x340, t3
                  ori          a1, gp, 1910
                  c.and        a4, s0
                  csrrc        t1, 0x340, zero
                  c.srli       a4, 18
                  rem          t3, a7, s10
                  srli         s9, a5, 18
                  sll          gp, t1, t1
                  sra          t3, t0, a5
                  auipc        tp, 712773
                  sra          a1, s6, s4
                  c.slli       s11, 3
                  c.mv         ra, t0
                  auipc        a2, 406196
                  c.srai       a4, 27
                  sltiu        a7, s2, -1194
                  divu         tp, s11, s2
                  c.sub        a0, s0
                  csrrsi       t6, 0x340, 14
                  srl          zero, t6, s10
                  c.xor        a5, a1
                  c.nop
                  mulh         ra, t4, a0
                  ori          s1, s8, -340
                  csrrs        ra, 0x340, zero
                  ori          s6, t3, -197
                  mul          t3, s10, s9
                  c.xor        a3, a5
                  sra          a7, tp, t3
                  c.add        a0, a3
                  slli         t5, a5, 26
                  c.nop
                  xor          sp, t5, s0
                  srl          s4, a3, t5
                  sltu         s1, s10, s5
                  mulhsu       s5, sp, sp
                  rem          gp, s0, zero
                  c.or         a1, a0
                  csrrwi       zero, 0x340, 8
                  c.or         s1, a5
                  and          s4, s3, s6
                  c.addi16sp   sp, 240
                  divu         ra, t5, s7
                  csrrci       s6, 0x340, 0
                  csrrs        s8, 0x340, a3
                  sll          s0, a7, a5
                  auipc        a6, 932451
                  remu         s5, s3, s10
                  c.nop
                  and          t0, s9, ra
                  sltu         a7, t1, a4
                  csrrwi       s2, 0x340, 4
                  xori         s1, s10, 1701
                  mul          t4, t1, gp
                  rem          ra, s2, t5
                  c.addi4spn   a3, sp, 944
                  c.sub        a1, a0
                  lui          a3, 759756
                  c.andi       a2, 29
                  c.lui        s1, 28
                  c.addi       t5, -1
                  srl          s4, s7, s0
                  c.slli       gp, 13
                  csrrsi       sp, 0x340, 13
                  andi         a1, a3, -194
                  c.and        a1, a0
                  c.li         s9, 23
                  sll          s4, a2, s1
                  divu         a0, a4, s4
                  c.sub        a2, s1
                  and          a6, s10, s10
                  csrrwi       s11, 0x340, 12
                  sltiu        a7, a7, -1507
                  ori          s4, s4, 1040
                  c.add        a3, s10
                  addi         s5, t3, -1094
                  sll          ra, a4, tp
                  c.and        a4, a1
                  mulhsu       a3, gp, s11
                  or           a3, s8, t3
                  csrrsi       s6, 0x340, 0
                  c.nop
                  c.addi4spn   a1, sp, 928
                  div          t5, a6, s1
                  ori          s9, a3, 1939
                  c.li         s2, -1
                  slli         t1, a4, 21
                  nop
                  ori          s7, t1, 774
                  and          a7, t2, s2
                  c.add        s1, t1
                  addi         a0, a0, -562
                  nop
                  c.or         a1, s1
                  andi         t3, a5, -1692
                  c.slli       gp, 5
                  mul          s2, t4, s1
                  c.li         s4, -1
                  ori          s7, sp, 1475
                  csrrci       a7, 0x340, 12
                  andi         a1, s10, -344
                  mulhu        s4, a4, ra
                  mulhu        sp, a2, t4
                  c.nop
                  c.add        ra, ra
                  c.lui        s7, 14
                  sltiu        s0, t5, 976
                  c.addi       a2, -1
                  sub          a4, s11, gp
                  c.sub        a4, a2
                  mulh         s6, s2, s0
                  xor          zero, t4, s5
                  sra          s1, s11, s3
                  c.andi       s0, 24
                  c.nop
                  remu         s5, sp, sp
                  c.addi       a1, -1
                  srli         s7, t1, 25
                  c.li         s11, -1
                  sra          sp, s0, t0
                  c.nop
                  sltiu        s0, s2, -1045
                  srai         s11, s0, 31
                  c.addi16sp   sp, -16
                  c.addi16sp   sp, -16
                  remu         a0, sp, a6
                  sltu         s1, gp, a6
                  c.srai       a2, 11
                  mulhsu       a6, a3, s11
                  sltiu        t5, s0, 424
                  mulhsu       t0, s4, a2
                  c.or         s1, s1
                  c.nop
                  c.xor        a0, a1
                  c.slli       s9, 10
                  c.addi4spn   a2, sp, 688
                  sub          sp, a3, s11
                  c.addi       s7, 31
                  srai         a0, s1, 23
                  c.xor        a5, s1
                  mulhsu       a4, a7, tp
                  nop
                  and          s2, t1, a5
                  sll          s7, s5, t2
                  add          s11, s5, a3
                  rem          t4, a7, t3
                  c.addi4spn   a5, sp, 736
                  lui          s7, 558613
                  csrrci       s4, 0x340, 26
                  slti         s9, s4, 1662
                  c.and        a3, a3
                  add          s4, a5, a7
                  c.xor        a2, a2
                  sra          a4, s3, s9
                  sltiu        zero, t3, 566
                  andi         a1, t0, -1421
                  mulh         s9, s5, t3
                  c.or         s0, a2
                  auipc        t3, 199347
                  andi         a0, t0, 1813
                  c.add        t4, a4
                  mulhu        t3, s6, s11
                  c.srai       a4, 23
                  mulhsu       sp, s6, s1
                  mul          gp, t0, ra
                  srai         t3, s2, 29
                  mulhu        a6, a1, a7
                  sub          t1, s1, s6
                  mulhu        a6, a4, t1
                  xori         a6, s7, -491
                  csrrc        s11, 0x340, a0
                  sra          t6, a0, gp
                  sll          s2, s6, s4
                  ori          s8, s0, -228
                  nop
                  srli         t6, t0, 28
                  addi         s7, t5, -1308
                  c.sub        a1, a4
                  c.mv         t0, ra
                  c.slli       s5, 18
                  csrrw        s5, 0x340, a3
                  srli         ra, t6, 9
                  nop
                  slt          t5, s2, s9
                  mul          s8, t5, a2
                  sltu         t6, ra, a0
                  sll          s9, a7, a0
                  mulh         a0, t3, gp
                  mul          a0, a5, t1
                  slli         s7, a4, 9
                  c.andi       s0, 27
                  sub          s2, t2, ra
                  mulhsu       s6, t2, s4
                  c.slli       t6, 6
                  c.addi4spn   a0, sp, 736
                  mul          s1, tp, a2
                  xori         a1, t3, 1525
                  c.addi4spn   a2, sp, 960
                  c.or         a2, a1
                  c.nop
                  div          a4, t6, a5
                  addi         zero, t5, -1489
                  rem          a5, t0, s9
                  nop
                  andi         s4, sp, 1618
                  csrrs        s0, 0x340, a6
                  csrrc        t0, 0x340, zero
                  remu         s6, s10, a2
                  addi         t0, t2, 1896
                  addi         t3, sp, -1448
                  c.or         a3, a0
                  div          s6, s4, a1
                  csrrwi       s0, 0x340, 23
                  sra          s4, a2, s8
                  ori          s8, s3, -2030
                  div          s4, s11, a4
                  mulhsu       zero, s9, t4
                  nop
                  c.or         s0, a2
                  c.xor        s1, a3
                  c.andi       s0, 26
                  c.addi       a5, 15
                  sltu         tp, s3, t1
                  srl          t1, s7, a7
                  div          s5, t4, s5
                  nop
                  c.xor        a1, a0
                  remu         s4, a1, s8
                  xori         a1, t3, -904
                  rem          gp, a3, s6
                  c.mv         s0, t0
                  csrrc        s9, 0x340, zero
                  rem          s6, s11, a6
                  nop
                  rem          t1, a1, s2
                  mul          a2, a3, a2
                  csrrs        t5, 0x340, ra
                  c.or         a1, s0
                  csrrsi       a3, 0x340, 9
                  slti         s6, t2, -2027
                  c.lui        a3, 30
                  mul          tp, s8, gp
                  andi         t3, s9, -481
                  xor          a4, t5, t3
                  addi         s7, t5, 743
                  c.xor        a0, a5
                  c.srli       a0, 8
                  c.or         a1, a0
                  csrrs        s6, 0x340, zero
                  c.addi       s1, -1
                  c.srai       a5, 17
                  srai         a1, s0, 17
                  mulhu        a7, zero, s1
                  c.andi       s1, -1
                  c.addi16sp   sp, -16
                  c.lui        t4, 28
                  slt          a1, t5, t6
                  c.sub        a4, s0
                  mulhu        s0, a5, s8
                  c.sub        a1, a2
                  and          a6, t0, a6
                  slli         t3, t6, 30
                  c.and        a0, a4
                  c.addi4spn   a5, sp, 560
                  or           t4, ra, sp
                  c.or         s1, a3
                  sra          s11, a1, gp
                  mulhu        t0, t6, t5
                  remu         a6, a4, s4
                  mulhsu       gp, s6, a5
                  xor          tp, a2, t0
                  c.sub        s1, a2
                  c.lui        t5, 2
                  div          s7, s5, s7
                  srai         a3, t6, 20
                  csrrwi       s1, 0x340, 7
                  srl          s2, s4, t0
                  add          a6, t3, zero
                  add          s5, a4, a5
                  and          s0, t1, gp
                  slti         a2, tp, 2021
                  slt          a0, sp, tp
                  c.andi       a5, -1
                  slli         sp, s10, 14
                  xori         t6, s2, -1254
                  c.or         a4, a3
                  remu         t5, t2, s4
                  c.lui        a2, 13
                  remu         a2, s6, s5
                  slli         a3, a7, 0
                  div          t0, t6, s0
                  sub          s0, tp, s2
                  c.or         a3, s0
                  xori         s6, gp, -873
                  slli         s1, s4, 17
                  divu         zero, s6, s9
                  remu         s6, s10, s0
                  mulhu        s2, a7, a4
                  c.andi       a3, -1
                  ori          s2, a3, -778
                  csrrsi       s4, 0x340, 0
                  c.srli       a4, 26
                  c.addi4spn   a5, sp, 1008
                  c.sub        s0, a4
                  nop
                  csrrc        a2, 0x340, zero
                  mulhsu       s11, ra, a4
                  divu         zero, a6, t5
                  c.and        a2, a4
                  c.and        a1, s0
                  sltiu        s7, s1, -232
                  slli         gp, sp, 29
                  sra          zero, s10, s0
                  addi         t1, t2, -91
                  sltiu        s7, a5, 725
                  sltu         tp, a5, t3
                  div          s2, gp, a3
                  add          t1, s0, t6
                  c.srli       s1, 5
                  sll          a7, a6, a2
                  c.srli       a5, 15
                  csrrs        t3, 0x340, s0
                  c.li         s4, 24
                  auipc        s1, 1013838
                  srl          s0, a6, s8
                  rem          a4, a0, a1
                  c.mv         a5, a0
                  lui          t3, 135977
                  sub          t5, a4, t6
                  or           t3, s11, s11
                  c.andi       s0, -1
                  csrrwi       a2, 0x340, 29
                  c.lui        a1, 29
                  nop
                  slli         tp, s4, 31
                  divu         s7, a1, s0
                  auipc        s1, 350701
                  sra          s8, a7, t3
                  c.xor        a1, a5
                  c.addi16sp   sp, -16
                  csrrsi       t3, 0x340, 5
                  mulhsu       ra, s1, s7
                  c.or         s0, s0
                  csrrci       gp, 0x340, 24
                  c.addi16sp   sp, 224
                  srli         s4, t3, 21
                  andi         t5, a7, -1835
                  slli         sp, tp, 23
                  and          zero, a2, a6
                  c.lui        s9, 7
                  slli         a7, s11, 5
                  slti         t4, a7, 1620
                  c.slli       a5, 23
                  c.li         s8, 1
                  sra          a3, a3, s7
                  mulh         a6, s10, s11
                  auipc        sp, 537547
                  srl          t6, t5, sp
                  mulh         t5, s7, s7
                  c.nop
                  sltu         s6, s7, a6
                  c.mv         a7, t1
                  mulh         s8, t0, s0
                  mul          t5, t4, a0
                  auipc        s0, 376674
                  sltiu        t1, a5, 236
                  nop
                  c.addi       s2, -1
                  csrrw        t6, 0x340, t0
                  div          s2, s0, t3
                  nop
                  c.srli       a2, 31
                  c.andi       a5, 18
                  c.slli       t4, 10
                  csrrs        s6, 0x340, s3
                  c.srli       a2, 30
                  c.sub        s0, a1
                  csrrsi       s8, 0x340, 21
                  ori          a2, s1, 1568
                  c.sub        a3, s1
                  c.srai       a5, 25
                  mul          s4, t3, sp
                  c.and        a4, s1
                  csrrs        zero, 0x340, a5
                  sra          s11, s5, a5
                  c.or         s1, a5
                  ori          s7, t6, 992
                  sll          a0, a7, tp
                  auipc        a5, 626442
                  lui          zero, 574699
                  c.li         s6, 22
                  xor          s8, s8, s0
                  rem          t3, s3, s7
                  mulhu        a6, s2, t6
                  xori         t6, a6, -553
                  c.or         a1, a4
                  addi         tp, t4, -1281
                  remu         a4, gp, s7
                  c.mv         s11, a4
                  c.addi16sp   sp, -16
                  xori         a0, s1, -20
                  or           s0, a7, s5
                  sltiu        s1, s1, -1109
                  csrrsi       a4, 0x340, 21
                  sra          s7, s0, s8
                  or           s9, a7, t0
                  sltiu        t1, gp, 5
                  srli         a5, a6, 28
                  c.and        a5, a1
                  andi         gp, tp, -1414
                  sub          s9, s4, s4
                  slti         a4, s7, -1389
                  sra          ra, s11, s11
                  mul          a3, a7, a0
                  c.slli       s11, 24
                  srai         a3, a4, 13
                  xor          s1, t4, zero
                  c.lui        a0, 5
                  nop
                  mulh         t1, a6, s7
                  c.lui        s7, 3
                  c.sub        a2, s1
                  csrrci       a1, 0x340, 13
                  slti         s8, a1, -694
                  csrrci       s1, 0x340, 0
                  c.srai       s0, 6
                  and          s5, t3, a7
                  srai         s2, t2, 2
                  c.lui        a6, 8
                  c.addi       s7, 28
                  add          sp, s11, a3
                  mulhsu       t3, s7, tp
                  or           a2, a1, s7
                  divu         a5, s7, s2
                  mul          a6, s6, s10
                  nop
                  rem          s6, t4, a1
                  c.slli       t3, 23
                  c.slli       s11, 6
                  c.srli       s1, 19
                  andi         s2, t2, 1458
                  mulhsu       zero, s5, t6
                  c.or         s0, s0
                  csrrwi       a7, 0x340, 4
                  mulh         s1, t1, a1
                  ori          a2, a0, -425
                  xori         a0, a2, -275
                  mul          a2, t4, s6
                  add          t6, s7, a6
                  andi         a3, s10, -780
                  c.add        t6, t6
                  mulhsu       s11, s1, s5
                  andi         t5, zero, -540
                  mulh         zero, gp, a7
                  addi         a7, a6, 1339
                  sltu         s11, t4, a3
                  c.and        a1, a0
                  csrrw        s2, 0x340, s9
                  xor          sp, s6, sp
                  mulhsu       s11, s3, s8
                  and          s8, t6, s3
                  remu         a2, a4, a3
                  c.srli       a0, 12
                  add          t6, t0, s3
                  mulh         tp, sp, t6
                  sra          a6, s9, sp
                  c.li         s0, 17
                  or           t0, t4, t2
                  divu         a5, s2, s6
                  sub          a0, t3, s1
                  csrrsi       t1, 0x340, 9
                  or           s11, gp, zero
                  addi         s4, a6, 528
                  add          a0, sp, s0
                  c.li         tp, -1
                  csrrci       s0, 0x340, 6
                  slti         s11, t2, 1949
                  div          gp, ra, t5
                  and          a7, s2, t5
                  mulhu        s8, t4, s10
                  nop
                  c.srli       s1, 20
                  srl          sp, s11, s10
                  remu         t3, sp, s10
                  or           a1, s5, s11
                  slli         ra, a6, 28
                  c.lui        s0, 21
                  mulh         s0, s9, a6
                  sub          a7, a2, tp
                  c.slli       tp, 19
                  csrrs        a2, 0x340, zero
                  slt          a6, s7, s11
                  c.sub        a2, a2
                  mulh         t4, a2, t3
                  c.addi16sp   sp, -16
                  csrrci       tp, 0x340, 0
                  divu         t0, t2, s1
                  c.slli       a2, 14
                  remu         s6, a5, sp
                  auipc        s7, 1030999
                  xori         tp, a6, 283
                  c.and        a5, a2
                  andi         s1, s11, 142
                  slt          s5, zero, t3
                  ori          s8, tp, -1785
                  div          a7, s8, s5
                  xor          t0, a7, gp
                  c.sub        a1, a2
                  c.nop
                  csrrc        ra, 0x340, zero
                  c.sub        a0, a1
                  mul          a4, s11, t6
                  lui          t6, 969899
                  c.andi       s1, 12
                  c.slli       s1, 11
                  slli         sp, ra, 7
                  mul          gp, a0, t5
                  nop
                  xori         sp, s6, 1096
                  srli         ra, ra, 26
                  slli         t3, a0, 10
                  srai         tp, a7, 2
                  auipc        t5, 813115
                  divu         zero, t3, t4
                  lui          zero, 818182
                  csrrsi       a6, 0x340, 30
                  andi         ra, t3, 825
                  c.sub        s1, a5
                  c.srli       s1, 3
                  div          a2, ra, s8
                  c.srai       a2, 25
                  csrrsi       a3, 0x340, 0
                  xor          t5, t2, a5
                  slti         t4, s0, -1843
                  c.sub        a2, s1
                  mulh         s9, a6, t6
                  c.or         a4, a4
                  c.lui        a5, 17
                  add          t3, sp, a1
                  or           a4, s10, a0
                  c.slli       tp, 8
                  c.nop
                  csrrwi       s7, 0x340, 12
                  sub          tp, gp, s9
                  mulhsu       s11, ra, ra
                  c.and        a2, a5
                  andi         s8, t1, 1223
                  addi         tp, a3, -199
                  sra          a7, t6, s3
                  nop
                  c.lui        a2, 20
                  div          s7, a4, t3
                  mul          zero, a2, tp
                  andi         s1, t6, 274
                  c.addi16sp   sp, -16
                  mul          s9, sp, gp
                  c.addi       s0, -1
                  c.sub        s1, s0
                  andi         gp, a1, -693
                  lui          tp, 785520
                  csrrwi       t3, 0x340, 2
                  c.srai       a2, 17
                  addi         s7, s4, -785
                  addi         s7, a4, 1867
                  csrrci       s2, 0x340, 5
                  slti         s4, a2, 185
                  c.srli       a5, 2
                  srli         a3, a0, 17
                  addi         s9, s3, -394
                  c.addi4spn   a2, sp, 352
                  c.and        a2, a0
                  add          s9, a0, t6
                  nop
                  c.xor        a0, a0
                  csrrs        t4, 0x340, s6
                  c.slli       s2, 16
                  c.nop
                  sub          sp, s9, t6
                  slt          a0, gp, a6
                  c.addi       s4, -1
                  divu         a4, s9, t3
                  c.addi16sp   sp, 416
                  c.sub        a4, a2
                  mulhsu       zero, s4, s11
                  c.srai       a1, 31
                  c.or         a1, a3
                  xori         t4, s6, -1846
                  c.xor        a3, s0
                  c.add        t0, t3
                  div          sp, a2, t5
                  mulh         a3, a4, ra
                  sra          s5, s0, a2
                  srli         a5, s3, 25
                  c.addi4spn   a2, sp, 704
                  slti         t3, t2, -587
                  c.nop
                  nop
                  or           s6, s10, s0
                  csrrc        a1, 0x340, ra
                  csrrwi       gp, 0x340, 22
                  mulhsu       a0, t1, s9
                  c.addi4spn   a2, sp, 496
                  mul          s7, tp, s6
                  mul          t3, t1, t6
                  ori          a1, a4, 191
                  remu         s2, s1, a0
                  c.li         s11, 13
                  mulhu        t1, t2, zero
                  c.li         a0, -1
                  c.lui        a4, 18
                  addi         ra, s3, 524
                  c.or         s1, s1
                  addi         a6, t6, -1827
                  remu         a7, s8, t0
                  divu         a7, a0, s2
                  andi         s0, t0, -1736
                  nop
                  sltiu        s7, a0, -1933
                  rem          s6, gp, zero
                  srli         a4, s11, 13
                  add          t5, tp, a3
                  csrrs        zero, 0x340, zero
                  or           s6, a1, s0
                  c.add        a6, s1
                  c.mv         s5, t4
                  nop
                  sra          t0, gp, a2
                  c.and        a3, a2
                  c.or         a3, s1
                  srl          a2, a0, tp
                  csrrwi       s2, 0x340, 11
                  c.nop
                  or           s8, a0, a4
                  c.srli       a5, 13
                  and          s8, t3, s4
                  slti         s0, s11, 755
                  sub          tp, s6, s6
                  sltu         tp, a5, s0
                  c.slli       s9, 2
                  csrrc        s5, 0x340, zero
                  rem          ra, s9, t6
                  c.addi16sp   sp, 240
                  csrrs        gp, 0x340, zero
                  c.srli       a2, 10
                  mulh         s11, s8, s5
                  csrrci       s11, 0x340, 0
                  csrrsi       sp, 0x340, 17
                  sltiu        sp, t4, 8
                  add          s7, a2, zero
                  c.add        t1, t1
                  c.lui        s6, 20
                  csrrwi       sp, 0x340, 15
                  slli         s4, s3, 17
                  c.and        a2, a2
                  csrrw        a4, 0x340, t4
                  ori          t5, s9, -1107
                  or           a1, s0, a7
                  c.slli       s8, 12
                  mul          t1, a2, t4
                  sub          s11, t6, s10
                  srl          gp, gp, s2
                  divu         a6, t2, t1
                  c.or         a4, a4
                  sltu         gp, ra, t3
                  c.andi       a0, -1
                  srli         a0, s7, 4
                  c.or         a0, s1
                  c.or         a3, a2
                  c.and        a0, a3
                  slti         a6, a0, 582
                  c.srai       a4, 9
                  c.add        s2, s8
                  srl          a0, sp, tp
                  c.andi       a4, 0
                  xori         a3, t4, 1409
                  c.and        a1, s1
                  ori          s7, t4, -1157
                  c.xor        s0, s1
                  c.li         t3, -1
                  divu         a4, t5, ra
                  c.li         a2, 8
                  csrrci       s8, 0x340, 6
                  sra          a1, s3, gp
                  lui          ra, 521353
                  csrrci       a1, 0x340, 10
                  mul          a5, a0, a5
                  sll          s5, t1, a6
                  sll          s0, s11, t2
                  div          a1, s2, s11
                  c.lui        t5, 27
                  and          s7, t4, zero
                  srl          tp, a0, s2
                  mulh         t3, s5, ra
                  rem          t0, a4, s9
                  csrrci       zero, 0x340, 14
                  mulhsu       t3, a0, t3
                  and          a7, s1, a0
                  addi         s4, s9, 605
                  addi         a5, a6, 1782
                  lui          t3, 110881
                  csrrs        s11, 0x340, tp
                  sub          a7, s4, t5
                  c.mv         s2, a0
                  csrrs        a6, 0x340, zero
                  sltiu        s6, s8, -1034
                  slti         t5, tp, -799
                  slli         t3, s5, 25
                  xori         s9, s3, 655
                  c.or         a2, a1
                  c.slli       t1, 31
                  mul          a0, a4, s2
                  c.lui        s1, 23
                  sltu         t6, t5, s5
                  c.addi16sp   sp, 336
                  c.add        a4, a1
                  or           t6, s4, t1
                  c.srli       a3, 1
                  c.slli       s2, 3
                  xori         s2, s3, 1505
                  c.or         a4, a3
                  add          s7, s5, s9
                  mul          s8, t5, ra
                  c.and        s0, a5
                  c.lui        a6, 6
                  mulhsu       t0, s6, s1
                  c.nop
                  xor          tp, s7, a7
                  sll          gp, s0, s9
                  csrrw        s11, 0x340, s6
                  c.addi4spn   a4, sp, 800
                  c.slli       s5, 26
                  mul          ra, tp, s8
                  c.srli       s1, 16
                  addi         a6, tp, 798
                  c.or         a5, a2
                  mulhsu       s9, s4, s8
                  srai         a6, tp, 2
                  or           s5, t3, t0
                  c.srai       a1, 1
                  mulh         s7, s10, s7
                  csrrs        t3, 0x340, gp
                  csrrw        a1, 0x340, s7
                  sltu         s1, s3, t2
                  mulhu        t5, zero, a2
                  xori         s5, s10, 550
                  c.add        gp, a0
                  c.andi       a1, -1
                  divu         s6, s10, t4
                  add          a0, sp, s1
                  nop
                  c.srai       s1, 12
                  lui          sp, 327960
                  c.andi       a4, 29
                  c.andi       a3, -1
                  xori         a1, s3, -2020
                  c.srai       a3, 4
                  divu         t3, t4, tp
                  addi         s2, t4, 1434
                  andi         a0, a2, 756
                  c.slli       gp, 5
                  mulhu        a5, a3, s9
                  c.nop
                  srl          s2, t1, s4
                  slt          s4, s6, t4
                  divu         s11, t5, a7
                  csrrs        a7, 0x340, zero
                  xor          s9, s5, s10
                  csrrci       zero, 0x340, 23
                  and          s4, ra, a4
                  add          s0, t2, s1
                  c.addi4spn   a2, sp, 560
                  addi         t6, gp, -694
                  sltiu        gp, s0, 1273
                  mul          a1, s7, s7
                  csrrci       s7, 0x340, 0
                  c.lui        a0, 25
                  c.nop
                  slli         a6, s2, 5
                  andi         t6, s2, -341
                  mulhsu       a3, s5, a4
                  xor          a6, s8, s7
                  srli         s4, t1, 3
                  or           t1, a1, s1
                  addi         s5, tp, 1867
                  xori         a6, t6, -1974
                  and          s4, a1, tp
                  xori         s1, a1, 1400
                  auipc        gp, 235756
                  divu         zero, a7, zero
                  c.xor        s1, a5
                  and          sp, s11, s0
                  srl          a7, t1, s7
                  mulh         a7, t4, s10
                  c.li         t6, 20
                  sra          t5, s8, a4
                  lui          t6, 249567
                  or           ra, s5, a2
                  mulh         s6, t0, a7
                  slli         a3, a7, 26
                  rem          a7, sp, t1
                  or           zero, s7, s5
                  remu         a7, s8, s7
                  csrrs        s8, 0x340, a2
                  c.mv         a6, s8
                  c.add        t3, s0
                  lui          s4, 235979
                  xori         t5, s2, -1987
                  sltiu        sp, s0, 1342
                  sll          s0, t4, s6
                  csrrci       zero, 0x340, 0
                  mulhsu       a3, t0, t3
                  sltu         t3, s9, a4
                  c.xor        s1, s1
                  addi         s0, t2, -1810
                  slti         s7, a2, -1168
                  rem          tp, sp, gp
                  c.nop
                  slti         s6, a4, 1625
                  c.li         s7, -1
                  sra          s11, tp, a0
                  c.srai       a5, 14
                  sltiu        s11, s9, -696
                  xor          t0, s8, t0
                  csrrci       a3, 0x340, 0
                  add          s8, a4, t1
                  sll          a3, a2, a7
                  c.and        a3, s1
                  mulh         t3, t1, a7
                  nop
                  xor          zero, s7, t5
                  slti         a1, tp, 194
                  or           t4, s7, t3
                  div          a2, s0, ra
                  mulhu        ra, a7, a7
                  xor          gp, a6, t3
                  c.addi4spn   s1, sp, 528
                  or           s1, gp, ra
                  srl          a0, t6, t2
                  c.or         s0, a2
                  c.andi       s1, 28
                  ori          s4, t5, -1393
                  srai         zero, t1, 15
                  mul          a1, t2, s5
                  rem          a4, s7, t1
                  auipc        t0, 949652
                  c.sub        s1, a4
                  xor          ra, s11, t0
                  csrrci       tp, 0x340, 6
                  xor          a6, sp, s10
                  csrrsi       t0, 0x340, 0
                  csrrwi       s8, 0x340, 12
                  mul          a3, a0, t2
                  add          s2, a4, zero
                  sltiu        a7, s0, 270
                  rem          s6, t6, t3
                  mulh         a6, zero, s2
                  slti         a4, s3, 1648
                  addi         a5, zero, 1234
                  divu         s5, s7, a6
                  csrrsi       s4, 0x340, 0
                  c.mv         a0, s6
                  srl          s4, a7, s3
                  addi         a7, t6, -1452
                  sltiu        s0, a2, -1875
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
                  li x22, 0x8ffffffc
                  li x12, 0xd
                  slli x12, x12, 8
                  addi x12, x12, 0x0
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x342
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x342
                  sw x12, 0(x22)
                  csrr  x12, 0x341
                  addi  x12, x12, 4
                  csrw  0x341, x12
                  add x19, x26, zero
                  lw  x1, 4(x19)
                  lw  x2, 8(x19)
                  lw  x3, 12(x19)
                  lw  x4, 16(x19)
                  lw  x5, 20(x19)
                  lw  x6, 24(x19)
                  lw  x7, 28(x19)
                  lw  x8, 32(x19)
                  lw  x9, 36(x19)
                  lw  x10, 40(x19)
                  lw  x11, 44(x19)
                  lw  x12, 48(x19)
                  lw  x13, 52(x19)
                  lw  x14, 56(x19)
                  lw  x15, 60(x19)
                  lw  x16, 64(x19)
                  lw  x17, 68(x19)
                  lw  x18, 72(x19)
                  lw  x19, 76(x19)
                  lw  x20, 80(x19)
                  lw  x21, 84(x19)
                  lw  x22, 88(x19)
                  lw  x23, 92(x19)
                  lw  x24, 96(x19)
                  lw  x25, 100(x19)
                  lw  x26, 104(x19)
                  lw  x27, 108(x19)
                  lw  x28, 112(x19)
                  lw  x29, 116(x19)
                  lw  x30, 120(x19)
                  lw  x31, 124(x19)
                  addi x19, x19, 128
                  add x26, x19, zero
                  lw  x19, (x26)
                  addi x26, x26, 4
                  mret

illegal_instr_handler:
                  li x22, 0x8ffffffc
                  li x12, 0xa
                  slli x12, x12, 8
                  addi x12, x12, 0x0
                  sw x12, 0(x22)
                  li x22, 0x8ffffffc
                  li x12, 0x342
                  slli x12, x12, 8
                  addi x12, x12, 0x3
                  sw x12, 0(x22)
                  csrr x12, 0x342
                  sw x12, 0(x22)
                  csrr  x12, 0x341
                  addi  x12, x12, 4
                  csrw  0x341, x12
                  add x19, x26, zero
                  lw  x1, 4(x19)
                  lw  x2, 8(x19)
                  lw  x3, 12(x19)
                  lw  x4, 16(x19)
                  lw  x5, 20(x19)
                  lw  x6, 24(x19)
                  lw  x7, 28(x19)
                  lw  x8, 32(x19)
                  lw  x9, 36(x19)
                  lw  x10, 40(x19)
                  lw  x11, 44(x19)
                  lw  x12, 48(x19)
                  lw  x13, 52(x19)
                  lw  x14, 56(x19)
                  lw  x15, 60(x19)
                  lw  x16, 64(x19)
                  lw  x17, 68(x19)
                  lw  x18, 72(x19)
                  lw  x19, 76(x19)
                  lw  x20, 80(x19)
                  lw  x21, 84(x19)
                  lw  x22, 88(x19)
                  lw  x23, 92(x19)
                  lw  x24, 96(x19)
                  lw  x25, 100(x19)
                  lw  x26, 104(x19)
                  lw  x27, 108(x19)
                  lw  x28, 112(x19)
                  lw  x29, 116(x19)
                  lw  x30, 120(x19)
                  lw  x31, 124(x19)
                  addi x19, x19, 128
                  add x26, x19, zero
                  lw  x19, (x26)
                  addi x26, x26, 4
                  mret

pt_fault_handler: 
                  li x22, 0x8ffffffc
                  li x12, 0x8
                  slli x12, x12, 8
                  addi x12, x12, 0x0
                  sw x12, 0(x22)
                  nop

.align 2
mmode_intr_handler:
                  csrr  x12, 0x300 # MSTATUS;
                  csrr  x12, 0x304 # MIE;
                  csrr  x12, 0x344 # MIP;
                  csrrc x12, 0x344, x12 # MIP;
                  li x22, 0x8ffffffc
                  li x12, 0x7
                  slli x12, x12, 8
                  addi x12, x12, 0x0
                  sw x12, 0(x22)
                  add x19, x26, zero
                  lw  x1, 4(x19)
                  lw  x2, 8(x19)
                  lw  x3, 12(x19)
                  lw  x4, 16(x19)
                  lw  x5, 20(x19)
                  lw  x6, 24(x19)
                  lw  x7, 28(x19)
                  lw  x8, 32(x19)
                  lw  x9, 36(x19)
                  lw  x10, 40(x19)
                  lw  x11, 44(x19)
                  lw  x12, 48(x19)
                  lw  x13, 52(x19)
                  lw  x14, 56(x19)
                  lw  x15, 60(x19)
                  lw  x16, 64(x19)
                  lw  x17, 68(x19)
                  lw  x18, 72(x19)
                  lw  x19, 76(x19)
                  lw  x20, 80(x19)
                  lw  x21, 84(x19)
                  lw  x22, 88(x19)
                  lw  x23, 92(x19)
                  lw  x24, 96(x19)
                  lw  x25, 100(x19)
                  lw  x26, 104(x19)
                  lw  x27, 108(x19)
                  lw  x28, 112(x19)
                  lw  x29, 116(x19)
                  lw  x30, 120(x19)
                  lw  x31, 124(x19)
                  addi x19, x19, 128
                  add x26, x19, zero
                  lw  x19, (x26)
                  addi x26, x26, 4
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
