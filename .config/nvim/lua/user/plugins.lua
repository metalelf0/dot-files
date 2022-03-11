local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "numToStr/Comment.nvim" -- Easily comment stuff
  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"
  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye"
  use "nvim-lualine/lualine.nvim"
  use "akinsho/toggleterm.nvim"
  use "ahmedkhalf/project.nvim"
  use "lewis6991/impatient.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use "goolord/alpha-nvim"
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
  use "folke/which-key.nvim"

  -- Colorschemes
  use "folke/tokyonight.nvim"
  use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  use "lunarvim/darkplus.nvim"
  use "mcchrish/zenbones.nvim"
  use "rktjmp/lush.nvim"
  use "shaunsingh/moonlight.nvim"
  use 'EdenEast/nightfox.nvim'
  use 'Th3Whit3Wolf/onebuddy'
  use 'Th3Whit3Wolf/space-nvim'
  use 'ThemerCorp/themer.lua'
  use 'bluz71/vim-moonfly-colors'
  use 'bluz71/vim-nightfly-guicolors'
  -- use 'doums/darcula'
  -- use 'glepnir/zephyr-nvim'
  use 'projekt0n/github-nvim-theme'
  use 'rebelot/kanagawa.nvim'
  use 'tjdevries/colorbuddy.vim'
  use { "catppuccin/nvim", as = "catppuccin" }
  use "NTBBloodbath/doombox.nvim"
  use "NTBBloodbath/doom-one.nvim"
  use "Mofiqul/vscode.nvim"
  use 'ChristianChiarulli/nvcode-color-schemes.vim'
  use 'rmehri01/onenord.nvim'
  use 'sainnhe/gruvbox-material'
  use 'marko-cerovac/material.nvim'

  use { "rose-pine/neovim", as = "rose-pine" }

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-symbols.nvim"
  use "nvim-telescope/telescope-file-browser.nvim"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use "nvim-treesitter/nvim-treesitter-textobjects"
  use 'nvim-treesitter/playground'

  -- Git
  use "lewis6991/gitsigns.nvim"

  -- Fzf
  use "junegunn/fzf"
  use "alok/notational-fzf-vim"

  -- Languages
  use "tpope/vim-rails"
  use "slim-template/vim-slim"

  -- other tools
  use "junegunn/vim-easy-align"
  use "Mephistophiles/surround.nvim"
  -- TODO: configure it!
  use "phaazon/hop.nvim"
  use "mg979/vim-visual-multi"
  use "norcalli/nvim-colorizer.lua"
  use "folke/todo-comments.nvim"
  use { "nvim-neorg/neorg" }
  use { "nvim-neorg/neorg-telescope" }
  use { "tpope/vim-abolish" }
  use "tpope/vim-dadbod"
  use "tpope/vim-rsi"
  use "tpope/vim-fugitive"
  use "stefandtw/quickfix-reflector.vim"
  use "rktjmp/shipwright.nvim"
  use {'cenk1cenk2/nvim-spectre', config = function() require("spectre").setup() end }
  use {'danymat/neogen', config = function() require('neogen').setup { enabled = true } end }
  use {'vim-test/vim-test'}
  use 'michaeljsmith/vim-indent-object'


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
