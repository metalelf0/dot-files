local config = require("user.config")

local M = {
	"rebelot/kanagawa.nvim",
	lazy = false,
	priority = 1000,
	enabled = (config.colorscheme == "kanagawa"),
}

M.config = function()
	require("kanagawa").setup({
		undercurl = true, -- enable undercurls
		commentStyle = { italic = true },
		functionStyle = {},
		keywordStyle = { italic = true },
		statementStyle = { bold = true },
		typeStyle = {},
		variablebuiltinStyle = { italic = true },
		specialReturn = true, -- special highlight for the return keyword
		specialException = true, -- special highlight for exception handling keywords
		transparent = false, -- do not set background color
		dimInactive = false, -- dim inactive window `:h hl-NormalNC`
		globalStatus = true,
		theme = "dragon", -- or "light" for the experimental light variant
		colors = {
			theme = {
				all = {
					ui = {
						bg_gutter = "none",
					},
				},
			},
		},
		overrides = function(colors)
			local theme = colors.theme
			local palette = colors.palette
			return {
				TelescopeTitle = { fg = theme.ui.special, bold = true },
				TelescopePromptNormal = { bg = theme.ui.bg_p1 },
				TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
				TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
				TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
				TelescopePreviewNormal = { bg = theme.ui.bg_dim },
				TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
				Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
				PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
				PmenuSbar = { bg = theme.ui.bg_m1 },
				PmenuThumb = { bg = theme.ui.bg_p2 },
				["@text.todo.checked.markdown"] = { bg = theme.ui.bg_p1, fg = palette.dragonGreen },
				["@text.todo.unchecked.markdown"] = { bg = theme.ui.bg_p1, fg = palette.peachRed },
				VertSplit = { fg = palette.dragonGreen },
			}
		end,
	})

	vim.api.nvim_create_autocmd("ColorScheme", {
		pattern = "kanagawa",
		callback = function()
			if vim.o.background == "light" then
				vim.fn.system("kitty +kitten themes Kanagawa_light")
			elseif vim.o.background == "dark" then
				vim.fn.system("kitty +kitten themes Kanagawa_dragon")
			else
				vim.fn.system("kitty +kitten themes Kanagawa")
			end
		end,
	})
	-- setup must be called before loading
	vim.cmd([[
try
  set background=dark
  colorscheme kanagawa-dragon
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]])
end

return M
