  vim.cmd [[
  try
    set termguicolors
    colorscheme nord
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
]]

