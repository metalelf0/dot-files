local config = require("user.config")

local M = {
	"rockyzhang24/arctic.nvim",
	branch = "v2",
	lazy = false,
	priority = 1000,
	enabled = (config.colorscheme == "arctic"),
}

M.config = function()
	vim.o.cursorline = true
	vim.o.cursorlineopt = "number"

	vim.cmd([[
  try
    augroup CustomHighlight
      autocmd!
      autocmd ColorScheme arctic highlight clear CursorLineNr
      autocmd ColorScheme arctic highlight link CursorLineNr Function
      autocmd ColorScheme arctic highlight clear VertSplit
      autocmd ColorScheme arctic highlight link VertSplit Function
      autocmd ColorScheme arctic highlight @text.todo.checked.markdown guifg='#6a9955'
      autocmd ColorScheme arctic highlight @text.todo.unchecked.markdown guifg='#f44747'
    augroup END

    colorscheme arctic
    syntax on
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
]])
end

return M
