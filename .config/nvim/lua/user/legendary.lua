local commands = {
  { ':EditNeovimConfig', ':e ~/.config/nvim/init.lua', description = 'Edit neovim config' },
  { ':EditKittyConfig', ':e ~/.config/kitty/kitty.conf', description = 'Edit kitty config' },
}

require('legendary').setup({
  commands = commands
})


