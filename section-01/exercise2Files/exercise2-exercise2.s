	.file	"exercise2.c"
	.text
	.globl	row
	.section	.rodata
	.align 4
	.type	row, @object
	.size	row, 4
row:
	.long	10000
	.globl	col
	.align 4
	.type	col, @object
	.size	col, 4
col:
	.long	10000
.LC1:
	.string	"Execution time: %f seconds\n"
	.align 8
.LC2:
	.string	"Execution time pt: %f seconds\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$120, %rsp
	.cfi_offset 3, -24
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movl	$10000, %edx
	movl	$10000, %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	create_matrix@PLT
	movq	%rax, -80(%rbp)
	movq	%rdx, -72(%rbp)
	movl	$0, -128(%rbp)
	jmp	.L2
.L5:
	movl	$0, -124(%rbp)
	jmp	.L3
.L4:
	movq	-72(%rbp), %rdx
	movl	-80(%rbp), %eax
	imull	-128(%rbp), %eax
	movl	%eax, %ecx
	movl	-124(%rbp), %eax
	addl	%ecx, %eax
	cltq
	salq	$2, %rax
	leaq	(%rdx,%rax), %rbx
	call	rand@PLT
	movl	%eax, (%rbx)
	addl	$1, -124(%rbp)
.L3:
	movl	-80(%rbp), %eax
	cmpl	%eax, -124(%rbp)
	jl	.L4
	addl	$1, -128(%rbp)
.L2:
	movl	-76(%rbp), %eax
	cmpl	%eax, -128(%rbp)
	jl	.L5
	call	clock@PLT
	movq	%rax, -120(%rbp)
	movq	-80(%rbp), %rdx
	movq	-72(%rbp), %rax
	movq	%rdx, %rdi
	movq	%rax, %rsi
	call	matrix_transpose
	movq	%rax, -64(%rbp)
	movq	%rdx, -56(%rbp)
	call	clock@PLT
	movq	%rax, -112(%rbp)
	call	clock@PLT
	movq	%rax, -104(%rbp)
	movl	-76(%rbp), %edx
	movl	-80(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	create_matrix@PLT
	movq	%rax, -48(%rbp)
	movq	%rdx, -40(%rbp)
	leaq	-48(%rbp), %rdx
	leaq	-80(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	matrix_transpose_pt
	call	clock@PLT
	movq	%rax, -96(%rbp)
	movq	-112(%rbp), %rax
	subq	-120(%rbp), %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC0(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -88(%rbp)
	movq	-88(%rbp), %rax
	movq	%rax, %xmm0
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	movq	-96(%rbp), %rax
	subq	-104(%rbp), %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC0(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -88(%rbp)
	movq	-88(%rbp), %rax
	movq	%rax, %xmm0
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	$0, -72(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	$0, -56(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	$0, -40(%rbp)
	movl	$0, %eax
	movq	-24(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L7
	call	__stack_chk_fail@PLT
.L7:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.globl	matrix_transpose
	.type	matrix_transpose, @function
matrix_transpose:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, %rax
	movq	%rsi, %rcx
	movq	%rcx, %rdx
	movq	%rax, -48(%rbp)
	movq	%rdx, -40(%rbp)
	movl	-44(%rbp), %edx
	movl	-48(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	create_matrix@PLT
	movq	%rax, -16(%rbp)
	movq	%rdx, -8(%rbp)
	movl	$0, -24(%rbp)
	jmp	.L9
.L12:
	movl	$0, -20(%rbp)
	jmp	.L10
.L11:
	movq	-40(%rbp), %rdx
	movl	-48(%rbp), %eax
	imull	-24(%rbp), %eax
	movl	%eax, %ecx
	movl	-20(%rbp), %eax
	addl	%ecx, %eax
	cltq
	salq	$2, %rax
	leaq	(%rdx,%rax), %rcx
	movq	-8(%rbp), %rdx
	movl	-44(%rbp), %eax
	imull	-20(%rbp), %eax
	movl	%eax, %esi
	movl	-24(%rbp), %eax
	addl	%esi, %eax
	cltq
	salq	$2, %rax
	addq	%rax, %rdx
	movl	(%rcx), %eax
	movl	%eax, (%rdx)
	addl	$1, -20(%rbp)
.L10:
	movl	-48(%rbp), %eax
	cmpl	%eax, -20(%rbp)
	jl	.L11
	addl	$1, -24(%rbp)
.L9:
	movl	-44(%rbp), %eax
	cmpl	%eax, -24(%rbp)
	jl	.L12
	movq	-16(%rbp), %rax
	movq	-8(%rbp), %rdx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	matrix_transpose, .-matrix_transpose
	.globl	matrix_transpose_pt
	.type	matrix_transpose_pt, @function
matrix_transpose_pt:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L15
	movq	$0, -32(%rbp)
	movl	$-1, %eax
	jmp	.L16
.L15:
	movq	-24(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, -8(%rbp)
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -4(%rbp)
	movl	$0, -16(%rbp)
	jmp	.L17
.L20:
	movl	$0, -12(%rbp)
	jmp	.L18
.L19:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rdx
	movl	-16(%rbp), %eax
	imull	-4(%rbp), %eax
	movl	%eax, %ecx
	movl	-12(%rbp), %eax
	addl	%ecx, %eax
	cltq
	salq	$2, %rax
	leaq	(%rdx,%rax), %rcx
	movq	-32(%rbp), %rax
	movq	8(%rax), %rdx
	movl	-12(%rbp), %eax
	imull	-8(%rbp), %eax
	movl	%eax, %esi
	movl	-16(%rbp), %eax
	addl	%esi, %eax
	cltq
	salq	$2, %rax
	addq	%rax, %rdx
	movl	(%rcx), %eax
	movl	%eax, (%rdx)
	addl	$1, -12(%rbp)
.L18:
	movl	-12(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jl	.L19
	addl	$1, -16(%rbp)
.L17:
	movl	-16(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jl	.L20
	movl	$0, %eax
.L16:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	matrix_transpose_pt, .-matrix_transpose_pt
	.section	.rodata
.LC3:
	.string	"[%i]"
	.text
	.globl	matrix_printf
	.type	matrix_printf, @function
matrix_printf:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, %rax
	movq	%rsi, %rcx
	movq	%rcx, %rdx
	movq	%rax, -32(%rbp)
	movq	%rdx, -24(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L22
.L25:
	movl	$0, -4(%rbp)
	jmp	.L23
.L24:
	movq	-24(%rbp), %rdx
	movl	-32(%rbp), %eax
	imull	-8(%rbp), %eax
	movl	%eax, %ecx
	movl	-4(%rbp), %eax
	addl	%ecx, %eax
	cltq
	salq	$2, %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -4(%rbp)
.L23:
	movl	-32(%rbp), %eax
	cmpl	%eax, -4(%rbp)
	jl	.L24
	movl	$10, %edi
	call	putchar@PLT
	addl	$1, -8(%rbp)
.L22:
	movl	-28(%rbp), %eax
	cmpl	%eax, -8(%rbp)
	jl	.L25
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	matrix_printf, .-matrix_printf
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1093567616
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04.3) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
