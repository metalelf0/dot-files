local config = require("user.config")
local themer = require("user.themer")

local colorscheme = "modus"

local M = {
	"miikanissi/modus-themes.nvim",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.config = function()
	if config.colorscheme ~= "modus" then
		return false
	end

	require("modus-themes").setup({
		-- Theme comes in two styles `modus_operandi` and `modus_vivendi`
		-- `auto` will automatically set style based on background set with vim.o.background
		style = "auto",
		variant = "default", -- Theme comes in four variants `default`, `tinted`, `deuteranopia`, and `tritanopia`
		dim_inactive = false,
		styles = {
			-- Style to be applied to different syntax groups
			-- Value is any valid attr-list value for `:help nvim_set_hl`
			comments = { italic = true },
			keywords = { italic = true },
			functions = {},
			variables = {},
		},

		--- You can override specific color groups to use other groups or a hex color
		--- function will be called with a ColorScheme table
		---@param colors ColorScheme
		on_colors = function(colors)
			colors.bg_active = colors.bg_main
			colors.bg_inactive = colors.bg_main
		end,

		--- You can override specific highlights to use other groups or a hex color
		--- function will be called with a Highlights and ColorScheme table
		---@param highlights Highlights
		---@param colors ColorScheme
		on_highlights = function(highlights, colors)
			highlights.WhichKeyFloat = { bg = colors.bg_main }
			highlights.Comment = { fg = "#a0a0a0" }
		end,
	})

	vim.cmd("colorscheme modus_vivendi")
end

return M
