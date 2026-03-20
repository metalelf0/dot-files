-- vim.opt.conceallevel = 2

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.require'lazyvim.util'.ui.foldexpr()"
vim.opt.foldtext = ""
vim.opt.foldlevel = 99
