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

	vim.cmd("let g:gruvbox_material_background= " .. bg)
	vim.cmd("let g:gruvbox_material_ui_contrast = " .. contrast)
	vim.cmd("let g:gruvbox_material_better_performance=1")
	if config.transparent then
		vim.cmd("let g:gruvbox_material_transparent_background=2")
	end
	vim.cmd("let g:gruvbox_material_diagnostic_line_highlight=1")
	vim.cmd("let g:gruvbox_material_enable_bold=1")
	vim.cmd("let g:gruvbox_material_enable_italic=1")
	vim.cmd("colorscheme " .. config.colorscheme)
	vim.cmd("hi clear @string.special.symbol")
	vim.cmd("hi link @string.special.symbol Identifier")
	vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
	vim.api.nvim_set_hl(0, "LspInfoBorder", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
end

return M
