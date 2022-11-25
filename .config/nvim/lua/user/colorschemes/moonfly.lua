vim.cmd [[
  try
    augroup CustomHighlight
    autocmd!
    autocmd ColorScheme moonfly highlight @label guifg=#8cc85f
    augroup END

    colorscheme moonfly
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
]]

