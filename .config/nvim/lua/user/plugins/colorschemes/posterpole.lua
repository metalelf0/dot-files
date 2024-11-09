local config = require("user.config")
local utils = require("user.utils")
local themer = require("user.themer")

local colorscheme = "posterpole"

return {
	"ilof2/posterpole.nvim",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
	config = function()
		require("posterpole").setup({
			selected_tab_highlight = true, --highlight current selected tab
			-- config here
		})
		vim.cmd("colorscheme posterpole")
	end,
}
