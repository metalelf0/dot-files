local config = require("user.config")
local utils = require("user.utils")
local themer = require("user.themer")

local M = {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
}

M.colorscheme = "tokyonight"
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
		dim_inactive = true,
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
