local config = require("user.config")
local themer = require("user.themer")

local colorscheme = "no-clown-fiesta"

local M = {
	"aktersnurra/no-clown-fiesta.nvim",
	dependencies = { "nvim-lualine/lualine.nvim" },
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.supported_variants = { "dark", "dim", "light" }
M.default_variant = "dark"

M.config = function()
	if config.colorscheme ~= "no-clown-fiesta" then
		return false
	end

	require("no-clown-fiesta").setup({
		transparent = config.transparent, -- Enable this to disable the bg color
		theme = themer.variant(M),
		styles = {
			-- You can set any of the style values specified for `:h nvim_set_hl`
			comments = {},
			functions = {},
			keywords = {},
			lsp = { underline = true },
			match_paren = {},
			type = { bold = true },
			variables = {},
		},
	})

	vim.cmd([[ colorscheme no-clown-fiesta ]])
end

return M
