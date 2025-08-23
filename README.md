#### What is this?

A Lua interpreter with an extended standard library, based on LuaJIT. Compiles into a static binary.

#### Extended Standard Library

- [LFS](https://github.com/lunarmodules/luafilesystem/) - module for interacting with the file system

```lua
local function get_file_info(path)
    local attributes = fs.attributes(path)
    if attributes then
        print("File: " .. path)
    end
end

local function traverse_directory(path)
    for file in fs.dir(path) do
        if file ~= "." and file ~= ".." then
            local full_path = path .. "/" .. file
            local attr = fs.attributes(full_path)
            if attr.mode == "directory" then
                print("Dir: " .. full_path)
                traverse_directory(full_path)
            else
                get_file_info(full_path)
            end
        end
    end
end

traverse_directory(".")
```
