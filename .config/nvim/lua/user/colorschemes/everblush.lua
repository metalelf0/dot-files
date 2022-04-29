-- setup must be called before loading
vim.cmd [[
try
  set termguicolors!
  colorscheme everblush
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
