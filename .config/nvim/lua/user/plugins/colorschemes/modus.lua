local config = require("user.config")

local M = {
	"ishan9299/modus-theme-vim",
	lazy = false,
	priority = 1000,
}

M.colorscheme = "modus"
M.config = function()
	if config.colorscheme ~= "modus" then
		return false
	end

	vim.cmd("colorscheme modus-vivendi")
end

return M
