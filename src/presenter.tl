local futils <const> = require("Utils.futils")

return function(template_path: string): (string, futils.FileData)
   local data, _ = futils.read(template_path) as (futils.FileData, string)

   if not data then return "", {} end

   return data.content, data
end
