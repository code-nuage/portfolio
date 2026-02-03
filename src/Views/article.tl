local fragment = require("fragment")
local presenter = require("presenter")

local model_article = require("Models.article")

return function(name: string): string
   local fragment_navbar = require("Fragments.navbar")()
   local fragment_footer = require("Fragments.footer")()

   local article_data = model_article.get_by_name(name)

   local fragment_article: fragment = fragment.new(presenter("Templates/article.mustache")
      :gsub("{{article}}", article_data.content)
      :gsub("{{title}}", article_data.title)
      :gsub("{{date}}", article_data.date), {
      styles = {
         "/Styles/simpliestui.css",
         "/Styles/article.css"
      }
   })

   fragment_article:merge(fragment_navbar, "{{navbar}}")
   fragment_article:merge(fragment_footer, "{{footer}}")

   return fragment_article:build("Eloi Hariot • " .. article_data.title)
end
