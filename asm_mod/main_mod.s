	.file	"main.c"
	.intel_syntax noprefix
	.text								# новая секция
	.section	.rodata
.LC0:									# .LC0: "r"
	.string	"r"
.LC1:                                   # .LC1: "input.txt"
	.string	"input.txt"
.LC2:                                   # .LC2: "%d"
	.string	"%d"
.LC3:                                   # .LC3: "w"
	.string	"w"
.LC4:                                   # .LC4: "output.txt"
	.string	"output.txt"
.LC5:                                   # .LC5: "%d"
	.string	"%d "

	.text								# секция с кодом
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp							# сохраняем rbp на стек
	mov	rbp, rsp						# rbp := rsp
	push	r15							# сохраняем r15 на стек
	push	r14							# сохраняем r14 на стек
	push	r12							# сохраняем r12 на стек
	push	rbx							# сохраняем rbx на стек
	sub	rsp, 240						# rsp -= 240
	mov	DWORD PTR -148[rbp], edi 		# argc в регистр edi
	mov	QWORD PTR -160[rbp], rsi 		# argv в регистр rsi
	mov	rax, rsp 						# rax := rsp
	mov	r12, rax 						# r12 := rax
	cmp	DWORD PTR -148[rbp], 2 			# if argc != 2:
	jne	.L2 							#	go to L2
	mov	rax, rsp 						# rax := rsp
	mov	rbx, rax 						# rbx := rsp(rax)
	mov	rax, QWORD PTR -160[rbp]		# rax := -160 на стеке (сохраняем argv[0])
	add	rax, 8 							# rax += 8 (argv[1])
	mov	rax, QWORD PTR [rax] 
	mov	rdi, rax
	call	atoi@PLT 					# atoi(argv[1])
	mov	DWORD PTR -140[rbp], eax 		# n = eax => (-148 = n)
	lea	rax, .LC0[rip] 
	mov	rsi, rax 						# rsi = "r"
	lea	rax, .LC1[rip]
	mov	rdi, rax 						# rdi "input.txt"
	call	fopen@PLT
	mov	QWORD PTR -96[rbp], rax 		# -96 = input
	mov	eax, DWORD PTR -140[rbp]		 
	movsx	rdx, eax
	sub	rdx, 1
	mov	QWORD PTR -104[rbp], rdx 		# указатель на массив A
	movsx	rdx, eax
	mov	QWORD PTR -176[rbp], rdx
	mov	QWORD PTR -168[rbp], 0
	movsx	rdx, eax
	mov	QWORD PTR -192[rbp], rdx
	mov	QWORD PTR -184[rbp], 0
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	eax, 16
	sub	rax, 1
	add	rax, rdx
	mov	esi, 16
	mov	edx, 0
	div	rsi
	imul	rax, rax, 16
	mov	rcx, rax
	and	rcx, -4096
	mov	rdx, rsp
	sub	rdx, rcx
.L3:
	cmp	rsp, rdx
	je	.L4
	sub	rsp, 4096
	or	QWORD PTR 4088[rsp], 0
	jmp	.L3
.L4: # for loop
	mov	rdx, rax
	and	edx, 4095
	sub	rsp, rdx
	mov	rdx, rax
	and	edx, 4095
	test	rdx, rdx
	je	.L5
	and	eax, 4095
	sub	rax, 8
	add	rax, rsp
	or	QWORD PTR [rax], 0
.L5:
	mov	rax, rsp
	add	rax, 3
	shr	rax, 2
	sal	rax, 2
	mov	QWORD PTR -112[rbp], rax
	mov	eax, DWORD PTR -140[rbp]
	movsx	rdx, eax
	sub	rdx, 1
	mov	QWORD PTR -120[rbp], rdx
	movsx	rdx, eax
	mov	QWORD PTR -208[rbp], rdx
	mov	QWORD PTR -200[rbp], 0
	movsx	rdx, eax
	mov	QWORD PTR -224[rbp], rdx
	mov	QWORD PTR -216[rbp], 0
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	eax, 16
	sub	rax, 1
	add	rax, rdx
	mov	esi, 16
	mov	edx, 0
	div	rsi
	imul	rax, rax, 16
	mov	rcx, rax
	and	rcx, -4096
	mov	rdx, rsp
	sub	rdx, rcx
.L6:
	cmp	rsp, rdx
	je	.L7
	sub	rsp, 4096
	or	QWORD PTR 4088[rsp], 0
	jmp	.L6
.L7:
	mov	rdx, rax
	and	edx, 4095
	sub	rsp, rdx
	mov	rdx, rax
	and	edx, 4095
	test	rdx, rdx
	je	.L8
	and	eax, 4095
	sub	rax, 8
	add	rax, rsp
	or	QWORD PTR [rax], 0
.L8:
	mov	rax, rsp
	add	rax, 3
	shr	rax, 2
	sal	rax, 2
	mov	QWORD PTR -128[rbp], rax
	mov	DWORD PTR -40[rbp], 0
	jmp	.L9
