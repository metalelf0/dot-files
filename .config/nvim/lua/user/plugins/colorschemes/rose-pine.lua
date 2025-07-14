local config = require("user.config")
local utils = require("user.utils")
local themer = require("user.themer")

local colorscheme = "rose-pine"

local M = {
	"rose-pine/neovim",
	name = "rose-pine",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.supported_variants = { "moon", "main", "dawn" }
M.dark_variants = { "moon", "main" }
M.default_variant = "main"

M.dark_variant = function()
	if M.is_dark_variant() then
		return config.variant
	else
		return M.dark_variants[0]
	end
end

M.is_dark_variant = function()
	return utils.contains(M.dark_variants, config.variant)
end

M.config = function()
	if config.colorscheme ~= "rose-pine" then
		return false
	end

	require("rose-pine").setup({
		---@usage 'main'|'moon'
		dark_variant = M.dark_variant(),
		bold_vert_split = false,
		dim_inactive_windows = false,
		disable_background = false,
		disable_float_background = false,
		extend_background_behind_borders = true,
		disable_italics = false,
		styles = {
			transparency = config.transparent,
		},
		palette = {
			main = {
				base = "#0a0a0a",
			},
		},
		groups = {
			headings = {
				h1 = "iris",
				h2 = "foam",
				h3 = "rose",
				h4 = "gold",
				h5 = "pine",
				h6 = "foam",
			},
		},
		highlight_groups = {
			VertSplit = { fg = "gold" },
		},
	})

	if not M.is_dark_variant() then
		vim.o.background = "light"
	end

	-- set colorscheme after options
	vim.cmd("colorscheme rose-pine")
end

return M
