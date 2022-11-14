local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local actions = require("telescope.actions")

local fb_actions = require("telescope").extensions.file_browser.actions

local ts_select_dir_for_grep = function(prompt_bufnr)
	local action_state = require("telescope.actions.state")
	local fb = require("telescope").extensions.file_browser
	local live_grep = require("telescope.builtin").live_grep
	local current_line = action_state.get_current_line()

	fb.file_browser({
		files = false,
		depth = false,
		attach_mappings = function(prompt_bufnr)
			require("telescope.actions").select_default:replace(function()
				local entry_path = action_state.get_selected_entry().Path
				local dir = entry_path:is_dir() and entry_path or entry_path:parent()
				local relative = dir:make_relative(vim.fn.getcwd())
				local absolute = dir:absolute()

				live_grep({
					results_title = relative .. "/",
					cwd = absolute,
					default_text = current_line,
				})
			end)

			return true
		end,
	})
end
-- telescope.load_extension('aerial')

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
				["<C-t>"] = actions.select_tab,

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
				["<C-t>"] = actions.select_tab,

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
			sort_lastused = true,
			theme = "dropdown",
			mappings = {
				i = {
					["<c-d>"] = "delete_buffer",
				},
			},
		},
	},
	extensions = {
		file_browser = {
			-- initial_mode='normal',
			-- files = false,
			theme = "ivy",
			mappings = {
				["i"] = {
					-- your custom insert mode mappings
				},
				["n"] = {
					["n"] = fb_actions.create,
					["r"] = fb_actions.rename,
					["m"] = fb_actions.move,
					["c"] = fb_actions.copy,
					["d"] = fb_actions.remove,
					["o"] = fb_actions.open,
					["-"] = fb_actions.goto_parent_dir,
					["~"] = fb_actions.goto_home_dir,
					["w"] = fb_actions.goto_cwd,
					["t"] = fb_actions.change_cwd,
					["f"] = fb_actions.toggle_browser,
					["."] = fb_actions.toggle_hidden,
					["a"] = fb_actions.toggle_all,
				},
			},
		},
	},
})

telescope.load_extension("file_browser")
-- telescope.load_extension("neoclip")
