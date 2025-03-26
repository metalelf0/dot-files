local config = require("user.config")
local themer = require("user.themer")

local colorscheme = "jellybeans"

local M = {
	"WTFox/jellybeans.nvim",
	enabled = false,
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
	opts = {
		transparent = config.transparent,
	},
}

M.config = function()
	if config.colorscheme ~= "jellybeans" then
		return false
	end

	vim.cmd.colorscheme("jellybeans")
end

return M
