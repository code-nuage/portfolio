local type request = require("evasive.request")
local type response = require("evasive.response")

local mime <const> = require("evasive.mime")

local view_not_found = require("Views.not_found")

local controller_not_found = {}

function controller_not_found.index(_: request, res: response)
   res
   :set_code(404)
   :set_body(view_not_found())
   :set_header("Content-Type", mime.get("html"))
end

return controller_not_found
