local json <const> = require("cjson")
local lfs <const> = require("lfs")

local parse = require("Utils.markdown_parser")
local futils = require("Utils.futils")
local join = require("Utils.join")

local record model_project
   interface ProjectData
      filename: string
      img: string
      title: string
      link: string
      date: string
      content: string
      description: string
   end
end

function model_project.get_by_name(name: string): model_project.ProjectData
   local file_data, _ = futils.read(join("Projects", name .. ".md")) as (futils.FileData, string)
   if not file_data then
      return nil
   end

   local fm, body = file_data.content:match("^%-%-%-\n(.-)\n%-%-%-\n(.*)$")
   local project_data: model_project.ProjectData = json.decode(fm) as model_project.ProjectData

   local result, _ = parse(body)
   project_data.content = result
   project_data.filename = name

   return project_data
end

function model_project.get_all(): {model_project.ProjectData}
   local projects = {}
   for fd in lfs.dir("Projects") do
      table.insert(projects, model_project.get_by_name(fd:sub(0, -4)))
   end
   table.sort(projects, function(a: model_project.ProjectData, b: model_project.ProjectData): boolean
      return a.date > b.date
   end)
   return projects
end

function model_project.get_page(page: integer, per_page?: integer): {model_project.ProjectData}
   per_page = per_page or 12

   local all_projects = model_project.get_all()
   local projects = {}

   for i = page * per_page - per_page + 1, page * per_page do
      table.insert(projects, all_projects[i])
   end

   return projects
end

return model_project
