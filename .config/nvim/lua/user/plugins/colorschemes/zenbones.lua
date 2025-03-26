local config = require("user.config")
local themer = require("user.themer")

local colorscheme = "zenbones"

local M = {
	"mcchrish/zenbones.nvim",
	dependencies = { "rktjmp/lush.nvim" },
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.config = function()
	if config.colorscheme ~= "zenbones" then
		return false
	end

	vim.cmd.colorscheme("zenbones")
end

return M
