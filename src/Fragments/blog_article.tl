local presenter = require("presenter")
local fragment = require("fragment")

local type model_article = require("Models.article")

return function(article_data: model_article.ArticleData): fragment
   return fragment.new(presenter("Templates/blog_article.mustache")
      :gsub("{{title}}", article_data.title)
      :gsub("{{date}}", article_data.date)
      :gsub("{{link}}", "/article/" .. article_data.filename), {
         styles = {
            "/Styles/blog_article.css"
         }
      })
end