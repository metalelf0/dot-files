return {
	"pwntester/octo.nvim",
	event = "VeryLazy",
	config = function()
		require("octo").setup()
	end,
}
