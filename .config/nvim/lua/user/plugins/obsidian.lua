local config = require("user.config")

local function mark_task_done()
	local date = os.date("%Y-%m-%d")
	local line_number = vim.fn.line(".")
	local line = vim.fn.getline(line_number)

	if line:match("%- %[ %] #task") then
		local new_line = line:gsub("%- %[ %] #task", "- [x] #task") .. " ✅ " .. date
		vim.fn.setline(line_number, new_line)
	else
		print("No task to mark as done on this line.")
	end
end

local M = {
	"epwalsh/obsidian.nvim",
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
		-- dir = "~/iCloud-Obsidian",
		daily_notes = {
			folder = "work/dailies",
		},
		completion = {
			nvim_cmp = true,
			min_chars = 2,
		},
		templates = {
			subdir = "templates",
		},
		ui = {
			enable = false,
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
		{ "<leader>ot", "<cmd>ObsidianToday<cr>", "n", desc = "Obsidian - today" },
		{ "<leader>oT", "<cmd>ObsidianTemplate<cr>", "n", desc = "Obsidian - template" },
		{ "<leader>oy", "<cmd>ObsidianYesterday<cr>", "n", desc = "Obsidian - yesterday" },
		{ "<leader>oL", "<cmd>ObsidianLinkNew<cr>", "v", desc = "Obsidian - new link" },
		{ "<leader>ol", "<cmd>ObsidianLink<cr>", "v", desc = "Obsidian - link" },
		{
			"<leader>otd",
			function()
				mark_task_done()
			end,
			"n",
			desc = "Obsidian - mark task as done",
		},
	},
}

return M
