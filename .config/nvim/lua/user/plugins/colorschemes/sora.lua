local config = require("user.config")
local themer = require("user.themer")

local colorscheme = "sora"

local M = {
	"Aejkatappaja/sora",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.config = function()
	if config.colorscheme ~= "sora" then
		return false
	end

	require("sora").setup()
	vim.cmd("colorscheme sora")
end

return M
