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
                  li x15, 0x40001106
                  csrw 0x301, x15
kernel_sp:        
                  la x25, kernel_stack_end

trap_vec_init:    
                  la x15, mtvec_handler
                  ori x15, x15, 1
                  csrw 0x305, x15 # MTVEC

pmp_setup:        
                  csrwi 0x747, 4
                  la x27, main
                  li x15, 0x0
                  add x27, x27, x15
                  srli x27, x27, 2
                  csrw 0x3b0, x27
                  la x27, main
                  li x15, 0x11111111
                  add x27, x27, x15
                  srli x27, x27, 2
                  csrw 0x3b1, x27
                  la x27, main
                  li x15, 0x22222222
                  add x27, x27, x15
                  srli x27, x27, 2
                  csrw 0x3b2, x27
                  la x27, main
                  li x15, 0x33333333
                  add x27, x27, x15
                  srli x27, x27, 2
                  csrw 0x3b3, x27
                  li x27, 0xf0f0f0f
                  csrw 0x3a0, x27
                  la x27, main
                  li x15, 0x44444444
                  add x27, x27, x15
                  srli x27, x27, 2
                  csrw 0x3b4, x27
                  la x27, main
                  li x15, 0x55555555
                  add x27, x27, x15
                  srli x27, x27, 2
                  csrw 0x3b5, x27
                  la x27, main
                  li x15, 0x66666666
                  add x27, x27, x15
                  srli x27, x27, 2
                  csrw 0x3b6, x27
                  la x27, main
                  li x15, 0x77777777
                  add x27, x27, x15
                  srli x27, x27, 2
                  csrw 0x3b7, x27
                  li x27, 0xf0f0f0f
                  csrw 0x3a1, x27
                  la x27, main
                  li x15, 0x88888888
                  add x27, x27, x15
                  srli x27, x27, 2
                  csrw 0x3b8, x27
                  la x27, main
                  li x15, 0x99999999
                  add x27, x27, x15
                  srli x27, x27, 2
                  csrw 0x3b9, x27
                  la x27, main
                  li x15, 0xaaaaaaaa
                  add x27, x27, x15
                  srli x27, x27, 2
                  csrw 0x3ba, x27
                  la x27, main
                  li x15, 0xbbbbbbbb
                  add x27, x27, x15
                  srli x27, x27, 2
                  csrw 0x3bb, x27
                  li x27, 0xf0f0f0f
                  csrw 0x3a2, x27
                  la x27, main
                  li x15, 0xcccccccc
                  add x27, x27, x15
                  srli x27, x27, 2
                  csrw 0x3bc, x27
                  la x27, main
                  li x15, 0xdddddddd
                  add x27, x27, x15
                  srli x27, x27, 2
                  csrw 0x3bd, x27
                  la x27, main
                  li x15, 0xeeeeeeee
                  add x27, x27, x15
                  srli x27, x27, 2
                  csrw 0x3be, x27
                  la x27, main
                  li x15, 0xffffffff
                  add x27, x27, x15
                  srli x27, x27, 2
                  csrw 0x3bf, x27
                  li x27, 0xf0f0f0f
                  csrw 0x3a3, x27

mepc_setup:       
                  la x15, init
                  csrw 0x341, x15

custom_csr_setup: 
                  csrwi 0x7c0, 1

init_machine_mode:
                  li x15, 0x1800
                  csrw 0x300, x15 # MSTATUS
                  li x15, 0x0
                  csrw 0x304, x15 # MIE
                  li x2, 0x8ffffffc
                  li x15, 0x300
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x300
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x304
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x304
                  sw x15, 0(x2)
                  mret
init:             
                  li x0, 0x3
                  li x1, 0x6
                  li x2, 0xcf4b4e8e
                  li x3, 0x0
                  li x4, 0xed36d412
                  li x5, 0x1b5079c0
                  li x6, 0xff61ccf8
                  li x7, 0x80000000
                  li x8, 0xf7433bf5
                  li x9, 0x80000000
                  li x10, 0x894eacb4
                  li x11, 0x5
                  li x12, 0xc8c3c5f7
                  li x13, 0xe
                  li x14, 0x5
                  li x15, 0xa
                  li x16, 0xf777f63d
                  li x17, 0x0
                  li x18, 0xf7f7a0e5
                  li x20, 0xf264becd
                  li x21, 0x0
                  li x22, 0xfc67f801
                  li x23, 0x0
                  li x24, 0x2
                  li x26, 0x81b7f6bd
                  li x27, 0x80000000
                  li x28, 0x9
                  li x29, 0x0
                  li x30, 0xa
                  li x31, 0xfe7ee8c7
                  la x19, user_stack_end
                  li x2, 0x8ffffffc
                  li x15, 0x0
                  slli x15, x15, 8
                  addi x15, x15, 0x0
                  sw x15, 0(x2)
                  j main
test_done:        
                  li x2, 0x8ffffff8
                  li x15, 0x0
                  slli x15, x15, 8
                  addi x15, x15, 0x1
                  sw x15, 0(x2)
                  ecall

test_fail:        
                  li x2, 0x8ffffff8
                  li x15, 0x1
                  slli x15, x15, 8
                  addi x15, x15, 0x1
                  sw x15, 0(x2)
                  ecall

mmode_intr_vector_1:
                  addi x25, x25, -4
                  sw  x19, (x25)
                  add x19, x25, zero
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
                  add x25, x19, zero
                  li x2, 0x8ffffffc
                  li x15, 0x6
                  slli x15, x15, 8
                  addi x15, x15, 0x0
                  sw x15, 0(x2)
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  li x2, 0x8ffffffc
                  li x15, 0x300
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x300
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x342
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x342
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x304
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x304
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x344
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x344
                  sw x15, 0(x2)
                  j mmode_intr_handler
                  1: la x27, test_done
                  jalr x0, x27, 0

mmode_intr_vector_2:
                  addi x25, x25, -4
                  sw  x19, (x25)
                  add x19, x25, zero
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
                  add x25, x19, zero
                  li x2, 0x8ffffffc
                  li x15, 0x6
                  slli x15, x15, 8
                  addi x15, x15, 0x0
                  sw x15, 0(x2)
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  li x2, 0x8ffffffc
                  li x15, 0x300
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x300
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x342
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x342
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x304
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x304
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x344
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x344
                  sw x15, 0(x2)
                  j mmode_intr_handler
                  1: la x27, test_done
                  jalr x0, x27, 0

mmode_intr_vector_3:
                  addi x25, x25, -4
                  sw  x19, (x25)
                  add x19, x25, zero
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
                  add x25, x19, zero
                  li x2, 0x8ffffffc
                  li x15, 0x6
                  slli x15, x15, 8
                  addi x15, x15, 0x0
                  sw x15, 0(x2)
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  li x2, 0x8ffffffc
                  li x15, 0x300
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x300
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x342
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x342
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x304
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x304
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x344
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x344
                  sw x15, 0(x2)
                  j mmode_intr_handler
                  1: la x27, test_done
                  jalr x0, x27, 0

mmode_intr_vector_4:
                  addi x25, x25, -4
                  sw  x19, (x25)
                  add x19, x25, zero
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
                  add x25, x19, zero
                  li x2, 0x8ffffffc
                  li x15, 0x6
                  slli x15, x15, 8
                  addi x15, x15, 0x0
                  sw x15, 0(x2)
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  li x2, 0x8ffffffc
                  li x15, 0x300
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x300
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x342
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x342
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x304
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x304
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x344
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x344
                  sw x15, 0(x2)
                  j mmode_intr_handler
                  1: la x27, test_done
                  jalr x0, x27, 0

mmode_intr_vector_5:
                  addi x25, x25, -4
                  sw  x19, (x25)
                  add x19, x25, zero
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
                  add x25, x19, zero
                  li x2, 0x8ffffffc
                  li x15, 0x6
                  slli x15, x15, 8
                  addi x15, x15, 0x0
                  sw x15, 0(x2)
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  li x2, 0x8ffffffc
                  li x15, 0x300
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x300
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x342
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x342
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x304
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x304
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x344
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x344
                  sw x15, 0(x2)
                  j mmode_intr_handler
                  1: la x27, test_done
                  jalr x0, x27, 0

mmode_intr_vector_6:
                  addi x25, x25, -4
                  sw  x19, (x25)
                  add x19, x25, zero
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
                  add x25, x19, zero
                  li x2, 0x8ffffffc
                  li x15, 0x6
                  slli x15, x15, 8
                  addi x15, x15, 0x0
                  sw x15, 0(x2)
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  li x2, 0x8ffffffc
                  li x15, 0x300
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x300
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x342
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x342
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x304
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x304
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x344
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x344
                  sw x15, 0(x2)
                  j mmode_intr_handler
                  1: la x27, test_done
                  jalr x0, x27, 0

mmode_intr_vector_7:
                  addi x25, x25, -4
                  sw  x19, (x25)
                  add x19, x25, zero
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
                  add x25, x19, zero
                  li x2, 0x8ffffffc
                  li x15, 0x6
                  slli x15, x15, 8
                  addi x15, x15, 0x0
                  sw x15, 0(x2)
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  li x2, 0x8ffffffc
                  li x15, 0x300
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x300
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x342
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x342
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x304
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x304
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x344
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x344
                  sw x15, 0(x2)
                  j mmode_intr_handler
                  1: la x27, test_done
                  jalr x0, x27, 0

mmode_intr_vector_8:
                  addi x25, x25, -4
                  sw  x19, (x25)
                  add x19, x25, zero
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
                  add x25, x19, zero
                  li x2, 0x8ffffffc
                  li x15, 0x6
                  slli x15, x15, 8
                  addi x15, x15, 0x0
                  sw x15, 0(x2)
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  li x2, 0x8ffffffc
                  li x15, 0x300
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x300
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x342
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x342
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x304
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x304
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x344
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x344
                  sw x15, 0(x2)
                  j mmode_intr_handler
                  1: la x27, test_done
                  jalr x0, x27, 0

mmode_intr_vector_9:
                  addi x25, x25, -4
                  sw  x19, (x25)
                  add x19, x25, zero
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
                  add x25, x19, zero
                  li x2, 0x8ffffffc
                  li x15, 0x6
                  slli x15, x15, 8
                  addi x15, x15, 0x0
                  sw x15, 0(x2)
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  li x2, 0x8ffffffc
                  li x15, 0x300
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x300
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x342
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x342
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x304
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x304
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x344
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x344
                  sw x15, 0(x2)
                  j mmode_intr_handler
                  1: la x27, test_done
                  jalr x0, x27, 0

mmode_intr_vector_10:
                  addi x25, x25, -4
                  sw  x19, (x25)
                  add x19, x25, zero
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
                  add x25, x19, zero
                  li x2, 0x8ffffffc
                  li x15, 0x6
                  slli x15, x15, 8
                  addi x15, x15, 0x0
                  sw x15, 0(x2)
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  li x2, 0x8ffffffc
                  li x15, 0x300
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x300
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x342
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x342
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x304
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x304
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x344
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x344
                  sw x15, 0(x2)
                  j mmode_intr_handler
                  1: la x27, test_done
                  jalr x0, x27, 0

mmode_intr_vector_11:
                  addi x25, x25, -4
                  sw  x19, (x25)
                  add x19, x25, zero
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
                  add x25, x19, zero
                  li x2, 0x8ffffffc
                  li x15, 0x6
                  slli x15, x15, 8
                  addi x15, x15, 0x0
                  sw x15, 0(x2)
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  li x2, 0x8ffffffc
                  li x15, 0x300
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x300
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x342
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x342
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x304
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x304
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x344
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x344
                  sw x15, 0(x2)
                  j mmode_intr_handler
                  1: la x27, test_done
                  jalr x0, x27, 0

mmode_intr_vector_12:
                  addi x25, x25, -4
                  sw  x19, (x25)
                  add x19, x25, zero
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
                  add x25, x19, zero
                  li x2, 0x8ffffffc
                  li x15, 0x6
                  slli x15, x15, 8
                  addi x15, x15, 0x0
                  sw x15, 0(x2)
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  li x2, 0x8ffffffc
                  li x15, 0x300
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x300
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x342
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x342
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x304
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x304
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x344
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x344
                  sw x15, 0(x2)
                  j mmode_intr_handler
                  1: la x27, test_done
                  jalr x0, x27, 0

mmode_intr_vector_13:
                  addi x25, x25, -4
                  sw  x19, (x25)
                  add x19, x25, zero
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
                  add x25, x19, zero
                  li x2, 0x8ffffffc
                  li x15, 0x6
                  slli x15, x15, 8
                  addi x15, x15, 0x0
                  sw x15, 0(x2)
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  li x2, 0x8ffffffc
                  li x15, 0x300
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x300
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x342
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x342
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x304
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x304
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x344
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x344
                  sw x15, 0(x2)
                  j mmode_intr_handler
                  1: la x27, test_done
                  jalr x0, x27, 0

mmode_intr_vector_14:
                  addi x25, x25, -4
                  sw  x19, (x25)
                  add x19, x25, zero
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
                  add x25, x19, zero
                  li x2, 0x8ffffffc
                  li x15, 0x6
                  slli x15, x15, 8
                  addi x15, x15, 0x0
                  sw x15, 0(x2)
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  li x2, 0x8ffffffc
                  li x15, 0x300
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x300
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x342
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x342
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x304
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x304
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x344
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x344
                  sw x15, 0(x2)
                  j mmode_intr_handler
                  1: la x27, test_done
                  jalr x0, x27, 0

mmode_intr_vector_15:
                  addi x25, x25, -4
                  sw  x19, (x25)
                  add x19, x25, zero
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
                  add x25, x19, zero
                  li x2, 0x8ffffffc
                  li x15, 0x6
                  slli x15, x15, 8
                  addi x15, x15, 0x0
                  sw x15, 0(x2)
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  li x2, 0x8ffffffc
                  li x15, 0x300
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x300
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x342
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x342
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x304
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x304
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x344
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x344
                  sw x15, 0(x2)
                  j mmode_intr_handler
                  1: la x27, test_done
                  jalr x0, x27, 0

mmode_intr_vector_16:
                  addi x25, x25, -4
                  sw  x19, (x25)
                  add x19, x25, zero
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
                  add x25, x19, zero
                  li x2, 0x8ffffffc
                  li x15, 0x6
                  slli x15, x15, 8
                  addi x15, x15, 0x0
                  sw x15, 0(x2)
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  li x2, 0x8ffffffc
                  li x15, 0x300
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x300
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x342
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x342
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x304
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x304
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x344
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x344
                  sw x15, 0(x2)
                  j mmode_intr_handler
                  1: la x27, test_done
                  jalr x0, x27, 0

mmode_intr_vector_17:
                  addi x25, x25, -4
                  sw  x19, (x25)
                  add x19, x25, zero
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
                  add x25, x19, zero
                  li x2, 0x8ffffffc
                  li x15, 0x6
                  slli x15, x15, 8
                  addi x15, x15, 0x0
                  sw x15, 0(x2)
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  li x2, 0x8ffffffc
                  li x15, 0x300
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x300
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x342
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x342
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x304
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x304
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x344
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x344
                  sw x15, 0(x2)
                  j mmode_intr_handler
                  1: la x27, test_done
                  jalr x0, x27, 0

mmode_intr_vector_18:
                  addi x25, x25, -4
                  sw  x19, (x25)
                  add x19, x25, zero
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
                  add x25, x19, zero
                  li x2, 0x8ffffffc
                  li x15, 0x6
                  slli x15, x15, 8
                  addi x15, x15, 0x0
                  sw x15, 0(x2)
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  li x2, 0x8ffffffc
                  li x15, 0x300
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x300
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x342
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x342
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x304
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x304
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x344
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x344
                  sw x15, 0(x2)
                  j mmode_intr_handler
                  1: la x27, test_done
                  jalr x0, x27, 0

mmode_intr_vector_19:
                  addi x25, x25, -4
                  sw  x19, (x25)
                  add x19, x25, zero
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
                  add x25, x19, zero
                  li x2, 0x8ffffffc
                  li x15, 0x6
                  slli x15, x15, 8
                  addi x15, x15, 0x0
                  sw x15, 0(x2)
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  li x2, 0x8ffffffc
                  li x15, 0x300
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x300
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x342
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x342
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x304
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x304
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x344
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x344
                  sw x15, 0(x2)
                  j mmode_intr_handler
                  1: la x27, test_done
                  jalr x0, x27, 0

mmode_intr_vector_20:
                  addi x25, x25, -4
                  sw  x19, (x25)
                  add x19, x25, zero
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
                  add x25, x19, zero
                  li x2, 0x8ffffffc
                  li x15, 0x6
                  slli x15, x15, 8
                  addi x15, x15, 0x0
                  sw x15, 0(x2)
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  li x2, 0x8ffffffc
                  li x15, 0x300
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x300
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x342
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x342
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x304
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x304
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x344
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x344
                  sw x15, 0(x2)
                  j mmode_intr_handler
                  1: la x27, test_done
                  jalr x0, x27, 0

mmode_intr_vector_21:
                  addi x25, x25, -4
                  sw  x19, (x25)
                  add x19, x25, zero
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
                  add x25, x19, zero
                  li x2, 0x8ffffffc
                  li x15, 0x6
                  slli x15, x15, 8
                  addi x15, x15, 0x0
                  sw x15, 0(x2)
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  li x2, 0x8ffffffc
                  li x15, 0x300
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x300
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x342
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x342
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x304
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x304
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x344
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x344
                  sw x15, 0(x2)
                  j mmode_intr_handler
                  1: la x27, test_done
                  jalr x0, x27, 0

mmode_intr_vector_22:
                  addi x25, x25, -4
                  sw  x19, (x25)
                  add x19, x25, zero
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
                  add x25, x19, zero
                  li x2, 0x8ffffffc
                  li x15, 0x6
                  slli x15, x15, 8
                  addi x15, x15, 0x0
                  sw x15, 0(x2)
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  li x2, 0x8ffffffc
                  li x15, 0x300
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x300
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x342
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x342
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x304
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x304
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x344
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x344
                  sw x15, 0(x2)
                  j mmode_intr_handler
                  1: la x27, test_done
                  jalr x0, x27, 0

mmode_intr_vector_23:
                  addi x25, x25, -4
                  sw  x19, (x25)
                  add x19, x25, zero
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
                  add x25, x19, zero
                  li x2, 0x8ffffffc
                  li x15, 0x6
                  slli x15, x15, 8
                  addi x15, x15, 0x0
                  sw x15, 0(x2)
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  li x2, 0x8ffffffc
                  li x15, 0x300
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x300
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x342
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x342
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x304
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x304
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x344
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x344
                  sw x15, 0(x2)
                  j mmode_intr_handler
                  1: la x27, test_done
                  jalr x0, x27, 0

mmode_intr_vector_24:
                  addi x25, x25, -4
                  sw  x19, (x25)
                  add x19, x25, zero
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
                  add x25, x19, zero
                  li x2, 0x8ffffffc
                  li x15, 0x6
                  slli x15, x15, 8
                  addi x15, x15, 0x0
                  sw x15, 0(x2)
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  li x2, 0x8ffffffc
                  li x15, 0x300
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x300
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x342
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x342
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x304
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x304
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x344
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x344
                  sw x15, 0(x2)
                  j mmode_intr_handler
                  1: la x27, test_done
                  jalr x0, x27, 0

mmode_intr_vector_25:
                  addi x25, x25, -4
                  sw  x19, (x25)
                  add x19, x25, zero
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
                  add x25, x19, zero
                  li x2, 0x8ffffffc
                  li x15, 0x6
                  slli x15, x15, 8
                  addi x15, x15, 0x0
                  sw x15, 0(x2)
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  li x2, 0x8ffffffc
                  li x15, 0x300
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x300
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x342
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x342
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x304
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x304
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x344
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x344
                  sw x15, 0(x2)
                  j mmode_intr_handler
                  1: la x27, test_done
                  jalr x0, x27, 0

mmode_intr_vector_26:
                  addi x25, x25, -4
                  sw  x19, (x25)
                  add x19, x25, zero
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
                  add x25, x19, zero
                  li x2, 0x8ffffffc
                  li x15, 0x6
                  slli x15, x15, 8
                  addi x15, x15, 0x0
                  sw x15, 0(x2)
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  li x2, 0x8ffffffc
                  li x15, 0x300
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x300
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x342
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x342
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x304
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x304
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x344
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x344
                  sw x15, 0(x2)
                  j mmode_intr_handler
                  1: la x27, test_done
                  jalr x0, x27, 0

mmode_intr_vector_27:
                  addi x25, x25, -4
                  sw  x19, (x25)
                  add x19, x25, zero
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
                  add x25, x19, zero
                  li x2, 0x8ffffffc
                  li x15, 0x6
                  slli x15, x15, 8
                  addi x15, x15, 0x0
                  sw x15, 0(x2)
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  li x2, 0x8ffffffc
                  li x15, 0x300
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x300
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x342
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x342
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x304
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x304
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x344
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x344
                  sw x15, 0(x2)
                  j mmode_intr_handler
                  1: la x27, test_done
                  jalr x0, x27, 0

mmode_intr_vector_28:
                  addi x25, x25, -4
                  sw  x19, (x25)
                  add x19, x25, zero
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
                  add x25, x19, zero
                  li x2, 0x8ffffffc
                  li x15, 0x6
                  slli x15, x15, 8
                  addi x15, x15, 0x0
                  sw x15, 0(x2)
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  li x2, 0x8ffffffc
                  li x15, 0x300
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x300
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x342
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x342
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x304
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x304
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x344
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x344
                  sw x15, 0(x2)
                  j mmode_intr_handler
                  1: la x27, test_done
                  jalr x0, x27, 0

mmode_intr_vector_29:
                  addi x25, x25, -4
                  sw  x19, (x25)
                  add x19, x25, zero
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
                  add x25, x19, zero
                  li x2, 0x8ffffffc
                  li x15, 0x6
                  slli x15, x15, 8
                  addi x15, x15, 0x0
                  sw x15, 0(x2)
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  li x2, 0x8ffffffc
                  li x15, 0x300
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x300
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x342
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x342
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x304
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x304
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x344
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x344
                  sw x15, 0(x2)
                  j mmode_intr_handler
                  1: la x27, test_done
                  jalr x0, x27, 0

mmode_intr_vector_30:
                  addi x25, x25, -4
                  sw  x19, (x25)
                  add x19, x25, zero
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
                  add x25, x19, zero
                  li x2, 0x8ffffffc
                  li x15, 0x6
                  slli x15, x15, 8
                  addi x15, x15, 0x0
                  sw x15, 0(x2)
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  li x2, 0x8ffffffc
                  li x15, 0x300
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x300
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x342
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x342
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x304
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x304
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x344
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x344
                  sw x15, 0(x2)
                  j mmode_intr_handler
                  1: la x27, test_done
                  jalr x0, x27, 0

mmode_intr_vector_31:
                  addi x25, x25, -4
                  sw  x19, (x25)
                  add x19, x25, zero
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
                  add x25, x19, zero
                  li x2, 0x8ffffffc
                  li x15, 0x6
                  slli x15, x15, 8
                  addi x15, x15, 0x0
                  sw x15, 0(x2)
                  csrr x15, 0x342 # MCAUSE
                  srli x15, x15, 0x1f
                  beqz x15, 1f
                  li x2, 0x8ffffffc
                  li x15, 0x300
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x300
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x342
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x342
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x304
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x304
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x344
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x344
                  sw x15, 0(x2)
                  j mmode_intr_handler
                  1: la x27, test_done
                  jalr x0, x27, 0

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
                  addi x25, x25, -4
                  sw  x19, (x25)
                  add x19, x25, zero
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
                  add x25, x19, zero
                  li x2, 0x8ffffffc
                  li x15, 0x8
                  slli x15, x15, 8
                  addi x15, x15, 0x0
                  sw x15, 0(x2)
                  csrr x15, 0x341 # MEPC
                  csrr x15, 0x342 # MCAUSE
                  li x2, 0x3 # BREAKPOINT
                  beq x15, x2, ebreak_handler
                  li x2, 0x8 # ECALL_UMODE
                  beq x15, x2, ecall_handler
                  li x2, 0x9 # ECALL_SMODE
                  beq x15, x2, ecall_handler
                  li x2, 0xb # ECALL_MMODE
                  beq x15, x2, ecall_handler
                  li x2, 0x1
                  beq x15, x2, instr_fault_handler
                  li x2, 0x5
                  beq x15, x2, load_fault_handler
                  li x2, 0x7
                  beq x15, x2, store_fault_handler
                  li x2, 0xc
                  beq x15, x2, pt_fault_handler
                  li x2, 0xd
                  beq x15, x2, pt_fault_handler
                  li x2, 0xf
                  beq x15, x2, pt_fault_handler
                  li x2, 0x2 # ILLEGAL_INSTRUCTION
                  beq x15, x2, illegal_instr_handler
                  csrr x2, 0x343 # MTVAL
                  1: la x27, test_done
                  jalr x1, x27, 0

ecall_handler:    
                  li x2, 0x8ffffffc
                  li x15, 0xb00
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0xb00
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0xb80
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0xb80
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0xb03
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0xb03
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0xb83
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0xb83
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0xb04
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0xb04
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0xb84
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0xb84
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0xb05
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0xb05
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0xb85
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0xb85
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0xb06
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0xb06
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0xb86
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0xb86
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0xb07
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0xb07
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0xb87
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0xb87
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0xb08
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0xb08
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0xb88
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0xb88
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0xb09
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0xb09
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0xb89
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0xb89
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0xb0a
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0xb0a
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0xb8a
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0xb8a
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0xb0b
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0xb0b
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0xb8b
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0xb8b
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0xb0c
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0xb0c
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0xb8c
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0xb8c
                  sw x15, 0(x2)
                  la x15, _start
                  sw x0, 0(x15)
                  sw x1, 4(x15)
                  sw x2, 8(x15)
                  sw x3, 12(x15)
                  sw x4, 16(x15)
                  sw x5, 20(x15)
                  sw x6, 24(x15)
                  sw x7, 28(x15)
                  sw x8, 32(x15)
                  sw x9, 36(x15)
                  sw x10, 40(x15)
                  sw x11, 44(x15)
                  sw x12, 48(x15)
                  sw x13, 52(x15)
                  sw x14, 56(x15)
                  sw x15, 60(x15)
                  sw x16, 64(x15)
                  sw x17, 68(x15)
                  sw x18, 72(x15)
                  sw x19, 76(x15)
                  sw x20, 80(x15)
                  sw x21, 84(x15)
                  sw x22, 88(x15)
                  sw x23, 92(x15)
                  sw x24, 96(x15)
                  sw x25, 100(x15)
                  sw x26, 104(x15)
                  sw x27, 108(x15)
                  sw x28, 112(x15)
                  sw x29, 116(x15)
                  sw x30, 120(x15)
                  sw x31, 124(x15)
                  csrr  x15, 0x341
                  addi  x15, x15, 4
                  csrw  0x341, x15
                  mret

instr_fault_handler:
                  li x2, 0x8ffffffc
                  li x15, 0x9
                  slli x15, x15, 8
                  addi x15, x15, 0x0
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x342
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x342
                  sw x15, 0(x2)
                  li x15, 0
                  mv x8, x15
                  li x30, 0
                  0: mv x15, x8
                  mv x27, x15
                  li x27, 0
                  beq x15, x27, 1f
                  li x27, 1
                  beq x15, x27, 2f
                  li x27, 2
                  beq x15, x27, 3f
                  li x27, 3
                  beq x15, x27, 4f
                  li x27, 4
                  beq x15, x27, 5f
                  li x27, 5
                  beq x15, x27, 6f
                  li x27, 6
                  beq x15, x27, 7f
                  li x27, 7
                  beq x15, x27, 8f
                  li x27, 8
                  beq x15, x27, 9f
                  li x27, 9
                  beq x15, x27, 10f
                  li x27, 10
                  beq x15, x27, 11f
                  li x27, 11
                  beq x15, x27, 12f
                  li x27, 12
                  beq x15, x27, 13f
                  li x27, 13
                  beq x15, x27, 14f
                  li x27, 14
                  beq x15, x27, 15f
                  li x27, 15
                  beq x15, x27, 16f
                  1: csrr x2, 0x3b0
                  csrr x6, 0x3a0
                  j 17f
                  2: csrr x2, 0x3b1
                  csrr x6, 0x3a0
                  j 17f
                  3: csrr x2, 0x3b2
                  csrr x6, 0x3a0
                  j 17f
                  4: csrr x2, 0x3b3
                  csrr x6, 0x3a0
                  j 17f
                  5: csrr x2, 0x3b4
                  csrr x6, 0x3a1
                  j 17f
                  6: csrr x2, 0x3b5
                  csrr x6, 0x3a1
                  j 17f
                  7: csrr x2, 0x3b6
                  csrr x6, 0x3a1
                  j 17f
                  8: csrr x2, 0x3b7
                  csrr x6, 0x3a1
                  j 17f
                  9: csrr x2, 0x3b8
                  csrr x6, 0x3a2
                  j 17f
                  10: csrr x2, 0x3b9
                  csrr x6, 0x3a2
                  j 17f
                  11: csrr x2, 0x3ba
                  csrr x6, 0x3a2
                  j 17f
                  12: csrr x2, 0x3bb
                  csrr x6, 0x3a2
                  j 17f
                  13: csrr x2, 0x3bc
                  csrr x6, 0x3a3
                  j 17f
                  14: csrr x2, 0x3bd
                  csrr x6, 0x3a3
                  j 17f
                  15: csrr x2, 0x3be
                  csrr x6, 0x3a3
                  j 17f
                  16: csrr x2, 0x3bf
                  csrr x6, 0x3a3
                  j 17f
                  17: li x13, 4
                  slli x15, x8, 30
                  srli x15, x15, 30
                  sub x27, x13, x15
                  addi x27, x27, -1
                  slli x27, x27, 3
                  sll x13, x6, x27
                  slli x15, x15, 3
                  add x27, x27, x15
                  srl x13, x13, x27
                  slli x27, x13, 27
                  srli x27, x27, 30
                  beqz x27, 20f
                  li x15, 1
                  beq x27, x15, 21f
                  li x15, 2
                  beq x27, x15, 24f
                  li x15, 3
                  beq x27, x15, 25f
                  la x15, test_done
                  jalr x0, x15, 0
                  18: mv x15, x8
                  mv x30, x2
                  addi x15, x15, 1
                  mv x8, x15
                  li x2, 16
                  ble x2, x15, 19f
                  j 0b
                  19: csrr x15, 0x747
                  andi x15, x15, 2
                  bnez x15, 27f
                  la x15, test_done
                  jalr x0, x15, 0
                  20: j 18b
                  21: mv x15, x8
                  csrr x27, 0x343
                  srli x27, x27, 2
                  bnez x15, 22f
                  bltz x27, 18b
                  j 23f
                  22: bgtu x30, x27, 18b
                  23: bleu x2, x27, 18b
                  j 26f
                  24: csrr x15, 0x343
                  srli x15, x15, 2
                  slli x27, x2, 2
                  srli x27, x27, 2
                  bne x15, x27, 18b
                  j 26f
                  25: csrr x15, 0x343
                  srli x15, x15, 2
                  srli x15, x15, 0
                  slli x15, x15, 0
                  slli x27, x2, 2
                  srli x27, x27, 2
                  srli x27, x27, 0
                  slli x27, x27, 0
                  bne x15, x27, 18b
                  j 26f
                  26: csrr x27, 0x747
                  andi x27, x27, 1
                  bnez x27, 27f
                  andi x27, x13, 128
                  bnez x27, 27f
                  j 29f
                  27: la x15, test_done
                  jalr x0, x15, 0
                  29: ori x13, x13, 4
                  li x27, 30
                  sll x15, x8, x27
                  srl x15, x15, x27
                  slli x27, x15, 3
                  sll x13, x13, x27
                  or x6, x6, x13
                  mv x15, x8
                  srli x15, x15, 2
                  beqz x15, 30f
                  li x27, 1
                  beq x15, x27, 31f
                  li x27, 2
                  beq x15, x27, 32f
                  li x27, 3
                  beq x15, x27, 33f
                  30: csrw 0x3a0, x6
                  j 34f
                  31: csrw 0x3a1, x6
                  j 34f
                  32: csrw 0x3a2, x6
                  j 34f
                  33: csrw 0x3a3, x6
                  34: nop
                  add x19, x25, zero
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
                  add x25, x19, zero
                  lw  x19, (x25)
                  addi x25, x25, 4
                  mret

load_fault_handler:
                  li x2, 0x8ffffffc
                  li x15, 0xb
                  slli x15, x15, 8
                  addi x15, x15, 0x0
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x342
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x342
                  sw x15, 0(x2)
                  li x15, 0
                  mv x8, x15
                  li x30, 0
                  0: mv x15, x8
                  mv x27, x15
                  li x27, 0
                  beq x15, x27, 1f
                  li x27, 1
                  beq x15, x27, 2f
                  li x27, 2
                  beq x15, x27, 3f
                  li x27, 3
                  beq x15, x27, 4f
                  li x27, 4
                  beq x15, x27, 5f
                  li x27, 5
                  beq x15, x27, 6f
                  li x27, 6
                  beq x15, x27, 7f
                  li x27, 7
                  beq x15, x27, 8f
                  li x27, 8
                  beq x15, x27, 9f
                  li x27, 9
                  beq x15, x27, 10f
                  li x27, 10
                  beq x15, x27, 11f
                  li x27, 11
                  beq x15, x27, 12f
                  li x27, 12
                  beq x15, x27, 13f
                  li x27, 13
                  beq x15, x27, 14f
                  li x27, 14
                  beq x15, x27, 15f
                  li x27, 15
                  beq x15, x27, 16f
                  1: csrr x2, 0x3b0
                  csrr x6, 0x3a0
                  j 17f
                  2: csrr x2, 0x3b1
                  csrr x6, 0x3a0
                  j 17f
                  3: csrr x2, 0x3b2
                  csrr x6, 0x3a0
                  j 17f
                  4: csrr x2, 0x3b3
                  csrr x6, 0x3a0
                  j 17f
                  5: csrr x2, 0x3b4
                  csrr x6, 0x3a1
                  j 17f
                  6: csrr x2, 0x3b5
                  csrr x6, 0x3a1
                  j 17f
                  7: csrr x2, 0x3b6
                  csrr x6, 0x3a1
                  j 17f
                  8: csrr x2, 0x3b7
                  csrr x6, 0x3a1
                  j 17f
                  9: csrr x2, 0x3b8
                  csrr x6, 0x3a2
                  j 17f
                  10: csrr x2, 0x3b9
                  csrr x6, 0x3a2
                  j 17f
                  11: csrr x2, 0x3ba
                  csrr x6, 0x3a2
                  j 17f
                  12: csrr x2, 0x3bb
                  csrr x6, 0x3a2
                  j 17f
                  13: csrr x2, 0x3bc
                  csrr x6, 0x3a3
                  j 17f
                  14: csrr x2, 0x3bd
                  csrr x6, 0x3a3
                  j 17f
                  15: csrr x2, 0x3be
                  csrr x6, 0x3a3
                  j 17f
                  16: csrr x2, 0x3bf
                  csrr x6, 0x3a3
                  j 17f
                  17: li x13, 4
                  slli x15, x8, 30
                  srli x15, x15, 30
                  sub x27, x13, x15
                  addi x27, x27, -1
                  slli x27, x27, 3
                  sll x13, x6, x27
                  slli x15, x15, 3
                  add x27, x27, x15
                  srl x13, x13, x27
                  slli x27, x13, 27
                  srli x27, x27, 30
                  beqz x27, 20f
                  li x15, 1
                  beq x27, x15, 21f
                  li x15, 2
                  beq x27, x15, 24f
                  li x15, 3
                  beq x27, x15, 25f
                  la x15, test_done
                  jalr x0, x15, 0
                  18: mv x15, x8
                  mv x30, x2
                  addi x15, x15, 1
                  mv x8, x15
                  li x2, 16
                  ble x2, x15, 19f
                  j 0b
                  19: csrr x15, 0x747
                  andi x15, x15, 2
                  bnez x15, 27f
                  la x15, test_done
                  jalr x0, x15, 0
                  20: j 18b
                  21: mv x15, x8
                  csrr x27, 0x343
                  srli x27, x27, 2
                  bnez x15, 22f
                  bltz x27, 18b
                  j 23f
                  22: bgtu x30, x27, 18b
                  23: bleu x2, x27, 18b
                  j 26f
                  24: csrr x15, 0x343
                  srli x15, x15, 2
                  slli x27, x2, 2
                  srli x27, x27, 2
                  bne x15, x27, 18b
                  j 26f
                  25: csrr x15, 0x343
                  srli x15, x15, 2
                  srli x15, x15, 0
                  slli x15, x15, 0
                  slli x27, x2, 2
                  srli x27, x27, 2
                  srli x27, x27, 0
                  slli x27, x27, 0
                  bne x15, x27, 18b
                  j 26f
                  26: csrr x27, 0x747
                  andi x27, x27, 1
                  bnez x27, 27f
                  andi x27, x13, 128
                  bnez x27, 27f
                  j 29f
                  27: csrr x15, 0x341
                  la x27, main
                  bge x15, x27, 40f
                  la x15, test_done
                  jalr x0, x15, 0
                  40: lw x15, 0(x15)
                  li x27, 3
                  and x15, x15, x27
                  beq x15, x27, 28f
                  csrr x15, 0x341
                  addi x15, x15, 2
                  csrw 0x341, x15
                  j 34f
                  28: csrr x15, 0x341
                  addi x15, x15, 4
                  csrw 0x341, x15
                  j 34f
                  29: ori x13, x13, 1
                  li x27, 30
                  sll x15, x8, x27
                  srl x15, x15, x27
                  slli x27, x15, 3
                  sll x13, x13, x27
                  or x6, x6, x13
                  mv x15, x8
                  srli x15, x15, 2
                  beqz x15, 30f
                  li x27, 1
                  beq x15, x27, 31f
                  li x27, 2
                  beq x15, x27, 32f
                  li x27, 3
                  beq x15, x27, 33f
                  30: csrw 0x3a0, x6
                  j 34f
                  31: csrw 0x3a1, x6
                  j 34f
                  32: csrw 0x3a2, x6
                  j 34f
                  33: csrw 0x3a3, x6
                  34: nop
                  add x19, x25, zero
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
                  add x25, x19, zero
                  lw  x19, (x25)
                  addi x25, x25, 4
                  mret

store_fault_handler:
                  li x2, 0x8ffffffc
                  li x15, 0xc
                  slli x15, x15, 8
                  addi x15, x15, 0x0
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x342
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x342
                  sw x15, 0(x2)
                  li x15, 0
                  mv x8, x15
                  li x30, 0
                  0: mv x15, x8
                  mv x27, x15
                  li x27, 0
                  beq x15, x27, 1f
                  li x27, 1
                  beq x15, x27, 2f
                  li x27, 2
                  beq x15, x27, 3f
                  li x27, 3
                  beq x15, x27, 4f
                  li x27, 4
                  beq x15, x27, 5f
                  li x27, 5
                  beq x15, x27, 6f
                  li x27, 6
                  beq x15, x27, 7f
                  li x27, 7
                  beq x15, x27, 8f
                  li x27, 8
                  beq x15, x27, 9f
                  li x27, 9
                  beq x15, x27, 10f
                  li x27, 10
                  beq x15, x27, 11f
                  li x27, 11
                  beq x15, x27, 12f
                  li x27, 12
                  beq x15, x27, 13f
                  li x27, 13
                  beq x15, x27, 14f
                  li x27, 14
                  beq x15, x27, 15f
                  li x27, 15
                  beq x15, x27, 16f
                  1: csrr x2, 0x3b0
                  csrr x6, 0x3a0
                  j 17f
                  2: csrr x2, 0x3b1
                  csrr x6, 0x3a0
                  j 17f
                  3: csrr x2, 0x3b2
                  csrr x6, 0x3a0
                  j 17f
                  4: csrr x2, 0x3b3
                  csrr x6, 0x3a0
                  j 17f
                  5: csrr x2, 0x3b4
                  csrr x6, 0x3a1
                  j 17f
                  6: csrr x2, 0x3b5
                  csrr x6, 0x3a1
                  j 17f
                  7: csrr x2, 0x3b6
                  csrr x6, 0x3a1
                  j 17f
                  8: csrr x2, 0x3b7
                  csrr x6, 0x3a1
                  j 17f
                  9: csrr x2, 0x3b8
                  csrr x6, 0x3a2
                  j 17f
                  10: csrr x2, 0x3b9
                  csrr x6, 0x3a2
                  j 17f
                  11: csrr x2, 0x3ba
                  csrr x6, 0x3a2
                  j 17f
                  12: csrr x2, 0x3bb
                  csrr x6, 0x3a2
                  j 17f
                  13: csrr x2, 0x3bc
                  csrr x6, 0x3a3
                  j 17f
                  14: csrr x2, 0x3bd
                  csrr x6, 0x3a3
                  j 17f
                  15: csrr x2, 0x3be
                  csrr x6, 0x3a3
                  j 17f
                  16: csrr x2, 0x3bf
                  csrr x6, 0x3a3
                  j 17f
                  17: li x13, 4
                  slli x15, x8, 30
                  srli x15, x15, 30
                  sub x27, x13, x15
                  addi x27, x27, -1
                  slli x27, x27, 3
                  sll x13, x6, x27
                  slli x15, x15, 3
                  add x27, x27, x15
                  srl x13, x13, x27
                  slli x27, x13, 27
                  srli x27, x27, 30
                  beqz x27, 20f
                  li x15, 1
                  beq x27, x15, 21f
                  li x15, 2
                  beq x27, x15, 24f
                  li x15, 3
                  beq x27, x15, 25f
                  la x15, test_done
                  jalr x0, x15, 0
                  18: mv x15, x8
                  mv x30, x2
                  addi x15, x15, 1
                  mv x8, x15
                  li x2, 16
                  ble x2, x15, 19f
                  j 0b
                  19: csrr x15, 0x747
                  andi x15, x15, 2
                  bnez x15, 27f
                  la x15, test_done
                  jalr x0, x15, 0
                  20: j 18b
                  21: mv x15, x8
                  csrr x27, 0x343
                  srli x27, x27, 2
                  bnez x15, 22f
                  bltz x27, 18b
                  j 23f
                  22: bgtu x30, x27, 18b
                  23: bleu x2, x27, 18b
                  j 26f
                  24: csrr x15, 0x343
                  srli x15, x15, 2
                  slli x27, x2, 2
                  srli x27, x27, 2
                  bne x15, x27, 18b
                  j 26f
                  25: csrr x15, 0x343
                  srli x15, x15, 2
                  srli x15, x15, 0
                  slli x15, x15, 0
                  slli x27, x2, 2
                  srli x27, x27, 2
                  srli x27, x27, 0
                  slli x27, x27, 0
                  bne x15, x27, 18b
                  j 26f
                  26: csrr x27, 0x747
                  andi x27, x27, 1
                  bnez x27, 27f
                  andi x27, x13, 128
                  bnez x27, 27f
                  j 29f
                  27: csrr x15, 0x341
                  lw x15, 0(x15)
                  li x27, 3
                  and x15, x15, x27
                  beq x15, x27, 28f
                  csrr x15, 0x341
                  addi x15, x15, 2
                  csrw 0x341, x15
                  j 34f
                  28: csrr x15, 0x341
                  addi x15, x15, 4
                  csrw 0x341, x15
                  j 34f
                  29: ori x13, x13, 3
                  li x27, 30
                  sll x15, x8, x27
                  srl x15, x15, x27
                  slli x27, x15, 3
                  sll x13, x13, x27
                  or x6, x6, x13
                  mv x15, x8
                  srli x15, x15, 2
                  beqz x15, 30f
                  li x27, 1
                  beq x15, x27, 31f
                  li x27, 2
                  beq x15, x27, 32f
                  li x27, 3
                  beq x15, x27, 33f
                  30: csrw 0x3a0, x6
                  j 34f
                  31: csrw 0x3a1, x6
                  j 34f
                  32: csrw 0x3a2, x6
                  j 34f
                  33: csrw 0x3a3, x6
                  34: nop
                  add x19, x25, zero
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
                  add x25, x19, zero
                  lw  x19, (x25)
                  addi x25, x25, 4
                  mret

.align 2
main:             c.xor        a4, a1
                  c.add        a7, a7
                  sltiu        a7, ra, 210
                  c.slli       s10, 11
                  xori         gp, s5, -821
                  csrrc        s2, 0x340, s11
                  add          t2, t4, a4
                  c.addi16sp   sp, -16
                  c.nop
                  c.lui        s7, 2
                  rem          zero, t2, sp
                  c.and        a4, a0
                  csrrs        gp, 0x340, zero
                  c.sub        a2, a5
                  c.mv         a5, s6
                  addi         s5, t2, 425
                  addi         s4, t6, -368
                  slt          a1, s6, ra
                  xor          tp, a6, s4
                  csrrsi       zero, 0x340, 0
                  sub          a0, s3, t6
                  srli         t6, ra, 8
                  c.mv         a1, t1
                  csrrw        t0, 0x340, s11
                  c.addi       t2, 2
                  c.andi       a4, -1
                  c.xor        a0, a5
                  csrrw        s2, 0x340, t6
                  csrrwi       a7, 0x340, 3
                  csrrwi       a0, 0x340, 29
                  srl          t2, a2, s3
                  xori         ra, s2, -1883
                  c.mv         a1, s8
                  nop
                  andi         t2, a2, -1866
                  c.addi16sp   sp, -16
                  divu         a5, s8, zero
                  slti         s5, a7, 1121
                  srli         s10, zero, 13
                  mulh         a4, s0, s6
                  mulh         tp, t4, s4
                  sltu         t1, sp, s5
                  mulhu        a2, t1, a2
                  srai         ra, ra, 28
                  c.addi16sp   sp, -16
                  mulhsu       s0, a3, a1
                  slt          a5, sp, a5
                  mulh         s4, s0, t3
                  slli         s4, s0, 2
                  srli         s10, gp, 7
                  mulhu        t6, t0, s7
                  slt          a7, t0, a3
                  xori         a0, s5, 1056
                  slt          t1, t1, s2
                  c.addi16sp   sp, 480
                  c.sub        a3, a2
                  addi         s8, s1, 810
                  rem          t0, t4, t3
                  xori         gp, s8, 1086
                  sll          s4, s3, s5
                  c.and        a5, a3
                  csrrs        s10, 0x340, zero
                  andi         a6, a6, -226
                  mul          a1, a4, a5
                  c.addi4spn   a2, sp, 48
                  c.sub        a3, a0
                  ori          ra, s4, -1462
                  srai         s7, t2, 6
                  c.addi16sp   sp, -16
                  c.nop
                  c.mv         a2, s9
                  sra          t3, s5, a4
                  srl          t1, a5, t2
                  add          t3, sp, s9
                  csrrs        tp, 0x340, zero
                  c.addi16sp   sp, 288
                  c.add        a7, gp
                  mulh         s10, s1, s7
                  sltiu        s8, t2, -721
                  and          tp, t3, a5
                  c.lui        a1, 9
                  mulhu        s0, t5, s10
                  srli         s6, s11, 7
                  mulhsu       s0, a1, a3
                  addi         s10, s2, 749
                  auipc        tp, 136758
                  csrrwi       t4, 0x340, 6
                  c.lui        a3, 4
                  csrrw        t5, 0x340, s9
                  c.addi16sp   sp, 288
                  srai         zero, s3, 31
                  mulh         a2, s1, zero
                  slt          zero, zero, a5
                  csrrwi       s6, 0x340, 18
                  srai         t2, s10, 9
                  mulhu        a0, s1, s7
                  sub          s10, a7, s7
                  c.mv         t0, a5
                  c.addi16sp   sp, 144
                  c.addi16sp   sp, 480
                  csrrc        s0, 0x340, s7
                  csrrc        t1, 0x340, sp
                  csrrci       zero, 0x340, 22
                  nop
                  c.srli       s0, 31
                  csrrci       s10, 0x340, 0
                  sltu         t2, t6, s11
                  add          gp, s4, s2
                  mulh         s8, s10, zero
                  c.li         a6, -1
                  sll          s0, s11, s7
                  add          s7, t4, sp
                  c.addi       s4, -1
                  sra          s0, sp, a2
                  c.addi4spn   s1, sp, 64
                  and          sp, sp, sp
                  c.sub        a2, a4
                  c.add        s6, t1
                  sll          t0, t1, gp
                  srai         t1, t0, 24
                  c.srli       s0, 17
                  c.srli       a1, 4
                  add          s0, s10, s6
                  slti         t5, s4, -1100
                  csrrs        t3, 0x340, zero
                  csrrw        a2, 0x340, s1
                  c.nop
                  c.sub        a5, a2
                  sub          a3, a4, s4
                  auipc        a4, 131205
                  c.addi4spn   a3, sp, 800
                  lui          a4, 883881
                  mulhsu       a2, sp, t2
                  c.addi4spn   s0, sp, 144
                  sll          s8, a6, t3
                  or           t2, tp, s1
                  c.mv         a3, t3
                  csrrw        s6, 0x340, s5
                  c.xor        s0, a3
                  srl          gp, a0, s4
                  csrrwi       ra, 0x340, 13
                  c.sub        s1, a5
                  sltiu        sp, a4, 918
                  andi         t6, gp, 1488
                  srl          t2, s0, s10
                  andi         ra, s1, 386
                  mulh         t5, a4, s5
                  sll          sp, s5, t4
                  c.addi       t5, -1
                  csrrw        a0, 0x340, sp
                  c.srli       a3, 11
                  c.addi4spn   a1, sp, 16
                  sltiu        a7, s11, 1784
                  csrrwi       s1, 0x340, 19
                  xor          a5, a6, t6
                  sltiu        a6, a3, 1263
                  ori          t6, tp, -602
                  c.lui        gp, 20
                  and          ra, s8, a6
                  srai         t1, a2, 8
                  slt          a0, tp, t4
                  mulhsu       a7, s0, s2
                  c.addi4spn   a1, sp, 864
                  mulh         a1, ra, s11
                  c.andi       a3, -1
                  c.sub        a1, a1
                  c.srli       s1, 29
                  c.or         a2, s1
                  c.andi       a5, 21
                  csrrsi       sp, 0x340, 13
                  and          t1, s3, s7
                  srl          tp, a2, ra
                  csrrci       s0, 0x340, 0
                  c.add        sp, a3
                  csrrsi       s8, 0x340, 0
                  c.slli       s6, 25
                  csrrs        s4, 0x340, a4
                  c.or         a3, a2
                  c.sub        a0, a3
                  slli         s8, t4, 2
                  sub          gp, s5, s9
                  csrrwi       a5, 0x340, 8
                  c.srli       a5, 15
                  sra          s6, s5, s2
                  or           a6, a0, t1
                  c.and        a3, a5
                  ori          s4, zero, 1874
                  c.sub        a2, a1
                  c.or         a3, a4
                  c.lui        s10, 31
                  csrrw        ra, 0x340, a7
                  add          s1, s10, a2
                  c.li         tp, -1
                  c.srli       a1, 15
                  sltiu        s7, t5, 1917
                  c.nop
                  c.mv         s1, a4
                  andi         tp, a0, -543
                  c.li         s7, 4
                  add          a2, a4, gp
                  c.srli       a4, 22
                  sub          s2, gp, s6
                  c.mv         s5, s1
                  c.srai       s1, 22
                  auipc        s5, 520268
                  sra          a4, s11, t6
                  csrrsi       a4, 0x340, 0
                  csrrsi       s6, 0x340, 5
                  c.sub        a4, a1
                  ori          s5, t2, 1548
                  c.andi       a3, 18
                  srai         t1, t1, 21
                  nop
                  mulhu        s6, s9, a7
                  mul          a1, t5, tp
                  or           a2, a5, t3
                  csrrwi       s8, 0x340, 10
                  sltu         sp, s5, a4
                  sltu         t6, s5, sp
                  addi         tp, s11, 204
                  csrrwi       gp, 0x340, 19
                  slti         gp, s6, 381
                  c.andi       a4, -1
                  remu         ra, ra, a4
                  slti         s7, gp, 1597
                  csrrsi       tp, 0x340, 26
                  c.srai       a2, 4
                  remu         a3, s10, a7
                  add          t0, s5, a1
                  csrrs        s5, 0x340, zero
                  remu         s7, s9, t4
                  c.sub        a2, a4
                  mulh         sp, a2, a2
                  c.addi       tp, -1
                  mul          s6, s6, t5
                  or           a2, s3, a3
                  srl          a3, zero, zero
                  sltu         s10, a6, a2
                  slti         s1, s2, -247
                  c.xor        a0, s1
                  div          s2, s8, s4
                  auipc        s4, 546505
                  rem          s8, a4, zero
                  remu         t4, a2, s7
                  c.srai       a2, 25
                  c.add        t2, t4
                  ori          tp, a1, 209
                  c.sub        s0, s0
                  c.addi16sp   sp, -16
                  mulhsu       a0, tp, s5
                  lui          gp, 325422
                  c.addi16sp   sp, 448
                  c.add        s5, s5
                  srli         zero, s7, 0
                  c.slli       a6, 27
                  sra          a7, s5, t1
                  add          t4, t5, t3
                  c.xor        a5, a3
                  srli         a1, t3, 8
                  nop
                  c.addi16sp   sp, 192
                  sltiu        t3, s9, 1662
                  srl          a3, a4, s3
                  c.andi       a2, 21
                  c.addi       s4, -1
                  csrrwi       a6, 0x340, 9
                  slli         t1, t4, 28
                  sltiu        s1, ra, -718
                  csrrc        s10, 0x340, s11
                  xor          s5, s10, a3
                  c.addi       a0, -1
                  xori         t2, s3, 11
                  mulh         s5, s11, s0
                  slt          t3, t1, s4
                  or           t3, s3, s11
                  csrrci       a0, 0x340, 0
                  mulhsu       a4, a7, a5
                  or           t5, s8, s3
                  c.srai       a2, 2
                  slli         s0, a0, 10
                  div          s7, s2, a0
                  sltu         s6, s6, t3
                  csrrc        sp, 0x340, t0
                  csrrs        s0, 0x340, zero
                  auipc        a0, 114969
                  c.mv         a0, s2
                  mulh         s6, gp, s3
                  c.addi4spn   a2, sp, 880
                  c.srai       s1, 26
                  c.slli       t5, 6
                  and          s1, s1, s4
                  c.or         a1, a3
                  slt          s4, t1, s7
                  div          s8, t5, s11
                  slli         s5, s4, 15
                  lui          s4, 29775
                  c.mv         a5, s7
                  mul          s1, s10, s7
                  srl          t6, a0, s2
                  csrrw        s5, 0x340, a7
                  ori          s5, s2, 562
                  c.sub        a1, a1
                  c.srli       a2, 21
                  c.addi4spn   a2, sp, 16
                  c.mv         sp, s9
                  sltu         s8, t2, gp
                  lui          t4, 493717
                  remu         t4, t6, s6
                  srai         t5, s1, 22
                  xor          t4, t1, s6
                  c.li         s4, -1
                  mul          s2, a6, s3
                  c.li         t5, 1
                  and          s4, gp, a1
                  slti         gp, s10, 865
                  srli         t0, zero, 7
                  auipc        s4, 655815
                  nop
                  c.add        s0, a0
                  nop
                  div          s0, t4, t0
                  srli         a0, t0, 4
                  mulh         t3, t5, t4
                  c.addi16sp   sp, 64
                  auipc        tp, 190717
                  divu         t1, s2, s8
                  div          a5, tp, a6
                  sltiu        s6, s1, 471
                  csrrsi       a6, 0x340, 0
                  sub          t6, t5, s4
                  sra          a1, t3, s3
                  slti         s6, s7, -1405
                  sll          s1, s11, ra
                  auipc        t0, 230148
                  xor          a6, s5, t0
                  c.addi       s0, -1
                  c.li         s5, -1
                  addi         a3, t2, -1311
                  mul          t0, gp, tp
                  mul          t4, a7, zero
                  csrrw        a2, 0x340, s6
                  c.addi16sp   sp, -16
                  and          s6, s3, s0
                  csrrsi       t1, 0x340, 0
                  csrrc        tp, 0x340, zero
                  c.lui        t3, 29
                  ori          t4, s4, -360
                  srai         s0, s0, 14
                  c.sub        s1, a5
                  xori         s10, s2, -541
                  mulhu        a2, a7, t5
                  c.add        s1, t5
                  and          gp, ra, s10
                  c.or         a0, a4
                  mulhu        a0, a0, tp
                  c.lui        t0, 2
                  csrrc        sp, 0x340, t0
                  c.mv         a1, s5
                  ori          s2, s4, 806
                  slti         a0, s6, -394
                  c.addi16sp   sp, -16
                  csrrwi       t6, 0x340, 0
                  mulhu        s5, a3, t2
                  addi         ra, s8, 1977
                  addi         a7, ra, 644
                  c.and        a0, a2
                  xori         t5, a2, 1986
                  c.add        t6, a1
                  c.xor        s0, s0
                  sub          t6, a4, s4
                  c.slli       a2, 24
                  c.xor        s0, s0
                  sub          t0, t2, t3
                  remu         tp, sp, s7
                  div          s4, s3, s7
                  c.srli       a0, 5
                  srli         t5, ra, 10
                  sll          a3, s9, s3
                  c.and        a5, a2
                  xori         a7, a7, 1655
                  nop
                  c.lui        a0, 2
                  mulhsu       s6, a1, t4
                  c.srai       a2, 9
                  slli         a2, s8, 13
                  nop
                  c.or         a1, a5
                  sll          t1, s3, a4
                  ori          a3, zero, -347
                  c.lui        a2, 8
                  c.addi16sp   sp, 112
                  mulh         t0, s3, t4
                  mulh         a5, a7, zero
                  c.andi       a4, -1
                  csrrs        t4, 0x340, s11
                  slli         t6, t2, 26
                  c.srli       a5, 8
                  sltiu        a2, sp, -1553
                  mulhsu       s8, a6, s4
                  mulh         s4, t4, s3
                  auipc        t2, 302146
                  c.andi       a4, -1
                  nop
                  lui          t3, 610546
                  c.nop
                  c.add        s0, s3
                  c.srai       a5, 4
                  sltiu        a4, a3, 540
                  c.li         gp, 24
                  c.addi4spn   s0, sp, 688
                  slti         a1, s10, 1884
                  sra          t2, s1, t0
                  srai         tp, a6, 10
                  srli         a1, s0, 29
                  c.nop
                  csrrsi       a6, 0x340, 0
                  mulhu        s7, a7, a3
                  auipc        gp, 753406
                  div          t5, s0, s8
                  remu         zero, a0, a4
                  slli         s5, s3, 15
                  rem          t6, s3, t0
                  remu         s5, t1, s5
                  xor          s6, tp, s11
                  csrrs        t2, 0x340, a5
                  csrrc        a5, 0x340, a6
                  c.lui        ra, 11
                  csrrsi       a4, 0x340, 30
                  sra          s7, zero, t5
                  sra          a2, s9, s8
                  mulhu        s2, t3, a1
                  mulhsu       t6, s8, zero
                  add          sp, t4, t1
                  lui          a4, 963007
                  c.slli       t1, 4
                  divu         t6, a7, t3
                  csrrwi       t2, 0x340, 3
                  lui          zero, 805864
                  c.addi4spn   a5, sp, 192
                  c.nop
                  csrrw        sp, 0x340, a5
                  addi         t0, s5, 1759
                  mul          t4, ra, s0
                  c.andi       a3, -1
                  csrrs        a6, 0x340, t3
                  c.add        sp, t3
                  srli         t1, a1, 29
                  xori         t4, s7, 1482
                  rem          a4, s11, gp
                  c.add        s1, s7
                  srl          s2, s6, s8
                  mulhsu       s0, s11, a0
                  c.and        a1, a2
                  lui          s0, 840312
                  andi         s7, s6, 342
                  sra          gp, s8, a0
                  csrrci       a0, 0x340, 7
                  sll          a2, t6, a5
                  and          t2, t2, s7
                  srai         s4, s4, 4
                  and          a5, zero, a4
                  c.lui        a7, 13
                  c.or         s1, a2
                  c.and        s1, a5
                  c.slli       t6, 25
                  c.srai       a4, 24
                  csrrci       a0, 0x340, 24
                  xor          zero, t4, sp
                  csrrw        a1, 0x340, t3
                  mulhu        zero, s1, t4
                  and          t5, t2, s2
                  slt          s0, s6, zero
                  srl          a6, s5, a0
                  csrrsi       t5, 0x340, 0
                  c.or         a1, a4
                  nop
                  csrrci       t2, 0x340, 0
                  mulh         zero, tp, tp
                  div          s8, s11, gp
                  mulhu        s5, t4, s9
                  csrrs        t5, 0x340, zero
                  csrrci       gp, 0x340, 15
                  auipc        t5, 102815
                  sltiu        s6, ra, -334
                  csrrc        a4, 0x340, zero
                  rem          s8, s11, s11
                  c.sub        a1, a4
                  or           t1, zero, s11
                  addi         a1, a2, 161
                  slli         t3, t3, 1
                  csrrwi       a0, 0x340, 23
                  csrrw        a4, 0x340, t3
                  c.or         a3, a1
                  slt          s5, s3, s0
                  sub          t6, t4, sp
                  remu         s2, t2, ra
                  mul          sp, tp, t2
                  mul          sp, s8, t2
                  divu         ra, s6, t3
                  slti         s5, s0, 934
                  c.nop
                  sltu         a4, tp, s0
                  c.and        a1, a3
                  csrrwi       t4, 0x340, 6
                  c.xor        a0, a2
                  csrrw        t4, 0x340, t4
                  srli         t4, t1, 17
                  c.andi       a0, 0
                  csrrc        a7, 0x340, s1
                  c.slli       s0, 27
                  csrrc        a1, 0x340, gp
                  sltu         s2, t6, ra
                  c.mv         a1, s8
                  c.srli       s1, 1
                  div          t4, s0, t0
                  mulh         ra, a6, s0
                  xor          a7, t2, s9
                  ori          a0, s11, 1814
                  csrrc        t6, 0x340, zero
                  xor          a6, s1, t1
                  mul          a1, s10, t2
                  div          a0, a1, a1
                  csrrsi       a7, 0x340, 6
                  xor          a3, t3, t6
                  c.srai       s0, 8
                  srl          s0, s1, t0
                  slli         s10, s8, 27
                  lui          s1, 165707
                  c.xor        s1, a2
                  srli         a4, s4, 31
                  auipc        zero, 477255
                  csrrw        a2, 0x340, sp
                  c.lui        s4, 25
                  sltiu        sp, s3, -924
                  csrrw        t2, 0x340, a5
                  srli         s1, a1, 28
                  xori         a5, a0, 423
                  csrrwi       s10, 0x340, 28
                  sltiu        s6, t6, -1902
                  remu         a2, tp, t5
                  c.nop
                  csrrw        s2, 0x340, sp
                  auipc        t6, 193823
                  srl          s5, a3, s6
                  c.lui        s8, 11
                  sub          s5, a2, a3
                  c.xor        a3, a1
                  csrrwi       t2, 0x340, 25
                  srl          zero, a7, s8
                  csrrs        gp, 0x340, s8
                  remu         s4, sp, a5
                  div          t5, ra, a4
                  nop
                  c.li         a4, 9
                  slli         tp, s5, 23
                  or           gp, t3, t1
                  srl          s2, s1, a0
                  c.and        s0, a2
                  srai         s5, a6, 27
                  mul          s8, a0, t3
                  div          a4, s9, t2
                  add          a2, t6, s1
                  c.addi       s0, -1
                  slli         t6, s3, 2
                  lui          s4, 149550
                  mulhu        a0, s4, t3
                  divu         a6, s0, a6
                  c.nop
                  remu         a0, a1, t2
                  c.addi       a0, 12
                  csrrc        a0, 0x340, a3
                  c.add        s5, a5
                  c.addi4spn   a1, sp, 832
                  c.nop
                  mulhsu       t5, a5, t0
                  divu         a5, a6, t5
                  c.add        t2, ra
                  sra          a4, t2, s9
                  auipc        s8, 310739
                  divu         a2, s0, t6
                  c.and        a2, a2
                  csrrci       a5, 0x340, 27
                  c.nop
                  c.or         a4, s1
                  c.li         s4, -1
                  c.add        s10, a4
                  csrrs        a7, 0x340, t2
                  csrrc        a3, 0x340, s3
                  and          s0, s1, a2
                  c.sub        a5, a1
                  c.and        s1, a4
                  c.li         ra, -1
                  divu         t6, s4, t1
                  xor          a1, t1, s8
                  sra          s10, tp, t1
                  nop
                  sub          s5, a2, s0
                  csrrsi       s0, 0x340, 0
                  rem          sp, gp, a7
                  slti         t1, t4, 186
                  xori         a0, t0, -297
                  and          a5, s9, t5
                  csrrw        ra, 0x340, a7
                  addi         t5, s10, 1462
                  srl          t4, a3, gp
                  c.nop
                  sll          ra, s0, s1
                  or           t6, zero, a4
                  c.addi16sp   sp, -16
                  andi         a7, a2, -792
                  c.addi4spn   a5, sp, 320
                  csrrci       a4, 0x340, 0
                  sra          a3, t3, a4
                  csrrwi       a4, 0x340, 1
                  slli         s4, t4, 25
                  slli         s10, s8, 21
                  divu         t6, a5, s5
                  ori          s5, a1, 312
                  srl          gp, t3, t6
                  or           s10, s1, gp
                  slli         s5, s1, 22
                  mul          a3, s8, s6
                  nop
                  c.and        a2, a2
                  rem          t5, s4, a5
                  add          a7, a7, t1
                  sra          s8, t0, s2
                  srai         s4, t1, 11
                  c.nop
                  c.srli       a5, 15
                  c.andi       a1, 27
                  mulhsu       zero, t5, sp
                  sltiu        t1, s5, -1314
                  c.add        t5, s9
                  nop
                  c.addi16sp   sp, 320
                  c.or         a5, a5
                  c.or         s1, s0
                  c.sub        s1, a5
                  c.srai       s1, 27
                  sltu         s7, s11, s1
                  andi         gp, s7, 1382
                  remu         a3, s0, t3
                  c.or         a2, a2
                  xori         s10, a5, -923
                  srli         s1, t3, 19
                  or           a5, s1, a5
                  c.andi       s0, 10
                  remu         s7, t3, t5
                  csrrw        a6, 0x340, ra
                  slti         a3, s9, -1127
                  auipc        s2, 762811
                  or           s7, a2, a5
                  sub          zero, s8, ra
                  or           s10, s11, s4
                  srai         a4, t6, 26
                  lui          t0, 372388
                  rem          s7, s5, t4
                  c.nop
                  slti         zero, a6, 1115
                  addi         t3, s8, 724
                  sltu         t0, a2, s3
                  mulhu        s4, a2, a7
                  csrrci       a4, 0x340, 22
                  ori          a5, a1, 1868
                  c.or         a1, a5
                  csrrci       s7, 0x340, 0
                  c.addi       a2, 28
                  addi         a1, t2, -932
                  lui          t1, 197834
                  c.xor        a4, a3
                  sltu         s1, t6, a3
                  c.lui        s5, 16
                  mulhsu       s1, t0, t2
                  divu         a4, s5, sp
                  csrrci       zero, 0x340, 7
                  xor          a3, s10, a2
                  csrrwi       s7, 0x340, 28
                  csrrc        t0, 0x340, t3
                  c.andi       s0, -1
                  sltu         a3, s10, t0
                  srli         t6, t0, 27
                  slli         s8, s3, 11
                  c.andi       a4, 17
                  c.add        s1, t0
                  c.addi4spn   a4, sp, 752
                  ori          a4, a1, -91
                  c.lui        tp, 6
                  sltiu        gp, zero, 1251
                  sll          t4, t1, s1
                  mulhsu       s1, s10, a4
                  mulhu        t0, s9, a5
                  sub          a2, s4, a0
                  div          gp, s11, t2
                  c.li         s7, -1
                  c.lui        t2, 23
                  c.sub        a0, s1
                  csrrwi       t5, 0x340, 19
                  rem          tp, a3, s1
                  c.sub        a2, a2
                  mulh         t0, t1, a3
                  c.srai       a2, 16
                  xori         s7, s6, -1224
                  c.srli       a0, 24
                  c.xor        s0, s1
                  slt          sp, tp, a1
                  or           s5, t5, s6
                  xori         sp, s0, 675
                  sltu         t5, t4, t1
                  mulhu        a3, s2, a4
                  sub          s6, s6, a4
                  c.mv         s10, a0
                  andi         t2, t6, 1098
                  xor          s1, sp, zero
                  csrrwi       t6, 0x340, 19
                  csrrs        s8, 0x340, sp
                  sub          tp, s0, tp
                  srai         zero, a2, 15
                  c.nop
                  c.andi       s0, 12
                  csrrci       ra, 0x340, 27
                  srli         a5, t1, 22
                  and          t1, a1, t5
                  mulhu        s7, t5, a4
                  andi         a3, s9, 572
                  mul          s8, s8, s1
                  srai         ra, a7, 6
                  c.addi       t4, -1
                  ori          s4, t3, -1559
                  csrrs        a6, 0x340, a1
                  csrrw        t6, 0x340, s7
                  csrrc        t6, 0x340, s6
                  srli         s2, t0, 30
                  andi         s10, a1, -1683
                  c.sub        a1, a4
                  mulhu        s1, s3, a3
                  xor          s0, ra, s9
                  divu         t4, gp, s4
                  c.and        a2, a3
                  csrrw        s5, 0x340, s6
                  sub          ra, t6, a6
                  c.lui        t1, 19
                  srl          t0, a6, s6
                  rem          s0, t1, ra
                  c.srli       s0, 7
                  c.li         a4, 29
                  sltu         t2, t3, s4
                  c.addi4spn   a2, sp, 976
                  c.nop
                  c.nop
                  c.srli       a3, 10
                  csrrwi       t6, 0x340, 24
                  c.add        tp, t5
                  c.or         a0, a5
                  c.srai       a2, 27
                  sltiu        s7, a1, -1313
                  srl          ra, s0, a3
                  c.mv         t2, s11
                  c.srai       a0, 30
                  c.xor        s0, a1
                  or           t5, a4, s4
                  csrrwi       a0, 0x340, 23
                  and          a1, s5, t1
                  csrrsi       a3, 0x340, 20
                  auipc        s8, 281361
                  c.li         s10, 17
                  remu         s1, ra, a7
                  div          s7, a2, zero
                  mul          gp, s1, t6
                  and          s1, s8, a5
                  c.sub        a4, s1
                  slti         s10, s9, -521
                  c.srai       a2, 18
                  csrrci       t2, 0x340, 0
                  sll          sp, tp, t3
                  c.srai       s1, 27
                  srai         t5, a7, 29
                  auipc        a4, 871227
                  srl          a3, tp, gp
                  sub          a7, a2, s11
                  remu         s5, t4, s3
                  srai         a2, s4, 25
                  add          s2, a5, s9
                  csrrc        t1, 0x340, zero
                  srl          a6, s5, s11
                  c.srli       a5, 30
                  nop
                  c.and        a5, s0
                  mulhu        t3, t0, t5
                  srli         a4, s3, 23
                  mulhu        a5, zero, ra
                  slli         tp, s10, 25
                  c.nop
                  c.srai       a3, 17
                  c.andi       s0, 2
                  c.xor        a0, a1
                  c.and        s0, s1
                  c.addi16sp   sp, 304
                  lui          sp, 305717
                  c.srli       s0, 15
                  and          zero, a3, s5
                  slt          a1, gp, s1
                  remu         t3, t6, s1
                  c.or         a5, a5
                  add          t0, t3, a7
                  csrrw        s1, 0x340, s8
                  c.or         a5, a0
                  c.srai       s1, 10
                  slli         s10, s11, 12
                  csrrc        t6, 0x340, a2
                  c.lui        ra, 2
                  mulhsu       a4, a4, t6
                  c.li         sp, 4
                  rem          s5, s8, s0
                  sra          zero, t6, a4
                  xor          s2, a5, s4
                  slt          t4, s7, gp
                  xor          a2, t0, a2
                  xori         s1, s4, 309
                  nop
                  divu         ra, a5, s0
                  and          s6, sp, s6
                  c.srai       a3, 8
                  c.srai       a3, 30
                  c.lui        a7, 5
                  sll          s10, s0, s2
                  sra          t6, a6, t1
                  xor          t4, s6, s11
                  c.andi       s1, -1
                  andi         a0, s7, -1799
                  mulhsu       s7, a6, sp
                  c.sub        a4, s1
                  srli         s5, tp, 13
                  c.and        s1, a2
                  slt          gp, t3, s5
                  andi         sp, s9, 1514
                  c.addi4spn   a5, sp, 576
                  and          s6, ra, sp
                  c.srli       a1, 14
                  sra          s1, a5, s9
                  div          a1, s11, t0
                  c.mv         sp, a5
                  lui          s10, 577407
                  csrrs        t0, 0x340, a6
                  c.slli       s8, 18
                  c.lui        t6, 22
                  mulh         a5, t3, t1
                  rem          s2, t0, a3
                  c.srai       s1, 22
                  slli         s2, s2, 9
                  csrrci       a0, 0x340, 0
                  csrrc        t0, 0x340, zero
                  sltiu        t4, s7, 1507
                  nop
                  c.srai       a5, 10
                  sltu         a3, a6, a2
                  c.li         s0, -1
                  srl          s8, s2, t1
                  c.or         a2, a4
                  c.addi16sp   sp, -16
                  csrrci       a0, 0x340, 0
                  c.slli       s5, 11
                  csrrci       gp, 0x340, 1
                  andi         s7, s5, 1698
                  csrrsi       a4, 0x340, 0
                  c.and        a3, a4
                  ori          t6, a6, 1014
                  xori         t6, s0, 741
                  xor          s5, s6, s4
                  andi         a7, t0, 542
                  divu         t3, s8, ra
                  mulhsu       t2, a2, s1
                  c.sub        a1, s1
                  mulhsu       t1, s1, tp
                  mul          t6, s3, a1
                  sub          s1, s2, s9
                  sll          s2, a3, ra
                  c.addi       s6, -1
                  sltu         s10, s2, s6
                  c.andi       s0, -1
                  mulhu        tp, a6, s2
                  sltiu        a7, gp, 449
                  div          a1, zero, sp
                  mulhu        a1, a7, s1
                  csrrci       s10, 0x340, 5
                  csrrsi       tp, 0x340, 0
                  rem          a7, t1, tp
                  sra          s2, s11, a2
                  csrrwi       s2, 0x340, 1
                  csrrs        s6, 0x340, zero
                  c.addi       a7, 17
                  slt          a1, t1, t0
                  c.addi16sp   sp, -16
                  srli         t1, sp, 12
                  andi         a5, s11, 530
                  sltiu        a2, s2, 1821
                  srl          s5, a5, s7
                  csrrw        s6, 0x340, sp
                  addi         a1, t3, -439
                  addi         t1, tp, -1883
                  csrrci       t1, 0x340, 7
                  c.addi4spn   a5, sp, 288
                  xori         t4, a6, 1029
                  c.srai       a0, 13
                  sub          s7, s3, t6
                  csrrc        s1, 0x340, gp
                  rem          s7, s10, sp
                  mulhsu       sp, a4, t3
                  c.mv         t1, a6
                  ori          a4, a7, 174
                  auipc        s6, 860467
                  nop
                  c.add        s6, gp
                  slt          tp, s2, t4
                  c.li         t1, -1
                  c.srai       a4, 16
                  rem          a3, s10, s5
                  sra          t4, tp, t5
                  c.or         s1, a1
                  srl          s0, s6, s7
                  auipc        s8, 630393
                  c.or         s0, a3
                  or           a4, ra, a3
                  auipc        s5, 527470
                  c.mv         a1, a1
                  auipc        s7, 814387
                  sra          gp, t4, tp
                  mulh         a7, a2, a4
                  c.slli       s1, 18
                  div          a2, t4, a6
                  slt          t1, s10, t3
                  csrrsi       t0, 0x340, 23
                  or           s2, s3, s7
                  csrrsi       s4, 0x340, 19
                  and          s8, s8, s1
                  slli         t6, t1, 0
                  mulhu        s5, s8, s8
                  c.srai       s1, 13
                  sltiu        t0, a0, -485
                  add          s4, a6, s9
                  remu         t6, sp, t6
                  c.nop
                  add          a2, t6, a7
                  nop
                  c.addi4spn   a0, sp, 384
                  slt          t2, a6, s10
                  srli         t6, s2, 18
                  c.srai       a4, 30
                  csrrs        t1, 0x340, zero
                  andi         t6, a1, -693
                  csrrw        s5, 0x340, sp
                  srai         a6, s3, 25
                  c.addi4spn   a3, sp, 416
                  c.add        gp, s5
                  sltiu        t3, a0, -301
                  srl          a4, s8, s0
                  addi         a0, ra, 1573
                  c.or         s1, a4
                  sub          t0, t5, s3
                  srl          gp, a2, t5
                  add          t0, s5, t5
                  sra          s8, s8, a2
                  ori          a1, s2, -1655
                  and          ra, t3, s2
                  csrrc        sp, 0x340, zero
                  c.addi4spn   a2, sp, 864
                  slti         a7, t1, -767
                  div          a1, s10, a4
                  remu         t3, a1, s0
                  ori          s2, a1, -1634
                  sltiu        a0, a7, -1493
                  c.addi4spn   s1, sp, 384
                  slt          tp, s1, a5
                  csrrs        a5, 0x340, zero
                  c.addi4spn   a2, sp, 1008
                  c.srli       a2, 26
                  srl          a6, s8, s9
                  csrrsi       ra, 0x340, 0
                  mulh         a5, s1, tp
                  srai         s6, a4, 11
                  c.or         a2, a2
                  slti         tp, s9, -27
                  add          zero, tp, s5
                  c.addi       t4, -1
                  add          a4, t3, a0
                  c.nop
                  csrrci       t6, 0x340, 11
                  div          a0, zero, a2
                  c.slli       tp, 16
                  ori          s6, s3, 1713
                  slli         a7, s6, 12
                  c.addi       a0, -1
                  sll          a3, s2, s0
                  c.nop
                  nop
                  c.srli       a4, 15
                  srai         zero, t3, 31
                  c.srli       a5, 28
                  mul          a2, a1, s7
                  c.li         s5, 13
                  nop
                  c.addi4spn   a2, sp, 432
                  c.andi       a5, 31
                  c.slli       s2, 10
                  c.sub        a3, a2
                  c.srai       a2, 27
                  xor          a2, t4, a4
                  c.xor        a3, a5
                  sltu         t1, s2, a1
                  srli         s5, s9, 5
                  sll          a2, t4, a7
                  csrrwi       ra, 0x340, 3
                  c.li         a1, 13
                  slt          t2, t4, t5
                  sll          s4, zero, s1
                  c.addi16sp   sp, 208
                  slli         ra, t3, 10
                  lui          a7, 48784
                  c.addi       tp, -1
                  csrrci       t6, 0x340, 1
                  div          s8, a0, t4
                  c.sub        a4, a4
                  sltiu        s0, sp, 1600
                  c.add        s7, t0
                  c.addi16sp   sp, -16
                  rem          a4, sp, a0
                  add          a0, a2, a0
                  c.or         a1, s0
                  c.sub        s1, s0
                  add          a3, s11, t1
                  c.or         a3, a2
                  sltu         gp, s10, a2
                  xor          sp, t2, s5
                  c.add        t4, t6
                  csrrc        s10, 0x340, s3
                  mulh         s2, a0, s2
                  srli         a2, s2, 1
                  c.mv         s8, s0
                  csrrs        s10, 0x340, zero
                  csrrw        t4, 0x340, t1
                  csrrw        t5, 0x340, s4
                  rem          t3, s5, s11
                  c.or         a5, a2
                  andi         a7, ra, -675
                  c.addi4spn   a4, sp, 704
                  c.addi16sp   sp, 208
                  sltiu        gp, s0, 147
                  c.nop
                  xor          sp, s4, sp
                  c.srai       a0, 19
                  c.li         s0, -1
                  c.srai       a2, 23
                  c.or         s1, s0
                  sra          s7, a4, a7
                  c.or         a0, a0
                  xori         t3, t1, -141
                  csrrci       t4, 0x340, 0
                  rem          t2, a6, t2
                  slt          tp, gp, gp
                  csrrsi       gp, 0x340, 5
                  xori         t1, s2, -305
                  csrrs        sp, 0x340, zero
                  c.addi16sp   sp, -16
                  c.add        t0, s5
                  mul          t4, s10, s9
                  c.srli       a3, 21
                  slti         s5, t4, -76
                  andi         s8, s8, -1393
                  srai         a2, s10, 5
                  c.addi4spn   a3, sp, 784
                  c.slli       t4, 3
                  csrrs        s6, 0x340, zero
                  csrrwi       a4, 0x340, 16
                  sltu         t1, s7, tp
                  c.add        a1, s1
                  and          s5, s0, a7
                  c.lui        s8, 5
                  sra          a3, s3, s2
                  csrrsi       t0, 0x340, 0
                  auipc        t4, 945707
                  mulhu        s0, t5, a2
                  xor          a3, t5, t5
                  divu         a0, a0, t3
                  andi         s1, s6, -354
                  addi         s0, s4, -1206
                  or           s5, s10, a1
                  csrrci       s8, 0x340, 0
                  rem          zero, a6, t6
                  addi         s1, a2, 1172
                  c.srai       s0, 28
                  c.srai       s0, 1
                  c.srai       s0, 9
                  mulhu        s8, t2, a6
                  c.xor        a4, a5
                  csrrs        ra, 0x340, zero
                  srai         a0, t6, 31
                  and          gp, s2, s7
                  add          t0, s9, a5
                  and          t4, gp, s5
                  c.srli       s1, 11
                  slli         s6, s1, 28
                  csrrw        s0, 0x340, s7
                  and          s6, s5, a5
                  c.sub        a5, s1
                  csrrc        s0, 0x340, t4
                  csrrci       a7, 0x340, 24
                  csrrwi       t6, 0x340, 2
                  csrrw        a2, 0x340, s5
                  c.lui        t2, 10
                  or           t0, s2, s1
                  csrrci       s10, 0x340, 0
                  sll          s10, s4, s3
                  auipc        s4, 403416
                  nop
                  nop
                  csrrsi       ra, 0x340, 0
                  addi         a0, a3, 1857
                  sra          t5, t3, s11
                  c.andi       a0, 0
                  csrrw        s7, 0x340, s10
                  sub          s0, s0, s6
                  and          a0, a5, zero
                  c.mv         a7, t4
                  srai         a4, a1, 5
                  mulhu        ra, t5, s1
                  srl          a4, t5, a5
                  csrrs        a4, 0x340, zero
                  lui          s4, 387449
                  c.addi       a5, 17
                  sll          a2, a7, a4
                  csrrs        s0, 0x340, s8
                  c.lui        t0, 15
                  c.addi16sp   sp, -16
                  c.andi       a1, -1
                  csrrw        s0, 0x340, t6
                  slt          s6, s3, s11
                  c.sub        a1, a2
                  c.andi       a4, 6
                  csrrs        s4, 0x340, zero
                  andi         a1, s11, 1747
                  slli         s1, a6, 29
                  addi         a6, t3, 1287
                  div          ra, a1, s7
                  rem          sp, a2, t6
                  slti         tp, sp, 470
                  c.xor        a1, s1
                  c.and        a2, a1
                  c.addi       a6, -1
                  nop
                  mulh         s1, t3, gp
                  lui          a1, 391451
                  ori          t4, t0, 1500
                  andi         a2, a7, 133
                  sltu         s4, zero, t4
                  add          gp, a0, s2
                  sub          a7, a2, tp
                  c.sub        s1, s0
                  csrrw        a3, 0x340, a0
                  ori          t2, s9, -979
                  c.nop
                  srai         a2, s1, 5
                  srai         t2, a4, 9
                  srl          s6, s2, t0
                  c.slli       s8, 20
                  rem          t0, s11, s3
                  c.sub        a0, s1
                  or           s7, t5, t0
                  ori          s10, a3, 1140
                  slt          s1, t2, ra
                  csrrw        a6, 0x340, s6
                  nop
                  srli         ra, s3, 29
                  c.slli       a4, 23
                  c.addi4spn   a3, sp, 688
                  c.addi4spn   a4, sp, 864
                  sll          a6, s0, t4
                  srai         t4, a4, 19
                  srl          a0, a7, s11
                  sra          a2, a7, s11
                  csrrs        a2, 0x340, zero
                  c.lui        s2, 25
                  c.addi       ra, -1
                  mulhu        sp, t2, a1
                  csrrw        s6, 0x340, s3
                  add          a7, a6, sp
                  c.add        ra, s10
                  c.srai       a2, 1
                  csrrci       s7, 0x340, 14
                  sltiu        gp, s8, -1138
                  srli         a5, s11, 10
                  csrrs        s0, 0x340, tp
                  add          t4, a4, a3
                  c.mv         t0, a7
                  srai         gp, zero, 11
                  slti         sp, s1, 84
                  sltiu        sp, s9, 719
                  xori         a7, zero, 1051
                  csrrwi       t5, 0x340, 13
                  nop
                  csrrwi       s5, 0x340, 9
                  and          a3, a3, t3
                  c.addi       s1, 24
                  add          a1, s5, s3
                  c.and        a5, a4
                  or           tp, s7, s5
                  mul          a3, t1, gp
                  rem          s1, ra, t0
                  slt          t1, s8, s3
                  srai         s4, a4, 23
                  sltu         a1, sp, t4
                  c.or         s1, a2
                  c.xor        a0, a2
                  xori         s5, a4, -928
                  sltu         s8, zero, t4
                  c.andi       a1, -1
                  mul          s5, a2, s9
                  csrrs        t1, 0x340, a4
                  remu         s7, a6, a6
                  c.nop
                  c.srai       a4, 26
                  c.sub        a0, s0
                  andi         s10, s5, 358
                  xor          s1, ra, t4
                  c.addi       a2, -1
                  c.slli       s2, 7
                  c.add        t3, t0
                  c.lui        t4, 29
                  slli         ra, s0, 5
                  c.or         a5, a5
                  csrrsi       zero, 0x340, 12
                  mulhsu       gp, t0, s1
                  srai         t6, tp, 2
                  c.andi       s0, 2
                  srli         gp, s4, 31
                  srai         t3, s11, 24
                  c.nop
                  c.srli       a2, 28
                  mulhsu       gp, s0, t2
                  lui          a4, 865582
                  c.and        a1, a0
                  sll          s5, t1, s10
                  csrrci       s4, 0x340, 3
                  c.andi       a3, 17
                  csrrsi       t0, 0x340, 26
                  or           s10, a7, s3
                  srai         s2, s7, 9
                  c.slli       a6, 14
                  mulhsu       s6, a4, a6
                  ori          t1, s4, 535
                  c.slli       t6, 27
                  sra          a4, a6, s0
                  sub          t1, s11, a2
                  sll          zero, s3, t5
                  c.nop
                  mulhu        s2, s10, s4
                  c.addi16sp   sp, 256
                  xor          gp, t5, s10
                  csrrsi       s8, 0x340, 28
                  addi         ra, t2, -750
                  sltu         s2, s10, t0
                  slt          a1, t1, s2
                  c.srai       s1, 15
                  auipc        t0, 682193
                  c.add        s0, s9
                  c.srai       a2, 26
                  slti         gp, s10, -936
                  c.srli       a4, 23
                  remu         s8, t6, t0
                  c.and        a0, a3
                  andi         s0, a4, 508
                  c.lui        s10, 7
                  srli         s1, ra, 8
                  c.addi16sp   sp, -16
                  csrrsi       gp, 0x340, 0
                  div          zero, t1, gp
                  mulh         s4, s8, s10
                  c.sub        s0, s0
                  rem          s6, a0, t5
                  add          a7, t4, s1
                  auipc        a5, 418634
                  sub          s0, a0, gp
                  mulhsu       s8, tp, s8
                  sltiu        s8, t5, -2008
                  c.addi4spn   s0, sp, 784
                  c.lui        a6, 14
                  c.nop
                  sll          a6, ra, zero
                  c.xor        a5, a1
                  addi         s5, t3, 1483
                  c.and        s1, s0
                  div          ra, a3, a7
                  auipc        a5, 219978
                  mulhu        t1, gp, t1
                  c.addi       a4, -1
                  div          ra, s9, gp
                  sub          a4, s0, zero
                  c.andi       a1, 5
                  c.addi16sp   sp, -16
                  c.lui        a4, 23
                  or           s7, s4, s3
                  c.and        a0, a2
                  divu         a0, a1, s3
                  srl          a0, t4, gp
                  and          t4, s7, tp
                  srai         t0, s7, 17
                  sltu         t5, ra, a6
                  csrrw        s7, 0x340, gp
                  ori          a2, t2, -1424
                  xor          t3, s9, s0
                  c.nop
                  srai         s10, s0, 29
                  c.srli       s1, 3
                  mulh         t0, a6, a2
                  csrrwi       t6, 0x340, 29
                  c.addi4spn   a3, sp, 496
                  c.andi       a4, -1
                  c.mv         s4, s8
                  csrrc        gp, 0x340, zero
                  c.srai       a3, 28
                  rem          a0, s7, s3
                  csrrs        s1, 0x340, s11
                  c.sub        a0, a2
                  c.sub        s0, a4
                  slli         t5, s4, 17
                  sll          a3, s8, s4
                  slli         s5, t0, 19
                  c.li         a7, 5
                  slli         t0, t1, 21
                  csrrw        gp, 0x340, t0
                  rem          s7, s3, s0
                  nop
                  sub          t3, a3, s11
                  slt          a0, s7, ra
                  c.or         a0, a0
                  or           s8, s9, t3
                  c.li         s4, -1
                  srli         t3, s8, 12
                  c.nop
                  csrrc        s10, 0x340, a7
                  csrrc        ra, 0x340, zero
                  csrrs        s8, 0x340, zero
                  c.srli       a2, 28
                  auipc        t1, 168232
                  xor          s6, s6, s0
                  rem          s10, t5, a7
                  c.srai       a0, 26
                  sltu         a0, t2, s4
                  divu         ra, t6, sp
                  and          a4, s11, a4
                  c.or         a3, a2
                  c.xor        a4, a2
                  mulh         a5, s0, sp
                  c.sub        a3, a4
                  csrrci       t6, 0x340, 23
                  sub          a5, gp, a4
                  c.mv         a7, a0
                  c.and        a5, a5
                  add          tp, t6, s0
                  mul          a3, t3, s4
                  mulh         s1, s8, sp
                  lui          s7, 799912
                  sltu         t2, zero, a5
                  srai         s1, gp, 12
                  nop
                  c.srli       a0, 18
                  andi         s5, a4, 2000
                  srli         a0, t4, 17
                  sltu         gp, t3, t2
                  c.and        a5, s1
                  c.or         a2, a5
                  rem          a4, a4, a3
                  mulhu        a6, a7, t5
                  ori          a3, s4, -509
                  c.add        sp, s5
                  mulhu        a3, gp, a0
                  c.srli       a2, 26
                  c.addi4spn   a3, sp, 992
                  c.li         t1, 8
                  c.xor        a5, a5
                  add          ra, s7, t6
                  c.srai       a1, 26
                  c.andi       a4, 18
                  c.xor        a3, a3
                  csrrc        s8, 0x340, zero
                  nop
                  sub          s7, t4, ra
                  c.andi       s0, 3
                  add          a4, zero, s1
                  srl          tp, s1, a3
                  c.and        s1, a5
                  div          t5, ra, tp
                  c.andi       a5, 22
                  mulh         gp, s4, ra
                  andi         ra, a3, 1805
                  andi         s7, s3, -1279
                  c.srli       a1, 9
                  c.srli       s0, 18
                  srli         sp, a5, 30
                  or           ra, s8, t5
                  c.addi       t5, -1
                  c.sub        a5, a5
                  c.andi       s0, -1
                  xor          s7, tp, s9
                  add          a4, sp, s2
                  sltu         s7, tp, s5
                  c.and        a1, a3
                  c.addi       tp, -1
                  andi         t3, s11, 385
                  sltiu        sp, t2, -315
                  srli         s0, s3, 3
                  c.srli       a0, 8
                  slt          a4, tp, s3
                  c.andi       a5, 16
                  slli         s7, sp, 13
                  slli         s0, a6, 25
                  c.li         t3, -1
                  csrrsi       t3, 0x340, 3
                  c.xor        a4, a0
                  csrrw        t4, 0x340, s11
                  csrrci       s7, 0x340, 26
                  c.sub        a2, a1
                  or           t5, s11, s1
                  c.xor        a1, a3
                  divu         a1, t4, a5
                  c.sub        a3, s1
                  add          t6, s4, t6
                  srai         t2, s9, 12
                  c.srli       a5, 19
                  ori          s8, zero, -906
                  c.li         t1, -1
                  srl          a5, s4, s4
                  xori         a2, s9, 1063
                  c.mv         a2, s10
                  c.li         sp, 0
                  ori          t6, a2, 1088
                  c.nop
                  srai         s1, a4, 21
                  csrrci       t0, 0x340, 15
                  c.addi4spn   a0, sp, 896
                  c.lui        s4, 8
                  sltu         t4, a6, s5
                  nop
                  c.or         s0, a0
                  c.srli       a5, 20
                  ori          sp, a3, 927
                  c.srli       s0, 6
                  csrrc        s10, 0x340, a3
                  srai         s6, zero, 3
                  slt          s5, s7, s9
                  sltiu        a5, t6, 490
                  csrrci       zero, 0x340, 15
                  csrrc        s8, 0x340, zero
                  xori         a7, a6, 1651
                  mulhsu       t1, s6, a1
                  sll          gp, a3, s9
                  csrrsi       s10, 0x340, 0
                  csrrwi       gp, 0x340, 10
                  slti         s2, t4, 1311
                  xor          a3, a5, a7
                  csrrsi       sp, 0x340, 0
                  xori         t6, s4, 271
                  sra          a4, a7, s6
                  add          s10, a7, s1
                  div          t5, s6, s3
                  c.srli       s1, 23
                  addi         a3, t6, -1906
                  or           t6, t2, s11
                  xori         zero, a7, 1059
                  or           t5, sp, sp
                  c.or         s0, a5
                  sltiu        a3, s8, -1909
                  slli         t0, s2, 4
                  c.srli       a3, 10
                  csrrci       a2, 0x340, 2
                  c.nop
                  csrrci       a5, 0x340, 0
                  c.srli       a4, 7
                  c.nop
                  csrrc        a5, 0x340, zero
                  slti         s5, ra, -348
                  c.and        a3, a1
                  div          gp, s5, tp
                  xori         t2, s11, -1027
                  remu         t4, s9, a6
                  slli         a3, a2, 11
                  c.slli       a4, 6
                  sra          t3, s4, ra
                  csrrc        t4, 0x340, a2
                  addi         s6, t3, 195
                  c.srai       a4, 12
                  slli         t2, t4, 10
                  csrrwi       s0, 0x340, 6
                  c.addi16sp   sp, -16
                  sltiu        a6, s5, 8
                  sub          t3, s5, a0
                  sltiu        t1, s11, 1000
                  c.lui        a0, 11
                  divu         t0, s7, sp
                  nop
                  slli         ra, a0, 19
                  c.srai       a3, 6
                  c.and        a2, a4
                  divu         a0, a2, zero
                  sll          tp, zero, s8
                  sub          s6, t1, t2
                  sltiu        t6, s0, 979
                  and          t4, a2, a5
                  c.andi       a4, 23
                  csrrw        a2, 0x340, s9
                  c.xor        s0, a2
                  csrrci       s8, 0x340, 0
                  ori          s0, s2, 1835
                  csrrs        a4, 0x340, s4
                  divu         ra, s1, zero
                  auipc        t6, 762156
                  c.lui        t6, 28
                  csrrw        a0, 0x340, s4
                  c.slli       a3, 13
                  rem          ra, a4, t5
                  c.nop
                  c.or         s0, s1
                  c.li         s8, -1
                  csrrs        s1, 0x340, t0
                  srai         s7, t4, 17
                  c.andi       a3, 26
                  srl          t2, s7, s5
                  mulhsu       zero, tp, a4
                  mulhu        s0, t0, s9
                  csrrwi       a6, 0x340, 28
                  c.andi       a0, 1
                  andi         ra, a5, 1621
                  c.li         s6, -1
                  mulh         t2, s4, t5
                  sra          t0, s4, t4
                  csrrs        t4, 0x340, t3
                  or           t1, t2, t3
                  c.srli       s1, 29
                  divu         s6, a2, t1
                  c.sub        a4, a4
                  slli         sp, s5, 12
                  sltiu        s2, s10, 396
                  add          t4, s6, t0
                  add          a4, a4, a4
                  sll          t6, sp, tp
                  sra          t0, s6, t0
                  sll          s6, s3, a3
                  csrrci       a0, 0x340, 12
                  div          s4, t2, s2
                  srl          a6, a4, s3
                  remu         a1, s4, t5
                  andi         a7, a0, -566
                  srl          a3, s5, s10
                  slti         s8, t1, 418
                  rem          a3, s7, zero
                  csrrw        s8, 0x340, a6
                  sll          t1, sp, a0
                  csrrwi       t5, 0x340, 12
                  nop
                  addi         a3, s9, -1821
                  sltu         gp, zero, s9
                  nop
                  csrrs        t1, 0x340, a0
                  csrrwi       t5, 0x340, 25
                  c.slli       s10, 14
                  csrrw        a0, 0x340, s2
                  remu         a3, a0, s8
                  c.sub        a4, s0
                  c.li         a6, 30
                  xori         ra, t4, -1803
                  xori         a5, s8, -516
                  c.srai       a4, 4
                  csrrw        t5, 0x340, a5
                  andi         a5, s3, -1447
                  xori         a0, tp, 1199
                  or           t2, s8, s7
                  c.addi       t2, 2
                  mul          a0, a6, a4
                  c.lui        s0, 7
                  slli         s0, a4, 19
                  srl          tp, t6, s10
                  c.lui        s6, 19
                  nop
                  csrrs        s8, 0x340, zero
                  csrrwi       t3, 0x340, 20
                  csrrwi       t3, 0x340, 30
                  sub          t2, s4, s8
                  c.xor        a4, s1
                  c.addi4spn   a0, sp, 832
                  slti         s7, s6, 538
                  c.and        a0, a0
                  c.slli       tp, 8
                  c.xor        a3, a4
                  slt          ra, tp, t3
                  srli         ra, t1, 22
                  srl          a0, s0, s5
                  andi         ra, zero, -1234
                  c.srli       a1, 31
                  srl          a5, a0, s1
                  mulhu        a6, s0, a2
                  mulhu        t1, s4, gp
                  mulhsu       s10, t3, t5
                  sll          t3, t4, s11
                  or           tp, s6, s7
                  mulhu        ra, a2, a0
                  c.add        ra, s4
                  sll          ra, a3, s11
                  c.li         t6, -1
                  csrrw        tp, 0x340, s0
                  c.mv         t0, ra
                  c.sub        a4, a2
                  srl          t0, s4, t6
                  sll          a1, a2, a3
                  csrrs        t5, 0x340, s4
                  csrrs        a3, 0x340, s2
                  div          s1, s7, t2
                  c.xor        s0, s0
                  and          s5, s2, tp
                  c.addi4spn   a2, sp, 1008
                  c.addi16sp   sp, -16
                  slli         s1, s1, 2
                  c.and        s0, a2
                  srai         a4, s4, 17
                  remu         s10, s7, t3
                  add          a7, a4, t2
                  mul          s7, a1, s6
                  sltiu        t4, s9, 173
                  ori          a0, s1, 602
                  add          t4, a2, s10
                  remu         s7, a5, s2
                  sra          s8, a6, s10
                  sra          gp, a5, a5
                  slli         a5, a7, 25
                  divu         t2, t5, a6
                  mul          s8, gp, s11
                  c.srli       a5, 9
                  c.and        a2, a3
                  div          a2, s9, t6
                  addi         s7, t5, 1311
                  divu         a5, s4, a7
                  c.and        a0, a4
                  xor          a1, a2, t2
                  mulh         t4, s1, ra
                  srl          tp, s8, sp
                  c.andi       a4, -1
                  andi         tp, a6, -196
                  sltiu        a0, t0, 472
                  c.srli       a1, 20
                  csrrci       t4, 0x340, 0
                  slli         tp, a0, 25
                  csrrwi       gp, 0x340, 22
                  xor          ra, a2, t1
                  ori          t0, s4, -1493
                  slti         s4, s5, -1998
                  sra          tp, t2, tp
                  lui          a0, 213171
                  andi         gp, ra, -1872
                  or           s6, gp, t2
                  mulhu        t3, t4, a5
                  csrrsi       s0, 0x340, 8
                  c.nop
                  c.addi4spn   s0, sp, 928
                  mulh         t6, ra, a7
                  addi         t3, a1, 1364
                  sll          gp, s2, t2
                  c.slli       s0, 21
                  mulh         sp, a3, sp
                  c.mv         t5, a3
                  sll          a6, s9, s11
                  c.addi16sp   sp, -16
                  and          t2, s11, s11
                  c.nop
                  csrrw        sp, 0x340, t5
                  sll          s6, t3, a2
                  addi         a7, a3, -869
                  div          a7, s4, sp
                  lui          a4, 460388
                  mulhsu       s6, s6, s6
                  slti         s1, a6, 864
                  c.xor        a2, a3
                  add          t3, t2, gp
                  ori          a0, a7, 1200
                  csrrci       a6, 0x340, 10
                  c.addi16sp   sp, 288
                  div          a2, s4, s4
                  or           s1, t5, t3
                  mulhsu       a4, s0, s7
                  csrrwi       t5, 0x340, 24
                  add          a0, a2, s4
                  c.addi       a7, 26
                  srl          a4, s4, t3
                  add          s6, tp, s5
                  csrrci       ra, 0x340, 0
                  srai         s2, s0, 11
                  ori          s2, a0, -680
                  c.sub        a4, a5
                  sub          a3, s4, s4
                  c.or         s0, a3
                  mulhu        a4, ra, a0
                  csrrsi       t5, 0x340, 0
                  c.addi4spn   s1, sp, 848
                  divu         t3, s9, s9
                  xori         s6, gp, 317
                  c.and        a5, a0
                  mulhsu       gp, ra, t0
                  c.lui        t6, 4
                  lui          t3, 807886
                  and          a5, t2, s1
                  csrrw        t1, 0x340, s3
                  mulhsu       t1, zero, s9
                  slli         t4, a2, 6
                  auipc        t5, 70258
                  c.addi       t5, -1
                  or           t3, a6, gp
                  c.addi4spn   a1, sp, 864
                  sltiu        a5, t6, 1970
                  div          t1, ra, s10
                  c.add        a2, t6
                  c.lui        s2, 7
                  rem          a2, t5, s1
                  mulh         a5, a2, zero
                  slti         t5, t1, -860
                  remu         s10, s6, t0
                  c.add        t0, s1
                  c.addi16sp   sp, 192
                  sll          s10, zero, a6
                  csrrs        s7, 0x340, s10
                  rem          sp, zero, gp
                  c.lui        s8, 5
                  c.srli       a3, 9
                  sub          a7, s11, s3
                  sub          s1, a2, ra
                  c.addi4spn   a2, sp, 944
                  slt          t0, zero, t0
                  auipc        s10, 52934
                  or           s10, a1, a6
                  add          a4, a4, s0
                  slt          t2, s10, s7
                  c.li         s4, 11
                  lui          a5, 312484
                  c.srli       a3, 25
                  auipc        a1, 149299
                  srai         a1, a5, 21
                  mul          a6, s9, a3
                  c.or         a2, a1
                  csrrwi       s10, 0x340, 3
                  c.mv         s8, s2
                  c.xor        a5, a0
                  mul          a2, s1, ra
                  div          a1, a1, t6
                  add          s2, s11, t0
                  xori         tp, a6, -1066
                  sub          t4, s2, s0
                  xor          s8, s1, t4
                  sra          t6, t1, s11
                  nop
                  c.and        a2, a2
                  addi         a1, t4, 1839
                  csrrwi       t5, 0x340, 24
                  c.nop
                  slli         a7, t2, 29
                  c.mv         s10, a5
                  xor          t3, s5, zero
                  csrrci       zero, 0x340, 0
                  srli         a4, s2, 5
                  nop
                  csrrs        zero, 0x340, zero
                  lui          t4, 232048
                  c.li         a4, 1
                  csrrwi       t4, 0x340, 0
                  sra          a7, t5, t2
                  srai         t3, gp, 0
                  c.slli       a6, 9
                  c.and        a5, a5
                  csrrsi       t0, 0x340, 0
                  c.or         a1, a5
                  c.and        s0, a2
                  sll          s4, s4, a2
                  slti         t2, a4, -1863
                  c.add        ra, t6
                  c.addi       s10, 30
                  slti         a5, s11, -1855
                  xori         s2, a4, 1287
                  addi         a0, a7, -395
                  sra          tp, t1, t1
                  sltu         gp, a1, a4
                  slti         a4, tp, -36
                  c.li         s2, -1
                  c.add        t4, t2
                  lui          a6, 385530
                  sltu         s0, a7, t4
                  auipc        t0, 874719
                  c.add        s7, s1
                  c.and        a0, a4
                  mulh         a5, s4, s1
                  rem          gp, s1, s6
                  rem          s1, a0, s8
                  c.srai       a3, 18
                  c.srli       a0, 5
                  remu         t0, a6, t3
                  csrrwi       s8, 0x340, 11
                  sll          t4, t3, a2
                  and          s0, s7, gp
                  csrrci       s2, 0x340, 10
                  andi         a5, sp, -140
                  lui          zero, 1000837
                  csrrs        ra, 0x340, t4
                  or           tp, t3, s5
                  sltu         sp, s7, s3
                  rem          t5, a4, s9
                  c.andi       a0, 22
                  c.or         a4, s1
                  c.and        a2, a4
                  sltiu        t6, s8, 1725
                  c.srai       a5, 7
                  csrrsi       a7, 0x340, 0
                  div          a6, s5, a5
                  csrrwi       s8, 0x340, 29
                  nop
                  slt          s8, s1, a1
                  c.addi       a0, -1
                  rem          a7, a5, a2
                  c.xor        a4, s1
                  c.srli       s1, 16
                  srli         a0, s8, 12
                  sltu         t0, s0, s9
                  ori          gp, s9, -1070
                  srai         s6, sp, 2
                  c.addi16sp   sp, 368
                  csrrc        a6, 0x340, a7
                  c.xor        a3, s0
                  divu         s7, s11, a6
                  c.srai       s0, 13
                  mulhu        t1, s11, a1
                  mulhu        s10, s9, a7
                  slti         t1, a5, 952
                  lui          ra, 150547
                  xor          t1, s7, s5
                  srai         s4, t3, 3
                  csrrw        s4, 0x340, s3
                  auipc        t2, 94919
                  sll          a4, s0, s8
                  sltu         t4, s5, s9
                  sltiu        s5, sp, -858
                  c.sub        a0, a0
                  ori          s4, a7, 614
                  c.and        a1, a3
                  slli         s8, t4, 4
                  c.srli       a0, 13
                  csrrwi       a7, 0x340, 6
                  divu         t6, a0, a6
                  remu         gp, a3, a5
                  c.srli       s1, 31
                  mul          tp, s10, s1
                  csrrc        a3, 0x340, zero
                  rem          s10, ra, zero
                  mulhsu       s5, s0, a1
                  csrrc        zero, 0x340, zero
                  c.srli       s0, 9
                  c.add        a7, t2
                  c.mv         s8, t4
                  mulhsu       s7, s7, a3
                  c.slli       sp, 28
                  c.nop
                  c.addi16sp   sp, -16
                  slt          a2, t5, a4
                  div          a6, tp, s0
                  auipc        s5, 939547
                  c.mv         s6, s1
                  mul          t5, s6, a4
                  auipc        tp, 186908
                  slt          gp, t1, tp
                  lui          a6, 717174
                  c.mv         t5, s3
                  and          a0, s1, s7
                  auipc        a2, 1016992
                  c.xor        a2, a2
                  srai         ra, gp, 29
                  csrrsi       t3, 0x340, 0
                  c.srai       a3, 21
                  sra          s2, a2, t5
                  c.or         s1, s1
                  c.slli       t0, 6
                  c.li         s0, 1
                  sra          a1, s8, s7
                  mulhsu       a5, s4, t2
                  srai         sp, a4, 29
                  srl          s10, t4, s9
                  csrrwi       s10, 0x340, 0
                  remu         s2, s4, tp
                  xor          zero, a1, sp
                  csrrwi       t4, 0x340, 28
                  slt          gp, t4, s9
                  csrrwi       a7, 0x340, 6
                  mulhu        a1, t3, ra
                  lui          s2, 188450
                  c.srli       a4, 8
                  andi         a7, a5, -1748
                  c.srli       a1, 16
                  rem          t4, t1, a0
                  c.or         a0, s0
                  srli         t6, gp, 26
                  auipc        s7, 517415
                  c.mv         gp, s1
                  addi         a1, s0, -1117
                  srai         a7, t3, 25
                  and          a7, s9, zero
                  c.slli       a5, 16
                  c.or         a0, a5
                  c.sub        s0, s1
                  c.andi       s0, 6
                  c.addi16sp   sp, 16
                  c.addi       ra, -1
                  mulhsu       s5, s0, a7
                  xori         t2, t0, 801
                  c.sub        a1, s1
                  c.and        s1, a0
                  divu         t3, t4, s5
                  c.addi16sp   sp, 448
                  c.addi16sp   sp, -16
                  c.srai       a1, 6
                  and          a6, zero, tp
                  srl          sp, s9, a1
                  and          s8, s11, t1
                  csrrs        zero, 0x340, zero
                  c.addi16sp   sp, 464
                  c.addi       s6, -1
                  csrrs        ra, 0x340, a3
                  lui          sp, 169036
                  addi         sp, sp, 1935
                  c.and        a4, a4
                  addi         s0, s4, -632
                  remu         sp, s5, s0
                  srai         s8, t5, 2
                  mulhsu       ra, s11, tp
                  xor          s2, ra, s6
                  c.and        s0, a3
                  c.addi4spn   a0, sp, 320
                  divu         a6, tp, s11
                  ori          a1, a3, -745
                  srl          ra, a7, tp
                  c.addi16sp   sp, 288
                  sltiu        sp, ra, 819
                  sltiu        gp, s0, 249
                  c.addi16sp   sp, -16
                  rem          t0, t1, a3
                  remu         s1, t0, gp
                  nop
                  mulhu        t4, t5, t0
                  div          a1, a3, sp
                  csrrsi       a7, 0x340, 0
                  c.andi       a3, 9
                  ori          a3, ra, 1104
                  mulh         s2, a7, a3
                  mul          s1, s3, t0
                  mulhsu       s10, t2, gp
                  ori          zero, gp, -165
                  c.srli       a5, 18
                  addi         t2, a0, 532
                  c.addi       t4, -1
                  and          s0, ra, t6
                  divu         a6, s4, a4
                  srli         s4, a2, 8
                  mulhsu       t3, a4, a2
                  mulhsu       s5, s7, s1
                  slt          a5, a0, a1
                  c.or         a5, a2
                  c.mv         t4, ra
                  slt          t2, s5, s10
                  c.slli       a6, 31
                  csrrw        t3, 0x340, t6
                  c.addi4spn   a0, sp, 928
                  c.nop
                  nop
                  slti         gp, a0, -749
                  sll          t2, gp, tp
                  c.add        tp, s5
                  c.or         s1, a5
                  andi         s2, a1, -845
                  div          s5, s2, s2
                  mulhu        a3, s4, t6
                  c.nop
                  remu         a7, a7, s11
                  mulh         s4, s5, s8
                  rem          a6, t5, a2
                  div          t1, s2, s8
                  c.mv         ra, t2
                  remu         tp, s6, a2
                  c.or         a5, a4
                  c.andi       a3, 23
                  csrrci       s10, 0x340, 8
                  mulhsu       s1, sp, s6
                  and          a0, a0, s5
                  csrrwi       s1, 0x340, 9
                  sra          a6, ra, s7
                  slti         s7, gp, 1853
                  csrrw        a7, 0x340, s7
                  c.addi16sp   sp, -16
                  c.and        a3, a4
                  divu         t3, s5, a4
                  c.sub        a5, a1
                  sltiu        sp, s2, -1740
                  sltu         s6, s1, s1
                  sltiu        s10, t3, 62
                  mulhsu       a2, s0, s7
                  xori         t3, t6, -410
                  lui          s5, 764875
                  srl          t3, t6, ra
                  div          t3, t1, s6
                  c.andi       s1, 15
                  c.addi4spn   s0, sp, 336
                  auipc        t2, 594718
                  csrrsi       s2, 0x340, 13
                  c.srai       s0, 12
                  add          a6, s3, s10
                  c.addi4spn   a0, sp, 784
                  csrrc        t2, 0x340, s9
                  srli         s10, s11, 29
                  auipc        t1, 118496
                  c.lui        tp, 15
                  csrrci       s10, 0x340, 11
                  c.addi4spn   a0, sp, 944
                  c.addi16sp   sp, -16
                  mul          s6, a2, ra
                  c.nop
                  xor          t2, s10, sp
                  csrrsi       gp, 0x340, 0
                  andi         a5, s9, -2000
                  c.or         a3, s1
                  slli         s5, s5, 4
                  c.andi       s0, 30
                  slt          s1, s6, t5
                  auipc        t6, 469603
                  c.sub        s0, a0
                  c.sub        s1, a0
                  xori         zero, s3, 1865
                  c.and        a0, a5
                  sltu         tp, s4, tp
                  csrrwi       a3, 0x340, 29
                  slti         ra, zero, -1313
                  ori          a3, s4, 244
                  or           zero, t3, s9
                  div          t4, a6, s1
                  slt          a7, s1, t1
                  c.srli       a0, 21
                  c.srai       a2, 17
                  divu         s1, s8, a2
                  c.lui        t3, 9
                  xor          a6, a3, t6
                  c.xor        a3, a4
                  or           ra, t2, t6
                  divu         a1, a2, s8
                  c.or         a0, a1
                  c.and        a3, a2
                  remu         s10, a2, t5
                  c.slli       s8, 23
                  c.srli       a4, 18
                  csrrwi       t6, 0x340, 28
                  mulh         s5, s9, t2
                  c.addi4spn   a4, sp, 448
                  lui          s1, 844798
                  slti         s1, a0, -779
                  remu         s8, a7, s10
                  xor          a7, a7, t2
                  rem          t6, t5, t4
                  rem          s10, s0, s4
                  csrrwi       a0, 0x340, 26
                  c.lui        t3, 25
                  sltu         sp, a7, s9
                  lui          t4, 232202
                  c.slli       a1, 28
                  remu         gp, s6, s9
                  mulhu        s5, t0, t6
                  andi         a4, tp, 858
                  xor          s5, a3, zero
                  nop
                  csrrs        s2, 0x340, zero
                  mulh         a1, s1, s7
                  slt          a4, s2, s3
                  remu         t3, a6, t4
                  c.li         t3, -1
                  c.addi       s2, 10
                  c.mv         a2, s5
                  xori         a1, a3, 882
                  c.srli       a2, 7
                  c.nop
                  or           a1, s8, s0
                  c.mv         a5, t6
                  c.addi4spn   a1, sp, 208
                  mulhu        s8, a7, s8
                  csrrc        a0, 0x340, zero
                  sub          s0, s6, tp
                  mulh         s4, a6, sp
                  srl          a6, tp, a3
                  nop
                  mul          s8, tp, s9
                  c.add        s0, s2
                  csrrwi       s8, 0x340, 23
                  c.xor        a0, a4
                  add          t3, a1, s4
                  andi         t3, a1, 1500
                  sub          s6, s1, s4
                  srai         s8, t3, 4
                  mulhu        zero, s6, a0
                  srl          tp, t5, s10
                  c.addi       ra, -1
                  or           s10, s4, zero
                  sra          s8, t6, a6
                  xori         a5, zero, 1473
                  divu         gp, zero, s6
                  addi         s2, a1, -876
                  c.lui        t3, 21
                  ori          sp, s11, 1245
                  mulhsu       t3, t5, s1
                  csrrw        s2, 0x340, gp
                  csrrwi       a6, 0x340, 8
                  div          t5, t4, t2
                  c.li         s5, 28
                  nop
                  addi         t0, sp, -296
                  mulhsu       zero, s8, s7
                  c.add        s2, sp
                  sll          gp, zero, s8
                  c.and        s0, a1
                  c.addi       a3, 18
                  divu         tp, s8, a5
                  csrrsi       t6, 0x340, 0
                  addi         a4, a3, -971
                  c.add        a7, s7
                  c.mv         a2, a0
                  mulhu        s7, s1, t0
                  srai         a4, s5, 24
                  c.addi4spn   a3, sp, 544
                  c.xor        a3, a1
                  slli         t4, t6, 14
                  sltu         a2, t1, gp
                  csrrsi       sp, 0x340, 0
                  auipc        t0, 438503
                  c.mv         tp, s10
                  addi         a1, t0, -899
                  c.nop
                  c.srai       a5, 11
                  mulhu        tp, t5, s8
                  csrrw        gp, 0x340, a1
                  csrrs        a1, 0x340, zero
                  c.srli       a5, 14
                  auipc        t2, 424409
                  mulhsu       s2, s0, s11
                  add          s5, a4, a6
                  c.li         t0, -1
                  sltu         s2, s1, a4
                  csrrs        t4, 0x340, zero
                  c.nop
                  nop
                  c.srai       a2, 31
                  sltu         tp, t4, sp
                  c.add        t2, s10
                  c.andi       a2, 30
                  c.addi4spn   a0, sp, 912
                  nop
                  sll          s0, s5, s0
                  slti         s1, a3, 314
                  c.and        s0, a2
                  slti         a0, t6, 666
                  c.addi4spn   s0, sp, 480
                  xor          ra, a4, s2
                  srai         s7, t2, 16
                  c.addi       s2, 14
                  c.sub        s1, a0
                  sub          t3, s5, a6
                  c.addi4spn   a2, sp, 816
                  ori          tp, t4, -1599
                  divu         t4, s5, t0
                  c.nop
                  c.mv         s0, gp
                  c.add        gp, a2
                  srli         s7, t0, 16
                  srl          a7, s9, a5
                  c.addi       tp, 14
                  c.nop
                  srai         a5, t3, 11
                  c.slli       t4, 17
                  csrrwi       zero, 0x340, 15
                  lui          a3, 995805
                  xor          a6, s6, a6
                  or           a5, zero, s8
                  csrrci       a7, 0x340, 12
                  csrrs        t6, 0x340, zero
                  c.srai       a3, 9
                  c.lui        s4, 25
                  rem          s4, gp, a5
                  c.addi       t0, -1
                  srl          s8, a1, s7
                  slti         t6, t5, 1797
                  addi         a3, a3, 613
                  c.srli       a2, 13
                  mulh         t6, s2, t4
                  c.andi       s0, -1
                  slt          s10, a2, s8
                  addi         s10, a5, -1658
                  c.nop
                  mulh         gp, s0, tp
                  c.add        a5, a4
                  c.or         a1, a5
                  csrrs        t1, 0x340, a2
                  sub          s8, a3, zero
                  csrrci       a5, 0x340, 26
                  c.addi4spn   a1, sp, 496
                  c.addi       a3, 22
                  andi         a1, t2, -1850
                  nop
                  srl          s5, t6, a7
                  c.or         a0, a5
                  c.slli       a3, 21
                  add          s0, t3, t3
                  c.andi       a4, -1
                  andi         s0, t4, -1752
                  c.addi16sp   sp, -16
                  c.sub        a3, s1
                  slti         s4, s0, -300
                  c.or         s1, a2
                  c.addi4spn   s1, sp, 784
                  c.mv         s6, s8
                  c.add        s5, t0
                  c.li         s2, -1
                  csrrw        tp, 0x340, t3
                  mulhsu       zero, a4, a1
                  c.li         t5, 28
                  c.sub        a2, s0
                  c.sub        a1, a5
                  mulhu        s6, a2, zero
                  c.sub        a4, a4
                  add          t6, t2, t3
                  c.xor        a5, s0
                  c.and        s0, a3
                  c.andi       a3, -1
                  c.sub        a4, s1
                  xori         t6, s6, 2031
                  sltiu        t6, a7, 1889
                  csrrwi       a0, 0x340, 15
                  csrrw        a7, 0x340, s3
                  c.andi       s0, -1
                  addi         a0, a2, 1392
                  sltiu        t3, s7, 1137
                  rem          a1, s0, s4
                  sub          s5, a3, tp
                  csrrw        t2, 0x340, s7
                  sll          s1, sp, t6
                  slti         a1, s0, -2035
                  srli         s5, t6, 19
                  slti         t1, a1, 757
                  sra          a5, a5, zero
                  and          s5, t2, s7
                  slti         t5, s10, 1304
                  sltiu        s2, s9, -1181
                  sra          s5, sp, a6
                  c.li         t3, -1
                  add          tp, t3, s1
                  c.add        t3, a4
                  or           s6, a6, t6
                  sll          sp, s9, a3
                  andi         s2, s10, 1200
                  sub          s6, zero, s7
                  sra          t2, s2, s10
                  c.li         a4, 5
                  csrrs        s7, 0x340, s6
                  c.addi4spn   a2, sp, 288
                  slt          a0, a2, sp
                  add          gp, t2, tp
                  srl          s1, t1, a6
                  c.addi16sp   sp, 112
                  c.addi4spn   a4, sp, 784
                  nop
                  sltu         s8, s8, a2
                  c.srai       a4, 30
                  mulhu        a1, s0, sp
                  sra          a1, s0, sp
                  csrrci       t4, 0x340, 0
                  rem          ra, s11, ra
                  srl          t3, s6, a7
                  ori          a7, a5, 1806
                  mulh         s0, t0, t3
                  c.xor        a3, a5
                  c.addi4spn   a2, sp, 192
                  slt          s6, t4, s0
                  divu         a1, sp, a0
                  srai         s0, t5, 0
                  csrrci       s1, 0x340, 4
                  c.and        a5, s1
                  divu         tp, t1, t0
                  c.slli       s0, 21
                  csrrs        a5, 0x340, a1
                  csrrc        a0, 0x340, zero
                  c.slli       s1, 18
                  sra          s7, s9, a1
                  divu         sp, s9, s3
                  c.lui        a7, 7
                  c.srai       a2, 18
                  c.andi       a5, 16
                  mulhsu       t2, s4, t2
                  or           gp, ra, s6
                  csrrsi       a3, 0x340, 15
                  c.addi16sp   sp, -16
                  slli         s10, a7, 21
                  sra          a2, sp, s2
                  srli         gp, t2, 26
                  mulhsu       t2, t4, s0
                  and          s7, s1, t5
                  srl          ra, s9, a0
                  auipc        zero, 808950
                  and          t1, a6, t3
                  c.srai       s0, 30
                  c.addi4spn   a4, sp, 864
                  csrrsi       s1, 0x340, 29
                  c.sub        a1, a3
                  c.addi16sp   sp, -16
                  srai         t0, s9, 4
                  c.srli       s0, 23
                  add          a3, a0, s9
                  rem          s10, zero, t4
                  add          t6, s5, s9
                  csrrwi       t5, 0x340, 26
                  lui          s8, 448983
                  srl          s7, t0, ra
                  slli         t4, t3, 5
                  csrrwi       s10, 0x340, 29
                  sltu         s5, s4, t2
                  c.srli       a1, 7
                  slli         s10, a6, 23
                  andi         t5, t1, -604
                  sub          s8, s5, t1
                  and          a7, t5, t6
                  divu         a6, a3, sp
                  mulh         s7, s0, a3
                  srl          a1, s11, t2
                  remu         t5, s1, t6
                  csrrw        s6, 0x340, a5
                  csrrc        a0, 0x340, zero
                  c.addi       a6, 15
                  c.nop
                  slti         a3, s1, -1432
                  csrrs        s4, 0x340, a7
                  andi         a7, a3, 286
                  xori         ra, a5, -1023
                  xor          t2, t6, t1
                  c.slli       tp, 22
                  c.sub        a2, a5
                  auipc        a0, 981224
                  csrrwi       s7, 0x340, 25
                  csrrci       ra, 0x340, 30
                  or           a4, s1, s3
                  csrrs        a3, 0x340, zero
                  mulhsu       t0, t1, s9
                  mulh         a4, gp, a5
                  csrrci       s8, 0x340, 11
                  c.lui        t1, 5
                  addi         tp, t5, -1767
                  add          t3, s6, s1
                  remu         a7, s10, s2
                  ori          t2, gp, -504
                  auipc        t2, 171571
                  mul          ra, a1, t1
                  c.srli       a2, 26
                  c.and        a3, a5
                  and          a1, s1, t5
                  or           a1, t0, a2
                  divu         s6, s1, tp
                  lui          a5, 364509
                  mulhsu       s8, sp, s2
                  and          gp, t6, s7
                  sub          s4, a2, s0
                  xor          a1, t5, a5
                  auipc        t3, 353429
                  c.sub        a4, s1
                  csrrci       s7, 0x340, 30
                  srl          s5, sp, tp
                  c.addi16sp   sp, -16
                  c.lui        s1, 17
                  srl          a0, zero, t2
                  slt          a7, s0, t0
                  and          a1, s6, a1
                  c.sub        a5, a1
                  csrrs        s1, 0x340, zero
                  slt          a1, s2, s0
                  c.lui        ra, 10
                  ori          zero, t6, -1538
                  srai         t4, s9, 3
                  or           s0, s10, gp
                  c.xor        a5, a2
                  c.sub        a0, a4
                  rem          t5, t3, s6
                  csrrci       t2, 0x340, 0
                  c.slli       s7, 7
                  mulh         s6, ra, t6
                  c.addi16sp   sp, -16
                  c.addi16sp   sp, 112
                  csrrwi       s10, 0x340, 2
                  divu         a6, a0, s5
                  auipc        s8, 245578
                  csrrc        a0, 0x340, zero
                  add          a3, t3, s8
                  divu         t1, s0, t1
                  csrrci       s6, 0x340, 6
                  csrrs        tp, 0x340, s6
                  remu         s5, s11, s8
                  mulh         t0, tp, t1
                  srl          s4, t5, a4
                  c.xor        s1, s0
                  sub          t0, sp, t1
                  rem          zero, t4, a4
                  sub          a4, s8, a1
                  sll          s8, a5, a4
                  c.srli       a5, 13
                  andi         s5, s8, -470
                  sra          sp, t2, zero
                  xori         t2, s1, 833
                  csrrs        sp, 0x340, zero
                  c.slli       t3, 25
                  auipc        s2, 300950
                  sltu         a1, s6, s8
                  csrrsi       t2, 0x340, 11
                  c.or         a3, a3
                  slti         ra, t3, -1610
                  divu         t3, s6, s9
                  c.nop
                  c.srai       s1, 19
                  xor          s1, sp, a3
                  csrrsi       sp, 0x340, 0
                  sll          t5, s11, t2
                  c.mv         a0, s8
                  andi         tp, a2, 35
                  xori         a5, a5, 196
                  srl          t2, s3, gp
                  csrrs        t6, 0x340, t1
                  sltu         t5, t4, t3
                  sltu         sp, gp, s11
                  csrrci       a2, 0x340, 15
                  lui          a3, 101853
                  c.xor        a0, s1
                  and          t1, s6, s3
                  slt          ra, s11, s1
                  c.srai       a5, 20
                  c.xor        a3, a2
                  c.nop
                  sll          a1, s7, a0
                  sub          t6, sp, ra
                  mulhsu       gp, gp, s3
                  c.addi16sp   sp, -16
                  c.and        s0, a2
                  sll          a6, t1, a2
                  rem          t3, t2, a5
                  mulhsu       a2, s1, s11
                  mul          s2, ra, s9
                  add          t3, ra, a1
                  ori          a0, t1, 1793
                  c.nop
                  slt          t4, s5, a1
                  csrrci       zero, 0x340, 24
                  ori          t2, s5, 796
                  sra          s8, t1, t4
                  c.srli       a2, 26
                  c.and        s1, a5
                  csrrsi       t4, 0x340, 0
                  nop
                  remu         s6, s9, t3
                  or           t6, s8, a6
                  sub          s8, t1, s7
                  lui          s7, 497714
                  c.sub        a0, a5
                  ori          s10, s3, 1152
                  mul          t4, s9, a5
                  c.lui        t2, 19
                  mulh         s1, a2, s9
                  srai         s8, s1, 9
                  c.srli       s1, 31
                  c.addi16sp   sp, -16
                  andi         s6, s3, -1711
                  xori         t1, s8, -1167
                  c.lui        t6, 22
                  c.addi       s8, 24
                  auipc        ra, 817235
                  lui          ra, 455343
                  srli         s2, t4, 8
                  slti         t0, a4, -264
                  c.srai       a5, 9
                  c.andi       a0, -1
                  sub          s6, t1, s11
                  xori         s5, gp, 1474
                  srai         zero, s1, 26
                  srli         zero, s5, 17
                  andi         t0, t4, 1411
                  mulhu        a2, t2, tp
                  mulhu        sp, a4, t0
                  c.addi       s10, 28
                  srli         t0, a5, 23
                  c.xor        s1, s0
                  and          s0, s1, t5
                  c.addi16sp   sp, 416
                  csrrci       s10, 0x340, 0
                  c.addi16sp   sp, 192
                  mul          s5, a7, s6
                  c.add        t4, s8
                  c.li         t5, -1
                  addi         t5, s0, 2044
                  sra          t2, s1, a3
                  remu         sp, t4, t6
                  csrrc        t1, 0x340, zero
                  mul          s7, s5, s8
                  sltu         s0, sp, a0
                  sltiu        s10, a3, -1483
                  c.nop
                  c.addi       s0, -1
                  c.and        s0, a0
                  xor          s5, s7, s6
                  and          s0, t2, ra
                  ori          a3, t5, -1896
                  xori         t4, s5, 1264
                  addi         t6, zero, 1063
                  slti         t3, t4, 271
                  sll          tp, t0, s1
                  csrrw        s8, 0x340, s2
                  sra          ra, s11, a2
                  c.nop
                  c.addi16sp   sp, -16
                  c.addi16sp   sp, 272
                  c.mv         a3, t2
                  sub          gp, t4, t3
                  rem          ra, gp, t5
                  add          t1, gp, s5
                  c.sub        a3, s0
                  c.sub        a2, a4
                  addi         a0, s0, 1997
                  slti         a6, a4, -659
                  sra          s2, a2, s5
                  xori         t2, s10, -68
                  c.andi       a4, 20
                  div          t3, s8, a0
                  c.xor        a2, s1
                  c.srai       a3, 28
                  auipc        t1, 935528
                  sub          sp, t2, t3
                  sll          t6, gp, s1
                  c.addi       gp, 25
                  c.li         sp, 1
                  c.lui        s4, 5
                  c.lui        gp, 16
                  sll          gp, a1, t3
                  addi         s5, a7, -1970
                  and          s7, s7, s4
                  add          s1, a7, t1
                  remu         s5, a1, s4
                  srai         t1, a7, 30
                  sltu         s0, sp, t4
                  and          zero, t3, t2
                  auipc        ra, 332537
                  c.slli       t0, 1
                  c.and        a1, a2
                  csrrsi       zero, 0x340, 26
                  ori          s10, t1, 802
                  csrrw        s0, 0x340, a4
                  c.addi16sp   sp, 224
                  csrrw        t5, 0x340, sp
                  csrrc        t1, 0x340, s7
                  c.sub        a1, a4
                  c.lui        s2, 12
                  c.add        t0, ra
                  csrrci       s6, 0x340, 30
                  divu         t5, a4, a5
                  c.mv         a7, a1
                  xori         a7, a7, 98
                  slli         a0, s10, 20
                  lui          zero, 674058
                  xori         s5, a6, 1562
                  nop
                  add          t2, s1, t6
                  or           a0, s0, t3
                  c.addi16sp   sp, 16
                  sltiu        t4, sp, 1357
                  remu         s2, s8, s9
                  auipc        a5, 1001071
                  sltiu        a6, a0, 1187
                  c.xor        s1, a4
                  xori         s2, a5, -1785
                  c.and        a2, a3
                  c.srai       a0, 30
                  csrrw        ra, 0x340, a7
                  srli         t1, tp, 5
                  csrrs        t2, 0x340, zero
                  srai         a0, s7, 26
                  ori          s2, sp, -1127
                  csrrs        a6, 0x340, zero
                  srl          a1, s1, t3
                  c.slli       s5, 23
                  sub          t6, a4, s0
                  sra          zero, a7, s1
                  remu         zero, s5, s11
                  add          s1, s9, a5
                  c.srai       s0, 21
                  csrrwi       t4, 0x340, 16
                  c.srai       s0, 31
                  srli         tp, sp, 4
                  c.addi16sp   sp, -16
                  mul          t2, ra, t5
                  csrrc        s4, 0x340, s9
                  c.li         gp, -1
                  c.xor        a4, a3
                  c.mv         a0, s11
                  c.lui        a3, 5
                  xori         sp, s5, -166
                  csrrc        t4, 0x340, s9
                  c.andi       a0, -1
                  c.xor        a4, s0
                  c.sub        a4, a3
                  srli         t0, t5, 10
                  csrrci       a4, 0x340, 0
                  mulh         s4, s5, gp
                  csrrci       s0, 0x340, 1
                  csrrc        t6, 0x340, s3
                  rem          t5, s5, t2
                  c.srli       s0, 13
                  c.srai       a5, 22
                  c.slli       a1, 14
                  and          s10, a4, t0
                  csrrw        t1, 0x340, gp
                  sltu         s2, s4, ra
                  srli         t1, a7, 18
                  csrrci       a3, 0x340, 14
                  c.addi       a2, 12
                  c.slli       s5, 18
                  xori         s1, a6, 1569
                  c.mv         s0, s5
                  c.and        a5, s1
                  div          a4, a7, t0
                  c.addi       t4, -1
                  rem          s1, a0, t3
                  c.lui        s6, 21
                  slti         t3, s7, 47
                  c.andi       s0, -1
                  mulhu        gp, ra, t3
                  add          tp, a3, t0
                  mulhu        ra, t4, t1
                  addi         t5, a2, -1700
                  c.nop
                  c.lui        s6, 14
                  csrrwi       sp, 0x340, 29
                  c.or         s1, s1
                  c.sub        a1, s0
                  sra          s2, s1, s9
                  nop
                  csrrsi       a2, 0x340, 1
                  c.andi       a1, -1
                  c.lui        s7, 27
                  csrrw        t2, 0x340, s2
                  slt          t1, s1, t4
                  c.srai       a0, 11
                  c.and        a1, a2
                  sub          ra, s9, ra
                  csrrwi       t2, 0x340, 15
                  c.addi16sp   sp, 160
                  c.mv         t0, ra
                  sll          s2, t1, a2
                  sltu         a2, a3, s8
                  divu         t2, a1, a0
                  srai         a1, a0, 20
                  srai         s1, a1, 17
                  c.addi       sp, 8
                  csrrwi       ra, 0x340, 10
                  div          gp, t6, gp
                  mulhsu       s4, s0, t0
                  xor          tp, s11, tp
                  csrrci       a5, 0x340, 0
                  csrrw        a4, 0x340, s8
                  mulhsu       sp, s7, sp
                  lui          a6, 67903
                  mulhsu       zero, s0, tp
                  xor          s2, s11, a0
                  nop
                  csrrw        s6, 0x340, s3
                  srl          s6, tp, s0
                  csrrw        s1, 0x340, ra
                  c.li         a6, -1
                  c.xor        a2, a5
                  lui          s4, 614829
                  srl          t4, a5, s7
                  c.lui        a1, 4
                  csrrw        s5, 0x340, t1
                  srl          s5, a4, tp
                  c.and        a4, a1
                  sltu         a4, t2, t4
                  auipc        s0, 132983
                  add          t4, gp, s1
                  mulh         a5, s6, s3
                  mulhu        a1, t2, a2
                  c.li         s10, -1
                  and          s7, zero, a0
                  c.and        a4, a3
                  sltu         t6, a1, gp
                  csrrsi       t4, 0x340, 28
                  srai         s5, s4, 31
                  add          a7, t2, s11
                  c.xor        s0, a5
                  slt          s10, tp, t1
                  div          s5, a2, t1
                  c.srai       s0, 10
                  sltu         s1, s3, t3
                  c.slli       s7, 29
                  srli         t3, zero, 13
                  divu         s1, a7, t1
                  andi         tp, zero, 384
                  srai         a3, t5, 16
                  csrrsi       t6, 0x340, 2
                  or           tp, s0, t1
                  mulhsu       s0, s8, s4
                  c.sub        a1, s0
                  addi         t6, s10, -1069
                  rem          s7, s3, s3
                  or           a1, s10, s5
                  andi         sp, a2, -459
                  addi         a6, gp, 920
                  srl          gp, s11, t3
                  lui          sp, 441089
                  srli         s0, s6, 4
                  xori         gp, a5, -327
                  slt          tp, s10, s1
                  divu         a2, s0, a5
                  c.mv         ra, s10
                  c.andi       a1, -1
                  sll          s6, t4, t5
                  c.li         t2, 21
                  c.add        s6, t2
                  csrrw        t3, 0x340, a5
                  c.mv         s10, t2
                  rem          a6, s1, s10
                  slli         ra, s0, 9
                  c.xor        a0, a0
                  mulhsu       s4, t4, s1
                  csrrci       a4, 0x340, 0
                  lui          t1, 49929
                  c.srai       a3, 9
                  c.nop
                  csrrci       s6, 0x340, 7
                  c.sub        a5, s0
                  c.addi4spn   s0, sp, 560
                  or           a5, a7, t4
                  auipc        gp, 800431
                  c.mv         s4, sp
                  c.addi4spn   a5, sp, 576
                  srli         tp, s0, 15
                  xori         s10, s5, -138
                  mulh         a2, s11, t6
                  c.addi16sp   sp, -16
                  c.xor        a1, a4
                  nop
                  sub          zero, s5, s0
                  c.srli       a5, 3
                  xor          s4, s8, t0
                  c.addi4spn   a0, sp, 32
                  c.add        a4, ra
                  sltiu        gp, s5, -103
                  divu         s6, t0, s8
                  c.or         a1, s1
                  sltu         t6, a1, sp
                  sub          a0, s10, a0
                  rem          t3, gp, s7
                  c.addi       a3, 28
                  or           ra, t2, s2
                  div          s6, s7, s0
                  c.nop
                  rem          t6, s11, gp
                  c.mv         a7, s1
                  c.xor        a4, a4
                  sra          s2, s5, t1
                  remu         t1, s3, a5
                  c.andi       a3, -1
                  csrrc        s7, 0x340, s9
                  c.xor        a5, a3
                  auipc        t0, 697284
                  lui          t2, 494081
                  xor          t0, s11, t4
                  slt          gp, gp, a6
                  srli         tp, sp, 12
                  c.sub        a3, a4
                  csrrc        zero, 0x340, s2
                  c.slli       t3, 27
                  csrrwi       a5, 0x340, 22
                  c.and        a0, a0
                  ori          a4, t3, -1948
                  lui          ra, 526710
                  c.andi       a5, -1
                  c.addi       s10, -1
                  xor          s6, s6, t0
                  c.slli       t0, 22
                  slli         gp, a6, 1
                  rem          sp, a5, s7
                  nop
                  slti         s7, s10, -1035
                  andi         s0, t4, -1419
                  mulhu        a6, s7, s1
                  mul          s4, zero, t2
                  csrrsi       t1, 0x340, 7
                  xori         tp, s9, -1381
                  xor          a1, a7, t2
                  slt          a5, t1, s7
                  sltiu        s0, s5, -123
                  srai         s2, t2, 16
                  sra          t2, sp, a1
                  sll          a6, sp, s9
                  srl          s10, s6, t1
                  c.sub        s1, a5
                  lui          zero, 439402
                  csrrs        s10, 0x340, gp
                  xori         s7, s4, -224
                  lui          t2, 1035388
                  c.andi       a4, 18
                  srl          s4, a2, t5
                  csrrc        a1, 0x340, s5
                  ori          s1, s0, 599
                  mulhu        t4, t2, a3
                  andi         a3, s10, 1099
                  add          s6, t1, t4
                  csrrc        s0, 0x340, zero
                  lui          a0, 334324
                  add          t3, t5, t0
                  sll          t3, t2, s11
                  c.li         s4, 30
                  sll          t3, t1, t3
                  slli         a2, t2, 11
                  add          a6, t3, a0
                  xori         t4, t1, 1185
                  c.lui        t6, 28
                  c.srai       s1, 15
                  c.or         a3, a3
                  c.li         t0, 15
                  auipc        t0, 148523
                  c.xor        a1, a5
                  c.slli       s1, 1
                  divu         t5, gp, t4
                  sltu         a4, s2, t1
                  rem          a3, a1, t6
                  c.addi4spn   a0, sp, 688
                  slt          a0, zero, s3
                  c.srai       a2, 22
                  xor          sp, s1, t1
                  c.nop
                  ori          t0, sp, -15
                  srl          a7, t5, s9
                  nop
                  rem          a7, s9, t4
                  csrrw        t3, 0x340, gp
                  csrrsi       s5, 0x340, 19
                  sub          s4, t2, sp
                  c.or         s0, a5
                  csrrci       t1, 0x340, 0
                  csrrwi       t2, 0x340, 19
                  srai         t4, t2, 12
                  lui          t4, 913891
                  div          s7, s11, t4
                  remu         s10, tp, t5
                  csrrsi       a0, 0x340, 18
                  c.addi       s7, -1
                  ori          s5, t5, 1598
                  c.mv         tp, t6
                  csrrw        s4, 0x340, t0
                  andi         a0, t2, 263
                  c.and        a2, a4
                  srai         t5, s10, 27
                  mulh         a5, a6, a1
                  add          t4, t4, t2
                  sll          s2, zero, t0
                  divu         s2, sp, ra
                  c.xor        a5, a2
                  mul          s4, t2, t2
                  c.mv         t4, t3
                  mul          a3, s3, zero
                  csrrc        zero, 0x340, zero
                  srl          t5, s0, t6
                  c.srli       a5, 15
                  xor          a7, zero, s1
                  c.add        tp, a0
                  c.addi4spn   s0, sp, 16
                  srl          a2, s10, a5
                  andi         a2, s2, -826
                  div          a2, s0, zero
                  xori         tp, s6, -105
                  c.lui        t0, 29
                  csrrwi       t6, 0x340, 0
                  rem          a3, a2, s9
                  c.lui        a2, 16
                  srli         s7, gp, 24
                  xor          s1, s10, a7
                  slt          t1, tp, sp
                  slti         t0, sp, -831
                  nop
                  or           s2, zero, a7
                  mulhu        t4, s3, s7
                  srl          gp, a4, s9
                  csrrs        a4, 0x340, zero
                  nop
                  c.lui        a6, 25
                  c.and        a2, s1
                  c.mv         a7, s0
                  and          s10, a7, a6
                  add          s6, s3, s5
                  mul          a0, a4, t3
                  auipc        t0, 905565
                  ori          a3, s3, 1855
                  div          s10, tp, a6
                  c.slli       s1, 29
                  slt          a7, s1, a3
                  c.slli       t4, 30
                  csrrsi       a3, 0x340, 16
                  addi         a5, s0, 538
                  c.add        ra, s2
                  slli         a3, s10, 16
                  csrrw        a6, 0x340, a0
                  c.sub        a1, a2
                  divu         s0, a0, s3
                  add          a0, s7, t4
                  andi         t4, s8, 438
                  slli         a0, a0, 3
                  c.addi4spn   s1, sp, 176
                  add          s1, s5, s8
                  divu         t2, a2, s0
                  auipc        t1, 623508
                  c.slli       ra, 17
                  lui          t1, 165439
                  auipc        a0, 237595
                  c.or         s1, a3
                  c.add        t0, s10
                  csrrc        tp, 0x340, a4
                  remu         s7, s4, s4
                  csrrc        a1, 0x340, s1
                  mulhu        a2, t1, a0
                  mul          tp, a0, a0
                  csrrs        ra, 0x340, a3
                  addi         a3, s7, -1279
                  or           a3, t0, s1
                  sra          a0, t3, s2
                  sub          t3, s3, a6
                  rem          zero, t6, s2
                  csrrci       s7, 0x340, 0
                  divu         a4, s11, s8
                  sub          s2, s4, a0
                  c.addi       t1, 30
                  c.addi       ra, -1
                  c.li         s10, 11
                  c.or         a5, a2
                  sub          s1, s1, s5
                  c.or         s0, s0
                  c.addi       s5, -1
                  c.nop
                  c.sub        a1, a0
                  or           ra, a4, s2
                  sltiu        s5, s9, 1349
                  xor          t2, a6, s9
                  auipc        tp, 515671
                  csrrc        s0, 0x340, zero
                  srli         a7, t1, 3
                  slli         a7, tp, 18
                  slli         s5, t5, 5
                  mul          a5, ra, s1
                  c.addi16sp   sp, 416
                  c.mv         tp, sp
                  mulhsu       a7, a1, a6
                  mulhsu       s2, a6, t2
                  sltu         s4, s2, s9
                  mulh         a1, s6, t6
                  sltu         a4, s2, tp
                  sll          s1, s11, t2
                  remu         t1, s4, tp
                  div          a1, a5, a7
                  c.mv         t3, a4
                  slli         t0, gp, 20
                  sra          t2, s5, a0
                  or           s4, t4, s10
                  sub          a2, s0, t2
                  nop
                  mulhsu       a5, t4, t1
                  mulhu        s8, t0, s11
                  c.add        a6, a2
                  mulhu        s5, ra, a0
                  csrrwi       t2, 0x340, 26
                  slt          t1, t5, a5
                  and          s2, a7, gp
                  c.sub        a4, a2
                  c.add        t0, t2
                  csrrsi       s2, 0x340, 15
                  c.andi       s1, -1
                  c.srli       s1, 9
                  rem          t2, s3, ra
                  xor          s10, s6, s5
                  xor          a1, a1, s6
                  xori         t6, t6, -787
                  nop
                  sltu         s4, s9, a4
                  lui          t5, 994970
                  add          t1, t0, t0
                  c.nop
                  andi         a6, a5, -487
                  c.or         s0, a1
                  sltu         t0, gp, s5
                  c.addi       t2, -1
                  c.addi       s0, 15
                  mulh         s4, s11, t4
                  csrrs        t6, 0x340, s3
                  csrrs        zero, 0x340, s7
                  add          a5, t6, s11
                  slt          s7, gp, zero
                  csrrs        s6, 0x340, s0
                  auipc        s10, 485948
                  slt          ra, a2, s5
                  c.addi4spn   s0, sp, 464
                  c.addi4spn   a5, sp, 624
                  and          zero, a6, sp
                  c.mv         s7, sp
                  andi         a2, a1, -1354
                  ori          gp, tp, 377
                  c.sub        a2, a4
                  c.sub        a5, a5
                  remu         t0, t2, s5
                  ori          s6, s3, -584
                  c.slli       a5, 14
                  or           gp, s8, s0
                  sll          s6, t3, gp
                  srli         tp, gp, 9
                  add          a6, s2, s11
                  remu         sp, t3, s3
                  c.or         a1, a4
                  c.and        a0, s1
                  c.lui        s7, 24
                  c.slli       a1, 5
                  remu         a6, sp, t2
                  divu         t1, ra, sp
                  c.srli       a5, 11
                  slti         t1, a4, -1871
                  csrrwi       s4, 0x340, 13
                  csrrsi       t5, 0x340, 26
                  c.nop
                  csrrsi       t4, 0x340, 28
                  c.srai       a0, 21
                  c.srli       a5, 4
                  sll          s6, t1, t2
                  srl          t1, zero, s5
                  divu         s5, s4, tp
                  c.srai       a4, 23
                  csrrc        gp, 0x340, zero
                  c.addi16sp   sp, 64
                  srai         s5, s9, 3
                  and          s1, a6, t1
                  csrrc        s2, 0x340, t3
                  csrrci       t2, 0x340, 0
                  or           ra, s6, t1
                  divu         a7, a4, a2
                  c.addi4spn   s0, sp, 80
                  slt          s0, t5, s3
                  csrrci       a3, 0x340, 0
                  c.addi16sp   sp, -16
                  and          s4, ra, s8
                  c.add        a6, sp
                  c.andi       a2, 3
                  andi         gp, zero, -686
                  c.or         a5, s0
                  csrrci       s4, 0x340, 0
                  addi         s10, a1, 546
                  csrrsi       sp, 0x340, 26
                  auipc        s0, 229009
                  srai         a3, a5, 23
                  lui          s5, 926895
                  srl          ra, tp, tp
                  slti         a7, s4, -589
                  slli         sp, s4, 27
                  c.srai       s1, 11
                  sub          t5, a5, ra
                  andi         sp, a3, -1217
                  andi         t4, t3, -695
                  remu         s6, t4, t4
                  srli         s10, a2, 3
                  add          a4, a2, a2
                  mulh         t0, a4, s10
                  slli         s10, s11, 12
                  lui          a0, 43676
                  c.or         a1, a4
                  csrrs        s4, 0x340, tp
                  srai         s2, sp, 0
                  c.addi16sp   sp, 112
                  slti         a4, s11, 1410
                  addi         a5, s3, 24
                  c.mv         a5, ra
                  csrrw        t0, 0x340, a3
                  lui          t2, 396645
                  and          gp, s6, a4
                  c.nop
                  mulhsu       a2, a4, a0
                  c.sub        a1, s1
                  c.slli       a0, 26
                  and          s7, s1, a5
                  c.srli       a1, 12
                  mulh         s1, a6, gp
                  c.lui        s5, 26
                  lui          sp, 833597
                  xori         t5, s1, -1671
                  c.sub        a1, a5
                  csrrci       s10, 0x340, 25
                  c.nop
                  c.mv         tp, gp
                  and          s0, t2, s6
                  and          a3, t4, s1
                  slti         s7, zero, 319
                  nop
                  srai         t6, gp, 3
                  slti         a5, s9, -921
                  sra          s10, sp, t5
                  c.addi4spn   s0, sp, 192
                  c.or         s0, s0
                  auipc        s0, 572151
                  c.or         a1, a4
                  c.slli       s2, 14
                  mul          a3, s0, s2
                  slli         a4, s7, 23
                  c.sub        a3, a0
                  addi         a4, t4, 1311
                  mulhu        s1, t0, a5
                  sub          a2, a1, s11
                  c.addi4spn   a0, sp, 592
                  mulhu        t3, a4, a0
                  mulhsu       a4, s3, s3
                  c.sub        a2, a4
                  c.addi16sp   sp, -16
                  c.andi       s1, -1
                  c.mv         t1, t4
                  c.add        a3, t3
                  rem          s7, a6, s9
                  remu         gp, s1, t4
                  c.andi       a2, 26
                  c.mv         gp, t3
                  or           a2, s3, s5
                  ori          a1, a5, -1676
                  addi         t6, s8, -711
                  mulhsu       s5, a1, zero
                  div          t0, a6, s10
                  c.srai       a1, 4
                  nop
                  c.srai       s1, 21
                  c.andi       a5, -1
                  sra          t2, zero, s1
                  lui          a6, 1044871
                  slli         s4, a1, 17
                  divu         s10, t2, t5
                  mulhu        sp, s8, s3
                  c.srli       s1, 15
                  rem          s1, a1, s5
                  slt          s0, gp, a4
                  mulh         a4, a7, s4
                  mulh         s1, s1, s2
                  c.addi4spn   a1, sp, 528
                  andi         s4, a1, -1274
                  c.li         t3, 28
                  srl          a7, s1, t4
                  c.mv         s4, a4
                  c.lui        ra, 15
                  or           a7, tp, a2
                  csrrci       zero, 0x340, 4
                  csrrw        a5, 0x340, s0
                  csrrw        s7, 0x340, s10
                  c.lui        s5, 2
                  csrrs        s6, 0x340, s11
                  csrrw        s2, 0x340, s11
                  c.and        a1, a1
                  c.addi       s10, -1
                  auipc        a4, 959279
                  csrrc        s1, 0x340, sp
                  c.lui        s1, 20
                  mulhsu       sp, gp, zero
                  and          s5, zero, gp
                  slli         sp, s2, 30
                  andi         sp, s1, -739
                  c.mv         t4, s2
                  add          gp, zero, a3
                  c.nop
                  c.nop
                  addi         a1, ra, -65
                  auipc        t4, 138980
                  divu         s10, t3, ra
                  divu         a6, a5, a4
                  lui          s6, 40110
                  c.add        a0, a1
                  c.li         s8, -1
                  csrrci       s2, 0x340, 0
                  srli         a7, t1, 25
                  sub          s7, s0, s7
                  add          s8, a6, ra
                  csrrsi       s5, 0x340, 0
                  csrrw        gp, 0x340, a6
                  sltiu        t4, s3, 859
                  mulhsu       s6, s7, a4
                  remu         s4, a3, ra
                  and          t4, a2, s4
                  csrrs        s8, 0x340, s11
                  c.and        a3, a4
                  ori          a0, s9, -654
                  lui          t2, 1000322
                  c.slli       a6, 6
                  or           s10, t1, t3
                  c.add        s5, a3
                  or           a3, t6, s0
                  csrrsi       t3, 0x340, 10
                  c.li         s2, 17
                  remu         ra, a3, s2
                  c.or         s1, a3
                  csrrwi       a4, 0x340, 19
                  slti         s0, a7, -35
                  c.addi4spn   a4, sp, 272
                  c.andi       s0, 12
                  c.srli       a1, 20
                  csrrs        s6, 0x340, zero
                  div          a3, a1, a2
                  c.srai       a2, 6
                  divu         s0, s6, s0
                  c.nop
                  c.srai       a2, 21
                  sub          a1, t2, a4
                  add          s4, s9, tp
                  c.addi4spn   a3, sp, 672
                  auipc        a3, 596668
                  sltiu        a6, t5, 622
                  sra          s7, s6, zero
                  c.addi4spn   a1, sp, 480
                  c.andi       a5, -1
                  addi         ra, a5, 1703
                  andi         s7, a0, 1876
                  csrrc        s5, 0x340, zero
                  sll          gp, a1, s3
                  andi         t0, s8, 942
                  c.addi       a1, -1
                  sra          zero, t5, a4
                  c.srli       s0, 17
                  addi         s10, s4, 307
                  xori         t5, s1, 289
                  rem          a6, tp, s4
                  c.li         a2, 6
                  csrrsi       t6, 0x340, 6
                  c.addi       gp, -1
                  mulhu        a1, ra, a2
                  xori         s2, s1, -421
                  csrrs        a1, 0x340, zero
                  c.addi       gp, -1
                  c.srli       a4, 17
                  c.slli       s10, 3
                  sltiu        s1, s1, -1568
                  or           t1, s3, a0
                  sra          a5, t6, sp
                  csrrsi       s4, 0x340, 16
                  xor          s5, t0, s4
                  sltu         t6, t6, s6
                  csrrc        t5, 0x340, zero
                  sra          t0, a7, s9
                  c.nop
                  sltiu        s0, t4, 1942
                  mul          a4, a0, s2
                  c.xor        s0, a4
                  slli         s2, s4, 1
                  c.addi4spn   a3, sp, 1008
                  csrrsi       s1, 0x340, 9
                  c.nop
                  remu         tp, s11, s10
                  csrrs        zero, 0x340, zero
                  andi         s2, t1, 1306
                  and          a0, s0, s10
                  div          zero, s10, s2
                  nop
                  rem          a6, t3, a5
                  remu         t0, s8, t6
                  c.lui        a0, 10
                  c.mv         t1, s1
                  csrrc        ra, 0x340, zero
                  or           a6, t5, s0
                  slli         t5, t5, 27
                  ori          sp, a2, 1408
                  csrrsi       t0, 0x340, 23
                  sltu         s7, tp, t1
                  csrrw        t2, 0x340, s8
                  mul          a6, tp, t5
                  srl          t1, gp, s8
                  auipc        t2, 397101
                  remu         sp, a2, a4
                  c.addi16sp   sp, -16
                  srl          s1, s11, s2
                  addi         s5, a5, 173
                  srai         s2, s9, 21
                  c.slli       t3, 5
                  xori         s6, a5, 1678
                  sll          t3, t0, s10
                  c.sub        a0, a0
                  mulh         s7, a1, a5
                  nop
                  mul          a0, a2, a3
                  nop
                  sra          a1, s3, sp
                  sll          s10, s3, a4
                  slt          ra, t0, a6
                  c.srli       s0, 25
                  sltu         a3, ra, tp
                  mulh         t5, s7, s5
                  c.and        a3, a0
                  c.xor        a2, a4
                  xori         t5, t2, -333
                  slt          t1, a4, a0
                  xor          s8, s10, a5
                  andi         a5, t1, 1305
                  rem          s7, tp, t1
                  nop
                  add          a1, gp, s1
                  sll          a4, a2, s7
                  div          t6, s1, s8
                  c.slli       t5, 30
                  srai         s5, s4, 31
                  csrrci       ra, 0x340, 0
                  csrrci       a6, 0x340, 0
                  csrrsi       a0, 0x340, 8
                  mulhu        t5, t5, a5
                  mul          s8, s10, sp
                  c.addi4spn   a4, sp, 928
                  csrrsi       tp, 0x340, 0
                  ori          a5, s6, 1238
                  c.sub        a4, a1
                  sll          a6, a6, t2
                  div          t1, a1, t1
                  csrrsi       zero, 0x340, 0
                  csrrc        a0, 0x340, zero
                  csrrwi       zero, 0x340, 31
                  divu         s10, s2, sp
                  sltu         s7, t6, s8
                  divu         s7, t1, zero
                  sub          a5, s0, a3
                  or           s0, a2, s3
                  sub          t6, t5, t1
                  div          tp, gp, s0
                  srai         s7, t3, 21
                  mulhu        tp, sp, a2
                  sltu         t3, s3, sp
                  csrrs        s7, 0x340, s7
                  c.slli       t6, 30
                  mulhsu       s7, t0, t6
                  c.and        a0, s1
                  c.mv         s0, t5
                  sltu         a6, s0, a0
                  sub          s2, a7, t5
                  c.nop
                  div          t4, a3, tp
                  c.or         a1, s1
                  csrrs        s6, 0x340, s11
                  c.mv         t6, t3
                  remu         a2, ra, zero
                  c.li         t6, 6
                  c.sub        a4, s0
                  c.addi       t0, -1
                  nop
                  addi         a3, t3, -471
                  c.li         a5, -1
                  c.srli       a0, 28
                  addi         a0, t2, -122
                  and          sp, s2, s6
                  c.addi4spn   a5, sp, 720
                  mulhu        a0, a0, s9
                  csrrc        s1, 0x340, zero
                  or           ra, ra, a7
                  andi         s10, sp, -1412
                  c.srli       a3, 14
                  srl          s5, s4, s3
                  add          a6, a1, s3
                  divu         t4, s10, s4
                  c.and        a4, s1
                  c.xor        a1, a5
                  rem          s4, a5, a4
                  c.andi       s0, 5
                  mulh         a6, gp, t5
                  c.sub        s0, a5
                  c.addi16sp   sp, 480
                  addi         ra, t6, 1644
                  c.slli       t4, 23
                  csrrc        s7, 0x340, a4
                  csrrc        zero, 0x340, zero
                  slt          ra, s10, s9
                  csrrwi       a3, 0x340, 7
                  xor          gp, ra, a1
                  sub          a0, t2, s2
                  ori          a7, s8, -396
                  c.addi4spn   a4, sp, 144
                  c.li         t6, -1
                  div          s7, a0, a1
                  c.add        a7, a1
                  srai         a7, s11, 27
                  addi         tp, t4, -1727
                  lui          a3, 142155
                  c.lui        t0, 6
                  srai         t2, s7, 10
                  remu         a4, s7, s9
                  mulhsu       t1, s7, s10
                  xor          s2, t6, a1
                  srli         s6, s5, 25
                  csrrci       a5, 0x340, 0
                  c.or         a3, s0
                  sra          s0, a5, zero
                  srai         t6, t5, 2
                  divu         s6, a5, s7
                  c.xor        a1, a3
                  divu         t4, t1, a1
                  c.addi4spn   a0, sp, 32
                  c.srli       s0, 16
                  c.andi       s1, -1
                  csrrc        ra, 0x340, sp
                  and          a7, tp, a3
                  mulh         tp, t6, sp
                  c.lui        tp, 11
                  c.addi4spn   a2, sp, 576
                  c.addi16sp   sp, 480
                  or           s10, t2, sp
                  c.slli       s2, 4
                  andi         t2, zero, 1475
                  c.sub        s0, a3
                  c.srai       a0, 6
                  slli         a6, sp, 26
                  c.and        s1, a5
                  csrrsi       t5, 0x340, 25
                  c.addi       t3, 2
                  remu         s2, t0, s9
                  srai         s10, t5, 16
                  nop
                  sub          zero, t5, t6
                  c.slli       a5, 16
                  srai         s6, s5, 27
                  div          a5, a6, s4
                  srai         s10, s6, 18
                  c.srai       a5, 22
                  rem          s10, zero, t3
                  mulh         a1, s6, s1
                  srai         a1, a0, 20
                  addi         zero, a3, -1289
                  nop
                  csrrci       s4, 0x340, 21
                  slti         t3, ra, -974
                  c.and        a0, a3
                  mulhsu       tp, a4, a4
                  srli         s10, t3, 5
                  slli         t5, ra, 14
                  sll          a6, a7, a6
                  csrrw        a7, 0x340, s6
                  addi         a3, a0, 1379
                  c.addi       t3, 30
                  csrrsi       zero, 0x340, 17
                  c.mv         a7, t3
                  nop
                  c.andi       a4, -1
                  csrrsi       t6, 0x340, 25
                  add          ra, a6, t0
                  xor          t6, zero, a4
                  slli         a5, s3, 12
                  srl          tp, a6, s10
                  sra          t0, s9, t0
                  xori         sp, t0, -1923
                  c.add        a4, t5
                  addi         a7, s8, 1536
                  c.slli       gp, 19
                  c.lui        t6, 30
                  xor          a7, s6, t3
                  c.andi       a5, -1
                  c.srli       s0, 11
                  andi         a3, zero, 507
                  auipc        ra, 836775
                  c.lui        s0, 2
                  sra          a1, zero, sp
                  and          a6, ra, s4
                  and          a7, ra, t3
                  c.li         a2, -1
                  c.and        a5, a2
                  csrrc        t2, 0x340, s5
                  srli         a7, s6, 1
                  andi         a0, s1, 1246
                  mul          s8, a5, s11
                  csrrw        a3, 0x340, s5
                  xor          a2, ra, s0
                  c.andi       s0, 20
                  add          a7, t6, t4
                  csrrci       ra, 0x340, 9
                  c.or         a2, a0
                  srai         s1, s2, 0
                  slt          a0, s0, t4
                  sll          s10, s3, a1
                  csrrwi       s10, 0x340, 13
                  sltu         a6, s5, a6
                  mulhu        s6, a6, s3
                  add          a6, s4, s10
                  csrrs        s8, 0x340, s5
                  sltiu        zero, a6, 1308
                  ori          s10, gp, -749
                  remu         zero, t0, t5
                  ori          a7, ra, 855
                  c.add        t6, s8
                  c.srai       a0, 14
                  and          a4, a7, a4
                  csrrs        sp, 0x340, zero
                  csrrs        s1, 0x340, zero
                  sll          a0, s4, t5
                  c.addi       ra, -1
                  srli         t5, t0, 13
                  csrrs        zero, 0x340, a6
                  andi         a6, a0, 529
                  csrrc        s1, 0x340, zero
                  slti         t3, s3, 146
                  ori          a3, a3, 1635
                  addi         s2, a6, -549
                  slti         t3, t4, -1642
                  c.and        s0, a0
                  slt          s1, zero, s6
                  c.xor        a2, a5
                  csrrs        a1, 0x340, a6
                  c.sub        s1, a2
                  c.nop
                  c.srli       a4, 4
                  mulh         a3, a3, tp
                  c.nop
                  csrrci       a0, 0x340, 24
                  div          s0, s1, t3
                  c.addi       s7, -1
                  slt          t0, ra, s1
                  c.srli       a4, 27
                  c.add        t4, s11
                  c.andi       a1, -1
                  slti         t5, s3, 875
                  remu         a0, gp, s9
                  xori         s1, t5, -1245
                  csrrw        s7, 0x340, s11
                  c.nop
                  sll          s5, s3, s7
                  c.li         s6, 14
                  auipc        t5, 29399
                  c.sub        a0, a1
                  c.mv         a3, t0
                  ori          t5, t5, 850
                  srli         s5, a4, 30
                  mulhu        s10, zero, s5
                  divu         s1, t4, t5
                  andi         a7, s4, 530
                  sub          s2, a3, a4
                  andi         s1, s3, 1381
                  sll          t2, s6, a6
                  divu         a2, s9, s7
                  c.add        s2, t1
                  auipc        zero, 272443
                  csrrs        a7, 0x340, s11
                  sll          a3, t2, zero
                  csrrsi       s4, 0x340, 2
                  csrrwi       a3, 0x340, 26
                  or           a3, s7, s7
                  or           a0, s9, zero
                  andi         a6, sp, 639
                  c.add        s5, a2
                  c.nop
                  sll          s7, s9, s7
                  c.srai       a2, 23
                  c.lui        a2, 12
                  rem          s4, sp, s6
                  c.li         s4, -1
                  or           s10, s6, t1
                  c.addi4spn   a0, sp, 800
                  divu         s0, a6, s8
                  sra          gp, s11, gp
                  c.nop
                  remu         tp, a0, s6
                  sltiu        s7, t4, -745
                  csrrwi       t0, 0x340, 19
                  mul          s5, s1, gp
                  csrrc        s7, 0x340, s1
                  c.nop
                  c.and        s1, a0
                  c.srai       a2, 2
                  mulhsu       a3, ra, sp
                  auipc        gp, 941221
                  c.addi16sp   sp, -16
                  sll          t3, s4, s5
                  sltiu        a5, t2, -255
                  lui          t2, 395857
                  srli         a4, s11, 29
                  c.and        a0, a5
                  slt          t3, ra, a6
                  mulh         tp, s5, s8
                  sll          t0, s0, a3
                  xor          zero, a2, gp
                  c.addi4spn   a3, sp, 304
                  c.or         s1, a2
                  nop
                  divu         s2, s9, a2
                  xor          a0, s9, sp
                  andi         a5, tp, -151
                  add          s1, s3, t0
                  xori         s4, t0, 675
                  xori         a1, s1, 1106
                  c.addi       t3, 26
                  csrrsi       a2, 0x340, 0
                  c.srai       s0, 16
                  slli         t4, s6, 22
                  c.add        s1, sp
                  rem          t3, s1, s8
                  sra          t2, a2, s1
                  csrrs        t2, 0x340, zero
                  c.andi       s0, 18
                  c.addi4spn   a2, sp, 160
                  csrrsi       a5, 0x340, 0
                  sltu         s4, zero, zero
                  c.andi       s1, -1
                  c.andi       a1, 15
                  c.xor        a0, a5
                  rem          t4, ra, s3
                  and          t6, t6, ra
                  c.or         a5, s1
                  csrrs        s7, 0x340, s2
                  add          ra, a1, t4
                  ori          t0, s6, -1456
                  nop
                  divu         tp, t3, s9
                  c.nop
                  c.andi       a2, 30
                  add          a0, a3, t3
                  csrrsi       s6, 0x340, 5
                  c.nop
                  nop
                  c.addi       s0, 14
                  c.andi       a0, -1
                  srai         t4, a6, 8
                  slti         t5, s8, 604
                  mulhu        a0, s1, s4
                  srl          s10, t0, s2
                  mulhu        s1, t1, s7
                  rem          a0, ra, a7
                  c.mv         s2, s9
                  srai         a6, t3, 19
                  andi         s1, s7, -725
                  sub          gp, t3, a0
                  slli         a4, a1, 31
                  mulh         a3, zero, t2
                  divu         a3, zero, s3
                  sltu         a1, s7, s10
                  mul          a0, t0, s8
                  slli         a3, t4, 26
                  c.sub        a2, s1
                  csrrc        a1, 0x340, zero
                  ori          t3, s0, -23
                  srai         a3, t2, 17
                  remu         t0, s10, s8
                  lui          a3, 409121
                  mulhu        ra, t3, s9
                  csrrsi       zero, 0x340, 0
                  ori          s4, a3, 624
                  andi         a3, a0, -1499
                  c.srai       a5, 23
                  c.srli       a2, 22
                  csrrci       t2, 0x340, 29
                  nop
                  srai         s8, s10, 13
                  sra          s2, a7, a3
                  csrrsi       t3, 0x340, 0
                  or           s10, a2, t0
                  remu         s5, t5, t6
                  sub          sp, t0, t2
                  mulhsu       ra, t2, tp
                  csrrw        a4, 0x340, s7
                  mulhu        t4, s10, s7
                  xor          t6, a0, s3
                  ori          ra, tp, -1141
                  srai         a2, t1, 2
                  remu         ra, s1, zero
                  addi         t4, a0, 592
                  c.slli       s7, 17
                  slt          t5, t6, s7
                  c.addi16sp   sp, 320
                  c.add        a1, ra
                  c.addi       a7, -1
                  mulh         t0, a1, a4
                  xor          t0, s8, t4
                  xori         t5, gp, 1436
                  csrrwi       a2, 0x340, 10
                  slli         s10, a6, 30
                  c.addi16sp   sp, -16
                  mulh         s5, s3, t0
                  sub          a0, a6, s3
                  c.li         t0, 20
                  c.or         s0, a5
                  c.and        a1, a2
                  c.nop
                  auipc        t6, 697548
                  add          t5, a0, zero
                  srai         s5, t2, 11
                  mulhu        s7, a4, t2
                  c.add        ra, ra
                  slli         s8, a7, 11
                  rem          s4, gp, s9
                  c.addi       sp, -1
                  c.sub        s0, a3
                  c.addi       a2, 14
                  sll          ra, a5, a6
                  csrrsi       a1, 0x340, 7
                  c.or         a5, a0
                  andi         s5, s1, 271
                  csrrs        a1, 0x340, zero
                  srl          a6, t6, zero
                  csrrs        a1, 0x340, tp
                  mulhu        s4, t0, t6
                  andi         t4, t0, 396
                  c.nop
                  c.or         a1, a4
                  csrrc        s7, 0x340, s8
                  srai         t4, zero, 9
                  div          t3, t4, s11
                  lui          t2, 364250
                  mulhu        t2, t0, s9
                  nop
                  csrrs        s10, 0x340, s1
                  mul          s1, a6, a5
                  csrrc        s6, 0x340, zero
                  sub          t4, t0, gp
                  auipc        gp, 224486
                  lui          a2, 915625
                  c.addi16sp   sp, -16
                  auipc        a2, 902450
                  csrrw        a1, 0x340, t5
                  slt          a4, gp, sp
                  c.addi4spn   a0, sp, 352
                  c.li         a7, 30
                  c.srli       s1, 5
                  slti         s5, s10, 1796
                  auipc        t1, 850108
                  c.or         a0, s1
                  csrrwi       s5, 0x340, 24
                  c.andi       a4, -1
                  srai         t0, s11, 22
                  ori          a6, s10, -1437
                  csrrs        t4, 0x340, zero
                  c.and        a0, s1
                  c.and        a2, a4
                  csrrs        s6, 0x340, s7
                  mulhu        t6, sp, a0
                  c.slli       s10, 31
                  csrrw        s0, 0x340, s3
                  sll          s5, ra, a2
                  c.or         a2, s1
                  or           t0, zero, a5
                  sltiu        ra, a1, 63
                  csrrs        s10, 0x340, zero
                  remu         s7, t5, s5
                  sll          gp, a6, t5
                  sll          s8, s5, s7
                  div          s2, a0, a5
                  add          s0, ra, a1
                  auipc        t2, 772777
                  csrrwi       ra, 0x340, 23
                  auipc        s5, 9438
                  nop
                  c.lui        a0, 27
                  c.slli       s1, 7
                  c.addi4spn   a0, sp, 160
                  add          t0, a0, t3
                  c.srai       a4, 23
                  c.srli       s0, 4
                  auipc        s7, 944504
                  auipc        t1, 360981
                  sra          a4, sp, ra
                  sltu         zero, a2, s0
                  c.and        a2, a1
                  andi         a7, t4, -32
                  csrrw        a5, 0x340, sp
                  c.lui        t4, 8
                  c.add        s5, t6
                  c.srli       a0, 9
                  addi         t1, tp, 412
                  rem          t2, ra, t6
                  addi         a3, s0, -1490
                  c.xor        a4, a1
                  csrrwi       a2, 0x340, 25
                  srli         t4, s6, 26
                  c.add        sp, a3
                  mul          t1, s11, t2
                  slti         a3, a1, 318
                  mul          ra, s11, t6
                  mulhu        t5, ra, s10
                  auipc        ra, 113028
                  addi         t1, t1, -21
                  and          tp, a1, s7
                  slt          s10, s1, t0
                  csrrc        zero, 0x340, ra
                  c.addi16sp   sp, -16
                  c.or         s1, a2
                  c.nop
                  sub          t1, t6, s10
                  c.addi       ra, 6
                  srl          gp, s7, t2
                  mulh         s6, a4, a2
                  lui          s7, 813243
                  srli         s4, t0, 0
                  mulh         s6, s5, t0
                  sra          t1, s1, a4
                  sltu         s1, a4, s8
                  sltiu        s8, a6, 128
                  c.nop
                  nop
                  sltiu        ra, sp, -1457
                  csrrs        a1, 0x340, a4
                  c.mv         s0, s4
                  c.nop
                  mul          tp, s9, t4
                  xori         s10, s10, 1934
                  slt          a4, a0, a0
                  sub          t2, s8, t3
                  xori         zero, a4, 1707
                  mul          zero, a3, a2
                  csrrwi       a2, 0x340, 7
                  c.srai       a0, 19
                  csrrci       ra, 0x340, 1
                  addi         gp, a2, 1963
                  c.xor        a0, s1
                  nop
                  srai         t3, sp, 5
                  csrrw        a1, 0x340, a2
                  lui          s1, 447624
                  c.and        a5, a2
                  remu         s8, s11, t3
                  c.andi       a0, -1
                  c.sub        a1, s1
                  c.li         t6, 9
                  csrrw        gp, 0x340, a6
                  c.and        a4, s0
                  sltu         zero, t0, a0
                  or           s6, s3, s9
                  c.nop
                  andi         s5, a5, 1212
                  xor          ra, s6, sp
                  c.srli       a3, 8
                  and          ra, t4, s2
                  c.li         a5, -1
                  rem          s5, s5, s4
                  sltiu        s6, s10, 18
                  c.addi       a7, -1
                  mulh         s8, t5, s3
                  andi         t0, zero, -397
                  mulhu        ra, sp, s3
                  slt          s0, s1, t4
                  csrrw        a6, 0x340, s1
                  c.li         a1, 0
                  c.lui        t5, 13
                  c.addi4spn   a1, sp, 64
                  rem          t2, s4, s0
                  slti         zero, zero, -1601
                  lui          tp, 343232
                  sltu         ra, s0, t4
                  mul          tp, a2, s5
                  srl          t2, t6, t1
                  srl          t5, zero, t2
                  c.srai       a4, 16
                  add          ra, t3, s0
                  andi         s10, s4, -763
                  mulh         t5, a7, a5
                  remu         s7, ra, s6
                  mulhsu       s10, s6, a6
                  srai         t5, t5, 2
                  mulh         t5, sp, s5
                  sra          s4, s9, ra
                  remu         s1, s10, a1
                  sltu         zero, s0, t2
                  c.addi16sp   sp, -16
                  sll          a2, s6, a6
                  c.add        s2, t1
                  c.addi4spn   a0, sp, 704
                  csrrw        t2, 0x340, tp
                  div          t6, a0, s2
                  rem          t2, s3, a0
                  ori          a6, s10, -526
                  c.li         a7, 8
                  addi         ra, a7, -108
                  slli         t5, a3, 20
                  c.mv         s4, s4
                  auipc        t6, 673593
                  sll          t3, s5, a1
                  csrrwi       s10, 0x340, 10
                  mulhu        t6, t2, zero
                  addi         a3, s7, -1360
                  ori          a7, s0, 1160
                  c.andi       a1, -1
                  srli         a1, s1, 1
                  c.nop
                  slti         t4, a4, 1234
                  c.add        t1, s5
                  or           a5, t1, t5
                  csrrc        s2, 0x340, gp
                  ori          ra, a7, 2033
                  c.addi       s0, -1
                  slt          t0, t2, s2
                  xori         tp, a0, -1552
                  nop
                  mulhsu       s7, a2, s2
                  rem          a1, sp, t5
                  c.addi16sp   sp, -16
                  add          a4, t5, s9
                  remu         s7, s8, a5
                  rem          s7, a3, t5
                  c.nop
                  remu         s2, s0, sp
                  rem          t4, t6, s5
                  csrrci       s0, 0x340, 7
                  csrrci       gp, 0x340, 0
                  csrrsi       s7, 0x340, 0
                  csrrwi       t2, 0x340, 5
                  c.slli       t5, 15
                  srai         tp, sp, 5
                  mulh         sp, s1, ra
                  c.andi       a4, 12
                  mulhu        gp, s2, t3
                  or           a7, a5, t6
                  and          zero, s0, s0
                  srli         zero, zero, 31
                  sltu         a5, a3, s3
                  nop
                  c.li         a4, 28
                  c.sub        a4, a1
                  csrrc        a2, 0x340, zero
                  xori         t6, t4, 1413
                  c.li         a6, -1
                  slli         a3, a0, 14
                  remu         t2, ra, a2
                  csrrwi       t4, 0x340, 26
                  c.lui        a5, 16
                  divu         a0, s2, s5
                  srai         s2, a5, 23
                  and          t6, t1, s5
                  rem          t1, t2, a1
                  srl          ra, t6, t3
                  sll          t4, s3, a4
                  c.or         a4, a1
                  c.addi16sp   sp, 64
                  divu         s6, s0, a2
                  rem          a2, s7, s11
                  c.or         a5, s1
                  xor          s8, t5, a4
                  and          t4, a7, t2
                  sltu         zero, t3, s8
                  c.li         s2, -1
                  sltiu        t3, s1, -106
                  slt          s2, a4, t3
                  nop
                  csrrw        a1, 0x340, gp
                  sra          t0, t3, t0
                  csrrwi       s10, 0x340, 8
                  slti         t3, s8, 330
                  or           gp, s2, t3
                  xor          tp, s4, s10
                  sra          t6, zero, a5
                  c.nop
                  sub          t1, sp, a3
                  csrrw        s6, 0x340, a7
                  mul          ra, a1, t3
                  c.mv         s4, a5
                  or           a4, s8, tp
                  c.li         a2, -1
                  srli         t4, a3, 0
                  srai         a5, sp, 22
                  c.nop
                  c.addi       s8, 4
                  sltiu        tp, ra, 1553
                  c.li         s8, -1
                  div          sp, s11, t2
                  c.srai       s1, 13
                  and          t4, t2, a0
                  auipc        a3, 922709
                  c.xor        s0, a4
                  c.andi       a2, 10
                  srl          t1, gp, t5
                  addi         t3, s1, 1210
                  sll          t2, t0, t3
                  c.lui        s4, 6
                  and          a5, t2, t0
                  slli         gp, zero, 24
                  rem          s0, t5, a0
                  slli         a3, a3, 17
                  csrrc        t5, 0x340, zero
                  xori         s7, s9, 404
                  c.or         a0, a2
                  div          a3, a4, a6
                  xori         s10, tp, -1693
                  div          tp, a1, a6
                  c.addi4spn   a5, sp, 752
                  c.mv         a3, s2
                  c.li         t6, -1
                  slt          s7, a7, t4
                  sra          a7, s5, s8
                  c.nop
                  sra          gp, s6, a0
                  mulhu        t2, s2, zero
                  csrrw        s7, 0x340, s8
                  addi         s0, s7, -333
                  c.mv         sp, s1
                  lui          a1, 819316
                  ori          a5, t2, -1377
                  c.lui        a5, 6
                  srai         gp, s11, 17
                  and          a5, a0, ra
                  sra          t5, a1, t5
                  c.slli       a4, 30
                  slti         a2, s2, 127
                  c.or         s0, a5
                  csrrwi       a0, 0x340, 29
                  c.xor        s1, a3
                  c.and        s0, a5
                  c.srai       s0, 8
                  sra          a1, t2, a4
                  div          a0, s0, a0
                  c.mv         s5, s10
                  remu         t6, s9, a7
                  csrrci       ra, 0x340, 23
                  c.add        a7, gp
                  srai         a1, a3, 17
                  or           t0, a6, s8
                  csrrsi       t4, 0x340, 0
                  sra          s4, a6, s5
                  remu         s6, s11, s2
                  csrrci       s8, 0x340, 0
                  sub          t6, zero, ra
                  sub          t0, a7, s0
                  div          ra, s2, zero
                  c.andi       a2, -1
                  sltiu        a5, s9, 692
                  csrrc        a1, 0x340, s4
                  csrrsi       a5, 0x340, 27
                  csrrsi       s2, 0x340, 2
                  remu         ra, s0, a7
                  srai         a2, s6, 3
                  c.and        a4, s0
                  c.mv         s1, s3
                  c.addi       t2, 25
                  mulh         t5, t0, t2
                  c.nop
                  c.xor        s1, s1
                  sltiu        a1, t1, -608
                  c.and        a1, a1
                  rem          t1, t6, t6
                  c.lui        a3, 21
                  and          t5, s8, sp
                  slti         s6, t5, -407
                  c.sub        a1, a4
                  c.addi4spn   a3, sp, 176
                  ori          a2, a6, -2033
                  csrrwi       a5, 0x340, 4
                  c.add        ra, s10
                  sltu         a7, t1, s5
                  c.srai       a2, 13
                  c.andi       s0, -1
                  c.nop
                  c.slli       a2, 31
                  div          zero, t4, a2
                  c.addi16sp   sp, -16
                  sra          t0, s5, s8
                  lui          a7, 954050
                  sub          t6, ra, zero
                  and          s2, s9, sp
                  c.sub        a1, a5
                  c.mv         s4, a4
                  sub          a3, s2, sp
                  srl          s8, a0, t5
                  c.mv         ra, s9
                  c.andi       s0, 21
                  slli         s5, t3, 4
                  xori         s5, t0, 232
                  nop
                  mulhu        zero, a6, s6
                  c.srai       a2, 4
                  div          s0, s10, a6
                  c.li         a5, -1
                  lui          s8, 754426
                  div          s6, a4, a7
                  c.sub        a1, a4
                  div          t5, zero, t5
                  c.nop
                  ori          a2, t3, 1968
                  addi         a7, t6, 2001
                  slt          s0, s5, sp
                  csrrwi       t5, 0x340, 17
                  mulhsu       a1, s9, t1
                  addi         t6, s7, 182
                  c.srli       a1, 25
                  c.and        a2, a5
                  rem          s0, t6, a0
                  ori          sp, t3, -173
                  c.lui        s8, 11
                  sltu         s8, sp, gp
                  ori          s0, a6, 311
                  csrrw        s4, 0x340, tp
                  mul          a5, a2, a6
                  csrrsi       a7, 0x340, 0
                  remu         s1, ra, a5
                  c.lui        gp, 19
                  csrrsi       t4, 0x340, 0
                  srl          s10, s2, a2
                  sltu         a5, a7, s5
                  srli         t5, s0, 28
                  sltu         s10, s2, s0
                  mulh         t5, s6, s0
                  csrrc        a6, 0x340, s6
                  addi         s7, tp, 1370
                  c.lui        t0, 31
                  or           ra, a1, t6
                  slli         s5, a7, 5
                  c.lui        s5, 17
                  srl          a5, a3, s4
                  xor          t4, s10, a2
                  mulh         ra, gp, zero
                  div          s4, t3, s5
                  remu         s10, sp, ra
                  slti         a1, s0, 1659
                  c.lui        s2, 15
                  c.mv         a4, a2
                  rem          a1, s6, t6
                  c.lui        s5, 9
                  c.nop
                  divu         t2, t5, s11
                  sltiu        s6, s4, 1265
                  c.add        t4, s3
                  slt          a7, a2, t0
                  sltu         t4, a1, t5
                  c.srli       a1, 10
                  srli         s2, s10, 8
                  csrrwi       gp, 0x340, 12
                  sub          a0, ra, s9
                  add          t2, s11, a7
                  remu         t5, t2, s3
                  c.addi16sp   sp, 96
                  srai         s5, a2, 2
                  c.nop
                  ori          t6, s7, 279
                  c.lui        t5, 1
                  mul          t4, s4, t0
                  csrrwi       a6, 0x340, 19
                  csrrci       s7, 0x340, 0
                  c.addi4spn   a0, sp, 864
                  c.andi       s1, 9
                  c.andi       a4, 23
                  c.addi16sp   sp, -16
                  sra          t3, s4, zero
                  c.addi       s6, 19
                  slti         s4, t5, 942
                  c.slli       a5, 6
                  div          t6, t3, a7
                  addi         a7, a3, -588
                  srl          t6, zero, a5
                  c.sub        a0, a2
                  c.xor        a3, a5
                  addi         a6, s5, 1649
                  mulhu        s10, sp, ra
                  lui          s4, 63349
                  addi         s10, a0, -1086
                  lui          a0, 686307
                  c.andi       a1, -1
                  srl          a6, s6, s10
                  auipc        t0, 371369
                  srli         a5, gp, 27
                  c.andi       a1, 18
                  c.srai       a4, 13
                  sltu         s7, gp, a0
                  c.or         a3, a5
                  c.add        gp, a0
                  nop
                  divu         t1, t1, s0
                  lui          t5, 945405
                  mulh         gp, a3, t2
                  sltu         s8, s1, t6
                  c.srli       a5, 21
                  div          tp, s11, a5
                  sltiu        s5, a3, -1887
                  c.addi       s10, -1
                  sltiu        t2, t4, -1739
                  rem          a3, a2, a2
                  slli         a7, s2, 1
                  auipc        t4, 317587
                  csrrw        t3, 0x340, s1
                  c.sub        s0, a2
                  sltu         a2, ra, s2
                  and          t0, t4, t3
                  ori          s10, a7, 1528
                  andi         t6, s11, -1449
                  sll          tp, t3, t0
                  mulhu        t0, t5, a6
                  c.mv         a4, a6
                  nop
                  addi         s7, s8, 1343
                  c.and        a3, a3
                  c.andi       a1, -1
                  c.add        t2, s6
                  slli         s4, ra, 0
                  csrrw        t5, 0x340, s8
                  c.sub        a4, s1
                  c.srai       a2, 16
                  c.srli       a3, 5
                  add          a2, t4, ra
                  srai         zero, a6, 12
                  csrrsi       s6, 0x340, 27
                  srli         t4, t5, 16
                  srai         t0, gp, 16
                  auipc        s6, 656980
                  c.sub        s0, s1
                  mulhsu       sp, s0, a5
                  csrrwi       ra, 0x340, 9
                  remu         t2, s7, s4
                  sltiu        s8, t5, -909
                  div          zero, s4, s11
                  addi         a4, a2, 1001
                  srli         s5, t0, 8
                  sltiu        s0, s6, -867
                  rem          zero, t6, s4
                  csrrs        gp, 0x340, zero
                  srai         t3, t6, 29
                  srl          s7, a2, tp
                  sub          t4, ra, ra
                  nop
                  c.xor        s1, a3
                  c.slli       s6, 21
                  srl          tp, t6, s1
                  mulhsu       s7, s4, s9
                  c.or         a0, s1
                  csrrs        a6, 0x340, zero
                  csrrwi       t3, 0x340, 18
                  xori         a3, t5, 905
                  c.addi4spn   a1, sp, 368
                  c.srli       a0, 11
                  remu         s2, s6, s0
                  addi         a5, t3, -1712
                  csrrwi       s0, 0x340, 9
                  xor          s10, s8, t5
                  c.addi4spn   s1, sp, 528
                  c.lui        s2, 25
                  div          t3, t3, s9
                  csrrw        s6, 0x340, t4
                  c.addi4spn   a0, sp, 528
                  xor          s6, t3, s3
                  c.srli       a0, 3
                  slli         s0, s4, 5
                  srli         s4, t5, 6
                  xor          s2, a5, a4
                  srl          a0, s4, a1
                  auipc        s5, 51617
                  c.or         a0, s1
                  slti         s8, s6, 19
                  sub          s6, s6, s10
                  mulh         gp, t4, s3
                  c.srai       s0, 13
                  addi         t3, a5, 757
                  c.xor        a0, s0
                  andi         s1, t2, -1038
                  and          sp, ra, a2
                  c.srai       a3, 13
                  and          t3, sp, a5
                  slli         a3, zero, 6
                  sltiu        s1, s10, 138
                  remu         s0, gp, a3
                  c.addi4spn   a3, sp, 352
                  c.addi       s8, 4
                  csrrw        s1, 0x340, s6
                  c.andi       s1, -1
                  c.add        t0, t0
                  c.or         s0, a4
                  sra          a4, s9, tp
                  c.addi4spn   a5, sp, 48
                  remu         a4, s6, t5
                  div          t5, t1, t3
                  c.andi       a1, 13
                  sub          zero, t5, s8
                  add          a3, a6, zero
                  addi         s1, s4, -1247
                  c.srli       a4, 22
                  csrrwi       sp, 0x340, 17
                  add          s5, t3, a2
                  c.or         a5, a3
                  slt          s4, s1, a5
                  sltiu        t1, a4, 1068
                  c.sub        s1, s1
                  c.nop
                  or           a7, t6, s8
                  c.nop
                  xori         t0, s11, 728
                  xor          a1, sp, s2
                  mulhu        s4, t2, a7
                  c.nop
                  c.slli       t3, 22
                  csrrwi       a0, 0x340, 24
                  slt          s10, a5, a3
                  addi         a2, tp, -286
                  sltu         a5, sp, s11
                  xori         s2, t0, 1516
                  csrrci       t4, 0x340, 23
                  c.li         tp, -1
                  nop
                  c.addi16sp   sp, -16
                  remu         a5, t0, t3
                  sra          gp, s11, a6
                  c.add        s8, s11
                  slli         t5, a0, 30
                  sltiu        a0, s6, -770
                  sll          a6, a3, t2
                  c.andi       a4, -1
                  srli         t2, s11, 2
                  xor          a6, a6, a0
                  mul          s10, a2, s9
                  div          zero, a2, a4
                  c.add        gp, t5
                  c.srai       a3, 19
                  nop
                  c.addi       s5, -1
                  sltiu        sp, t3, -710
                  srai         sp, s6, 16
                  csrrw        a6, 0x340, s11
                  csrrci       s7, 0x340, 3
                  addi         a5, s0, -332
                  divu         gp, zero, ra
                  mulh         s2, t3, t5
                  csrrwi       t0, 0x340, 22
                  srai         t1, t5, 6
                  mulhsu       t3, s2, s2
                  sll          s4, s10, s5
                  mulh         t5, zero, a1
                  c.lui        s4, 27
                  c.add        t5, t4
                  csrrw        s6, 0x340, t1
                  sltiu        t1, s11, -1238
                  c.add        a3, t3
                  sltiu        gp, s3, 1507
                  c.mv         ra, t5
                  c.and        a1, s0
                  mulh         t4, s0, s5
                  c.slli       gp, 26
                  c.srai       s1, 1
                  auipc        s1, 75795
                  csrrs        s1, 0x340, t2
                  srai         a1, tp, 9
                  mulhu        a2, a7, a3
                  srl          t1, s11, s10
                  c.li         a2, 18
                  csrrc        tp, 0x340, zero
                  mul          s5, zero, tp
                  slt          s4, t0, a7
                  andi         t5, t2, 66
                  divu         tp, s0, a6
                  c.addi4spn   s0, sp, 1008
                  c.srli       a0, 29
                  ori          t2, ra, -553
                  add          t3, t6, a6
                  mulh         a2, s6, s10
                  c.add        t6, a7
                  csrrs        sp, 0x340, zero
                  mulh         ra, t1, a0
                  csrrsi       sp, 0x340, 23
                  or           s6, a1, t2
                  auipc        a1, 379407
                  remu         s2, t1, s1
                  mulhsu       t0, a5, s0
                  mulhsu       t4, s11, zero
                  addi         s1, t5, -1558
                  and          sp, s10, s7
                  c.and        a5, s1
                  c.add        t1, t3
                  xori         a0, s0, -99
                  andi         s2, zero, -774
                  csrrci       s1, 0x340, 0
                  remu         a5, s7, a3
                  sltiu        t1, s9, -124
                  remu         a2, a4, t2
                  mulhsu       a4, s4, a1
                  ori          zero, a7, 28
                  c.srli       a3, 23
                  c.addi16sp   sp, 416
                  slti         gp, t2, -512
                  sra          a2, a4, zero
                  srl          t3, t5, s10
                  addi         t4, t2, -54
                  mulh         tp, a4, t1
                  csrrwi       ra, 0x340, 8
                  c.addi4spn   s1, sp, 976
                  div          t3, s0, s5
                  c.li         a4, -1
                  c.addi16sp   sp, 96
                  mul          s0, sp, t3
                  csrrc        a3, 0x340, zero
                  or           s4, t3, s9
                  c.addi4spn   a2, sp, 96
                  c.li         s1, 22
                  mulh         s5, s9, a0
                  csrrci       a7, 0x340, 0
                  c.lui        a3, 16
                  c.add        a3, a6
                  c.andi       a3, 7
                  c.mv         s10, t5
                  csrrsi       sp, 0x340, 5
                  sltiu        a7, a0, 2024
                  xor          t2, t4, t6
                  c.or         a0, a0
                  lui          s7, 748735
                  sltu         t1, t5, s1
                  c.andi       a2, 3
                  csrrsi       a1, 0x340, 0
                  rem          gp, a5, gp
                  csrrsi       a3, 0x340, 29
                  sll          a0, t5, s8
                  lui          t0, 489423
                  c.srli       a1, 21
                  div          t3, a5, s2
                  remu         a3, t5, a5
                  div          a7, t6, a7
                  c.srai       a4, 27
                  srli         a6, s11, 18
                  csrrwi       s2, 0x340, 31
                  lui          s4, 308383
                  csrrw        s2, 0x340, a4
                  divu         t0, s3, s10
                  sub          a2, s8, t3
                  c.li         gp, 31
                  c.xor        s1, a5
                  andi         s4, sp, -1091
                  csrrw        s0, 0x340, s0
                  c.srli       s1, 6
                  sub          s0, s7, t1
                  nop
                  c.lui        a2, 27
                  xori         zero, s6, -533
                  sub          a3, s10, s7
                  andi         t6, ra, 374
                  c.or         a2, a2
                  c.slli       t1, 5
                  or           t1, sp, a7
                  c.srli       a2, 26
                  c.xor        a1, a1
                  c.srli       a1, 3
                  mulhu        s10, t1, a4
                  divu         t1, a1, a6
                  sltu         t1, s10, s11
                  slt          s2, s11, gp
                  srli         s10, s11, 29
                  srai         a1, s8, 9
                  or           t6, t4, a2
                  c.lui        t4, 1
                  c.and        a3, a3
                  remu         a7, t0, a6
                  c.srai       a2, 11
                  sltu         s1, a5, t6
                  divu         zero, s7, sp
                  mulhsu       t0, t4, t6
                  and          s1, t5, s0
                  div          s6, sp, s1
                  rem          s7, s4, s10
                  srl          s1, t6, a3
                  mulh         a6, s10, a0
                  slti         a4, a1, 1801
                  c.addi       a0, -1
                  sltu         t3, tp, ra
                  c.sub        a3, a3
                  c.xor        a2, a4
                  ori          a3, t6, -870
                  ori          t2, sp, -1990
                  srli         sp, s0, 5
                  lui          a7, 631611
                  c.add        a5, sp
                  addi         t2, s8, 755
                  c.slli       a0, 15
                  csrrci       a5, 0x340, 12
                  c.lui        a2, 30
                  auipc        sp, 845477
                  mulhu        tp, a0, zero
                  and          s4, t4, t0
                  csrrw        a7, 0x340, tp
                  c.add        t3, s8
                  auipc        ra, 325321
                  csrrwi       a0, 0x340, 3
                  sub          tp, zero, tp
                  ori          s6, sp, 1305
                  csrrci       t6, 0x340, 0
                  csrrsi       a5, 0x340, 0
                  csrrc        a6, 0x340, a4
                  srli         s0, s11, 4
                  c.srli       a3, 25
                  and          a5, s8, t4
                  c.addi       ra, 1
                  c.andi       s1, -1
                  c.xor        s1, a1
                  addi         a7, a2, 516
                  c.srli       a5, 11
                  add          t4, s7, s8
                  auipc        s4, 664467
                  xori         s1, s9, 886
                  c.sub        a5, a1
                  sub          t1, a1, tp
                  c.addi       gp, 19
                  sltu         s4, a5, s1
                  add          t1, tp, s9
                  nop
                  csrrwi       a5, 0x340, 12
                  remu         gp, t2, t3
                  sra          t4, t2, t4
                  mul          s8, t2, s11
                  c.addi       t0, -1
                  lui          t4, 252825
                  div          s4, t2, t0
                  sltiu        gp, t4, 1104
                  csrrs        a1, 0x340, zero
                  srl          s6, a6, tp
                  c.srai       a2, 4
                  addi         t5, a4, 167
                  c.srai       s0, 12
                  c.or         a5, a3
                  div          ra, zero, a3
                  addi         a7, s9, 39
                  c.lui        a6, 30
                  c.addi16sp   sp, 176
                  sra          sp, a5, t5
                  c.xor        s1, s1
                  sltu         s10, a1, s8
                  ori          a5, s3, -254
                  xor          gp, s10, t1
                  c.sub        a2, s1
                  div          a5, s8, ra
                  sltu         zero, s11, a2
                  csrrw        ra, 0x340, s10
                  c.addi4spn   s1, sp, 96
                  slt          a0, a5, t6
                  ori          t6, t3, 1
                  xori         a2, sp, -987
                  c.li         tp, -1
                  slli         s2, s5, 19
                  lui          gp, 1009491
                  slt          a6, zero, t5
                  c.and        a0, a1
                  sra          a4, sp, s6
                  lui          a4, 15523
                  or           s5, s6, ra
                  c.mv         tp, t5
                  sra          a1, s5, s10
                  ori          t5, a0, 1820
                  csrrci       s7, 0x340, 0
                  c.addi4spn   a4, sp, 848
                  sltiu        gp, zero, -1405
                  slt          a2, s10, t5
                  srai         a7, a4, 24
                  srl          a1, gp, zero
                  slt          s7, t6, s2
                  sra          a4, a5, s6
                  c.mv         s7, a7
                  sub          t2, s10, s10
                  xor          a1, a2, a0
                  c.add        t1, s3
                  c.add        a5, s10
                  mulh         s7, s11, s5
                  div          s2, a0, ra
                  c.li         t6, -1
                  mulh         sp, s3, t3
                  div          s6, t5, a5
                  nop
                  csrrs        sp, 0x340, t0
                  srai         a7, ra, 29
                  sll          t5, t3, t2
                  c.slli       t5, 20
                  csrrw        tp, 0x340, gp
                  divu         s1, a1, ra
                  mulh         s1, s10, s8
                  div          a2, s3, gp
                  divu         t3, t4, s9
                  sltiu        a6, s5, -735
                  div          s5, s3, gp
                  sll          sp, s4, a3
                  c.srli       s1, 24
                  rem          ra, s0, ra
                  c.addi4spn   a2, sp, 752
                  c.lui        s4, 19
                  c.srai       s1, 1
                  xori         s1, zero, -1771
                  c.addi4spn   a5, sp, 32
                  csrrs        a2, 0x340, a6
                  c.addi16sp   sp, 256
                  remu         t5, s1, t0
                  sltiu        t0, ra, 1722
                  c.xor        a4, a3
                  sltu         s0, s10, a6
                  c.or         a1, s1
                  c.addi       t4, -1
                  c.sub        a1, a3
                  or           gp, s10, a0
                  mulhu        t2, a1, a6
                  c.slli       t6, 27
                  andi         a6, t4, -1872
                  slti         sp, s11, -1703
                  andi         t5, tp, -1497
                  slti         s8, s10, -1726
                  sltu         s5, a4, ra
                  csrrsi       a0, 0x340, 13
                  and          zero, a6, s9
                  mulh         t6, t3, t5
                  sra          t4, t4, sp
                  c.xor        a1, s0
                  add          ra, a6, a5
                  divu         sp, s4, s1
                  sltiu        t6, t2, -716
                  sltu         s0, s2, a1
                  csrrci       s4, 0x340, 0
                  c.and        s0, a3
                  divu         t4, s11, a3
                  csrrc        a1, 0x340, t0
                  andi         gp, ra, 1282
                  c.srli       a5, 11
                  rem          s10, s5, s3
                  c.addi       t1, -1
                  c.lui        a6, 24
                  xori         ra, s5, 638
                  divu         s0, sp, a7
                  lui          s6, 479865
                  c.addi4spn   a5, sp, 160
                  srl          t5, a4, s1
                  csrrc        a4, 0x340, s2
                  and          s8, tp, s7
                  csrrsi       s2, 0x340, 0
                  c.mv         t2, gp
                  remu         t2, t5, a7
                  sltu         s0, s1, a2
                  xori         a1, s9, 1237
                  c.or         s1, a5
                  c.sub        a3, a5
                  c.addi4spn   a5, sp, 960
                  rem          ra, t5, s7
                  and          t1, s2, a1
                  sll          a5, a6, s11
                  slt          zero, a7, s1
                  csrrc        s4, 0x340, s4
                  xori         s0, t4, 1615
                  xori         s2, t6, -1387
                  sll          t4, t2, s8
                  nop
                  sll          a5, a4, a2
                  or           t2, sp, gp
                  c.add        t2, a7
                  andi         s4, t0, -141
                  srai         s1, a4, 23
                  c.addi       tp, -1
                  c.li         s4, 3
                  lui          t6, 347843
                  addi         sp, s5, -897
                  andi         s5, a0, -1367
                  srai         tp, s3, 26
                  auipc        a4, 830286
                  sra          gp, a1, zero
                  remu         zero, tp, s1
                  addi         zero, s7, -1203
                  add          a0, gp, s5
                  csrrci       s2, 0x340, 25
                  ori          ra, t3, -1829
                  c.srli       s0, 1
                  c.xor        a5, a4
                  c.mv         s1, s7
                  divu         t5, gp, s0
                  c.andi       a2, 29
                  c.mv         t4, sp
                  c.addi4spn   a2, sp, 400
                  c.andi       s0, 24
                  or           a6, a4, a5
                  or           gp, a3, s0
                  csrrw        s0, 0x340, gp
                  csrrw        t5, 0x340, a6
                  csrrc        a0, 0x340, gp
                  srli         t5, t1, 12
                  c.slli       a4, 28
                  div          s4, a1, a4
                  lui          zero, 997877
                  csrrci       a7, 0x340, 13
                  c.addi16sp   sp, -16
                  c.addi16sp   sp, 224
                  c.and        a4, s0
                  slli         s7, s7, 30
                  auipc        gp, 925342
                  mul          a7, a0, a7
                  c.srli       s1, 7
                  csrrwi       a7, 0x340, 4
                  c.slli       a2, 9
                  auipc        zero, 91624
                  csrrs        s2, 0x340, s10
                  xori         a3, s5, -955
                  c.add        s1, a6
                  sltiu        zero, s8, 808
                  c.addi4spn   s0, sp, 896
                  mulh         t6, s6, t0
                  c.andi       a0, -1
                  xor          s4, ra, a5
                  c.andi       a0, 27
                  c.andi       s1, 0
                  c.addi4spn   a5, sp, 80
                  c.andi       a1, 30
                  c.sub        s0, a3
                  csrrsi       a6, 0x340, 0
                  divu         a3, gp, zero
                  and          s8, sp, a2
                  c.addi4spn   a0, sp, 384
                  remu         s2, sp, s3
                  auipc        a3, 349619
                  sra          t6, ra, t0
                  csrrs        a1, 0x340, sp
                  lui          ra, 562849
                  rem          s7, s11, t6
                  sltiu        a5, a5, -536
                  srli         t3, a0, 28
                  c.andi       s1, -1
                  divu         tp, t6, tp
                  c.and        a3, s1
                  addi         s0, a4, -890
                  addi         t0, s0, -578
                  c.mv         sp, s3
                  csrrwi       a1, 0x340, 30
                  csrrci       s0, 0x340, 0
                  mulhsu       s0, a4, a6
                  sll          s1, a2, s7
                  slli         zero, s9, 23
                  xor          a3, a6, s0
                  slt          t0, s5, a0
                  csrrc        a4, 0x340, zero
                  divu         a6, s9, gp
                  csrrw        s6, 0x340, a4
                  mulhsu       zero, t4, a7
                  add          sp, s2, s4
                  divu         s7, t6, gp
                  c.add        gp, s7
                  and          s8, tp, t3
                  srl          s6, s8, s4
                  c.srai       s1, 4
                  slti         a3, s5, 1545
                  c.addi4spn   s0, sp, 880
                  xor          s7, t4, a3
                  addi         t3, s0, 1246
                  c.addi16sp   sp, -16
                  srli         s5, t6, 10
                  sltiu        s0, zero, 596
                  srli         s5, tp, 0
                  sltu         sp, sp, s10
                  srai         a0, s1, 16
                  or           s1, a7, s4
                  xor          s5, s0, gp
                  lui          s6, 372029
                  remu         s6, a1, s8
                  div          zero, gp, s9
                  div          t1, t4, s3
                  sltu         t5, s10, s4
                  c.mv         a7, sp
                  c.xor        a3, a5
                  c.srai       a2, 23
                  xori         a5, t1, -1880
                  mul          ra, s3, a2
                  c.addi16sp   sp, 368
                  slt          s7, t4, t0
                  mul          tp, s3, t2
                  sll          t4, tp, a4
                  and          t1, t2, t1
                  srai         tp, s6, 27
                  c.srai       a0, 20
                  lui          s0, 58865
                  c.sub        a5, a2
                  andi         t6, s4, 68
                  sltiu        s4, a0, 452
                  c.lui        s0, 9
                  or           a2, t2, s7
                  lui          ra, 936544
                  c.xor        s1, a2
                  csrrw        s2, 0x340, gp
                  mulhsu       t4, tp, s9
                  c.nop
                  csrrci       s0, 0x340, 15
                  and          t0, sp, s2
                  mulhu        t5, ra, s8
                  c.slli       s4, 23
                  c.or         a1, a0
                  c.xor        a1, a5
                  add          gp, s6, zero
                  slli         tp, a0, 15
                  addi         a2, a2, 1846
                  andi         s4, s5, 400
                  remu         s4, s3, tp
                  c.addi4spn   a1, sp, 496
                  csrrwi       a2, 0x340, 17
                  div          tp, s9, t0
                  c.slli       s1, 26
                  auipc        s5, 766991
                  remu         s5, s8, s9
                  addi         t1, a4, 1027
                  slli         s2, s0, 18
                  c.addi4spn   s0, sp, 1008
                  srli         tp, a4, 22
                  lui          s0, 943872
                  auipc        a5, 226560
                  sltu         a7, s8, t2
                  c.addi4spn   a4, sp, 864
                  c.mv         a2, t5
                  lui          a3, 561002
                  sltiu        t3, s11, 157
                  mulh         a0, s0, t6
                  c.addi4spn   s0, sp, 352
                  mulhu        s6, s6, s10
                  sltu         gp, s2, zero
                  slti         t6, s9, -781
                  c.addi16sp   sp, -16
                  div          a7, a1, s6
                  sltu         a1, a2, t0
                  sub          s5, s8, a0
                  lui          tp, 411904
                  csrrc        ra, 0x340, a3
                  csrrw        a2, 0x340, zero
                  c.li         s0, -1
                  csrrw        a4, 0x340, s11
                  nop
                  c.sub        a4, a0
                  c.add        a5, a3
                  c.and        a4, a3
                  rem          zero, s9, ra
                  lui          a1, 970486
                  c.srli       s0, 12
                  sra          a5, t0, a2
                  remu         a5, s2, t0
                  c.sub        a4, s0
                  slti         s5, s0, -1037
                  mulhsu       t5, t2, s7
                  or           a3, s8, zero
                  csrrw        t3, 0x340, a0
                  ori          t6, s7, 305
                  ori          s2, a7, 1894
                  andi         a1, gp, -1450
                  sub          s0, a5, a7
                  slli         t0, t2, 17
                  c.srai       a0, 6
                  sltiu        tp, t3, -737
                  slt          a6, s2, s2
                  sub          ra, t4, sp
                  divu         a7, s8, s4
                  slt          t1, s7, s5
                  srl          s8, s0, a2
                  srai         s1, s7, 22
                  c.xor        a5, a5
                  csrrci       a0, 0x340, 12
                  and          a4, a2, a2
                  sra          ra, gp, t3
                  c.addi16sp   sp, 64
                  c.or         a3, a5
                  c.mv         t3, s6
                  srai         s7, a5, 21
                  c.xor        a4, s1
                  add          t3, t3, t0
                  andi         ra, zero, 998
                  mulh         a0, a1, t5
                  srl          s10, t6, t1
                  xor          sp, s9, t3
                  c.addi16sp   sp, -16
                  remu         a0, a5, sp
                  c.slli       t5, 17
                  sltu         s1, s6, s4
                  csrrc        s6, 0x340, zero
                  slli         a3, t3, 15
                  divu         s8, t1, a3
                  addi         t0, t5, 2040
                  c.slli       a0, 15
                  slli         a4, t1, 8
                  sra          t0, a4, a3
                  c.mv         s0, a4
                  lui          a4, 530413
                  and          a2, a3, a1
                  andi         s8, t2, -659
                  mulhsu       s6, a3, gp
                  c.or         a1, a2
                  srl          t6, t3, s11
                  andi         s10, tp, -1110
                  addi         s0, zero, 207
                  remu         ra, t6, ra
                  add          a4, gp, s5
                  c.addi16sp   sp, -16
                  sub          a4, s5, s6
                  c.and        a5, a5
                  srai         a7, s9, 8
                  c.srai       s0, 27
                  c.addi       t4, 19
                  sra          a5, t5, s9
                  rem          s7, sp, a6
                  csrrc        t4, 0x340, t6
                  srl          s6, t0, t6
                  xori         s1, s3, 1839
                  and          tp, s3, s0
                  c.lui        t0, 26
                  c.and        a4, a1
                  srl          s7, t3, s10
                  c.addi16sp   sp, -16
                  c.sub        a5, s1
                  c.or         a1, a5
                  srl          s5, s9, t6
                  slli         a0, s4, 31
                  csrrc        s8, 0x340, zero
                  srli         ra, t2, 18
                  rem          t6, s4, t3
                  andi         gp, a5, -1436
                  csrrwi       a4, 0x340, 7
                  srli         a2, s9, 16
                  remu         s0, a2, s3
                  csrrci       s5, 0x340, 26
                  remu         s6, t6, tp
                  csrrwi       s5, 0x340, 17
                  csrrs        s1, 0x340, zero
                  sltiu        s4, s6, -718
                  c.srli       s0, 11
                  csrrs        t1, 0x340, zero
                  sltu         t6, s0, t0
                  c.andi       a5, 11
                  c.andi       a5, -1
                  slli         s5, s2, 22
                  sltu         s0, s2, sp
                  slti         ra, tp, 468
                  csrrci       a0, 0x340, 0
                  srl          t2, s7, a3
                  div          ra, a3, t6
                  xor          a3, a0, s8
                  mulhu        t2, s1, a7
                  slt          t2, tp, t1
                  c.sub        s1, a0
                  slli         sp, tp, 4
                  sltu         s4, a6, s6
                  csrrs        s1, 0x340, a4
                  remu         s7, s8, t5
                  sltiu        a2, s11, -893
                  c.addi4spn   a0, sp, 624
                  auipc        s10, 850880
                  c.sub        a1, s1
                  srai         s2, s9, 11
                  sltiu        t3, s9, -1817
                  c.addi4spn   a4, sp, 688
                  ori          a6, a7, 898
                  slt          tp, t6, t1
                  c.slli       t3, 4
                  or           s4, a1, s8
                  lui          s6, 787746
                  slli         a0, zero, 24
                  c.addi4spn   a2, sp, 384
                  ori          sp, a3, 1718
                  rem          s2, sp, gp
                  lui          a6, 855519
                  csrrs        zero, 0x340, a6
                  c.addi4spn   a4, sp, 48
                  sra          sp, sp, sp
                  or           t0, s3, t5
                  and          a4, t4, a7
                  csrrw        a6, 0x340, s9
                  and          zero, t2, s6
                  srli         t3, s2, 3
                  c.xor        a1, a2
                  c.addi16sp   sp, 416
                  auipc        a5, 1037226
                  c.addi16sp   sp, 144
                  c.xor        s1, s1
                  c.mv         s2, gp
                  slti         a4, s11, 1989
                  c.addi       a0, -1
                  c.srai       a2, 30
                  c.srli       a1, 26
                  csrrci       gp, 0x340, 0
                  nop
                  c.addi16sp   sp, -16
                  csrrw        a4, 0x340, ra
                  mul          s4, t5, t4
                  addi         t5, tp, 1224
                  c.addi4spn   s0, sp, 272
                  auipc        s6, 684816
                  sub          t0, tp, zero
                  c.and        a0, s0
                  nop
                  sll          t5, s11, t5
                  c.sub        s1, a3
                  or           a0, s11, t2
                  mulhsu       t2, s4, s11
                  csrrw        sp, 0x340, t3
                  c.andi       a5, -1
                  csrrwi       s5, 0x340, 1
                  csrrwi       t3, 0x340, 29
                  sltiu        s1, s1, 357
                  srai         a4, s7, 30
                  rem          a0, s5, a0
                  andi         a2, sp, 108
                  mulhu        s4, s10, a7
                  c.sub        a0, a5
                  sltiu        a2, a2, 1738
                  c.addi       t2, -1
                  ori          a0, t6, 1517
                  c.sub        a4, s0
                  mulh         t2, s2, a5
                  lui          a6, 1027398
                  c.srli       a5, 9
                  sltu         t1, t6, a3
                  csrrs        t5, 0x340, zero
                  c.sub        s1, a5
                  c.addi16sp   sp, 496
                  csrrci       a3, 0x340, 0
                  c.or         a1, a5
                  add          a6, t0, s11
                  c.slli       t1, 24
                  csrrw        a6, 0x340, s8
                  c.or         a2, a5
                  lui          gp, 912183
                  csrrsi       s8, 0x340, 21
                  c.add        t2, a3
                  csrrsi       t5, 0x340, 0
                  auipc        s2, 861658
                  addi         s8, t6, 852
                  csrrc        t5, 0x340, zero
                  mul          t6, tp, s9
                  mulhu        a4, zero, s8
                  nop
                  c.andi       s0, -1
                  c.addi4spn   s1, sp, 576
                  c.slli       a6, 8
                  auipc        s7, 981120
                  or           a2, a1, a6
                  c.nop
                  ori          s8, s3, 645
                  csrrwi       t6, 0x340, 22
                  sltu         t3, gp, s1
                  mul          a0, s5, s5
                  sll          ra, s10, ra
                  slti         t0, a3, -1413
                  sll          ra, s3, s7
                  srli         s7, s11, 6
                  sltiu        zero, s1, 1153
                  csrrci       tp, 0x340, 0
                  srl          s1, a4, a1
                  mulhsu       zero, t5, a0
                  slli         t5, a0, 8
                  c.and        a4, a2
                  sltu         s10, a0, a2
                  c.add        a7, gp
                  mulhsu       s6, zero, a7
                  mulhu        t1, t5, s9
                  srli         s6, sp, 24
                  csrrw        s8, 0x340, s8
                  div          a4, s3, a2
                  csrrs        s7, 0x340, a2
                  csrrci       t1, 0x340, 3
                  c.sub        a1, a0
                  srli         t1, s0, 0
                  csrrs        zero, 0x340, a3
                  c.mv         t3, t3
                  and          gp, s4, s1
                  sra          t2, s3, t0
                  slli         s7, zero, 10
                  c.li         ra, 28
                  c.xor        a4, a4
                  c.andi       s1, 23
                  addi         t3, s5, -677
                  mulh         s10, zero, zero
                  csrrc        t5, 0x340, a1
                  rem          gp, s10, a2
                  auipc        t6, 632426
                  c.xor        a5, a1
                  c.addi       a6, -1
                  sra          s4, s8, s7
                  csrrci       s1, 0x340, 0
                  c.slli       a4, 3
                  srl          a0, sp, t6
                  c.addi       s8, 27
                  xori         t6, ra, -1431
                  c.addi16sp   sp, -16
                  and          t0, t2, a2
                  sltiu        s10, s2, 571
                  divu         a5, t0, a2
                  c.xor        a5, s1
                  srl          a2, s11, s6
                  c.slli       t0, 21
                  xor          a3, t5, a1
                  slt          t0, gp, t5
                  c.mv         s2, s4
                  slli         s8, t2, 9
                  mulhsu       t2, s11, s9
                  c.andi       a1, -1
                  c.lui        t0, 24
                  add          s0, s0, t1
                  srl          s10, a0, a4
                  c.sub        a1, s1
                  c.or         a5, s1
                  csrrc        ra, 0x340, t6
                  mulhsu       s2, t1, zero
                  c.addi       a7, 27
                  remu         zero, s9, s10
                  csrrw        t5, 0x340, s10
                  srl          a2, s7, s2
                  c.addi       s6, 11
                  sub          a7, s0, s5
                  c.lui        s10, 22
                  csrrw        t2, 0x340, s0
                  srl          a3, a4, s3
                  or           s7, t0, t4
                  auipc        s2, 1045598
                  csrrsi       t2, 0x340, 17
                  c.and        a0, a3
                  sll          a5, a6, s7
                  csrrwi       a2, 0x340, 5
                  c.add        tp, s5
                  sub          t4, a6, zero
                  c.and        a1, s1
                  xor          t3, tp, s8
                  slti         s10, gp, -1662
                  mulh         s7, t4, s10
                  c.andi       a0, -1
                  slti         t3, s11, -324
                  mulhu        a6, s7, s5
                  c.addi4spn   s0, sp, 416
                  and          ra, s6, t2
                  addi         t4, s0, 745
                  lui          a3, 351513
                  xori         t1, t6, -1254
                  and          a4, s0, s8
                  c.li         t4, -1
                  andi         ra, t5, 1471
                  rem          sp, s4, a2
                  rem          t6, s6, sp
                  mulhu        s7, t0, gp
                  srl          s1, s4, s6
                  srl          s6, t0, a1
                  xor          a6, tp, ra
                  and          a5, t3, t2
                  sltu         t1, gp, s5
                  csrrc        s0, 0x340, a1
                  slti         t1, a6, 734
                  div          s0, ra, t4
                  srli         t2, sp, 5
                  csrrci       ra, 0x340, 0
                  c.srai       a0, 23
                  c.srai       a3, 26
                  mul          s2, s6, t6
                  divu         s8, s4, s6
                  sll          t5, tp, s3
                  nop
                  ori          a5, s11, 871
                  sltiu        a1, s2, -170
                  div          s5, a7, s7
                  csrrw        a5, 0x340, a7
                  or           a4, t0, s7
                  srli         t0, t0, 20
                  csrrs        a2, 0x340, zero
                  or           s8, s11, t4
                  c.srai       a3, 30
                  csrrs        t4, 0x340, zero
                  lui          t3, 451531
                  xori         t3, gp, 851
                  c.andi       a2, -1
                  slli         t0, t6, 13
                  csrrsi       s7, 0x340, 22
                  c.andi       a1, -1
                  srai         s7, t3, 17
                  xori         a3, a4, -1432
                  mulhsu       ra, sp, zero
                  lui          a0, 614572
                  lui          a6, 535944
                  c.addi       s0, -1
                  add          t3, t1, t6
                  c.sub        s1, a0
                  sra          s5, s4, s8
                  sub          s4, s9, tp
                  csrrc        gp, 0x340, zero
                  add          t0, a4, s10
                  c.slli       a4, 27
                  c.srli       a1, 10
                  c.xor        a2, a4
                  c.addi4spn   s0, sp, 384
                  sltu         s4, s6, tp
                  csrrci       t5, 0x340, 0
                  lui          t0, 156338
                  sltiu        s0, t2, -1106
                  c.srli       a0, 31
                  srli         t6, a5, 30
                  slt          s2, s11, a5
                  c.or         a2, s1
                  sra          zero, s3, t5
                  c.and        a4, a0
                  csrrs        t1, 0x340, zero
                  rem          ra, s11, t2
                  c.andi       s0, 24
                  mulh         s10, tp, a7
                  csrrsi       s2, 0x340, 7
                  addi         a2, s0, -1049
                  c.lui        s2, 29
                  c.mv         t5, sp
                  mulhsu       t6, a7, a1
                  andi         s8, s1, -61
                  csrrsi       zero, 0x340, 0
                  auipc        a7, 142741
                  lui          a6, 380539
                  sll          sp, t4, s7
                  csrrw        s5, 0x340, a3
                  c.addi4spn   a1, sp, 992
                  mulhu        a6, a6, s9
                  c.andi       s1, -1
                  csrrwi       a3, 0x340, 22
                  c.lui        a2, 6
                  c.addi       s8, 24
                  and          a5, t1, sp
                  srli         s4, t1, 7
                  c.add        a0, s9
                  srai         gp, sp, 20
                  slt          s0, t5, s8
                  sll          a5, a7, s9
                  c.xor        a5, a3
                  ori          s4, ra, 400
                  c.lui        s0, 14
                  srl          t1, a1, t5
                  slti         t4, t3, -536
                  mulhsu       a0, t5, gp
                  c.srai       a2, 1
                  srai         a3, s1, 3
                  sub          s10, s2, a7
                  addi         s0, a5, 911
                  csrrci       ra, 0x340, 31
                  sltu         a0, t4, a4
                  c.srli       s0, 22
                  sltu         s7, a6, a1
                  sltu         a6, s2, s1
                  c.addi16sp   sp, -16
                  div          tp, a6, s2
                  slt          a6, s5, ra
                  xor          s0, gp, s9
                  mulhsu       gp, s4, t2
                  c.mv         s6, a0
                  srl          zero, t0, sp
                  div          s8, a7, s8
                  c.add        a7, s8
                  c.srai       a1, 25
                  srl          a0, s9, s6
                  c.li         s1, -1
                  c.addi       t2, 30
                  and          s6, zero, zero
                  csrrs        s6, 0x340, a4
                  nop
                  csrrwi       a7, 0x340, 16
                  sub          zero, t2, s3
                  c.srli       s0, 27
                  addi         a7, a7, -924
                  rem          a4, s2, t4
                  c.and        a1, s0
                  mulh         a6, t0, s10
                  srai         ra, a4, 23
                  c.and        s0, a4
                  slt          s8, a7, s2
                  c.nop
                  c.xor        a5, s1
                  remu         t1, s2, s6
                  slli         t4, a2, 27
                  csrrwi       a5, 0x340, 24
                  nop
                  c.add        a6, t4
                  c.srli       a0, 14
                  slli         s6, s9, 6
                  c.addi16sp   sp, 304
                  c.srai       a0, 25
                  xor          a0, a3, t1
                  and          ra, gp, s6
                  and          s7, t2, s9
                  nop
                  c.or         a3, a3
                  slli         a5, t3, 8
                  sra          s2, a1, a5
                  csrrci       t5, 0x340, 0
                  c.sub        a5, a5
                  slti         a1, a0, -377
                  remu         s0, s5, t3
                  srai         s4, s4, 9
                  c.xor        s0, a4
                  nop
                  rem          s6, s7, a5
                  mulhu        zero, s2, s3
                  slt          t4, s7, ra
                  csrrci       sp, 0x340, 11
                  c.addi16sp   sp, -16
                  csrrs        s10, 0x340, s8
                  csrrci       t4, 0x340, 24
                  c.addi16sp   sp, 288
                  ori          s10, s1, 779
                  c.or         a0, a1
                  addi         a2, s8, -1996
                  div          tp, a6, t2
                  sltiu        t5, s6, -1880
                  csrrsi       s5, 0x340, 15
                  csrrw        t5, 0x340, t5
                  c.add        t0, t2
                  xor          s8, ra, a7
                  mulhu        a5, sp, a3
                  srai         t5, s11, 11
                  sll          s1, t1, s2
                  sra          a2, t0, s4
                  add          s8, a7, tp
                  addi         a3, s5, -852
                  slt          s7, s10, t3
                  c.li         s6, -1
                  addi         tp, sp, 1697
                  c.xor        a5, a0
                  srl          s0, tp, t4
                  add          s8, s8, ra
                  lui          s7, 962457
                  lui          t4, 1020444
                  sltu         t0, a4, gp
                  csrrw        a3, 0x340, t2
                  c.xor        a1, s1
                  add          ra, t3, a3
                  mul          t4, a0, t3
                  c.srai       s0, 5
                  csrrc        s2, 0x340, zero
                  add          t5, a4, ra
                  slti         a5, s3, -1110
                  c.mv         s2, s4
                  slti         s8, ra, 1510
                  sra          sp, a5, s7
                  c.sub        s0, a4
                  c.and        a1, a5
                  c.and        a3, s1
                  c.addi16sp   sp, 32
                  srli         a7, s11, 27
                  c.slli       s0, 18
                  c.xor        a0, s1
                  sltu         sp, t6, t5
                  rem          t4, s7, ra
                  c.slli       gp, 18
                  sltu         a5, s8, sp
                  csrrc        s7, 0x340, zero
                  c.addi4spn   a4, sp, 16
                  lui          sp, 594057
                  c.addi16sp   sp, 304
                  c.andi       a3, -1
                  mulh         t0, s10, s5
                  csrrwi       s6, 0x340, 9
                  c.nop
                  rem          t5, t4, t2
                  srai         s0, s10, 21
                  c.add        s8, tp
                  mulhsu       s7, t2, s0
                  srai         t0, ra, 20
                  div          gp, a1, t6
                  sltu         t6, t4, t3
                  c.addi       a1, 7
                  sltu         t6, a7, a5
                  div          s6, s6, s2
                  sra          zero, s9, a2
                  addi         a7, zero, -136
                  div          s10, tp, sp
                  addi         t2, t2, -1822
                  add          t5, s4, t5
                  c.and        a0, s1
                  mulhu        s10, t6, s10
                  ori          t6, t0, 1470
                  c.addi       t2, 22
                  c.nop
                  rem          s7, a7, s3
                  c.addi4spn   a1, sp, 592
                  c.sub        a4, a5
                  sra          t3, s8, s7
                  mul          a3, a5, s11
                  add          s10, s2, a6
                  ori          t2, s7, 819
                  remu         gp, ra, ra
                  c.mv         t5, t6
                  srl          a3, a6, s5
                  srl          a6, ra, a0
                  rem          s6, s9, t5
                  mulh         s2, t2, t2
                  csrrw        t6, 0x340, a5
                  xori         s2, s1, 935
                  mulhsu       a4, s5, s6
                  csrrs        t4, 0x340, t5
                  srai         t3, s7, 21
                  csrrci       s5, 0x340, 4
                  ori          a0, s11, 831
                  c.srli       a3, 5
                  nop
                  c.srai       a1, 17
                  ori          t0, ra, -1951
                  c.addi4spn   a3, sp, 832
                  srl          s0, s6, s4
                  c.sub        a1, s0
                  mulhsu       s0, t2, zero
                  csrrs        a0, 0x340, zero
                  div          sp, t1, s7
                  c.addi16sp   sp, 304
                  auipc        ra, 274196
                  slt          s0, gp, a4
                  sltu         ra, zero, gp
                  c.add        s0, t3
                  c.add        a1, t5
                  csrrw        t1, 0x340, sp
                  auipc        tp, 273833
                  addi         a7, tp, 104
                  slli         a0, t0, 29
                  c.li         s2, 10
                  c.and        a0, s0
                  lui          a7, 1044208
                  sll          gp, a1, t6
                  xor          t2, ra, s5
                  ori          a7, t3, 1795
                  nop
                  xori         gp, s3, -279
                  sub          a3, s0, s7
                  c.addi4spn   a4, sp, 944
                  lui          gp, 139644
                  add          s5, t2, gp
                  csrrw        s0, 0x340, t1
                  c.srli       s1, 26
                  xori         s7, s10, 68
                  c.addi       s4, 3
                  c.addi16sp   sp, -16
                  c.li         s5, 10
                  xor          a0, s6, a0
                  srli         t0, s8, 10
                  c.addi       s6, -1
                  srai         a6, s8, 7
                  srl          a7, sp, s9
                  andi         gp, t0, -1293
                  and          ra, a1, sp
                  csrrw        a0, 0x340, s0
                  slti         a4, s1, -233
                  sltiu        t2, gp, -1684
                  csrrci       s1, 0x340, 19
                  srai         sp, t5, 25
                  srli         t6, t1, 2
                  c.slli       a2, 26
                  c.srai       a0, 24
                  mulhu        t6, t5, t3
                  c.li         s7, -1
                  c.or         a5, a1
                  srli         a6, s2, 29
                  srl          tp, t5, t6
                  or           a2, s1, t5
                  c.andi       a0, -1
                  nop
                  lui          a2, 986607
                  sll          s10, a5, s9
                  andi         t2, s3, 1651
                  c.srai       s0, 26
                  c.addi4spn   a2, sp, 528
                  sra          t6, s5, s0
                  c.xor        a0, a2
                  c.li         t1, 11
                  csrrsi       t2, 0x340, 6
                  c.sub        a0, a2
                  c.addi       t0, -1
                  c.andi       a4, -1
                  csrrs        s2, 0x340, zero
                  csrrwi       t3, 0x340, 22
                  c.nop
                  addi         s2, s1, 72
                  auipc        a0, 912952
                  c.or         a3, a4
                  srl          s2, s8, s6
                  addi         t5, a1, -1600
                  c.add        a5, tp
                  xori         sp, a5, 161
                  sra          t4, sp, ra
                  c.xor        a1, a4
                  xori         ra, s8, -533
                  remu         a5, t4, a1
                  c.srli       a2, 11
                  slti         sp, a7, 1054
                  mulh         s0, s3, a4
                  mulhsu       a4, sp, s5
                  slli         a6, s8, 28
                  slti         tp, s11, 479
                  slt          a7, t2, t6
                  c.srli       s1, 28
                  xori         tp, a2, -1598
                  c.and        a0, s0
                  divu         zero, s11, a4
                  slt          a6, t2, s5
                  or           a1, gp, gp
                  c.srli       s1, 26
                  c.lui        s4, 29
                  div          t3, s0, t1
                  c.sub        a5, s0
                  c.sub        a5, a0
                  c.mv         t1, t3
                  c.addi16sp   sp, 384
                  c.lui        s7, 8
                  c.nop
                  addi         a2, s6, 1610
                  c.addi4spn   a4, sp, 272
                  csrrci       t2, 0x340, 3
                  c.sub        a1, s0
                  csrrsi       s7, 0x340, 0
                  sltiu        sp, a3, 1059
                  sltu         s0, s7, t4
                  csrrci       a1, 0x340, 19
                  c.lui        s6, 8
                  csrrwi       s4, 0x340, 9
                  mul          t3, t1, s2
                  lui          t5, 951203
                  c.or         a1, a2
                  c.or         s1, a1
                  c.sub        a2, a2
                  xor          s8, s3, a3
                  c.mv         t4, s6
                  c.srai       a0, 29
                  div          s4, gp, s8
                  xor          gp, t3, t2
                  csrrci       a0, 0x340, 0
                  c.li         t5, -1
                  c.srai       a0, 5
                  c.and        a3, a2
                  sra          s5, a1, t1
                  div          a7, tp, t4
                  c.slli       tp, 20
                  srl          a7, s0, t3
                  xori         a6, t6, 478
                  srai         a2, zero, 13
                  mulhsu       a6, a5, s4
                  c.sub        a2, a2
                  add          t0, sp, s1
                  c.srli       a0, 5
                  slt          t4, t5, a4
                  c.li         a5, -1
                  mulhu        tp, s0, a5
                  auipc        zero, 366646
                  c.lui        s0, 1
                  slt          t4, s10, s7
                  c.or         a1, s1
                  nop
                  slli         a0, a7, 29
                  c.slli       a2, 2
                  csrrci       s2, 0x340, 21
                  srli         a1, t5, 6
                  remu         a4, t5, s10
                  ori          s0, a4, -2029
                  srli         s2, a0, 20
                  andi         gp, t5, -1597
                  xor          s2, t3, gp
                  c.addi16sp   sp, -16
                  c.lui        a6, 16
                  andi         a6, a1, 76
                  srl          t5, t4, s2
                  and          a0, tp, a4
                  divu         tp, s11, a3
                  andi         t4, zero, 208
                  addi         a7, s11, -135
                  slt          a7, s7, t3
                  addi         s2, a0, -1297
                  c.and        s0, a0
                  sltu         a1, a2, t2
                  divu         a5, s8, t1
                  c.nop
                  remu         tp, a5, s5
                  c.or         a1, a0
                  remu         zero, a2, sp
                  slti         tp, s0, 1895
                  add          ra, t4, a4
                  csrrci       gp, 0x340, 0
                  c.addi16sp   sp, 176
                  remu         s8, t5, s1
                  sll          s4, t4, s7
                  lui          t5, 15806
                  and          a7, s3, s10
                  c.srli       a2, 30
                  or           a6, s9, t0
                  sltu         t5, s9, a5
                  c.xor        a5, a0
                  or           t0, s2, s1
                  csrrci       s10, 0x340, 15
                  and          s5, s9, ra
                  or           t1, s9, a4
                  sra          a3, tp, a2
                  c.mv         s10, sp
                  sltu         s7, s9, s7
                  csrrw        s5, 0x340, s3
                  srai         a6, sp, 22
                  c.li         s7, 4
                  c.add        t3, t4
                  sra          a4, s4, s11
                  csrrsi       t1, 0x340, 29
                  sltu         tp, s6, t2
                  ori          tp, t4, -1445
                  c.sub        a2, a0
                  c.srli       s0, 6
                  srli         a6, s3, 5
                  mul          t2, s4, t5
                  sll          a7, t6, a4
                  c.and        a5, s1
                  add          t1, a1, t0
                  csrrci       tp, 0x340, 0
                  slt          tp, t6, a4
                  csrrci       s6, 0x340, 8
                  nop
                  csrrc        s0, 0x340, a6
                  srl          a0, s2, s6
                  c.or         a2, a1
                  auipc        tp, 272547
                  andi         a5, t2, 330
                  ori          a6, a1, -995
                  csrrw        t4, 0x340, t5
                  andi         zero, a2, -734
                  slt          a4, s10, s8
                  c.add        t6, a1
                  csrrci       sp, 0x340, 0
                  addi         t4, zero, -929
                  mul          gp, a3, s5
                  mulh         a3, s7, gp
                  slti         s1, tp, 1835
                  srli         a7, t0, 6
                  divu         s5, a1, a1
                  c.srai       s0, 24
                  nop
                  c.andi       s0, -1
                  c.add        t1, ra
                  div          t3, s1, s2
                  mulhsu       a0, s7, gp
                  c.mv         s0, a5
                  remu         t3, s11, s3
                  csrrw        s5, 0x340, s2
                  andi         s10, s3, -1588
                  srli         s5, tp, 0
                  slli         s10, t1, 15
                  sll          s1, a5, s0
                  c.xor        s0, s1
                  srai         a0, t5, 25
                  c.srli       a0, 30
                  srli         a6, t1, 25
                  csrrci       a4, 0x340, 6
                  csrrw        a0, 0x340, s3
                  c.addi4spn   a0, sp, 48
                  sltiu        s1, tp, 740
                  sltu         t2, s9, s6
                  sltiu        s10, t6, -1649
                  rem          zero, s0, a7
                  c.srli       a3, 3
                  c.srli       a4, 31
                  c.li         t6, 13
                  sltiu        t2, ra, 1085
                  remu         s0, s11, s9
                  sltiu        t3, s5, -390
                  csrrwi       gp, 0x340, 22
                  srai         s0, t1, 15
                  mulh         t0, a5, gp
                  or           s0, tp, s4
                  csrrci       t0, 0x340, 4
                  slti         a2, t5, 1630
                  mulh         s5, s6, t4
                  mulh         t0, ra, t3
                  nop
                  c.srli       a0, 3
                  c.lui        a7, 8
                  rem          gp, t2, a7
                  remu         tp, a3, a1
                  c.xor        a0, a2
                  or           s1, s0, t4
                  mul          ra, a6, gp
                  c.xor        a2, a5
                  c.nop
                  xori         s7, s11, 1542
                  sll          t2, t5, a5
                  sltiu        s0, s10, -282
                  c.srai       a2, 16
                  andi         t6, gp, -511
                  c.sub        a0, s0
                  sll          t5, tp, s9
                  c.add        t0, t4
                  srl          s10, s2, ra
                  csrrc        a5, 0x340, zero
                  or           s4, t2, a5
                  csrrc        a0, 0x340, zero
                  slti         s5, s1, -1453
                  mulhsu       s4, t2, ra
                  c.srai       s0, 15
                  c.andi       s0, -1
                  slti         s10, s5, -364
                  csrrsi       a0, 0x340, 0
                  csrrsi       t2, 0x340, 0
                  csrrci       gp, 0x340, 8
                  slli         a3, s1, 31
                  slli         t4, t3, 6
                  csrrci       a2, 0x340, 0
                  srl          s4, t6, s1
                  xor          a2, s6, s3
                  srl          a0, s7, s5
                  andi         a1, t2, 1292
                  csrrci       a1, 0x340, 10
                  addi         ra, t1, -1938
                  c.andi       s0, 25
                  c.srli       a2, 28
                  srl          sp, a5, a7
                  c.srai       a2, 6
                  csrrs        s10, 0x340, zero
                  c.addi       t6, -1
                  c.xor        s1, a1
                  or           t0, s3, t0
                  csrrw        a0, 0x340, s8
                  mulhu        s6, s5, gp
                  csrrci       t3, 0x340, 0
                  sra          s5, a7, s1
                  add          t3, t0, t1
                  div          a6, s5, s6
                  srli         s8, t3, 0
                  c.srli       a1, 8
                  andi         s1, s3, -502
                  c.nop
                  divu         a2, s0, s11
                  mul          a0, s0, s9
                  sltu         s6, s11, a6
                  or           t0, zero, s9
                  and          sp, t5, s10
                  slti         a5, a1, -1068
                  add          t3, t5, a6
                  sltiu        s4, s2, 1287
                  csrrs        tp, 0x340, zero
                  mulhu        tp, t0, a2
                  xor          gp, t0, a7
                  c.or         a1, a1
                  div          a1, s5, a5
                  rem          t6, t0, t1
                  sltiu        s6, s11, 566
                  srai         s1, a4, 25
                  slti         s5, s9, -968
                  csrrci       a5, 0x340, 0
                  c.sub        s1, a2
                  andi         a4, s1, -8
                  and          ra, a0, a7
                  sra          s4, t0, ra
                  c.xor        a2, a0
                  sra          t5, t4, t4
                  xor          s1, a6, a6
                  sub          s6, s9, a7
                  csrrc        a7, 0x340, a2
                  csrrw        s2, 0x340, t0
                  add          a4, a4, a1
                  c.or         a2, a3
                  c.andi       a2, -1
                  lui          t1, 471896
                  csrrw        s6, 0x340, a5
                  mulhu        ra, zero, t6
                  srai         t3, t4, 6
                  c.addi       t1, -1
                  c.addi4spn   a1, sp, 1008
                  c.mv         a3, a3
                  ori          t4, s2, 1787
                  c.li         gp, 5
                  c.xor        a0, a2
                  div          s6, tp, a4
                  sra          a3, sp, s7
                  ori          t0, a1, -1875
                  sll          sp, s1, a5
                  srl          s10, a0, s7
                  c.srli       s0, 23
                  c.addi4spn   s0, sp, 336
                  c.andi       a4, 19
                  c.add        a0, s8
                  or           a5, s4, gp
                  nop
                  mulh         t1, a4, s11
                  c.slli       t2, 10
                  xor          s7, s8, s10
                  c.andi       a1, -1
                  andi         s2, gp, -892
                  sub          s1, s1, a0
                  srli         ra, s0, 2
                  addi         s5, s6, -1561
                  csrrsi       s7, 0x340, 0
                  addi         a6, s4, 245
                  addi         a1, gp, 1885
                  auipc        s8, 289367
                  c.nop
                  div          t1, s6, s6
                  andi         a6, a2, -604
                  rem          t0, t3, tp
                  c.sub        s0, a2
                  c.addi16sp   sp, 352
                  and          s6, a7, sp
                  csrrwi       a6, 0x340, 14
                  c.slli       s8, 23
                  nop
                  ori          s6, a4, -411
                  andi         gp, a4, 235
                  c.li         s1, 24
                  and          a7, t5, s4
                  slli         a5, s10, 0
                  add          s6, s9, ra
                  c.xor        a0, a2
                  ori          t0, a5, -112
                  auipc        a5, 144119
                  mulhu        s1, zero, t1
                  c.andi       s0, 8
                  c.addi16sp   sp, -16
                  mulhu        t6, t0, a5
                  c.mv         t6, sp
                  nop
                  xor          zero, t4, s6
                  csrrsi       s7, 0x340, 0
                  csrrsi       s4, 0x340, 0
                  c.and        a2, s1
                  c.addi16sp   sp, 272
                  or           sp, t3, sp
                  or           s10, s1, a7
                  c.add        a7, s11
                  c.xor        a1, a3
                  mulhsu       a3, a3, a7
                  c.or         s1, s1
                  csrrc        s7, 0x340, gp
                  and          tp, a6, a7
                  c.addi16sp   sp, -16
                  csrrci       s2, 0x340, 29
                  add          s4, t1, a7
                  mulhsu       a0, a5, s3
                  csrrw        t3, 0x340, s8
                  xor          a1, a2, ra
                  and          s5, s3, tp
                  c.nop
                  rem          s8, tp, s7
                  slt          t0, a5, a3
                  ori          tp, s4, -1259
                  divu         a2, a5, s3
                  c.addi       s8, -1
                  c.srli       a3, 12
                  div          t0, gp, t4
                  add          s8, t5, s10
                  c.sub        a4, a3
                  xori         t3, sp, 1646
                  csrrsi       a1, 0x340, 0
                  csrrw        t5, 0x340, s6
                  div          t3, t4, s10
                  c.nop
                  sltiu        a4, s3, -1887
                  c.addi       s6, -1
                  sltu         a1, s7, t4
                  div          a4, s7, s4
                  auipc        t0, 42109
                  c.srli       a3, 6
                  xor          t6, a1, a5
                  sltu         t6, zero, s2
                  and          s8, s6, s4
                  csrrs        t0, 0x340, t1
                  c.xor        s1, a2
                  c.lui        s6, 13
                  rem          t5, s1, t5
                  csrrw        tp, 0x340, t2
                  xori         t2, ra, 1635
                  rem          s0, s2, s5
                  auipc        s1, 62015
                  csrrs        s8, 0x340, zero
                  c.andi       s0, 16
                  add          a6, s2, s4
                  c.slli       a0, 22
                  c.mv         s8, s1
                  srl          t0, t1, zero
                  csrrw        s4, 0x340, s3
                  srl          t6, s6, s2
                  or           s10, s8, s1
                  or           s0, ra, t0
                  and          t3, s7, gp
                  c.sub        s0, a5
                  csrrw        t0, 0x340, s2
                  csrrw        s8, 0x340, s1
                  c.lui        a5, 18
                  c.add        a6, t0
                  sub          s8, ra, a6
                  sltiu        s2, s1, 1665
                  andi         a1, s9, 428
                  csrrw        t2, 0x340, a0
                  nop
                  c.nop
                  csrrsi       s10, 0x340, 7
                  ori          s4, a6, 682
                  auipc        t1, 415337
                  c.srai       a4, 18
                  slt          a5, t6, a4
                  csrrwi       a2, 0x340, 26
                  c.addi16sp   sp, 272
                  nop
                  div          t1, s0, t4
                  c.slli       t5, 7
                  mulhsu       a5, zero, s2
                  sll          s10, a6, s1
                  sub          s6, sp, tp
                  c.addi16sp   sp, 16
                  nop
                  divu         s6, t4, t1
                  csrrci       a6, 0x340, 0
                  divu         sp, s2, a5
                  csrrc        gp, 0x340, zero
                  rem          t1, t4, a4
                  c.xor        s0, s0
                  mulhu        zero, a1, s5
                  csrrw        gp, 0x340, tp
                  c.li         gp, -1
                  c.sub        a0, s1
                  div          s2, s4, s10
                  csrrwi       s8, 0x340, 24
                  divu         t5, s5, t3
                  div          sp, tp, sp
                  add          s8, s8, t5
                  c.nop
                  mulh         tp, gp, s2
                  addi         t4, a7, 1246
                  c.or         a3, s0
                  csrrci       a1, 0x340, 0
                  csrrci       s2, 0x340, 0
                  c.sub        s1, a5
                  csrrci       a4, 0x340, 0
                  auipc        s5, 918185
                  add          a3, t0, a7
                  csrrw        t5, 0x340, a2
                  c.addi4spn   s1, sp, 224
                  divu         t1, s2, a2
                  c.nop
                  lui          gp, 766352
                  sll          t2, t6, s1
                  div          a5, t1, s1
                  remu         s10, s0, a2
                  addi         tp, t2, -1828
                  csrrs        a1, 0x340, zero
                  sub          a6, t4, a3
                  c.addi16sp   sp, 48
                  mulh         ra, a5, ra
                  mul          sp, s6, a1
                  div          zero, ra, s5
                  c.andi       a0, -1
                  slti         t1, s4, 1953
                  andi         a4, a2, 82
                  c.lui        a6, 24
                  mulh         s1, a0, zero
                  mulhu        sp, t5, s11
                  lui          a7, 20301
                  c.addi       a0, -1
                  c.mv         a1, s6
                  srli         t0, t2, 4
                  c.addi       s0, -1
                  mulh         s6, t3, a3
                  slt          tp, gp, a2
                  slt          t2, t2, s8
                  slli         s1, a3, 19
                  lui          a5, 286034
                  div          a0, s4, ra
                  mul          s0, a3, t6
                  sub          ra, ra, a7
                  c.add        a6, ra
                  c.li         s5, 2
                  sltu         a6, s2, s3
                  c.or         a1, a5
                  srai         s2, sp, 30
                  srl          sp, t4, a0
                  c.li         s2, -1
                  c.addi16sp   sp, 16
                  mulhu        tp, s9, s6
                  slli         a3, s8, 7
                  mulhsu       a4, a0, s1
                  c.nop
                  slti         t5, a1, 827
                  csrrs        t4, 0x340, zero
                  c.srai       s0, 7
                  slti         s7, ra, 1146
                  csrrci       a3, 0x340, 9
                  lui          s10, 700356
                  addi         s2, sp, -448
                  csrrsi       a4, 0x340, 9
                  xori         a7, a0, 101
                  c.addi16sp   sp, -16
                  add          t4, tp, s8
                  csrrci       t3, 0x340, 0
                  div          a5, t0, ra
                  mul          s4, s10, t3
                  mulh         a3, s8, t5
                  sra          s0, s8, a4
                  csrrci       t2, 0x340, 20
                  mulhsu       a1, t0, s11
                  c.addi16sp   sp, 64
                  slt          a6, s11, t5
                  andi         s5, a5, 1936
                  remu         a7, t0, s5
                  c.andi       s0, 18
                  mul          a2, t1, zero
                  xor          s5, a0, s1
                  mulh         a3, t3, s0
                  csrrc        sp, 0x340, zero
                  c.srli       s1, 22
                  sltiu        a7, t5, 1847
                  c.addi4spn   s0, sp, 336
                  xor          a6, s8, gp
                  ori          s4, t3, 192
                  add          t1, s5, s1
                  sltu         s4, tp, s9
                  c.addi       a7, -1
                  rem          t0, s5, t6
                  div          a1, t4, t1
                  add          s0, s11, t6
                  sltu         a3, a3, a4
                  mulhsu       gp, a5, s10
                  c.lui        s4, 7
                  c.mv         t2, a6
                  div          a0, a2, a3
                  c.and        a0, a3
                  c.nop
                  c.mv         s1, s5
                  srai         zero, t4, 17
                  ori          a6, ra, -548
                  c.andi       a3, -1
                  c.addi4spn   a1, sp, 688
                  c.li         t0, 12
                  xori         s10, s5, 284
                  srl          a3, a3, t0
                  srai         a2, t0, 26
                  csrrc        s7, 0x340, zero
                  c.andi       a1, 22
                  c.addi16sp   sp, -16
                  csrrsi       a7, 0x340, 0
                  xori         a4, s2, 902
                  c.and        a4, a2
                  c.and        s0, a4
                  c.or         a5, s1
                  or           s2, s11, s6
                  and          gp, t4, gp
                  sub          s0, a5, t6
                  sub          s5, s7, tp
                  or           tp, s6, s10
                  c.addi16sp   sp, 32
                  srl          s1, s5, s0
                  lui          a6, 894318
                  slti         t0, s9, -761
                  c.and        s0, a4
                  csrrs        a3, 0x340, zero
                  csrrwi       zero, 0x340, 9
                  and          t4, a4, t1
                  srai         s2, a1, 8
                  c.li         s5, 8
                  div          sp, s3, s9
                  xori         a0, a5, -1937
                  mul          s4, s5, a6
                  addi         sp, s6, 1539
                  c.srli       a1, 11
                  addi         gp, s7, -571
                  lui          a5, 280973
                  csrrci       a0, 0x340, 0
                  nop
                  srai         s2, a3, 11
                  csrrwi       s7, 0x340, 23
                  or           t0, t5, t1
                  c.addi4spn   a2, sp, 32
                  div          a2, s4, a5
                  csrrc        s0, 0x340, zero
                  mulh         t3, a6, s9
                  sub          s0, a0, a4
                  sra          t5, zero, gp
                  ori          s10, a4, -1687
                  add          ra, t4, s8
                  mulh         t3, a2, s10
                  c.andi       s1, -1
                  mulhsu       s0, s2, t3
                  csrrw        t6, 0x340, a3
                  sltu         t4, s3, s5
                  xori         a0, t1, -2047
                  sub          a7, s2, t3
                  divu         sp, s4, s9
                  rem          a1, zero, t1
                  remu         s4, tp, s4
                  xor          a7, s0, t3
                  c.and        a4, a3
                  mulhu        s7, ra, s9
                  rem          s8, t4, t3
                  c.xor        a1, a5
                  and          s0, a4, s6
                  sra          t2, t5, s1
                  c.mv         s2, t4
                  c.srai       a0, 19
                  srl          a5, s3, a7
                  csrrs        t6, 0x340, a0
                  c.srli       a4, 19
                  ori          t1, s11, -431
                  lui          s10, 384788
                  c.lui        s8, 22
                  sll          t1, s1, t0
                  c.srli       a2, 3
                  or           a2, a2, zero
                  slli         s5, s7, 12
                  xor          s7, zero, t5
                  lui          s1, 2060
                  sltiu        s8, s5, -1504
                  sltu         t1, s6, gp
                  c.addi16sp   sp, 432
                  c.and        s0, s1
                  div          a2, s6, a2
                  c.xor        a0, s1
                  c.and        a4, a4
                  csrrwi       t4, 0x340, 0
                  csrrci       zero, 0x340, 11
                  slt          a5, s3, sp
                  addi         a1, s7, 1224
                  slti         ra, a1, 1485
                  mulhu        t0, t5, t1
                  andi         zero, zero, 1994
                  sra          s8, s5, zero
                  div          s1, a6, t1
                  divu         t5, t2, s5
                  csrrwi       t3, 0x340, 31
                  c.or         a0, a4
                  csrrsi       t1, 0x340, 0
                  c.add        s8, a5
                  sll          t5, s5, s4
                  c.or         a3, s1
                  c.srli       a1, 2
                  mulhu        t1, s4, a4
                  csrrs        a4, 0x340, tp
                  mulhu        s1, s5, a5
                  mulh         s0, t6, s1
                  c.li         a2, -1
                  c.addi       a3, -1
                  c.srai       a4, 3
                  csrrw        a4, 0x340, a2
                  mulh         a5, s9, ra
                  div          a2, s4, s7
                  auipc        t1, 1029860
                  c.mv         sp, s10
                  slli         a5, zero, 3
                  nop
                  srai         t2, t0, 23
                  auipc        t3, 497533
                  slli         a0, a6, 4
                  c.mv         s0, a7
                  csrrci       t2, 0x340, 29
                  slt          tp, s11, s1
                  andi         s5, ra, 1419
                  c.or         s0, a2
                  slt          s7, t5, t1
                  mulhu        gp, t3, a4
                  c.xor        a2, a5
                  srli         a4, tp, 18
                  sltiu        a0, a2, -1817
                  slli         a2, t0, 23
                  srli         s4, tp, 25
                  c.andi       a4, 3
                  csrrs        a7, 0x340, t3
                  c.addi16sp   sp, -16
                  xori         tp, t2, -1596
                  nop
                  addi         tp, s0, -1445
                  mulhu        gp, a1, s9
                  slti         t6, t6, -326
                  div          t0, a5, s10
                  c.addi16sp   sp, -16
                  lui          s7, 12138
                  add          a0, s11, s6
                  c.slli       tp, 11
                  c.sub        s0, a1
                  div          s0, a6, t4
                  mulh         tp, t6, tp
                  c.addi4spn   a2, sp, 928
                  csrrs        a1, 0x340, zero
                  c.sub        a5, a1
                  nop
                  lui          s8, 121111
                  sub          t4, a6, s7
                  auipc        a4, 665570
                  div          a1, s10, t1
                  mul          t4, a3, a2
                  csrrci       s8, 0x340, 29
                  slli         sp, s4, 11
                  c.nop
                  c.li         t4, 25
                  c.andi       s0, 26
                  divu         a7, a7, gp
                  c.sub        a1, a2
                  slti         t5, s7, 1948
                  c.slli       a3, 9
                  auipc        s6, 213947
                  c.xor        a5, s0
                  csrrci       zero, 0x340, 0
                  and          t2, tp, s2
                  c.addi       t3, 18
                  c.nop
                  c.nop
                  mul          sp, t2, zero
                  c.andi       a1, -1
                  divu         a7, s0, t5
                  c.andi       a3, -1
                  div          a2, s6, s0
                  c.srli       a5, 23
                  slli         ra, s9, 15
                  c.mv         tp, s4
                  csrrw        a1, 0x340, a0
                  auipc        s4, 510430
                  csrrsi       s0, 0x340, 0
                  sub          s2, t1, a7
                  sll          a6, s1, s5
                  mulh         t5, s7, gp
                  mulh         a4, t3, t2
                  andi         t0, a1, -945
                  nop
                  csrrw        a6, 0x340, ra
                  mul          t4, s6, s0
                  c.nop
                  csrrc        s2, 0x340, zero
                  mulhsu       s7, s8, t2
                  c.add        s10, ra
                  auipc        s6, 177710
                  remu         a1, ra, t1
                  csrrw        t6, 0x340, s6
                  auipc        ra, 497825
                  c.xor        a3, a0
                  lui          t2, 200947
                  sra          t5, tp, tp
                  c.nop
                  andi         s0, a3, -439
                  mulh         ra, zero, a7
                  c.and        a1, a3
                  rem          s10, a1, s9
                  sll          ra, s2, t1
                  csrrw        t4, 0x340, t3
                  srl          s7, zero, s3
                  andi         t1, t6, 404
                  lui          s8, 692757
                  srli         s0, s11, 14
                  c.addi       t6, 11
                  addi         t3, s8, -1846
                  c.li         s6, 0
                  remu         a3, s2, t4
                  c.sub        s0, s0
                  sub          s8, t2, s2
                  rem          t3, s11, t1
                  mul          s10, t0, a2
                  auipc        s1, 898491
                  mul          s10, s3, s0
                  c.addi16sp   sp, 496
                  c.srli       a5, 17
                  mulhsu       s0, zero, t3
                  nop
                  csrrci       t6, 0x340, 1
                  csrrw        gp, 0x340, t2
                  slti         t2, a7, 76
                  slli         s6, a5, 24
                  c.slli       t3, 14
                  mulhu        s0, t5, t3
                  addi         a4, a2, -288
                  slt          s7, s0, s4
                  slti         s1, s3, -1740
                  csrrc        a0, 0x340, s9
                  lui          sp, 917992
                  c.slli       gp, 3
                  c.xor        a1, a3
                  c.srli       a0, 13
                  c.slli       s10, 11
                  c.addi4spn   s0, sp, 48
                  csrrs        t1, 0x340, zero
                  slt          t2, sp, sp
                  sltiu        s6, zero, -892
                  c.and        a0, a0
                  sll          a7, t4, s1
                  or           t4, a1, t1
                  or           s10, a1, s4
                  c.slli       sp, 14
                  csrrs        gp, 0x340, zero
                  addi         s5, sp, 1368
                  addi         s4, s1, 339
                  mulhsu       tp, ra, zero
                  c.add        t0, s7
                  c.nop
                  mul          s8, a4, t0
                  mulh         zero, a3, t1
                  mul          s1, t0, a7
                  rem          a3, s5, t2
                  nop
                  c.xor        s0, a0
                  c.srli       a2, 17
                  andi         s8, t6, -871
                  srli         s4, t6, 10
                  div          a1, s4, s7
                  mulh         a5, a2, t1
                  remu         s2, sp, a4
                  c.mv         s6, a5
                  srli         s5, a7, 22
                  srai         s5, gp, 23
                  csrrc        a4, 0x340, s10
                  c.addi       a3, -1
                  c.mv         t6, a4
                  and          tp, t4, s8
                  c.mv         a1, s8
                  nop
                  remu         gp, s11, a6
                  c.nop
                  sub          ra, t3, a3
                  csrrs        t1, 0x340, t2
                  or           s8, a1, s3
                  c.mv         gp, sp
                  add          t2, s0, t3
                  srli         a3, t0, 22
                  div          s1, s5, gp
                  xor          s4, gp, s7
                  divu         a3, s11, a0
                  sltiu        a7, s5, 486
                  c.xor        a3, a2
                  c.xor        a3, s1
                  c.srli       s0, 24
                  div          a6, s6, t4
                  sltu         zero, t6, a3
                  srli         ra, a4, 23
                  c.lui        t5, 3
                  sra          t2, s4, s7
                  slt          s5, t5, s11
                  csrrs        t0, 0x340, t0
                  lui          ra, 473526
                  sltu         s1, s0, t5
                  sra          s5, tp, t3
                  sra          gp, t4, a6
                  c.lui        s6, 14
                  xor          s6, tp, t1
                  c.lui        a3, 20
                  csrrsi       t1, 0x340, 0
                  c.addi4spn   a1, sp, 960
                  xori         s5, a6, -83
                  mul          t6, t0, t0
                  sub          a3, t0, gp
                  lui          s0, 527232
                  srai         a4, a6, 17
                  sltu         t5, s7, s6
                  c.addi4spn   s0, sp, 192
                  csrrwi       a0, 0x340, 20
                  c.or         a2, s0
                  c.li         a0, 10
                  c.addi4spn   a1, sp, 560
                  srl          gp, t6, s0
                  c.addi       a5, 4
                  c.slli       s1, 9
                  slti         a5, ra, -786
                  c.nop
                  c.xor        a2, a3
                  mulhu        sp, t2, s10
                  c.slli       a3, 11
                  csrrwi       s8, 0x340, 15
                  sltu         t2, tp, t4
                  c.and        a4, s0
                  sra          t4, s6, gp
                  c.sub        a4, a5
                  mulh         t6, a4, gp
                  slt          s4, s7, t2
                  mulhu        zero, a0, s2
                  c.addi4spn   s0, sp, 416
                  srai         t1, s3, 16
                  sltiu        s8, a6, 588
                  c.srli       a2, 7
                  divu         s7, a1, ra
                  addi         a0, zero, 374
                  slli         s7, s3, 24
                  c.slli       a3, 26
                  c.lui        s0, 9
                  sltu         a2, a4, t1
                  c.and        a1, a4
                  xor          a5, a2, s10
                  srli         s7, gp, 2
                  csrrc        a6, 0x340, zero
                  csrrw        a1, 0x340, t6
                  nop
                  c.lui        a1, 16
                  mulh         a4, s10, t1
                  xori         s0, ra, -275
                  add          s2, s8, s5
                  and          s7, t2, s11
                  c.addi16sp   sp, 192
                  c.lui        s7, 7
                  srli         a2, t3, 27
                  c.add        a2, s4
                  sll          s1, t1, a2
                  andi         s4, ra, 795
                  c.andi       a4, 13
                  divu         t5, a5, s6
                  c.xor        a5, a2
                  c.add        t1, ra
                  slti         s7, s0, 1322
                  sra          a1, t5, t3
                  sub          a2, t2, s9
                  c.sub        a4, s0
                  c.mv         t2, a5
                  sltu         t3, s2, t6
                  mulhsu       s0, a4, s0
                  mulhsu       s6, t3, sp
                  rem          a4, zero, s7
                  sub          s8, a0, s2
                  mulhu        tp, gp, ra
                  c.li         sp, -1
                  sltu         s5, t1, t2
                  c.or         a0, a3
                  sub          ra, gp, a1
                  c.lui        t5, 24
                  c.li         a5, 14
                  c.sub        a3, s1
                  c.add        s0, t1
                  c.or         a0, s1
                  c.add        s2, t4
                  c.xor        a0, a1
                  c.addi16sp   sp, 144
                  c.li         s7, -1
                  ori          t5, t3, 1218
                  c.andi       a0, -1
                  c.lui        s0, 28
                  c.lui        t1, 15
                  srl          a6, s9, s2
                  xori         sp, s9, -576
                  mulhsu       s6, s7, t5
                  slt          t3, s6, s5
                  xori         sp, tp, 879
                  slt          a4, s3, s2
                  csrrw        a7, 0x340, a4
                  div          a6, s8, a4
                  c.or         a1, a0
                  c.slli       ra, 22
                  rem          t2, a5, s7
                  c.srli       s1, 16
                  csrrci       s4, 0x340, 0
                  xori         a2, a2, -1263
                  c.andi       a2, -1
                  c.add        s1, gp
                  c.and        a2, a0
                  sltiu        t3, tp, 1120
                  c.sub        s1, a3
                  c.slli       t4, 20
                  sra          s0, t1, s0
                  csrrci       t3, 0x340, 31
                  srai         t3, s7, 29
                  c.li         t2, -1
                  csrrw        a5, 0x340, t0
                  c.mv         t0, t2
                  sub          s7, a4, a7
                  divu         a7, s1, t0
                  sltu         a4, zero, s8
                  srl          a3, t2, t0
                  csrrwi       sp, 0x340, 16
                  nop
                  mul          a7, a3, s8
                  slli         t0, s5, 18
                  slli         s5, a1, 18
                  c.and        a2, s1
                  c.xor        a2, a4
                  c.slli       ra, 10
                  c.sub        a4, s0
                  csrrwi       t2, 0x340, 13
                  or           s5, t4, a4
                  remu         a1, t3, s11
                  c.mv         ra, s11
                  xori         s7, t4, -649
                  c.li         t5, 22
                  div          s5, s11, a1
                  slt          s1, t2, t1
                  rem          t0, a6, gp
                  divu         gp, s8, s0
                  nop
                  srl          s1, gp, s5
                  add          t1, s10, s5
                  csrrc        t1, 0x340, zero
                  c.addi16sp   sp, 496
                  ori          s7, s9, -1185
                  slli         s7, t0, 21
                  nop
                  c.add        t2, t2
                  mulhu        tp, a0, s2
                  addi         ra, a2, 1596
                  c.nop
                  slti         tp, s5, 1168
                  srai         a1, t4, 22
                  c.lui        t6, 22
                  csrrwi       a3, 0x340, 5
                  c.srli       a3, 22
                  ori          s10, t4, 1328
                  srl          s1, t0, s11
                  sltiu        a6, s10, 401
                  sltiu        sp, s2, -1625
                  ori          s10, s0, 148
                  xor          s0, a0, s2
                  auipc        t0, 848178
                  c.and        a5, s0
                  csrrs        s10, 0x340, t2
                  sltu         s2, t2, zero
                  c.addi16sp   sp, 112
                  c.or         a4, a3
                  c.srai       s0, 18
                  slt          t2, s6, a5
                  c.addi       a7, 23
                  c.mv         s10, s11
                  mulhu        s2, s7, a7
                  c.nop
                  csrrc        a4, 0x340, a6
                  c.xor        s0, a1
                  remu         zero, zero, s6
                  and          s6, s7, t3
                  addi         sp, t3, 876
                  mul          tp, tp, s5
                  c.mv         a5, t6
                  c.lui        a0, 27
                  and          a6, s5, t3
                  srl          s0, s5, t1
                  c.xor        a1, a5
                  slli         t2, a4, 20
                  add          zero, s10, t5
                  srl          gp, gp, s8
                  c.and        s1, a2
                  auipc        t3, 71641
                  sltiu        a0, s1, 271
                  mulhu        s5, s10, s9
                  or           ra, s11, a3
                  sltu         s1, s8, t2
                  sub          s6, s0, a1
                  csrrci       s1, 0x340, 0
                  c.or         s0, s0
                  sltiu        t1, ra, 1536
                  csrrw        s1, 0x340, s10
                  c.slli       s6, 25
                  csrrwi       a7, 0x340, 13
                  mulhu        s5, a0, t3
                  csrrci       gp, 0x340, 16
                  c.add        ra, s1
                  slt          t1, s8, t3
                  csrrwi       t3, 0x340, 23
                  sll          sp, ra, t5
                  c.mv         t3, s6
                  csrrs        gp, 0x340, zero
                  csrrw        a7, 0x340, s9
                  csrrsi       a7, 0x340, 0
                  sltu         s4, s3, s7
                  sra          tp, sp, a6
                  slti         t6, s8, 407
                  div          a1, t1, a4
                  sltiu        gp, a1, -475
                  c.srli       s0, 29
                  sltu         a3, s6, s9
                  csrrci       t4, 0x340, 16
                  remu         t4, t0, zero
                  c.xor        a2, s0
                  slli         gp, s5, 30
                  xor          t0, gp, s1
                  or           t2, a6, s5
                  csrrs        sp, 0x340, s11
                  c.srai       a4, 20
                  remu         a1, a4, s10
                  or           a3, a4, s1
                  sll          ra, a6, zero
                  nop
                  csrrwi       ra, 0x340, 13
                  c.or         a1, s1
                  c.add        a5, s1
                  auipc        a4, 374274
                  divu         s7, a6, s0
                  divu         s7, s3, t3
                  and          a2, a3, a7
                  c.sub        a1, a3
                  mulhsu       a7, s5, tp
                  ori          s1, a5, 266
                  lui          ra, 613529
                  ori          s6, s10, 553
                  c.nop
                  c.add        t2, s9
                  c.li         s7, 1
                  srai         ra, s2, 2
                  mul          a4, s10, a4
                  sra          a6, s0, s6
                  csrrw        a6, 0x340, a5
                  c.sub        a0, a3
                  c.li         a6, -1
                  xor          t1, a6, a4
                  remu         t6, t3, t3
                  csrrs        a2, 0x340, zero
                  mulh         a4, s5, s5
                  xor          t1, s2, gp
                  divu         t2, t1, a7
                  c.add        s5, s1
                  andi         zero, s5, 710
                  c.or         s0, a5
                  c.slli       t6, 28
                  c.addi4spn   a1, sp, 624
                  csrrsi       a0, 0x340, 0
                  c.add        t6, t1
                  or           s4, gp, a4
                  c.or         s1, a4
                  csrrs        a4, 0x340, zero
                  c.xor        a4, a1
                  mulhu        s2, s2, t2
                  c.mv         t2, s6
                  c.or         s0, a5
                  addi         gp, s2, 955
                  csrrsi       t6, 0x340, 23
                  auipc        t0, 859417
                  add          t4, a7, tp
                  andi         a5, a7, 84
                  srai         ra, a7, 15
                  mulh         a2, sp, t4
                  c.addi4spn   s0, sp, 864
                  c.addi16sp   sp, 400
                  sll          t1, t2, zero
                  add          a3, tp, s4
                  c.andi       a4, -1
                  c.lui        s4, 21
                  csrrci       a7, 0x340, 1
                  c.nop
                  xori         s2, t3, 307
                  slt          s5, a3, tp
                  c.lui        a7, 27
                  c.or         a2, a5
                  divu         s0, zero, a0
                  csrrs        t0, 0x340, zero
                  c.slli       s4, 22
                  c.lui        ra, 8
                  c.and        s1, s1
                  mulhu        s2, a4, s7
                  c.andi       a4, 29
                  srai         a6, s6, 18
                  xor          a1, zero, a2
                  auipc        s8, 1029397
                  nop
                  divu         t2, s0, s9
                  sltu         t3, a0, t2
                  c.xor        a5, s0
                  c.srai       s1, 28
                  csrrsi       a6, 0x340, 0
                  div          t0, a3, sp
                  srl          a1, s9, s4
                  srl          a3, s3, t4
                  remu         a5, s3, a4
                  sub          s6, a5, s11
                  or           a5, s1, gp
                  nop
                  mul          t5, a5, ra
                  srl          ra, s3, zero
                  addi         a1, a3, -227
                  rem          a3, s10, s3
                  sub          a2, a4, s1
                  mulh         a5, a4, s11
                  c.addi       a1, -1
                  c.addi       s0, 7
                  csrrwi       a7, 0x340, 30
                  sltiu        a2, sp, -1312
                  slti         gp, a6, -1199
                  srai         s1, s6, 18
                  auipc        t4, 65635
                  mul          tp, s7, a1
                  nop
                  csrrs        a0, 0x340, a7
                  c.addi16sp   sp, 128
                  and          s5, gp, a3
                  and          s0, s9, a3
                  c.xor        s1, a1
                  csrrwi       t3, 0x340, 31
                  csrrwi       a7, 0x340, 18
                  c.mv         s5, a3
                  c.slli       gp, 4
                  addi         sp, sp, -751
                  mulhsu       s1, t3, s8
                  c.addi       gp, -1
                  and          a6, t0, a1
                  c.addi4spn   s1, sp, 224
                  c.srli       a4, 13
                  sltiu        a0, s2, 952
                  slli         s1, s11, 19
                  mul          s7, t2, s11
                  and          a2, tp, s9
                  c.or         a5, a5
                  c.li         a6, -1
                  csrrci       a1, 0x340, 0
                  c.andi       s0, 20
                  or           s5, s4, t2
                  c.xor        a0, a3
                  srl          a5, s2, s1
                  div          t2, t0, s2
                  csrrci       sp, 0x340, 0
                  addi         s8, s1, 1747
                  c.li         a0, 11
                  c.and        a2, a3
                  nop
                  c.and        a1, a3
                  and          t5, t2, a2
                  srl          s1, a1, t0
                  csrrc        s10, 0x340, zero
                  lui          s4, 569789
                  c.addi16sp   sp, -16
                  xor          s8, t2, sp
                  csrrc        s10, 0x340, sp
                  c.add        a3, s3
                  rem          a1, t2, a1
                  xor          zero, t1, a5
                  c.srai       s0, 25
                  c.sub        a4, a0
                  ori          s10, s10, 42
                  csrrsi       t1, 0x340, 0
                  csrrsi       t6, 0x340, 31
                  rem          a6, a7, s10
                  c.andi       a4, 9
                  c.lui        s0, 26
                  srai         a2, s1, 15
                  or           gp, t4, tp
                  csrrci       a2, 0x340, 2
                  auipc        t4, 17915
                  nop
                  sltu         a4, gp, a1
                  sltu         zero, s10, a4
                  sltu         a7, s2, s0
                  c.and        a0, a4
                  csrrsi       a0, 0x340, 6
                  c.addi16sp   sp, -16
                  xor          sp, t1, sp
                  c.xor        a0, s0
                  c.addi16sp   sp, -16
                  div          s7, t2, t2
                  c.srai       a2, 18
                  c.add        gp, t4
                  mul          s5, s11, a2
                  c.andi       a4, -1
                  slt          s7, a2, a0
                  rem          a1, a1, s4
                  c.addi       a4, 23
                  xori         s5, a0, -1956
                  addi         s7, t4, -1582
                  srai         s10, t6, 14
                  c.xor        a1, a3
                  csrrs        t4, 0x340, zero
                  c.lui        s6, 8
                  c.andi       a1, -1
                  c.srai       a1, 8
                  slt          a0, tp, s0
                  addi         a1, a7, 740
                  c.sub        s0, a4
                  rem          a4, ra, t6
                  csrrc        s8, 0x340, a4
                  srl          t0, tp, a7
                  sltiu        tp, t6, 1894
                  c.li         sp, 21
                  c.and        a0, a2
                  addi         t5, a5, 1418
                  sltiu        s10, s9, 261
                  mul          s7, a6, t0
                  xor          s7, a3, s5
                  csrrc        gp, 0x340, zero
                  ori          t0, a7, 1354
                  slli         s5, s4, 29
                  c.addi       s7, -1
                  xor          a0, s3, s5
                  csrrc        a2, 0x340, zero
                  sra          s6, s5, t0
                  c.nop
                  sra          s5, s9, t2
                  c.add        t3, tp
                  slli         t1, s2, 3
                  c.addi4spn   a2, sp, 464
                  mulhu        s0, s7, t2
                  c.srai       s0, 8
                  c.mv         a7, t2
                  c.xor        s0, s0
                  nop
                  mul          ra, s0, t5
                  csrrs        a0, 0x340, s4
                  c.sub        a0, s1
                  c.mv         a6, s5
                  c.or         a4, s1
                  c.add        ra, a0
                  mul          s10, s4, a4
                  sltu         a5, a4, a0
                  csrrci       s5, 0x340, 9
                  div          t0, t1, a7
                  srli         tp, s9, 2
                  c.add        tp, a0
                  c.and        a0, a4
                  slti         s6, s9, -412
                  sra          s8, ra, s1
                  xori         t6, s6, -550
                  mulhsu       t2, t5, t3
                  c.srli       s1, 19
                  mul          zero, s1, a6
                  c.addi16sp   sp, -16
                  sll          a7, s3, s0
                  addi         s10, s2, 1577
                  c.addi16sp   sp, -16
                  csrrwi       t4, 0x340, 4
                  lui          s4, 814238
                  mulhu        s8, s7, s11
                  sub          t2, s7, s9
                  srl          t6, t0, gp
                  srl          s4, t5, a5
                  c.addi4spn   a3, sp, 688
                  c.sub        a1, s0
                  csrrw        s6, 0x340, t4
                  c.addi16sp   sp, -16
                  srai         sp, a3, 23
                  c.addi16sp   sp, 480
                  nop
                  addi         s4, s2, 1740
                  c.addi       t6, 27
                  ori          s2, s1, -1766
                  c.or         a4, a2
                  addi         s10, s11, -156
                  slli         a0, t2, 23
                  csrrsi       a6, 0x340, 0
                  sltu         t3, s1, tp
                  mulhu        tp, a4, t2
                  andi         ra, s7, -343
                  csrrci       a7, 0x340, 0
                  divu         s8, t4, s4
                  rem          gp, t5, gp
                  c.addi4spn   a3, sp, 208
                  c.li         t5, 29
                  sra          tp, tp, s3
                  xor          sp, s7, a7
                  mulhu        a5, t5, t1
                  c.nop
                  add          s6, s9, a2
                  c.addi16sp   sp, 272
                  csrrwi       a4, 0x340, 30
                  csrrs        s10, 0x340, t2
                  or           s10, a7, s3
                  sub          t6, s0, tp
                  mulh         s0, a6, a1
                  c.xor        s1, a5
                  andi         t1, t4, 1873
                  xori         gp, s11, 1974
                  div          a0, a5, t3
                  c.li         s5, -1
                  mulhsu       t5, s8, s8
                  divu         t5, a0, s6
                  add          t0, t4, s9
                  ori          s0, a0, -1300
                  c.addi16sp   sp, 496
                  c.lui        a1, 29
                  csrrci       a6, 0x340, 0
                  rem          tp, s8, s5
                  mul          a3, s7, s2
                  c.srai       a3, 1
                  xor          s8, a1, t5
                  c.addi4spn   a5, sp, 16
                  c.sub        s1, s0
                  c.addi       t0, -1
                  c.nop
                  c.or         a3, a1
                  ori          a2, t3, 541
                  and          sp, s7, t0
                  lui          a7, 265262
                  div          t3, t1, s3
                  srli         a2, s11, 13
                  mulhu        t4, a3, s6
                  slti         a4, tp, 1189
                  csrrs        t2, 0x340, zero
                  lui          s10, 304395
                  addi         tp, s1, 388
                  c.addi4spn   a1, sp, 16
                  c.xor        a5, s1
                  xori         t4, s2, 392
                  c.li         s6, -1
                  c.and        a0, s1
                  c.srai       s0, 28
                  andi         s4, t2, 561
                  rem          s0, a1, gp
                  or           t2, s5, s4
                  sltu         s5, a0, t6
                  xori         a4, t6, 260
                  lui          t1, 223821
                  slt          s7, s9, a0
                  c.add        s6, s8
                  csrrwi       a4, 0x340, 15
                  xori         s4, t1, -395
                  lui          s0, 638686
                  c.addi       t0, 27
                  nop
                  sll          s8, a4, s7
                  csrrsi       t2, 0x340, 0
                  c.add        ra, s10
                  addi         a2, a1, 1398
                  srl          a0, s5, a3
                  sltiu        tp, s4, 1630
                  mul          ra, t3, a6
                  c.mv         gp, s3
                  andi         t1, a6, 72
                  csrrwi       t1, 0x340, 11
                  auipc        a3, 626461
                  and          tp, t6, a5
                  sltu         s4, s5, t5
                  c.or         a3, a1
                  div          gp, t3, a6
                  sltiu        s0, s8, 270
                  rem          sp, s3, a4
                  srai         s2, a1, 28
                  div          s2, s9, s11
                  lui          s8, 252783
                  divu         zero, s0, s9
                  c.nop
                  c.mv         s7, s9
                  ori          t0, a5, 945
                  or           t3, t3, a2
                  and          t2, s6, sp
                  lui          a0, 63439
                  c.srai       s0, 26
                  c.xor        a4, a3
                  sub          sp, s3, t6
                  xori         s2, t6, -373
                  c.add        a1, a5
                  c.slli       s6, 20
                  andi         s5, s5, 1973
                  or           gp, t2, a7
                  c.and        a2, s0
                  c.srai       a4, 21
                  divu         t4, t2, a2
                  slli         s1, a4, 14
                  c.li         s8, -1
                  srli         s10, s6, 9
                  c.addi       a2, -1
                  div          s5, s8, t5
                  xor          t2, t2, s5
                  remu         t5, a2, a4
                  sll          a7, t2, s10
                  andi         t3, s6, -597
                  remu         s0, a1, s0
                  csrrwi       a3, 0x340, 5
                  c.mv         s4, t0
                  csrrsi       s2, 0x340, 7
                  csrrc        a7, 0x340, zero
                  sltiu        sp, s7, -1447
                  nop
                  remu         ra, t6, s1
                  slt          a6, t5, a3
                  sll          gp, s7, s1
                  c.xor        a0, a0
                  sltiu        t1, s2, -1146
                  sltiu        a4, t6, -1781
                  c.andi       a2, -1
                  c.mv         sp, t3
                  c.li         a2, 28
                  csrrwi       s8, 0x340, 26
                  slti         a4, a1, -257
                  c.add        s1, a1
                  c.slli       s1, 14
                  c.slli       s4, 3
                  mulh         s1, a7, t3
                  auipc        a5, 613467
                  xor          sp, s6, a5
                  mulhsu       tp, a4, s8
                  and          a5, s2, t2
                  c.mv         s8, s3
                  rem          t1, t3, s5
                  mulhsu       t5, a3, t3
                  c.addi       gp, -1
                  add          a5, tp, a2
                  c.nop
                  rem          s1, s9, ra
                  sra          t4, a3, tp
                  xori         gp, t2, -809
                  c.srai       s1, 17
                  addi         t0, t3, 595
                  c.mv         ra, a0
                  mulh         gp, s8, tp
                  c.srai       a3, 13
                  c.and        s1, a3
                  rem          sp, s2, zero
                  sra          t3, a7, s6
                  c.addi4spn   s1, sp, 416
                  mulhu        a5, t1, a0
                  and          zero, s2, s9
                  andi         tp, ra, 1707
                  sltiu        t1, s5, -1861
                  xori         t6, ra, 410
                  c.andi       a2, -1
                  csrrw        s7, 0x340, t3
                  c.slli       t5, 12
                  c.nop
                  c.nop
                  mulh         sp, s1, s2
                  c.addi       s4, 15
                  slli         a6, s6, 1
                  srai         s1, s4, 1
                  sll          t0, tp, s10
                  c.sub        s1, a0
                  c.addi16sp   sp, 192
                  sltiu        a3, a7, 12
                  sltiu        a5, s1, 1827
                  remu         s10, a3, t1
                  csrrsi       t5, 0x340, 4
                  mul          t0, s3, tp
                  add          t3, a6, t2
                  and          s4, t1, t2
                  rem          a5, ra, s1
                  c.slli       s10, 7
                  auipc        tp, 393420
                  c.srli       a1, 9
                  nop
                  c.srli       a3, 7
                  xor          zero, t6, a1
                  or           t1, t0, t1
                  nop
                  srli         tp, s8, 22
                  c.nop
                  mulhu        a5, a0, s0
                  c.add        a1, t4
                  sltiu        s6, t6, 1200
                  c.addi4spn   a0, sp, 208
                  andi         t2, t0, -1319
                  addi         t5, s10, -1723
                  mulhsu       s2, s3, t4
                  c.addi       s10, 28
                  mul          s6, s9, t5
                  rem          s1, tp, s11
                  slli         t3, ra, 5
                  add          t0, a4, a6
                  c.sub        a1, a0
                  c.addi16sp   sp, 32
                  xor          a7, t5, s1
                  csrrwi       t4, 0x340, 9
                  c.srai       s1, 11
                  c.slli       a2, 23
                  mulh         sp, s0, s0
                  c.xor        a1, a3
                  sra          t2, t2, s2
                  or           a6, ra, t2
                  addi         a2, t3, 1574
                  c.add        s6, a4
                  csrrs        a6, 0x340, s4
                  sub          s10, ra, zero
                  c.or         s0, a0
                  divu         s0, t5, a2
                  xor          s2, t0, a2
                  c.nop
                  csrrw        s8, 0x340, a6
                  c.addi16sp   sp, -16
                  c.srai       a1, 18
                  sub          s7, t2, s3
                  div          a1, a2, s2
                  sub          a7, t3, t6
                  divu         s0, t5, t1
                  c.or         s0, a1
                  c.slli       t5, 29
                  ori          ra, tp, -939
                  divu         sp, a5, a6
                  c.nop
                  csrrs        sp, 0x340, a4
                  and          s0, a4, s10
                  sra          a7, t6, s9
                  remu         t5, a0, s7
                  c.and        s0, a3
                  slt          s0, t4, zero
                  srli         t3, s2, 8
                  c.addi4spn   a0, sp, 656
                  addi         a0, sp, -1485
                  mulh         t5, s5, s5
                  sltiu        s0, a3, 1450
                  csrrci       t5, 0x340, 0
                  csrrs        s6, 0x340, zero
                  srai         a1, tp, 2
                  c.slli       a6, 10
                  c.sub        s0, s1
                  c.li         tp, -1
                  slli         t0, s11, 18
                  lui          a1, 978577
                  c.nop
                  c.xor        a0, a4
                  slt          sp, s11, s1
                  nop
                  xor          a7, t0, s5
                  andi         t3, s9, -1679
                  sll          a4, s11, sp
                  c.or         s0, s1
                  slt          a2, a3, t3
                  add          s1, a0, s6
                  srai         s5, zero, 4
                  slti         gp, a2, -894
                  c.addi16sp   sp, -16
                  div          s5, a0, s2
                  c.li         ra, 25
                  or           tp, ra, a0
                  csrrwi       s6, 0x340, 3
                  mul          s10, t0, s8
                  remu         a3, t6, s0
                  mulh         zero, gp, s5
                  ori          t0, a5, -1268
                  c.lui        s8, 29
                  csrrc        s2, 0x340, zero
                  mulh         a3, t0, t4
                  ori          a5, a3, -96
                  add          sp, s6, gp
                  c.li         s4, 7
                  c.or         a1, a4
                  csrrwi       t0, 0x340, 25
                  srai         zero, t5, 1
                  xori         a5, a3, 1149
                  c.addi4spn   a0, sp, 288
                  mulhu        t1, s3, t2
                  or           s4, t4, a0
                  csrrsi       t6, 0x340, 25
                  div          s1, gp, t0
                  remu         ra, s0, a5
                  c.addi4spn   s0, sp, 944
                  csrrc        s6, 0x340, t6
                  div          gp, s3, a7
                  c.srli       a2, 25
                  and          t2, t3, a5
                  csrrw        s2, 0x340, a3
                  lui          a1, 8518
                  c.nop
                  and          s10, t1, a0
                  c.xor        a1, a5
                  mulh         ra, t2, a0
                  c.nop
                  mulhsu       a7, s0, a0
                  csrrc        s1, 0x340, zero
                  c.andi       a5, -1
                  div          s5, a4, s1
                  or           t5, s10, sp
                  and          s2, s11, t2
                  div          a5, a3, s5
                  srl          s5, sp, a6
                  xor          gp, a2, zero
                  c.sub        a1, s0
                  auipc        a6, 177103
                  and          s5, s5, ra
                  c.and        a1, s0
                  mulh         t2, s7, t0
                  c.mv         t2, s8
                  slli         s8, sp, 28
                  sltiu        t2, s2, -122
                  c.xor        a5, a2
                  c.srli       s1, 16
                  csrrw        zero, 0x340, a7
                  sltu         a6, t3, a4
                  c.andi       a0, 20
                  mulhu        s6, gp, s2
                  csrrsi       t2, 0x340, 5
                  or           a5, a7, a7
                  srl          t4, t3, a4
                  mulhu        s8, a7, tp
                  slli         s2, sp, 20
                  sra          tp, s10, t2
                  csrrs        s4, 0x340, t6
                  c.addi16sp   sp, -16
                  c.addi       s2, -1
                  srli         s0, a7, 0
                  c.xor        a2, a4
                  rem          a7, t3, gp
                  and          a7, s5, s3
                  c.nop
                  sub          s5, a0, s10
                  srl          gp, s7, zero
                  c.slli       a0, 26
                  slli         s4, t5, 22
                  or           a3, t3, s3
                  add          ra, tp, t3
                  csrrc        s8, 0x340, ra
                  mulh         t5, t1, t1
                  auipc        a6, 330448
                  slli         t3, zero, 16
                  add          t0, ra, s1
                  xor          t4, t0, a6
                  slti         a5, t4, -1008
                  mulhsu       a3, t4, a1
                  mulhu        s8, a4, tp
                  c.nop
                  c.srai       a5, 27
                  remu         sp, s6, a1
                  srli         t2, t6, 8
                  add          t0, t6, s4
                  div          s4, a4, s0
                  csrrwi       t5, 0x340, 26
                  xori         sp, a3, -829
                  add          a4, t3, sp
                  nop
                  c.or         s0, a4
                  xori         tp, a6, 1845
                  c.andi       a5, -1
                  c.or         a5, s0
                  sltu         t2, ra, t3
                  csrrw        t6, 0x340, s11
                  srl          a0, tp, gp
                  c.and        a4, a1
                  csrrwi       t0, 0x340, 0
                  slli         a1, t5, 1
                  c.sub        s0, a1
                  add          s10, s10, s7
                  sltu         t5, s6, ra
                  c.addi4spn   a0, sp, 880
                  c.add        t6, t2
                  c.addi4spn   a5, sp, 944
                  csrrci       a2, 0x340, 0
                  lui          t1, 106454
                  c.andi       a1, -1
                  c.andi       a1, 7
                  c.addi4spn   s0, sp, 896
                  c.nop
                  c.add        s5, s9
                  add          s1, s5, a2
                  add          s0, s7, zero
                  mulhu        t1, s9, s0
                  c.srli       a4, 24
                  sll          s10, ra, s9
                  c.addi4spn   a1, sp, 416
                  csrrsi       a7, 0x340, 21
                  c.sub        s1, s1
                  csrrci       s2, 0x340, 0
                  c.lui        a5, 19
                  sub          a5, s10, a7
                  slli         t0, t0, 10
                  c.or         a5, a4
                  xori         a5, a4, -357
                  mulhu        zero, ra, s3
                  and          tp, s2, a0
                  xori         s7, sp, -1906
                  or           gp, s10, s5
                  sltiu        s2, s9, 672
                  sra          s1, t3, t2
                  xori         s2, t5, -702
                  c.addi16sp   sp, -16
                  auipc        s5, 189859
                  nop
                  sltiu        s0, gp, -1307
                  c.li         t0, -1
                  auipc        a5, 802544
                  c.li         t1, -1
                  c.or         a3, a4
                  c.srli       a4, 1
                  c.add        a2, t1
                  xor          s2, s2, t4
                  c.slli       t4, 19
                  csrrs        t4, 0x340, ra
                  c.srli       a3, 5
                  c.srli       s0, 15
                  auipc        a5, 156942
                  c.srli       a3, 20
                  c.slli       s2, 6
                  remu         s6, a0, s2
                  addi         t1, zero, -378
                  c.slli       a0, 7
                  srl          ra, s11, t3
                  ori          a6, sp, -1723
                  mulhsu       t4, s5, s3
                  c.andi       a3, 17
                  c.or         s0, a0
                  addi         s1, a6, 14
                  c.xor        a0, a1
                  xori         zero, t1, 7
                  csrrsi       a4, 0x340, 0
                  and          a7, s11, a3
                  mulhsu       s0, a3, s7
                  remu         sp, s7, t5
                  c.nop
                  c.and        a1, s1
                  c.or         a1, s1
                  mulhu        ra, s8, s2
                  c.andi       s1, 26
                  mulhu        zero, s5, sp
                  csrrs        a3, 0x340, s3
                  c.or         a3, s1
                  and          t0, a6, s7
                  c.sub        s0, a2
                  andi         t0, s10, 1147
                  c.addi16sp   sp, 464
                  srli         t5, a6, 18
                  xor          t6, a7, gp
                  sub          a5, a7, a7
                  csrrw        a4, 0x340, s11
                  c.add        t5, a4
                  add          a6, a0, t6
                  srl          a7, a4, t2
                  csrrs        a4, 0x340, ra
                  srl          a7, a2, t1
                  csrrwi       a5, 0x340, 5
                  ori          s10, s9, -1514
                  mulh         s10, a7, s4
                  csrrwi       a1, 0x340, 11
                  csrrw        t1, 0x340, a7
                  lui          a6, 235852
                  sll          t4, s5, t0
                  srai         a2, t0, 21
                  remu         s0, a5, t2
                  csrrwi       a1, 0x340, 10
                  slti         a6, a4, 1371
                  c.andi       a5, 17
                  or           sp, a0, t0
                  srli         t3, sp, 8
                  c.add        s8, t1
                  auipc        a1, 256962
                  c.lui        s5, 30
                  sra          zero, t0, s2
                  c.addi4spn   a3, sp, 832
                  csrrc        t0, 0x340, gp
                  c.andi       a2, -1
                  lui          zero, 432622
                  c.slli       t3, 25
                  mul          t1, a2, a5
                  csrrw        t0, 0x340, t6
                  mulh         s1, s5, a0
                  csrrwi       t5, 0x340, 18
                  csrrs        ra, 0x340, t6
                  lui          a0, 1039753
                  xori         s10, t3, 483
                  csrrci       s10, 0x340, 0
                  c.li         ra, 18
                  c.add        a1, t4
                  sll          s2, a4, a2
                  c.xor        s0, a4
                  lui          t2, 95250
                  c.slli       t1, 9
                  or           s0, a0, s9
                  c.add        s0, a3
                  mulh         tp, t2, a0
                  addi         sp, ra, 1990
                  add          t2, a7, s11
                  div          a6, s2, a1
                  c.or         a1, s1
                  c.mv         s0, t3
                  ori          a5, t3, -1124
                  andi         s5, s9, -1987
                  c.addi16sp   sp, 336
                  remu         a0, s1, a6
                  div          a4, s11, a4
                  c.andi       a0, 3
                  c.and        a4, a2
                  csrrw        s0, 0x340, a1
                  c.andi       s1, -1
                  c.add        t5, t4
                  ori          s0, a4, -1989
                  mulh         a5, a4, s2
                  c.xor        a2, a1
                  c.lui        a1, 8
                  c.andi       a5, -1
                  csrrs        s1, 0x340, a0
                  slti         s2, a7, -942
                  c.andi       s1, -1
                  slt          zero, a2, t1
                  slti         t1, ra, -94
                  c.addi       t5, 19
                  c.srai       s1, 23
                  sub          t1, a0, gp
                  mul          s7, tp, a0
                  rem          s0, tp, t6
                  csrrw        s0, 0x340, s9
                  or           s0, a2, t5
                  sltiu        t3, s1, 1788
                  remu         t1, s5, s10
                  and          s6, a5, s11
                  c.slli       t1, 5
                  csrrs        s5, 0x340, zero
                  c.srli       a5, 16
                  c.or         a1, a1
                  srai         zero, a2, 9
                  c.addi4spn   a3, sp, 736
                  or           t2, s8, a4
                  c.li         tp, -1
                  auipc        t4, 618886
                  c.xor        a5, s1
                  c.srli       a2, 1
                  ori          t3, s8, -887
                  c.sub        a2, a2
                  csrrsi       sp, 0x340, 18
                  c.xor        a0, s1
                  slti         sp, s11, 1846
                  sub          s10, s0, sp
                  slli         t2, a0, 9
                  c.li         tp, -1
                  csrrw        a4, 0x340, t0
                  nop
                  csrrs        a1, 0x340, zero
                  sltu         t6, zero, s3
                  slli         s4, ra, 16
                  addi         t5, t2, -547
                  c.xor        a3, a4
                  nop
                  c.add        a7, s10
                  rem          t6, a0, tp
                  xor          t5, s1, s1
                  c.and        a0, a4
                  sltu         ra, t2, s1
                  mulhu        gp, s9, t2
                  csrrsi       t6, 0x340, 11
                  rem          s2, tp, s10
                  ori          s5, t4, -325
                  c.mv         t0, s11
                  c.nop
                  c.addi16sp   sp, 336
                  slt          s1, gp, s5
                  c.andi       a3, 15
                  sub          s4, s5, a7
                  c.addi16sp   sp, -16
                  csrrw        s2, 0x340, s11
                  c.and        a0, s0
                  c.mv         a6, s0
                  nop
                  slti         s4, a5, -951
                  c.sub        a2, a1
                  add          s5, tp, s10
                  sll          a1, a5, a0
                  nop
                  c.nop
                  c.addi16sp   sp, -16
                  srli         a1, t5, 0
                  c.mv         a0, s1
                  slti         a6, t5, -731
                  c.add        t0, ra
                  c.addi16sp   sp, 128
                  c.add        s10, s6
                  mulh         a2, s1, t1
                  c.lui        t3, 23
                  ori          t6, s9, 551
                  rem          a2, a5, s8
                  sub          s0, a5, gp
                  nop
                  srai         t1, t1, 15
                  srl          a5, gp, zero
                  srai         sp, a5, 20
                  c.li         a7, 22
                  ori          s10, t6, -617
                  mulhsu       t6, t0, gp
                  remu         s0, t1, t2
                  div          a7, s9, a7
                  c.addi16sp   sp, -16
                  c.sub        s1, a1
                  slt          a0, sp, t4
                  slti         a4, t0, 289
                  c.andi       a5, -1
                  csrrci       t0, 0x340, 20
                  divu         a4, t4, s10
                  sltiu        t6, s8, -377
                  c.li         gp, -1
                  csrrsi       a4, 0x340, 0
                  c.or         a1, a3
                  addi         t6, a4, -692
                  nop
                  slt          a4, s0, a1
                  c.xor        a2, a5
                  mulhsu       s7, s5, s3
                  srai         a2, t2, 13
                  xori         a2, a0, -810
                  c.addi16sp   sp, 368
                  xori         a6, a4, 403
                  c.addi16sp   sp, -16
                  c.slli       a0, 31
                  xori         a7, s9, -1075
                  csrrw        zero, 0x340, t6
                  sltu         a5, tp, gp
                  slti         a6, a3, -1607
                  csrrsi       t6, 0x340, 24
                  or           s7, t5, t1
                  csrrc        t2, 0x340, zero
                  addi         t4, a2, 1415
                  sub          s6, a3, t0
                  c.slli       t1, 1
                  rem          s8, a7, sp
                  sra          sp, s11, s1
                  div          t2, s8, s7
                  divu         gp, ra, t5
                  c.li         a7, -1
                  slti         a0, tp, 1054
                  srl          s5, t0, a3
                  csrrci       s1, 0x340, 22
                  csrrwi       s2, 0x340, 6
                  andi         a1, s5, -1282
                  rem          a3, a5, s7
                  c.mv         s5, s5
                  c.xor        a4, s0
                  and          a3, a4, t2
                  slli         ra, sp, 26
                  mulhsu       s0, a4, a6
                  csrrs        t0, 0x340, zero
                  csrrsi       a2, 0x340, 16
                  mulh         s10, s7, t2
                  slti         a1, s6, 1036
                  c.li         a0, 13
                  slli         zero, t1, 3
                  c.srli       a3, 19
                  srl          a5, t2, a1
                  c.xor        s0, a2
                  csrrwi       s4, 0x340, 13
                  c.add        s10, s6
                  sltiu        t5, gp, 1324
                  csrrw        a5, 0x340, a1
                  c.mv         a4, s3
                  csrrsi       zero, 0x340, 0
                  c.nop
                  rem          a4, ra, ra
                  slti         s1, a2, -1604
                  c.lui        s4, 25
                  csrrs        s6, 0x340, ra
                  ori          t5, s10, 1597
                  c.nop
                  sll          s1, a5, s5
                  sub          s6, t6, zero
                  c.addi       a2, -1
                  xori         s4, t5, 1474
                  remu         t6, s3, ra
                  srl          a4, a0, a1
                  lui          s6, 15030
                  srl          a3, t4, a6
                  addi         s7, t3, -505
                  sltu         s4, a3, gp
                  c.addi       s1, -1
                  mulh         s2, s11, t6
                  c.srli       a5, 17
                  mul          s4, t3, s2
                  add          a7, a7, a5
                  csrrc        gp, 0x340, a2
                  srai         sp, t2, 10
                  add          tp, sp, a4
                  nop
                  c.sub        a3, a4
                  csrrci       gp, 0x340, 0
                  slti         s1, t4, 2006
                  mulhsu       a4, s8, a1
                  c.and        a3, a2
                  srai         a7, a2, 18
                  xor          s5, a6, a3
                  add          s0, s3, a6
                  slt          s7, zero, t0
                  c.or         a4, a3
                  rem          s5, s1, t3
                  c.srli       a5, 1
                  ori          a6, a7, 453
                  c.sub        s1, s1
                  c.srai       a2, 31
                  c.addi       s10, 31
                  remu         s7, s8, a6
                  remu         t5, s10, s8
                  c.lui        t3, 17
                  mulhu        t4, gp, s9
                  csrrwi       a3, 0x340, 18
                  srai         t2, t1, 27
                  slti         a6, sp, 984
                  c.mv         a4, s10
                  csrrw        tp, 0x340, sp
                  c.slli       s0, 14
                  xori         t3, t3, 32
                  c.lui        s1, 29
                  c.addi4spn   a0, sp, 464
                  mulh         ra, s1, t4
                  c.addi16sp   sp, -16
                  addi         t3, t2, -465
                  remu         a4, s9, a3
                  mulhsu       a3, zero, s2
                  csrrc        s1, 0x340, s2
                  div          t5, zero, s4
                  srli         s0, a4, 26
                  c.xor        a5, s0
                  c.add        a0, t2
                  srl          a6, t3, s10
                  c.and        a5, a0
                  c.nop
                  xori         t1, a5, 1408
                  andi         s7, t5, -1940
                  lui          t5, 230180
                  mul          a6, t5, a1
                  c.xor        a1, a1
                  mulhsu       ra, t5, s8
                  c.addi16sp   sp, -16
                  slti         gp, s1, 1941
                  c.addi       s1, 14
                  sltu         s8, s11, tp
                  or           a3, t6, s5
                  csrrwi       zero, 0x340, 19
                  c.addi4spn   a3, sp, 480
                  mulhsu       a4, s6, s3
                  sll          a6, s10, a0
                  c.andi       a0, 13
                  andi         tp, t5, 1524
                  div          a7, s3, a3
                  c.and        s1, s1
                  c.lui        a1, 1
                  sll          a7, s7, t3
                  andi         a6, s6, 1933
                  srl          tp, t2, a5
                  slti         s1, a6, -878
                  csrrwi       t6, 0x340, 26
                  andi         s10, a6, -1040
                  c.lui        a3, 7
                  sltiu        s1, s1, 470
                  xori         s8, t5, -583
                  srl          ra, tp, gp
                  slli         zero, zero, 11
                  c.or         a1, a1
                  mul          a6, t1, s4
                  c.addi16sp   sp, -16
                  c.andi       a1, 29
                  mul          s4, a4, a2
                  csrrci       gp, 0x340, 0
                  c.and        a3, a2
                  c.sub        a1, a5
                  c.or         a3, a1
                  csrrsi       a3, 0x340, 0
                  csrrw        a5, 0x340, s2
                  c.nop
                  div          a6, s6, a3
                  xor          a5, gp, a6
                  sltu         a7, s3, sp
                  sll          s7, t3, s1
                  srli         s5, a1, 2
                  auipc        t1, 410123
                  divu         t4, a7, s8
                  mulhsu       t2, a7, a0
                  div          t2, t3, s9
                  add          a7, s10, zero
                  xori         a2, s11, 836
                  srai         a4, gp, 4
                  c.slli       a4, 30
                  slti         t1, s4, 647
                  c.add        s10, t3
                  nop
                  sra          sp, s11, s0
                  auipc        s4, 341094
                  sltiu        a1, zero, -885
                  csrrsi       t4, 0x340, 0
                  rem          a6, s8, tp
                  c.nop
                  srai         a0, a1, 10
                  c.or         a0, s0
                  sltiu        a6, s11, -1544
                  slt          t1, a5, s11
                  c.mv         t0, gp
                  add          gp, t4, s5
                  c.and        a5, a2
                  mulh         s1, a5, a3
                  remu         s4, s1, gp
                  divu         t0, ra, t6
                  c.or         a4, s1
                  c.slli       a4, 20
                  csrrci       s2, 0x340, 13
                  sub          t2, a6, a2
                  auipc        sp, 546870
                  c.lui        gp, 22
                  ori          t5, s8, -1327
                  or           s8, tp, t5
                  srai         a4, a6, 15
                  addi         a3, a2, -1257
                  remu         s8, s8, a0
                  rem          s2, ra, s6
                  mulhu        t0, s8, s7
                  and          a2, s7, a0
                  csrrw        a5, 0x340, gp
                  csrrwi       sp, 0x340, 23
                  mulh         t0, a0, s6
                  nop
                  csrrsi       a7, 0x340, 22
                  remu         s4, s0, t6
                  xor          s7, a0, s0
                  c.and        s1, s1
                  lui          t0, 767712
                  mulh         tp, s6, t1
                  csrrc        t6, 0x340, zero
                  ori          t3, a2, -375
                  sll          t2, a2, s1
                  c.srli       a4, 18
                  addi         s7, t5, 1724
                  xori         ra, s4, -1282
                  addi         a7, s11, -786
                  c.addi16sp   sp, 352
                  sub          zero, s3, s1
                  sra          t6, tp, s10
                  addi         t3, s5, -1845
                  csrrc        t4, 0x340, t3
                  c.mv         t4, t6
                  mulhsu       a3, s8, t2
                  c.li         s8, -1
                  div          a5, a6, s11
                  add          t4, s6, s3
                  andi         s0, sp, 1637
                  mulh         a7, t4, a0
                  add          ra, s3, sp
                  c.xor        s1, s0
                  csrrwi       s4, 0x340, 4
                  c.and        a4, a3
                  csrrs        a7, 0x340, s2
                  c.slli       s5, 8
                  c.addi16sp   sp, 16
                  csrrci       t2, 0x340, 0
                  c.addi       gp, -1
                  auipc        s7, 860779
                  csrrsi       a1, 0x340, 25
                  c.mv         s5, a6
                  c.srai       a5, 22
                  csrrw        a5, 0x340, s6
                  xor          t1, s3, a7
                  div          tp, t6, s3
                  c.andi       a0, -1
                  csrrs        t3, 0x340, a4
                  c.li         s6, -1
                  c.andi       a5, -1
                  c.addi4spn   s1, sp, 864
                  rem          t5, sp, a4
                  c.or         a1, a2
                  c.add        t3, s0
                  slli         a4, a5, 27
                  c.srai       a1, 20
                  c.andi       a5, -1
                  ori          t0, t6, 1342
                  c.li         tp, -1
                  c.addi       t2, -1
                  ori          a3, zero, -60
                  slti         s0, sp, -201
                  csrrw        t0, 0x340, tp
                  c.sub        a0, a1
                  slt          a7, t4, a1
                  c.nop
                  ori          t1, a2, -1413
                  c.addi16sp   sp, -16
                  c.nop
                  c.srli       a0, 17
                  sra          t6, t5, t4
                  c.or         a0, s0
                  c.add        s0, t6
                  mulhsu       s10, t4, t1
                  c.srai       a3, 3
                  sll          s2, s8, t5
                  lui          a6, 819127
                  add          t4, a2, a1
                  c.andi       a3, 6
                  sll          sp, t5, s8
                  c.srli       s1, 4
                  sltiu        t6, t6, -391
                  addi         sp, sp, -1879
                  xor          t1, s7, zero
                  xori         gp, zero, 1117
                  csrrs        a7, 0x340, zero
                  or           s8, t4, tp
                  sub          s0, t3, a3
                  slt          a1, t5, ra
                  auipc        s7, 684225
                  c.srli       a0, 28
                  div          t3, a0, s9
                  sra          t4, s1, gp
                  mulhu        s1, t5, t6
                  divu         a5, tp, t0
                  ori          s5, s1, 2012
                  xori         t5, s11, 89
                  csrrc        sp, 0x340, s3
                  slli         a7, a0, 23
                  ori          gp, t1, -365
                  rem          s0, t2, s2
                  slti         t0, s1, -1970
                  c.addi4spn   a2, sp, 608
                  csrrci       t2, 0x340, 0
                  xori         ra, s7, -1264
                  add          sp, sp, tp
                  sll          a6, s11, s8
                  mul          s8, s4, ra
                  mulhu        s10, s7, t2
                  srli         gp, t5, 30
                  sltiu        sp, t1, -15
                  csrrw        s2, 0x340, a2
                  andi         ra, ra, -933
                  ori          s1, a5, -196
                  csrrwi       ra, 0x340, 0
                  c.addi4spn   s1, sp, 64
                  csrrsi       sp, 0x340, 0
                  mulhsu       t2, s6, t1
                  or           t4, s4, t2
                  c.lui        a1, 7
                  c.srai       a0, 7
                  sltiu        ra, gp, 2046
                  csrrsi       s2, 0x340, 0
                  sll          t0, t0, t1
                  and          t5, zero, t0
                  c.mv         s1, a2
                  slli         a0, s10, 15
                  srl          s8, s8, zero
                  nop
                  csrrw        a5, 0x340, s4
                  csrrwi       t6, 0x340, 18
                  srai         s0, s9, 14
                  mulhu        s5, t0, s5
                  remu         sp, t5, a6
                  c.srai       a5, 9
                  remu         t4, s2, s7
                  xor          s6, s8, a5
                  c.nop
                  c.li         s5, 14
                  c.srli       a2, 26
                  c.addi       a0, 16
                  c.or         a5, a4
                  c.srai       s1, 22
                  andi         s8, a6, 295
                  csrrc        a6, 0x340, a3
                  csrrw        t3, 0x340, a3
                  csrrw        t4, 0x340, s9
                  sll          zero, t3, s7
                  sltiu        zero, s0, 248
                  ori          s0, s11, -1742
                  csrrci       a3, 0x340, 0
                  csrrc        a3, 0x340, zero
                  c.or         s1, a3
                  mulhu        a5, a6, t0
                  rem          s2, a0, s3
                  slli         zero, sp, 11
                  c.addi16sp   sp, 32
                  xor          t0, t3, gp
                  srl          s2, t4, t5
                  andi         t6, zero, 1398
                  sra          t3, s4, s10
                  c.srai       a1, 26
                  addi         zero, zero, -891
                  c.lui        t4, 20
                  c.slli       gp, 19
                  mulhu        tp, s9, a3
                  csrrc        s0, 0x340, s9
                  nop
                  c.addi4spn   a2, sp, 288
                  c.xor        s1, a0
                  c.slli       t1, 26
                  slt          t0, s7, a3
                  srai         gp, tp, 27
                  addi         t1, t2, -544
                  c.nop
                  xor          t4, s7, s3
                  c.addi       ra, -1
                  c.andi       s0, 28
                  mul          t3, a4, a2
                  auipc        t6, 288346
                  xori         t6, t6, -1958
                  c.li         s2, -1
                  remu         a7, t5, t1
                  remu         gp, ra, s1
                  and          t1, s10, s0
                  and          t0, s7, a5
                  sltiu        t3, s2, 1349
                  c.sub        a4, a0
                  c.srli       s0, 22
                  c.or         a0, a3
                  srai         a5, zero, 20
                  c.lui        s1, 21
                  sltiu        t6, a0, 453
                  csrrwi       t3, 0x340, 7
                  nop
                  and          s8, gp, t1
                  or           s4, a0, a5
                  slt          s0, s1, gp
                  rem          t2, a5, t2
                  c.srai       a4, 22
                  c.nop
                  nop
                  xor          a5, s5, a2
                  csrrwi       tp, 0x340, 18
                  c.addi16sp   sp, 48
                  csrrc        a3, 0x340, t5
                  addi         gp, s2, 234
                  auipc        a3, 66523
                  sub          zero, s9, a6
                  c.lui        t6, 23
                  c.add        t5, t3
                  csrrc        s10, 0x340, gp
                  c.mv         a5, a6
                  c.addi4spn   s1, sp, 544
                  sra          a5, t2, s11
                  c.slli       s0, 12
                  lui          t1, 216316
                  c.xor        s1, a4
                  addi         t1, a1, 355
                  c.addi16sp   sp, 96
                  mul          a1, t0, a7
                  c.lui        s2, 16
                  c.lui        t3, 19
                  c.srai       s1, 2
                  sltiu        s0, s2, -897
                  csrrs        gp, 0x340, zero
                  c.addi4spn   a2, sp, 912
                  mulh         a0, s6, s6
                  c.addi4spn   a2, sp, 160
                  c.or         s0, a0
                  c.mv         s8, a0
                  c.and        a4, a1
                  sltu         s0, s1, a2
                  rem          a0, s7, s9
                  srli         a1, t3, 20
                  csrrw        a6, 0x340, zero
                  nop
                  sltiu        s5, ra, -1235
                  mulhu        t1, s11, t1
                  sra          t0, s6, a1
                  c.li         sp, -1
                  divu         ra, t3, s0
                  rem          a7, s9, a1
                  c.add        t4, a3
                  c.srai       s1, 8
                  andi         a2, s2, 344
                  divu         s8, a6, zero
                  c.srli       s0, 13
                  c.srli       a2, 4
                  ori          s7, sp, 1625
                  auipc        a6, 607758
                  addi         a3, s5, -1690
                  c.slli       a0, 30
                  csrrw        a7, 0x340, s1
                  lui          s2, 752259
                  xor          a7, a4, s9
                  mulh         sp, s9, s8
                  sll          sp, s10, t3
                  xori         zero, a2, -1742
                  div          a6, a0, t4
                  csrrc        t2, 0x340, s7
                  csrrw        a2, 0x340, gp
                  xori         t2, t4, 457
                  add          s1, s6, s7
                  c.slli       t1, 18
                  lui          ra, 522178
                  srl          tp, tp, ra
                  c.xor        a3, a3
                  c.or         s0, s1
                  sra          t3, a1, gp
                  mulhu        s4, s4, a4
                  auipc        a2, 916733
                  add          t0, s4, s8
                  mulhsu       sp, t3, s11
                  c.srli       a2, 8
                  mulhsu       t6, s2, a6
                  lui          t4, 72403
                  rem          s2, t3, s0
                  mulhsu       s1, s9, gp
                  sra          zero, a3, t2
                  or           a1, t2, t1
                  xor          ra, t4, a6
                  c.and        a2, s1
                  srli         t2, s3, 22
                  c.slli       s5, 5
                  add          t0, s5, a1
                  div          a6, s10, s6
                  xori         t3, zero, 854
                  mulhsu       t0, t6, s10
                  c.mv         t0, a3
                  remu         zero, s0, a4
                  sltiu        t1, a3, 763
                  srli         s7, s8, 14
                  slt          ra, gp, a5
                  xori         zero, a3, -650
                  c.lui        a0, 30
                  mulhsu       s5, t5, s8
                  ori          a5, s6, 51
                  c.add        s8, tp
                  c.and        a5, a5
                  csrrci       t5, 0x340, 5
                  mulhu        sp, s7, t6
                  slti         t1, t0, -1566
                  slli         t3, a6, 0
                  divu         s5, s5, gp
                  addi         t5, s2, -455
                  div          gp, s11, s2
                  c.sub        a1, a0
                  c.srai       a2, 14
                  addi         tp, ra, -1451
                  nop
                  xori         a0, s6, -1768
                  slt          s7, t6, sp
                  c.srai       a4, 18
                  c.li         t2, 11
                  c.li         s8, -1
                  andi         a4, a2, 1090
                  mulh         a4, a0, a7
                  lui          a0, 760287
                  auipc        a5, 27689
                  c.or         a2, a5
                  lui          s7, 479065
                  and          t1, a2, t0
                  addi         t2, a6, -1634
                  c.slli       ra, 21
                  sltiu        gp, a7, -1559
                  div          a2, a6, a4
                  csrrsi       a3, 0x340, 0
                  csrrs        a6, 0x340, s11
                  c.andi       s1, -1
                  nop
                  remu         s8, s9, s4
                  csrrs        tp, 0x340, t3
                  csrrc        s1, 0x340, sp
                  srai         a1, t1, 16
                  c.add        t4, t5
                  c.srai       a3, 25
                  c.srai       a3, 28
                  xor          a6, s0, t5
                  sll          sp, gp, a7
                  csrrci       t3, 0x340, 4
                  div          s4, s10, a4
                  c.sub        a5, a2
                  slli         a1, ra, 0
                  remu         a4, a7, a6
                  c.nop
                  divu         a5, gp, t4
                  sll          t4, s2, s8
                  c.or         a1, s1
                  addi         sp, s1, 349
                  sltu         a3, s8, a1
                  div          a5, a5, t0
                  csrrc        t3, 0x340, zero
                  sub          a1, a2, a2
                  div          t1, s4, s11
                  csrrw        a0, 0x340, t5
                  srl          t5, a5, t0
                  andi         s6, t5, 1843
                  auipc        s8, 521400
                  c.li         s6, -1
                  csrrc        t2, 0x340, zero
                  remu         t4, s1, s6
                  srai         a5, s3, 14
                  csrrwi       s2, 0x340, 30
                  nop
                  mul          a3, s5, s5
                  c.nop
                  csrrwi       gp, 0x340, 23
                  srl          t1, s2, gp
                  c.xor        a2, a0
                  mulhu        a7, a7, a6
                  remu         a2, s10, a6
                  c.nop
                  mulh         s8, s8, t0
                  srli         s2, zero, 5
                  c.andi       a3, -1
                  c.nop
                  c.addi16sp   sp, -16
                  c.lui        tp, 10
                  c.addi16sp   sp, -16
                  mulhu        a0, a7, a2
                  lui          t0, 921896
                  c.and        s1, a4
                  sll          t5, s0, a6
                  and          t1, t4, t6
                  sra          t4, s10, s5
                  sra          sp, s10, a0
                  mul          s0, s8, ra
                  csrrwi       s7, 0x340, 11
                  nop
                  xori         zero, zero, -1108
                  c.xor        a3, a2
                  add          s0, t5, s4
                  c.srai       a0, 17
                  sll          zero, t5, t4
                  nop
                  addi         tp, s1, -1032
                  c.slli       t3, 25
                  div          ra, t3, a3
                  xor          t4, s2, s0
                  c.addi16sp   sp, -16
                  c.addi16sp   sp, -16
                  c.and        a4, a0
                  c.srai       a1, 15
                  slli         t2, a4, 27
                  srl          s6, t3, t1
                  xori         s2, a6, -1992
                  xor          a2, t5, a7
                  remu         s4, t1, a3
                  mulh         s0, t3, s9
                  or           a7, t2, s0
                  mul          sp, s3, zero
                  div          t3, s1, t4
                  csrrci       s1, 0x340, 29
                  srl          a7, t5, s2
                  c.or         a0, a3
                  divu         t2, s2, a6
                  sltiu        s1, zero, -1673
                  c.or         a5, a2
                  addi         s4, a1, -1445
                  c.or         a3, a2
                  lui          gp, 4133
                  c.sub        a0, a1
                  c.srli       a5, 26
                  div          t6, t4, t6
                  csrrwi       a2, 0x340, 29
                  c.srai       a4, 25
                  csrrwi       sp, 0x340, 21
                  xor          s0, s8, sp
                  slli         t1, t4, 11
                  xori         ra, a2, 1052
                  or           gp, s10, s7
                  div          zero, s6, s6
                  slt          a5, s1, t3
                  sra          a5, s5, a4
                  c.mv         t0, a0
                  sub          t0, t1, s3
                  slt          sp, a6, s4
                  auipc        s4, 559874
                  c.and        a0, a5
                  ori          a6, s9, 1834
                  csrrc        tp, 0x340, zero
                  divu         s1, s9, t5
                  divu         t3, s1, s10
                  c.slli       s2, 31
                  and          sp, a4, zero
                  srl          t4, s10, s10
                  remu         s0, s1, a6
                  xori         t1, s8, -1742
                  remu         s1, s6, t4
                  srai         s8, a5, 14
                  slti         ra, s0, 1723
                  c.srai       a5, 16
                  c.addi       t1, -1
                  c.and        s0, a4
                  c.slli       t4, 13
                  sltu         t2, a4, s4
                  c.srli       a1, 28
                  xor          s5, s3, a0
                  c.sub        a5, s0
                  nop
                  sll          ra, s2, a6
                  xor          gp, s5, a1
                  c.sub        a1, a3
                  csrrs        a6, 0x340, zero
                  c.xor        a5, a3
                  mulhsu       zero, sp, a0
                  srli         t3, s1, 21
                  c.xor        a1, a1
                  c.addi       t1, -1
                  csrrs        a5, 0x340, a1
                  sra          a3, t6, s0
                  lui          a6, 47764
                  c.slli       s5, 3
                  lui          s0, 745969
                  xor          ra, t5, s2
                  lui          s5, 966291
                  c.srli       a0, 11
                  c.lui        gp, 20
                  sub          a2, ra, a0
                  div          s1, a0, s4
                  csrrw        gp, 0x340, t1
                  auipc        t4, 879065
                  c.and        a0, a3
                  lui          t1, 433994
                  c.sub        a5, a2
                  sra          a4, a0, s11
                  c.lui        s7, 18
                  srl          tp, s3, t2
                  ori          s5, gp, -188
                  sltiu        t6, s3, -1500
                  c.lui        a1, 8
                  c.addi16sp   sp, -16
                  c.srai       s0, 8
                  srl          s7, gp, a5
                  remu         t0, a3, a2
                  csrrci       s1, 0x340, 30
                  c.slli       s2, 28
                  or           s6, s3, a6
                  rem          s2, t4, t2
                  c.mv         gp, a5
                  c.addi       s8, 29
                  sra          gp, s5, s10
                  sltiu        gp, s5, 330
                  srai         gp, a2, 12
                  c.andi       a4, -1
                  c.addi       t5, -1
                  auipc        s7, 350284
                  divu         tp, s7, a1
                  srli         s2, a7, 30
                  c.addi4spn   a5, sp, 800
                  remu         s1, ra, s2
                  csrrsi       zero, 0x340, 0
                  c.lui        a6, 18
                  c.slli       gp, 10
                  slti         t0, s1, -25
                  xor          t6, a5, s2
                  slti         s0, s9, 1324
                  srl          s5, zero, a4
                  c.sub        s1, s1
                  xori         s1, t0, -1977
                  c.or         a4, a2
                  auipc        t3, 216372
                  sltu         t3, s10, t5
                  c.sub        a4, a2
                  add          s2, tp, s9
                  c.or         a5, a0
                  c.li         s4, -1
                  srli         a7, zero, 30
                  csrrw        ra, 0x340, s8
                  csrrsi       a4, 0x340, 0
                  add          t5, s2, tp
                  mulh         s10, a7, a7
                  lui          a2, 292848
                  addi         t6, s7, 599
                  slti         a2, a3, -1041
                  xor          t0, s11, s3
                  sra          a4, a1, s7
                  lui          zero, 446068
                  c.andi       s1, 18
                  nop
                  sltiu        s5, s2, -281
                  andi         a3, tp, -1393
                  c.srli       a4, 13
                  c.or         s1, s1
                  and          s0, s0, s6
                  srli         a1, t0, 22
                  c.li         a5, 1
                  c.andi       s0, 1
                  csrrci       s8, 0x340, 22
                  c.li         gp, -1
                  c.or         a4, a0
                  c.addi4spn   s1, sp, 176
                  and          s4, a1, s1
                  andi         a2, s5, -906
                  c.lui        a4, 3
                  srl          tp, sp, sp
                  mulhu        a6, t6, s2
                  c.addi4spn   a3, sp, 48
                  c.srai       a5, 3
                  and          a6, s2, t0
                  mul          ra, s7, t5
                  div          s4, a3, zero
                  xor          s4, s6, s10
                  ori          a6, a4, 151
                  andi         s6, s8, 2023
                  c.or         a0, a5
                  c.nop
                  rem          s5, t2, s1
                  auipc        t4, 605893
                  sll          a2, a7, s8
                  lui          a6, 809270
                  mul          t5, s8, s6
                  sltu         s8, t6, s10
                  ori          a5, ra, 1732
                  c.sub        a4, s0
                  c.li         a3, 6
                  c.lui        ra, 21
                  xor          a3, t0, a2
                  add          t2, s0, s5
                  c.andi       a5, -1
                  c.lui        s10, 18
                  c.srai       s1, 14
                  rem          a5, s11, a4
                  c.addi4spn   s0, sp, 704
                  csrrc        tp, 0x340, zero
                  slt          s6, a6, s4
                  c.addi16sp   sp, 112
                  nop
                  slti         sp, t2, 730
                  csrrc        a5, 0x340, gp
                  c.add        a1, s5
                  csrrc        ra, 0x340, zero
                  csrrci       s6, 0x340, 17
                  c.srli       a0, 3
                  add          zero, s10, zero
                  sll          s7, a7, s1
                  c.nop
                  csrrw        a3, 0x340, s6
                  srli         t5, s9, 12
                  xori         a5, a7, 427
                  c.li         s7, -1
                  slti         gp, a3, 619
                  srl          t2, a6, s2
                  c.and        a2, a2
                  mulh         a7, t1, a2
                  xor          a7, t1, s9
                  and          gp, t5, t2
                  c.srli       a5, 7
                  c.slli       s7, 21
                  c.and        s0, s1
                  c.xor        a5, a4
                  srai         s6, t5, 0
                  csrrw        a4, 0x340, s7
                  c.srai       a0, 11
                  sra          s8, s5, s3
                  csrrci       s10, 0x340, 0
                  c.addi16sp   sp, -16
                  slti         t6, s0, 1186
                  andi         t3, a3, -1787
                  sub          t5, tp, s4
                  ori          a5, s11, -1715
                  c.addi4spn   a2, sp, 688
                  csrrwi       t3, 0x340, 2
                  addi         a7, t0, -1552
                  div          s2, a7, s2
                  remu         s10, gp, a3
                  and          a5, zero, a1
                  slt          zero, s4, t0
                  srli         tp, s5, 0
                  c.xor        a0, s0
                  c.add        s6, s4
                  slt          ra, s8, a1
                  add          ra, t2, a5
                  add          s6, s4, tp
                  c.addi16sp   sp, -16
                  sltu         a6, s7, s7
                  c.and        s0, a1
                  mul          a5, s5, t4
                  c.addi16sp   sp, 496
                  mulhsu       s0, s8, a6
                  csrrci       gp, 0x340, 0
                  mul          s8, s1, s1
                  ori          s8, s1, 1014
                  mul          t5, t6, zero
                  srai         s0, a5, 20
                  csrrc        t3, 0x340, zero
                  csrrw        a1, 0x340, gp
                  c.add        s1, t4
                  csrrwi       t3, 0x340, 11
                  and          a2, s6, a1
                  c.addi       t1, 29
                  c.srai       a3, 10
                  mul          t1, s4, s4
                  csrrwi       a1, 0x340, 6
                  c.add        gp, sp
                  sll          a4, a3, s6
                  c.slli       s6, 15
                  c.addi16sp   sp, -16
                  div          a0, s1, t1
                  csrrw        s10, 0x340, a1
                  slli         t0, s6, 26
                  c.addi4spn   a3, sp, 432
                  srl          a5, t5, s7
                  sub          a4, a4, s2
                  srai         s2, s8, 19
                  csrrw        s5, 0x340, s9
                  csrrw        a7, 0x340, t1
                  c.andi       s0, -1
                  c.or         a3, a1
                  c.li         s8, 18
                  rem          s8, a6, s2
                  c.lui        s5, 30
                  sltu         s5, s2, zero
                  lui          a6, 36446
                  rem          t1, a3, a4
                  c.mv         s10, t2
                  or           t0, s9, a6
                  sll          a2, s2, t4
                  slti         a7, t2, -82
                  mulh         s7, zero, tp
                  c.add        a5, t2
                  c.slli       t3, 30
                  c.sub        a3, a0
                  csrrsi       tp, 0x340, 0
                  c.xor        a0, s1
                  slli         t2, tp, 23
                  auipc        s4, 751790
                  add          t0, a7, tp
                  lui          a7, 5951
                  c.mv         s5, t1
                  sub          a3, s6, a7
                  c.add        a1, s7
                  c.srai       a2, 20
                  csrrsi       s8, 0x340, 7
                  addi         a0, t5, 765
                  csrrc        s6, 0x340, zero
                  div          a0, ra, a6
                  c.and        a5, s1
                  add          t0, zero, s8
                  c.andi       s0, -1
                  c.nop
                  srl          a4, a2, t1
                  sltiu        gp, s10, -435
                  c.xor        a2, a3
                  addi         gp, a6, -1363
                  srl          a1, a2, s9
                  c.li         t6, 1
                  csrrc        a4, 0x340, s8
                  add          a6, a0, s0
                  sltiu        zero, a2, 389
                  srai         s7, a7, 0
                  mulhsu       tp, s3, s2
                  c.sub        a1, a3
                  c.and        s1, a3
                  c.mv         s5, t6
                  csrrs        s8, 0x340, zero
                  ori          t0, a3, -1187
                  div          t4, s2, s0
                  xori         sp, s7, -704
                  c.lui        ra, 7
                  csrrsi       a2, 0x340, 30
                  rem          sp, a1, t6
                  c.add        a6, s6
                  srli         a0, a2, 30
                  c.addi4spn   s1, sp, 944
                  c.slli       s8, 10
                  csrrsi       s0, 0x340, 0
                  c.lui        a1, 27
                  csrrc        a6, 0x340, zero
                  auipc        a3, 365742
                  sltu         s1, zero, a0
                  addi         tp, s6, 1340
                  slt          a1, gp, t0
                  c.sub        s1, a3
                  sub          t5, s3, a7
                  ori          sp, t3, 926
                  sltiu        s1, s3, -813
                  sll          a6, a5, t4
                  c.srai       a1, 22
                  c.addi4spn   s1, sp, 336
                  slti         a0, t5, -1245
                  c.or         s1, a2
                  slt          ra, s5, ra
                  c.addi4spn   s0, sp, 48
                  lui          s4, 770763
                  c.addi4spn   s0, sp, 240
                  xori         s2, s9, -1122
                  xor          a5, s2, a7
                  sra          ra, t4, a1
                  slli         s6, t5, 27
                  remu         s6, tp, t3
                  c.lui        s4, 20
                  sra          tp, t4, a6
                  sub          zero, t2, tp
                  c.nop
                  sltiu        t0, tp, 1955
                  csrrwi       a7, 0x340, 7
                  remu         sp, a7, s0
                  c.and        a2, a4
                  c.lui        ra, 26
                  ori          s0, a0, 942
                  or           t6, a3, s11
                  c.add        a5, t2
                  c.nop
                  nop
                  srl          t5, a6, s4
                  csrrci       a6, 0x340, 0
                  ori          tp, a4, 1579
                  add          zero, s2, t1
                  mulh         t1, sp, a6
                  or           sp, s1, s5
                  c.lui        tp, 17
                  c.nop
                  addi         tp, s5, 99
                  csrrc        s7, 0x340, zero
                  slti         s8, sp, -1991
                  csrrwi       a1, 0x340, 18
                  divu         s8, s10, s7
                  c.srai       s1, 14
                  mul          s5, t5, t6
                  slli         a7, zero, 23
                  slti         a5, s8, -1612
                  divu         t4, s8, t3
                  c.srai       a4, 1
                  c.and        a3, a5
                  mul          s0, t1, a3
                  c.sub        a4, s0
                  slli         a3, a4, 19
                  c.lui        a0, 25
                  srai         s6, s8, 25
                  sltiu        s10, sp, 1780
                  ori          s7, s11, 1633
                  auipc        a2, 501736
                  sll          t3, gp, s0
                  c.lui        t1, 10
                  c.mv         ra, s8
                  c.srai       a0, 30
                  lui          s6, 643785
                  c.mv         a0, a2
                  c.xor        a1, a5
                  sra          s1, a2, a5
                  c.li         s8, -1
                  xor          gp, s11, zero
                  sra          s0, t6, t6
                  c.or         a2, a1
                  c.andi       a3, 28
                  or           a5, s5, a4
                  auipc        s10, 908867
                  c.nop
                  c.addi16sp   sp, -16
                  mulhu        sp, gp, t3
                  mulhsu       s10, a2, ra
                  lui          t6, 34879
                  nop
                  c.xor        a0, a2
                  c.slli       s10, 30
                  slti         t2, t1, -106
                  csrrci       t6, 0x340, 0
                  divu         a6, s7, s0
                  srl          ra, a3, t2
                  sltu         s6, s9, a6
                  xor          t2, t3, s3
                  c.nop
                  or           ra, s5, t3
                  mulhu        a4, sp, zero
                  sltiu        a1, a2, 1377
                  ori          s0, gp, -1189
                  sra          s6, a0, s3
                  mulhsu       a7, s9, t1
                  c.addi16sp   sp, 320
                  srl          t1, t1, s2
                  sra          s4, a3, gp
                  slli         a0, tp, 4
                  csrrwi       a4, 0x340, 18
                  xori         s8, t0, 1422
                  nop
                  add          t6, s3, s2
                  c.lui        t0, 27
                  addi         ra, s4, -521
                  ori          sp, a7, -1895
                  lui          a3, 931030
                  c.andi       a4, 29
                  c.li         t3, -1
                  xor          t4, t0, a4
                  andi         s4, s10, -342
                  rem          a0, s8, s3
                  sll          s2, s2, ra
                  slli         a6, t3, 27
                  ori          gp, t1, -368
                  sra          s10, s5, tp
                  c.addi4spn   a2, sp, 992
                  mulhsu       s6, s9, s11
                  c.srli       s1, 6
                  sltiu        s0, tp, 864
                  c.and        a5, a2
                  mulhu        t4, s5, zero
                  c.addi16sp   sp, -16
                  csrrsi       t6, 0x340, 2
                  c.xor        s1, a5
                  c.addi16sp   sp, -16
                  c.nop
                  add          t4, s5, a2
                  remu         s7, t5, s4
                  csrrwi       ra, 0x340, 19
                  srli         t4, gp, 2
                  mulhu        zero, s7, t4
                  csrrw        s5, 0x340, s9
                  c.or         a3, a5
                  csrrwi       zero, 0x340, 15
                  divu         s10, s5, s10
                  nop
                  sltiu        s2, a5, -859
                  rem          a2, a6, a6
                  srli         s7, s11, 28
                  mulhu        a1, s6, t0
                  remu         t6, zero, ra
                  sub          a4, a4, s2
                  mulh         ra, s6, a1
                  addi         a6, s9, 917
                  mulhu        ra, tp, a2
                  csrrci       s6, 0x340, 0
                  c.li         a2, -1
                  mulhu        a4, s11, a5
                  addi         s7, a1, 1453
                  c.slli       t6, 2
                  c.andi       a3, 7
                  mulhu        s10, s5, a7
                  c.addi4spn   a1, sp, 688
                  andi         t3, t0, -236
                  rem          t5, a7, s5
                  srai         t6, zero, 24
                  c.or         s0, a3
                  lui          t1, 366086
                  slt          ra, sp, s3
                  sltiu        t2, s1, 235
                  c.add        a5, s8
                  sltiu        t4, a5, 1277
                  c.addi       a7, -1
                  add          s0, a2, a2
                  c.addi16sp   sp, -16
                  mul          s10, a2, t2
                  remu         a3, a7, t4
                  and          gp, a3, zero
                  remu         a3, t4, ra
                  c.andi       s0, -1
                  csrrc        s0, 0x340, zero
                  mulhsu       a2, s2, s4
                  c.nop
                  csrrw        s2, 0x340, t2
                  xori         s0, a3, -1565
                  csrrs        t2, 0x340, s3
                  csrrsi       s8, 0x340, 0
                  srl          t6, s0, t0
                  slli         s6, zero, 1
                  c.or         s0, s1
                  sltu         t2, s10, s3
                  mulh         s0, t2, t5
                  div          t3, s0, s0
                  csrrc        s4, 0x340, zero
                  c.addi       gp, 25
                  c.lui        a6, 13
                  mulh         a4, a5, s8
                  c.srai       a4, 20
                  c.addi4spn   a4, sp, 912
                  c.nop
                  c.srli       a0, 10
                  sra          ra, t4, s9
                  slt          s4, t6, a4
                  csrrci       t0, 0x340, 0
                  c.nop
                  xor          a1, t1, s5
                  srl          a7, a3, s4
                  c.srli       s1, 3
                  c.addi16sp   sp, 336
                  or           s4, gp, t4
                  remu         a1, a7, a0
                  c.andi       s1, 12
                  mul          t5, a5, s5
                  srl          gp, s11, ra
                  divu         t5, t3, zero
                  csrrwi       tp, 0x340, 30
                  add          s10, s9, s11
                  nop
                  div          t1, t0, t5
                  c.nop
                  nop
                  srli         s6, a6, 25
                  c.mv         t5, s3
                  srli         t2, a7, 19
                  slli         t6, zero, 3
                  div          t6, s1, a6
                  srli         s5, gp, 25
                  csrrc        t6, 0x340, tp
                  c.and        a1, s0
                  slti         t5, a4, -915
                  andi         zero, s6, 277
                  sll          s7, a6, t0
                  remu         ra, s11, t1
                  c.and        a4, a4
                  sll          s6, a5, ra
                  c.nop
                  c.sub        a2, a4
                  srli         a7, t3, 9
                  mul          a4, a3, a1
                  sll          t3, a6, a6
                  sltiu        t3, s3, -1718
                  c.nop
                  sltiu        s5, t0, -1084
                  or           t0, s10, s10
                  c.addi16sp   sp, 256
                  c.addi4spn   a5, sp, 784
                  c.and        s0, a0
                  andi         s4, t1, -1829
                  c.addi4spn   a3, sp, 624
                  c.and        s0, a3
                  c.or         a0, a4
                  c.srai       a2, 29
                  mulhsu       s5, t4, s2
                  c.sub        a0, a5
                  add          s0, t1, a5
                  slti         zero, s5, 1538
                  c.addi4spn   a2, sp, 800
                  csrrw        sp, 0x340, a1
                  c.li         s10, -1
                  sra          tp, a7, ra
                  andi         a1, t2, 1623
                  sltiu        s7, s6, -829
                  and          sp, zero, s0
                  c.srai       s0, 28
                  c.addi16sp   sp, -16
                  c.addi       t1, -1
                  csrrs        gp, 0x340, t0
                  csrrw        a5, 0x340, ra
                  andi         t5, s4, 714
                  c.addi4spn   a0, sp, 16
                  c.addi16sp   sp, 336
                  csrrw        s2, 0x340, s1
                  c.or         a2, a0
                  andi         t6, t6, -1229
                  sll          sp, tp, s4
                  divu         t1, ra, ra
                  addi         s6, t0, -1655
                  srli         s4, s3, 21
                  mul          t3, a3, a3
                  divu         tp, a0, a7
                  mulhu        zero, ra, a4
                  csrrwi       a1, 0x340, 17
                  c.andi       s0, 29
                  addi         t6, a4, -1970
                  mulh         sp, a6, s1
                  c.and        a4, s1
                  c.srai       a1, 30
                  csrrwi       s2, 0x340, 24
                  xori         a2, a6, 289
                  div          a6, s9, s5
                  c.addi16sp   sp, 160
                  csrrci       s7, 0x340, 16
                  c.addi       t4, -1
                  c.or         a1, a3
                  csrrsi       gp, 0x340, 31
                  c.addi       tp, -1
                  add          a1, a4, s10
                  c.and        a1, a4
                  mulhu        s0, s4, sp
                  c.lui        ra, 13
                  c.slli       s4, 13
                  mul          t2, s0, a7
                  c.addi4spn   a4, sp, 48
                  sra          s4, a3, s10
                  c.addi4spn   s1, sp, 672
                  ori          zero, t3, 1879
                  csrrsi       t3, 0x340, 0
                  mulh         a4, s2, s4
                  addi         t3, t5, 600
                  xor          a4, ra, t6
                  slt          t0, a6, a6
                  c.addi       t0, -1
                  c.li         s8, -1
                  csrrc        s7, 0x340, zero
                  csrrc        t6, 0x340, s7
                  c.addi4spn   s1, sp, 672
                  remu         a0, a7, a7
                  xor          sp, a3, t1
                  mulhu        a0, s2, t1
                  slt          t4, zero, sp
                  lui          t3, 593986
                  c.srli       a2, 14
                  and          tp, t2, sp
                  c.lui        a1, 29
                  c.nop
                  mulh         a5, t1, s0
                  divu         t3, s7, a7
                  sub          s4, s0, s10
                  xori         t6, t1, 816
                  csrrsi       ra, 0x340, 19
                  mulhu        a4, t4, t0
                  c.andi       a2, -1
                  mulh         a0, a5, s0
                  csrrc        a2, 0x340, zero
                  slt          gp, a4, t4
                  andi         t4, s11, -268
                  srai         t4, t6, 18
                  xor          a5, t6, s4
                  slt          t4, s8, s8
                  c.mv         a7, s4
                  c.xor        a0, a5
                  sltu         a6, t1, t4
                  c.slli       s0, 5
                  add          a5, a5, s5
                  sll          s8, s2, a4
                  srl          tp, t3, s2
                  c.andi       a3, 3
                  c.slli       s4, 24
                  or           a5, s10, s10
                  and          a4, tp, s4
                  c.mv         s4, a0
                  xori         a3, s8, 519
                  or           tp, t2, s4
                  sltiu        a1, a5, 825
                  divu         tp, a3, a2
                  c.mv         s5, s1
                  sltiu        s6, s7, -217
                  div          a3, t2, t3
                  andi         a3, t6, -748
                  c.nop
                  sll          tp, ra, s9
                  slli         s4, s9, 31
                  slt          s8, s4, gp
                  divu         a4, sp, gp
                  c.add        a1, s11
                  slt          a7, s5, s9
                  csrrci       t2, 0x340, 0
                  csrrc        a5, 0x340, s4
                  lui          t1, 821431
                  c.and        a4, a5
                  srli         a3, t4, 14
                  c.addi       t0, 31
                  xor          s5, s5, a6
                  csrrs        s4, 0x340, s2
                  xor          s1, a3, s6
                  slti         t1, tp, 17
                  c.and        a0, a4
                  mulhsu       s4, s8, s10
                  c.li         t4, 19
                  divu         t5, gp, t2
                  csrrc        a2, 0x340, zero
                  c.andi       a3, -1
                  c.or         a1, a2
                  c.andi       s1, -1
                  c.lui        a1, 12
                  mulhu        a5, ra, a6
                  c.mv         sp, tp
                  c.or         a3, a3
                  c.add        s4, a3
                  c.slli       a1, 18
                  rem          s1, a0, s3
                  c.mv         t0, ra
                  c.li         s4, 11
                  divu         s10, tp, s3
                  csrrs        s5, 0x340, zero
                  sltu         a5, sp, a5
                  ori          s1, t6, -405
                  div          t2, a2, t1
                  sub          s1, t2, a3
                  sll          s8, a7, a4
                  csrrs        a7, 0x340, s1
                  mulhu        a1, gp, t3
                  c.xor        a4, a5
                  divu         t2, a3, a4
                  srai         a2, t1, 11
                  slt          s5, s0, s2
                  c.lui        s7, 7
                  csrrw        s1, 0x340, s4
                  mulhu        t0, a0, tp
                  csrrwi       zero, 0x340, 5
                  csrrw        s4, 0x340, s0
                  addi         a1, t0, -391
                  or           s1, s7, s8
                  c.mv         s10, s5
                  xori         ra, a3, 500
                  sra          s1, s8, s11
                  sub          t4, t3, ra
                  c.and        a0, a0
                  sra          a5, s10, s9
                  srl          zero, s4, a0
                  ori          t0, t5, -1834
                  mulh         t6, a3, s10
                  mulhu        s6, t1, s10
                  c.sub        a1, s0
                  c.slli       s8, 21
                  divu         t1, sp, tp
                  csrrci       s10, 0x340, 28
                  lui          a6, 118922
                  or           s8, s4, zero
                  sltu         s2, t1, t1
                  sub          a7, gp, ra
                  or           a3, s1, t1
                  c.slli       s8, 15
                  mulhsu       s8, ra, zero
                  csrrw        s4, 0x340, t6
                  xori         t4, a7, -1477
                  or           t3, t0, a0
                  csrrc        gp, 0x340, zero
                  sra          zero, s3, sp
                  sltiu        s7, s8, 551
                  divu         s10, s1, s11
                  srl          s10, s2, s4
                  c.xor        s0, a2
                  c.and        a1, a0
                  csrrsi       s0, 0x340, 28
                  slli         a3, t4, 14
                  rem          s5, a5, gp
                  csrrwi       s4, 0x340, 29
                  srl          tp, s8, zero
                  c.lui        a1, 8
                  sll          s2, t4, t4
                  c.add        a7, s0
                  remu         s8, s10, s9
                  srli         t3, zero, 3
                  csrrci       ra, 0x340, 12
                  divu         t1, s10, s0
                  c.andi       a0, -1
                  addi         s4, sp, -1885
                  c.li         a7, 14
                  c.addi       t5, 21
                  c.xor        a0, a5
                  addi         t0, a3, 208
                  c.and        a4, a2
                  slti         ra, a4, -465
                  c.srai       a1, 2
                  xori         s4, zero, -570
                  xori         a7, s7, 406
                  mul          a7, a3, s8
                  remu         s8, a7, a3
                  c.mv         s8, t6
                  slli         t3, s6, 30
                  c.nop
                  div          s0, s6, a0
                  mulhsu       s2, t1, t4
                  slt          ra, tp, a3
                  sub          a4, s0, t3
                  csrrc        t1, 0x340, a5
                  csrrw        s8, 0x340, s5
                  c.add        t6, a7
                  or           gp, ra, t5
                  srl          a0, t3, t6
                  addi         s1, s11, 1650
                  c.add        t4, s8
                  andi         a0, t2, 866
                  c.addi       a4, -1
                  c.or         a5, a3
                  c.nop
                  csrrci       gp, 0x340, 7
                  sltiu        t0, s4, 630
                  or           s2, s8, s5
                  csrrc        t4, 0x340, zero
                  mulh         t2, ra, s2
                  srai         t1, a0, 14
                  sltu         t6, s7, a7
                  sra          t3, s7, s10
                  andi         t5, s8, 724
                  nop
                  remu         a5, t6, t2
                  rem          s6, s11, gp
                  c.srli       s0, 21
                  srai         t6, t3, 21
                  c.slli       s5, 12
                  c.and        a3, a5
                  mulh         a1, t5, s5
                  csrrwi       t5, 0x340, 7
                  c.addi16sp   sp, -16
                  c.nop
                  csrrw        s6, 0x340, s9
                  auipc        t1, 580540
                  slti         s4, a6, 1291
                  csrrsi       s8, 0x340, 0
                  ori          s1, s4, -1494
                  csrrc        t2, 0x340, s6
                  csrrw        a1, 0x340, a6
                  xori         gp, t4, 1124
                  c.add        t5, t5
                  c.andi       a5, -1
                  c.sub        a5, s1
                  div          s5, t5, s7
                  or           a5, t6, a4
                  div          t6, a6, ra
                  csrrc        a7, 0x340, s2
                  c.andi       a4, 7
                  c.addi16sp   sp, 416
                  c.addi16sp   sp, 432
                  mulh         s2, t2, a2
                  c.srli       a0, 27
                  c.xor        a2, s1
                  or           t5, a4, a6
                  slt          ra, a3, s5
                  sll          s5, a5, s7
                  c.mv         a6, t0
                  c.and        s0, a2
                  sltiu        s0, s0, 1612
                  csrrw        a2, 0x340, t2
                  sltiu        tp, t5, 1403
                  c.slli       t0, 17
                  c.addi4spn   a2, sp, 896
                  c.xor        a3, a4
                  sra          a6, a7, a5
                  nop
                  sub          a5, a0, a7
                  slt          t4, a5, zero
                  slt          gp, t6, a2
                  addi         s5, ra, -1323
                  xor          a4, t5, s8
                  srl          t6, s8, t0
                  c.add        s8, t2
                  rem          a7, s5, s11
                  add          a1, t0, s5
                  sltu         t1, a6, a1
                  mulhu        gp, a4, tp
                  c.nop
                  mul          t5, a6, a4
                  csrrs        a0, 0x340, zero
                  c.xor        a0, a1
                  nop
                  xori         a6, s10, 454
                  c.sub        a5, a5
                  div          s0, s2, tp
                  csrrsi       a3, 0x340, 9
                  csrrci       t1, 0x340, 0
                  or           s8, s3, s3
                  c.nop
                  srli         s5, s4, 31
                  rem          s5, s6, a0
                  csrrci       a3, 0x340, 0
                  slt          t5, t2, s2
                  div          zero, s0, s2
                  remu         a1, s6, s6
                  csrrw        a1, 0x340, sp
                  c.lui        s4, 10
                  mulhu        a2, s8, sp
                  csrrs        a6, 0x340, zero
                  c.sub        a0, a5
                  c.sub        a5, s0
                  c.and        a5, a0
                  c.add        t6, t2
                  remu         a2, s11, tp
                  c.li         s4, -1
                  sll          s0, s8, ra
                  csrrw        gp, 0x340, t0
                  c.and        s1, s1
                  sub          a6, sp, a0
                  csrrs        s8, 0x340, t4
                  c.addi       t3, -1
                  mulh         t5, t0, ra
                  srai         t2, a4, 27
                  xor          a4, s3, s0
                  srl          t2, sp, s8
                  remu         a1, a3, s9
                  csrrwi       s2, 0x340, 6
                  sltu         s8, a7, a7
                  c.srai       a3, 16
                  slt          tp, t2, t4
                  mulh         gp, ra, s9
                  c.srai       a3, 5
                  csrrc        a6, 0x340, zero
                  c.add        a7, s8
                  c.lui        a4, 30
                  andi         t2, s6, -1125
                  c.srai       a3, 2
                  andi         gp, a0, -847
                  c.andi       s0, -1
                  srai         t0, a3, 21
                  c.lui        ra, 9
                  c.addi4spn   a4, sp, 800
                  addi         a5, t0, 832
                  and          zero, zero, s0
                  c.li         s6, 1
                  c.or         a1, a2
                  csrrwi       t2, 0x340, 16
                  c.addi       s4, -1
                  xori         a2, t5, 1324
                  remu         s10, a0, a6
                  sub          s4, s8, s0
                  and          a7, t6, sp
                  lui          tp, 676472
                  c.li         s8, -1
                  srli         a1, a1, 29
                  andi         s6, t0, 664
                  div          a1, s8, zero
                  c.li         t2, 13
                  c.mv         a0, t1
                  mulh         s7, t1, a1
                  c.xor        s0, s1
                  or           a3, t3, t6
                  sub          sp, t2, s1
                  c.lui        t2, 5
                  c.slli       s10, 17
                  andi         s10, t1, -1352
                  c.add        t6, sp
                  srai         a7, gp, 14
                  slt          t2, s8, t5
                  andi         s8, a3, 1870
                  lui          a1, 85865
                  or           a3, zero, t3
                  div          a5, s0, s4
                  mulh         s5, t0, zero
                  c.addi16sp   sp, -16
                  c.lui        t1, 12
                  c.andi       a2, -1
                  xori         s0, s7, 214
                  srl          t5, a1, t0
                  nop
                  c.addi4spn   s0, sp, 1008
                  csrrs        a0, 0x340, s8
                  slti         s8, s8, -558
                  sltu         gp, s4, s11
                  c.add        a4, a2
                  srl          t1, s8, a4
                  c.or         s1, a0
                  mulhu        a4, s10, a6
                  lui          t5, 316454
                  c.xor        a2, a5
                  sub          s5, s2, t2
                  slti         t3, a7, -72
                  mulh         a5, ra, s6
                  slli         a4, ra, 9
                  c.srai       a3, 8
                  c.addi       a2, -1
                  mulh         a3, s8, s7
                  xor          a1, a6, a4
                  or           t4, t5, a1
                  csrrc        s6, 0x340, zero
                  c.xor        a2, a0
                  xor          a0, t5, sp
                  div          s5, s9, ra
                  divu         t3, t4, a1
                  c.srli       a4, 29
                  srli         t4, s4, 7
                  c.xor        a1, a0
                  csrrs        a7, 0x340, zero
                  c.add        s8, a7
                  sltiu        t4, a7, 706
                  auipc        s2, 590542
                  srai         a1, t6, 18
                  mulhsu       a0, s9, a0
                  xor          t4, t3, a6
                  or           t6, gp, t6
                  rem          a0, s10, tp
                  sra          gp, a0, s1
                  andi         a1, t6, -757
                  c.lui        a3, 13
                  slti         s8, s10, -1812
                  div          tp, s7, s3
                  andi         a7, zero, -1978
                  mulh         s10, a7, sp
                  csrrsi       t0, 0x340, 0
                  nop
                  div          t5, a7, s5
                  c.add        s7, s10
                  c.nop
                  or           t1, gp, a3
                  mulh         s2, s4, s4
                  sub          ra, s11, a0
                  c.sub        a3, a4
                  xori         s7, s2, 1562
                  mulhu        t0, a6, t4
                  auipc        s7, 204675
                  c.or         a1, s0
                  auipc        s0, 925233
                  xor          a7, s6, a3
                  mulh         a2, s3, a2
                  div          ra, a5, t0
                  or           s2, s3, s0
                  auipc        a6, 452405
                  c.and        a0, a5
                  srli         t1, a2, 15
                  slli         sp, ra, 26
                  c.addi16sp   sp, -16
                  csrrci       ra, 0x340, 27
                  c.slli       a3, 15
                  div          tp, t6, a0
                  xori         t1, gp, 582
                  c.andi       s1, -1
                  mulhsu       a0, a0, a3
                  c.addi       t0, 15
                  sll          t3, s4, s6
                  c.lui        a3, 6
                  c.or         a4, a2
                  nop
                  c.and        s1, a4
                  sll          a2, s0, t1
                  sltu         ra, a4, s0
                  csrrci       a7, 0x340, 0
                  csrrs        t5, 0x340, s6
                  remu         s2, a5, t4
                  c.or         a5, a2
                  csrrsi       t5, 0x340, 0
                  remu         a3, a4, t2
                  slt          zero, s4, t6
                  csrrw        a6, 0x340, zero
                  c.addi       s5, -1
                  c.li         t1, 18
                  csrrwi       sp, 0x340, 15
                  csrrc        a5, 0x340, a1
                  c.srli       a5, 13
                  auipc        s1, 643656
                  c.or         s1, a2
                  csrrw        t1, 0x340, s9
                  add          a6, s1, a2
                  csrrsi       a5, 0x340, 0
                  slt          s4, gp, ra
                  xor          s0, a0, a6
                  divu         s5, s2, a5
                  add          s5, s3, sp
                  mulh         sp, t6, sp
                  div          s7, a7, t3
                  sltu         t4, gp, s1
                  c.sub        a0, a3
                  mulhu        s1, a6, zero
                  c.xor        a1, a4
                  csrrwi       t6, 0x340, 25
                  xori         s0, zero, -1928
                  xor          a7, gp, t2
                  c.li         s8, -1
                  slti         tp, a5, -1766
                  csrrs        t6, 0x340, s0
                  lui          s8, 57323
                  mul          s6, sp, tp
                  sub          s2, s8, gp
                  c.addi       a2, -1
                  mulh         t4, s9, s11
                  csrrwi       tp, 0x340, 16
                  csrrsi       gp, 0x340, 0
                  slt          gp, s4, t0
                  c.mv         s4, s11
                  add          s6, t4, s0
                  c.xor        a0, a2
                  remu         s8, ra, a3
                  c.addi16sp   sp, -16
                  ori          sp, s5, 1716
                  c.li         a0, 23
                  c.slli       gp, 1
                  xor          zero, s0, zero
                  sra          tp, a2, s11
                  mul          gp, a6, zero
                  ori          a5, sp, 1094
                  csrrsi       tp, 0x340, 18
                  c.or         s1, a3
                  srli         t4, a3, 26
                  divu         t4, s0, s8
                  divu         a7, s0, a3
                  c.or         s0, s1
                  ori          t1, s6, -589
                  sub          zero, t0, s2
                  c.addi16sp   sp, 304
                  div          t2, sp, tp
                  and          t1, s5, a4
                  csrrci       zero, 0x340, 0
                  sra          s10, a3, t4
                  c.lui        s6, 5
                  mul          s0, gp, t4
                  csrrci       s10, 0x340, 0
                  c.lui        s6, 8
                  c.mv         s0, a5
                  mulh         a1, t5, a5
                  sub          sp, s9, t2
                  nop
                  srai         s5, tp, 8
                  xor          s7, zero, s5
                  csrrc        s7, 0x340, s1
                  lui          t4, 667675
                  csrrci       ra, 0x340, 0
                  xori         a4, a1, -1338
                  xori         a1, sp, -839
                  csrrs        t2, 0x340, t0
                  c.addi       a5, -1
                  or           a3, ra, ra
                  auipc        t2, 518772
                  addi         s6, gp, -589
                  slti         a5, t2, 1624
                  c.andi       s1, 9
                  c.li         s1, -1
                  csrrc        t3, 0x340, zero
                  addi         a2, s7, -1225
                  csrrwi       sp, 0x340, 9
                  c.mv         a3, a0
                  csrrc        s2, 0x340, s10
                  xor          t3, s9, a6
                  mul          t6, a2, s11
                  c.srli       s1, 23
                  csrrw        a0, 0x340, a1
                  add          s2, a6, t4
                  c.addi16sp   sp, -16
                  c.nop
                  csrrsi       a4, 0x340, 27
                  ori          tp, s5, -1110
                  c.xor        a5, a2
                  mulhu        t0, s11, t3
                  sra          t4, a5, a0
                  c.add        s10, sp
                  csrrw        s6, 0x340, a7
                  c.sub        a4, s1
                  ori          s8, zero, 585
                  c.and        s0, a0
                  c.nop
                  nop
                  csrrc        t0, 0x340, t6
                  csrrs        sp, 0x340, zero
                  csrrc        a4, 0x340, zero
                  addi         a4, zero, -720
                  c.srai       a2, 26
                  div          t5, t5, t0
                  add          t1, zero, t2
                  sll          s2, a5, a2
                  mul          a6, s9, s8
                  and          a6, zero, t4
                  ori          zero, s3, 1720
                  slti         a7, a6, -670
                  csrrci       t3, 0x340, 1
                  c.sub        a1, a0
                  divu         t1, a5, a0
                  c.andi       s0, -1
                  slt          s5, t3, s7
                  remu         t4, a0, a4
                  csrrs        t0, 0x340, zero
                  c.add        a6, t0
                  c.mv         a5, t4
                  c.slli       a3, 13
                  sll          a6, t0, s3
                  auipc        t4, 787057
                  mulhu        t5, s2, ra
                  c.li         a7, -1
                  xor          t2, zero, a2
                  c.slli       t5, 26
                  div          s7, s11, gp
                  c.xor        s1, a4
                  c.addi16sp   sp, 352
                  slt          a1, ra, t1
                  divu         sp, s4, a5
                  csrrwi       a0, 0x340, 12
                  slti         t6, s6, 407
                  slli         s8, s0, 26
                  sra          s6, a2, a1
                  c.sub        a4, s1
                  mul          a4, s0, zero
                  srl          ra, t2, sp
                  div          t6, gp, gp
                  c.and        a5, a1
                  c.mv         a1, t5
                  slli         sp, t3, 13
                  csrrw        a5, 0x340, zero
                  mul          gp, a6, s0
                  rem          a5, a7, s8
                  c.slli       s2, 12
                  csrrci       t1, 0x340, 11
                  or           a4, t4, a3
                  sll          s0, s3, s3
                  srl          a7, gp, s3
                  or           a7, s10, tp
                  mulh         a2, s1, a7
                  mulhsu       sp, s10, s9
                  csrrwi       s8, 0x340, 2
                  sra          s0, a7, s6
                  and          gp, a2, t3
                  srli         t3, a3, 24
                  c.srli       a5, 10
                  divu         a1, s10, a1
                  c.addi16sp   sp, 160
                  srl          t0, a6, s7
                  c.xor        s1, s0
                  c.lui        a6, 31
                  slli         sp, a0, 22
                  c.sub        a2, a5
                  c.mv         sp, a2
                  c.srli       a5, 10
                  auipc        t4, 389011
                  and          t6, sp, s6
                  srli         s2, sp, 7
                  csrrs        s6, 0x340, zero
                  srai         a0, t2, 8
                  mulhu        s0, a4, a3
                  sra          t5, s4, s4
                  nop
                  remu         a2, s2, s8
                  sll          t2, t1, ra
                  slt          t5, t4, ra
                  c.slli       ra, 10
                  sra          a1, a2, s3
                  nop
                  srai         s8, s4, 19
                  sra          s8, t2, s5
                  c.addi16sp   sp, -16
                  xori         s8, a7, 980
                  lui          zero, 203106
                  lui          gp, 827545
                  sltiu        ra, t2, 1723
                  c.or         a5, s0
                  c.addi4spn   a5, sp, 96
                  c.addi4spn   a3, sp, 160
                  csrrci       tp, 0x340, 31
                  c.andi       a5, -1
                  srai         a6, a7, 8
                  rem          t6, s8, t2
                  csrrsi       t2, 0x340, 0
                  csrrsi       t1, 0x340, 0
                  c.andi       s0, 14
                  c.slli       t0, 12
                  srli         a5, s8, 29
                  c.sub        a1, a4
                  andi         a6, ra, 1169
                  nop
                  c.li         t1, -1
                  addi         a0, a6, -538
                  sltiu        ra, s7, 585
                  mul          s1, s3, t5
                  c.srai       a1, 4
                  addi         zero, s5, -673
                  or           t3, a5, sp
                  csrrwi       a3, 0x340, 31
                  xori         a4, t3, -1831
                  c.addi16sp   sp, 16
                  slti         s1, s8, -418
                  c.addi       t6, 25
                  slt          s5, tp, s3
                  sub          a5, t5, s6
                  c.srli       a5, 20
                  csrrs        s7, 0x340, zero
                  c.nop
                  mul          t0, s8, s8
                  c.srli       s1, 8
                  xori         a5, s9, 1381
                  csrrc        a0, 0x340, a4
                  slli         sp, a0, 5
                  auipc        ra, 917982
                  sltu         s5, t3, s1
                  c.srli       a5, 6
                  srai         s6, tp, 25
                  mulhsu       a0, zero, t3
                  xor          s8, s9, s0
                  add          a0, t3, sp
                  auipc        gp, 246720
                  addi         t6, s4, 855
                  c.nop
                  slt          zero, s10, s5
                  c.addi       a2, 24
                  sll          a7, s1, s1
                  c.li         s0, 6
                  ori          a4, a7, 1359
                  c.and        a0, s1
                  c.or         a1, a3
                  addi         s10, s7, -1851
                  slt          t0, s4, t4
                  c.or         s0, a4
                  c.li         s2, -1
                  c.mv         t3, gp
                  c.sub        s1, s0
                  c.andi       s1, 23
                  c.srai       s0, 5
                  c.sub        a0, a2
                  sltiu        s4, a3, 2006
                  c.and        s1, s1
                  csrrw        s7, 0x340, t4
                  c.lui        s5, 2
                  mulhu        s5, t6, gp
                  auipc        zero, 874432
                  ori          a3, a0, -931
                  sub          a0, t3, t2
                  lui          a1, 17729
                  div          a5, tp, sp
                  csrrs        t0, 0x340, a7
                  srli         t4, s1, 29
                  sltiu        s0, a2, 1077
                  slt          s6, a0, s1
                  rem          s2, sp, s2
                  c.nop
                  c.nop
                  slti         s1, t1, 698
                  ori          t3, a2, 930
                  c.andi       a4, 28
                  c.or         s1, a2
                  remu         t6, t3, t5
                  csrrw        t5, 0x340, s11
                  srli         t1, s3, 30
                  csrrwi       t3, 0x340, 2
                  sub          t2, a3, s10
                  nop
                  c.addi       t4, 4
                  xor          s8, s8, s3
                  csrrw        t3, 0x340, a1
                  div          s10, s4, s0
                  csrrwi       s4, 0x340, 19
                  sltu         s2, ra, ra
                  c.li         tp, 8
                  c.and        a2, a5
                  mulhsu       zero, t5, t5
                  sltiu        s0, tp, -959
                  srli         s0, t5, 13
                  c.srai       s1, 25
                  c.addi       t0, -1
                  csrrw        s1, 0x340, a2
                  c.add        t3, t6
                  addi         t4, s6, 1347
                  auipc        s5, 296112
                  and          t0, s4, s5
                  csrrci       s2, 0x340, 30
                  csrrw        t5, 0x340, s4
                  mulhsu       s6, s2, s11
                  c.nop
                  c.nop
                  slli         tp, s11, 9
                  c.srai       a3, 10
                  lui          tp, 600614
                  divu         s4, a6, s2
                  c.li         tp, -1
                  sltiu        t3, t5, -589
                  csrrs        t0, 0x340, sp
                  csrrc        a4, 0x340, zero
                  sub          zero, a5, s6
                  c.xor        a4, a4
                  c.nop
                  sra          a5, t3, a6
                  rem          s1, zero, t1
                  sra          s1, s4, s4
                  ori          s0, s2, 199
                  c.lui        a0, 11
                  or           a7, t5, a2
                  slli         s10, a3, 18
                  addi         s5, a6, -897
                  c.add        a5, t4
                  c.add        t6, t3
                  csrrs        t5, 0x340, zero
                  and          a5, s0, a4
                  c.and        s0, a1
                  lui          t1, 1024361
                  c.addi       t4, 20
                  xor          s1, t1, s10
                  xori         a3, s9, -1711
                  remu         a7, a0, t6
                  slli         a2, a4, 11
                  csrrw        s4, 0x340, a3
                  sltu         sp, zero, t0
                  c.srai       a3, 24
                  andi         a0, a0, -852
                  c.slli       s1, 11
                  c.srai       a1, 6
                  or           t5, s11, a6
                  remu         a4, s7, ra
                  c.addi4spn   a4, sp, 928
                  sub          a1, t4, s4
                  csrrc        t6, 0x340, zero
                  srai         s5, t5, 28
                  xori         a3, t1, -1019
                  csrrs        s2, 0x340, t6
                  xor          sp, a0, a7
                  c.or         a5, a2
                  nop
                  c.andi       a0, -1
                  sra          s6, s10, s11
                  mul          a6, s5, s9
                  csrrci       t1, 0x340, 0
                  mul          s7, a2, s0
                  c.add        s2, s5
                  sltiu        a4, s11, -1479
                  sub          gp, s4, a0
                  srli         gp, a3, 14
                  sll          t6, a2, t2
                  mulhu        t1, s8, s2
                  c.sub        a2, s0
                  c.sub        a3, a4
                  c.li         a2, 30
                  c.slli       t3, 23
                  divu         tp, gp, tp
                  divu         s0, a5, zero
                  mulhsu       t2, s4, s1
                  csrrc        a0, 0x340, zero
                  and          sp, sp, sp
                  c.li         s2, 22
                  sltiu        t5, t6, -626
                  lui          a6, 626515
                  csrrwi       zero, 0x340, 13
                  c.addi4spn   s1, sp, 544
                  c.andi       a4, -1
                  srai         t4, t4, 19
                  c.lui        a2, 24
                  mulh         t6, a1, ra
                  csrrs        s1, 0x340, sp
                  c.addi4spn   a1, sp, 160
                  c.andi       a4, 14
                  c.nop
                  c.addi       sp, -1
                  c.or         a0, a1
                  addi         ra, s9, -1552
                  andi         a1, a3, -1076
                  csrrc        a4, 0x340, t1
                  lui          a1, 684559
                  c.addi       tp, -1
                  sltiu        t2, a2, -1663
                  div          t1, s1, a0
                  mulhsu       ra, s3, s10
                  c.srai       a1, 19
                  c.lui        s0, 20
                  mul          gp, s9, t5
                  srl          t3, sp, t3
                  or           a6, t1, s8
                  c.or         a3, s1
                  c.and        a5, a4
                  srli         a4, t5, 5
                  ori          t2, a5, 2003
                  c.lui        ra, 26
                  mulh         tp, s8, t2
                  c.or         a5, a2
                  c.lui        a0, 28
                  csrrci       zero, 0x340, 0
                  c.li         t5, 8
                  auipc        s6, 62674
                  sub          s0, t6, t2
                  srl          zero, a6, s7
                  csrrci       a3, 0x340, 0
                  sub          t1, s10, a3
                  c.add        t2, s4
                  sltiu        s0, s8, 95
                  csrrsi       s8, 0x340, 0
                  ori          t3, t4, 1009
                  sll          t0, ra, s4
                  add          s2, s1, tp
                  srai         sp, a5, 22
                  div          t5, a7, s4
                  slt          t5, a2, t2
                  slli         tp, t0, 4
                  c.and        a5, a3
                  csrrsi       t5, 0x340, 0
                  xor          t0, a4, a2
                  csrrwi       a3, 0x340, 31
                  sll          s8, s6, t4
                  c.sub        s1, a4
                  csrrw        t0, 0x340, s0
                  c.slli       t3, 4
                  lui          zero, 590752
                  c.addi4spn   s1, sp, 752
                  srl          tp, zero, a2
                  addi         a2, s4, -300
                  c.sub        s0, a3
                  lui          s0, 258846
                  slli         s6, a2, 31
                  mulhsu       t1, a4, t3
                  slti         a0, t1, -768
                  lui          a5, 619489
                  sll          a6, s10, t4
                  slti         a2, a7, -861
                  c.addi4spn   a0, sp, 816
                  c.sub        s1, s0
                  addi         s5, t2, 559
                  rem          s6, zero, t0
                  add          t2, t4, s1
                  nop
                  c.slli       s10, 24
                  xori         a1, t2, 1397
                  xori         sp, a0, 845
                  mulh         s4, s1, t0
                  csrrc        s4, 0x340, zero
                  csrrci       s6, 0x340, 29
                  lui          t1, 459426
                  lui          s7, 445291
                  csrrc        t4, 0x340, t4
                  csrrsi       t1, 0x340, 0
                  c.addi4spn   s1, sp, 752
                  mul          t0, tp, s6
                  csrrc        t2, 0x340, zero
                  ori          a7, s5, -1027
                  c.addi16sp   sp, 192
                  nop
                  andi         ra, tp, -279
                  c.sub        s1, s0
                  addi         a6, s5, -1476
                  auipc        sp, 977971
                  mul          s0, a3, s0
                  c.nop
                  c.li         gp, -1
                  add          s0, t6, s5
                  sltu         ra, s4, s7
                  c.nop
                  sltu         zero, t3, a6
                  srli         s2, s5, 14
                  mul          t0, a3, s0
                  c.slli       s10, 23
                  mul          a1, a1, s4
                  csrrc        a5, 0x340, zero
                  mul          s10, a1, t1
                  csrrci       t5, 0x340, 11
                  csrrc        t0, 0x340, s2
                  remu         t3, tp, s6
                  c.srai       a0, 17
                  srli         t3, a5, 1
                  c.sub        a2, a2
                  c.xor        a1, s1
                  c.add        s0, t6
                  c.srli       a2, 2
                  nop
                  mulh         t3, t6, s5
                  srai         a6, a2, 22
                  mulhsu       s7, t2, a4
                  c.mv         a7, t3
                  add          t1, t5, a4
                  xor          s0, a1, t2
                  remu         t5, a7, t1
                  xori         a2, s2, 201
                  sll          a3, a7, s3
                  mulhu        a0, a2, a3
                  and          s0, t3, s1
                  c.nop
                  c.mv         ra, s9
                  sltiu        zero, s10, -1469
                  c.mv         t1, t0
                  xor          a6, a4, s8
                  srl          zero, a3, s10
                  c.sub        a4, a2
                  csrrw        a7, 0x340, a1
                  or           s1, a4, tp
                  csrrw        t5, 0x340, s8
                  c.addi4spn   a5, sp, 464
                  mulh         s5, s6, a4
                  and          gp, a0, s1
                  mul          s10, t2, s7
                  sltiu        s10, t2, -1399
                  sub          a2, s3, s10
                  rem          t1, t3, a2
                  sltiu        a3, s11, -740
                  c.or         a3, a0
                  srai         s8, s6, 14
                  mul          s8, t3, s4
                  sub          a0, s1, s6
                  c.addi16sp   sp, 384
                  slti         tp, s8, 449
                  add          s6, s1, a7
                  srli         s4, s3, 21
                  c.xor        a5, a3
                  and          s5, a7, t3
                  srli         t1, a2, 27
                  c.and        a1, a5
                  divu         t3, s11, s5
                  xori         s4, a2, -933
                  sltiu        a0, s6, 391
                  nop
                  srai         s1, s9, 14
                  auipc        ra, 130616
                  slt          s4, a2, a0
                  c.and        a4, a1
                  remu         t3, s2, zero
                  c.and        s1, a1
                  slli         s2, t2, 27
                  c.or         s0, a0
                  c.xor        a5, a5
                  c.andi       a0, 12
                  xor          s7, a0, t4
                  xor          a4, sp, t4
                  c.slli       a4, 27
                  csrrci       a2, 0x340, 0
                  mulh         gp, t3, a1
                  c.andi       a0, -1
                  csrrci       t3, 0x340, 0
                  c.slli       s10, 3
                  sll          s0, a7, s1
                  c.add        s8, a4
                  andi         a5, t5, -1235
                  srai         s0, gp, 30
                  c.sub        a0, a1
                  csrrwi       a6, 0x340, 20
                  srai         a1, s2, 0
                  c.srai       a0, 22
                  slli         a3, t2, 22
                  or           a2, t1, s3
                  addi         s4, t4, -898
                  sll          t6, a1, s7
                  xori         s7, s0, -961
                  mulhu        s2, t1, a1
                  auipc        a7, 234428
                  sltiu        a3, t4, 1984
                  csrrc        s6, 0x340, s10
                  c.andi       a2, 20
                  srl          s5, s8, a5
                  xori         a7, a4, -1545
                  mulh         s4, a0, a7
                  slli         s8, a1, 28
                  c.addi16sp   sp, 112
                  c.srli       a1, 27
                  srli         s6, a0, 19
                  csrrs        t1, 0x340, a2
                  c.sub        a0, a5
                  sll          a4, s4, s11
                  c.or         a5, a2
                  add          s5, a3, s9
                  c.or         a4, s0
                  mulh         a4, s0, a6
                  c.mv         t5, tp
                  c.add        a1, s10
                  csrrc        s1, 0x340, zero
                  c.nop
                  xor          t3, gp, sp
                  csrrw        a6, 0x340, a6
                  csrrc        a1, 0x340, zero
                  xori         s8, s7, 1464
                  sra          gp, t4, s0
                  csrrc        t3, 0x340, zero
                  or           a7, ra, s6
                  c.andi       s0, 11
                  c.and        a0, s0
                  add          tp, a6, s8
                  csrrs        a2, 0x340, s6
                  c.xor        a3, a0
                  c.srai       s1, 28
                  c.xor        a5, a5
                  mulh         t6, a1, t4
                  srai         a5, s0, 28
                  csrrw        s0, 0x340, t3
                  csrrs        a2, 0x340, zero
                  c.slli       s2, 17
                  divu         s2, sp, gp
                  ori          t2, s8, 1073
                  or           t6, t3, t5
                  c.srai       a1, 8
                  auipc        t0, 531283
                  nop
                  lui          a3, 31095
                  srl          t0, gp, zero
                  xor          a7, s2, s2
                  mulh         s4, t1, a3
                  xori         zero, a1, -335
                  mulhsu       ra, a7, t6
                  slt          t6, sp, a3
                  c.lui        s0, 31
                  xor          a6, s4, t3
                  csrrsi       s6, 0x340, 0
                  mulhsu       ra, t5, zero
                  mulhsu       a6, s4, a6
                  csrrs        s2, 0x340, t5
                  csrrci       s0, 0x340, 0
                  sub          a4, s5, s3
                  c.addi4spn   a1, sp, 144
                  c.srai       a4, 4
                  sll          zero, s5, a3
                  c.and        a2, s0
                  nop
                  sltiu        s10, a0, -655
                  mul          a1, s4, tp
                  srai         s4, s10, 31
                  andi         s1, a0, 1480
                  c.sub        a1, a4
                  srai         s4, s6, 9
                  sltu         t1, t2, s8
                  sub          a4, s3, s0
                  csrrc        gp, 0x340, t2
                  c.nop
                  csrrc        s8, 0x340, s2
                  nop
                  srl          s1, t2, s7
                  lui          s10, 1015981
                  c.srli       a3, 11
                  c.andi       a0, -1
                  c.and        a3, a1
                  csrrc        t1, 0x340, s11
                  slt          s8, a3, t1
                  xor          s4, sp, a5
                  c.srli       a4, 15
                  srai         a2, a4, 4
                  csrrc        ra, 0x340, zero
                  c.addi4spn   a3, sp, 624
                  sub          s1, s4, s3
                  xori         t2, t0, -152
                  div          a5, s0, t2
                  csrrsi       t4, 0x340, 0
                  div          a2, t1, s6
                  or           t4, a3, gp
                  c.xor        s1, a2
                  srli         t5, t2, 16
                  c.li         s10, 18
                  c.slli       s8, 25
                  c.srli       a5, 4
                  div          s4, t4, a1
                  mulh         t2, t1, t4
                  c.lui        ra, 31
                  rem          t1, gp, a2
                  xor          ra, s3, s11
                  csrrci       s4, 0x340, 2
                  sub          s0, t1, a7
                  srl          a1, s0, t3
                  mul          t5, a0, t4
                  c.and        a5, a0
                  c.and        a4, s0
                  div          s10, s3, gp
                  csrrc        tp, 0x340, s10
                  c.addi       t2, 9
                  c.add        s2, s8
                  csrrwi       s1, 0x340, 24
                  slti         tp, sp, 1688
                  ori          a3, s4, -837
                  mulhu        a7, s8, a0
                  csrrci       t2, 0x340, 0
                  ori          sp, a6, -289
                  sltu         s0, s6, s5
                  ori          s1, a2, -820
                  c.nop
                  c.and        s1, a3
                  c.slli       a5, 14
                  c.addi16sp   sp, 400
                  and          ra, a6, t0
                  and          a7, a1, t6
                  c.lui        gp, 2
                  c.and        s1, s1
                  c.sub        s0, a0
                  slti         t2, a7, -1182
                  csrrs        s8, 0x340, zero
                  sll          t6, t2, s10
                  mulhsu       a0, zero, t6
                  c.addi4spn   a2, sp, 976
                  nop
                  slt          a2, s0, t1
                  c.addi       t6, 8
                  c.xor        a4, a4
                  srli         t2, a6, 30
                  c.slli       s8, 31
                  csrrw        a4, 0x340, s6
                  csrrsi       tp, 0x340, 9
                  andi         a6, t6, 211
                  c.srli       a1, 18
                  mul          s1, a5, a3
                  c.srli       a0, 19
                  mul          zero, s11, a4
                  c.addi16sp   sp, -16
                  csrrs        a3, 0x340, s0
                  sltiu        s8, s6, -1555
                  srai         s7, s10, 22
                  c.add        s10, a2
                  xor          a2, ra, s4
                  c.lui        t3, 18
                  lui          tp, 412374
                  c.or         a5, a3
                  c.or         s1, a3
                  xor          s0, t0, a6
                  rem          s10, a1, s3
                  lui          t2, 213082
                  ori          a5, t0, 1360
                  c.srai       a0, 23
                  rem          s2, t4, t2
                  lui          s8, 517773
                  rem          zero, zero, a5
                  mulhsu       s5, s6, a3
                  divu         a7, a4, s2
                  mulh         a7, s6, s11
                  c.or         a5, s1
                  csrrsi       s0, 0x340, 23
                  c.add        t4, gp
                  mulhu        s6, a3, s7
                  mul          a2, tp, s1
                  c.mv         a2, s4
                  srai         s10, gp, 28
                  c.slli       s8, 13
                  c.addi16sp   sp, -16
                  c.or         s0, a1
                  andi         s4, s0, 1463
                  divu         tp, a6, a0
                  c.slli       s1, 14
                  nop
                  csrrci       a1, 0x340, 23
                  c.lui        s1, 10
                  sltu         s2, t1, t0
                  csrrwi       s8, 0x340, 18
                  xor          a6, t0, t1
                  nop
                  csrrs        sp, 0x340, t0
                  xori         s6, t2, -38
                  remu         s2, t6, a5
                  c.add        a0, a0
                  srl          s7, t2, t2
                  csrrsi       a0, 0x340, 0
                  div          a5, s3, s4
                  csrrw        a4, 0x340, s9
                  c.and        s1, a0
                  c.srai       a1, 11
                  sltiu        t2, s6, -1641
                  sll          a1, a3, s3
                  sub          t6, a0, tp
                  rem          t2, s6, t1
                  sub          a2, t2, s7
                  auipc        a1, 63941
                  c.and        a2, a3
                  sltiu        a3, ra, -637
                  lui          s2, 315878
                  remu         zero, gp, t1
                  csrrci       tp, 0x340, 17
                  c.mv         a7, gp
                  and          s6, gp, tp
                  c.and        a4, s0
                  lui          ra, 542997
                  divu         zero, a3, s3
                  srai         gp, s2, 2
                  lui          a4, 333018
                  mul          t0, s4, t2
                  csrrwi       s7, 0x340, 16
                  sll          s10, s5, s3
                  c.srli       a4, 5
                  rem          sp, a4, a5
                  csrrw        a1, 0x340, a5
                  c.and        a1, a4
                  mulh         a6, a4, t3
                  c.nop
                  rem          t2, s5, s11
                  c.li         a1, -1
                  c.li         s6, -1
                  c.sub        a1, a3
                  c.addi4spn   a1, sp, 320
                  divu         t6, a1, a3
                  mulhsu       t2, t4, a7
                  xor          zero, sp, a2
                  mulhsu       a6, a6, t0
                  lui          t6, 98966
                  divu         s6, s1, s10
                  c.srli       a2, 27
                  xori         t6, t2, -275
                  sub          t6, t4, t2
                  divu         s7, s5, tp
                  andi         s5, s10, -120
                  srli         zero, ra, 20
                  mul          sp, s8, s7
                  c.addi4spn   s1, sp, 144
                  div          tp, a7, s6
                  sub          s7, a7, t4
                  c.add        t1, sp
                  csrrs        a6, 0x340, a1
                  xori         ra, t5, 1577
                  csrrs        t3, 0x340, s0
                  lui          s8, 640496
                  c.srli       a2, 18
                  slt          a3, zero, a0
                  sub          a0, zero, s1
                  srl          a1, a4, t1
                  slli         s0, zero, 21
                  mulh         a1, t0, a0
                  c.srai       a3, 4
                  remu         t0, t4, a6
                  andi         s0, s0, -1776
                  csrrw        s8, 0x340, s2
                  csrrw        a0, 0x340, t3
                  srli         a4, sp, 25
                  csrrsi       t4, 0x340, 6
                  c.and        a1, s0
                  andi         a6, a6, -480
                  div          t6, s3, s11
                  c.and        a3, a1
                  sltu         t1, s2, t1
                  and          zero, s5, s2
                  sltu         sp, zero, a3
                  c.lui        s4, 10
                  lui          s4, 339406
                  divu         t6, t4, a7
                  srai         gp, s3, 11
                  or           a5, ra, t1
                  c.sub        a1, s0
                  c.li         t1, 13
                  c.and        a0, s0
                  csrrs        a1, 0x340, zero
                  csrrwi       zero, 0x340, 22
                  csrrw        t1, 0x340, s0
                  ori          s10, s9, -1476
                  srai         a7, s10, 15
                  ori          s2, t4, -1394
                  add          tp, s11, t1
                  sra          s1, s4, a5
                  rem          gp, a3, t3
                  csrrc        s0, 0x340, a3
                  srai         s10, ra, 31
                  csrrw        t5, 0x340, a5
                  xor          t6, s0, s10
                  csrrs        a1, 0x340, zero
                  c.xor        a2, a1
                  auipc        t6, 817898
                  addi         ra, zero, 1837
                  sra          a3, sp, t6
                  c.sub        a0, a1
                  c.sub        a5, a1
                  mulhu        sp, t0, a5
                  and          s4, t2, a2
                  csrrwi       t2, 0x340, 15
                  srai         a0, s4, 24
                  c.li         t0, 1
                  csrrs        a7, 0x340, zero
                  slli         t5, t1, 19
                  srli         t4, a1, 23
                  rem          gp, t0, s5
                  srli         s6, s3, 17
                  csrrw        t0, 0x340, a7
                  divu         gp, a6, gp
                  mulhu        a2, a7, gp
                  c.addi       a3, -1
                  rem          t1, ra, s8
                  c.nop
                  andi         a4, a5, 213
                  c.add        t0, s3
                  c.nop
                  c.lui        t5, 17
                  slli         t1, s3, 29
                  c.addi       s0, -1
                  c.nop
                  rem          t5, t6, s9
                  csrrci       gp, 0x340, 23
                  add          a7, s4, t2
                  srai         s1, s1, 6
                  srl          s5, t1, t2
                  c.addi16sp   sp, -16
                  c.add        t1, t0
                  remu         ra, a0, a5
                  mulhsu       t6, t1, a3
                  mulh         t0, sp, s1
                  slti         t4, a7, -901
                  c.addi16sp   sp, -16
                  c.add        a7, s9
                  ori          a2, ra, -1352
                  c.slli       a5, 1
                  or           zero, gp, s5
                  sltiu        t6, tp, -1687
                  auipc        t6, 489281
                  nop
                  lui          gp, 857467
                  c.and        a4, s1
                  la x27, test_done
                  jalr x0, x27, 0
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
                  li x2, 0x8ffffffc
                  li x15, 0xd
                  slli x15, x15, 8
                  addi x15, x15, 0x0
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x342
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x342
                  sw x15, 0(x2)
                  csrr  x15, 0x341
                  addi  x15, x15, 4
                  csrw  0x341, x15
                  add x19, x25, zero
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
                  add x25, x19, zero
                  lw  x19, (x25)
                  addi x25, x25, 4
                  mret

illegal_instr_handler:
                  li x2, 0x8ffffffc
                  li x15, 0xa
                  slli x15, x15, 8
                  addi x15, x15, 0x0
                  sw x15, 0(x2)
                  li x2, 0x8ffffffc
                  li x15, 0x342
                  slli x15, x15, 8
                  addi x15, x15, 0x3
                  sw x15, 0(x2)
                  csrr x15, 0x342
                  sw x15, 0(x2)
                  csrr  x15, 0x341
                  addi  x15, x15, 4
                  csrw  0x341, x15
                  add x19, x25, zero
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
                  add x25, x19, zero
                  lw  x19, (x25)
                  addi x25, x25, 4
                  mret

pt_fault_handler: 
                  li x2, 0x8ffffffc
                  li x15, 0x8
                  slli x15, x15, 8
                  addi x15, x15, 0x0
                  sw x15, 0(x2)
                  nop

.align 2
mmode_intr_handler:
                  csrr  x15, 0x300 # MSTATUS;
                  csrr  x15, 0x304 # MIE;
                  csrr  x15, 0x344 # MIP;
                  csrrc x15, 0x344, x15 # MIP;
                  li x2, 0x8ffffffc
                  li x15, 0x7
                  slli x15, x15, 8
                  addi x15, x15, 0x0
                  sw x15, 0(x2)
                  add x19, x25, zero
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
                  add x25, x19, zero
                  lw  x19, (x25)
                  addi x25, x25, 4
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
