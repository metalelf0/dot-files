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
	if themer.is_dark(M) then
		return config.variant
	else
		return "main"
	end
end

M.config = function()
	if config.colorscheme ~= "rose-pine" then
		return false
	end

	require("rose-pine").setup({
		---@usage 'main'|'moon'
		dark_variant = M.dark_variant(),
		bold_vert_split = false,
		dim_nc_background = false,
		disable_background = false,
		disable_float_background = false,
		disable_italics = true,
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

	if not M.is_dark() then
		vim.o.background = "light"
	end

	-- set colorscheme after options
	vim.cmd("colorscheme rose-pine")
end

return M
