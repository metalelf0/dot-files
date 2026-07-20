local config = require("user.config")
local themer = require("user.themer")

local colorscheme = "nanode"

local M = {
	"xeind/nightingale.nvim",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.config = function()
	if config.colorscheme ~= "nightingale" then
		return false
	end

	require("nightingale").setup({
		transparent = config.transparent,
	})
	vim.cmd.colorscheme("nightingale")
end

return M
