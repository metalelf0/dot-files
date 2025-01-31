local config = require("user.config")
local utils = require("user.utils")
local themer = require("user.themer")

local colorscheme = "quietlight"

local M = {
	"HUAHUAI23/nvim-quietlight",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.config = function()
	if config.colorscheme ~= "quietlight" then
		return false
	end

	vim.cmd([[colorscheme quietlight]])
end

return M
