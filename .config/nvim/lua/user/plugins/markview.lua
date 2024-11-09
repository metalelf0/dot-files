return {
	"OXY2DEV/markview.nvim",
	enabled = true,
	ft = { "markdown" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons", -- Used by the code bloxks
	},

	config = function()
		require("markview").setup({
			headings = {
				shift_width = 0,
			},
			list_items = {
				shift_width = 2,
				marker_minus = {
					text = "⁃",
				},
				marker_plus = {
					text = "✦",
				},
				marker_star = {
					text = "☆",
				},
			},
		})

		vim.cmd("highlight link code_block TelescopeNormal")
	end,
}
