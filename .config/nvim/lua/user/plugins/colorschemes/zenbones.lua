local config = require("user.config")

local M = {
	"mcchrish/zenbones.nvim",
	dependencies = { "rktjmp/lush.nvim" },
	lazy = false,
	priority = 1000,
}

M.colorscheme = "zenbones"

M.config = function()
	if config.colorscheme ~= "zenbones" then
		return false
	end

	vim.cmd("colorscheme zenwritten")
end

return M
