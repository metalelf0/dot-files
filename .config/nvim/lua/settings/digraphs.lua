-- custom digraphs
-- to add a new one:
--   - type ga on any character and copy the decimal value
-- to enter digraphs:
--   <C-k>po in insert mode

-- pl for plant... or planned 🌱
vim.api.nvim_command("digraph pl 127793")
-- po for pomodoro 🍅
vim.api.nvim_command("digraph po 127813")
-- do for done ✔
vim.api.nvim_command("digraph do 10004")
-- ch for checkbox ❑
vim.api.nvim_command("digraph ch 10065")
-- bu for bug 🐛
vim.api.nvim_command("digraph bu 128027")
-- sh for... well, you know 💩 
vim.api.nvim_command("digraph sh 128169")
