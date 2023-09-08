local config = require("user.config")
local utils = require("user.utils")

local M = {
	"rebelot/kanagawa.nvim",
	lazy = false,
	priority = 1000,
}

M.supported_variants = { "wave", "dragon", "lotus" }
M.default_variant = "wave"

M.variant = function()
	if not utils.contains(M.supported_variants, config.variant) then
		vim.notify("Variant " .. config.variant .. " not supported, defaulting to " .. M.default_variant)
	end

	return (config.variant or M.default_variant)
end

M.colorscheme = function()
	return "kanagawa-" .. M.variant()
end

M.config = function()
	if config.colorscheme ~= "kanagawa" then
		return false
	end

	require("kanagawa").setup({
		undercurl = false, -- enable undercurls
		commentStyle = { italic = true },
		functionStyle = {},
		keywordStyle = { italic = false },
		statementStyle = { bold = true },
		typeStyle = {},
		variablebuiltinStyle = { italic = true },
		terminalColors = true,
		specialReturn = true, -- special highlight for the return keyword
		specialException = true, -- special highlight for exception handling keywords
		transparent = false, -- do not set background color
		dimInactive = false, -- dim inactive window `:h hl-NormalNC`
		globalStatus = true,
		theme = M.variant(), -- or "light" for the experimental light variant
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
				-- VertSplit = { fg = palette.dragonGreen },
				VertSplit = { fg = "#FFFFFF" },
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
	vim.cmd("colorscheme " .. M.colorscheme())
end

return M
