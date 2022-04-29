vim.g.gruvbox_material_palette = 'material'
vim.g.gruvbox_material_enable_bold = 1
vim.g.gruvbox_material_enable_italic = 1
vim.g.gruvbox_material_visual = 'reverse'
vim.g.gruvbox_material_diagnostic_virtual_text = 'colored'
vim.g.gruvbox_material_statusline_style = 'default'
vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_background = 'hard'

vim.o.termguicolors=true

vim.cmd [[
try
  set background=light
  colorscheme gruvbox-material
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
