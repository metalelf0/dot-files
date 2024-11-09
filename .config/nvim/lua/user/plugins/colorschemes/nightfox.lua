local config = require("user.config")
local utils = require("user.utils")
local themer = require("user.themer")

local colorscheme = "nightfox"

local M = {
	"EdenEast/nightfox.nvim",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.supported_variants = { "carbonfox", "dawnfox", "dayfox", "duskfox", "nightfox", "nordfox", "terafox" }
M.default_variant = "nightfox"

M.config = function()
	if config.colorscheme ~= "nightfox" then
		return false
	end

	vim.o.termguicolors = true
	vim.o.cursorline = true
	vim.o.cursorlineopt = "number"

	require("nightfox").setup({
		options = {
			styles = {
				comments = "italic",
			},
			colorblind = {
				enable = false,
				simulate_only = false,
				severity = {
					protan = 0.3,
					deutan = 0.4,
					tritan = 0.3,
				},
			},
			groups = {
				nightfox = {
					["@string.special.symbol"] = "palette.orange",
				},
			},
			transparent = config.transparent,
		},
	})
	-- highlight link @string.special.symbol String
	-- highlight link @boolean @variable.builtin

	local setup = [[
       colorscheme @variant@

       highlight clear @string.special.symbol
       highlight link @string.special.symbol Character
	     highlight link CursorLineNr String
       highlight clear VertSplit
       highlight link VertSplit Comment
       highlight clear WinSeparator
       highlight link WinSeparator Comment
	 ]]

	vim.cmd(string.gsub(setup, "@variant@", themer.variant(M)))
end

return M
