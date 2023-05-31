local config = require("user.config")

local M = {
	"metalelf0/jellybeans-nvim",
	lazy = false,
	priority = 1000,
	enabled = (config.colorscheme == "jellybeans"),
}

M.config = function()
	vim.cmd([[
  try
    set termguicolors
    colorscheme jellybeans-nvim
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
]])

	vim.api.nvim_set_hl(0, "@symbol", { fg = "#c5b5ee" })
	vim.api.nvim_set_hl(0, "@text.todo.checked.markdown", { fg = "#9aae6b" })
	vim.api.nvim_set_hl(0, "@text.todo.unchecked.markdown", { fg = "#cf694a" })
end

return M
