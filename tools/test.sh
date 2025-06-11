#!/bin/bash
set -e

assemble() {
    nasm -f elf64 -o "$2" "$1"
}

run_test() {
    local test_file=$1
    shift
    echo "Building $test_file"
    objs=""
    for src in "$@"; do
        obj="$(basename "${src%.asm}.o")"
        assemble "$src" "$obj"
        objs+=" $obj"
    done
    assemble "tests/$test_file.asm" "$test_file.o"
    ld -o "$test_file" "$test_file.o" $objs
    echo "Running $test_file"
    if ./${test_file} < /dev/null; then
        echo "$test_file: PASS"
    else
        echo "$test_file: FAIL"
        FAILURES=1
    fi
}

FAILURES=0
run_test test_io src/io_handler.asm
run_test test_memory src/memory_manager.asm
run_test test_neural_net src/neural_network.asm

if [ "$FAILURES" -eq 0 ]; then
    echo "All tests passed."
else
    echo "Some tests failed." >&2
    exit 1
fi
