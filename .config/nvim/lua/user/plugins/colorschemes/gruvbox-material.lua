local config = require("user.config")
local themer = require("user.themer")

local colorscheme = "gruvbox-material"

local M = {
	"sainnhe/gruvbox-material",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

function M.config()
	if config.colorscheme ~= "gruvbox-material" then
		return false
	end

	vim.o.background = "dark"
	vim.cmd("let g:gruvbox_material_background= 'hard'")
	-- vim.cmd("let g:gruvbox_material_foreground = 'mix'")
	vim.cmd("let g:gruvbox_material_ui_contrast = 'hard'")
	-- vim.cmd("let g:gruvbox_material_float_style = 'dim'")
	vim.cmd("let g:gruvbox_material_better_performance=1")
	-- vim.cmd("let g:gruvbox_material_transparent_background=2")
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
