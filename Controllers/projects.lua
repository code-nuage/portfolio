local mime = require("../Utils/direct/mime")

local view_projects = require("../Views/projects")

local controller_projects = {}

function controller_projects.get()
    return 200, view_projects(), mime["html"]
end

return controller_projects