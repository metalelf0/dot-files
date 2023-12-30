return {
	"lukas-reineke/headlines.nvim",
	ft = { "norg", "org", "markdown" },
	config = function()
		require("headlines").setup({
			markdown = {
				fat_headlines = false,
			},
		})
	end,
}
