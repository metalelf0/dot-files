local config = require("user.config")
local utils = require("user.utils")
local themer = require("user.themer")

local colorscheme = "citruszest"

local M = {
	"zootedb0t/citruszest.nvim",
}

M.config = function()
	if config.colorscheme ~= "citruszest" then
		return false
	end
	vim.o.cursorline = true
	vim.o.cursorlineopt = "number"

	vim.cmd([[
  try
    colorscheme citruszest
    syntax on
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
]])
end

return M
