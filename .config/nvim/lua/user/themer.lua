local utils = require("user.utils")
local config = require("user.config")
local M = {
	favourites = { "tokyonight", "catppuccin", "fox" },
}

M.variant = function(context)
	if not utils.contains(context.supported_variants, config.variant) then
		vim.notify("Variant " .. config.variant .. " not supported, defaulting to " .. context.default_variant)
	end

	return (config.variant or context.default_variant)
end

M.lazy_load = function(colorscheme)
	return colorscheme ~= config.colorscheme
end

M.priority_for = function(colorscheme)
	if colorscheme ~= config.colorscheme then
		return 1000
	else
		return 500
	end
end

-- using keys to lazy-load packages. Without this setup, telescope pickers wouldn't include lazy-loaded
-- themes
M.keys = function(colorscheme)
	if colorscheme ~= config.colorscheme then
		return {
			{
				"<leader>ut",
				function()
					Snacks.pickers.colorscheme()
				end,
				desc = "Colorscheme with preview",
			},
			{
				"<leader>uu",
				function()
					require("user.themer").favourite_themes_picker()
				end,
				desc = "Fave themes picker",
			},
		}
	else
		return {}
	end
end

M.favourite_themes_picker = function()
	local target = vim.fn.getcompletion

	vim.fn.getcompletion = function()
		return vim.tbl_filter(function(color)
			return vim.tbl_contains(M.favourites, function(c)
				return string.find(color, c) and not (string.find(color, "base16"))
			end, { predicate = true })
		end, target("", "color"))
	end

	require("telescope.builtin").colorscheme({ enable_preview = true })
	vim.fn.getcompletion = target
end

return M
