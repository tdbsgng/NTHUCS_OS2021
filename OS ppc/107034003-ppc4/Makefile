

CC = sdcc
CFLAGS = -c 
LDFLAGS = 
#--stack-after-data --stack-loc 0x39 --data-loc 0x20

C_OBJECTS = test3threads.rel preemptive.rel

all: test3threads.hex

test3threads.hex:   $(C_OBJECTS) $(ASM_OBJECTS)
				$(CC) $(LDFLAGS) -o test3threads.hex $(C_OBJECTS)

clean:
	del *.hex *.ihx *.lnk *.lst *.map *.mem *.rel *.rst *.sym *.asm *.lk

%.rel:  %.c    preemptive.h Makefile
	$(CC) $(CFLAGS) $<
