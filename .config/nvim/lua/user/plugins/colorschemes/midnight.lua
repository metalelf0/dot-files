local config = require("user.config")

local M = {
	"dasupradyumna/midnight.nvim",
	lazy = false,
	priority = 1000,
	enabled = (config.colorscheme == "midnight"),
}

M.config = function()
	vim.cmd("colorscheme midnight")
end

return M
