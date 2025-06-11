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
        mov bl, [rdi + rcx]  ; Load input
        imul bl              ; Multiply AL by BL -> AX
        add [rdx + rcx], al  ; Add low byte of result to output
        inc rcx              ; Increment counter
        cmp rcx, 2           ; Check if done
        jl .loop

    ret