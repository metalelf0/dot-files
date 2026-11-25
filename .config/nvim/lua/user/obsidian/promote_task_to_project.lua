local task_utils = require("user.obsidian.task_utils")

local M = {}

-- Order in which optional frontmatter keys are emitted when the task sets them.
M.EXTRA_KEYS = { "recurrence", "id", "depends_on", "on_completion", "done" }

-- Project note body. Placeholders are resolved by `M.render`.
M.TEMPLATE = [[
---
tags:
  - project
created: "{{created}}"
{{optional_dates}}priority: {{priority}}
{{extra_fields}}---
# {{title}}

## Description

## Links

- [g] GitHub PR: {{github}}
- [n] Notion page: {{notion}}

## Tasks

- [{{status}}] #task #project {{title}} {{markers}}
- [ ] #task Update notion page link ➕ {{today}}
]]

-- Same order as the frontmatter keys, so the task line reads like the note header.
M.TASK_MARKERS = { "➕", "🛫", "⏳", "📅", "❌" }

-- Task-line keys in the order `M.TASK_MARKERS` emits them.
local TASK_DATE_KEYS = { "created", "started", "scheduled", "planned", "cancelled" }

-- Returns the " ➕ 2026-11-18 🛫 2026-11-19" trailer for the project task line.
-- Falls back to `today` for the created marker when the source set no dates.
local function task_markers(task, today)
	local parts = {}
	for i, key in ipairs(TASK_DATE_KEYS) do
		local date = task.dates[key]
		if date then
			table.insert(parts, M.TASK_MARKERS[i] .. " " .. date)
		end
	end
	if #parts == 0 then
		return "➕ " .. today
	end
	return table.concat(parts, " ")
end

-- Returns `title` as a filename: markdown links lose their URL, filesystem-illegal
-- characters collapse to "-", and a leading "#" is dropped.
function M.filename_for(title)
	local name = title:gsub("%[([^%]]*)%]%([^%)]*%)", "%1")
	name = name:gsub("^%s*#+%s*", "")
	name = name:gsub("[/\\:*?\"<>|]", "-")
	name = name:gsub("%s+", " ")
	return (name:gsub("^%-*%s*", ""):gsub("%s*%-*$", ""))
end

-- Returns the first github and notion URLs found in `text`. Each may be nil.
function M.extract_links(text)
	local links = {}
	local github = text:match("(https://github%.com[%w%-%._/]+)")
	if github then
		links.github = github
	end
	local notion = text:match("(https://[%w%-%.]*notion%.%a+[%w%-%._/?=]+)")
	if notion then
		links.notion = notion
	end
	return links
end

-- Replaces every `{{name}}` in `template` from `values`. Values are inserted literally,
-- so "%" and other magic characters in a title are safe.
local function fill(template, values)
	return (
		template:gsub("{{([%w_]+)}}", function(name)
			return values[name] or ""
		end)
	)
end

-- Renders the project note for a parsed task.
-- `options.now` is "YYYY-MM-DD HH:mm"; `options.today` is "YYYY-MM-DD" and defaults to `now`'s date.
function M.render(task, options)
	options = options or {}
	local now = options.now
	local today = options.today or now:sub(1, 10)
	local links = M.extract_links(task.title)

	local date_lines = {}
	for _, key in ipairs({ "scheduled", "started", "planned", "cancelled" }) do
		local date = task.dates[key]
		if date then
			table.insert(date_lines, string.format('%s: "%s 00:00"', key, date))
		end
	end

	local extra_lines = {}
	for _, key in ipairs(M.EXTRA_KEYS) do
		local value = task.extras[key]
		if value then
			table.insert(extra_lines, string.format("%s: %s", key, value))
		end
	end

	local created = task.dates.created and (task.dates.created .. " 00:00") or now

	return (fill(M.TEMPLATE:gsub("^\n", ""), {
		created = created,
		optional_dates = #date_lines > 0 and (table.concat(date_lines, "\n") .. "\n") or "",
		extra_fields = #extra_lines > 0 and (table.concat(extra_lines, "\n") .. "\n") or "",
		priority = task.priority,
		title = task.title,
		status = task.status or " ",
		markers = task_markers(task, today),
		github = links.github or "",
		notion = links.notion or "",
		today = today,
	}))
end

-- Returns the list item that replaces the source task once promoted.
function M.promoted_line(title)
	return "- [[" .. M.filename_for(title) .. "]]"
end

-- Returns `path`, or `path` with a "-2", "-3", … suffix before the extension when taken.
local function free_path(path)
	if vim.fn.filereadable(path) == 0 then
		return path
	end
	local stem = path:gsub("%.md$", "")
	local i = 2
	while vim.fn.filereadable(stem .. "-" .. i .. ".md") == 1 do
		i = i + 1
	end
	return stem .. "-" .. i .. ".md"
end

-- Promotes the task on the current line into a project note.
function M.promote()
	local line = vim.api.nvim_get_current_line()
	local task = task_utils.parse_task(line)
	if not task or task.title == "" then
		vim.notify("Not an obsidian task line", vim.log.levels.ERROR)
		return
	end

	local config = require("user.config")
	local dir = config.obsidian_workspace_path .. "/" .. (config.project_dir or "--- Inbox")
	vim.fn.mkdir(dir, "p")

	local path = free_path(dir .. "/" .. M.filename_for(task.title) .. ".md")
	local content = M.render(task, { now = os.date("%Y-%m-%d %H:%M") })

	local ok, err = pcall(vim.fn.writefile, vim.split(content, "\n"), path)
	if not ok then
		vim.notify("Failed to create project note: " .. tostring(err), vim.log.levels.ERROR)
		return
	end

	vim.api.nvim_set_current_line(M.promoted_line(task.title))
	vim.notify("Promoted to " .. path, vim.log.levels.INFO)
end

return M