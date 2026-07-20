-- stylua: ignore
local c = {
	none    = "NONE",

	bg      = "#051013",
	bg_soft = "#181925",
	fg      = "#a9aaad",
	fg_dark = "#404559",

	blue    = "#89b4fa",
	green   = "#2cbf62",
	purple  = "#987dce",
	red     = "#fb7185",
	yellow  = "#e5a550",
}

-- stylua: ignore
local g = {
  -- Builtin
  Normal                    = { bg = c.bg, fg = c.fg },
  NormalFloat               = { bg = c.none, fg = c.fg },
  FloatBorder               = { bg = c.none, fg = c.fg_dark },
  WinSeparator              = { link = "FloatBorder" },
  VertSplit                 = { link = "FloatBorder" },

  StatusLine                = { bg = c.none, fg = c.fg },
  StatusLineNC              = { link = "StatusLine" },
  StatusLineTermNC          = { link = "StatusLine" },

  CursorLine                = { bg = c.bg_soft },
  Visual                    = { bg = c.bg_soft },

  LineNr                    = { fg = c.fg_dark },
  LineNrAbove               = { fg = c.fg_dark },
  LineNrBelow               = { fg = c.fg_dark },
  CursorLineNr              = { fg = c.fg, bold = true },

  Pmenu                     = { bg = c.none, fg = c.fg_dark },
  PmenuSel                  = { bg = c.fg_dark, fg = c.fg },

  Search                    = { bg = c.blue, fg = c.bg },
  MatchParen                = { fg = c.red, bold = true },

  Directory                 = { fg = c.blue },
  Error                     = { fg = c.red },
  ErrorMsg                  = { fg = c.red },
  WarningMsg                = { fg = c.yellow },

  Comment                   = { fg = c.fg_dark },
  String                    = { fg = c.green },
  Statement                 = { fg = c.purple },
  Operator                  = { fg = c.purple },
  Function                  = { fg = c.blue },
  Type                      = { fg = c.purple },
  Constant                  = { fg = c.red, bold = true },
  Special                   = { fg = c.fg },
  Identifier                = { fg = c.fg },
  Delimiter                 = { fg = c.fg },
  Macro                     = { fg = c.blue },
  SpecialChar               = { fg = c.blue },
  PreProc                   = { fg = c.red },
  Include                   = { fg = c.purple },

  -- Diagnostics
  DiagnosticError           = { fg = c.red },
  DiagnosticWarn            = { fg = c.yellow },
  DiagnosticInfo            = { fg = c.blue },
  DiagnosticHint            = { fg = c.green },
  DiagnosticOk              = { fg = c.green },

  DiagnosticVirtualTextError = { fg = c.red,    bg = c.none },
  DiagnosticVirtualTextWarn  = { fg = c.yellow, bg = c.none },
  DiagnosticVirtualTextInfo  = { fg = c.blue,   bg = c.none },
  DiagnosticVirtualTextHint  = { fg = c.green,  bg = c.none },

  DiagnosticUnderlineError  = { sp = c.red,    underline = true },
  DiagnosticUnderlineWarn   = { sp = c.yellow, underline = true },
  DiagnosticUnderlineInfo   = { sp = c.blue,   underline = true },
  DiagnosticUnderlineHint   = { sp = c.green,  underline = true },

  DiagnosticSignError       = { link = "DiagnosticError" },
  DiagnosticSignWarn        = { link = "DiagnosticWarn"  },
  DiagnosticSignInfo        = { link = "DiagnosticInfo"  },
  DiagnosticSignHint        = { link = "DiagnosticHint"  },

  -- Treesitter
  ["@variable"]             = { link = "Identifier" },
  ["@function"]             = { link = "Function" },
  ["@keyword"]              = { link = "Statement" },

  ["@tag.html"]             = { link = "Statement" },
  ["@tag.delimiter.html"]   = { link = "Delimiter" },
  ["@tag.svelte"]           = { link = "Statement" },
  ["@tag.delimiter.svelte"] = { link = "Delimiter" },

  ["@markup.raw.vimdoc"]    = { link = "Function" },

  -- 3rd-party
  BlinkIndent               = { fg = c.fg_dark },

  MiniPickMatchCurrent      = { bg = c.fg_dark },
  MiniPickMatchMarked       = { bg = c.fg_dark }
}

if vim.g.colors_name == "noctfeld" then
	return
end

vim.api.nvim_command("hi clear")

vim.opt.termguicolors = true

vim.g.colors_name = "noctfeld"

for name, value in pairs(g) do
	vim.api.nvim_set_hl(0, name, value)
end
