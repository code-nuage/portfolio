local component_button = require("../Components/button")
local component_project_status = require("../Components/project_status")

return function(image, name, description, url, status, button_text)
    return {
            tag = "div",
            attributes = {
                class = "flex flex-col justify-between h-full p-4 " ..
                        "bg-white bg-opacity-20 border border-white border-opacity-20 " ..
                        "rounded-xl backdrop-blur-md backdrop-saturate-175"
            },
            content = {
                {
                    tag = "div",
                    attributes = { class = "flex flex-col gap-2" },
                    content = {
                        image ~= "" and {
                            tag = "img",
                            attributes = {
                                src = image,
                                class = "w-full aspect-[16/9] rounded-md object-cover"
                            }
                        } or nil,
                        {
                            tag = "h3",
                            attributes = { class = "font-bold text-sky-50 text-xl" },
                            content = name
                        },
                        {
                            tag = "p",
                            attributes = { class = "text-sky-50 text-sm sm:text-base" },
                            content = description
                        }
                    }
                },
                {
                    tag = "div", attributes = { class = "flex gap-2 items-center justify-between" }, content = {
                        component_project_status(status),
                        component_button(button_text, url, "/Assets/link.svg")
                    }
                }
            }
        }
end