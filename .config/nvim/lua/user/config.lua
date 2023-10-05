return {
	colorscheme = "github",
	variant = "github_dark_high_contrast",
	filemanager = "neo-tree", -- supported: mini.files, oil, neo-tree
	keymapper = "mini.clue",
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
