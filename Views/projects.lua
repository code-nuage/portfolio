local presenter_navbar = require("../Presenters/navbar")
local presenter_projects = require("../Presenters/projects")
local presenter_footer = require("../Presenters/footer")

return function()
    local view_projects = table.concat({presenter_navbar(), presenter_projects(), presenter_footer()}, "\n\r")

    return view_projects
end
