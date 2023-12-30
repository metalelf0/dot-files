local config = require("user.config")
local utils = require("user.utils")
local themer = require("user.themer")

local colorscheme = "tokyonight"

local M = {
	"folke/tokyonight.nvim",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.supported_variants = { "storm", "night", "moon", "day" }
M.default_variant = "night"

M.config = function()
	if config.colorscheme ~= "tokyonight" then
		return false
	end

	vim.o.cursorline = true
	vim.o.cursorlineopt = "number"

	require("tokyonight").setup({
		style = themer.variant(M),
		sidebars = { "neo-tree", "qf", "vista_kind", "terminal", "packer", "aerial", "toggleterm" },
		dim_inactive = false,
		transparent = config.transparent,
		styles = {
			sidebars = "dark",
		},
		on_highlights = function(hl, cl)
			hl.WinSeparator = {
				fg = "#e0af68", -- this is ok for the "moon" theme
			}
			hl["@symbol"] = { fg = cl.green }
			hl["@label"] = { fg = cl.yellow }
			hl["@exception.ruby"] = { fg = cl.red }
		end,
		day_brightness = 0.3,
	})

	vim.cmd([[
try
  colorscheme tokyonight
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]])
end

return M
