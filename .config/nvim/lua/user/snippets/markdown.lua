local ls = require("luasnip")
local c = ls.choice_node
local i = ls.insert_node
local t = ls.text_node
local f = ls.function_node
local s = ls.snippet
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local cb_text = function(args)
	local checkboxes = {
		["[ ]"] = "Todo",
		["[x]"] = "done",
		["[/]"] = "doing",
		["[<]"] = "scheduling",
		["[>]"] = "forwarded",
		["[!]"] = "Important",
		["[?]"] = "question",
		["[-]"] = "canceled",
		["[l]"] = "location",
		["[I]"] = "idea",
		["[p]"] = "pro",
		["[c]"] = "cons",
		["[f]"] = "fire",
		["[k]"] = "key",
		["[u]"] = "up",
		["[d]"] = "down",
		["[w]"] = "win",
		["[b]"] = "bookmark",
		['["]'] = "quote",
		["[m]"] = "meeting",
		["[n]"] = "notes",
		["[s]"] = "star",
		["[g]"] = "git, pull request",
	}
	return checkboxes[args[1][1]]
end

local callout_types = {
	t("ABSTRACT"),
	t("SUMMARY"),
	t("TLDR"),
	t("TODO"),
	t("INFO"),
	t("SUCCESS"),
	t("CHECK"),
	t("DONE"),
	t("QUESTION"),
	t("HELP"),
	t("FAQ"),
	t("FAILURE"),
	t("FAIL"),
	t("MISSING"),
	t("DANGER"),
	t("ERROR"),
	t("BUG"),
	t("EXAMPLE"),
	t("QUOTE"),
	t("CITE"),
	t("HINT"),
	t("ATTENTION"),
	t("NOTE"),
	t("TIP"),
	t("IMPORTANT"),
	t("WARNING"),
	t("CAUTION"),
}

return {
	s(
		"tototo",
		fmt(
			"# {}\n\n## Today\n\n## Tomorrow\n\n## Todo\n\n---\n\n## Notes\n",
			{ f(function()
				return os.date("%Y %B %d, %A")
			end) }
		)
	),
	s("task", fmt([[- [ ] #task {} ]], { i(1) })),
	s("callout", fmt(">[!{}] {}\n> {}", { c(1, callout_types), i(2), i(3) })),

	s(
		"checkbox",
		fmt("- {} {}", {
			c(1, {
				t("[ ]"),
				t("[x]"),
				t("[/]"),
				t("[<]"),
				t("[>]"),
				t("[!]"),
				t("[?]"),
				t("[-]"),
				t("[l]"),
				t("[I]"),
				t("[p]"),
				t("[c]"),
				t("[f]"),
				t("[k]"),
				t("[u]"),
				t("[d]"),
				t("[w]"),
				t("[b]"),
				t('["]'),
				t("[m]"),
				t("[n]"),
				t("[s]"),
				t("[g]"),
			}),
			f(cb_text, 1),
		})
	),

	s(
		"daily",
		fmt(
			[[
---
id: "{}"
aliases: []
tags:
  - daily-notes
---

# {}

## Notes

## Tasks

> [!todo]+ Due today
> ```tasks
> has due date
> due on {}
> ```

> [!attention]+ Started today
> ```tasks
> has start date
> starts on {}
> ```

> [!success]+ Completed today
> ```tasks
> has done date
> done on {}
> ```

## Notes

### Created Today

```dataview
TABLE string(split(string(file.ctime), " - ")[0]) as "Created", file.mtime as "Last Modified"
WHERE (file.cday = date("{}") AND !regexmatch("^\d{{4}}-\d{{2}}-\d{{2}}", file.name))
SORT file.name ASC
```

### Last Modified Today

```dataview
TABLE string(split(string(file.mtime), " - ")[0]) as "Last Modified"
WHERE !regexmatch("^\d{{4}}-\d{{2}}-\d{{2}}", file.name)
AND file.mday = date("{}")
SORT file.mtime DESC
```
      ]],
			{
				f(function()
					return os.date("%Y-%m-%d")
				end),
				f(function()
					return os.date("%Y %B %d, %A")
				end),
				f(function()
					return os.date("%Y-%m-%d")
				end),
				f(function()
					return os.date("%Y-%m-%d")
				end),
				f(function()
					return os.date("%Y-%m-%d")
				end),
				f(function()
					return os.date("%Y-%m-%d")
				end),
				f(function()
					return os.date("%Y-%m-%d")
				end),
			}
		)
	),
}
