local config = require("user.config")
local themer = require("user.themer")

local colorscheme = "jellybeans"

local M = {
	"metalelf0/jellybeans-nvim",
	enabled = false,
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

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

	vim.api.nvim_set_hl(0, "@string.special.symbol", { fg = "#7697d6" })
	vim.api.nvim_set_hl(0, "@text.todo.checked.markdown", { fg = "#9aae6b" })
	vim.api.nvim_set_hl(0, "@text.todo.unchecked.markdown", { fg = "#cf694a" })
	vim.api.nvim_set_hl(0, "@markup.link.label.markdown_inline", { link = "Label" })
end

return M
