section .text
    global _start, test_memory
    extern init_memory_manager, allocate_memory, free_memory

_start:
    call test_memory
    mov rdi, rax        ; exit code
    mov rax, 60         ; syscall: exit
    syscall

test_memory:
    call init_memory_manager
    mov rdi, 16
    call allocate_memory
    cmp rax, rsi
    jne fail
    mov rdi, 0
    call free_memory
    cmp rsi, 0
    jne fail
    xor rax, rax
    ret

fail:
    mov rax, 1
    ret
