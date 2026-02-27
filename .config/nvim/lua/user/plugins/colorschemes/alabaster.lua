local config = require("user.config")
local utils = require("user.utils")
local themer = require("user.themer")

local colorscheme = "alabaster"

local M = {
	"p00f/alabaster.nvim",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.config = function()
	if config.colorscheme ~= "alabaster" then
		return false
	end
	vim.cmd.colorscheme("alabaster")
end

return M
