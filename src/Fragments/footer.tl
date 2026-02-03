local presenter = require("presenter")
local fragment = require("fragment")

return function(): fragment                                                    -- Return a function for hot-reload with make watch
   return fragment.new(presenter("Templates/footer.mustache"), {
      styles = {
         "/Styles/footer.css"
      }
   })
end