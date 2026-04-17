return {
	-- "sindrets/diffview.nvim", -- original, unmaintained repo
	"dlyongemallo/diffview.nvim",
	cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewFileHistory" },
	config = true,
	keys = { { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "DiffView" } },
}
