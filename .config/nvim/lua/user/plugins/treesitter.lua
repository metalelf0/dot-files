return {
	{
		"nvim-treesitter/nvim-treesitter",
		version = false,
		build = ":TSUpdate",
		main = "nvim-treesitter.configs",
		-- event = { "LazyFile", "VeryLazy" },
		event = { "VeryLazy" },
		cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
		lazy = vim.fn.argc(-1) == 0, -- Load treesitter early when opening a file directly. i.e. calling `nvim file.txt` from the cmdline
		init = function(plugin)
			-- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
			-- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
			-- no longer trigger the **nvim-treesitter** module to be loaded in time.
			-- Luckily, the only things that those plugins need are the custom queries, which we make available
			-- during startup.
			require("lazy.core.loader").add_to_rtp(plugin)
			require("nvim-treesitter.query_predicates")
		end,
		keys = {
			{ "<c-space>", desc = "Increment Selection" },
			{ "<bs>", desc = "Decrement Selection", mode = "x" },
		},
		---@type TSConfig
		---@diagnostic disable-next-line: missing-fields
		opts = {
			highlight = { enable = true },
			ensure_installed = {
				"bash",
				"c",
				"cmake",
				"comment",
				"cpp",
				"css",
				"git_config",
				"gitcommit",
				"git_rebase",
				"gitignore",
				"gitattributes",
				"go",
				"gomod",
				"gosum",
				"gowork",
				"graphql",
				"html",
				"java",
				"javascript",
				"jsdoc",
				"json",
				"json5",
				"jsonc",
				"latex",
				"lua",
				"luadoc",
				"luap",
				"markdown",
				"markdown_inline",
				"org",
				"php",
				"printf",
				"query",
				"regex",
				"ruby",
				"rust",
				"scheme",
				"scss",
				"sql",
				"svelte",
				"toml",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"xml",
				"yaml",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
			indent = { enable = true },
			textobjects = {
				move = {
					enable = true,
					goto_next_start = {
						["]f"] = "@function.outer",
						["]c"] = "@class.outer",
						["]a"] = "@parameter.inner",
					},
					goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
					goto_previous_start = {
						["[f"] = "@function.outer",
						["[c"] = "@class.outer",
						["[a"] = "@parameter.inner",
					},
					goto_previous_end = {
						["[F"] = "@function.outer",
						["[C"] = "@class.outer",
						["[A"] = "@parameter.inner",
					},
				},
			},
		},
	},
	{
		"windwp/nvim-ts-autotag",
		event = "VeryLazy",
		opts = {},
	},
}
