SPIKE ?= spike
CC ?= riscv64-unknown-elf-gcc

test: main
	$(SPIKE) main

main: main.s
	$(CC) -static -mcmodel=medany -fvisibility=hidden -nostdlib -nostartfiles -Tlink.ld \
		main.s -o main

clean:
	rm -f main

.PHONY: test clean
