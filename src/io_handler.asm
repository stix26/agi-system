section .bss
    input_buffer resb 256

section .text
    global read_input, write_output

read_input:
    mov rax, 0          ; syscall: read
    mov rdi, 0          ; stdin
    mov rsi, input_buffer
    mov rdx, 256        ; Max input size
    syscall
    ret

write_output:
    mov rax, 1          ; syscall: write
    mov rdi, 1          ; stdout
    mov rsi, rdi        ; Output buffer
    mov rdx, 256        ; Output size
    syscall
    ret