local config = require("user.config")
local themer = require("user.themer")

local colorscheme = "oh-lucy"

local M = {
	"Yazeed1s/oh-lucy.nvim",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.config = function()
	if config.colorscheme ~= "oh-lucy" then
		return false
	end
	vim.cmd.colorscheme("oh-lucy")
end

return M
