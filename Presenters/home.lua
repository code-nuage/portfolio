local loader = require("direct")["loader"]

return function()
    local presenter_home = loader.read("./Templates/home.html")

    return presenter_home
end
