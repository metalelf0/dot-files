local config = require("user.config")
local utils = require("user.utils")
local themer = require("user.themer")

local colorscheme = "cursor-dark"

local M = {
	"ydkulks/cursor-dark.nvim",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.supported_variants = { "dark", "dark-midnight" }
M.default_variant = "dark"

M.config = function()
	if config.colorscheme ~= "cursor-dark" then
		return false
	end
	require("cursor-dark").setup({
		transparent = config.transparent,
		style = themer.variant(M),
	})
	vim.cmd.colorscheme("cursor-dark")
end

return M
