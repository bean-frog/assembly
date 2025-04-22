section .data
    prompt db "Enter something to add to file:", 0xA
    prompt_len equ $ - prompt

    filename db "file.txt", 0
    O_WRONLY equ 1
    O_CREAT  equ 64
    O_APPEND equ 1024
    MODE_644 equ 0o644 ; file permission

section .bss
    buffer resb 1024 ; input buffer
    bytes_read resq 1

section .text
    global _start

_start:
    ; write prompt to stdout
    mov rax, 1              ; sys_write
    mov rdi, 1              ; stdout
    mov rsi, prompt
    mov rdx, prompt_len
    syscall

    ; read from stdin
    mov rax, 0              ; sys_read
    mov rdi, 0              ; stdin
    mov rsi, buffer
    mov rdx, 1024
    syscall
    mov [bytes_read], rax  ; save number of bytes read

    ; open file with O_WRONLY | O_CREAT | O_APPEND
    mov rax, 2              ; sys_open
    mov rdi, filename       ; pointer to filename
    mov rsi, O_WRONLY | O_CREAT | O_APPEND
    mov rdx, MODE_644       ; file mode
    syscall
    mov rbx, rax            ; save file descriptor

    ; write input to file
    mov rax, 1              ; sys_write
    mov rdi, rbx            ; file descriptor
    mov rsi, buffer         ; buffer to write
    mov rdx, [bytes_read]   ; number of bytes read
    syscall

    ; close file
    mov rax, 3              ; sys_close
    mov rdi, rbx
    syscall

    ; exit
    mov rax, 60             ; sys_exit
    xor rdi, rdi
    syscall
