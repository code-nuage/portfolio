local type router = require("evasive.router")

local controller_server_error = require("Controllers.server_error")
local controller_not_found = require("Controllers.not_found")
local controller_home = require("Controllers.home")
local controller_portfolio = require("Controllers.portfolio")
local controller_blog = require("Controllers.blog")
local controller_contacts = require("Controllers.contacts")

return function(app: router)
   app
   :set_server_error_handler(controller_server_error.index)

   --+ Not found +--
   :set_route_not_found(controller_not_found.index)

   --+ Home +--
   :add_route("GET", "/", controller_home.index)

   --+ Portfolio +--
   :add_route("GET", "/portfolio", controller_portfolio.index)
   :add_route("GET", "/project/:name", controller_portfolio.project)

   --+ Blog +--
   :add_route("GET", "/blog", controller_blog.index)
   :add_route("GET", "/article/:name", controller_blog.article)

   --+ Contacts +--
   :add_route("GET", "/contacts", controller_contacts.index)
end
