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
	vim.opt.cursorlineopt = "number"

	local colors = require("ayu.colors")
	colors.generate(false)

	require("ayu").setup({
		mirage = false,
		overrides = {
			["@symbol"] = { fg = colors.tag },
			-- Normal = { bg = "None" },
			-- ColorColumn = { bg = "None" },
			-- SignColumn = { bg = "None" },
			-- Folded = { bg = "None" },
			-- FoldColumn = { bg = "None" },
			-- CursorLine = { bg = "None" },
			-- CursorColumn = { bg = "None" },
			-- WhichKeyFloat = { bg = "None" },
			-- VertSplit = { bg = "None" },
		},
	})

	require("ayu").colorscheme()
end

return M
