CROSS_COMPILE ?= riscv32-wch-elf-
CC = $(CROSS_COMPILE)gcc
OD = $(CROSS_COMPILE)objdump
OC = $(CROSS_COMPILE)objcopy
SZ = $(CROSS_COMPILE)size
DB = gdb
OCD ?= openocd-wch

V5F_CFLAGS += \
	      -march=rv32imac_zicsr_zifencei -mabi=ilp32 \
	      -nostdlib -nostartfiles -static -ggdb \
	      -T Link_v5f.ld \

V3F_CFLAGS += \
	      -march=rv32imac_zicsr_zifencei -mabi=ilp32 \
	      -nostdlib -nostartfiles -static -ggdb \
	      -T Link_v3f.ld \

all: v5f v3f

v5f:
	$(CC) $(V5F_CFLAGS) FORTH_V5F.S -o V5F.elf
	$(OD) -d V5F.elf > V5F.dis
	$(OC) -O ihex V5F.elf V5F.hex
	$(OC) -O binary V5F.elf V5F.bin
	$(SZ) V5F.elf

v3f:
	$(CC) $(V3F_CFLAGS) FORTH_V3F.S -o V3F.elf
	$(OD) -s -d V3F.elf > V3F.dis
	$(OC) -O ihex V3F.elf V3F.hex
	$(OC) -O binary V3F.elf V3F.bin
	$(SZ) V3F.elf


ocd:
	$(OCD) -f wch-dual-core.cfg

db-v5f:
	$(DB) -x gdbinit-v5f

db-v3f:
	$(DB) -x gdbinit-v3f


clean:
	rm -vf *.elf *.bin *.out *.dis *.map *.hex *.o
