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
	"iceclimber-light",
	"gyokuro-light",
	"hojicha-light",
	"roseprime-light",
	"iceclimber-dark",
	"gyokuro-dark",
	"hojicha-dark",
	"roseprime-dark",
}

M.default_variant = "iceclimber-dark"

M.config = function()
	if config.colorscheme ~= "neomodern" then
		return false
	end

	local theme, variant = string.match(themer.variant(M), "([^-]+)-([^-]+)")

	require("neomodern").setup({
		theme = theme,
		variant = variant,
		transparent = config.transparent,
		diagnostics = {
			undercurl = false,
		},
	})
	require("neomodern").load()
end

return M
