vim.g.vscode_italic_comment = 1
vim.o.background = "dark"
--[[ local c = require('vscode.colors') ]]

require("vscode").setup({
	-- Enable transparent background
	transparent = false,

	-- Enable italic comment
	italic_comments = true,

	-- Disable nvim-tree background color
	disable_nvimtree_bg = false,

	-- Override colors (see ./lua/vscode/colors.lua)
	color_overrides = {
		--[[ vscLineNumber = '#FFFFFF', ]]
	},

	-- Override highlight groups (see ./lua/vscode/theme.lua)
	group_overrides = {
		-- this supports the same val table as vim.api.nvim_set_hl
		-- use colors from this colorscheme by requiring vscode.colors!
		--[[ Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true }, ]]
	},
})

vim.cmd("colorscheme vscode")
vim.cmd("hi clear TSLiteral")
vim.cmd("hi link TSLiteral TSConstant")
