local config = require("user.config")
local themer = require("user.themer")

local colorscheme = "cendre"

local M = {
	"Aejkatappaja/cendre",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.supported_variants = { "hard", "medium", "soft" }
M.default_variant = "hard"

M.config = function()
	if config.dark_colorscheme ~= "cendre" or config.colorscheme ~= "cendre" then
		return false
	end
	require("cendre").setup({
		background = themer.variant(M),
		italic_virtual_text = true,
		transparent = config.transparent,
		on_highlights = function(hl, c)
			hl["@markup.link.label.markdown_inline"] = { bg = c.bg1 }
			hl["@markup.raw"] = { bg = c.bg2 }
		end,
	})
end

return M
