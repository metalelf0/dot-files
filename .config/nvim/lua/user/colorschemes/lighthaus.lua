-- require('lighthaus').setup({
--   bg_dark = false,
--   colors = {},
--   lsp_underline_style = 'undercurl',
--   transparent = false,
--   italic_comments = false,
--   italic_keywords = false,
-- })
--
-- setup must be called before loading
vim.cmd [[
try
  colorscheme kanagawa
  colorscheme lighthaus
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]


