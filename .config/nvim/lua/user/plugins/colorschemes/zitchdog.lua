local config = require("user.config")
local themer = require("user.themer")

local colorscheme = "zitchdog"

local M = {
	"theamallalgi/zitchdog",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.supported_variants = { "grape", "pine" }
M.default_variant = "grape"

M.config = function()
	require("zitchdog").load({
		variant = themer.variant(M), -- grape (default)/pine/night
		-- transparent_bg = true, -- a boolean to toggle transparent background
		-- italic_comments = false, -- a boolean to toggle italic comments
		-- colors = {}, -- a table of colors to override the default palette
	})
end

return M
