local html = require("../Utils/direct/html")
local xml = require("../Utils/direct/xml")

local boilerplate = require("../boilerplate")

return function()
    local component_navbar = require("./Components/navbar")()
    local component_contacts = require("./Components/contacts")()
    local component_footer = require("./Components/footer")()

    local view_contacts = boilerplate()
    local body = xml.get_by_tag(view_contacts, "body")

    body[1].content = {
        component_navbar,
        component_contacts,
        component_footer
    }

    return html.build(view_contacts)
end