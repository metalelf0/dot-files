---@diagnostic disable: undefined-global
vim.loader.enable()

-- If nvim is launched with a single directory argument (`nvim .`), cd into it
-- and clear the arglist BEFORE plugins load, so directory-hijacking file
-- explorers (e.g. oil.nvim) never see it. Session loading then runs on an
-- empty arglist from VimEnter.
if vim.fn.argc() == 1 and vim.fn.isdirectory(vim.fn.argv(0)) == 1 then
	vim.cmd("cd " .. vim.fn.fnameescape(vim.fn.argv(0)))
	vim.cmd("silent! %argdelete")
end

require("user.options")
require("user.keymaps")
require("user.lazy")
require("user.utils")
require("user.colorscheme_utils")
require("user.neovide")
require("user.autocommands")
require("user.digraphs")
require("user.ui2")

-- require("user.statusline")
-- vim.opt.statusline = "%!v:lua.require'user.statusline'.render()"

vim.cmd([[ packadd cfilter ]])
local config = require("user.config")

if config.keymapper == "which-key" then
	local which_key = require("which-key")
	local mappings = {
		{ "<leader>A", group = "AI", nowait = true, remap = false },
		{ "<leader>P", group = "Projects", nowait = true, remap = false },
		{ "<leader>b", group = "Buffers", nowait = true, remap = false },
		{ "<leader>bc", group = "Close", nowait = true, remap = false },
		{ "<leader>c", group = "Cursors", nowait = true, remap = false },
		{ "<leader>g", group = "Git", nowait = true, remap = false },
		{ "<leader>h", group = "Helpers", nowait = true, remap = false },
		{ "<leader>i", group = "Insert", nowait = true, remap = false },
		{ "<leader>j", group = "Test / join", nowait = true, remap = false },
		{ "<leader>l", group = "LSP", nowait = true, remap = false },
		{ "<leader>o", group = "Obsidian", nowait = true, remap = false },
		{ "<leader>od", group = "Obsidian - dailies", nowait = true, remap = false },
		{ "<leader>ot", group = "Obsidian - tasks", nowait = true, remap = false },
		{ "<leader>otl", group = "Obsidian - tasks - list", nowait = true, remap = false },
		{ "<leader>r", group = "Refactorings", nowait = true, remap = false },
		{ "<leader>s", group = "Search", nowait = true, remap = false },
		{ "<leader>t", group = "Terminal", nowait = true, remap = false },
		{ "<leader>u", group = "UI", nowait = true, remap = false },
		{ "<leader>uc", group = "Colors", nowait = true, remap = false },
		{ "<leader>ud", group = "Diagnostics", nowait = true, remap = false },
	}
	which_key.add(mappings)
end

if not vim.g.colors_name and config.colorscheme ~= "default" then
	vim.cmd.colorscheme(config.colorscheme)
	if config.colorscheme == "macro" then
		vim.cmd([[ hi @variable.member.ruby gui='bold' ]]) -- bolder @variables
	end
end

if config.terminal_plugin == "snacks" then
	vim.g["test#custom_strategies"] = {
		snacks = function(cmd)
			require("user.snacks-vim-test-strategy").run(cmd)
		end,
	}

	vim.g["test#strategy"] = "snacks"
end

-- FIX: this is a custom fix to avoid LSP highlighting comments and
-- interfering with Treesitter comment highlighting
-- See https://github.com/stsewd/tree-sitter-comment/issues/22?reload=1
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		vim.api.nvim_set_hl(0, "@lsp.type.comment", {})
	end,
})

vim.cmd("packadd nvim.undotree")
vim.keymap.set("n", "<leader>U", require("undotree").open)
