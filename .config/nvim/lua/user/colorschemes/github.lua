require("github-theme").setup({
	theme_style = "light_default",
	function_style = "italic",
	transparent = false,
	dark_sidebar = true,
	dark_float = true,
	dev = true,
	sidebars = { "neotree", "qf", "vista_kind", "terminal", "packer", "aerial" },
	overrides = function(c)
		return {
			-- these overrides are for dark_default theme
			-- Headline = { bg = "#161b22" },
			-- CodeBlock = { bg = "#161b22" },
			-- FoldColumn = { bg = "#0d1117" },
			-- these overrides are for light_default theme
			["@text.todo.checked.markdown"] = { bg = "#98c5a5" },
			["@text.todo.unchecked.markdown"] = { bg = "#b19e80" },
			CodeBlock = { bg = "#f6f8fa" },
			Headline = { bg = "#f6f8fa" },
			NeoTreeNormal = { bg = "#f6f8fa" },
		}
	end,

	-- Change the "hint" color to the "orange" color, and make the "error" color bright red
	-- colors = {hint = "orange", error = "#ff0000"},

	-- Overwrite the highlight groups
	-- overrides = function(c)
	--   return {
	--     htmlTag = {fg = c.red, bg = "#282c34", sp = c.hint, style = "underline"},
	--     DiagnosticHint = {link = "LspDiagnosticsDefaultHint"},
	--     -- this will remove the highlight groups
	--     TSField = {},
	--   }
	-- end
})
