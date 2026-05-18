local config = require("user.config")
local themer = require("user.themer")

local colorscheme = "thorn"

local M = {
	"jpwol/thorn.nvim",
	branch = "refactor/theme-change",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.supported_variants = { "field", "forest" }
M.default_variant = "forest"

M.config = function()
	if config.colorscheme ~= "thorn" then
		return false
	end

	require("thorn").setup({
		theme = themer.variant(M),
		transparent = config.transparent,
	})
	vim.cmd("colorscheme thorn")
	vim.cmd("hi clear WinSeparator")
	vim.cmd("hi link WinSeparator FloatBorder")
end

return M
