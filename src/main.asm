section .data
    welcome_msg db "AGI System Initializing...", 0

section .bss
    memory_space resb 1024  ; Reserve space for dynamic memory

section .text
    global _start
    extern init_memory_manager
    extern neural_network_main
    extern decision_engine_main

_start:
    ; Print welcome message
    mov rdi, welcome_msg
    call print_string

    ; Initialize memory manager
    call init_memory_manager

    ; Start the neural network engine
    call neural_network_main

    ; Enter decision-making loop
    call decision_engine_main

    ; Exit program
    mov rax, 60         ; syscall: exit
    xor rdi, rdi        ; status: 0
    syscall

print_string:
    ; Print a null-terminated string
    push rdi            ; preserve pointer to string
    mov rax, 1          ; syscall: write
    mov rdi, 1          ; file descriptor: stdout
    pop rsi             ; restore string address
    mov rdx, 25         ; string length
    syscall
    ret