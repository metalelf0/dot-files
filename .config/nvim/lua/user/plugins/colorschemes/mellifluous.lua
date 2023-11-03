local config = require("user.config")
local utils = require("user.utils")
local themer = require("user.themer")

local M = {
	"ramojus/mellifluous.nvim",
	dependencies = { "rktjmp/lush.nvim" },
	lazy = false,
}

M.supported_variants = { "alduin", "mellifluous", "mountain", "tender" }
M.default_variant = "mellifluous"

M.config = function()
	if config.colorscheme ~= "mellifluous" then
		return false
	end

	vim.o.termguicolors = true

	require("mellifluous").setup({
		mellifluous = {
			neutral = true, -- set this to false and bg_contrast to 'medium' for original mellifluous (then it was called meliora theme)
			bg_contrast = "medium", -- options: 'soft', 'medium', 'hard'
		},
		color_set = themer.variant(M),
	})

	vim.opt.cursorline = true
	vim.opt.cursorlineopt = "number"

	local setup = [[
     colorscheme mellifluous

     highlight clear CursorLineNr
     highlight link CursorLineNr String
     highlight clear Headline
     highlight link Headline TermCursorNC
     j
	 ]]

	vim.cmd(setup)
end

return M
