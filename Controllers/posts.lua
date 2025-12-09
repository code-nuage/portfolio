local mime = require("direct-mime")

local model_posts = require("../Models/posts.lua")

local view_post = require("../Views/post.lua")

local post_controller = {}

function post_controller.get(req, res)
    local id = tonumber(req:get_param("id"))

    if not model_posts[id] then
        res:get_not_found_fallback(req, res)
        return
    end

    res
    :set_code(200)
    :set_header("Content-Type", mime.types["html"])
    :set_body(view_post(id))
end

return post_controller