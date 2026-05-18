local task_utils = require("user.obsidian.task_utils")

local M = {}

local HL_GROUP = "UserTaskDate"
local ns = vim.api.nvim_create_namespace("user_task_dates_highlight")
local augroup = vim.api.nvim_create_augroup("UserTaskDatesHighlight", { clear = true })

-- Defines the UserTaskDate highlight group as a link to Comment.
local function define_hl()
	vim.api.nvim_set_hl(0, HL_GROUP, { link = "Comment", default = true })
end

-- Applies the UserTaskDate highlight over date ranges on task lines in `bufnr`.
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
					hl_group = HL_GROUP,
				})
			end
		end
	end
end

-- Sets up the highlight group and autocmds to keep dates highlighted everywhere.
function M.setup()
	define_hl()
	for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
		apply_buf(bufnr)
	end
	-- Re-define the highlight after colorscheme changes (link survives, but be safe).
	vim.api.nvim_create_autocmd("ColorScheme", {
		group = augroup,
		callback = define_hl,
	})
	-- Re-apply highlights on edits and new buffers.
	vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI", "BufReadPost", "BufNewFile" }, {
		group = augroup,
		callback = function(args)
			apply_buf(args.buf)
		end,
	})
end

return M
