local config = require("user.config")

local M = {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
}

M.config = function()
	if config.colorscheme ~= "tokyonight" then
		return false
	end

	require("tokyonight").setup({
		-- allowed values are 'storm', 'moon', day' and 'night'
		style = "night",
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
