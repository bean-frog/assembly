section .data
	prompt db "Enter something:", 0xA
	prompt_len equ $ - prompt

section .bss
	buffer resb 1024 ; 1024 bytes allocated for input

section .text
	global _start

_start:
	; write prompt
	mov rax, 1
	mov rdi, 1
	mov rsi, prompt
	mov rdx, prompt_len
	syscall
	; read stdin
	mov eax, 0 ; syscall: sys_read
	mov edi, 0 ; file descriptor: stdin
	lea rsi, [buffer] ; input buffer
	mov edx, 1024 ; read 1024 bytes
	syscall

	; store num bytes read 
	mov edi, eax

	;; write to stdout
	mov eax, 1 ; syscall: sys_write
	mov edi, 1 ; file descriptor: stdout
	lea rsi, [buffer] ; buffer to write from
	syscall

	; exit
	mov eax, 60
	xor edi, edi
	syscall
