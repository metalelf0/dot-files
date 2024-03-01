return {
	"dlvhdr/gh-blame.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
	keys = {
		{ "<leader>gob", "<cmd>GhBlameCurrentLine<cr>", desc = "GitHub Blame Current Line" },
	},
}
