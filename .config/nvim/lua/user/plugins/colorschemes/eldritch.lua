local config = require("user.config")
local utils = require("user.utils")
local themer = require("user.themer")

local colorscheme = "eldritch"

local M = {
	"eldritch-theme/eldritch.nvim",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.supported_variants = { "default", "darker" }
M.default_variant = "default"

M.config = function()
	if config.colorscheme ~= "eldritch" then
		return false
	end

	require("eldritch").setup({
		palette = themer.variant(M),
		transparent = config.transparent,
	})

	vim.cmd([[
    hi clear @string.special.symbol.ruby
    hi link @string.special.symbol.ruby @property
  ]])
end

return M
