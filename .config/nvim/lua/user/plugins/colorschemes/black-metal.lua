local config = require("user.config")
local themer = require("user.themer")

local colorscheme = "black-metal"

local M = {
	"metalelf0/black-metal-theme-neovim",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
	dev = true,
}
local bases = {
	"bathory",
	"burzum",
	"dark-funeral",
	"darkthrone",
	"emperor",
	"gorgoroth",
	"immortal",
	"impaled-nazarene",
	"khold",
	"marduk",
	"mayhem",
	"nile",
	"taake",
	"thyrfing",
	"venom",
	"windir",
}

M.supported_variants = {}
for _, base in ipairs(bases) do
	for _, suffix in ipairs({ "", "-alt", "-light", "-light-alt" }) do
		table.insert(M.supported_variants, base .. suffix)
	end
end

M.default_variant = "burzum"

M.config = function()
	if config.colorscheme ~= "black-metal" then
		return false
	end

	local hl = {
		["@lsp.type.decorator.markdown"] = {
			fg = "$type",
			bg = function(palette, _variant)
				return require("black-metal.utils").blend(palette.string, palette.bg, 0.2)
			end,
		},
		["@markup.link.label_inline"] = {
			bg = function(palette, _variant)
				return require("black-metal.utils").blend(palette.string, palette.bg, 0.2)
			end,
		},
		["@markup.raw.markdown_inline"] = {
			fg = function(palette, _variant)
				return palette.string
			end,
			bg = function(palette, _variant)
				return require("black-metal.utils").blend(palette.string, palette.bg, 0.2)
			end,
		},
	}
	-- hl["@markup.link.label.markdown_inline"] = { bg = "#231c14" }
	-- hl["@markup.raw"] = { bg = "#231c14" }
	-- hl["Hashtag"] = { bg = "#231c14" }

	-- "<theme>[-light][-alt]" → theme, light/dark, alt_bg
	local name = themer.variant(M)
	local alt_bg = name:find("%-alt$") ~= nil
	name = name:gsub("%-alt$", "")
	local mode = name:find("%-light$") ~= nil and "light" or "dark"
	local theme = name:gsub("%-light$", "")

	require("black-metal").setup({
		theme = theme,
		variant = mode,
		alt_bg = alt_bg,
		transparent = config.transparent,
		underline = false,
		trve = false,
		diagnostics = {
			undercurl = false,
			darker = true,
			background = true,
		},
		colors = {
			dark = {
				-- fg = "#c1c1c1",
			},
		},
		highlights = hl,
	})
	require("black-metal").load(theme, mode)
end

return M
