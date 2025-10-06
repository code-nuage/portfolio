local mime = require("direct")["mime"]

local bundler = require("../bundler")

local view_not_found = require("../Views/not_found")

return function(_, res)
    res:set_status(404):set_body(bundler(view_not_found())):set_header("Content-Type", mime["html"])
end