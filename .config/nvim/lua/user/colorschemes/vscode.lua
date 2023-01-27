vim.g.vscode_italic_comment = 1
vim.o.background = "dark"
local c = require("vscode.colors").get_colors()

require("vscode").setup({
	transparent = false,
	italic_comments = true,
	disable_nvimtree_bg = false,
	color_overrides = {
		--[[ vscLineNumber = '#FFFFFF', ]]
	},
	group_overrides = {
		["@label"] = { fg = c.vscDarkBlue },
	},
})

vim.cmd("colorscheme vscode")
