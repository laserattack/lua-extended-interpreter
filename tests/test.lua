local function get_file_info(path)
    local attributes = fs.attributes(path)
    if attributes then
        print("Name: " .. path)
        print("File: " .. attributes.size .. " байт")
        print("Modified: " .. os.date("%c", attributes.modification))
        print("Type: " .. attributes.mode)
        print("")
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

-- Основная логика
print("Current dir: " .. fs.currentdir())
traverse_directory(".")
