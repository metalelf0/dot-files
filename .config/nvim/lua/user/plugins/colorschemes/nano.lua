local config = require("user.config")

local M = {
	"Bekaboo/nvim",
	name = "bekaboo-nvim",
	lazy = false,
	enabled = false,
	priority = 1001,
}

M.palette_variants = {
	dark = {
		foreground = "#cbced2",
		background = "#2e3440",
		highlight = "#3b4252",
		critical = "#ebcb8b",
		salient = "#81a1c0",
		strong = "#e5e7ec",
		popout = "#d08770",
		subtle = "#434c5e",
		shaded = "#4f596e",
		faint = "#6d7d9a",
		faded = "#99aac8",
		grass = "#43565a",
		tea = "#495c60",
		pine = "#79968b",
		lavender = "#48506e",
		violet = "#616b96",
		vermillion = "#c85926",
		black = "#1c2027",
	},
	light = {
		foreground = "#495b64",
		background = "#ffffff",
		highlight = "#f5f8fa",
		critical = "#ff6f00",
		salient = "#673ab7",
		strong = "#000000",
		popout = "#f09276",
		subtle = "#e9eef1",
		shaded = "#dde3e6",
		faint = "#bec8cc",
		faded = "#9fadb4",
		grass = "#e8f5e9",
		tea = "#ccdcdb",
		pine = "#608c88",
		lavender = "#f4eef8",
		violet = "#d9caf0",
		vermillion = "#ff6f00",
		black = "#5b6c75",
	},
}

function M.set_additional_highlights()
	vim.api.nvim_create_autocmd({ "ColorScheme" }, {
		pattern = "nano",
		callback = function()
			local bg = vim.o.background
			local error_foreground
			local info_foreground
			local warn_foreground

			if bg == "light" then
				error_foreground = M.palette_variants.light.critical
				info_foreground = M.palette_variants.light.salient
				warn_foreground = M.palette_variants.light.popout
			else
				error_foreground = M.palette_variants.dark.critical
				info_foreground = M.palette_variants.dark.salient
				warn_foreground = M.palette_variants.dark.popout
			end

			vim.api.nvim_set_hl(0, "NotifyINFOTitle", { fg = info_foreground })
			vim.api.nvim_set_hl(0, "NotifyINFOIcon", { fg = info_foreground })
			vim.api.nvim_set_hl(0, "NotifyERRORTitle", { fg = error_foreground })
			vim.api.nvim_set_hl(0, "NotifyERRORIcon", { fg = error_foreground })
			vim.api.nvim_set_hl(0, "NotifyWARNTitle", { fg = warn_foreground })
			vim.api.nvim_set_hl(0, "NotifyWARNIcon", { fg = warn_foreground })
		end,
	})
end

function M.config()
	if config.colorscheme ~= "nano" then
		return false
	end

	vim.o.background = "light"

	M.set_additional_highlights()

	vim.cmd("colorscheme " .. config.colorscheme)
end

return M
