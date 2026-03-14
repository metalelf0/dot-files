local M = {}

-- marks a task line as done. This:
-- - updates the checkbox from [ ] or [/] to [x]
-- - adds a done marker with current date at the end of the line (e.g. " ✅ 2026-03-11")
M.mark_task_done = function()
	local date = os.date("%Y-%m-%d")
	local line_number = vim.fn.line(".")
	local line = vim.fn.getline(line_number)

	if line:match("%- %[ %] #task") then
		local new_line = line:gsub("%- %[ %] #task", "- [x] #task") .. " ✅ " .. date
		vim.fn.setline(line_number, new_line)
	elseif line:match("%- %[/%] #task") then
		local new_line = line:gsub("%- %[/%] #task", "- [x] #task") .. " ✅ " .. date
		vim.fn.setline(line_number, new_line)
	else
		print("No task to mark as done on this line.")
	end
end

-- marks a task line as in progress. This:
-- - updates the checkbox from [ ] or [x] to [/]
-- - adds an "in progress" marker with current date at the end of the line (e.g. " 🛫 2026-03-11")
M.mark_task_in_progress = function()
	local date = os.date("%Y-%m-%d")
	local line_number = vim.fn.line(".")
	local line = vim.fn.getline(line_number)

	if line:match("%- %[ %] #task") then
		local new_line = line:gsub("%- %[ %] #task", "- [/] #task") .. " 🛫 " .. date
		vim.fn.setline(line_number, new_line)
	elseif line:match("%- %[x%] #task") then
		local new_line = line:gsub("%- %[x%] #task", "- [/] #task") .. " 🛫 " .. date
		vim.fn.setline(line_number, new_line)
	else
		print("No task to mark as in progress on this line.")
	end
end

-- marks a task line as todo. This:
-- - updates the checkbox from [x] or [/] to [ ]
M.mark_task_todo = function()
	local date = os.date("%Y-%m-%d")
	local line_number = vim.fn.line(".")
	local line = vim.fn.getline(line_number)

	if line:match("%- %[x%] #task") then
		local new_line = line:gsub("%- %[x%] #task", "- [ ] #task")
		vim.fn.setline(line_number, new_line)
	elseif line:match("%- %[/%] #task") then
		local new_line = line:gsub("%- %[/%] #task", "- [ ] #task")
		vim.fn.setline(line_number, new_line)
	else
		print("No task to mark as todo on this line.")
	end
end

-- edits a date on a task line. This:
-- - asks the user to select a date type (Done ✅, Planned 📅, Started 🛫, Canceled ❌)
-- - asks for a date in YYYY-MM-DD format, pre-populated with the existing value or today
-- - replaces the date if already present, or appends it to the end of the line
M.edit_task_date = function()
	local line_number = vim.fn.line(".")
	local line = vim.fn.getline(line_number)

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

			vim.fn.setline(line_number, new_line)
		end)
	end)
end

return M
