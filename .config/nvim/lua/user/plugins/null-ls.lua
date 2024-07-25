local M = {
	enabled = false,
	"nvimtools/none-ls.nvim",
	event = "VeryLazy",
	dependencies = {
		"CKolkey/ts-node-action", -- remove this unless code-actions are needed
	},
}

function M.setup(options)
	local nls = require("null-ls")
	nls.setup({
		debounce = 150,
		save_after_format = false,
		sources = {
			nls.builtins.formatting.prettierd,
			nls.builtins.formatting.stylua,
			nls.builtins.formatting.fish_indent,
			nls.builtins.formatting.shfmt,
			nls.builtins.diagnostics.markdownlint,
			nls.builtins.diagnostics.selene.with({
				condition = function(utils)
					return utils.root_has_file({ "selene.toml" })
				end,
			}),
			nls.builtins.code_actions.gitsigns,
			nls.builtins.formatting.isort,
			nls.builtins.formatting.black,
			nls.builtins.code_actions.ts_node_action, -- this requires ts-node-action to be installed
		},
		on_attach = options.on_attach,
		root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", ".git"),
	})
end

function M.has_formatter(ft)
	local sources = require("null-ls.sources")
	local available = sources.get_available(ft, "NULL_LS_FORMATTING")
	return #available > 0
end

return M
