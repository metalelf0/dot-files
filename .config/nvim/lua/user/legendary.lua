local commands = {
  { ':EditNeovimConfig', ':e ~/.config/nvim/init.lua', description = 'Edit neovim config' },
  { ':EditKittyConfig', ':e ~/.config/kitty/kitty.conf', description = 'Edit kitty config' },
  { ':Neorg gtd capture', description = 'Neorg gtd: capture task' },
  { ':Neorg gtd views', description = 'Neorg gtd: views' },
}

require('legendary').setup({
  commands = commands
})
