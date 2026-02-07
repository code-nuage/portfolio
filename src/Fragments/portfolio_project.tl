local presenter = require("presenter")
local fragment = require("fragment")

local type model_project = require("Models.project")

return function(project_data: model_project.ProjectData): fragment
   return fragment.new(presenter("Templates/portfolio_project.mustache")
      :gsub("{{img}}", project_data.img)
      :gsub("{{title}}", project_data.title)
      :gsub("{{description}}", project_data.description)
      :gsub("{{link}}", "/project/" .. project_data.filename), {
         styles = {
            "/Styles/portfolio_project.css"
         }
      })
end