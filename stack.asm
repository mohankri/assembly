global _start
section .data
	msg db "H"

section .text
; RBP is the base pointer register
; RSP is the stack pointer register 
_start:
	mov rax, 1
	mov rdx, 2

	; push rax to the stack
	; it will increment the stack pointer and store it in RSP register
	push rax

	; push rdx to the stack
	; it will increment the stack pointer and store it in RSP register
	push rdx

	mov rdx, [rsp+4]

	; sys_write
	mov rax, 1
	; stdout
	mov rdi, 1

	; buffer already in rdx;
	;mov rsi, rdx	
	mov rsi, msg	

	; sizeof the buffer
	mov rdx, 1

	syscall

	mov rax, 60
	mov rdi, 0
	syscall
	

	


	
