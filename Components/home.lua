local component_button = require("../Components/button")

return function()
    return {
        tag = "main",
        content = {
            {
                tag = "section",
                attributes = { class = "h-lvh hero bg-[url(/hero_bg.webp)] flex justify-center items-center bg-cover" },
                content = {
                    {
                        tag = "div",
                        attributes = { 
                            class = [[left flex justify-center flex-col w-full max-w-2xl gap-2 p-4 
                                    bg-white bg-opacity-20 border border-white border-opacity-20 
                                    rounded-xl mx-4 backdrop-blur-md backdrop-saturate-175]]
                            },
                            content = {
                                {
                                    tag = "h1",
                                    attributes = { class = "title font-outfit text-4xl sm:text-5xl md:text-7xl font-extrabold text-sky-50" },
                                    content = "Eloi Hariot"
                                },
                                {
                                    tag = "div",
                                    attributes = { class = "flex flex-col sm:flex-row justify-between w-full gap-2" },
                                    content = {
                                        {
                                            tag = "h2",
                                            attributes = { class = "subtitle text-base sm:text-lg md:text-xl font-bold text-sky-50" },
                                            content = "Hi! I'm a french developer from Paris!"
                                        },
                                        component_button("View my projects", "https://www.github.com/code-nuage")
                                    }
                                }
                            }

                    }
                }
            },
            {
                tag = "section",
                attributes = { class = "about" },
                content = {}
            }
        }
    }
end