vim.cmd([[
  augroup _alpha
  autocmd!
  autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end
]])

local general_group = vim.api.nvim_create_augroup('general', { clear = true})
vim.api.nvim_create_autocmd('FileType', { command = 'nnoremap <silent> <buffer> q :close<CR> ', group = general_group, pattern = 'qf,jelp,man,lspinfo' })
vim.api.nvim_create_autocmd('BufWinEnter', { command = ':set formatoptions-=cro', group = general_group })
vim.api.nvim_create_autocmd('FileType', { command = 'set nobuflisted', group = general_group, pattern = 'qf' })
vim.api.nvim_create_autocmd('TextYankPost', { callback = function() require('vim.highlight').on_yank({ timeout = 200 }) end })

local git_group = vim.api.nvim_create_augroup('git', { clear = true })
vim.api.nvim_create_autocmd('FileType', { command = 'setlocal wrap', group = git_group, pattern = 'gitcommit' })
vim.api.nvim_create_autocmd('FileType', { command = 'setlocal spell', group = git_group, pattern = 'gitcommit' })

local markdown_group = vim.api.nvim_create_augroup('markdown', { clear = true })
vim.api.nvim_create_autocmd('FileType', { command = 'setlocal wrap', group = markdown_group, pattern = 'markdown' })
vim.api.nvim_create_autocmd('FileType', { command = 'setlocal spell', group = markdown_group, pattern = 'markdown' })

local auto_resize_group = vim.api.nvim_create_augroup('auto_resize', { clear = true })
vim.api.nvim_create_autocmd('VimResized', { command = 'tabdo wincmd = ', group = auto_resize_group })

-- local alpha_group = vim.api.nvim_create_augroup('alpha', { clear = true })
-- vim.api.nvim_create_autocmd('BufEnter', { command = 'echo "Hiding" | set showtabline=0', group = alpha_group, pattern = 'alpha' })
-- vim.api.nvim_create_autocmd('BufUnload <buffer>', { command = 'echo "Showing" | set showtabline=2', group = alpha_group })

-- vim.api.nvim_create_autocmd({ 'User AlphaReady' }, { callback = function(args) print('Baaaabbo!'); vim.o.showtabline = 0 end })
-- vim.api.nvim_create_autocmd('BufUnload <buffer>', { callback = function(args) print('Gianni!'); vim.o.showtabline = 2 end })

local ruby_group = vim.api.nvim_create_augroup('ruby', { clear = true })
vim.api.nvim_create_autocmd('BufWritePre', { command = [[ :%s/\s\+$//e ]], group = ruby_group, pattern = '*.rb' })

-- Autoformat
-- augroup _lsp
--   autocmd!
--   autocmd BufWritePre * lua vim.lsp.buf.formatting()
-- augroup end
