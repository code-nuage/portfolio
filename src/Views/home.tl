local fragment = require("fragment")
local presenter = require("presenter")

return function(): string
   local fragment_navbar = require("Fragments.navbar")()
   local fragment_footer = require("Fragments.footer")()

   local fragment_home: fragment = fragment.new(presenter("Templates/home.mustache"), {
      styles = {
         "/Styles/simpliestui.css",
         "/Styles/home.css"
      }
   })

   fragment_home:merge(fragment_navbar, "{{navbar}}")
   fragment_home:merge(fragment_footer, "{{footer}}")

   return fragment_home:build("Eloi Hariot • Portfolio")
end
