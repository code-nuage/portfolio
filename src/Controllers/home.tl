local type request = require("evasive.request")
local type response = require("evasive.response")

local mime <const> = require("evasive.mime")

local view_home = require("Views.home")

local controller_home = {}

function controller_home.index(_: request, res: response)
   res
   :set_body(view_home())
   :set_header("Content-Type", mime.get("html"))
end

return controller_home
