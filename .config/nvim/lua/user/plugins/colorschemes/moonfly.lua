local config = require("user.config")
local themer = require("user.themer")

local colorscheme = "moonfly"

local M = {
	"bluz71/vim-moonfly-colors",
	init = function()
		-- vim.o.background = "light" -- or "dark".
	end,
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

function M.config()
	if config.colorscheme ~= "moonfly" then
		return false
	end

	vim.cmd("colorscheme " .. config.colorscheme)
end

return M
