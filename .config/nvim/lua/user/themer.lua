local utils = require("user.utils")
local config = require("user.config")
local M = {}

M.variant = function(context)
	if not utils.contains(context.supported_variants, config.variant) then
		vim.notify("Variant " .. config.variant .. " not supported, defaulting to " .. context.default_variant)
	end

	return (config.variant or context.default_variant)
end

M.is_dark = function(context)
	if context.dark_variants then
		local dark_variants = context.dark_variants()
	else
		local dark_variants = {}
	end
	return utils.contains(dark_variants, config.variant)
end

return M
