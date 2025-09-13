return {
	"supermaven-inc/supermaven-nvim",
	config = function()
		require("supermaven-nvim").setup({})
	end,
	keys = {
		{ "<leader>AS", "<cmd>SupermavenToggle<cr>", desc = "Toggle Supermaven" },
	},
}
