
-- setup must be called before loading
vim.cmd [[
try
  let g:tokyonight_style = "night" " allowed values are 'storm', 'day' and 'night'
  let g:tokyonight_sidebars = ["qf", "term"]
  colorscheme tokyonight
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]


