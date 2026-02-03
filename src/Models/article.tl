local lunamark <const> = require("lunamark")
local json <const> = require("cjson")
local lfs <const> = require("lfs")

local futils = require("Utils.futils")
local join = require("Utils.join")

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

local parse = lunamark.reader.markdown.new(writer, {smart = true})

local record model_article
   interface ArticleData
      filename: string
      title: string
      date: string
      content: string
   end
end

function model_article.get_by_name(name: string): model_article.ArticleData
   local file_data, _ = futils.read(join("Articles", name .. ".md")) as (futils.FileData, string)
   if not file_data then
      return nil
   end

   local fm, body = file_data.content:match("^%-%-%-\n(.-)\n%-%-%-\n(.*)$")
   local article_data: model_article.ArticleData = json.decode(fm) as model_article.ArticleData

   local result, _ = parse(body)
   article_data.content = result
   article_data.filename = name

   return article_data
end

function model_article.get_all(): {model_article.ArticleData}
   local articles = {}
   for fd in lfs.dir("Articles") do
      table.insert(articles, model_article.get_by_name(fd:sub(0, -4)))
   end
   table.sort(articles, function(a: model_article.ArticleData, b: model_article.ArticleData): boolean
      return a.date > b.date
   end)
   return articles
end

function model_article.get_page(page: integer, per_page?: integer): {model_article.ArticleData}
   per_page = per_page or 12

   local all_articles = model_article.get_all()
   local articles = {}

   for i = page * per_page - per_page + 1, page * per_page do
      table.insert(articles, all_articles[i])
   end

   return articles
end

return model_article
