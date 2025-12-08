return function(app)
    require("./Routes/home.lua")(app)
    require("./Routes/projects.lua")(app)
end
