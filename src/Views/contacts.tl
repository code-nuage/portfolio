local fragment = require("fragment")
local presenter = require("presenter")

return function(): string
   local fragment_navbar = require("Fragments.navbar")()
   local fragment_footer = require("Fragments.footer")()

   local fragment_contacts: fragment = fragment.new(presenter("Templates/contacts.mustache"), {
      styles = {
         "/Styles/simpliestui.css",
         "/Styles/contacts.css"
      }
   })

   fragment_contacts:merge(fragment_navbar, "{{navbar}}")
   fragment_contacts:merge(fragment_footer, "{{footer}}")

   return fragment_contacts:build("Eloi Hariot • Contacts")
end
