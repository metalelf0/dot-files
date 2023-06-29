local config = require("user.config")

local M = {
	"neanias/everforest-nvim",
	lazy = false,
	priority = 1000,
}

function M.config()
	if config.colorscheme ~= "everforest" then
		return false
	end

	require("everforest").setup({
		transparent_background_level = 0,
	})

	vim.cmd("colorscheme " .. config.colorscheme)
	vim.api.nvim_command("hi clear GitSignsCurrentLineBlame")
	vim.api.nvim_command("hi link GitSignsCurrentLineBlame NonText")
end

return M
