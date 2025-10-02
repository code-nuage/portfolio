return function(text, link, image)
    assert(type(text) == "string" and type(link) == "string", "Arguments <text> and <link> must be strings.")

    if image then
        return {
            tag = "a", attributes = { class = "px-2 py-1 flex justify-center objects-center rounded-md bg-gray-900 hover:bg-gray-700 transition duration-150 gap-2", href = link },
            content = {
                { tag = "span", attributes = { class = "text-sky-50" }, content = text },
                { tag = "img", attributes = { class = "w-[24px] h-[24px]", src = image } }
            }
        }
    end
    return {
        tag = "a", attributes = { class = "px-2 py-1 rounded-md bg-gray-900 text-sky-50 hover:bg-gray-700 transition duration-150", href = link },
        content = text
    }
end