vim.o.termguicolors = true

vim.cmd [[
try
  colorscheme minimal
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]


