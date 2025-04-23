section .bss
    buffer1 resb 1024
    buffer2 resb 1024

section .data
    prompt db "Enter string:"
    prompt_len equ $ - prompt

    same db "They're the same", 10
    same_len equ $ - same

    diff db "They're different", 10
    diff_len equ $ - diff

section .text
    global _start

_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, prompt
    mov rdx, prompt_len
    syscall

    mov rax, 0
    mov rdi, 0
    lea rsi, [buffer1]
    mov rdx, 1024
    syscall
    mov r12, rax ; store len

    mov rax, 1
    mov rdi, 1
    mov rsi, prompt
    mov rdx, prompt_len
    syscall

    mov rax, 0
    mov rdi, 0
    lea rsi, [buffer2]
    mov rdx, 1024
    syscall
    mov r13, rax ; store len

    ; compare lengths
    cmp r12, r13
    jne not_equal

    lea rsi, [buffer1]
    lea rdi, [buffer2]
    xor rcx, rcx

compare_loop:
    cmp rcx, r12
    je equal

    mov al, [rsi + rcx]
    mov bl, [rdi + rcx]
    cmp al, bl
    jne not_equal

    inc rcx
    jmp compare_loop

equal:
    mov rax, 1
    mov rdi, 1
    mov rsi, same
    mov rdx, same_len
    syscall
    jmp done

not_equal:
    mov rax, 1
    mov rdi, 1
    mov rsi, diff
    mov rdx, diff_len
    syscall

done:
    mov rax, 60
    xor rdi, rdi
    syscall
