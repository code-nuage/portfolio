local mime = require("direct-mime")

local model_projects = require("../Models/projects.lua")

local view_project = require("../Views/project.lua")

local project_controller = {}

function project_controller.get(req, res)
    local id = tonumber(req:get_param("id"))

    if not model_projects[id] then
        res:get_not_found_fallback(req, res)
        return
    end

    res
    :set_code(200)
    :set_header("Content-Type", mime.types["html"])
    :set_body(view_project(id))
end

return project_controller