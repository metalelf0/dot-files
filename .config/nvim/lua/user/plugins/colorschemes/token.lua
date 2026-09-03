local config = require("user.config")
local themer = require("user.themer")

local colorscheme = "token"

local M = {
	"ThorstenRhau/token",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.supported_variants = {
	"classic-dark",
	"ultra-dark",
	"flint-dark",
	"temper-dark",
	"classic-light",
	"ultra-light",
	"flint-light",
	"temper-light",
}

M.default_variant = "classic-dark"

M.config = function()
	if config.colorscheme ~= "token" then
		return false
	end

	local palette = vim.split(themer.variant(M), "-")[1]
	local background = vim.split(themer.variant(M), "-")[2]
	local token = require("token")

	local theme_name = "token"
	if palette ~= "classic" then
		theme_name = "token-" .. palette
	end

	vim.opt.bg = background

	---@type token.Config
	local config = {
		transparent = false,
		plugins = { gitsigns = true, snacks = true },
	}

	token.setup(config)
	vim.cmd.colorscheme(theme_name)
end

return M
