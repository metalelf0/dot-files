local config = require("user.config")

local M = {
	"folke/which-key.nvim",
	event = "VeryLazy",
	enabled = (config.keymapper == "which-key"),
	opts = {
		preset = "helix",
		-- win = {
		-- 	width = math.huge,
		-- 	height = { min = 4, max = 25 },
		-- 	col = 4,
		-- 	no_overlap = false,
		-- },
	},
}

return M
