	.file	"arraysum.c"
	.option nopic
	.attribute arch, "rv32i2p1"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-16
	sw	ra,12(sp)
	call	clock
	li	a3,0
	li	a4,8192
	addi	a4,a4,1808
.L2:
	li	a5,0
.L3:
	addi	a5,a5,1
	bne	a5,a4,.L3
	addi	a3,a3,1
	bne	a3,a4,.L2
	call	clock
	lw	ra,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	main, .-main
	.globl	a
	.bss
	.align	3
	.type	a, @object
	.size	a, 800000000
a:
	.zero	800000000
	.ident	"GCC: (xPack GNU RISC-V Embedded GCC x86_64) 13.2.0"
