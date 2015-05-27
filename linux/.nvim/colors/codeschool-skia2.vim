" Vim color file
" Converted from my Textmate Code School theme using Coloration
" http://astonj.com

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "Code School 3"

hi Cursor    guifg=#182227 guibg=#9ea7a6 gui=NONE
hi Visual    guifg=NONE guibg=#3f4b52 gui=NONE
hi CursorLine    guifg=NONE guibg=#2e373b gui=NONE
hi CursorColumn    guifg=NONE guibg=#2e373b gui=NONE
hi ColorColumn    guifg=NONE guibg=#2e373b gui=NONE
hi LineNr    guifg=#84898c guibg=#2a343a gui=NONE
hi VertSplit    guifg=#252c31 guibg=#252c31 gui=NONE
hi MatchParen    guifg=#dda790 guibg=NONE gui=underline
hi StatusLine    guifg=#f0f0f0 guibg=#575e61 gui=bold
hi StatusLineNC    guifg=#f0f0f0 guibg=#575e61 gui=NONE
hi Pmenu    guifg=#bcdbff guibg=NONE gui=NONE
hi PmenuSel    guifg=NONE guibg=#3f4b52 gui=NONE
hi IncSearch    guifg=#182227 guibg=#8bb664 gui=NONE
hi Search    guifg=NONE guibg=NONE gui=underline
hi Directory    guifg=#3c98d9 guibg=NONE gui=NONE
hi Folded    guifg=#9a9a9a guibg=#182227 gui=NONE

