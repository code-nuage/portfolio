local loader = require("direct")["loader"]

return function()
    local presenter_footer = loader.read("./Templates/footer.html")

    return presenter_footer
end
