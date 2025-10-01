local controller_home = require("../Controllers/home")

return function(app)
    app:set_route("/", "GET", function(_, res)
        local status, body, mime = controller_home.get()
        res:set_status(status)
        :set_body(body)
        :set_header("Content-Type", mime)
    end)
end