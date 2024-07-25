local config = require("user.config")

local M = {}

function M.setup(client, buffer)
	if config.keymapper == "which-key" then
		setup_whichkey(client, buffer)
	end
end

function setup_whichkey(client, buffer)
	local wk = require("which-key")
	local cap = client.server_capabilities

	local keymap = {
		{ "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", desc = "Signature Help" },
		{ "<leader>xd", "<cmd>Telescope diagnostics<cr>", desc = "Search Diagnostics" },
		{ "K", "<cmd>lua vim.lsp.buf.hover()<CR>", desc = "Hover" },
		{ "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", desc = "Next Diagnostic" },
		{
			"[e",
			"<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>",
			desc = "Next Error",
		},
		{
			"[w",
			"<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.WARNING})<CR>",
			desc = "Next Warning",
		},
		{ "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", desc = "Prev Diagnostic" },
		{
			"]e",
			"<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>",
			desc = "Prev Error",
		},
		{
			"]w",
			"<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.WARNING})<CR>",
			desc = "Prev Warning",
		},
		{ "g", group = "goto" },
		{ "gD", "<cmd>Telescope lsp_declarations<CR>", desc = "Goto Declaration" },
		{ "gI", "<cmd>Telescope lsp_implementations<CR>", desc = "Goto Implementation" },
		{ "gR", "<cmd>Trouble lsp_references<cr>", desc = "Trouble References" },
		{ "gd", "<cmd>Telescope lsp_definitions<cr>", desc = "Goto Definition" },
		{ "gr", "<cmd>Telescope lsp_references<cr>", desc = "References" },
		{ "gt", "<cmd>Telescope lsp_type_definitions<cr>", desc = "Goto Type Definition" },
		{ "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action", mode = "v" },
	}

	wk.add(keymap)
end

return M
