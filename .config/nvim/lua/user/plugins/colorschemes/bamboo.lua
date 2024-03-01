local config = require("user.config")
local utils = require("user.utils")
local themer = require("user.themer")

local colorscheme = "bamboo"

local M = {
	"ribru17/bamboo.nvim",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.supported_variants = { "vulgaris", "multiplex", "light" }
M.default_variant = "vulgaris"

M.config = function()
	if config.colorscheme ~= "bamboo" then
		return false
	end

	require("bamboo").setup({
		style = themer.variant(M), -- Choose between 'vulgaris' (regular), 'multiplex' (greener), and 'light'
		transparent = config.transparent, -- Show/hide background
		code_style = {
			comments = { italic = true },
			conditionals = { italic = false },
			keywords = {},
			functions = {},
			namespaces = { italic = true },
			parameters = { italic = false },
			strings = {},
			variables = {},
		},
		lualine = {
			transparent = config.transparent, -- lualine center bar transparency
		},
	})

	require("bamboo").load()
end

return M
