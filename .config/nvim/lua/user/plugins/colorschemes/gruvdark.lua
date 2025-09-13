local config = require("user.config")
local themer = require("user.themer")

local colorscheme = "gruvdark"

local M = {
	"darianmorat/gruvdark.nvim",
	version = "*",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
	opts = {
		transparent = config.transparent,
	},
}

M.supported_variants = { "gruvdark", "gruvdark-light" }
M.default_variant = "gruvdark"

M.config = function()
	if config.colorscheme ~= "gruvdark" then
		return false
	end

	vim.cmd("colorscheme " .. themer.variant(M))
	vim.g.colors_name = themer.variant(M)
end

return M
