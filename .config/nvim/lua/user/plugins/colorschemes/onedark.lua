local config = require("user.config")
local utils = require("user.utils")

local M = {
	"navarasu/onedark.nvim",
	lazy = false,
	priority = 1000,
}

M.supported_variants = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }
M.default_variant = "dark"

M.variant = function()
	if not utils.contains(M.supported_variants, config.variant) then
		vim.notify("Variant " .. config.variant .. " not supported, defaulting to " .. M.default_variant)
	end

	return (config.variant or M.default_variant)
end

M.config = function()
	if config.colorscheme ~= "onedark" then
		return false
	end

	vim.o.termguicolors = true
	vim.o.cursorline = true
	vim.o.cursorlineopt = "number"

	local onedark = require("onedark")
	onedark.setup({
		style = M.variant(),
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
