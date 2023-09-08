local config = require("user.config")

local M = {
	"AlexvZyl/nordic.nvim",
	lazy = false,
	priority = 1000,
}

M.config = function()
	if config.colorscheme ~= "nordic" then
		return false
	end

	local palette = require("nordic.colors")

	require("nordic").setup({
		override = {
			["@symbol"] = {
				fg = palette.blue1,
			},
		},
	})

	vim.cmd("colorscheme nordic")
end

return M
