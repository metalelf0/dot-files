vim.cmd [[
  try
    let g:material_style="lighter"
    colorscheme material
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
]]

