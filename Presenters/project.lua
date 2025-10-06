local loader = require("direct")["loader"]

return function(image_url, image_alt, title, description, status, link_url, link_name)
    local presenter_project = loader.read("./Templates/project.html")

    presenter_project = presenter_project
    :gsub("{{data:image_url}}", image_url)
    :gsub("{{data:image_alt}}", image_alt)
    :gsub("{{data:title}}", title)
    :gsub("{{data:description}}", description)
    :gsub("{{data:status}}", status)
    :gsub("{{data:link_url}}", link_url)
    :gsub("{{data:link_name}}", link_name)

    return presenter_project
end
