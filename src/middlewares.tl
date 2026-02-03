local type router = require("evasive.router")
local type request = require("evasive.request")
local type response = require("evasive.response")

local colors = require("evasive.colors")

local model_article = require("Models.article")

return function(app: router)
   app
   --+ Logger +--
   :add_middleware(function(req: request, res: response, n: function)
      local start = os.clock()

      n()

      print(string.format(
         "%s %s %s %s",
         colors.colorize_method(req:get_method(), " " .. req:get_method() .. " "),
         colors.colorize("%{bright blue}" .. req:get_path()),
         colors.colorize_code(res:get_code()),
         string.format("%.2fms", (os.clock() - start) * 1000)
      ))
   end)
   :add_middleware(function(req: request, res: response, n: function)
      if req:get_path():match("^/article/") then
         if model_article.get_by_name(req:get_param("name")) then
            n()
         else
            app:execute_not_found(req, res)
         end
      else
         n()
      end
   end)
end

