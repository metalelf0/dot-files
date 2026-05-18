return {
	"afewyards/codereview.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	cmd = { "CodeReview" },
	opts = {
		platform = "github",
		picker = "snacks",
		debug = true,
	},
}
