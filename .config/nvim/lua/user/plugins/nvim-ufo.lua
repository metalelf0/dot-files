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
end

return M
