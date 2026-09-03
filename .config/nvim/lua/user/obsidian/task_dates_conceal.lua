local task_utils = require("user.obsidian.task_utils")

local M = {}

local ns = vim.api.nvim_create_namespace("user_task_dates_conceal")
local augroup = vim.api.nvim_create_augroup("UserTaskDatesConceal", { clear = true })

-- Module state: global enabled flag + per-window snapshot of conceal options.
local state = {
	enabled = false,
	saved_winopts = {},
}

-- Neovim's bundled markdown_inline highlights query conceals the brackets of
-- "shortcut" links (any "[...]" that isn't a proper inline/reference link),
-- see $VIMRUNTIME/queries/markdown_inline/highlights.scm. Tree-sitter's
-- markdown grammar only recognizes " ", "x", "X" as real checkbox markers,
-- so custom states like "[/]" or "[n]" parse as shortcut links instead and
-- get caught by that same rule. That collides with touchup.nvim, which
-- redraws its own "[" + icon + "]" over custom checkbox states: both are
-- fighting over the same cells, and the built-in conceal wins, eating the
-- opening bracket. We patch that one rule out while our own concealment is
-- enabled (raising 'conceallevel' is what activates it in the first place),
-- and restore the original query when we turn concealment back off.
local shortcut_link_conceal_pattern = "; Conceal shortcut links.-%)%)"
local original_markdown_inline_highlights = nil

-- Forces every buffer currently attached to a treesitter highlighter to
-- rebuild it, so query changes made via `vim.treesitter.query.set` apply
-- immediately instead of only to buffers opened after the change.
local function refresh_markdown_highlighting()
	for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_is_loaded(bufnr) and vim.treesitter.highlighter.active[bufnr] then
			vim.treesitter.stop(bufnr)
			vim.treesitter.start(bufnr)
		end
	end
end

-- Removes the shortcut-link bracket-conceal rule from the markdown_inline
-- highlights query, keeping everything else (emphasis, code spans, real
-- links, entities, ...) intact.
local function patch_shortcut_link_conceal()
	if original_markdown_inline_highlights then
		return
	end
	local ok, files = pcall(vim.treesitter.query.get_files, "markdown_inline", "highlights")
	if not ok or not files or #files == 0 then
		return
	end
	local chunks = {}
	for _, file in ipairs(files) do
		table.insert(chunks, table.concat(vim.fn.readfile(file), "\n"))
	end
	local original = table.concat(chunks, "\n")
	if not original:find(shortcut_link_conceal_pattern) then
		return
	end
	original_markdown_inline_highlights = original
	vim.treesitter.query.set("markdown_inline", "highlights", (original:gsub(shortcut_link_conceal_pattern, "")))
	refresh_markdown_highlighting()
end

-- Restores the original markdown_inline highlights query.
local function restore_shortcut_link_conceal()
	if not original_markdown_inline_highlights then
		return
	end
	vim.treesitter.query.set("markdown_inline", "highlights", original_markdown_inline_highlights)
	original_markdown_inline_highlights = nil
	refresh_markdown_highlighting()
end

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
	patch_shortcut_link_conceal()
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
	restore_shortcut_link_conceal()
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
