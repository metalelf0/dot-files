local config = require("user.config")
local themer = require("user.themer")

local colorscheme = "seoul256"

local M = {
	"junegunn/seoul256.vim",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.config = function()
	if config.colorscheme ~= "seoul256" then
		return false
	end

	vim.cmd([[
  try
    augroup CustomHighlight
      autocmd!
      autocmd ColorScheme seoul256 highlight clear @text.todo.checked.markdown
      autocmd ColorScheme seoul256 highlight link @text.todo.checked.markdown @comment
      autocmd ColorScheme seoul256 highlight clear @text.todo.unchecked.markdown
      autocmd ColorScheme seoul256 highlight link @text.todo.unchecked.markdown @string
    augroup END

    colorscheme seoul256
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
]])
end

return M
