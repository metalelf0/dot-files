local config = require("user.config")

local M = {
	"sainnhe/gruvbox-material",
	lazy = false,
	priority = 1000,
}

function M.config()
	if config.colorscheme ~= "gruvbox-material" then
		return false
	end

	vim.o.background = "dark"
	vim.cmd("let g:gruvbox_material_background= 'hard'")
	vim.cmd("let g:gruvbox_material_foreground = 'mix'")
	vim.cmd("let g:gruvbox_material_ui_contrast = 'hard'")
	vim.cmd("let g:gruvbox_material_float_style = 'dim'")
	vim.cmd("let g:gruvbox_material_better_performance=1")
	vim.cmd("let g:gruvbox_material_enable_italic=1")
	vim.cmd("colorscheme " .. config.colorscheme)
	vim.cmd("hi clear @symbol")
	vim.cmd("hi link @symbol Identifier")
end

return M
