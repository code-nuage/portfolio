local loader = require("direct")["loader"]

return function()
    local presenter_not_found = loader.read("./Templates/not_found.html")

    return presenter_not_found
end
