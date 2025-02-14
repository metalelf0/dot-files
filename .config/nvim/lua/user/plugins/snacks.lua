return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			statuscolumn = { enabled = false },
			quickfile = { enabled = false },
			rename = { enabled = false },
			bufdelete = { enabled = false },
			terminal = {
				enabled = true,
				win = {
					position = "float",
					border = "single",
				},
			},
			scratch = {},
			words = {
				enabled = false,
				debounce = 200,
				notify_jump = false,
				notify_end = true,
				foldopen = true,
				jumplist = true,
				modes = { "n" },
			},
			dashboard = {
				enabled = true,
			},
		},
		keys = {
			{
				"<leader>a",
				function()
					Snacks.dashboard()
				end,
				desc = "Dashboard",
			},
			{
				"<leader>lg",
				function()
					Snacks.lazygit()
				end,
				desc = "Lazygit",
			},
			{
				"<leader>gB",
				function()
					Snacks.gitbrowse()
				end,
				desc = "Git Browse",
			},
			{
				"<leader>gF",
				function()
					Snacks.lazygit.log_file()
				end,
				desc = "Lazygit Current File History",
			},
			{
				"]]",
				function()
					Snacks.words.jump(vim.v.count1)
				end,
				desc = "Next Reference",
			},
			{
				"[[",
				function()
					Snacks.words.jump(-vim.v.count1)
				end,
				desc = "Prev Reference",
			},
			{
				"<leader>s.",
				function()
					Snacks.scratch()
				end,
				desc = "Toggle Scratch Buffer",
			},
			{
				"<leader>sS",
				function()
					Snacks.scratch.select()
				end,
				desc = "Select Scratch Buffer",
			},
		},
	},
}
