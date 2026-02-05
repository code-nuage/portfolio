local fragment = require("fragment")
local presenter = require("presenter")

local model_project = require("Models.project")

return function(name: string): string
   local fragment_navbar = require("Fragments.navbar")()
   local fragment_footer = require("Fragments.footer")()

   local project_data = model_project.get_by_name(name)

   local fragment_project: fragment = fragment.new(presenter("Templates/project.mustache")
      :gsub("{{project}}", project_data.content)
      :gsub("{{img}}", project_data.img)
      :gsub("{{title}}", project_data.title)
      :gsub("{{date}}", project_data.date)
      :gsub("{{description}}", project_data.description)
      :gsub("{{external_link}}", project_data.link), {
      styles = {
         "/Styles/simpliestui.css",
         "/Styles/project.css"
      }
   })

   fragment_project:merge(fragment_navbar, "{{navbar}}")
   fragment_project:merge(fragment_footer, "{{footer}}")

   return fragment_project:build("Eloi Hariot • " .. project_data.title)
end
