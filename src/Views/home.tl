local fragment = require("fragment")
local presenter = require("presenter")

local model_article = require("Models.article")

return function(): string
   local fragment_navbar = require("Fragments.navbar")()
   local fragment_footer = require("Fragments.footer")()

   local articles = model_article.get_page(1, 3)

   -- This is a "collection" fragment used to collect every article, I maybe have to write a dedicated API function for it
   local fragment_articles: fragment = fragment.new("")

   for _, article in ipairs(articles) do
      local fragment_blog_article = require("Fragments.blog_article")(article)
      fragment_articles:merge(fragment_blog_article)
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

   return fragment_home:build("Eloi Hariot • Portfolio")
end
