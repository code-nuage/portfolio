local controller_home = require("./Controllers/home")
local controller_projects = require("./Controllers/projects")

local routes = {}

function routes.home(app)
    app:set_route("/", "GET", function(req, res)
        local status, body, mime = controller_home.get()
        res:set_status(status):set_body(body):set_header("Content-Type", mime)
    end)
end

function routes.projects(app)
    app:set_route("/projects", "GET", function(req, res)
        local status, body, mime = controller_projects.get()
        res:set_status(status):set_body(body):set_header("Content-Type", mime)
    end)
end

function routes.contacts(app)
    
end

return routes