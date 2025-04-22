section .data
	hello db "hello world", 0xA
	hello_len equ $ - hello

section .text
	global _start

_start:
	mov rax, 1
	mov rdi, 1
	mov rsi, hello
	mov rdx, hello_len
	syscall

	mov rax, 60
	xor rdi, rdi
	syscall
