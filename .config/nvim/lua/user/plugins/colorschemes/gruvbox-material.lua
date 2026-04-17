local config = require("user.config")
local themer = require("user.themer")

local colorscheme = "gruvbox-material"

local M = {
	"sainnhe/gruvbox-material",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.supported_variants = { "dark-hard", "dark-medium", "dark-soft", "light-hard", "light-medium", "light-soft" }
M.default_variant = "dark-hard"

function M.config()
	if config.colorscheme ~= "gruvbox-material" then
		return false
	end

	local bg = vim.split(themer.variant(M), "-")[1]
	local contrast = vim.split(themer.variant(M), "-")[2]

	vim.o.background = bg

	vim.cmd("let g:gruvbox_material_background='" .. bg .. "'")
	vim.cmd("let g:gruvbox_material_ui_contrast='" .. contrast .. "'")
	vim.cmd("let g:gruvbox_material_better_performance=1")
	if config.transparent then
		vim.cmd("let g:gruvbox_material_transparent_background=2")
	end
	vim.cmd("let g:gruvbox_material_diagnostic_line_highlight=1")
	vim.cmd("let g:gruvbox_material_enable_bold=1")
	vim.cmd("let g:gruvbox_material_enable_italic=1")
	vim.cmd("colorscheme " .. config.colorscheme)

	-- vim.cmd("hi clear @string.special.symbol")
	-- vim.cmd("hi link @string.special.symbol Identifier")
	-- vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
	-- vim.api.nvim_set_hl(0, "LspInfoBorder", { link = "Normal" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })

	local hl = vim.api.nvim_set_hl
	local cmd = vim.cmd

	cmd([[highlight WinSeparator guibg = None]])
	cmd([[highlight CursorLineNr guifg = #d8a657]])

	-- changing bg and border colors
	hl(0, "FloatBorder", { link = "Normal" })
	hl(0, "LspInfoBorder", { link = "Normal" })
	hl(0, "NormalFloat", { link = "Normal" })
	hl(0, "Pmenu", { link = "Normal" })
	hl(0, "PmenuSel", { link = "Search" })

	-- -- blink cmp
	hl(0, "BlinkCmpMenu", { link = "Normal" })
	hl(0, "BlinkCmpMenuBorder", { link = "Normal" })
	hl(0, "BlinkCmpMenuSelection", { link = "Search" })
	hl(0, "BlinkCmpLabelMatch", { link = "Search" })

	-- -- snacks dashboard
	hl(0, "SnacksDashboardHeader", { fg = "#d8a657" })
	hl(0, "SnacksDashboardDesc", { fg = "#83a598" })
	hl(0, "SnacksDashboardFooter", { fg = "#d8a657" })
	--
	-- -- snacks indentline
	hl(0, "SnacksIndent1", { fg = "#ea6962" })
	hl(0, "SnacksIndent2", { fg = "#d8a657" })
	hl(0, "SnacksIndent3", { fg = "#458588" })
	hl(0, "SnacksIndent4", { fg = "#8ec07c" })
	hl(0, "SnacksIndent5", { fg = "#d3869b" })
	hl(0, "SnacksIndent6", { fg = "#e78a4e" })
	hl(0, "SnacksIndent7", { fg = "#83a598" })
	--
	-- -- snacks picker
	hl(0, "SnacksPickerDir", { fg = "#928374" })
	--
	-- rainbow delimiter
	hl(0, "RainbowDelimiter1", { fg = "#ea6962" })
	hl(0, "RainbowDelimiter2", { fg = "#d8a657" })
	hl(0, "RainbowDelimiter3", { fg = "#458588" })
	hl(0, "RainbowDelimiter4", { fg = "#8ec07c" })
	hl(0, "RainbowDelimiter5", { fg = "#d3869b" })
	hl(0, "RainbowDelimiter6", { fg = "#e78a4e" })
	hl(0, "RainbowDelimiter7", { fg = "#83a598" })
end

return M
