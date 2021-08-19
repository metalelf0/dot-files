-- treesitter

-- norg treesitter config
local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()
parser_configs.norg = {
  install_info = {
    url = "https://github.com/vhyrro/tree-sitter-norg",
    files = { "src/parser.c" },
    branch = "main"
  },
}

local ts = require 'nvim-treesitter.configs'
ts.setup {
  ensure_installed = { },
  ignore_install = { 'haskell' },
  highlight = {
    enable = true
  },
  refactor = {
    highlight_definitions = { 
      enable = true
    },
    highlight_current_scope = {
      enable = true
    }
  },
  folding = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    }
  }
}

