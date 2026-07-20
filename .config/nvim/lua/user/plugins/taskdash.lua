local config = require("user.config")

return {
	"metalelf0/taskdash.nvim",
	dev = true,
	name = "taskdash.nvim",
	opts = {
		vault_dir = config.obsidian_workspace_path,
		excluded_words = { "Check daily note", "Review pending tasks", "Read yesterday daily" },
		excluded_paths = { "Academy" },
	},
	cmd = {
		"Taskdash",
		"TaskdashFloat",
		"TaskdashDebug",
		"TaskdashSetup",
	},
	keys = {
		{
			"<leader>T",
			function()
				require("taskdash").dashboard({ mode = "float" })
			end,
			desc = "Taskdash: Toggle dashboard (float)",
		},

		-- Global: open dashboard
		{
			"<leader>otD",
			function()
				require("taskdash").dashboard()
			end,
			desc = "Taskdash: Toggle dashboard",
		},

		-- Dashboard-local (ft = taskdash)
		{
			"<CR>",
			function()
				require("taskdash").open_at_cursor()
			end,
			desc = "Taskdash: Open task",
			ft = "taskdash",
		},
		{
			"q",
			function()
				require("taskdash").quit_dashboard()
			end,
			desc = "Taskdash: Quit",
			ft = "taskdash",
		},
		{
			"?",
			function()
				require("taskdash").show_help()
			end,
			desc = "Taskdash: Help",
			ft = "taskdash",
		},
		{
			"gr",
			function()
				require("taskdash").reload_dashboard()
			end,
			desc = "Taskdash: Reload",
			ft = "taskdash",
		},
		{
			"R",
			function()
				require("taskdash").reload_dashboard()
			end,
			desc = "Taskdash: Reload",
			ft = "taskdash",
		},

		{
			"<Tab>",
			function()
				require("taskdash").toggle_group()
			end,
			desc = "Taskdash: Toggle group",
			ft = "taskdash",
		},
		{
			"tw",
			function()
				require("taskdash").toggle_filter_words()
			end,
			desc = "Taskdash: Toggle word filter",
			ft = "taskdash",
		},
		{
			"tp",
			function()
				require("taskdash").toggle_filter_paths()
			end,
			desc = "Taskdash: Toggle path filter",
			ft = "taskdash",
		},

		{
			"gd",
			function()
				require("taskdash").mark_done_at_cursor()
			end,
			desc = "Taskdash: Mark Done",
			ft = "taskdash",
		},
		{
			"gs",
			function()
				require("taskdash").mark_started_at_cursor()
			end,
			desc = "Taskdash: Mark Started",
			ft = "taskdash",
		},
		{
			"gx",
			function()
				require("taskdash").mark_canceled_at_cursor()
			end,
			desc = "Taskdash: Mark Canceled",
			ft = "taskdash",
		},

		{
			"sd",
			function()
				require("taskdash").set_due_date_at_cursor()
			end,
			desc = "Taskdash: Set due date (📅)",
			ft = "taskdash",
		},
		{
			"ss",
			function()
				require("taskdash").set_start_date_at_cursor()
			end,
			desc = "Taskdash: Set start date (🛫)",
			ft = "taskdash",
		},
		{
			"sc",
			function()
				require("taskdash").set_cancel_date_at_cursor()
			end,
			desc = "Taskdash: Set cancellation (❌)",
			ft = "taskdash",
		},
		{
			"sx",
			function()
				require("taskdash").set_done_date_at_cursor()
			end,
			desc = "Taskdash: Set completion (✅)",
			ft = "taskdash",
		},

		-- Markdown-local (ft = markdown)
		{
			"<leader>md",
			function()
				require("taskdash").md_set_due_date()
			end,
			desc = "Taskdash: Set due date (📅)",
			ft = "markdown",
		},
		{
			"<leader>ms",
			function()
				require("taskdash").md_set_start_date()
			end,
			desc = "Taskdash: Set start date (🛫)",
			ft = "markdown",
		},
		{
			"<leader>mc",
			function()
				require("taskdash").md_set_cancel_date()
			end,
			desc = "Taskdash: Set cancellation (❌)",
			ft = "markdown",
		},
		{
			"<leader>mx",
			function()
				require("taskdash").md_set_done_date()
			end,
			desc = "Taskdash: Set completion (✅)",
			ft = "markdown",
		},
	},
}
