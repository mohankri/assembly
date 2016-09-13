section .data
	msg db	"hello, world"

section .text
	global _start


_start:
     
    ; 
	; sys_write(fd, buf, count);
    ; rax: syscall number 1 = syscall number i.e sys_write
    ;			rdi = 1 i.e stdout
	;			rsi = buffer i.e msg
    ;			rdx = count i.e string length;
    ;

	; put 1 to rax register rax-temp register; when we call syscall rax must contain syscall number
	mov rax, 1	

	; put 1 to rdi register: rdi: used to pass 1st argument to the function, stdout.
	mov rdi, 1 

	; rsi: used to pass 2nd argument to the function.
	mov rsi, msg 

	; rdx: used to pass 3rd argument to the function.
	mov rdx, 13  

	syscall

	; 60 is syscall number of exit	
	mov rax, 60 

	; error code of the program
	mov rdi, 0 
	
	syscall
