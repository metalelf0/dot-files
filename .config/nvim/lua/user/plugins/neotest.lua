local M = {
	"rcarriga/neotest",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		-- "antoinemadec/FixCursorHold.nvim",
		"rcarriga/neotest-python",
		"rcarriga/neotest-plenary",
		"rcarriga/neotest-vim-test",
		"vim-test/vim-test",
	},
}

M.config = function()
	require("neotest").setup({
		adapters = {
			require("neotest-python")({
				dap = { justMyCode = false },
			}),
			require("neotest-plenary"),
			require("neotest-vim-test")({
				ignore_file_types = { "python", "vim", "lua" },
			}),
		},
	})
end

return M
