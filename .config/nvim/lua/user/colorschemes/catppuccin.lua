require('catppuccin').setup(
{
  transparent_background = false,
  term_colors = false,
  styles = {
    comments = "NONE",
    functions = "NONE",
    keywords = "NONE",
    strings = "NONE",
    variables = "NONE",
  },
  integrations = {
    treesitter = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = "italic",
        hints = "italic",
        warnings = "italic",
        information = "italic",
      },
      underlines = {
        errors = "underline",
        hints = "underline",
        warnings = "underline",
        information = "underline",
      },
    },
    lsp_trouble = true,
    cmp = true,
    lsp_saga = false,
    gitgutter = false,
    gitsigns = true,
    telescope = true,
    nvimtree = {
      enabled = true,
      show_root = false,
      transparent_panel = false,
    },
    neotree = {
      enabled = false,
      show_root = false,
      transparent_panel = false,
    },
    which_key = true,
    indent_blankline = {
      enabled = true,
      colored_indent_levels = true,
    },
    dashboard = true,
    neogit = false,
    vim_sneak = false,
    fern = false,
    barbar = false,
    bufferline = true,
    markdown = true,
    lightspeed = false,
    ts_rainbow = false,
    hop = true,
    notify = true,
    telekasten = false
  }
})

-- remove all  italics

local cp = require'catppuccin.api.colors'.get_colors()

require("catppuccin").remap({ 
  	ErrorMsg = { fg = cp.red, style = "bold" }, 
        TSProperty = { fg = cp.yellow, style = "NONE" },
	TSInclude = { fg = cp.teal, style = "NONE" },
	TSOperator = { fg = cp.sky, style = "bold" },
	TSKeywordOperator = { fg = cp.sky, style = "bold" },
	TSPunctSpecial = { fg = cp.maroon, style = "bold" },
	TSFloat = { fg = cp.peach, style = "bold" },
	TSNumber = { fg = cp.peach, style = "bold" },
	TSBoolean = { fg = cp.peach, style = "bold" },
	TSConditional = { fg = cp.mauve, style = "bold" },
	TSRepeat = { fg = cp.mauve, style = "bold" },
	TSException = { fg = cp.peach, style = "NONE" },
	TSConstBuiltin = { fg = cp.lavender, style = "NONE" },
	TSFuncBuiltin = { fg = cp.peach, style = "NONE" },
	TSTypeBuiltin = { fg = cp.yellow, style = "NONE" },
	TSVariableBuiltin = { fg = cp.teal, style = "NONE" },
	TSFunction = { fg = cp.blue, style = "NONE" },
	TSParameter = { fg = cp.rosewater, style = "NONE" }, 
	TSKeywordFunction = { fg = cp.maroon, style = "NONE" },
	TSKeyword = { fg = cp.red, style = "NONE" },
	TSMethod = { fg = cp.blue, style = "NONE" },
	TSNamespace = { fg = cp.rosewater, style = "NONE" },
	TSStringRegex = { fg = cp.peach, style = "NONE" },
	TSVariable = { fg = cp.white, style = "NONE" },
	TSTagAttribute = { fg = cp.mauve, style = "NONE" },
	TSURI = { fg = cp.rosewater, style = "underline" },
	TSLiteral = { fg = cp.teal, style = "NONE" },
	TSEmphasis = { fg = cp.maroon, style = "NONE" },
	TSStringEscape = { fg = cp.pink, style = "NONE" },
	bashTSFuncBuiltin = { fg = cp.red, style = "NONE" },
	bashTSParameter = { fg = cp.yellow, style = "NONE" },
	typescriptTSProperty = { fg = cp.lavender, style = "NONE" },
	cssTSProperty = { fg = cp.yellow, style = "NONE" },
})


    -- setup must be called before loading
  vim.cmd [[
  try
    colorscheme catppuccin
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
]]

