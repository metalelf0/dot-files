local config = require("user.config")
local utils = require("user.utils")
local themer = require("user.themer")

local colorscheme = "conifer"

local M = {
	"lucasadelino/conifer.nvim",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.supported_variants = { "lunar", "solar" }
M.default_variant = "lunar"

M.config = function()
	if config.colorscheme ~= "conifer" then
		return false
	end
	require("conifer").setup({
		variant = themer.variant(M),
		transparent = config.transparent,
	})
end

return M
