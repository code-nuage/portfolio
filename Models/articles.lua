local fs = require("coro-fs")

local article_parser = require("../Utils/article_parser.lua")

local colors = require("direct-colors")

local articles = {}

for entry, scan_err in fs.scandir("./Articles") do
    if not entry then
        error(string.format("Can't scan: %s", scan_err))
    end

    if entry.type == "file" then
        local full_path = "./Articles/" .. entry.name

        local data, read_err = fs.readFile("./" .. full_path)

        if read_err then
            print(colors.colorize(string.format("Can't read file %s", full_path), {variant = "BOLD", color = "RED"}))
            break
        end

        local article, err = article_parser(data)

        if err then
            error(err)
        end

        table.insert(articles, article)
    end
end

table.sort(articles, function(a, b)
    return (a.timestamp or 0) > (b.timestamp or 0)
end)

return articles
