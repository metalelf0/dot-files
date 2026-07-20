local config = require("user.config")
local themer = require("user.themer")

local colorscheme = "guts"

local M = {
	"vossenwout/guts.nvim",
	version = "*",
	-- dev = true,
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.config = function()
	if config.colorscheme ~= "guts" then
		return false
	end

	vim.cmd.colorscheme("guts")
end

return M
