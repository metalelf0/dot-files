local config = require("user.config")
local themer = require("user.themer")

local colorscheme = "monokai-pro"

local M = {
	"loctvl842/monokai-pro.nvim",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

function M.config()
	if config.colorscheme ~= "monokai-pro" then
		return false
	end

	require("monokai-pro").setup()
	vim.cmd("colorscheme monokai-pro")
end

return M
