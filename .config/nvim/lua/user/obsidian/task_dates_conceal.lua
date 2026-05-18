local task_utils = require("user.obsidian.task_utils")

local M = {}

local ns = vim.api.nvim_create_namespace("user_task_dates_conceal")
local augroup = vim.api.nvim_create_augroup("UserTaskDatesConceal", { clear = true })

-- Module state: global enabled flag + per-window snapshot of conceal options.
local state = {
	enabled = false,
	saved_winopts = {},
}

-- Places conceal extmarks over date segments on all task lines in `bufnr`.
local function apply_buf(bufnr)
	if not vim.api.nvim_buf_is_loaded(bufnr) then
		return
	end
	vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)
	local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
	for lnum, line in ipairs(lines) do
		if task_utils.is_task_line(line) then
			for _, r in ipairs(task_utils.find_date_ranges(line)) do
				vim.api.nvim_buf_set_extmark(bufnr, ns, lnum - 1, r[1], {
					end_col = r[2],
					conceal = "",
				})
			end
		end
	end
end

-- Removes all conceal extmarks placed by this module from `bufnr`.
local function clear_buf(bufnr)
	if vim.api.nvim_buf_is_loaded(bufnr) then
		vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)
	end
end

-- Saves current conceal options for `winid` and forces values needed to hide ranges.
local function set_win_conceal(winid)
	if not vim.api.nvim_win_is_valid(winid) then
		return
	end
	if state.saved_winopts[winid] == nil then
		state.saved_winopts[winid] = {
			conceallevel = vim.api.nvim_get_option_value("conceallevel", { win = winid }),
			concealcursor = vim.api.nvim_get_option_value("concealcursor", { win = winid }),
		}
	end
	vim.api.nvim_set_option_value("conceallevel", 2, { win = winid })
	vim.api.nvim_set_option_value("concealcursor", "nc", { win = winid })
end

-- Restores the previously-saved conceal options for `winid`.
local function restore_win_conceal(winid)
	local saved = state.saved_winopts[winid]
	if saved and vim.api.nvim_win_is_valid(winid) then
		vim.api.nvim_set_option_value("conceallevel", saved.conceallevel, { win = winid })
		vim.api.nvim_set_option_value("concealcursor", saved.concealcursor, { win = winid })
	end
	state.saved_winopts[winid] = nil
end

-- Turns concealment on globally: apply to all buffers/windows + watch for changes.
local function enable()
	state.enabled = true
	for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
		apply_buf(bufnr)
	end
	for _, winid in ipairs(vim.api.nvim_list_wins()) do
		set_win_conceal(winid)
	end
	-- Re-apply extmarks when buffer text changes or new buffers are read.
	vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI", "BufReadPost", "BufNewFile" }, {
		group = augroup,
		callback = function(args)
			if state.enabled then
				apply_buf(args.buf)
			end
		end,
	})
	-- Apply conceal options to windows opened after enabling.
	vim.api.nvim_create_autocmd({ "BufWinEnter", "WinNew" }, {
		group = augroup,
		callback = function()
			if state.enabled then
				set_win_conceal(vim.api.nvim_get_current_win())
			end
		end,
	})
end

-- Turns concealment off: clear extmarks/autocmds and restore window options.
local function disable()
	state.enabled = false
	vim.api.nvim_clear_autocmds({ group = augroup })
	for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
		clear_buf(bufnr)
	end
	for winid, _ in pairs(state.saved_winopts) do
		restore_win_conceal(winid)
	end
	state.saved_winopts = {}
end

-- Public toggle entry point.
function M.toggle()
	if state.enabled then
		disable()
		vim.notify("Task dates: shown", vim.log.levels.INFO)
	else
		enable()
		vim.notify("Task dates: hidden", vim.log.levels.INFO)
	end
end

function M.is_enabled()
	return state.enabled
end

return M
