local M = {
	"epwalsh/obsidian.nvim",
	-- cmd = { "ObsidianOpen", "ObsidianToday", "ObsidianYesterday", "ObsidianSearch", "ObsidianNew" },
}

M.config = function()
	require("obsidian").setup({
		dir = "~/iCloud-Obsidian",
		daily_notes = {
			folder = "work/dailies",
		},
		completion = {
			nvim_cmp = true,
		},
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
