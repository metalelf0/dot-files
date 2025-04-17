local config = require("user.config")
local themer = require("user.themer")

local colorscheme = "jellybeans"

local M = {
	"WTFox/jellybeans.nvim",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.supported_variants = { "jellybeans", "jellybeans_muted", "jellybeans_light", "jellybeans_muted_light" }
M.default_variant = "jellybeans"

M.config = function()
	if config.colorscheme ~= "jellybeans" then
		return false
	end

	require("jellybeans").setup({
		style = string.find(themer.variant(M), "light") and "light" or "dark", -- "dark" or "light"
		transparent = config.transparent,
		italics = true,
		flat_ui = true, -- toggles "flat UI" for pickers
		palette = nil, -- specify a palette variant: nil (default/"vibrant") or "jellybeans_muted"
		plugins = {
			all = false,
			auto = true, -- will read lazy.nvim and apply the colors for plugins that are installed
		},
		on_highlights = function(highlights, colors) end,
		on_colors = function(colors) end,
	})
	vim.cmd.colorscheme("jellybeans")
end

return M
