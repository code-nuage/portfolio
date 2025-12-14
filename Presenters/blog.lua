local bundler = require("../Utils/bundler.lua")

local model_articles = require("../Models/articles.lua")

local function uri_encode(s)
    if s == nil then return nil end
    local out = {}
    local insert = table.insert
    local len = #s
    for i = 1, len do
        local b = string.byte(s, i)
        if (b >= 65 and b <= 90) or (b >= 97 and b <= 122)
            or (b >= 48 and b <= 57)
            or b == 45 or b == 46 or b == 95 or b == 126 then
            table.insert(out, string.char(b))
        else
            table.insert(out, string.format("%%%02X", b))
        end
    end
    return table.concat(out)
end

local function get_flag(lang)
    if lang == "EN" then
        return "🇬🇧"
    elseif lang == "FR" then
        return "🇫🇷"
    else
        return "🏳️"
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

        local link_uri = uri_encode(article.title)
        local link = string.format("/blog/article/%s", link_uri)
        :gsub("%%", "%%%%")

        presenter_blog = presenter_blog .. component_article
        :gsub("{{data:title}}", article.title)
        :gsub("{{data:date}}", os.date("%m/%d/%Y", article.timestamp))
        :gsub("{{data:flag}}", get_flag(article.lang))
        :gsub("{{data:article_link}}", link)
    end

    return presenter_blog
end
