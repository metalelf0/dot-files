return {
	colorscheme = "no-clown-fiesta",
	variant = "",
	transparent = true, -- (os.getenv("ALACRITTY_WINDOW_ID") ~= nil),
	autoformat_enabled = true,
	filemanager = "mini.files", -- supported: mini.files, oil, neo-tree
	keymapper = "which-key", -- supported: mini.clue, which-key
	completion_engine = "nvim-cmp", -- supported: blink-cmp, nvim-cmp
	journal_dir = os.getenv("HOME") .. "/iCloud-Obsidian/work/dailies/",
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
