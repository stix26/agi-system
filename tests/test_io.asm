section .data
    io_msg db "Test IO", 10, 0

section .text
    global test_io
    extern write_output

test_io:
    mov rdi, io_msg
    call write_output
    ; Add assertions to verify I/O operations
    ret