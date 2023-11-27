return {
	colorscheme = "ayu",
	variant = "dark",
	filemanager = "oil", -- supported: mini.files, oil, neo-tree
	keymapper = "which-key", -- supported: mini.clue, which-key
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
