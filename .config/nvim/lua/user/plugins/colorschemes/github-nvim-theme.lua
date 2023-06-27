local config = require("user.config")

local M = {
	"projekt0n/github-nvim-theme",
	lazy = false,
	priority = 1000,
	enabled = (config.colorscheme == "github"),
}

function M.variant()
	return config.variant or "github_dark"
end

function M.config()
	local palette = require("github-theme.palette").load(M.variant())
	local Color = require("github-theme.lib.color")
	local api = vim.api
	vim.o.cursorline = true
	vim.o.cursorlineopt = "number"

	api.nvim_command("hi clear @text.title.1.markdown")
	api.nvim_command("hi clear @text.title.2.markdown")
	api.nvim_command("hi clear @text.title.3.markdown")

	require("github-theme").setup({
		groups = {
			all = {
				["@text.title.1.markdown"] = { fg = palette.blue.base },
				["@text.title.2.markdown"] = { fg = palette.yellow.base },
				["@text.title.3.markdown"] = { fg = palette.red.base },
				["@text.title.4.markdown"] = { fg = palette.green.base },
			},
		},
	})

	vim.cmd([[
    augroup CustomHighlight
      autocmd!
      autocmd ColorScheme github_dark_high_contrast highlight clear CursorLineNr
      autocmd ColorScheme github_dark_high_contrast highlight link CursorLineNr Normal
      autocmd ColorScheme github_dark_high_contrast highlight clear VertSplit
      autocmd ColorScheme github_dark_high_contrast highlight link VertSplit Function
    augroup END
  ]])

	vim.cmd("colorscheme " .. M.variant())
end

return M
