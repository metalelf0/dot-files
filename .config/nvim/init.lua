local cmd = vim.cmd
local fn = vim.fn
local g = vim.g

CONFIG = { }
CONFIG.nvim_plugin_config_path = "/Users/metalelf0/.config/nvim/lua/plugins/"

require 'settings'
require "utils"
require 'plugins'

local witch = require 'witch'

vim.cmd 'nnoremap <nowait><silent> <Esc><Esc> :nohlsearch<CR>'

witch.set("nightfox", "nightfox")

-- TODO: eventually rewrite this in lua... someday :)
-- taken from https://gist.github.com/romainl/56f0c28ef953ffc157f36cc495947ab3
-- Thanks, romainl! ;)
vim.api.nvim_exec(
[[
function! Grep(...)
  return system(join([&grepprg] + [expandcmd(join(a:000, ' '))], ' '))
endfunction

command! -nargs=+ -complete=file_in_path -bar Grep  cgetexpr Grep(<f-args>)
command! -nargs=+ -complete=file_in_path -bar LGrep lgetexpr Grep(<f-args>)

augroup quickfix
    autocmd!
    autocmd QuickFixCmdPost cgetexpr cwindow
    autocmd QuickFixCmdPost lgetexpr lwindow
augroup END

cnoreabbrev <expr> grep (getcmdtype() ==# ':' && getcmdline() ==# 'grep') ? 'Grep' : 'grep'
cnoreabbrev <expr> gr (getcmdtype() ==# ':' && getcmdline() ==# 'gr') ? 'Grep' : 'gr'
]], false)

vim.api.nvim_exec(
[[
  nnoremap <esc> :noh<CR>
]], false)
