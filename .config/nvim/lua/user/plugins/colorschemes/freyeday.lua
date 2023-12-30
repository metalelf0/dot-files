local config = require("user.config")
local utils = require("user.utils")
local themer = require("user.themer")

local colorscheme = "freyeday"

local M = {
	"habamax/vim-freyeday",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

function M.config()
	if config.colorscheme ~= "freyeday" then
		return false
	end

	vim.cmd("colorscheme freyeday")
end

return M
