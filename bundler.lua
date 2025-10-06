local loader = require("direct")["loader"]

return function(content)
    local page = loader.read("./Templates/page.html")

    page = page:gsub("{{%s*(.-)%s*}}", function()
        return content or ""
    end)

    return page
end
