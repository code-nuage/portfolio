local type request = require("evasive.request")
local type response = require("evasive.response")

local mime <const> = require("evasive.mime")

local view_contacts = require("Views.contacts")

local controller_contacts = {}

function controller_contacts.index(_: request, res: response)
   res
   :set_body(view_contacts())
   :set_header("Content-Type", mime.get("html"))
end

return controller_contacts
