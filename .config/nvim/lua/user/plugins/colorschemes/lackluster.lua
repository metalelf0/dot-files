local config = require("user.config")
local utils = require("user.utils")
local themer = require("user.themer")

local colorscheme = "lackluster"

local M = {
	"slugbyte/lackluster.nvim",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.supported_variants = { "default", "dark", "hack", "mint", "night" }
M.default_variant = "default"

M.config = function()
	if config.colorscheme ~= "lackluster" then
		return false
	end
	local lackluster = require("lackluster")
	local opts = {}

	if config.transparent then
		opts.tweak_syntax = {}
		opts.tweak_syntax.comment = lackluster.color.gray4
		opts.tweak_background = {}
		opts.tweak_background.normal = "none"
		opts.tweak_background.telescope = "none"
		opts.tweak_background.menu = lackluster.color.gray3
		opts.popup = "default"
	end

	lackluster.setup(opts)

	local theme_name = "lackluster"
	if themer.variant(M) ~= "default" then
		theme_name = theme_name .. "-" .. themer.variant(M)
	end

	vim.cmd.colorscheme(theme_name)
end

return M
