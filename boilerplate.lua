local html = require("./Utils/direct/html")
local xml = require("./Utils/direct/xml")

return function()
    local boilerplate = html.generate_boilerplate()

    local head = xml.get_by_tag(boilerplate, "head")

    table.insert(head[1].content, { tag = "script", attributes = { src = "https://cdn.tailwindcss.com" }, content = "" })
    table.insert(head[1].content, { tag = "link", attributes = { rel = "stylesheet", href = "/reset.css" }})
    return boilerplate
end