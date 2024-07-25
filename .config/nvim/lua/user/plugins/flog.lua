local M = {
	"rbong/vim-flog",
	lazy = true,
	cmd = { "Flog", "Flogsplit", "Floggit" },
	dependencies = {
		"tpope/vim-fugitive",
	},
	keys = {
		{ "<leader>gf", "<cmd>Flog<cr>", desc = "Flog" },
	},
}

return M
