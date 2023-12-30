local utils = require("user.utils")

local M = {
	"neovim/nvim-lspconfig",
	event = "BufReadPre",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "folke/neoconf.nvim", cmd = "Neoconf", config = true },
		{
			"folke/neodev.nvim",
			opts = {
				debug = true,
				experimental = {
					pathStrict = true,
				},
				library = {
					runtime = "~/projects/neovim/runtime/",
				},
			},
		},
	},
	pin = true,
	opts = {
		inlay_hints = { enabled = true },
	},
}

function M.config()
	require("mason")
	require("user.plugins.lsp.diagnostics").setup()

	local function on_attach(client, bufnr)
		require("user.plugins.lsp.formatting").setup(client, bufnr)
		require("user.plugins.lsp.keys").setup(client, bufnr)
		-- metalelf0 customization - force definitionProvider to true to work around dynamicRegistration for solargraph
		client.server_capabilities.definitionProvider = true
	end

	---@type lspconfig.options
	local servers = {
		ansiblels = {},
		bashls = {},
		clangd = {},
		cssls = {},
		dockerls = {},
		tsserver = {},
		svelte = {},
		eslint = {},
		html = {},
		elixirls = {
			cmd = { os.getenv("HOME") .. "/.local/share/nvim/mason/bin/elixir-ls" },
		},
		jsonls = {
			on_new_config = function(new_config)
				new_config.settings.json.schemas = new_config.settings.json.schemas or {}
				vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
			end,
			settings = {
				json = {
					format = {
						enable = true,
					},
					validate = { enable = true },
				},
			},
		},
		-- gopls = {},
		-- marksman = {},
		pyright = {},
		rust_analyzer = {
			settings = {
				["rust-analyzer"] = {
					cargo = { allFeatures = true },
					checkOnSave = {
						command = "clippy",
						extraArgs = { "--no-deps" },
					},
				},
			},
		},
		yamlls = {},
		lua_ls = {
			-- cmd = { "/home/folke/projects/lua-language-server/bin/lua-language-server" },
			single_file_support = true,
			settings = {
				Lua = {
					workspace = {
						checkThirdParty = false,
					},
					completion = {
						workspaceWord = true,
						callSnippet = "Both",
					},
					misc = {
						parameters = {
							"--log-level=trace",
						},
					},
					diagnostics = {
						-- enable = false,
						groupSeverity = {
							strong = "Warning",
							strict = "Warning",
						},
						groupFileStatus = {
							["ambiguity"] = "Opened",
							["await"] = "Opened",
							["codestyle"] = "None",
							["duplicate"] = "Opened",
							["global"] = "Opened",
							["luadoc"] = "Opened",
							["redefined"] = "Opened",
							["strict"] = "Opened",
							["strong"] = "Opened",
							["type-check"] = "Opened",
							["unbalanced"] = "Opened",
							["unused"] = "Opened",
						},
						unusedLocalExclude = { "_*" },
					},
					format = {
						enable = false,
						defaultConfig = {
							indent_style = "space",
							indent_size = "2",
							continuation_indent_size = "2",
						},
					},
					hint = { enable = true },
				},
			},
		},
		teal_ls = {},
		vimls = {},
		solargraph = {
			root_dir = require("lspconfig").util.root_pattern(".git", "Gemfile", vim.fn.getcwd()),
			settings = {
				solargraph = {
					hint = { enable = true },
					diagnostics = true,
					completion = true,
					useBundler = true,
				},
			},
		},
		-- sorbet = {},

		ruby_ls = {},

		-- tailwindcss = {},
	}

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
	capabilities.textDocument.foldingRange = {
		dynamicRegistration = false,
		lineFoldingOnly = true,
	}

	---@type _.lspconfig.options
	local options = {
		on_attach = on_attach,
		capabilities = capabilities,
		flags = {
			debounce_text_changes = 150,
		},
	}

	for server, opts in pairs(servers) do
		opts = vim.tbl_deep_extend("force", {}, options, opts or {})
		require("lspconfig")[server].setup(opts)
	end

	require("user.plugins.null-ls").setup(options)
end

return M
