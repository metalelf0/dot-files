local config = require("user.config")

local M = {
	"EdenEast/nightfox.nvim",
	lazy = false,
	priority = 1000,
	enabled = (config.colorscheme == "nightfox"),
}

function M.variant()
	return config.variant or "github_dark"
end

M.config = function()
	vim.o.termguicolors = true
	vim.o.cursorline = true
	vim.o.cursorlineopt = "number"

	require("nightfox").setup({
		options = {
			styles = {
				comments = "italic",
			},
			colorblind = {
				enable = true,
				simulate_only = false,
				severity = {
					protan = 0.3,
					deutan = 0.4,
					tritan = 0.3,
				},
			},
			groups = {
				nightfox = {
					["@symbol"] = "palette.orange",
				},
			},
		},
	})

	vim.cmd([[
    augroup CustomHighlight
      autocmd!
      autocmd ColorScheme dawnfox highlight link @symbol String
      autocmd ColorScheme dawnfox highlight link @boolean @variable.builtin
      autocmd ColorScheme dawnfox highlight clear CursorLineNr
      autocmd ColorScheme dawnfox highlight link CursorLineNr String
      autocmd ColorScheme dawnfox highlight clear VertSplit
      autocmd ColorScheme dawnfox highlight link VertSplit String
    augroup END
  ]])

	vim.cmd("colorscheme " .. M.variant())
end

return M
