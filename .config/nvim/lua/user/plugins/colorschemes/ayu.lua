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

  vim.opt.cursorline = true

	local colors = require("ayu.colors")
	colors.generate(false)

	require("ayu").setup({
		mirage = false,
		overrides = {
			["@symbol"] = { fg = colors.tag },
		},
	})

	require("ayu").colorscheme()
end

return M
