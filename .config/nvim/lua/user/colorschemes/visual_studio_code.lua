require("visual_studio_code").setup({
	mode = "dark",
})

local utils = require("visual_studio_code.utils")
utils.hl.link("@symbol", "String")
utils.hl.link("NeoTreeNormal", "NvimTreeNormal")
