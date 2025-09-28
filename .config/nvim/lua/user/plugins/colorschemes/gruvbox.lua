local config = require("user.config")
local themer = require("user.themer")

local colorscheme = "gruvbox"

local M = {
	"ellisonleao/gruvbox.nvim",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.supported_variants = { "dark-hard", "dark-medium", "dark-soft", "light-hard", "light-medium", "light-soft" }
M.default_variant = "dark-hard"

M.config = function()
	if config.colorscheme ~= "gruvbox" then
		return false
	end

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
end

return M
