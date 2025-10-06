local presenter_navbar = require("../Presenters/navbar")
local presenter_projects = require("../Presenters/projects")

return function()
    local view_projects = table.concat({presenter_navbar(), presenter_projects()}, "\n\r")

    return view_projects
end
