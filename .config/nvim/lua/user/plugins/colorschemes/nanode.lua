local config = require("user.config")
local themer = require("user.themer")

local colorscheme = "nanode"

local M = {
	"KijitoraFinch/nanode.nvim",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.config = function()
	if config.colorscheme ~= "nanode" then
		return false
	end

	require("nanode").setup({
		transparent = config.transparent,
	})
end

return M
