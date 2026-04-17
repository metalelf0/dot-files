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
	"gyokuro-dark",
	"gyokuro-light",
	"hojicha-dark",
	"hojicha-light",
	"iceclimber-dark",
	"iceclimber-light",
	"moon-dark",
	"moon-light",
	"roseprime-dark",
	"roseprime-light",
}

M.default_variant = "iceclimber-dark"

M.config = function()
	if config.colorscheme ~= "neomodern" then
		return false
	end

	local theme, variant = string.match(themer.variant(M), "([^-]+)-([^-]+)")

	vim.o.background = variant

	local bg = "default"
	if config.transparent then
		bg = "transparent"
	end

	require("neomodern").setup({
		bg = bg,
		theme = theme,
		variant = variant,
		diagnostics = {
			undercurl = false,
		},
	})
	require("neomodern").load()
end

return M
