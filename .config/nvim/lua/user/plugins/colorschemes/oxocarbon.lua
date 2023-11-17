local config = require("user.config")
local utils = require("user.utils")
local themer = require("user.themer")

local colorscheme = "oxocarbon"

local M = {
	"nyoom-engineering/oxocarbon.nvim",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.config = function()
	if config.colorscheme ~= "oxocarbon" then
		return false
	end

	local setup = [[
    colorscheme oxocarbon
	 ]]

	vim.cmd(setup)
end

return M
