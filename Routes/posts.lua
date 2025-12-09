local controller_posts = require("../Controllers/posts.lua")

return function(app)
    app
    :add_route("/post/:id", "GET", function(req, res)
        controller_posts.get(req, res)
    end)
end
