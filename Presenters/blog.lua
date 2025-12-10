local bundler = require("../Utils/bundler.lua")

local model_articles = require("../Models/articles.lua")

local function get_flag(lang)
    if lang == "EN" then
        return "🇬🇧"
    elseif lang == "FR" then
        return "🇫🇷"
    end
end

return function(quantity, start)
    start = start or 1
    quantity = quantity or #model_articles
    local stop = start + quantity - 1

    local presenter_blog = ""

    for i = start, stop, 1 do
        local article = model_articles[i]

        if not article then
            return presenter_blog
        end

        local component_article = bundler.load("./Components/article.mu")

        component_article = component_article                                  -- stringify every value to avoid blocking nil values during mapping

        presenter_blog = presenter_blog .. component_article
        :gsub("{{data:title}}", article.title)
        :gsub("{{data:date}}", os.date("%m/%d/%Y", article.timestamp))
        :gsub("{{data:flag}}", get_flag(article.lang))
        :gsub("{{data:article_link}}", string.format("/blog/article/%d", i))
    end

    return presenter_blog
end
