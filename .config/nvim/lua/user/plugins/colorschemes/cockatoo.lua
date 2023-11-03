local config = require("user.config")

local M = {
	"Bekaboo/nvim",
	name = "bekaboo-nvim-cockatoo",
	lazy = false,
	enabled = false,
	priority = 1001,
}

M.colorscheme = "cockatoo"
M.palette_variants = {
	dark = {
		yellow = "#e6bb86",
		earth = "#c1a575",
		orange = "#f0a16c",
		pink = "#f49ba7",
		ochre = "#e87c69",
		scarlet = "#d85959",
		wine = "#a52929",
		tea = "#a4bd84",
		aqua = "#79ada7",
		turquoise = "#7fa0af",
		flashlight = "#add0ef",
		skyblue = "#A5D5FF",
		cerulean = "#86aadc",
		lavender = "#caafeb",
		purple = "#a48fd1",
		magenta = "#dc8ed3",
		pigeon = "#8f9fbc",
		cumulonimbus = "#557396",
		thunder = "#425974",
		white = "#e5e5eb",
		smoke = "#bebec3",
		beige = "#b1aca7",
		steel = "#606d86",
		iron = "#313742",
		deepsea = "#334154",
		ocean = "#303846",
		jeans = "#262a34",
		space = "#13161f",
		black = "#09080b",
		shadow = "#09080b",
		tea_blend = "#425858",
		aqua_blend = "#2f3f48",
		purple_blend = "#33374b",
		lavender_blend = "#4b4b6e",
		scarlet_blend = "#4b323c",
		wine_blend = "#35262d",
		earth_blend = "#303032",
		smoke_blend = "#272d3a",
		pigeon_blend = "#27323c",
	},
	light = {
		yellow = "#c88500",
		earth = "#b48327",
		orange = "#a84a24",
		pink = "#df6d73",
		ochre = "#c84b2b",
		scarlet = "#d85959",
		wine = "#a52929",
		tea = "#5f8c3f",
		aqua = "#3b8f84",
		turquoise = "#29647a",
		flashlight = "#76a2c2",
		skyblue = "#4C99D4",
		cerulean = "#3c70b4",
		lavender = "#9d7bca",
		purple = "#8b71c7",
		magenta = "#ac4ea1",
		pigeon = "#6666a8",
		cumulonimbus = "#486a91",
		thunder = "#dfd6ce",
		white = "#385372",
		smoke = "#404553",
		beige = "#385372",
		steel = "#9a978a",
		iron = "#b8b7b3",
		deepsea = "#e6ded6",
		ocean = "#f0e8e2",
		jeans = "#faf4ed",
		space = "#faf7ee",
		black = "#efefef",
		shadow = "#3c3935",
		tea_blend = "#bdc8ad",
		aqua_blend = "#c4cdc2",
		purple_blend = "#e1dbe2",
		lavender_blend = "#bcb0cd",
		scarlet_blend = "#e6b8b3",
		wine_blend = "#e6c9c3",
		earth_blend = "#ebe0ce",
		smoke_blend = "#e4e4e2",
		pigeon_blend = "#f4eee8",
	},
}

function M.set_additional_highlights()
	vim.api.nvim_create_autocmd({ "ColorScheme" }, {
		pattern = "cockatoo",
		callback = function()
			local bg = vim.o.background
			local palette

			if bg == "light" then
				palette = M.palette_variants.light
			else
				palette = M.palette_variants.dark
			end

			vim.api.nvim_set_hl(0, "NotifyINFOTitle", { fg = palette.skyblue })
			vim.api.nvim_set_hl(0, "NotifyINFOIcon", { fg = palette.skyblue })
			vim.api.nvim_set_hl(0, "NotifyERRORTitle", { fg = palette.ochre })
			vim.api.nvim_set_hl(0, "NotifyERRORIcon", { fg = palette.ochre })
			vim.api.nvim_set_hl(0, "NotifyWARNTitle", { fg = palette.orange })
			vim.api.nvim_set_hl(0, "NotifyWARNIcon", { fg = palette.orange })
			vim.api.nvim_set_hl(0, "@symbol", { fg = palette.flashlight })
		end,
	})
end

function M.config()
	if config.colorscheme ~= "cockatoo" then
		return false
	end

	M.set_additional_highlights()

	vim.cmd("colorscheme " .. config.colorscheme)
end

return M
