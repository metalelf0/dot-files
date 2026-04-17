local config = require("user.config")
local utils = require("user.utils")
local themer = require("user.themer")

local colorscheme = "forsake-repent"

local M = {
	"BYUignite/forsake-repent",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

-- forsake is dark
-- repent is light
M.supported_variants = { "forsake", "repent" }
M.default_variant = "forsake"

function M.config()
	if config.colorscheme ~= "forsake-repent" then
		return false
	end

	vim.cmd("colorscheme " .. config.variant)
end

return M
