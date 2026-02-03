local type router = require("evasive.router")
local type request = require("evasive.request")
local type response = require("evasive.response")

local lfs <const> = require("lfs")

local mime <const> = require("evasive.mime")
local colors <const> = require("evasive.colors")

local options = require("options")
local futils = require("Utils.futils")
local join = require("Utils.join")

local function publish(app: router, cd?: string, prefix?: string)
   cd = cd or "Static"
   prefix = prefix or "/Static/"

   if not lfs.attributes(cd) then
      error("Directory Object doesn't exists")
   end

   for obj in lfs.dir(cd) do
      if obj ~= "." and obj ~= ".." then
         local obj_path = join(cd, obj)
         local attr = lfs.attributes(obj_path)

         if attr.mode == "directory" then
            publish(app, obj_path, prefix .. obj .. "/")
         elseif attr.mode == "file" then
            local file_data, err = futils.read(obj_path) as (futils.FileData, string)

            if not file_data then
               print(colors.colorize("%{redbg} " .. prefix .. obj .. " %{reset} " .. obj_path .. " (" .. err .. ")"))
               app:add_route("GET", prefix .. obj, function(_: request, res: response)
                  res
                  :set_code(500)
                  :set_body(err)
                  :set_header("Content-type", mime.get("txt"))
               end)
            end

            print(colors.colorize("%{greenbg} " .. prefix .. obj .. " %{reset} " .. obj_path))
            if options.environment == "prod" then
               app:add_route("GET", prefix .. obj, function(_: request, res: response)
                  res
                  :set_body(file_data.content as string)
                  :set_header("Content-type", mime.guess(obj))
               end)
            elseif options.environment == "dev" then
               app:add_route("GET", prefix .. obj, function(_: request, res: response)
                  file_data, err = futils.read(obj_path) as (futils.FileData, string)

                  if not file_data then
                     res
                     :set_body(err)
                  else
                     res
                     :set_body(file_data.content as string)
                  end
                  res
                  :set_header("Content-type", mime.guess(obj))
               end)
            end
         end
      end
   end
end

return function(app: router, cd?: string, prefix?: string)
   print(colors.colorize("%{bluebg} Static files "))
   publish(app, cd, prefix)
end