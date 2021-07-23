local cmd = vim.cmd
local fn = vim.fn
local g = vim.g

map('i', '<C-u>', '<C-g>u<C-u>')  -- Make <C-u> undo-friendly
map('i', '<C-w>', '<C-g>u<C-w>')  -- Make <C-w> undo-friendly
map('i', 'kj', '<Esc>')           -- Type 'kj' to exit insert mode

map('n', 'c*', '*Ncgn')           -- c* to change current word
map('n', 'c#', '#NcgN')           -- c# to change current word (up)

-- <Tab> to navigate the completion menu
map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})

-- Mappings
map('n', '<Esc><Esc>', '<cmd>:nohlsearch<CR>')
-- map('n', '<Leader>G', '"=system(\'gitmoji-selector\')<C-M>P')

-- Move lines
map('v', 'J', '<cmd>:m \'>+1<CR>gv=gv')
map('v', 'K', '<cmd>:m \'<-2<CR>gv=gv')

map('n', '<C-j>', '<cmd>:cn<cr>')
map('n', '<C-k>', '<cmd>:cp<cr>')
map('n', '<C-S-j>', '<cmd>:cnf<cr>')
map('n', '<C-S-k>', '<cmd>:cpf<cr>')
