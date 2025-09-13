local config = require("user.config")

local M = {
	"akinsho/bufferline.nvim",
	enabled = (config.bufferline_plugin == "bufferline"),
	event = "VeryLazy",
	after = "catppuccin",
	keys = {
		{ "<leader>bp", "<cmd>BufferLineTogglePin<cr>", desc = "Toggle pin" },
		{ "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
		{ "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
		{ "<leader>bh", "<cmd>BufferLineMovePrev<cr>", desc = "Move left" },
		{ "<leader>bl", "<cmd>BufferLineMoveNext<cr>", desc = "Move right" },
		{ "<leader>bk", "<cmd>BufferLinePickClose<cr>", desc = "Kill" },
		{ "<leader>bs", "<cmd>BufferLinePick<cr>", desc = "Seek" },
	},
	opts = {
		options = {
			highlights = config.colorscheme == "catppuccin"
					and require("catppuccin.groups.integrations.bufferline").get_theme()
				or nil,
			close_command = function(n)
				Snacks.bufdelete(n)
			end,
      -- stylua: ignore
      right_mouse_command = function(n) Snacks.bufdelete(n) end,
			diagnostics = "nvim_lsp",
			diagnostics_indicator = function(_, _, diag)
				local signs = config.signs
				local ret = (diag.error and signs.Error .. diag.error .. " " or "")
					.. (diag.warning and signs.Warn .. diag.warning or "")
				return vim.trim(ret)
			end,
			offsets = {
				{
					filetype = "neo-tree",
					text = "Neo-tree",
					highlight = "Directory",
					text_align = "left",
				},
				{
					filetype = "snacks_layout_box",
				},
			},
		},
	},
	config = function(_, opts)
		require("bufferline").setup(opts)
		-- Fix bufferline when restoring a session
		vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete" }, {
			callback = function()
				vim.schedule(function()
					pcall(nvim_bufferline)
				end)
			end,
		})
	end,
}

return M
