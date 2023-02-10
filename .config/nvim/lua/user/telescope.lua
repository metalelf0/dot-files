local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")

local ts_select_dir_for_grep = function(prompt_bufnr)
	local action_state = require("telescope.actions.state")
	local live_grep = require("telescope.builtin").live_grep
	local current_line = action_state.get_current_line()
end

telescope.setup({
	defaults = {
		prompt_prefix = " ",
		selection_caret = " ",
		path_display = { shorten = 3, truncate = 3 },
		dynamic_preview_title = true,

		mappings = {
			i = {
				["<C-n>"] = actions.cycle_history_next,
				["<C-p>"] = actions.cycle_history_prev,

				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,

				["<C-c>"] = actions.close,

				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,

				["<CR>"] = actions.select_default,
				["<C-x>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-t>"] = trouble.open_with_trouble,

				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,

				["<PageUp>"] = actions.results_scrolling_up,
				["<PageDown>"] = actions.results_scrolling_down,

				["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
				["<C-l>"] = actions.complete_tag,
				["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
				-- allow using C-w to delete word in prompt
				["<C-w>"] = function()
					vim.cmd([[normal! bcw]])
				end,
				["<C-g>"] = function()
					require("telescope.builtin").symbols({ sources = { "gitmoji" } })
				end,
			},

			n = {
				["<esc>"] = actions.close,
				["<CR>"] = actions.select_default,
				["<C-x>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-t>"] = trouble.open_with_trouble,

				["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

				["j"] = actions.move_selection_next,
				["k"] = actions.move_selection_previous,
				["H"] = actions.move_to_top,
				["M"] = actions.move_to_middle,
				["L"] = actions.move_to_bottom,

				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,
				["gg"] = actions.move_to_top,
				["G"] = actions.move_to_bottom,

				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,

				["<PageUp>"] = actions.results_scrolling_up,
				["<PageDown>"] = actions.results_scrolling_down,

				["?"] = actions.which_key,
			},
		},
	},
	pickers = {
		help_tags = { jump_type = "tab" },
		current_buffer_fuzzy_find = { theme = "dropdown" },
		colorscheme = {
			enable_preview = true,
		},
		lsp_definitions = { theme = "ivy" },
		lsp_references = {
			theme = "ivy",
			include_declaration = false,
		},
		live_grep = {
			mappings = {
				i = {
					["<C-f>"] = ts_select_dir_for_grep,
				},
				n = {
					["<C-f>"] = ts_select_dir_for_grep,
				},
			},
		},
		buffers = {
			show_all_buffers = true,
			sort_mru = true,
			theme = "dropdown",
			mappings = {
				i = {
					["<c-d>"] = "delete_buffer",
				},
			},
		},
	},
	extensions = {},
})

-- telescope.load_extension("neoclip")
