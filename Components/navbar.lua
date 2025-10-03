return function() 
    return {
        tag = "header", attributes = { class = "navbar fixed flex justify-center w-lvw transition duration-150 z-10" },
        content = {
            { tag = "script", attributes = { src = "/Scripts/navbar.js"}, content = ""},
            {
                tag = "nav", attributes = { class = "bg-white w-[100%] flex justify-between p-4 backdrop-blur-md backdrop-saturate-175 bg-opacity-30 transition duration-150" },
                content = {
                    {
                        tag = "div", attributes = { class = "left" },
                        content = {
                            { tag = "img", attributes = { src = "/icon_light.svg" } }
                        }
                    },
                    {
                        tag = "div", attributes = { class = "right flex items-center" },
                        content = {
                            { tag = "a", attributes = { href = "/", class = "text-sky-50 font-bold m-1" }, content = "Home" },
                            { tag = "a", attributes = { href = "/projects", class = "text-sky-50 font-bold m-1" }, content = "My projects" },
                            { tag = "a", attributes = { href = "/contacts", class = "text-sky-50 font-bold m-1" }, content = "Contact me" }
                        }
                    }
                }
            }
        }
    }
end