.L10:
	mov	eax, DWORD PTR -40[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -112[rbp]
	add	rdx, rax
	mov	rax, QWORD PTR -96[rbp]
	lea	rcx, .LC2[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	add	DWORD PTR -40[rbp], 1
.L9:
	mov	eax, DWORD PTR -140[rbp]
	cmp	DWORD PTR -40[rbp], eax
	jl	.L10
	mov	rax, QWORD PTR -96[rbp]
	mov	rdi, rax
	call	fclose@PLT
	mov	edx, DWORD PTR -140[rbp]
	mov	rcx, QWORD PTR -128[rbp]
	mov	rax, QWORD PTR -112[rbp]
	mov	rsi, rcx
	mov	rdi, rax
	call	logic_and_print@PLT
	mov	DWORD PTR -84[rbp], eax
	lea	rax, .LC3[rip]
	mov	rsi, rax
	lea	rax, .LC4[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -136[rbp], rax
	mov	DWORD PTR -44[rbp], 0
	jmp	.L11
.L12: 									# fprintf for loop
	mov	rax, QWORD PTR -128[rbp]
	mov	edx, DWORD PTR -44[rbp]
	movsx	rdx, edx
	mov	edx, DWORD PTR [rax+rdx*4]
	mov	rax, QWORD PTR -136[rbp]
	lea	rcx, .LC5[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	add	DWORD PTR -44[rbp], 1
.L11:
	mov	eax, DWORD PTR -44[rbp]
	cmp	eax, DWORD PTR -84[rbp]
	jl	.L12
	mov	rax, QWORD PTR -136[rbp]
	mov	rdi, rax
	call	fclose@PLT					# fclose "output.txt"
	mov	eax, 0
	mov	rsp, rbx
	jmp	.L13
.L2: 									# if argc != 2 
	lea	rax, -140[rbp]
	mov	rsi, rax
	lea	rax, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT			# scanf("%d", &n);
	mov	eax, DWORD PTR -140[rbp]
	movsx	rdx, eax
	sub	rdx, 1
	mov	QWORD PTR -56[rbp], rdx
	movsx	rdx, eax
	mov	QWORD PTR -240[rbp], rdx
	mov	QWORD PTR -232[rbp], 0
	movsx	rdx, eax
	mov	QWORD PTR -256[rbp], rdx
	mov	QWORD PTR -248[rbp], 0
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	eax, 16
	sub	rax, 1
	add	rax, rdx
	mov	ebx, 16
	mov	edx, 0
	div	rbx
	imul	rax, rax, 16
	mov	rcx, rax
	and	rcx, -4096
	mov	rdx, rsp
	sub	rdx, rcx
.L14:
	cmp	rsp, rdx
	je	.L15
	sub	rsp, 4096
	or	QWORD PTR 4088[rsp], 0
	jmp	.L14
.L15:
	mov	rdx, rax
	and	edx, 4095
	sub	rsp, rdx
	mov	rdx, rax
	and	edx, 4095
	test	rdx, rdx
	je	.L16
	and	eax, 4095
	sub	rax, 8
	add	rax, rsp
	or	QWORD PTR [rax], 0
.L16:
	mov	rax, rsp
	add	rax, 3
	shr	rax, 2
	sal	rax, 2
	mov	QWORD PTR -64[rbp], rax
	mov	eax, DWORD PTR -140[rbp]
	movsx	rdx, eax
	sub	rdx, 1
	mov	QWORD PTR -72[rbp], rdx
	movsx	rdx, eax
	mov	QWORD PTR -272[rbp], rdx
	mov	QWORD PTR -264[rbp], 0
	movsx	rdx, eax
	mov	r14, rdx
	mov	r15d, 0
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	eax, 16
	sub	rax, 1
	add	rax, rdx
	mov	ebx, 16
	mov	edx, 0
	div	rbx
	imul	rax, rax, 16
	mov	rcx, rax
	and	rcx, -4096
	mov	rdx, rsp
	sub	rdx, rcx
.L17:
	cmp	rsp, rdx
	je	.L18
	sub	rsp, 4096
	or	QWORD PTR 4088[rsp], 0
	jmp	.L17
.L18:
	mov	rdx, rax
	and	edx, 4095
	sub	rsp, rdx
	mov	rdx, rax
	and	edx, 4095
	test	rdx, rdx
	je	.L19
	and	eax, 4095
	sub	rax, 8
	add	rax, rsp
	or	QWORD PTR [rax], 0
.L19:
	mov	rax, rsp
	add	rax, 3
	shr	rax, 2
	sal	rax, 2
	mov	QWORD PTR -80[rbp], rax
	mov	DWORD PTR -36[rbp], 0
	jmp	.L20
.L21:
	mov	eax, DWORD PTR -36[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -64[rbp] 
	add	rax, rdx
	mov	rsi, rax
	lea	rax, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT 
	add	DWORD PTR -36[rbp], 1
.L20:
	mov	eax, DWORD PTR -140[rbp]
	cmp	DWORD PTR -36[rbp], eax
	jl	.L21
	mov	edx, DWORD PTR -140[rbp] 	# /
	mov	rcx, QWORD PTR -80[rbp]  	# |
	mov	rax, QWORD PTR -64[rbp]		# | подготовка аргументов для передачи в функцию  
	mov	rsi, rcx					# |
	mov	rdi, rax					# \
	call	logic_and_print@PLT  	# logic_and_print(rdi, rsi, edx);
	mov	DWORD PTR -84[rbp], eax
	mov	DWORD PTR -36[rbp], 0
	jmp	.L22
.L23:
	mov	rax, QWORD PTR -80[rbp]
	mov	edx, DWORD PTR -36[rbp]
	movsx	rdx, edx
	mov	eax, DWORD PTR [rax+rdx*4]
	mov	esi, eax
	lea	rax, .LC5[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	add	DWORD PTR -36[rbp], 1
.L22:
	mov	eax, DWORD PTR -36[rbp]
	cmp	eax, DWORD PTR -84[rbp]
	jl	.L23
	mov	eax, 0
.L13:
	mov	rsp, r12
	lea	rsp, -32[rbp]
	pop	rbx
	pop	r12
	pop	r14
	pop	r15
	pop	rbp
	ret							# выход
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
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
