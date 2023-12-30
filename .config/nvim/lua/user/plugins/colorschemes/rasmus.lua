local config = require("user.config")
local utils = require("user.utils")
local themer = require("user.themer")

local colorscheme = "rasmus"

local M = {
	"kvrohit/rasmus.nvim",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.config = function()
	if config.colorscheme ~= "rasmus" then
		return false
	end

	vim.cmd([[colorscheme rasmus]])
end

return M
