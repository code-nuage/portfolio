local mime = require("direct-mime")

return function(req, res)
    local view_home = require("../Views/not_found.lua")()

    res
    :set_code(404)
    :set_header("Content-Type", mime.types["html"])
    :set_body(view_home)
end
