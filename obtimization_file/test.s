	.file	"arraysum.c"
	.option nopic
	.attribute arch, "rv32i2p1"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.globl	a
	.bss
	.align	3
	.type	a, @object
	.size	a, 800000000
a:
	.zero	800000000
	.globl	__floatunsidf
	.globl	__divdf3
	.globl	__muldf3
	.text
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-64
	sw	ra,60(sp)
	sw	s0,56(sp)
	sw	s2,52(sp)
	sw	s3,48(sp)
	addi	s0,sp,64
	li	a5,0
	li	a6,0
	mv	s2,a5
	mv	s3,a6
	sw	a5,-24(s0)
	sw	a6,-20(s0)
	call	clock
	sw	a0,-44(s0)
	mv	a5,s2
	mv	a6,s3
	sw	a5,-32(s0)
	sw	a6,-28(s0)
	j	.L2
.L6:
	li	a5,0
	li	a6,0
	sw	a5,-40(s0)
	sw	a6,-36(s0)
	j	.L3
.L4:
	lui	a5,%hi(a)
	addi	a3,a5,%lo(a)
	lw	a4,-32(s0)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,3
	sub	a5,a5,a4
	slli	a5,a5,4
	add	a5,a5,a4
	slli	a5,a5,4
	lw	a4,-40(s0)
	add	a5,a5,a4
	slli	a5,a5,3
	add	a5,a3,a5
	lw	a0,0(a5)
	lw	a1,4(a5)
	lw	a2,-24(s0)
	lw	a3,-20(s0)
	add	a4,a2,a0
	mv	a6,a4
	sltu	a6,a6,a2
	add	a5,a3,a1
	add	a3,a6,a5
	mv	a5,a3
	sw	a4,-24(s0)
	sw	a5,-20(s0)
	lw	a2,-40(s0)
	lw	a3,-36(s0)
	li	a0,1
	li	a1,0
	add	a4,a2,a0
	mv	a6,a4
	sltu	a6,a6,a2
	add	a5,a3,a1
	add	a3,a6,a5
	mv	a5,a3
	sw	a4,-40(s0)
	sw	a5,-36(s0)
.L3:
	lw	a5,-36(s0)
	bne	a5,zero,.L8
	lw	a5,-36(s0)
	bne	a5,zero,.L4
	lw	a4,-40(s0)
	li	a5,8192
	addi	a5,a5,1807
	bleu	a4,a5,.L4
.L8:
	lw	a2,-32(s0)
	lw	a3,-28(s0)
	li	a0,1
	li	a1,0
	add	a4,a2,a0
	mv	a6,a4
	sltu	a6,a6,a2
	add	a5,a3,a1
	add	a3,a6,a5
	mv	a5,a3
	sw	a4,-32(s0)
	sw	a5,-28(s0)
.L2:
	lw	a5,-28(s0)
	bne	a5,zero,.L9
	lw	a5,-28(s0)
	bne	a5,zero,.L6
	lw	a4,-32(s0)
	li	a5,8192
	addi	a5,a5,1807
	bleu	a4,a5,.L6
.L9:
	call	clock
	sw	a0,-48(s0)
	lw	a4,-48(s0)
	lw	a5,-44(s0)
	sub	a5,a4,a5
	mv	a0,a5
	call	__floatunsidf
	mv	a4,a0
	mv	a5,a1
	lui	a3,%hi(.LC0)
	lw	a2,%lo(.LC0)(a3)
	lw	a3,%lo(.LC0+4)(a3)
	mv	a0,a4
	mv	a1,a5
	call	__divdf3
	mv	a4,a0
	mv	a5,a1
	mv	a0,a4
	mv	a1,a5
	lui	a5,%hi(.LC0)
	lw	a2,%lo(.LC0)(a5)
	lw	a3,%lo(.LC0+4)(a5)
	call	__muldf3
	mv	a4,a0
	mv	a5,a1
	sw	a4,-56(s0)
	sw	a5,-52(s0)
	nop
	lw	ra,60(sp)
	lw	s0,56(sp)
	lw	s2,52(sp)
	lw	s3,48(sp)
	addi	sp,sp,64
	jr	ra
	.size	main, .-main
	.section	.rodata
	.align	3
.LC0:
	.word	0
	.word	1093567616
	.ident	"GCC: (xPack GNU RISC-V Embedded GCC x86_64) 13.2.0"
