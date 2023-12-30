local M = {
	"kevinhwang91/nvim-ufo",
	dependencies = { "kevinhwang91/promise-async" },
	event = "BufReadPost", -- needed for folds to load in time
	enabled = true,
}

function M.config()
	vim.o.foldcolumn = "0" -- '0' is not bad
	vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
	vim.o.foldlevelstart = -1
	vim.o.foldenable = true

	vim.keymap.set("n", "zR", require("ufo").openAllFolds)
	vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

	require("ufo").setup({
		provider_selector = function(bufnr, filetype, buftype)
			return { "lsp", "indent" }
		end,
		open_fold_hl_timeout = 0,
	})

	vim.keymap.set("n", "K", function()
		local winid = require("ufo").peekFoldedLinesUnderCursor()
		if not winid then
			-- choose one of coc.nvim and nvim lsp
			vim.lsp.buf.hover()
		end
	end)
end

return M
