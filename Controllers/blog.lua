local mime = require("direct-mime")

local model_articles = require("../Models/articles.lua")

local view_article = require("../Views/article.lua")
local view_blog = require("../Views/blog.lua")

local article_controller = {}

local function uri_encode(s)
    if s == nil then return nil end
    local out = {}
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

function article_controller.get_blog(req, res)
    local id = tonumber(req:get_param("id"))

    if id * 9 - 9 > #model_articles or id <= 0 then
        res:get_not_found_fallback(req, res)
        return
    end

    res
    :set_code(200)
    :set_header("Content-Type", mime.types["html"])
    :set_body(view_blog(id))
end

function article_controller.get_article(req, res)
    local title = req:get_param("title")

    local article, id

    for i, a in ipairs(model_articles) do
        local uri_title = uri_encode(a.title)

        if uri_title == title then
            article = a
            id = i
        end
    end

    if not article then
        res:get_not_found_fallback(req, res)
        return
    end

    res
    :set_code(200)
    :set_header("Content-Type", mime.types["html"])
    :set_body(view_article(id))
end

return article_controller
