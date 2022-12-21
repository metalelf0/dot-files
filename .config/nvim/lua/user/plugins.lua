local fn = vim.fn
local core = require("lib/core")

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

vim.api.nvim_create_augroup("Configs", { clear = true })

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.api.nvim_create_autocmd("BufWritePost", {
	group = "Configs",
	pattern = {
		core.get_configdir() .. "/init.lua",
		core.get_configdir() .. "/lua/*.lua",
		".nvimrc.lua",
	},
	command = "source <afile> | PackerSync",
})

vim.api.nvim_create_autocmd("BufEnter", {
	group = "Configs",
	pattern = core.get_homedir() .. "/.config/kitty/kitty.conf",
	command = "setlocal filetype=bash",
})

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	-- max_jobs = 10,
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

local use = packer.use

use({
	"nvim-lualine/lualine.nvim",
	config = function()
		require("user.plugins.lualine").setup()
	end,
})

-- My plugins here
use("wbthomason/packer.nvim") -- Have packer manage itself
use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins

use({
  "windwp/nvim-autopairs",
  config = function()
    require("user.plugins.autopairs").setup()
  end,
}) -- Autopairs, integrates with both cmp and treesitter

use("numToStr/Comment.nvim") -- Easily comment stuff
use("kyazdani42/nvim-web-devicons")

require("user.tree").setupPlugin()

use({ "akinsho/bufferline.nvim", branch = "main" })
use("moll/vim-bbye")
use({ "akinsho/toggleterm.nvim", branch = "main" })
use("jakemason/project.nvim")
use("lewis6991/impatient.nvim")
use("lukas-reineke/indent-blankline.nvim")

use({
	"goolord/alpha-nvim",
	config = function()
		require("user.plugins.alpha").setup()
	end,
})

use("antoinemadec/FixCursorHold.nvim") -- This is needed to fix lsp doc highlight

vim.keymap.set("n", "<leader>lD", "<cmd>Telescope diagnostics bufnr=0<cr>", { desc = "Document diagnostics" })

use("mrjones2014/legendary.nvim")
require("user.plugins.legend").setup()

use({
  "folke/which-key.nvim",
  config = function()
    require("user.plugins.whichkey").setup()
  end
})

use({
	"stevearc/aerial.nvim",
	config = function()
		require("user.plugins.aerial").setup()
	end
})

vim.o.winbar = "%{%v:lua.require('user.winbar').winbar()%}"

--[[ use({ ]]
--[[   "folke/noice.nvim", ]]
--[[   requires = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify", "hrsh7th/nvim-cmp" }, ]]
--[[   config = function() ]]
--[[     require("user.plugins.noice").setup() ]]
--[[   end ]]
--[[ }) ]]
--[[]]

use({
	"ThePrimeagen/harpoon",
	config = function()
    require("user.plugins.harpoon").setup()
	end,
})

use 'eandrju/cellular-automaton.nvim'

-- Colorschemes
require("user.plugins.colorschemes")

-- cmp plugins
use("hrsh7th/nvim-cmp") -- The completion plugin
use("hrsh7th/cmp-buffer") -- buffer completions
use("hrsh7th/cmp-path") -- path completions
use("hrsh7th/cmp-cmdline") -- cmdline completions
use("saadparwaiz1/cmp_luasnip") -- snippet completions
use("hrsh7th/cmp-nvim-lsp")

-- snippets
use("L3MON4D3/LuaSnip") --snippet engine
use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

-- LSP
use("neovim/nvim-lspconfig") -- enable LSP
use("williamboman/mason.nvim")
use("williamboman/mason-lspconfig.nvim")
use("tamago324/nlsp-settings.nvim") -- language server settings defined in json for
use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
use("folke/trouble.nvim")

-- Telescope
use("nvim-telescope/telescope.nvim")
use("nvim-telescope/telescope-symbols.nvim")
use("nvim-telescope/telescope-file-browser.nvim")

-- Treesitter
use({
	"nvim-treesitter/nvim-treesitter",
	run = ":TSUpdate",
})
use("JoosepAlviste/nvim-ts-context-commentstring")
use("nvim-treesitter/nvim-treesitter-textobjects")
use("nvim-treesitter/playground")

-- Git
use({
	"lewis6991/gitsigns.nvim",
	config = function()
		require("user.plugins.gitsigns").setup()
	end,
})

use({ "ldelossa/gh.nvim", requires = { "ldelossa/litee.nvim" } })

use("TimUntersberger/neogit")

-- Fzf
use("junegunn/fzf")

-- Languages
use("tpope/vim-rails")
use("slim-template/vim-slim")

-- other tools
use("junegunn/vim-easy-align")

use({
	"ggandor/leap.nvim",
	config = function()
		require("user.plugins.leap").setup()
	end,
})
use("mg979/vim-visual-multi")
use("norcalli/nvim-colorizer.lua")
use("folke/todo-comments.nvim")
use("tommcdo/vim-exchange") -- cxiw - cxiw to swap two words etc.

use("stevearc/dressing.nvim")

-- org and markdown stuff
use({ "nvim-neorg/neorg" })
use({ "nvim-neorg/neorg-telescope" })

use({
	"nvim-orgmode/orgmode",
	config = function()
		require("user.plugins.orgmode").setup()
	end,
})

use("akinsho/org-bullets.nvim")

use({
	"lukas-reineke/headlines.nvim",
	config = function()
		require("headlines").setup()
	end,
})

use({
	--[[ "~/Documents/codice_elf0/obsidian.nvim", ]]
	"metalelf0/obsidian.nvim",
  branch = "feat/obsidian-yesterday",
	config = function()
		require("user.plugins.obsidian").setup()
	end,
})

use("tpope/vim-abolish")
use("tpope/vim-dadbod")
use("tpope/vim-rsi")
use("tpope/vim-fugitive")
use("tpope/vim-repeat")
use("tpope/vim-unimpaired")
use("tpope/vim-eunuch")
use("tpope/vim-endwise")

use("kylechui/nvim-surround")

use({
	"nvim-pack/nvim-spectre",
	config = function()
		require("spectre").setup()
	end,
})

use({
	"danymat/neogen",
	config = function()
		require("neogen").setup({ enabled = true })
	end,
})

use({
	"vim-test/vim-test",
	config = function()
		require("user.plugins.test").setup()
	end,
})

use({
	"rcarriga/neotest",
	requires = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"antoinemadec/FixCursorHold.nvim",
		"rcarriga/neotest-python",
		"rcarriga/neotest-plenary",
	},
})
use("rcarriga/neotest-vim-test")

use("michaeljsmith/vim-indent-object")
use("folke/zen-mode.nvim")

-- Automatically set up your configuration after cloning packer.nvim
-- Put this at the end after all plugins
if PACKER_BOOTSTRAP then
	require("packer").sync()
end
