local presenter = require("presenter")
local fragment = require("fragment")

return function(): fragment
   return fragment.new(presenter("Templates/navbar.mustache"), {
      styles = {
         "/Styles/navbar.css"
      }
   })
end