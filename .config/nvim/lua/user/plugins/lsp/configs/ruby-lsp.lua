local M = {
	filetype = "ruby",
	root_markers = { "Gemfile", ".git" },
	init_options = {
		-- cmd = { "bundle", "exec", "ruby-lsp" },
		cmd = { "ruby-lsp" },
		addonSettings = {
			["Ruby LSP Rails"] = {
				enablePendingMigrationsPrompt = false,
			},
		},
		formatter = "auto",
		single_file_support = true,
		indexing = {
			excluded_gems = {
				"dry-monads",
				"dry-configurable",
				"dry-core",
				"dry-inflector",
				"dry-initializer",
				"dry-logic",
				"dry-schema",
				"dry-types",
				"dry-validation",
				"qonto-monadic",
			},
		},
	},
}

return M
