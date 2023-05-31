local config = require("user.config")

local M = {
	"loctvl842/monokai-pro.nvim",
	lazy = false,
	priority = 1000,
	enabled = (config.colorscheme == "monokai-pro"),
}

function M.config()
	require("monokai-pro").setup()
	vim.cmd("colorscheme monokai-pro")
end

return M
