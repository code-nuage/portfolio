local mime = require("../Utils/direct/mime")

local view_contacts = require("../Views/contacts")

local controller_contacts = {}

function controller_contacts.get()
    return 200, view_contacts(), mime["html"]
end

return controller_contacts