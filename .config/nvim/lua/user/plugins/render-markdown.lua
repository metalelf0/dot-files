return {
	"MeanderingProgrammer/render-markdown.nvim",
	enabled = true,
	dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim", "nvim-tree/nvim-web-devicons" }, -- if you use the mini.nvim suite
	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
	---@module 'render-markdown'
	---@type render.md.UserConfig
	opts = {
		checkbox = {
			enabled = true,
			unchecked = { icon = "⚪", highlight = "RenderMarkdownTodo", scope_highlight = nil },
			checked = { icon = "✅", highlight = "RenderMarkdownDone", scope_highlight = nil },
			custom = {
				doing = { raw = "[/]", rendered = "⏳", highlight = "RenderMarkdownTodo", scope_highlight = nil },
				fire = { raw = "[f]", rendered = "🔥", highlight = "RenderMarkdownTodo", scope_highlight = nil },
				note = { raw = "[n]", rendered = "📝", highlight = "RenderMarkdownTodo", scope_highlight = nil },
				win = { raw = "[w]", rendered = "🏆", highlight = "RenderMarkdownTodo", scope_highlight = nil },
				idea = { raw = "[I]", rendered = "💡", highlight = "RenderMarkdownTodo", scope_highlight = nil },
				important = {
					raw = "[!]",
					rendered = "⚠️",
					highlight = "RenderMarkdownTodo",
					scope_highlight = nil,
				},
				question = { raw = "[?]", rendered = "❓", highlight = "RenderMarkdownTodo", scope_highlight = nil },
				scheduling = { raw = "[<]", rendered = "📅", highlight = "RenderMarkdownTodo", scope_highlight = nil },
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
