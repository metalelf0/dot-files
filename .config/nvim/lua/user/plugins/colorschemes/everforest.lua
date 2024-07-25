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

	require("everforest").setup({
		transparent_background_level = 0,
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
