local fragment = require("fragment")
local presenter = require("presenter")

local model_article = require("Models.article")
local model_project = require("Models.project")

return function(): string
   local fragment_navbar = require("Fragments.navbar")()
   local fragment_footer = require("Fragments.footer")()

   local articles = model_article.get_page(1, 3)
   local projects = model_project.get_page(1, 3)

   -- This is a "collection" fragment used to collect every article, I maybe have to write a dedicated API function for it
   local fragment_articles: fragment = fragment.new("")

   for _, article in ipairs(articles) do
      local fragment_blog_article = require("Fragments.blog_article")(article)
      fragment_articles:merge(fragment_blog_article)
   end

   -- This is a "collection" fragment used to collect every article, I maybe have to write a dedicated API function for it
   local fragment_projects: fragment = fragment.new("")

   for _, project in ipairs(projects) do
      local fragment_blog_project = require("Fragments.portfolio_project")(project)
      fragment_projects:merge(fragment_blog_project)
   end

   local fragment_home: fragment = fragment.new(presenter("Templates/home.mustache"), {
      styles = {
         "/Styles/simpliestui.css",
         "/Styles/home.css"
      }
   })

   fragment_home:merge(fragment_navbar, "{{navbar}}")
   fragment_home:merge(fragment_footer, "{{footer}}")
   fragment_home:merge(fragment_articles, "{{articles_preview}}")
   fragment_home:merge(fragment_projects, "{{projects_preview}}")

   return fragment_home:build("Eloi Hariot • Portfolio")
end
