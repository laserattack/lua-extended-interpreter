local dbg_info = debug.getinfo(1, "S")

print(fs.currentdir())
print(dbg_info.short_src)
