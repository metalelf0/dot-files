
-- setup must be called before loading
vim.cmd [[
try
  let g:tokyonight_style = "day" " allowed values are 'storm', 'day' and 'night'
  let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer", "aerial" ]
  colorscheme tokyonight
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]


