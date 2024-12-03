local config = require("user.config")
local utils = require("user.utils")
local themer = require("user.themer")

local colorscheme = "flexoki"

local M = {
	"nuvic/flexoki-nvim",
	name = "flexoki",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.supported_variants = { "moon", "dawn" }
M.default_variant = "moon"

function M.config()
	if config.colorscheme ~= "flexoki" then
		return false
	end

	require("flexoki").setup({
		variant = themer.variant(M),
		styles = {
			bold = true,
			italic = true,
			transparency = config.transparent,
		},
	})

	vim.cmd("colorscheme flexoki")
end

return M
