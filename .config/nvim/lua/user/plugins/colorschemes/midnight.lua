local config = require("user.config")
local themer = require("user.themer")

local colorscheme = "midnight"

local M = {
	"dasupradyumna/midnight.nvim",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.config = function()
	if config.colorscheme ~= "midnight" then
		return false
	end
	vim.cmd("colorscheme midnight")
end

return M
