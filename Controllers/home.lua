local mime = require("direct-mime")

local controller_home = {}

function controller_home.get(req, res)
    local view_home = require("../Views/home.lua")()

    res
    :set_code(200)
    :set_header("Content-Type", mime.types["html"])
    :set_body(view_home)
end

return controller_home
