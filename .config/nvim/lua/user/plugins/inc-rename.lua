return {
	"smjonas/inc-rename.nvim",
	event = "VeryLazy",
	config = function()
		require("inc_rename").setup()
	end,
}
