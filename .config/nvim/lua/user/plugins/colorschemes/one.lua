local config = require("user.config")
local themer = require("user.themer")

local colorscheme = "one"

local M = {
	"disrupted/one.nvim",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.config = function()
	if config.colorscheme ~= "one" then
		return false
	end

	vim.cmd.colorscheme("one")
end

return M
