local router = require("./Utils/direct/router.lua")

local config = require("./config")

local route_home = require("./Routes/home")
local route_projects = require("./Routes/projects")

local app = router.new()
:set_name("code-nuage@portfolio")
:set_verbosity(true)

app:publicize("./Public/")

route_home(app)
route_projects(app)

app:bind(config.server.host, config.server.port):start()
