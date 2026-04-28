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
	"jellybeans_hc",
	"jellybeans_hc_light",
	"jellybeans_light",
	"jellybeans_mono",
	"jellybeans_mono_light",
	"jellybeans_muted",
	"jellybeans_muted_light",
	"jellybeans_warm",
}

M.variant_names = {
	jellybeans = "jellybeans",
	jellybeans_hc = "jellybeans-hc",
	jellybeans_hc_light = "jellybeans-hc-light",
	jellybeans_light = "jellybeans-light",
	jellybeans_mono = "jellybeans-mono",
	jellybeans_mono_light = "jellybeans-mono-light",
	jellybeans_muted = "jellybeans-muted",
	jellybeans_muted_light = "jellybeans-muted-light",
	jellybeans_warm = "jellybeans-warm",
}

M.dark_variants = { "jellybeans", "jellybeans_muted", "jellybeans_mono", "jellybeans-warm", "jellybeans-hc" }
M.light_variants = { "jellybeans_light", "jellybeans_muted_light", "jellybeans_mono_light" }
M.default_variant = "jellybeans"
M.default_dark_variant = "jellybeans"
M.default_light_variant = "jellybeans_light"

M.config = function()
	if config.colorscheme ~= "jellybeans" then
		return false
	end

	-- local hl = function(group)
	-- 	return vim.api.nvim_get_hl(0, {
	-- 		name = group,
	-- 		link = false,
	-- 		create = false,
	-- 	})
	-- end
	-- local function hex_to_rgb(hex)
	-- 	hex = hex:gsub("#", "")
	-- 	return tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16)
	-- end
	--
	-- local function rgb_to_hex(r, g, b)
	-- 	r = math.min(255, math.max(0, math.floor(r + 0.5)))
	-- 	g = math.min(255, math.max(0, math.floor(g + 0.5)))
	-- 	b = math.min(255, math.max(0, math.floor(b + 0.5)))
	-- 	return string.format("#%02x%02x%02x", r, g, b)
	-- end
	-- local function blend(fg, bg, a)
	-- 	local r1, g1, b1 = hex_to_rgb(fg)
	-- 	local r2, g2, b2 = hex_to_rgb(bg)
	-- 	return rgb_to_hex((1 - a) * r2 + a * r1, (1 - a) * g2 + a * g1, (1 - a) * b2 + a * b1)
	-- end
	-- local shade_markdown_highlights = function()
	-- 	local bg = string.format("#%06x", hl("Normal").bg)
	-- 	local tag_hl_fg = string.format("#%06x", hl("@lsp.type.decorator.markdown").fg)
	--
	-- 	local tag_shadow = blend(tag_hl_fg, bg, 0.15)
	-- 	vim.api.nvim_set_hl(0, "@lsp.type.decorator.markdown", { bg = tag_shadow })
	-- end
	--
	-- -- Compile and apply our custom highlights
	-- shade_markdown_highlights()
	--
	-- vim.api.nvim_create_autocmd("ColorScheme", {
	-- 	group = vim.api.nvim_create_augroup("md-shades", {}),
	-- 	desc = "Apply shaded highlights to markdown groups",
	-- 	callback = shade_markdown_highlights,
	-- })

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
		palette = nil, -- specify a palette variant: nil (default/vibrant) or "jellybeans_muted"
		plugins = {
			all = true,
			auto = true, -- will read lazy.nvim and apply the colors for plugins that are installed
		},
		on_highlights = function(highlights, colors) end,
		on_colors = function(colors) end,
	})

	vim.cmd.colorscheme(M.variant_names[themer.variant(M)])
end

return M
