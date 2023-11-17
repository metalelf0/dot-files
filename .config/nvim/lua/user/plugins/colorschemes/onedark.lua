local config = require("user.config")
local utils = require("user.utils")
local themer = require("user.themer")

local colorscheme = "onedark"

local M = {
	"navarasu/onedark.nvim",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.supported_variants = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }
M.default_variant = "dark"

M.config = function()
	if config.colorscheme ~= "onedark" then
		return false
	end

	vim.o.termguicolors = true
	vim.o.cursorline = true
	vim.o.cursorlineopt = "number"

	local onedark = require("onedark")
	onedark.setup({
		style = themer.variant(M),
		highlights = {
			rainbowcol1 = { fg = "Black" },
			rainbowcol2 = { fg = "DarkGreen" },
			rainbowcol3 = { fg = "DarkMagenta" },
			rainbowcol4 = { fg = "DarkBlue" },
			rainbowcol5 = { fg = "DarkRed" },
			rainbowcol6 = { fg = "DarkGray" },
			IlluminatedWordText = { bg = "#e6e6e6" },
			IlluminatedWordRead = { bg = "#e6e6e6" },
			IlluminatedWordWrite = { bg = "#e6e6e6" },
			-- Spell highlight only add underlines.
			SpellBad = { fg = "unset", bg = "unset" },
			SpellCap = { fg = "unset", bg = "unset" },
			SpellRare = { fg = "unset", bg = "unset" },
			SpellLocal = { fg = "unset", bg = "unset" },
			-- ["@comment"] = { fg = "#777777", bg = "unset" },
		},
	})

	local setup = [[
	     highlight clear CursorLineNr
	     highlight link CursorLineNr String
	 ]]

	vim.cmd(setup)

	onedark.load()
end

return M
