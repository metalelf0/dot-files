local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

function swapNodeWithNext()
  utils = require('nvim-treesitter.ts_utils')
  currentNode = utils.get_node_at_cursor()
  nextNode = utils.get_next_node(currentNode, false, false)
  utils.swap_nodes(currentNode, nextNode, 0, true)
end

function swapNodeWithPrev()
  utils = require('nvim-treesitter.ts_utils')
  currentNode = utils.get_node_at_cursor()
  nextNode = utils.get_previous_node(currentNode, false, false)
  utils.swap_nodes(currentNode, nextNode, 0, true)
end

configs.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "" }, -- List of parsers to ignore installing
  autopairs = {
    enable = true,
  },
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "yaml" } },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  -- textobjects
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
  },
  playground = {
    enable = true
  }
}
