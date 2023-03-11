local M = {}

M.signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

function M.setup()
	-- Automatically update diagnostics
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	vim.diagnostic.config({
		underline = true,
		update_in_insert = true,
		severity_sort = true,
		signs = {
			active = signs,
		},
	})

	-- vim.lsp.handlers["workspace/diagnostic/refresh"] = function(_, _, ctx)
	--   local ns = vim.lsp.diagnostic.get_namespace(ctx.client_id)
	--   vim.diagnostic.reset(ns)
	--   return vim.NIL
	-- end

	for type, icon in pairs(M.signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end
end

return M
