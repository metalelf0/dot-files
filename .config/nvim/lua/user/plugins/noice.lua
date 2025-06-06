local M = {
	"folke/noice.nvim",
	event = "VeryLazy",
	enabled = true,
}

M.config = function()
	require("noice").setup({
		routes = {
			{
				filter = { event = "msg_show", find = "not a git repository" },
				opts = { skip = true },
			},
			{
				filter = { event = "msg_show", find = "is outside repository at" },
				opts = { skip = true },
			},
		},
		lsp = {
			-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
			message = {
				view = "mini",
			},
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
		-- messages = {
		-- 	view = "mini",
		-- 	view_search = false,
		-- },
		cmdline = {
			view = "cmdline",
		},
		-- you can enable a preset for easier configuration
		presets = {
			bottom_search = true, -- use a classic bottom cmdline for search
			command_palette = true, -- position the cmdline and popupmenu together
			long_message_to_split = true, -- long messages will be sent to a split
			inc_rename = false, -- enables an input dialog for inc-rename.nvim
			lsp_doc_border = false, -- add a border to hover docs and signature help
		},
	})
end

return M
