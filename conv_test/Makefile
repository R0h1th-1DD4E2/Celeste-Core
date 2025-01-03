USE_MYSTDLIB = 0
OBJS = main.o stdlib.o
CFLAGS = -MD -O3 -mabi=ilp32 -march=rv32im -DTIME -DRISCV
TOOLCHAIN_PREFIX = /opt/riscv32im/bin/riscv32-unknown-elf-

ifeq ($(USE_MYSTDLIB),1)
CFLAGS += -DUSE_MYSTDLIB -ffreestanding -nostdlib
OBJS += start.o
else
OBJS += syscalls.o
endif

test: testbench.vvp main.hex
	vvp -N testbench.vvp

timing: timing.txt
	grep '^##' timing.txt | gawk 'x != "" {print x,$$3-y;} {x=$$2;y=$$3;}' | sort | uniq -c | \
		gawk '{printf("%03d-%-7s %2d %-8s (%d)\n",$$3,$$2,$$3,$$2,$$1);}' | sort | cut -c13-

timing.txt: timing.vvp main.hex
	vvp -N timing.vvp > timing.txt

testbench.vvp: testbench.v ../picorv32.v
	iverilog -o testbench.vvp testbench.v ../picorv32.v
	chmod -x testbench.vvp

testbench_nola.vvp: testbench_nola.v ../picorv32.v
	iverilog -o testbench_nola.vvp testbench_nola.v ../picorv32.v
	chmod -x testbench_nola.vvp

timing.vvp: testbench.v ../picorv32.v
	iverilog -o timing.vvp -DTIMING testbench.v ../picorv32.v
	chmod -x timing.vvp

main.hex: main.elf
	$(TOOLCHAIN_PREFIX)objcopy -O verilog $< $@

ifeq ($(USE_MYSTDLIB),1)
main.elf: $(OBJS) sections.lds
	$(TOOLCHAIN_PREFIX)gcc $(CFLAGS) -Wl,-Bstatic,-T,sections.lds,-Map,main.map,--strip-debug -o $@ $(OBJS) -lgcc
	chmod -x $@
else
main.elf: $(OBJS)
	$(TOOLCHAIN_PREFIX)gcc $(CFLAGS) -Wl,-Bstatic,-T,../firmware/riscv.ld,-Map,main.map,--strip-debug -o $@ $(OBJS) -lgcc -lc
	chmod -x $@
endif

%.o: %.c
	$(TOOLCHAIN_PREFIX)gcc -c $(CFLAGS) $<

%.o: %.S
	$(TOOLCHAIN_PREFIX)gcc -c $(CFLAGS) $<

main.o : CFLAGS += -Wno-implicit-int -Wno-implicit-function-declaration

clean:
	rm -rf *.o *.d main.elf main.map main.bin main.hex testbench.vvp testbench.vcd timing.vvp timing.txt testbench_nola.vvp

.PHONY: test clean

-include *.d

