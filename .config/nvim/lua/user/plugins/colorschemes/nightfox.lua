local config = require("user.config")
local utils = require("user.utils")
local themer = require("user.themer")

local M = {
	"EdenEast/nightfox.nvim",
	lazy = false,
	priority = 1000,
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
					["@symbol"] = "palette.orange",
				},
			},
		},
	})

	local setup = [[
       colorscheme @variant@

	     highlight link @symbol String
	     highlight link @boolean @variable.builtin
	     highlight clear CursorLineNr
	     highlight link CursorLineNr String
       highlight clear VertSplit
       highlight link VertSplit String
	 ]]

	vim.cmd(string.gsub(setup, "@variant@", themer.variant(M)))
end

return M
