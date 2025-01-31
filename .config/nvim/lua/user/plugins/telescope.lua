return {
	"nvim-telescope/telescope.nvim",
	cmd = { "Telescope" },
	dependencies = {
		"nvim-telescope/telescope-symbols.nvim",
		"nvim-telescope/telescope-live-grep-args.nvim",
	},

	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local lga_actions = require("telescope-live-grep-args.actions")
		local borderless = true
		telescope.setup({
			defaults = {
				dynamic_preview_title = true,
				layout_strategy = "vertical",
				path_display = { "filename_first", shorten = 3, truncate = 3, reverse_directories = false },
				prompt_prefix = " ",
				selection_caret = " ",
				sorting_strategy = "ascending",
				winblend = borderless and 0 or 10,
				layout_config = {
					horizontal = {
						prompt_position = "bottom",
						width = { padding = 20 },
						height = { padding = 2 },
						preview_width = 0.6,
					},
					vertical = {
						prompt_position = "top",
						width = { padding = 20 },
						height = { padding = 2 },
						preview_height = 0.6,
					},
				},
				mappings = {
					i = {
						["<C-j>"] = require("telescope.actions").move_selection_next,
						["<C-k>"] = require("telescope.actions").move_selection_previous,
						["<C-c>"] = require("telescope.actions").close,
						["<c-t>"] = function(...)
							return require("trouble.providers.telescope").open_with_trouble(...)
						end,
						["<S-Down>"] = function(...)
							return require("telescope.actions").cycle_history_next(...)
						end,
						["<S-Up>"] = function(...)
							return require("telescope.actions").cycle_history_prev(...)
						end,
						["<C-a>"] = function(prompt_bufnr)
							local selection = require("telescope.actions.state").get_selected_entry()
							local target_dir = vim.fn.fnamemodify(selection.path, ":p:h")
							local current_file_name = vim.fn.expand("%:t")
							local current_file_path = vim.fn.expand("%:p:h")
							print("Moving " .. current_file_name .. " to " .. target_dir)
							local new_file_path = vim.fs.joinpath(target_dir, current_file_name)
							local command = "Rename " .. new_file_path
							vim.api.nvim_command("Rename " .. new_file_path)
						end,
					},
				},
			},
			pickers = {
				oldfiles = {
					path_display = { shorten = 3, truncate = 3 },
				},
				buffers = {
					show_all_buffers = true,
					sort_mru = true,
					mappings = {
						i = {
							["<c-d>"] = "delete_buffer",
						},
					},
				},
			},
			extensions = {
				advanced_git_search = {
					diff_plugin = "diffview",
				},
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case". The default case_mode is "smart_case"
				},
				live_grep_args = {
					auto_quoting = true, -- enable/disable auto-quoting
					path_display = { "filename_first" },
					-- define mappings, e.g.
					mappings = { -- extend mappings
						i = {
							["<C-r>"] = lga_actions.quote_prompt(),
							["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
							-- freeze the current list and start a fuzzy search in the frozen list
							["<C-f>"] = actions.to_fuzzy_refine,
						},
					},
				},
			},
		})
		telescope.load_extension("enhanced_find_files")
		telescope.load_extension("live_grep_args")
		telescope.load_extension("fzf")
	end,
}
