local config = require("user.config")

return {
	"nvim-lua/popup.nvim",
	"junegunn/fzf",
	"metalelf0/vim-rails",
	-- "mg979/vim-visual-multi",
	"tommcdo/vim-exchange", -- swap words with cxiw - cxiw
	"tpope/vim-abolish",
	"tpope/vim-rsi",
	"tpope/vim-rhubarb", -- rhubarb enables C-x C-o to omnicomplete github stuff!
	"tpope/vim-repeat",
	"tpope/vim-unimpaired",
	"tpope/vim-eunuch",
	"tpope/vim-endwise",
	"williamboman/mason-lspconfig.nvim",

	require("user.plugins.colorschemes"),

	{ "tpope/vim-dadbod", cmd = { "DB" } },
	{
		"smjonas/inc-rename.nvim",
		config = function()
			require("inc_rename").setup()
		end,
	},
	"michaeljsmith/vim-indent-object",
	{
		"ckolkey/ts-node-action",
		dependencies = { "nvim-treesitter" },
		config = function() -- Optional
			require("ts-node-action").setup({})
		end,
	},

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
