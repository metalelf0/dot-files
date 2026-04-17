local config = require("user.config")
local utils = require("user.utils")
local themer = require("user.themer")

local colorscheme = "cursor-light"

local M = {
	"vpoltora/cursor-light.nvim",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.config = function()
	if config.colorscheme ~= "cursor-light" then
		return false
	end
	require("cursor-light").setup({
		ui = true,
	})
	vim.cmd.colorscheme("cursor-light")
end

return M
