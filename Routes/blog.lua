local controller_blog = require("../Controllers/blog.lua")

return function(app)
    app
    :add_route("/blog/:id", "GET", function(req, res)
        controller_blog.get_blog(req, res)
    end)
    :add_route("/blog/article/:title", "GET", function(req, res)
        controller_blog.get_article(req, res)
    end)
end
