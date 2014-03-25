OBJS = bcc_lib.o
CFLAGS = -Wall

default: bcc_tool

bcc_tool: $(OBJS) bcc_tool.c 
	$(CC) $^ -o bcc_tool -lm

clean:
	rm -f *.o *~ core bcc_tool txdac_tool
