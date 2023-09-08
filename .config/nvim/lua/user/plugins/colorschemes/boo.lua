local config = require("user.config")
local utils = require("user.utils")

local M = {
	"rockerBOO/boo-colorscheme-nvim",
	lazy = false,
	priority = 1000,
}

M.supported_variants = { "boo", "sunset_cloud", "radioactive_waste", "forest_stream", "crimson_moonlight" }
M.default_variant = "boo"

M.variant = function()
	if not utils.contains(M.supported_variants, config.variant) then
		vim.notify("Variant " .. config.variant .. " not supported, defaulting to " .. M.default_variant)
	end

	return (config.variant or M.default_variant)
end

M.config = function()
	if config.colorscheme ~= "boo" then
		return false
	end

	require("boo-colorscheme").use({
		italic = true,
		theme = M.variant(), -- latte, frappe, macchiato, mocha
	})
end

return M
