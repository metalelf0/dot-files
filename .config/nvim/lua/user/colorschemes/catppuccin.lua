-- matching slack theme:
-- #1E1E2E,#272C33,#1E1E2E,#CDD6F4,#585B70,#CDD6F4,#A6E3A1,#89B4FA,#1E1E2E,#CDD6F4

require("catppuccin").setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
  transparent_background = true,
	background = { -- :h background
		light = "latte",
		dark = "mocha",
	},
	color_overrides = {
		latte = {
			base = "#E1EEF5",
		},
	},
	highlight_overrides = {
		latte = function(_)
			return {
				NvimTreeNormal = { bg = "#D1E5F0" },
				NeoTreeNormal = { bg = "#D1E5F0" },
			}
		end,
	},
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
    syntax on
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
]])

-- mocha terminal colors
vim.g.terminal_color_0 = "#43465A"
vim.g.terminal_color_8 = "#43465A"
vim.g.terminal_color_1 = "#F38BA8"
vim.g.terminal_color_9 = "#F38BA8"
vim.g.terminal_color_2 = "#A6E3A1"
vim.g.terminal_color_10 = "#A6E3A1"
vim.g.terminal_color_3 = "#F9E2AF"
vim.g.terminal_color_11 = "#F9E2AF"
vim.g.terminal_color_4 = "#87B0F9"
vim.g.terminal_color_12 = "#87B0F9"
vim.g.terminal_color_5 = "#F5C2E7"
vim.g.terminal_color_13 = "#F5C2E7"
vim.g.terminal_color_6 = "#94E2D5"
vim.g.terminal_color_14 = "#94E2D5"
vim.g.terminal_color_7 = "#CDD6F4"
vim.g.terminal_color_15 = "#A1A8C9"

