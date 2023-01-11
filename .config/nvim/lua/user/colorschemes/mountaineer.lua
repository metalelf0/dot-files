vim.o.termguicolors = true

vim.cmd([[
try
  colorscheme mountaineer
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]])
