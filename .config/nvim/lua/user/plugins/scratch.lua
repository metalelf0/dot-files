return {
	"LintaoAmons/scratch.nvim",
	cmd = { "Scratch", "ScratchWithName", "ScratchOpen", "ScratchOpenFzf" },
	dependencies = {
		{
			"michaelb/sniprun",
			build = "sh install.sh",
			config = function()
				require("sniprun").setup({
					display = { "Terminal" },
					display_options = {
						terminal_scrollback = vim.o.scrollback, -- change terminal display scrollback lines
						terminal_line_number = false, -- whether show line number in terminal window
						terminal_signcolumn = false, -- whether show signcolumn in terminal window
						terminal_position = "vertical", --# or "horizontal", to open as horizontal split instead of vertical split
						terminal_width = 45, --# change the terminal display option width (if vertical)
						terminal_height = 20, --# change the terminal display option height (if horizontal)
					},
				})
			end,
			keys = {
				{ "<leader>rs", "<cmd>%SnipRun<cr>", desc = "Run with sniprun" },
			},
		},
	},
	keys = {
		{ "<leader>Ss", "<cmd>Scratch<cr>", desc = "Scratch (new)" },
		{ "<leader>Sf", "<cmd>ScratchOpenFzf<cr>", desc = "Scratch (find)" },
		{ "<leader>So", "<cmd>ScratchOpen<cr>", desc = "Scratch (open)" },
		{ "<leader>SS", "<cmd>ScratchPad<cr>", desc = "Scratchpad" },
	},
	config = function()
		require("scratch").setup({
			filetypes = { "csx", "hush", "sh", "rb" }, -- filetypes to select from
		})
	end,
}
