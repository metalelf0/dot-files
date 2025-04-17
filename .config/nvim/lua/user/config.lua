return {
	colorscheme = "jellybeans",
	variant = "",
	transparent = false, -- (os.getenv("ALACRITTY_WINDOW_ID") ~= nil),
	autoformat_enabled = true,
	filemanager = "oil", -- supported: mini.files, oil, neo-tree, snacks
	keymapper = "which-key", -- supported: mini.clue, which-key
	completion_engine = "blink-cmp", -- supported: blink-cmp, nvim-cmp
	bufferline_plugin = "bufferline", -- supported: barbar, bufferline
	obsidian_workspace_path = os.getenv("HOME") .. "/iCloud-Obsidian/",
	journal_dir = os.getenv("HOME") .. "/iCloud-Obsidian/work/dailies/",
	dashboard = "snacks.nvim", -- supported: snacks.nvim, alpha
	signs = { Error = " ", Warn = " ", Hint = " ", Info = " " },
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
