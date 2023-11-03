local config = require("user.config")

local M = {
	"metalelf0/jellybeans-nvim",
	lazy = false,
	priority = 1000,
}

M.colorscheme = "jellybeans"
M.config = function()
	if config.colorscheme ~= "jellybeans" then
		return false
	end

	vim.o.cursorline = true
	vim.o.cursorlineopt = "number"

	vim.cmd([[
  try
    augroup CustomHighlight
      autocmd!
      autocmd ColorScheme jellybeans-nvim highlight clear CursorLineNr
      autocmd ColorScheme jellybeans-nvim highlight link CursorLineNr String
    augroup END

    set termguicolors
    colorscheme jellybeans-nvim
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
]])

	vim.api.nvim_set_hl(0, "@symbol", { fg = "#d980ff" })
	vim.api.nvim_set_hl(0, "@text.todo.checked.markdown", { fg = "#9aae6b" })
	vim.api.nvim_set_hl(0, "@text.todo.unchecked.markdown", { fg = "#cf694a" })
end

return M
