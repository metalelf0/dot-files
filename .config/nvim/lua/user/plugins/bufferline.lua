local M = {
	"akinsho/bufferline.nvim",
	event = "BufReadPre",
	keys = {
		{ "<leader>bp", "<cmd>BufferLineTogglePin<cr>", desc = "Toggle pin" },
	},
}

function M.config()
	local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

	signs = {
		error = signs.Error,
		warning = signs.Warn,
		info = signs.Info,
		hint = signs.Hint,
	}

	local bufferline = require("bufferline")

	bufferline.setup({
		options = {
			style_preset = bufferline.style_preset.minimal,
			themable = true,
			numbers = "none",
		},
	})
end

return M
