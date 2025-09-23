---@diagnostic disable: inject-field
local format_config = require("user.plugins.lsp.formatting")

local M = {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			-- Customize or remove this keymap to your liking
			"<leader>ff",
			function()
				require("conform").format({ async = true })
			end,
			mode = "",
			desc = "Format buffer with conform",
		},
	},
}

M.opts = {
	formatters = {
		rubocop = {
			args = { "--server", "--autocorrect-all", "--stderr", "--force-exclusion", "--stdin", "$FILENAME" },
		},
	},
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		javascript = { "prettierd", "prettier", stop_after_first = true },
		json = { "prettierd", "prettier", stop_after_first = true },
		eruby = { "erb_format" },
		html = { "prettierd", "prettier", stop_after_first = true },
		xml = { "xmlformatter" },
		ruby = { "rubocop" },
	},
	default_format_opts = {
		lsp_format = "fallback",
	},
	format_on_save = function(bufnr)
		-- Disable with a global or buffer-local variable
		if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
			return
		end
		return { timeout_ms = 2000, lsp_format = "fallback" }
	end,
}

M.init = function()
	format_config.setup()
	-- If you want the formatexpr, here is the place to set it
	vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
end

return M
