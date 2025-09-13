local config = require("user.config")
local themer = require("user.themer")

local colorscheme = "black-metal"

local M = {
	"metalelf0/black-metal-theme-neovim",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
	dev = true,
}

M.supported_variants = {
	"bathory",
	"burzum",
	"dark-funeral",
	"darkthrone",
	"emperor",
	"gorgoroth",
	"immortal",
	"impaled-nazarene",
	"khold",
	"marduk",
	"mayhem",
	"nile",
	"taake",
	"thyrfing",
	"venom",
	"windir",
}

M.default_variant = "burzum"

M.config = function()
	if config.colorscheme ~= "black-metal" then
		return false
	end

	local theme = themer.variant(M)
	local variant = "dark"

	require("black-metal").setup({
		theme = theme,
		variant = variant,
		alt_bg = true,
		transparent = config.transparent,
		diagnostics = {
			undercurl = false,
		},
		highlights = {
			["@keyword"] = { fg = "$orange", fmt = "bold" },
		},
	})
	require("black-metal").load()
end

return M
