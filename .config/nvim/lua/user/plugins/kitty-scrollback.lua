return {
	"mikesmithgh/kitty-scrollback.nvim",
	enabled = true,
	lazy = true,
	cmd = { "KittyScrollbackGenerateKittens", "KittyScrollbackCheckHealth" },
	config = function()
		require("kitty-scrollback").setup()
	end,
}
