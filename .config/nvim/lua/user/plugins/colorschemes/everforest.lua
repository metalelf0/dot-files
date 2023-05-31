local config = require("user.config")

local M = {
	"sainnhe/everforest",
	lazy = false,
	priority = 1000,
	enabled = (config.colorscheme == "everforest"),
}

function M.config()
	vim.cmd("colorscheme " .. config.colorscheme)
end

return M
