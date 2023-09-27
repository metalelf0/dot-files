local config = require("user.config")

local M = {
	"AlexvZyl/nordic.nvim",
	lazy = false,
	priority = 1000,
}

M.config = function()
	if config.colorscheme ~= "nordic" then
		return false
	end

	local palette = require("nordic.colors")

	vim.o.cursorline = true
	vim.o.cursorlineopt = "number"

	require("nordic").setup({
		override = {
			["@symbol"] = {
				fg = palette.blue1,
			},
		},
	})

	vim.cmd([[
  try
    augroup CustomHighlight
      autocmd!
      autocmd ColorScheme nordic highlight clear CursorLineNr
      autocmd ColorScheme nordic highlight link CursorLineNr String
    augroup END

    colorscheme nordic
    syntax on
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
  ]])
end

return M
