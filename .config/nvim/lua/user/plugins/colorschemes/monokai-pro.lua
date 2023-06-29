local config = require("user.config")

local M = {
	"loctvl842/monokai-pro.nvim",
	lazy = false,
	priority = 1000,
}

function M.config()
	if config.colorscheme ~= "monokai-pro" then
		return false
	end

	require("monokai-pro").setup()
	vim.cmd("colorscheme monokai-pro")
end

return M
