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

M.lazy_load = function(colorscheme)
	-- return false
	return colorscheme ~= config.colorscheme
end

M.priority_for = function(colorscheme)
	-- return 1000
	if colorscheme ~= config.colorscheme then
		return 1000
	else
		return 500
	end
end

M.keys = function(colorscheme)
	if colorscheme ~= config.colorscheme then
		return {
			{
				"<leader>uc",
				function()
					require("telescope.builtin").colorscheme({ enable_preview = true })
				end,
				desc = "Colorscheme with preview",
			},
		}
	else
		return {}
	end
end

return M
