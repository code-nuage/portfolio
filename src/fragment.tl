local function table_contains(list: {any}, value: any): boolean
   for _, v in ipairs(list) do
      if value == v then
         return true
      end
   end
   return false
end

local interface Options
   title: string
   styles: {string}
   scripts: {string}
end

local record fragment
   html: string
   styles: {string}
   scripts: {string}
end

local fragment_mt: metatable<fragment> = {
   __index = fragment
}

function fragment.new(html?: string, options?: Options): fragment
   local i: fragment = setmetatable({}, fragment_mt)

   i.html = html or ""
   i.styles = options and (options.styles or {}) or {}
   i.scripts = options and (options.scripts or {}) or {}

   return i
end

-- Setters
function fragment:set_html(text: string): fragment
   self.html = text
   return self
end

function fragment:add_style(style: string): fragment
   if not table_contains(self.styles, style) then                              -- Injecting every stylesheet only once
      table.insert(self.styles, style)
   end
   return self
end

function fragment:add_script(script: string): fragment
   table.insert(self.scripts, script)
   return self
end

-- Getters
function fragment:get_html(): string
   return self.html
end

function fragment:get_styles(): {string}
   return self.styles
end

function fragment:get_scripts(): {string}
   return self.scripts
end

-- Logic
function fragment:merge(f: fragment, selector?: string): fragment
   if selector then
      local merged = {self:get_html():gsub(selector, f:get_html())}
      self:set_html(merged[1])
   else
      self:set_html(self:get_html() .. f:get_html())
   end
   for _, style in ipairs(f:get_styles()) do self:add_style(style) end
   for _, script in ipairs(f:get_scripts()) do self:add_script(script) end
   return self
end

function fragment:build_styles(): string
   local html = ""
   for _, s in ipairs(self.styles) do
      html = html .. '\n<link rel="stylesheet" href="' .. s .. '">'
   end
   return html
end

function fragment:build_scripts(): string
   local html = ""
   for _, s in ipairs(self.scripts) do
      html = html .. '\n<script src="' .. s .. '"></script>'
   end
   return html
end

function fragment:build(title?: string): string
   title = title or "Document"

   return [[<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>]] .. title .. [[</title>]] ..
      self:build_styles() .. [[
</head>
<body>
]] .. self:get_html() .. [[
]] .. self:build_scripts() .. [[
</body>
</html>]]
end

return fragment
