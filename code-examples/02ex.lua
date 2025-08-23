-- Удаление директории, наполненной файлами
function recursive_rmdir(path)
    local attr = fs.attributes(path)
    if not attr then return true end
    if attr.mode == "file" then
        return os.remove(path)
    end
    for file in fs.dir(path) do
        if file ~= "." and file ~= ".." then
            local full_path = path .. "/" .. file
            recursive_rmdir(full_path)
        end
    end
    -- rmdir удаляет пустую директорию
    return fs.rmdir(path)
end

recursive_rmdir("./code-examples/tmp")
