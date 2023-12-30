local config = require("user.config")
local utils = require("user.utils")
local themer = require("user.themer")

local colorscheme = "base16"

local M = {
	"RRethy/nvim-base16",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
	enabled = false,
}

M.config = function()
	if config.colorscheme ~= colorscheme then
		return false
	end

	-- this is a comment

	vim.cmd("colorscheme base16-" .. themer.variant(M))
end

M.supported_variants = {
	"black-metal",
	"black-metal-bathory",
	"black-metal-burzum",
	"black-metal-dark-funeral",
	"black-metal-gorgoroth",
	"black-metal-immortal",
	"black-metal-khold",
	"black-metal-marduk",
	"black-metal-mayhem",
	"black-metal-nile",
	"black-metal-venom",
}
M.default_variant = "black-metal"

return M
