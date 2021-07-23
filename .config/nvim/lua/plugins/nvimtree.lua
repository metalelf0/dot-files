-- Options

vim.g.nvim_tree_auto_open = 1  -- 0 by default, opens the tree when typing `vim $DIR` or `vim`
vim.g.nvim_tree_auto_close = 0 -- 0 by default, closes the tree when it's the last window
vim.g.nvim_tree_follow = 1     -- 0 by default, this option allows the cursor to
                               -- be updated when entering a buffer
vim.g.nvim_tree_update_cwd = 0 -- 0 by default, will update the tree cwd when
                               -- changing nvim's directory (DirChanged event).
                               -- Behaves strangely with autochdir set

-- Mappings
map('n', '<Leader>tt', "<cmd>:NvimTreeToggle<CR>")
map('n', '<Leader>tf', "<cmd>:NvimTreeFindFile<CR>")
map('n', '-',          "<cmd>:NvimTreeFindFile<CR>")
