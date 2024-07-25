local config = require("user.config")
local utils = require("user.utils")
local themer = require("user.themer")

local colorscheme = "edge"

local M = {
	"sainnhe/edge",
}

M.config = function()
	if config.colorscheme ~= "edge" then
		return false
	end
	vim.o.cursorline = true
	vim.o.cursorlineopt = "number"

	vim.cmd([[
  try
    colorscheme edge
    syntax on
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
]])
end

return M
