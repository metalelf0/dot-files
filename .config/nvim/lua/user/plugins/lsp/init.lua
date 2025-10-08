---@diagnostic disable: missing-fields, assign-type-mismatch
local utils = require("user.utils")
local config = require("user.config")

local M = {
	"neovim/nvim-lspconfig",
	dependencies = {
		(config.completion_engine == "nvim-cmp" and "hrsh7th/cmp-nvim-lsp" or null),
		(config.completion_engine == "blink-cmp" and "saghen/blink.cmp" or null),
		{ "folke/neoconf.nvim", cmd = "Neoconf", config = true },
	},
	opts = {
		inlay_hints = { enabled = true },
	},
}

function M.config()
	require("mason")
	require("user.plugins.lsp.diagnostics").setup()

	local function on_attach(client, bufnr)
		require("user.plugins.lsp.keys").setup(client, bufnr)
	end

	---@type lspconfig.options
	local servers = {
		ansiblels = {},
		bashls = {},
		clangd = {},
		cssls = {},
		dockerls = {},
		eslint = {},
		harper_ls = require("user.plugins.lsp.configs.harper_ls"),
		html = {},
		jsonls = require("user.plugins.lsp.configs.jsonls"),
		lua_ls = require("user.plugins.lsp.configs.lua_ls"),
		pyright = {},
		-- ruby_lsp = require("lua.user.plugins.lsp.configs.ruby-lsp"),
		ruby_lsp = {},
		rust_analyzer = require("user.plugins.lsp.configs.rust_analyzer"),
		-- solargraph = require("user.plugins.lsp.configs.solargraph"),
		svelte = {},
		teal_ls = {},
		typos_lsp = {},
		vimls = {},
		yamlls = {},
	}

	local capabilities = vim.lsp.protocol.make_client_capabilities()

	if config.completion_engine == "nvim-cmp" then
		capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
	elseif config.completion_engine == "blink-cmp" then
		capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)
	end

	local options = {
		on_attach = on_attach,
		capabilities = capabilities,
		flags = {
			debounce_text_changes = 150,
		},
	}

	for server, opts in pairs(servers) do
		opts = vim.tbl_deep_extend("force", {}, options, opts or {})
		vim.lsp.config(server, opts)
		vim.lsp.enable(server)
	end

	vim.lsp.log.set_level(config.lsp.log_level)
end

return M
