-- matching slack theme:
-- #1E1E2E,#272C33,#1E1E2E,#CDD6F4,#585B70,#CDD6F4,#A6E3A1,#89B4FA,#1E1E2E,#CDD6F4

require("catppuccin").setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	background = { -- :h background
		light = "latte",
		dark = "mocha",
	},
	color_overrides = {
		latte = {
			base = "#E1EEF5",
		},
		mocha = {
			base = "#000000",
		},
	},
	highlight_overrides = {
		latte = function(_)
			return {
				NvimTreeNormal = { bg = "#D1E5F0" },
			}
		end,
		mocha = function(mocha)
			return {
				TabLineSel = { bg = mocha.pink },
				NvimTreeNormal = { bg = mocha.none },
				CmpBorder = { fg = mocha.surface2 },
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
