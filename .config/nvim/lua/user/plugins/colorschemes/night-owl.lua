local config = require("user.config")
local utils = require("user.utils")
local themer = require("user.themer")

local colorscheme = "night-owl"

return {
	"oxfist/night-owl.nvim",
	lazy = themer.lazy_load(colorscheme),
	keys = themer.keys(colorscheme),
	config = function()
		if config.colorscheme ~= "night-owl" then
			return false
		end
		-- load the colorscheme here
		require("night-owl").setup()
		vim.cmd.colorscheme("night-owl")
	end,
}
