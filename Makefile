CC = gcc
CFLAGS = -std=c99 -Wall -Wextra -Werror -Wno-unused-parameter -Wno-sign-compare -O3 -flto
DEBUG_CFLAGS = -std=c99 -Wall -Wextra -Werror -Wno-unused-parameter -Wno-sign-compare -O0 -DDEBUG -g

HEADERS = $(wildcard *.h)
SOURCES = $(wildcard *.c)
OBJECTS = $(SOURCES:.c=.o)

all: clox

clox: $(OBJECTS)
	$(CC) $(CFLAGS) $(OBJECTS) -o clox

%.o: %.c $(HEADERS)
	$(CC) -c $(CFLAGS) $< -o $@

debug:
	$(CC) $(DEBUG_CFLAGS) $(SOURCES) -o cloxd

clean:
	@del /q /f *.o clox.exe cloxd.exe clox cloxd 2>nul || rm -f *.o clox cloxd

.PHONY: all clean debug
