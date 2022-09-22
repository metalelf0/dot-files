local core = require("lib/core")

local commands = {
  { ':EditNeovimConfig', ':e ' .. core.get_configdir() .. 'init.lua', description = 'Edit neovim config' },
  { ':EditKittyConfig', ':e ~/.config/kitty/kitty.conf', description = 'Edit kitty config' },
  { ':EditLazygitConfig', ':e ~/Library/Application Support/lazygit/config.yml', description = 'Edit lazygit config' },
  { ':Neorg gtd capture', description = 'Neorg gtd: capture task' },
  { ':Neorg gtd views', description = 'Neorg gtd: views' },
  { ':PackerSync', description = 'Sync packages' },
  { ':PackerInstall', description = 'Install packages' },
  { ':luafile %', description = 'Lua: source current file' },
}

require('legendary').setup({
  commands = commands
})
