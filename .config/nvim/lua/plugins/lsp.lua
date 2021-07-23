local cmd = vim.cmd
local fn = vim.fn
local g = vim.g

-- lsp
local lsp = require 'lspconfig'
local lspfuzzy = require 'lspfuzzy'
local lspcomplete = require 'completion'
lspfuzzy.setup {}  -- Make the LSP client use FZF instead of the quickfix list


-- signs -------------------------------------------------------------------------------------------
vim.fn.sign_define(
    "LspDiagnosticsSignError",
    {texthl = "LspDiagnosticsSignError", text = "", numhl = "LspDiagnosticsSignError"}
)
vim.fn.sign_define(
    "LspDiagnosticsSignWarning",
    {texthl = "LspDiagnosticsSignWarning", text = "", numhl = "LspDiagnosticsSignWarning"}
)
vim.fn.sign_define(
    "LspDiagnosticsSignHint",
    {texthl = "LspDiagnosticsSignHint", text = "", numhl = "LspDiagnosticsSignHint"}
)
vim.fn.sign_define(
    "LspDiagnosticsSignInformation",
    {texthl = "LspDiagnosticsSignInformation", text = "", numhl = "LspDiagnosticsSignInformation"}
)
-- signs -------------------------------------------------------------------------------------------

g['completion_confirm_key'] = '<C-y>'
g['completion_enable_snippet'] = 'UltiSnips'

g.completion_chain_complete_list = {
  {
    complete_items = {"lsp", "snippet", "buffers"}
  },
  {
    mode = "<c-p>"
  },
  {
    mode = "<c-n>"
  }
}

require("trouble").setup {
  mode = "document"
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
}

-- root_dir is where the LSP server will start: here at the project root otherwise in current folder
--[[ lsp.pyls.setup {
  root_dir = lsp.util.root_pattern('.git', fn.getcwd()),
  on_attach = lspcomplete.on_attach()
} ]]

lsp.solargraph.setup {
  root_dir = lsp.util.root_pattern('.git', fn.getcwd()),
  settings = {
    solargraph  = {
      diagnostics = true,
      completion = true,
      useBundler = true,
      -- logLevel = "debug"
    }
  },
  on_attach = function(client)
    lspcomplete.on_attach()
    require 'illuminate'.on_attach(client)
  end
}

lsp.tsserver.setup {
  on_attach = function(client)
    lspcomplete.on_attach()
    require 'illuminate'.on_attach(client)
  end
}

lsp.phpactor.setup {
  on_attach = function(client)
    lspcomplete.on_attach()
    require 'illuminate'.on_attach(client)
  end
}

map('n', '<space>,', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
map('n', '<space>;', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
map('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>')
map('n', '<space>gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')
map('n', '<space>h', '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', '<space>m', '<cmd>lua vim.lsp.buf.rename()<CR>')
map('n', '<space>gr', '<cmd>lua vim.lsp.buf.references()<CR>')
map('n', '<space>s', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
map('n', '<space>P', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')

map('n', '<leader>D', ":LspTroubleToggle<CR>")
