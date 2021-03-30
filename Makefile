CC=gcc
CFLAGS=-I.
DEPS=

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

all: poc.o
	$(CC) -o poc poc.o 

clean:
	rm -f poc poc.o
