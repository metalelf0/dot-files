vim.o.termguicolors = true

vim.cmd [[
  try
    colorscheme nordfox
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
]]

