local config = require("user.config")
local utils = require("user.utils")

local M = {
	"nyoom-engineering/oxocarbon.nvim",
	lazy = false,
	priority = 1000,
}

M.colorscheme = "oxocarbon"
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
