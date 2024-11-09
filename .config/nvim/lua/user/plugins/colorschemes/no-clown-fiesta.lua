local config = require("user.config")
local themer = require("user.themer")

local colorscheme = "no-clown-fiesta"

local M = {
	"aktersnurra/no-clown-fiesta.nvim",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.config = function()
	if config.colorscheme ~= "no-clown-fiesta" then
		return false
	end

	require("no-clown-fiesta").setup({
		transparent = config.transparent, -- Enable this to disable the bg color
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
