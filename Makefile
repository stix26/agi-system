# Simple Makefile for building AGI System and running tests

NASM=nasm
LD=ld
NASMFLAGS=-f elf64

SRC=src/main.asm src/neural_network.asm src/memory_manager.asm src/io_handler.asm src/decision_engine.asm
OBJ=$(SRC:.asm=.o)

all: agi_system

agi_system: $(OBJ)
	$(LD) -o $@ $^
	@echo "Build complete. Run ./agi_system to execute."

%.o: %.asm
	$(NASM) $(NASMFLAGS) -o $@ $<

TESTS=tests/test_io.asm tests/test_memory.asm tests/test_neural_net.asm tests/test_main.asm
TEST_OBJ=$(TESTS:.asm=.o)
TEST_LINK_OBJ=$(filter-out src/main.o,$(OBJ))

test: $(OBJ) $(TEST_OBJ)
	$(LD) -o tests/run_tests $(TEST_LINK_OBJ) $(TEST_OBJ)
	@echo "Running tests..."
	./tests/run_tests

clean:
	rm -f $(OBJ) $(TEST_OBJ) agi_system tests/run_tests

.PHONY: all clean test
