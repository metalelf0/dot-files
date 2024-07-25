return {
	"pwntester/octo.nvim",
	event = "VeryLazy",
	config = function()
		require("octo").setup({
			suppress_missing_scope = {
				projects_v2 = true,
			},
		})
	end,
}
