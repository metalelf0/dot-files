-- Name:         macchiato
-- Description:  Colorscheme inspired by nano-emacs @rougier and nanovim @Anthony
-- Author:       Bekaboo <kankefengjing@gmail.com>
-- Maintainer:   Bekaboo <kankefengjing@gmail.com>
-- License:      GPL-3.0
-- Last Updated: Tue 18 Jul 2023 02:39:55 AM CDT

-- Palette {{{
-- stylua: ignore start
local palette_variants = {
  dark = {
    foreground = '#d7c7b3',  -- Light cream for text
    background = '#2b1d15',  -- Dark espresso brown for background
    highlight  = '#4e3a2c',  -- Subtle coffee foam highlight
    critical   = '#a86a2e',  -- Rich caramel for critical elements
    salient    = '#8c6b52',  -- Mocha brown for salient accents
    strong     = '#e8ded2',  -- Warm latte foam for strong emphasis
    popout     = '#b47546',  -- Brighter caramel for accents
    subtle     = '#3d2b1f',  -- Dark coffee for subtle contrasts
    shaded     = '#5e4a3c',  -- Shaded medium brown
    faint      = '#2e251d',  -- Very dark coffee tone
    faded      = '#775d4a',  -- Faded light brown for hints
    grass      = '#4f3e31',  -- Medium coffee brown
    tea        = '#42322a',  -- Dark tea-like brown
    pine       = '#3a2a22',  -- Espresso-dark tone for depth
    lavender   = '#5c4638',  -- Brownish cream
    violet     = '#7a5f48',  -- Dark hazelnut brown
    vermillion = '#a86a2e',  -- Warm caramel-brown for emphasis
    black      = '#1f1410',  -- Deep espresso black  },
  },
  light = {
    foreground = '#4b3b2b',  -- Rich dark brown for text
    background = '#ffffff',  -- Pure white for foam
    highlight  = '#f7f3e9',  -- Light cream highlight
    critical   = '#b87533',  -- Strong caramel-brown for critical elements
    salient    = '#d4a373',  -- Soft caramel
    strong     = '#3d2b1f',  -- Deep brown for strength
    popout     = '#ca9464',  -- Warmer caramel for accents
    subtle     = '#ede7d5',  -- Light cream
    shaded     = '#d7c7b3',  -- Light brown for shading
    faint      = '#f0ece6',  -- Almost-white foam
    faded      = '#b29983',  -- Faded coffee brown
    grass      = '#e6d9c7',  -- Latte-foam color
    tea        = '#dbcab6',  -- Light latte tone
    pine       = '#6a5343',  -- Deep espresso hint
    lavender   = '#e8ded2',  -- Warm cream for latte foam
    violet     = '#c1a188',  -- Light hazelnut brown
    vermillion = '#b87533',  -- Rich caramel-brown for emphasis
    black      = '#382a1b',  -- Dark espresso-like brown  },
  }
}
-- stylua: ignore end
local palette = palette_variants[vim.go.bg]
-- }}}

-- Terminal colors {{{
local termcolor_variants = {
	dark = {
		terminal_color_0 = palette.subtle,
		terminal_color_8 = palette.faded,
		terminal_color_1 = palette.popout,
		terminal_color_9 = palette.popout,
		terminal_color_2 = palette.pine,
		terminal_color_10 = palette.pine,
		terminal_color_3 = palette.critical,
		terminal_color_11 = palette.critical,
		terminal_color_4 = palette.faint,
		terminal_color_12 = palette.faded,
		terminal_color_5 = palette.strong,
		terminal_color_13 = palette.strong,
		terminal_color_6 = palette.salient,
		terminal_color_14 = palette.salient,
		terminal_color_7 = palette.faded,
		terminal_color_15 = palette.faded,
	},
	light = {
		terminal_color_0 = palette.subtle,
		terminal_color_8 = palette.faded,
		terminal_color_1 = palette.critical,
		terminal_color_9 = palette.critical,
		terminal_color_2 = palette.pine,
		terminal_color_10 = palette.pine,
		terminal_color_3 = palette.popout,
		terminal_color_11 = palette.popout,
		terminal_color_4 = palette.faint,
		terminal_color_12 = palette.faded,
		terminal_color_5 = palette.strong,
		terminal_color_13 = palette.strong,
		terminal_color_6 = palette.salient,
		terminal_color_14 = palette.salient,
		terminal_color_7 = palette.faded,
		terminal_color_15 = palette.faded,
	},
}
local termcolors = termcolor_variants[vim.go.bg]
-- }}}

