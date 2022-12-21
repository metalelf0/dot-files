require("github-theme").setup({
  theme_style = "light",
  function_style = "italic",
  transparent = "false", -- this allows black bg when using the matching kitty theme
  sidebars = {"qf", "vista_kind", "terminal", "packer", "aerial"},

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
