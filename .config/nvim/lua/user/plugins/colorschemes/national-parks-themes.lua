local config = require("user.config")
local themer = require("user.themer")

local colorscheme = "national-parks"

local M = {
	"pjhamera/national-parks-themes",
	lazy = themer.lazy_load(colorscheme),
	priority = themer.priority_for(colorscheme),
	keys = themer.keys(colorscheme),
}

M.supported_variants = {
	"acadia-light",
	"acadia-dark",
	"american-samoa-light",
	"american-samoa-dark",
	"arches-light",
	"arches-dark",
	"badlands-light",
	"badlands-dark",
	"big-bend-light",
	"big-bend-dark",
	"biscayne-light",
	"biscayne-dark",
	"black-canyon-of-the-gunnison-light",
	"black-canyon-of-the-gunnison-dark",
	"bryce-canyon-light",
	"bryce-canyon-dark",
	"canyonlands-light",
	"canyonlands-dark",
	"capitol-reef-light",
	"capitol-reef-dark",
	"carlsbad-caverns-light",
	"carlsbad-caverns-dark",
	"channel-islands-light",
	"channel-islands-dark",
	"congaree-light",
	"congaree-dark",
	"crater-lake-light",
	"crater-lake-dark",
	"cuyahoga-valley-light",
	"cuyahoga-valley-dark",
	"death-valley-light",
	"death-valley-dark",
	"denali-light",
	"denali-dark",
	"dry-tortugas-light",
	"dry-tortugas-dark",
	"everglades-light",
	"everglades-dark",
	"gates-of-the-arctic-light",
	"gates-of-the-arctic-dark",
	"gateway-arch-light",
	"gateway-arch-dark",
	"glacier-bay-light",
	"glacier-bay-dark",
	"glacier-light",
	"glacier-dark",
	"grand-canyon-light",
	"grand-canyon-dark",
	"grand-teton-light",
	"grand-teton-dark",
	"great-basin-light",
	"great-basin-dark",
	"great-sand-dunes-light",
	"great-sand-dunes-dark",
	"great-smoky-mountains-light",
	"great-smoky-mountains-dark",
	"guadalupe-mountains-light",
	"guadalupe-mountains-dark",
	"haleakala-light",
	"haleakala-dark",
	"hawaii-volcanoes-light",
	"hawaii-volcanoes-dark",
	"hot-springs-light",
	"hot-springs-dark",
	"indiana-dunes-light",
	"indiana-dunes-dark",
	"isle-royale-light",
	"isle-royale-dark",
	"joshua-tree-light",
	"joshua-tree-dark",
	"katmai-light",
	"katmai-dark",
	"kenai-fjords-light",
	"kenai-fjords-dark",
	"kings-canyon-light",
	"kings-canyon-dark",
	"kobuk-valley-light",
	"kobuk-valley-dark",
	"lake-clark-light",
	"lake-clark-dark",
	"lassen-volcanic-light",
	"lassen-volcanic-dark",
	"mammoth-cave-light",
	"mammoth-cave-dark",
	"mesa-verde-light",
	"mesa-verde-dark",
	"mount-rainier-light",
	"mount-rainier-dark",
	"new-river-gorge-light",
	"new-river-gorge-dark",
	"north-cascades-light",
	"north-cascades-dark",
	"olympic-light",
	"olympic-dark",
	"petrified-forest-light",
	"petrified-forest-dark",
	"pinnacles-light",
	"pinnacles-dark",
	"redwood-light",
	"redwood-dark",
	"rocky-mountain-light",
	"rocky-mountain-dark",
	"saguaro-light",
	"saguaro-dark",
	"sequoia-light",
	"sequoia-dark",
	"shenandoah-light",
	"shenandoah-dark",
	"theodore-roosevelt-light",
	"theodore-roosevelt-dark",
	"virgin-islands-light",
	"virgin-islands-dark",
	"voyageurs-light",
	"voyageurs-dark",
	"white-sands-light",
	"white-sands-dark",
	"wind-cave-light",
	"wind-cave-dark",
	"wrangell-st-elias-light",
	"wrangell-st-elias-dark",
	"yellowstone-light",
	"yellowstone-dark",
	"yosemite-light",
	"yosemite-dark",
	"zion-light",
	"zion-dark",
}

M.default_variant = "zion-light"

M.config = function()
	-- required cause for some reason table.unpack is not working
	if not table.unpack then
		table.unpack = unpack
	end
	if config.colorscheme ~= "national-parks" then
		return false
	end
	require("parks").setup()
	local tokens = vim.split(themer.variant(M), "-")

	-- bg is last token
	local bg = tokens[#tokens]

	-- the rest of the tokens compose the theme_name
	local theme_name_tokens = { table.unpack(tokens, 1, (#tokens - 1)) }
	local theme_name = vim.iter(theme_name_tokens):join("-")

	vim.cmd.colorscheme("parks-" .. theme_name)
	vim.cmd("set bg=" .. bg)
end

return M
