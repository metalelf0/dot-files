local config = require("user.config")
local utils = require("user.utils")
local themer = require("user.themer")

local colorscheme = "flume"

local M = {
	"mitander/flume.nvim",
	branch = "feat/issue-2-light-schemas",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.supported_variants = { "mist", "dawn", "ash" }
M.default_variant = "mist"

function M.config()
	if config.colorscheme ~= "flume" then
		return false
	end

	require("flume").setup({
		transparent = config.transparent,
		terminal_colors = true,
		variant = themer.variant(M),
		overrides = {},
		highlights = {},
		styles = {
			comments = {},
			functions = {},
			keywords = {},
			strings = {},
			types = {},
			variables = {},
		},
	})
	vim.cmd("colorscheme flume-" .. config.variant)
end

return M
