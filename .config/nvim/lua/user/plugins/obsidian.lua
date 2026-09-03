local config = require("user.config")
local tasks = require("user.obsidian.tasks")
local task_dates_conceal = require("user.obsidian.task_dates_conceal")
local task_dates_highlight = require("user.obsidian.task_dates_highlight")

-- Set up the comment-style highlight for task dates on plugin load.
task_dates_highlight.setup()

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

local function list_tasks_done_on(date)
	require("snacks").picker.grep({
		cwd = config.obsidian_workspace_path,
		search = "\\[x\\] #task.*✅ " .. date,
		exclude = { "templates" },
	})
end

local M = {
	"obsidian-nvim/obsidian.nvim",
	version = "*",
	ft = "markdown",
	cmd = { "Obsidian" },
	dev = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"ibhagwan/fzf-lua",
	},
	opts = {
		legacy_commands = false,
		notes_subdir = "--- Inbox",
		note_id_func = function(title)
			-- return require("obsidian.builtin").title_id(title)
			return title
		end,
		cache = {
			enabled = true,
		},
		workspaces = {
			{
				name = "Andrea",
				path = config.obsidian_workspace_path,
			},
		},
		completion = {
			min_chars = 0,
		},
		daily_notes = {
			folder = "work/dailies",
		},
		templates = {
			folder = "templates/defaults/neovim",
			date_format = "%Y-%m-%d",
			substitutions = {
				yesterday = function()
					local t = os.time() - 86400 -- Start from yesterday
					local day_of_week = os.date("%w", t)
					while day_of_week == "0" or day_of_week == "6" do
						t = t - 86400
						day_of_week = os.date("%w", t)
					end
					return os.date("%Y-%m-%d", t)
				end,
				tomorrow = function()
					local t = os.time() + 86400 -- Start from tomorrow
					local day_of_week = os.date("%w", t)
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
			name = "telescope.nvim",
			note_mappings = {
				new = "<C-x>",
				insert_link = "<C-l>",
			},
		},
	},
	keys = {
		{ "<leader>ob", "<cmd>Obsidian backlinks<cr>", "n", desc = "Obsidian - backlinks" },
		{ "<leader>oF", "<cmd>Obsidian follow_link<cr>", "n", desc = "Obsidian - follow link" },
		{ "<leader>on", "<cmd>Obsidian new<cr>", "n", desc = "Obsidian - new" },
		{ "<leader>oo", "<cmd>Obsidian quick_switch<cr>", "n", desc = "Obsidian - quick switch" },
		{ "<leader>os", "<cmd>Obsidian search<cr>", "n", desc = "Obsidian - search" },
		-- od -> obsidian daily
		{ "<leader>odd", "<cmd>Obsidian dailies<cr>", "n", desc = "Obsidian - dailies" },
		{ "<leader>odt", "<cmd>Obsidian today<cr>", "n", desc = "Obsidian - today" },
		{ "<leader>odw", "<cmd>Obsidian tomorrow<cr>", "n", desc = "Obsidian - tomorrow" },
		{ "<leader>ody", "<cmd>Obsidian yesterday<cr>", "n", desc = "Obsidian - yesterday" },
		{ "<leader>oT", "<cmd>Obsidian template<cr>", "n", desc = "Obsidian - template" },
		{ "<leader>oL", "<cmd>Obsidian link_new<cr>", mode = "v", desc = "Obsidian - new link" },
		{ "<leader>ol", "<cmd>Obsidian link<cr>", mode = "v", desc = "Obsidian - link" },
		{ "<leader>ofi", "<cmd>Obsidian incoming_links<cr>", mode = "n", desc = "Obsidian - find incoming links" },
		{ "<leader>ofo", "<cmd>Obsidian outgoing_links<cr>", mode = "n", desc = "Obsidian - find outgoing links" },
		-- ot -> obsidian tasks
		{
			"<leader>otc",
			function()
				tasks.mark_task_canceled()
			end,
			"n",
			desc = "Obsidian - mark task as canceled",
		},
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
			"<leader>ote",
			function()
				tasks.edit_task_date()
			end,
			"n",
			desc = "Obsidian - Edit task dates",
		},
		{
			"<leader>otn",
			function()
				tasks.create_task()
			end,
			"n",
			desc = "Obsidian - new task",
		},
		{
			"<leader>oth",
			function()
				task_dates_conceal.toggle()
			end,
			"n",
			desc = "Obsidian - toggle task date concealment",
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
		{
			"<leader>otld", -- obsidian tasks list todo
			function()
				list_tasks_done_on(os.date("%Y-%m-%d", os.time()))
			end,
			"n",
			desc = "Done",
		},
	},
}

return M
