local presenter_navbar = require("../Presenters/navbar")
local presenter_not_found = require("../Presenters/not_found")

return function()
    local view_not_found = table.concat({presenter_navbar(), presenter_not_found()}, "\n\r")

    return view_not_found
end
