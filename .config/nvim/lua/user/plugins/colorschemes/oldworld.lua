local config = require("user.config")
local themer = require("user.themer")

local colorscheme = "oldworld"

local M = {
	"dgox16/oldworld.nvim",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.supported_variants = { "default", "cooler", "oled" }
M.default_variant = "default"

M.config = function()
	if config.colorscheme ~= "oldworld" then
		return false
	end

	require("oldworld").setup({
		variant = themer.variant(M),
		terminal_colors = true,
		styles = {
			booleans = { italic = true, bold = true },
			comments = { italic = true },
		},
		integrations = {
			hop = true,
			neo_tree = true,
		},
	})

	vim.cmd.colorscheme("oldworld")
end

return M