-- Highlight groups {{{1
local hlgroups = {
	-- Common {{{2
	Normal = { fg = palette.foreground, bg = palette.background },
	NormalFloat = { fg = palette.foreground, bg = palette.subtle },
	NormalNC = { link = "Normal" },
	ColorColumn = { bg = palette.highlight },
	Conceal = { fg = palette.foreground },
	Cursor = { fg = palette.subtle, bg = palette.foreground },
	CursorColumn = { bg = palette.highlight },
	CursorIM = { link = "Cursor" },
	CursorLine = { bg = palette.highlight },
	CursorLineNr = { fg = palette.faded, bold = true },
	DebugPC = { bg = palette.subtle },
	lCursor = { link = "Cursor" },
	TermCursor = { fg = palette.subtle, bg = palette.popout },
	TermCursorNC = { fg = palette.critical, bg = palette.subtle },
	DiffAdd = { bg = palette.grass },
	DiffChange = { link = "None" },
	DiffDelete = { fg = palette.faint },
	DiffText = { bg = palette.lavender },
	Directory = { fg = palette.faded },
	EndOfBuffer = { fg = palette.subtle },
	ErrorMsg = { fg = palette.popout },
	FoldColumn = { fg = palette.faded },
	Folded = { fg = palette.faded, bg = palette.subtle },
	FloatBorder = { fg = palette.foreground, bg = palette.subtle },
	FloatShadow = { bg = palette.black, blend = 70 },
	FloatShadowThrough = { link = "None" },
	HealthSuccess = { fg = palette.faded },
	Search = { fg = palette.foreground, bg = palette.subtle },
	IncSearch = { fg = palette.background, bg = palette.popout, bold = true },
	CurSearch = { link = "IncSearch" },
	LineNr = { fg = palette.faint },
	ModeMsg = { fg = palette.foreground },
	MoreMsg = { fg = palette.foreground },
	MsgArea = { link = "Normal" },
	MsgSeparator = { link = "StatusLine" },
	MatchParen = { bg = palette.subtle, bold = true },
	NonText = { fg = palette.subtle },
	Pmenu = { fg = palette.faded, bg = palette.highlight },
	PmenuSbar = { bg = palette.subtle },
	PmenuSel = { fg = palette.foreground, bg = palette.subtle, bold = true },
	PmenuThumb = { bg = palette.popout },
	Question = { fg = palette.foreground },
	QuickFixLine = { link = "Visual" },
	SignColumn = { fg = palette.faded },
	SpecialKey = { fg = palette.salient },
	SpellBad = { underdashed = true },
	SpellCap = { link = "SpellBad" },
	SpellLocal = { link = "SpellBad" },
	SpellRare = { link = "SpellBad" },
	StatusLine = { fg = palette.foreground, bg = palette.subtle },
	StatusLineNC = { fg = palette.faded, bg = palette.subtle },
	Substitute = { link = "Search" },
	TabLine = { link = "StatusLine" },
	TabLineSel = { fg = palette.strong, bg = palette.background, bold = true },
	TabLineFill = { fg = palette.foreground, bg = palette.subtle },
	Title = { fg = palette.foreground, bold = true },
	VertSplit = { fg = palette.subtle },
	Visual = { bg = palette.subtle },
	VisualNOS = { link = "Visual" },
	WarningMsg = { fg = palette.popout },
	Whitespace = { link = "NonText" },
	WildMenu = { link = "PmenuSel" },
	WinSeparator = { link = "VertSplit" },
	WinBar = { fg = palette.foreground },
	WinBarNC = { fg = palette.faded },
	-- }}}2

	-- Syntax {{{2
	Comment = { fg = palette.faint },
	Constant = { fg = palette.faded },
	String = { fg = palette.faded },
	-- String = { fg = palette.popout },
	DocumentKeyword = { link = "Keyword" },
	Character = { fg = palette.critical },
	Number = { fg = palette.faded },
	Boolean = { link = "Constant" },
	Array = { fg = palette.critical },
	Float = { link = "Number" },
	Identifier = { fg = palette.foreground },
	Builtin = { fg = palette.foreground },
	Field = { link = "None" },
	Enum = { fg = palette.faded },
	Namespace = { fg = palette.foreground },
	Function = { fg = palette.strong, bold = true },
	Statement = { fg = palette.salient },
	Specifier = { fg = palette.salient },
	Object = { fg = palette.salient },
	Conditional = { fg = palette.salient },
	Repeat = { fg = palette.salient },
	Label = { fg = palette.salient },
	Operator = { fg = palette.salient },
	Keyword = { fg = palette.salient },
	Exception = { fg = palette.salient },
	PreProc = { fg = palette.salient },
	PreCondit = { link = "PreProc" },
	Include = { link = "PreProc" },
	Define = { link = "PreProc" },
	Macro = { fg = palette.foreground },
	Type = { fg = palette.salient },
	StorageClass = { link = "Keyword" },
	Structure = { link = "Type" },
	Typedef = { fg = palette.salient },
	Special = { fg = palette.critical },
	SpecialChar = { link = "Special" },
	Tag = { fg = palette.subtle, underline = true },
	Delimiter = { fg = palette.foreground },
	Bracket = { fg = palette.cumulonimbus },
	SpecialComment = { link = "SpecialChar" },
	Debug = { link = "Special" },
	Underlined = { underline = true },
	Ignore = { fg = palette.subtle },
	Error = { fg = palette.popout },
	Todo = { fg = palette.background, bg = palette.popout, bold = true },
	-- }}}2

	-- Treesitter syntax {{{2
	["@field"] = { link = "Field" },
	["@property"] = { link = "Field" },
	["@annotation"] = { link = "Operator" },
	["@comment"] = { link = "Comment" },
	["@none"] = { link = "None" },
	["@preproc"] = { link = "PreProc" },
	["@define"] = { link = "Define" },
	["@operator"] = { link = "Operator" },
	["@punctuation.delimiter"] = { link = "Delimiter" },
	["@punctuation.bracket"] = { link = "Bracket" },
	["@punctuation.special"] = { link = "Delimiter" },
	["@string"] = { link = "String" },
	["@string.regex"] = { link = "String" },
	["@string.escape"] = { link = "SpecialChar" },
	["@string.special"] = { link = "SpecialChar" },
	["@character"] = { link = "Character" },
	["@character.special"] = { link = "SpecialChar" },
	["@boolean"] = { link = "Boolean" },
	["@number"] = { link = "Number" },
	["@float"] = { link = "Float" },
	["@function"] = { link = "Function" },
	["@function.call"] = { link = "Function" },
	["@function.builtin"] = { link = "Function" },
	["@function.macro"] = { link = "Macro" },
	["@method"] = { link = "Function" },
	["@method.call"] = { link = "Function" },
	["@constructor"] = { link = "Function" },
	["@constructor.lua"] = { link = "None" },
	["@parameter"] = { link = "Parameter" },
	["@keyword"] = { link = "Keyword" },
	["@keyword.function"] = { link = "Keyword" },
	["@keyword.return"] = { link = "Keyword" },
	["@conditional"] = { link = "Conditional" },
	["@repeat"] = { link = "Repeat" },
	["@debug"] = { link = "Debug" },
	["@label"] = { link = "Keyword" },
	["@include"] = { link = "Include" },
	["@exception"] = { link = "Exception" },
	["@type"] = { link = "Type" },
	["@type.Builtin"] = { link = "Type" },
	["@type.qualifier"] = { link = "Type" },
	["@type.definition"] = { link = "Typedef" },
	["@storageclass"] = { link = "StorageClass" },
	["@attribute"] = { link = "Label" },
	["@variable"] = { link = "Identifier" },
	["@variable.Builtin"] = { link = "Builtin" },
	["@constant"] = { link = "Constant" },
	["@constant.Builtin"] = { link = "Constant" },
	["@constant.macro"] = { link = "Macro" },
	["@namespace"] = { link = "Namespace" },
	["@string.special.symbol"] = { link = "Identifier" },
	["@text"] = { link = "String" },
	["@text.title"] = { link = "Title" },
	["@text.literal"] = { link = "String" },
	["@text.uri"] = { link = "htmlLink" },
	["@text.math"] = { link = "Special" },
	["@text.environment"] = { link = "Macro" },
	["@text.environment.name"] = { link = "Type" },
	["@text.reference"] = { link = "Constant" },
	["@text.todo"] = { link = "Todo" },
	["@text.todo.unchecked"] = { link = "Todo" },
	["@text.todo.checked"] = { link = "Done" },
	["@text.note"] = { link = "SpecialComment" },
	["@text.warning"] = { link = "WarningMsg" },
	["@text.danger"] = { link = "ErrorMsg" },
	["@text.diff.add"] = { link = "DiffAdded" },
	["@text.diff.delete"] = { link = "DiffRemoved" },
	["@tag"] = { link = "Tag" },
	["@tag.attribute"] = { link = "Identifier" },
	["@tag.delimiter"] = { link = "Delimiter" },
	["@text.strong"] = { bold = true },
	["@text.strike"] = { strikethrough = true },
	["@text.emphasis"] = {
		fg = palette.background,
		bg = palette.popout,
		bold = true,
	},
	["@text.underline"] = { underline = true },
	["@keyword.operator"] = { link = "Operator" },
	-- }}}2

	-- LSP semantic {{{2
	["@lsp.type.enum"] = { link = "Type" },
	["@lsp.type.type"] = { link = "Type" },
	["@lsp.type.class"] = { link = "Structure" },
	["@lsp.type.struct"] = { link = "Structure" },
	["@lsp.type.macro"] = { link = "Macro" },
	["@lsp.type.method"] = { link = "Function" },
	["@lsp.type.comment"] = { link = "Comment" },
	["@lsp.type.function"] = { link = "Function" },
	["@lsp.type.property"] = { link = "Field" },
	["@lsp.type.variable"] = { link = "Variable" },
	["@lsp.type.decorator"] = { link = "Label" },
	["@lsp.type.interface"] = { link = "Structure" },
	["@lsp.type.namespace"] = { link = "Namespace" },
	["@lsp.type.parameter"] = { link = "Parameter" },
	["@lsp.type.enumMember"] = { link = "Enum" },
	["@lsp.type.typeParameter"] = { link = "Parameter" },
	["@lsp.typemod.keyword.documentation"] = { link = "DocumentKeyword" },
	["@lsp.typemod.function.defaultLibrary"] = { link = "Function" },
	["@lsp.typemod.variable.defaultLibrary"] = { link = "Builtin" },
	["@lsp.typemod.variable.global"] = { link = "Identifier" },
	-- }}}2

	-- LSP {{{2
	LspReferenceText = { link = "Identifier" },
	LspReferenceRead = { link = "LspReferenceText" },
	LspReferenceWrite = { link = "LspReferenceText" },
	LspSignatureActiveParameter = { link = "IncSearch" },
	LspInfoBorder = { link = "FloatBorder" },
	LspInlayHint = { link = "DiagnosticVirtualTextHint" },
	-- }}}2

	-- Diagnostic {{{2
	DiagnosticOk = { fg = palette.faded },
	DiagnosticError = { fg = palette.critical },
	DiagnosticWarn = { fg = palette.popout },
	DiagnosticInfo = { fg = palette.salient },
	DiagnosticHint = { fg = palette.foreground },
	DiagnosticVirtualTextOk = { fg = palette.faded, bg = palette.highlight },
	DiagnosticVirtualTextError = {
		fg = palette.critical,
		bg = palette.highlight,
	},
	DiagnosticVirtualTextWarn = { fg = palette.popout, bg = palette.highlight },
	DiagnosticVirtualTextInfo = {
		fg = palette.salient,
		bg = palette.highlight,
	},
	DiagnosticVirtualTextHint = {
		fg = palette.foreground,
		bg = palette.highlight,
	},
	DiagnosticUnderlineOk = { underline = true, sp = palette.faded },
	DiagnosticUnderlineError = { undercurl = true, sp = palette.critical },
	DiagnosticUnderlineWarn = { undercurl = true, sp = palette.popout },
	DiagnosticUnderlineInfo = { undercurl = true, sp = palette.salient },
	DiagnosticUnderlineHint = { undercurl = true, sp = palette.subtle },
	DiagnosticFloatingOk = { link = "DiagnosticOk" },
	DiagnosticFloatingError = { link = "DiagnosticError" },
	DiagnosticFloatingWarn = { link = "DiagnosticWarn" },
	DiagnosticFloatingInfo = { link = "DiagnosticInfo" },
	DiagnosticFloatingHint = { link = "DiagnosticHint" },
	DiagnosticSignOk = { link = "DiagnosticOk" },
	DiagnosticSignError = { link = "DiagnosticError" },
	DiagnosticSignWarn = { link = "DiagnosticWarn" },
	DiagnosticSignInfo = { link = "DiagnosticInfo" },
	DiagnosticSignHint = { link = "DiagnosticHint" },
	DiagnosticSignOkCul = { link = "DiagnosticError" },
	DiagnosticSignErrorCul = { link = "DiagnosticError" },
	DiagnosticSignWarnCul = { link = "DiagnosticWarn" },
	DiagnosticSignInfoCul = { link = "DiagnosticInfo" },
	DiagnosticSignHintCul = { link = "DiagnosticHint" },
	-- }}}2

	-- Filetype {{{2
	-- HTML
	htmlArg = { fg = palette.foreground },
	htmlBold = { bold = true },
	htmlBoldItalic = { bold = true, italic = true },
	htmlTag = { fg = palette.foreground },
	htmlTagName = { link = "Tag" },
	htmlSpecialTagName = { fg = palette.strong },
	htmlEndTag = { fg = palette.strong },
	htmlH1 = { fg = palette.salient, bold = true },
	htmlH2 = { fg = palette.salient, bold = true },
	htmlH3 = { fg = palette.salient, bold = true },
	htmlH4 = { fg = palette.salient, bold = true },
	htmlH5 = { fg = palette.salient, bold = true },
	htmlH6 = { fg = palette.salient, bold = true },
	htmlItalic = { italic = true },
	htmlLink = { fg = palette.faded, underline = true },
	htmlSpecialChar = { link = "SpecialChar" },
	htmlTitle = { fg = palette.foreground },
	-- Json
	jsonKeyword = { link = "Keyword" },
	jsonBraces = { fg = palette.foreground },
	-- Markdown
	markdownBold = { bold = true },
	markdownBoldItalic = { bold = true, italic = true },
	markdownCode = { fg = palette.popout },
	markdownError = { link = "None" },
	markdownEscape = { link = "None" },
	markdownListMarker = { fg = palette.critical },
	markdownH1 = { link = "htmlH1" },
	markdownH2 = { link = "htmlH2" },
	markdownH3 = { link = "htmlH3" },
	markdownH4 = { link = "htmlH4" },
	markdownH5 = { link = "htmlH5" },
	markdownH6 = { link = "htmlH6" },
	-- Shell
	shDeref = { link = "Macro" },
	shDerefVar = { link = "Macro" },
	-- Git
	gitHash = { fg = palette.faded },
	-- Checkhealth
	helpHeader = { fg = palette.foreground, bold = true },
	helpSectionDelim = { fg = palette.faded, bold = true },
	helpCommand = { fg = palette.salient },
	helpBacktick = { fg = palette.salient },
	-- Man
	manBold = { fg = palette.faded, bold = true },
	manItalic = { fg = palette.salient, italic = true },
	manOptionDesc = { fg = palette.faded },
	manReference = { link = "htmlLink" },
	manSectionHeading = { link = "manBold" },
	manUnderline = { fg = palette.salient, italic = true },
	-- }}}2

	-- Plugins {{{2
	-- nvim-cmp
	CmpItemAbbrDeprecated = { strikethrough = true },
	CmpItemAbbrMatch = { fg = palette.salient },
	CmpItemAbbrMatchFuzzy = { link = "CmpItemAbbrMatch" },
	CmpItemKindText = { link = "String" },
	CmpItemKindMethod = { link = "Function" },
	CmpItemKindFunction = { link = "Function" },
	CmpItemKindConstructor = { link = "Function" },
	CmpItemKindField = { fg = palette.salient },
	CmpItemKindProperty = { link = "CmpItemKindField" },
	CmpItemKindVariable = { fg = palette.popout },
	CmpItemKindReference = { link = "CmpItemKindVariable" },
	CmpItemKindModule = { fg = palette.salient },
	CmpItemKindEnum = { fg = palette.faded },
	CmpItemKindEnumMember = { link = "CmpItemKindEnum" },
	CmpItemKindKeyword = { link = "Keyword" },
	CmpItemKindOperator = { link = "Operator" },
	CmpItemKindSnippet = { fg = palette.pine },
	CmpItemKindColor = { fg = palette.faded },
	CmpItemKindConstant = { link = "Constant" },
	CmpItemKindCopilot = { fg = palette.salient },
	CmpItemKindValue = { link = "Number" },
	CmpItemKindClass = { link = "Type" },
	CmpItemKindStruct = { link = "Type" },
	CmpItemKindEvent = { fg = palette.tea },
	CmpItemKindInterface = { fg = palette.subtle },
	CmpItemKindFile = { link = "DevIconDefault" },
	CmpItemKindFolder = { link = "Directory" },
	CmpItemKindUnit = { fg = palette.salient },
	CmpItemKind = { fg = palette.foreground },
	CmpItemMenu = { link = "Pmenu" },
	CmpVirtualText = { fg = palette.faint, italic = true },

	-- gitsigns
	GitSignsAdd = { fg = palette.tea },
	GitSignsAddInline = { fg = palette.pine },
	GitSignsAddLnInline = { fg = palette.pine },
	GitSignsAddPreview = { fg = palette.pine },
	GitSignsChange = { fg = palette.violet },
	GitSignsChangeInline = { fg = palette.violet },
	GitSignsChangeLnInline = { fg = palette.violet },
	GitSignsCurrentLineBlame = { fg = palette.violet },
	GitSignsDelete = { fg = palette.vermillion },
	GitSignsDeleteInline = { fg = palette.popout },
	GitSignsDeleteLnInline = { fg = palette.popout },
	GitSignsDeletePreview = { fg = palette.popout },
	GitSignsDeleteVirtLnInLine = { fg = palette.popout },
	GitSignsUntracked = { fg = palette.subtle },
	GitSignsUntrackedLn = { fg = palette.subtle },
	GitSignsUntrackedNr = { fg = palette.subtle },

	-- fugitive
	fugitiveHash = { link = "gitHash" },
	fugitiveHeader = { link = "Title" },
	fugitiveHeading = { fg = palette.critical, bold = true },
	fugitiveHelpTag = { fg = palette.critical },
	fugitiveSymbolicRef = { fg = palette.strong },
	fugitiveStagedModifier = { fg = palette.foreground, bold = true },
	fugitiveUnstagedModifier = { fg = palette.salient, bold = true },
	fugitiveUntrackedModifier = { fg = palette.faded, bold = true },
	fugitiveStagedHeading = { fg = palette.foreground, bold = true },
	fugitiveUnstagedHeading = { fg = palette.salient, bold = true },
	fugitiveUntrackedHeading = { fg = palette.faded, bold = true },
	DiffAdded = { fg = palette.pine },

	-- telescope
	TelescopeNormal = { fg = palette.faded, bg = palette.background },
	TelescopePromptNormal = { bg = palette.background },
	TelescopeTitle = { fg = palette.subtle, bg = palette.faded, bold = true },
	TelescopeBorder = { fg = palette.foreground, bg = palette.background },
	TelescopePromptBorder = { fg = palette.foreground, bg = palette.background },
	TelescopePreviewLine = { bg = palette.shaded },
	TelescopePreviewMatch = { fg = palette.salient, bold = true },
	TelescopeMatching = { fg = palette.salient, bold = true },
	TelescopePromptCounter = { link = "Comment" },
	TelescopePromptPrefix = { fg = palette.critical },
	TelescopeSelection = { bg = palette.shaded },
	TelescopeMultiSelection = { bg = palette.shaded, bold = true },
	TelescopeSelectionCaret = { fg = palette.critical, bg = palette.shaded },

	-- fidget
	FidgetTask = { fg = palette.faded },
	FidgetTitle = { fg = palette.faded, bold = true },

	-- nvim-dap-ui
	DapUIBreakpointsCurrentLine = { link = "CursorLineNr" },
	DapUIBreakpointsInfo = { fg = palette.faded },
	DapUIBreakpointsPath = { link = "Directory" },
	DapUICurrentFrameName = { fg = palette.faded, bold = true },
	DapUIDecoration = { fg = palette.strong },
	DapUIFloatBorder = { link = "FloatBorder" },
	DapUILineNumber = { link = "LineNr" },
	DapUIModifiedValue = { fg = palette.salient, bold = true },
	DapUINormalFloat = { link = "NormalFloat" },
	DapUIPlayPause = { fg = palette.faded },
	DapUIPlayPauseNC = { fg = palette.faded },
	DapUIRestart = { fg = palette.faded },
	DapUIRestartNC = { fg = palette.faded },
	DapUIScope = { fg = palette.critical },
	DapUISource = { link = "Directory" },
	DapUIStepBack = { fg = palette.salient },
	DapUIStepBackRC = { fg = palette.salient },
	DapUIStepInto = { fg = palette.salient },
	DapUIStepIntoRC = { fg = palette.salient },
	DapUIStepOut = { fg = palette.salient },
	DapUIStepOutRC = { fg = palette.salient },
	DapUIStepOver = { fg = palette.salient },
	DapUIStepOverRC = { fg = palette.salient },
	DapUIStop = { fg = palette.popout },
	DapUIStopNC = { fg = palette.popout },
	DapUIStoppedThread = { fg = palette.faded },
	DapUIThread = { fg = palette.foreground },
	DapUIType = { link = "Type" },
	DapUIValue = { link = "Number" },
	DapUIVariable = { link = "Identifier" },
	DapUIWatchesEmpty = { link = "Comment" },
	DapUIWatchesError = { link = "Error" },
	DapUIWatchesValue = { fg = palette.critical },

	-- vimtex
	texArg = { fg = palette.foreground },
	texArgNew = { fg = palette.salient },
	texCmd = { fg = palette.strong },
	texCmdBib = { link = "texCmd" },
	texCmdClass = { link = "texCmd" },
	texCmdDef = { link = "texCmd" },
	texCmdE3 = { link = "texCmd" },
	texCmdEnv = { link = "texCmd" },
	texCmdEnvM = { link = "texCmd" },
	texCmdError = { link = "ErrorMsg" },
	texCmdFatal = { link = "ErrorMsg" },
	texCmdGreek = { link = "texCmd" },
	texCmdInput = { link = "texCmd" },
	texCmdItem = { link = "texCmd" },
	texCmdLet = { link = "texCmd" },
	texCmdMath = { link = "texCmd" },
	texCmdNew = { link = "texCmd" },
	texCmdPart = { link = "texCmd" },
	texCmdRef = { link = "texCmd" },
	texCmdSize = { link = "texCmd" },
	texCmdStyle = { link = "texCmd" },
	texCmdTitle = { link = "texCmd" },
	texCmdTodo = { link = "texCmd" },
	texCmdType = { link = "texCmd" },
	texCmdVerb = { link = "texCmd" },
	texComment = { link = "Comment" },
	texDefParm = { link = "Keyword" },
	texDelim = { fg = palette.foreground },
	texE3Cmd = { link = "texCmd" },
	texE3Delim = { link = "texDelim" },
	texE3Opt = { link = "texOpt" },
	texE3Parm = { link = "texParm" },
	texE3Type = { link = "texCmd" },
	texEnvOpt = { link = "texOpt" },
	texError = { link = "ErrorMsg" },
	texFileArg = { link = "Directory" },
	texFileOpt = { link = "texOpt" },
	texFilesArg = { link = "texFileArg" },
	texFilesOpt = { link = "texFileOpt" },
	texLength = { fg = palette.salient },
	texLigature = { fg = palette.foreground },
	texOpt = { fg = palette.foreground },
	texOptEqual = { fg = palette.critical },
	texOptSep = { fg = palette.critical },
	texParm = { fg = palette.foreground },
	texRefArg = { fg = palette.salient },
	texRefOpt = { link = "texOpt" },
	texSymbol = { fg = palette.critical },
	texTitleArg = { link = "Title" },
	texVerbZone = { fg = palette.foreground },
	texZone = { fg = palette.aqupigeon },
	texMathArg = { fg = palette.foreground },
	texMathCmd = { link = "texCmd" },
	texMathSub = { fg = palette.foreground },
	texMathOper = { fg = palette.critical },
	texMathZone = { fg = palette.strong },
	texMathDelim = { fg = palette.foreground },
	texMathError = { link = "Error" },
	texMathGroup = { fg = palette.foreground },
	texMathSuper = { fg = palette.foreground },
	texMathSymbol = { fg = palette.strong },
	texMathZoneLD = { fg = palette.foreground },
	texMathZoneLI = { fg = palette.foreground },
	texMathZoneTD = { fg = palette.foreground },
	texMathZoneTI = { fg = palette.foreground },
	texMathCmdText = { link = "texCmd" },
	texMathZoneEnv = { fg = palette.foreground },
	texMathArrayArg = { fg = palette.strong },
	texMathCmdStyle = { link = "texCmd" },
	texMathDelimMod = { fg = palette.foreground },
	texMathSuperSub = { fg = palette.foreground },
	texMathDelimZone = { fg = palette.foreground },
	texMathStyleBold = { fg = palette.foreground, bold = true },
	texMathStyleItal = { fg = palette.foreground, italic = true },
	texMathEnvArgName = { fg = palette.salient },
	texMathErrorDelim = { link = "Error" },
	texMathDelimZoneLD = { fg = palette.faded },
	texMathDelimZoneLI = { fg = palette.faded },
	texMathDelimZoneTD = { fg = palette.faded },
	texMathDelimZoneTI = { fg = palette.faded },
	texMathZoneEnsured = { fg = palette.foreground },
	texMathCmdStyleBold = { fg = palette.strong, bold = true },
	texMathCmdStyleItal = { fg = palette.strong, italic = true },
	texMathStyleConcArg = { fg = palette.foreground },
	texMathZoneEnvStarred = { fg = palette.foreground },

	-- lazy.nvim
	LazyDir = { link = "Directory" },
	LazyUrl = { link = "htmlLink" },
	LazySpecial = { link = "Special" },
	LazyCommit = { fg = palette.faded },
	LazyReasonFt = { fg = palette.salient },
	LazyReasonCmd = { fg = palette.salient },
	LazyReasonPlugin = { fg = palette.salient },
	LazyReasonSource = { fg = palette.salient },
	LazyReasonRuntime = { fg = palette.salient },
	LazyReasonEvent = { fg = palette.salient },
	LazyReasonKeys = { fg = palette.faded },
	LazyButton = { bg = palette.subtle },
	LazyButtonActive = { bg = palette.shaded, bold = true },
	LazyH1 = { fg = palette.subtle, bg = palette.faint, bold = true },

	-- copilot.lua
	CopilotSuggestion = { fg = palette.faint, italic = true },
	CopilotAnnotation = { fg = palette.faint, italic = true },

	-- statusline
	StatusLineDiagnosticError = { fg = palette.critical, bg = palette.subtle },
	StatusLineDiagnosticHint = { fg = palette.foreground, bg = palette.subtle },
	StatusLineDiagnosticInfo = { fg = palette.salient, bg = palette.subtle },
	StatusLineDiagnosticWarn = { fg = palette.popout, bg = palette.subtle },
	StatusLineFaded = { fg = palette.faded, bg = palette.subtle },
	StatusLineGitAdded = { fg = palette.pine, bg = palette.subtle },
	StatusLineGitChanged = { fg = palette.faded, bg = palette.subtle },
	StatusLineGitRemoved = { fg = palette.popout, bg = palette.subtle },
	StatusLineHeader = { fg = palette.background, bg = palette.faded },
	StatusLineHeaderModified = { fg = palette.background, bg = palette.popout },
	StatusLineStrong = { fg = palette.strong, bg = palette.subtle, bold = true },

	-- winbar
	WinBarIconUIIndicator = { fg = palette.salient },
	WinBarMenuNormalFloat = { fg = palette.foreground, bg = palette.highlight },
	WinBarMenuHoverIcon = { fg = palette.salient, bg = palette.faint },
	WinBarMenuHoverEntry = { fg = palette.foreground, bg = palette.subtle },
	WinBarMenuCurrentContext = { fg = palette.foreground, bg = palette.subtle },

	-- glance.nvim
	GlanceBorderTop = { link = "WinSeparator" },
	GlancePreviewBorderBottom = { link = "GlanceBorderTop" },
	GlanceListBorderBottom = { link = "GlanceBorderTop" },
	GlanceFoldIcon = { link = "Comment" },
	GlanceListCount = { fg = palette.background, bg = palette.faint },
	GlanceListCursorLine = { bg = palette.shaded },
	GlanceListNormal = { link = "NormalFloat" },
	GlanceListMatch = { bg = palette.shaded, bold = true },
	GlancePreviewNormal = { link = "Pmenu" },
	GlancePreviewMatch = { bg = palette.shaded },
	GlanceWinBarFilename = {
		fg = palette.faded,
		bg = palette.subtle,
		bold = true,
	},
	GlanceWinBarFilepath = { fg = palette.faded, bg = palette.subtle },
	GlanceWinBarTitle = {
		fg = palette.faded,
		bg = palette.subtle,
		bold = true,
	},
	-- }}}2
}
-- }}}1

-- Highlight group overrides {{{1
local hlgroup_override_variants = {
	dark = {
		String = { fg = palette.popout },
		CmpItemAbbrMatch = { fg = palette.critical },
		TelescopePreviewMatch = { fg = palette.critical, bold = true },
		TelescopeMatching = { fg = palette.critical, bold = true },
	},
	light = {},
}
local hlgroup_overrides = hlgroup_override_variants[vim.go.bg]
-- }}}1

-- Set highlight groups {{{1
vim.cmd.hi("clear")
for termcolor, hex in pairs(termcolors) do
	vim.g[termcolor] = hex
end
for hlgroup_name, hlgroup_attr in pairs(hlgroups) do
	vim.api.nvim_set_hl(0, hlgroup_name, hlgroup_attr)
end
for hlgroup_name, hlgroup_attr in pairs(hlgroup_overrides) do
	vim.api.nvim_set_hl(0, hlgroup_name, hlgroup_attr)
end
vim.g.colors_name = "macchiato"
-- }}}1

-- vim:ts=2:sw=2:sts=2:fdm=marker:fdl=0
