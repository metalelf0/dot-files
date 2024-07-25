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

	require("github-theme").setup({
		palettes = {
			github_light_default = {
				comment = "#bbbbbb",
			},
		},
		options = {
			styles = {
				comments = "italic",
			},
		},
	})

	local setup = [[
    colorscheme @variant@
	]]

	vim.cmd(string.gsub(setup, "@variant@", themer.variant(M)))
end

return M
