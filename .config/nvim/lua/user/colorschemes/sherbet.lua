  vim.cmd [[
  try
    set termguicolors
    colorscheme sherbet
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
]]

