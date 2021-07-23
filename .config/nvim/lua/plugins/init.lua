local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({"git", "clone", "https://github.com/wbthomason/packer.nvim", install_path})
  execute "packadd packer.nvim"
end

vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua

local packer = require("packer")

require"packer".init({
  max_jobs=50
})

packer.startup(function()
  use "wbthomason/packer.nvim"

  use "nvim-lua/popup.nvim"
  use { "nvim-lua/plenary.nvim", branch = 'async_jobs_v2' }
  use "kyazdani42/nvim-web-devicons"
  use "tpope/vim-repeat"
  use "tpope/vim-dadbod"
  use "tpope/vim-rails"
  use "tpope/vim-abolish"
  use "tpope/vim-fugitive"
  -- use { 'TimUntersberger/neogit', requires = { 'nvim-lua/plenary.nvim', 'sindrets/diffview.nvim' } }
  use "slim-template/vim-slim"
  use "michaeljsmith/vim-indent-object"
  use "rktjmp/lush.nvim"
  use "airblade/vim-rooter"
  use "mg979/vim-visual-multi"
  use "justinmk/vim-sneak"

  use "kyazdani42/nvim-tree.lua"
  use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
  use "lewis6991/gitsigns.nvim"
  use "hrsh7th/vim-vsnip"
  use "rafamadriz/friendly-snippets"
  -- lsp
  use "neovim/nvim-lspconfig"
  use "ojroques/nvim-lspfuzzy"
  use "nvim-lua/completion-nvim"
  use "folke/lsp-trouble.nvim"
  use "junegunn/fzf"
  use "alok/notational-fzf-vim"
  -- use 'junegunn/fzf.vim'
  use { "nvim-telescope/telescope.nvim", branch = "async_v2" }
  use "nvim-telescope/telescope-symbols.nvim"
  -- use { 'camspiers/snap', rocks = { 'fzy' } }
  use "hoob3rt/lualine.nvim"
  use "nvim-lua/lsp-status.nvim"
  use "b3nj5m1n/kommentary"
  use "RRethy/vim-illuminate"
  use "norcalli/nvim-colorizer.lua"
  use "junegunn/vim-easy-align" 
  use "metalelf0/todoplus.vim"
  use "machakann/vim-sandwich"
  use "janko/vim-test"
  -- use 'rcarriga/vim-ultest'
  use "benmills/vimux"
  use "lukas-reineke/indent-blankline.nvim"
  use "hrsh7th/nvim-compe"
  use "windwp/nvim-autopairs"
  use "phaazon/hop.nvim"
  use "mcchrish/nnn.vim"
  use { "glacambre/firenvim", run = function() vim.fn["firenvim#install"](0) end }
  use { "windwp/nvim-spectre" }
  -- use {'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons'}

  use {
    "romgrk/barbar.nvim",
    config = function()
      require "plugins.barbar"
    end,
    event = "BufWinEnter",
  }

  use { "kristijanhusak/orgmode.nvim", config = function()
    require("orgmode").setup{
      org_agenda_files = {'~/Documents/org/*' },
      org_default_notes_file = '~/Documents/org/refile.org',
    }
  end
  }

  use {
    "vhyrro/neorg",
    config = function()
      require('neorg').setup {
        -- Tell Neorg what modules to load
        load = {
          ["core.defaults"] = {}, -- Load all the default modules
          ["core.norg.concealer"] = {}, -- Allows for use of icons
          ["core.norg.dirman"] = { -- Manage your directories with Neorg
            config = {
              workspaces = {
                my_workspace = "~/neorg"
              }
            }
          }
        },
      }
    end,
    requires = "nvim-lua/plenary.nvim"
    }
-- colorschemes
-- use 'tjdevries/colorbuddy.nvim'

use "ChristianChiarulli/nvcode-color-schemes.vim"
use "hhff/SpacegrayEighties.vim"
use "challenger-deep-theme/vim"
use "jnurmine/Zenburn"
use "sainnhe/gruvbox-material"
use "b4skyx/serenade"
-- use 'cormacrelf/vim-colors-github'
use "projekt0n/github-nvim-theme"
use "rhysd/vim-color-spring-night"
use "cocopon/iceberg.vim"
use "ayu-theme/ayu-vim"
use "lighthaus-theme/vim-lighthaus"
use 'sainnhe/forest-night'
use "doums/darcula"
use "gruvbox-community/gruvbox"
use "metalelf0/jellybeans-nvim"
use 'glepnir/zephyr-nvim'
use "shaunsingh/moonlight.nvim"
use "marko-cerovac/material.nvim"
use { "embark-theme/vim", as="embark" }
use "folke/tokyonight.nvim"
use "shaunsingh/solarized.nvim"
use "Th3Whit3Wolf/one-nvim"
use "arzg/vim-substrata"
use "bluz71/vim-moonfly-colors"
use "bluz71/vim-nightfly-guicolors"
use "kyazdani42/blue-moon"
use 'rockerBOO/boo-colorscheme-nvim'
use "novakne/kosmikoa.nvim"
use "savq/melange"
use "theniceboy/nvim-deus"
-- use 'protesilaos/tempus-themes-vim'
-- use 'atelierbram/Base2Tone-vim'
end)

require 'plugins.nvimtree'
require 'plugins.treesitter'
require 'plugins.gitsigns'
require 'plugins.lsp'
require 'plugins.notational-fzf-vim'
-- require 'plugins.fzf'
require 'plugins.telescope'
-- require 'plugins.snap'
require 'plugins.lualine'
require 'plugins.colorizer'
require 'plugins.easyalign'
require 'plugins.vim-sandwich'
require 'plugins.vim-test'
require 'plugins.nvim-compe'
require 'plugins.fugitive'
-- require 'plugins.neogit'
require 'plugins.nnn-vim'
require 'plugins.hop-nvim'
require 'plugins.autopairs'
require 'plugins.indent-blankline'
require 'plugins.spectre'
-- require 'plugins.bufferline'

vim.api.nvim_exec(
[[
runtime macros/sandwich/keymap/surround.vim
]],
true)
