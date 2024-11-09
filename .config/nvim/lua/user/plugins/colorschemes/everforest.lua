local config = require("user.config")
local utils = require("user.utils")
local themer = require("user.themer")

local colorscheme = "everforest"

local M = {
	"neanias/everforest-nvim",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

function M.config()
	if config.colorscheme ~= "everforest" then
		return false
	end

	local is_transparent = config.transparent and 2 or 0

	require("everforest").setup({
		background = "hard", -- can be "hard", "medium" or "soft"
		ui_contrast = "high", -- "high" or "low"
		transparent_background_level = is_transparent,
	})

	vim.cmd("colorscheme " .. config.colorscheme)

	vim.o.cursorline = true
	vim.o.cursorlineopt = "number"
	vim.api.nvim_command("hi clear GitSignsCurrentLineBlame")
	vim.api.nvim_command("hi link GitSignsCurrentLineBlame NonText")
	vim.api.nvim_command("hi clear CursorLineNr")
	vim.api.nvim_command("hi link CursorLineNr String")
end

return M
