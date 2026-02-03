local type request = require("evasive.request")
local type response = require("evasive.response")

local mime <const> = require("evasive.mime")

local view_blog = require("Views.blog")
local view_article = require("Views.article")

local controller_blog = {}

function controller_blog.index(req: request, res: response)
   local page = req:get_query_param("page")
   res
   :set_body(view_blog(tonumber(page) as integer))
   :set_header("Content-Type", mime.get("html"))
end

function controller_blog.article(req: request, res: response)
   res
   :set_body(view_article(req:get_param("name")))
   :set_header("Content-Type", mime.get("html"))
end

return controller_blog
