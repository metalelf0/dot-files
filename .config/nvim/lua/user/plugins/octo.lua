return {
	"pwntester/octo.nvim",
	event = "VeryLazy",
	config = function()
		require("octo").setup({
			ssh_aliases = {
				work = "github.com",
				personal = "github.com",
			},
			suppress_missing_scope = {
				projects_v2 = true,
			},
		})
	end,
}
