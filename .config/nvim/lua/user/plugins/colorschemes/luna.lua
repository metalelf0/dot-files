local config = require("user.config")
local utils = require("user.utils")
local themer = require("user.themer")

local colorscheme = "luna"

local M = {
	"WTFox/luna.nvim",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.config = function()
	if config.colorscheme ~= "luna" then
		return false
	end
	require("luna").setup({
		transparent = config.transparent,
		on_highlights = function(hl, colors)
			hl.Comment = { fg = colors.comment, italic = true }
		end,
	})
	vim.cmd.colorscheme("luna")
end

M.after = function() end

return M
