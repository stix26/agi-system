section .text
    global _start, test_neural_net
    extern neural_network_main
    extern output

_start:
    call test_neural_net
    mov rdi, rax
    mov rax, 60
    syscall

test_neural_net:
    call neural_network_main
    mov al, [output]
    cmp al, 5
    jne fail
    mov al, [output + 1]
    cmp al, 12
    jne fail
    xor rax, rax
    ret

fail:
    mov rax, 1
    ret
