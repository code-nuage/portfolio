local bundler = require("../Utils/bundler.lua")

local model_projects = require("../Models/projects.lua")

return function()
    local presenter_projects = ""

    for i, p in ipairs(model_projects) do
        local component_project = bundler.load("./Components/project.mu")

        local tags = ""

        for _, tag in ipairs(p.tags) do
            tags = tags .. string.format("<li><code>%s</code></li>", tag)
        end

        component_project = component_project                                  -- stringify every value to avoid blocking nil values during mapping
        :gsub("{{data:image_link}}", tostring(p.image_link))
        :gsub("{{data:image_alt}}", tostring(p.image_alt))
        :gsub("{{data:title}}", tostring(p.title))
        :gsub("{{data:description_short}}", tostring(p.description_short))
        :gsub("{{data:tags}}", tags)
        :gsub("{{data:project_link}}", string.format("/project/%d", i))

        presenter_projects = presenter_projects .. component_project
    end

    return presenter_projects
end
