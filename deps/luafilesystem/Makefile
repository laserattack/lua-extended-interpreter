T= lfs

WARN= -O2 -Wall -fPIC -W -Waggregate-return -Wcast-align -Wmissing-prototypes -Wnested-externs -Wshadow -Wwrite-strings -pedantic
# LUA_INCLUDES прилетает от родительского makefile
CFLAGS= $(WARN) -I$(LUA_INCLUDES)
CC= gcc

SRCS= src/$T.c
OBJS= src/$T.o

all: static

static: src/liblfs.a

src/liblfs.a: $(OBJS)
	ar rcs $@ $(OBJS)
	ranlib $@

clean:
	rm -f src/liblfs.a $(OBJS)

.PHONY: all clean static
