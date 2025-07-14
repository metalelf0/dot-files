local config = require("user.config")

local M = {
	"WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",
	enabled = false,
	event = "BufReadPre",
	config = function()
		require("toggle_lsp_diagnostics").init({
			underline = false,
			start_on = config.startup.show_diagnostics,
			virtual_text = { prefix = "●", spacing = 4 },
		})
	end,
}

return M
