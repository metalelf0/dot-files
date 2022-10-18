vim.g.gruvbox_material_palette = 'original'
vim.g.gruvbox_material_enable_bold = 1
vim.g.gruvbox_material_enable_italic = 1
vim.g.gruvbox_material_transparent_background = 0
vim.g.gruvbox_material_visual = 'blue background'
vim.g.gruvbox_material_diagnostic_virtual_text = 'colored'
vim.g.gruvbox_material_statusline_style = 'original'
vim.g.gruvbox_material_better_performance = 1
--[[ vim.g.gruvbox_material_background = 'hard' ]]

vim.o.termguicolors=true

vim.cmd [[
try
  set bg=light
  colorscheme gruvbox-material
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
