local config = require("user.config")
local utils = require("user.utils")
local themer = require("user.themer")

local colorscheme = "sanzo"

local M = {
	"https://codeberg.org/navahas/sanzo.nvim",
	name = "sanzo",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.config = function()
	if config.colorscheme ~= "sanzo" then
		return false
	end

	require("sanzo").setup({
		transparent = config.transparent,
		italic = true,
		on_highlights = function(h, p) -- one-off group overrides
			-- see :h nvim_set_hl for all available keys (fg, bg, bold, italic, ...)
			-- h.SanzoComment = { fg = p.role_comment, bold = true }
		end,
	})

	-- set colorscheme after options
	vim.cmd("colorscheme sanzo")
end

return M
