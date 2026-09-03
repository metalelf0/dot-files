return {
	colorscheme = "circadia",
	light_colorscheme = "circadia-light",
	dark_colorscheme = "luna",
	variant = "light",
	transparent = false,
	dimInactive = false, -- dim inactive windows if theme supports it
	autoformat_enabled = true,
	filemanager = "oil", -- supported: mini.files, oil, snacks, fyler
	keymapper = "which-key", -- supported: mini.clue, which-key
	completion_engine = "blink-cmp", -- supported: blink-cmp, nvim-cmp
	terminal_plugin = "toggleterm", -- supported: toggleterm, snacks
	-- TODO: add support for telescope, fzf
	picker = "snacks", -- supported: snacks
	-- NOTE: remember to use the real path here and not a symlink!
	obsidian_workspace_path = os.getenv("HOME") .. "/Library/Mobile Documents/iCloud~md~obsidian/Documents/Andrea",
	markdown_plugin = "touchup", -- supported: markview, touchup, render-markdown
	journal_dir = os.getenv("HOME") .. "/iCloud-Obsidian/work/dailies/",
	lazy_dev_plugins_path = os.getenv("HOME") .. "/Documents/codice_elf0/",
	enable_code_lens = false,
	startup = {
		show_diagnostics = true,
		show_git_blame = false,
	},
	integrations = {
		obsidian = {
			enabled = true,
		},
	},
	lsp = {
		log_level = "error", -- { debug info warn error off trace }
	},
}
