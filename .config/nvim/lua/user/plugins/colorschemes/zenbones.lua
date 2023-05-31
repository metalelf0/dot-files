local config = require("user.config")

local M = {
	"mcchrish/zenbones.nvim",
	dependencies = { "rktjmp/lush.nvim" },
	lazy = false,
	priority = 1000,
	enabled = (config.colorscheme == "zenbones"),
}

M.config = function()
	vim.cmd("colorscheme zenwritten")
end

return M
