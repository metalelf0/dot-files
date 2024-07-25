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

M.use_borderless_telescope = true

M.custom_highlights = function(hl, c)
	if M.use_borderless_telescope then
		local prompt = "#2d3149"
		hl.TelescopeNormal = {
			bg = c.bg_dark,
			fg = c.fg_dark,
		}
		hl.TelescopeBorder = {
			bg = c.bg_dark,
			fg = c.bg_dark,
		}
		hl.TelescopePromptNormal = {
			bg = prompt,
		}
		hl.TelescopePromptBorder = {
			bg = prompt,
			fg = prompt,
		}
		hl.TelescopePromptTitle = {
			bg = prompt,
			fg = prompt,
		}
		hl.TelescopePreviewTitle = {
			bg = c.bg_dark,
			fg = c.bg_dark,
		}
		hl.TelescopeResultsTitle = {
			bg = c.bg_dark,
			fg = c.bg_dark,
		}
	end

	hl.WinSeparator = {
		fg = "#e0af68", -- this is ok for the "moon" theme
	}
	hl["@string.special.symbol"] = { fg = c.green }
	hl["@label"] = { fg = c.yellow }
	hl["@exception.ruby"] = { fg = c.red }
	hl["@type.ruby"] = { fg = c.orange }
	hl["@string.special.symbol.ruby"] = { fg = c.green }
end

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
		plugins = {
			auto = true,
		},
		styles = {
			sidebars = "dark",
		},
		on_highlights = function(hl, cl)
			M.custom_highlights(hl, cl)
		end,
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
