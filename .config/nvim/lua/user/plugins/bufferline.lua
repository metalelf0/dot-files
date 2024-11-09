local M = {
	"akinsho/bufferline.nvim",
	event = "BufReadPre",
	keys = {
		{ "<leader>bp", "<cmd>BufferLineTogglePin<cr>", desc = "Toggle pin" },
		{ "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
		{ "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
		{ "<leader>bh", "<cmd>BufferLineMovePrev<cr>", desc = "Move left" },
		{ "<leader>bl", "<cmd>BufferLineMoveNext<cr>", desc = "Move right" },
		{ "<leader>bk", "<cmd>BufferLinePickClose<cr>", desc = "Kill" },
		{ "<leader>bs", "<cmd>BufferLinePick<cr>", desc = "Seek" },
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
			numbers = "none",
			modified_icon = "●",
			show_close_icon = false,
			show_buffer_close_icons = false,
			show_buffer_icons = true,
			indicator = { "none" },
		},
	})
end

return M
