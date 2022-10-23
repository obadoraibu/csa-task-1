	.file	"logic.c"
	.intel_syntax noprefix
	.text
	.globl	logic_and_print
	.type	logic_and_print, @function
logic_and_print:
	push	rbp			
	mov	rbp, rsp
	mov	QWORD PTR -24[rbp], rdi # указатель на А
	mov	QWORD PTR -32[rbp], rsi # указатель на В
	mov	DWORD PTR -36[rbp], edx # указатель на n
	mov	DWORD PTR -4[rbp], -1
	mov	DWORD PTR -8[rbp], -1
	mov	DWORD PTR -16[rbp], 0
	jmp	.L2
.L5:
	mov	eax, DWORD PTR -16[rbp]
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	test	eax, eax
	jns	.L3
	mov	eax, DWORD PTR -16[rbp]
	mov	DWORD PTR -8[rbp], eax
.L3:
	mov	eax, DWORD PTR -16[rbp]
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	test	eax, eax
	jle	.L4
	cmp	DWORD PTR -4[rbp], -1
	jne	.L4
	mov	eax, DWORD PTR -16[rbp]
	mov	DWORD PTR -4[rbp], eax
.L4:
	add	DWORD PTR -16[rbp], 1
.L2:
	mov	eax, DWORD PTR -16[rbp]
	cmp	eax, DWORD PTR -36[rbp]
	jl	.L5
	mov	DWORD PTR -12[rbp], 0
	mov	DWORD PTR -16[rbp], 0
	jmp	.L6
.L8:
	mov	eax, DWORD PTR -16[rbp]
	cmp	eax, DWORD PTR -8[rbp]
	je	.L7
	mov	eax, DWORD PTR -16[rbp]
	cmp	eax, DWORD PTR -4[rbp]
	je	.L7
	mov	eax, DWORD PTR -16[rbp]
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	edx, DWORD PTR -12[rbp]
	movsx	rdx, edx
	lea	rcx, 0[0+rdx*4]
	mov	rdx, QWORD PTR -32[rbp]
	add	rdx, rcx
	mov	eax, DWORD PTR [rax]
	mov	DWORD PTR [rdx], eax
	add	DWORD PTR -12[rbp], 1
.L7:
	add	DWORD PTR -16[rbp], 1
.L6:
	mov	eax, DWORD PTR -16[rbp]
	cmp	eax, DWORD PTR -36[rbp]
	jl	.L8
	mov	eax, DWORD PTR -12[rbp]
	pop	rbp
	ret
