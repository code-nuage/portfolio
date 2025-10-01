local router = require("./Utils/direct/router.lua")

local config = require("./config")

local route_home = require("./Routes/home")

local app = router.new()
:set_name("code-nuage@portfolio")
:set_verbosity(true)

app:publicize("./Public/")

route_home(app)

require("pretty-print").prettyPrint(app.routes)

app:bind(config.server.host, config.server.port):start()
