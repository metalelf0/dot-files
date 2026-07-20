return {
	"tjgao/quickbuf.nvim",
	event = "VeryLazy",
	opts = {
		picker = {
			move_up_key = "<C-k>",
			move_down_key = "<C-j>",
		},
		highlights = {
			label = { link = "DiagnosticWarn", bold = true },
			pinned = { link = "DiagnosticOk" },
			flags = { link = "Comment" },
			alternate = { fg = "#ff8800", bold = true },
			filename = { link = "Normal" },
			path = { link = "Comment" },
			muted = { link = "Comment" },
			cursorline = { link = "Visual" },
		},
	},
	config = function()
		vim.keymap.set("n", "<Tab>", "<cmd>QuickBuf<CR>", { desc = "QuickBuf" })

		-- Clear the link by mapping <C-i> to itself
		-- Do this for Normal mode (fixes jump list navigation)
		vim.keymap.set("n", "<C-i>", "<C-i>", { noremap = true })

		-- Do this for Insert mode (if your plugin is a completion tool like blink.cmp or nvim-cmp)
		vim.keymap.set("i", "<C-i>", "<C-i>", { noremap = true })
	end,
}
