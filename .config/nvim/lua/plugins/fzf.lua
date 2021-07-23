local cmd = vim.cmd
local fn = vim.fn
local g = vim.g

vim.g.fzf_marks_file = "~/.fzf-marks"

vim.cmd [[ command! -bang FM call fzf#run(fzf#wrap({'source': 'cat ~/.fzf-marks | sed "s/.*: \(.*\)$/\1/" | sed "s#~#${HOME}#"', 'sink': 'lcd'}, <bang>0)) ]]

map('n', '<leader>p',  "<cmd>:Files<CR>")
map('n', '<leader>P',  "<cmd>:FM<CR>")
map('n', '<leader>R',  "<cmd>:History<CR>")
map('n', '<leader>/',  "<cmd>:Rg<CR>")
map('n', '<leader>b',  "<cmd>:Buffers<CR>")
map('n', '<leader>k',  "<cmd>:execute 'Rg' expand('<cword>')<CR>")

