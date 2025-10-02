local s = {
    ["DEVELOPMENT"] = 1,
    ["FINISHED"] = 2,
    ["DEPRECATED"] = 3,
    ["NONE"] = 4
}

local colors = {
    "orange-500",
    "green-500",
    "red-600",
    "gray-500"
}

return function(status)
    return {
        tag = "div", attributes = { class = (s[status] and string.lower(status) or "") .. " flex gap-2 items-center" },
        content = {
            {
                tag = "div", attributes = { class = "relative flex items-center justify-center rounded-[8px] bg-" .. colors[s[status] or s["NONE"]] },
                content = {
                    { tag = "div", attributes = { class = "w-[16px] h-[16px] rounded-[8px] relative z-10 bg-" .. colors[s[status] or s["NONE"]] }, content = "" },
                    { tag = "div", attributes = { class = "absolute w-[16px] h-[16px] rounded-[8px] opacity-30 animate-breathe bg-" .. colors[s[status] or s["NONE"]] }, content = "" },
                }
            },
            { tag = "span", attributes = { class = "text-sky-50 font-bold"}, content = status or "NONE" }
        }
    }
end