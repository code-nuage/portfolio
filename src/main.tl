local router <const> = require("evasive.router")

local app = router:new({host = "0.0.0.0", port = 8080})
require("static")(app, "./Static/", "/")
require("middlewares")(app)
require("routes")(app)
app:start()
