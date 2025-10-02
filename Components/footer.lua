-- footer.lua
return function()
    return {
        tag = "footer",
        attributes = { class = "footer p-8 bg-gray-900" },
        content = {
            {
                tag = "span",
                attributes = { class = "copyright text-sky-50" },
                content = "2025 © code-nuage@portfolio"
            }
        }
    }
end