-- setup must be called before loading
vim.cmd [[
try
  colorscheme oh-lucy
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]


