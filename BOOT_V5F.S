	.section	.init,"ax",@progbits
	.global	_start
	.align	2
_start:
	j	handle_reset

	.section	.handle_reset,"ax",@progbits
	.weak	handle_reset
	.align	1
handle_reset:
1:
	li x1, 0x5F
	nop
	j 1b
