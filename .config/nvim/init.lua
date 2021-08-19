local cmd = vim.cmd
local fn = vim.fn
local g = vim.g

CONFIG = { }
CONFIG.nvim_plugin_config_path = "/Users/metalelf0/.config/nvim/lua/plugins/"

require 'settings'
require 'utils'
require 'plugins'

vim.cmd 'nnoremap <nowait><silent> <Esc><Esc> :nohlsearch<CR>'

-- cmd('colorscheme nightfly')
