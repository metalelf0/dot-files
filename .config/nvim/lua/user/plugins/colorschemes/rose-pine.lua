local config = require("user.config")

local M = {
	"rose-pine/neovim",
	name = "rose-pine",
	lazy = false,
	priority = 1000,
	enabled = (config.colorscheme == "rose-pine"),
}

M.config = function()
	require("rose-pine").setup({
		---@usage 'main'|'moon'
		dark_variant = "moon",
		bold_vert_split = true,
		dim_nc_background = false,
		disable_background = false,
		disable_float_background = false,
		disable_italics = false,
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
	})

	vim.o.background = "light"

	-- set colorscheme after options
	vim.cmd("colorscheme rose-pine")
end

return M
