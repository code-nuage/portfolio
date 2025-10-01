
-- direct/loader
-- @code-nuage

local fs = require("coro-fs")
local json = require("json")

local loader = {}

loader.read = function(path)
    local data = fs.readFile(path)
    return data
end

loader.read_json = function(path)
    local json_data = loader.read(path)
    local data = json.decode(json_data)
    return data
end

return loader