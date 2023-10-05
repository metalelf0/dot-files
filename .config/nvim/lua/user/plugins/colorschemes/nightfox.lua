local config = require("user.config")
local utils = require("user.utils")

local M = {
	"EdenEast/nightfox.nvim",
	lazy = false,
	priority = 1000,
}

M.supported_variants = { "carbonfox", "dawnfox", "dayfox", "duskfox", "nightfox", "nordfox", "terafox" }
M.default_variant = "nightfox"

M.variant = function()
	if not utils.contains(M.supported_variants, config.variant) then
		vim.notify("Variant " .. config.variant .. " not supported, defaulting to " .. M.default_variant)
	end

	return (config.variant or M.default_variant)
end

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

	vim.cmd(string.gsub(setup, "@variant@", M.variant()))
end

return M
