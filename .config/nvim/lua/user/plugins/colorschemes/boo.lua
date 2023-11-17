local config = require("user.config")
local utils = require("user.utils")
local themer = require("user.themer")

local colorscheme = "boo"

local M = {
	"rockerBOO/boo-colorscheme-nvim",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.supported_variants = { "boo", "sunset_cloud", "radioactive_waste", "forest_stream", "crimson_moonlight" }
M.default_variant = "boo"

M.config = function()
	if config.colorscheme ~= "boo" then
		return false
	end

	require("boo-colorscheme").use({
		italic = true,
		theme = themer.variant(M),
	})
end

return M
