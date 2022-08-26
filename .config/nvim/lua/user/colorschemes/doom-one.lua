-- this is a comment
require("doom-one").setup({
	cursor_coloring = true,
	terminal_colors = true,
	italic_comments = true,
	enable_treesitter = true,
	transparent_background = false,
	pumblend = {
		enable = true,
		transparency_amount = 20,
	},
	plugins_integrations = {
		neorg = true,
		barbar = false,
		bufferline = true,
		gitgutter = false,
		gitsigns = true,
		telescope = true,
		neogit = true,
		nvim_tree = true,
		dashboard = false,
		startify = true,
		whichkey = true,
		indent_blankline = true,
		vim_illuminate = true,
		lspsaga = false,
	},
})

vim.cmd([[
  try
    set termguicolors
    colorscheme doom-one
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
]])
