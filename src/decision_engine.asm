section .data
    decision_msg db "Decision made: Task executed.", 0

section .text
    global decision_engine_main
    extern write_output

decision_engine_main:
    mov rdi, decision_msg
    call write_output
    ret