hi Normal    guifg=#f0f0f0 guibg=#252c31 gui=NONE
hi Boolean    guifg=#3c98d9 guibg=NONE gui=NONE
hi Character    guifg=#3c98d9 guibg=NONE gui=NONE
hi Comment    guifg=#9a9a9a guibg=NONE gui=italic
hi Conditional    guifg=#dda790 guibg=NONE gui=NONE
hi Constant    guifg=#3c98d9 guibg=NONE gui=NONE
hi Define    guifg=#dda790 guibg=NONE gui=NONE
hi DiffAdd    guifg=#f0f0f0 guibg=#43820d gui=bold
hi DiffDelete    guifg=#880708 guibg=NONE gui=NONE
hi DiffChange    guifg=#f0f0f0 guibg=#1c3657 gui=NONE
hi DiffText    guifg=#f0f0f0 guibg=#204a87 gui=bold
hi ErrorMsg    guifg=NONE guibg=NONE gui=NONE
hi WarningMsg    guifg=NONE guibg=NONE gui=NONE
hi Float    guifg=#3c98d9 guibg=NONE gui=NONE
hi Function    guifg=#bcdbff guibg=NONE gui=NONE
hi Identifier    guifg=#99cf50 guibg=NONE gui=NONE
hi Keyword    guifg=#dda790 guibg=NONE gui=NONE
hi Label    guifg=#8bb664 guibg=NONE gui=NONE
hi NonText    guifg=#414e58 guibg=#232c31 gui=NONE
hi Number    guifg=#3c98d9 guibg=NONE gui=NONE
hi Operator    guifg=#dda790 guibg=NONE gui=NONE
hi PreProc    guifg=#dda790 guibg=NONE gui=NONE
hi Special    guifg=#f0f0f0 guibg=NONE gui=NONE
hi SpecialKey    guifg=#414e58 guibg=#252c31 gui=NONE
hi Statement    guifg=#dda790 guibg=NONE gui=NONE
hi StorageClass    guifg=#99cf50 guibg=NONE gui=NONE
hi String    guifg=#8bb664 guibg=NONE gui=NONE
hi Tag    guifg=#bcdbff guibg=NONE gui=NONE
hi Title    guifg=#f0f0f0 guibg=NONE gui=bold
hi Todo   ,bold guifg=#9a9a9a guibg=NONE gui=inverse,bold,italic
hi Type    guifg=#b5d8f6 guibg=NONE gui=NONE
" following line is no more underlined
hi Underlined    guifg=NONE guibg=NONE gui=NONE
hi rubyClass    guifg=#dda790 guibg=NONE gui=NONE
hi rubyFunction    guifg=#bcdbff guibg=NONE gui=NONE
hi rubyInterpolationDelimiter    guifg=NONE guibg=NONE gui=NONE
hi rubySymbol    guifg=#3c98d9 guibg=NONE gui=NONE
hi rubyConstant    guifg=#bfabcb guibg=NONE gui=NONE
hi rubyStringDelimiter    guifg=#8bb664 guibg=NONE gui=NONE
hi rubyBlockParameter    guifg=#68a9eb guibg=NONE gui=NONE
hi rubyInstanceVariable    guifg=#68a9eb guibg=NONE gui=NONE
hi rubyInclude    guifg=#dda790 guibg=NONE gui=NONE
hi rubyGlobalVariable    guifg=#68a9eb guibg=NONE gui=NONE
hi rubyRegexp    guifg=#e9c062 guibg=NONE gui=NONE
hi rubyRegexpDelimiter    guifg=#e9c062 guibg=NONE gui=NONE
hi rubyEscape    guifg=#3c98d9 guibg=NONE gui=NONE
hi rubyControl    guifg=#dda790 guibg=NONE gui=NONE
hi rubyClassVariable    guifg=#68a9eb guibg=NONE gui=NONE
hi rubyOperator    guifg=#dda790 guibg=NONE gui=NONE
hi rubyException    guifg=#dda790 guibg=NONE gui=NONE
hi rubyPseudoVariable    guifg=#68a9eb guibg=NONE gui=NONE
hi rubyRailsUserClass    guifg=#bfabcb guibg=NONE gui=NONE
hi rubyRailsARAssociationMethod    guifg=#dad085 guibg=NONE gui=NONE
hi rubyRailsARMethod    guifg=#dad085 guibg=NONE gui=NONE
hi rubyRailsRenderMethod    guifg=#dad085 guibg=NONE gui=NONE
hi rubyRailsMethod    guifg=#dad085 guibg=NONE gui=NONE
hi erubyDelimiter    guifg=NONE guibg=NONE gui=NONE
hi erubyComment    guifg=#9a9a9a guibg=NONE gui=italic
hi erubyRailsMethod    guifg=#dad085 guibg=NONE gui=NONE
hi htmlTag    guifg=#89bdff guibg=NONE gui=NONE
hi htmlEndTag    guifg=#89bdff guibg=NONE gui=NONE
hi htmlTagName    guifg=#89bdff guibg=NONE gui=NONE
hi htmlArg    guifg=#89bdff guibg=NONE gui=NONE
hi htmlSpecialChar    guifg=#3c98d9 guibg=NONE gui=NONE
hi javaScriptFunction    guifg=#99cf50 guibg=NONE gui=NONE
hi javaScriptRailsFunction    guifg=#dad085 guibg=NONE gui=NONE
hi javaScriptBraces    guifg=NONE guibg=NONE gui=NONE
hi yamlKey    guifg=#bcdbff guibg=NONE gui=NONE
hi yamlAnchor    guifg=#68a9eb guibg=NONE gui=NONE
hi yamlAlias    guifg=#68a9eb guibg=NONE gui=NONE
hi yamlDocumentHeader    guifg=#8bb664 guibg=NONE gui=NONE
hi cssURL    guifg=#68a9eb guibg=NONE gui=NONE
hi cssFunctionName    guifg=#dad085 guibg=NONE gui=NONE
hi cssColor    guifg=#3c98d9 guibg=NONE gui=NONE
hi cssPseudoClassId    guifg=#bcdbff guibg=NONE gui=NONE
hi cssClassName    guifg=#bcdbff guibg=NONE gui=NONE
hi cssValueLength    guifg=#3c98d9 guibg=NONE gui=NONE
hi cssCommonAttr    guifg=#a7cfa3 guibg=NONE gui=NONE
hi cssBraces    guifg=NONE guibg=NONE gui=NONE
