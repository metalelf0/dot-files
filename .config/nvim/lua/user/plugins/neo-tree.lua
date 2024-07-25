return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "main",
	cmd = "Neotree",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	keys = {
		{
			"<leader>ge",
			function()
				require("neo-tree.command").execute({ source = "git_status", toggle = true })
			end,
			desc = "Git explorer",
		},
		{
			"<leader>be",
			function()
				require("neo-tree.command").execute({ source = "buffers", toggle = true })
			end,
			desc = "Buffer explorer",
		},
	},
	init = function()
		vim.g.neo_tree_remove_legacy_commands = true
		require("mini.icons").setup()
		MiniIcons.mock_nvim_web_devicons()
	end,
	opts = {
		auto_clean_after_session_restore = true,
		close_if_last_window = true,
		commands = {
			find_in_dir = function(state)
				local node = state.tree:get_node()
				local path = node:get_id()
				require("telescope.builtin").find_files({
					cwd = node.type == "directory" and path or vim.fn.fnamemodify(path, ":h"),
				})
			end,
		},
		default_component_configs = {
			indent = {
				with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
				expander_collapsed = "",
				expander_expanded = "",
				expander_highlight = "NeoTreeExpander",
			},
		},
		event_handlers = {
			{
				event = "neo_tree_buffer_enter",
				handler = function(_)
					vim.opt_local.signcolumn = "auto"
				end,
			},
		},
		filesystem = {
			bind_to_cwd = false,
			follow_current_file = { enabled = true },
			hijack_netrw_behavior = "open_current",
			use_libuv_file_watcher = true,
		},
		open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
		sources = { "filesystem", "buffers", "git_status", "document_symbols" },
		window = {
			position = "left",
			mappings = {
				["<space>"] = "none",
				["[b"] = "prev_source",
				["]b"] = "next_source",
				F = "find_in_dir" or nil,
				o = "open",
			},
		},
	},
}
