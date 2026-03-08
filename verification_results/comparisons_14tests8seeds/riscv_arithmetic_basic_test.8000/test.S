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
                  li x29, 0x40001106
                  csrw 0x301, x29
kernel_sp:        
                  la x25, kernel_stack_end

trap_vec_init:    
                  la x29, mtvec_handler
                  ori x29, x29, 1
                  csrw 0x305, x29 # MTVEC

pmp_setup:        
                  csrwi 0x747, 4
                  la x31, main
                  li x29, 0x0
                  add x31, x31, x29
                  srli x31, x31, 2
                  csrw 0x3b0, x31
                  la x31, main
                  li x29, 0x11111111
                  add x31, x31, x29
                  srli x31, x31, 2
                  csrw 0x3b1, x31
                  la x31, main
                  li x29, 0x22222222
                  add x31, x31, x29
                  srli x31, x31, 2
                  csrw 0x3b2, x31
                  la x31, main
                  li x29, 0x33333333
                  add x31, x31, x29
                  srli x31, x31, 2
                  csrw 0x3b3, x31
                  li x31, 0xf0f0f0f
                  csrw 0x3a0, x31
                  la x31, main
                  li x29, 0x44444444
                  add x31, x31, x29
                  srli x31, x31, 2
                  csrw 0x3b4, x31
                  la x31, main
                  li x29, 0x55555555
                  add x31, x31, x29
                  srli x31, x31, 2
                  csrw 0x3b5, x31
                  la x31, main
                  li x29, 0x66666666
                  add x31, x31, x29
                  srli x31, x31, 2
                  csrw 0x3b6, x31
                  la x31, main
                  li x29, 0x77777777
                  add x31, x31, x29
                  srli x31, x31, 2
                  csrw 0x3b7, x31
                  li x31, 0xf0f0f0f
                  csrw 0x3a1, x31
                  la x31, main
                  li x29, 0x88888888
                  add x31, x31, x29
                  srli x31, x31, 2
                  csrw 0x3b8, x31
                  la x31, main
                  li x29, 0x99999999
                  add x31, x31, x29
                  srli x31, x31, 2
                  csrw 0x3b9, x31
                  la x31, main
                  li x29, 0xaaaaaaaa
                  add x31, x31, x29
                  srli x31, x31, 2
                  csrw 0x3ba, x31
                  la x31, main
                  li x29, 0xbbbbbbbb
                  add x31, x31, x29
                  srli x31, x31, 2
                  csrw 0x3bb, x31
                  li x31, 0xf0f0f0f
                  csrw 0x3a2, x31
                  la x31, main
                  li x29, 0xcccccccc
                  add x31, x31, x29
                  srli x31, x31, 2
                  csrw 0x3bc, x31
                  la x31, main
                  li x29, 0xdddddddd
                  add x31, x31, x29
                  srli x31, x31, 2
                  csrw 0x3bd, x31
                  la x31, main
                  li x29, 0xeeeeeeee
                  add x31, x31, x29
                  srli x31, x31, 2
                  csrw 0x3be, x31
                  la x31, main
                  li x29, 0xffffffff
                  add x31, x31, x29
                  srli x31, x31, 2
                  csrw 0x3bf, x31
                  li x31, 0xf0f0f0f
                  csrw 0x3a3, x31

mepc_setup:       
                  la x29, init
                  csrw 0x341, x29

custom_csr_setup: 
                  csrwi 0x7c0, 1

init_machine_mode:
                  li x29, 0x1800
                  csrw 0x300, x29 # MSTATUS
                  li x29, 0x0
                  csrw 0x304, x29 # MIE
                  li x15, 0x8ffffffc
                  li x29, 0x300
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x300
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x304
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x304
                  sw x29, 0(x15)
                  mret
init:             
                  li x0, 0x2
                  li x1, 0x80000000
                  li x2, 0x8
                  li x3, 0xfb2c2ec4
                  li x4, 0xfadce879
                  li x5, 0x80000000
                  li x6, 0xf
                  li x7, 0x834aff3d
                  li x8, 0x0
                  li x9, 0x80000000
                  li x10, 0xfc76e4c9
                  li x11, 0x80000000
                  li x12, 0x0
                  li x13, 0xb76a3cb8
                  li x14, 0x0
                  li x15, 0xf5e2d1bd
                  li x16, 0x0
                  li x17, 0xf84394fe
                  li x18, 0x80000000
                  li x20, 0x0
                  li x21, 0xfbac2d00
                  li x22, 0x0
                  li x23, 0x46a938a7
                  li x24, 0x80000000
                  li x26, 0xf92712f8
                  li x27, 0xa4a7fb50
                  li x28, 0x80000000
                  li x29, 0x80000000
                  li x30, 0xd
                  li x31, 0xb
                  la x19, user_stack_end
                  li x15, 0x8ffffffc
                  li x29, 0x0
                  slli x29, x29, 8
                  addi x29, x29, 0x0
                  sw x29, 0(x15)
                  j main
test_done:        
                  li x15, 0x8ffffff8
                  li x29, 0x0
                  slli x29, x29, 8
                  addi x29, x29, 0x1
                  sw x29, 0(x15)
                  ecall

test_fail:        
                  li x15, 0x8ffffff8
                  li x29, 0x1
                  slli x29, x29, 8
                  addi x29, x29, 0x1
                  sw x29, 0(x15)
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
                  li x15, 0x8ffffffc
                  li x29, 0x6
                  slli x29, x29, 8
                  addi x29, x29, 0x0
                  sw x29, 0(x15)
                  csrr x29, 0x342 # MCAUSE
                  srli x29, x29, 0x1f
                  beqz x29, 1f
                  li x15, 0x8ffffffc
                  li x29, 0x300
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x300
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x342
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x342
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x304
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x304
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x344
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x344
                  sw x29, 0(x15)
                  j mmode_intr_handler
                  1: la x31, test_done
                  jalr x0, x31, 0

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
                  li x15, 0x8ffffffc
                  li x29, 0x6
                  slli x29, x29, 8
                  addi x29, x29, 0x0
                  sw x29, 0(x15)
                  csrr x29, 0x342 # MCAUSE
                  srli x29, x29, 0x1f
                  beqz x29, 1f
                  li x15, 0x8ffffffc
                  li x29, 0x300
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x300
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x342
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x342
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x304
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x304
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x344
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x344
                  sw x29, 0(x15)
                  j mmode_intr_handler
                  1: la x31, test_done
                  jalr x0, x31, 0

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
                  li x15, 0x8ffffffc
                  li x29, 0x6
                  slli x29, x29, 8
                  addi x29, x29, 0x0
                  sw x29, 0(x15)
                  csrr x29, 0x342 # MCAUSE
                  srli x29, x29, 0x1f
                  beqz x29, 1f
                  li x15, 0x8ffffffc
                  li x29, 0x300
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x300
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x342
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x342
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x304
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x304
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x344
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x344
                  sw x29, 0(x15)
                  j mmode_intr_handler
                  1: la x31, test_done
                  jalr x0, x31, 0

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
                  li x15, 0x8ffffffc
                  li x29, 0x6
                  slli x29, x29, 8
                  addi x29, x29, 0x0
                  sw x29, 0(x15)
                  csrr x29, 0x342 # MCAUSE
                  srli x29, x29, 0x1f
                  beqz x29, 1f
                  li x15, 0x8ffffffc
                  li x29, 0x300
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x300
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x342
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x342
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x304
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x304
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x344
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x344
                  sw x29, 0(x15)
                  j mmode_intr_handler
                  1: la x31, test_done
                  jalr x0, x31, 0

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
                  li x15, 0x8ffffffc
                  li x29, 0x6
                  slli x29, x29, 8
                  addi x29, x29, 0x0
                  sw x29, 0(x15)
                  csrr x29, 0x342 # MCAUSE
                  srli x29, x29, 0x1f
                  beqz x29, 1f
                  li x15, 0x8ffffffc
                  li x29, 0x300
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x300
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x342
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x342
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x304
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x304
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x344
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x344
                  sw x29, 0(x15)
                  j mmode_intr_handler
                  1: la x31, test_done
                  jalr x0, x31, 0

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
                  li x15, 0x8ffffffc
                  li x29, 0x6
                  slli x29, x29, 8
                  addi x29, x29, 0x0
                  sw x29, 0(x15)
                  csrr x29, 0x342 # MCAUSE
                  srli x29, x29, 0x1f
                  beqz x29, 1f
                  li x15, 0x8ffffffc
                  li x29, 0x300
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x300
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x342
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x342
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x304
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x304
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x344
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x344
                  sw x29, 0(x15)
                  j mmode_intr_handler
                  1: la x31, test_done
                  jalr x0, x31, 0

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
                  li x15, 0x8ffffffc
                  li x29, 0x6
                  slli x29, x29, 8
                  addi x29, x29, 0x0
                  sw x29, 0(x15)
                  csrr x29, 0x342 # MCAUSE
                  srli x29, x29, 0x1f
                  beqz x29, 1f
                  li x15, 0x8ffffffc
                  li x29, 0x300
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x300
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x342
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x342
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x304
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x304
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x344
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x344
                  sw x29, 0(x15)
                  j mmode_intr_handler
                  1: la x31, test_done
                  jalr x0, x31, 0

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
                  li x15, 0x8ffffffc
                  li x29, 0x6
                  slli x29, x29, 8
                  addi x29, x29, 0x0
                  sw x29, 0(x15)
                  csrr x29, 0x342 # MCAUSE
                  srli x29, x29, 0x1f
                  beqz x29, 1f
                  li x15, 0x8ffffffc
                  li x29, 0x300
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x300
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x342
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x342
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x304
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x304
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x344
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x344
                  sw x29, 0(x15)
                  j mmode_intr_handler
                  1: la x31, test_done
                  jalr x0, x31, 0

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
                  li x15, 0x8ffffffc
                  li x29, 0x6
                  slli x29, x29, 8
                  addi x29, x29, 0x0
                  sw x29, 0(x15)
                  csrr x29, 0x342 # MCAUSE
                  srli x29, x29, 0x1f
                  beqz x29, 1f
                  li x15, 0x8ffffffc
                  li x29, 0x300
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x300
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x342
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x342
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x304
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x304
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x344
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x344
                  sw x29, 0(x15)
                  j mmode_intr_handler
                  1: la x31, test_done
                  jalr x0, x31, 0

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
                  li x15, 0x8ffffffc
                  li x29, 0x6
                  slli x29, x29, 8
                  addi x29, x29, 0x0
                  sw x29, 0(x15)
                  csrr x29, 0x342 # MCAUSE
                  srli x29, x29, 0x1f
                  beqz x29, 1f
                  li x15, 0x8ffffffc
                  li x29, 0x300
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x300
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x342
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x342
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x304
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x304
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x344
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x344
                  sw x29, 0(x15)
                  j mmode_intr_handler
                  1: la x31, test_done
                  jalr x0, x31, 0

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
                  li x15, 0x8ffffffc
                  li x29, 0x6
                  slli x29, x29, 8
                  addi x29, x29, 0x0
                  sw x29, 0(x15)
                  csrr x29, 0x342 # MCAUSE
                  srli x29, x29, 0x1f
                  beqz x29, 1f
                  li x15, 0x8ffffffc
                  li x29, 0x300
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x300
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x342
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x342
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x304
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x304
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x344
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x344
                  sw x29, 0(x15)
                  j mmode_intr_handler
                  1: la x31, test_done
                  jalr x0, x31, 0

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
                  li x15, 0x8ffffffc
                  li x29, 0x6
                  slli x29, x29, 8
                  addi x29, x29, 0x0
                  sw x29, 0(x15)
                  csrr x29, 0x342 # MCAUSE
                  srli x29, x29, 0x1f
                  beqz x29, 1f
                  li x15, 0x8ffffffc
                  li x29, 0x300
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x300
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x342
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x342
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x304
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x304
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x344
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x344
                  sw x29, 0(x15)
                  j mmode_intr_handler
                  1: la x31, test_done
                  jalr x0, x31, 0

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
                  li x15, 0x8ffffffc
                  li x29, 0x6
                  slli x29, x29, 8
                  addi x29, x29, 0x0
                  sw x29, 0(x15)
                  csrr x29, 0x342 # MCAUSE
                  srli x29, x29, 0x1f
                  beqz x29, 1f
                  li x15, 0x8ffffffc
                  li x29, 0x300
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x300
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x342
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x342
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x304
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x304
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x344
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x344
                  sw x29, 0(x15)
                  j mmode_intr_handler
                  1: la x31, test_done
                  jalr x0, x31, 0

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
                  li x15, 0x8ffffffc
                  li x29, 0x6
                  slli x29, x29, 8
                  addi x29, x29, 0x0
                  sw x29, 0(x15)
                  csrr x29, 0x342 # MCAUSE
                  srli x29, x29, 0x1f
                  beqz x29, 1f
                  li x15, 0x8ffffffc
                  li x29, 0x300
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x300
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x342
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x342
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x304
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x304
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x344
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x344
                  sw x29, 0(x15)
                  j mmode_intr_handler
                  1: la x31, test_done
                  jalr x0, x31, 0

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
                  li x15, 0x8ffffffc
                  li x29, 0x6
                  slli x29, x29, 8
                  addi x29, x29, 0x0
                  sw x29, 0(x15)
                  csrr x29, 0x342 # MCAUSE
                  srli x29, x29, 0x1f
                  beqz x29, 1f
                  li x15, 0x8ffffffc
                  li x29, 0x300
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x300
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x342
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x342
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x304
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x304
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x344
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x344
                  sw x29, 0(x15)
                  j mmode_intr_handler
                  1: la x31, test_done
                  jalr x0, x31, 0

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
                  li x15, 0x8ffffffc
                  li x29, 0x6
                  slli x29, x29, 8
                  addi x29, x29, 0x0
                  sw x29, 0(x15)
                  csrr x29, 0x342 # MCAUSE
                  srli x29, x29, 0x1f
                  beqz x29, 1f
                  li x15, 0x8ffffffc
                  li x29, 0x300
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x300
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x342
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x342
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x304
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x304
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x344
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x344
                  sw x29, 0(x15)
                  j mmode_intr_handler
                  1: la x31, test_done
                  jalr x0, x31, 0

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
                  li x15, 0x8ffffffc
                  li x29, 0x6
                  slli x29, x29, 8
                  addi x29, x29, 0x0
                  sw x29, 0(x15)
                  csrr x29, 0x342 # MCAUSE
                  srli x29, x29, 0x1f
                  beqz x29, 1f
                  li x15, 0x8ffffffc
                  li x29, 0x300
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x300
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x342
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x342
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x304
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x304
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x344
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x344
                  sw x29, 0(x15)
                  j mmode_intr_handler
                  1: la x31, test_done
                  jalr x0, x31, 0

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
                  li x15, 0x8ffffffc
                  li x29, 0x6
                  slli x29, x29, 8
                  addi x29, x29, 0x0
                  sw x29, 0(x15)
                  csrr x29, 0x342 # MCAUSE
                  srli x29, x29, 0x1f
                  beqz x29, 1f
                  li x15, 0x8ffffffc
                  li x29, 0x300
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x300
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x342
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x342
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x304
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x304
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x344
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x344
                  sw x29, 0(x15)
                  j mmode_intr_handler
                  1: la x31, test_done
                  jalr x0, x31, 0

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
                  li x15, 0x8ffffffc
                  li x29, 0x6
                  slli x29, x29, 8
                  addi x29, x29, 0x0
                  sw x29, 0(x15)
                  csrr x29, 0x342 # MCAUSE
                  srli x29, x29, 0x1f
                  beqz x29, 1f
                  li x15, 0x8ffffffc
                  li x29, 0x300
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x300
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x342
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x342
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x304
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x304
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x344
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x344
                  sw x29, 0(x15)
                  j mmode_intr_handler
                  1: la x31, test_done
                  jalr x0, x31, 0

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
                  li x15, 0x8ffffffc
                  li x29, 0x6
                  slli x29, x29, 8
                  addi x29, x29, 0x0
                  sw x29, 0(x15)
                  csrr x29, 0x342 # MCAUSE
                  srli x29, x29, 0x1f
                  beqz x29, 1f
                  li x15, 0x8ffffffc
                  li x29, 0x300
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x300
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x342
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x342
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x304
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x304
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x344
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x344
                  sw x29, 0(x15)
                  j mmode_intr_handler
                  1: la x31, test_done
                  jalr x0, x31, 0

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
                  li x15, 0x8ffffffc
                  li x29, 0x6
                  slli x29, x29, 8
                  addi x29, x29, 0x0
                  sw x29, 0(x15)
                  csrr x29, 0x342 # MCAUSE
                  srli x29, x29, 0x1f
                  beqz x29, 1f
                  li x15, 0x8ffffffc
                  li x29, 0x300
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x300
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x342
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x342
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x304
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x304
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x344
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x344
                  sw x29, 0(x15)
                  j mmode_intr_handler
                  1: la x31, test_done
                  jalr x0, x31, 0

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
                  li x15, 0x8ffffffc
                  li x29, 0x6
                  slli x29, x29, 8
                  addi x29, x29, 0x0
                  sw x29, 0(x15)
                  csrr x29, 0x342 # MCAUSE
                  srli x29, x29, 0x1f
                  beqz x29, 1f
                  li x15, 0x8ffffffc
                  li x29, 0x300
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x300
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x342
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x342
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x304
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x304
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x344
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x344
                  sw x29, 0(x15)
                  j mmode_intr_handler
                  1: la x31, test_done
                  jalr x0, x31, 0

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
                  li x15, 0x8ffffffc
                  li x29, 0x6
                  slli x29, x29, 8
                  addi x29, x29, 0x0
                  sw x29, 0(x15)
                  csrr x29, 0x342 # MCAUSE
                  srli x29, x29, 0x1f
                  beqz x29, 1f
                  li x15, 0x8ffffffc
                  li x29, 0x300
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x300
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x342
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x342
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x304
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x304
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x344
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x344
                  sw x29, 0(x15)
                  j mmode_intr_handler
                  1: la x31, test_done
                  jalr x0, x31, 0

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
                  li x15, 0x8ffffffc
                  li x29, 0x6
                  slli x29, x29, 8
                  addi x29, x29, 0x0
                  sw x29, 0(x15)
                  csrr x29, 0x342 # MCAUSE
                  srli x29, x29, 0x1f
                  beqz x29, 1f
                  li x15, 0x8ffffffc
                  li x29, 0x300
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x300
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x342
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x342
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x304
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x304
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x344
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x344
                  sw x29, 0(x15)
                  j mmode_intr_handler
                  1: la x31, test_done
                  jalr x0, x31, 0

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
                  li x15, 0x8ffffffc
                  li x29, 0x6
                  slli x29, x29, 8
                  addi x29, x29, 0x0
                  sw x29, 0(x15)
                  csrr x29, 0x342 # MCAUSE
                  srli x29, x29, 0x1f
                  beqz x29, 1f
                  li x15, 0x8ffffffc
                  li x29, 0x300
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x300
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x342
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x342
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x304
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x304
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x344
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x344
                  sw x29, 0(x15)
                  j mmode_intr_handler
                  1: la x31, test_done
                  jalr x0, x31, 0

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
                  li x15, 0x8ffffffc
                  li x29, 0x6
                  slli x29, x29, 8
                  addi x29, x29, 0x0
                  sw x29, 0(x15)
                  csrr x29, 0x342 # MCAUSE
                  srli x29, x29, 0x1f
                  beqz x29, 1f
                  li x15, 0x8ffffffc
                  li x29, 0x300
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x300
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x342
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x342
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x304
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x304
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x344
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x344
                  sw x29, 0(x15)
                  j mmode_intr_handler
                  1: la x31, test_done
                  jalr x0, x31, 0

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
                  li x15, 0x8ffffffc
                  li x29, 0x6
                  slli x29, x29, 8
                  addi x29, x29, 0x0
                  sw x29, 0(x15)
                  csrr x29, 0x342 # MCAUSE
                  srli x29, x29, 0x1f
                  beqz x29, 1f
                  li x15, 0x8ffffffc
                  li x29, 0x300
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x300
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x342
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x342
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x304
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x304
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x344
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x344
                  sw x29, 0(x15)
                  j mmode_intr_handler
                  1: la x31, test_done
                  jalr x0, x31, 0

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
                  li x15, 0x8ffffffc
                  li x29, 0x6
                  slli x29, x29, 8
                  addi x29, x29, 0x0
                  sw x29, 0(x15)
                  csrr x29, 0x342 # MCAUSE
                  srli x29, x29, 0x1f
                  beqz x29, 1f
                  li x15, 0x8ffffffc
                  li x29, 0x300
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x300
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x342
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x342
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x304
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x304
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x344
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x344
                  sw x29, 0(x15)
                  j mmode_intr_handler
                  1: la x31, test_done
                  jalr x0, x31, 0

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
                  li x15, 0x8ffffffc
                  li x29, 0x6
                  slli x29, x29, 8
                  addi x29, x29, 0x0
                  sw x29, 0(x15)
                  csrr x29, 0x342 # MCAUSE
                  srli x29, x29, 0x1f
                  beqz x29, 1f
                  li x15, 0x8ffffffc
                  li x29, 0x300
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x300
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x342
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x342
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x304
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x304
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x344
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x344
                  sw x29, 0(x15)
                  j mmode_intr_handler
                  1: la x31, test_done
                  jalr x0, x31, 0

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
                  li x15, 0x8ffffffc
                  li x29, 0x6
                  slli x29, x29, 8
                  addi x29, x29, 0x0
                  sw x29, 0(x15)
                  csrr x29, 0x342 # MCAUSE
                  srli x29, x29, 0x1f
                  beqz x29, 1f
                  li x15, 0x8ffffffc
                  li x29, 0x300
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x300
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x342
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x342
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x304
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x304
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x344
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x344
                  sw x29, 0(x15)
                  j mmode_intr_handler
                  1: la x31, test_done
                  jalr x0, x31, 0

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
                  li x15, 0x8ffffffc
                  li x29, 0x6
                  slli x29, x29, 8
                  addi x29, x29, 0x0
                  sw x29, 0(x15)
                  csrr x29, 0x342 # MCAUSE
                  srli x29, x29, 0x1f
                  beqz x29, 1f
                  li x15, 0x8ffffffc
                  li x29, 0x300
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x300
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x342
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x342
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x304
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x304
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x344
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x344
                  sw x29, 0(x15)
                  j mmode_intr_handler
                  1: la x31, test_done
                  jalr x0, x31, 0

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
                  li x15, 0x8ffffffc
                  li x29, 0x8
                  slli x29, x29, 8
                  addi x29, x29, 0x0
                  sw x29, 0(x15)
                  csrr x29, 0x341 # MEPC
                  csrr x29, 0x342 # MCAUSE
                  li x15, 0x3 # BREAKPOINT
                  beq x29, x15, ebreak_handler
                  li x15, 0x8 # ECALL_UMODE
                  beq x29, x15, ecall_handler
                  li x15, 0x9 # ECALL_SMODE
                  beq x29, x15, ecall_handler
                  li x15, 0xb # ECALL_MMODE
                  beq x29, x15, ecall_handler
                  li x15, 0x1
                  beq x29, x15, instr_fault_handler
                  li x15, 0x5
                  beq x29, x15, load_fault_handler
                  li x15, 0x7
                  beq x29, x15, store_fault_handler
                  li x15, 0xc
                  beq x29, x15, pt_fault_handler
                  li x15, 0xd
                  beq x29, x15, pt_fault_handler
                  li x15, 0xf
                  beq x29, x15, pt_fault_handler
                  li x15, 0x2 # ILLEGAL_INSTRUCTION
                  beq x29, x15, illegal_instr_handler
                  csrr x15, 0x343 # MTVAL
                  1: la x31, test_done
                  jalr x1, x31, 0

ecall_handler:    
                  li x15, 0x8ffffffc
                  li x29, 0xb00
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0xb00
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0xb80
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0xb80
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0xb03
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0xb03
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0xb83
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0xb83
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0xb04
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0xb04
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0xb84
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0xb84
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0xb05
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0xb05
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0xb85
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0xb85
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0xb06
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0xb06
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0xb86
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0xb86
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0xb07
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0xb07
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0xb87
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0xb87
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0xb08
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0xb08
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0xb88
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0xb88
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0xb09
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0xb09
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0xb89
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0xb89
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0xb0a
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0xb0a
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0xb8a
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0xb8a
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0xb0b
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0xb0b
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0xb8b
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0xb8b
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0xb0c
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0xb0c
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0xb8c
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0xb8c
                  sw x29, 0(x15)
                  la x29, _start
                  sw x0, 0(x29)
                  sw x1, 4(x29)
                  sw x2, 8(x29)
                  sw x3, 12(x29)
                  sw x4, 16(x29)
                  sw x5, 20(x29)
                  sw x6, 24(x29)
                  sw x7, 28(x29)
                  sw x8, 32(x29)
                  sw x9, 36(x29)
                  sw x10, 40(x29)
                  sw x11, 44(x29)
                  sw x12, 48(x29)
                  sw x13, 52(x29)
                  sw x14, 56(x29)
                  sw x15, 60(x29)
                  sw x16, 64(x29)
                  sw x17, 68(x29)
                  sw x18, 72(x29)
                  sw x19, 76(x29)
                  sw x20, 80(x29)
                  sw x21, 84(x29)
                  sw x22, 88(x29)
                  sw x23, 92(x29)
                  sw x24, 96(x29)
                  sw x25, 100(x29)
                  sw x26, 104(x29)
                  sw x27, 108(x29)
                  sw x28, 112(x29)
                  sw x29, 116(x29)
                  sw x30, 120(x29)
                  sw x31, 124(x29)
                  csrr  x29, 0x341
                  addi  x29, x29, 4
                  csrw  0x341, x29
                  mret

instr_fault_handler:
                  li x15, 0x8ffffffc
                  li x29, 0x9
                  slli x29, x29, 8
                  addi x29, x29, 0x0
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x342
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x342
                  sw x29, 0(x15)
                  li x29, 0
                  mv x21, x29
                  li x18, 0
                  0: mv x29, x21
                  mv x31, x29
                  li x31, 0
                  beq x29, x31, 1f
                  li x31, 1
                  beq x29, x31, 2f
                  li x31, 2
                  beq x29, x31, 3f
                  li x31, 3
                  beq x29, x31, 4f
                  li x31, 4
                  beq x29, x31, 5f
                  li x31, 5
                  beq x29, x31, 6f
                  li x31, 6
                  beq x29, x31, 7f
                  li x31, 7
                  beq x29, x31, 8f
                  li x31, 8
                  beq x29, x31, 9f
                  li x31, 9
                  beq x29, x31, 10f
                  li x31, 10
                  beq x29, x31, 11f
                  li x31, 11
                  beq x29, x31, 12f
                  li x31, 12
                  beq x29, x31, 13f
                  li x31, 13
                  beq x29, x31, 14f
                  li x31, 14
                  beq x29, x31, 15f
                  li x31, 15
                  beq x29, x31, 16f
                  1: csrr x15, 0x3b0
                  csrr x16, 0x3a0
                  j 17f
                  2: csrr x15, 0x3b1
                  csrr x16, 0x3a0
                  j 17f
                  3: csrr x15, 0x3b2
                  csrr x16, 0x3a0
                  j 17f
                  4: csrr x15, 0x3b3
                  csrr x16, 0x3a0
                  j 17f
                  5: csrr x15, 0x3b4
                  csrr x16, 0x3a1
                  j 17f
                  6: csrr x15, 0x3b5
                  csrr x16, 0x3a1
                  j 17f
                  7: csrr x15, 0x3b6
                  csrr x16, 0x3a1
                  j 17f
                  8: csrr x15, 0x3b7
                  csrr x16, 0x3a1
                  j 17f
                  9: csrr x15, 0x3b8
                  csrr x16, 0x3a2
                  j 17f
                  10: csrr x15, 0x3b9
                  csrr x16, 0x3a2
                  j 17f
                  11: csrr x15, 0x3ba
                  csrr x16, 0x3a2
                  j 17f
                  12: csrr x15, 0x3bb
                  csrr x16, 0x3a2
                  j 17f
                  13: csrr x15, 0x3bc
                  csrr x16, 0x3a3
                  j 17f
                  14: csrr x15, 0x3bd
                  csrr x16, 0x3a3
                  j 17f
                  15: csrr x15, 0x3be
                  csrr x16, 0x3a3
                  j 17f
                  16: csrr x15, 0x3bf
                  csrr x16, 0x3a3
                  j 17f
                  17: li x4, 4
                  slli x29, x21, 30
                  srli x29, x29, 30
                  sub x31, x4, x29
                  addi x31, x31, -1
                  slli x31, x31, 3
                  sll x4, x16, x31
                  slli x29, x29, 3
                  add x31, x31, x29
                  srl x4, x4, x31
                  slli x31, x4, 27
                  srli x31, x31, 30
                  beqz x31, 20f
                  li x29, 1
                  beq x31, x29, 21f
                  li x29, 2
                  beq x31, x29, 24f
                  li x29, 3
                  beq x31, x29, 25f
                  la x29, test_done
                  jalr x0, x29, 0
                  18: mv x29, x21
                  mv x18, x15
                  addi x29, x29, 1
                  mv x21, x29
                  li x15, 16
                  ble x15, x29, 19f
                  j 0b
                  19: csrr x29, 0x747
                  andi x29, x29, 2
                  bnez x29, 27f
                  la x29, test_done
                  jalr x0, x29, 0
                  20: j 18b
                  21: mv x29, x21
                  csrr x31, 0x343
                  srli x31, x31, 2
                  bnez x29, 22f
                  bltz x31, 18b
                  j 23f
                  22: bgtu x18, x31, 18b
                  23: bleu x15, x31, 18b
                  j 26f
                  24: csrr x29, 0x343
                  srli x29, x29, 2
                  slli x31, x15, 2
                  srli x31, x31, 2
                  bne x29, x31, 18b
                  j 26f
                  25: csrr x29, 0x343
                  srli x29, x29, 2
                  srli x29, x29, 0
                  slli x29, x29, 0
                  slli x31, x15, 2
                  srli x31, x31, 2
                  srli x31, x31, 0
                  slli x31, x31, 0
                  bne x29, x31, 18b
                  j 26f
                  26: csrr x31, 0x747
                  andi x31, x31, 1
                  bnez x31, 27f
                  andi x31, x4, 128
                  bnez x31, 27f
                  j 29f
                  27: la x29, test_done
                  jalr x0, x29, 0
                  29: ori x4, x4, 4
                  li x31, 30
                  sll x29, x21, x31
                  srl x29, x29, x31
                  slli x31, x29, 3
                  sll x4, x4, x31
                  or x16, x16, x4
                  mv x29, x21
                  srli x29, x29, 2
                  beqz x29, 30f
                  li x31, 1
                  beq x29, x31, 31f
                  li x31, 2
                  beq x29, x31, 32f
                  li x31, 3
                  beq x29, x31, 33f
                  30: csrw 0x3a0, x16
                  j 34f
                  31: csrw 0x3a1, x16
                  j 34f
                  32: csrw 0x3a2, x16
                  j 34f
                  33: csrw 0x3a3, x16
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
                  li x15, 0x8ffffffc
                  li x29, 0xb
                  slli x29, x29, 8
                  addi x29, x29, 0x0
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x342
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x342
                  sw x29, 0(x15)
                  li x29, 0
                  mv x21, x29
                  li x18, 0
                  0: mv x29, x21
                  mv x31, x29
                  li x31, 0
                  beq x29, x31, 1f
                  li x31, 1
                  beq x29, x31, 2f
                  li x31, 2
                  beq x29, x31, 3f
                  li x31, 3
                  beq x29, x31, 4f
                  li x31, 4
                  beq x29, x31, 5f
                  li x31, 5
                  beq x29, x31, 6f
                  li x31, 6
                  beq x29, x31, 7f
                  li x31, 7
                  beq x29, x31, 8f
                  li x31, 8
                  beq x29, x31, 9f
                  li x31, 9
                  beq x29, x31, 10f
                  li x31, 10
                  beq x29, x31, 11f
                  li x31, 11
                  beq x29, x31, 12f
                  li x31, 12
                  beq x29, x31, 13f
                  li x31, 13
                  beq x29, x31, 14f
                  li x31, 14
                  beq x29, x31, 15f
                  li x31, 15
                  beq x29, x31, 16f
                  1: csrr x15, 0x3b0
                  csrr x16, 0x3a0
                  j 17f
                  2: csrr x15, 0x3b1
                  csrr x16, 0x3a0
                  j 17f
                  3: csrr x15, 0x3b2
                  csrr x16, 0x3a0
                  j 17f
                  4: csrr x15, 0x3b3
                  csrr x16, 0x3a0
                  j 17f
                  5: csrr x15, 0x3b4
                  csrr x16, 0x3a1
                  j 17f
                  6: csrr x15, 0x3b5
                  csrr x16, 0x3a1
                  j 17f
                  7: csrr x15, 0x3b6
                  csrr x16, 0x3a1
                  j 17f
                  8: csrr x15, 0x3b7
                  csrr x16, 0x3a1
                  j 17f
                  9: csrr x15, 0x3b8
                  csrr x16, 0x3a2
                  j 17f
                  10: csrr x15, 0x3b9
                  csrr x16, 0x3a2
                  j 17f
                  11: csrr x15, 0x3ba
                  csrr x16, 0x3a2
                  j 17f
                  12: csrr x15, 0x3bb
                  csrr x16, 0x3a2
                  j 17f
                  13: csrr x15, 0x3bc
                  csrr x16, 0x3a3
                  j 17f
                  14: csrr x15, 0x3bd
                  csrr x16, 0x3a3
                  j 17f
                  15: csrr x15, 0x3be
                  csrr x16, 0x3a3
                  j 17f
                  16: csrr x15, 0x3bf
                  csrr x16, 0x3a3
                  j 17f
                  17: li x4, 4
                  slli x29, x21, 30
                  srli x29, x29, 30
                  sub x31, x4, x29
                  addi x31, x31, -1
                  slli x31, x31, 3
                  sll x4, x16, x31
                  slli x29, x29, 3
                  add x31, x31, x29
                  srl x4, x4, x31
                  slli x31, x4, 27
                  srli x31, x31, 30
                  beqz x31, 20f
                  li x29, 1
                  beq x31, x29, 21f
                  li x29, 2
                  beq x31, x29, 24f
                  li x29, 3
                  beq x31, x29, 25f
                  la x29, test_done
                  jalr x0, x29, 0
                  18: mv x29, x21
                  mv x18, x15
                  addi x29, x29, 1
                  mv x21, x29
                  li x15, 16
                  ble x15, x29, 19f
                  j 0b
                  19: csrr x29, 0x747
                  andi x29, x29, 2
                  bnez x29, 27f
                  la x29, test_done
                  jalr x0, x29, 0
                  20: j 18b
                  21: mv x29, x21
                  csrr x31, 0x343
                  srli x31, x31, 2
                  bnez x29, 22f
                  bltz x31, 18b
                  j 23f
                  22: bgtu x18, x31, 18b
                  23: bleu x15, x31, 18b
                  j 26f
                  24: csrr x29, 0x343
                  srli x29, x29, 2
                  slli x31, x15, 2
                  srli x31, x31, 2
                  bne x29, x31, 18b
                  j 26f
                  25: csrr x29, 0x343
                  srli x29, x29, 2
                  srli x29, x29, 0
                  slli x29, x29, 0
                  slli x31, x15, 2
                  srli x31, x31, 2
                  srli x31, x31, 0
                  slli x31, x31, 0
                  bne x29, x31, 18b
                  j 26f
                  26: csrr x31, 0x747
                  andi x31, x31, 1
                  bnez x31, 27f
                  andi x31, x4, 128
                  bnez x31, 27f
                  j 29f
                  27: csrr x29, 0x341
                  la x31, main
                  bge x29, x31, 40f
                  la x29, test_done
                  jalr x0, x29, 0
                  40: lw x29, 0(x29)
                  li x31, 3
                  and x29, x29, x31
                  beq x29, x31, 28f
                  csrr x29, 0x341
                  addi x29, x29, 2
                  csrw 0x341, x29
                  j 34f
                  28: csrr x29, 0x341
                  addi x29, x29, 4
                  csrw 0x341, x29
                  j 34f
                  29: ori x4, x4, 1
                  li x31, 30
                  sll x29, x21, x31
                  srl x29, x29, x31
                  slli x31, x29, 3
                  sll x4, x4, x31
                  or x16, x16, x4
                  mv x29, x21
                  srli x29, x29, 2
                  beqz x29, 30f
                  li x31, 1
                  beq x29, x31, 31f
                  li x31, 2
                  beq x29, x31, 32f
                  li x31, 3
                  beq x29, x31, 33f
                  30: csrw 0x3a0, x16
                  j 34f
                  31: csrw 0x3a1, x16
                  j 34f
                  32: csrw 0x3a2, x16
                  j 34f
                  33: csrw 0x3a3, x16
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
                  li x15, 0x8ffffffc
                  li x29, 0xc
                  slli x29, x29, 8
                  addi x29, x29, 0x0
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x342
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x342
                  sw x29, 0(x15)
                  li x29, 0
                  mv x21, x29
                  li x18, 0
                  0: mv x29, x21
                  mv x31, x29
                  li x31, 0
                  beq x29, x31, 1f
                  li x31, 1
                  beq x29, x31, 2f
                  li x31, 2
                  beq x29, x31, 3f
                  li x31, 3
                  beq x29, x31, 4f
                  li x31, 4
                  beq x29, x31, 5f
                  li x31, 5
                  beq x29, x31, 6f
                  li x31, 6
                  beq x29, x31, 7f
                  li x31, 7
                  beq x29, x31, 8f
                  li x31, 8
                  beq x29, x31, 9f
                  li x31, 9
                  beq x29, x31, 10f
                  li x31, 10
                  beq x29, x31, 11f
                  li x31, 11
                  beq x29, x31, 12f
                  li x31, 12
                  beq x29, x31, 13f
                  li x31, 13
                  beq x29, x31, 14f
                  li x31, 14
                  beq x29, x31, 15f
                  li x31, 15
                  beq x29, x31, 16f
                  1: csrr x15, 0x3b0
                  csrr x16, 0x3a0
                  j 17f
                  2: csrr x15, 0x3b1
                  csrr x16, 0x3a0
                  j 17f
                  3: csrr x15, 0x3b2
                  csrr x16, 0x3a0
                  j 17f
                  4: csrr x15, 0x3b3
                  csrr x16, 0x3a0
                  j 17f
                  5: csrr x15, 0x3b4
                  csrr x16, 0x3a1
                  j 17f
                  6: csrr x15, 0x3b5
                  csrr x16, 0x3a1
                  j 17f
                  7: csrr x15, 0x3b6
                  csrr x16, 0x3a1
                  j 17f
                  8: csrr x15, 0x3b7
                  csrr x16, 0x3a1
                  j 17f
                  9: csrr x15, 0x3b8
                  csrr x16, 0x3a2
                  j 17f
                  10: csrr x15, 0x3b9
                  csrr x16, 0x3a2
                  j 17f
                  11: csrr x15, 0x3ba
                  csrr x16, 0x3a2
                  j 17f
                  12: csrr x15, 0x3bb
                  csrr x16, 0x3a2
                  j 17f
                  13: csrr x15, 0x3bc
                  csrr x16, 0x3a3
                  j 17f
                  14: csrr x15, 0x3bd
                  csrr x16, 0x3a3
                  j 17f
                  15: csrr x15, 0x3be
                  csrr x16, 0x3a3
                  j 17f
                  16: csrr x15, 0x3bf
                  csrr x16, 0x3a3
                  j 17f
                  17: li x4, 4
                  slli x29, x21, 30
                  srli x29, x29, 30
                  sub x31, x4, x29
                  addi x31, x31, -1
                  slli x31, x31, 3
                  sll x4, x16, x31
                  slli x29, x29, 3
                  add x31, x31, x29
                  srl x4, x4, x31
                  slli x31, x4, 27
                  srli x31, x31, 30
                  beqz x31, 20f
                  li x29, 1
                  beq x31, x29, 21f
                  li x29, 2
                  beq x31, x29, 24f
                  li x29, 3
                  beq x31, x29, 25f
                  la x29, test_done
                  jalr x0, x29, 0
                  18: mv x29, x21
                  mv x18, x15
                  addi x29, x29, 1
                  mv x21, x29
                  li x15, 16
                  ble x15, x29, 19f
                  j 0b
                  19: csrr x29, 0x747
                  andi x29, x29, 2
                  bnez x29, 27f
                  la x29, test_done
                  jalr x0, x29, 0
                  20: j 18b
                  21: mv x29, x21
                  csrr x31, 0x343
                  srli x31, x31, 2
                  bnez x29, 22f
                  bltz x31, 18b
                  j 23f
                  22: bgtu x18, x31, 18b
                  23: bleu x15, x31, 18b
                  j 26f
                  24: csrr x29, 0x343
                  srli x29, x29, 2
                  slli x31, x15, 2
                  srli x31, x31, 2
                  bne x29, x31, 18b
                  j 26f
                  25: csrr x29, 0x343
                  srli x29, x29, 2
                  srli x29, x29, 0
                  slli x29, x29, 0
                  slli x31, x15, 2
                  srli x31, x31, 2
                  srli x31, x31, 0
                  slli x31, x31, 0
                  bne x29, x31, 18b
                  j 26f
                  26: csrr x31, 0x747
                  andi x31, x31, 1
                  bnez x31, 27f
                  andi x31, x4, 128
                  bnez x31, 27f
                  j 29f
                  27: csrr x29, 0x341
                  lw x29, 0(x29)
                  li x31, 3
                  and x29, x29, x31
                  beq x29, x31, 28f
                  csrr x29, 0x341
                  addi x29, x29, 2
                  csrw 0x341, x29
                  j 34f
                  28: csrr x29, 0x341
                  addi x29, x29, 4
                  csrw 0x341, x29
                  j 34f
                  29: ori x4, x4, 3
                  li x31, 30
                  sll x29, x21, x31
                  srl x29, x29, x31
                  slli x31, x29, 3
                  sll x4, x4, x31
                  or x16, x16, x4
                  mv x29, x21
                  srli x29, x29, 2
                  beqz x29, 30f
                  li x31, 1
                  beq x29, x31, 31f
                  li x31, 2
                  beq x29, x31, 32f
                  li x31, 3
                  beq x29, x31, 33f
                  30: csrw 0x3a0, x16
                  j 34f
                  31: csrw 0x3a1, x16
                  j 34f
                  32: csrw 0x3a2, x16
                  j 34f
                  33: csrw 0x3a3, x16
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
main:             addi         a6, s6, 1630
                  sub          t2, s3, t1
                  sltiu        a1, s8, 1864
                  c.addi       s10, 30
                  c.nop
                  add          a4, s10, s3
                  c.andi       a4, 16
                  remu         a6, zero, s7
                  add          t1, t5, s9
                  csrrs        t0, 0x340, t1
                  c.xor        a0, a5
                  sub          a2, sp, t6
                  c.addi16sp   sp, 64
                  add          a0, a7, a0
                  srli         sp, zero, 20
                  c.li         ra, -1
                  c.and        a1, a3
                  remu         s10, s9, a3
                  c.addi16sp   sp, -16
                  csrrs        s4, 0x340, s2
                  slti         a6, t5, -1562
                  c.mv         a4, s11
                  c.addi16sp   sp, 320
                  ori          t0, s9, -49
                  add          t5, t1, s7
                  and          s0, s11, t1
                  ori          zero, gp, 1624
                  csrrsi       s10, 0x340, 0
                  c.and        s0, a5
                  c.srli       s0, 17
                  nop
                  add          a0, tp, a4
                  c.addi16sp   sp, 96
                  sltiu        s10, t5, -1770
                  xor          tp, gp, t6
                  csrrwi       a6, 0x340, 5
                  remu         a7, s8, s11
                  remu         t3, s8, s6
                  sltiu        s8, s3, -362
                  mulh         s2, t0, a1
                  slt          a3, s11, a2
                  c.sub        a1, a4
                  c.xor        a2, a0
                  divu         zero, s8, s1
                  c.lui        a6, 19
                  csrrwi       s10, 0x340, 17
                  div          a3, s8, ra
                  c.or         a0, a2
                  c.li         sp, -1
                  c.addi16sp   sp, 160
                  remu         tp, t1, t0
                  addi         t0, s11, -748
                  c.slli       s5, 16
                  slli         a4, s3, 31
                  add          s7, a1, s10
                  c.andi       s0, -1
                  csrrs        gp, 0x340, s11
                  c.and        a2, a3
                  c.lui        a4, 11
                  csrrsi       s6, 0x340, 0
                  srl          a3, s1, t5
                  sltu         s5, s1, s9
                  slli         t5, s3, 0
                  c.addi16sp   sp, -16
                  slt          gp, s9, t3
                  ori          a2, s9, -752
                  sltu         s2, s8, a5
                  sltiu        a2, t1, 630
                  and          t2, ra, s7
                  c.and        a4, s0
                  csrrwi       tp, 0x340, 1
                  c.slli       s2, 29
                  slli         s1, s3, 13
                  c.or         s0, a1
                  mul          t3, tp, s5
                  c.nop
                  mulhsu       t0, a5, s11
                  csrrwi       t3, 0x340, 16
                  mul          s8, t4, s11
                  c.nop
                  or           s2, s10, a7
                  xor          t1, s0, a7
                  addi         s10, s4, -743
                  c.addi4spn   s1, sp, 368
                  csrrw        t4, 0x340, a5
                  c.nop
                  csrrsi       a7, 0x340, 22
                  c.addi16sp   sp, 96
                  c.andi       a1, 22
                  srli         s6, t6, 17
                  sra          s2, tp, s11
                  mul          s5, a5, s4
                  nop
                  div          a6, gp, a2
                  xori         s10, s4, 132
                  c.srli       s0, 29
                  srli         a5, tp, 23
                  andi         sp, s1, -1746
                  nop
                  addi         t3, a1, 1774
                  csrrc        s0, 0x340, zero
                  slt          t2, zero, t6
                  c.xor        a4, a4
                  srl          s5, tp, s2
                  c.xor        a0, a5
                  sltiu        a6, zero, -714
                  mulhsu       s6, s7, a6
                  auipc        a0, 351972
                  c.add        a4, t3
                  c.addi16sp   sp, 160
                  lui          t5, 803188
                  slli         t2, t1, 7
                  or           s10, s0, tp
                  div          s1, t5, s10
                  divu         s4, t4, a5
                  sra          tp, a1, s5
                  c.addi       s11, 5
                  srli         s10, a2, 27
                  srai         s11, t1, 29
                  remu         a5, t1, t6
                  xori         sp, a6, -277
                  c.addi       s0, -1
                  srli         tp, s11, 31
                  csrrci       gp, 0x340, 26
                  sub          s6, s2, a5
                  divu         a7, s0, s6
                  div          s4, a6, s3
                  csrrs        t4, 0x340, zero
                  mul          s7, a3, a3
                  c.add        a7, a5
                  slti         s10, s6, -2025
                  or           a1, a7, s3
                  addi         zero, a1, 672
                  c.slli       s5, 28
                  xori         t5, tp, -179
                  c.nop
                  c.and        s1, a1
                  c.xor        s0, s0
                  csrrsi       a7, 0x340, 0
                  csrrs        t3, 0x340, zero
                  slt          s6, t1, s8
                  sub          s6, s4, a3
                  csrrw        t5, 0x340, t6
                  c.sub        a1, s0
                  csrrwi       a1, 0x340, 8
                  csrrsi       s7, 0x340, 1
                  c.srai       s1, 12
                  ori          ra, a6, -1324
                  c.srai       a2, 5
                  or           a7, s10, sp
                  c.srli       a3, 13
                  slt          t0, t3, a2
                  c.or         s0, s0
                  csrrsi       gp, 0x340, 0
                  slli         a1, t1, 10
                  rem          s7, s2, s1
                  sub          t3, t4, a2
                  mulhsu       ra, a7, a1
                  csrrsi       s10, 0x340, 0
                  mulhsu       s5, s4, zero
                  remu         s0, t0, s4
                  div          a6, t3, t3
                  c.add        s4, t0
                  c.addi4spn   a3, sp, 224
                  c.andi       a3, 3
                  remu         t0, a2, s8
                  csrrs        a0, 0x340, zero
                  sra          s5, a3, s0
                  csrrs        ra, 0x340, zero
                  and          a1, s7, sp
                  srai         s11, a2, 26
                  slli         s5, a4, 14
                  rem          s5, s7, t5
                  c.addi16sp   sp, -16
                  c.addi16sp   sp, 352
                  c.xor        a3, a0
                  c.slli       a0, 31
                  c.lui        ra, 29
                  c.or         a2, a2
                  srli         t1, s3, 21
                  sll          s1, t5, s11
                  csrrc        s7, 0x340, zero
                  mulhsu       t2, t6, a7
                  srli         t1, t1, 26
                  divu         a3, a7, t6
                  c.li         a2, 13
                  c.addi       s11, 7
                  mul          s11, t5, s5
                  slti         a0, a5, 1859
                  and          t5, s6, t5
                  c.srli       s1, 23
                  slli         s7, s7, 27
                  srai         t3, s3, 11
                  c.srli       a0, 16
                  c.or         a0, s1
                  xori         t3, a6, 1251
                  mul          s2, ra, t0
                  sltu         s0, a4, s4
                  sra          ra, s6, a1
                  xori         t5, s0, 490
                  nop
                  ori          s11, a5, 2019
                  slli         zero, s4, 23
                  and          t0, a1, a0
                  mul          a2, a3, a1
                  ori          gp, s9, 728
                  csrrwi       a2, 0x340, 22
                  c.li         a1, 1
                  csrrwi       s8, 0x340, 5
                  csrrc        sp, 0x340, s5
                  c.sub        a3, a4
                  auipc        s10, 215960
                  or           s2, s11, a0
                  slli         gp, t6, 30
                  or           a7, t6, t4
                  lui          s7, 623013
                  sltu         tp, s8, s8
                  xor          s10, gp, a0
                  rem          a6, a6, ra
                  ori          a6, ra, 702
                  srl          t5, s11, t5
                  sltiu        a4, t6, 250
                  c.xor        a3, a5
                  c.or         a2, a4
                  c.srli       s1, 14
                  csrrc        t3, 0x340, a2
                  auipc        sp, 978678
                  c.addi16sp   sp, 384
                  addi         a2, a1, -643
                  c.add        s4, t1
                  c.mv         t1, s2
                  remu         s2, s2, t6
                  mul          s5, t5, s1
                  c.addi16sp   sp, -16
                  slt          s2, a3, a3
                  xor          a0, zero, s6
                  mul          s6, a6, s1
                  sltiu        zero, s1, -784
                  slti         ra, s0, 1343
                  mulh         tp, t6, t2
                  c.addi16sp   sp, -16
                  c.lui        s5, 24
                  and          s8, t0, s1
                  srai         sp, t4, 30
                  and          a1, a7, s1
                  c.li         a0, 4
                  nop
                  sub          s11, t4, zero
                  rem          a3, a5, a7
                  xor          a5, sp, a6
                  div          gp, s8, s8
                  rem          s8, t1, a1
                  c.srli       a0, 18
                  c.addi16sp   sp, -16
                  c.or         a1, s0
                  c.addi4spn   s1, sp, 272
                  c.mv         a0, s9
                  c.add        t1, s4
                  c.li         a5, 12
                  mulhsu       tp, s10, s4
                  csrrc        gp, 0x340, zero
                  mulh         a2, zero, s10
                  csrrwi       ra, 0x340, 11
                  rem          a6, s7, s3
                  sll          a4, gp, s0
                  sltiu        t3, s10, -320
                  c.addi4spn   a0, sp, 240
                  c.sub        s0, s1
                  c.addi16sp   sp, -16
                  csrrsi       t0, 0x340, 0
                  c.srli       a5, 31
                  c.add        t3, a2
                  div          a3, t3, a7
                  csrrs        a4, 0x340, a4
                  andi         s11, zero, 1084
                  c.addi4spn   a3, sp, 1008
                  addi         a0, s7, 1229
                  c.addi       a4, -1
                  slli         a3, s5, 21
                  divu         s8, t1, s10
                  c.addi       t3, 26
                  c.addi16sp   sp, -16
                  andi         a6, s1, -1233
                  c.xor        a4, a4
                  srl          a4, s3, t2
                  sll          t5, a1, s1
                  sltu         a6, s7, t1
                  mul          zero, a2, a0
                  or           t1, s4, s4
                  sra          t0, gp, t5
                  c.addi16sp   sp, 400
                  c.and        a3, a1
                  div          s2, a2, t0
                  c.add        a1, s1
                  mulhu        sp, sp, a0
                  lui          s10, 927541
                  sltiu        t1, s1, 562
                  divu         a2, a6, s3
                  csrrsi       s2, 0x340, 22
                  sub          t0, a6, t2
                  mulh         t4, s7, gp
                  nop
                  c.addi       s0, -1
                  remu         a7, s9, ra
                  srai         s5, t5, 19
                  csrrw        t3, 0x340, a2
                  c.and        a1, a5
                  csrrsi       t1, 0x340, 0
                  and          a0, t3, a2
                  csrrs        s1, 0x340, s6
                  andi         sp, t2, -1687
                  c.li         t0, -1
                  addi         t0, s3, -1942
                  c.xor        a5, a2
                  addi         t2, a3, 779
                  c.addi       s5, 3
                  and          zero, t3, t5
                  c.li         s0, -1
                  divu         sp, t3, s5
                  mulh         gp, s11, t0
                  c.add        a6, tp
                  csrrc        t0, 0x340, s11
                  c.sub        s0, a0
                  remu         sp, a3, a1
                  divu         a0, s0, a6
                  csrrci       s0, 0x340, 0
                  and          s5, s7, a6
                  xor          s8, t0, t5
                  c.srai       a3, 19
                  sra          s10, gp, t1
                  slti         s11, tp, 1825
                  c.slli       a7, 1
                  mul          a2, zero, a5
                  c.mv         sp, a3
                  c.andi       a0, 4
                  c.nop
                  sra          s10, s0, a5
                  ori          s5, a4, -579
                  slti         s11, a7, -287
                  sltu         s10, s6, s9
                  mul          a7, t1, t3
                  c.and        s1, a1
                  andi         a0, s8, -265
                  c.xor        a2, a0
                  c.xor        s0, a4
                  c.li         t1, 19
                  lui          s8, 807809
                  slt          s8, s5, t1
                  div          gp, s8, a4
                  sra          s10, a0, a5
                  c.or         a5, s1
                  rem          s8, gp, a7
                  xori         ra, a1, 1721
                  c.addi16sp   sp, -16
                  csrrs        a2, 0x340, s6
                  c.xor        s0, a5
                  c.lui        s2, 18
                  sra          a2, t1, a1
                  slt          t5, t0, t3
                  c.srai       a4, 1
                  remu         tp, s2, a0
                  c.xor        a3, a4
                  sra          s8, s2, s7
                  divu         a0, gp, s6
                  csrrw        s2, 0x340, s9
                  csrrc        a0, 0x340, a7
                  c.slli       s7, 20
                  mulhsu       t1, a2, s4
                  mulhsu       t0, s1, s5
                  c.li         sp, 3
                  csrrs        s2, 0x340, a0
                  slt          a5, s6, t4
                  csrrw        a2, 0x340, a5
                  add          gp, t2, a1
                  c.sub        a2, s0
                  csrrc        a7, 0x340, t4
                  csrrc        t5, 0x340, zero
                  slti         s5, t0, 1606
                  csrrw        a4, 0x340, s0
                  c.andi       a3, -1
                  csrrsi       s0, 0x340, 16
                  nop
                  xori         s1, t1, 1812
                  slli         t0, s6, 16
                  c.or         a1, a1
                  csrrsi       s4, 0x340, 2
                  c.add        t4, s5
                  ori          a0, s3, 1719
                  mulh         t4, s10, t3
                  slt          t2, t0, ra
                  sra          t3, a6, s3
                  srli         t3, sp, 26
                  ori          ra, s2, -1391
                  csrrwi       s6, 0x340, 18
                  mulh         t1, a0, t2
                  div          a4, t5, t0
                  c.andi       a2, 3
                  sltiu        t5, ra, 504
                  and          a6, a6, s0
                  c.addi       tp, -1
                  sltu         s7, t3, t2
                  and          s6, a4, a2
                  csrrci       sp, 0x340, 29
                  c.lui        t3, 1
                  sltiu        a3, t6, -1494
                  c.or         s0, a5
                  srli         a3, t2, 31
                  c.srai       a2, 4
                  nop
                  mulhu        t1, s8, zero
                  sra          sp, zero, s8
                  andi         s7, a4, 185
                  sltiu        sp, sp, -1011
                  mulhsu       a0, t6, tp
                  mulh         s1, s1, sp
                  ori          s4, a7, 0
                  c.and        a3, s0
                  csrrci       t1, 0x340, 12
                  csrrw        t1, 0x340, s8
                  c.or         a0, s0
                  csrrc        a1, 0x340, zero
                  sltu         s1, s4, s5
                  sltiu        a5, a1, 1973
                  slt          s4, t6, s8
                  csrrci       a0, 0x340, 0
                  slti         tp, t0, -1816
                  csrrsi       t3, 0x340, 0
                  csrrs        a3, 0x340, zero
                  csrrci       a2, 0x340, 4
                  sltiu        zero, a7, 1361
                  slti         s2, s0, 840
                  c.xor        s0, a1
                  add          a7, a7, a1
                  nop
                  mulhu        s0, s8, s11
                  add          tp, s9, gp
                  mulhsu       s10, t6, s3
                  divu         t2, s8, s5
                  mul          t3, s4, s11
                  lui          tp, 692633
                  mulhu        s4, a7, tp
                  c.addi4spn   a1, sp, 720
                  lui          t0, 85025
                  nop
                  c.and        a4, a0
                  mulhu        a4, s11, gp
                  sra          a2, t4, zero
                  csrrci       a4, 0x340, 20
                  div          s10, sp, s1
                  csrrc        s1, 0x340, s4
                  sub          a1, a0, a7
                  sub          a2, s5, a2
                  c.addi4spn   a0, sp, 832
                  sub          zero, gp, s10
                  sll          t0, a5, s1
                  sltu         s7, a7, a0
                  slti         a7, s0, 1381
                  addi         s0, s1, 1903
                  sub          t4, a4, a7
                  csrrc        ra, 0x340, t1
                  ori          t5, s1, -974
                  sltiu        zero, s10, -949
                  c.mv         a4, s0
                  csrrs        s6, 0x340, t5
                  sub          s0, s10, zero
                  add          gp, sp, t0
                  divu         a0, s5, s1
                  addi         s8, t0, 833
                  csrrw        s5, 0x340, zero
                  xori         a4, sp, -1705
                  auipc        a3, 958518
                  sltu         a7, s5, s6
                  csrrw        s10, 0x340, s2
                  mul          s4, a6, t3
                  c.srai       a2, 9
                  c.xor        s1, a0
                  mulhsu       gp, t0, t3
                  srli         s2, t6, 13
                  sub          ra, s6, s4
                  c.srai       a2, 15
                  srl          s11, a4, s3
                  c.mv         t5, s8
                  csrrc        t0, 0x340, a7
                  c.and        a0, a5
                  csrrci       a2, 0x340, 0
                  sll          a6, s7, s8
                  or           a7, t6, s7
                  auipc        t1, 718118
                  c.and        s0, s0
                  c.mv         a3, t6
                  csrrs        s2, 0x340, s6
                  mulhu        a4, t2, s5
                  csrrci       zero, 0x340, 26
                  or           s10, a0, s7
                  c.add        a6, a5
                  csrrsi       s4, 0x340, 4
                  c.mv         s4, a0
                  slli         t2, a3, 2
                  andi         s8, ra, 844
                  srli         a7, t2, 0
                  c.add        a1, ra
                  div          s8, ra, t2
                  sra          s0, gp, gp
                  sltu         gp, a1, t3
                  c.lui        a7, 24
                  srli         s10, t0, 18
                  mul          s2, sp, a4
                  andi         a3, a1, -1251
                  sll          sp, a5, gp
                  add          s4, s4, s8
                  add          a1, a4, zero
                  c.sub        s0, a4
                  sltiu        t1, s8, -1630
                  sra          a4, t4, s3
                  ori          a2, s7, 303
                  c.or         a3, a5
                  c.srli       s1, 16
                  sltu         s0, sp, s4
                  c.nop
                  c.srai       s1, 12
                  c.li         s7, -1
                  sub          s5, s5, s3
                  c.add        a0, t0
                  remu         s11, s0, s11
                  xor          a1, a1, tp
                  divu         t2, s1, sp
                  slt          s5, t5, s8
                  c.li         a2, 29
                  auipc        s2, 237799
                  sll          s2, tp, t2
                  and          sp, s8, a1
                  c.addi4spn   a5, sp, 528
                  mulh         a5, s0, a7
                  sra          a2, t4, s5
                  c.slli       t4, 2
                  andi         t3, tp, -385
                  c.and        s0, a5
                  c.mv         s2, s8
                  div          t3, a7, a5
                  c.add        a7, tp
                  nop
                  div          a5, a5, s10
                  mulhsu       s11, t2, s1
                  sltu         s6, ra, s3
                  auipc        a5, 837364
                  c.slli       a4, 1
                  add          tp, s9, s2
                  c.sub        s1, a3
                  c.add        s4, s3
                  sltu         a3, s2, sp
                  c.or         a5, a5
                  c.addi       tp, 7
                  remu         zero, zero, s7
                  c.addi16sp   sp, 336
                  auipc        s11, 670217
                  c.srai       a2, 20
                  mul          s5, t4, t0
                  csrrsi       ra, 0x340, 26
                  c.nop
                  csrrs        s4, 0x340, s1
                  mulhu        s5, a6, s7
                  srl          t4, s1, s11
                  addi         t4, t5, 1359
                  mulh         t2, s4, t0
                  sltu         sp, t0, a7
                  csrrci       s4, 0x340, 0
                  c.addi       s2, -1
                  ori          t0, gp, -2031
                  add          s6, t5, a1
                  srl          a2, a3, tp
                  srai         a5, sp, 15
                  c.slli       t0, 12
                  addi         sp, t5, 2024
                  c.srai       a5, 22
                  rem          s8, a2, a4
                  c.mv         s5, a6
                  mulhu        a5, t4, gp
                  c.srli       a5, 16
                  sll          a3, zero, a4
                  c.or         a4, a2
                  mulhu        sp, a4, s10
                  mulhu        a0, s8, a5
                  c.addi       a0, 21
                  csrrci       a1, 0x340, 0
                  divu         ra, t2, s9
                  nop
                  csrrsi       a1, 0x340, 0
                  c.addi       t4, -1
                  divu         s8, sp, s0
                  c.and        a2, a4
                  c.slli       sp, 26
                  sltiu        a0, s8, 1929
                  addi         t4, s3, -353
                  slt          s8, zero, t5
                  slt          a1, s8, zero
                  add          s8, a6, s3
                  csrrsi       s7, 0x340, 22
                  divu         s2, ra, tp
                  sll          a2, t0, s10
                  csrrsi       t4, 0x340, 0
                  sltu         a3, s3, ra
                  c.srai       a4, 21
                  rem          t2, s9, s0
                  divu         s8, t1, s8
                  lui          s8, 885736
                  csrrw        t3, 0x340, a3
                  xori         a5, zero, 1271
                  add          sp, s10, a0
                  mulh         s8, zero, a6
                  c.xor        a1, a5
                  mulhu        s11, t1, s1
                  c.srli       s0, 6
                  and          a0, t5, a3
                  andi         a6, s2, -868
                  slli         t5, t6, 23
                  csrrw        t5, 0x340, s9
                  rem          a0, s7, s6
                  add          t2, t6, a0
                  csrrci       a4, 0x340, 31
                  lui          a2, 23326
                  sub          s2, s11, gp
                  sltu         s5, sp, a1
                  c.srli       a5, 17
                  div          s2, s4, s6
                  c.srai       s0, 17
                  c.lui        a6, 23
                  divu         a5, t1, a2
                  c.mv         s0, t0
                  nop
                  c.addi       a4, 23
                  c.andi       s0, 21
                  c.mv         s4, t4
                  sub          s4, s6, t3
                  mul          tp, s10, tp
                  mulh         s2, s11, t1
                  sub          a0, s0, s8
                  c.lui        s2, 7
                  c.add        a1, sp
                  srai         s5, s5, 26
                  csrrc        s2, 0x340, a4
                  addi         t3, t3, 351
                  remu         t4, s11, t0
                  c.srli       a0, 13
                  mulhsu       s2, a7, sp
                  sub          s5, ra, s6
                  sll          t4, s11, t4
                  andi         a2, a7, 650
                  mul          gp, a5, s2
                  div          a0, tp, t2
                  auipc        a6, 372264
                  csrrs        s0, 0x340, a3
                  slli         s10, a7, 8
                  lui          a3, 190486
                  c.addi4spn   a0, sp, 272
                  divu         a3, tp, s0
                  add          t0, a6, a0
                  c.add        s1, tp
                  csrrw        a4, 0x340, t3
                  auipc        s4, 370702
                  nop
                  c.li         t4, -1
                  c.add        s4, t1
                  c.mv         sp, t0
                  add          a7, tp, a6
                  c.li         a5, -1
                  c.addi16sp   sp, -16
                  addi         a7, t5, 1642
                  or           t4, s11, a1
                  csrrw        s11, 0x340, s9
                  auipc        tp, 192528
                  c.mv         a7, a3
                  c.addi       sp, 18
                  c.srai       a3, 24
                  remu         t0, s7, s11
                  mulhu        s8, t6, a7
                  c.srai       s1, 28
                  lui          a2, 583617
                  csrrci       s4, 0x340, 23
                  csrrwi       a7, 0x340, 30
                  c.and        a0, s1
                  c.add        a1, tp
                  slti         a7, s8, -314
                  c.addi16sp   sp, 384
                  csrrc        s6, 0x340, a2
                  or           s1, s2, zero
                  nop
                  mul          a3, a1, tp
                  sltu         a7, s3, gp
                  nop
                  c.lui        t1, 8
                  nop
                  c.or         s1, a0
                  and          a0, a1, t2
                  lui          s11, 815790
                  c.lui        ra, 27
                  div          a2, t4, s7
                  c.add        a5, a3
                  or           a3, t0, a4
                  mulh         zero, a2, s9
                  ori          s5, t1, -1929
                  sltiu        tp, zero, -521
                  c.srli       s1, 6
                  mulhu        a7, s6, s2
                  csrrw        a0, 0x340, s5
                  andi         a4, t6, -1366
                  c.or         s1, s1
                  mul          tp, t4, zero
                  sra          t1, s3, s10
                  csrrci       a7, 0x340, 18
                  ori          s1, s10, 91
                  csrrs        t5, 0x340, zero
                  auipc        s5, 679453
                  slti         ra, s11, 1764
                  c.sub        a0, a5
                  or           ra, s6, s8
                  c.addi16sp   sp, 320
                  or           t1, a0, zero
                  xor          s4, t1, s0
                  c.addi16sp   sp, -16
                  auipc        t2, 823466
                  slli         t1, ra, 30
                  srai         tp, s5, 18
                  c.and        s1, s0
                  c.mv         tp, a1
                  ori          a3, s1, 57
                  c.addi       a3, -1
                  mulh         s6, a1, gp
                  csrrci       a1, 0x340, 10
                  mulhu        s7, tp, s6
                  xor          a7, s7, a7
                  csrrs        t2, 0x340, zero
                  mul          t4, s8, sp
                  c.li         s5, 31
                  c.sub        a1, a4
                  andi         a1, a4, -1429
                  srli         a7, a6, 27
                  c.sub        s0, a3
                  c.srai       a1, 24
                  xori         s11, t6, -21
                  or           a5, a0, t1
                  sltiu        gp, t3, -349
                  mulh         t0, s1, t1
                  c.add        ra, a6
                  srl          a1, t3, t6
                  srai         a2, a0, 6
                  c.or         a0, a2
                  srl          a4, t2, t6
                  andi         s1, a7, 1664
                  c.add        s1, a3
                  csrrw        t5, 0x340, s11
                  c.addi16sp   sp, -16
                  c.andi       a5, 12
                  c.sub        s1, a4
                  addi         t2, s2, -1596
                  c.addi4spn   a1, sp, 800
                  csrrwi       t4, 0x340, 1
                  and          gp, a1, a2
                  c.andi       s1, 4
                  lui          zero, 147928
                  add          a2, a5, s2
                  csrrs        gp, 0x340, zero
                  rem          s2, a3, t4
                  nop
                  c.srai       a2, 13
                  c.or         a4, s0
                  srl          s5, a3, s1
                  c.nop
                  c.nop
                  nop
                  slti         s11, s2, -1977
                  div          s7, s2, t2
                  c.srli       s1, 7
                  sltiu        s7, t5, -335
                  csrrc        gp, 0x340, t4
                  slti         s6, s3, 126
                  slli         t3, a4, 8
                  srli         a5, t1, 24
                  rem          ra, t1, tp
                  c.mv         t2, a4
                  rem          s10, sp, t3
                  or           sp, s3, a2
                  rem          ra, t5, sp
                  ori          tp, t0, 1956
                  csrrw        s1, 0x340, t5
                  c.li         t4, 31
                  c.and        s1, a0
                  xor          t3, s2, a3
                  rem          s2, s10, s9
                  c.mv         a1, s0
                  nop
                  c.srli       a0, 6
                  mulhsu       t0, s8, s2
                  xori         a0, t6, -332
                  csrrci       t0, 0x340, 12
                  sub          a5, tp, a2
                  mulh         s5, t3, t4
                  mulhu        t3, t5, t0
                  c.mv         a1, s7
                  addi         ra, s6, 440
                  srli         t1, ra, 22
                  csrrc        t2, 0x340, a1
                  lui          a6, 29209
                  slt          tp, t4, s4
                  c.addi       t1, -1
                  srl          s6, s4, a1
                  srai         s4, s0, 13
                  c.or         a1, s1
                  mul          t2, t2, s6
                  and          a5, a2, a5
                  andi         s10, s10, -1807
                  ori          a5, s4, -1234
                  mulhu        s5, zero, a6
                  divu         sp, a6, zero
                  nop
                  c.srli       a3, 5
                  srli         a2, s6, 29
                  c.addi4spn   a0, sp, 336
                  add          a7, s3, s1
                  c.sub        a5, a2
                  csrrw        a0, 0x340, t4
                  csrrw        t1, 0x340, s10
                  mulh         a2, gp, s4
                  xori         s4, s1, -322
                  slt          s7, sp, t2
                  csrrsi       zero, 0x340, 20
                  div          s0, t3, a2
                  sltu         t5, s7, t3
                  c.addi       t4, 19
                  andi         sp, s9, 483
                  csrrci       ra, 0x340, 29
                  c.srai       a0, 31
                  csrrs        t5, 0x340, t5
                  sltu         a5, t6, tp
                  mul          s2, zero, a6
                  andi         zero, t3, 1897
                  addi         a6, a3, 1252
                  sltiu        a6, a4, -1322
                  mulh         a1, s4, s5
                  rem          s4, a7, ra
                  c.and        a0, s0
                  divu         s8, s4, s0
                  c.lui        s6, 26
                  c.slli       t2, 4
                  mulhsu       ra, s1, a6
                  slli         a5, a0, 12
                  remu         gp, a4, sp
                  srl          s6, s1, t3
                  sll          a2, s10, ra
                  addi         t2, s11, -912
                  nop
                  c.sub        a3, a2
                  mul          s7, t6, t1
                  mul          s4, s5, t6
                  c.addi16sp   sp, -16
                  mulhsu       t0, t5, s7
                  c.sub        a1, a3
                  lui          ra, 894125
                  nop
                  slti         s0, s3, 1618
                  c.add        t5, sp
                  c.add        a3, a2
                  auipc        tp, 1021786
                  xori         ra, zero, -1723
                  div          s2, a0, t2
                  slli         t4, s8, 30
                  csrrw        s1, 0x340, s3
                  c.add        a0, t4
                  sltu         s6, s11, a1
                  sub          t3, s4, s9
                  lui          a6, 831051
                  c.sub        a2, a0
                  mulhu        s0, s3, a6
                  csrrw        s11, 0x340, a4
                  c.and        s0, a3
                  and          s2, s0, s10
                  or           a0, zero, s9
                  c.xor        a3, a1
                  nop
                  srli         a5, s6, 16
                  mulhu        a0, s5, a6
                  c.lui        a7, 18
                  csrrw        s4, 0x340, t6
                  c.addi4spn   a1, sp, 1008
                  sltu         s1, a2, s6
                  slt          a2, s11, s0
                  c.nop
                  andi         a6, s5, 1904
                  slti         s10, a0, -1632
                  csrrc        s7, 0x340, zero
                  mulhu        s11, a1, s6
                  or           gp, s5, a1
                  srli         s2, t3, 30
                  xor          s2, s2, t3
                  divu         s0, a2, s1
                  div          s6, s3, t2
                  mulhu        s10, s6, a4
                  c.xor        a4, a0
                  sra          t0, s7, sp
                  c.li         a5, -1
                  nop
                  add          s5, a5, a1
                  lui          a4, 601869
                  or           sp, s10, t3
                  srli         s1, t1, 22
                  c.andi       a5, 26
                  or           a7, a0, s11
                  c.or         a2, a3
                  divu         gp, a3, gp
                  c.and        a0, s1
                  csrrwi       zero, 0x340, 21
                  xori         sp, s10, -20
                  c.and        a3, a4
                  slt          a4, a1, s1
                  sltu         a6, s7, a7
                  c.andi       s0, 1
                  nop
                  xori         a4, s2, -1542
                  c.xor        a0, a5
                  c.mv         t0, s8
                  and          s1, t5, t4
                  c.or         a5, a2
                  c.nop
                  xori         ra, sp, -889
                  remu         s10, t4, a1
                  slli         s4, s1, 29
                  divu         s8, t6, s3
                  c.srai       a2, 7
                  c.srli       s0, 31
                  c.or         s1, s0
                  c.lui        tp, 28
                  c.or         a1, a4
                  c.andi       a3, -1
                  addi         s4, t2, -554
                  ori          s0, s1, -1989
                  csrrs        a6, 0x340, zero
                  csrrc        s11, 0x340, s8
                  mul          t5, sp, ra
                  c.lui        s6, 31
                  rem          a1, s7, a1
                  addi         s8, s8, -1158
                  srli         s2, zero, 6
                  c.andi       a2, 22
                  and          a5, s0, zero
                  c.or         a4, a5
                  c.lui        a7, 17
                  c.or         s0, s0
                  add          t3, s1, s9
                  lui          sp, 82660
                  csrrw        s10, 0x340, t3
                  csrrw        s2, 0x340, t1
                  c.srli       a5, 19
                  c.nop
                  csrrs        a7, 0x340, zero
                  divu         s5, s8, gp
                  c.slli       a4, 21
                  divu         s0, tp, s8
                  or           t1, t4, a5
                  srl          t5, s0, gp
                  sll          t1, a7, sp
                  c.add        a0, ra
                  addi         a1, s1, 563
                  rem          a5, ra, t6
                  csrrwi       t4, 0x340, 3
                  csrrci       t0, 0x340, 0
                  csrrs        a3, 0x340, zero
                  lui          a4, 91225
                  c.and        a2, a1
                  c.sub        a4, a5
                  xori         a4, t6, 1328
                  divu         t3, t5, s10
                  c.li         s7, 23
                  c.mv         t3, a7
                  andi         a6, s8, -1862
                  c.andi       a4, 19
                  c.lui        s7, 20
                  divu         a0, a7, t2
                  sll          a5, t1, a0
                  c.addi16sp   sp, 448
                  csrrsi       a6, 0x340, 14
                  c.lui        t5, 30
                  add          sp, sp, ra
                  nop
                  csrrwi       sp, 0x340, 15
                  srl          sp, a0, t1
                  c.addi16sp   sp, -16
                  xor          a0, s1, s2
                  xori         gp, a7, -794
                  c.srli       s1, 16
                  sll          gp, a4, sp
                  xor          zero, a2, s0
                  c.lui        s4, 24
                  andi         a2, a7, -1726
                  andi         a5, t5, 1882
                  addi         t2, s8, 127
                  sltu         s1, t4, s4
                  div          a6, a1, zero
                  c.lui        a1, 10
                  sltu         sp, a6, gp
                  slti         a4, a7, 1871
                  mulhsu       tp, a1, a6
                  c.add        a0, a2
                  divu         t3, ra, a7
                  c.add        sp, gp
                  c.srai       a3, 28
                  mulhsu       a2, sp, a0
                  sra          s10, t6, t3
                  sra          s10, s2, s0
                  slt          t4, t1, ra
                  mulh         a6, zero, t6
                  csrrwi       a0, 0x340, 30
                  mulh         t2, tp, s1
                  srli         t1, a2, 11
                  c.or         a2, s0
                  c.sub        a1, a4
                  c.mv         a2, s8
                  c.li         s5, -1
                  c.srai       a1, 31
                  srl          a7, s6, a2
                  mul          a5, tp, a3
                  nop
                  andi         a7, a6, 1159
                  add          t1, t0, a4
                  mulhu        s5, tp, t1
                  nop
                  slli         a4, gp, 13
                  or           s6, s6, t3
                  c.addi       s2, -1
                  sub          a2, a6, s5
                  c.add        t3, t4
                  csrrwi       sp, 0x340, 30
                  sltu         s6, t4, a0
                  div          a6, a1, t5
                  slli         a0, gp, 15
                  csrrsi       s11, 0x340, 0
                  c.addi16sp   sp, -16
                  csrrwi       t0, 0x340, 22
                  andi         a4, tp, -290
                  c.xor        s1, s0
                  mulhu        s0, s9, sp
                  csrrc        a3, 0x340, zero
                  mulh         ra, tp, a0
                  c.addi16sp   sp, -16
                  slti         a0, a5, -1304
                  sltiu        a5, a7, -905
                  c.srli       a3, 21
                  csrrc        s6, 0x340, s1
                  andi         a7, s5, 524
                  remu         gp, t5, gp
                  c.srli       a4, 29
                  csrrw        a2, 0x340, a0
                  slti         s6, s10, 922
                  c.slli       s11, 12
                  xori         s4, s1, -2048
                  csrrci       s2, 0x340, 30
                  c.sub        s1, a1
                  c.and        s0, a1
                  csrrsi       s10, 0x340, 0
                  c.slli       ra, 19
                  addi         s11, s0, -1321
                  c.or         s1, a4
                  mulh         a4, t1, s9
                  mul          a6, s1, a4
                  auipc        a0, 536795
                  srl          ra, s9, s2
                  c.mv         a1, t0
                  and          t1, zero, s6
                  c.mv         t1, gp
                  c.slli       s6, 29
                  c.li         a1, -1
                  slti         sp, s2, -1020
                  srli         gp, s0, 0
                  mulh         tp, s10, t2
                  csrrc        t5, 0x340, a1
                  addi         a4, s9, 329
                  c.addi       s6, -1
                  csrrc        a1, 0x340, tp
                  mulhsu       t0, s1, t3
                  c.nop
                  c.and        s1, a0
                  mulhu        s8, a0, tp
                  slti         t3, a6, -1925
                  sltu         a1, a7, s5
                  sltu         s1, s1, s7
                  div          a6, t3, a0
                  c.srli       s0, 15
                  c.srli       a1, 18
                  slli         t4, a0, 28
                  c.srai       a1, 26
                  csrrsi       t2, 0x340, 0
                  add          sp, a3, a5
                  remu         s1, a1, zero
                  and          s11, t0, t2
                  rem          t4, zero, t0
                  and          t3, tp, s8
                  c.nop
                  c.and        a1, s1
                  srli         s7, a6, 15
                  csrrwi       s2, 0x340, 16
                  sltu         a5, a0, s2
                  slli         s10, a0, 1
                  srl          a0, t6, s5
                  c.and        a3, a3
                  sltu         t5, a0, t4
                  srli         a6, s8, 0
                  c.srli       a1, 3
                  srli         s4, s3, 21
                  csrrwi       t1, 0x340, 22
                  c.or         s0, s1
                  srl          t3, t0, s3
                  sll          s8, t2, a3
                  mulh         t3, zero, s9
                  c.addi       a6, -1
                  sub          t4, a0, zero
                  csrrs        s7, 0x340, zero
                  and          ra, gp, a2
                  c.addi16sp   sp, -16
                  sltu         gp, a4, a6
                  or           s2, s0, t0
                  c.lui        t5, 30
                  remu         s8, s7, t4
                  sltiu        sp, s2, 1457
                  c.lui        t0, 11
                  c.andi       a5, -1
                  slt          t5, s9, s4
                  c.lui        t5, 14
                  c.addi       s1, -1
                  divu         s8, s10, s4
                  slt          s7, zero, s6
                  sltu         s4, t6, t5
                  ori          s8, sp, 175
                  rem          s10, s9, tp
                  sub          s11, s4, s2
                  mulhu        t3, s3, t0
                  div          s10, a5, s1
                  c.srli       a2, 24
                  and          t2, a1, a6
                  c.addi4spn   a1, sp, 640
                  ori          t4, t6, -1184
                  c.add        s6, sp
                  csrrwi       a5, 0x340, 18
                  csrrci       s5, 0x340, 0
                  c.slli       a5, 11
                  c.slli       ra, 15
                  xor          t2, gp, s5
                  csrrw        a1, 0x340, tp
                  c.andi       a2, -1
                  c.addi16sp   sp, 352
                  div          a3, t2, ra
                  nop
                  add          s10, s5, s9
                  auipc        s10, 998470
                  c.add        a6, s2
                  csrrw        a6, 0x340, s10
                  c.sub        a5, a2
                  c.addi4spn   a4, sp, 480
                  csrrsi       a6, 0x340, 4
                  remu         s7, s8, s2
                  mul          sp, a2, s8
                  csrrc        t3, 0x340, zero
                  c.addi4spn   s1, sp, 128
                  c.addi4spn   s0, sp, 432
                  lui          a7, 264476
                  remu         s11, zero, t0
                  auipc        a5, 66546
                  divu         s7, a5, s4
                  rem          a6, t2, a3
                  mulhu        t0, a6, s6
                  csrrwi       t1, 0x340, 8
                  auipc        t2, 407783
                  srl          a5, a1, s6
                  div          a4, s1, a2
                  nop
                  c.lui        s2, 1
                  slti         s10, s9, -441
                  c.addi16sp   sp, 64
                  c.srai       a5, 4
                  slti         tp, gp, 955
                  csrrs        sp, 0x340, t2
                  remu         t0, zero, zero
                  divu         s11, gp, s11
                  c.lui        a4, 14
                  sll          s4, s11, a2
                  nop
                  addi         t4, s2, 1770
                  mulh         a4, a3, a0
                  mulh         s0, a2, a4
                  sub          s4, a2, gp
                  slli         a6, t1, 30
                  auipc        tp, 311146
                  sll          t1, a3, zero
                  srl          ra, t5, ra
                  srai         sp, tp, 20
                  c.or         a2, s1
                  csrrs        a7, 0x340, a5
                  lui          ra, 732571
                  csrrci       s1, 0x340, 11
                  rem          s4, s2, a0
                  addi         a7, t5, -1512
                  csrrci       a6, 0x340, 11
                  csrrc        tp, 0x340, s5
                  c.addi4spn   s1, sp, 432
                  c.addi4spn   a5, sp, 464
                  mulh         a3, s6, s6
                  c.li         gp, -1
                  csrrc        a1, 0x340, zero
                  divu         a1, tp, t5
                  c.mv         s5, tp
                  slti         zero, s3, -6
                  c.li         t3, 20
                  slt          s8, a0, tp
                  xori         s2, t5, -440
                  or           s8, s3, t5
                  mul          s4, s8, a7
                  or           s4, zero, zero
                  c.andi       a5, 6
                  c.lui        t0, 14
                  csrrci       s6, 0x340, 0
                  csrrwi       a6, 0x340, 29
                  c.sub        a1, a2
                  c.addi16sp   sp, -16
                  mulh         t1, t4, s8
                  slli         t4, t2, 5
                  andi         a2, s5, 1343
                  add          s5, t1, s10
                  slti         a2, ra, 366
                  lui          a0, 1042285
                  c.add        a0, s5
                  div          s7, a1, tp
                  xori         t5, t0, 921
                  sll          s8, s8, t5
                  c.and        a5, s1
                  rem          s1, s1, s3
                  c.xor        a2, a2
                  mulhu        a5, s8, t2
                  csrrc        s5, 0x340, zero
                  remu         a3, tp, a4
                  c.slli       t1, 26
                  slti         s6, zero, 1901
                  lui          s2, 181245
                  or           zero, s4, tp
                  sra          s8, s8, s2
                  sltiu        s8, t0, 964
                  c.slli       s4, 19
                  ori          gp, tp, 1834
                  rem          s10, a6, s1
                  c.srli       a4, 24
                  c.and        a1, s1
                  addi         s11, s11, -130
                  c.xor        a3, a3
                  c.srli       a3, 8
                  csrrc        s10, 0x340, zero
                  c.add        t3, t5
                  ori          t3, s3, -609
                  sltiu        s2, t0, -1353
                  csrrci       s2, 0x340, 0
                  slli         sp, s3, 16
                  csrrsi       t4, 0x340, 25
                  sltu         a4, t1, a4
                  csrrwi       a1, 0x340, 9
                  mulh         s1, s11, s4
                  c.andi       s1, 7
                  sra          a7, gp, a0
                  div          t0, s5, s4
                  mulhu        a6, a0, a3
                  c.mv         sp, s4
                  or           s1, gp, a1
                  sub          s1, s1, a2
                  div          s10, a5, s0
                  lui          s0, 365642
                  mulhsu       t3, t6, a4
                  addi         a6, t3, -163
                  csrrc        t5, 0x340, t5
                  or           s11, sp, s0
                  srai         s1, a2, 10
                  sll          t1, sp, s3
                  addi         t4, s6, 252
                  c.add        s4, a6
                  c.mv         s0, s5
                  csrrw        a1, 0x340, s10
                  div          gp, a5, s10
                  add          a6, a5, s10
                  divu         t1, s0, a5
                  or           a1, s6, s2
                  c.nop
                  csrrw        s0, 0x340, s8
                  auipc        t4, 468180
                  xori         a5, s11, -778
                  c.addi16sp   sp, 432
                  c.xor        a5, a5
                  nop
                  mulhu        a4, s4, s2
                  c.nop
                  csrrci       t4, 0x340, 22
                  srli         a5, s5, 0
                  xori         s10, ra, 470
                  csrrw        s4, 0x340, t6
                  add          t2, tp, a7
                  slli         s6, a7, 29
                  c.mv         s2, s9
                  c.add        s8, s8
                  sra          a1, a6, sp
                  c.addi4spn   a2, sp, 816
                  c.add        a1, a1
                  add          s8, a3, a2
                  remu         s8, s0, zero
                  c.slli       a3, 28
                  csrrc        zero, 0x340, zero
                  sltu         a5, gp, a4
                  csrrs        s1, 0x340, ra
                  c.addi4spn   a3, sp, 112
                  mulhsu       t1, ra, a6
                  srai         zero, a0, 4
                  auipc        a3, 424510
                  sltiu        sp, a4, 1841
                  sltiu        s6, s2, 2014
                  c.add        s4, s10
                  ori          a3, ra, -260
                  c.nop
                  csrrc        t3, 0x340, zero
                  remu         zero, s5, a5
                  csrrw        a7, 0x340, t4
                  c.sub        s0, s0
                  csrrwi       t3, 0x340, 3
                  c.xor        a0, a5
                  csrrci       t4, 0x340, 0
                  lui          s2, 489220
                  slti         t5, tp, 1398
                  c.addi4spn   s1, sp, 176
                  csrrci       t5, 0x340, 0
                  c.slli       s11, 16
                  slti         a2, s6, 1598
                  csrrs        s6, 0x340, zero
                  csrrsi       t2, 0x340, 0
                  c.srli       s0, 14
                  c.lui        s1, 18
                  auipc        t4, 631250
                  c.addi       s6, -1
                  mulh         a4, s5, s9
                  c.add        s5, gp
                  remu         t2, s9, s10
                  c.xor        a5, a2
                  sltu         gp, a3, t4
                  c.add        a0, s9
                  c.lui        a4, 3
                  csrrci       s2, 0x340, 0
                  slli         a0, s4, 28
                  slt          ra, s10, t4
                  slti         a7, a2, -1680
                  c.xor        a3, s0
                  auipc        s8, 926296
                  csrrwi       s2, 0x340, 24
                  slt          t2, a5, a0
                  c.mv         s1, a6
                  c.sub        a5, s0
                  sltiu        s1, t5, -1828
                  sltiu        a5, a2, -1040
                  addi         s10, t5, 524
                  c.slli       a6, 24
                  nop
                  auipc        a6, 768838
                  c.nop
                  nop
                  c.andi       s0, -1
                  csrrci       s2, 0x340, 25
                  or           s0, a2, a2
                  c.li         a1, -1
                  c.addi       tp, 24
                  xor          a3, t5, s6
                  csrrw        sp, 0x340, s4
                  addi         t1, t3, 287
                  rem          s7, t5, s8
                  mul          s2, a0, s9
                  auipc        t0, 229291
                  sra          s7, a6, gp
                  c.or         s0, a3
                  xor          t4, ra, a1
                  divu         t2, a5, t0
                  csrrs        ra, 0x340, zero
                  add          a0, s8, t4
                  mulh         s1, s1, sp
                  srl          t3, a7, t3
                  csrrwi       ra, 0x340, 7
                  remu         gp, s11, sp
                  xori         t4, t6, 142
                  c.add        a2, s7
                  c.mv         a5, s5
                  add          t2, a6, t0
                  c.li         a5, 23
                  csrrw        ra, 0x340, a2
                  remu         ra, s6, a0
                  ori          a3, a1, -1860
                  csrrc        a0, 0x340, ra
                  slti         t3, s0, -1492
                  sra          zero, s0, sp
                  slli         a7, gp, 10
                  xor          a6, t1, s0
                  auipc        t5, 802304
                  auipc        ra, 709931
                  c.lui        a2, 19
                  auipc        a6, 1157
                  add          a2, s4, a3
                  mul          t3, s4, s3
                  c.li         t2, -1
                  srli         s1, a6, 0
                  sra          a5, zero, s6
                  mulh         s7, s5, s10
                  xor          a4, s2, t3
                  sltu         a2, s7, s1
                  andi         s7, t3, -1816
                  lui          ra, 182363
                  c.add        t5, t0
                  c.addi4spn   a1, sp, 560
                  c.nop
                  csrrwi       a3, 0x340, 26
                  c.addi4spn   a3, sp, 656
                  c.mv         t0, t0
                  nop
                  rem          s0, a7, s2
                  c.addi16sp   sp, -16
                  c.srai       s0, 27
                  sll          t2, sp, a3
                  c.slli       s10, 7
                  sltu         a1, gp, a1
                  csrrsi       gp, 0x340, 0
                  andi         a2, t6, 1110
                  sltiu        tp, s4, -540
                  c.or         a2, a1
                  xori         tp, t0, 868
                  csrrci       t0, 0x340, 0
                  ori          t1, s2, 815
                  sra          zero, a5, s2
                  c.xor        s1, a4
                  nop
                  csrrci       t0, 0x340, 0
                  mul          a0, a4, s8
                  and          tp, s7, s6
                  c.sub        s1, a2
                  csrrwi       s7, 0x340, 24
                  srai         gp, zero, 13
                  c.and        a3, a1
                  slti         s6, s2, 1546
                  c.addi16sp   sp, 192
                  csrrs        s2, 0x340, tp
                  c.lui        s0, 31
                  c.xor        a2, a3
                  remu         t2, s10, t3
                  csrrwi       a6, 0x340, 19
                  slli         a7, s11, 29
                  c.and        s1, s1
                  csrrc        t0, 0x340, zero
                  c.addi16sp   sp, -16
                  divu         t5, t4, s9
                  sub          s6, t6, gp
                  add          a2, a0, s0
                  sltu         t0, t6, s10
                  sub          a7, s6, t0
                  ori          ra, t2, -2008
                  mul          gp, s5, s11
                  csrrci       a7, 0x340, 0
                  csrrsi       a5, 0x340, 0
                  div          s7, s9, a6
                  and          s8, s11, s8
                  c.srli       a1, 3
                  sltiu        a1, a0, 145
                  c.or         a3, a3
                  mulhu        t1, s11, s4
                  mul          s6, tp, s5
                  divu         a1, t1, s11
                  c.lui        t0, 23
                  remu         s5, s10, s7
                  and          a1, s8, a7
                  sltu         s7, t3, t0
                  csrrw        s1, 0x340, s8
                  slt          s5, a1, s5
                  csrrci       t3, 0x340, 13
                  csrrs        a1, 0x340, tp
                  add          s2, s5, s10
                  and          t0, ra, t1
                  csrrs        a6, 0x340, s2
                  c.add        tp, s0
                  c.srli       a3, 9
                  addi         t1, t4, -1269
                  c.addi4spn   s0, sp, 336
                  srai         s7, s7, 6
                  mulhsu       s6, a4, a3
                  c.slli       s7, 19
                  c.add        s1, t1
                  mul          s11, s11, t5
                  c.xor        s0, a4
                  mul          ra, a7, a6
                  slti         a1, a1, -2020
                  srli         s6, a7, 15
                  c.andi       s0, 19
                  ori          a4, s5, 555
                  sltu         a3, a5, s6
                  srl          t2, t4, s10
                  and          tp, t3, s9
                  xori         s0, a5, 1538
                  csrrw        a1, 0x340, s9
                  c.andi       a0, 17
                  mulh         s4, a7, sp
                  c.or         a5, a3
                  csrrwi       gp, 0x340, 24
                  sub          a2, s11, s6
                  c.mv         a1, t1
                  xor          t3, a3, t3
                  xor          a2, a6, t5
                  csrrsi       ra, 0x340, 0
                  csrrs        t5, 0x340, zero
                  c.add        s6, sp
                  csrrci       ra, 0x340, 0
                  c.addi4spn   a1, sp, 352
                  c.slli       a2, 7
                  div          zero, s9, t6
                  slti         t1, t4, 1341
                  c.addi16sp   sp, 368
                  addi         s5, a3, 419
                  c.sub        a2, a3
                  c.add        a2, s0
                  sra          s5, a7, s3
                  srl          t4, tp, t0
                  csrrw        tp, 0x340, a3
                  mulh         a0, s7, t1
                  c.nop
                  and          s8, s5, s6
                  c.srai       a0, 5
                  c.addi       s2, -1
                  c.srai       s0, 21
                  auipc        a5, 779437
                  c.mv         a3, a0
                  div          s8, a2, s9
                  sll          t4, t3, s0
                  sll          s2, s8, sp
                  srai         s10, s10, 24
                  mul          a2, t6, s7
                  c.andi       a4, 27
                  c.nop
                  remu         a2, s0, a5
                  mul          t2, a5, a7
                  slt          a7, s2, s0
                  csrrc        a2, 0x340, s9
                  csrrs        t1, 0x340, t4
                  sub          s8, a0, sp
                  srai         s5, ra, 25
                  c.lui        s7, 22
                  c.srli       a3, 30
                  sltu         s5, s5, a6
                  csrrwi       t1, 0x340, 3
                  slt          a6, a1, ra
                  ori          zero, s0, 1891
                  csrrw        s8, 0x340, tp
                  or           t1, zero, t2
                  mul          a2, ra, a3
                  mul          sp, t3, t2
                  slli         t5, t2, 30
                  slli         ra, gp, 5
                  csrrci       s8, 0x340, 13
                  mul          a5, t4, t0
                  c.xor        a5, s1
                  sub          t3, zero, gp
                  add          s7, tp, t2
                  c.addi       s11, 17
                  sll          s6, sp, s1
                  and          a5, t5, a4
                  rem          t2, t6, a2
                  div          s5, s10, a0
                  c.xor        a5, a3
                  c.addi       s11, 7
                  mulhu        a2, a3, gp
                  slt          a4, a1, t2
                  xor          a7, a4, a4
                  div          s2, s10, t6
                  div          ra, a0, s0
                  xori         t1, t0, 744
                  c.addi4spn   a3, sp, 496
                  c.addi16sp   sp, 64
                  c.li         s6, -1
                  srl          s5, gp, a5
                  and          gp, t4, t1
                  div          a3, a5, t6
                  srli         s4, a4, 25
                  c.nop
                  divu         s5, t3, sp
                  c.or         a0, s1
                  mulhu        t4, a0, t5
                  c.li         s1, -1
                  c.srli       s0, 2
                  slt          s10, tp, a7
                  srl          t1, t4, t6
                  csrrs        a5, 0x340, zero
                  c.lui        s5, 1
                  addi         a3, t4, 1867
                  xor          s0, s4, a5
                  sltu         a4, s5, t1
                  srli         s1, t5, 1
                  csrrs        s10, 0x340, zero
                  auipc        a3, 79638
                  mul          a5, t6, s3
                  srli         t4, t4, 0
                  nop
                  slli         zero, s2, 16
                  add          a5, s5, s2
                  csrrc        t5, 0x340, s4
                  c.addi       sp, -1
                  c.nop
                  andi         tp, s8, 1659
                  srl          a2, a4, t5
                  addi         s0, a1, -1431
                  c.slli       a1, 7
                  csrrc        s2, 0x340, s5
                  sll          s1, s6, sp
                  csrrci       gp, 0x340, 25
                  divu         a6, sp, s0
                  c.add        s10, gp
                  csrrsi       s11, 0x340, 0
                  csrrc        sp, 0x340, zero
                  sltiu        s2, a6, 1691
                  div          a2, t1, s9
                  sub          s10, a2, s4
                  c.sub        s1, a4
                  xor          ra, a4, s0
                  srl          s5, s0, s11
                  c.li         a4, 15
                  c.or         s1, s1
                  c.mv         s0, a7
                  c.xor        s0, a3
                  c.or         a1, a4
                  c.add        s2, s9
                  srli         t1, a4, 10
                  srl          s2, sp, t4
                  and          a0, s10, s2
                  csrrw        a7, 0x340, gp
                  csrrsi       a5, 0x340, 6
                  xori         a5, t5, 1023
                  srai         a2, s0, 27
                  c.or         a3, s0
                  csrrsi       s1, 0x340, 3
                  c.srli       a2, 28
                  c.addi4spn   a5, sp, 144
                  c.and        a0, s0
                  c.li         a4, 6
                  auipc        gp, 997836
                  add          zero, s5, ra
                  mulh         a6, s1, a1
                  c.lui        a6, 30
                  c.xor        a0, a4
                  xor          tp, s9, s8
                  c.srli       a2, 21
                  srli         t2, t5, 2
                  and          zero, a7, s3
                  xor          ra, a5, tp
                  c.and        a3, a2
                  c.add        t5, t4
                  c.slli       t3, 4
                  divu         s10, t4, s7
                  c.andi       s0, 27
                  sltiu        t0, a5, 1664
                  c.slli       s5, 7
                  csrrc        gp, 0x340, zero
                  xori         t2, a4, 1189
                  xori         s0, tp, 85
                  c.lui        s0, 20
                  add          s10, t5, zero
                  srai         s4, s4, 14
                  nop
                  c.addi16sp   sp, 304
                  c.xor        a2, s1
                  mul          a0, a7, t2
                  c.li         s11, -1
                  c.sub        a1, a4
                  csrrc        a4, 0x340, zero
                  c.lui        a1, 11
                  srli         s4, t3, 3
                  csrrs        s1, 0x340, s4
                  srl          s1, ra, sp
                  c.and        s1, a4
                  slti         a6, s9, -1146
                  rem          s1, a2, s9
                  andi         s11, t0, 125
                  c.sub        s1, s0
                  rem          a7, a1, s6
                  csrrci       s4, 0x340, 19
                  sll          ra, t1, s4
                  csrrc        a2, 0x340, zero
                  c.lui        tp, 21
                  csrrs        a0, 0x340, s0
                  csrrwi       s5, 0x340, 20
                  slti         t3, s11, -2029
                  c.mv         a2, a0
                  sltu         a0, tp, s0
                  c.or         s1, a3
                  addi         a4, s3, 1732
                  mulh         a5, a3, s9
                  csrrs        s2, 0x340, gp
                  xori         s10, s2, 1090
                  add          tp, t6, s9
                  c.nop
                  xori         s10, t3, 944
                  div          s2, t6, a2
                  sltu         s0, t0, s8
                  c.addi4spn   a0, sp, 928
                  c.and        a2, a2
                  c.sub        s0, a3
                  sra          a5, gp, s0
                  c.andi       a4, -1
                  c.addi4spn   a5, sp, 384
                  c.li         t4, 13
                  or           s11, a3, a1
                  csrrsi       a2, 0x340, 0
                  csrrci       a3, 0x340, 0
                  mulh         gp, a0, a3
                  xor          a2, tp, s10
                  mulhsu       sp, a6, s7
                  div          a3, s6, a2
                  sll          gp, t3, zero
                  sltiu        s8, ra, 1793
                  c.srli       s0, 3
                  srl          zero, s6, gp
                  mul          a5, s4, s11
                  divu         a1, s8, a0
                  c.lui        t5, 9
                  mulhsu       a4, t2, s4
                  c.addi16sp   sp, 208
                  lui          gp, 1019559
                  srai         t4, a6, 10
                  div          t0, t5, zero
                  addi         s1, a7, -481
                  div          a2, t5, a7
                  ori          s8, a5, -1013
                  c.mv         s1, s7
                  c.addi       a7, 7
                  csrrs        a7, 0x340, zero
                  csrrs        t4, 0x340, sp
                  csrrci       t4, 0x340, 18
                  csrrwi       s7, 0x340, 27
                  remu         a3, a5, s0
                  slli         a5, s9, 19
                  sra          s0, t2, a6
                  div          a5, s10, a1
                  mulhu        t5, s9, t5
                  c.or         a3, a0
                  c.add        a4, t2
                  mul          a1, s1, a2
                  csrrc        s2, 0x340, zero
                  mulh         s11, t3, s1
                  divu         t2, s7, s8
                  sltu         t0, s2, s0
                  mul          s1, s0, a2
                  c.slli       gp, 27
                  csrrw        s0, 0x340, sp
                  slli         s4, s10, 26
                  remu         s6, sp, a5
                  sub          a7, s10, t6
                  slti         t0, a7, -430
                  csrrwi       s5, 0x340, 10
                  auipc        a0, 1006374
                  slli         s1, s3, 31
                  andi         a1, a7, -1019
                  c.and        a4, a2
                  c.nop
                  c.lui        s0, 17
                  sub          a4, a2, ra
                  sltiu        a3, s5, -1659
                  ori          t0, a4, -1002
                  divu         a2, ra, s1
                  ori          t4, gp, 235
                  remu         s8, zero, s7
                  srl          a3, a2, t0
                  c.or         s0, a0
                  c.and        a4, a5
                  c.lui        t2, 23
                  srl          a1, t6, a6
                  divu         t5, a2, s8
                  csrrs        a0, 0x340, zero
                  slt          s11, t3, s10
                  auipc        a3, 124252
                  mulh         a2, s9, t4
                  c.andi       s1, 21
                  c.mv         s7, t3
                  slli         t1, s4, 21
                  sltiu        a6, t2, -347
                  divu         t2, s11, s5
                  or           a6, t2, a3
                  c.lui        a1, 7
                  c.nop
                  and          ra, s5, gp
                  sltiu        a2, s8, 1566
                  sltu         gp, s6, s2
                  rem          t4, t3, ra
                  auipc        s2, 763639
                  sltiu        a1, s7, 1935
                  c.lui        s6, 4
                  c.xor        a4, a3
                  sra          a6, ra, s8
                  or           ra, a2, s3
                  c.slli       gp, 1
                  rem          sp, s2, t2
                  c.addi4spn   s0, sp, 592
                  c.addi4spn   a4, sp, 368
                  c.lui        s0, 4
                  mulhsu       zero, tp, a7
                  slt          t1, a7, t4
                  c.and        a3, a3
                  ori          t5, s4, 1643
                  c.srli       a4, 25
                  addi         a5, zero, -1647
                  c.lui        s8, 17
                  c.slli       s10, 20
                  xori         s2, s1, -1658
                  andi         s5, t4, 649
                  srli         sp, a3, 16
                  c.nop
                  ori          t3, a4, -1340
                  c.sub        a0, s0
                  mulhu        zero, a3, s10
                  sltu         tp, s0, t0
                  csrrs        tp, 0x340, zero
                  c.srli       a4, 1
                  remu         t2, a1, s1
                  c.lui        s8, 13
                  c.srli       a5, 6
                  slt          s6, s3, sp
                  ori          a4, t3, -439
                  mulhu        a1, s2, s9
                  addi         t2, s5, -927
                  mulhu        s8, s2, s3
                  c.andi       a5, -1
                  sra          s2, s3, t3
                  mul          a7, t3, t5
                  c.xor        a4, a0
                  slli         tp, a2, 31
                  divu         a6, s10, t2
                  slti         s2, a6, 1418
                  remu         zero, t6, t6
                  remu         zero, s6, a6
                  c.nop
                  mul          ra, a7, sp
                  csrrwi       a0, 0x340, 0
                  mulh         s2, tp, s10
                  or           s8, s10, sp
                  xori         s11, t0, 1511
                  mulh         ra, a6, t6
                  mulhsu       s10, a6, s4
                  csrrw        s11, 0x340, t6
                  srai         t4, s6, 25
                  c.srli       s1, 5
                  mulhu        s4, t2, s3
                  srl          a5, t2, s7
                  sub          s4, s1, t2
                  c.addi16sp   sp, 352
                  mulh         gp, t6, s11
                  lui          a3, 747086
                  ori          s2, s11, -83
                  mulh         t5, a3, tp
                  c.andi       s1, -1
                  sltu         gp, zero, s1
                  csrrwi       a5, 0x340, 12
                  c.sub        a4, a3
                  c.srai       a1, 19
                  sltu         s4, t0, s4
                  mul          s7, s4, t2
                  c.and        a4, a0
                  or           a3, tp, s4
                  slti         a7, zero, -928
                  c.and        s0, s0
                  slli         sp, s8, 24
                  c.addi4spn   a3, sp, 384
                  srli         s7, t6, 1
                  sra          a3, t1, t5
                  rem          s10, t2, s0
                  c.andi       a4, -1
                  or           t2, sp, t6
                  xori         s8, a7, -882
                  csrrc        s10, 0x340, a5
                  c.mv         a5, t3
                  c.li         t4, -1
                  csrrs        t0, 0x340, t0
                  csrrci       s2, 0x340, 27
                  csrrc        a1, 0x340, s2
                  mulhsu       s7, s0, s6
                  lui          ra, 286750
                  csrrc        a3, 0x340, tp
                  c.slli       a2, 22
                  c.or         s1, a2
                  c.slli       s4, 31
                  c.srai       s0, 29
                  andi         t4, t0, -1860
                  remu         a2, a2, s4
                  mulhsu       a0, s4, s0
                  c.addi       t3, 24
                  addi         sp, s5, -1932
                  c.and        a2, s0
                  and          a3, a2, t1
                  andi         a5, a3, -582
                  and          s4, t3, a4
                  c.mv         s4, a7
                  lui          a4, 150674
                  mul          s0, t2, t0
                  c.or         a3, a5
                  sub          a0, s9, s11
                  add          s11, a7, s5
                  xori         a0, s6, -1788
                  c.addi       ra, 1
                  csrrw        s6, 0x340, sp
                  sltu         t2, t5, s8
                  add          a3, sp, s10
                  xori         a1, t1, -589
                  csrrc        s6, 0x340, s1
                  and          s8, s2, t4
                  c.li         s8, 29
                  rem          s5, s8, t6
                  sll          a3, s11, a7
                  sub          s8, s0, a3
                  srli         zero, s4, 14
                  c.addi16sp   sp, -16
                  csrrc        a1, 0x340, zero
                  slt          a3, s10, t3
                  slt          a5, a2, t1
                  remu         t4, tp, s10
                  sub          a5, t2, t6
                  sltu         a6, ra, a3
                  c.srli       a3, 4
                  sll          s7, t6, tp
                  lui          a2, 411697
                  csrrsi       t5, 0x340, 30
                  ori          gp, a1, -557
                  sub          a5, t1, t5
                  c.andi       s0, 1
                  c.or         a0, a3
                  and          s10, s2, ra
                  slli         a3, s2, 22
                  c.and        s1, s1
                  slli         s1, t4, 17
                  csrrci       gp, 0x340, 0
                  or           s7, ra, gp
                  slti         s6, s3, 368
                  nop
                  xori         s4, s10, 328
                  csrrs        t3, 0x340, zero
                  srai         zero, s6, 8
                  add          a0, t4, zero
                  slt          s1, t4, s0
                  csrrc        t0, 0x340, s6
                  sltiu        s11, t4, -64
                  c.lui        ra, 2
                  c.nop
                  srl          a2, a6, s1
                  mulhu        sp, a5, s9
                  addi         s2, t5, -1950
                  divu         a3, s2, t2
                  divu         a4, a3, s2
                  srai         s6, t2, 28
                  sub          s7, a6, t2
                  add          s11, ra, t5
                  c.or         a2, a3
                  mulhu        t2, s5, ra
                  c.addi4spn   a0, sp, 784
                  mulh         t0, s3, s10
                  c.lui        s6, 21
                  csrrc        t0, 0x340, zero
                  c.mv         s8, t4
                  sub          s1, s0, t4
                  csrrwi       a4, 0x340, 18
                  xori         tp, sp, -262
                  lui          a0, 215679
                  ori          a6, s8, -860
                  and          gp, s10, s9
                  csrrwi       t5, 0x340, 13
                  mulhu        a2, s2, t5
                  nop
                  slti         s0, s1, 754
                  c.lui        s11, 12
                  csrrci       t2, 0x340, 0
                  xori         s4, s11, -2032
                  andi         s11, a2, -1649
                  addi         s0, s1, -1374
                  c.nop
                  mulhsu       tp, tp, a4
                  c.sub        s1, a4
                  remu         a5, a3, zero
                  c.li         s5, 16
                  c.addi16sp   sp, -16
                  addi         ra, sp, -1131
                  c.addi16sp   sp, 32
                  csrrs        a6, 0x340, zero
                  c.sub        s1, a4
                  csrrsi       zero, 0x340, 27
                  c.andi       s1, -1
                  slt          ra, a6, s4
                  xor          t2, ra, t4
                  xori         a7, a4, 1148
                  c.and        a5, s0
                  sra          s10, a1, s0
                  c.li         s8, -1
                  c.slli       a0, 9
                  slti         s7, s0, -742
                  c.srai       a1, 25
                  c.addi16sp   sp, 32
                  mulhu        a0, s5, s0
                  csrrwi       a4, 0x340, 2
                  sra          s0, t0, t0
                  c.nop
                  csrrwi       t4, 0x340, 29
                  csrrc        s7, 0x340, zero
                  xor          t4, s11, t6
                  slt          tp, s5, t6
                  csrrwi       t3, 0x340, 7
                  c.srai       a1, 1
                  c.li         a6, 22
                  remu         s8, a2, s11
                  slli         t0, s1, 5
                  c.lui        a0, 24
                  div          zero, t3, s4
                  c.or         a5, s1
                  mulhu        s0, a7, s11
                  c.and        a2, a1
                  xori         a0, s4, -14
                  mulh         zero, s11, a0
                  div          s6, t5, s0
                  c.mv         s2, a4
                  c.addi       a6, -1
                  divu         a4, a0, a4
                  div          t1, ra, sp
                  c.li         s8, 3
                  ori          s6, s5, -292
                  c.lui        s10, 11
                  mulhu        a7, ra, a1
                  nop
                  xori         a1, a1, -699
                  add          s7, s5, s8
                  c.addi16sp   sp, -16
                  slt          s1, s11, a3
                  xori         a3, s11, 1847
                  ori          t1, s11, 1606
                  c.sub        s0, s1
                  sltiu        a2, s9, 66
                  c.xor        a4, s1
                  add          a6, sp, a2
                  csrrwi       a4, 0x340, 31
                  c.slli       a1, 21
                  remu         a6, zero, a0
                  sll          s7, s10, s10
                  addi         t0, s9, 692
                  auipc        s2, 949785
                  sltiu        s5, s0, 1113
                  c.lui        s1, 18
                  remu         t0, t4, a7
                  sltu         t2, ra, s1
                  srli         t5, s11, 19
                  c.slli       s2, 6
                  lui          a7, 473517
                  sltiu        sp, s8, 483
                  csrrc        s6, 0x340, zero
                  auipc        t5, 877497
                  rem          s10, s6, s2
                  c.add        t4, gp
                  c.and        a2, a4
                  andi         a2, s10, 244
                  csrrsi       a7, 0x340, 27
                  sub          s7, s3, a4
                  xori         t1, a6, 443
                  divu         a5, t3, s8
                  mulhu        ra, ra, t0
                  c.and        a2, a1
                  c.li         a3, -1
                  csrrc        s5, 0x340, t4
                  sra          t5, t3, sp
                  lui          ra, 494744
                  c.andi       s0, 18
                  slt          sp, zero, s6
                  c.sub        a1, a3
                  auipc        a6, 1015979
                  c.sub        a4, a5
                  nop
                  c.addi       a0, -1
                  sll          s8, s11, s6
                  c.andi       a2, 3
                  addi         s11, t3, -1083
                  c.xor        s0, a4
                  divu         a6, s6, a0
                  c.andi       s1, 5
                  nop
                  c.xor        a3, s0
                  c.mv         t3, t3
                  c.xor        a4, s1
                  c.li         a0, 3
                  mulh         a7, t6, a0
                  csrrc        ra, 0x340, s0
                  mulhsu       s11, s9, s5
                  c.lui        s2, 4
                  mulhu        s7, a2, s10
                  slti         s7, t2, -438
                  sll          a2, a3, t0
                  mul          tp, a3, s9
                  sra          s2, a5, ra
                  sll          s11, s0, t2
                  c.addi4spn   a1, sp, 368
                  or           s2, s10, s1
                  mul          a2, t2, s0
                  c.or         a5, a1
                  sub          s4, s2, t6
                  c.srli       a0, 20
                  c.addi16sp   sp, -16
                  c.nop
                  c.addi16sp   sp, -16
                  csrrsi       sp, 0x340, 19
                  c.slli       s11, 23
                  mul          s10, s10, t3
                  csrrc        s1, 0x340, zero
                  lui          t3, 580506
                  c.addi16sp   sp, -16
                  csrrs        s7, 0x340, zero
                  c.li         a2, 13
                  csrrwi       a7, 0x340, 2
                  lui          t4, 328336
                  c.addi16sp   sp, 304
                  c.xor        a1, a0
                  add          gp, sp, s5
                  slti         s6, sp, 419
                  c.xor        a3, a0
                  sub          t5, a1, s6
                  c.li         a1, -1
                  mulhu        a5, s3, t3
                  c.addi4spn   s1, sp, 272
                  ori          sp, t6, -1615
                  c.slli       tp, 22
                  c.xor        a0, a2
                  sltu         t1, t6, t0
                  srli         s2, a7, 28
                  divu         a5, t6, s5
                  lui          a6, 13941
                  csrrw        a0, 0x340, s3
                  auipc        a5, 617808
                  c.addi       a5, -1
                  sra          t2, s7, tp
                  slli         gp, s10, 18
                  c.xor        a1, a1
                  c.add        s6, t6
                  sltu         s5, a5, s6
                  srli         s6, s11, 14
                  and          a6, s0, t3
                  csrrwi       s4, 0x340, 11
                  slli         a7, a3, 26
                  csrrwi       t5, 0x340, 13
                  rem          a5, s11, t1
                  mulhsu       sp, a5, ra
                  csrrw        zero, 0x340, sp
                  csrrsi       t3, 0x340, 0
                  c.nop
                  nop
                  and          s1, s8, t1
                  mulhu        a3, zero, a6
                  slt          a6, s4, s1
                  mulhu        a2, zero, a4
                  mulhsu       t0, tp, s10
                  sltu         sp, sp, s1
                  sltu         t4, t0, s3
                  csrrsi       s7, 0x340, 22
                  c.lui        s4, 16
                  sra          s11, t1, ra
                  c.addi4spn   s1, sp, 672
                  sltu         s5, a6, s10
                  csrrwi       a3, 0x340, 9
                  or           a6, s8, s4
                  c.addi4spn   s1, sp, 656
                  sll          zero, s1, a2
                  div          t3, a3, s7
                  divu         s1, s4, a2
                  xori         a1, a5, -1812
                  slti         s2, t3, -1121
                  slt          a3, a5, s7
                  c.andi       s0, -1
                  c.srli       a1, 16
                  mulh         t2, a5, t2
                  c.lui        s4, 24
                  slt          gp, s8, t3
                  slt          sp, a4, t1
                  mul          gp, s8, sp
                  c.or         s1, s0
                  sltu         a4, t2, a1
                  c.lui        s2, 26
                  andi         zero, a5, 887
                  lui          s10, 197182
                  c.add        tp, s4
                  rem          a1, a3, a5
                  c.sub        a2, a2
                  sltiu        t4, s7, -1654
                  mulhsu       s4, a4, a6
                  c.addi4spn   a3, sp, 1008
                  c.or         a0, a1
                  sll          s1, s4, zero
                  c.addi4spn   a2, sp, 352
                  c.sub        a1, s0
                  srli         t5, s10, 27
                  rem          t2, s4, t5
                  lui          ra, 1042974
                  remu         a1, s5, t3
                  srai         zero, a0, 7
                  srai         a0, s11, 5
                  csrrwi       s11, 0x340, 1
                  slli         s8, s2, 16
                  sra          s5, t4, a0
                  c.mv         t0, s5
                  c.addi       tp, -1
                  c.add        t5, s10
                  add          s1, s6, a3
                  c.srai       a2, 11
                  c.and        s1, a0
                  sltu         s1, a4, t4
                  auipc        a6, 164600
                  c.lui        t5, 1
                  c.andi       s0, 16
                  c.addi       s2, -1
                  c.srai       a2, 23
                  div          a7, t6, t0
                  sltu         t4, s6, t6
                  add          t5, t6, a0
                  slti         a2, tp, 1997
                  xori         t5, s1, 1074
                  c.addi16sp   sp, -16
                  sll          s8, a1, s9
                  c.mv         s8, a3
                  rem          zero, t1, ra
                  auipc        a4, 261357
                  srli         zero, s10, 10
                  csrrs        s7, 0x340, s3
                  c.andi       a4, 22
                  sub          s2, a4, s2
                  divu         t0, s6, gp
                  srli         s0, t1, 2
                  div          s0, s2, s4
                  sltu         a5, gp, t5
                  csrrwi       s5, 0x340, 2
                  csrrs        s2, 0x340, a7
                  srli         a6, s8, 31
                  lui          t0, 211191
                  xor          s11, a2, tp
                  c.addi16sp   sp, 256
                  csrrw        tp, 0x340, s8
                  srl          s4, a1, s8
                  remu         s1, t0, a1
                  csrrs        t4, 0x340, zero
                  srl          s8, a0, a2
                  add          s8, a5, s2
                  mulhsu       s7, a7, t2
                  sll          a1, s11, s5
                  c.or         a0, a3
                  mulh         a4, t3, t6
                  div          s8, t0, t2
                  csrrwi       a1, 0x340, 21
                  ori          s1, a6, 1073
                  c.srai       s1, 8
                  xori         s2, s5, -1233
                  srli         s6, tp, 18
                  rem          a1, s3, t0
                  divu         a2, t0, a5
                  slt          s5, sp, t0
                  or           s5, s4, s0
                  ori          t3, s7, 1496
                  c.xor        s1, a4
                  divu         a0, zero, a1
                  c.addi16sp   sp, 304
                  rem          gp, sp, s4
                  mulhu        s7, a5, s9
                  mul          s2, s3, s11
                  auipc        t4, 206806
                  c.srli       s1, 24
                  divu         a5, t3, s11
                  csrrw        a3, 0x340, a1
                  mulhsu       a7, s9, s2
                  c.addi4spn   a3, sp, 304
                  div          t2, s7, s3
                  or           tp, a3, sp
                  sll          ra, a5, sp
                  c.nop
                  c.addi16sp   sp, 208
                  div          s7, s9, a4
                  remu         a6, t2, s5
                  c.mv         a0, t2
                  c.lui        s1, 23
                  csrrci       s6, 0x340, 0
                  csrrsi       a1, 0x340, 0
                  sltu         s0, a3, s0
                  srai         s10, s10, 11
                  c.nop
                  c.mv         a5, s0
                  csrrci       s5, 0x340, 0
                  xori         s0, s8, 316
                  srli         a4, ra, 11
                  c.addi       s0, -1
                  remu         s8, a1, a2
                  add          sp, s0, s0
                  c.and        s0, a0
                  c.and        a3, a0
                  auipc        s6, 651613
                  c.xor        a5, a2
                  rem          s7, s9, tp
                  auipc        s0, 498153
                  srl          a2, t6, t6
                  c.and        s0, a1
                  c.srli       a1, 6
                  sub          s4, gp, s2
                  mulh         s10, s1, a1
                  c.andi       a4, 10
                  c.sub        a1, a1
                  lui          a0, 21398
                  c.sub        s0, a1
                  rem          a4, a1, a2
                  c.srai       s0, 9
                  c.addi       t1, -1
                  c.xor        s1, a5
                  c.li         a1, -1
                  c.srai       a5, 15
                  c.addi4spn   a2, sp, 688
                  csrrci       s10, 0x340, 27
                  sltiu        s4, t3, -364
                  csrrw        t2, 0x340, t6
                  slti         a0, a3, 1699
                  or           a5, t3, s4
                  csrrc        t0, 0x340, zero
                  csrrs        s8, 0x340, sp
                  c.and        a0, a0
                  csrrw        a2, 0x340, sp
                  divu         s2, t4, a3
                  c.or         a5, s1
                  xori         s6, s8, 865
                  c.lui        s6, 8
                  slt          t4, s4, a7
                  c.sub        a3, s0
                  c.and        a3, a2
                  auipc        s11, 599785
                  c.sub        s0, a3
                  mulhu        sp, t6, s7
                  csrrsi       t4, 0x340, 29
                  mulhsu       t1, t0, t2
                  add          s2, s1, t1
                  c.add        a7, s8
                  slti         zero, s2, 1776
                  auipc        gp, 296175
                  rem          t1, s1, a0
                  c.mv         s7, a7
                  xori         s6, s1, -1139
                  c.slli       t2, 20
                  csrrwi       a2, 0x340, 8
                  srai         t0, a2, 14
                  c.addi4spn   s1, sp, 96
                  sll          s5, s0, a2
                  c.and        a4, a3
                  nop
                  c.xor        a3, s0
                  sll          a7, a4, a7
                  divu         zero, t6, s8
                  csrrc        gp, 0x340, zero
                  srai         a6, a7, 16
                  mul          t5, ra, s11
                  csrrci       s7, 0x340, 0
                  csrrs        s0, 0x340, s2
                  andi         t1, t5, -1647
                  nop
                  sll          t3, s5, a6
                  nop
                  mulhu        sp, t1, s10
                  ori          a4, zero, 787
                  csrrc        s5, 0x340, zero
                  csrrc        sp, 0x340, zero
                  c.addi4spn   s0, sp, 704
                  c.sub        a5, a2
                  c.addi4spn   a3, sp, 32
                  slli         zero, t1, 14
                  c.srai       s0, 2
                  divu         a1, zero, t0
                  mulhu        a5, s9, s4
                  lui          a3, 629675
                  rem          t5, a1, t3
                  c.add        s10, a3
                  sll          a7, s4, s11
                  srli         a0, ra, 24
                  xori         t5, s6, -1187
                  srai         a5, t5, 5
                  csrrs        zero, 0x340, a2
                  sltiu        s6, s11, -685
                  ori          zero, a4, -736
                  remu         t5, a1, zero
                  slli         tp, s7, 29
                  div          s7, a7, a7
                  srai         s10, s6, 4
                  c.mv         s11, s2
                  remu         s1, a0, t1
                  c.srai       s0, 4
                  c.addi4spn   a5, sp, 800
                  c.or         a3, s0
                  csrrs        tp, 0x340, zero
                  c.sub        a3, a0
                  lui          a1, 1028509
                  mulhsu       tp, a6, s0
                  c.li         a6, 23
                  remu         t0, t2, t0
                  c.li         t0, -1
                  rem          a6, tp, s5
                  c.mv         t0, gp
                  c.srai       s0, 23
                  c.add        s4, gp
                  or           t4, t6, s5
                  divu         t4, a7, t0
                  c.andi       a3, -1
                  c.andi       a1, 29
                  xor          s7, t6, s7
                  sltu         s6, a0, sp
                  auipc        a5, 1007100
                  srai         t5, s10, 5
                  csrrsi       s6, 0x340, 19
                  c.srli       s1, 27
                  sltiu        t1, a6, 1991
                  ori          s7, ra, -867
                  c.lui        s10, 12
                  srli         t0, sp, 18
                  csrrci       t2, 0x340, 9
                  c.mv         t2, t0
                  rem          a3, s11, s5
                  mul          s4, s7, ra
                  auipc        a2, 736890
                  c.and        a3, s0
                  srli         a2, s6, 3
                  slli         a2, s6, 14
                  c.xor        s1, a1
                  mulh         zero, t3, s3
                  xor          a1, s0, tp
                  addi         t5, tp, 1416
                  sub          zero, s7, t3
                  c.mv         s2, s3
                  c.andi       a2, 13
                  c.addi4spn   a2, sp, 704
                  auipc        a5, 773001
                  csrrsi       t3, 0x340, 0
                  c.addi16sp   sp, -16
                  c.xor        a0, a5
                  lui          t5, 71382
                  csrrsi       s1, 0x340, 0
                  csrrw        a0, 0x340, gp
                  c.andi       a5, 25
                  sltu         tp, a5, s11
                  c.mv         s5, s6
                  xor          a6, s5, s7
                  csrrw        ra, 0x340, t4
                  c.xor        a5, a1
                  c.nop
                  c.li         t0, -1
                  c.addi16sp   sp, -16
                  xori         a2, s8, 297
                  c.mv         a0, t5
                  c.srai       a5, 13
                  c.srai       s1, 6
                  csrrsi       s4, 0x340, 0
                  c.lui        ra, 26
                  slti         a1, t6, 1721
                  xori         t3, t0, 1065
                  auipc        t1, 794624
                  div          s5, s10, s7
                  and          s5, a3, s2
                  nop
                  mulhu        gp, t0, sp
                  c.srai       a4, 24
                  c.srli       a3, 13
                  xori         s11, t0, 1901
                  divu         gp, t0, s6
                  sra          zero, s2, s9
                  csrrw        s7, 0x340, t4
                  auipc        a1, 128960
                  c.lui        t2, 27
                  csrrsi       s7, 0x340, 0
                  addi         t0, t3, -1740
                  sltiu        ra, gp, 483
                  rem          a4, s7, ra
                  slt          tp, sp, a4
                  xor          a4, ra, s10
                  srai         t5, a5, 0
                  csrrci       a5, 0x340, 0
                  c.srli       a4, 1
                  xori         s7, a1, 1172
                  csrrsi       a4, 0x340, 31
                  c.srli       a1, 17
                  slt          a3, s8, t4
                  c.mv         s7, t1
                  mul          s0, t6, s10
                  mulhsu       s2, a3, tp
                  nop
                  csrrs        a5, 0x340, s4
                  addi         s10, t3, -1271
                  divu         t1, s6, s2
                  div          s2, zero, ra
                  andi         s1, s6, 1974
                  c.nop
                  csrrsi       s7, 0x340, 0
                  c.addi       s8, -1
                  csrrs        s4, 0x340, zero
                  slti         a0, t2, -1103
                  nop
                  mul          s10, s3, s1
                  c.addi4spn   s1, sp, 192
                  div          a2, s2, sp
                  rem          s4, s4, a5
                  c.xor        a1, s0
                  sub          zero, s6, a6
                  mulhu        s11, t6, a6
                  add          s11, s3, s7
                  c.addi16sp   sp, 384
                  mulhsu       gp, zero, s8
                  c.and        a4, a4
                  c.mv         s1, t0
                  ori          t3, s4, -32
                  csrrs        t1, 0x340, zero
                  csrrc        s8, 0x340, zero
                  c.mv         a3, t4
                  c.addi4spn   s1, sp, 464
                  c.nop
                  c.li         t1, 3
                  xor          zero, s11, a0
                  ori          s4, t3, 1938
                  c.and        a1, s1
                  andi         s5, t5, 1582
                  c.srli       s0, 1
                  auipc        s10, 450663
                  add          a4, a6, tp
                  c.slli       ra, 19
                  c.add        s2, t6
                  slti         a1, s9, 649
                  c.and        s0, s0
                  add          s5, t5, t1
                  sra          a5, a2, s10
                  add          s2, ra, s6
                  csrrs        t1, 0x340, t0
                  andi         t3, s11, -985
                  mulh         s2, s6, s4
                  c.li         tp, -1
                  sra          s7, s4, tp
                  csrrsi       s10, 0x340, 1
                  xor          t5, a1, t6
                  srai         a5, s5, 21
                  csrrc        s11, 0x340, zero
                  nop
                  csrrw        s7, 0x340, s8
                  and          a7, t0, t0
                  addi         t0, s1, -614
                  c.srli       a1, 13
                  csrrs        tp, 0x340, zero
                  c.srli       a3, 27
                  c.sub        s0, a5
                  csrrs        a2, 0x340, zero
                  c.lui        ra, 5
                  nop
                  srli         ra, s5, 29
                  mulh         a5, a1, s1
                  c.and        a3, a5
                  c.sub        a2, a1
                  rem          a0, t4, a5
                  srai         a1, s8, 13
                  mulhu        a2, s6, t1
                  srli         s5, s7, 1
                  sltu         t2, s4, s4
                  andi         t5, s8, -445
                  c.addi4spn   s1, sp, 496
                  auipc        sp, 472607
                  rem          a0, s5, t5
                  srai         gp, a5, 6
                  addi         a6, a3, -1406
                  xor          t3, a3, s2
                  c.lui        s0, 23
                  sub          a6, zero, s8
                  csrrs        t4, 0x340, a1
                  or           a3, t2, s8
                  c.srli       a5, 8
                  mulhsu       t2, s1, t5
                  ori          zero, s6, -1139
                  srli         a2, s0, 12
                  c.and        a1, a1
                  csrrci       a5, 0x340, 17
                  mulh         a5, t1, t6
                  csrrwi       a2, 0x340, 21
                  sltu         t2, a1, s2
                  div          s2, a0, t1
                  c.andi       a4, 5
                  c.addi       a4, -1
                  addi         s8, a3, 650
                  c.and        a3, a5
                  c.or         s0, s1
                  or           t5, t4, t0
                  mulhu        s8, t0, a0
                  c.or         a0, a1
                  c.li         s2, 23
                  csrrwi       a2, 0x340, 7
                  mulhu        s5, t4, t1
                  slt          s2, a0, s10
                  csrrw        ra, 0x340, s3
                  mul          a2, a6, s6
                  srli         t0, s8, 19
                  c.addi       t1, -1
                  c.srli       a3, 13
                  c.mv         t0, tp
                  c.andi       a2, 0
                  nop
                  divu         t2, tp, s7
                  c.lui        a2, 29
                  c.or         a5, s1
                  mulhu        s2, t0, a6
                  slli         t5, a2, 2
                  c.sub        a4, a3
                  srl          s5, s8, zero
                  lui          gp, 651770
                  c.xor        s0, a1
                  c.mv         t2, ra
                  c.andi       a1, 12
                  csrrci       t4, 0x340, 0
                  c.srai       s0, 12
                  c.srli       a3, 10
                  remu         t2, s10, s11
                  c.lui        a5, 4
                  csrrw        s0, 0x340, s0
                  csrrsi       t0, 0x340, 0
                  auipc        t1, 349813
                  sltu         s2, s1, t5
                  rem          a3, t4, s0
                  divu         s10, a7, a2
                  div          a1, tp, t1
                  addi         a0, t5, 709
                  c.srai       a0, 23
                  or           s1, s8, a1
                  srai         s4, a5, 15
                  ori          s2, t3, 1020
                  xori         ra, s6, -1730
                  csrrc        a5, 0x340, t6
                  c.addi16sp   sp, 320
                  c.sub        a0, a1
                  c.mv         a4, t1
                  sub          a3, s1, a3
                  xor          s10, a4, s4
                  c.addi16sp   sp, -16
                  and          t4, sp, s6
                  div          s2, a1, s8
                  mul          s0, s6, s4
                  csrrc        a0, 0x340, zero
                  csrrc        a3, 0x340, a5
                  add          s5, s6, a7
                  c.addi4spn   a2, sp, 208
                  c.addi16sp   sp, 304
                  sll          s1, s7, sp
                  remu         a0, s2, a4
                  sltiu        t0, zero, -1026
                  c.and        s1, s0
                  c.slli       t1, 19
                  c.xor        s0, a3
                  add          s4, s10, a0
                  csrrs        a2, 0x340, zero
                  auipc        t0, 492067
                  c.srli       s0, 31
                  sltu         s11, s5, t2
                  c.srli       s0, 25
                  c.addi       s0, -1
                  c.slli       t5, 22
                  sub          zero, t2, a4
                  rem          t1, a6, sp
                  sll          s8, t0, t4
                  csrrs        s11, 0x340, zero
                  div          a0, s7, s6
                  sltiu        sp, t6, -978
                  c.add        gp, tp
                  c.sub        s1, a5
                  sltu         s7, t1, s5
                  sra          t5, t1, s6
                  mulhsu       sp, sp, a2
                  c.mv         s4, a0
                  div          t4, s10, s11
                  div          t3, s2, s0
                  mulh         a3, s3, a7
                  slti         t2, s4, -411
                  slt          sp, zero, zero
                  or           s1, s7, t0
                  slt          t1, t5, a1
                  c.or         a2, a2
                  c.addi16sp   sp, -16
                  sltu         t4, a2, a1
                  or           a0, s2, a5
                  c.add        s5, s8
                  nop
                  add          s11, s9, a0
                  csrrc        t5, 0x340, s3
                  xor          t5, a5, s8
                  and          s4, s10, a2
                  csrrc        zero, 0x340, s7
                  sra          s6, a6, s5
                  and          a1, t3, a3
                  andi         zero, a7, 1612
                  or           s0, s5, s8
                  sll          a1, s0, a3
                  c.addi       t5, -1
                  slt          s7, a3, a2
                  auipc        t3, 1814
                  sub          s0, a0, tp
                  srl          s6, a5, a2
                  divu         s8, a7, t5
                  slli         a5, a1, 9
                  or           zero, a3, s2
                  sra          a4, s7, s10
                  csrrw        zero, 0x340, zero
                  csrrw        zero, 0x340, s3
                  mulh         zero, a3, a2
                  ori          s7, s9, 1952
                  c.nop
                  remu         a0, t5, s9
                  div          tp, s11, s3
                  sll          a1, a6, t0
                  auipc        t1, 482811
                  auipc        a0, 571295
                  c.addi16sp   sp, -16
                  mulhu        sp, t6, gp
                  c.sub        s1, a2
                  srl          a1, sp, s7
                  add          t2, s7, zero
                  mulh         zero, s1, a3
                  csrrwi       s11, 0x340, 8
                  add          t3, t0, t1
                  c.sub        a5, a2
                  andi         zero, s10, -877
                  c.srli       s1, 24
                  sll          sp, gp, a4
                  c.addi4spn   s0, sp, 896
                  c.addi16sp   sp, 352
                  lui          a5, 856321
                  csrrs        s10, 0x340, zero
                  mulh         s10, s5, t3
                  c.mv         t3, a2
                  rem          s0, t0, t3
                  ori          t2, a3, -712
                  c.lui        s0, 12
                  c.add        tp, s9
                  add          t5, tp, s1
                  div          s5, a6, s0
                  and          ra, t1, a5
                  addi         t0, gp, -676
                  slti         s6, t4, 1315
                  c.nop
                  xor          s8, t0, t2
                  add          a2, t3, t4
                  divu         a6, s3, t0
                  sltiu        s2, t0, -1603
                  c.slli       t1, 13
                  srai         a2, s3, 12
                  and          s8, a2, gp
                  csrrci       s4, 0x340, 0
                  csrrsi       t2, 0x340, 0
                  nop
                  and          s1, s6, s9
                  c.li         t0, -1
                  sltu         s2, s9, s7
                  mulh         a6, a7, s4
                  c.li         s10, 16
                  xor          t3, t1, s9
                  mulh         a6, zero, t0
                  sub          tp, a1, a4
                  csrrs        s8, 0x340, zero
                  c.nop
                  c.addi4spn   a0, sp, 400
                  csrrci       s11, 0x340, 0
                  add          a6, sp, a6
                  csrrwi       s5, 0x340, 24
                  rem          s8, t5, a3
                  auipc        s7, 277373
                  xor          s11, s9, s8
                  c.addi4spn   a2, sp, 688
                  ori          s4, sp, 1917
                  srl          zero, s7, t5
                  slt          ra, t2, s11
                  csrrc        s10, 0x340, zero
                  remu         t1, t2, t4
                  csrrci       t4, 0x340, 0
                  sll          s6, a3, t1
                  sltu         a7, s5, a0
                  sltu         t2, a0, t0
                  mulhsu       s6, s11, gp
                  ori          a1, ra, 281
                  mulhu        s5, s2, t5
                  mulh         s7, a3, t6
                  mulh         zero, s1, a5
                  c.addi4spn   a0, sp, 928
                  slli         zero, t4, 12
                  c.slli       a7, 14
                  csrrs        gp, 0x340, a0
                  c.addi4spn   a0, sp, 544
                  c.addi4spn   a5, sp, 912
                  slti         s5, t4, -733
                  slli         a0, s9, 4
                  xor          s4, ra, sp
                  mulhsu       a5, s5, s8
                  csrrsi       tp, 0x340, 12
                  remu         a5, s0, a3
                  c.and        a2, s0
                  mul          t3, a6, a5
                  c.xor        a5, a4
                  div          a5, s9, s2
                  lui          s11, 163404
                  xori         t2, s0, 1749
                  ori          a2, zero, -888
                  c.srai       a3, 17
                  mulhu        a2, t6, s10
                  c.addi       s10, 1
                  remu         a4, s8, tp
                  csrrci       s0, 0x340, 19
                  csrrw        s4, 0x340, s9
                  mulhu        s10, ra, t1
                  lui          s10, 757494
                  c.andi       a5, 4
                  div          s6, s0, a6
                  c.nop
                  mulh         s10, a3, a0
                  c.lui        t4, 18
                  c.mv         sp, s0
                  nop
                  div          t2, t2, s7
                  slt          t2, sp, s10
                  remu         a3, zero, s0
                  mulhu        a3, a7, ra
                  div          t4, s0, a4
                  c.add        a1, a6
                  mulhu        t4, a5, zero
                  sll          t1, s8, t4
                  divu         t3, a4, t3
                  csrrci       a0, 0x340, 7
                  c.nop
                  sub          s4, t1, s1
                  c.nop
                  ori          t0, s3, -1963
                  c.or         a1, a3
                  csrrsi       sp, 0x340, 0
                  csrrc        t3, 0x340, t2
                  c.srai       a3, 31
                  c.srli       a3, 9
                  sltu         s10, gp, a0
                  csrrsi       a3, 0x340, 25
                  divu         t0, a3, t2
                  csrrs        s0, 0x340, zero
                  xor          s1, s0, a4
                  sltiu        s8, a2, -572
                  sltiu        sp, s7, 798
                  csrrw        s7, 0x340, a5
                  slt          t4, a1, a7
                  xor          t0, tp, t6
                  slti         zero, s2, 1673
                  c.lui        a7, 19
                  csrrc        sp, 0x340, a7
                  slli         gp, zero, 10
                  srli         s8, s2, 9
                  c.slli       s6, 16
                  auipc        a0, 793891
                  csrrsi       s0, 0x340, 16
                  csrrs        ra, 0x340, t1
                  lui          tp, 95715
                  div          s0, s3, t6
                  c.add        a4, t4
                  nop
                  lui          s1, 107771
                  xori         a5, s9, -605
                  div          s11, s3, sp
                  mulhsu       sp, a4, s3
                  csrrsi       a6, 0x340, 0
                  csrrw        s7, 0x340, t5
                  c.addi4spn   a0, sp, 928
                  csrrwi       s10, 0x340, 12
                  csrrs        sp, 0x340, zero
                  c.mv         s10, s9
                  srli         a6, ra, 11
                  csrrwi       t4, 0x340, 31
                  csrrwi       s7, 0x340, 17
                  c.li         s7, 14
                  c.addi16sp   sp, 432
                  csrrsi       s7, 0x340, 0
                  csrrwi       s5, 0x340, 9
                  sltu         s4, a2, s8
                  c.and        a5, s1
                  add          s10, a6, t6
                  auipc        s1, 78761
                  c.mv         a4, s5
                  csrrw        tp, 0x340, a1
                  xor          gp, s2, s10
                  or           t2, s9, a2
                  srl          a3, t6, a1
                  sltu         s6, t5, s1
                  srli         s7, a7, 4
                  csrrsi       tp, 0x340, 0
                  srli         a5, s1, 11
                  divu         a5, a5, a4
                  csrrwi       t5, 0x340, 2
                  lui          t1, 448057
                  and          t4, sp, s11
                  and          a5, s7, a7
                  srli         ra, s0, 27
                  sub          s7, s10, t1
                  slti         a7, s11, -1001
                  sra          a1, s2, t1
                  slti         s2, s3, -1723
                  sltiu        s2, a7, -404
                  lui          s5, 643614
                  sub          t0, t6, sp
                  csrrci       s1, 0x340, 0
                  rem          gp, ra, a6
                  addi         s4, a1, 1273
                  c.sub        s1, s0
                  c.andi       a2, 19
                  sll          a6, t1, s3
                  sll          t4, gp, a7
                  ori          s2, t5, 787
                  mul          s0, a7, s1
                  sra          gp, s6, s4
                  csrrci       s0, 0x340, 5
                  csrrsi       ra, 0x340, 0
                  csrrwi       a3, 0x340, 13
                  divu         t0, a6, gp
                  divu         s1, t3, sp
                  xori         ra, a4, 1404
                  mulhu        s2, s4, t3
                  c.sub        a0, a3
                  remu         zero, s4, a4
                  csrrc        s10, 0x340, t1
                  or           s11, a1, a4
                  csrrs        a3, 0x340, zero
                  div          a5, s9, s11
                  slti         s1, s6, 428
                  c.add        t5, a1
                  srl          s8, ra, a3
                  c.mv         sp, gp
                  xori         sp, t1, -1444
                  sub          s2, a1, sp
                  or           s0, a1, zero
                  c.srai       a0, 27
                  xor          a3, t4, s10
                  c.addi       a0, 27
                  c.li         tp, -1
                  or           s2, t0, s0
                  srli         a2, s2, 4
                  csrrw        s8, 0x340, s4
                  c.srai       a1, 20
                  c.li         a0, -1
                  add          t3, a0, t0
                  slti         t0, s8, -94
                  div          a6, t4, a1
                  c.xor        a3, s0
                  c.srli       a2, 29
                  c.addi       a2, -1
                  csrrc        a5, 0x340, zero
                  c.sub        a5, a1
                  csrrs        ra, 0x340, zero
                  c.addi16sp   sp, 48
                  div          s7, ra, s10
                  andi         s2, s2, -1390
                  c.addi4spn   s0, sp, 592
                  addi         s1, a6, -1178
                  c.slli       a4, 29
                  lui          t2, 332565
                  divu         a1, t0, t0
                  csrrs        a4, 0x340, zero
                  and          t4, gp, s6
                  c.addi4spn   a3, sp, 576
                  xori         t2, a0, 1972
                  rem          a4, ra, t5
                  mulhu        s4, gp, s4
                  c.mv         t3, s6
                  mulhsu       s11, s7, s7
                  rem          s10, a7, t5
                  srli         ra, a4, 24
                  ori          a3, zero, -1537
                  c.xor        a2, s1
                  addi         s0, sp, -1674
                  srai         t2, t4, 21
                  c.slli       s8, 26
                  c.add        t4, a7
                  slli         t0, t4, 30
                  xor          a5, s9, a2
                  srai         zero, ra, 20
                  or           a1, t5, s5
                  srli         a5, t3, 20
                  c.srli       a4, 24
                  csrrc        a7, 0x340, zero
                  csrrsi       s11, 0x340, 0
                  ori          s7, a5, -647
                  c.sub        s1, a3
                  rem          ra, s7, a5
                  or           s0, s1, a6
                  c.add        t4, t3
                  sltiu        t3, a2, -1448
                  nop
                  sll          s10, zero, a1
                  rem          ra, a5, s9
                  div          t1, s11, t4
                  div          a4, t5, gp
                  csrrw        s2, 0x340, s1
                  csrrsi       sp, 0x340, 0
                  csrrs        a2, 0x340, s6
                  addi         s6, gp, -406
                  csrrw        s10, 0x340, zero
                  sltiu        t0, t0, 157
                  c.srai       a3, 23
                  mul          a2, zero, tp
                  c.addi       s10, 14
                  slli         s0, a0, 2
                  c.addi4spn   a3, sp, 1008
                  divu         gp, t0, s9
                  or           s5, s9, sp
                  auipc        t5, 889313
                  nop
                  slti         s2, t2, 930
                  andi         s11, s8, -1496
                  c.slli       s1, 17
                  csrrwi       s5, 0x340, 10
                  srl          a0, s4, s0
                  c.srli       a1, 10
                  andi         a6, a2, 1219
                  c.srli       a3, 31
                  c.slli       sp, 23
                  c.andi       a0, 25
                  csrrw        t4, 0x340, s10
                  c.srli       a2, 17
                  c.xor        a5, a2
                  slti         a1, t5, -811
                  srli         t3, a1, 10
                  c.and        s0, a4
                  c.sub        a5, a5
                  csrrw        s10, 0x340, tp
                  slt          s2, s1, sp
                  sll          a3, a7, gp
                  slti         a3, t0, 1270
                  divu         t5, s8, s4
                  csrrw        t1, 0x340, s2
                  xor          tp, s1, t5
                  addi         s2, s1, -246
                  c.and        a4, s0
                  div          t5, ra, a7
                  c.xor        a5, a4
                  c.or         a2, a4
                  sub          sp, gp, s4
                  slti         tp, t4, -867
                  c.sub        s0, a5
                  mul          a0, a3, t0
                  srli         t3, t6, 26
                  divu         s10, gp, s3
                  csrrwi       a6, 0x340, 16
                  lui          s10, 131917
                  add          s6, s5, s11
                  c.add        t3, a0
                  csrrsi       s0, 0x340, 0
                  c.and        s0, a0
                  c.andi       a1, 28
                  c.srai       a2, 20
                  c.mv         a0, t2
                  mulhsu       zero, t1, s2
                  or           s0, s3, gp
                  sltu         a5, s10, s11
                  c.nop
                  srl          t4, s0, s3
                  mulhu        sp, t2, sp
                  sltu         zero, a6, a3
                  sll          s8, s6, t4
                  slti         a5, s8, -991
                  c.srai       a0, 15
                  csrrc        zero, 0x340, t1
                  ori          a7, a4, 72
                  mulh         a7, t1, s10
                  slti         a5, t3, -1568
                  csrrs        a5, 0x340, zero
                  mulhu        s5, t5, a5
                  mulhsu       s2, a1, t6
                  sra          s4, zero, a2
                  c.srai       s0, 12
                  add          s1, a4, a0
                  nop
                  andi         s2, s8, 1291
                  div          a6, a6, t2
                  mulhsu       s1, a3, s7
                  slt          s6, a1, s0
                  ori          t2, s9, -1221
                  csrrwi       a3, 0x340, 30
                  sltu         s7, t0, a3
                  mulh         a0, a1, t0
                  c.xor        a3, a3
                  or           zero, t4, s1
                  xori         sp, t2, -1732
                  csrrci       a0, 0x340, 0
                  c.srai       s0, 1
                  div          s1, a2, s4
                  csrrci       s2, 0x340, 5
                  csrrw        s4, 0x340, t5
                  srl          s7, s4, t3
                  c.srai       a3, 18
                  c.srai       a1, 2
                  sra          s4, s0, s5
                  csrrc        a2, 0x340, a1
                  rem          a7, a2, t2
                  c.nop
                  mulhsu       s1, s7, s1
                  ori          a4, tp, 632
                  div          t2, a6, s4
                  mulhu        ra, tp, zero
                  lui          s6, 815829
                  c.srli       a1, 27
                  c.lui        a1, 21
                  c.mv         t4, gp
                  mulhu        s0, s3, t3
                  c.slli       a3, 18
                  ori          gp, s10, 1126
                  c.nop
                  slli         s7, s6, 22
                  addi         a0, zero, -970
                  c.slli       ra, 2
                  c.nop
                  c.add        s4, s7
                  mulhu        s4, s6, a6
                  csrrci       sp, 0x340, 0
                  xori         gp, a5, 315
                  c.addi4spn   a0, sp, 944
                  addi         s7, zero, -805
                  mul          sp, t1, t3
                  sltiu        s5, s5, 1612
                  mulhu        a5, a1, s3
                  sub          a7, t1, zero
                  c.slli       a4, 19
                  addi         t0, t5, 711
                  csrrw        s2, 0x340, t4
                  c.sub        a5, a1
                  mulhsu       a1, s3, t5
                  sll          s1, s1, s0
                  slti         s1, t5, -1764
                  c.slli       s7, 21
                  andi         t3, a4, 962
                  csrrwi       a5, 0x340, 17
                  lui          s7, 811598
                  nop
                  csrrc        zero, 0x340, a5
                  slt          sp, s9, s5
                  add          zero, s0, s9
                  c.xor        s1, a3
                  xori         a3, a1, 219
                  sra          a5, a0, gp
                  xor          s6, a6, t5
                  xori         t5, a3, 56
                  auipc        s4, 1036611
                  c.sub        a4, s0
                  c.sub        a0, a4
                  c.add        t4, s5
                  add          a4, s4, tp
                  csrrci       t1, 0x340, 11
                  ori          a6, s5, -930
                  c.slli       s11, 6
                  csrrs        tp, 0x340, zero
                  c.slli       s10, 6
                  rem          s5, a0, zero
                  c.addi       tp, -1
                  csrrw        a4, 0x340, a6
                  mulhsu       t4, a3, s3
                  sub          s5, s6, s10
                  or           t1, sp, a3
                  csrrwi       a4, 0x340, 16
                  xor          ra, t0, s3
                  c.xor        a3, a2
                  c.and        a2, a3
                  c.or         s0, a1
                  csrrw        s5, 0x340, sp
                  mulh         gp, s7, a5
                  remu         s1, s9, s0
                  auipc        a0, 609103
                  xori         zero, sp, 2025
                  csrrsi       ra, 0x340, 23
                  mulh         sp, gp, sp
                  c.or         s1, s1
                  csrrs        s10, 0x340, t5
                  andi         s2, s4, 161
                  c.xor        a2, s0
                  srl          a4, a2, t5
                  sub          s11, t2, s8
                  c.addi4spn   a4, sp, 272
                  div          s8, s1, a4
                  c.andi       s0, -1
                  c.srai       s0, 14
                  csrrwi       a6, 0x340, 21
                  sltu         s2, t4, s6
                  andi         t3, a4, 395
                  sra          s10, s5, s9
                  sra          s2, a0, a2
                  lui          s0, 1027948
                  c.slli       a0, 8
                  divu         t3, zero, a5
                  add          ra, ra, t4
                  csrrsi       s6, 0x340, 0
                  slt          s6, t4, s11
                  c.mv         t2, tp
                  srli         a5, ra, 25
                  c.slli       s7, 28
                  sltu         s10, sp, s7
                  c.srli       a0, 18
                  mulhu        t0, sp, s0
                  c.sub        a3, a1
                  c.mv         a3, a4
                  srli         a2, a3, 29
                  slt          a0, t3, s3
                  c.addi4spn   a1, sp, 992
                  sltu         s6, s6, t0
                  c.sub        s1, a1
                  csrrs        s5, 0x340, s2
                  xori         a4, zero, 1347
                  c.sub        a1, s0
                  srai         a6, sp, 16
                  srl          t2, a7, ra
                  sll          s10, a2, a5
                  csrrs        tp, 0x340, s3
                  and          s2, gp, a4
                  nop
                  addi         s7, s5, 1491
                  c.mv         t5, tp
                  auipc        s8, 173142
                  andi         t4, zero, -131
                  csrrwi       a3, 0x340, 5
                  auipc        sp, 309319
                  srli         a4, a1, 2
                  c.andi       a5, -1
                  csrrsi       a2, 0x340, 4
                  xor          t5, a6, a4
                  add          a1, t2, s5
                  c.lui        t5, 24
                  rem          a4, sp, s9
                  csrrs        t3, 0x340, t0
                  mul          t2, a0, s11
                  csrrci       a2, 0x340, 0
                  slt          t1, s5, a4
                  sra          ra, gp, a3
                  c.srli       a4, 3
                  c.addi16sp   sp, -16
                  remu         t4, a7, a5
                  c.or         a2, a5
                  mulh         gp, a3, t3
                  c.xor        a3, a4
                  and          tp, s7, ra
                  mulhu        t4, gp, a4
                  mulhsu       a4, s2, a1
                  c.andi       a2, 20
                  sub          a6, a7, t5
                  csrrci       a4, 0x340, 8
                  add          a4, t2, t6
                  mulhu        zero, t0, t2
                  srai         t3, t1, 21
                  slli         a3, s0, 23
                  xori         sp, gp, -1665
                  lui          t2, 652417
                  lui          s0, 280952
                  c.xor        s1, a5
                  csrrs        t1, 0x340, tp
                  srli         a2, t1, 10
                  rem          gp, t4, tp
                  sra          s11, gp, t1
                  c.slli       a6, 29
                  c.srai       a3, 3
                  slti         t3, s3, -454
                  c.or         s0, a0
                  csrrsi       zero, 0x340, 0
                  mul          a2, s6, s4
                  sra          t3, s9, a5
                  mulhsu       t1, s6, a7
                  c.srli       s0, 26
                  mulh         s11, s3, a3
                  srai         t4, t5, 22
                  csrrci       s6, 0x340, 0
                  xori         a5, s7, 1594
                  remu         a5, a0, s6
                  sltiu        s7, a1, -161
                  mulhu        zero, s7, s9
                  xor          t4, s5, tp
                  slti         s8, gp, 1857
                  csrrs        ra, 0x340, zero
                  csrrw        a6, 0x340, a3
                  csrrsi       t2, 0x340, 0
                  c.addi4spn   s1, sp, 800
                  sub          t2, a4, sp
                  c.srai       a0, 24
                  auipc        a5, 1037165
                  srl          s5, gp, s10
                  or           t4, t3, tp
                  csrrw        a6, 0x340, s7
                  or           gp, t4, a7
                  c.addi16sp   sp, -16
                  c.sub        s1, a1
                  sub          a4, zero, s4
                  c.xor        s0, a4
                  csrrwi       s6, 0x340, 4
                  c.or         a3, s0
                  srl          a5, a0, s10
                  c.nop
                  c.mv         s8, a6
                  c.sub        s0, a4
                  or           ra, s3, sp
                  csrrw        s8, 0x340, s0
                  srl          a1, s9, s6
                  c.addi       a4, -1
                  sra          t0, s11, tp
                  slli         t5, s1, 16
                  sub          gp, s1, a4
                  c.li         a2, 2
                  rem          a6, s7, a5
                  csrrwi       t5, 0x340, 25
                  add          s5, s0, s11
                  c.addi16sp   sp, 352
                  andi         ra, s11, -1457
                  div          gp, ra, t3
                  csrrs        a2, 0x340, t4
                  srli         a6, t2, 16
                  c.addi       a1, -1
                  csrrs        t1, 0x340, t3
                  c.addi16sp   sp, -16
                  c.addi16sp   sp, -16
                  csrrc        a1, 0x340, zero
                  sub          t5, t1, t1
                  c.addi       s8, 25
                  add          t5, s6, ra
                  sll          s6, s11, a0
                  slti         sp, a7, -1381
                  c.nop
                  csrrc        t1, 0x340, zero
                  rem          s2, a4, sp
                  nop
                  sltiu        s5, s1, 558
                  lui          sp, 910819
                  c.lui        s0, 4
                  nop
                  auipc        t0, 57170
                  auipc        ra, 68762
                  csrrsi       s5, 0x340, 0
                  sub          s4, s6, ra
                  c.andi       a1, 16
                  div          ra, t1, a3
                  remu         s10, s7, a7
                  slti         t2, a1, -232
                  div          zero, t5, a1
                  mul          a6, a6, a7
                  csrrs        a7, 0x340, zero
                  andi         s0, s11, 303
                  c.addi16sp   sp, 16
                  csrrwi       sp, 0x340, 19
                  c.or         s1, s1
                  c.li         ra, 27
                  ori          a2, s5, -1068
                  slli         t3, a4, 16
                  c.slli       a1, 16
                  lui          t3, 344894
                  mulhu        a0, t4, s2
                  auipc        tp, 500612
                  xor          zero, t4, t4
                  csrrs        s1, 0x340, t4
                  csrrci       a6, 0x340, 0
                  srai         zero, gp, 18
                  rem          a0, t5, s5
                  csrrci       a0, 0x340, 20
                  sltiu        a3, s3, 1018
                  sltu         s8, a7, t3
                  csrrc        t5, 0x340, zero
                  mulh         tp, a0, s0
                  remu         s6, s5, t4
                  srl          s10, a2, s3
                  div          t0, zero, a5
                  mulhsu       a1, s6, s7
                  ori          sp, t6, 1102
                  csrrwi       s2, 0x340, 8
                  csrrc        a2, 0x340, a7
                  c.srai       s0, 31
                  mulhsu       a2, zero, s2
                  sltu         s0, tp, s11
                  mulhu        a0, a7, t3
                  c.srli       a3, 9
                  c.nop
                  c.xor        a4, a4
                  c.li         t3, 8
                  sub          gp, s3, zero
                  csrrs        s2, 0x340, gp
                  c.addi       sp, 15
                  auipc        s1, 404594
                  mul          a5, a1, s7
                  sltiu        a1, tp, 1099
                  add          t1, s5, t3
                  srai         s1, t2, 10
                  csrrci       a6, 0x340, 0
                  c.nop
                  csrrc        s4, 0x340, zero
                  c.addi16sp   sp, 96
                  divu         t5, t2, a6
                  c.or         a0, a2
                  sltu         ra, sp, gp
                  addi         a0, s7, -293
                  csrrsi       s7, 0x340, 7
                  slti         a6, t6, 1895
                  mul          s11, s5, t6
                  mulh         s1, s11, ra
                  lui          s2, 177976
                  c.srai       s0, 3
                  csrrs        t5, 0x340, zero
                  mulhu        s4, a7, tp
                  slli         a4, sp, 15
                  c.nop
                  andi         s1, t6, 1931
                  mulhsu       a7, t5, t4
                  lui          s10, 5470
                  mulh         a7, s6, s11
                  c.nop
                  slti         s11, gp, -953
                  nop
                  c.addi16sp   sp, 400
                  xor          s11, s6, t2
                  mulhsu       sp, s11, s1
                  nop
                  c.andi       a1, -1
                  mul          sp, a7, a7
                  div          a7, s6, t4
                  csrrc        a4, 0x340, zero
                  sltu         s4, s4, ra
                  c.addi16sp   sp, -16
                  c.andi       a3, -1
                  c.li         s0, 25
                  or           t1, s2, s8
                  csrrw        s1, 0x340, a7
                  c.addi       tp, 18
                  c.add        a0, a0
                  c.mv         a3, s6
                  c.srai       s0, 1
                  sltu         zero, t2, a6
                  lui          a4, 1012877
                  c.addi4spn   a4, sp, 816
                  addi         s4, t6, 1805
                  or           ra, s5, a1
                  c.nop
                  andi         zero, t2, 213
                  csrrsi       t0, 0x340, 0
                  c.and        a0, s1
                  slli         a5, a7, 8
                  mulhsu       s0, a2, a0
                  c.xor        a4, a3
                  srai         t4, sp, 2
                  csrrsi       s5, 0x340, 0
                  sra          a1, a0, t4
                  c.mv         t5, s11
                  lui          tp, 739870
                  csrrw        a5, 0x340, t5
                  c.lui        a1, 15
                  srai         zero, a0, 10
                  c.lui        a4, 1
                  and          a5, s8, a4
                  div          s0, zero, s8
                  csrrc        s4, 0x340, a5
                  c.or         a5, a0
                  csrrwi       t4, 0x340, 1
                  sltu         t1, s11, a6
                  and          gp, a5, t5
                  rem          s0, a7, t4
                  srli         a6, s4, 22
                  sra          t0, s10, s3
                  c.and        a1, a0
                  ori          a7, a4, -1576
                  c.srai       s0, 28
                  mulhu        a0, a1, t0
                  xori         s1, a6, 1922
                  c.andi       a2, -1
                  c.add        s7, s7
                  c.addi4spn   a2, sp, 960
                  auipc        a4, 793339
                  c.sub        a2, a4
                  add          s10, s10, gp
                  c.xor        a4, a4
                  ori          s11, t4, -268
                  mulhsu       zero, a0, ra
                  c.lui        s4, 30
                  mulhu        t3, t5, s11
                  csrrsi       s4, 0x340, 18
                  c.add        a1, t3
                  csrrwi       t3, 0x340, 24
                  addi         t3, t5, 1296
                  xor          a6, t4, zero
                  lui          s2, 380175
                  c.srli       a3, 6
                  c.and        a2, s0
                  rem          t5, s3, s3
                  c.lui        a1, 29
                  csrrw        s11, 0x340, s11
                  c.add        s6, s3
                  srli         ra, t5, 14
                  csrrw        s2, 0x340, s8
                  sub          a2, t1, sp
                  ori          t5, s10, -1726
                  c.sub        a1, s0
                  andi         s2, s5, -953
                  mulhu        s0, a5, ra
                  add          s6, t1, s1
                  c.or         a4, a4
                  c.andi       a1, 4
                  csrrw        a3, 0x340, t1
                  remu         t2, ra, s4
                  c.slli       s10, 9
                  mulhsu       a6, t4, ra
                  mulhsu       a5, t0, s2
                  divu         s10, s7, t4
                  c.and        a5, a0
                  sll          s6, a4, a1
                  srai         t1, s8, 21
                  sltu         a3, ra, s11
                  c.lui        a6, 19
                  c.nop
                  sll          a6, zero, s8
                  lui          t2, 86989
                  xor          s10, s8, gp
                  csrrs        t4, 0x340, s1
                  c.add        sp, tp
                  c.addi       a1, -1
                  auipc        ra, 87934
                  rem          sp, s1, s7
                  mulhu        t2, t3, a2
                  slt          a7, a2, a7
                  slti         gp, a7, -1819
                  c.li         t0, 3
                  c.addi       s1, -1
                  lui          a0, 84706
                  c.andi       a3, 19
                  mul          a2, t1, s2
                  sub          t1, a1, s7
                  c.mv         s6, a6
                  c.sub        s1, a1
                  ori          a5, t6, 2000
                  c.xor        s1, a5
                  rem          a7, a0, a1
                  slt          s0, s2, t5
                  c.srli       a2, 17
                  sltu         a7, t4, t0
                  c.andi       a1, 18
                  div          t5, gp, gp
                  c.add        s10, ra
                  c.mv         a2, t2
                  csrrc        gp, 0x340, zero
                  slli         s7, s4, 24
                  sub          a4, s7, s3
                  c.add        s5, a4
                  lui          a5, 198848
                  sltu         a6, s8, a2
                  sll          a5, s3, s0
                  ori          s4, a2, 204
                  ori          gp, s6, -1873
                  div          s4, s6, a5
                  sll          s4, s1, a1
                  slli         s8, s6, 27
                  lui          t4, 924885
                  c.add        a2, t1
                  c.srli       a2, 6
                  c.add        a1, a7
                  c.xor        s1, s0
                  csrrsi       tp, 0x340, 0
                  ori          s1, a2, -1348
                  andi         s8, a0, -1526
                  remu         s1, t6, gp
                  c.addi16sp   sp, 112
                  c.nop
                  lui          s5, 236278
                  c.add        ra, s0
                  c.xor        a4, a4
                  slti         zero, s9, -134
                  mulhu        s11, s6, gp
                  c.nop
                  sra          a5, a0, a4
                  c.add        s1, a2
                  c.addi4spn   s0, sp, 64
                  or           s7, sp, t0
                  sll          a5, gp, ra
                  srli         s2, t0, 7
                  slli         a2, s9, 0
                  nop
                  sub          t0, s6, a2
                  nop
                  c.addi4spn   a1, sp, 160
                  c.andi       a2, -1
                  add          t2, sp, s8
                  c.and        a5, a2
                  sltu         a5, t2, t2
                  c.lui        s6, 14
                  sra          s7, s5, a0
                  c.andi       a2, -1
                  c.add        gp, tp
                  c.addi16sp   sp, 176
                  mulhsu       t5, t2, gp
                  mul          a4, a3, s3
                  remu         t3, s5, s9
                  auipc        s10, 780661
                  sltu         s6, a5, t6
                  slli         gp, s10, 9
                  srai         s10, ra, 22
                  c.andi       a5, 29
                  or           s2, s1, s5
                  c.srli       a3, 15
                  c.nop
                  csrrci       s0, 0x340, 0
                  xori         a1, t4, -1355
                  mulhu        a3, t5, s0
                  c.addi16sp   sp, -16
                  c.slli       t4, 23
                  addi         a3, t1, 472
                  xor          t5, a4, s10
                  srli         s10, gp, 27
                  c.add        a2, s1
                  xori         s10, t5, 841
                  sltiu        t4, t4, 612
                  slti         a7, a3, 192
                  auipc        s4, 177675
                  nop
                  slt          a6, t3, t3
                  c.addi       a5, 16
                  mul          t2, a6, s11
                  or           a7, zero, s4
                  c.slli       t0, 28
                  add          t4, s9, t1
                  sll          a7, tp, a7
                  xor          a6, s1, s3
                  sub          s10, s8, s7
                  csrrci       s10, 0x340, 15
                  c.andi       a0, -1
                  sltu         a1, a1, a5
                  sltiu        a5, s9, 1868
                  c.xor        a0, a1
                  c.srai       s1, 26
                  sra          s5, ra, sp
                  addi         s6, s11, -657
                  c.addi4spn   s0, sp, 432
                  c.lui        s8, 8
                  c.mv         a2, s10
                  c.slli       s1, 20
                  c.addi16sp   sp, -16
                  c.xor        a4, a4
                  c.addi4spn   a5, sp, 352
                  div          s0, a7, a3
                  andi         s5, t6, 949
                  nop
                  c.slli       sp, 29
                  or           a2, s10, s4
                  div          t5, s9, a7
                  div          a6, s4, a4
                  c.or         a2, s1
                  mul          s6, t5, s1
                  lui          s0, 433875
                  xori         s4, t6, -699
                  csrrci       t0, 0x340, 0
                  mulhu        a2, t0, s3
                  c.lui        s1, 27
                  rem          zero, t4, tp
                  srli         a1, s10, 17
                  mulhu        t2, s4, a4
                  add          s5, ra, t4
                  c.srli       s0, 15
                  c.nop
                  xori         gp, s7, -1862
                  and          a4, a6, t5
                  csrrsi       s4, 0x340, 0
                  div          s1, t3, t0
                  mulh         s6, zero, s3
                  c.or         a3, a1
                  csrrsi       a0, 0x340, 3
                  mulhu        a0, zero, t5
                  c.addi16sp   sp, -16
                  csrrw        t3, 0x340, sp
                  remu         a7, s5, a6
                  rem          gp, t5, s0
                  c.xor        a2, s0
                  c.srai       a2, 28
                  nop
                  nop
                  csrrci       a1, 0x340, 0
                  c.sub        a5, a1
                  c.srai       a4, 27
                  sll          s5, t5, a2
                  c.srli       a3, 7
                  lui          a4, 159570
                  addi         a2, s8, 1497
                  xori         s11, t4, 1686
                  or           s1, a4, s3
                  srl          gp, t1, zero
                  ori          s7, gp, 934
                  sub          a4, s8, a6
                  xori         s8, s5, -1695
                  slt          t3, zero, s4
                  sltiu        t3, s2, 457
                  remu         s10, a2, sp
                  csrrwi       s0, 0x340, 19
                  c.srai       a1, 23
                  mulh         s5, t4, s3
                  csrrc        t1, 0x340, zero
                  nop
                  c.mv         t1, t6
                  c.slli       a7, 11
                  mulhsu       a5, sp, t4
                  sltiu        s1, t3, 1385
                  c.slli       t3, 26
                  divu         s11, s7, s1
                  c.mv         s4, s4
                  mulhsu       zero, a0, s9
                  or           t4, a7, t6
                  lui          a2, 483866
                  slt          s8, t2, t4
                  c.addi       tp, 17
                  srli         s10, s1, 21
                  mul          sp, s5, s4
                  and          t5, t0, a5
                  csrrci       s0, 0x340, 0
                  slt          s11, a6, ra
                  xori         a4, a0, 756
                  div          a3, gp, sp
                  csrrwi       s10, 0x340, 13
                  div          t1, a6, ra
                  c.slli       gp, 19
                  mulh         zero, t5, s5
                  auipc        s6, 84477
                  c.slli       a7, 17
                  mul          t1, t5, gp
                  c.sub        a4, a2
                  csrrw        tp, 0x340, sp
                  c.sub        a0, a4
                  nop
                  lui          t2, 237402
                  sltu         ra, s1, tp
                  and          s1, t0, ra
                  c.nop
                  ori          t0, a2, -1492
                  c.andi       a1, 27
                  mulhsu       a6, a7, t6
                  auipc        zero, 450733
                  xor          gp, s6, a1
                  csrrwi       s11, 0x340, 26
                  c.srai       a0, 25
                  sll          t2, t4, a0
                  remu         s6, s11, a3
                  csrrw        t1, 0x340, s4
                  c.addi4spn   a0, sp, 64
                  mulh         t4, s2, t0
                  andi         s2, a0, -1475
                  csrrc        a4, 0x340, zero
                  srli         tp, zero, 1
                  xori         t4, a5, 1584
                  c.add        s7, s10
                  c.slli       s6, 25
                  mulhsu       a5, a4, s11
                  c.li         s11, 28
                  c.srai       s1, 9
                  divu         s5, t0, a0
                  mul          a6, sp, s11
                  add          s6, s2, a1
                  c.li         t1, -1
                  auipc        t1, 433007
                  c.andi       a0, 16
                  c.add        a1, a5
                  slti         a0, a3, 331
                  csrrwi       gp, 0x340, 25
                  mul          s10, a2, a4
                  xor          s10, zero, t1
                  c.lui        t1, 16
                  or           tp, t6, a7
                  xori         s7, a6, 729
                  sra          a0, s4, tp
                  rem          ra, s2, a6
                  mul          t1, a6, t3
                  csrrci       t0, 0x340, 0
                  c.add        s6, sp
                  sltiu        a0, a1, -758
                  add          s6, a2, t4
                  sub          a5, s9, gp
                  slti         a1, t0, 669
                  add          ra, tp, tp
                  c.addi4spn   a0, sp, 416
                  sra          zero, a1, s10
                  mul          a4, s8, t3
                  c.addi16sp   sp, -16
                  rem          s4, a3, a0
                  c.slli       a3, 16
                  slt          t2, t0, s2
                  csrrc        s8, 0x340, s4
                  rem          gp, s2, a5
                  nop
                  auipc        s4, 776568
                  srli         a4, a4, 13
                  add          s11, a3, t6
                  rem          a2, t6, zero
                  c.srai       a3, 19
                  sub          gp, s1, a0
                  auipc        s2, 1023029
                  nop
                  c.srli       a4, 1
                  csrrsi       t4, 0x340, 15
                  sub          t5, tp, s8
                  xori         s0, t4, -905
                  mulh         s1, t1, s0
                  ori          gp, s6, -2019
                  sra          a1, zero, t5
                  c.add        s11, t0
                  slt          sp, t2, a0
                  lui          a0, 852313
                  divu         t0, a4, s11
                  divu         a0, s7, s1
                  c.lui        tp, 19
                  srli         s2, a5, 19
                  srai         ra, t5, 23
                  divu         s0, t0, s1
                  srli         s11, a7, 11
                  ori          s5, sp, 1071
                  lui          s0, 471338
                  c.sub        a5, a3
                  divu         a6, t0, s11
                  srl          a7, t4, zero
                  csrrci       zero, 0x340, 0
                  auipc        a4, 135873
                  csrrwi       zero, 0x340, 8
                  csrrci       zero, 0x340, 26
                  c.addi       ra, 7
                  c.lui        s10, 19
                  auipc        s7, 946470
                  csrrc        s7, 0x340, t0
                  c.srli       a5, 30
                  c.add        a1, s1
                  c.addi       s0, 17
                  auipc        s8, 399683
                  sub          t0, s0, a3
                  divu         a6, a1, a6
                  c.nop
                  csrrc        s2, 0x340, zero
                  xori         a0, s5, 377
                  c.andi       a1, 7
                  csrrw        a0, 0x340, zero
                  slti         a5, sp, -263
                  c.addi       sp, 23
                  c.add        s0, s11
                  c.lui        tp, 18
                  csrrs        gp, 0x340, s8
                  andi         s6, t0, -875
                  c.addi4spn   a2, sp, 32
                  c.srai       s1, 4
                  remu         s8, t4, s9
                  csrrc        s0, 0x340, sp
                  rem          a5, s1, t3
                  sra          s11, gp, t5
                  c.and        a2, a3
                  slti         tp, t4, 636
                  sll          s2, tp, a3
                  csrrwi       s4, 0x340, 18
                  nop
                  c.lui        t5, 16
                  divu         a0, t6, zero
                  c.li         t5, -1
                  div          s1, t6, t2
                  mulhu        t1, t1, s0
                  sltiu        t3, t2, 763
                  mulh         a4, s10, t3
                  sltiu        s8, a4, -881
                  csrrs        a1, 0x340, zero
                  sltiu        s7, a7, 519
                  csrrc        a5, 0x340, zero
                  csrrci       t0, 0x340, 0
                  sltiu        a3, t4, -1284
                  nop
                  or           s2, a7, sp
                  addi         tp, t1, -248
                  addi         a0, s2, -350
                  xor          a2, s9, t0
                  c.or         a5, a3
                  csrrci       ra, 0x340, 8
                  mulhsu       zero, s9, sp
                  ori          t3, zero, 1538
                  csrrw        s7, 0x340, zero
                  srl          t0, s4, t5
                  c.and        s1, a5
                  mulh         a3, s7, s7
                  add          a0, t0, s3
                  c.nop
                  rem          t4, a7, tp
                  remu         s5, s3, s6
                  c.li         a5, -1
                  mulhu        a5, s8, t1
                  c.lui        s1, 23
                  divu         gp, s4, s10
                  c.lui        t3, 25
                  srli         s0, a1, 3
                  csrrc        s6, 0x340, s7
                  sub          s0, s6, t1
                  slti         s1, t3, -843
                  srl          a0, s3, a2
                  remu         tp, gp, gp
                  csrrsi       ra, 0x340, 0
                  andi         s6, a2, 1179
                  or           a1, t0, t0
                  and          tp, s8, s7
                  c.add        a0, s8
                  or           a5, s10, a0
                  c.li         a5, -1
                  c.addi16sp   sp, -16
                  c.addi       s5, -1
                  add          s7, t6, t0
                  csrrsi       a5, 0x340, 12
                  c.addi16sp   sp, -16
                  csrrs        s1, 0x340, zero
                  csrrc        a6, 0x340, s2
                  slli         s6, s10, 24
                  sll          t3, zero, t6
                  slt          s8, t3, t1
                  nop
                  csrrsi       t4, 0x340, 0
                  c.lui        t2, 2
                  lui          a4, 343240
                  nop
                  csrrs        s1, 0x340, s4
                  c.mv         a2, s1
                  div          s10, gp, s2
                  c.or         a3, a2
                  or           a0, t6, tp
                  csrrw        s0, 0x340, s2
                  c.nop
                  xori         t1, ra, -1632
                  add          a1, s7, a6
                  and          t2, tp, s5
                  lui          s1, 936506
                  and          ra, t3, a3
                  srai         a7, a4, 3
                  slli         a1, zero, 5
                  mulhsu       s11, s5, t5
                  mulhsu       t2, s11, tp
                  c.addi16sp   sp, -16
                  sra          s11, s0, s4
                  sll          zero, a0, tp
                  mul          s11, t4, a0
                  mulhsu       t0, s1, a1
                  csrrw        s1, 0x340, t6
                  mulhu        t2, s5, s11
                  xor          s2, s7, a1
                  csrrwi       s4, 0x340, 18
                  srl          a3, s6, t1
                  auipc        tp, 668290
                  add          a7, t2, t2
                  c.srli       a3, 7
                  mulhu        t4, t6, a6
                  csrrc        s4, 0x340, zero
                  c.sub        a4, s1
                  sub          a1, a0, a4
                  c.lui        t2, 10
                  and          a5, s2, a3
                  auipc        sp, 951930
                  sll          s1, t1, t4
                  csrrci       a7, 0x340, 0
                  div          a0, t1, s0
                  csrrci       s4, 0x340, 12
                  srai         a4, s1, 17
                  c.li         a5, -1
                  sub          a3, s7, t4
                  c.and        s1, s0
                  andi         a0, t5, 948
                  c.addi4spn   a1, sp, 560
                  mul          s8, s7, a0
                  c.lui        s7, 9
                  csrrc        s5, 0x340, zero
                  sltiu        a3, s3, 1949
                  srli         sp, s4, 17
                  c.addi       a4, 15
                  c.lui        s8, 14
                  sltiu        t3, a3, -1291
                  c.nop
                  csrrci       a7, 0x340, 23
                  c.li         gp, 27
                  or           t2, tp, s2
                  c.addi4spn   a3, sp, 352
                  csrrw        sp, 0x340, s1
                  srl          a5, s4, a3
                  c.addi16sp   sp, -16
                  sltu         s0, a5, s9
                  c.sub        s1, a1
                  c.or         a1, a2
                  csrrci       sp, 0x340, 0
                  c.slli       t2, 18
                  csrrwi       a7, 0x340, 2
                  srl          a0, zero, a7
                  mul          a5, ra, s5
                  sltu         s0, a7, s7
                  c.addi4spn   a0, sp, 832
                  nop
                  c.and        s1, s0
                  remu         a6, s0, zero
                  c.andi       a3, -1
                  div          s5, s4, gp
                  lui          a7, 48163
                  sltiu        s6, t1, -331
                  c.srai       a0, 20
                  c.or         s0, a0
                  c.slli       s2, 29
                  c.andi       a1, 11
                  c.addi4spn   a4, sp, 16
                  c.li         s5, 20
                  csrrsi       s11, 0x340, 6
                  csrrs        s10, 0x340, zero
                  csrrs        t5, 0x340, zero
                  srai         s0, s0, 23
                  lui          s11, 276968
                  or           s0, t2, s8
                  andi         zero, s3, -1286
                  c.add        a5, ra
                  nop
                  slt          t2, s7, s3
                  addi         s5, t4, -1582
                  c.slli       s7, 13
                  sub          t5, a4, s10
                  mulhsu       s7, t1, a0
                  mulhsu       ra, s7, a3
                  c.nop
                  c.nop
                  c.li         t4, -1
                  ori          t4, a5, 0
                  c.slli       ra, 13
                  ori          s2, t0, 118
                  c.sub        a4, a0
                  slt          t3, s11, s10
                  sltu         t0, s1, t3
                  sll          ra, s5, s3
                  srli         ra, sp, 5
                  nop
                  csrrsi       s11, 0x340, 6
                  c.lui        t3, 15
                  csrrci       s4, 0x340, 0
                  c.srai       a0, 1
                  c.xor        a4, s1
                  divu         ra, a0, a4
                  csrrs        t0, 0x340, ra
                  sll          t0, t6, s5
                  srli         s4, a5, 20
                  xori         s11, a6, 378
                  c.mv         t5, a3
                  ori          t4, s0, 1601
                  c.andi       a0, -1
                  auipc        s10, 212424
                  sll          s1, t2, a3
                  sltu         s11, s7, s5
                  c.add        sp, t2
                  remu         s0, s0, s11
                  c.and        s1, s0
                  c.li         gp, -1
                  srli         t5, a5, 15
                  c.add        t4, s10
                  nop
                  csrrsi       s6, 0x340, 4
                  slti         t3, s6, 415
                  auipc        a4, 795865
                  xor          t3, gp, a1
                  c.mv         a1, t5
                  sub          t1, s4, a3
                  addi         t4, t1, 1124
                  andi         a6, s6, -433
                  ori          a5, t4, -635
                  nop
                  slt          t5, a0, a5
                  or           tp, t0, s2
                  div          ra, sp, t0
                  xori         s4, a0, -239
                  csrrci       gp, 0x340, 0
                  srai         s11, a6, 4
                  csrrs        s11, 0x340, a3
                  sltu         t1, gp, s5
                  srai         a5, t0, 20
                  c.slli       a5, 27
                  c.or         s1, a5
                  nop
                  c.srli       a4, 15
                  c.srli       a5, 25
                  c.nop
                  sub          gp, s4, sp
                  csrrw        s10, 0x340, s3
                  remu         a2, tp, a1
                  c.sub        a1, a5
                  srli         t2, t5, 22
                  c.addi       s4, -1
                  xori         t0, ra, 976
                  and          a6, s1, t1
                  c.nop
                  csrrs        s2, 0x340, s3
                  or           a6, t0, a0
                  c.srai       a1, 30
                  csrrwi       sp, 0x340, 29
                  sltu         t0, s1, s8
                  csrrw        t5, 0x340, s2
                  mul          s0, a7, gp
                  csrrwi       t2, 0x340, 20
                  ori          a0, t3, 298
                  csrrw        ra, 0x340, t0
                  remu         ra, a4, tp
                  mulhsu       s7, s1, s8
                  nop
                  and          zero, t1, t6
                  nop
                  mulhsu       a7, t1, s2
                  nop
                  csrrs        a2, 0x340, zero
                  srai         zero, s10, 22
                  c.add        gp, s4
                  c.or         a5, a4
                  andi         a4, s9, 546
                  c.xor        a1, a2
                  c.and        s0, a4
                  sll          s8, gp, s6
                  remu         t0, s8, s6
                  add          gp, s7, s2
                  csrrc        s11, 0x340, zero
                  srai         s6, tp, 12
                  slt          a1, tp, s9
                  sub          s5, s1, s9
                  c.xor        s1, s0
                  csrrci       s2, 0x340, 16
                  auipc        s1, 472467
                  nop
                  ori          zero, s6, 1825
                  csrrw        s1, 0x340, a3
                  c.srli       a5, 29
                  srai         a5, t1, 22
                  sll          sp, s10, t0
                  c.addi16sp   sp, -16
                  srl          t0, sp, zero
                  or           ra, t2, s3
                  c.slli       s4, 27
                  slt          t1, s5, s10
                  c.and        a1, a4
                  c.andi       a0, -1
                  c.srai       a5, 24
                  c.srai       a3, 3
                  mul          a4, s0, t4
                  xori         ra, a7, -100
                  c.addi       s10, 23
                  c.andi       a5, 8
                  c.add        a2, sp
                  sltiu        s6, s1, 751
                  c.mv         s1, gp
                  xori         t4, t2, -525
                  mulhsu       a2, s3, tp
                  c.sub        a3, s1
                  slti         a1, a3, 805
                  csrrci       ra, 0x340, 17
                  csrrci       t3, 0x340, 2
                  nop
                  c.sub        a2, a3
                  c.li         s10, -1
                  or           s11, a7, t1
                  c.lui        s1, 15
                  mulhsu       a6, t1, s8
                  nop
                  c.lui        s6, 11
                  sra          s2, zero, a0
                  xori         t0, a4, -526
                  xori         t1, a4, -787
                  c.addi16sp   sp, -16
                  sra          s11, ra, a6
                  divu         t1, t4, s8
                  xor          a3, gp, s3
                  nop
                  addi         a0, tp, 1025
                  csrrwi       t5, 0x340, 9
                  c.sub        a1, s0
                  remu         gp, s5, s10
                  sra          a3, t5, sp
                  xori         a5, sp, 1373
                  divu         t5, a6, sp
                  mulhu        t1, t6, t4
                  c.srli       s1, 12
                  csrrci       a1, 0x340, 25
                  c.li         t2, -1
                  xor          s10, t1, a1
                  xor          s10, t3, a6
                  andi         t2, a7, 1658
                  csrrw        a1, 0x340, s9
                  div          sp, s11, t2
                  mulhsu       s6, s1, a3
                  addi         s1, a4, -2048
                  rem          a0, a4, a2
                  sltiu        s10, t6, -1197
                  c.addi4spn   s1, sp, 624
                  or           t0, a6, t2
                  sltu         s2, s1, a6
                  sub          s8, t2, s2
                  c.addi       s11, -1
                  ori          a5, s8, -864
                  c.add        s0, t4
                  c.slli       a5, 10
                  auipc        a2, 632439
                  c.addi       s7, -1
                  c.xor        a0, s0
                  xor          t2, zero, tp
                  c.add        sp, s5
                  andi         s11, a4, 42
                  xori         s4, gp, -2016
                  c.or         a5, a5
                  xor          ra, t6, s5
                  c.li         a1, -1
                  xor          a5, s2, s9
                  c.li         t0, -1
                  csrrs        t3, 0x340, zero
                  c.and        s1, s0
                  and          tp, s11, a2
                  sltiu        a2, sp, 137
                  mulh         t2, s7, a1
                  rem          t1, s11, t0
                  auipc        s10, 174309
                  slti         a0, tp, 70
                  c.andi       s0, -1
                  add          t2, t6, t0
                  sra          gp, a0, t5
                  sltu         a5, t0, t4
                  auipc        a1, 764366
                  andi         t1, s9, -1253
                  div          a1, t4, s0
                  auipc        a2, 923618
                  ori          a2, a4, 500
                  slti         a1, t0, 369
                  add          s6, s11, sp
                  mulhu        zero, s0, t5
                  c.slli       a3, 24
                  mulh         s0, s3, t0
                  remu         s7, a1, t3
                  slt          ra, s11, sp
                  rem          s11, s1, s9
                  or           a3, a3, s3
                  slt          s10, t3, s1
                  csrrwi       s10, 0x340, 13
                  csrrs        a5, 0x340, zero
                  c.addi16sp   sp, 256
                  srl          a6, s2, a4
                  c.andi       a5, -1
                  addi         a3, t5, -219
                  c.addi4spn   a5, sp, 304
                  csrrw        s6, 0x340, s6
                  sub          s7, t5, tp
                  csrrc        s0, 0x340, zero
                  sra          s11, t4, s0
                  addi         s6, a4, -301
                  slt          s6, t1, s1
                  add          zero, s0, t6
                  c.and        a4, s1
                  csrrwi       a7, 0x340, 1
                  slt          a7, s10, s8
                  sltu         t5, s1, t6
                  lui          zero, 669378
                  c.addi16sp   sp, -16
                  c.add        t4, t3
                  c.sub        a2, a4
                  srl          a4, sp, s9
                  slti         t3, a0, -993
                  div          s11, s10, s10
                  c.add        a4, s4
                  sll          t3, s8, s0
                  c.srai       s1, 5
                  xori         t4, t2, 276
                  c.srli       a4, 3
                  c.slli       a6, 2
                  slt          a5, t4, a5
                  c.addi16sp   sp, 368
                  c.nop
                  slt          s5, a0, t5
                  addi         s1, s5, 625
                  csrrci       ra, 0x340, 0
                  c.xor        a0, a3
                  c.srli       a1, 5
                  mulh         gp, a0, a1
                  c.nop
                  csrrs        s10, 0x340, zero
                  csrrci       t0, 0x340, 25
                  c.andi       a1, -1
                  c.addi16sp   sp, -16
                  c.sub        a3, a3
                  rem          s7, a7, a3
                  slt          sp, s0, s3
                  csrrsi       s8, 0x340, 19
                  addi         s7, s5, 1654
                  slti         t5, s10, -920
                  lui          a6, 259873
                  mul          tp, s0, t0
                  ori          t1, s3, -561
                  c.addi       a2, 23
                  rem          s5, a0, a3
                  sltiu        s11, gp, 1709
                  srli         t2, a4, 14
                  c.lui        s0, 16
                  remu         s5, a2, t6
                  add          s8, ra, a7
                  and          a1, s9, tp
                  nop
                  c.mv         t0, t5
                  slt          gp, s10, t2
                  rem          t1, s7, s8
                  rem          s0, t2, s2
                  sltu         t1, t4, t2
                  c.nop
                  sltu         s11, s3, t3
                  slt          t3, s5, t1
                  csrrs        s1, 0x340, t0
                  csrrsi       a5, 0x340, 0
                  c.addi4spn   a3, sp, 672
                  nop
                  sra          t0, t6, s3
                  nop
                  csrrwi       s5, 0x340, 12
                  c.slli       t1, 24
                  mulh         s0, s6, gp
                  c.or         a2, a4
                  csrrc        s2, 0x340, zero
                  mulh         zero, s9, t6
                  ori          s6, a2, 164
                  c.li         a1, 4
                  sra          tp, t4, tp
                  xor          t5, a2, a5
                  srai         tp, t3, 10
                  csrrsi       a0, 0x340, 0
                  and          sp, s3, a6
                  slt          a0, a7, t1
                  c.mv         sp, a6
                  srai         s5, s9, 7
                  c.srai       a1, 10
                  sub          t5, s0, gp
                  srl          a1, s2, s3
                  csrrs        a6, 0x340, zero
                  nop
                  c.addi16sp   sp, 240
                  sll          gp, t1, t5
                  xor          t5, a6, t0
                  lui          s10, 950019
                  sltiu        a4, s6, 1353
                  c.andi       a3, 8
                  xori         s2, t1, 974
                  c.addi16sp   sp, -16
                  andi         a5, t0, -653
                  c.andi       a4, -1
                  slli         s1, s1, 8
                  mulhsu       sp, a2, s2
                  srl          tp, s3, sp
                  div          a6, a6, a3
                  add          t2, t6, ra
                  csrrwi       s11, 0x340, 31
                  rem          s7, t3, a3
                  addi         zero, s6, -164
                  srai         s11, t3, 16
                  sltu         s7, a3, t2
                  mulh         s11, s6, t2
                  sltu         t0, a1, tp
                  div          a3, a4, a2
                  c.addi       ra, -1
                  mulh         a6, s2, t5
                  addi         s4, s7, 174
                  sll          a2, t5, a1
                  c.add        s7, ra
                  slt          t3, s4, a3
                  c.andi       a4, 30
                  slli         t4, t1, 14
                  c.sub        a3, s0
                  c.addi16sp   sp, -16
                  rem          s8, a6, s5
                  c.li         s4, 13
                  divu         ra, a0, s4
                  c.add        sp, a7
                  or           s5, a4, s10
                  ori          t3, a2, 634
                  c.xor        a5, a2
                  csrrs        s1, 0x340, zero
                  mulh         t0, gp, t2
                  csrrsi       s0, 0x340, 0
                  csrrw        a5, 0x340, a5
                  csrrwi       zero, 0x340, 29
                  sub          s10, sp, s9
                  mulhu        a4, t0, a6
                  sra          a2, zero, s10
                  or           a5, s0, a1
                  c.slli       s5, 19
                  c.slli       tp, 10
                  c.srli       a1, 14
                  divu         s1, zero, s8
                  c.slli       t5, 7
                  csrrs        s7, 0x340, zero
                  csrrwi       s10, 0x340, 1
                  c.lui        s5, 10
                  c.addi4spn   a4, sp, 960
                  mulh         s8, t0, t2
                  csrrwi       s6, 0x340, 9
                  srl          a4, tp, a7
                  c.andi       a5, -1
                  remu         a2, s3, s4
                  c.sub        a0, a5
                  c.and        a4, a0
                  sltiu        s4, sp, -22
                  or           s10, a3, a0
                  lui          gp, 1274
                  and          a4, s8, a6
                  c.srai       s1, 22
                  auipc        a3, 7768
                  auipc        s11, 88389
                  div          tp, a2, a2
                  c.addi       t4, 29
                  srl          t0, a2, s7
                  mul          t4, a1, s0
                  c.srai       s0, 20
                  mul          tp, zero, a0
                  srl          a3, s0, a4
                  csrrs        a3, 0x340, s1
                  nop
                  mulhu        s2, t6, t3
                  csrrc        tp, 0x340, zero
                  c.nop
                  csrrci       a0, 0x340, 0
                  and          a5, ra, a4
                  c.lui        a6, 19
                  csrrsi       s8, 0x340, 2
                  c.srli       a3, 19
                  lui          s0, 913633
                  srai         a1, a6, 20
                  csrrci       a6, 0x340, 0
                  c.addi16sp   sp, 176
                  c.srai       a0, 20
                  sltiu        tp, t0, -1631
                  c.or         a2, a0
                  srli         s11, a4, 10
                  c.sub        s1, a1
                  c.addi       s4, 27
                  srli         gp, s7, 31
                  csrrc        a7, 0x340, zero
                  csrrsi       a2, 0x340, 0
                  sltiu        t4, a1, -1236
                  div          t1, zero, t3
                  andi         s0, ra, -1728
                  xor          t2, s7, a0
                  or           t2, t5, a7
                  srli         t2, s10, 27
                  c.addi       t0, 12
                  c.nop
                  sltiu        zero, t0, 381
                  c.add        a2, s1
                  slti         tp, t2, -277
                  c.srai       s1, 20
                  nop
                  slt          gp, t2, t5
                  c.srli       a2, 18
                  slti         a7, tp, 999
                  mul          a4, s9, a4
                  addi         s8, a7, -1235
                  lui          s8, 416827
                  srai         t1, s7, 29
                  divu         t0, s8, t0
                  sub          s4, s11, zero
                  c.addi16sp   sp, -16
                  slt          a3, tp, t5
                  c.addi       s2, -1
                  c.li         gp, -1
                  sltiu        s4, s10, 830
                  div          t1, sp, t0
                  auipc        s11, 197839
                  sltiu        s7, a5, -507
                  c.addi16sp   sp, -16
                  ori          sp, a2, -1142
                  srli         t2, s1, 13
                  c.or         a0, a4
                  sltiu        s1, tp, 111
                  mulhsu       a7, s1, a5
                  andi         s0, s0, 933
                  mulh         a2, gp, s0
                  divu         a3, s11, s2
                  sll          ra, s2, t0
                  c.and        a0, s0
                  xori         a2, a4, -516
                  csrrw        t3, 0x340, s0
                  sll          a1, a6, t0
                  sltu         t4, s3, s6
                  lui          s8, 921829
                  c.xor        a4, s1
                  c.and        a1, s0
                  sll          s8, a7, a7
                  c.and        a3, s1
                  mulh         s1, t0, a4
                  mulhu        s2, t2, a1
                  csrrwi       ra, 0x340, 0
                  addi         s5, s10, -139
                  slli         t4, a7, 20
                  sltu         a1, t0, s6
                  lui          s5, 362902
                  lui          s6, 369483
                  c.srli       a2, 17
                  div          s10, s10, a6
                  lui          a3, 284698
                  c.lui        t4, 2
                  or           s7, a4, a0
                  c.mv         s5, a4
                  c.slli       tp, 26
                  csrrwi       a0, 0x340, 4
                  slti         zero, gp, 202
                  sltu         a5, t3, gp
                  c.addi       a5, 2
                  c.add        gp, s4
                  and          s10, a2, ra
                  c.lui        s1, 13
                  c.mv         t3, s5
                  sltu         sp, a5, t1
                  c.addi       t5, -1
                  auipc        t3, 588847
                  ori          t4, t0, 1087
                  sltiu        t1, zero, 1776
                  slli         ra, s3, 13
                  csrrwi       a4, 0x340, 3
                  csrrs        sp, 0x340, s10
                  c.addi4spn   a2, sp, 416
                  xor          t3, s8, t0
                  c.mv         t4, gp
                  xor          s1, a6, t5
                  slt          t0, gp, s2
                  xori         a2, s4, -309
                  c.add        a5, a4
                  c.addi4spn   a1, sp, 416
                  div          s6, a7, s10
                  csrrwi       t3, 0x340, 20
                  slli         a6, t4, 7
                  remu         s11, a7, s3
                  srli         t3, s3, 8
                  srli         s11, zero, 16
                  xori         s6, s11, -785
                  srl          s2, a3, t0
                  c.mv         a3, tp
                  c.mv         a7, s4
                  c.addi16sp   sp, 208
                  add          a1, a3, ra
                  srai         s0, a0, 28
                  rem          sp, s5, s11
                  slli         tp, s1, 6
                  andi         s10, a5, -902
                  mulhsu       s6, s1, s0
                  c.add        s4, a6
                  csrrw        sp, 0x340, a4
                  auipc        a5, 1029111
                  c.srli       a4, 29
                  rem          t3, sp, t2
                  csrrw        t4, 0x340, t2
                  csrrs        sp, 0x340, ra
                  xori         zero, s10, 1562
                  add          t4, sp, s6
                  mulh         a7, tp, a6
                  c.add        t3, s0
                  c.nop
                  xor          a0, a4, s8
                  mulhsu       s7, s4, a5
                  c.lui        t3, 13
                  and          a6, a5, a2
                  c.li         a0, 24
                  csrrw        t3, 0x340, t0
                  c.add        s1, t3
                  xor          a5, tp, s2
                  csrrw        t2, 0x340, s0
                  divu         tp, s8, s2
                  csrrw        a1, 0x340, s0
                  remu         s5, a4, s11
                  and          ra, s10, sp
                  c.sub        a3, s0
                  lui          a2, 491657
                  c.srai       s1, 22
                  sll          tp, s4, s6
                  c.and        a2, a2
                  xor          t1, a6, a2
                  c.addi16sp   sp, 16
                  sll          t0, a3, t4
                  c.xor        s0, a0
                  xori         s5, s8, 652
                  csrrs        a0, 0x340, sp
                  c.add        s7, tp
                  csrrw        s8, 0x340, s9
                  c.li         s2, 25
                  c.mv         t2, s9
                  srai         s0, a4, 20
                  c.add        a4, a6
                  nop
                  and          a7, a2, a3
                  and          a0, t1, s3
                  c.nop
                  slli         zero, gp, 29
                  srai         s6, a1, 6
                  c.srli       a2, 30
                  csrrsi       a1, 0x340, 0
                  c.or         a4, a1
                  div          ra, s4, a2
                  slt          a6, a3, t1
                  c.li         tp, 28
                  slt          zero, tp, a7
                  csrrs        t4, 0x340, zero
                  remu         ra, a6, a6
                  c.andi       a2, -1
                  addi         ra, a7, 619
                  sll          t4, ra, s11
                  srl          s0, s8, t5
                  srli         a0, s11, 11
                  mulhsu       ra, t5, zero
                  mulhsu       t3, ra, s8
                  remu         t2, s6, a0
                  mulhu        t5, s2, t2
                  mul          ra, s4, a4
                  c.nop
                  slli         sp, zero, 18
                  and          a0, a2, zero
                  slli         tp, t0, 30
                  c.addi4spn   s1, sp, 336
                  c.or         a2, s0
                  sra          s7, a4, a6
                  c.addi       s8, 10
                  andi         s0, t3, -1614
                  c.nop
                  c.nop
                  nop
                  auipc        s2, 632967
                  c.srli       a5, 20
                  sub          a3, s1, s10
                  csrrc        s1, 0x340, a0
                  c.nop
                  c.slli       s10, 24
                  sltu         a4, ra, t1
                  c.srli       a4, 25
                  xor          gp, t1, t3
                  mulh         a5, a3, s8
                  ori          tp, zero, -1987
                  div          s1, s3, t6
                  c.sub        s1, a2
                  rem          ra, s1, a7
                  c.srai       a3, 12
                  sub          tp, a1, t4
                  rem          t0, zero, s10
                  and          s5, t1, a1
                  rem          sp, s5, a5
                  c.xor        a2, a2
                  and          tp, s3, t6
                  remu         t5, a3, s8
                  mulhu        s4, s2, t3
                  sra          s7, s4, t3
                  srli         s5, a5, 15
                  c.sub        a3, a3
                  c.srai       a0, 28
                  c.mv         a5, a3
                  c.sub        s0, a1
                  mulhsu       a2, s7, t5
                  sub          s2, s3, t5
                  csrrsi       t1, 0x340, 0
                  slli         t3, s7, 23
                  ori          a2, s7, -234
                  c.addi16sp   sp, -16
                  mulhu        t5, t4, gp
                  sra          t1, s0, a5
                  c.slli       a6, 21
                  c.slli       a5, 31
                  divu         s0, s6, s9
                  csrrs        s6, 0x340, zero
                  sltu         t0, zero, a2
                  andi         s0, a6, 1299
                  c.nop
                  mulhu        s5, t2, t6
                  c.sub        s0, a2
                  c.andi       s0, 17
                  csrrwi       zero, 0x340, 29
                  c.addi16sp   sp, 48
                  slli         t5, s3, 2
                  c.addi       gp, -1
                  xori         s1, s4, -1500
                  c.nop
                  or           zero, t0, s1
                  c.slli       a2, 21
                  slti         a3, t1, -884
                  mul          s1, t1, a4
                  c.lui        s7, 16
                  c.addi4spn   a0, sp, 304
                  csrrsi       s11, 0x340, 4
                  nop
                  addi         a5, t4, 1482
                  nop
                  csrrci       gp, 0x340, 0
                  csrrs        t1, 0x340, zero
                  c.andi       s1, -1
                  sltu         zero, gp, a3
                  srl          s5, s10, t6
                  csrrc        t2, 0x340, s10
                  c.add        a4, a5
                  c.slli       s8, 3
                  andi         gp, a2, -2016
                  xori         a7, s7, -1137
                  sltu         tp, s3, s1
                  csrrc        s4, 0x340, s7
                  srli         sp, s3, 20
                  csrrs        t5, 0x340, s0
                  rem          a7, tp, s11
                  sll          s8, s11, t4
                  c.mv         t4, t4
                  addi         zero, t5, -698
                  csrrw        a3, 0x340, tp
                  c.slli       sp, 31
                  mul          s6, t4, t6
                  divu         s5, a7, t0
                  c.addi16sp   sp, 480
                  c.mv         t2, s1
                  ori          sp, a0, -452
                  c.add        s11, t5
                  c.addi4spn   a1, sp, 672
                  ori          a5, a4, 1733
                  divu         gp, t3, a6
                  xor          zero, s4, s11
                  sub          s5, sp, sp
                  csrrs        t2, 0x340, s9
                  csrrci       a7, 0x340, 0
                  c.or         a0, a1
                  divu         t5, s2, t2
                  csrrc        t4, 0x340, t3
                  mulh         s1, s6, a5
                  sltiu        zero, s4, 278
                  c.srai       a0, 3
                  slti         a1, t3, 2043
                  srl          s4, s5, s11
                  c.or         a2, a4
                  c.srli       a3, 10
                  xor          t1, s3, t5
                  srai         s10, a0, 19
                  c.addi       s2, -1
                  lui          sp, 981587
                  slli         t0, s11, 18
                  sll          s8, a1, t6
                  sra          a2, t0, a3
                  ori          a0, s3, -1402
                  c.nop
                  csrrc        t1, 0x340, zero
                  sltu         a3, s7, s4
                  slti         s1, t5, 543
                  slli         s7, s4, 7
                  rem          gp, a7, s9
                  csrrc        t1, 0x340, s9
                  sra          a3, zero, s3
                  srli         a5, a5, 6
                  c.addi       s6, -1
                  c.add        gp, s11
                  c.or         a2, a3
                  c.nop
                  c.and        a4, a4
                  c.addi       a5, -1
                  mul          a3, s5, sp
                  add          s8, s10, s6
                  mulhsu       t1, t1, s4
                  csrrsi       t0, 0x340, 7
                  c.srai       a1, 29
                  slti         s0, a7, 1166
                  c.xor        a0, a0
                  c.xor        s1, a5
                  c.addi16sp   sp, 208
                  c.addi       s10, -1
                  slli         s11, s3, 27
                  c.slli       gp, 6
                  sltiu        t2, gp, 750
                  c.or         a1, a1
                  csrrwi       t3, 0x340, 8
                  srl          a7, s6, s3
                  mulh         a3, a4, a6
                  mulh         t1, s9, tp
                  nop
                  sra          t5, s10, tp
                  c.and        a4, a2
                  csrrw        a1, 0x340, t0
                  sltiu        a2, s8, 1240
                  csrrw        ra, 0x340, gp
                  rem          s4, s3, t5
                  lui          t0, 12460
                  nop
                  sra          a0, t0, t2
                  csrrc        s0, 0x340, t4
                  srai         s11, s1, 16
                  c.xor        a1, s1
                  c.srai       s1, 17
                  mulhsu       t0, a2, a2
                  slt          t4, s2, a1
                  mulhu        a6, s0, s2
                  mulhu        s11, s9, t6
                  or           t5, zero, s5
                  c.addi       a7, 31
                  c.andi       s0, 26
                  srli         a3, t2, 16
                  slli         t2, t0, 30
                  mul          s5, s7, a6
                  auipc        a4, 321782
                  c.add        a4, s4
                  c.or         a2, a2
                  remu         t3, zero, t0
                  srl          s7, a7, s7
                  c.addi16sp   sp, -16
                  andi         s4, s4, -1898
                  c.addi16sp   sp, 80
                  csrrc        s1, 0x340, t0
                  slt          a0, gp, a6
                  csrrs        t4, 0x340, zero
                  slti         a2, s1, 1555
                  mulhu        t0, a4, a1
                  slt          s4, t5, t6
                  add          t3, gp, t2
                  add          sp, s5, s11
                  addi         gp, s1, -734
                  mulh         a0, s7, s6
                  slt          s4, t5, ra
                  nop
                  csrrc        s10, 0x340, zero
                  c.addi       s1, -1
                  c.srli       a3, 17
                  c.addi4spn   a0, sp, 480
                  c.slli       s5, 20
                  csrrc        s0, 0x340, s9
                  csrrwi       s7, 0x340, 1
                  slti         s8, gp, -137
                  c.lui        ra, 26
                  c.srai       s0, 2
                  auipc        a0, 566052
                  c.or         a3, a2
                  or           s0, a2, ra
                  slt          t2, t5, a4
                  slt          a3, s0, s4
                  mulhsu       a4, t4, s4
                  mul          s5, ra, a6
                  andi         t1, s7, 1049
                  srli         a0, a1, 31
                  addi         gp, t6, -1520
                  srli         a4, a5, 21
                  csrrsi       t0, 0x340, 0
                  csrrs        t2, 0x340, t6
                  divu         s7, zero, s10
                  csrrsi       s4, 0x340, 0
                  c.slli       a7, 15
                  sll          gp, s4, a1
                  c.srai       s0, 15
                  csrrwi       s2, 0x340, 2
                  addi         t3, a7, -2010
                  rem          t3, s0, s3
                  sltu         t0, s11, t1
                  mulh         t2, gp, zero
                  c.lui        s6, 29
                  c.slli       s6, 24
                  lui          a4, 340692
                  csrrsi       t4, 0x340, 9
                  mul          t1, s6, s4
                  lui          a5, 806470
                  sltu         t0, s10, ra
                  nop
                  mulhsu       s0, t1, s10
                  c.mv         t1, a2
                  csrrwi       s0, 0x340, 13
                  div          t4, a5, a6
                  srai         a0, a2, 0
                  sltiu        s4, a4, -380
                  auipc        t4, 1010442
                  c.slli       s6, 28
                  c.xor        a5, a0
                  csrrwi       sp, 0x340, 23
                  sltu         s10, s11, t5
                  lui          t5, 73290
                  add          s0, s2, a3
                  slli         sp, a3, 3
                  sub          s1, s10, sp
                  auipc        tp, 259109
                  srai         t0, t0, 23
                  ori          t4, s9, -1631
                  c.andi       a3, -1
                  slt          t0, t0, a1
                  sub          t3, s2, s11
                  csrrw        gp, 0x340, ra
                  c.srai       a1, 14
                  csrrw        tp, 0x340, s11
                  lui          t4, 392240
                  div          t3, t4, t6
                  c.xor        s1, a2
                  c.or         a3, a2
                  slti         ra, t5, 906
                  c.or         a0, s1
                  csrrci       ra, 0x340, 0
                  slti         t1, a6, -605
                  sltu         t3, s8, s4
                  csrrci       t4, 0x340, 31
                  csrrw        s1, 0x340, s0
                  c.lui        s4, 21
                  c.andi       a4, -1
                  xor          s8, s8, s3
                  c.mv         sp, a7
                  mul          s2, t0, t1
                  or           tp, s9, t6
                  csrrs        a4, 0x340, zero
                  sra          a4, a6, a7
                  sub          s4, gp, ra
                  srl          t4, t2, s2
                  c.nop
                  c.li         t5, 1
                  c.li         s7, -1
                  mulh         s6, gp, s5
                  csrrw        t5, 0x340, a2
                  sra          a0, s7, a0
                  nop
                  remu         a4, a6, s10
                  slt          a4, a5, t3
                  slt          s2, a3, s7
                  c.or         a4, a4
                  addi         s7, s0, 329
                  c.slli       ra, 1
                  c.add        s7, sp
                  c.srli       a2, 25
                  c.addi       gp, -1
                  lui          t3, 113602
                  c.srai       a2, 19
                  div          ra, a3, s8
                  ori          a4, s11, 1574
                  c.xor        s1, s1
                  srl          t3, zero, tp
                  c.srai       s0, 23
                  divu         sp, a0, a2
                  rem          s7, a4, tp
                  slt          tp, s1, a6
                  add          s11, s8, tp
                  c.li         a5, -1
                  mulhsu       a6, sp, s11
                  slt          a4, s6, ra
                  mulhsu       a3, tp, s3
                  slti         t5, gp, 270
                  srl          t0, t5, a2
                  c.or         a5, a5
                  lui          a1, 165660
                  mulhu        s0, zero, a3
                  slti         s5, t1, 880
                  sltu         a6, a0, s0
                  csrrwi       t1, 0x340, 31
                  c.andi       a3, 15
                  c.nop
                  div          s4, s7, gp
                  c.mv         a6, s7
                  add          t1, s4, a6
                  xor          sp, t2, gp
                  divu         t3, s4, s8
                  divu         sp, a4, s9
                  c.srli       a2, 7
                  c.nop
                  csrrwi       a4, 0x340, 17
                  nop
                  sll          s2, s8, ra
                  c.add        s1, s10
                  c.nop
                  mulhu        s8, t2, a2
                  c.addi16sp   sp, -16
                  c.addi16sp   sp, 144
                  c.xor        s1, a0
                  c.nop
                  c.lui        a4, 10
                  mulhsu       s7, a3, tp
                  c.addi4spn   a1, sp, 144
                  sub          tp, t4, s8
                  c.addi       t3, -1
                  sltiu        a5, s4, -1033
                  xori         a6, a2, 341
                  divu         tp, t0, a0
                  sltiu        a7, ra, 858
                  c.srai       s1, 2
                  xor          a3, t0, a4
                  and          t5, a6, s2
                  c.addi       s4, 4
                  divu         t2, s9, zero
                  or           t1, s7, s1
                  csrrwi       s6, 0x340, 4
                  c.addi       s6, -1
                  csrrwi       a4, 0x340, 26
                  srai         s2, a4, 22
                  auipc        s11, 575695
                  c.li         sp, 13
                  auipc        s5, 464897
                  csrrw        s1, 0x340, a6
                  c.add        a3, s0
                  csrrs        zero, 0x340, t3
                  c.slli       tp, 11
                  c.addi       s6, 21
                  sra          s7, a1, ra
                  mul          t0, a1, s10
                  sll          sp, a1, a6
                  csrrwi       t1, 0x340, 22
                  csrrs        a4, 0x340, zero
                  and          zero, a6, s1
                  csrrwi       tp, 0x340, 26
                  c.addi16sp   sp, -16
                  xori         t1, gp, 892
                  rem          t0, t2, s10
                  csrrc        s7, 0x340, zero
                  c.li         sp, -1
                  add          ra, s10, a3
                  csrrc        s11, 0x340, zero
                  c.andi       a3, -1
                  c.lui        a6, 12
                  c.addi       t0, 8
                  auipc        t3, 700270
                  srl          s8, a4, a7
                  c.or         a1, s1
                  remu         tp, t6, s11
                  c.addi16sp   sp, 464
                  sltu         ra, s0, t3
                  c.srli       a4, 3
                  auipc        t4, 553659
                  nop
                  c.lui        s5, 13
                  csrrsi       s8, 0x340, 0
                  c.sub        s1, a4
                  lui          s5, 612432
                  auipc        zero, 423700
                  c.addi4spn   a0, sp, 672
                  c.mv         s8, t4
                  sub          tp, s7, t3
                  sltu         s1, a1, s9
                  c.addi16sp   sp, -16
                  andi         a1, s3, 1552
                  mulhsu       s11, s0, t1
                  sll          s2, a1, t0
                  nop
                  or           s7, sp, zero
                  lui          t4, 151608
                  or           a6, tp, a5
                  c.nop
                  c.mv         a4, t4
                  csrrci       s11, 0x340, 0
                  andi         s11, t3, 1776
                  c.andi       s1, -1
                  ori          t2, t3, 1899
                  c.nop
                  sltiu        t2, tp, -1484
                  ori          s2, s2, -960
                  xor          t3, t4, s0
                  srai         t0, s6, 9
                  csrrc        s7, 0x340, a1
                  slli         s4, t4, 0
                  c.mv         s8, a6
                  ori          s5, t0, -220
                  mulhu        ra, sp, s7
                  remu         s0, s0, s1
                  slli         ra, s10, 14
                  ori          s8, a5, -629
                  mulh         t2, sp, s4
                  c.lui        s4, 30
                  c.li         a3, 3
                  c.lui        t0, 21
                  c.srai       a3, 9
                  c.lui        a6, 28
                  addi         t2, s4, -1127
                  remu         s11, gp, a5
                  csrrsi       s6, 0x340, 14
                  csrrw        zero, 0x340, s11
                  c.addi4spn   a5, sp, 80
                  csrrs        zero, 0x340, zero
                  c.xor        a1, a5
                  mulh         a1, a4, s10
                  c.srai       a4, 4
                  slti         s10, a5, -734
                  lui          s1, 765157
                  c.sub        a2, s1
                  xori         t3, s7, -976
                  add          t4, a5, t6
                  addi         a5, sp, 1039
                  slli         ra, a0, 3
                  slli         s4, gp, 1
                  c.nop
                  c.slli       tp, 19
                  c.li         a0, 26
                  srai         a0, s1, 21
                  sltiu        t0, tp, 1555
                  c.or         a3, s1
                  sltu         a0, a6, a1
                  xor          s8, ra, s0
                  ori          a5, s8, -1704
                  mulhsu       a2, tp, s9
                  and          s4, s0, a7
                  or           a4, a1, a3
                  add          a0, t1, a3
                  slli         s5, s0, 1
                  csrrci       t1, 0x340, 3
                  sra          t5, t0, s0
                  sra          t5, a5, a6
                  remu         s7, a2, s10
                  xor          gp, s8, s7
                  csrrwi       t2, 0x340, 4
                  srl          t1, a1, gp
                  c.sub        a1, s0
                  csrrw        a6, 0x340, t3
                  auipc        s10, 431680
                  srli         t1, t6, 20
                  or           s2, t5, t6
                  c.addi       a0, -1
                  lui          sp, 270708
                  divu         zero, tp, s2
                  c.xor        a3, a3
                  add          a4, a5, s6
                  nop
                  c.nop
                  c.andi       a3, -1
                  mul          a5, zero, s11
                  auipc        s5, 481374
                  c.addi4spn   s0, sp, 640
                  srli         a5, a2, 12
                  c.add        s10, t1
                  csrrs        s5, 0x340, zero
                  c.li         t5, -1
                  c.li         a6, -1
                  c.slli       t4, 30
                  c.slli       t0, 31
                  c.nop
                  mulhsu       t4, a4, t3
                  nop
                  c.sub        a5, a3
                  div          t5, s0, a6
                  mulh         s5, t1, sp
                  c.lui        t2, 23
                  sra          s1, s1, zero
                  c.and        a0, a0
                  c.lui        t2, 6
                  c.addi4spn   a5, sp, 880
                  div          s7, a6, t3
                  c.addi       s4, -1
                  mulhsu       a5, ra, a6
                  c.srli       a1, 23
                  c.xor        a4, a3
                  srl          s10, s2, s10
                  c.nop
                  div          s1, s4, t6
                  c.addi16sp   sp, 208
                  csrrs        ra, 0x340, zero
                  andi         t0, a2, 1409
                  c.or         a0, a3
                  c.add        a5, a7
                  csrrci       s11, 0x340, 0
                  c.add        s4, gp
                  sub          s1, a7, tp
                  andi         s8, ra, 1194
                  c.or         a5, a2
                  csrrci       s8, 0x340, 0
                  slli         s11, tp, 15
                  c.nop
                  c.srai       a5, 10
                  slti         zero, s9, 1992
                  csrrsi       tp, 0x340, 0
                  csrrsi       a7, 0x340, 19
                  c.xor        a5, a4
                  or           s7, s2, a1
                  csrrwi       t0, 0x340, 10
                  and          s6, ra, s8
                  c.srai       a0, 17
                  mul          s4, a4, a0
                  c.xor        a3, a2
                  slt          a3, s1, t1
                  sltu         a5, gp, tp
                  lui          s4, 117666
                  mulhsu       t4, a5, t4
                  c.nop
                  c.addi16sp   sp, -16
                  mulhsu       s8, s1, s11
                  c.addi16sp   sp, 320
                  c.xor        a3, a3
                  auipc        t0, 1020471
                  sltu         s8, t4, a2
                  csrrs        a7, 0x340, sp
                  mulhu        a0, s1, s0
                  sra          a2, s7, a4
                  mulhu        t5, tp, a1
                  c.and        a5, a3
                  andi         t4, t0, 1579
                  lui          a1, 155833
                  or           a2, s2, s1
                  div          t1, t3, s7
                  xor          t3, s8, s0
                  c.li         sp, 31
                  c.mv         t3, s5
                  lui          a7, 292044
                  csrrs        t1, 0x340, zero
                  slt          sp, ra, t5
                  c.andi       a5, -1
                  sra          gp, s0, t4
                  c.lui        a1, 4
                  csrrs        ra, 0x340, t4
                  slli         a4, t1, 11
                  c.xor        a1, a0
                  c.srli       a2, 26
                  c.mv         s11, a1
                  c.srli       a1, 4
                  add          s1, t5, a6
                  and          t2, s6, t0
                  srai         ra, gp, 17
                  div          s4, a4, s4
                  xori         a0, t6, 943
                  csrrs        s0, 0x340, zero
                  auipc        ra, 477939
                  slti         a5, s11, -544
                  c.addi16sp   sp, -16
                  c.addi       s8, -1
                  sltu         t4, s1, a4
                  sltu         a3, a2, t0
                  csrrsi       s6, 0x340, 23
                  nop
                  c.addi16sp   sp, -16
                  csrrs        s4, 0x340, zero
                  c.nop
                  sra          a3, s5, t2
                  c.xor        s0, a5
                  c.or         a5, a1
                  sltu         zero, s3, sp
                  add          tp, s11, s8
                  c.and        a3, s0
                  mulhu        tp, a2, s6
                  csrrsi       sp, 0x340, 20
                  sra          s2, s3, a3
                  add          t1, t1, ra
                  c.srai       s0, 24
                  slt          s0, gp, sp
                  sub          a4, t5, gp
                  sltu         t2, s1, a0
                  or           a6, a2, s4
                  and          a3, t5, s4
                  sra          sp, s8, s3
                  c.slli       s1, 26
                  csrrs        a2, 0x340, s1
                  add          s11, s8, a0
                  sub          ra, a5, ra
                  andi         t4, s0, 1834
                  sltiu        t3, t3, -812
                  c.addi16sp   sp, 112
                  divu         t5, zero, t4
                  csrrc        a4, 0x340, zero
                  sra          sp, tp, tp
                  slli         ra, s1, 22
                  c.addi4spn   a0, sp, 448
                  auipc        a1, 427811
                  c.sub        s1, s1
                  c.add        s4, t4
                  c.slli       t1, 26
                  slti         a4, a2, -918
                  srai         t2, s11, 10
                  c.xor        a4, a0
                  nop
                  c.or         a5, a5
                  csrrwi       sp, 0x340, 4
                  c.and        s0, a4
                  srai         a2, a4, 9
                  lui          a0, 1005258
                  mul          a5, t5, sp
                  c.addi16sp   sp, 320
                  slt          sp, t0, t5
                  sub          sp, t6, t6
                  c.nop
                  mulhsu       a3, t0, s10
                  xor          s7, s1, tp
                  mulhu        s0, a4, a4
                  or           a5, s4, a5
                  andi         s4, a4, 981
                  auipc        s10, 651822
                  c.srli       a0, 22
                  c.addi       s10, 4
                  and          s1, zero, t2
                  ori          s10, a2, 808
                  c.add        t1, sp
                  auipc        a6, 1004242
                  auipc        t3, 329464
                  c.xor        a2, s0
                  c.addi4spn   a5, sp, 224
                  csrrc        s0, 0x340, zero
                  c.mv         t5, a3
                  sra          sp, tp, s8
                  divu         gp, t4, a7
                  csrrw        t3, 0x340, t1
                  csrrsi       s2, 0x340, 15
                  mulh         a0, a4, sp
                  add          s2, t2, t4
                  remu         tp, ra, t0
                  xori         s5, t2, -284
                  c.srai       a2, 31
                  nop
                  c.addi       ra, -1
                  c.or         a0, a1
                  c.sub        s0, a1
                  mulhu        s5, s3, a1
                  slli         t3, t1, 12
                  c.nop
                  csrrc        a2, 0x340, zero
                  sll          s4, s10, t6
                  c.addi16sp   sp, 464
                  c.add        a7, s3
                  lui          ra, 157361
                  csrrw        t5, 0x340, t1
                  csrrsi       tp, 0x340, 0
                  xori         s8, a7, -703
                  slti         s11, s4, -1654
                  mulhu        s4, a1, s6
                  sll          s1, s4, s7
                  srli         t1, s6, 21
                  c.or         s1, a2
                  slti         a7, t5, 293
                  csrrs        a4, 0x340, zero
                  mul          t4, s10, s0
                  sra          s4, t0, t6
                  sltu         s11, a6, t3
                  and          ra, s7, s2
                  mulhsu       ra, s10, a6
                  csrrs        t5, 0x340, gp
                  sub          s11, a0, s3
                  sltu         t5, a5, s10
                  c.xor        a0, a0
                  srai         t4, t3, 10
                  ori          a6, t0, -550
                  csrrsi       s0, 0x340, 29
                  slt          s7, s1, s1
                  csrrsi       tp, 0x340, 0
                  nop
                  srl          t5, tp, zero
                  mulh         t1, a4, a1
                  srl          a7, a2, zero
                  c.addi4spn   a0, sp, 208
                  ori          a2, a3, 716
                  or           a5, t5, a3
                  csrrwi       t2, 0x340, 21
                  andi         sp, ra, 306
                  c.srli       a5, 6
                  mulhu        a6, a2, a7
                  c.addi       a1, -1
                  csrrsi       s11, 0x340, 10
                  lui          a0, 344080
                  c.lui        s10, 11
                  c.or         a4, a4
                  c.xor        s0, a5
                  slti         s6, t5, 644
                  c.nop
                  srai         a6, t0, 13
                  sltu         t1, s9, s8
                  csrrs        t3, 0x340, zero
                  divu         s2, s7, t0
                  and          s8, a2, s1
                  rem          gp, gp, s11
                  c.sub        s1, a0
                  c.nop
                  add          t1, t6, s2
                  div          s4, a2, t5
                  slt          t3, tp, a5
                  csrrsi       t4, 0x340, 0
                  addi         a3, s8, 153
                  csrrci       a3, 0x340, 0
                  c.or         a3, s0
                  c.srai       a4, 1
                  c.li         tp, 16
                  c.srli       a1, 4
                  c.mv         t2, a0
                  csrrwi       s5, 0x340, 18
                  c.lui        s5, 23
                  csrrsi       gp, 0x340, 0
                  c.addi4spn   s0, sp, 704
                  csrrs        a2, 0x340, zero
                  c.srai       s1, 22
                  csrrc        a0, 0x340, s2
                  slli         a6, t2, 16
                  c.add        s8, s7
                  div          t3, t5, s9
                  csrrwi       a5, 0x340, 6
                  c.addi16sp   sp, 48
                  csrrc        s5, 0x340, zero
                  rem          s4, a4, gp
                  csrrc        gp, 0x340, zero
                  c.and        a0, a0
                  c.srai       s1, 23
                  c.mv         t2, tp
                  xor          s11, a1, a2
                  sltu         a6, t4, t0
                  c.or         a4, a0
                  mulhsu       t4, a1, a3
                  ori          zero, a1, -1335
                  csrrsi       a2, 0x340, 12
                  lui          s4, 81909
                  c.or         s1, a5
                  c.addi4spn   a1, sp, 32
                  xor          a3, s0, a1
                  rem          a6, a4, s9
                  srl          t3, t5, a6
                  lui          s2, 489
                  add          sp, t1, s11
                  srl          gp, s1, tp
                  mulhsu       t0, a4, s8
                  c.srai       a0, 17
                  mulh         a0, t2, a5
                  and          s8, a2, s1
                  c.lui        a6, 31
                  auipc        a3, 597837
                  sub          a4, s4, t3
                  c.addi4spn   a5, sp, 32
                  andi         a0, s1, 432
                  sra          a6, a5, a5
                  slli         s1, s2, 20
                  c.srai       a3, 2
                  c.li         s6, 24
                  sub          t2, t1, t5
                  srl          a2, s8, t6
                  slli         zero, s2, 20
                  c.nop
                  csrrwi       s7, 0x340, 31
                  c.lui        s1, 22
                  csrrw        t4, 0x340, s10
                  slli         s4, t4, 19
                  srl          a6, a4, sp
                  c.addi16sp   sp, 48
                  slli         s5, t5, 8
                  slli         gp, t0, 4
                  csrrwi       t1, 0x340, 10
                  c.li         t3, -1
                  mulhsu       a5, t2, t3
                  c.mv         t0, gp
                  sltiu        t0, s2, -1526
                  xor          t4, a6, ra
                  c.or         a3, a0
                  sra          t1, t2, tp
                  andi         s5, s6, -291
                  csrrsi       a7, 0x340, 30
                  c.srai       a2, 17
                  c.nop
                  mul          sp, zero, s7
                  sra          t4, s0, s8
                  srai         sp, s11, 1
                  c.nop
                  csrrc        t1, 0x340, zero
                  auipc        gp, 814236
                  remu         a4, s10, gp
                  lui          s4, 999783
                  sll          s6, ra, ra
                  addi         s7, s4, 840
                  c.li         s11, 12
                  csrrs        s6, 0x340, sp
                  sltu         a5, a1, a2
                  sll          t2, a5, a1
                  csrrs        a2, 0x340, zero
                  c.srli       a2, 23
                  srli         s0, t2, 18
                  c.sub        a5, s1
                  c.and        a5, s1
                  csrrs        t4, 0x340, s2
                  lui          s8, 636869
                  addi         s2, a5, 438
                  slti         s1, tp, -480
                  mul          a4, a4, s1
                  sra          a4, s2, s1
                  sltiu        t5, tp, -1647
                  csrrc        t3, 0x340, zero
                  c.addi16sp   sp, -16
                  div          a1, t6, t2
                  c.lui        t0, 18
                  auipc        s7, 980495
                  or           a0, s4, t6
                  csrrsi       gp, 0x340, 23
                  c.nop
                  c.nop
                  c.mv         t1, s4
                  csrrsi       t0, 0x340, 0
                  and          s6, s9, s3
                  csrrw        a5, 0x340, t3
                  c.slli       s8, 13
                  ori          t3, t3, -847
                  srli         s5, t1, 25
                  div          t5, sp, s3
                  c.nop
                  csrrci       tp, 0x340, 0
                  ori          a0, sp, -807
                  c.xor        a0, a1
                  csrrc        a4, 0x340, zero
                  c.nop
                  sltiu        zero, s0, 1764
                  div          s0, a7, t3
                  c.srli       a5, 1
                  auipc        t1, 666694
                  c.andi       a2, 27
                  mulhsu       s6, t2, zero
                  or           a6, t5, s3
                  c.mv         a1, s9
                  c.sub        s0, a2
                  csrrsi       t5, 0x340, 0
                  c.xor        a3, a3
                  slli         t0, t2, 7
                  c.li         t0, -1
                  rem          s0, sp, a1
                  sltu         a5, t5, s1
                  mulhsu       t4, t0, s7
                  mulhsu       t4, zero, zero
                  mul          a2, t5, t1
                  ori          s6, s6, -1656
                  c.sub        a4, s0
                  csrrc        t5, 0x340, t2
                  ori          t2, a0, 1505
                  ori          tp, t1, 1719
                  c.and        a0, a3
                  sltu         sp, a6, a4
                  sltu         s0, gp, s11
                  c.addi       s4, -1
                  c.andi       a0, 8
                  c.srai       a0, 8
                  sltiu        gp, ra, 887
                  c.nop
                  srai         t2, sp, 23
                  mulhsu       a7, s11, t4
                  div          t2, s4, a7
                  mulhsu       t5, s11, s6
                  c.mv         t0, t0
                  c.addi       gp, -1
                  c.slli       a0, 29
                  mulhsu       zero, t2, t3
                  csrrsi       s10, 0x340, 14
                  or           s7, zero, a5
                  csrrs        s6, 0x340, a1
                  csrrs        ra, 0x340, a7
                  c.addi       t5, -1
                  nop
                  c.slli       t1, 25
                  c.andi       a2, -1
                  c.mv         s0, ra
                  divu         s5, s7, a0
                  add          s0, s8, tp
                  c.lui        s7, 24
                  sltiu        s8, s11, -588
                  auipc        a7, 569165
                  mul          t3, a1, s0
                  c.addi16sp   sp, -16
                  sll          a2, a5, s3
                  c.addi16sp   sp, -16
                  c.addi4spn   a2, sp, 272
                  csrrc        s5, 0x340, s6
                  c.and        a1, s1
                  csrrs        a6, 0x340, zero
                  csrrwi       zero, 0x340, 29
                  slti         a3, s3, -903
                  addi         s4, t4, 422
                  c.sub        a4, a3
                  xor          a0, a6, a7
                  auipc        s5, 68614
                  c.and        a3, a5
                  lui          s5, 10927
                  mulh         s10, s11, s7
                  xor          t0, s7, a1
                  c.srli       a2, 18
                  c.add        s11, s9
                  c.add        a6, a2
                  sub          s8, s11, s3
                  c.nop
                  c.xor        s1, a1
                  csrrsi       s4, 0x340, 0
                  c.and        a0, s0
                  add          t0, a5, zero
                  c.slli       a5, 14
                  csrrw        s0, 0x340, s1
                  add          s2, s6, sp
                  c.lui        s4, 24
                  c.addi       a1, 24
                  xor          s6, s5, gp
                  sll          s7, s2, a1
                  slli         a0, t5, 11
                  mulhsu       a1, gp, tp
                  sltu         s4, t2, s1
                  c.srli       a1, 5
                  sra          zero, tp, t2
                  xori         tp, a7, -2042
                  xori         s5, s1, -28
                  nop
                  sra          s5, s9, s6
                  c.nop
                  or           t3, t2, s7
                  or           a7, s0, s10
                  auipc        a0, 940982
                  c.addi4spn   s1, sp, 480
                  sll          t4, t0, sp
                  c.xor        a3, a0
                  mul          s6, s3, zero
                  addi         a3, gp, -70
                  divu         s11, t5, s9
                  slt          gp, zero, s3
                  xor          gp, t6, s9
                  xor          s11, s11, t0
                  srli         a5, t2, 8
                  c.srli       s1, 11
                  sltu         a2, a4, tp
                  c.add        gp, a3
                  c.addi16sp   sp, -16
                  c.li         tp, -1
                  csrrci       s4, 0x340, 31
                  c.lui        t4, 19
                  csrrwi       tp, 0x340, 28
                  nop
                  auipc        s5, 861561
                  c.nop
                  c.li         s4, -1
                  srli         s8, t2, 27
                  c.nop
                  sra          t0, t6, sp
                  c.slli       s10, 25
                  c.nop
                  csrrs        t3, 0x340, zero
                  c.and        a0, s0
                  mulhsu       zero, s2, s9
                  c.or         a3, a2
                  c.lui        a5, 12
                  rem          a3, a6, s2
                  csrrs        ra, 0x340, s5
                  andi         tp, t3, 1838
                  mulh         s11, t5, t0
                  mul          t1, s11, t4
                  xori         a2, a4, -1284
                  mulhsu       a1, s2, t6
                  csrrwi       tp, 0x340, 22
                  csrrc        t1, 0x340, zero
                  c.nop
                  c.and        s0, a0
                  c.addi16sp   sp, 80
                  c.mv         a7, a0
                  sltu         s10, ra, t2
                  sltu         a0, ra, t5
                  c.lui        a4, 19
                  c.addi4spn   a1, sp, 720
                  div          ra, a0, s10
                  srai         s0, s5, 26
                  c.sub        a2, a3
                  mulhu        a1, s10, tp
                  c.or         s1, a1
                  sra          a1, gp, a4
                  mulhsu       a2, a0, tp
                  sll          t0, s8, s5
                  and          a0, s0, a7
                  c.or         a1, a5
                  divu         s4, s1, a3
                  andi         a4, s5, -1600
                  auipc        tp, 713035
                  c.srai       s1, 7
                  csrrs        s7, 0x340, zero
                  sltiu        s11, sp, -512
                  srl          t4, sp, a3
                  c.and        s0, a2
                  addi         t2, t3, -1941
                  remu         a6, a3, t6
                  or           s5, a5, s0
                  csrrsi       gp, 0x340, 0
                  ori          a7, a1, -13
                  mulhsu       a3, t0, tp
                  sltiu        t5, a0, -1647
                  addi         s8, sp, 605
                  rem          t2, s1, t0
                  auipc        s0, 98904
                  csrrsi       t0, 0x340, 0
                  c.addi       t0, -1
                  sub          sp, tp, s4
                  csrrsi       a7, 0x340, 0
                  sub          s5, s1, s10
                  srl          a6, t3, t2
                  c.lui        gp, 15
                  ori          a2, t6, 500
                  mulhsu       sp, t5, t5
                  csrrwi       a3, 0x340, 18
                  sltiu        ra, s3, 236
                  sltiu        t4, s5, -1166
                  csrrc        t0, 0x340, t4
                  csrrsi       s1, 0x340, 26
                  add          s7, s9, s6
                  srli         s8, s4, 6
                  srl          a7, s1, a1
                  c.lui        ra, 22
                  c.mv         a0, t2
                  c.srli       a2, 22
                  c.and        a3, s0
                  ori          s2, a4, -1624
                  csrrwi       s5, 0x340, 24
                  and          s1, a3, t6
                  or           ra, t1, t1
                  c.add        a1, a6
                  mulh         s6, s8, s9
                  sltu         a0, a4, t6
                  c.slli       s10, 5
                  csrrsi       a4, 0x340, 0
                  csrrwi       t5, 0x340, 24
                  sltiu        s5, s6, -1009
                  div          s1, ra, a3
                  c.and        s0, a2
                  c.lui        s6, 26
                  xori         s7, s0, 617
                  csrrsi       t0, 0x340, 0
                  nop
                  addi         s8, a5, 1024
                  c.xor        s0, s0
                  c.xor        a3, a1
                  srai         a6, tp, 29
                  mulhsu       t0, t1, s8
                  srl          a3, s8, a5
                  sltiu        s1, s6, 568
                  c.andi       a1, 25
                  c.srli       a5, 25
                  andi         t4, zero, 1078
                  sltiu        gp, a6, -907
                  srli         a7, t6, 21
                  sltu         a7, a5, s11
                  ori          a7, a7, 990
                  div          tp, t0, a0
                  addi         s5, s4, 882
                  div          t0, ra, t2
                  c.nop
                  c.lui        a6, 16
                  remu         a5, s3, t4
                  csrrci       t1, 0x340, 0
                  mul          a0, t5, tp
                  c.lui        t2, 23
                  sltu         s7, s2, s7
                  srai         zero, t6, 6
                  csrrw        ra, 0x340, a4
                  csrrc        s11, 0x340, t2
                  c.mv         a6, s7
                  and          t0, s0, a6
                  c.nop
                  c.li         s2, 8
                  slli         s0, t4, 3
                  mulhsu       s6, s4, s7
                  c.lui        s11, 21
                  csrrwi       a5, 0x340, 16
                  remu         s7, tp, tp
                  c.or         s1, a1
                  lui          t0, 718810
                  divu         a2, s7, s10
                  c.slli       s4, 7
                  srl          zero, ra, a0
                  sltiu        a5, s2, -721
                  auipc        t4, 368895
                  slti         t2, a4, 1187
                  sra          a3, t0, s3
                  mul          s0, a5, t2
                  c.addi16sp   sp, -16
                  remu         s0, t3, ra
                  mulh         s7, s1, a2
                  c.and        a5, a0
                  slti         a3, t2, 1345
                  c.srli       a3, 26
                  c.add        a1, s0
                  c.srai       s0, 16
                  c.andi       a4, -1
                  c.nop
                  csrrwi       s1, 0x340, 0
                  c.srli       a5, 28
                  add          s4, t5, s7
                  c.sub        a1, a4
                  c.nop
                  srai         t4, s10, 6
                  divu         gp, t1, t4
                  slli         s5, t3, 12
                  srai         s11, s5, 7
                  mulhu        s8, t5, s9
                  csrrc        a1, 0x340, t4
                  remu         a5, t2, s5
                  srli         t5, t4, 22
                  srli         sp, s2, 29
                  andi         a5, s7, 1785
                  slti         s7, a1, 1989
                  slt          t4, a2, s11
                  csrrs        s6, 0x340, zero
                  ori          tp, t5, -1734
                  sra          s7, a1, s1
                  csrrs        a7, 0x340, sp
                  addi         sp, s6, -1492
                  sra          t3, s3, tp
                  mulh         a3, s3, s8
                  sltiu        s2, s5, -1806
                  divu         tp, s9, s11
                  mulhu        s0, s2, a7
                  c.or         a5, a4
                  csrrw        s2, 0x340, tp
                  c.mv         s11, a2
                  c.xor        s1, a4
                  mulh         t2, s10, a1
                  xor          s10, s0, s5
                  divu         sp, a6, s6
                  c.addi       s4, 19
                  div          a2, a5, zero
                  csrrs        t0, 0x340, s0
                  slli         s1, s11, 17
                  sra          t4, a3, a5
                  c.and        a0, s0
                  div          t2, a7, s6
                  sub          ra, a5, t5
                  c.srai       a1, 17
                  rem          gp, s3, s4
                  c.lui        a6, 22
                  add          s0, t0, a7
                  lui          s5, 376127
                  c.srai       a2, 31
                  c.andi       a0, -1
                  andi         zero, ra, 1618
                  c.addi16sp   sp, 144
                  csrrwi       zero, 0x340, 30
                  add          a1, s9, s7
                  c.add        t4, s8
                  sll          s8, ra, s3
                  c.sub        a2, a0
                  auipc        s0, 158383
                  c.srli       a0, 15
                  c.nop
                  sltiu        a6, t1, -1631
                  c.andi       a4, -1
                  xor          sp, s7, a6
                  sra          s11, t5, sp
                  mulh         ra, s11, s11
                  xori         tp, a6, 668
                  slli         s6, a5, 15
                  srai         ra, s5, 2
                  csrrc        a4, 0x340, sp
                  remu         s0, sp, t3
                  csrrs        a7, 0x340, zero
                  csrrc        t4, 0x340, zero
                  or           s5, a1, sp
                  mul          t2, t3, a7
                  sltu         t5, t5, a1
                  addi         s4, gp, 1473
                  c.add        s5, s8
                  sub          sp, a7, s8
                  c.sub        s1, a5
                  c.add        a2, a4
                  div          s5, s9, a0
                  sra          s11, ra, t5
                  srai         a1, s10, 19
                  csrrw        ra, 0x340, tp
                  mulhsu       tp, a2, s0
                  sub          t5, s8, a2
                  c.addi4spn   a3, sp, 864
                  mulhsu       gp, s10, s7
                  c.srai       a0, 30
                  csrrsi       ra, 0x340, 25
                  c.srli       a0, 2
                  csrrsi       zero, 0x340, 0
                  xori         s2, s6, -1386
                  or           s11, a3, s7
                  c.addi16sp   sp, -16
                  remu         ra, s4, s11
                  divu         t0, s7, s9
                  csrrw        s2, 0x340, t3
                  c.addi16sp   sp, 496
                  slt          a2, gp, s6
                  ori          a6, s7, -1275
                  remu         zero, t2, t5
                  ori          a5, s1, 710
                  div          s10, s5, t6
                  slli         a4, t0, 27
                  add          t5, s10, a5
                  csrrwi       s6, 0x340, 29
                  and          s7, sp, s4
                  addi         a1, a0, 868
                  csrrci       s6, 0x340, 30
                  andi         t4, a2, -1649
                  addi         s6, s3, -509
                  andi         s8, t3, 492
                  c.li         s1, 1
                  c.srli       a3, 1
                  c.and        a1, s0
                  csrrw        a3, 0x340, t6
                  xor          a1, s6, a0
                  ori          s1, a3, 1150
                  mulhu        t3, t0, tp
                  slli         a2, s2, 24
                  lui          a4, 870730
                  c.andi       a4, -1
                  c.andi       a1, 1
                  c.addi       a7, 13
                  mul          tp, s10, s8
                  xori         s2, s10, 1186
                  srl          s6, s6, a4
                  and          a4, sp, a7
                  and          t0, t1, t6
                  c.addi       s8, 8
                  csrrwi       a3, 0x340, 17
                  div          t5, ra, zero
                  xor          s7, a6, a1
                  andi         s6, zero, -1739
                  nop
                  div          sp, s11, a5
                  sra          s8, s11, s9
                  c.add        a7, s3
                  slt          zero, s8, a1
                  c.slli       s7, 28
                  sltiu        zero, t3, -1637
                  divu         a2, s9, t5
                  lui          a6, 895738
                  srli         s6, s1, 10
                  srli         s1, a6, 29
                  srli         tp, s2, 29
                  csrrs        a7, 0x340, a5
                  c.addi16sp   sp, 288
                  mulh         t3, s0, s9
                  div          tp, a5, s5
                  mulh         s7, s7, s10
                  sub          a7, t0, a1
                  c.srai       a1, 24
                  c.addi16sp   sp, -16
                  c.addi       s1, 22
                  xor          a4, sp, ra
                  c.add        s6, s8
                  xori         s0, a7, -1760
                  csrrci       s8, 0x340, 20
                  mulhsu       s11, s7, s1
                  xori         a4, s9, -2006
                  auipc        s6, 177039
                  c.andi       a2, 24
                  srai         a5, zero, 12
                  mul          s5, sp, t5
                  srli         t4, s10, 30
                  c.nop
                  slt          s0, s6, s5
                  csrrs        s10, 0x340, a4
                  div          s5, s0, t2
                  c.or         s1, a2
                  c.slli       s1, 11
                  xor          t2, t3, a1
                  div          s7, ra, s7
                  srli         a1, t4, 17
                  sra          sp, t1, s3
                  csrrc        s11, 0x340, s10
                  mulhu        a3, a6, s0
                  ori          s10, a0, 586
                  csrrs        a5, 0x340, ra
                  csrrwi       a5, 0x340, 2
                  c.xor        a0, s1
                  mulh         tp, t1, t5
                  auipc        sp, 538523
                  ori          s10, t0, -1930
                  c.lui        a7, 15
                  c.addi16sp   sp, -16
                  mulhsu       t3, a2, s10
                  c.and        a4, s0
                  c.li         a5, -1
                  csrrs        t4, 0x340, a5
                  c.addi4spn   a0, sp, 576
                  c.srai       s1, 27
                  ori          t0, t4, -1705
                  mul          t5, sp, sp
                  c.or         s0, a4
                  slti         gp, a4, 1221
                  c.addi16sp   sp, -16
                  or           a1, s4, sp
                  slti         a5, s10, -1559
                  c.and        a4, s0
                  csrrs        gp, 0x340, s8
                  c.nop
                  srl          a3, s9, tp
                  sra          ra, a6, s0
                  divu         s1, s5, s8
                  div          t2, sp, t6
                  c.addi       t2, -1
                  srl          s6, a5, s4
                  remu         a4, t4, zero
                  c.addi16sp   sp, -16
                  mulhsu       a4, a3, s5
                  auipc        t4, 672373
                  or           t5, a2, t5
                  rem          t5, s7, a0
                  c.xor        s0, a4
                  ori          t4, s9, 1911
                  mulhsu       a5, a0, s9
                  rem          t1, a3, gp
                  csrrci       t5, 0x340, 15
                  and          t0, a7, a4
                  c.srli       a1, 17
                  ori          t2, s4, -1048
                  rem          ra, a4, t2
                  sltu         a7, a3, s5
                  csrrwi       t2, 0x340, 20
                  add          t4, ra, s11
                  csrrci       s0, 0x340, 1
                  c.addi       s11, 16
                  csrrc        sp, 0x340, zero
                  sltu         s0, t3, a3
                  c.addi16sp   sp, -16
                  csrrci       zero, 0x340, 0
                  srai         t2, a0, 4
                  csrrc        a3, 0x340, zero
                  slti         s11, gp, 829
                  slti         s10, ra, -230
                  sra          a6, a2, s0
                  csrrc        t2, 0x340, zero
                  xor          a5, a6, t2
                  srai         gp, s9, 11
                  mul          t0, a7, s8
                  andi         s5, a2, -1865
                  ori          ra, a1, 1301
                  mul          t2, a4, tp
                  csrrw        t4, 0x340, a0
                  div          a2, s3, s10
                  sra          s7, a1, t6
                  srai         s2, t0, 9
                  c.mv         t5, s0
                  c.or         a5, a1
                  nop
                  c.or         a2, a3
                  add          t1, t5, t4
                  c.slli       t4, 21
                  xor          a7, s3, s9
                  c.and        a3, a3
                  divu         a1, t5, s9
                  c.srai       a1, 9
                  srli         ra, a4, 13
                  andi         a0, a0, 418
                  c.nop
                  mul          s11, sp, s0
                  addi         s11, a1, 529
                  c.li         s1, -1
                  srli         a6, a2, 27
                  srl          s11, a2, s2
                  mulhsu       s1, s7, a0
                  nop
                  sra          s8, t2, s8
                  remu         tp, t3, s0
                  srli         t1, a1, 0
                  add          s6, a0, a7
                  mulhu        t3, a5, a4
                  sra          s5, s11, t4
                  sub          s0, a4, s4
                  srl          a3, a5, t6
                  mulhsu       t3, s11, t6
                  csrrsi       t0, 0x340, 18
                  c.add        s4, s8
                  c.srai       s1, 5
                  c.add        s0, t3
                  c.addi4spn   a4, sp, 144
                  c.slli       a0, 8
                  sra          ra, gp, gp
                  c.lui        a5, 30
                  c.slli       sp, 6
                  c.addi16sp   sp, 192
                  csrrw        a6, 0x340, a0
                  c.mv         t1, a3
                  c.addi4spn   a5, sp, 640
                  csrrw        zero, 0x340, s0
                  c.sub        a5, s0
                  srl          s5, a3, a5
                  mul          t2, s2, s6
                  mulhu        t3, t4, s2
                  rem          t0, sp, a4
                  sll          a4, t1, a6
                  sll          t2, t5, sp
                  csrrc        s0, 0x340, zero
                  xor          a7, s9, a1
                  csrrci       tp, 0x340, 0
                  srai         a1, s10, 22
                  c.addi4spn   a5, sp, 816
                  ori          sp, t4, 575
                  slli         t1, s2, 30
                  mulhsu       s1, s1, s1
                  c.addi4spn   s1, sp, 528
                  addi         a2, tp, -644
                  slli         t3, a0, 23
                  mulh         zero, s6, s4
                  sll          s6, ra, s7
                  sub          a0, a7, s5
                  csrrc        a0, 0x340, a4
                  c.and        a5, a4
                  slli         gp, s11, 0
                  c.or         s0, s1
                  mulh         t1, t0, s5
                  c.nop
                  sltu         s4, sp, t2
                  c.andi       a4, -1
                  and          a5, s8, a7
                  srli         s4, t6, 13
                  mulhsu       t1, a6, t2
                  andi         a2, t1, -187
                  csrrsi       s2, 0x340, 9
                  div          s6, a3, a4
                  mulh         s7, s7, s0
                  csrrc        a5, 0x340, s9
                  sll          s7, s6, gp
                  sltu         a6, a5, ra
                  c.and        a0, s1
                  xori         s2, a1, -462
                  and          s10, s2, a1
                  nop
                  c.addi       s8, -1
                  csrrci       a0, 0x340, 26
                  remu         t5, ra, s4
                  csrrci       a2, 0x340, 0
                  sll          a2, s1, s11
                  csrrwi       s1, 0x340, 25
                  remu         sp, t6, a6
                  sltiu        a7, s0, -1838
                  nop
                  csrrw        a2, 0x340, t4
                  xori         tp, s5, 615
                  remu         zero, a1, a3
                  csrrci       a1, 0x340, 0
                  srl          s5, s11, a6
                  divu         s7, s11, t4
                  c.addi16sp   sp, 288
                  sltu         sp, s9, zero
                  c.li         s2, -1
                  and          s11, s10, s2
                  and          s4, t2, s7
                  mulhsu       a0, a5, t1
                  mulhu        s8, a0, s5
                  srli         a5, a5, 4
                  srai         t1, sp, 24
                  c.slli       t3, 22
                  csrrsi       s11, 0x340, 6
                  or           t3, a2, t1
                  c.li         s1, -1
                  and          a6, s11, t6
                  srli         a5, t0, 6
                  div          s8, a6, s3
                  slli         s5, s2, 14
                  auipc        sp, 161386
                  divu         zero, tp, s8
                  c.xor        a4, a4
                  csrrc        s11, 0x340, a3
                  ori          s2, s8, 1449
                  c.andi       s1, 29
                  and          t5, ra, s10
                  divu         s8, s5, a5
                  srli         t2, t4, 19
                  divu         s11, t2, a2
                  and          zero, a4, s4
                  mulhsu       tp, a3, t0
                  csrrwi       tp, 0x340, 5
                  slt          a5, gp, s9
                  slti         ra, tp, 1278
                  c.sub        s1, a2
                  sltiu        a2, a5, -182
                  srli         t5, s0, 19
                  addi         s11, a5, -1674
                  mulhsu       gp, s6, s5
                  c.slli       s4, 2
                  div          a1, s4, s3
                  rem          tp, s6, s6
                  srli         tp, zero, 2
                  c.srli       a4, 19
                  c.srli       a4, 7
                  c.srai       a1, 12
                  addi         s1, t3, -1850
                  c.andi       a5, 27
                  andi         s6, tp, -1784
                  addi         a0, t6, 1277
                  c.lui        s4, 20
                  srai         a5, a2, 17
                  srli         t3, tp, 5
                  sltu         a7, t3, a1
                  div          s11, t6, sp
                  csrrs        t0, 0x340, a2
                  c.srai       a1, 17
                  mulh         a1, s5, a3
                  nop
                  mul          s5, t6, ra
                  sll          a7, s3, a5
                  c.nop
                  lui          s10, 858954
                  csrrwi       tp, 0x340, 18
                  csrrwi       a3, 0x340, 13
                  csrrsi       s4, 0x340, 28
                  c.andi       a4, 4
                  and          s1, s6, s6
                  c.srai       a0, 31
                  csrrs        t2, 0x340, s10
                  c.nop
                  and          zero, a0, s6
                  c.sub        s1, a5
                  sra          s8, s2, s5
                  c.lui        s4, 9
                  xor          t2, t6, s5
                  slti         s1, t3, 767
                  c.li         s7, -1
                  remu         s0, s11, zero
                  sltiu        a0, s3, 1362
                  andi         s5, tp, -1354
                  sltiu        sp, a7, 1854
                  srl          a5, s11, s9
                  auipc        t0, 133554
                  c.xor        a3, a5
                  c.andi       a3, -1
                  auipc        s5, 446593
                  sub          a1, sp, t1
                  srai         gp, t4, 11
                  auipc        a4, 814144
                  addi         t2, zero, -571
                  slli         a3, t6, 26
                  xor          s8, t0, t6
                  mul          s11, s10, a5
                  srli         sp, s10, 7
                  slli         t2, gp, 10
                  c.xor        a0, a0
                  sltiu        a2, s9, -155
                  c.and        a0, a0
                  csrrw        ra, 0x340, s1
                  sltu         s7, gp, tp
                  remu         tp, s6, s4
                  remu         t5, t4, s8
                  c.add        a6, s7
                  slt          a4, s1, a1
                  c.and        a3, a2
                  mulhu        s2, s9, a5
                  c.srai       a0, 29
                  slli         a3, a5, 4
                  mulh         zero, s10, s1
                  ori          s4, s11, 1713
                  srl          s1, a1, a0
                  c.li         a4, 24
                  remu         s5, t6, a0
                  c.andi       a5, -1
                  sll          tp, s4, s1
                  srl          s11, tp, s6
                  slti         s11, a1, 1356
                  remu         a6, t0, a1
                  c.and        a1, a4
                  csrrsi       s0, 0x340, 0
                  c.addi16sp   sp, 480
                  c.add        t0, tp
                  c.addi16sp   sp, -16
                  xori         s6, s0, -1448
                  andi         t4, a4, 857
                  csrrci       a0, 0x340, 0
                  rem          a2, s11, s1
                  andi         a1, a1, 1201
                  sll          sp, s4, s2
                  csrrc        s7, 0x340, s10
                  nop
                  nop
                  auipc        a0, 208312
                  xori         s4, t4, 1396
                  csrrc        a3, 0x340, s7
                  divu         zero, t0, t2
                  csrrwi       gp, 0x340, 0
                  lui          a3, 959613
                  c.andi       a2, -1
                  remu         a3, tp, t1
                  ori          a7, s0, -1671
                  mul          a0, t3, t3
                  c.lui        a4, 30
                  slli         s8, t1, 26
                  srai         s2, t6, 11
                  c.and        a0, a1
                  c.mv         s0, s9
                  csrrs        s5, 0x340, zero
                  sll          s10, s9, t5
                  c.or         s1, a1
                  c.addi4spn   a0, sp, 208
                  slt          t4, t3, s2
                  mulhsu       s5, t2, s5
                  sltu         s0, a0, t0
                  csrrw        ra, 0x340, s4
                  xori         a5, s6, -145
                  c.and        a4, a0
                  srli         a4, s8, 15
                  c.srai       a3, 6
                  c.addi       s6, -1
                  srai         t0, a3, 13
                  mulhu        s5, s8, a2
                  slli         s8, s10, 6
                  slt          s7, zero, zero
                  slt          s8, t6, s5
                  ori          s4, gp, -863
                  and          s11, a2, s6
                  c.addi16sp   sp, 48
                  csrrwi       zero, 0x340, 31
                  sra          t5, zero, s8
                  sltiu        t5, a6, -622
                  c.srai       a2, 22
                  rem          a2, a4, t3
                  xor          a5, a1, t4
                  ori          a1, s4, -440
                  add          a5, a0, a1
                  sub          a0, s10, a7
                  lui          s4, 560895
                  ori          a0, s2, 1225
                  mulhu        s8, a6, t5
                  auipc        t1, 346732
                  c.andi       a1, -1
                  csrrc        a5, 0x340, s8
                  ori          t0, tp, 1517
                  csrrc        s5, 0x340, a1
                  mul          a0, s6, a3
                  remu         s5, t0, tp
                  auipc        a2, 1027099
                  c.xor        s1, a2
                  c.addi16sp   sp, -16
                  c.xor        a4, s1
                  c.addi16sp   sp, -16
                  lui          tp, 540433
                  xori         s5, t3, 1752
                  c.li         a4, -1
                  c.srai       a1, 28
                  c.srli       a0, 17
                  c.nop
                  c.sub        a0, a0
                  addi         s1, t0, -1664
                  lui          s11, 237791
                  divu         t0, t0, s7
                  slli         s5, a7, 9
                  srai         s8, a5, 13
                  c.or         s1, a3
                  c.andi       s1, -1
                  lui          t5, 760339
                  xori         sp, a1, -786
                  srai         gp, t1, 4
                  csrrc        s2, 0x340, a2
                  nop
                  ori          s6, t1, -1137
                  sltiu        s4, s7, 1765
                  c.srli       a2, 14
                  csrrc        s4, 0x340, zero
                  divu         s11, t0, zero
                  auipc        t4, 946553
                  andi         a5, t3, 1352
                  andi         a1, s0, -769
                  xor          gp, ra, sp
                  mulh         s0, s0, a3
                  c.mv         a1, a2
                  c.li         s1, -1
                  c.li         t0, 19
                  c.andi       a4, 0
                  remu         a6, t2, t2
                  c.srai       a0, 15
                  c.li         t3, 18
                  mulh         ra, a0, s3
                  sub          t0, s1, a6
                  ori          t0, a2, 1612
                  c.lui        s8, 17
                  csrrc        t3, 0x340, zero
                  div          ra, s11, s0
                  sll          s5, s11, t2
                  sll          s8, a7, t0
                  nop
                  slt          s0, t3, tp
                  remu         s10, s8, sp
                  mul          s10, a7, t6
                  srai         s7, a0, 19
                  slt          a1, s9, t1
                  csrrwi       ra, 0x340, 8
                  divu         a7, s5, a5
                  csrrci       ra, 0x340, 29
                  lui          s6, 498495
                  sltu         a6, t0, s6
                  mulhu        s0, t6, s0
                  slti         sp, a6, 2006
                  c.add        t1, t1
                  c.xor        a3, a3
                  csrrc        a4, 0x340, a6
                  mul          s8, s8, s9
                  c.addi       a2, -1
                  srai         zero, ra, 18
                  xori         s8, a6, 1386
                  csrrc        tp, 0x340, t3
                  c.xor        s1, a3
                  remu         a5, s6, zero
                  remu         a6, a3, tp
                  csrrci       t1, 0x340, 20
                  csrrc        a3, 0x340, zero
                  c.addi       sp, 10
                  c.mv         t3, a7
                  and          a6, a4, s10
                  c.srai       a5, 3
                  c.xor        a3, s1
                  ori          a6, t6, -1493
                  csrrw        a7, 0x340, s8
                  xor          a0, s9, a3
                  slt          s10, a6, t0
                  c.or         a4, a1
                  c.addi       s0, 3
                  c.add        gp, s7
                  c.mv         a4, s0
                  c.lui        a5, 30
                  add          sp, s10, t2
                  csrrwi       t1, 0x340, 21
                  csrrwi       t5, 0x340, 10
                  csrrsi       a5, 0x340, 0
                  and          t1, s11, a7
                  c.srli       a3, 17
                  slli         t1, a0, 27
                  rem          s0, s0, a2
                  srai         tp, t3, 31
                  mulhsu       s11, s1, t1
                  srl          gp, s7, tp
                  slti         gp, s1, 1207
                  divu         a0, sp, t6
                  csrrw        s8, 0x340, s7
                  csrrw        t1, 0x340, sp
                  nop
                  c.srai       a3, 19
                  csrrsi       s1, 0x340, 12
                  add          sp, s6, s11
                  c.mv         s11, a1
                  divu         t3, a6, s4
                  mulhu        a0, a4, t4
                  sra          zero, t5, a5
                  lui          gp, 231311
                  srl          t4, s4, s11
                  sltu         sp, a1, t6
                  divu         t0, a6, a7
                  xori         a4, t0, 283
                  c.srli       a3, 13
                  ori          tp, s8, 765
                  mulhu        t2, ra, t5
                  or           t5, a2, a6
                  c.andi       a3, -1
                  c.xor        s1, s1
                  add          zero, s9, s0
                  c.srli       s0, 1
                  c.slli       a4, 13
                  sltu         s4, s9, s5
                  srai         s11, s4, 29
                  sltiu        s6, zero, 1580
                  mul          gp, t3, t3
                  csrrw        t2, 0x340, tp
                  srli         s11, a7, 25
                  sub          s5, s4, s2
                  slli         s6, s4, 23
                  c.li         s2, 1
                  csrrwi       t4, 0x340, 17
                  sltiu        a7, a4, -1978
                  c.addi4spn   a4, sp, 960
                  srl          s8, s4, t6
                  csrrs        s1, 0x340, zero
                  c.sub        a5, a3
                  divu         t2, t3, s3
                  and          s7, t1, s3
                  xor          a6, s0, s4
                  mulhsu       t5, t4, s1
                  addi         t2, t0, 832
                  c.and        s1, a5
                  rem          zero, t6, a3
                  mulhsu       ra, gp, s7
                  csrrsi       t4, 0x340, 4
                  c.andi       a5, 10
                  addi         s11, s4, -2039
                  c.xor        a3, a4
                  addi         t0, s2, 601
                  c.or         a3, a1
                  mulhu        a0, tp, t2
                  c.mv         a5, tp
                  c.or         a5, a5
                  c.srai       a1, 9
                  c.slli       s4, 9
                  xori         zero, sp, -1455
                  csrrsi       s8, 0x340, 29
                  sltiu        a7, s1, -260
                  sub          a6, s8, t1
                  c.sub        a3, a1
                  c.sub        a3, a5
                  c.nop
                  srai         gp, t4, 12
                  sltu         s8, a3, gp
                  sltu         s7, s6, s1
                  c.slli       a4, 8
                  nop
                  slli         t4, s11, 18
                  c.xor        a2, a5
                  c.srai       a4, 1
                  slt          sp, s2, s2
                  ori          a5, a7, -1915
                  mulhu        s11, t3, t1
                  andi         a3, ra, -945
                  c.xor        s1, a0
                  c.srai       a5, 3
                  c.nop
                  div          ra, t3, s11
                  mulhsu       a2, sp, s9
                  sub          s7, t4, a7
                  sra          a0, t1, s2
                  c.nop
                  mulh         t3, a6, s3
                  slli         gp, a2, 25
                  sra          gp, a1, a4
                  ori          tp, ra, -1830
                  lui          s8, 997731
                  rem          zero, gp, t4
                  srli         s8, a1, 30
                  csrrw        a0, 0x340, t5
                  slli         a5, sp, 9
                  c.xor        a5, a0
                  csrrsi       s5, 0x340, 0
                  csrrc        a3, 0x340, s2
                  sltiu        ra, a4, -1555
                  ori          t0, a3, -1001
                  c.addi4spn   s1, sp, 544
                  c.sub        a4, s1
                  div          t4, zero, s9
                  c.lui        t0, 22
                  csrrwi       tp, 0x340, 10
                  sll          s10, a5, t3
                  addi         zero, s7, 1124
                  c.srli       a3, 8
                  c.add        gp, s6
                  auipc        s0, 927889
                  ori          t1, s10, -798
                  sub          s5, a5, s2
                  c.srli       a1, 25
                  c.srli       a1, 27
                  c.xor        a2, s0
                  csrrsi       t5, 0x340, 0
                  sltu         s8, a2, s3
                  c.slli       s6, 28
                  c.addi4spn   s0, sp, 864
                  sub          t0, gp, a2
                  csrrsi       a3, 0x340, 7
                  csrrsi       s2, 0x340, 0
                  remu         sp, a5, ra
                  c.srai       a3, 3
                  csrrc        a6, 0x340, t3
                  c.nop
                  sltu         a3, a3, a0
                  csrrw        a7, 0x340, s6
                  mulh         t4, s0, s0
                  andi         a1, sp, -321
                  c.xor        a4, a4
                  c.add        a0, a4
                  remu         t1, a1, t6
                  c.addi16sp   sp, -16
                  c.sub        a4, s0
                  c.or         s1, s0
                  sub          s1, s11, s9
                  lui          s0, 243152
                  sra          sp, t1, a6
                  c.srli       a4, 17
                  xori         sp, s6, -2004
                  xor          t3, a7, s0
                  sra          a0, a7, t5
                  ori          gp, a6, 622
                  addi         t2, s7, -29
                  c.addi16sp   sp, 80
                  csrrci       a2, 0x340, 29
                  or           ra, a4, ra
                  c.slli       a2, 14
                  c.nop
                  c.srai       s0, 2
                  sub          s0, t0, s8
                  slli         s10, a7, 26
                  mulhu        zero, s5, s6
                  slti         s10, t2, -1151
                  xori         sp, s0, 670
                  and          t2, s7, s1
                  c.andi       a5, 19
                  csrrci       a0, 0x340, 0
                  or           t4, t2, s0
                  or           zero, s10, s6
                  c.add        a7, s10
                  xor          s2, s6, t5
                  sltu         gp, gp, s8
                  or           a6, t0, sp
                  c.addi       ra, 14
                  remu         s1, ra, s4
                  c.addi16sp   sp, -16
                  ori          t1, s3, 1864
                  srli         tp, s1, 23
                  c.nop
                  c.sub        a4, s1
                  c.srai       a0, 7
                  c.nop
                  addi         a6, a7, 239
                  c.srai       a3, 30
                  sltu         s5, s10, s11
                  add          s5, zero, t4
                  c.addi16sp   sp, 496
                  c.li         s1, 30
                  csrrw        t1, 0x340, t3
                  csrrci       s4, 0x340, 10
                  sltu         s1, s8, a5
                  andi         s2, t4, 404
                  c.srai       a1, 24
                  and          s10, s6, ra
                  sub          t1, t2, tp
                  c.srai       s1, 27
                  remu         t1, s11, s10
                  add          a2, s2, t1
                  addi         s1, a1, -628
                  c.and        a2, s1
                  mul          s1, a3, a1
                  sub          a4, s2, s2
                  and          s6, s6, sp
                  xori         sp, a4, -924
                  c.addi       s0, -1
                  srai         sp, s4, 12
                  remu         t0, a4, ra
                  sll          a3, s1, a1
                  csrrs        t0, 0x340, ra
                  c.li         s6, 6
                  csrrc        sp, 0x340, zero
                  srai         s0, s2, 20
                  csrrs        t5, 0x340, zero
                  srl          a0, t1, tp
                  and          a3, a7, gp
                  slt          a1, a3, s3
                  andi         t2, s3, -299
                  csrrw        t2, 0x340, a2
                  addi         a3, t1, -1656
                  c.lui        ra, 15
                  xori         s1, ra, 1189
                  sltu         zero, t1, s6
                  mul          s11, s0, a7
                  mulh         t1, s6, gp
                  sra          s6, t5, s1
                  c.lui        tp, 25
                  div          a6, a0, t3
                  sltu         s1, t6, sp
                  c.nop
                  sltu         t2, s8, ra
                  c.slli       t5, 22
                  addi         s11, t2, 1564
                  srl          tp, a6, a2
                  c.addi4spn   a0, sp, 736
                  csrrsi       s0, 0x340, 25
                  c.nop
                  nop
                  xori         a6, s6, -1712
                  andi         s11, s5, -1278
                  mulhu        tp, s8, t4
                  c.nop
                  c.li         s7, 20
                  remu         t2, s10, s10
                  c.nop
                  c.addi16sp   sp, -16
                  c.or         a3, a3
                  mulh         zero, a7, s11
                  c.add        ra, ra
                  c.nop
                  sll          s4, zero, gp
                  c.srai       s0, 2
                  slli         ra, s4, 23
                  c.xor        s1, a0
                  csrrw        ra, 0x340, a2
                  mulhu        a3, s7, s0
                  mulh         s7, s1, s8
                  c.xor        a4, a2
                  slti         t3, t0, -82
                  mulh         t1, t1, sp
                  sltu         s4, s9, gp
                  nop
                  c.add        gp, a1
                  and          t0, a6, t5
                  ori          gp, s10, -731
                  csrrci       s5, 0x340, 15
                  csrrci       s2, 0x340, 0
                  slti         t1, t4, -447
                  c.mv         s4, s9
                  srai         s1, s4, 18
                  rem          tp, s7, sp
                  sltu         t5, t1, t1
                  lui          zero, 46628
                  srai         gp, a4, 31
                  csrrci       a7, 0x340, 0
                  csrrc        a1, 0x340, zero
                  sra          s4, a0, gp
                  mulhu        s0, s4, t3
                  c.addi       s5, -1
                  auipc        a3, 931580
                  mul          a1, a0, s1
                  add          a4, s8, a3
                  c.andi       s0, -1
                  c.srai       a1, 24
                  c.andi       a2, 16
                  andi         ra, s4, -1446
                  c.slli       a4, 27
                  csrrc        s1, 0x340, zero
                  sub          a0, t2, a5
                  c.srai       a4, 11
                  csrrc        a0, 0x340, a1
                  c.lui        a4, 29
                  csrrs        t3, 0x340, zero
                  c.or         a5, s1
                  ori          s7, a6, 1817
                  c.srai       a1, 13
                  c.addi16sp   sp, 128
                  slli         a6, s6, 25
                  xori         zero, s6, 395
                  c.slli       t5, 18
                  mulhu        tp, s2, a6
                  c.srli       s0, 24
                  c.or         s0, s1
                  srl          s2, t6, a3
                  divu         a1, ra, t5
                  csrrsi       s6, 0x340, 0
                  xor          a1, t5, s2
                  c.li         a5, 5
                  slt          s7, a4, a7
                  xor          s8, t2, a7
                  csrrsi       sp, 0x340, 14
                  c.or         a2, a3
                  mul          s8, s4, a0
                  c.addi4spn   a5, sp, 832
                  c.xor        a4, a1
                  sll          zero, t1, gp
                  c.slli       s7, 31
                  c.xor        a3, a5
                  c.lui        s5, 25
                  sltu         gp, gp, zero
                  nop
                  add          t5, s11, a2
                  ori          s7, a4, -1794
                  csrrc        s4, 0x340, zero
                  sub          s4, s7, t5
                  c.addi16sp   sp, 224
                  c.and        a4, s1
                  slti         a6, t2, -482
                  mul          t3, t2, a5
                  csrrc        s6, 0x340, a1
                  sll          t5, a0, s7
                  sltu         s6, a2, a6
                  c.lui        a4, 8
                  c.xor        a5, a3
                  c.srli       a1, 18
                  add          gp, s4, gp
                  srl          s5, t3, s9
                  divu         t2, s0, s5
                  csrrs        a5, 0x340, sp
                  sltu         a7, t0, zero
                  sltu         a6, t0, t5
                  sra          s0, a5, s10
                  rem          a0, t0, t4
                  csrrs        s8, 0x340, zero
                  or           t2, s4, s9
                  c.xor        a4, a1
                  c.mv         s6, a5
                  mulhu        a6, tp, s9
                  slt          a6, a3, s5
                  srai         t4, s0, 23
                  auipc        s7, 547155
                  c.andi       a2, -1
                  c.slli       ra, 10
                  slti         t5, a0, 459
                  xori         s7, s0, 386
                  mulhu        sp, a1, a5
                  divu         sp, s2, a5
                  nop
                  sra          s0, s11, s10
                  c.add        s7, a7
                  remu         a2, t6, a7
                  slt          a7, s5, s1
                  csrrci       s10, 0x340, 18
                  sltiu        t5, s7, 389
                  nop
                  or           s8, a3, s4
                  c.slli       s8, 20
                  mulhsu       gp, s4, s9
                  c.mv         s11, a4
                  rem          t0, s8, a6
                  c.andi       a3, 28
                  csrrwi       ra, 0x340, 15
                  csrrs        t2, 0x340, a0
                  xori         t2, t2, 1517
                  addi         zero, t6, -374
                  c.mv         s8, s9
                  slti         a7, s0, -2027
                  c.addi4spn   s0, sp, 736
                  div          s0, a1, t3
                  nop
                  divu         a2, t4, a1
                  c.li         s6, -1
                  c.slli       t1, 11
                  srl          a5, s9, t2
                  c.lui        tp, 1
                  csrrci       t4, 0x340, 19
                  mulhu        s6, a4, a6
                  csrrs        s1, 0x340, s7
                  c.slli       s7, 20
                  or           t0, t3, s7
                  c.and        s0, a1
                  c.mv         s8, s5
                  sub          t4, a0, t0
                  add          a6, t0, s9
                  c.addi       t3, 17
                  mulhu        a6, t4, t3
                  c.srli       a4, 5
                  c.or         a1, a5
                  srl          t4, a4, tp
                  auipc        s6, 201281
                  csrrc        gp, 0x340, zero
                  c.slli       a5, 2
                  csrrci       s11, 0x340, 31
                  c.or         a3, s0
                  xor          t0, t1, s4
                  csrrw        t4, 0x340, zero
                  xori         a7, a2, 590
                  csrrci       s5, 0x340, 29
                  csrrs        zero, 0x340, t6
                  c.and        a1, a0
                  csrrci       t3, 0x340, 0
                  auipc        s1, 229948
                  c.xor        s1, s0
                  or           s11, a6, s0
                  srai         t2, a7, 18
                  addi         a2, t6, 1959
                  or           t2, a1, s2
                  nop
                  and          s6, a4, s6
                  sltu         t5, s4, t5
                  csrrs        s7, 0x340, a4
                  xor          t2, sp, s2
                  c.srli       a2, 13
                  mulhu        a4, s3, s10
                  sltu         s2, t5, a7
                  csrrs        s5, 0x340, t5
                  csrrs        a7, 0x340, zero
                  addi         a4, a0, -460
                  nop
                  c.slli       s10, 25
                  c.srli       a4, 8
                  csrrsi       t3, 0x340, 0
                  c.addi       s6, -1
                  c.srai       s1, 19
                  csrrci       t5, 0x340, 20
                  remu         t0, a0, t4
                  c.nop
                  nop
                  csrrw        t5, 0x340, zero
                  sub          a6, gp, t5
                  xori         zero, a7, 774
                  ori          a2, s4, 1944
                  slti         s6, t0, -901
                  c.addi       a7, 7
                  c.and        s0, a0
                  xor          s4, a7, a1
                  sll          s10, a4, s3
                  sltiu        tp, t3, -2022
                  slli         tp, s6, 27
                  addi         s6, a2, -1146
                  slli         gp, a4, 18
                  nop
                  and          t3, t3, a2
                  sll          tp, gp, gp
                  or           a3, t0, s2
                  csrrs        ra, 0x340, s5
                  mul          s7, t6, s9
                  c.mv         ra, s2
                  lui          a2, 140388
                  c.and        a0, a4
                  sra          sp, a6, s9
                  and          t5, a4, t0
                  srai         ra, s4, 13
                  csrrw        s11, 0x340, s10
                  nop
                  sll          t5, s5, t5
                  sra          a4, s9, t3
                  csrrci       s7, 0x340, 0
                  csrrc        sp, 0x340, zero
                  csrrw        s10, 0x340, s1
                  mulh         s2, t3, t2
                  sub          s7, a2, t3
                  c.addi4spn   a1, sp, 32
                  andi         a4, s7, -1703
                  divu         a7, t2, ra
                  c.addi4spn   a5, sp, 400
                  slli         a1, s8, 3
                  c.add        a6, a0
                  c.srai       a0, 16
                  and          sp, t6, s7
                  slt          s6, s6, s7
                  lui          sp, 877937
                  c.slli       a4, 28
                  c.srli       a0, 29
                  c.xor        a4, s0
                  c.li         s7, 4
                  c.and        a1, a1
                  c.srli       a3, 14
                  sll          a3, s8, a6
                  div          a0, s5, a4
                  c.xor        a5, a5
                  mul          s4, t6, t4
                  mul          t1, t4, s3
                  auipc        s6, 475482
                  slli         ra, gp, 13
                  slli         s6, t6, 1
                  mul          s11, s0, a4
                  mulhu        gp, t6, a0
                  ori          a4, a1, 137
                  c.addi       s0, -1
                  csrrsi       s5, 0x340, 8
                  divu         a0, s0, s10
                  csrrc        s1, 0x340, zero
                  srai         s6, a2, 16
                  addi         s0, s1, -1596
                  slti         s4, ra, 22
                  c.addi       a1, -1
                  c.and        s0, a0
                  add          a0, s6, s2
                  c.li         s2, -1
                  xori         t4, s8, 1870
                  ori          s8, s7, 1938
                  c.nop
                  c.sub        a0, a4
                  c.srli       a0, 10
                  addi         s0, t5, -1590
                  div          s5, s6, a7
                  slti         s4, gp, 1381
                  xor          t1, s10, s8
                  mulhsu       a3, t4, sp
                  srli         s0, a2, 16
                  xor          s7, t5, s1
                  c.nop
                  slti         a4, s6, 1910
                  c.slli       s10, 14
                  c.addi       t0, 5
                  srai         t5, s9, 23
                  csrrsi       tp, 0x340, 10
                  sltu         sp, ra, sp
                  sltiu        tp, sp, -516
                  c.addi16sp   sp, 432
                  srai         a3, s1, 2
                  c.xor        a2, s1
                  csrrc        a3, 0x340, zero
                  c.addi4spn   a5, sp, 368
                  divu         t3, s1, s11
                  sub          a1, sp, a5
                  addi         s1, a2, -1968
                  add          sp, a0, s10
                  mulh         s1, a4, s2
                  c.addi4spn   a1, sp, 976
                  csrrsi       t2, 0x340, 0
                  mul          s6, s8, t5
                  addi         t2, ra, 633
                  c.lui        s0, 25
                  sub          a4, s1, ra
                  sll          a7, s3, t2
                  srl          s11, s1, sp
                  c.srai       s0, 14
                  lui          s10, 277063
                  addi         s7, s9, -544
                  c.andi       a4, -1
                  auipc        tp, 328915
                  c.mv         a4, a3
                  c.and        s0, a0
                  and          t4, zero, t5
                  addi         s0, ra, 961
                  c.lui        s5, 24
                  c.nop
                  csrrc        t2, 0x340, s5
                  mulhsu       t5, a6, a6
                  srli         s0, s1, 31
                  or           s11, a7, t3
                  divu         a2, s11, tp
                  csrrwi       a4, 0x340, 7
                  mulh         a1, t5, a0
                  c.and        a4, a5
                  slt          t3, s3, s7
                  srl          gp, t4, t3
                  sll          s1, a0, t2
                  mulhu        gp, gp, a4
                  and          t3, s4, t4
                  c.lui        s5, 20
                  csrrwi       a3, 0x340, 21
                  divu         ra, a2, s8
                  or           a6, s10, a2
                  mulhu        t0, tp, s8
                  mulhu        t5, t4, s4
                  c.xor        a3, a3
                  c.and        a0, s0
                  srli         a5, t5, 24
                  slt          s0, s2, s6
                  csrrwi       a4, 0x340, 19
                  srli         t5, t5, 30
                  csrrs        tp, 0x340, zero
                  c.lui        a4, 17
                  c.srli       a0, 1
                  sub          s0, a6, s7
                  mulhsu       a5, a0, tp
                  csrrw        t3, 0x340, a1
                  c.srai       a3, 6
                  mul          s0, s2, s3
                  csrrs        s0, 0x340, zero
                  lui          a5, 186969
                  xori         s2, s1, 1214
                  lui          s8, 306205
                  ori          t5, a1, 857
                  divu         gp, tp, s3
                  c.nop
                  c.mv         sp, gp
                  div          a7, s10, a3
                  sltu         t1, s3, gp
                  and          t5, t1, a5
                  sra          a0, s3, sp
                  div          t2, zero, a1
                  divu         a7, s11, t0
                  csrrci       ra, 0x340, 7
                  add          t2, ra, gp
                  csrrci       t1, 0x340, 0
                  xori         t0, a1, -682
                  srl          s2, t2, a4
                  c.lui        s8, 14
                  csrrs        s6, 0x340, zero
                  andi         a5, t5, 1241
                  div          a6, tp, s8
                  c.li         t1, 18
                  sltiu        s11, t6, 646
                  csrrci       t0, 0x340, 16
                  sra          s8, ra, s9
                  lui          s7, 925757
                  csrrw        t5, 0x340, s1
                  c.li         a3, 19
                  srl          s6, t3, t4
                  addi         a3, a1, 564
                  rem          t2, ra, s5
                  slt          a6, a5, a2
                  xor          s0, s4, s11
                  c.addi4spn   a1, sp, 944
                  c.addi       s1, 17
                  csrrs        s1, 0x340, s11
                  c.lui        gp, 4
                  mulhu        a7, a1, a2
                  srai         s11, t4, 13
                  slli         zero, s2, 31
                  c.add        t2, s10
                  sra          a4, t0, ra
                  mul          a0, s2, a7
                  lui          a3, 877845
                  c.add        s0, t4
                  sra          a2, a4, s0
                  xori         a5, s10, -471
                  remu         ra, s1, sp
                  c.andi       a0, -1
                  addi         a1, t1, -956
                  csrrs        t5, 0x340, gp
                  csrrsi       sp, 0x340, 0
                  add          s10, s2, t3
                  csrrsi       t0, 0x340, 7
                  c.srli       a4, 13
                  csrrci       s5, 0x340, 29
                  srai         sp, t4, 22
                  c.li         t2, -1
                  ori          s5, a4, -1848
                  srai         t1, sp, 0
                  c.andi       a3, 4
                  and          t1, ra, gp
                  nop
                  rem          zero, t5, a7
                  nop
                  c.addi       s0, 12
                  c.srli       s0, 20
                  csrrw        s7, 0x340, t1
                  ori          t2, t3, 1754
                  or           s8, s10, a1
                  c.addi16sp   sp, 432
                  div          sp, t4, s5
                  add          s2, a6, s10
                  mul          a0, a7, a0
                  c.andi       s0, 25
                  c.addi4spn   a4, sp, 832
                  or           s2, t0, a4
                  csrrci       t4, 0x340, 29
                  csrrc        gp, 0x340, zero
                  lui          ra, 401125
                  nop
                  mul          a0, a3, s6
                  c.or         a3, a0
                  rem          a1, a0, zero
                  c.andi       a2, -1
                  c.lui        s6, 12
                  lui          a5, 996406
                  c.and        s1, a2
                  lui          a3, 220183
                  xori         s4, t5, 231
                  c.nop
                  c.li         s8, 11
                  c.addi4spn   s1, sp, 144
                  c.slli       t4, 1
                  srai         a6, s7, 20
                  mulhu        a0, s3, s10
                  c.slli       s7, 22
                  or           a1, sp, t5
                  remu         ra, a7, t1
                  addi         t4, a0, -261
                  c.lui        ra, 3
                  and          a0, s7, a0
                  c.nop
                  slli         t2, ra, 2
                  c.mv         t1, s2
                  c.srai       a4, 3
                  xor          s1, s7, t0
                  sub          zero, t0, s11
                  c.nop
                  mul          t0, s0, s6
                  csrrsi       tp, 0x340, 26
                  ori          s0, t5, -685
                  nop
                  c.xor        a3, s0
                  c.lui        a0, 5
                  c.or         a5, a1
                  csrrsi       zero, 0x340, 1
                  c.lui        s4, 30
                  csrrc        a2, 0x340, zero
                  remu         zero, t5, a5
                  sub          s5, s0, s8
                  c.andi       a1, -1
                  nop
                  c.xor        a0, a3
                  mulhsu       s6, t2, a1
                  xori         s7, t4, -1117
                  csrrsi       s7, 0x340, 4
                  mulhu        s1, s10, s11
                  sltiu        a0, a1, -1107
                  c.andi       a4, 20
                  sltu         s7, s9, s8
                  and          t2, t1, a7
                  c.li         t2, 0
                  csrrw        s7, 0x340, s1
                  sll          t0, t5, t0
                  c.li         s6, 21
                  csrrwi       zero, 0x340, 13
                  addi         a3, a3, 1709
                  add          s2, s9, s8
                  remu         t4, ra, a3
                  c.srli       s0, 27
                  c.addi       sp, -1
                  srai         s2, s9, 24
                  c.add        s6, t2
                  c.mv         t5, t1
                  auipc        a1, 943528
                  c.nop
                  add          a5, s10, s0
                  add          a1, t2, a3
                  srai         s10, t4, 7
                  sltu         s11, s10, a0
                  srl          s2, sp, s8
                  csrrci       s7, 0x340, 10
                  sub          s7, a3, a5
                  mulh         t5, gp, s8
                  andi         s6, s9, 50
                  srl          a5, t4, t6
                  divu         s8, s7, t4
                  c.and        a4, a2
                  c.lui        s8, 3
                  c.add        a0, s7
                  mulhsu       t4, t6, s4
                  and          a0, a6, s2
                  c.lui        a7, 31
                  slli         s11, t5, 17
                  slli         s8, a4, 26
                  csrrwi       gp, 0x340, 23
                  c.li         t2, -1
                  c.mv         a7, t1
                  auipc        s0, 926390
                  auipc        a3, 872125
                  c.sub        a1, s1
                  sra          s7, s0, s8
                  srl          s7, a0, a1
                  addi         s1, a0, -1382
                  remu         t4, t2, s2
                  c.addi16sp   sp, 272
                  remu         s0, t3, t5
                  csrrw        s10, 0x340, sp
                  sltu         t3, a2, t1
                  and          s10, s9, a7
                  c.slli       ra, 27
                  sltiu        s7, t4, 734
                  c.or         a5, a3
                  c.sub        s0, a5
                  c.li         a4, 13
                  srai         t2, t3, 30
                  sub          ra, s5, s0
                  c.add        s2, s10
                  sra          s0, t5, t0
                  srl          a4, t5, a0
                  xor          t2, t1, s8
                  c.add        a5, s1
                  remu         a6, a1, s10
                  c.addi       gp, 28
                  auipc        s11, 752641
                  c.xor        a3, s1
                  nop
                  slli         t5, t5, 10
                  mulhsu       s11, a2, s9
                  c.and        a3, a5
                  sltiu        s7, t4, -1626
                  c.lui        s7, 23
                  addi         a3, s5, 256
                  csrrsi       sp, 0x340, 0
                  c.mv         a3, s9
                  mulhsu       a6, sp, a4
                  divu         zero, a6, t5
                  c.andi       a5, -1
                  mulh         t1, a3, a6
                  c.addi4spn   a0, sp, 624
                  c.and        a2, a1
                  mulhsu       s4, t4, s0
                  csrrci       a2, 0x340, 0
                  c.li         s0, -1
                  srai         s5, a3, 5
                  addi         sp, a5, 772
                  sra          a3, s3, s9
                  div          s7, s5, a4
                  sll          ra, t1, t5
                  mul          s2, t2, sp
                  csrrw        s2, 0x340, s7
                  sub          ra, sp, t6
                  ori          a6, s5, 1298
                  c.srai       a1, 25
                  srai         s8, a2, 7
                  slti         t4, s10, -1597
                  csrrw        t0, 0x340, s10
                  mul          s10, a2, t3
                  sll          a5, t6, t4
                  srli         a5, s8, 4
                  auipc        s5, 710157
                  c.and        a2, s0
                  c.slli       s5, 18
                  c.and        a1, a3
                  slli         t5, t6, 17
                  c.lui        s8, 26
                  srli         s2, t5, 20
                  c.sub        a2, a3
                  c.or         a4, a4
                  c.srli       a2, 7
                  c.and        a2, a1
                  c.add        a0, t1
                  sub          gp, gp, tp
                  c.sub        a5, a4
                  or           s5, s3, s4
                  mulhsu       t2, a7, s7
                  c.xor        a0, a4
                  add          s8, a3, t2
                  div          t4, a2, a6
                  c.li         t0, -1
                  c.add        a3, t1
                  c.addi4spn   a0, sp, 624
                  add          t2, s6, t1
                  remu         t5, gp, s10
                  csrrsi       s6, 0x340, 16
                  and          a1, s0, s4
                  c.add        t3, s6
                  c.lui        a3, 2
                  csrrwi       s4, 0x340, 7
                  xor          s0, t6, a2
                  xor          s11, ra, t0
                  xori         s1, s6, 1233
                  c.li         gp, -1
                  c.xor        a4, a5
                  csrrs        t5, 0x340, s8
                  mulhu        a2, a5, s8
                  c.xor        a2, s0
                  srli         s8, s2, 1
                  andi         a2, s8, 111
                  srai         a1, s1, 13
                  xori         t0, t5, 1733
                  slti         a7, a0, 1697
                  c.and        a2, a3
                  lui          a5, 142519
                  c.mv         a2, s1
                  sltu         s6, tp, s3
                  csrrwi       a7, 0x340, 16
                  csrrc        a2, 0x340, t4
                  auipc        tp, 197836
                  c.andi       a0, 2
                  slti         a6, t6, -441
                  srl          s8, t1, sp
                  nop
                  remu         s11, a5, tp
                  c.lui        a2, 15
                  slt          t0, s9, s3
                  srai         a3, tp, 1
                  sra          a5, t6, t5
                  csrrs        zero, 0x340, zero
                  sltu         a1, sp, s8
                  xor          a2, a7, t5
                  c.nop
                  auipc        s5, 758152
                  andi         s4, t3, 1991
                  rem          t4, t3, t6
                  xor          t2, t6, s4
                  c.and        a0, s0
                  remu         a4, t2, ra
                  c.nop
                  c.andi       a2, 1
                  c.or         a5, a3
                  sra          s2, t2, a3
                  csrrs        t0, 0x340, s10
                  auipc        a6, 137548
                  rem          s6, a1, a1
                  csrrwi       s5, 0x340, 9
                  sub          sp, t6, s10
                  or           s0, s0, a1
                  lui          a4, 497474
                  csrrci       s6, 0x340, 29
                  srl          a7, t5, tp
                  csrrs        s4, 0x340, s8
                  div          s11, t5, s10
                  c.sub        a2, s0
                  srli         a0, s3, 22
                  mulhsu       a1, s3, t0
                  sra          a1, s5, s5
                  csrrwi       gp, 0x340, 20
                  divu         t1, s5, a5
                  csrrwi       t2, 0x340, 10
                  c.sub        a1, a1
                  c.and        a1, a3
                  csrrci       zero, 0x340, 0
                  csrrsi       tp, 0x340, 9
                  xori         a5, s11, 1873
                  c.nop
                  sltu         zero, s7, s5
                  c.addi16sp   sp, 16
                  c.andi       a1, 31
                  c.andi       s0, 2
                  c.add        a0, t4
                  ori          a5, t0, -1438
                  div          a3, t6, s5
                  c.lui        t0, 27
                  sltiu        s6, t2, 776
                  xor          a3, tp, t0
                  auipc        ra, 890394
                  xor          t2, s5, t0
                  slti         t1, s3, -210
                  sll          s6, s5, s8
                  c.add        a7, tp
                  auipc        s4, 96403
                  c.addi       s8, -1
                  csrrc        s2, 0x340, a4
                  sub          t2, t1, s4
                  divu         s2, zero, a6
                  rem          a2, a0, s8
                  add          a7, a2, s3
                  csrrw        gp, 0x340, s7
                  slli         s8, s5, 22
                  addi         s2, a3, -1221
                  addi         s4, a5, -2046
                  c.mv         a2, a5
                  or           s7, t1, ra
                  c.nop
                  csrrc        t1, 0x340, zero
                  csrrc        a2, 0x340, zero
                  remu         a6, t5, a7
                  slt          a6, tp, t0
                  add          a3, sp, s4
                  c.or         a1, a5
                  c.lui        a3, 1
                  c.li         a5, -1
                  slt          s11, tp, a3
                  csrrs        a6, 0x340, zero
                  c.addi4spn   a3, sp, 464
                  sltiu        s1, a4, 1989
                  c.sub        a5, s0
                  c.srli       s0, 13
                  c.andi       a1, -1
                  c.add        t4, a5
                  c.lui        s6, 8
                  andi         a0, s5, -1165
                  slt          t0, s11, gp
                  remu         a5, t5, tp
                  c.or         a1, s1
                  c.sub        a5, a2
                  slli         sp, a3, 10
                  c.srli       s0, 4
                  divu         t4, t0, s3
                  csrrc        a2, 0x340, zero
                  c.sub        a0, a5
                  sub          s10, a4, s6
                  c.nop
                  csrrsi       a1, 0x340, 0
                  add          zero, s3, a1
                  csrrsi       s2, 0x340, 9
                  srl          a5, tp, sp
                  mul          s6, s11, sp
                  c.or         a4, s1
                  c.addi16sp   sp, -16
                  divu         a2, a2, a0
                  c.lui        ra, 26
                  slli         s11, t2, 23
                  xori         zero, s10, -1956
                  rem          gp, s6, s11
                  slt          gp, s1, s3
                  c.srai       a4, 12
                  sltiu        tp, zero, -1769
                  nop
                  xor          a6, s3, zero
                  auipc        a7, 900235
                  divu         t5, a5, s6
                  xor          a7, a7, a2
                  srai         s7, tp, 24
                  mulhsu       s6, s11, ra
                  c.slli       a5, 27
                  slti         sp, s5, 1029
                  csrrs        s0, 0x340, a6
                  div          a7, s8, a4
                  c.addi16sp   sp, 272
                  mulh         s1, s4, ra
                  divu         t2, s11, s2
                  mul          a1, t5, a7
                  mulhu        s0, gp, t0
                  c.mv         a2, a3
                  sub          t2, ra, s4
                  slt          zero, t5, ra
                  c.srai       a3, 13
                  c.and        s0, s1
                  sll          a1, t5, sp
                  slti         s2, sp, -1024
                  auipc        s0, 427370
                  c.or         a3, a1
                  mulh         t2, s11, t1
                  c.and        a3, s1
                  sll          s5, s2, s2
                  srli         zero, a4, 2
                  mul          a5, t6, s8
                  csrrci       s0, 0x340, 16
                  c.and        a4, a0
                  c.xor        a2, a5
                  xor          t5, a3, s5
                  c.and        a5, a2
                  sltiu        a6, t1, -467
                  srai         a5, t4, 27
                  c.addi       t5, -1
                  slli         s0, s5, 13
                  remu         t0, gp, s1
                  c.xor        a2, a2
                  c.andi       a3, -1
                  sltiu        sp, s6, -858
                  sltu         a6, t4, t0
                  c.slli       t0, 12
                  c.and        s1, s1
                  xori         t4, a6, -797
                  remu         gp, s4, s8
                  c.li         s4, 19
                  mulhsu       s4, s7, s3
                  c.andi       a4, -1
                  divu         a1, s2, s11
                  c.sub        a0, s0
                  auipc        ra, 28691
                  remu         t4, s2, s11
                  c.and        a2, a0
                  csrrw        a2, 0x340, s0
                  auipc        t1, 109591
                  srli         s5, t3, 17
                  c.addi4spn   a2, sp, 704
                  sltiu        s6, t1, 1527
                  sltu         s0, s10, a6
                  c.andi       a0, -1
                  nop
                  addi         gp, s10, 1493
                  add          t0, s2, s2
                  srai         t5, s0, 18
                  c.srai       a0, 11
                  mul          t4, a3, t6
                  c.srli       a5, 27
                  csrrci       gp, 0x340, 0
                  c.mv         s0, s1
                  sra          t0, zero, s8
                  c.xor        a4, a1
                  mulhu        t1, s3, zero
                  c.xor        a3, a0
                  c.or         a1, a4
                  c.andi       a4, 10
                  mulh         t0, s8, a3
                  srl          s7, a7, a6
                  sll          s1, a1, t0
                  mul          s5, sp, s5
                  csrrc        zero, 0x340, zero
                  csrrw        t1, 0x340, s11
                  c.and        a2, a5
                  ori          s4, zero, -353
                  div          sp, t2, s7
                  sub          s7, s1, zero
                  c.xor        a3, s0
                  slli         s0, sp, 13
                  c.add        a1, s8
                  csrrw        a0, 0x340, a1
                  c.srai       a2, 27
                  c.or         a0, s0
                  sltu         tp, s3, s7
                  lui          t2, 70285
                  c.srai       a5, 29
                  c.lui        s0, 1
                  csrrs        s5, 0x340, a7
                  xor          zero, t4, s8
                  c.andi       a3, -1
                  sll          a2, s9, s11
                  mulhsu       t5, t4, s9
                  c.nop
                  divu         s5, s6, s5
                  c.addi16sp   sp, -16
                  add          a0, s1, s5
                  nop
                  c.addi16sp   sp, 320
                  c.andi       s1, -1
                  c.nop
                  slti         tp, s3, 1368
                  sub          s4, t4, s10
                  mulhu        t4, s8, a5
                  sltu         t1, zero, s8
                  mulhu        zero, s6, zero
                  c.addi16sp   sp, 112
                  xor          a2, t0, t2
                  c.srai       a4, 11
                  csrrci       a4, 0x340, 30
                  csrrsi       t4, 0x340, 30
                  c.or         s1, a4
                  sltiu        a7, s1, -1961
                  div          ra, t6, t0
                  slti         s4, t1, 715
                  or           gp, tp, t6
                  remu         tp, sp, sp
                  c.nop
                  xori         a5, s10, 1042
                  andi         gp, a5, -1369
                  div          s1, a7, s1
                  c.sub        a3, a3
                  c.xor        a0, a5
                  divu         t4, s6, s2
                  c.lui        s10, 20
                  mulhsu       t0, s10, gp
                  csrrci       s1, 0x340, 0
                  auipc        s10, 98937
                  mulhsu       a2, zero, s4
                  csrrc        tp, 0x340, a0
                  c.addi4spn   a5, sp, 48
                  c.srli       a1, 31
                  addi         s2, s4, -1327
                  c.srli       a3, 10
                  andi         t1, t6, 1403
                  addi         a3, s5, 0
                  c.add        tp, s3
                  ori          s11, a7, 1768
                  csrrsi       s8, 0x340, 0
                  divu         s2, s0, gp
                  auipc        t4, 724699
                  c.or         a2, a0
                  sub          t4, s0, s4
                  xor          t5, tp, sp
                  c.srai       a4, 9
                  srli         gp, t6, 11
                  c.and        a4, s1
                  csrrci       s8, 0x340, 19
                  c.sub        a5, a5
                  csrrs        t2, 0x340, zero
                  or           a3, s10, s6
                  div          a7, s7, sp
                  c.xor        a0, a5
                  c.and        a1, s1
                  xori         zero, t4, -1320
                  sub          a6, t2, s2
                  c.or         s0, a5
                  slti         s0, sp, -1061
                  c.addi4spn   a4, sp, 608
                  c.nop
                  c.slli       s1, 11
                  c.add        t3, s2
                  sltiu        a1, s8, -1336
                  csrrwi       t1, 0x340, 10
                  mul          t2, a6, a3
                  c.and        a5, a5
                  c.lui        s4, 5
                  lui          s0, 701312
                  c.xor        s0, a0
                  c.slli       a7, 6
                  addi         s8, s6, -867
                  lui          t3, 855338
                  c.addi       t1, -1
                  c.addi16sp   sp, -16
                  c.addi       sp, -1
                  c.mv         a4, a1
                  sll          s4, s6, t2
                  lui          s4, 20452
                  csrrci       s4, 0x340, 13
                  sub          t2, s10, t1
                  ori          t2, s9, 2009
                  c.srai       s1, 11
                  auipc        s10, 691935
                  nop
                  mul          s7, a0, a4
                  divu         a5, a7, s2
                  c.addi       a6, -1
                  srli         t4, a5, 3
                  srli         a0, s1, 27
                  csrrs        t4, 0x340, s11
                  c.sub        a0, a1
                  slti         a0, t6, -1243
                  mulh         t1, t6, s7
                  ori          sp, a0, 635
                  c.addi16sp   sp, -16
                  c.or         a4, a3
                  csrrs        a7, 0x340, s5
                  c.addi       a6, 1
                  c.srai       s1, 19
                  sltiu        sp, s0, 687
                  xor          ra, t5, s0
                  or           ra, t1, s6
                  c.sub        s1, a5
                  auipc        a1, 379109
                  sra          s8, s1, a2
                  auipc        a0, 153369
                  c.or         a3, a5
                  csrrci       s2, 0x340, 0
                  and          s6, s8, s7
                  c.andi       a4, 20
                  c.addi4spn   a2, sp, 848
                  csrrwi       a3, 0x340, 15
                  slt          t0, s4, t5
                  c.srli       a4, 29
                  csrrwi       s2, 0x340, 11
                  mulhu        t0, a7, s11
                  mulh         t1, s4, sp
                  nop
                  csrrsi       s1, 0x340, 0
                  csrrwi       t5, 0x340, 0
                  c.li         a0, -1
                  xor          t3, a6, t4
                  div          s5, a7, t0
                  auipc        s4, 1024575
                  c.sub        s1, a2
                  remu         s11, t3, s9
                  andi         ra, s0, 1026
                  c.andi       s1, -1
                  csrrw        a2, 0x340, t5
                  xori         zero, s11, -827
                  c.addi4spn   s1, sp, 16
                  auipc        t5, 214607
                  c.srai       a4, 21
                  c.add        t2, s5
                  c.srli       a4, 5
                  csrrsi       t4, 0x340, 20
                  mulh         s0, s10, s7
                  add          a5, s2, t2
                  mulh         zero, t5, s5
                  slti         a3, t6, -1106
                  c.add        s10, sp
                  c.mv         s11, s4
                  srai         t5, a1, 26
                  c.addi4spn   a3, sp, 688
                  sll          sp, s2, s1
                  c.nop
                  csrrs        ra, 0x340, zero
                  mulhu        s0, t6, s2
                  rem          t1, ra, gp
                  mulh         s7, s1, gp
                  sltiu        t5, sp, -1947
                  csrrs        s2, 0x340, zero
                  slli         s1, a5, 25
                  c.slli       a1, 28
                  ori          s8, a6, 2038
                  add          zero, s4, s5
                  auipc        sp, 855548
                  ori          a2, t2, -1693
                  sltiu        a7, a6, -682
                  nop
                  c.addi       a1, -1
                  c.srli       s0, 14
                  csrrc        sp, 0x340, t6
                  c.li         t3, 26
                  csrrs        t4, 0x340, s0
                  srai         s6, s9, 31
                  rem          a4, sp, s4
                  mulhu        t1, a2, s8
                  andi         a7, s7, 1159
                  c.srli       s1, 28
                  csrrs        s7, 0x340, zero
                  addi         tp, s9, 300
                  slt          a4, s0, ra
                  c.or         s0, a1
                  mulh         s10, tp, s3
                  c.add        s6, s3
                  div          a4, ra, zero
                  lui          a5, 759046
                  c.andi       a5, -1
                  divu         s8, s11, t0
                  mulh         a2, gp, zero
                  div          s5, t5, t2
                  add          s1, a1, a5
                  auipc        gp, 356671
                  csrrw        s10, 0x340, s5
                  c.slli       s6, 14
                  c.mv         a3, a5
                  csrrc        s2, 0x340, s11
                  c.and        a5, s0
                  csrrc        s8, 0x340, s0
                  csrrw        sp, 0x340, s6
                  sltu         t1, a1, a3
                  nop
                  c.mv         t1, t6
                  slli         sp, s6, 4
                  slti         s4, s2, -1345
                  c.li         s8, -1
                  sltu         s2, s2, s2
                  remu         t1, s0, t2
                  c.xor        a2, s0
                  add          a2, s10, a3
                  slti         a3, t1, -617
                  c.or         a2, a2
                  c.li         s0, 17
                  csrrs        t1, 0x340, ra
                  srl          tp, t1, t3
                  andi         t3, t1, -272
                  c.lui        tp, 4
                  c.and        s0, a0
                  c.addi       s8, -1
                  c.nop
                  c.andi       a2, -1
                  csrrs        s7, 0x340, s7
                  mulhsu       a4, a4, s7
                  csrrci       a0, 0x340, 9
                  mulhu        a6, s1, s7
                  srl          zero, s9, s6
                  c.andi       a3, 31
                  c.andi       a1, -1
                  c.srli       a0, 17
                  srl          a4, t1, s6
                  slti         s5, t2, 794
                  slti         ra, tp, 1208
                  sub          t1, a2, s10
                  csrrwi       s0, 0x340, 2
                  csrrs        t3, 0x340, t0
                  slli         s5, sp, 8
                  lui          tp, 849855
                  addi         gp, tp, -1129
                  c.addi16sp   sp, 464
                  srli         t5, t4, 24
                  csrrsi       ra, 0x340, 19
                  and          s8, a4, s3
                  srai         t1, s0, 1
                  rem          a3, s6, a1
                  c.addi       a0, 18
                  c.lui        s6, 7
                  mulhu        sp, a5, zero
                  nop
                  lui          t1, 484391
                  csrrci       t3, 0x340, 22
                  srai         s6, s10, 28
                  c.addi16sp   sp, -16
                  c.andi       a2, 17
                  csrrci       s7, 0x340, 18
                  csrrc        a2, 0x340, a1
                  c.or         a3, s1
                  divu         a7, s8, s9
                  addi         t0, s8, -238
                  c.addi4spn   a3, sp, 448
                  csrrc        a7, 0x340, s11
                  mulhu        zero, s0, a4
                  div          a2, a6, a4
                  andi         s5, t4, 573
                  andi         a4, s10, -811
                  divu         s1, s8, t5
                  c.add        a6, a0
                  c.add        t0, s1
                  slt          s10, s9, a6
                  srai         a4, s10, 23
                  nop
                  c.slli       t5, 31
                  c.add        a4, s6
                  ori          a4, t2, -1360
                  nop
                  nop
                  auipc        s1, 335274
                  c.xor        a0, a3
                  slti         s8, s5, 1715
                  slt          tp, s7, ra
                  lui          gp, 116510
                  andi         s1, a6, -1003
                  c.nop
                  c.sub        a2, s1
                  nop
                  nop
                  c.mv         a6, a1
                  rem          s11, t6, s11
                  csrrs        s7, 0x340, a3
                  csrrci       s10, 0x340, 0
                  csrrc        s1, 0x340, zero
                  slli         tp, s10, 16
                  slli         a6, t5, 14
                  csrrc        s0, 0x340, a6
                  c.or         a0, a3
                  sub          s4, ra, t4
                  csrrw        ra, 0x340, gp
                  c.and        a1, a3
                  c.or         a4, a1
                  lui          a5, 253181
                  ori          ra, s7, -241
                  c.mv         t1, a4
                  addi         s10, a2, -289
                  c.addi16sp   sp, 32
                  c.andi       a3, 13
                  mulhsu       a1, s3, sp
                  sltu         a4, t3, t0
                  c.andi       a1, 14
                  srl          zero, ra, a1
                  remu         s8, tp, sp
                  csrrc        ra, 0x340, zero
                  divu         t0, s9, t3
                  mulhu        sp, s10, t4
                  sra          s10, a2, a4
                  slti         a1, s6, -1742
                  nop
                  c.add        t4, t6
                  sra          s1, t0, t1
                  c.sub        a0, a0
                  mulhu        a4, a6, a6
                  c.addi4spn   a4, sp, 960
                  add          t4, s2, t1
                  slt          s10, t4, s9
                  sll          t1, a0, t2
                  c.addi4spn   a0, sp, 784
                  csrrsi       a4, 0x340, 2
                  c.or         a5, a3
                  or           t3, t1, zero
                  xor          a1, a3, t5
                  srl          s4, t1, s0
                  c.srli       s1, 17
                  xori         gp, s4, 1619
                  c.slli       a4, 11
                  c.or         a5, a0
                  c.lui        t3, 13
                  srl          a4, s7, sp
                  srli         s11, a7, 2
                  mul          s7, s1, s4
                  rem          a7, a0, t5
                  lui          a2, 977664
                  c.lui        t2, 31
                  c.mv         s10, tp
                  rem          s1, a7, s6
                  c.and        a4, s1
                  or           tp, t3, s4
                  andi         tp, t3, -36
                  csrrwi       ra, 0x340, 21
                  or           t3, s7, t0
                  addi         s11, a1, -792
                  auipc        s1, 42291
                  csrrs        sp, 0x340, a5
                  c.and        a0, a1
                  c.andi       a4, -1
                  sltu         s5, sp, t5
                  slli         t1, t0, 8
                  c.srli       a0, 29
                  c.add        sp, sp
                  c.nop
                  c.nop
                  c.nop
                  add          a4, a4, s1
                  div          a6, t2, a4
                  c.slli       s10, 10
                  mulhsu       a0, s1, ra
                  c.srai       s0, 17
                  srl          s1, tp, s7
                  and          a5, ra, t4
                  xor          s8, s7, t6
                  c.srli       a3, 5
                  c.mv         t3, a0
                  andi         s11, a5, -85
                  c.srai       a0, 20
                  srai         ra, s2, 6
                  mulh         a5, a3, t6
                  and          t1, s8, t1
                  divu         t0, a5, t3
                  c.or         a3, a1
                  mulh         gp, s10, a4
                  c.and        s1, s0
                  slt          s11, sp, t2
                  csrrsi       s6, 0x340, 2
                  xor          a5, s11, t0
                  lui          s7, 836278
                  xor          a2, t2, s10
                  lui          s5, 993675
                  sll          a7, gp, gp
                  c.addi       s10, 5
                  csrrc        t2, 0x340, t5
                  sltu         a1, t5, s3
                  c.sub        a4, a4
                  c.nop
                  c.sub        s0, a1
                  c.addi16sp   sp, 128
                  mulhu        gp, a1, s6
                  xori         a3, s8, 30
                  c.srli       s1, 11
                  c.lui        t4, 14
                  c.sub        a3, s0
                  slli         gp, a1, 31
                  csrrci       a3, 0x340, 0
                  divu         s8, s1, s6
                  c.srai       a5, 16
                  slt          s7, a7, s9
                  slli         s4, s1, 20
                  sltiu        zero, a2, 1755
                  auipc        a5, 119325
                  nop
                  c.or         a2, a1
                  sltu         t1, s10, a1
                  csrrsi       gp, 0x340, 4
                  mulhsu       s1, t2, sp
                  sltiu        a5, s5, 1933
                  slti         t1, gp, 1497
                  c.lui        t1, 7
                  remu         sp, s1, s6
                  sltu         a5, t1, a2
                  xor          tp, ra, t6
                  andi         gp, s2, 1389
                  remu         a4, t0, s9
                  c.and        a0, a5
                  srai         s6, s2, 6
                  c.addi4spn   a2, sp, 736
                  c.or         a3, a1
                  sltiu        s10, a1, -1750
                  c.addi       a6, 7
                  and          tp, t2, a7
                  and          s10, s2, ra
                  mulhsu       s8, a1, s11
                  divu         a0, s7, a3
                  and          a5, s4, a2
                  srai         a6, s4, 5
                  slt          t3, a3, a1
                  sltiu        s0, t0, 1263
                  nop
                  csrrs        t4, 0x340, gp
                  srl          t1, s7, tp
                  c.srli       s1, 29
                  csrrw        sp, 0x340, a7
                  rem          a3, a7, a1
                  sll          s0, t2, a1
                  csrrsi       t2, 0x340, 0
                  csrrsi       t1, 0x340, 15
                  mulhsu       t3, s3, t1
                  xor          a6, t1, t1
                  remu         s2, s10, s8
                  c.lui        s11, 4
                  addi         ra, a3, 1478
                  c.lui        a3, 21
                  mul          s2, tp, gp
                  xori         s0, t5, -1388
                  mulhu        a2, a3, t0
                  slt          a4, a7, s4
                  rem          s7, s4, s0
                  remu         s10, s3, a1
                  ori          zero, a3, -819
                  csrrsi       t1, 0x340, 0
                  c.srli       s0, 8
                  mulhsu       t4, ra, s4
                  auipc        zero, 594348
                  nop
                  sub          s11, t2, t4
                  c.li         s7, -1
                  c.add        s11, t2
                  or           a5, s5, t6
                  c.addi4spn   a1, sp, 992
                  mulhsu       a3, s9, s1
                  div          s11, a1, s10
                  c.nop
                  c.andi       a4, 13
                  csrrs        tp, 0x340, t3
                  sub          s11, s6, s2
                  c.nop
                  xor          a0, ra, gp
                  srli         t1, a1, 31
                  c.addi16sp   sp, 48
                  slti         s10, zero, -699
                  c.slli       s8, 28
                  c.addi4spn   s0, sp, 528
                  c.addi4spn   s1, sp, 496
                  c.nop
                  mulhsu       a4, s1, a7
                  slti         gp, t0, -141
                  c.andi       a0, -1
                  c.add        a7, s7
                  csrrs        gp, 0x340, zero
                  slti         s1, s7, 583
                  xor          s4, a4, a5
                  c.addi16sp   sp, -16
                  c.nop
                  c.add        ra, s7
                  c.mv         a7, s2
                  slti         sp, a7, 120
                  sltiu        s1, gp, -1736
                  and          s11, t3, a5
                  andi         s4, s1, -31
                  sltu         s2, s6, zero
                  c.mv         s11, a3
                  c.nop
                  csrrsi       t1, 0x340, 11
                  c.srai       s1, 5
                  c.addi16sp   sp, -16
                  slt          a1, a2, t0
                  mul          a6, s6, a4
                  xori         a3, t4, -565
                  nop
                  nop
                  auipc        a7, 173468
                  div          s1, a3, zero
                  add          s11, a4, t0
                  or           s0, s11, a4
                  c.li         a1, 12
                  sll          s4, s3, s0
                  c.addi16sp   sp, -16
                  rem          a1, s8, tp
                  div          t2, t3, t6
                  slt          s6, s5, gp
                  csrrci       s11, 0x340, 23
                  c.andi       a5, 0
                  auipc        tp, 74530
                  xor          s7, sp, gp
                  lui          s7, 662235
                  c.slli       a1, 31
                  auipc        s8, 313228
                  divu         t2, s6, s9
                  andi         s7, s3, -123
                  mulhu        t1, s8, s7
                  mul          tp, ra, t2
                  c.andi       s1, -1
                  c.sub        a0, a3
                  sltiu        a1, s0, -222
                  c.add        t5, ra
                  c.slli       a0, 6
                  sll          a7, ra, s3
                  mulhsu       a6, t2, sp
                  remu         a2, a4, s9
                  sra          a3, s0, s6
                  nop
                  andi         a5, s7, 557
                  c.xor        a3, s0
                  c.addi       a4, -1
                  ori          s8, s6, 1930
                  div          s1, s4, s1
                  mulh         a5, s11, a1
                  slt          a4, sp, t6
                  mul          t2, s6, a2
                  csrrsi       a5, 0x340, 14
                  c.srli       s0, 11
                  andi         ra, gp, -796
                  c.add        gp, t6
                  slt          a1, gp, a3
                  andi         s1, t5, 1022
                  c.addi       sp, 10
                  lui          s0, 388821
                  srl          t0, s3, t1
                  c.xor        a2, s0
                  auipc        a0, 288476
                  c.add        t1, s5
                  c.srli       a5, 30
                  c.nop
                  csrrc        t1, 0x340, s4
                  c.slli       a7, 4
                  c.nop
                  and          s8, tp, sp
                  c.xor        s1, a3
                  nop
                  c.addi       s5, -1
                  c.addi       a0, -1
                  csrrc        s10, 0x340, zero
                  csrrci       t5, 0x340, 0
                  c.addi4spn   s0, sp, 560
                  c.li         a3, 27
                  ori          s8, s4, -998
                  c.or         a5, s0
                  xor          s10, ra, s5
                  sll          t5, s2, a6
                  c.nop
                  csrrw        s0, 0x340, t3
                  div          sp, s3, s11
                  srl          t1, a0, a6
                  mul          s5, s8, t6
                  c.nop
                  mulh         a4, ra, a3
                  add          s7, ra, t2
                  sltu         t3, a6, s10
                  remu         sp, a6, s8
                  c.or         a1, a4
                  srai         a6, s8, 20
                  c.lui        ra, 10
                  c.and        s0, s0
                  mulhsu       a4, s7, t4
                  and          t2, s10, zero
                  div          s1, a7, s4
                  c.lui        a5, 22
                  c.xor        a2, a5
                  c.nop
                  sltiu        s10, a1, 148
                  auipc        s2, 637983
                  c.sub        a5, a3
                  slli         a6, s0, 26
                  csrrs        a7, 0x340, zero
                  nop
                  add          s1, s1, a5
                  addi         a4, s3, 698
                  c.and        a2, s0
                  c.srai       a0, 9
                  c.addi       ra, -1
                  divu         a5, zero, s6
                  c.srli       a2, 11
                  c.addi4spn   a4, sp, 240
                  xori         a6, s4, 1965
                  c.li         t2, -1
                  xor          tp, s0, s1
                  sll          a2, s5, t0
                  csrrci       sp, 0x340, 0
                  xor          s7, s8, s7
                  lui          s2, 461582
                  andi         a2, sp, 733
                  rem          t2, s8, s7
                  c.mv         t2, t0
                  c.nop
                  mul          t3, a2, t4
                  c.li         t2, 6
                  c.mv         t0, a7
                  c.slli       sp, 21
                  rem          s8, tp, t0
                  sra          t2, tp, t3
                  csrrc        s5, 0x340, zero
                  div          a4, ra, a0
                  c.add        t1, s4
                  c.add        a6, a4
                  csrrw        s8, 0x340, gp
                  csrrs        s2, 0x340, a0
                  xori         sp, s1, 1219
                  csrrsi       a3, 0x340, 0
                  c.lui        s5, 2
                  csrrw        a3, 0x340, s7
                  csrrs        a6, 0x340, zero
                  mulhsu       a7, s8, s7
                  c.addi16sp   sp, 48
                  mul          a5, a3, zero
                  mulh         a2, s7, a6
                  rem          s10, t5, s5
                  c.srai       a1, 13
                  csrrwi       ra, 0x340, 27
                  mulh         a5, t5, s11
                  c.sub        s1, s1
                  mulhu        s1, a6, t6
                  andi         a5, s4, 1860
                  c.li         s1, 24
                  lui          s1, 872004
                  c.addi4spn   a1, sp, 528
                  c.addi4spn   s1, sp, 624
                  div          ra, s10, s0
                  csrrs        tp, 0x340, zero
                  mul          a2, s11, gp
                  c.sub        a4, a0
                  slti         s6, s10, 842
                  sra          zero, a1, t1
                  mulhsu       a0, a1, a6
                  mulhsu       a3, t6, s4
                  c.andi       a0, -1
                  c.addi       t4, -1
                  divu         a0, tp, a6
                  c.srli       s1, 22
                  csrrs        gp, 0x340, s1
                  ori          tp, t2, 26
                  sll          s1, s7, t5
                  mulhsu       zero, s10, sp
                  srli         s6, a1, 10
                  c.mv         s0, a7
                  csrrci       s6, 0x340, 19
                  c.sub        a5, a3
                  mul          s5, a3, a2
                  mulhsu       a3, t0, s7
                  c.srli       a2, 11
                  ori          t4, a5, -830
                  srli         t2, s3, 11
                  csrrsi       a7, 0x340, 0
                  srl          a4, s6, s7
                  auipc        a3, 1010715
                  c.xor        a2, s1
                  mulhu        t4, s8, s0
                  c.sub        a5, a4
                  slli         s4, s7, 28
                  c.nop
                  rem          s0, a4, a0
                  slt          t2, s4, a7
                  mulhu        s1, t2, a2
                  c.addi16sp   sp, 416
                  c.xor        a3, a4
                  nop
                  slt          a1, a5, gp
                  xori         t2, a0, -335
                  addi         t5, s1, -1147
                  and          s10, gp, t2
                  c.or         a3, a1
                  auipc        t0, 692290
                  lui          t0, 848061
                  xori         gp, a2, 564
                  slt          a1, s11, a4
                  slli         t3, a5, 23
                  or           a2, t6, zero
                  c.andi       a4, -1
                  csrrw        s0, 0x340, ra
                  xor          s7, t4, a4
                  c.or         s0, a3
                  remu         sp, t2, a3
                  c.addi       gp, 6
                  add          s4, s11, a5
                  andi         a0, sp, -1152
                  c.srli       a2, 27
                  slli         s6, a7, 2
                  c.mv         t4, a6
                  slli         t0, s10, 28
                  c.and        a4, s0
                  csrrci       t1, 0x340, 0
                  csrrs        a0, 0x340, zero
                  mulhsu       a6, s4, a6
                  csrrci       zero, 0x340, 0
                  srli         s7, s3, 18
                  slti         s2, t1, 1482
                  and          a0, s8, s10
                  mulhu        t4, s11, s2
                  c.nop
                  csrrsi       s4, 0x340, 10
                  div          s2, a1, sp
                  srl          sp, t3, a7
                  c.sub        a5, a5
                  c.li         t2, 26
                  c.addi       s6, -1
                  c.add        s6, a4
                  and          t1, t5, s5
                  c.or         s1, a1
                  c.srli       s1, 24
                  div          t4, s6, t2
                  xori         a0, s10, -52
                  csrrsi       s2, 0x340, 0
                  auipc        ra, 914351
                  srl          s8, t6, t6
                  c.add        t4, s5
                  andi         a6, t3, -955
                  add          s8, s9, a4
                  addi         sp, s9, -350
                  csrrwi       s11, 0x340, 18
                  mulhsu       s5, t6, t1
                  sll          a7, s9, t3
                  slti         s11, t1, -393
                  addi         a5, t4, -1832
                  andi         t3, s4, -1275
                  sll          tp, t2, ra
                  c.srai       a4, 24
                  c.nop
                  c.and        a5, a1
                  c.andi       s0, 31
                  slli         a3, s1, 26
                  mulhu        s4, tp, t2
                  mulhu        s0, s10, t1
                  c.li         s11, -1
                  add          a1, a2, a6
                  div          t3, a4, a4
                  c.slli       a5, 3
                  c.add        s0, s0
                  c.and        a2, a0
                  c.addi4spn   s1, sp, 976
                  and          t3, a0, a2
                  auipc        a7, 848188
                  andi         t3, t1, -1343
                  ori          t2, sp, 1663
                  andi         s4, s11, -1642
                  csrrwi       a7, 0x340, 22
                  divu         a0, s4, ra
                  csrrsi       t4, 0x340, 0
                  csrrsi       sp, 0x340, 0
                  c.li         t2, -1
                  c.xor        a3, a2
                  addi         a2, t6, -653
                  c.sub        a0, s1
                  c.or         s0, a3
                  divu         s0, tp, s8
                  or           a4, s11, t4
                  slti         s1, s9, -1080
                  addi         a6, s1, 1638
                  auipc        t0, 954613
                  c.srli       a5, 3
                  nop
                  nop
                  mulhsu       s6, gp, s9
                  xor          t4, ra, t4
                  c.mv         s2, a0
                  mulhsu       s5, s10, tp
                  sub          a3, s1, a1
                  c.mv         s4, s4
                  c.slli       s1, 20
                  c.slli       a5, 29
                  xori         s1, s3, 1593
                  c.andi       a3, 16
                  csrrsi       a1, 0x340, 0
                  c.addi16sp   sp, 240
                  c.addi       t0, -1
                  divu         a2, s6, s4
                  csrrwi       a0, 0x340, 14
                  divu         ra, a0, a7
                  sll          a3, t1, s2
                  mulhu        a5, tp, s6
                  c.addi4spn   a2, sp, 400
                  sra          ra, s11, t3
                  slli         a5, a1, 11
                  c.or         a0, a2
                  c.addi4spn   a2, sp, 304
                  slli         s0, t4, 1
                  slt          t2, s5, a2
                  rem          t2, t2, a6
                  slt          s10, s10, t3
                  auipc        gp, 499209
                  c.andi       s0, -1
                  sub          s10, s1, a6
                  rem          a6, s11, a3
                  mul          a6, a5, s9
                  andi         s11, s7, 736
                  and          t3, s2, a2
                  divu         s1, a7, t0
                  xor          tp, t3, zero
                  sltiu        s4, zero, -96
                  sra          s7, s8, s3
                  mulh         a1, s0, a1
                  divu         a6, t1, t3
                  c.li         s2, -1
                  csrrwi       a7, 0x340, 19
                  csrrci       t3, 0x340, 0
                  mulhsu       s2, a0, a0
                  csrrsi       s2, 0x340, 2
                  csrrw        s1, 0x340, t5
                  slli         a4, a2, 22
                  sll          gp, zero, a0
                  csrrs        a4, 0x340, zero
                  c.addi       sp, 16
                  c.srai       a5, 22
                  addi         sp, a0, -320
                  c.addi16sp   sp, -16
                  c.srai       a2, 9
                  c.sub        s1, s1
                  divu         s5, s3, s3
                  mulhsu       a6, s4, s0
                  c.srai       s0, 5
                  lui          t1, 808441
                  mul          t3, s8, t0
                  mul          a4, ra, s5
                  divu         t4, t0, t0
                  slli         tp, tp, 15
                  c.add        a7, t4
                  sltu         s11, zero, a4
                  c.nop
                  csrrwi       t4, 0x340, 22
                  csrrc        s11, 0x340, s6
                  addi         t0, s4, 1676
                  c.srai       a0, 5
                  srai         t3, a7, 14
                  add          a1, gp, a5
                  c.xor        a5, a1
                  xori         s4, s2, 671
                  c.nop
                  srli         t4, s6, 9
                  slt          t1, t5, t0
                  c.or         a2, s0
                  divu         s10, t6, sp
                  slt          a4, a4, t2
                  slli         a4, s5, 24
                  csrrw        s8, 0x340, a5
                  auipc        s5, 949669
                  lui          s4, 350996
                  nop
                  ori          ra, s11, -1844
                  c.addi4spn   a3, sp, 912
                  c.sub        a3, s0
                  div          a5, s2, a5
                  c.and        s1, a3
                  lui          a5, 113719
                  div          s2, s10, s5
                  div          s8, a4, t0
                  c.li         s2, -1
                  csrrsi       sp, 0x340, 10
                  c.or         a2, a1
                  c.li         a1, -1
                  remu         s5, a1, a3
                  ori          ra, a4, 1050
                  xor          s5, t1, s5
                  c.srai       a5, 15
                  xor          t3, s7, s3
                  srli         t1, s6, 28
                  sltu         s7, s0, t3
                  c.mv         t2, s7
                  mul          sp, t2, t1
                  csrrwi       ra, 0x340, 5
                  andi         a2, t5, 2001
                  csrrci       s1, 0x340, 3
                  mulh         s4, t0, a7
                  sltiu        a5, t3, -1749
                  rem          s6, s10, t4
                  csrrw        t2, 0x340, s9
                  divu         s0, ra, s7
                  andi         s7, a6, -506
                  csrrw        tp, 0x340, gp
                  c.or         a2, a4
                  add          a6, gp, tp
                  csrrc        s6, 0x340, zero
                  addi         zero, tp, -451
                  c.xor        a2, s1
                  c.slli       t1, 6
                  c.addi       t2, -1
                  slli         a3, tp, 11
                  c.nop
                  nop
                  c.addi       tp, 9
                  xori         t2, s2, -1432
                  xori         a1, a1, -1213
                  or           t5, ra, t4
                  slti         s4, t2, 1425
                  xori         a1, a5, 544
                  c.addi16sp   sp, -16
                  slli         a2, a1, 31
                  sltu         sp, a4, a5
                  mulhsu       sp, sp, s2
                  c.li         s8, -1
                  srli         s7, gp, 31
                  srli         ra, s5, 26
                  div          t0, s10, s5
                  c.add        s6, a0
                  c.li         s10, 26
                  mul          a3, a4, s10
                  div          a7, t2, a1
                  csrrs        s8, 0x340, zero
                  andi         s1, t3, 1382
                  rem          s1, t5, a4
                  add          sp, a7, zero
                  xor          zero, a1, a7
                  c.srai       a3, 10
                  sltu         a5, t4, s4
                  ori          s6, a6, 37
                  c.addi4spn   a4, sp, 400
                  and          a1, tp, s1
                  andi         sp, sp, 571
                  mul          a3, a6, tp
                  mulhu        s11, a3, a3
                  csrrc        s10, 0x340, zero
                  srai         a2, t5, 19
                  sltiu        gp, a3, -366
                  csrrsi       a2, 0x340, 8
                  nop
                  mulhu        t3, tp, a3
                  csrrwi       a6, 0x340, 16
                  sra          s0, s4, ra
                  mul          s7, a0, a4
                  csrrw        a1, 0x340, tp
                  sltu         ra, zero, s7
                  lui          a5, 141726
                  xor          t3, s2, zero
                  c.xor        s1, a5
                  csrrw        s10, 0x340, a6
                  sltu         s0, zero, a7
                  and          a0, s1, tp
                  c.or         a1, s0
                  c.srli       a5, 15
                  c.xor        a5, a1
                  srl          t1, a6, s10
                  xor          zero, t4, t5
                  sltiu        ra, s7, -318
                  c.sub        a2, a3
                  c.lui        a2, 31
                  div          zero, s2, s1
                  sra          a0, a6, a4
                  srl          a0, a3, s11
                  csrrc        s6, 0x340, s7
                  xori         s10, t5, 334
                  c.srai       a0, 6
                  or           a4, ra, s6
                  divu         t0, tp, t3
                  xor          a5, a7, sp
                  slt          a7, t0, a4
                  c.lui        s4, 1
                  csrrsi       a3, 0x340, 26
                  slti         sp, s2, -105
                  addi         sp, a2, 320
                  sltiu        s5, gp, 365
                  c.li         s11, -1
                  xor          s0, a7, t4
                  xor          s8, t2, tp
                  add          s0, s8, sp
                  slli         s4, a0, 31
                  sub          s5, a7, s9
                  rem          a2, s6, s4
                  c.add        a4, a1
                  c.lui        t0, 8
                  sra          s11, a7, s2
                  csrrw        s4, 0x340, s2
                  c.and        a0, a2
                  ori          t5, t5, 1775
                  c.and        a2, a1
                  c.addi4spn   a0, sp, 912
                  csrrwi       t5, 0x340, 29
                  c.srli       a0, 1
                  c.slli       a1, 20
                  mulhsu       s2, s4, s7
                  c.lui        t3, 20
                  c.li         s6, 1
                  srli         sp, t2, 6
                  c.addi       s5, -1
                  c.addi16sp   sp, 96
                  c.lui        a4, 16
                  xori         s4, a3, -388
                  remu         t2, tp, s3
                  c.srai       a3, 28
                  srli         t0, t0, 15
                  csrrwi       a0, 0x340, 7
                  rem          s1, a6, sp
                  mul          t2, a6, t2
                  nop
                  rem          a1, a2, a7
                  slti         tp, s3, 224
                  srli         a6, s2, 16
                  csrrsi       t2, 0x340, 0
                  slli         a1, a5, 20
                  rem          a5, sp, a2
                  slt          gp, s8, t0
                  csrrwi       a0, 0x340, 14
                  c.andi       a1, -1
                  xori         t3, t5, 1221
                  srli         a5, t5, 3
                  sltiu        a5, s4, 131
                  c.srli       a5, 30
                  mulh         tp, s0, zero
                  c.add        tp, s5
                  mul          a5, s9, a3
                  csrrw        a2, 0x340, s11
                  andi         a6, t6, 1843
                  csrrsi       a5, 0x340, 5
                  sll          a7, a7, s8
                  c.addi4spn   s1, sp, 560
                  csrrw        a5, 0x340, s3
                  csrrwi       s5, 0x340, 17
                  c.or         a5, a5
                  c.mv         a4, t1
                  c.mv         a4, s9
                  c.sub        a1, a2
                  mulh         a0, a6, s6
                  or           s8, s5, a2
                  csrrwi       s2, 0x340, 26
                  sub          a0, s7, a2
                  and          a6, s1, t5
                  remu         ra, s4, ra
                  srli         s10, a6, 19
                  ori          t5, s6, -1899
                  add          t1, t3, t0
                  auipc        a1, 529577
                  c.srli       a5, 25
                  sltu         a7, a3, gp
                  c.add        s11, t1
                  c.slli       t1, 4
                  c.and        a3, s0
                  andi         s2, s10, 1482
                  nop
                  c.srli       s1, 26
                  c.addi16sp   sp, -16
                  mul          t2, a3, a6
                  srai         a1, gp, 14
                  sra          gp, s0, t5
                  c.nop
                  c.lui        s0, 29
                  slt          a1, a1, zero
                  xor          tp, ra, s8
                  csrrc        a7, 0x340, zero
                  c.addi16sp   sp, -16
                  c.addi       t4, -1
                  add          s10, s5, sp
                  csrrsi       a1, 0x340, 8
                  sra          t3, a4, t4
                  c.li         s5, 25
                  sltiu        t3, s11, -890
                  auipc        t0, 85438
                  c.lui        s10, 8
                  slli         t4, ra, 11
                  slt          tp, s0, a6
                  sltiu        a2, zero, -1442
                  slti         t5, a2, 290
                  srli         t5, s3, 14
                  csrrci       gp, 0x340, 8
                  mulh         a7, a0, s3
                  c.li         a1, 29
                  c.add        t1, t5
                  c.li         sp, -1
                  mul          gp, a0, gp
                  rem          s4, a0, a5
                  c.slli       s6, 22
                  c.mv         ra, ra
                  xor          a4, s0, a6
                  divu         s8, sp, s10
                  rem          s5, a5, ra
                  c.addi16sp   sp, 336
                  c.add        s6, s5
                  c.andi       a2, -1
                  divu         s8, s3, t0
                  c.mv         a6, s10
                  mul          t0, zero, a0
                  c.sub        a3, s0
                  add          gp, s8, s6
                  c.lui        gp, 3
                  csrrci       s5, 0x340, 4
                  sub          sp, zero, t2
                  ori          s6, s5, -682
                  c.srai       a1, 22
                  mulhsu       s4, a4, t0
                  c.addi16sp   sp, 160
                  c.and        a3, s0
                  csrrc        s4, 0x340, a7
                  csrrwi       t1, 0x340, 17
                  divu         s7, t4, t1
                  csrrc        s0, 0x340, s4
                  slti         t2, s4, -811
                  sltu         a7, a7, gp
                  slt          t0, a2, gp
                  add          ra, a6, t6
                  div          s11, a1, s9
                  c.srli       a5, 2
                  srl          ra, tp, s5
                  srli         t1, t6, 22
                  csrrci       a6, 0x340, 0
                  csrrci       tp, 0x340, 28
                  or           s5, t1, s2
                  csrrw        s2, 0x340, t6
                  sltiu        a7, s2, -97
                  c.add        a2, s10
                  c.mv         a6, a4
                  c.li         s0, 19
                  slti         s11, a3, -1437
                  c.srli       a1, 21
                  srli         t5, zero, 5
                  c.li         s5, -1
                  c.or         a5, a3
                  c.and        s1, a0
                  csrrs        s6, 0x340, t1
                  ori          a5, a2, -1809
                  c.and        a2, a2
                  nop
                  div          a0, s9, s0
                  csrrs        zero, 0x340, a2
                  remu         s6, zero, s0
                  sll          tp, t5, s1
                  c.addi4spn   a4, sp, 288
                  ori          s10, s7, 1125
                  c.addi4spn   a2, sp, 160
                  c.srai       a0, 3
                  c.or         a3, a5
                  remu         sp, t4, s1
                  c.andi       a1, -1
                  sltiu        s4, t6, 1853
                  slt          s1, gp, t3
                  div          tp, s4, sp
                  srli         a7, ra, 16
                  ori          s11, s11, -1788
                  c.lui        s1, 5
                  addi         a4, sp, -1672
                  csrrw        t3, 0x340, t5
                  c.mv         a6, s10
                  and          s8, t6, s6
                  c.srai       a3, 10
                  srli         s11, t4, 11
                  sll          s1, t1, ra
                  csrrwi       a0, 0x340, 4
                  srai         gp, tp, 11
                  mul          s1, gp, s10
                  c.addi16sp   sp, 96
                  rem          a2, ra, s7
                  divu         s5, s3, t1
                  c.mv         s0, t2
                  ori          s2, t2, -1830
                  c.add        a7, a7
                  srai         t5, a5, 17
                  sll          gp, s6, a6
                  c.nop
                  mulhu        s5, a2, t2
                  csrrsi       t4, 0x340, 25
                  mulhsu       a5, zero, s5
                  c.xor        a3, a4
                  c.or         a2, a5
                  add          s0, t0, t5
                  csrrci       a6, 0x340, 0
                  sub          s2, s4, s10
                  rem          s4, a4, ra
                  div          a7, s11, s1
                  c.andi       a1, -1
                  c.xor        a5, a2
                  and          s1, t2, s3
                  srai         s8, s11, 10
                  sltiu        t2, a6, -764
                  c.srai       a2, 25
                  ori          a2, gp, 216
                  c.or         a1, a1
                  mulhsu       s0, sp, t0
                  c.slli       s2, 25
                  c.or         a1, s1
                  sub          a6, s8, s2
                  ori          t4, s7, 460
                  c.lui        a2, 25
                  c.li         s7, -1
                  c.lui        s4, 3
                  c.li         a3, 12
                  c.andi       a5, -1
                  add          a7, s7, a0
                  rem          s0, ra, t0
                  csrrw        s10, 0x340, s4
                  slli         a3, zero, 5
                  c.lui        a7, 3
                  c.lui        s7, 3
                  c.addi4spn   a3, sp, 112
                  slti         tp, t3, 25
                  slt          s5, s9, a7
                  slli         s5, s11, 29
                  c.lui        t2, 16
                  c.addi       s6, 8
                  csrrc        s0, 0x340, zero
                  c.addi16sp   sp, -16
                  sub          a6, s5, sp
                  xori         a2, t0, -259
                  ori          s6, t4, 1525
                  remu         t3, s4, s2
                  xor          tp, s10, a7
                  c.addi16sp   sp, 128
                  csrrc        s10, 0x340, zero
                  c.addi16sp   sp, -16
                  slt          s2, a0, t5
                  divu         a2, a6, t4
                  c.nop
                  csrrw        s8, 0x340, s2
                  c.slli       s6, 30
                  slti         a6, s3, 688
                  mulhsu       s8, s3, s11
                  sll          s6, t1, a0
                  csrrc        t1, 0x340, zero
                  csrrc        s10, 0x340, zero
                  div          s2, a1, zero
                  mulhu        a6, s6, s10
                  c.and        a1, a1
                  csrrs        s8, 0x340, zero
                  xor          s4, t1, s3
                  divu         s10, t2, s5
                  mulhsu       a1, a4, t0
                  lui          t3, 1003091
                  c.sub        a1, a5
                  c.or         a3, a2
                  c.addi       s5, -1
                  divu         zero, a0, t1
                  c.srli       a5, 4
                  slt          s5, a1, a7
                  c.mv         t0, s9
                  csrrci       gp, 0x340, 16
                  slt          a3, s11, s9
                  sltiu        s7, tp, -1240
                  c.srli       a3, 25
                  c.srli       a0, 19
                  csrrsi       a1, 0x340, 0
                  ori          t5, a3, -1366
                  slt          s2, a3, t5
                  c.addi       s1, -1
                  c.addi16sp   sp, -16
                  csrrs        s4, 0x340, t0
                  mulh         s0, a0, s11
                  c.sub        a2, s1
                  andi         s7, s10, -1881
                  c.mv         a6, t1
                  slt          a1, sp, s5
                  csrrci       a5, 0x340, 28
                  rem          a6, t5, a0
                  auipc        s1, 798267
                  andi         ra, t6, -92
                  csrrc        t5, 0x340, zero
                  mulh         s11, s8, s6
                  add          a5, s9, s11
                  or           s10, t4, t0
                  csrrwi       tp, 0x340, 12
                  c.lui        a3, 5
                  slli         zero, tp, 16
                  add          s6, s11, zero
                  c.slli       t3, 16
                  c.li         sp, 16
                  c.lui        a7, 17
                  csrrci       s8, 0x340, 0
                  auipc        s8, 456562
                  andi         s1, s1, 1598
                  addi         a0, s1, 1631
                  rem          a6, a3, s2
                  nop
                  nop
                  addi         s6, t2, 1810
                  mulhu        a4, a1, s5
                  xor          a1, t1, s9
                  mul          sp, gp, s5
                  auipc        tp, 239958
                  srai         tp, zero, 27
                  sra          t5, a2, t3
                  csrrsi       a7, 0x340, 0
                  remu         s11, a0, t2
                  mulh         a5, a4, gp
                  c.sub        s1, a1
                  mulhu        a6, s7, a3
                  csrrwi       s10, 0x340, 29
                  srai         a5, s11, 13
                  mul          s8, t0, t2
                  remu         ra, s8, s11
                  c.lui        s6, 25
                  xor          s10, zero, a6
                  sltu         a5, s10, s0
                  xor          sp, s8, s11
                  csrrwi       s0, 0x340, 18
                  mulhu        t5, s4, a2
                  addi         t5, t3, 866
                  mulhu        gp, a7, zero
                  slt          s0, s0, s3
                  srli         sp, t4, 30
                  slli         s8, t1, 10
                  xor          a3, tp, s0
                  slt          a2, a3, gp
                  slti         a6, s8, 1329
                  mulh         sp, t0, t0
                  c.addi       s5, 26
                  mulhu        gp, t1, zero
                  c.srai       a0, 7
                  slt          s11, sp, s3
                  mulhu        zero, t1, a7
                  div          a6, gp, t3
                  sll          tp, s3, s1
                  csrrsi       tp, 0x340, 27
                  andi         s11, tp, 550
                  sra          s1, s10, a5
                  c.addi4spn   a3, sp, 432
                  c.add        gp, t1
                  c.and        s0, a4
                  csrrw        zero, 0x340, tp
                  csrrw        s7, 0x340, sp
                  csrrs        zero, 0x340, t4
                  div          t1, s5, t0
                  c.or         a0, a3
                  mulhu        a5, s5, s8
                  c.addi       s1, -1
                  mul          tp, tp, sp
                  csrrsi       t1, 0x340, 0
                  srli         s1, t2, 7
                  xor          s0, a2, a0
                  mulh         s4, t5, a0
                  csrrsi       s7, 0x340, 0
                  csrrc        a2, 0x340, zero
                  c.and        s1, s1
                  sltiu        t2, s2, -1653
                  addi         t2, a2, -678
                  andi         s4, s9, 369
                  andi         a2, t2, 1090
                  srli         a7, s10, 4
                  c.slli       gp, 13
                  c.nop
                  csrrwi       t2, 0x340, 10
                  csrrs        s5, 0x340, zero
                  andi         s5, a0, 396
                  slt          gp, s5, s1
                  c.mv         t3, t2
                  divu         a6, t1, a2
                  andi         s11, zero, -898
                  ori          a7, s5, 1410
                  c.slli       a7, 14
                  c.addi       tp, 28
                  c.or         s1, a1
                  andi         s0, t2, -599
                  xori         s2, t0, -906
                  csrrsi       a6, 0x340, 27
                  mulhsu       s5, s7, s2
                  lui          a3, 414413
                  c.and        s0, a0
                  mulhsu       a6, zero, t6
                  mulhsu       a5, a4, a5
                  sltiu        s8, a4, 1724
                  slti         s6, a3, 530
                  c.li         s11, 26
                  srli         a3, ra, 15
                  and          t4, a5, zero
                  slt          t5, s5, s6
                  csrrsi       s5, 0x340, 0
                  divu         ra, t6, a1
                  mulhu        s5, a7, s5
                  c.add        ra, t3
                  or           sp, t1, a7
                  c.addi4spn   a5, sp, 368
                  c.lui        s10, 27
                  srai         t4, t6, 26
                  sltiu        ra, t1, 1933
                  c.nop
                  srai         s2, t2, 17
                  csrrci       s10, 0x340, 15
                  or           zero, zero, s10
                  addi         s0, s3, -1252
                  csrrsi       a4, 0x340, 0
                  c.addi16sp   sp, 496
                  mulh         t4, t2, s6
                  mulhu        s2, sp, a1
                  srai         s4, tp, 12
                  or           s0, t6, t1
                  srli         t1, a6, 22
                  c.li         t0, 0
                  c.andi       a4, -1
                  c.srai       a0, 14
                  nop
                  xor          s11, a6, s4
                  srl          s8, t4, t3
                  slti         tp, tp, -1352
                  c.add        a1, a7
                  csrrci       zero, 0x340, 16
                  csrrw        t3, 0x340, s2
                  c.addi4spn   a1, sp, 496
                  c.addi4spn   s0, sp, 160
                  c.lui        s6, 8
                  mulhu        s4, s0, t6
                  srli         a2, s11, 20
                  csrrc        a4, 0x340, s1
                  nop
                  auipc        s10, 132417
                  lui          t0, 671647
                  sltiu        ra, s9, -1388
                  c.lui        t5, 8
                  c.nop
                  slli         zero, s2, 10
                  rem          a5, t1, s9
                  and          s5, zero, t4
                  auipc        s10, 432711
                  csrrci       s6, 0x340, 10
                  c.addi4spn   a2, sp, 560
                  sltiu        tp, t5, 579
                  c.srli       a5, 18
                  and          a0, t5, t3
                  slli         t0, t1, 3
                  c.srli       a0, 19
                  c.nop
                  slt          a2, t6, a6
                  c.addi4spn   a2, sp, 912
                  c.nop
                  c.addi4spn   a0, sp, 144
                  mulh         t1, a0, a4
                  csrrsi       sp, 0x340, 0
                  c.mv         s8, a2
                  c.sub        a0, a2
                  srli         a0, t0, 8
                  srai         ra, t6, 4
                  c.mv         a2, t2
                  c.or         a0, a0
                  c.xor        a0, s0
                  remu         s5, s1, s8
                  c.srli       a2, 21
                  and          ra, s11, a6
                  div          tp, a3, a4
                  c.srli       s1, 19
                  srl          s0, zero, s6
                  c.li         t3, 26
                  or           s7, s7, a7
                  srai         t3, gp, 2
                  auipc        a1, 973214
                  c.mv         a7, ra
                  c.andi       a4, 1
                  srai         t3, s8, 29
                  c.addi       s7, -1
                  remu         t5, a7, s1
                  sltiu        t0, sp, -1528
                  addi         s8, ra, 1308
                  c.sub        a3, s1
                  and          a0, a1, a0
                  c.lui        a7, 10
                  andi         t4, s1, 1645
                  nop
                  remu         s7, s7, sp
                  andi         a2, a1, -1853
                  ori          gp, tp, 921
                  srli         a0, gp, 31
                  csrrwi       s0, 0x340, 11
                  mulh         a7, a4, a7
                  slti         a3, sp, -184
                  c.addi16sp   sp, -16
                  mul          t2, a2, t2
                  csrrc        a7, 0x340, zero
                  lui          t0, 68615
                  csrrw        tp, 0x340, s8
                  c.mv         s5, a3
                  or           s6, s2, s7
                  sltiu        a1, s3, 867
                  ori          s4, a4, 1541
                  srli         s10, s11, 30
                  c.slli       tp, 10
                  mulhu        s11, t4, gp
                  csrrwi       s6, 0x340, 29
                  csrrc        sp, 0x340, zero
                  sra          t5, a5, zero
                  c.add        s1, s4
                  c.nop
                  c.lui        s2, 23
                  ori          a0, s7, -932
                  csrrc        a0, 0x340, s7
                  addi         t4, tp, 1344
                  c.slli       s5, 17
                  c.srai       s1, 13
                  c.mv         s10, ra
                  csrrci       tp, 0x340, 15
                  sub          t0, s10, a1
                  slt          a4, s10, a5
                  csrrci       s5, 0x340, 0
                  srli         a5, t2, 15
                  slt          a2, s1, tp
                  srai         t1, zero, 4
                  add          a3, zero, s4
                  nop
                  mul          a5, zero, s8
                  addi         a7, s6, 314
                  c.srai       a3, 22
                  c.addi       s11, -1
                  addi         a2, s7, 1186
                  slt          s2, s11, t0
                  c.add        s6, a3
                  rem          t0, a5, t1
                  slt          a4, t3, s8
                  c.lui        t1, 9
                  c.li         a7, 31
                  c.addi4spn   a3, sp, 480
                  slt          a5, a0, t6
                  div          t2, t3, s11
                  slti         s7, s4, 1118
                  ori          s2, a1, 1822
                  c.addi       s6, -1
                  xor          s11, a3, s1
                  c.xor        a1, a0
                  csrrc        t1, 0x340, s9
                  div          t1, t1, t1
                  c.addi16sp   sp, 208
                  c.and        a5, s1
                  csrrci       tp, 0x340, 22
                  or           s0, s0, gp
                  c.addi4spn   a0, sp, 432
                  sltiu        s1, s10, 1077
                  csrrsi       a6, 0x340, 5
                  csrrsi       tp, 0x340, 0
                  c.add        gp, t0
                  c.xor        a3, a0
                  csrrci       s6, 0x340, 13
                  nop
                  sltiu        t4, s11, 1069
                  div          s7, t6, t1
                  xor          gp, s0, sp
                  c.xor        a2, a1
                  auipc        t1, 769874
                  c.nop
                  remu         a6, t4, s9
                  mulhsu       t3, a6, s3
                  c.andi       a4, 2
                  auipc        a2, 565930
                  srli         s7, t0, 10
                  c.srli       a1, 26
                  or           gp, s1, a4
                  xor          tp, t0, tp
                  c.sub        a0, a1
                  c.addi4spn   a4, sp, 608
                  mulh         zero, a3, t4
                  addi         tp, s8, 1498
                  c.add        t3, s0
                  c.srli       a0, 22
                  c.addi       t3, -1
                  ori          s2, t0, -455
                  csrrw        s0, 0x340, a3
                  csrrs        sp, 0x340, a1
                  divu         s10, s5, gp
                  slti         t4, s6, 112
                  divu         gp, ra, s0
                  c.and        a5, a1
                  csrrwi       s11, 0x340, 2
                  c.addi4spn   a0, sp, 240
                  slti         a7, s6, -1281
                  csrrs        a1, 0x340, zero
                  div          s1, sp, s5
                  c.srai       a2, 7
                  slt          s7, gp, s3
                  srli         t2, s6, 15
                  div          t3, a7, a7
                  sltu         gp, zero, t3
                  sltiu        s7, t6, 2016
                  c.addi       s8, 22
                  andi         a3, a4, 1002
                  c.andi       a0, 23
                  slt          a0, s4, s7
                  csrrci       s5, 0x340, 1
                  csrrs        a7, 0x340, s1
                  c.and        a2, a2
                  csrrs        a6, 0x340, zero
                  sra          s11, s1, s10
                  c.slli       a5, 20
                  c.or         a4, s0
                  sltu         s10, t0, a7
                  sub          ra, s0, s3
                  slti         t2, a7, 434
                  rem          sp, s9, sp
                  c.srli       a5, 16
                  auipc        a1, 248812
                  mul          tp, s7, a6
                  srai         gp, s7, 18
                  nop
                  slti         t3, a2, -1421
                  mul          t0, gp, zero
                  c.srai       a1, 19
                  mulh         s10, s6, t4
                  c.addi16sp   sp, 272
                  c.li         a6, -1
                  addi         zero, gp, -1673
                  c.and        s1, s1
                  sub          t1, t4, s0
                  xori         gp, t6, 748
                  srli         s1, t1, 5
                  c.slli       s2, 22
                  c.andi       a3, 29
                  mulh         zero, a1, a7
                  mulhu        ra, s4, sp
                  c.or         s1, a0
                  c.nop
                  mulh         gp, t2, s10
                  xori         a0, s4, -34
                  sub          s8, t3, s3
                  c.nop
                  c.and        s1, a2
                  nop
                  c.srai       a4, 20
                  c.srai       a4, 28
                  mulh         t2, s0, s0
                  lui          s11, 41546
                  nop
                  and          gp, a5, sp
                  c.andi       a5, 13
                  slt          a4, a5, t6
                  add          tp, a0, s5
                  xori         t0, t4, -1421
                  xor          s11, a6, t1
                  csrrs        ra, 0x340, zero
                  srl          s8, a7, t2
                  csrrc        s7, 0x340, s8
                  xori         t0, s10, 1313
                  xor          gp, a2, t1
                  slti         a6, s11, -1025
                  csrrc        t0, 0x340, zero
                  rem          s8, a7, ra
                  c.lui        a5, 31
                  srli         s6, s3, 15
                  andi         a7, s8, 1818
                  sll          tp, t0, s6
                  rem          a3, s10, gp
                  andi         s11, t0, 1758
                  auipc        gp, 213744
                  mulh         s5, a0, a4
                  div          s8, t1, s0
                  sll          a3, s3, a4
                  c.xor        a5, s1
                  andi         s10, t1, 1780
                  lui          a4, 314499
                  ori          sp, s5, 365
                  csrrsi       t0, 0x340, 1
                  mulhu        t2, s8, t3
                  c.addi16sp   sp, -16
                  sra          a4, t3, t6
                  c.andi       s0, -1
                  c.xor        a2, s1
                  csrrc        s4, 0x340, tp
                  nop
                  sltu         t2, a1, s11
                  sub          s1, ra, s8
                  c.or         a3, s0
                  c.li         s11, 17
                  c.lui        t5, 28
                  srai         s11, ra, 11
                  mulh         a0, s8, gp
                  c.mv         ra, t0
                  nop
                  c.xor        a0, a4
                  srli         ra, s2, 13
                  remu         t3, s11, s11
                  c.and        a5, a3
                  c.li         s10, -1
                  c.xor        a2, a3
                  csrrsi       a7, 0x340, 16
                  addi         gp, s1, 191
                  xori         t1, s7, 1685
                  ori          a3, a4, 1347
                  c.addi       a4, -1
                  auipc        t2, 418708
                  srai         s10, t4, 27
                  mulh         t0, a3, a2
                  c.li         a1, -1
                  csrrs        s2, 0x340, zero
                  slt          a3, tp, gp
                  add          a7, s9, sp
                  sub          a4, gp, a5
                  c.addi4spn   s0, sp, 832
                  mulh         s7, a1, s6
                  c.addi       a1, 15
                  c.lui        s1, 27
                  mulhu        a1, t3, zero
                  c.slli       s7, 13
                  c.and        s1, s1
                  mulhu        sp, s7, s2
                  csrrc        tp, 0x340, zero
                  c.srai       a2, 21
                  divu         s6, t2, t6
                  srai         t4, s4, 30
                  c.addi16sp   sp, 304
                  mulhsu       s5, zero, t1
                  mulh         s11, a2, s7
                  and          gp, t4, a4
                  mul          s0, a1, s7
                  sll          a0, s5, t4
                  nop
                  csrrci       s0, 0x340, 8
                  c.add        t5, a7
                  slt          s6, s4, s9
                  csrrs        t0, 0x340, s3
                  c.andi       a0, 14
                  c.srli       a0, 27
                  mul          s10, a0, t6
                  c.lui        s7, 29
                  xori         a3, s1, -820
                  c.sub        a5, a4
                  nop
                  sra          s1, s11, t1
                  add          t3, t3, a5
                  div          s4, zero, t1
                  sub          sp, s9, a2
                  srai         a2, t2, 22
                  c.li         a4, -1
                  c.add        s8, t1
                  c.li         t1, -1
                  c.addi4spn   a0, sp, 112
                  c.nop
                  c.andi       a0, 25
                  xor          t0, s9, t6
                  sltiu        s0, s2, 1573
                  addi         a2, t4, -1903
                  mul          t2, zero, a6
                  c.addi       sp, -1
                  c.andi       s1, 31
                  or           a4, tp, t6
                  c.lui        s4, 14
                  srai         t0, t2, 23
                  mulhu        a0, ra, a2
                  mulh         a6, tp, s6
                  c.lui        t2, 10
                  slli         ra, sp, 6
                  sub          s0, t6, t4
                  c.srli       a2, 2
                  mulhsu       t3, t1, t0
                  srl          zero, sp, t0
                  csrrci       sp, 0x340, 23
                  c.and        a0, a1
                  csrrw        a3, 0x340, a0
                  sra          tp, zero, a5
                  c.sub        s1, a0
                  sltu         ra, s11, tp
                  mulh         a7, tp, t5
                  lui          s8, 780341
                  slli         tp, gp, 25
                  sra          s4, s4, ra
                  srli         s5, t1, 27
                  sltiu        t3, t4, -2028
                  csrrs        t5, 0x340, sp
                  addi         s10, zero, 1807
                  c.srai       a0, 20
                  c.srai       a1, 10
                  c.add        t4, t0
                  c.addi4spn   a0, sp, 432
                  mulhu        s2, t3, s0
                  c.slli       a7, 25
                  add          s5, a6, s1
                  srl          s8, a5, tp
                  c.xor        a3, a3
                  csrrsi       t2, 0x340, 0
                  srli         s2, s8, 23
                  srai         s4, t6, 25
                  c.li         t1, -1
                  c.add        t2, t1
                  ori          a1, s7, -1262
                  divu         s2, s5, s3
                  c.addi4spn   a0, sp, 880
                  xor          tp, s7, s8
                  mulhsu       t2, t4, s0
                  slli         t1, s6, 15
                  c.li         s10, 1
                  srai         s5, s9, 0
                  csrrci       s1, 0x340, 0
                  c.xor        a2, a4
                  sltiu        s2, t6, 1751
                  andi         t1, a0, 1428
                  c.sub        a5, a4
                  auipc        t1, 503809
                  csrrci       s8, 0x340, 11
                  c.srai       a4, 20
                  ori          s0, s10, 1446
                  or           s6, a5, s5
                  c.xor        a1, a3
                  c.sub        a3, a4
                  c.srli       a4, 19
                  csrrc        a3, 0x340, s3
                  c.addi       t4, -1
                  sub          tp, s3, t1
                  add          a0, s6, a7
                  div          s10, s4, t4
                  xori         sp, ra, 1100
                  divu         a7, a2, tp
                  c.add        t4, a2
                  mulh         a2, s7, sp
                  nop
                  remu         t2, a7, t0
                  c.add        gp, s1
                  c.nop
                  srai         a6, a5, 16
                  srl          a2, ra, zero
                  srli         s7, a1, 6
                  c.mv         s8, gp
                  sra          a5, s5, s6
                  c.add        gp, s7
                  c.addi       t5, -1
                  c.addi       s8, -1
                  slti         t4, t5, 1512
                  remu         a0, s7, s8
                  ori          gp, t6, -1464
                  div          s7, t6, a7
                  c.add        gp, ra
                  andi         tp, zero, -1680
                  andi         s2, t2, -16
                  slt          a7, t4, a0
                  c.addi4spn   a5, sp, 416
                  slli         s7, zero, 16
                  c.lui        a3, 25
                  mul          s2, t1, ra
                  addi         a6, t6, -107
                  srai         s0, s2, 16
                  c.srli       a4, 22
                  sub          s1, ra, a3
                  c.srli       s0, 4
                  slli         a6, a3, 29
                  srai         a5, s5, 18
                  and          t1, a1, t6
                  csrrs        a6, 0x340, zero
                  csrrs        s2, 0x340, zero
                  c.or         a5, a1
                  rem          s1, s3, s2
                  c.sub        s1, a2
                  c.addi16sp   sp, -16
                  c.mv         a6, a7
                  csrrw        t2, 0x340, t0
                  nop
                  c.andi       a0, -1
                  xor          a7, ra, s3
                  c.nop
                  sra          a3, t1, t5
                  csrrw        a7, 0x340, tp
                  c.addi       s8, -1
                  c.addi4spn   a0, sp, 400
                  slt          s11, a1, a4
                  andi         s8, gp, -80
                  srl          s2, tp, t3
                  srai         t0, a7, 22
                  mulh         s10, a3, t5
                  c.li         s8, 28
                  c.li         s7, -1
                  c.sub        a4, a1
                  mulh         t3, t2, a0
                  xor          zero, sp, s0
                  mulhu        s1, s1, s8
                  remu         a4, a3, s3
                  c.or         a2, a0
                  c.lui        t2, 3
                  c.addi       s4, -1
                  c.mv         gp, s0
                  slt          a5, a0, s6
                  c.or         a0, s0
                  mulhsu       zero, s8, tp
                  xor          sp, a3, t1
                  divu         s10, a2, gp
                  c.srli       a2, 29
                  nop
                  divu         s11, gp, a2
                  srl          zero, s4, t0
                  div          tp, a7, s1
                  c.slli       t0, 13
                  c.slli       t3, 29
                  rem          gp, a7, ra
                  sll          a5, t4, s7
                  remu         a4, t4, s1
                  c.mv         t4, tp
                  mulh         s10, t6, s6
                  c.andi       a1, -1
                  sltu         t1, s3, s10
                  slt          zero, s0, s2
                  or           s4, a6, a4
                  c.li         t3, -1
                  c.xor        a2, s1
                  c.sub        a2, a2
                  lui          s6, 638662
                  srai         a5, a2, 24
                  sll          gp, s7, s4
                  and          a0, a5, s8
                  c.and        a1, a1
                  auipc        a6, 1039811
                  mulhsu       s0, a0, a1
                  ori          tp, s2, 1258
                  c.or         a1, a1
                  csrrci       a7, 0x340, 25
                  c.srai       s1, 21
                  xori         sp, zero, 1267
                  slti         s5, a1, -2016
                  csrrsi       s7, 0x340, 17
                  ori          t1, s8, -1055
                  andi         t0, s3, 634
                  rem          a4, sp, s1
                  c.and        a0, a1
                  c.addi16sp   sp, -16
                  c.li         tp, 26
                  addi         a7, a4, 317
                  c.li         t0, 20
                  c.slli       a3, 8
                  mul          s10, s0, t0
                  andi         a0, s7, -1220
                  c.addi16sp   sp, -16
                  mulh         sp, s7, sp
                  sub          a3, a3, s2
                  c.or         a2, a3
                  srai         a0, t4, 25
                  c.add        a3, s7
                  andi         ra, s10, 1539
                  csrrsi       a2, 0x340, 0
                  c.or         a2, a1
                  sltiu        s0, gp, -1326
                  c.add        a6, s11
                  divu         t2, a0, s11
                  mulhsu       ra, t6, gp
                  csrrw        s2, 0x340, s3
                  csrrci       s5, 0x340, 17
                  c.or         a1, a2
                  srli         s6, s10, 23
                  div          a7, s6, a6
                  lui          t5, 494299
                  csrrc        a2, 0x340, zero
                  sltiu        a7, t6, 607
                  slti         s7, t3, -1791
                  c.li         t5, -1
                  c.xor        s1, a3
                  c.nop
                  c.addi4spn   a1, sp, 528
                  c.srai       s1, 17
                  srl          t1, s11, a3
                  c.sub        s0, a4
                  csrrwi       tp, 0x340, 1
                  mulh         s0, a2, tp
                  remu         a0, a1, a3
                  sltu         zero, s4, s8
                  c.lui        s2, 20
                  remu         s5, t1, gp
                  sltu         s5, s7, gp
                  lui          s6, 481622
                  c.sub        s1, a1
                  c.slli       a5, 12
                  sll          a7, s3, a0
                  lui          t3, 414460
                  mul          ra, t4, a2
                  c.or         a5, a2
                  csrrc        t1, 0x340, zero
                  rem          a1, ra, t5
                  add          ra, s4, s0
                  xor          a6, a6, tp
                  ori          a4, s9, -129
                  auipc        a1, 935876
                  ori          s0, s10, -647
                  slti         s4, a3, 1647
                  csrrc        s0, 0x340, s6
                  c.srai       a4, 11
                  remu         gp, t1, a1
                  lui          s6, 964255
                  or           a4, ra, tp
                  csrrci       a4, 0x340, 6
                  and          sp, a2, s8
                  slli         s2, gp, 20
                  and          s5, s5, s6
                  csrrwi       a5, 0x340, 29
                  c.addi4spn   a0, sp, 704
                  c.andi       a3, -1
                  addi         gp, t1, -1762
                  c.sub        a4, a4
                  csrrs        s7, 0x340, zero
                  sll          a7, s10, sp
                  csrrs        s6, 0x340, zero
                  slli         s2, t6, 21
                  divu         a5, s9, a0
                  c.addi16sp   sp, -16
                  or           s5, a0, a4
                  c.addi       s10, 7
                  mulh         s6, s11, s2
                  xori         s2, a3, 133
                  mulhsu       gp, t5, s8
                  c.mv         gp, s11
                  srli         a6, t2, 22
                  c.slli       t2, 30
                  slti         s2, a7, -365
                  c.add        s11, s5
                  and          a7, s0, t2
                  mulhu        tp, sp, s0
                  c.nop
                  c.add        tp, s10
                  div          s8, zero, a2
                  sltiu        a3, ra, -381
                  sll          t2, a3, s10
                  mul          sp, gp, t6
                  addi         sp, s10, 569
                  auipc        s0, 50358
                  c.andi       a2, 22
                  c.li         ra, 30
                  mul          s6, s5, a5
                  c.sub        a2, a3
                  c.srai       s1, 11
                  mul          a6, s11, t1
                  c.srli       s1, 27
                  slt          zero, a1, s1
                  slt          t4, s9, s7
                  csrrw        t2, 0x340, tp
                  divu         a6, s5, a6
                  c.lui        t2, 16
                  c.nop
                  csrrc        s8, 0x340, zero
                  c.li         sp, 18
                  xor          s7, s0, t3
                  c.sub        a2, a0
                  csrrc        a0, 0x340, s10
                  csrrc        a6, 0x340, a5
                  c.addi       a6, 3
                  csrrc        t1, 0x340, zero
                  csrrs        s5, 0x340, a6
                  slli         a6, tp, 17
                  csrrwi       tp, 0x340, 2
                  csrrc        ra, 0x340, zero
                  c.andi       a2, 21
                  rem          tp, s3, a2
                  srl          a2, s2, a2
                  sltu         s10, s10, s3
                  andi         s5, a7, -255
                  c.slli       s4, 4
                  xori         s5, a2, 624
                  mul          s7, sp, zero
                  sll          t3, s1, ra
                  sub          a0, t2, s5
                  srli         s2, s9, 11
                  c.xor        a3, a2
                  or           s8, s7, t6
                  csrrc        s10, 0x340, s10
                  csrrw        a5, 0x340, a6
                  slli         a7, t5, 23
                  c.sub        a3, a0
                  rem          tp, a1, tp
                  c.nop
                  mulhu        s1, sp, t0
                  c.addi16sp   sp, 32
                  sltu         s2, s0, ra
                  sub          a2, a1, t1
                  sltiu        ra, s10, -1588
                  c.xor        s1, a4
                  c.mv         s8, t1
                  sra          sp, a6, s5
                  c.nop
                  or           a5, s5, a1
                  csrrci       a6, 0x340, 0
                  div          t3, s10, s3
                  c.sub        s0, s1
                  divu         t2, a4, s0
                  slti         a0, a2, 51
                  remu         s0, s10, s9
                  add          sp, t1, a2
                  mulh         s7, gp, s3
                  slli         s5, s7, 11
                  sltu         tp, a2, a4
                  c.lui        a4, 24
                  csrrw        s4, 0x340, a3
                  c.addi16sp   sp, 176
                  nop
                  sltiu        s0, a3, 786
                  c.addi       t3, 9
                  c.and        a4, a0
                  mulhsu       s8, a5, s11
                  slti         tp, t5, 1573
                  csrrc        a1, 0x340, a5
                  csrrsi       t4, 0x340, 0
                  csrrs        t1, 0x340, zero
                  add          s11, s2, s10
                  srli         ra, s0, 20
                  sltiu        t2, s9, 668
                  auipc        a7, 154389
                  mul          s0, a2, s2
                  xori         s4, zero, 1230
                  xor          s6, s8, a7
                  csrrc        t3, 0x340, s9
                  div          s2, s5, zero
                  c.andi       a4, -1
                  lui          s1, 785954
                  c.sub        s0, s0
                  c.addi16sp   sp, 288
                  divu         zero, s5, s5
                  remu         t2, s7, t0
                  c.li         t2, -1
                  csrrw        s5, 0x340, s7
                  csrrsi       a4, 0x340, 0
                  slti         s6, s3, 1962
                  add          zero, t0, a3
                  sltu         t4, t0, s7
                  mulh         s8, s7, a0
                  div          ra, t2, s9
                  auipc        ra, 619035
                  lui          a4, 672328
                  srai         s11, a1, 17
                  nop
                  c.sub        s1, s1
                  mul          t3, s6, s11
                  c.slli       tp, 7
                  lui          a3, 911085
                  and          a3, s3, a5
                  c.xor        a0, a1
                  c.slli       a6, 3
                  csrrw        a2, 0x340, t2
                  slli         s5, t2, 5
                  or           gp, a5, t0
                  c.addi       a2, -1
                  sll          ra, s8, a6
                  c.addi16sp   sp, 320
                  c.nop
                  srai         a0, ra, 2
                  mulh         zero, t2, s2
                  mulh         a2, s10, a5
                  c.slli       a5, 8
                  csrrs        s2, 0x340, t5
                  xori         s5, s6, -456
                  sltu         s8, a6, ra
                  remu         s4, s10, s8
                  slli         zero, a2, 5
                  div          ra, gp, s7
                  srl          s6, s3, t1
                  c.sub        s1, a3
                  mul          s4, s0, t0
                  c.slli       s11, 29
                  c.addi4spn   a3, sp, 560
                  xori         a2, a6, -1182
                  sra          t5, tp, s6
                  c.addi4spn   a0, sp, 336
                  sub          s8, s3, s0
                  auipc        t1, 498517
                  c.sub        a0, a0
                  slti         s10, s8, -1613
                  and          a4, gp, s2
                  c.sub        a5, a1
                  c.mv         s7, sp
                  andi         a6, sp, 1700
                  slti         t1, t2, 813
                  sltiu        tp, t4, -1109
                  csrrw        t2, 0x340, sp
                  xor          s6, a4, s11
                  divu         s8, t2, t2
                  mul          a4, s3, t3
                  addi         s8, tp, -367
                  divu         s0, a4, a7
                  c.lui        s2, 25
                  c.nop
                  mulh         a2, s5, tp
                  sltu         s4, s6, tp
                  slli         a7, a7, 28
                  slti         sp, a0, -573
                  c.addi16sp   sp, -16
                  c.add        t4, t5
                  c.sub        s1, a0
                  c.addi16sp   sp, 32
                  sll          a1, s9, s8
                  srl          s4, s10, a2
                  c.srli       a1, 28
                  c.nop
                  c.addi       s6, -1
                  divu         a5, t1, s1
                  c.add        s8, a4
                  c.srai       s1, 14
                  c.addi16sp   sp, -16
                  c.addi4spn   a0, sp, 208
                  auipc        s0, 495134
                  c.and        a3, s0
                  srl          s0, s4, a3
                  sub          s10, gp, t3
                  csrrs        t2, 0x340, a6
                  c.addi16sp   sp, -16
                  sltu         s0, t5, s9
                  c.and        s1, s0
                  c.xor        a4, a0
                  sra          a6, s1, s10
                  slti         s6, s1, 1061
                  c.srai       a4, 20
                  sll          t1, ra, s8
                  rem          s7, t4, s10
                  c.li         a3, 6
                  sltiu        s1, a3, 1512
                  c.srli       a2, 6
                  c.li         a0, 17
                  c.add        a7, a1
                  and          s2, t5, s3
                  c.li         t4, -1
                  mulh         t1, sp, t2
                  mulhsu       s7, gp, a5
                  nop
                  xor          sp, tp, sp
                  srai         s11, s7, 11
                  c.addi16sp   sp, 496
                  sltiu        s2, s9, 513
                  srai         s1, zero, 23
                  c.li         a3, 11
                  mulhu        t0, s3, t6
                  addi         s5, s11, -307
                  c.xor        a2, a3
                  mulh         s5, a7, s2
                  c.sub        a2, a5
                  c.addi4spn   s0, sp, 272
                  slt          s10, a5, t5
                  c.sub        a4, a5
                  divu         s4, t3, a0
                  srai         s0, gp, 12
                  xori         a6, s9, -1062
                  mulhu        s11, a3, t0
                  andi         a4, t6, 1730
                  c.addi       s7, -1
                  csrrs        t1, 0x340, zero
                  srai         a7, t4, 1
                  sub          zero, s11, sp
                  c.srli       a5, 23
                  c.sub        a1, a4
                  c.addi4spn   a2, sp, 912
                  addi         a6, t2, -298
                  c.mv         a2, t1
                  rem          a1, ra, t1
                  c.li         tp, -1
                  slt          s6, a2, a4
                  remu         gp, s3, t2
                  slti         s4, a4, -1079
                  csrrc        a2, 0x340, s2
                  c.addi       s5, 21
                  div          a4, s10, s4
                  lui          s5, 1031995
                  c.and        s0, a0
                  c.lui        a4, 28
                  mul          zero, t3, t5
                  and          t4, t5, s11
                  or           s8, t3, a6
                  mulhu        s2, ra, a5
                  mulhu        zero, a0, a0
                  c.lui        s1, 9
                  and          a4, s8, t5
                  c.addi4spn   a4, sp, 176
                  csrrs        a7, 0x340, zero
                  csrrsi       s6, 0x340, 17
                  c.li         s8, 2
                  mulh         ra, s11, ra
                  remu         s11, s10, a1
                  srl          s5, a0, t1
                  csrrsi       s1, 0x340, 16
                  csrrs        t0, 0x340, t3
                  csrrc        t2, 0x340, zero
                  ori          s7, tp, 177
                  csrrs        zero, 0x340, s8
                  xor          t4, a3, t4
                  csrrci       t5, 0x340, 17
                  c.xor        s1, a2
                  c.addi4spn   a0, sp, 560
                  slt          a3, a1, t2
                  c.addi16sp   sp, 128
                  csrrc        a1, 0x340, zero
                  c.addi       tp, -1
                  xor          t0, s7, s3
                  mulh         s6, zero, s11
                  c.addi       t4, -1
                  csrrwi       t2, 0x340, 31
                  c.nop
                  c.nop
                  c.xor        a5, a4
                  mulhsu       t2, s10, a1
                  srli         s11, s8, 28
                  sltu         a6, s0, s6
                  mul          a7, s8, t1
                  sltu         a1, s6, gp
                  csrrwi       t4, 0x340, 0
                  andi         sp, t4, 1257
                  lui          a3, 142063
                  srl          s8, a3, a7
                  c.and        s0, a1
                  lui          s7, 515464
                  c.and        s1, a2
                  mulhsu       a4, a2, t6
                  csrrw        s5, 0x340, s0
                  csrrs        s5, 0x340, a3
                  xori         t2, gp, 1921
                  c.mv         s0, t4
                  c.nop
                  c.srai       a2, 5
                  c.xor        a1, a4
                  c.sub        s0, a4
                  remu         a6, t6, s9
                  c.mv         t0, t2
                  auipc        a1, 221437
                  or           a4, t4, a2
                  c.li         a2, 28
                  mulhu        a7, s3, t2
                  ori          s10, a7, 535
                  slli         s5, a2, 12
                  divu         s8, t2, s2
                  slti         a4, t0, -115
                  csrrc        t2, 0x340, ra
                  c.addi4spn   a1, sp, 208
                  csrrwi       s4, 0x340, 0
                  sltiu        zero, a2, 98
                  c.mv         a5, s11
                  c.mv         s1, t0
                  sll          a2, s5, t0
                  remu         t3, s2, s11
                  mulh         s5, t4, t1
                  srli         s5, s1, 12
                  add          t1, ra, a7
                  csrrc        a0, 0x340, zero
                  c.sub        a0, a2
                  csrrwi       a6, 0x340, 0
                  mul          zero, t4, a2
                  csrrs        t1, 0x340, zero
                  rem          s10, s11, a6
                  csrrwi       t4, 0x340, 16
                  slti         s11, gp, -512
                  mulhu        ra, a6, t1
                  c.nop
                  c.addi       a6, -1
                  mulh         a1, t6, sp
                  c.lui        a2, 13
                  c.li         s1, 28
                  c.xor        s1, a1
                  mulhsu       t0, t0, ra
                  add          t2, s10, s7
                  csrrsi       a7, 0x340, 8
                  c.srli       a0, 19
                  c.addi4spn   a2, sp, 816
                  mulhsu       s6, a1, a4
                  divu         a4, s2, s4
                  slti         s4, s4, 764
                  sub          s5, a1, a6
                  add          a5, a2, s7
                  srai         t5, s2, 20
                  srai         ra, gp, 14
                  c.addi16sp   sp, 128
                  ori          a4, a7, -1788
                  csrrc        a1, 0x340, zero
                  csrrci       a3, 0x340, 0
                  c.srai       a0, 27
                  slli         s10, s5, 2
                  sra          t1, t0, a3
                  sll          zero, a3, s2
                  csrrwi       a6, 0x340, 20
                  csrrw        a1, 0x340, a6
                  c.srai       s1, 11
                  c.addi       s11, -1
                  rem          gp, ra, s11
                  c.sub        a4, s1
                  c.andi       a2, -1
                  remu         sp, s4, sp
                  c.slli       s0, 19
                  csrrsi       sp, 0x340, 0
                  auipc        s0, 874163
                  andi         tp, zero, -1552
                  csrrsi       s1, 0x340, 8
                  c.or         s0, a3
                  c.addi16sp   sp, -16
                  sub          a3, s6, t6
                  csrrsi       t2, 0x340, 25
                  mulhsu       s0, s11, t5
                  csrrci       s5, 0x340, 0
                  c.nop
                  srai         s6, zero, 11
                  div          a3, s3, a5
                  xori         s7, a4, -976
                  c.xor        a5, a0
                  mulhu        sp, s5, s8
                  xori         t3, s1, 719
                  mul          t0, s11, s10
                  lui          s7, 1031031
                  c.li         sp, -1
                  c.sub        a2, s0
                  or           a3, zero, t0
                  divu         s8, s8, s2
                  c.or         a3, a2
                  ori          s5, s11, -520
                  addi         s10, t1, 923
                  andi         t5, t0, 1673
                  mulhu        t1, t1, a2
                  addi         tp, t1, 1371
                  csrrc        s1, 0x340, t0
                  lui          t0, 111143
                  slt          s8, a6, s11
                  sra          a3, t2, s11
                  auipc        a6, 18494
                  c.srai       a3, 9
                  sub          a2, s11, zero
                  add          a0, s6, s7
                  slt          a7, t1, t5
                  auipc        s0, 108938
                  csrrsi       t3, 0x340, 0
                  sltiu        a4, t0, 65
                  c.nop
                  c.xor        a4, a5
                  c.addi16sp   sp, 336
                  sltiu        a2, s10, -699
                  srli         a6, a6, 19
                  rem          sp, s0, sp
                  mulhsu       s10, s9, sp
                  mul          t3, a7, a2
                  csrrs        a7, 0x340, gp
                  csrrci       s5, 0x340, 0
                  andi         t1, s3, -764
                  csrrs        s1, 0x340, zero
                  sll          s7, s10, t1
                  div          t5, a7, a3
                  c.sub        a2, a4
                  c.sub        a1, s1
                  srli         s0, s9, 11
                  and          a0, t5, a0
                  mulhu        s6, zero, a3
                  c.andi       a1, -1
                  c.nop
                  mulh         a2, s4, s3
                  csrrw        s10, 0x340, gp
                  c.addi16sp   sp, -16
                  c.add        s10, s6
                  c.addi16sp   sp, 176
                  mul          s4, s0, a2
                  c.lui        s2, 3
                  divu         gp, t0, t3
                  divu         a6, s5, s9
                  c.srai       a3, 5
                  csrrw        t4, 0x340, sp
                  sll          a0, s0, tp
                  mul          t1, sp, s5
                  and          ra, s2, s11
                  div          t2, s6, s10
                  addi         t4, s7, 1579
                  rem          t4, s5, a1
                  c.nop
                  c.andi       a2, 3
                  addi         a7, t1, -807
                  csrrsi       s2, 0x340, 0
                  csrrs        sp, 0x340, zero
                  c.or         s1, a0
                  csrrw        s8, 0x340, a1
                  c.addi16sp   sp, -16
                  auipc        zero, 1012250
                  csrrs        t0, 0x340, s0
                  sltiu        t3, ra, -466
                  addi         t3, s8, -838
                  c.addi16sp   sp, -16
                  mulhu        a6, a5, s4
                  c.addi16sp   sp, -16
                  addi         tp, a0, 1267
                  csrrci       s0, 0x340, 0
                  c.addi4spn   a2, sp, 800
                  div          s0, s1, a6
                  nop
                  csrrci       a3, 0x340, 14
                  c.add        s10, s2
                  ori          tp, s9, 1914
                  sll          t5, s1, sp
                  sltiu        gp, s1, -1786
                  c.slli       s7, 19
                  slti         a7, s3, -1599
                  mulhsu       tp, t2, s1
                  srl          tp, a4, a3
                  c.add        t1, a4
                  c.addi16sp   sp, -16
                  srai         t0, t2, 16
                  auipc        t5, 842227
                  c.mv         s6, a3
                  c.add        tp, a0
                  csrrsi       zero, 0x340, 16
                  xor          t1, a3, a2
                  auipc        s4, 991774
                  c.nop
                  c.addi       t1, 18
                  c.srli       a0, 29
                  mulh         a7, s0, s6
                  srai         t2, t5, 14
                  csrrsi       a1, 0x340, 0
                  div          s2, s0, t4
                  csrrw        a0, 0x340, gp
                  sll          tp, s7, s10
                  csrrwi       t3, 0x340, 14
                  c.addi16sp   sp, 192
                  rem          s6, a7, s10
                  slt          a6, a4, s4
                  div          t5, a1, ra
                  c.mv         t4, sp
                  c.lui        s0, 1
                  csrrci       s10, 0x340, 0
                  andi         a1, a6, 80
                  srli         s4, a2, 13
                  auipc        tp, 405701
                  c.add        s6, gp
                  sub          t1, a2, a3
                  and          s11, a4, t2
                  c.li         a0, -1
                  or           s1, a6, a4
                  csrrwi       a1, 0x340, 3
                  c.andi       s1, 6
                  or           a0, s3, s5
                  c.lui        t5, 13
                  add          s10, a4, s5
                  c.srli       a3, 5
                  csrrs        a5, 0x340, zero
                  slt          s11, a7, s10
                  c.mv         ra, a5
                  csrrci       s10, 0x340, 0
                  xori         t2, t1, -143
                  sub          zero, t2, t0
                  c.mv         t0, s11
                  div          a0, a7, t4
                  add          t3, a0, s8
                  ori          s1, tp, 1497
                  csrrw        zero, 0x340, tp
                  rem          tp, a0, s1
                  ori          t1, tp, 1583
                  addi         t4, s5, -1860
                  addi         a0, t6, 260
                  slli         s0, s7, 0
                  c.xor        a4, a3
                  mulhsu       t1, s3, s9
                  xori         gp, t6, 47
                  csrrc        s10, 0x340, t5
                  c.addi4spn   a3, sp, 896
                  add          t1, s9, s10
                  and          t5, s5, a0
                  lui          s4, 304927
                  sll          s4, s5, s5
                  or           s0, a1, s9
                  sltiu        a4, t0, 1224
                  c.srai       a4, 12
                  slti         a2, a1, -499
                  la x31, test_done
                  jalr x0, x31, 0
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
                  li x15, 0x8ffffffc
                  li x29, 0xd
                  slli x29, x29, 8
                  addi x29, x29, 0x0
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x342
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x342
                  sw x29, 0(x15)
                  csrr  x29, 0x341
                  addi  x29, x29, 4
                  csrw  0x341, x29
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
                  li x15, 0x8ffffffc
                  li x29, 0xa
                  slli x29, x29, 8
                  addi x29, x29, 0x0
                  sw x29, 0(x15)
                  li x15, 0x8ffffffc
                  li x29, 0x342
                  slli x29, x29, 8
                  addi x29, x29, 0x3
                  sw x29, 0(x15)
                  csrr x29, 0x342
                  sw x29, 0(x15)
                  csrr  x29, 0x341
                  addi  x29, x29, 4
                  csrw  0x341, x29
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
                  li x15, 0x8ffffffc
                  li x29, 0x8
                  slli x29, x29, 8
                  addi x29, x29, 0x0
                  sw x29, 0(x15)
                  nop

.align 2
mmode_intr_handler:
                  csrr  x29, 0x300 # MSTATUS;
                  csrr  x29, 0x304 # MIE;
                  csrr  x29, 0x344 # MIP;
                  csrrc x29, 0x344, x29 # MIP;
                  li x15, 0x8ffffffc
                  li x29, 0x7
                  slli x29, x29, 8
                  addi x29, x29, 0x0
                  sw x29, 0(x15)
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
