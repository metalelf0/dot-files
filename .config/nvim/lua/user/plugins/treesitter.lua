local M = {
	"nvim-treesitter/nvim-treesitter",
	dev = false,
	build = ":TSUpdate",
	event = "BufReadPost",

	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"RRethy/nvim-treesitter-textsubjects",
		"nvim-treesitter/nvim-treesitter-refactor",
		"mfussenegger/nvim-treehopper",
		{ "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },
	},
}

function M.init()
	vim.cmd([[
    omap     <silent> m :<C-U>lua require('tsht').nodes()<CR>
    xnoremap <silent> m :lua require('tsht').nodes()<CR>
  ]])
end

function M.config()
	require("nvim-treesitter.configs").setup({
		ensure_installed = {
			"bash",
			"c",
			"cmake",
			"cpp",
			"css",
			"diff",
			"fish",
			"gitignore",
			"go",
			"graphql",
			"html",
			"http",
			"java",
			"javascript",
			"jsdoc",
			"json",
			"jsonc",
			"latex",
			"lua",
			"markdown",
			"markdown_inline",
			"meson",
			"ninja",
			"nix",
			"norg",
			"org",
			"php",
			"python",
			"query",
			"regex",
			"ruby",
			"rust",
			"scss",
			"sql",
			"svelte",
			"teal",
			"toml",
			"tsx",
			"typescript",
			"vhs",
			"vim",
			"vue",
			"wgsl",
			"yaml",
			-- "comment", -- comments are slowing down TS bigtime, so disable for now
			-- "markdown",
			-- "wgsl",
		},
		sync_install = false,
		auto_install = false,
		highlight = { enable = true, additional_vim_regex_highlighting = { "markdown" } },
		indent = { enable = false },
		context_commentstring = { enable = true, enable_autocmd = false },
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<CR>",
				node_incremental = "<CR>",
				scope_incremental = "<S-CR>",
				node_decremental = "<BS>",
			},
		},
		refactor = {
			smart_rename = {
				enable = false,
				client = {
					smart_rename = "<leader>cr",
				},
			},
			navigation = {
				enable = true,
				keymaps = {
					-- goto_definition = "gd",
					-- list_definitions = "gnD",
					-- list_definitions_toc = "gO",
					-- goto_next_usage = "<a-*>",
					-- goto_previous_usage = "<a-#>",
				},
			},
		},
		query_linter = {
			enable = true,
			use_virtual_text = true,
			lint_events = { "BufWrite", "CursorHold" },
		},
		textsubjects = {
			enable = true,
			keymaps = {
				["."] = "textsubjects-smart",
				[";"] = "textsubjects-container-outer",
			},
		},
		playground = {
			enable = true,
			disable = {},
			updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
			persist_queries = true, -- Whether the query persists across vim sessions
			keybindings = {
				toggle_query_editor = "o",
				toggle_hl_groups = "i",
				toggle_injected_languages = "t",
				toggle_anonymous_nodes = "a",
				toggle_language_display = "I",
				focus_language = "f",
				unfocus_language = "F",
				update = "R",
				goto_node = "<cr>",
				show_help = "?",
			},
		},
		textobjects = {
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					-- You can use the capture groups defined in textobjects.scm
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["ac"] = "@class.outer",
					["ic"] = "@class.inner",
				},
				include_surrounding_whitespace = true,
			},
			move = {
				enable = true,
				set_jumps = true, -- whether to set jumps in the jumplist
				goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer" },
				goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer" },
				goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer" },
				goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer" },
			},
			lsp_interop = {
				enable = false,
				peek_definition_code = {
					["gD"] = "@function.outer",
				},
			},
		},
	})
	local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
	parser_config.markdown.filetype_to_parsername = "octo"
end

return M
