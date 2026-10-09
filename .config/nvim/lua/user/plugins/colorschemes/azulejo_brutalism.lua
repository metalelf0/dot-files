local config = require("user.config")
local utils = require("user.utils")
local themer = require("user.themer")

local colorscheme = "azulejo_brutalism"

local M = {
	"metalelf0/AzulejoBrutalism",
	branch = "refactor/lazy-nvim-layout",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.supported_variants = { "dark", "light", "led" }
M.default_variant = "dark"

M.config = function()
	if config.colorscheme ~= "azulejo_brutalism" then
		return false
	end

	if themer.variant(M) == "light" then
		vim.opt.background = "light"
	else
		vim.opt.background = "dark"
	end

	local dark_variant = "dark"
	if themer.variant(M) == "oled" then
		dark_variant = "oled"
	end

	require("azulejo-brutalism").setup({
		transparent = config.transparent,
		dark_variant = dark_variant,
	})

	vim.cmd.colorscheme("azulejo-brutalism")
end

return M
