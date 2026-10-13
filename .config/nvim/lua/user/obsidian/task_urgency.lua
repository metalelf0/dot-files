local task_utils = require("user.obsidian.task_utils")

local M = {}

local NAMESPACE = vim.api.nvim_create_namespace("user_task_urgency")
local TASKDASH_NAMESPACE = vim.api.nvim_create_namespace("user_task_urgency_taskdash")
local AUGROUP = vim.api.nvim_create_augroup("UserTaskUrgency", { clear = true })
local NORMAL_HL = "UserTaskUrgency"
local VERY_URGENT_HL = "UserTaskUrgencyHigh"
local VERY_URGENT_THRESHOLD = 20

local enabled = false

local function day_number(year, month, day)
	local days_in_month = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 }
	local leap = year % 4 == 0 and (year % 100 ~= 0 or year % 400 == 0)
	if leap then
		days_in_month[2] = 29
	end
	if year < 1 or month < 1 or month > 12 or day < 1 or day > days_in_month[month] then
		return nil
	end

	local previous_year = year - 1
	local days = previous_year * 365
		+ math.floor(previous_year / 4)
		- math.floor(previous_year / 100)
		+ math.floor(previous_year / 400)
	for m = 1, month - 1 do
		days = days + days_in_month[m]
	end
	return days + day
end

local function parse_date(line, symbol)
	local date = line:match(vim.pesc(symbol) .. " (%d%d%d%d%-%d%d%-%d%d)")
	if not date then
		return nil
	end
	local year, month, day = date:match("^(%d%d%d%d)%-(%d%d)%-(%d%d)$")
	return day_number(tonumber(year), tonumber(month), tonumber(day))
end

local function priority_adjustment(line)
	if line:find("🔺", 1, true) then
		return 1.5 * 6
	elseif line:find("⏫", 1, true) then
		return 1.0 * 6
	elseif line:find("🔼", 1, true) then
		return 0.65 * 6
	elseif line:find("⏬", 1, true) then
		return -0.3 * 6
	elseif line:find("🔽", 1, true) then
		return 0
	end
	return 0.325 * 6
end

-- Calculates urgency using Obsidian Tasks' due, scheduled, start, and priority weights.
function M.calculate_urgency(line, today)
	local year, month, day = (today or os.date("%Y-%m-%d")):match("^(%d%d%d%d)%-(%d%d)%-(%d%d)$")
	local today_number = year and day_number(tonumber(year), tonumber(month), tonumber(day))
	if not today_number then
		return nil
	end

	local urgency = 0
	local due_date = parse_date(line, "📅")
	if due_date then
		local days_overdue = today_number - due_date
		local due_multiplier
		if days_overdue >= 7 then
			due_multiplier = 1
		elseif days_overdue >= -14 then
			due_multiplier = ((days_overdue + 14) * 0.8) / 21 + 0.2
		else
			due_multiplier = 0.2
		end
		urgency = urgency + due_multiplier * 12
	end

	local scheduled_date = parse_date(line, "⏳")
	if scheduled_date and today_number >= scheduled_date then
		urgency = urgency + 5
	end

	local start_date = parse_date(line, "🛫")
	if start_date and today_number < start_date then
		urgency = urgency - 3
	end

	return urgency + priority_adjustment(line)
end

local function define_highlights()
	vim.api.nvim_set_hl(0, NORMAL_HL, { link = "Comment", default = true })
	vim.api.nvim_set_hl(0, VERY_URGENT_HL, { link = "DiagnosticWarn", default = true })
end

local function apply_buffer(bufnr)
	if not vim.api.nvim_buf_is_loaded(bufnr) then
		return
	end
	vim.api.nvim_buf_clear_namespace(bufnr, NAMESPACE, 0, -1)
	if vim.api.nvim_get_option_value("filetype", { buf = bufnr }) ~= "markdown" then
		return
	end

	for lnum, line in ipairs(vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)) do
		if task_utils.is_open_task_line(line) then
			local urgency = M.calculate_urgency(line)
			if urgency then
				local highlight = urgency >= VERY_URGENT_THRESHOLD and VERY_URGENT_HL or NORMAL_HL
				vim.api.nvim_buf_set_extmark(bufnr, NAMESPACE, lnum - 1, #line, {
					virt_text = { { string.format("[%.1f]", urgency), highlight } },
					virt_text_pos = "eol",
				})
			end
		end
	end
end

local function apply_all_buffers()
	for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
		apply_buffer(bufnr)
	end
end

local function refresh_taskdash()
	local taskdash = package.loaded["taskdash"]
	if taskdash and taskdash._dashboard and taskdash.render then
		taskdash.render()
	end
end

local function enable()
	enabled = true
	define_highlights()
	apply_all_buffers()
	vim.api.nvim_clear_autocmds({ group = AUGROUP })
	vim.api.nvim_create_autocmd({
		"TextChanged",
		"TextChangedI",
		"BufReadPost",
		"BufNewFile",
		"FileType",
		"BufWinEnter",
		"FocusGained",
		"VimResume",
	}, {
		group = AUGROUP,
		callback = function(args)
			if enabled then
				if args.event == "FocusGained" or args.event == "VimResume" then
					apply_all_buffers()
					refresh_taskdash()
				else
					apply_buffer(args.buf or vim.api.nvim_get_current_buf())
				end
			end
		end,
	})
	vim.api.nvim_create_autocmd("ColorScheme", {
		group = AUGROUP,
		callback = define_highlights,
	})
end

local function disable()
	enabled = false
	vim.api.nvim_clear_autocmds({ group = AUGROUP })
	for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_is_loaded(bufnr) then
			vim.api.nvim_buf_clear_namespace(bufnr, NAMESPACE, 0, -1)
			vim.api.nvim_buf_clear_namespace(bufnr, TASKDASH_NAMESPACE, 0, -1)
		end
	end
end

function M.toggle()
	if enabled then
		disable()
		refresh_taskdash()
		vim.notify("Task urgency: hidden", vim.log.levels.INFO)
	else
		enable()
		refresh_taskdash()
		vim.notify("Task urgency: shown", vim.log.levels.INFO)
	end
end

-- Applies urgency virtual text to task rows in Taskdash's rendered buffer.
function M.apply_taskdash(bufnr, locations)
	if not vim.api.nvim_buf_is_valid(bufnr) then
		return
	end
	vim.api.nvim_buf_clear_namespace(bufnr, TASKDASH_NAMESPACE, 0, -1)
	if not enabled then
		return
	end

	for row, location in pairs(locations or {}) do
		local task = location.task
		if task and (task.status == "todo" or task.status == "in_progress") and task.raw then
			local urgency = M.calculate_urgency(task.raw)
			if urgency then
				local line = vim.api.nvim_buf_get_lines(bufnr, row - 1, row, false)[1]
				if line then
					local highlight = urgency >= VERY_URGENT_THRESHOLD and VERY_URGENT_HL or NORMAL_HL
					vim.api.nvim_buf_set_extmark(bufnr, TASKDASH_NAMESPACE, row - 1, #line, {
						virt_text = { { string.format("[%.1f]", urgency), highlight } },
						virt_text_pos = "eol",
					})
				end
			end
		end
	end
end

function M.is_enabled()
	return enabled
end

return M
