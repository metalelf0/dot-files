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

M.supported_variants = { "dark", "mirage", "light" }
M.default_variant = "dark"

M.config = function()
	if config.colorscheme ~= "ayu" then
		return false
	end

	if themer.variant(M) == "light" then
		vim.opt.background = "light"
	else
		vim.opt.background = "dark"
	end

	vim.opt.cursorline = true
	vim.opt.cursorlineopt = "number"

	local colors = require("ayu.colors")
	local is_mirage = (themer.variant(M) == "mirage")
	colors.generate(is_mirage)
	local use_black = (themer.variant(M) == "dark")

	local overrides = {
		["@string.special.symbol"] = { fg = colors.tag },
		-- Normal = { bg = "None" },
		-- ColorColumn = { bg = "None" },
		-- SignColumn = { bg = "None" },
		-- Folded = { bg = "None" },
		-- FoldColumn = { bg = "None" },
		-- CursorLine = { bg = "None" },
		-- CursorColumn = { bg = "None" },
		-- WhichKeyFloat = { bg = "None" },
		-- VertSplit = { bg = "None" },
	}

	if use_black then
		overrides["Normal"] = { bg = "#000000" }
	end

	require("ayu").setup({
		mirage = is_mirage,
		overrides = overrides,
	})

	require("ayu").colorscheme()
	vim.opt.cursorline = true
	vim.opt.cursorlineopt = "number"
end

return M
