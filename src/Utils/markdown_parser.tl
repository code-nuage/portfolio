local lunamark <const> = require("lunamark")

local header_classes = {
   "ts-huge tw-bold",
   "ts-hero tw-bold",
   "ts-medium tw-bold",
   "tw-bold",
   "tw-bold",
   "ts-caption tw-bold"
}

local writer = lunamark.writer.html.new()

function writer.header(s: table, level: integer): table
   return { "<h" .. level .. " class=\"" .. header_classes[level] .. "\">",
   s,
   "</h".. level .. ">\n" }
end

function writer.paragraph(s: table): table
   return { "<p>",
   s,
   "</p>\n" }
end

function writer.verbatim(s: table): table
   return { "<pre><code>",
   s,
   "</code></pre>\n" }
end

function writer.strong(s: table): table
   return {"<span class=\"tw-bold\">", s, "</span>"}
end

function writer.link(label: table, uri: string, _?: string): table
   return { "<a href=\"" .. uri .. "\" class=\"tw-bold tc-primary\">", 
   label,
   "</a>" }
end

writer.hrule = "<hr class=\"separator\"/>"

return lunamark.reader.markdown.new(writer, {smart = true})