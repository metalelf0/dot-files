return {
	"OXY2DEV/markview.nvim",
	enabled = true,
	ft = { "markdown" },
	dependencies = {
		"nvim-tree/nvim-web-devicons", -- Used by the code bloxks
	},

	config = function()
		require("markview").setup()

		vim.cmd("highlight link code_block TelescopeNormal")
	end,
}
