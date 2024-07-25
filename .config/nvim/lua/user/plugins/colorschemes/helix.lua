local config = require("user.config")
local themer = require("user.themer")

local colorscheme = "helix"

local M = {
	"oneslash/helix-nvim",
	version = "*",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.config = function()
	if config.colorscheme ~= "helix" then
		return false
	end

	vim.cmd("colorscheme " .. config.colorscheme)
end

return M
