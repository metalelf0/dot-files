local config = require("user.config")
local utils = require("user.utils")
local themer = require("user.themer")

local colorscheme = "kintsugi"

local M = {
	"metalelf0/kintsugi-nvim",
	dev = true,
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.config = function()
	if config.colorscheme ~= "kintsugi" then
		return false
	end
	require("kintsugi").setup({
		variant = "flared", -- "dark" | "flared"
		transparent = false,
		terminal_colors = true,
		bold_keywords = true,
		italic_comments = false,
	})
	vim.cmd.colorscheme("kintsugi-flared") -- or "kintsugi-flared"
end

return M
