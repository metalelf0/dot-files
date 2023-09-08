local config = require("user.config")
local utils = require("user.utils")

local M = {
	"ellisonleao/gruvbox.nvim",
	lazy = false,
	priority = 1000,
}

M.supported_variants = { "hard", "soft", "" }
M.default_variant = "dark"

M.variant = function()
	if not utils.contains(M.supported_variants, config.variant) then
		vim.notify("Variant " .. config.variant .. " not supported, defaulting to " .. M.default_variant)
	end

	return (config.variant or M.default_variant)
end

M.config = function()
	if config.colorscheme ~= "gruvbox" then
		return false
	end
	require("gruvbox").setup({
		undercurl = true,
		underline = true,
		bold = true,
		italic = true,
		strikethrough = true,
		invert_selection = false,
		invert_signs = false,
		invert_tabline = false,
		invert_intend_guides = false,
		inverse = true, -- invert background for search, diffs, statuslines and errors
		contrast = M.variant(), -- can be "hard", "soft" or empty string
		overrides = {},
		dim_inactive = false,
		transparent_mode = true,
	})

	-- Theme: If you want to change the theme you need to
	-- change this 2 things, colorscheme will apply the theme in the IDE
	-- and you will also need to create a theme_colors to apply the theme
	-- to the statusline and whichkey
	local colorscheme = "gruvbox"
	local colors = require("user.colors.gruvbox_colors")

	local function set_colors(fg, bg)
		return "guifg=" .. fg .. " guibg=" .. bg
	end

	-- Applying colors
	local api = vim.api
	api.nvim_command("hi StatusDefault " .. set_colors(colors.fg, colors.bg))
	api.nvim_command("hi StatusVimNormal " .. set_colors(colors.bg, colors.accent))
	api.nvim_command("hi StatusVimInsert " .. set_colors(colors.bg, colors.neutral_blue))
	api.nvim_command("hi StatusVimVisual " .. set_colors(colors.bg, colors.func))
	api.nvim_command("hi StatusVimReplace " .. set_colors(colors.bg, colors.entity))
	api.nvim_command("hi StatusVimEnter " .. set_colors(colors.bg, colors.string))
	api.nvim_command("hi StatusVimMore " .. set_colors(colors.bg, colors.regexp))
	api.nvim_command("hi StatusVimSelect " .. set_colors(colors.bg, colors.markup))
	api.nvim_command("hi StatusVimCmd " .. set_colors(colors.bg, colors.keyword))
	api.nvim_command("hi StatusVimShell " .. set_colors(colors.bg, colors.special))
	api.nvim_command("hi StatusVimTerm " .. set_colors(colors.bg, colors.comment))
	api.nvim_command("hi StatusModified " .. set_colors(colors.bg, colors.constant))
	api.nvim_command("hi StatusLineNumber " .. set_colors(colors.bg, colors.operator))
	api.nvim_command("hi StatusColumnNumber " .. set_colors(colors.bg, colors.error))
	api.nvim_command("hi StatusFileInfo " .. set_colors(colors.keyword, colors.bg))
	api.nvim_command("hi StatusGitInfo " .. set_colors(colors.bright_green, colors.bg))
	api.nvim_command("hi StatusLSPProgress " .. set_colors(colors.neutral_blue, colors.bg))
	api.nvim_command("hi StatusLSPError " .. set_colors(colors.error, colors.bg))
	api.nvim_command("hi StatusLSPWarn " .. set_colors(colors.accent, colors.bg))
	api.nvim_command("hi StatusLSPInfo " .. set_colors(colors.entity, colors.bg))
	api.nvim_command("hi StatusLSPHin " .. set_colors(colors.tag, colors.bg))
	api.nvim_command("hi StatusLSPStatus " .. set_colors(colors.tag, colors.bg))
	api.nvim_command("hi StatusCwd " .. set_colors(colors.keyword, colors.bg))
	api.nvim_command("hi StatusCursor " .. set_colors(colors.accent, colors.bg))
	api.nvim_command("hi WhichKeyFloat " .. set_colors(colors.accent, colors.bg))
	api.nvim_command("hi SessionName " .. set_colors(colors.string, colors.bg))

	local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
	if not status_ok then
		vim.notify("colorscheme " .. colorscheme .. " not found!")
		return
	end
end

return M
