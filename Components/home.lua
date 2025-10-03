local component_button = require("../Components/button")

return function()
    return {
        tag = "main",
        attributes = { class = "h-lvh bg-[url(/hero_bg.webp)] bg-cover" },
        content = {
            {
                tag = "section",
                attributes = { class = "h-[512px] hero flex justify-center items-center" },
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
                                    tag = "script",
                                    attributes = { src = "/Scripts/hero.js" },
                                    content = ""
                                },
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
                                            content = "👋 Hi! I'm a french developer from Paris!"
                                        },
                                        component_button("View my projects", "/projects")
                                    }
                                }
                            }

                    }
                }
            },
            {
                tag = "section",
                attributes = { class = "hero flex justify-center items-center" },
                content = {
                    { tag = "div", attributes = { 
                        class = [[justify-center flex-col w-full max-w-2xl gap-2 p-4 
                            bg-white bg-opacity-20 border border-white border-opacity-20 
                            rounded-xl mx-4 backdrop-blur-md backdrop-saturate-175]]
                        },
                        content = {
                            { tag = "h2", attributes = { class = "font-outfit text-2xl font-bold text-sky-50" }, content = "About me"},
                            { tag = "p", attributes = { class = "text-xl font-medium text-sky-50" }, content = "Hi! My name is Eloi. I’m a French developer based between Paris and Orléans. I’m currently studying at CODA in Orléans while completing a work-study program at Ipsos France in Gentilly."},
                            { tag = "p", attributes = { class = "text-xl font-medium text-sky-50" }, content = "I’m passionate about web development — I enjoy manipulating technologies and divert them from their objectives, using Lua to develop website, using JSON as a markup language and many more exotic things..."},
                            { tag = "p", attributes = { class = "text-xl font-medium text-sky-50" }, content = "I’m also currently developing a video game about Paris undergrounds. You can find all my projects by clicking on 'View my projects'."}
                        }
                    }
                }
            }
        }
    }
end