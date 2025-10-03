return {
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
				globals = {
					"vim",
				},
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
}
