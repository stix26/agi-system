section .bss
    heap_start resb 1024
    heap_end resb 0

section .text
    global init_memory_manager, allocate_memory, free_memory

init_memory_manager:
    mov rdi, heap_start
    mov rsi, heap_end
    ret

allocate_memory:
    mov rax, rdi        ; Requested size
    add rsi, rax        ; Move heap end
    mov rax, rsi        ; Return pointer to allocated block
    ret

free_memory:
    mov rsi, rdi        ; Reset heap end to start
    ret