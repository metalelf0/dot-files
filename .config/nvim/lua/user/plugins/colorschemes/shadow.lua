local config = require("user.config")
local themer = require("user.themer")

local colorscheme = "shadow"

local M = {
	"rjshkhr/shadow.nvim",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.config = function()
	if config.colorscheme ~= "shadow" then
		return false
	end

	require("shadow").setup()
	vim.cmd("colorscheme shadow")
	vim.cmd("highlight Visual guibg=#2f383b")
end

return M
