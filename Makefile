include config

EXEC = runtime
LUA_SCRIPT = ${EXEC}.lua
LUASTATIC = ${LUA_BINARY} ./deps/luastatic/luastatic.lua
LFS_LIB = ./deps/luafilesystem/src/liblfs.a
LIBS = $(LUA_LIB) $(LFS_LIB)
FLAGS = -static -lm -ldl -Wl,-rpath=/usr/lib/x86_64-linux-gnu/

.PHONY: all clean

all: $(LFS_LIB) $(EXEC)

$(EXEC): $(LUA_SCRIPT) $(LFS_LIB)
	$(LUASTATIC) $< $(LIBS) $(LUA_INCLUDES) $(FLAGS) -o $@
	rm -f ${EXEC}.luastatic.c
	$(MAKE) -C ./deps/luafilesystem clean

# Сборка LuaFileSystem
$(LFS_LIB):
	$(MAKE) -C ./deps/luafilesystem \
		LUA_INCLUDES="$(LUA_INCLUDES)"

clean:
	rm -f $(EXEC)
	$(MAKE) -C ./deps/luafilesystem clean
