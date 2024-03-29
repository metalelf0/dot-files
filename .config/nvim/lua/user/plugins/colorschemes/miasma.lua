local config = require("user.config")
local themer = require("user.themer")

local colorscheme = "miasma"

local M = {
	"xero/miasma.nvim",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.config = function()
	if config.colorscheme ~= "miasma" then
		return false
	end

	vim.o.termguicolors = true
	vim.opt.cursorline = true
	vim.opt.cursorlineopt = "number"

	local setup = [[
     colorscheme miasma

     highlight clear CursorLineNr
     highlight link CursorLineNr String
     highlight clear Headline
     highlight link Headline TermCursorNC
	 ]]

	vim.cmd(setup)
end

return M
