local fragment = require("fragment")
local presenter = require("presenter")

return function(): string
   local fragment_navbar = require("Fragments.navbar")()
   local fragment_footer = require("Fragments.footer")()

   local fragment_server_error: fragment = fragment.new(presenter("Templates/server_error.mustache"), {
      styles = {
         "/Styles/simpliestui.css",
         "/Styles/server_error.css"
      }
   })

   fragment_server_error:merge(fragment_navbar, "{{navbar}}")
   fragment_server_error:merge(fragment_footer, "{{footer}}")

   return fragment_server_error:build("Eloi Hariot • 404")
end
