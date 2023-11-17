local config = require("user.config")
local themer = require("user.themer")

local M = {
	"theJian/nvim-moonwalk",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

function M.config()
	if config.colorscheme ~= "nano-theme" then
		return false
	end

	vim.cmd("colorscheme " .. config.colorscheme)
end

return M
