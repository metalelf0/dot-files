return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "main",
	-- cmd = { "NeoTree", "Neotree", "NeoTreeFocus", "NeoTreeToggle" },
	init = function()
		vim.g.neo_tree_remove_legacy_commands = true
	end,
	config = function()
		vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

		require("neo-tree").setup({
			auto_clean_after_session_restore = true,
			close_if_last_window = true,
			sources = { "filesystem", "buffers", "git_status" },
			window = {
				position = "right",
				mappings = {
					["<space>"] = false, -- disable space until we figure out which-key disabling
					["[b"] = "prev_source",
					["]b"] = "next_source",
					F = "find_in_dir" or nil,
					o = "open",
				},
			},
			commands = {
				find_in_dir = function(state)
					local node = state.tree:get_node()
					local path = node:get_id()
					require("telescope.builtin").find_files({
						cwd = node.type == "directory" and path or vim.fn.fnamemodify(path, ":h"),
					})
				end,
			},
			filesystem = {
				follow_current_file = {
					enabled = true,
				},
				hijack_netrw_behavior = "open_current",
				use_libuv_file_watcher = true,
			},
			event_handlers = {
				{
					event = "neo_tree_buffer_enter",
					handler = function(_)
						vim.opt_local.signcolumn = "auto"
					end,
				},
			},
		})
	end,
}
