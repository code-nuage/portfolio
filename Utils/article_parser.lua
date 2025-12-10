local function parse_date(date_str)
    local month, day, year = date_str:match("^(%d%d)/(%d%d)/(%d%d%d%d)$")
    if not month then
        return nil, "Invalid date format"
    end

    month = tonumber(month)
    day   = tonumber(day)
    year  = tonumber(year)

    return os.time({
        year = year,
        month = month,
        day = day
    })
end

return function(text)
    local header_part, body_part = text:match("^(.-)\n\n(.*)$")
    if not header_part then
        return nil, "Invalid format"
    end

    local result = { content = {} }

    for line in header_part:gmatch("[^\n]+") do
        line = line:match("^%s*(.-)%s*$")

        local key, value = line:match("^(%w+)%s*:%s*(.+)$")
        if key and value then
            key = key:lower()

            if key == "title" then
                result.title = value
            elseif key == "date" then
                local timestamp, err = parse_date(value)
                result.timestamp = timestamp
            elseif key == "lang" then
                result.lang = value
            end
        end
    end

    for line in body_part:gmatch("[^\n]+") do
        local trimmed = line:match("^%s*(.-)%s*$")

        local tag, value = trimmed:match("^(%w+)%s*:%s*(.+)$")

        if tag and value then
            tag = tag:lower()

            table.insert(result.content, {
                tag = tag,
                content = value
            })
        elseif trimmed ~= "" then
            table.insert(result.content, {
                tag = "paragraph",
                content = trimmed
            })
        end
    end

    return result
end
