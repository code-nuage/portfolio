local loader = require("direct")["loader"]

return function()
    local presenter_contacts = loader.read("./Templates/contacts.html")

    return presenter_contacts
end
