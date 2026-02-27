return {
	"MeanderingProgrammer/render-markdown.nvim",
	enabled = false,
	dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
	---@module 'render-markdown'
	---@type render.md.UserConfig
	opts = {
		checkbox = {
			enabled = true,
			custom = {
				doing = { raw = "[/]", rendered = "◪", highlight = "RenderMarkdownTodo", scope_highlight = nil },
			},
		},
		heading = {
			icons = {

				"❱ ",
				"❱❱ ",
				"❱❱❱ ",
				"❱❱❱❱ ",
				"❱❱❱❱❱ ",
				"❱❱❱❱❱❱ ",
			},
		},
		link = {
			hyperlink = "󰌹 ",
			wiki = {
				icon = "󰌹 ",
			},
		},
	},
}
