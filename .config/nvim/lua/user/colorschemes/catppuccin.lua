vim.g.catppuccin_flavour = "frappe" -- latte, frappe, macchiato, mocha

require('catppuccin').setup({
  integrations = {
    lsp_trouble = true,
    which_key = true
  }
})


  -- setup must be called before loading
  vim.cmd [[
  try
    colorscheme catppuccin
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
]]


