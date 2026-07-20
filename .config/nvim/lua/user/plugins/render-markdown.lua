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
			unchecked = { icon = "◻️" },
			checked = { icon = "✅" },
			custom = {
				doing = { raw = "[/]", rendered = "⏳" },
				forwarded = { raw = "[>]", rendered = "➡️" },
				fire = { raw = "[f]", rendered = "🔥" },
				note = { raw = "[n]", rendered = "📝" },
				win = { raw = "[w]", rendered = "🏆" },
				idea = { raw = "[I]", rendered = "💡" },
				git = { raw = "[g]", rendered = " " },
				location = { raw = "[l]", rendered = "📍" },
				meeting = { raw = "[m]", rendered = "🎧" },
				important = { raw = "[!]", rendered = "⚠️" },
				question = { raw = "[?]", rendered = "❓" },
				scheduling = { raw = "[<]", rendered = "📅" },

				-- this has to be named "todo" rather than "canceled" to override an existing default
				todo = { raw = "[-]", rendered = "❌" },
			},
		},
		heading = {
			-- disable background on headings
			backgrounds = {
				"TabLineFill",
				"TabLineFill",
				"TabLineFill",
				"TabLineFill",
				"TabLineFill",
				"TabLineFill",
			},
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
			hyperlink = "↪ ",
			wiki = {
				icon = "↪ ",
			},
			custom = {
				notion = { pattern = "notion%.com", icon = "  " },
				notion_v2_cause_I_dont_care_patterns = { pattern = "notion%.so", icon = "  " },
			},
		},
	},
}
