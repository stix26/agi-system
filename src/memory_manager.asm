section .bss
    heap_start resb 1024
    heap_end   resq 1        ; pointer to end of heap

section .text
    global init_memory_manager, allocate_memory, free_memory

init_memory_manager:
    lea rax, [heap_start]
    mov [heap_end], rax
    ret

allocate_memory:
    mov rax, [heap_end] ; Current heap end
    mov rdx, rdi        ; Requested size
    add [heap_end], rdx ; Update heap end
    ; Return pointer to allocated block in rax
    ret

free_memory:
    lea rax, [heap_start]
    mov [heap_end], rax
    ret