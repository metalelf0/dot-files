local config = require("user.config")
local utils = require("user.utils")
local themer = require("user.themer")

local colorscheme = "lume"

local M = {
	"danfry1/lume",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.config = function()
	if config.colorscheme ~= "lume" then
		return false
	end
	require("lume").setup({
		transparent = config.transparent,
		italics = true,
	})
	vim.cmd.colorscheme("lume")
end

return M
