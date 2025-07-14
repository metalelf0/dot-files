local config = require("user.config")
local tasks = require("user.obsidian.tasks")

local function list_todo_tasks()
	require("snacks").picker.grep({
		cwd = config.obsidian_workspace_path,
		search = "\\[ \\] #task",
		exclude = { "templates" },
	})
end

local function list_in_progress_tasks()
	require("snacks").picker.grep({
		cwd = config.obsidian_workspace_path,
		search = "\\[/\\] #task",
		exclude = { "templates" },
	})
end

local M = {
	"obsidian-nvim/obsidian.nvim",
	version = "*",
	ft = "markdown",
	cmd = { "ObsidianOpen", "ObsidianToday", "ObsidianYesterday", "ObsidianSearch", "ObsidianNew" },
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "Andrea",
				path = config.obsidian_workspace_path,
			},
		},
		completion = {
			nvim_cmp = (config.completion_engine == "nvim-cmp"),
			blink = (config.completion_engine == "blink-cmp"),
			min_chars = 2,
		},
		daily_notes = {
			folder = "work/dailies",
		},
		templates = {
			subdir = "templates",
			date_format = "%Y-%m-%d",
			substitutions = {
				yesterday = function()
					local t = os.time() - 86400 -- Start from yesterday
					local day_of_week = os.date("%w", t)
					-- %w: Sunday = 0, Monday = 1, ..., Saturday = 6
					while day_of_week == "0" or day_of_week == "6" do
						t = t - 86400
						day_of_week = os.date("%w", t)
					end
					return os.date("%Y-%m-%d", t)
				end,
				tomorrow = function()
					local t = os.time() + 86400 -- Start from tomorrow
					local day_of_week = os.date("%w", t)
					-- %w: Sunday = 0, Monday = 1, ..., Saturday = 6
					while day_of_week == "0" or day_of_week == "6" do
						t = t + 86400
						day_of_week = os.date("%w", t)
					end
					return os.date("%Y-%m-%d", t)
				end,
			},
		},
		ui = {
			enable = false,
		},
		picker = {
			name = "snacks.pick",
		},
		-- Optional, key mappings.
		mappings = {
			-- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
			["gf"] = {
				action = function()
					return require("obsidian").util.gf_passthrough()
				end,
				opts = { noremap = false, expr = true, buffer = true },
			},
		},
		follow_url_func = function(url)
			vim.fn.jobstart({ "open", url }) -- Mac OS
		end,
	},
	keys = {
		{ "<leader>ob", "<cmd>ObsidianBacklinks<cr>", "n", desc = "Obsidian - backlinks" },
		{ "<leader>of", "<cmd>ObsidianFollowLink<cr>", "n", desc = "Obsidian - follow link" },
		{ "<leader>on", "<cmd>ObsidianNew<cr>", "n", desc = "Obsidian - new" },
		{ "<leader>oo", "<cmd>ObsidianQuickSwitch<cr>", "n", desc = "Obsidian - quick switch" },
		{ "<leader>os", "<cmd>ObsidianSearch<cr>", "n", desc = "Obsidian - search" },
		-- od -> obsidian daily
		{ "<leader>odt", "<cmd>ObsidianToday<cr>", "n", desc = "Obsidian - today" },
		{ "<leader>ody", "<cmd>ObsidianYesterday<cr>", "n", desc = "Obsidian - yesterday" },
		{ "<leader>oT", "<cmd>ObsidianTemplate<cr>", "n", desc = "Obsidian - template" },
		{ "<leader>oL", "<cmd>ObsidianLinkNew<cr>", "v", desc = "Obsidian - new link" },
		{ "<leader>ol", "<cmd>ObsidianLink<cr>", "v", desc = "Obsidian - link" },
		-- ot -> obsidian tasks
		{
			"<leader>otd",
			function()
				tasks.mark_task_done()
			end,
			"n",
			desc = "Obsidian - mark task as done",
		},
		{
			"<leader>oti",
			function()
				tasks.mark_task_in_progress()
			end,
			"n",
			desc = "Obsidian - mark task as in progress",
		},
		{
			"<leader>ott",
			function()
				tasks.mark_task_todo()
			end,
			"n",
			desc = "Obsidian - mark task as todo",
		},
		{
			"<leader>otli", -- obsidian tasks list todo
			function()
				list_in_progress_tasks()
			end,
			"n",
			desc = "In progress",
		},
		{
			"<leader>otlt", -- obsidian tasks list todo
			function()
				list_todo_tasks()
			end,
			"n",
			desc = "Todo",
		},
	},
}

return M
