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
