return {
	"jose-elias-alvarez/typescript.nvim",
	"kyazdani42/nvim-web-devicons",
	"nvim-lua/popup.nvim",
	"antoinemadec/FixCursorHold.nvim",
	"folke/trouble.nvim",
	"junegunn/fzf",
	"tpope/vim-rails",
	"slim-template/vim-slim",
	"junegunn/vim-easy-align",
	"mg979/vim-visual-multi",
	"norcalli/nvim-colorizer.lua",
	"tommcdo/vim-exchange",
	"stevearc/dressing.nvim",
	"tpope/vim-abolish",
	"tpope/vim-dadbod",
	"tpope/vim-rsi",
	"tpope/vim-fugitive",
	"tpope/vim-repeat",
	"tpope/vim-unimpaired",
	"tpope/vim-eunuch",
	"tpope/vim-endwise",
	"vim-test/vim-test",
	"williamboman/mason-lspconfig.nvim",

	-- colorschemes

	-- "EdenEast/nightfox.nvim",
	-- "Mofiqul/dracula.nvim",
	-- "NTBBloodbath/doom-one.nvim",
	-- "TheNiteCoder/mountaineer.vim",
	-- "bluz71/vim-moonfly-colors",
	-- "bluz71/vim-nightfly-guicolors",
	-- "cocopon/iceberg.vim",
	-- "folke/tokyonight.nvim",
	-- "glepnir/zephyr-nvim",
	-- "marko-cerovac/material.nvim",
	-- "projekt0n/github-nvim-theme",
	-- "rebelot/kanagawa.nvim",
	-- "rmehri01/onenord.nvim",
	-- "sainnhe/gruvbox-material",
	-- "ellisonleao/gruvbox.nvim",
	-- "sam4llis/nvim-tundra",
	-- { "catppuccin/nvim", name = "catppuccin" },
	-- { "mcchrish/zenbones.nvim", dependencies = { "rktjmp/lush.nvim" } },
	-- { "meliora-theme/neovim", dependencies = { "rktjmp/lush.nvim" }, name = "meliora" },
	-- { "rose-pine/neovim", name = "rose-pine" },
	-- "Yazeed1s/oh-lucy.nvim",
	-- "igorepst/hemisu.nvim",
	-- "metalelf0/jellybeans-nvim",
	-- "sainnhe/everforest",
	-- "nyoom-engineering/oxocarbon.nvim",
	-- "shaunsingh/moonlight.nvim",
	-- "shatur/neovim-ayu",
	"navarasu/onedark.nvim",

	-- end colorschemes
	{
		"SmiteshP/nvim-navic",
		config = function()
			vim.g.navic_silence = true
			require("nvim-navic").setup({ separator = " ", highlight = true, depth_limit = 5 })
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			{
				-- only needed if you want to use the commands with "_with_window_picker" suffix
				"s1n7ax/nvim-window-picker",
				config = function()
					require("window-picker").setup({
						autoselect_one = true,
						include_current = false,
						filter_rules = {
							-- filter using buffer options
							bo = {
								-- if the file type is one of following, the window will be ignored
								filetype = { "neo-tree", "neo-tree-popup", "notify", "quickfix" },

								-- if the buffer type is one of following, the window will be ignored
								buftype = { "terminal" },
							},
						},
						other_win_hl_color = "#e35e4f",
					})
				end,
			},
		},
	},
	{
		"andymass/vim-matchup",
		event = "BufReadPost",
		config = function()
			vim.g.matchup_matchparen_offscreen = { method = "status_manual" }
		end,
	},
	{
		"lukas-reineke/headlines.nvim",
		ft = { "norg", "org", "markdown" },
		config = function()
			require("headlines").setup()
		end,
	},
	{
		"nvim-pack/nvim-spectre",
		config = function()
			require("spectre").setup()
		end,
	},
	{
		"danymat/neogen",
		config = function()
			require("neogen").setup({ enabled = true })
		end,
	},
	"michaeljsmith/vim-indent-object",
	{
		"folke/zen-mode.nvim",
		cmd = "ZenMode",
		config = function()
			require("zen-mode").setup({
				plugins = {
					gitsigns = true,
				},
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	-- { "ldelossa/gh.nvim", dependencies = { "ldelossa/litee.nvim" } },
	{
		"eandrju/cellular-automaton.nvim",
		cmd = { "CellularAutomaton" },
	},
}

--[[ require("user.plugin-confs.legend").setup() ]]
