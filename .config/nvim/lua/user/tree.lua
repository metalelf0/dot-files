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
		use({
			"nvim-neo-tree/neo-tree.nvim",
			branch = "v2.x",
			requires = {
				"nvim-lua/plenary.nvim",
				"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
				"MunifTanjim/nui.nvim",
				{
					-- only needed if you want to use the commands with "_with_window_picker" suffix
					"s1n7ax/nvim-window-picker",
					tag = "v1.*",
					config = function()
						require("window-picker").setup({
							autoselect_one = true,
							include_current = false,
							filter_rules = {
								-- filter using buffer options
								bo = {
									-- if the file type is one of following, the window will be ignored
									filetype = { "neo-tree", "neo-tree-popup", "notify", "quickfix" },

									-- if the buffer type is one of following, the window will be ignored
									buftype = { "terminal" },
								},
							},
							other_win_hl_color = "#e35e4f",
						})
					end,
				},
			},
		})
	elseif config.config.plugins.tree == "nvim-tree" then
		use({ "kyazdani42/nvim-tree.lua" })
	end
end

M.setupMappings = function()
	if config.config.plugins.tree == "neo-tree" then
		vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Explorer" })
	elseif config.config.plugins.tree == "nvim-tree" then
		vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Explorer" })
	end
end

return M
