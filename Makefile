test: main
	~/src/riscv-isa-sim/build/spike main

main: main.s
	riscv64-unknown-elf-gcc	\
		-static -mcmodel=medany -fvisibility=hidden -nostdlib -nostartfiles -Tlink.ld \
		main.s -o main

clean:
	rm -f main

.PHONY: test clean
