	.file	"arraysum.c"
	.option nopic
	.attribute arch, "rv32i2p1"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-16
	sw	ra,12(sp)
	call	clock
	lw	ra,12(sp)
	addi	sp,sp,16
	tail	clock
	.size	main, .-main
	.globl	a
	.bss
	.align	3
	.type	a, @object
	.size	a, 800000000
a:
	.zero	800000000
	.ident	"GCC: (xPack GNU RISC-V Embedded GCC x86_64) 13.2.0"
