local bundler = require("../Utils/bundler.lua")

local model_articles = require("../Models/articles.lua")

local function get_flag(lang)
    if lang == "EN" then
        return "🇬🇧"
    elseif lang == "FR" then
        return "🇫🇷"
    else
        return "🏳️"
    end
end

local function map_article_tags(content)
    local remapped_content = ""

    for _, tag in ipairs(content) do
        local remapped_tag
        if tag.tag == "paragraph" then
            remapped_tag = string.format("<p>%s</p>\n", tag.content)
        elseif tag.tag == "sub" then
            remapped_tag = string.format("<h3 class=\"text-size-display-small text-weight-bold\">%s</h3>\n", tag.content)
        elseif tag.tag == "image" then
            remapped_tag = string.format("<div class=\"image-container\"><img class=\"pos-center\" src=\"%s\"></div>\n", tag.content)
        elseif tag.tag == "bullet" then
            remapped_tag = string.format("<li>%s</li>\n", tag.content)
        else
            remapped_tag = string.format("<span>%s</span>\n", tag.content)
        end

        remapped_content = remapped_content .. remapped_tag
    end

    return remapped_content
end

return function(id)
    local article = model_articles[id]

    local styles = {
        "/Styles/simpliestui.css",
        "/Styles/navbar.css",
        "/Styles/article.css",
        "/Styles/footer.css"
    }

    local template_article = bundler.load("./Templates/article.mu")
    :gsub("{{data:title}}", article.title)
    :gsub("{{data:flag}}", get_flag(article.lang))
    :gsub("{{data:date}}", os.date("%m/%d/%Y", article.timestamp))
    :gsub("{{data:content}}", map_article_tags(article.content))

    local templates = {
        bundler.load("./Templates/navbar.mu"),
        template_article,
        bundler.load("./Templates/footer.mu")
    }

    local options = {
        title = "Eloi Hariot | " .. article.title,
        styles = styles
    }

    local template = bundler.build(table.concat(templates, "\n"), options)

    return template
end
