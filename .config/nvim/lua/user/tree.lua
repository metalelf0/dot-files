local config = require("user.config")
local packer = require("packer")
local use = packer.use

local M = {}

M.requirePlugin = function()
	if config.config.plugins.tree == "neo-tree" then
		require("user.neo-tree")
	elseif config.config.plugins.tree == "nvim-tree" then
		require("user.nvim-tree")
	end
end

M.setupPlugin = function()
	if config.config.plugins.tree == "neo-tree" then
		use()
	elseif config.config.plugins.tree == "nvim-tree" then
		use({ "kyazdani42/nvim-tree.lua" })
	end
end

M.setupMappings = function()
	if config.config.plugins.tree == "neo-tree" then
	elseif config.config.plugins.tree == "nvim-tree" then
		vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Explorer" })
	end
end

return M
