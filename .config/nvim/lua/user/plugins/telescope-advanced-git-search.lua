return {
	"aaronhallaert/advanced-git-search.nvim",
	event = "VeryLazy",
	config = function()
		require("telescope").load_extension("advanced_git_search")
	end,
	dependencies = {
		"nvim-telescope/telescope.nvim",
		-- to show diff splits and open commits in browser
		"tpope/vim-fugitive",
	},
}
