local cmd = vim.cmd
local fn = vim.fn
local g = vim.g

vim.opt.background = "dark"

require 'settings'
require 'plugins'

vim.g.gruvbox_material_background = "medium"
vim.g.gruvbox_contrast_dark = "hard"
vim.g.ayucolor="light"
vim.g.tokyonight_style = "storm" -- or storm for a lighter variant
vim.g.tokyonight_hide_inactive_statusline = true -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard StatusLine and LuaLine.
vim.g.material_style = "lighter"
vim.g.material_italic_comments = true

require('github-theme').setup {
  themeStyle = 'light',
  hideInactiveStatusline = true
}

-- cmd('colorscheme nightfly')
