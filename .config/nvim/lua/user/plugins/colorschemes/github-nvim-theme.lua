local config = require("user.config")

local M = {
	"projekt0n/github-nvim-theme",
	lazy = false,
	priority = 1000,
	enabled = (config.colorscheme == "github"),
}

function M.config()
	local theme_style = "github_dark"
	local palette = require("github-theme.palette").load(theme_style)
	local Color = require("github-theme.lib.color")
	local api = vim.api

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

	vim.cmd("colorscheme " .. theme_style)
end

return M
