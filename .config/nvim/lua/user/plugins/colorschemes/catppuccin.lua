-- matching slack theme:
-- #1E1E2E,#272C33,#1E1E2E,#CDD6F4,#585B70,#CDD6F4,#A6E3A1,#89B4FA,#1E1E2E,#CDD6F4

local config = require("user.config")
local utils = require("user.utils")
local themer = require("user.themer")

local colorscheme = "catppuccin"

local M = {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
	dev = true,
}

M.supported_variants = { "mocha", "latte", "frappe", "macchiato" }
M.default_variant = "mocha"

M.specs = {
	{
		"akinsho/bufferline.nvim",
		optional = true,
		opts = function(_, opts)
			if (vim.g.colors_name or ""):find("catppuccin") then
				vim.print("Loading catppuccin highlights...")
				opts.highlights = require("catppuccin.groups.integrations.bufferline").get()
			end
		end,
	},
}

M.config = function()
	if config.colorscheme ~= "catppuccin" then
		return false
	end
	vim.o.cursorline = true
	vim.o.cursorlineopt = "number"

	require("catppuccin").setup({
		flavour = themer.variant(M), -- latte, frappe, macchiato, mocha
		transparent_background = config.transparent,
		show_end_of_buffer = false,
		term_colors = true,
		background = { -- :h background
			light = "latte",
			dark = "mocha",
		},
		integrations = {
			aerial = true,
			blink_cmp = true,
			cmp = true,
			dashboard = true,
			diffview = true,
			gitsigns = true,
			grug_far = true,
			harpoon = true,
			headlines = true,
			illuminate = true,
			indent_blankline = { enabled = true, colored_indent_levels = true },
			leap = true,
			lsp_trouble = true,
			markdown = true,
			mason = true,
			mini = true,
			native_lsp = { enabled = true },
			neogit = true,
			neotest = true,
			neotree = true,
			noice = true,
			notify = true,
			octo = true,
			snacks = { enabled = true, indent_scope_color = "lavender" },
			telescope = true,
			treesitter = true,
			ufo = true,
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
      autocmd ColorScheme catppuccin highlight clear WinSeparator
      autocmd ColorScheme catppuccin highlight link WinSeparator String
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
