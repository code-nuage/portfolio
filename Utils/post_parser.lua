local parsing_steps = {
    ["HEADERS"] = 1,
    ["CONTENT"] = 2
}

local function parse_line(line)
    
end

local function transform_line(step, line)
    if step == parsing_steps.HEADERS then
        if line == "" then
            return nil, parsing_steps.CONTENT
        end
    end
end

return function(text)
    local i = 1
    for line in text:gmatch("([^\n]*)\n?") do
        
    end
end
