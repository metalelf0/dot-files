return {
	"lukas-reineke/headlines.nvim",
	ft = { "norg", "org", "markdown" },
	enabled = false,
	config = function()
		require("headlines").setup({
			markdown = {
				fat_headlines = true,
			},
		})
	end,
}
