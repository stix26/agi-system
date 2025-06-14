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

test: agi_system
	@echo "No tests implemented yet"

clean:
	rm -f $(OBJ) agi_system

.PHONY: all clean test
