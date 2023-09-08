local M = {
	"rest-nvim/rest.nvim",
	event = "VeryLazy",
}

M.config = function()
	require("rest-nvim").setup()
	M.set_keymaps()
end

M.set_keymaps = function()
	local keymap = vim.keymap.set

	vim.keymap.set("n", "<Leader>Hr", "<Plug>RestNvim", { silent = true, desc = "Run request" })
	vim.keymap.set("n", "<Leader>Hp", "<Plug>RestNvimPreview", { silent = true, desc = "Preview request" })
end

return M
