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
  -- "kyazdani42/nvim-tree.lua",
  "ms-jpq/chadtree",
  "lewis6991/gitsigns.nvim",
  "hrsh7th/vim-vsnip",
  "rafamadriz/friendly-snippets",
  "neovim/nvim-lspconfig",
  "ojroques/nvim-lspfuzzy",
  "nvim-lua/completion-nvim",
  "folke/lsp-trouble.nvim",
  "junegunn/fzf",
  "alok/notational-fzf-vim",
  "nvim-telescope/telescope.nvim" ,
  "nvim-telescope/telescope-symbols.nvim",
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
  -- "hrsh7th/nvim-compe",
  { 'ms-jpq/coq_nvim', branch = 'coq'},           -- main one
  { 'ms-jpq/coq.artifacts', branch= 'artifacts'}, -- 9000+ Snippets
  "windwp/nvim-autopairs",
  "phaazon/hop.nvim",
  { "windwp/nvim-spectre" },
  'folke/which-key.nvim',
  {
    "romgrk/barbar.nvim",
    config = function()
      require "plugins.barbar"
    end,
    event = "BufWinEnter",
  },
  'EdenEast/nightfox.nvim',
}

packer.startup(function()
  for index,plugin in ipairs(pluginList) do
    use(plugin)
  end
end)

require('nightfox').set()

for index, plugin in ipairs(pluginList) do
  utils.loadPluginConfig(plugin)
end

vim.api.nvim_exec(
[[
runtime macros/sandwich/keymap/surround.vim
]],
true)
