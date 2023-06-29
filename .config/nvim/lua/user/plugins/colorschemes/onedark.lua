local config = require("user.config")

local M = {
	"navarasu/onedark.nvim",
	lazy = false,
	priority = 1000,
}

M.config = function()
	if config.colorscheme ~= "onedark" then
		return false
	end

	local onedark = require("onedark")
	onedark.setup({
		style = "light",
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

	onedark.load()
end

return M
