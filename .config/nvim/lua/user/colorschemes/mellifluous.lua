vim.o.termguicolors = true

require("mellifluous").setup({
	neutral = false, -- set this to `true` for neutral background and greys.
	color_set = "mellifluous", -- available options are mellifluous, alduin and mountain
	styles = {
		comments = "italic",
		conditionals = "NONE",
		folds = "NONE",
		loops = "NONE",
		functions = "NONE",
		keywords = "NONE",
		strings = "NONE",
		variables = "NONE",
		numbers = "NONE",
		booleans = "NONE",
		properties = "NONE",
		types = "bold",
		operators = "NONE",
	},
	transparent_background = {
		enabled = false,
		floating_windows = false,
		telescope = true,
		file_tree = true,
		cursor_line = true,
		status_line = false,
	},
	plugins = {
		cmp = true,
		gitsigns = true,
		indent_blankline = true,
		nvim_tree = {
			enabled = false,
			show_root = false,
		},
		telescope = {
			enabled = true,
			nvchad_like = true,
		},
	},
})

vim.cmd([[
try
  set bg=dark
  colorscheme mellifluous
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]])
