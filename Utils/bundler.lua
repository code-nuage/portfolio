local fs = require("coro-fs")


local M = {}

function M.load(path)
    return fs.readFile(path)
end

function M.build(content, options)
    assert(type(content) == "string",
        "Argument <title>: Must be a string.")
    assert(not type(options) or type(options) == "table",
        "Argument <options>: Must be a table.")
    assert(type(options.title) == "nil" or type(options.title) == "string",
        "Argument <options.title>: Must be a string.")
    assert(type(options.styles) == "nil" or type(options.styles) == "table",
        "Argument <options.styles>: Must be a table.")
    assert(type(options.scripts) == "nil" or type(options.scripts) == "table",
        "Argument <options.scripts>: Must be a table.")

    local bundle = [[<!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>{{options:title}}</title>{{options:styles}}
    </head>
    <body>{{data:content}}{{options:scripts}}
    </body>
    </html>]]

    local options = options or {}
    local title = options.title or "New Document"
    local styles = options.styles or {}
    local scripts = options.scripts or {}


    local data_styles = "\n"
    for _, path in ipairs(styles) do
        data_styles = data_styles .. string.format("<link rel=\"stylesheet\" href=\"%s\">\n", path)
    end


    local data_scripts = "\n"
    for _, path in ipairs(scripts) do
        data_scripts = data_scripts .. string.format("<script src=\"%s\"></script>\n", path)
    end

    bundle = bundle
    :gsub("{{options:title}}", title)
    :gsub("{{options:styles}}", data_styles)
    :gsub("{{data:content}}", content)
    :gsub("{{options:scripts}}", data_scripts)

    return bundle
end

return M