local fragment = require("fragment")
local presenter = require("presenter")

local model_project = require("Models.project")

return function(page: integer): string
   local fragment_navbar = require("Fragments.navbar")()
   local fragment_footer = require("Fragments.footer")()

   local projects = model_project.get_page(page)

   -- See Views/blog.tl
   local fragment_projects: fragment = fragment.new("")

   for _, project in ipairs(projects) do
      local fragment_portfolio_project = require("Fragments.portfolio_project")(project)
      fragment_projects:merge(fragment_portfolio_project)
   end

   local fragment_portfolio: fragment = fragment.new(presenter("Templates/portfolio.mustache"), {
      styles = {
         "/Styles/simpliestui.css",
         "/Styles/portfolio.css"
      }
   })

   fragment_portfolio:merge(fragment_navbar, "{{navbar}}")
   fragment_portfolio:merge(fragment_footer, "{{footer}}")
   fragment_portfolio:merge(fragment_projects, "{{projects}}")

   return fragment_portfolio:build("Eloi Hariot • Portfolio")
end
