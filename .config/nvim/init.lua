---@diagnostic disable: undefined-global
vim.loader.enable()

require("user.options")
require("user.keymaps")
require("user.lazy")
require("user.utils")
require("user.colorscheme_utils")
require("user.neovide")
require("user.autocommands")
require("user.digraphs")
require("user.fvim")
require("user.fun")
require("user.git")

vim.cmd([[ packadd cfilter ]])

local function create_missing_dirs()
	local dir = vim.fn.expand("<afile>:p:h")
	if vim.tbl_contains({ "oil" }, dir) then
		return
	end
	if vim.fn.isdirectory(dir) == 0 then
		vim.fn.mkdir(dir, "p")
	end
end

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = create_missing_dirs,
})

local config = require("user.config")

if config.keymapper == "which-key" then
	local which_key = require("which-key")
	local mappings = {
		{ "<leader>P", group = "Packer / Projects", nowait = true, remap = false },
		{ "<leader>b", group = "Buffers", nowait = true, remap = false },
		{ "<leader>bc", group = "Close", nowait = true, remap = false },
		{ "<leader>c", group = "Cursors", nowait = true, remap = false },
		{ "<leader>g", group = "Git", nowait = true, remap = false },
		{ "<leader>h", group = "Helpers", nowait = true, remap = false },
		{ "<leader>i", group = "Insert", nowait = true, remap = false },
		{ "<leader>j", group = "Test / join", nowait = true, remap = false },
		{ "<leader>l", group = "LSP", nowait = true, remap = false },
		{ "<leader>o", group = "Obsidian", nowait = true, remap = false },
		{ "<leader>r", group = "Refactorings", nowait = true, remap = false },
		{ "<leader>s", group = "Search", nowait = true, remap = false },
		{ "<leader>t", group = "Terminal", nowait = true, remap = false },
		{ "<leader>u", group = "UI", nowait = true, remap = false },
		{ "<leader>uc", group = "Colors", nowait = true, remap = false },
		{ "<leader>ud", group = "Diagnostics", nowait = true, remap = false },
	}
	which_key.add(mappings)
end
