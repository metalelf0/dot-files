local config = require("user.config")
local themer = require("user.themer")

local colorscheme = "south"

local M = {
	"arnauKL/south.nvim",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.config = function()
	if config.colorscheme ~= "south" then
		return false
	end

	require("south").setup({
		transparent = config.transparent, -- Skips setting editor backgrounds if true
		darker_floats = false, -- Forces solid floating windows/menus even if transparent
		styles = {
			italics = true, -- Master switch for font slant overrides
			italic_comments = true, -- Toggles italicized comments (ignored if italics = false)
			italic_linenums = true, -- Toggles italicized line numbers (ignored if italics = false)
			bold_keywords = false, -- Applies bold weight to syntax keywords
		},
	})
	vim.cmd.colorscheme("south")
end

return M
