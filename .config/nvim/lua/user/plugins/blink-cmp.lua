local config = require("user.config")

return {
	"saghen/blink.cmp",
	lazy = false, -- lazy loading handled internally
	-- optional: provides snippets for the snippet source
	enabled = (config.completion_engine == "blink-cmp"),
	dependencies = "rafamadriz/friendly-snippets",

	-- use a release tag to download pre-built binaries
	version = "*",
	-- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
	-- build = 'cargo build --release',

	opts = {
		snippets = { preset = "luasnip" },
		signature = { enabled = true },
		appearance = {
			use_nvim_cmp_as_default = false,
			nerd_font_variant = "normal",
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
			providers = {
				cmdline = {
					min_keyword_length = 2,
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
		cmdline = {
			enabled = false,
			completion = { menu = { auto_show = true } },
			keymap = {
				["<CR>"] = { "accept_and_enter", "fallback" },
			},
		},
		completion = {
			menu = {
				border = nil,
				scrolloff = 1,
				scrollbar = false,
				draw = {
					columns = {
						{ "kind_icon" },
						{ "label", "label_description", gap = 1 },
						{ "kind" },
						{ "source_name" },
					},
				},
			},
			documentation = {
				window = {
					border = nil,
					scrollbar = false,
					winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc",
				},
				auto_show = false,
				auto_show_delay_ms = 200,
			},
		},
	},
	opts_extend = { "sources.default" },
}
