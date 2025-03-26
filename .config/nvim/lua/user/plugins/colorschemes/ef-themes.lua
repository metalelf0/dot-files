local themer = require("user.themer")
local config = require("user.config")

local colorscheme = "ef-themes"

local M = {
	"oonamo/ef-themes.nvim",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.supported_variants = {
	"ef-arbutus",
	"ef-autumn",
	"ef-bio",
	"ef-cherie",
	"ef-cyprus",
	"ef-dark",
	"ef-day",
	"ef-deuteranopia-dark",
	"ef-deuteranopia-light",
	"ef-dream",
	"ef-duo-dark",
	"ef-duo-light",
	"ef-eagle",
	"ef-elea-dark",
	"ef-elea-light",
	"ef-frost",
	"ef-kassio",
	"ef-light",
	"ef-maris-dark",
	"ef-maris-light",
	"ef-melissa-dark",
	"ef-melissa-light",
	"ef-night",
	"ef-owl",
	"ef-reverie",
	"ef-rosa",
	"ef-spring",
	"ef-summer",
	"ef-symbiosis",
	"ef-tint",
	"ef-trio-dark",
	"ef-trio-light",
	"ef-tritanopia-dark",
	"ef-tritanopia-light",
	"ef-winter",
}

M.default_variant = "ef-dark"

M.config = function()
	if config.colorscheme ~= "ef-themes" then
		return false
	end

	require("ef-themes").setup({
		light = "ef-spring", -- Ef-theme to select for light backgrounds
		dark = "ef-winter", -- Ef-theme to select for dark backgrounds
		transparent = config.transparent,
		modules = {
			snacks = true,
		},
	})

	vim.cmd.colorscheme(themer.variant(M) or "ef-theme")
end

return M
