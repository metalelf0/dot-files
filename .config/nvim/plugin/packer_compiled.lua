-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/metalelf0/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/metalelf0/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/metalelf0/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/metalelf0/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/metalelf0/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["SpacegrayEighties.vim"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/SpacegrayEighties.vim"
  },
  Zenburn = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/Zenburn"
  },
  ["ayu-vim"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/ayu-vim"
  },
  ["barbar.nvim"] = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19plugins.barbar\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/opt/barbar.nvim"
  },
  ["blue-moon"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/blue-moon"
  },
  ["boo-colorscheme-nvim"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/boo-colorscheme-nvim"
  },
  ["completion-nvim"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/completion-nvim"
  },
  darcula = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/darcula"
  },
  embark = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/embark"
  },
  firenvim = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/firenvim"
  },
  ["forest-night"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/forest-night"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  fzf = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/fzf"
  },
  ["github-nvim-theme"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/github-nvim-theme"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  gruvbox = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/gruvbox"
  },
  ["gruvbox-material"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/gruvbox-material"
  },
  ["hop.nvim"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/hop.nvim"
  },
  ["iceberg.vim"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/iceberg.vim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["jellybeans-nvim"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/jellybeans-nvim"
  },
  kommentary = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["kosmikoa.nvim"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/kosmikoa.nvim"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/lsp-status.nvim"
  },
  ["lsp-trouble.nvim"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/lsp-trouble.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/lush.nvim"
  },
  ["material.nvim"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/material.nvim"
  },
  melange = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/melange"
  },
  ["moonlight.nvim"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/moonlight.nvim"
  },
  neorg = {
    config = { "\27LJ\2\n’\1\0\0\a\0\14\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\f\0005\3\3\0004\4\0\0=\4\4\0034\4\0\0=\4\5\0035\4\t\0005\5\a\0005\6\6\0=\6\b\5=\5\n\4=\4\v\3=\3\r\2B\0\2\1K\0\1\0\tload\1\0\0\21core.norg.dirman\vconfig\1\0\0\15workspaces\1\0\0\1\0\1\17my_workspace\f~/neorg\24core.norg.concealer\18core.defaults\1\0\0\nsetup\nneorg\frequire\0" },
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/neorg"
  },
  ["nnn.vim"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/nnn.vim"
  },
  ["notational-fzf-vim"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/notational-fzf-vim"
  },
  ["nvcode-color-schemes.vim"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/nvcode-color-schemes.vim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-deus"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/nvim-deus"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspfuzzy"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/nvim-lspfuzzy"
  },
  ["nvim-spectre"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/nvim-spectre"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["one-nvim"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/one-nvim"
  },
  ["orgmode.nvim"] = {
    config = { "\27LJ\2\nù\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\21org_agenda_files\1\0\1\27org_default_notes_file\31~/Documents/org/refile.org\1\2\0\0\22~/Documents/org/*\nsetup\forgmode\frequire\0" },
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/orgmode.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  serenade = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/serenade"
  },
  ["solarized.nvim"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/solarized.nvim"
  },
  ["telescope-symbols.nvim"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/telescope-symbols.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["todoplus.vim"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/todoplus.vim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/tokyonight.nvim"
  },
  vim = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/vim"
  },
  ["vim-abolish"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/vim-abolish"
  },
  ["vim-color-spring-night"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/vim-color-spring-night"
  },
  ["vim-dadbod"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/vim-dadbod"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/vim-easy-align"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-illuminate"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/vim-illuminate"
  },
  ["vim-indent-object"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/vim-indent-object"
  },
  ["vim-lighthaus"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/vim-lighthaus"
  },
  ["vim-moonfly-colors"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/vim-moonfly-colors"
  },
  ["vim-nightfly-guicolors"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/vim-nightfly-guicolors"
  },
  ["vim-rails"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/vim-rails"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-rooter"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/vim-rooter"
  },
  ["vim-sandwich"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/vim-sandwich"
  },
  ["vim-slim"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/vim-slim"
  },
  ["vim-sneak"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/vim-sneak"
  },
  ["vim-substrata"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/vim-substrata"
  },
  ["vim-test"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/vim-test"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/vim-visual-multi"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  vimux = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/vimux"
  },
  ["zephyr-nvim"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/zephyr-nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: orgmode.nvim
time([[Config for orgmode.nvim]], true)
try_loadstring("\27LJ\2\nù\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\21org_agenda_files\1\0\1\27org_default_notes_file\31~/Documents/org/refile.org\1\2\0\0\22~/Documents/org/*\nsetup\forgmode\frequire\0", "config", "orgmode.nvim")
time([[Config for orgmode.nvim]], false)
-- Config for: neorg
time([[Config for neorg]], true)
try_loadstring("\27LJ\2\n’\1\0\0\a\0\14\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\f\0005\3\3\0004\4\0\0=\4\4\0034\4\0\0=\4\5\0035\4\t\0005\5\a\0005\6\6\0=\6\b\5=\5\n\4=\4\v\3=\3\r\2B\0\2\1K\0\1\0\tload\1\0\0\21core.norg.dirman\vconfig\1\0\0\15workspaces\1\0\0\1\0\1\17my_workspace\f~/neorg\24core.norg.concealer\18core.defaults\1\0\0\nsetup\nneorg\frequire\0", "config", "neorg")
time([[Config for neorg]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufWinEnter * ++once lua require("packer.load")({'barbar.nvim'}, { event = "BufWinEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
