local mime = require("direct")["mime"]

local bundler = require("../bundler")

local view_contacts = require("../Views/contacts")

local controller_contacts = {}

function controller_contacts.get()
    return 200, bundler(view_contacts()), mime["html"]
end

return controller_contacts