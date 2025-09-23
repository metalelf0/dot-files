local M = {
	"nvim-neotest/neotest",
	enabled = true,
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"antoinemadec/FixCursorHold.nvim",
		"rcarriga/neotest-python",
		"rcarriga/neotest-plenary",
		"rcarriga/neotest-vim-test",
		-- FIXME: replace this with olimorris/neotest-rspec once https://github.com/olimorris/neotest-rspec/pull/80 gets merged
		-- "jdurand/neotest-rspec",
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
			-- require("neotest-rspec")({
			-- 	formatter_path = "/app/dont_commit/neotest_formatter.rb",
			-- 	rspec_cmd = "bin/remote-test",
			-- 	transform_spec_path = function(path)
			-- 		-- return relative path to specs for docker support
			-- 		return vim.fn.fnamemodify(path, ":.")
			-- 	end,
			-- 	--       function()
			-- 	-- 	return vim.tbl_flatten({
			-- 	-- 		"source",
			-- 	-- 		".env.db",
			-- 	-- 		"&&",
			-- 	-- 		"bundle",
			-- 	-- 		"exec",
			-- 	-- 		"rspec",
			-- 	-- 	})
			-- 	-- end,
			-- }),
		},
	})
end

return M
