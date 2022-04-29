  vim.cmd [[
  try
    set termguicolors
    colorscheme blackbird
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
]]

