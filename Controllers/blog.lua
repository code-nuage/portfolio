local mime = require("direct-mime")

local model_articles = require("../Models/articles.lua")

local view_article = require("../Views/article.lua")
local view_blog = require("../Views/blog.lua")

local article_controller = {}

function article_controller.get_blog(req, res)
    local id = tonumber(req:get_param("id"))

    res
    :set_code(200)
    :set_header("Content-Type", mime.types["html"])
    :set_body(view_blog(id))
end

function article_controller.get_article(req, res)
    local id = tonumber(req:get_param("id"))

    if not model_articles[id] then
        res:get_not_found_fallback(req, res)
        return
    end

    res
    :set_code(200)
    :set_header("Content-Type", mime.types["html"])
    :set_body(view_article(id))
end

return article_controller
