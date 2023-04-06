require("visual_studio_code").setup({
	mode = "light",
})

local utils = require("visual_studio_code.utils")
utils.hl.link("@symbol", "String")
utils.hl.link("NeoTreeNormal", "NvimTreeNormal")
utils.hl.link("GitSignsCurrentLineBlame", "@comment")
-- api.nvim_command("hi GitSignsCurrentLineBlame " .. set_fg(colors.dark4))
