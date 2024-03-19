local themer = require("user.themer")

local colorscheme = "black-metal"

local M = {
	"metalelf0/black-metal-theme-neovim",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
	dev = true,
}

M.config = function()
	vim.cmd("colorscheme black-metal")
end

return M
