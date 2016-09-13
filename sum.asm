; initialize data section
section .data
	; define constant
	; equ, db are a psuedo instruction
	num1: equ 100
	num2: equ 70

	msg1: db "Sum is correct\n"
	msg2: db "Sum is not correct\n"

section .text
	global _start

; entry point
_start:
	;move num1 to rax
	mov rax, num1 

	;move num2 to rax
	mov rbx, num2

	;add rax and rbx and result into rax
	add rax, rbx

	; cmp the result
	cmp rax, 150

	; jump if not equal
	jne _notrightsum

	; jump if equal
	jmp	_rightsum

_notrightsum:
	;; syswrite
	mov rax, 1
	mov rdi, 1
	mov rsi, msg2 
	mov rdx, 15
	syscall
	jmp _exit

_rightsum:
	;; sys_write syscall
	mov rax, 1

	;; stdout
	mov rdi, 1
	;; buf argument to sys_write
	mov rsi, msg1

	;; buf count
	mov rdx, 15

	syscall

	jmp _exit

_exit:
	;; sys_exit syscall
	mov rax, 60
	;; error/exit code
	mov rdi, 0

	syscall
