section .text
    global _start
    extern test_io, test_memory, test_neural_net

_start:
    call test_io
    call test_memory
    call test_neural_net
    ; Exit with status 0
    mov rax, 60
    xor rdi, rdi
    syscall
