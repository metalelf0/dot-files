return {
	"supermaven-inc/supermaven-nvim",
	config = function()
		require("supermaven-nvim").setup({})
	end,
	keys = {
		"<leader>As",
		"SupermavenToggle",
		desc = "Toggle Supermaven",
	},
}
