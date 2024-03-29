local config = require("user.config")

local M = {}

function M.setup(client, buffer)
	if config.keymapper == "which-key" then
		setup_whichkey(client, buffer)
		-- elseif config.keymapper == "mini.clue" then
		-- 	setup_miniclue(client, buffer)
	end
end

-- function setup_miniclue(client, buffer)
-- 	local cap = client.server_capabilities
-- 	local keymap = vim.keymap.set
--
-- 	keymap("n", "<leader>cr", function()
-- 		require("inc_rename")
-- 		return ":IncRename " .. vim.fn.expand("<cword>")
-- 	end, { expr = true, desc = "Rename variable" })
--
-- 	keymap("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
-- 	keymap("n", "<leader>cf", require("user.plugins.lsp.formatting").format, { desc = "Format" })
-- 	keymap("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Diagnostics" })
-- 	keymap("n", "<leader>cgd", "<cmd>Telescope lsp_definitions<cr>", { desc = "Definition" })
-- 	keymap("n", "<leader>cgr", "<cmd>Telescope lsp_references<cr>", { desc = "References" })
-- end

function setup_whichkey(client, buffer)
	local wk = require("which-key")
	local cap = client.server_capabilities

	local keymap = {
		buffer = buffer,
		["<leader>"] = {
			c = {
				name = "+code",
				{
					cond = client.name == "tsserver",
					o = { "<cmd>:TypescriptOrganizeImports<CR>", "Organize Imports" },
					R = { "<cmd>:TypescriptRenameFile<CR>", "Rename File" },
				},
				r = {
					function()
						require("inc_rename")
						return ":IncRename " .. vim.fn.expand("<cword>")
					end,
					"Rename",
					cond = cap.renameProvider,
					expr = true,
				},
				a = {
					{ vim.lsp.buf.code_action, "Code Action" },
					{ "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action", mode = "v" },
				},
				f = {
					{
						require("user.plugins.lsp.formatting").format,
						"Format Document",
						cond = cap.documentFormatting,
					},
					{
						require("user.plugins.lsp.formatting").format,
						"Format Range",
						cond = cap.documentRangeFormatting,
						mode = "v",
					},
				},
				d = { vim.diagnostic.open_float, "Line Diagnostics" },
				l = {
					name = "+lsp",
					i = { "<cmd>LspInfo<cr>", "Lsp Info" },
					a = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", "Add Folder" },
					r = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", "Remove Folder" },
					l = { "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", "List Folders" },
				},
			},
			x = {
				d = { "<cmd>Telescope diagnostics<cr>", "Search Diagnostics" },
			},
		},
		g = {
			name = "+goto",
			d = { "<cmd>Telescope lsp_definitions<cr>", "Goto Definition" },
			r = { "<cmd>Telescope lsp_references<cr>", "References" },
			R = { "<cmd>Trouble lsp_references<cr>", "Trouble References" },
			D = { "<cmd>Telescope lsp_declarations<CR>", "Goto Declaration" },
			I = { "<cmd>Telescope lsp_implementations<CR>", "Goto Implementation" },
			t = { "<cmd>Telescope lsp_type_definitions<cr>", "Goto Type Definition" },
		},
		["<C-k>"] = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help", mode = { "n" } },
		["K"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
		["[d"] = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "Next Diagnostic" },
		["]d"] = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Prev Diagnostic" },
		["[e"] = {
			"<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>",
			"Next Error",
		},
		["]e"] = {
			"<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>",
			"Prev Error",
		},
		["[w"] = {
			"<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.WARNING})<CR>",
			"Next Warning",
		},
		["]w"] = {
			"<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.WARNING})<CR>",
			"Prev Warning",
		},
	}

	wk.register(keymap)
end

return M
