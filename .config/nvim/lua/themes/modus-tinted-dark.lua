-- protesilaus_modus.lua
local M = {}

M.base_30 = {
	white = "#ffffff",
	darker_black = "#0b0c1a",
	black = "#0d0e1c", -- nvim bg
	black2 = "#1a1b29",
	one_bg = "#1d2235", -- real bg of onedark
	one_bg2 = "#24293c",
	one_bg3 = "#2b3045",
	grey = "#404552",
	grey_fg = "#50565f",
	grey_fg2 = "#606770",
	light_grey = "#707780",
	red = "#ff7f9f",
	baby_pink = "#ff8faf",
	pink = "#ff9fbe",
	line = "#1a1f33", -- for lines like vertsplit
	green = "#00c06f",
	vibrant_green = "#00d77a",
	blue = "#2fafff",
	nord_blue = "#4fbfff",
	yellow = "#c6daff",
	sun = "#d6eaff",
	purple = "#b6a0ff",
	dark_purple = "#a090ef",
	teal = "#00d3d0",
	orange = "#00bcff",
	cyan = "#00bcff",
	statusline_bg = "#1a1f33",
	lightbg = "#24293c",
	pmenu_bg = "#00bcff",
	folder_bg = "#2fafff",
}

M.base_16 = {
	base00 = "#0d0e1c", -- Default Background
	base01 = "#1d2235", -- Lighter Background
	base02 = "#004065", -- Selection Background
	base03 = "#989898", -- Comments, Invisibles, Line Highlighting
	base04 = "#989898", -- Dark Foreground
	base05 = "#ffffff", -- Default Foreground
	base06 = "#c6daff", -- Light Foreground
	base07 = "#c6daff", -- Light Background
	base08 = "#00d3d0", -- Variables, XML Tags, etc.
	base09 = "#00bcff", -- Integers, Boolean, Constants, etc.
	base0A = "#00c06f", -- Classes, Markup Bold, etc.
	base0B = "#00bcff", -- Strings, Inherited Class, etc.
	base0C = "#ff7f9f", -- Support, Regular Expressions, etc.
	base0D = "#2fafff", -- Functions, Methods, etc.
	base0E = "#b6a0ff", -- Keywords, Storage, etc.
	base0F = "#b6a0ff", -- Deprecated, Embedded Tags, etc.
}

M.polish_hl = {
	treesitter = {
		TSFunction = { fg = M.base_30.blue },
		TSKeyword = { fg = M.base_30.purple },
		TSString = { fg = M.base_30.green },
		TSComment = { fg = M.base_30.grey_fg2 },
  },
}

vim.opt.bg = "dark"

-- set the theme type whether is dark or light
M.type = "dark" -- "or light"

-- this will be later used for users to override your theme table from chadrc
M = require("base46").override_theme(M, "modus-tinted-dark")

return M
