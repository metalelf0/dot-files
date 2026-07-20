local config = require("user.config")
local themer = require("user.themer")

local colorscheme = "gruvbox"

local M = {
	"ellisonleao/gruvbox.nvim",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.supported_variants =
	{ "dark-hard", "dark-medium", "dark-soft", "light-hard", "light-medium", "light-soft", "hyprdots" }
M.default_variant = "dark-hard"

M.config = function()
	if config.colorscheme ~= "gruvbox" then
		return false
	end
	if config.variant == "hyprdots" then
		-- config taken from https://github.com/NickTsaizer/HyprDots/blob/master/nvim/lua/plugins/color.lua
		local palette_overrides = {
			dark0 = "#282828",
			light1 = "#ebdbb2",
			light4 = "#d5c4a1",
			gray = "#a89984",
			neutral_red = "#ea6962",
			neutral_green = "#a9b665",
			neutral_yellow = "#e78a4e",
			neutral_blue = "#7daea3",
			neutral_purple = "#d3869b",
			neutral_aqua = "#89b482",
			bright_red = "#ea6962",
			bright_green = "#a9b665",
			bright_yellow = "#d8a657",
			bright_blue = "#7daea3",
			bright_purple = "#d3869b",
			bright_aqua = "#89b482",
		}

		local opts = {}
		opts.terminal_colors = true
		opts.undercurl = true
		opts.underline = true
		opts.bold = true
		opts.italic = {
			strings = true,
			emphasis = true,
			comments = true,
			operators = false,
			folds = true,
		}
		opts.strikethrough = true
		opts.invert_selection = false
		opts.invert_signs = false
		opts.invert_tabline = false
		opts.inverse = true
		opts.contrast = "soft"
		opts.dim_inactive = false
		opts.transparent_mode = config.transparent
		opts.palette_overrides = vim.tbl_deep_extend("force", opts.palette_overrides or {}, palette_overrides)
		opts.overrides = opts.overrides or {}
		require("gruvbox").setup(opts)
		vim.cmd.colorscheme("gruvbox")
	else
		local bg = vim.split(themer.variant(M), "-")[1]
		local contrast = vim.split(themer.variant(M), "-")[2]

		-- theme requires medium contrast to be passed as an empty string
		if contrast == "medium" then
			contrast = ""
		end

		vim.o.background = bg

		require("gruvbox").setup({
			undercurl = true,
			underline = true,
			bold = true,
			strikethrough = true,
			invert_selection = false,
			invert_signs = false,
			invert_tabline = false,
			invert_intend_guides = false,
			inverse = true, -- invert background for search, diffs, statuslines and errors
			contrast = contrast, -- can be "hard", "soft" or empty string
			overrides = {},
			dim_inactive = false,
			terminal_colors = true,
			transparent_mode = config.transparent,
			palette_overrides = {
				bright_red = "#f7815e",
			},
		})

		vim.cmd.colorscheme("gruvbox")
		vim.cmd.hi("link @markup.link.label.markdown_inline GruvboxGreenSign")
	end
end

return M
