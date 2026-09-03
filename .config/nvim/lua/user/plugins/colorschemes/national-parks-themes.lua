local config = require("user.config")
local themer = require("user.themer")

local colorscheme = "national-parks"

local M = {
	"pjhamera/national-parks-themes",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.config = function()
	require("parks").setup()
	vim.cmd.colorscheme("parks-zion")
end

return M
