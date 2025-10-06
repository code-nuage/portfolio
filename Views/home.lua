local presenter_home = require("../Presenters/home")
local presenter_navbar = require("../Presenters/navbar")

return function()
    local view_home = table.concat({presenter_navbar(), presenter_home()}, "\n\r")

    return view_home
end
