local config = require("user.config")
local themer = require("user.themer")

local colorscheme = "ember"

local M = {
	"ember-theme/nvim",
	name = "ember",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.supported_variants = { "ember", "ember-soft", "ember-light" }
M.default_variant = "ember"

function M.config()
	if config.colorscheme ~= "ember" then
		return false
	end

	require("ember").setup({
		variant = themer.variant(M),
	})

	vim.cmd("colorscheme " .. config.colorscheme)
end

return M
