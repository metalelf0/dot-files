vim.cmd [[
  try
    colorscheme iceberg
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
]]

