local component_project = require("../Components/project")

return function()
    local projects_data = {
        {
            name = "profit",
            description = "An customized condoms e-commerce website",
            image = "/Assets/profit.webp",
            url = "https://www.github.com/code-nuage/profit",
            status = "FINISHED",
            button_text = "See on Github"
        },
        {
            name = "lui",
            description = "A Lua Terminal User Interface library",
            image = "/Assets/lui.webp",
            url = "https://github.com/code-nuage/lui",
            status = "DEVELOPMENT",
            button_text = "See on Github"
        },
        {
            name = "direct",
            description = "A Lua web microframework",
            image = "/Assets/direct.webp",
            url = "https://github.com/code-nuage/direct",
            status = "DEVELOPMENT",
            button_text = "See on Github"
        },
        {
            name = "Sous Terre Hein ?",
            description = "A physically deep game about Paris undergrounds",
            image = "/Assets/sous_terre_hein.webp",
            url = "https://nuageowo.itch.io/sous-terre-hein",
            status = "FINISHED",
            button_text = "See on itch.io"
        },
        {
            name = "Dotfiles",
            description = "My own dotfiles running on top Debian sid and labwc, using eww for widgets",
            image = "/Assets/dotfiles.webp",
            url = "https://github.com/code-nuage/dotfiles",
            status = "DEVELOPMENT",
            button_text = "See on Github"
        },
        {
            name = "Cinema Roll",
            description = "A movie listing website",
            image = "/Assets/cinema_roll.webp",
            url = "https://github.com/code-nuage/cinema-roll",
            status = "DEPRECATED",
            button_text = "See on Github"
        },
        {
            name = "simpliestui",
            description = "A CSS framework / design system to create very basic website",
            image = "/Assets/simpliestui.webp",
            url = "https://github.com/code-nuage/simpliestui",
            status = "FINISHED",
            button_text = "See on Github"
        }
    }

    local projects_nodes = {}
    for _, project in ipairs(projects_data) do
        local card = component_project(project.image, project.name, project.description, project.url, project.status, project.button_text)
        table.insert(projects_nodes, card)
    end

    return {
        tag = "section",
        attributes = {
            class = "min-h-screen hero bg-[url(/hero_bg.webp)] flex flex-col " ..
                    "items-center justify-start bg-cover gap-6 p-6 pt-[6rem]"
        },
        content = {
            {
                tag = "h1",
                attributes = {
                    class = "font-outfit text-2xl sm:text-3xl md:text-5xl font-bold text-sky-50"
                },
                content = "My projects"
            },
            {
                tag = "div",
                attributes = {
                    class = "grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 " ..
                            "gap-6 auto-rows-[24rem] w-full max-w-6xl"
                },
                content = projects_nodes
            }
        }
    }
end
