local controller_projects = require("../Controllers/projects")

return function(app)
    app:set_route("/projects", "GET", function(_, res)
        local status, body, mime = controller_projects.get()
        res:set_status(status)
        :set_body(body)
        :set_header("Content-Type", mime)
    end)
end