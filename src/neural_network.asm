section .data
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
        mov al, [rsi + rcx]  ; Load weight
        imul al, [rdi + rcx] ; Multiply by input
        add [rdx + rcx], al  ; Add to output
        inc rcx              ; Increment counter
        cmp rcx, 2           ; Check if done
        jl .loop

    ret