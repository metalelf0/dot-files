local config = require("user.config")
local themer = require("user.themer")

local colorscheme = "oak"

local M = {
	"vigoux/oak",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

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
