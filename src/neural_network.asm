section .data
    global weights, inputs, output
    weights db 1, 2, 3, 4
    inputs db 5, 6
    output resb 2

section .text
    global neural_network_main

neural_network_main:
    mov rsi, weights    ; Pointer to weights
    mov rdi, inputs     ; Pointer to inputs
    mov rdx, output     ; Pointer to output

    xor rcx, rcx        ; Clear counter
    .loop:
        movzx rax, byte [rsi + rcx]  ; Load weight
        movzx rbx, byte [rdi + rcx]  ; Load input
        imul rax, rbx                ; Multiply
        add [rdx + rcx], al          ; Add low byte of result
        inc rcx                      ; Increment counter
        cmp rcx, 2                   ; Check if done
        jl .loop

    ret
