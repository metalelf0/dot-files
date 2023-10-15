local config = require("user.config")

return {
	"jose-elias-alvarez/typescript.nvim",
	"nvim-tree/nvim-web-devicons",
	"nvim-lua/popup.nvim",
	"junegunn/fzf",
	"metalelf0/vim-rails",
	"mg979/vim-visual-multi",
	"tommcdo/vim-exchange",
	"tpope/vim-abolish",
	"tpope/vim-rsi",
	"tpope/vim-fugitive",
	-- rhubarb enables C-x C-o to omnicomplete github stuff!
	"tpope/vim-rhubarb",
	"tpope/vim-repeat",
	"tpope/vim-unimpaired",
	"tpope/vim-eunuch",
	"tpope/vim-endwise",
	"williamboman/mason-lspconfig.nvim",
	-- "aduros/ai.vim",
	-- "slim-template/vim-slim",

	require("user.plugins.colorschemes"),

	-- better diffing
	{
		"sindrets/diffview.nvim",
		cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
		config = true,
		keys = { { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "DiffView" } },
	},
	{ "tpope/vim-dadbod", cmd = { "DB" } },
	{
		"NvChad/nvim-colorizer.lua",
		cmd = { "ColorizerAttachToBuffer" },
		config = function()
			require("colorizer").setup({
				user_default_options = {
					mode = "background", -- can be "background", "foreground" or "virtualtext"
				},
			})
		end,
	},
	{
		"folke/trouble.nvim",
		cmd = { "TroubleToggle", "Trouble" },
		opts = {
			auto_open = false,
			use_diagnostic_signs = true,
		},
	},
	{
		"stevearc/dressing.nvim",
		init = function()
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.select = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.select(...)
			end
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.input = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.input(...)
			end
		end,
	},
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
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
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
			require("headlines").setup({
				markdown = {
					fat_headlines = false,
				},
			})
		end,
	},
	{
		"smjonas/inc-rename.nvim",
		config = function()
			require("inc_rename").setup()
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
	{
		"ckolkey/ts-node-action",
		dependencies = { "nvim-treesitter" },
		config = function() -- Optional
			require("ts-node-action").setup({})
		end,
	},
	-- { "ldelossa/gh.nvim", dependencies = { "ldelossa/litee.nvim" } },
	{
		"svermeulen/text-to-colorscheme",
		config = function()
			require("text-to-colorscheme").setup({
				ai = {
					openai_api_key = os.getenv("OPENAI_API_KEY"),
				},
			})
		end,
	},

	-- git signs
	{
		"lewis6991/gitsigns.nvim",
		enabled = vim.fn.executable("git") == 1,
		-- event = "BufReadPre",
		opts = {
			signs = {
				add = { text = "▌" },
				change = { text = "▌" },
				delete = { text = "契" },
				topdelete = { text = "契" },
				changedelete = { text = "▌" },
				untracked = { text = "▌" },
			},
			current_line_blame = config.startup.show_git_blame, -- Toggle with `:Gitsigns toggle_current_line_blame`
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
				delay = 100,
				ignore_whitespace = false,
			},
			on_attach = function(buffer)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, desc)
					vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
				end

        -- stylua: ignore start
        map("n", "]h", gs.next_hunk, "Next Hunk")
        map("n", "[h", gs.prev_hunk, "Prev Hunk")
        map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
        map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
        map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
        map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
        map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
        map("n", "<leader>ghp", gs.preview_hunk, "Preview Hunk")
        map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
        map("n", "<leader>ghd", gs.diffthis, "Diff This")
        map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
			end,
		},
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

--[[ require("user.plugin-confs.legend").setup() ]]
