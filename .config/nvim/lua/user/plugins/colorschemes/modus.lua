local config = require("user.config")

local M = {

	"ishan9299/modus-theme-vim",
	lazy = false,
	priority = 1000,
	enabled = (config.colorscheme == "modus"),
}

M.config = function()
	vim.cmd("colorscheme modus-vivendi")
end

return M
