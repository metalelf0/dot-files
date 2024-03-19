local config = require("user.config")
local utils = require("user.utils")
local themer = require("user.themer")

local colorscheme = "github"

local M = {
	"projekt0n/github-nvim-theme",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.supported_variants = {
	"github_dark",
	"github_dark_colorblind",
	"github_dark_default",
	"github_dark_dimmed",
	"github_dark_high_contrast",
	"github_dark_tritanopia",
	"github_dimmed",
	"github_light",
	"github_light_colorblind",
	"github_light_default",
	"github_light_high_contrast",
}
M.default_variant = "github_dark"

function M.config()
	if config.colorscheme ~= "github" then
		return false
	end

	local palette = require("github-theme.palette").load(themer.variant(M))
	local Color = require("github-theme.lib.color")
	local api = vim.api
	vim.o.cursorline = true
	vim.o.cursorlineopt = "number"

	api.nvim_command("hi clear @text.title.1.markdown")
	api.nvim_command("hi clear @text.title.2.markdown")
	api.nvim_command("hi clear @text.title.3.markdown")

	require("github-theme").setup({
		options = {
			-- transparent = true,
			darken = {
				floats = true,
				sidebars = {
					enabled = true,
					list = { "neo-tree", "term", "toggle-term" },
				},
			},
		},
		groups = {
			all = {
				["@text.title.1.markdown"] = { fg = palette.blue.base },
				["@text.title.2.markdown"] = { fg = palette.yellow.base },
				["@text.title.3.markdown"] = { fg = palette.red.base },
				["@text.title.4.markdown"] = { fg = palette.green.base },
			},
			github_light = {
				Comment = { fg = "#bbbbbb" },
			},
		},
	})

	-- augroup CustomHighlight
	--   autocmd!
	--   autocmd ColorScheme @variant@ highlight clear CursorLineNr
	--   autocmd ColorScheme @variant@ highlight link CursorLineNr Normal
	--   autocmd ColorScheme @variant@ highlight clear VertSplit
	--   autocmd ColorScheme @variant@ highlight link VertSplit Function
	--   autocmd ColorScheme @variant@ highlight link NotifyBackground Normal
	-- augroup END
	local setup = [[
    colorscheme @variant@
	]]

	vim.cmd(string.gsub(setup, "@variant@", themer.variant(M)))
end

return M
