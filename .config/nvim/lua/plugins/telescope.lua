local builtin = require 'telescope.builtin'
local actions = require 'telescope.actions'
local previewers = require 'telescope.previewers'

require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ["<c-j>"] = actions.move_selection_next,
        ["<c-k>"] = actions.move_selection_previous,
        ["<PageUp>"] = actions.preview_scrolling_up,
        ["<PageDown>"] = actions.preview_scrolling_down,
        ["<c-d>"] = "delete_buffer",
      },
      n = {
        ["<c-d>"] = "delete_buffer",
      }
    },
    file_previewer = previewers.vim_buffer_cat.new,
    grep_previewer = previewers.vim_buffer_vimgrep.new,
    qflist_previewer = previewers.vim_buffer_qflist.new,
    layout_strategy = 'vertical'
  }
}

-- Mappings
map('n', '<leader>p',  "<cmd>lua require('telescope.builtin').find_files()<CR>")
map('n', '<leader>r',  "<cmd>lua require('telescope.builtin').oldfiles()<CR>")
map('n', '<leader>/',  "<cmd>lua require('telescope.builtin').live_grep()<CR>")
map('n', '<leader>k',  "<cmd>lua require('telescope.builtin').grep_string()<CR>")
map('n', '<leader>;',  "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>")
map('n', '<leader>b',  "<cmd>lua require('telescope.builtin').buffers()<CR>")
map('n', '<leader>gr', "<cmd>lua require('telescope.builtin').lsp_references()<CR>")
map('n', '<leader>gS', "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>")
map('n', '<leader>ws', "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>")
map('n', '<leader>a',  "<cmd>lua require('telescope.builtin').lsp_code_actions()<CR>")
map('n', '<Leader>G',  "<cmd>lua require('telescope.builtin').symbols{ sources = {'gitmoji'} }<CR>")
map('n', '<Leader>E',  "<cmd>lua require('telescope.builtin').symbols{ sources = {'emoji'} }<CR>")
