local config = require("user.config")

local M = {
	"ribru17/bamboo.nvim",
	lazy = false,
	priority = 1000,
}

M.colorscheme = "bamboo"
M.config = function()
	if config.colorscheme ~= "bamboo" then
		return false
	end

	require("bamboo").setup({})
	require("bamboo").load()
end

return M
