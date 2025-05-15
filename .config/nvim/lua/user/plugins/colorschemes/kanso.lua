local config = require("user.config")
local themer = require("user.themer")

local colorscheme = "kanso"

local M = {
	"webhooked/kanso.nvim",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.supported_variants = { "zen", "pearl", "ink" }
M.default_variant = "zen"

M.config = function()
	if config.colorscheme ~= "kanso" then
		return false
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
		dimInactive = false, -- dim inactive window `:h hl-NormalNC`
		terminalColors = true, -- define vim.g.terminal_color_{0,17}
		colors = { -- add/modify theme and palette colors
			palette = {},
			theme = { zen = {}, pearl = {}, ink = {}, all = {} },
		},
		overrides = function(colors) -- add/modify highlights
			return {}
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
	vim.cmd("colorscheme kanso")
end

return M
