local config = require("user.config")

local M = {
	"dasupradyumna/midnight.nvim",
	lazy = false,
	priority = 1000,
}

M.colorscheme = "midnight"
M.config = function()
	if config.colorscheme ~= "midnight" then
		return false
	end
	vim.cmd("colorscheme midnight")
end

return M
