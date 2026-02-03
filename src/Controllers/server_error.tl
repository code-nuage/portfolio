local type request = require("evasive.request")
local type response = require("evasive.response")

local mime <const> = require("evasive.mime")

local view_server_error = require("Views.server_error")

local controller_server_error = {}

function controller_server_error.index(_: request, res: response)
   res
   :set_code(500)
   :set_body(view_server_error())
   :set_header("Content-Type", mime.get("html"))
end

return controller_server_error
