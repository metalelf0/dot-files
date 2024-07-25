local config = require("user.config")
local utils = require("user.utils")
local themer = require("user.themer")

local colorscheme = "arctic"

local M = {
	"rockyzhang24/arctic.nvim",
	branch = "v2",
	dependencies = { "rktjmp/lush.nvim" },
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.config = function()
	if config.colorscheme ~= "arctic" then
		return false
	end
	vim.o.cursorline = true
	vim.o.cursorlineopt = "number"

	vim.cmd([[
  try
    augroup CustomHighlight
      autocmd!
      autocmd ColorScheme arctic highlight clear CursorLineNr
      autocmd ColorScheme arctic highlight link CursorLineNr Function
      autocmd ColorScheme arctic highlight clear WinSeparator
      autocmd ColorScheme arctic highlight link WinSeparator Function
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
