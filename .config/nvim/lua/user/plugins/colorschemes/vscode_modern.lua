local config = require("user.config")
local utils = require("user.utils")
local themer = require("user.themer")

local colorscheme = "vscode_modern"

local M = {
	"gmr458/vscode_modern_theme.nvim",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.config = function()
	require("vscode_modern").setup({
		cursorline = true,
		transparent_background = false,
		nvim_tree_darker = true,
	})
	vim.cmd.colorscheme("vscode_modern")
end

return M
