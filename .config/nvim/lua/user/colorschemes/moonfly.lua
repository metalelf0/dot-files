vim.cmd [[
  try
    colorscheme moonfly
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
]]

