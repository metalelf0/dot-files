local M = {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = false,
	ft = "markdown",
	cmd = { "ObsidianOpen", "ObsidianToday", "ObsidianYesterday", "ObsidianSearch", "ObsidianNew" },
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
}

M.config = function()
	require("obsidian").setup({
		workspaces = {
			{
				name = "Andrea",
				path = "/Users/andreaschiavini/Library/Mobile Documents/iCloud~md~obsidian/Documents/Andrea",
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
	})

	M.set_keymaps()
end

M.set_keymaps = function()
	local keymap = vim.keymap.set

	keymap("n", "<leader>ob", "<cmd>ObsidianBacklinks<cr>", { desc = "Obsidian - backlinks" })
	keymap("n", "<leader>oh", function()
		require("user.plugins.telescope.custom_pickers").pick_hashtags()
	end, { desc = "Obsidian - pick hashtag" })
	keymap("n", "<leader>of", "<cmd>ObsidianFollowLink<cr>", { desc = "Obsidian - follow link" })
	keymap("n", "<leader>on", "<cmd>ObsidianNew<cr>", { desc = "Obsidian - new" })
	keymap("n", "<leader>oo", "<cmd>ObsidianQuickSwitch<cr>", { desc = "Obsidian - quick switch" })
	keymap("n", "<leader>os", "<cmd>ObsidianSearch<cr>", { desc = "Obsidian - search" })
	keymap("n", "<leader>ot", "<cmd>ObsidianToday<cr>", { desc = "Obsidian - today" })
	keymap("n", "<leader>oy", "<cmd>ObsidianYesterday<cr>", { desc = "Obsidian - yesterday" })
	keymap("v", "<leader>oL", "<cmd>ObsidianLinkNew<cr>", { desc = "Obsidian - new link" })
	keymap("v", "<leader>ol", "<cmd>ObsidianLink<cr>", { desc = "Obsidian - link" })
end

return M
