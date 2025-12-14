local bundler = require("../Utils/bundler.lua")

return function(id)
    local start = (id - 1) * 9 + 1
    local quantity = 9

    local presenter_blog = require("../Presenters/blog.lua")

    local styles = {
        "/Styles/simpliestui.css",
        "/Styles/blog_page.css",
        "/Styles/navbar.css",
        "/Styles/blog.css",
        "/Styles/footer.css"
    }

    local options = {
        title = "Eloi Hariot | Blog",
        styles = styles
    }

    local template_nav = string.format([[<nav class="blog-nav"><a href="/blog/%d">Previous</a>
<a href="/blog/%d">Next</a></nav>]], id - 1 > 0 and id - 1 or 1, id + 1)

    local templates = {
        bundler.load("./Templates/navbar.mu"),
        bundler.load("./Templates/blog.mu"):gsub("{{data:blog}}", presenter_blog(quantity, start):gsub("%%", "%%%%"))
        :gsub("{{data:footer}}", template_nav),
        bundler.load("./Templates/footer.mu")
    }

    return bundler.build(table.concat(templates, "\n"), options)
end
