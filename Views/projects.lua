local html = require("../Utils/direct/html")
local xml = require("../Utils/direct/xml")

local boilerplate = require("../boilerplate")

return function()
    local component_navbar = require("./Components/navbar")()
    local component_projects = require("./Components/projects")()
    local component_footer = require("./Components/footer")()

    local view_projects = boilerplate()
    local body = xml.get_by_tag(view_projects, "body")

    body[1].content = {
        component_navbar,
        component_projects,
        component_footer
    }

    return html.build(view_projects)
end