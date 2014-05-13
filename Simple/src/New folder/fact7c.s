	.file	"test.c"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$7, %eax
	movl	$6, %edi
	jmp	.L2
.L3:
	subl	$1, %edi
	movl %eax, %edx
	movl %edi, %ecx
	jmp .L4
.L5:
	addl %edx, %eax
	subl $1, %ecx
.L4:
	cmpl	$0, %ecx
	jg	.L5
.L2:
	cmpl	$0, %edi
	jg	.L3
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (GNU) 4.8.2 20131212 (Red Hat 4.8.2-7)"
	.section	.note.GNU-stack,"",@progbits
