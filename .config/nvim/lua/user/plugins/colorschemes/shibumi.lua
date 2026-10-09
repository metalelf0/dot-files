-- formerly known as gruvdark
local config = require("user.config")
local themer = require("user.themer")

local colorscheme = "shibumi"

local M = {
	"darianmorat/shibumi.nvim",
	version = "*",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
	opts = {
		transparent = config.transparent,
	},
}

M.supported_variants = { "shibumi", "shibumi-light" }
M.default_variant = "shibumi"

M.config = function()
	if config.colorscheme ~= "shibumi" then
		return false
	end

	vim.cmd("colorscheme " .. themer.variant(M))
	vim.g.colors_name = themer.variant(M)
end

return M
