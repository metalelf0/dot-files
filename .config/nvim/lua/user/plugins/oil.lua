return {
	"stevearc/oil.nvim",
	lazy = true,
	config = function()
		require("oil").setup({
			columns = {
				-- "icon"
			},
		})
	end,
}