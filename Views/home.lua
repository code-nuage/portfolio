local bundler = require("../Utils/bundler.lua")

return function()
    local presenter_projects = require("../Presenters/projects.lua")
    local presenter_blog = require("../Presenters/blog.lua")

    local styles = {
        "/Styles/simpliestui.css",
        "/Styles/home.css",
        "/Styles/navbar.css",
        "/Styles/hero.css",
        "/Styles/projects.css",
        "/Styles/blog.css",
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
        bundler.load("./Templates/blog.mu"):gsub("{{data:blog}}", presenter_blog(3))
        :gsub("{{data:footer}}", "<a href=\"/blog/1\" class=\"see-more pos-right\">See more</a>"),
        bundler.load("./Templates/contacts.mu"),
        bundler.load("./Templates/footer.mu")
    }

    return bundler.build(table.concat(templates, "\n"), options)
end
