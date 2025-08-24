include config

EXEC = luajit++
LUA_SCRIPT = src/${EXEC}.lua
LUASTATIC = ${LUA_BINARY} ./deps/luastatic/luastatic.lua
# LIBS
LFS_DIR = ./deps/luafilesystem
LFS_LIB = ${LFS_DIR}/src/liblfs.a
#
LIBS = $(LUA_LIB) $(LFS_LIB)
FLAGS = -static -lm -ldl -Wl,-rpath=/usr/lib/x86_64-linux-gnu/

.PHONY: all clean

all: $(LFS_LIB) $(EXEC)

$(EXEC): $(LUA_SCRIPT) $(LFS_LIB)
	$(LUASTATIC) $< $(LIBS) -I$(LUA_INCLUDES) $(FLAGS) -o $@
	rm -f ${EXEC}.luastatic.c
	$(MAKE) -C ${LFS_DIR} clean

# Сборка LuaFileSystem
$(LFS_LIB):
	$(MAKE) -C ${LFS_DIR} \
		LUA_INCLUDES="$(LUA_INCLUDES)"

clean:
	rm -f $(EXEC)
	$(MAKE) -C ${LFS_DIR} clean
