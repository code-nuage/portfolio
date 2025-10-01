local loader = require("../Utils/direct/loader")
local html = require("../Utils/direct/html")
local xml = require("../Utils/direct/xml")

local boilerplate = require("../boilerplate")

return function()
    local component_navbar = loader.read_json("./Components/navbar.json")
    local component_home = loader.read_json("./Components/home.json")
    local component_footer = loader.read_json("./Components/footer.json")

    local view_home = boilerplate()
    local body = xml.get_by_tag(view_home, "body")

    body[1].content = {
        component_navbar,
        component_home,
        component_footer
    }

    return html.build(view_home)
end