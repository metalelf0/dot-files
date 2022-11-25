vim.o.termguicolors = true

vim.cmd [[
  try
    augroup CustomHighlight
      autocmd!
      autocmd ColorScheme carbonfox highlight link @symbol String
      autocmd ColorScheme carbonfox highlight link @boolean @variable.builtin
    augroup END

    colorscheme carbonfox
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
]]

