local config = require("user.config")

return {
	"saghen/blink.cmp",
	lazy = false, -- lazy loading handled internally
	-- optional: provides snippets for the snippet source
	enabled = (config.completion_engine == "blink-cmp"),
	dependencies = "rafamadriz/friendly-snippets",

	-- use a release tag to download pre-built binaries
	version = "v0.*",
	-- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
	-- build = 'cargo build --release',

	opts = {
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
	},
	opts_extend = { "sources.default" },
}
