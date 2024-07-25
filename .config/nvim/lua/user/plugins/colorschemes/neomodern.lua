local config = require("user.config")
local themer = require("user.themer")

local colorscheme = "neomodern"

local M = {
	"cdmill/neomodern.nvim",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.supported_variants = {
	"iceclimber",
	"coffeecat",
	"darkforest",
	"campfire",
	"roseprime",
	"daylight",
}

M.default_variant = "iceclimber"

M.config = function()
	if config.colorscheme ~= "neomodern" then
		return false
	end

	require("neomodern").setup({
		style = themer.variant(M),
		ui = {
			telescope = "borderless",
		},
	})
	require("neomodern").load()
end

return M
