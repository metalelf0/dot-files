require 'settings.utils'
require 'settings.globals'
require 'settings.options'
require 'settings.mappings'
require 'settings.digraphs'

vim.api.nvim_command("autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()")

