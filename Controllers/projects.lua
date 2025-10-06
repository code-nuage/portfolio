local mime = require("direct")["mime"]

local bundler = require("../bundler")

local view_projects = require("../Views/projects")

local controller_projects = {}

function controller_projects.get()
    return 200, bundler(view_projects()), mime["html"]
end

return controller_projects