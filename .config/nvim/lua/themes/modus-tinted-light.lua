-- protesilaus_modus.lua
local M = {}

M.base_30 = {
	white         = "#000000",
	darker_black  = "#f3efe8",
	black         = "#fbf7f0", -- nvim bg
	black2        = "#e7e1d5",
	one_bg        = "#efe9dd", -- real bg of onedark
	one_bg2       = "#e3ddd1",
	one_bg3       = "#d7d1c5",
	grey          = "#c9b9b0",
	grey_fg       = "#b3a59c",
	grey_fg2      = "#9d9189",
	light_grey    = "#877d75",
	red           = "#972500",
	baby_pink     = "#a83232",
	pink          = "#b93d3d",
	line          = "#e7e1d5", -- for lines like vertsplit
	green         = "#00663f",
	vibrant_green = "#007d4b",
	blue          = "#005e8b",
	nord_blue     = "#006b99",
	yellow        = "#8f0075",
	sun           = "#9f1085",
	purple        = "#7c318f",
	dark_purple   = "#6c2c7f",
	teal          = "#005f5f",
	orange        = "#ff7f50",
	cyan          = "#005f5f",
	statusline_bg = "#efe9dd",
	lightbg       = "#e3ddd1",
	pmenu_bg      = "#00663f",
	folder_bg     = "#005e8b",
}

M.base_16 = {
	base00 = "#fbf7f0", -- Default Background
	base01 = "#efe9dd", -- Lighter Background
	base02 = "#c9b9b0", -- Selection Background
	base03 = "#595959", -- Comments, Invisibles, Line Highlighting
	base04 = "#193668", -- Dark Foreground
	base05 = "#000000", -- Default Foreground
	base06 = "#595959", -- Light Foreground
	base07 = "#595959", -- Light Background
	base08 = "#005e8b", -- Variables, XML Tags, etc.
	base09 = "#00663f", -- Integers, Boolean, Constants, etc.
	base0A = "#005f5f", -- Classes, Markup Bold, etc.
	base0B = "#8f0075", -- Strings, Inherited Class, etc.
	base0C = "#005f5f", -- Support, Regular Expressions, etc.
	base0D = "#721045", -- Functions, Methods, etc.
	base0E = "#7c318f", -- Keywords, Storage, etc.
	base0F = "#972500", -- Deprecated, Embedded Tags, etc.
}

M.polish_hl = {
	TSFunction = { fg = M.base_30.purple },
	TSKeyword = { fg = M.base_30.pink },
	TSString = { fg = M.base_30.green },
	TSComment = { fg = M.base_30.grey_fg2 },
}

vim.opt.bg = "light"

M.type = "light" -- "or light"

M = require("base46").override_theme(M, "modus-tinted-light")

return M
