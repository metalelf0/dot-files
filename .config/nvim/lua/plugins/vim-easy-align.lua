vim.api.nvim_set_keymap('v', '<Enter>', '<Plug>(EasyAlign)', {})
vim.api.nvim_set_keymap('n', '<Leader>a', '<Plug>(EasyAlign)', {})

--[[ fun! MarkdownTable()
  normal V}:EasyAlign *|jV:s/\s/-k
endfun
nmap <Leader>mt :call MarkdownTable()<Enter> ]]
