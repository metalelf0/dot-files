local config = require("user.config")
local themer = require("user.themer")

local colorscheme = "yorumi"

local M = {
	"yorumicolors/yorumi.nvim",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.config = function()
	if config.colorscheme ~= "yorumi" then
		return false
	end

	vim.cmd("colorscheme yorumi")
end

return M
