return {
  "numToStr/Comment.nvim",
  "kyazdani42/nvim-web-devicons",
  "akinsho/bufferline.nvim",
  "moll/vim-bbye",
  "nvim-lua/popup.nvim",
  "nvim-lua/plenary.nvim",
  "jakemason/project.nvim",
  "lukas-reineke/indent-blankline.nvim",
  "antoinemadec/FixCursorHold.nvim",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "saadparwaiz1/cmp_luasnip",
  "hrsh7th/cmp-nvim-lsp",
  "L3MON4D3/LuaSnip",
  "rafamadriz/friendly-snippets",
  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "tamago324/nlsp-settings.nvim",
  "jose-elias-alvarez/null-ls.nvim",
  "folke/trouble.nvim",
  "nvim-telescope/telescope.nvim",
  "nvim-telescope/telescope-symbols.nvim",
  "nvim-telescope/telescope-file-browser.nvim",
  "JoosepAlviste/nvim-ts-context-commentstring",
  "nvim-treesitter/nvim-treesitter-textobjects",
  "nvim-treesitter/playground",
  "TimUntersberger/neogit",
  "junegunn/fzf",
  "tpope/vim-rails",
  "slim-template/vim-slim",
  "junegunn/vim-easy-align",
  "mg979/vim-visual-multi",
  "norcalli/nvim-colorizer.lua",
  "folke/todo-comments.nvim",
  "tommcdo/vim-exchange",
  "stevearc/dressing.nvim",
  "nvim-neorg/neorg",
  "nvim-neorg/neorg-telescope",
  "akinsho/org-bullets.nvim",
  "tpope/vim-abolish",
  "tpope/vim-dadbod",
  "tpope/vim-rsi",
  "tpope/vim-fugitive",
  "tpope/vim-repeat",
  "tpope/vim-unimpaired",
  "tpope/vim-eunuch",
  "tpope/vim-endwise",
  "kylechui/nvim-surround",
  "nvim-neo-tree/neo-tree.nvim",

  -- colorschemes

  "EdenEast/nightfox.nvim",
  "Mofiqul/dracula.nvim",
  "NTBBloodbath/doom-one.nvim",
  "TheNiteCoder/mountaineer.vim",
  "bluz71/vim-moonfly-colors",
  "bluz71/vim-nightfly-guicolors",
  "cocopon/iceberg.vim",
  "folke/tokyonight.nvim",
  "glepnir/zephyr-nvim",
  "marko-cerovac/material.nvim",
  "projekt0n/github-nvim-theme",
  "rebelot/kanagawa.nvim",
  "rmehri01/onenord.nvim",
  "sainnhe/gruvbox-material",
  'ellisonleao/gruvbox.nvim',
  "sam4llis/nvim-tundra",
  "catppuccin/nvim", name = "catppuccin",
  { "mcchrish/zenbones.nvim", dependencies = { "rktjmp/lush.nvim" } },
  { "meliora-theme/neovim", dependencies = { "rktjmp/lush.nvim" }, name = "meliora" },
  { "rose-pine/neovim", name = "rose-pine" },
  "Yazeed1s/oh-lucy.nvim",
  "igorepst/hemisu.nvim",
  "metalelf0/jellybeans-nvim",
  "sainnhe/everforest",
  "nyoom-engineering/oxocarbon.nvim",
  "shaunsingh/moonlight.nvim",
  "shatur/neovim-ayu",

-- end colorschemes

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      {
        -- only needed if you want to use the commands with "_with_window_picker" suffix
        "s1n7ax/nvim-window-picker",
        config = function()
          require("window-picker").setup({
            autoselect_one = true,
            include_current = false,
            filter_rules = {
              -- filter using buffer options
              bo = {
                -- if the file type is one of following, the window will be ignored
                filetype = { "neo-tree", "neo-tree-popup", "notify", "quickfix" },

                -- if the buffer type is one of following, the window will be ignored
                buftype = { "terminal" },
              },
            },
            other_win_hl_color = "#e35e4f",
          })
        end,
      },
    },
  },
  {
    "nvim-orgmode/orgmode",
    config = function()
      require("user.plugin-confs.orgmode").setup()
    end,
  },
  {
    "lukas-reineke/headlines.nvim",
    config = function()
      require("headlines").setup()
    end,
  },
  {
    "metalelf0/obsidian.nvim",
    branch = "feat/obsidian-yesterday",
    config = function()
      require("user.plugin-confs.obsidian").setup()
    end,
  },
  {
    "nvim-pack/nvim-spectre",
    config = function()
      require("spectre").setup()
    end,
  },
  {
    "danymat/neogen",
    config = function()
      require("neogen").setup({ enabled = true })
    end,
  },
  {
    "vim-test/vim-test",
    config = function()
      require("user.plugin-confs.test").setup()
    end,
  },
  {
    "rcarriga/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "rcarriga/neotest-python",
      "rcarriga/neotest-plenary",
    },
  },
  "rcarriga/neotest-vim-test",
  "michaeljsmith/vim-indent-object",
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    config = function()
      require("zen-mode").setup({
        plugins = {
          gitsigns = true,
        },
      })
    end,

  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("user.plugin-confs.lualine").setup()
    end,
  },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("user.plugin-confs.autopairs").setup()
    end,
  },
  {
    "goolord/alpha-nvim",
    config = function()
      require("user.plugin-confs.alpha").setup()
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    branch = "main"
  },
  {
    "folke/which-key.nvim",
    config = function()
      require("user.plugin-confs.whichkey").setup()
    end
  },
  {
    "stevearc/aerial.nvim",
    config = function()
      require("user.plugin-confs.aerial").setup()
    end
  },
  {
    "ThePrimeagen/harpoon",
    config = function()
      require("user.plugin-confs.harpoon").setup()
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("user.plugin-confs.gitsigns").setup()
    end,
  },
  { "ldelossa/gh.nvim", dependencies = { "ldelossa/litee.nvim" } },
  {
    'eandrju/cellular-automaton.nvim',
    cmd = { 'CellularAutomaton' }
  },
}

--[[ require("user.plugin-confs.legend").setup() ]]
