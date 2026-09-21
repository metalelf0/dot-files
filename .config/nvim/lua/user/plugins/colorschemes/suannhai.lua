local config = require("user.config")
local themer = require("user.themer")

local colorscheme = "suannhai"

local M = {
	"WeiTing1991/suannhai.nvim",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.supported_variants = {
	"jiufen",
	"lam-ni",
	"hue-poo",
	"rouiro",
	"sumi",
	"koiai",
	"torinoko",
	"shironeri",
}

M.default_variant = "jiufen"

M.config = function()
	if config.colorscheme ~= "suannhai" then
		return false
	end

	require("suannhai").setup()
	vim.cmd("colorscheme suannhai-" .. themer.variant(M))
end

return M
