local themer = require("user.themer")

local colorscheme = "mellow"

local M = {
	"mellow-theme/mellow.nvim",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
	dev = true,
}

M.config = function()
	vim.opt.cursorline = true
	vim.cmd("colorscheme mellow")
end

return M
