local config = require("user.config")

local M = {
	"ronisbr/nano-theme.nvim",
	init = function()
		-- vim.o.background = "light" -- or "dark".
	end,
	lazy = false,
	priority = 1001,
}

function M.config()
	if config.colorscheme ~= "nano-theme" then
		return false
	end

	vim.cmd("colorscheme " .. config.colorscheme)
end

return M
