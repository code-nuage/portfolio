local mime = require("../Utils/direct/mime")

local view_home = require("../Views/home")

local controller_home = {}

function controller_home.get()
    return 200, view_home(), mime["html"]
end

return controller_home