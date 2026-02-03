local lfs <const> = require("lfs")

local record futils
   record FileData
      content: string
      modification: integer
   end
end

local function readfile(source: string): (string | boolean, string)
   local file = io.open(source, "rb")
   
   if not file then
      return false, "Can't open file " .. source
   end

   local content, err = file:read("*a")

   if not content then
      return false, err
   end

   file:close()

   return content, nil
end

function futils.read(source: string): (futils.FileData | boolean, string)
   local attr = lfs.attributes(source)
   local file_data: futils.FileData = {}

   if not attr then
      return false, "Filesystem object " .. source .. " doesn't exists"
   end

   if not (attr.mode == "file") then
      return false, "Filesystem object " .. source .. " is not a file"
   end

   local content, err = readfile(source)

   file_data.content = content as string
   file_data.modification = attr.modification

   if not content then
      return false, err
   end

   return file_data, nil
end

return futils