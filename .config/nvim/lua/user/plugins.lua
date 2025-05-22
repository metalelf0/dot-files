local config = require("user.config")

return {
	"nvim-lua/popup.nvim",
	"junegunn/fzf",
	"metalelf0/vim-rails",
	"tpope/vim-abolish",
	"tpope/vim-rsi",
	"tpope/vim-rhubarb", -- rhubarb enables C-x C-o to omnicomplete github stuff!
	"tpope/vim-repeat",
	"tpope/vim-unimpaired",
	"tpope/vim-eunuch",
	"tpope/vim-endwise",
	"williamboman/mason-lspconfig.nvim",
	"tjdevries/colorbuddy.nvim",
	"metalelf0/nvim-colorscheme-convert",

	require("user.plugins.colorschemes"),
	{
		"metalelf0/treesitter-renamer.nvim",
		dependencies = {
			"tpope/vim-eunuch",
		},
		opts = {
			bindings = {
				rename_file = "<leader>rr",
			},
		},
	},
	{
		"metalelf0/supermover.nvim",
		event = "VeryLazy",
		branch = "feat/add-snacks-picker",
		dependencies = {
			"tpope/vim-eunuch",
			"nvim-telescope/telescope.nvim",
		},
		opts = {
			bindings = {
				move_file = "<leader>fm",
			},
			picker = "snacks",
		},
	},
	{
		"metalelf0/git-utils.nvim",
		event = "VeryLazy",
		config = function()
			require("git-utils").setup()
		end,
	},
}
