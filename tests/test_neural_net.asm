section .text
    global test_neural_net
    extern neural_network_main

test_neural_net:
    call neural_network_main
    ; Add assertions to verify output
    ret