local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({"git", "clone", "https://github.com/wbthomason/packer.nvim", install_path})
  execute "packadd packer.nvim"
end

vim.cmd ""
local packer = require("packer")
local utils = require("utils")

require"packer".init({
  max_jobs=50
})

local pluginList = {
  "nvim-lua/popup.nvim",
  "nvim-lua/plenary.nvim",
  {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"},
  "wbthomason/packer.nvim",
  "kyazdani42/nvim-web-devicons",
  "tpope/vim-repeat",
  "tpope/vim-dadbod",
  "tpope/vim-rails",
  "tpope/vim-abolish",
  "tpope/vim-fugitive",
  "slim-template/vim-slim",
  "michaeljsmith/vim-indent-object",
  "rktjmp/lush.nvim",
  "airblade/vim-rooter",
  "mg979/vim-visual-multi",
  "justinmk/vim-sneak",
  "ms-jpq/chadtree",
  "lewis6991/gitsigns.nvim",
  "neovim/nvim-lspconfig",
  "ojroques/nvim-lspfuzzy",
  "nvim-lua/completion-nvim",
  "folke/lsp-trouble.nvim",
  "junegunn/fzf",
  "alok/notational-fzf-vim",
  "nvim-telescope/telescope.nvim" ,
  "nvim-telescope/telescope-symbols.nvim",
  "nvim-telescope/telescope-project.nvim",
  "hoob3rt/lualine.nvim",
  "nvim-lua/lsp-status.nvim",
  "b3nj5m1n/kommentary",
  "RRethy/vim-illuminate",
  "norcalli/nvim-colorizer.lua",
  "junegunn/vim-easy-align" ,
  "metalelf0/todoplus.vim",
  "machakann/vim-sandwich",
  "janko/vim-test",
  "benmills/vimux",
  "lukas-reineke/indent-blankline.nvim",
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-nvim-lua',
  'hrsh7th/cmp-nvim-lsp',
  'saadparwaiz1/cmp_luasnip',
  'L3MON4D3/LuaSnip',
  "windwp/nvim-autopairs",
  "phaazon/hop.nvim",
  "romgrk/fzy-lua-native",
  "gelguy/wilder.nvim",
  { "windwp/nvim-spectre" },
  'folke/which-key.nvim',
  {
    "romgrk/barbar.nvim",
    config = function()
      require "plugins.barbar"
    end,
    event = "BufWinEnter",
  },
  "akinsho/nvim-toggleterm.lua",
  'EdenEast/nightfox.nvim',
  "Pocco81/Catppuccino.nvim",
  { 'rcarriga/vim-ultest', requires = {"vim-test/vim-test"}, run = ":UpdateRemotePlugins" }
}

packer.startup(function()
  for index,plugin in ipairs(pluginList) do
    use(plugin)
  end
end)

require('nightfox').load()

for index, plugin in ipairs(pluginList) do
  utils.loadPluginConfig(plugin)
end

vim.api.nvim_exec(
[[
runtime macros/sandwich/keymap/surround.vim
]],
true)
