return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			bufdelete = { enabled = false },
			dashboard = {
				enabled = true,
				preset = {
					keys = {
						{
							icon = " ",
							key = "f",
							desc = "find file",
							action = ":lua Snacks.dashboard.pick('files')",
						},
						{ icon = " ", key = "n", desc = "new file", action = ":ene | startinsert" },
						{
							icon = " ",
							key = "g",
							desc = "find text",
							action = ":lua Snacks.dashboard.pick('live_grep')",
						},
						{
							icon = " ",
							key = "r",
							desc = "recent files",
							action = ":lua Snacks.dashboard.pick('oldfiles')",
						},
						{
							icon = " ",
							key = "c",
							desc = "config",
							action = function()
								require("snacks").picker.files({
									cwd = vim.fn.stdpath("config"),
									pattern = "config.lua",
								})
							end,
						},
						{ icon = " ", key = "s", desc = "restore session", section = "session" },
						{
							icon = "󰒲 ",
							key = "l",
							desc = "lazy",
							action = ":lazy",
							enabled = package.loaded.lazy ~= nil,
						},
						{ icon = " ", key = "q", desc = "quit", action = ":qa" },
					},
				},
			},
			image = {
				doc = {
					conceal = true,
				},
			},
			lazygit = {},
			quickfile = { enabled = false },
			picker = {
				formatters = {
					file = {
						truncate = 120,
					},
				},
			},
			rename = { enabled = false },
			scratch = {},
			statuscolumn = { enabled = false },
			terminal = {
				enabled = true,
				win = {
					position = "float",
					border = "single",
				},
			},
			toggle = {
				enabled = true,
				which_key = true,
				notify = true,
			},
			words = {
				enabled = false,
				debounce = 200,
				notify_jump = false,
				notify_end = true,
				foldopen = true,
				jumplist = true,
				modes = { "n" },
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
