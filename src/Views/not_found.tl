local fragment = require("fragment")
local presenter = require("presenter")

return function(): string
   local fragment_navbar = require("Fragments.navbar")()
   local fragment_footer = require("Fragments.footer")()

   local fragment_not_found: fragment = fragment.new(presenter("Templates/not_found.mustache"), {
      styles = {
         "/Styles/simpliestui.css",
         "/Styles/not_found.css"
      }
   })

   fragment_not_found:merge(fragment_navbar, "{{navbar}}")
   fragment_not_found:merge(fragment_footer, "{{footer}}")

   return fragment_not_found:build("Eloi Hariot • 404")
end
