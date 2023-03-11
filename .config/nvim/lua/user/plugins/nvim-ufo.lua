local M = {
	"kevinhwang91/nvim-ufo",
	dependencies = { "kevinhwang91/promise-async" },
}

function M.config()
	vim.o.foldcolumn = "1" -- '0' is not bad
	vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
	vim.o.foldlevelstart = 99
	vim.o.foldenable = true

	require("ufo").setup()

	vim.keymap.set("n", "K", function()
		local winid = require("ufo").peekFoldedLinesUnderCursor()
		if not winid then
			-- choose one of coc.nvim and nvim lsp
			vim.lsp.buf.hover()
		end
	end)
end

return M
