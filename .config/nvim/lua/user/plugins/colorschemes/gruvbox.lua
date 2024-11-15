local config = require("user.config")
local themer = require("user.themer")

local colorscheme = "gruvbox"

local M = {
	"ellisonleao/gruvbox.nvim",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.supported_variants = { "hard", "soft", "" }
M.default_variant = "hard"

M.config = function()
	if config.colorscheme ~= "gruvbox" then
		return false
	end
	require("gruvbox").setup({
		undercurl = true,
		underline = true,
		bold = true,
		strikethrough = true,
		invert_selection = false,
		invert_signs = false,
		invert_tabline = false,
		invert_intend_guides = false,
		inverse = true, -- invert background for search, diffs, statuslines and errors
		contrast = themer.variant(M), -- can be "hard", "soft" or empty string
		overrides = {},
		dim_inactive = false,
		terminal_colors = true,
		transparent_mode = config.transparent,
		palette_overrides = {
			bright_red = "#f7815e",
		},
	})

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
