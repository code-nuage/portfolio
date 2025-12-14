return function(app)
    require("./Routes/home.lua")(app)
    require("./Routes/projects.lua")(app)
    require("./Routes/blog.lua")(app)
end
