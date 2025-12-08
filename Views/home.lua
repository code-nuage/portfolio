local bundler = require("../Utils/bundler.lua")

return function()
    local presenter_projects = require("../Presenters/projects.lua")

    local styles = {
        "/Styles/simpliestui.css",
        "/Styles/home.css",
        "/Styles/navbar.css",
        "/Styles/hero.css",
        "/Styles/projects.css",
        "/Styles/contacts.css",
        "/Styles/footer.css"
    }

    local options = {
        title = "Eloi Hariot | Portfolio",
        styles = styles
    }

    local templates = {
        bundler.load("./Templates/navbar.mu"),
        bundler.load("./Templates/hero.mu"),
        bundler.load("./Templates/projects.mu"):gsub("{{data:projects}}", presenter_projects()),
        bundler.load("./Templates/contacts.mu"),
        bundler.load("./Templates/footer.mu")
    }

    return bundler.build(table.concat(templates, "\n"), options)
end
