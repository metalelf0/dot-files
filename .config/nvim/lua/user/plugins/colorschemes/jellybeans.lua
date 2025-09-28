local config = require("user.config")
local themer = require("user.themer")
local utils = require("user.utils")

local colorscheme = "jellybeans"

local M = {
	"WTFox/jellybeans.nvim",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.supported_variants = {
	"jellybeans",
	"jellybeans_muted",
	"jellybeans_mono",
	"jellybeans_light",
	"jellybeans_muted_light",
	"jellybeans_mono_light",
}

M.variant_names = {
	jellybeans = "jellybeans",
	jellybeans_muted = "jellybeans-muted",
	jellybeans_mono = "jellybeans-mono",
	jellybeans_light = "jellybeans-light",
	jellybeans_muted_light = "jellybeans-muted-light",
	jellybeans_mono_light = "jellybeans-mono-light",
}

M.dark_variants = { "jellybeans", "jellybeans_muted", "jellybeans_mono" }
M.light_variants = { "jellybeans_light", "jellybeans_muted_light", "jellybeans_mono_light" }
M.default_variant = "jellybeans"
M.default_dark_variant = "jellybeans"
M.default_light_variant = "jellybeans_light"

M.config = function()
	if config.colorscheme ~= "jellybeans" then
		return false
	end

	local dark_variant = utils.contains(M.dark_variants, themer.variant(M)) and themer.variant(M)
		or M.default_dark_variant
	local light_variant = utils.contains(M.light_variants, themer.variant(M)) and themer.variant(M)
		or M.default_light_variant

	require("jellybeans").setup({
		background = {
			dark = dark_variant,
			light = light_variant,
		},
		transparent = config.transparent,
		italics = true,
		flat_ui = false, -- toggles "flat UI" for pickers
		palette = nil, -- specify a palette variant: nil (default/"vibrant") or "jellybeans_muted"
		plugins = {
			all = false,
			auto = true, -- will read lazy.nvim and apply the colors for plugins that are installed
		},
		on_highlights = function(highlights, colors) end,
		on_colors = function(colors) end,
	})
	vim.cmd.colorscheme(M.variant_names[themer.variant(M)])
end

return M
