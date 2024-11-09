local config = require("user.config")
local utils = require("user.utils")
local themer = require("user.themer")

local colorscheme = "ares"

local M = {
	"ab-dx/ares.nvim",
	name = "ares",
	dependencies = { "rktjmp/lush.nvim" },
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
	dev = true,
}

M.config = function()
	if config.colorscheme ~= "ares" then
		return false
	end
	vim.o.cursorline = true
	vim.o.cursorlineopt = "number"

	vim.cmd([[
  try
    colorscheme ares
    syntax on
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
]])
end

return M
