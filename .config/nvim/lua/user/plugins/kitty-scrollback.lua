return {
	"mikesmithgh/kitty-scrollback.nvim",
	enabled = false,
	lazy = true,
	cmd = { "KittyScrollbackGenerateKittens", "KittyScrollbackCheckHealth" },
	config = function()
		require("kitty-scrollback").setup()
	end,
}
