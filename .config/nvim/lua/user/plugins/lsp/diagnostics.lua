local M = {}

M.signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

function M.setup()
	-- Automatically update diagnostics
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	-- for _, sign in ipairs(signs) do
	-- 	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	-- end

	vim.diagnostic.config({
		underline = true,
		update_in_insert = true,
		severity_sort = true,
		virtual_lines = false,
		signs = {
			active = signs,
		},
	})

	for type, icon in pairs(M.signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end

	local function disable_virtual_lines()
		vim.diagnostic.config({
			virtual_lines = false,
		})
	end

	vim.api.nvim_create_autocmd("LspAttach", {
		pattern = "*",
		callback = disable_virtual_lines,
	})
end

return M
