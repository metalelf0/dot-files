local config = require("user.config")
-- local utils = require("user.utils")
local themer = require("user.themer")

local colorscheme = "everforest"

local M = {
	"neanias/everforest-nvim",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.supported_variants = {
	"dark-medium",
	"dark-hard",
	"dark-soft",
	"light-medium",
	"light-hard",
	"light-soft",
}

function M.config()
	if config.colorscheme ~= "everforest" then
		return false
	end

	local is_transparent = config.transparent and 2 or 0
	local bg = vim.split(themer.variant(M), "-")[1]
	local contrast = vim.split(themer.variant(M), "-")[2]

	require("everforest").setup({
		background = contrast, -- can be "hard", "medium" or "soft"
		ui_contrast = "high", -- "high" or "low"
		transparent_background_level = is_transparent,
	})

	vim.o.background = bg
	vim.cmd("colorscheme " .. config.colorscheme)

	vim.o.cursorline = true
	vim.o.cursorlineopt = "number"
	vim.api.nvim_command("hi clear GitSignsCurrentLineBlame")
	vim.api.nvim_command("hi link GitSignsCurrentLineBlame NonText")
	vim.api.nvim_command("hi clear CursorLineNr")
	vim.api.nvim_command("hi link CursorLineNr String")
end

return M
