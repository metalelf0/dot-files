return {
	"nvim-telescope/telescope.nvim",
	cmd = { "Telescope" },
	dependencies = {
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-symbols.nvim",
	},

	config = function()
		local telescope = require("telescope")
		local borderless = true
		telescope.setup({
			defaults = {
				layout_strategy = "horizontal",
				layout_config = {
					prompt_position = "top",
				},
				sorting_strategy = "ascending",
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
				prompt_prefix = " ",
				selection_caret = " ",
				path_display = { shorten = 3, truncate = 3 },
				winblend = borderless and 0 or 10,
				dynamic_preview_title = true,
			},
			pickers = {
				buffers = {
					show_all_buffers = true,
					sort_mru = true,
					-- theme = "dropdown",
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
		telescope.load_extension("fzf")
	end,
}
