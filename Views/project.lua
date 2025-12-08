local bundler = require("../Utils/bundler.lua")

local model_projects = require("../Models/projects.lua")

return function(id)
    local project = model_projects[id]

    local styles = {
        "/Styles/simpliestui.css",
        "/Styles/project.css",
        "/Styles/navbar.css",
        "/Styles/footer.css"
    }

    local tags = ""

    for _, tag in ipairs(project.tags) do
        tags = tags .. string.format("<li><code>%s</code></li>", tag)
    end

    local templates = {
        bundler.load("./Templates/navbar.mu"),
        bundler.load("./Templates/project.mu")
        :gsub("{{data:image_link}}", project.image_link)
        :gsub("{{data:image_alt}}", project.image_alt)
        :gsub("{{data:title}}", project.title)
        :gsub("{{data:description_short}}", project.description_short)
        :gsub("{{data:tags}}", tags)
        :gsub("{{data:description_long}}", project.description_long)
        :gsub("{{data:link_url}}", project.link_url),
        bundler.load("./Templates/footer.mu")
    }

    local options = {
        title = "Eloi Hariot | " .. project.title,
        styles = styles
    }

    return bundler.build(table.concat(templates, "\n"), options)
end