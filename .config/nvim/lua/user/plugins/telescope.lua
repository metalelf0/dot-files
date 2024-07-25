return {
	"nvim-telescope/telescope.nvim",
	cmd = { "Telescope" },
	dependencies = {
		"nvim-telescope/telescope-symbols.nvim",
	},

	config = function()
		local telescope = require("telescope")
		local borderless = true
		telescope.setup({
			defaults = {
				dynamic_preview_title = true,
				layout_strategy = "horizontal",
				path_display = { "filename_first", shorten = 3, truncate = 3 },
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
			},
		})
		telescope.load_extension("enhanced_find_files")
	end,
}
