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
  ["barbar.nvim"] = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19plugins.barbar\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/opt/barbar.nvim"
  },
  chadtree = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/chadtree"
  },
  ["completion-nvim"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/completion-nvim"
  },
  ["coq.artifacts"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/coq.artifacts"
  },
  coq_nvim = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/coq_nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  fzf = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/fzf"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["hop.nvim"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/hop.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  kommentary = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/kommentary"
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
  ["nightfox.nvim"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/nightfox.nvim"
  },
  ["notational-fzf-vim"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/notational-fzf-vim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
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
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
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
  ["vim-abolish"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/vim-abolish"
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
  ["which-key.nvim"] = {
    loaded = true,
    path = "/Users/metalelf0/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
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
