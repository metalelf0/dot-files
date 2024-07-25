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

	require("user.plugins.colorschemes"),

	{ dir = "~/Documents/codice_elf0/nvim-colorscheme-convert" },
	-- {
	-- 	config = function()
	-- 		require("treesitter-renamer").config()
	-- 	end,
	-- },
	{
		dir = "~/Documents/codice_elf0/treesitter-renamer",
		-- "metalelf0/treesitter-renamer.nvim",
		dependencies = {
			"tpope/vim-eunuch",
		},
		opts = {
			bindings = {
				rename_file = "<leader>rr",
			},
		},

		-- config = function()
		-- 	require("treesitter-renamer").config()
		-- end,
	},
	{
		dir = "~/Documents/codice_elf0/supermover.nvim",
		event = "VeryLazy",
		-- "metalelf0/treesitter-renamer.nvim",
		dependencies = {
			"tpope/vim-eunuch",
			"nvim-telescope/telescope.nvim",
		},
		opts = {
			bindings = {
				move_file = "<leader>fm",
			},
		},

		-- config = function()
		-- 	require("treesitter-renamer").config()
		-- end,
	},
}
