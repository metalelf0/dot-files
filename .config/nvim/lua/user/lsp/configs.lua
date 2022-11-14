local status_ok, mason = pcall(require, "mason")
if not status_ok then
	print("Error requiring mason")
	return
end

local mason_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_status_ok then
	print("Error requiring mason_lspconfig")
	return
end

mason.setup({
	ui = {
		icons = {
			server_installed = "✓",
		},
	},
})

local servers = { "jsonls", "sumneko_lua", "marksman", "solargraph", "elixirls" }

mason_lspconfig.setup({
	ensure_installed = servers,
})

local lspconfig = require('lspconfig')

for _, server in pairs(servers) do
	local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}
	local has_custom_opts, server_custom_opts = pcall(require, "user.lsp.settings." .. server)
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
	end
	lspconfig[server].setup(opts)
end
