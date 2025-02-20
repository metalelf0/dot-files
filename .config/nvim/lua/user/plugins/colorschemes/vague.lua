local config = require("user.config")
local themer = require("user.themer")

local colorscheme = "vague"

local M = {
	"vague2k/vague.nvim",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.config = function()
	if config.colorscheme ~= "vague" then
		return false
	end

	require("vague").setup({
		transparent = config.transparent,
	}
)
	vim.cmd("colorscheme vague")
end

return M
