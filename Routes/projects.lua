local controller_projects = require("../Controllers/projects.lua")

return function(app)
    app
    :add_route("/project/:id", "GET", function(req, res)
        controller_projects.get(req, res)
    end)
end
