-- Made with 'mini.colors' module of https://github.com/echasnovski/mini.nvim

if vim.g.colors_name ~= nil then
	vim.cmd("highlight clear")
end
vim.g.colors_name = "mini-jellybeans-nvim"

-- Highlight groups
local hi = vim.api.nvim_set_hl

hi(0, "@namespace", { fg = "#f09ebf" })
hi(0, "@string.special.symbol", { fg = "#7697d6" })
hi(0, "@tag.delimiter", { fg = "#556677" })
hi(0, "@text.emphasis", { link = "Italic" })
hi(0, "@text.strike", { strikethrough = true })
hi(0, "@text.todo.checked.markdown", { fg = "#9aae6b" })
hi(0, "@text.todo.unchecked.markdown", { fg = "#cf694a" })
hi(0, "@text.underline", { link = "Underlined" })
hi(0, "@text.uri", { fg = "#8fbedc" })
hi(0, "@variable", { link = "Normal" })
hi(0, "Bold", { bold = true })
hi(0, "BufferLineBackground", { bg = "#0f0f0f", fg = "#878787" })
hi(0, "BufferLineBuffer", { bg = "#0f0f0f", fg = "#878787" })
hi(0, "BufferLineBufferSelected", { bg = "#141414", bold = true, fg = "#e8e8d4", italic = true })
hi(0, "BufferLineBufferVisible", { bg = "#121212", fg = "#878787" })
hi(0, "BufferLineCloseButton", { bg = "#0f0f0f", fg = "#878787" })
hi(0, "BufferLineCloseButtonSelected", { bg = "#141414", fg = "#e8e8d4" })
hi(0, "BufferLineCloseButtonVisible", { bg = "#121212", fg = "#878787" })
hi(0, "BufferLineDiagnostic", { bg = "#0f0f0f", fg = "#656565" })
hi(0, "BufferLineDiagnosticSelected", { bg = "#141414", bold = true, fg = "#aeae9f", italic = true })
hi(0, "BufferLineDiagnosticVisible", { bg = "#121212", fg = "#656565" })
hi(0, "BufferLineDuplicate", { bg = "#0f0f0f", fg = "#808080", italic = true })
hi(0, "BufferLineDuplicateSelected", { bg = "#141414", fg = "#808080", italic = true })
hi(0, "BufferLineDuplicateVisible", { bg = "#121212", fg = "#808080", italic = true })
hi(0, "BufferLineError", { bg = "#0f0f0f", fg = "#878787", sp = "#ffc0b9" })
hi(0, "BufferLineErrorDiagnostic", { bg = "#0f0f0f", fg = "#656565", sp = "#bf908a" })
hi(
	0,
	"BufferLineErrorDiagnosticSelected",
	{ bg = "#141414", bold = true, fg = "#bf908a", italic = true, sp = "#bf908a" }
)
hi(0, "BufferLineErrorDiagnosticVisible", { bg = "#121212", fg = "#656565" })
hi(0, "BufferLineErrorSelected", { bg = "#141414", bold = true, fg = "#ffc0b9", italic = true, sp = "#ffc0b9" })
hi(0, "BufferLineErrorVisible", { bg = "#121212", fg = "#878787" })
hi(0, "BufferLineFill", { bg = "#0b0b0b", fg = "#878787" })
hi(0, "BufferLineGroupLabel", { bg = "#878787", fg = "#0b0b0b" })
hi(0, "BufferLineGroupSeparator", { bg = "#0b0b0b", fg = "#878787" })
hi(0, "BufferLineHint", { bg = "#0f0f0f", fg = "#878787", sp = "#a6dbff" })
hi(0, "BufferLineHintDiagnostic", { bg = "#0f0f0f", fg = "#656565", sp = "#7ca4bf" })
hi(
	0,
	"BufferLineHintDiagnosticSelected",
	{ bg = "#141414", bold = true, fg = "#7ca4bf", italic = true, sp = "#7ca4bf" }
)
hi(0, "BufferLineHintDiagnosticVisible", { bg = "#121212", fg = "#656565" })
hi(0, "BufferLineHintSelected", { bg = "#141414", bold = true, fg = "#a6dbff", italic = true, sp = "#a6dbff" })
hi(0, "BufferLineHintVisible", { bg = "#121212", fg = "#878787" })
hi(0, "BufferLineIndicatorSelected", { bg = "#141414", fg = "#000000" })
hi(0, "BufferLineIndicatorVisible", { bg = "#121212", fg = "#121212" })
hi(0, "BufferLineInfo", { bg = "#0f0f0f", fg = "#878787", sp = "#8cf8f7" })
hi(0, "BufferLineInfoDiagnostic", { bg = "#0f0f0f", fg = "#656565", sp = "#69bab9" })
hi(
	0,
	"BufferLineInfoDiagnosticSelected",
	{ bg = "#141414", bold = true, fg = "#69bab9", italic = true, sp = "#69bab9" }
)
hi(0, "BufferLineInfoDiagnosticVisible", { bg = "#121212", fg = "#656565" })
hi(0, "BufferLineInfoSelected", { bg = "#141414", bold = true, fg = "#8cf8f7", italic = true, sp = "#8cf8f7" })
hi(0, "BufferLineInfoVisible", { bg = "#121212", fg = "#878787" })
hi(0, "BufferLineMiniIconsAzure", { bg = "#0f0f0f", fg = "#facf7a" })
hi(0, "BufferLineMiniIconsAzureInactive", { bg = "#121212", fg = "#facf7a" })
hi(0, "BufferLineMiniIconsAzureSelected", { bg = "#141414", fg = "#facf7a" })
hi(0, "BufferLineModified", { bg = "#0f0f0f", fg = "#9aae6b" })
hi(0, "BufferLineModifiedSelected", { bg = "#141414", fg = "#9aae6b" })
hi(0, "BufferLineModifiedVisible", { bg = "#121212", fg = "#9aae6b" })
hi(0, "BufferLineNumbers", { bg = "#0f0f0f", fg = "#878787" })
hi(0, "BufferLineNumbersSelected", { bg = "#141414", bold = true, fg = "#e8e8d4", italic = true })
hi(0, "BufferLineNumbersVisible", { bg = "#121212", fg = "#878787" })
hi(0, "BufferLineOffsetSeparator", { bg = "#0b0b0b", fg = "#413d42" })
hi(0, "BufferLinePick", { bg = "#0f0f0f", bold = true, fg = "#ffc0b9", italic = true })
hi(0, "BufferLinePickSelected", { bg = "#141414", bold = true, fg = "#ffc0b9", italic = true })
hi(0, "BufferLinePickVisible", { bg = "#121212", bold = true, fg = "#ffc0b9", italic = true })
hi(0, "BufferLineSeparator", { bg = "#0f0f0f", fg = "#0b0b0b" })
hi(0, "BufferLineSeparatorSelected", { bg = "#141414", fg = "#0b0b0b" })
hi(0, "BufferLineSeparatorVisible", { bg = "#121212", fg = "#0b0b0b" })
hi(0, "BufferLineTab", { bg = "#0f0f0f", fg = "#878787" })
hi(0, "BufferLineTabClose", { bg = "#0f0f0f", fg = "#878787" })
hi(0, "BufferLineTabSelected", { bg = "#141414", fg = "#000000" })
hi(0, "BufferLineTabSeparator", { bg = "#0f0f0f", fg = "#0b0b0b" })
hi(0, "BufferLineTabSeparatorSelected", { bg = "#141414", fg = "#0b0b0b" })
hi(0, "BufferLineTruncMarker", { bg = "#0b0b0b", fg = "#878787" })
hi(0, "BufferLineWarning", { bg = "#0f0f0f", fg = "#878787", sp = "#fce094" })
hi(0, "BufferLineWarningDiagnostic", { bg = "#0f0f0f", fg = "#656565", sp = "#bda86f" })
hi(
	0,
	"BufferLineWarningDiagnosticSelected",
	{ bg = "#141414", bold = true, fg = "#bda86f", italic = true, sp = "#bda86f" }
)
hi(0, "BufferLineWarningDiagnosticVisible", { bg = "#121212", fg = "#656565" })
hi(0, "BufferLineWarningSelected", { bg = "#141414", bold = true, fg = "#fce094", italic = true, sp = "#fce094" })
hi(0, "BufferLineWarningVisible", { bg = "#121212", fg = "#878787" })
hi(0, "ChatGPTCompletion", { fg = "#9399b2", italic = true })
hi(0, "ChatGPTMessageAction", { bg = "#1d4c61", fg = "#ffffff", italic = true })
hi(0, "ChatGPTQuestion", { fg = "#b4befe", italic = true })
hi(0, "ChatGPTTotalTokens", { bg = "#444444", fg = "#ffffff" })
hi(0, "ChatGPTTotalTokensBorder", { fg = "#444444" })
hi(0, "ChatGPTWelcome", { fg = "#9399b2", italic = true })
hi(0, "CmpItemAbbrDefault", { fg = "#ffffff" })
hi(0, "CmpItemAbbrDeprecatedDefault", { fg = "#878787" })
hi(0, "CmpItemAbbrMatchDefault", { fg = "#ffffff" })
hi(0, "CmpItemAbbrMatchFuzzyDefault", { fg = "#ffffff" })
hi(0, "CmpItemKindClassDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindColorDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindConstantDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindConstructorDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindDefault", { fg = "#8bc1aa" })
hi(0, "CmpItemKindEnumDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindEnumMemberDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindEventDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindFieldDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindFileDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindFolderDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindFunctionDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindInterfaceDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindKeywordDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindMethodDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindModuleDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindOperatorDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindPropertyDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindReferenceDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindSnippetDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindStructDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindTextDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindTypeParameterDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindUnitDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindValueDefault", { link = "CmpItemKind" })
hi(0, "CmpItemKindVariableDefault", { link = "CmpItemKind" })
hi(0, "CmpItemMenuDefault", { fg = "#ffffff" })
hi(0, "ColorColumn", { bg = "#000000" })
hi(0, "Comment", { fg = "#878787" })
hi(0, "Conceal", { fg = "#8fbedc" })
hi(0, "Constant", { fg = "#cf694a" })
hi(0, "Cursor", { bg = "#b2d1f0", fg = "#141414" })
hi(0, "CursorColumn", { bg = "#1c1c1c" })
hi(0, "CursorLine", { bg = "#1c1c1c" })
hi(0, "CursorLineNr", { link = "String" })
hi(0, "Delimiter", { fg = "#668799" })
hi(0, "DiffAdd", { bg = "#437119", fg = "#d1ebbd" })
hi(0, "DiffChange", { bg = "#2b5c78" })
hi(0, "DiffDelete", { bg = "#70008a", fg = "#42000a" })
hi(0, "DiffText", { bg = "#000000", fg = "#8fbedc" })
hi(0, "Directory", { fg = "#dad086" })
hi(0, "DressingSelectIdx", { link = "Special" })
hi(0, "Error", { bg = "#922020" })
hi(0, "ErrorMsg", { bg = "#922020" })
hi(0, "FoldColumn", { bg = "#1f1f1f", fg = "#535c65" })
hi(0, "Folded", { bg = "#374048", fg = "#a0a8b0" })
hi(0, "Function", { fg = "#facf7a" })
hi(0, "GitSignsAdd", { fg = "#70b950" })
hi(0, "GitSignsChange", { fg = "#ffba66" })
hi(0, "GitSignsDelete", { fg = "#c92c2c" })
hi(0, "GitSignsStagedAdd", { fg = "#385c28" })
hi(0, "GitSignsStagedAddCul", { fg = "#385c28" })
hi(0, "GitSignsStagedAddLn", { bg = "#437119", fg = "#68755e" })
hi(0, "GitSignsStagedAddNr", { fg = "#385c28" })
hi(0, "GitSignsStagedChange", { fg = "#7f5d33" })
hi(0, "GitSignsStagedChangeCul", { fg = "#7f5d33" })
hi(0, "GitSignsStagedChangeLn", { bg = "#2b5c78" })
hi(0, "GitSignsStagedChangeNr", { fg = "#7f5d33" })
hi(0, "GitSignsStagedChangedelete", { fg = "#7f5d33" })
hi(0, "GitSignsStagedChangedeleteCul", { fg = "#7f5d33" })
hi(0, "GitSignsStagedChangedeleteLn", { bg = "#2b5c78" })
hi(0, "GitSignsStagedChangedeleteNr", { fg = "#7f5d33" })
hi(0, "GitSignsStagedDelete", { fg = "#641616" })
hi(0, "GitSignsStagedDeleteCul", { fg = "#641616" })
hi(0, "GitSignsStagedDeleteNr", { fg = "#641616" })
hi(0, "GitSignsStagedTopdelete", { fg = "#641616" })
hi(0, "GitSignsStagedTopdeleteCul", { fg = "#641616" })
hi(0, "GitSignsStagedTopdeleteNr", { fg = "#641616" })
hi(0, "HydraAmaranth", { bold = true, fg = "#ff1757" })
hi(0, "HydraBlue", { bold = true, fg = "#5ebcf6" })
hi(0, "HydraPink", { bold = true, fg = "#ff55de" })
hi(0, "HydraRed", { bold = true, fg = "#ff5733" })
hi(0, "HydraTeal", { bold = true, fg = "#00a1a1" })
hi(0, "Identifier", { fg = "#c5b5ee" })
hi(0, "Include", { fg = "#8297c0", italic = true })
hi(0, "Italic", { italic = true })
hi(0, "LineNr", { fg = "#5f5958" })
hi(0, "LspDiagnosticsDefaultError", { fg = "#c92c2c" })
hi(0, "LspDiagnosticsDefaultHint", { fg = "#d1ebbd" })
hi(0, "LspDiagnosticsDefaultInformation", { fg = "#b2d1f0" })
hi(0, "LspDiagnosticsDefaultWarning", { fg = "#ffba66" })
hi(0, "LspDiagnosticsUnderlineError", { sp = "#c92c2c", undercurl = true })
hi(0, "LspDiagnosticsUnderlineHint", { sp = "#d1ebbd", undercurl = true })
hi(0, "LspDiagnosticsUnderlineInformation", { sp = "#b2d1f0", undercurl = true })
hi(0, "LspDiagnosticsUnderlineWarning", { sp = "#ffba66", undercurl = true })
hi(0, "LspDiagnosticsVirtualTextError", { bg = "#2a0909", fg = "#c92c2c" })
hi(0, "LspDiagnosticsVirtualTextHint", { bg = "#131f0a", fg = "#d1ebbd" })
hi(0, "LspDiagnosticsVirtualTextInformation", { bg = "#091c2f", fg = "#b2d1f0" })
hi(0, "LspDiagnosticsVirtualTextWarning", { bg = "#291600", fg = "#ffba66" })
hi(0, "LspReferenceRead", { bg = "#262626" })
hi(0, "LspReferenceText", { bg = "#262626" })
hi(0, "LspReferenceWrite", { bg = "#262626" })
hi(0, "MatchParen", { bold = true, fg = "#f09ebf" })
hi(0, "MoreMsg", { fg = "#7a9e6b" })
hi(0, "MultiCursor", { bg = "#161714", fg = "#dbec6b" })
hi(0, "MultiCursorMain", { bg = "#161714", bold = true, fg = "#d6f31f" })
hi(0, "NeotestAdapterName", { ctermfg = 9, fg = "#f70067" })
hi(0, "NeotestDir", { ctermfg = 14, fg = "#00f1f5" })
hi(0, "NeotestExpandMarker", { ctermfg = 248, fg = "#8094b4" })
hi(0, "NeotestFailed", { ctermfg = 9, fg = "#f70067" })
hi(0, "NeotestFile", { ctermfg = 14, fg = "#00f1f5" })
hi(0, "NeotestFocused", { bold = true, underline = true })
hi(0, "NeotestIndent", { ctermfg = 248, fg = "#8b8b8b" })
hi(0, "NeotestMarked", { bold = true, ctermfg = 130, fg = "#f79000" })
hi(0, "NeotestNamespace", { ctermfg = 13, fg = "#d484ff" })
hi(0, "NeotestPassed", { ctermfg = 10, fg = "#96f291" })
hi(0, "NeotestRunning", { ctermfg = 11, fg = "#ffec63" })
hi(0, "NeotestSkipped", { ctermfg = 14, fg = "#00f1f5" })
hi(0, "NeotestTarget", { ctermfg = 9, fg = "#f70067" })
hi(0, "NeotestWatching", { ctermfg = 11, fg = "#ffec63" })
hi(0, "NeotestWinSelect", { bold = true, ctermfg = 14, fg = "#00f1f5" })
hi(0, "NoiceAttr10", { fg = "#8cf8f7" })
hi(0, "NoiceAttr100", { fg = "#787878" })
hi(0, "NoiceAttr101", { bg = "#1f1f1f", fg = "#535c65" })
hi(0, "NoiceAttr102", { bg = "#374048", fg = "#a0a8b0" })
hi(0, "NoiceAttr103", { bg = "#000000", fg = "#8fbedc" })
hi(0, "NoiceAttr104", { bg = "#70008a", fg = "#42000a" })
hi(0, "NoiceAttr105", { bg = "#2b5c78" })
hi(0, "NoiceAttr106", { bg = "#437119", fg = "#d1ebbd" })
hi(0, "NoiceAttr107", { fg = "#dad086" })
hi(0, "NoiceAttr108", { bg = "#1c1c1c" })
hi(0, "NoiceAttr109", { bg = "#b2d1f0", fg = "#141414" })
hi(0, "NoiceAttr110", { bg = "#000000" })
hi(0, "NoiceAttr111", { fg = "#cf694a" })
hi(0, "NoiceAttr112", { fg = "#9aae6b" })
hi(0, "NoiceAttr113", { fg = "#facf7a" })
hi(0, "NoiceAttr114", { fg = "#7a9e6b" })
hi(0, "NoiceAttr115", { fg = "#5f5958" })
hi(0, "NoiceAttr116", { bg = "#1c1c1c", fg = "#c7c7c7" })
hi(0, "NoiceAttr117", { bg = "#2a0909", fg = "#c92c2c" })
hi(0, "NoiceAttr118", { bg = "#291600", fg = "#ffba66" })
hi(0, "NoiceAttr119", { bg = "#131f0a", fg = "#d1ebbd" })
hi(0, "NoiceAttr120", { sp = "#d1ebbd", undercurl = true })
hi(0, "NoiceAttr121", { fg = "#556677" })
hi(0, "NoiceAttr122", { fg = "#ff0000" })
hi(0, "NoiceAttr123", { fg = "#7697d6" })
hi(0, "NoiceAttr124", { fg = "#ffffff" })
hi(0, "NoiceAttr125", { bg = "#131313", fg = "#131313" })
hi(0, "NoiceAttr128", { fg = "#96f291" })
hi(0, "NoiceAttr129", { fg = "#f70067" })
hi(0, "NoiceAttr13", { bg = "#fce094", fg = "#07080d" })
hi(0, "NoiceAttr130", { fg = "#ffec63" })
hi(0, "NoiceAttr131", { fg = "#00f1f5" })
hi(0, "NoiceAttr132", { fg = "#d484ff" })
hi(0, "NoiceAttr133", { bold = true, underline = true })
hi(0, "NoiceAttr134", { fg = "#8b8b8b" })
hi(0, "NoiceAttr135", { fg = "#8094b4" })
hi(0, "NoiceAttr136", { bold = true, fg = "#00f1f5" })
hi(0, "NoiceAttr137", { bold = true, fg = "#f79000" })
hi(0, "NoiceAttr138", { fg = "#b4befe", italic = true })
hi(0, "NoiceAttr139", { fg = "#9399b2", italic = true })
hi(0, "NoiceAttr140", { bg = "#444444", fg = "#ffffff" })
hi(0, "NoiceAttr141", { fg = "#444444" })
hi(0, "NoiceAttr142", { bg = "#1d4c61", fg = "#ffffff", italic = true })
hi(0, "NoiceAttr143", { bg = "#1e1e1e", fg = "#ffffe9" })
hi(0, "NoiceAttr144", { bg = "#e37351", bold = true, fg = "#161616" })
hi(0, "NoiceAttr145", { bg = "#161616", fg = "#e37351" })
hi(0, "NoiceAttr146", { bg = "#8fa6d3", bold = true, fg = "#161616" })
hi(0, "NoiceAttr147", { bg = "#161616", fg = "#8fa6d3" })
hi(0, "NoiceAttr148", { bg = "#98d4bb", bold = true, fg = "#161616" })
hi(0, "NoiceAttr149", { bg = "#161616", fg = "#98d4bb" })
hi(0, "NoiceAttr150", { bg = "#a9bf75", bold = true, fg = "#161616" })
hi(0, "NoiceAttr151", { bg = "#161616", fg = "#a9bf75" })
hi(0, "NoiceAttr152", { bg = "#d8c7ff", bold = true, fg = "#161616" })
hi(0, "NoiceAttr153", { bg = "#161616", fg = "#d8c7ff" })
hi(0, "NoiceAttr154", { bg = "#1e1e1e", fg = "#ffc0b9" })
hi(0, "NoiceAttr155", { bg = "#1e1e1e", fg = "#fce094" })
hi(0, "NoiceAttr156", { bg = "#1e1e1e", fg = "#8cf8f7" })
hi(0, "NoiceAttr157", { bg = "#1e1e1e", fg = "#a6dbff" })
hi(0, "NoiceAttr158", { bg = "#1e1e1e", fg = "#70b950" })
hi(0, "NoiceAttr159", { bg = "#1e1e1e", fg = "#ffba66" })
hi(0, "NoiceAttr160", { bg = "#1e1e1e", fg = "#c92c2c" })
hi(0, "NoiceAttr161", { fg = "#8a1f1f" })
hi(0, "NoiceAttr162", { fg = "#79491d" })
hi(0, "NoiceAttr163", { fg = "#4f6752" })
hi(0, "NoiceAttr164", { fg = "#8b8b8b" })
hi(0, "NoiceAttr165", { fg = "#4f3552" })
hi(0, "NoiceAttr166", { fg = "#f70067" })
hi(0, "NoiceAttr167", { fg = "#f79000" })
hi(0, "NoiceAttr168", { fg = "#a9ff68" })
hi(0, "NoiceAttr169", { fg = "#d484ff" })
hi(0, "NoiceAttr170", { bold = true, fg = "#ff5733" })
hi(0, "NoiceAttr171", { bold = true, fg = "#5ebcf6" })
hi(0, "NoiceAttr172", { bold = true, fg = "#ff1757" })
hi(0, "NoiceAttr173", { bold = true, fg = "#00a1a1" })
hi(0, "NoiceAttr174", { bold = true, fg = "#ff55de" })
hi(0, "NoiceAttr175", { bg = "#161714", fg = "#dbec6b" })
hi(0, "NoiceAttr176", { bg = "#161714", bold = true, fg = "#d6f31f" })
hi(0, "NoiceAttr177", { bg = "#312129", fg = "#f09ebf" })
hi(0, "NoiceAttr179", { bg = "#141414", bold = true, fg = "#8cf8f7", italic = true, sp = "#8cf8f7" })
hi(0, "NoiceAttr180", { bg = "#121212", fg = "#878787" })
hi(0, "NoiceAttr181", { bg = "#0f0f0f", fg = "#878787", sp = "#a6dbff" })
hi(0, "NoiceAttr182", { bg = "#121212", fg = "#656565" })
hi(0, "NoiceAttr183", { bg = "#0f0f0f", fg = "#656565", sp = "#7ca4bf" })
hi(0, "NoiceAttr184", { bg = "#141414", bold = true, fg = "#a6dbff", italic = true, sp = "#a6dbff" })
hi(0, "NoiceAttr185", { bg = "#141414", bold = true, fg = "#aeae9f", italic = true })
hi(0, "NoiceAttr186", { bg = "#141414", bold = true, fg = "#e8e8d4", italic = true })
hi(0, "NoiceAttr187", { bg = "#0f0f0f", fg = "#878787" })
hi(0, "NoiceAttr188", { bg = "#141414", fg = "#e8e8d4" })
hi(0, "NoiceAttr189", { bg = "#141414", fg = "#000000" })
hi(0, "NoiceAttr19", { fg = "#ffc0b9" })
hi(0, "NoiceAttr190", { bg = "#878787", fg = "#0b0b0b" })
hi(0, "NoiceAttr191", { bg = "#0b0b0b", fg = "#878787" })
hi(0, "NoiceAttr192", { bg = "#141414", bold = true, fg = "#69bab9", italic = true, sp = "#69bab9" })
hi(0, "NoiceAttr193", { bg = "#141414", bold = true, fg = "#fce094", italic = true, sp = "#fce094" })
hi(0, "NoiceAttr194", { bg = "#0f0f0f", fg = "#656565", sp = "#bda86f" })
hi(0, "NoiceAttr195", { bg = "#0f0f0f", bold = true, fg = "#ffc0b9", italic = true })
hi(0, "NoiceAttr196", { bg = "#121212", fg = "#0b0b0b" })
hi(0, "NoiceAttr197", { bg = "#141414", fg = "#0b0b0b" })
hi(0, "NoiceAttr198", { bg = "#0f0f0f", fg = "#656565" })
hi(0, "NoiceAttr199", { bg = "#141414", fg = "#808080", italic = true })
hi(0, "NoiceAttr2", { bold = true })
hi(0, "NoiceAttr20", { bg = "#4f5258" })
hi(0, "NoiceAttr200", { bg = "#141414", bold = true, fg = "#7ca4bf", italic = true, sp = "#7ca4bf" })
hi(0, "NoiceAttr201", { bg = "#121212", fg = "#9aae6b" })
hi(0, "NoiceAttr202", { bg = "#0f0f0f", fg = "#878787", sp = "#ffc0b9" })
hi(0, "NoiceAttr203", { bg = "#141414", bold = true, fg = "#bf908a", italic = true, sp = "#bf908a" })
hi(0, "NoiceAttr204", { bg = "#0f0f0f", fg = "#878787", sp = "#8cf8f7" })
hi(0, "NoiceAttr205", { bg = "#0f0f0f", fg = "#656565", sp = "#69bab9" })
hi(0, "NoiceAttr206", { bg = "#0f0f0f", fg = "#878787", sp = "#fce094" })
hi(0, "NoiceAttr207", { bg = "#0f0f0f", fg = "#656565", sp = "#bf908a" })
hi(0, "NoiceAttr208", { bg = "#0f0f0f", fg = "#9aae6b" })
hi(0, "NoiceAttr209", { bg = "#141414", fg = "#9aae6b" })
hi(0, "NoiceAttr21", { bg = "#4f5258" })
hi(0, "NoiceAttr210", { bg = "#0f0f0f", fg = "#0b0b0b" })
hi(0, "NoiceAttr211", { bg = "#121212", fg = "#808080", italic = true })
hi(0, "NoiceAttr212", { bg = "#0f0f0f", fg = "#808080", italic = true })
hi(0, "NoiceAttr213", { bg = "#141414", bold = true, fg = "#ffc0b9", italic = true, sp = "#ffc0b9" })
hi(0, "NoiceAttr214", { bg = "#141414", bold = true, fg = "#bda86f", italic = true, sp = "#bda86f" })
hi(0, "NoiceAttr215", { bg = "#0b0b0b", fg = "#413d42" })
hi(0, "NoiceAttr216", { bg = "#121212", bold = true, fg = "#ffc0b9", italic = true })
hi(0, "NoiceAttr217", { bg = "#141414", bold = true, fg = "#ffc0b9", italic = true })
hi(0, "NoiceAttr218", { bg = "#121212", fg = "#121212" })
hi(0, "NoiceAttr219", { fg = "#385c28" })
hi(0, "NoiceAttr220", { fg = "#7f5d33" })
hi(0, "NoiceAttr221", { fg = "#641616" })
hi(0, "NoiceAttr222", { bg = "#437119", fg = "#68755e" })
hi(0, "NoiceAttr223", { bg = "#2b5c78" })
hi(0, "NoiceAttr224", { bg = "#8cf8f7", bold = true, fg = "#141414" })
hi(0, "NoiceAttr225", { fg = "#8cf8f7" })
hi(0, "NoiceAttr226", { bg = "#a6dbff", bold = true, fg = "#141414" })
hi(0, "NoiceAttr227", { fg = "#a6dbff" })
hi(0, "NoiceAttr228", { bg = "#fce094", bold = true, fg = "#141414" })
hi(0, "NoiceAttr229", { fg = "#fce094" })
hi(0, "NoiceAttr230", { bg = "#c5b5ee", bold = true, fg = "#141414" })
hi(0, "NoiceAttr231", { bg = "#ffc0b9", bold = true, fg = "#141414" })
hi(0, "NoiceAttr232", { fg = "#ffc0b9" })
hi(0, "NoiceAttr233", { fg = "#e8e8d4" })
hi(0, "NoiceAttr234", { bg = "#141414", fg = "#facf7a" })
hi(0, "NoiceAttr238", { bg = "#1e1e1e", fg = "#161616" })
hi(0, "NoiceAttr24", { bg = "#07080d" })
hi(0, "NoiceAttr27", { bg = "#4f5258" })
hi(0, "NoiceAttr277", { bg = "#0f0f0f", fg = "#facf7a" })
hi(0, "NoiceAttr28", { bg = "#6b5300" })
hi(0, "NoiceAttr29", { bg = "#005523" })
hi(0, "NoiceAttr3", { reverse = true })
hi(0, "NoiceAttr30", { bg = "#590008" })
hi(0, "NoiceAttr309", { bg = "#121212", fg = "#facf7a" })
hi(0, "NoiceAttr4", { underline = true })
hi(0, "NoiceAttr40", { fg = "#fce094" })
hi(0, "NoiceAttr41", { bg = "#07080d", bold = true, fg = "#9b9ea4" })
hi(0, "NoiceAttr42", { bg = "#07080d", fg = "#9b9ea4" })
hi(0, "NoiceAttr45", { fg = "#a6dbff" })
hi(0, "NoiceAttr47", { sp = "#ffc0b9", underline = true })
hi(0, "NoiceAttr48", { sp = "#fce094", underline = true })
hi(0, "NoiceAttr49", { sp = "#8cf8f7", underline = true })
hi(0, "NoiceAttr5", { italic = true })
hi(0, "NoiceAttr50", { sp = "#a6dbff", underline = true })
hi(0, "NoiceAttr51", { sp = "#b3f6c0", underline = true })
hi(0, "NoiceAttr52", { sp = "#ffc0b9" })
hi(0, "NoiceAttr53", { bg = "#ff0000", fg = "#ff0000" })
hi(0, "NoiceAttr57", { bg = "#141414", fg = "#e8e8d4" })
hi(0, "NoiceAttr58", { bg = "#e8e8d4", fg = "#141414" })
hi(0, "NoiceAttr59", { bg = "#922020" })
hi(0, "NoiceAttr60", { fg = "#ffba66", italic = true })
hi(0, "NoiceAttr61", { fg = "#d1ebbd" })
hi(0, "NoiceAttr62", { bold = true, fg = "#dad086" })
hi(0, "NoiceAttr63", { fg = "#ffba66" })
hi(0, "NoiceAttr64", { fg = "#878787" })
hi(0, "NoiceAttr65", { bg = "#1b2536", fg = "#bbc7dd" })
hi(0, "NoiceAttr66", { fg = "#c92c2c" })
hi(0, "NoiceAttr67", { fg = "#70b950" })
hi(0, "NoiceAttr68", { fg = "#8fbedc" })
hi(0, "NoiceAttr69", { fg = "#413d42" })
hi(0, "NoiceAttr70", { fg = "#f09ebf" })
hi(0, "NoiceAttr71", { sp = "#b2d1f0", undercurl = true })
hi(0, "NoiceAttr72", { sp = "#ffba66", undercurl = true })
hi(0, "NoiceAttr73", { sp = "#c92c2c", undercurl = true })
hi(0, "NoiceAttr74", { bg = "#312129", fg = "#f09ebf" })
hi(0, "NoiceAttr75", { bg = "#091c2f", fg = "#b2d1f0" })
hi(0, "NoiceAttr76", { bg = "#262626" })
hi(0, "NoiceAttr77", { fg = "#b2d1f0" })
hi(0, "NoiceAttr78", { fg = "#c7c7c7" })
hi(0, "NoiceAttr79", { fg = "#668799" })
hi(0, "NoiceAttr80", { fg = "#8bc1aa" })
hi(0, "NoiceAttr81", { fg = "#8297c0", italic = true })
hi(0, "NoiceAttr82", { fg = "#8297c0" })
hi(0, "NoiceAttr83", { fg = "#c5b5ee" })
hi(0, "NoiceAttr84", { fg = "#556633" })
hi(0, "NoiceAttr85", { bg = "#404040" })
hi(0, "NoiceAttr86", { bg = "#000000", fg = "#70b950" })
hi(0, "NoiceAttr87", { fg = "#9199a1" })
hi(0, "NoiceAttr88", { bg = "#000000", fg = "#b0b8bf" })
hi(0, "NoiceAttr89", { bg = "#1c1c1c", fg = "#ffffff" })
hi(0, "NoiceAttr9", { fg = "#b3f6c0" })
hi(0, "NoiceAttr90", { bg = "#520061" })
hi(0, "NoiceAttr91", { bg = "#2d7168" })
hi(0, "NoiceAttr92", { bg = "#0000e0" })
hi(0, "NoiceAttr93", { bg = "#1c1c1c", fg = "#404040" })
hi(0, "NoiceAttr94", { bg = "#374048" })
hi(0, "NoiceAttr95", { bg = "#1f1f1f", fg = "#ffffff" })
hi(0, "NoiceAttr96", { fg = "#616161" })
hi(0, "NoiceAttr97", { bg = "#8297c0", bold = true, fg = "#000000" })
hi(0, "NoiceAttr98", { bold = true, fg = "#f09ebf" })
hi(0, "NoiceFormatProgressDone", { bg = "#312129", fg = "#f09ebf" })
hi(0, "NoiceHiddenCursor", { blend = 100, nocombine = true })
hi(0, "NonText", { fg = "#616161" })
hi(0, "Normal", { bg = "#141414", fg = "#e8e8d4" })
hi(0, "NotifyDEBUGBorder", { fg = "#8b8b8b" })
hi(0, "NotifyDEBUGIcon", { fg = "#8b8b8b" })
hi(0, "NotifyDEBUGTitle", { fg = "#8b8b8b" })
hi(0, "NotifyERRORBody52", { link = "NotifyERRORBody" })
hi(0, "NotifyERRORBody71", { link = "NotifyERRORBody" })
hi(0, "NotifyERRORBorder", { fg = "#8a1f1f" })
hi(0, "NotifyERRORBorder52", { link = "NotifyERRORBorder" })
hi(0, "NotifyERRORBorder71", { link = "NotifyERRORBorder" })
hi(0, "NotifyERRORIcon", { fg = "#f70067" })
hi(0, "NotifyERRORIcon52", { link = "NotifyERRORIcon" })
hi(0, "NotifyERRORIcon71", { link = "NotifyERRORIcon" })
hi(0, "NotifyERRORTitle", { fg = "#f70067" })
hi(0, "NotifyERRORTitle52", { link = "NotifyERRORTitle" })
hi(0, "NotifyERRORTitle71", { link = "NotifyERRORTitle" })
hi(0, "NotifyINFOBody64", { link = "NotifyINFOBody" })
hi(0, "NotifyINFOBody7", { link = "NotifyINFOBody" })
hi(0, "NotifyINFOBody72", { link = "NotifyINFOBody" })
hi(0, "NotifyINFOBorder", { fg = "#4f6752" })
hi(0, "NotifyINFOBorder64", { link = "NotifyINFOBorder" })
hi(0, "NotifyINFOBorder7", { link = "NotifyINFOBorder" })
hi(0, "NotifyINFOBorder72", { link = "NotifyINFOBorder" })
hi(0, "NotifyINFOIcon", { fg = "#a9ff68" })
hi(0, "NotifyINFOIcon64", { link = "NotifyINFOIcon" })
hi(0, "NotifyINFOIcon7", { link = "NotifyINFOIcon" })
hi(0, "NotifyINFOIcon72", { link = "NotifyINFOIcon" })
hi(0, "NotifyINFOTitle", { fg = "#a9ff68" })
hi(0, "NotifyINFOTitle64", { link = "NotifyINFOTitle" })
hi(0, "NotifyINFOTitle7", { link = "NotifyINFOTitle" })
hi(0, "NotifyINFOTitle72", { link = "NotifyINFOTitle" })
hi(0, "NotifyTRACEBorder", { fg = "#4f3552" })
hi(0, "NotifyTRACEIcon", { fg = "#d484ff" })
hi(0, "NotifyTRACETitle", { fg = "#d484ff" })
hi(0, "NotifyWARNBorder", { fg = "#79491d" })
hi(0, "NotifyWARNIcon", { fg = "#f79000" })
hi(0, "NotifyWARNTitle", { fg = "#f79000" })
hi(0, "NvimTreeGitDeleted", { link = "GitSignsDelete" })
hi(0, "NvimTreeGitDirty", { link = "GitSignsChange" })
hi(0, "NvimTreeGitMerge", { link = "GitSignsChange" })
hi(0, "NvimTreeGitNew", { link = "GitSignsAdd" })
hi(0, "NvimTreeGitRenamed", { link = "GitSignsChange" })
hi(0, "NvimTreeGitStaged", { fg = "#d1ebbd" })
hi(0, "NvimTreeRootFolder", { bold = true, fg = "#dad086" })
hi(0, "Operator", { fg = "#8fbedc" })
hi(0, "Pmenu", { bg = "#1f1f1f", fg = "#ffffff" })
hi(0, "PmenuSel", { bg = "#8297c0", bold = true, fg = "#000000" })
hi(0, "PreProc", { fg = "#8297c0" })
hi(0, "Question", { fg = "#70b950" })
hi(0, "QuickFixLine", { bg = "#374048" })
hi(0, "Search", { bg = "#312129", fg = "#f09ebf" })
hi(0, "SignColumn", { fg = "#787878" })
hi(0, "Sneak", { link = "Search" })
hi(0, "Special", { fg = "#8bc1aa" })
hi(0, "SpecialKey", { bg = "#1c1c1c", fg = "#404040" })
hi(0, "SpellBad", { bg = "#922020" })
hi(0, "SpellCap", { bg = "#0000e0" })
hi(0, "SpellLocal", { bg = "#2d7168" })
hi(0, "SpellRare", { bg = "#520061" })
hi(0, "Statement", { fg = "#b2d1f0" })
hi(0, "StatusLine", { bg = "#1c1c1c", fg = "#ffffff" })
hi(0, "StatusLineNC", { bg = "#1c1c1c", fg = "#c7c7c7" })
hi(0, "String", { fg = "#9aae6b" })
hi(0, "StringDelimiter", { fg = "#556633" })
hi(0, "Structure", { fg = "#8fbedc" })
hi(0, "TSNodeKey", { reverse = true })
hi(0, "TabLine", { bg = "#000000", fg = "#b0b8bf" })
hi(0, "TabLineFill", { fg = "#9199a1" })
hi(0, "TabLineSel", { bg = "#000000", fg = "#70b950" })
hi(0, "TelescopeBorder", { fg = "#8297c0" })
hi(0, "TelescopeMatching", { link = "Search" })
hi(0, "TelescopePromptPrefix", { fg = "#ffba66" })
hi(0, "TelescopeSelection", { bg = "#1b2536", fg = "#bbc7dd" })
hi(0, "TelescopeSelectionCaret", { fg = "#ffba66" })
hi(0, "Title", { fg = "#70b950" })
hi(0, "Todo", { fg = "#c7c7c7" })
hi(0, "TodoBgFIX", { bg = "#ffc0b9", bold = true, fg = "#141414" })
hi(0, "TodoBgHACK", { bg = "#fce094", bold = true, fg = "#141414" })
hi(0, "TodoBgNOTE", { bg = "#a6dbff", bold = true, fg = "#141414" })
hi(0, "TodoBgPERF", { bg = "#c5b5ee", bold = true, fg = "#141414" })
hi(0, "TodoBgTEST", { bg = "#c5b5ee", bold = true, fg = "#141414" })
hi(0, "TodoBgTODO", { bg = "#8cf8f7", bold = true, fg = "#141414" })
hi(0, "TodoBgWARN", { bg = "#fce094", bold = true, fg = "#141414" })
hi(0, "TodoFgFIX", { fg = "#ffc0b9" })
hi(0, "TodoFgHACK", { fg = "#fce094" })
hi(0, "TodoFgNOTE", { fg = "#a6dbff" })
hi(0, "TodoFgPERF", { fg = "#c5b5ee" })
hi(0, "TodoFgTEST", { fg = "#c5b5ee" })
hi(0, "TodoFgTODO", { fg = "#8cf8f7" })
hi(0, "TodoFgWARN", { fg = "#fce094" })
hi(0, "TodoSignFIX", { fg = "#ffc0b9" })
hi(0, "TodoSignHACK", { fg = "#fce094" })
hi(0, "TodoSignNOTE", { fg = "#a6dbff" })
hi(0, "TodoSignPERF", { fg = "#c5b5ee" })
hi(0, "TodoSignTEST", { fg = "#c5b5ee" })
hi(0, "TodoSignTODO", { fg = "#8cf8f7" })
hi(0, "TodoSignWARN", { fg = "#fce094" })
hi(0, "Type", { fg = "#ffba66", italic = true })
hi(0, "UfoFoldedBg", { bg = "#374048" })
hi(0, "UfoFoldedFg", { fg = "#e8e8d4" })
hi(0, "VertSplit", { fg = "#413d42" })
hi(0, "Visual", { bg = "#404040" })
hi(0, "WhichKeyIconAzure", { link = "MiniIconsAzure" })
hi(0, "WhichKeyIconBlue", { link = "MiniIconsBlue" })
hi(0, "WhichKeyIconCyan", { link = "MiniIconsCyan" })
hi(0, "WhichKeyIconGreen", { link = "MiniIconsGreen" })
hi(0, "WhichKeyIconGrey", { link = "MiniIconsGrey" })
hi(0, "WhichKeyIconOrange", { link = "MiniIconsOrange" })
hi(0, "WhichKeyIconPurple", { link = "MiniIconsPurple" })
hi(0, "WhichKeyIconRed", { link = "MiniIconsRed" })
hi(0, "WhichKeyIconYellow", { link = "MiniIconsYellow" })
hi(0, "WhichKeyNormal", { link = "NormalFloat" })
hi(0, "WhichKey", { link = "Function" })
hi(0, "WhichKeyValue", { link = "Comment" })
hi(0, "WhichKeyTitle", { link = "FloatTitle" })
hi(0, "WhichKeyDesc", { link = "Identifier" })
hi(0, "WhichKeyGroup", { link = "Keyword" })
hi(0, "WhichKeySeparator", { link = "Comment" })
hi(0, "WhichKeyBorder", { link = "FloatBorder" })
hi(0, "WildMenu", { bg = "#312129", fg = "#f09ebf" })
hi(0, "WinSeparator", { fg = "#413d42" })
hi(0, "ZenBg", { bg = "#131313", fg = "#131313" })
hi(0, "lCursor", { bg = "#e8e8d4", fg = "#141414" })
hi(0, "lualine_a_command", { bg = "#d8c7ff", bold = true, fg = "#161616" })
hi(0, "lualine_a_inactive", { bg = "#8fa6d3", bold = true, fg = "#161616" })
hi(0, "lualine_a_insert", { bg = "#a9bf75", bold = true, fg = "#161616" })
hi(0, "lualine_a_normal", { bg = "#8fa6d3", bold = true, fg = "#161616" })
hi(0, "lualine_a_replace", { bg = "#e37351", bold = true, fg = "#161616" })
hi(0, "lualine_a_terminal", { bg = "#d8c7ff", bold = true, fg = "#161616" })
hi(0, "lualine_a_visual", { bg = "#98d4bb", bold = true, fg = "#161616" })
hi(0, "lualine_b_command", { bg = "#161616", fg = "#d8c7ff" })
hi(0, "lualine_b_inactive", { bg = "#161616", fg = "#8fa6d3" })
hi(0, "lualine_b_insert", { bg = "#161616", fg = "#a9bf75" })
hi(0, "lualine_b_normal", { bg = "#161616", fg = "#8fa6d3" })
hi(0, "lualine_b_replace", { bg = "#161616", fg = "#e37351" })
hi(0, "lualine_b_terminal", { bg = "#161616", fg = "#d8c7ff" })
hi(0, "lualine_b_visual", { bg = "#161616", fg = "#98d4bb" })
hi(0, "lualine_c_command", { bg = "#1e1e1e", fg = "#ffffe9" })
hi(0, "lualine_c_diagnostics_error_command", { bg = "#1e1e1e", fg = "#ffc0b9" })
hi(0, "lualine_c_diagnostics_error_inactive", { bg = "#1e1e1e", fg = "#ffc0b9" })
hi(0, "lualine_c_diagnostics_error_insert", { bg = "#1e1e1e", fg = "#ffc0b9" })
hi(0, "lualine_c_diagnostics_error_normal", { bg = "#1e1e1e", fg = "#ffc0b9" })
hi(0, "lualine_c_diagnostics_error_replace", { bg = "#1e1e1e", fg = "#ffc0b9" })
hi(0, "lualine_c_diagnostics_error_terminal", { bg = "#1e1e1e", fg = "#ffc0b9" })
hi(0, "lualine_c_diagnostics_error_visual", { bg = "#1e1e1e", fg = "#ffc0b9" })
hi(0, "lualine_c_diagnostics_hint_command", { bg = "#1e1e1e", fg = "#a6dbff" })
hi(0, "lualine_c_diagnostics_hint_inactive", { bg = "#1e1e1e", fg = "#a6dbff" })
hi(0, "lualine_c_diagnostics_hint_insert", { bg = "#1e1e1e", fg = "#a6dbff" })
hi(0, "lualine_c_diagnostics_hint_normal", { bg = "#1e1e1e", fg = "#a6dbff" })
hi(0, "lualine_c_diagnostics_hint_replace", { bg = "#1e1e1e", fg = "#a6dbff" })
hi(0, "lualine_c_diagnostics_hint_terminal", { bg = "#1e1e1e", fg = "#a6dbff" })
hi(0, "lualine_c_diagnostics_hint_visual", { bg = "#1e1e1e", fg = "#a6dbff" })
hi(0, "lualine_c_diagnostics_info_command", { bg = "#1e1e1e", fg = "#8cf8f7" })
hi(0, "lualine_c_diagnostics_info_inactive", { bg = "#1e1e1e", fg = "#8cf8f7" })
hi(0, "lualine_c_diagnostics_info_insert", { bg = "#1e1e1e", fg = "#8cf8f7" })
hi(0, "lualine_c_diagnostics_info_normal", { bg = "#1e1e1e", fg = "#8cf8f7" })
hi(0, "lualine_c_diagnostics_info_replace", { bg = "#1e1e1e", fg = "#8cf8f7" })
hi(0, "lualine_c_diagnostics_info_terminal", { bg = "#1e1e1e", fg = "#8cf8f7" })
hi(0, "lualine_c_diagnostics_info_visual", { bg = "#1e1e1e", fg = "#8cf8f7" })
hi(0, "lualine_c_diagnostics_warn_command", { bg = "#1e1e1e", fg = "#fce094" })
hi(0, "lualine_c_diagnostics_warn_inactive", { bg = "#1e1e1e", fg = "#fce094" })
hi(0, "lualine_c_diagnostics_warn_insert", { bg = "#1e1e1e", fg = "#fce094" })
hi(0, "lualine_c_diagnostics_warn_normal", { bg = "#1e1e1e", fg = "#fce094" })
hi(0, "lualine_c_diagnostics_warn_replace", { bg = "#1e1e1e", fg = "#fce094" })
hi(0, "lualine_c_diagnostics_warn_terminal", { bg = "#1e1e1e", fg = "#fce094" })
hi(0, "lualine_c_diagnostics_warn_visual", { bg = "#1e1e1e", fg = "#fce094" })
hi(0, "lualine_c_inactive", { bg = "#1e1e1e", fg = "#ffffe9" })
hi(0, "lualine_c_insert", { bg = "#1e1e1e", fg = "#ffffe9" })
hi(0, "lualine_c_normal", { bg = "#1e1e1e", fg = "#ffffe9" })
hi(0, "lualine_c_replace", { bg = "#1e1e1e", fg = "#ffffe9" })
hi(0, "lualine_c_terminal", { bg = "#1e1e1e", fg = "#ffffe9" })
hi(0, "lualine_c_visual", { bg = "#1e1e1e", fg = "#ffffe9" })
hi(0, "lualine_transitional_lualine_a_command_to_lualine_b_command", { bg = "#161616", fg = "#d8c7ff" })
hi(0, "lualine_transitional_lualine_a_insert_to_lualine_b_insert", { bg = "#161616", fg = "#a9bf75" })
hi(0, "lualine_transitional_lualine_a_normal_to_lualine_b_normal", { bg = "#161616", fg = "#8fa6d3" })
hi(0, "lualine_transitional_lualine_b_command_to_lualine_c_command", { bg = "#1e1e1e", fg = "#161616" })
hi(
	0,
	"lualine_transitional_lualine_b_command_to_lualine_c_diagnostics_warn_command",
	{ bg = "#1e1e1e", fg = "#161616" }
)
hi(0, "lualine_transitional_lualine_b_insert_to_lualine_c_insert", { bg = "#1e1e1e", fg = "#161616" })
hi(0, "lualine_transitional_lualine_b_normal_to_lualine_c_diagnostics_warn_normal", { bg = "#1e1e1e", fg = "#161616" })
hi(0, "lualine_transitional_lualine_b_normal_to_lualine_c_normal", { bg = "#1e1e1e", fg = "#161616" })
hi(0, "lualine_x_diff_added_command", { bg = "#1e1e1e", fg = "#70b950" })
hi(0, "lualine_x_diff_added_inactive", { bg = "#1e1e1e", fg = "#70b950" })
hi(0, "lualine_x_diff_added_insert", { bg = "#1e1e1e", fg = "#70b950" })
hi(0, "lualine_x_diff_added_normal", { bg = "#1e1e1e", fg = "#70b950" })
hi(0, "lualine_x_diff_added_replace", { bg = "#1e1e1e", fg = "#70b950" })
hi(0, "lualine_x_diff_added_terminal", { bg = "#1e1e1e", fg = "#70b950" })
hi(0, "lualine_x_diff_added_visual", { bg = "#1e1e1e", fg = "#70b950" })
hi(0, "lualine_x_diff_modified_command", { bg = "#1e1e1e", fg = "#ffba66" })
hi(0, "lualine_x_diff_modified_inactive", { bg = "#1e1e1e", fg = "#ffba66" })
hi(0, "lualine_x_diff_modified_insert", { bg = "#1e1e1e", fg = "#ffba66" })
hi(0, "lualine_x_diff_modified_normal", { bg = "#1e1e1e", fg = "#ffba66" })
hi(0, "lualine_x_diff_modified_replace", { bg = "#1e1e1e", fg = "#ffba66" })
hi(0, "lualine_x_diff_modified_terminal", { bg = "#1e1e1e", fg = "#ffba66" })
hi(0, "lualine_x_diff_modified_visual", { bg = "#1e1e1e", fg = "#ffba66" })
hi(0, "lualine_x_diff_removed_command", { bg = "#1e1e1e", fg = "#c92c2c" })
hi(0, "lualine_x_diff_removed_inactive", { bg = "#1e1e1e", fg = "#c92c2c" })
hi(0, "lualine_x_diff_removed_insert", { bg = "#1e1e1e", fg = "#c92c2c" })
hi(0, "lualine_x_diff_removed_normal", { bg = "#1e1e1e", fg = "#c92c2c" })
hi(0, "lualine_x_diff_removed_replace", { bg = "#1e1e1e", fg = "#c92c2c" })
hi(0, "lualine_x_diff_removed_terminal", { bg = "#1e1e1e", fg = "#c92c2c" })
hi(0, "lualine_x_diff_removed_visual", { bg = "#1e1e1e", fg = "#c92c2c" })
hi(0, "nvim_set_hl_x_hi_clear_bugfix", { fg = "#ff0000" })

-- No terminal colors defined
