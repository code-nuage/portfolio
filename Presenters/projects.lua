local loader = require("direct")["loader"]

local presenter_project = require("./project")

local model_projects = require("../Models/projects")

return function()
    local presenter_projects = loader.read("./Templates/projects.html")

    local projects = {}

    for _, p in ipairs(model_projects) do
        table.insert(projects, presenter_project(p.image_url, p.image_alt, p.title, p.description, p.status, p.link_url, p.link_name))
    end

    presenter_projects = presenter_projects:gsub("{{data:projects}}", table.concat(projects))

    return presenter_projects
end
