local mime = require("direct")["mime"]

local bundler = require("../bundler")

local view_home = require("../Views/home")

local controller_home = {}

function controller_home.get()
    return 200, bundler(view_home()), mime["html"]
end

return controller_home