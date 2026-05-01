local config = require("user.config")
local utils = require("user.utils")
local themer = require("user.themer")

local colorscheme = "base46"

local M = {
	"AvengeMedia/base46",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.config = function()
	if config.colorscheme ~= "base46" then
		return false
	end

	vim.cmd.colorscheme("base46-gruvchad")
end

return M
