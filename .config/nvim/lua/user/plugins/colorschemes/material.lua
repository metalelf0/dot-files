local config = require("user.config")
local themer = require("user.themer")

local M = {
	"marko-cerovac/material.nvim",
	lazy = false,
	priority = 1000,
}

M.supported_variants = { "darker", "lighter", "oceanic", "palenight", "deep_ocean" }
M.default_variant = "darker"

M.config = function()
	if config.colorscheme ~= "material" then
		return false
	end

	require("material").setup({
		contrast = {
			sidebars = true, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
			floating_windows = true, -- Enable contrast for floating windows
			line_numbers = false, -- Enable contrast background for line numbers
			sign_column = false, -- Enable contrast background for the sign column
			cursor_line = false, -- Enable darker background for the cursor line
			non_current_windows = false, -- Enable darker background for non-current windows
			popup_menu = true, -- Enable lighter background for the popup menu
		},
		italics = {
			comments = true, -- Enable italic comments
			keywords = false, -- Enable italic keywords
			functions = false, -- Enable italic functions
			strings = false, -- Enable italic strings
			variables = false, -- Enable italic variables
		},
		contrast_filetypes = { -- Specify which filetypes get the contrasted (darker) background
			"terminal", -- Darker terminal background
			"packer", -- Darker packer background
			"qf", -- Darker qf list background
			"neo-tree",
			"neo-tree-popup",
		},

		high_visibility = {
			lighter = false, -- Enable higher contrast text for lighter style
			darker = false, -- Enable higher contrast text for darker style
		},

		disable = {
			colored_cursor = false, -- Disable the colored cursor
			borders = false, -- Disable borders between verticaly split windows
			background = false, -- Prevent the theme from setting the background (NeoVim then uses your teminal background)
			term_colors = false, -- Prevent the theme from setting terminal colors
			eob_lines = false, -- Hide the end-of-buffer lines
		},

		lualine_style = "stealth", -- Lualine style ( can be 'stealth' or 'default' )

		async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)

		custom_highlights = {}, -- Overwrite highlights with your own

		plugins = { -- Here, you can disable(set to false) plugins that you don't use or don't want to apply the theme to
			trouble = true,
			nvim_cmp = true,
			neogit = false,
			gitsigns = true,
			git_gutter = false,
			telescope = true,
			neorg = true,
			nvim_tree = false,
			sidebar_nvim = true,
			lsp_saga = false,
			nvim_dap = true,
			which_key = true,
			sneak = false,
			hop = true,
			indent_blankline = true,
			nvim_illuminate = true,
			mini = false,
		},
	})

	vim.cmd('let g:material_style="' .. themer.variant(M) .. '"')
	vim.cmd("colorscheme material")
end

return M
