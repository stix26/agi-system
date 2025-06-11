section .text
    global _start, test_io
    extern read_input, write_output

_start:
    call test_io
    mov rdi, rax        ; exit code from test
    mov rax, 60         ; syscall: exit
    syscall

test_io:
    call read_input
    cmp rax, 0
    jl fail
    call write_output
    cmp rax, 0
    jl fail
    xor rax, rax
    ret

fail:
    mov rax, 1
    ret
