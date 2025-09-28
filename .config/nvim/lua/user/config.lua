return {
	colorscheme = "gruvbox",
	variant = "dark-hard",
	-- neovide handles transparency by itself
	-- transparent = not vim.g.neovide, -- (os.getenv("ALACRITTY_WINDOW_ID") ~= nil),
	transparent = true, -- (os.getenv("ALACRITTY_WINDOW_ID") ~= nil),
	dimInactive = true, -- dim inactive windows if theme supports it
	autoformat_enabled = true,
	filemanager = "mini.files", -- supported: mini.files, oil, neo-tree, snacks
	keymapper = "which-key", -- supported: mini.clue, which-key
	completion_engine = "blink-cmp", -- supported: blink-cmp, nvim-cmp
	bufferline_plugin = "none", -- supported: barbar, bufferline, none
	terminal_plugin = "snacks", -- supported: toggleterm, snacks
	-- NOTE: remember to use the real path here and not a symlink!
	obsidian_workspace_path = os.getenv("HOME") .. "/Library/Mobile Documents/iCloud~md~obsidian/Documents/Andrea",
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
	lsp = {
		log_level = "error", -- { debug info warn error off trace }
	},
}
