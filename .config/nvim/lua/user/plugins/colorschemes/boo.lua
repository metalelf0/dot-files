local config = require("user.config")
local utils = require("user.utils")
local themer = require("user.themer")

local M = {
	"rockerBOO/boo-colorscheme-nvim",
	lazy = false,
	priority = 1000,
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
