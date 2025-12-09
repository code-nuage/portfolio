local fs = require("coro-fs")

local post_parser = require("../Utils/post_parser.lua")

local colors = require("direct-colors")

local posts = {}

for entry, scan_err in fs.scandir("./Posts") do
    if not entry then
        error(string.format("Can't scan: %s", scan_err))
    end

    if entry.type == "file" then
        local full_path = "./Posts/" .. entry.name

        local data, read_err = fs.readFile("./" .. full_path)

        if read_err then
            print(colors.colorize(string.format("Can't read file %s", full_path), {variant = "BOLD", color = "RED"}))
            break
        end

        local post, err = post_parser(data)

        if err then
            error(err)
        end

        table.insert(posts, post)
    end
end

table.sort(posts, function(a, b)
    return (a.timestamp or 0) > (b.timestamp or 0)
end)

return posts
