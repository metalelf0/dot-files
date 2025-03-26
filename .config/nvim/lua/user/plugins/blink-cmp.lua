local config = require("user.config")

return {
	"saghen/blink.cmp",
	lazy = false, -- lazy loading handled internally
	-- optional: provides snippets for the snippet source
	enabled = (config.completion_engine == "blink-cmp"),
	dependencies = "rafamadriz/friendly-snippets",

	-- use a release tag to download pre-built binaries
	version = "v1.*",
	-- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
	-- build = 'cargo build --release',

	opts = {
		sources = {
			default = { "lsp", "snippets", "buffer", "path", "omni" },
			providers = {
				lsp = {
					fallbacks = {},
				},
			},
		},
		keymap = {
			preset = "default",
			["<C-j>"] = { "select_next", "fallback" },
			["<C-k>"] = { "select_prev", "fallback" },
			["<Tab>"] = {
				function(cmp)
					if cmp.snippet_active() then
						return cmp.accept()
					else
						return cmp.select_and_accept()
					end
				end,
				"snippet_forward",
				"fallback",
			},
		},
		snippets = { preset = "luasnip" },
	},
	opts_extend = { "sources.default" },
}
