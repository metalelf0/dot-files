return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			bigfile = {
				enabled = true,
				size = 0.6 * 1024 * 1024, -- 600 kb
				setup = function(ctx)
					if vim.fn.exists(":NoMatchParen") ~= 0 then
						vim.cmd([[NoMatchParen]])
					end
					Snacks.util.wo(0, { foldmethod = "manual", statuscolumn = "", conceallevel = 0 })
					vim.b.minianimate_disable = true
					if ctx.ft == "sql" then
						vim.cmd([[TSBufDisable highlight]])
					end
					vim.schedule(function()
						if vim.api.nvim_buf_is_valid(ctx.buf) then
							vim.bo[ctx.buf].syntax = ctx.ft
						end
					end)
				end,
			},
			bufdelete = { enabled = false },
			-- scroll = {},
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
						{ icon = " ", key = "s", desc = "Sestore session", section = "session" },
						{
							icon = "󰒲 ",
							key = "l",
							desc = "Lazy",
							action = ":Lazy",
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
			indent = {
				enabled = true,
				hl = {
					"SnacksIndent1",
					"SnacksIndent2",
					"SnacksIndent3",
					"SnacksIndent4",
					"SnacksIndent5",
					"SnacksIndent6",
					"SnacksIndent7",
					"SnacksIndent8",
				},
				scope = {
					hl = {
						"SnacksIndent1",
						"SnacksIndent2",
						"SnacksIndent3",
						"SnacksIndent4",
						"SnacksIndent5",
						"SnacksIndent6",
						"SnacksIndent7",
						"SnacksIndent8",
					},
				},
			},
			lazygit = {},
			picker = {
				formatters = {
					file = {
						truncate = 60,
					},
				},
				win = {
					input = {
						keys = {
							["<C-h>"] = { "history_back", mode = { "i", "n" } },
							["<C-l>"] = { "history_forward", mode = { "i", "n" } },
						},
					},
				},
			},
			quickfile = { enabled = false },
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
			zen = {},
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
