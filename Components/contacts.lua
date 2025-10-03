local component_contact = require("../Components/contact")

return function()
    local contacts_data = {
        {
            text = "Github",
            icon = "/Assets/github.svg",
            url = "https://www.github.com/code-nuage"
        },
        {
            text = "LinkedIN",
            icon = "/Assets/linkedin.svg",
            url = "https://www.linkedin.com/in/eloi-hariot-4769aa309/"
        }
    }

    local contacts_nodes = {}
    for _, contact in ipairs(contacts_data) do
        local c = component_contact(contact.text, contact.icon, contact.url)
        table.insert(contacts_nodes, c)
    end

    return {
        tag = "section",
        attributes = { class = "hero flex justify-center items-center h-lvh bg-[url(/hero_bg.webp)] bg-cover" },
        content = {
            {
                tag = "div",
                attributes = {
                    class = [[left flex justify-center flex-col w-full max-w-2xl gap-2 p-4 
                            bg-white bg-opacity-20 border border-white border-opacity-20 
                            rounded-xl mx-4 backdrop-blur-md backdrop-saturate-175]]
                },
                content = {
                    { tag = "h2", attributes = { class = "font-outfit text-2xl sm:text-2xl md:text-xl font-bold text-sky-50" }, content = "Contact me" },
                    { tag = "div", attributes = { class = "flex flex-col" }, content = contacts_nodes }
                }
            }
        }
    }
end