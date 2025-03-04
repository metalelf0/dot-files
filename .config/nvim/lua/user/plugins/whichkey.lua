local config = require("user.config")

local M = {
	"folke/which-key.nvim",
	event = "VeryLazy",
	enabled = (config.keymapper == "which-key"),
	opts = {
		preset = "helix",
	},
}

return M
