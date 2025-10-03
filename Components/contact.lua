return function(text, icon, url)
    return {
        tag = "a",
        attributes = { class = "flex items-center gap-2", href = (url or "/") },
        content = {
            { tag = "img", attributes = { class = "w-[24px] h-[24px]", src = icon } },
            { tag = "span", attributes = { class = "font-medium text-md text-sky-50" }, content = (text or "Contact") }
        }
    }
end