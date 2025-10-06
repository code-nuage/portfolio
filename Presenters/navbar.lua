local loader = require("direct")["loader"]

return function()
    local presenter_navbar = loader.read("./Templates/navbar.html")

    return presenter_navbar
end
