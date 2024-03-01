local M = {}

M.format_with_prompt = function()
	local clients = vim.lsp.get_clients({ bufnr = bufnr })
	local formatters = {}

	for _, c in pairs(clients) do
		if c.server_capabilities.documentFormattingProvider then
			table.insert(formatters, c.name)
		end
	end

	if #formatters > 1 then
		vim.ui.select(formatters, { prompt = "Select a formatter" }, function(_, choice)
			if not choice then
				print("No formatter selected")
				return
			end

			local formatter = formatters[choice]
			vim.lsp.buf.format({ async = true, name = formatter })
		end)
	else
		vim.lsp.buf.format({ async = true, name = formatters[1] })
	end
end

return M
