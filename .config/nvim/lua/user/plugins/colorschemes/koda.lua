local config = require("user.config")
local utils = require("user.utils")
local themer = require("user.themer")

local colorscheme = "koda"

local M = {
	"oskarnurm/koda.nvim",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.supported_variants = { "dark", "moss", "light", "glade" }

M.config = function()
	if config.colorscheme ~= "koda" then
		return false
	end
	require("koda").setup({
		transparent = config.transparent,
	})
	vim.cmd.colorscheme("koda-" .. themer.variant(M))
end

return M
