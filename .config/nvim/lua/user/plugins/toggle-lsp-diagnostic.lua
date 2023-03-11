local M = {
	"WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",
	event = "BufReadPost",
	config = function()
		require("toggle_lsp_diagnostics").init({
			underline = false,
			start_on = false,
			virtual_text = { prefix = "●", spacing = 4 },
		})
	end,
}

return M
