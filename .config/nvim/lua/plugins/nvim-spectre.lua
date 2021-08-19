vim.api.nvim_set_keymap('n', '<Leader>ss', "<cmd>:lua require('spectre').open()<CR>", {})
vim.api.nvim_set_keymap('n', '<Leader>sw', "viw<cmd>:lua require('spectre').open_visual()<CR>", {})
vim.api.nvim_set_keymap('v', '<Leader>ss', "<cmd>:lua require('spectre').open_visual()<CR>", {})
