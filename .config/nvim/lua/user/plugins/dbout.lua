return {
	"zongben/dbout.nvim",
	build = "npm install",
	lazy = "VeryLazy",
	cmd = { "Dbout" },
	dev = true,
	config = function()
		require("dbout").setup({})
	end,
}
