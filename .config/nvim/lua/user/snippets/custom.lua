local snip_status_ok, ls = pcall(require, "luasnip")
if not snip_status_ok then
  return
end

local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")

local fmt = require("luasnip.extras.fmt").fmt
local rep = require('luasnip.extras').rep
local l = require("luasnip.extras").lambda

local file_name_to_class_name = function(file_anme) return string.gsub(file_name, "_(%w)", function(s) return string.upper(s) end) end

ls.snippets = {
  all = {
    s("curtime", f(function() return os.date "%d/%m/%Y - %H:%M" end)),
  },
  ruby = {
    s("rspec", fmt("require \"rails_helper\"\n\nRSpec.describe {} do\n\nend", { i(1, 'something') })),
    s("fname", f(function(_, snip)
				return snip.env.TM_FILENAME or {}
			end, {}))
  },
  markdown = {
    s("tototo", fmt("# {}\n\n## Today\n\n## Tomorrow\n\n## Todo\n", { f(function() return os.date "%d/%m/%Y" end)}))
  },
  norg = {
    s("tototo", fmt("* {}\n\n** Today\n\n** Tomorrow\n\n** Todo\n", { f(function() return os.date "%d/%m/%Y" end)}))
  }
}
