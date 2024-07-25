local config = require("user.config")
local utils = require("user.utils")
local themer = require("user.themer")

local colorscheme = "vesper"

local M = {
	"datsfilipe/vesper.nvim",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.config = function()
	if config.colorscheme ~= "vesper" then
		return false
	end

	require("vesper").setup({
		transparent = true, -- Boolean: Sets the background to transparent
		italics = {
			comments = true, -- Boolean: Italicizes comments
			keywords = false, -- Boolean: Italicizes keywords
			functions = false, -- Boolean: Italicizes functions
			strings = false, -- Boolean: Italicizes strings
			variables = false, -- Boolean: Italicizes variables
		},
		overrides = {}, -- A dictionary of group names, can be a function returning a dictionary or a table.
	})

	vim.cmd([[colorscheme vesper]])
end

return M
