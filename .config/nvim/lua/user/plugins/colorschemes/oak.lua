local config = require("user.config")

local M = {
	"vigoux/oak",
	lazy = false,
	priority = 1000,
}

M.colorscheme = "oak"
M.config = function()
	if config.colorscheme ~= "oak" then
		return false
	end
	vim.cmd([[
    augroup CustomHighlight
      autocmd!
      autocmd ColorScheme oak highlight link @symbol String
    augroup END
  ]])
	vim.cmd("colorscheme oak")
end

return M
