local controller_contacts = require("../Controllers/contacts")

return function(app)
    app:set_route("/contacts", "GET", function(_, res)
        local status, body, mime = controller_contacts.get()
        res:set_status(status)
        :set_body(body)
        :set_header("Content-Type", mime)
    end)
end