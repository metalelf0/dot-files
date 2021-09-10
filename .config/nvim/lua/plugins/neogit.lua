local neogit = require('neogit')

neogit.setup {
  integrations = {
    diffview = true
  }
}

-- map('n', '<leader>gs', "<cmd>:Neogit<CR>")
--[[ map('n', '<leader>gb', "<cmd>:Git branch<CR>")
map('n', '<leader>dl', "<cmd>:diffget //2<CR>") -- mnemonic: diff left
map('n', '<leader>dr', "<cmd>:diffget //3<CR>") -- mnemonic: diff right ]]
