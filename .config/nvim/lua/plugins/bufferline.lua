require("bufferline").setup{
  options = {
    offsets = {{filetype = "NvimTree", text = "File Explorer", highlight = "Directory", text_align = "left"}}
  }
}

vim.api.nvim_set_keymap('n', 'L', '<cmd>:BufferLineCycleNext<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', 'H', '<cmd>:BufferLineCyclePrev<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', 'gb', '<cmd>:BufferLinePick<CR>', {noremap = true})
