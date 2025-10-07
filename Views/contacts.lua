local presenter_navbar = require("../Presenters/navbar")
local presenter_contacts = require("../Presenters/contacts")
local presenter_footer = require("../Presenters/footer")

return function()
    local view_contacts = table.concat({presenter_navbar(), presenter_contacts(), presenter_footer()}, "\n\r")

    return view_contacts
end
