local cmd = vim.cmd
local fn = vim.fn
local g = vim.g

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

require("trouble").setup {
  mode = "document"
}

vim.schedule(function() 
  local lsp = require "lspconfig"
  require("packer").loader("coq_nvim coq.artifacts")

  lsp.solargraph.setup(require("coq")().lsp_ensure_capabilities(
    {
      root_dir = lsp.util.root_pattern('.git', "Gemfile", fn.getcwd()),
      settings = {
        solargraph  = {
          diagnostics = true,
          completion = true,
          useBundler = true,
          -- logLevel = "debug"
        }
      },
      on_attach = function(client)
        require 'illuminate'.on_attach(client)
      end
    }
  ))

  lsp.tsserver.setup(require("coq")().lsp_ensure_capabilities(
    {
      on_attach = function(client)
        require 'illuminate'.on_attach(client)
      end
    }
  ))

  lsp.phpactor.setup(require("coq")().lsp_ensure_capabilities(
    {
      on_attach = function(client)
        require 'illuminate'.on_attach(client)
      end
    }
  ))
end)
