local M = {}

-- marks a task line as done. This:
-- - updates the checkbox from [ ] or [/] to [x]
-- - adds a done marker with current date at the end of the line (e.g. " ✅ 2026-03-11")
M.mark_task_done = function()
	local date = os.date("%Y-%m-%d")
	local line = vim.api.nvim_get_current_line()

	if line:match("%- %[ %] #task") then
		local new_line = line:gsub("%- %[ %] #task", "- [x] #task") .. " ✅ " .. date
		vim.api.nvim_set_current_line(new_line)
	elseif line:match("%- %[/%] #task") then
		local new_line = line:gsub("%- %[/%] #task", "- [x] #task") .. " ✅ " .. date
		vim.api.nvim_set_current_line(new_line)
	else
		print("No task to mark as done on this line.")
	end
end

M.mark_task_canceled = function()
	local date = os.date("%Y-%m-%d")
	local line = vim.api.nvim_get_current_line()

	if line:match("%- %[ %] #task") then
		local new_line = line:gsub("%- %[ %] #task", "- [-] #task") .. " ❌ " .. date
		vim.api.nvim_set_current_line(new_line)
	elseif line:match("%- %[/%] #task") then
		local new_line = line:gsub("%- %[/%] #task", "- [-] #task") .. " ❌ " .. date
		vim.api.nvim_set_current_line(new_line)
	else
		print("No task to mark as canceled on this line.")
	end
end

-- marks a task line as in progress. This:
-- - updates the checkbox from [ ] or [x] to [/]
-- - adds an "in progress" marker with current date at the end of the line (e.g. " 🛫 2026-03-11")
M.mark_task_in_progress = function()
	local date = os.date("%Y-%m-%d")
	local line = vim.api.nvim_get_current_line()

	if line:match("%- %[ %] #task") then
		local new_line = line:gsub("%- %[ %] #task", "- [/] #task") .. " 🛫 " .. date
		vim.api.nvim_set_current_line(new_line)
	elseif line:match("%- %[x%] #task") then
		local new_line = line:gsub("%- %[x%] #task", "- [/] #task") .. " 🛫 " .. date
		vim.api.nvim_set_current_line(new_line)
	else
		print("No task to mark as in progress on this line.")
	end
end

-- marks a task line as todo. This:
-- - updates the checkbox from [x] or [/] to [ ]
M.mark_task_todo = function()
	local date = os.date("%Y-%m-%d")
	local line = vim.api.nvim_get_current_line()

	if line:match("%- %[x%] #task") then
		local new_line = line:gsub("%- %[x%] #task", "- [ ] #task")
		vim.api.nvim_set_current_line(new_line)
	elseif line:match("%- %[/%] #task") then
		local new_line = line:gsub("%- %[/%] #task", "- [ ] #task")
		vim.api.nvim_set_current_line(new_line)
	else
		print("No task to mark as todo on this line.")
	end
end

-- edits a date on a task line.
M.edit_task_date = function()
	local line = vim.api.nvim_get_current_line()

	if not line:match("^%- %[.%] #task") then
		print("No task on this line.")
		return
	end

	local date_types = {
		{ label = "Done", symbol = "✅" },
		{ label = "Planned", symbol = "📅" },
		{ label = "Started", symbol = "🛫" },
		{ label = "Canceled", symbol = "❌" },
		{ label = "Added", symbol = "➕" },
	}

	vim.ui.select(date_types, {
		prompt = "Select date type:",
		format_item = function(item)
			return item.symbol .. " " .. item.label
		end,
	}, function(choice)
		if not choice then
			return
		end

		local existing_date = line:match(choice.symbol .. " (%d%d%d%d%-%d%d%-%d%d)")
		local default_date = existing_date or os.date("%Y-%m-%d")

		vim.ui.input({
			prompt = choice.symbol .. " " .. choice.label .. " date (YYYY-MM-DD): ",
			default = default_date,
		}, function(date)
			if not date or date == "" then
				return
			end

			if not date:match("^%d%d%d%d%-%d%d%-%d%d$") then
				print("Invalid date format. Use YYYY-MM-DD.")
				return
			end

			local new_line
			if line:match(choice.symbol .. " %d%d%d%d%-%d%d%-%d%d") then
				new_line = line:gsub(choice.symbol .. " %d%d%d%d%-%d%d%-%d%d", choice.symbol .. " " .. date)
			else
				new_line = line .. " " .. choice.symbol .. " " .. date
			end

			vim.api.nvim_set_current_line(new_line)
		end)
	end)
end

-- writes the new task line to tasks.md and refreshes any open buffer for it.
local function write_task(description, planned, curfile)
	local config = require("user.config")
	local today = os.date("%Y-%m-%d")

	local line = "- [ ] #task " .. description
	if planned and planned ~= "" then
		line = line .. " 📅 " .. planned
	end
	line = line .. " ➕ " .. today

	local path = config.obsidian_workspace_path .. "/tasks.md"
	local lines = {}
	if vim.fn.filereadable(path) == 1 then
		lines = vim.fn.readfile(path)
	end
	table.insert(lines, line)

	local ok, err = pcall(vim.fn.writefile, lines, path)
	if not ok then
		vim.notify("Failed to write task: " .. tostring(err), vim.log.levels.ERROR)
		return
	end

	print("Task added to " .. path)

	local bufnr = vim.fn.bufnr(path)
	if bufnr ~= -1 and vim.api.nvim_buf_is_loaded(bufnr) then
		vim.api.nvim_buf_call(bufnr, function()
			vim.cmd("checktime")
		end)
	end
end

-- creates a new task. This:
-- - opens a multi-field form via form-builder-nvim with two components:
--     1. a 3-line description editor (required)
--     2. a calendar date picker (defaults to today, can be cleared with `.`)
-- - <Tab>/<S-Tab> cycle between components; <CR> advances; <CR> on the calendar (the
--   last component) submits; <Esc>/q cancels.
-- - description is required (cancels with a warn if empty).
-- - appends a new task line to the end of tasks.md in the configured obsidian workspace.
-- - reloads the tasks.md buffer if it is already open.
M.create_task = function()
	local Form = require("form-builder")

	Form.open({
		title = " New task ",
		footer = " <Tab> nav  <CR> ok  <Esc> cancel ",
		width = 50,
		components = {
			{
				name = "description",
				type = "text",
				label = "󰈙 Description ",
				placeholder = "Task description...",
				height = 3,
				required = true,
			},
			{
				name = "planned_date",
				type = "date",
				label = " 📅 Planned date ",
				default_value = "today",
			},
			{
				name = "current_file",
				type = "checkbox",
				label = " Write in current file ",
			},
		},
		on_submit = function(values)
			local description = values[1].value
			local planned = values[2].value
			local curfile = values[3].value
			write_task(description, planned, curfile)
		end,
		on_cancel = function()
			vim.notify("Task creation cancelled.", vim.log.levels.WARN)
		end,
	})
end

return M
