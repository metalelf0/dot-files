local config = require("user.config")
local themer = require("user.themer")

-- palette file: ~/.local/share/nvim/lazy/kanso.nvim/lua/kanso/colors.lua

local colorscheme = "kanso"

local M = {
	"webhooked/kanso.nvim",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.supported_variants = { "zen", "pearl", "ink", "mist" }
M.default_variant = "zen"

M.config = function()
	if config.colorscheme ~= "kanso" then
		return false
	end

	local customHighlights = function(colors)
		if themer.variant(M) == "pearl" then
			return {
				MarkviewHeading1 = { bg = colors.palette.pearlWhite1, fg = colors.palette.pearlYellow },
				MarkviewHeading2 = { bg = colors.palette.pearlWhite1, fg = colors.palette.pearlBlue },
				MarkviewHeading3 = { bg = colors.palette.pearlWhite1, fg = colors.palette.pearlGreen },
				MarkviewHeading4 = { bg = colors.palette.pearlWhite1, fg = colors.palette.pearlViolet },
				MarkviewHeading5 = { bg = colors.palette.pearlWhite1, fg = colors.palette.pearlOrange },
				MarkviewHeading6 = { bg = colors.palette.pearlWhite1, fg = colors.palette.pearlRed },
			}
		else
			return {
				MarkviewHeading1 = { bg = colors.palette.zenBg1, fg = colors.palette.yellow },
				MarkviewHeading2 = { bg = colors.palette.zenBg1, fg = colors.palette.blue },
				MarkviewHeading3 = { bg = colors.palette.zenBg1, fg = colors.palette.green },
				MarkviewHeading4 = { bg = colors.palette.zenBg1, fg = colors.palette.violet },
				MarkviewHeading5 = { bg = colors.palette.zenBg1, fg = colors.palette.orange },
				MarkviewHeading6 = { bg = colors.palette.zenBg1, fg = colors.palette.red },
				WinSeparator = { fg = colors.palette.inkBg4 },
			}
		end
	end

	require("kanso").setup({
		compile = false, -- enable compiling the colorscheme
		undercurl = true, -- enable undercurls
		commentStyle = { italic = true },
		functionStyle = {},
		keywordStyle = { italic = true },
		statementStyle = {},
		typeStyle = {},
		disableItalics = false,
		transparent = config.transparent, -- do not set background color
		dimInactive = config.dimInactive, -- dim inactive window `:h hl-NormalNC`
		terminalColors = true, -- define vim.g.terminal_color_{0,17}
		colors = { -- add/modify theme and palette colors
			palette = {},
			theme = { zen = {}, pearl = {}, ink = {}, all = {} },
		},
		foreground = {
			dark = "zen",
			light = "pearl",
		},
		overrides = function(colors) -- add/modify highlights
			return customHighlights(colors)
		end,
		theme = themer.variant(M), -- Load "zen" theme
		background = { -- map the value of 'background' option to a theme
			dark = "zen", -- try "ink" !
			light = "pearl",
		},
	})
	if config.variant == "pearl" then
		vim.cmd("set background=light")
	end
	vim.cmd("colorscheme kanso-" .. themer.variant(M))
end

return M
