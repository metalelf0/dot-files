vim.cmd([[
  try
    set termguicolors
    colorscheme jellybeans-nvim
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
]])

vim.api.nvim_set_hl(0, "@symbol", { fg = "#c5b5ee" })
