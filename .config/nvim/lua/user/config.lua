return {
	colorscheme = "ef-themes",
	variant = "ef-light",
	transparent = false, -- (os.getenv("ALACRITTY_WINDOW_ID") ~= nil),
	autoformat_enabled = true,
	filemanager = "mini.files", -- supported: mini.files, oil, neo-tree
	keymapper = "which-key", -- supported: mini.clue, which-key
	completion_engine = "nvim-cmp", -- supported: blink-cmp, nvim-cmp
	bufferline_plugin = "bufferline", -- supported: barbar, bufferline
	obsidian_workspace_path = os.getenv("HOME") .. "/iCloud-Obsidian/",
	journal_dir = os.getenv("HOME") .. "/iCloud-Obsidian/work/dailies/",
	dashboard = "snacks.nvim", -- supported: snacks.nvim, alpha
	startup = {
		show_diagnostics = true,
		show_git_blame = false,
	},
	integrations = {
		obsidian = {
			enabled = true,
		},
	},
}
