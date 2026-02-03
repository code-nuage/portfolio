local fragment = require("fragment")
local presenter = require("presenter")

local model_article = require("Models.article")

return function(page: integer): string
   local fragment_navbar = require("Fragments.navbar")()
   local fragment_footer = require("Fragments.footer")()

   local articles = model_article.get_page(page)

   -- This is a "collection" fragment used to collect every article, I maybe have to write a dedicated API function for it
   local fragment_articles: fragment = fragment.new("")

   for _, article in ipairs(articles) do
      local fragment_blog_article = require("Fragments.blog_article")(article)
      fragment_articles:merge(fragment_blog_article)
   end

   local fragment_blog: fragment = fragment.new(presenter("Templates/blog.mustache"), {
      styles = {
         "/Styles/simpliestui.css",
         "/Styles/blog.css"
      }
   })

   fragment_blog:merge(fragment_navbar, "{{navbar}}")
   fragment_blog:merge(fragment_footer, "{{footer}}")
   fragment_blog:merge(fragment_articles, "{{articles}}")

   return fragment_blog:build("Eloi Hariot • Blog")
end
