  vim.cmd [[
  try
    set termguicolors
    colorscheme duckbones
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
]]

