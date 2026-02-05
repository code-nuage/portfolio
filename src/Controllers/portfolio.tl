local type request = require("evasive.request")
local type response = require("evasive.response")

local mime <const> = require("evasive.mime")

local view_portfolio = require("Views.portfolio")
local view_project = require("Views.project")

local controller_portfolio = {}

function controller_portfolio.index(req: request, res: response)
   local page = req:get_query_param("page")
   res
   :set_body(view_portfolio(tonumber(page) as integer))
   :set_header("Content-Type", mime.get("html"))
end

function controller_portfolio.project(req: request, res: response)
   res
   :set_body(view_project(req:get_param("name")))
   :set_header("Content-Type", mime.get("html"))
end

return controller_portfolio
