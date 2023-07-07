local config = require("user.config")
local utils = require("user.utils")

local M = {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
}

M.supported_variants = { "storm", "night", "moon", "day" }
M.default_variant = "night"

M.variant = function()
	if not utils.contains(M.supported_variants, config.variant) then
		vim.notify("Variant " .. config.variant .. " not supported, defaulting to " .. M.default_variant)
	end

	return (config.variant or M.default_variant)
end

M.config = function()
	if config.colorscheme ~= "tokyonight" then
		return false
	end

	require("tokyonight").setup({
		-- allowed values are 'storm', 'moon', day' and 'night'
		style = M.variant(),
		sidebars = { "neo-tree", "qf", "vista_kind", "terminal", "packer", "aerial", "toggleterm" },
		dim_inactive = false,
		styles = {
			sidebars = "dark",
			floats = "dark",
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
