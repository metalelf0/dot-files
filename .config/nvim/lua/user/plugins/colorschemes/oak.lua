local config = require("user.config")

local M = {
	"vigoux/oak",
	lazy = false,
	priority = 1000,
	enabled = (config.colorscheme == "oak"),
}

M.config = function()
	vim.cmd([[
    augroup CustomHighlight
      autocmd!
      autocmd ColorScheme oak highlight link @symbol String
    augroup END
  ]])
	vim.cmd("colorscheme oak")
end

return M
