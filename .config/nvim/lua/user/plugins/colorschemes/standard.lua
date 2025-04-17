local config = require("user.config")
local themer = require("user.themer")

local colorscheme = "standard"

local M = {
	"fnune/standard",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.config = function()
	if config.colorscheme ~= "standard" then
		return false
	end

	require("standard").setup()
	vim.cmd("colorscheme standard")
end

return M
