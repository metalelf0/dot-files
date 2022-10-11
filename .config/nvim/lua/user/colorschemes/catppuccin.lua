-- matching slack theme:
-- #1E1E2E,#272C33,#1E1E2E,#CDD6F4,#585B70,#CDD6F4,#A6E3A1,#89B4FA,#1E1E2E,#CDD6F4

vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha

require("catppuccin").setup({
	integrations = {
		aerial = true,
		cmp = true,
		gitsigns = true,
		lsp_trouble = true,
		neotree = true,
		notify = true,
		telescope = true,
		which_key = true,
    dashboard = true,
    leap = true,
    markdown = true,
    neotest = true,
    treesitter = true,
		indent_blankline = {
			enabled = true,
			colored_indent_levels = false,
		},
		native_lsp = {
			enabled = true,
		},
	},
})

-- setup must be called before loading
vim.cmd([[
  try
    colorscheme catppuccin
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
]])
