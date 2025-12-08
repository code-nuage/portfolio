local controller_home = require("../Controllers/home.lua")

return function(app)
    app
    :add_route("/", "GET", function(req, res)
        controller_home.get(req, res)
    end)
end
