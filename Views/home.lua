local html = require("../Utils/direct/html")
local xml = require("../Utils/direct/xml")

local boilerplate = require("../boilerplate")

return function()
    local component_navbar = require("./Components/navbar")()
    local component_home = require("./Components/home")()
    local component_footer = require("./Components/footer")()

    local view_home = boilerplate()
    local body = xml.get_by_tag(view_home, "body")

    body[1].content = {
        component_navbar,
        component_home,
        component_footer
    }

    return html.build(view_home)
end