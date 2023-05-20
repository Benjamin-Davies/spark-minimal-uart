SPIKE ?= spike
RISCV_GCC ?= riscv64-unknown-elf-gcc

test: main
	$(SPIKE) main

main: main.s
	$(RISCV_GCC) -static -mcmodel=medany -fvisibility=hidden -nostdlib -nostartfiles -Tlink.ld \
		main.s -o main

clean:
	rm -f main

.PHONY: test clean
