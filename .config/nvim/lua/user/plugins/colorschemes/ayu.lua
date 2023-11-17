local config = require("user.config")
local utils = require("user.utils")
local themer = require("user.themer")

local colorscheme = "ayu"

local M = {
	"Shatur/neovim-ayu",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.config = function()
	if config.colorscheme ~= "ayu" then
		return false
	end

	require("ayu").setup({
		mirage = false,
		overrides = {},
	})

	require("ayu").colorscheme()
end

return M
