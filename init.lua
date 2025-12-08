local router = require("direct-router")
local routes = require("./routes.lua")

local app = router.new()
:add_plugin(require("direct-publicize"))
:add_plugin(require("direct-verbosity"))

routes(app)

app:start()
