-- matching slack theme:
-- #1E1E2E,#272C33,#1E1E2E,#CDD6F4,#585B70,#CDD6F4,#A6E3A1,#89B4FA,#1E1E2E,#CDD6F4

local config = require("user.config")

local M = {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000,
	enabled = (config.colorscheme == "catppuccin"),
}

M.config = function()
	vim.o.cursorline = true
	vim.o.cursorlineopt = "number"

	require("catppuccin").setup({
		flavour = "mocha", -- latte, frappe, macchiato, mocha
		transparent_background = false,
		show_end_of_buffer = false,
		term_colors = true,
		background = { -- :h background
			light = "latte",
			dark = "mocha",
		},
		integrations = {
			aerial = true,
			cmp = true,
			dashboard = true,
			gitsigns = true,
			harpoon = true,
			headlines = true,
			illuminate = true,
			indent_blankline = {
				enabled = true,
				colored_indent_levels = true,
			},
			leap = true,
			lsp_trouble = true,
			markdown = true,
			mason = true,
			mini = true,
			native_lsp = {
				enabled = true,
			},
			neogit = true,
			neotest = true,
			neotree = true,
			noice = true,
			notify = true,
			octo = true,
			telescope = true,
			treesitter = true,
			which_key = true,
		},
	})

	-- setup must be called before loading
	vim.cmd([[
  try
    augroup CustomHighlight
      autocmd!
      autocmd ColorScheme catppuccin highlight clear CursorLineNr
      autocmd ColorScheme catppuccin highlight link CursorLineNr String
      autocmd ColorScheme catppuccin highlight clear VertSplit
      autocmd ColorScheme catppuccin highlight link VertSplit String
    augroup END

    colorscheme catppuccin
    syntax on
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
]])
end

return M
