
-- setup must be called before loading
vim.cmd [[
try
  let g:tokyonight_style = "night" " allowed values are 'storm', 'day' and 'night'
  let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer", "aerial", "toggleterm" ]
  let g:tokyonight_dark_sidebar = v:true
  let g:tokyight_dark_float = v:true
  colorscheme tokyonight
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]


