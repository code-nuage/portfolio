local bundler = require("../Utils/bundler.lua")

return function()
    local styles = {
        "/Styles/simpliestui.css",
        "/Styles/navbar.css",
        "/Styles/not_found.css",
        "/Styles/footer.css"
    }

    local options = {
        title = "Eloi Hariot | 404",
        styles = styles
    }

    local templates = {
        bundler.load("./Templates/navbar.mu"),
        bundler.load("./Templates/not_found.mu"),
        bundler.load("./Templates/footer.mu")
    }

    return bundler.build(table.concat(templates, "\n"), options)
end
