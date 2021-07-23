local g = vim.g

map('n', '<leader>Tn', ":TestNearest<CR>")
map('n', '<leader>Tf', ":TestFile<CR>")
map('n', '<leader>Ts', ":TestSuite<CR>")
map('n', '<leader>Tl', ":TestLast<CR>")
map('n', '<leader>Tv', ":TestVisit<CR>")

g['test#strategy'] = "vimux"
