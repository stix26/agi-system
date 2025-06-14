section .text
    global test_memory
    extern init_memory_manager, allocate_memory

test_memory:
    call init_memory_manager
    mov rdi, 16
    call allocate_memory
    ; Add assertions to verify memory allocation
    ret