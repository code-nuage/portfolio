local json = require("json")

local router = require("direct")["router"]
local loader = require("direct")["loader"]

local routes = require("./routes")

local controller_not_found = require("./Controllers/not_found")

local config = json.decode(loader.read("config.json"))

local app = router:new()
:set_name("code-nuage@portfolio")
:bind(config and config["server"]["host"] or "127.0.0.1", config and config["server"]["port"] or 80)
:publicize("./Public/")
:set_not_found(controller_not_found)
:set_log_file("./logs.txt")
:set_verbosity(true)

routes.home(app)
routes.projects(app)
routes.contacts(app)

app:start()
