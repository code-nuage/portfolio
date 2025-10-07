local presenter_navbar = require("../Presenters/navbar")
local presenter_home = require("../Presenters/home")
local presenter_footer = require("../Presenters/footer")

return function()
    local view_home = table.concat({presenter_navbar(), presenter_home(), presenter_footer()}, "\n\r")

    return view_home
end
