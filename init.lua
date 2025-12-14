local router = require("direct-router")
local routes = require("./routes.lua")

local app = router.new()
:add_plugin(require("direct-publicize"))
:add_plugin(require("direct-verbosity"))
:set_route_not_found(require("./Controllers/not_found.lua"))

routes(app)

app:start()
