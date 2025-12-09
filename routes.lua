return function(app)
    require("./Routes/home.lua")(app)
    require("./Routes/projects.lua")(app)
    require("./Routes/posts.lua")(app)
end
